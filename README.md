# MLIR out-of-tree sign analysis

A sign analysis for the MLIR LLVM dialect, built as a loadable `mlir-opt`
plugin. No LLVM source tree is required and nothing upstream is patched.

The analysis decides, for every integer SSA value in a module, which of eight
abstract signs it must have. It is run here over the whole SQLite 3.53.4
amalgamation.

## The abstract domain

`SignDomain.h` defines an eight-element lattice:

```
bottom  <  one  <  positive  <  nonnegative  <  top
bottom  <  zero             <  nonnegative  <  top
bottom  <  zero             <  nonpositive  <  top
bottom  <  negative         <  nonpositive  <  top
```

## Building

Build using CMake:

```sh
cmake -S . -B build
cmake --build build
```

That derivation works for a hand-built LLVM and for distribution packages
(`libmlir-dev` alongside `llvm-dev` on Debian and Ubuntu). It does *not* work
on nixpkgs, where MLIR's CMake files live in a separate output that
`llvm-config` knows nothing about — which is why the flake sets `MLIR_DIR`
explicitly. Point at a specific MLIR the same way:

```sh
cmake -S . -B build -DMLIR_DIR=/path/to/prefix/lib/cmake/mlir
```

You need an LLVM built with MLIR and with plugins enabled
(`-DLLVM_ENABLE_PROJECTS=mlir -DLLVM_ENABLE_PLUGINS=ON`; both are ordinary on
Linux and macOS). The configure step diagnoses the cases it can detect — no
MLIR found, plugins disabled in the host LLVM, or an `mlir-opt` on `PATH` whose
version does not match what the plugin is being built against.

## Generating the test input

The analysis consumes the MLIR LLVM dialect, so the C has to be lowered first.
The input used throughout this README is the SQLite amalgamation. Download
`sqlite-amalgamation-3530400.zip` from <https://sqlite.org/download.html> and
unzip it in the repository root, then:

```sh
clang -S -emit-llvm -O2 -o - sqlite-amalgamation-3530400/sqlite3.c |
  mlir-translate --import-llvm -o test/sqlite3.mlir
```

This analysis makes no assumption about integer overflow.

## Running

```sh
./run.sh test/sqlite3.mlir
```

`run.sh` locates the plugin whatever it is called on your platform and puts the
annotated listing on stdout. Over the full amalgamation it takes about six
seconds. Or invoke `mlir-opt` yourself:

```sh
mlir-opt --load-pass-plugin=build/SignAnalysis.so \
         --pass-pipeline='builtin.module(zero-analysis)' \
         test/sqlite3.mlir -o /dev/null
```

using `build/SignAnalysis.dylib` on macOS.

The pass leaves the IR unchanged and writes it to stdout as usual; the
annotated view goes to stderr, so the two streams can be redirected
independently. Annotations are comments, so the annotated listing is still
valid MLIR. Values at top or bottom are left unannotated, so that what prints
is exactly what was proved.

## What the analysis finds in SQLite

Over the 337,211-line listing:

| | count |
|---|---|
| annotated operation results | 34,113 |
| — of which are `llvm.mlir.constant` | 33,939 |
| — **derived** from a transfer rule | **174** |
| annotated block arguments (facts surviving a join) | 721 |

Broken down by sign, the operation results are 24,828 `positive`, 3,615
`zero`, 3,051 `negative`, 2,618 `one`, and one `nonnegative`; the block
arguments are 503 `nonnegative`, 210 `positive`, 5 `negative` and 3
`nonpositive`.

## A worked example

Here is a derived fact that no single rule produces. It is in
`@sqlite3Atoi64`, SQLite's string-to-`i64` parser, which handles both UTF-8 and
UTF-16 input by stepping through the string with a stride variable:

```c
int incr;
if( enc==SQLITE_UTF8 ){ incr = 1; } else { incr = 2; ... }
...
for(i=0; &zNum[i]<zEnd && (c=(unsigned)zNum[i]-'0')<=9; i+=incr){ u = u*10 + c; }
...
if( i<19*incr ){ ... }
```

After `-O2` and the import, `incr` is the block argument `%42`, the loop
counter `i` is the block argument `%73`, and the annotated listing reads:

```mlir
    %1  = llvm.mlir.constant(1 : i32) : i32          // %1 is one
    %6  = llvm.mlir.constant(2 : i32) : i32          // %6 is positive
    %10 = llvm.mlir.constant(0 : i32) : i32          // %10 is zero
    %18 = llvm.mlir.constant(19 : i32) : i32         // %18 is positive
    ...
    llvm.cond_br %25, ^bb5(%1, ...), ^bb1            // enc == SQLITE_UTF8: incr = 1
    ...
    llvm.br ^bb5(%6, ...)                            // otherwise:          incr = 2

  ^bb5(%42: i32, ...):          // 2 preds: ^bb0, ^bb4
    // argument: %42 is positive
    ...
    llvm.cond_br %71, ^bb17(%70, %10, %11 : ...), ^bb21(...)   // i = 0 on entry

  ^bb17(%72: !llvm.ptr, %73: i32, %74: i64):   // 2 preds: ^bb16, ^bb18
    // argument: %73 is nonnegative
    ...
  ^bb18:
    %82 = llvm.add %73, %42 : i32                    // %82 is positive
    ...
    llvm.cond_br %85, ^bb17(%84, %82, %81 : ...), ^bb19(...)   // back edge: i = %82
    ...
    %117 = llvm.mul %42, %18 overflow<nsw, nuw> : i32  // %117 is positive
```

`%82 is positive` — the parser's digit index strictly increases — takes four
distinct pieces of machinery to get:

1. **The constant rule** gives `%1 → one`, `%6 → positive`, `%10 → zero`.
2. **A join at `^bb5`.** `%42` is `one` on the UTF-8 edge and `positive` on the
   UTF-16 edge. The lattice puts `one` under `positive`, so `join(one,
   positive)` is `positive`, not `top`. Had `one` not been a separate element
   the two edges would have agreed trivially; had it not been *ordered under*
   `positive`, they would have disagreed and the fact would have been lost.
3. **A fixed point around the back edge.** `%73` enters `^bb17` as `%10`
   (`zero`) from `^bb16` and as `%82` from `^bb18`. On the solver's first visit
   `%73` is `zero`, so `%82 = add(zero, positive)` is `positive` by the `x + 0`
   rule. That reraises `%73` to `join(zero, positive) = nonnegative`, which
   requeues `^bb18`.
4. **The `nonnegative + positive` rule for `llvm.add`.** On the second visit
   `%82 = add(nonnegative, positive)` is still `positive`, so `%73` stays
   `nonnegative` and the solver has converged. Note that the weaker, obvious
   rule — `nonnegative + nonnegative = nonnegative` — would have left `%82` only
   `nonnegative` and lost the strictness.

Neither `%42` nor `%73` is a constant, neither is an operation result, and the
fact about `%82` is the fixed point of a cycle rather than the output of any
one rule. The companion `%117 = 19 * incr` is `positive` off the same `%42` by
the much simpler `positive * positive` rule, and is the only kind of `llvm.mul`
fact the analysis finds in SQLite.

### The caveat on this example

`%82 = llvm.add %73, %42 : i32` carries **no** `overflow<nsw>` flag, and the
transfer function never consults overflow flags. On a wrapping `i32` add,
`nonnegative + positive` can be negative, so `%82 is positive` is sound only
under the assumption that this add does not overflow. That assumption is
justified here — `i` is bounded by the string length — but the analysis is not
the thing justifying it.

Making the add and multiply rules require `nsw` is the one change that would
make every arithmetic fact in the output unconditionally sound. It would also
cost some of them: the companion `%117` is marked `overflow<nsw, nuw>` and
would survive, but `%82` would not.

## Tests

```sh
ctest --test-dir build --output-on-failure
```

`test/sign.mlir` exercises every transfer rule on a few dozen lines.
`test/sign.expected` lists facts that must appear in the output, and — with a
leading `!` — facts that must not. The negative checks are the ones that
matter: an unsound transfer function still produces plausible-looking output,
and only a test that pins down what the analysis must *not* claim will catch
it.

MLIR's printer renumbers SSA values, so the checks are written against
operation text rather than the names in `sign.mlir`. After adding or reordering
operations, regenerate with `./run.sh test/sign.mlir`.

## What is where

Two files hold the analysis; the rest is reusable scaffolding.

| File | |
|---|---|
| `SignDomain.h` | The abstract domain: the eight lattice elements and their join. |
| `SignAnalysis.cpp` | The transfer functions for constants, `add`, `sub`, `mul` and `sdiv`. |
| `SignAnalysis.h` | Ties the domain to MLIR's sparse forward analysis. |
| `Annotate.{h,cpp}` | Prints IR with a comment on each value. Domain-agnostic. |
| `Plugin.cpp` | The pass, the solver setup, and the `mlir-opt` entry point. |
| `cmake/RunTest.cmake` | The test runner. |
| `ZeroDomain.h`, `ZeroAnalysis.{h,cpp}` | The two-element zero analysis this grew out of. Still builds, no longer loaded. |

`Annotate.cpp` is still in namespace `zero`; it does not depend on either
domain.

## How the analysis works

`Plugin.cpp` loads three analyses into one solver. `DeadCodeAnalysis` supplies
reachability — without it the solver must assume every branch is taken — and
`SparseConstantPropagation` resolves branch conditions on its behalf. These are
prerequisites for a precise result, not optional extras. `SignAnalysis` then
propagates signs through operations and block arguments until the solver
reaches a fixed point, which is when the pass queries it.

The transfer function in `SignAnalysis.cpp` has one rule per operation:

- **Constants** take their sign from their value, splitting out `zero` and
  `one`. This is the only rule that does not consult its operands, and without
  some rule of this kind there would be no facts to propagate at all.
- **`llvm.add`** handles `x + 0`, two operands that already share a sign
  (strengthening `one + one` to `positive`), and the two strictness-preserving
  cases, `nonnegative + positive` and `nonpositive + negative`.
- **`llvm.sub`** handles `x - x` as `zero` *syntactically* — the two operands
  being the same SSA value is enough, even when nothing is known about it —
  plus `x - 0`, `0 - x`, and a case analysis on the remaining pairs.
- **`llvm.mul`** annihilates on a `zero` operand even when the other is
  unknown, gives `x * x` as `nonnegative` (not `positive`: `x` may be zero),
  and otherwise multiplies signs, keeping strictness only when both operands
  are strict.
- **`llvm.sdiv`** gives `x / x` as `one`, `0 / y` as `zero`, `x / 1` as `x`,
  and otherwise only the sign of the quotient — never strictness, since
  truncation toward zero can turn a nonzero quotient into zero.

Everything else is unknown. That is always sound, just imprecise. Raising a
result to top is what every unhandled case does, including every non-integer
and multi-result operation, every `llvm.load`, and every call.

Values reaching the analysis from outside — function arguments, and results of
any operation without a rule — start at top. The analysis is intraprocedural:
`Plugin.cpp` sets `config.setInterprocedural(false)`, so nothing crosses a call
boundary in either direction.

## Natural extensions

In rough order of how much they would change the SQLite numbers above:

- **Require `nsw`/`nuw` on `add` and `mul`.** Removes the soundness caveat.
- **A rule for `llvm.zext`** — unsigned extension is always `nonnegative`. The
  listing carries 1,470 `llvm.zext nneg` operations, and each one would seed a
  fact into code that currently has none.
- **Refining on branch conditions.** `llvm.icmp "sgt" %x, %zero` proves `%x`
  positive on the taken edge, and SQLite tests values against zero constantly.
  This needs the dense/conditional machinery rather than another `if`.
- **Rules for `llvm.and`, `llvm.or` and `llvm.shl`**, which have none at all.
- **Interprocedural propagation**, which is a config flag away but changes what
  "entry state" means.

## Notes on portability

Most of the platform-specific knowledge lives in `CMakeLists.txt`, next to the
code it affects. The parts worth knowing about:

**The plugin's file name differs.** It is `SignAnalysis.dylib` on macOS and
`SignAnalysis.so` on Linux and WSL2. Nothing in this project spells that out:
CMake is asked via `$<TARGET_FILE:SignAnalysis>`, and `run.sh` probes for both.

**Linking a plugin on macOS needs special flags.** The plugin deliberately
leaves its MLIR symbols undefined, to be resolved from the `mlir-opt` process
that loads it. On macOS that requires `-undefined dynamic_lookup`, which
`include(HandleLLVMOptions)` supplies. The same include also matches LLVM's
RTTI and exception settings, which differ between distribution packages and
local builds and cause link errors or silent ODR violations when they are
wrong. That is also why `project()` enables C: `HandleLLVMOptions` probes flags
with the C compiler and fails if none is configured.

**A plugin only loads into the LLVM it was built against.** The version is
recorded at compile time and checked at load time, so a mismatch is a clear
error rather than a crash. The configure step warns about it earlier still, by
comparing against the `mlir-opt` it finds.

**The test suite needs no shell.** `cmake/RunTest.cmake` is a CMake script
rather than a shell script, so `ctest` depends on nothing the build did not
already require.

**Under WSL2, build on the Linux filesystem.** A tree under `/mnt/c` is slow
enough to be noticeable and does not reliably carry execute bits. Note that
there is no `.gitattributes` here, so a clone made by a Windows git may give
`run.sh` CRLF endings; `cmake/RunTest.cmake` strips a trailing CR from the
expectations file for the same reason.

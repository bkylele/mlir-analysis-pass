# MLIR sign analysis

## Build and run

Build the plugin (with an LLVM/MLIR 23 installation that has plugins
enabled):

```sh
cmake -S . -B build
cmake --build build
```

Run:

```sh
./run.sh test/sign.mlir
```

Use `SignAnalysis.dylib` on macOS. `run.sh` prints the annotated listing to stdout.

## Check analysis facts at runtime

The existing `zero-analysis` pass runs the sign analysis (the command name is
historical). Its default behavior still only annotates. Enable transformation
with `run.sh --signanalysischeck`:

```sh
./run.sh --signanalysischeck test/runtime.mlir -o build/signanalysischeck.mlir
```

This writes MLIR with assertions to the requested file (or stdout if `-o` is
omitted), and the original annotated listing to stderr. It only runs the pass;
`signanalysischeck.sh` additionally lowers and compiles the result.
Set `BUILD_DIR=build-runtime` when using the plugin built in that directory.

The equivalent direct command uses the pass option `signanalysischeck=true`:

```sh
mlir-opt --load-pass-plugin=build/SignAnalysis.so \
  --pass-pipeline='builtin.module(zero-analysis{signanalysischeck=true})' \
  test/runtime.mlir -o build/signanalysischeck.mlir
```

The existing pass's `runOnOperation()` calls its `signanalysischeck()` helper,
which is defined in the same `Plugin.cpp` file.
After the dataflow solver converges, the pass snapshots informative facts and
inserts `arith.cmpi` + `cf.assert` immediately after each ordinary SSA definition
and at the start of blocks for block arguments. It handles scalar integers and
index values inside LLVM functions; it skips global initializers, terminator
results, and unknown/unreachable facts (`Top`/`Bottom`).

| Fact | Runtime condition |
| --- | --- |
| One | `x == 1` |
| Zero | `x == 0` |
| Negative | `x < 0` |
| Positive | `x > 0` |
| NonPositive | `x <= 0` |
| NonNegative | `x >= 0` |

Comparisons use the value's original width and signed order. Each assertion
message records the expected fact and source location. Existing source
locations are preserved; when reading textual MLIR without explicit locations,
the parser supplies the MLIR file and line.

To lower the checks to LLVM IR and compile an executable, use:

```sh
sh signanalysischeck.sh test/runtime.mlir build/runtime-check/checked test/runtime-driver.c
build/runtime-check/checked square_i8 11     # prints 121
build/runtime-check/checked square_i8 12     # assertion fails
```

`signanalysischeck.sh` accepts an LLVM-dialect input, output executable path, and any
additional clang arguments (such as a C driver defining `main`, objects, or
libraries). It calls `run.sh --signanalysischeck`, lowers arith/control-flow operations,
translates to LLVM IR, and compiles with clang at `-O0`. The intermediate files
and annotated facts are saved beside the executable. Override tools with
`MLIR_OPT`, `MLIR_TRANSLATE`, `CLANG`, and the plugin with `BUILD_DIR` or `PLUGIN`.
Use tools from the same LLVM/MLIR installation as the plugin.

LLVM's standard lowering of `cf.assert` prints with `puts` and then aborts. The
provided C driver disables stdout buffering so diagnostics survive redirection;
do the same in other drivers when capturing output.

Run the reproducible input sweep:

```sh
python3 check-runtime.py --random-inputs 1000 --seed 0
```

This compiles both checked and original programs, tries all 256 signed
8-bit inputs, 32-bit boundaries and seeded random inputs, and exercises branch
joins and a loop. For each input it verifies the original result against a
Python integer oracle and then executes the checked version in a separate
process. It records counterexamples and assertion messages in
`build/runtime-check/report.json`. Exit status is 0 for no failures, 1 for
analysis counterexamples, and 2 for workflow errors. Core dumps are disabled.
Use `--build-dir build-runtime` if that is where you built the plugin.

`ctest --test-dir build --output-on-failure` also checks the opt-in behavior,
predicate generation, successful executions, and the two known counterexamples
below. This test uses `--expect-bug`, which succeeds only when those bugs are
reproduced; after repairing the analysis, update that regression expectation.
The runtime test requires Python 3, clang, and mlir-translate on a Unix host.

## Minimize a failure with llvm-reduce

Run the reducer on the complete runtime test module:

```sh
BUILD_DIR=build-runtime sh reductions/reduce-sign-bug.sh \
  test/runtime.mlir build-runtime/sign-bug-reduction
```

The script translates the input MLIR to LLVM IR, runs `llvm-reduce`, and imports
the reduced LLVM IR back to MLIR. It saves `input.ll`, `reduced.ll`,
`reduced.mlir`, and `reduction.log` in the output directory. Without arguments,
it uses `test/runtime.mlir` and `$BUILD_DIR/sign-bug-reduction` (default `build`).

`reductions/check-sign-bug.py` is the reducer's interestingness test. A candidate
is interesting only if it retains the `i32 @square_i8(i32)` interface, its
original executable returns -112 for input 12, the analysis still claims a
multiply is nonnegative, and its checked executable aborts with that assertion.
Each candidate is compiled and executed using `report/driver.c` and the existing
`signanalysischeck.sh` pipeline. Temporary files are isolated per candidate;
timeouts and disabled core dumps keep failing candidates manageable.

This predicate is specific to the square bug. It accepts only straight-line
integer operations in the tested function and rejects poison/undef, overflow
promises, memory operations, calls, shifts, and division. A random crash or a
poison-based reduction cannot replace the defined wraparound counterexample.
Other bugs or input interfaces require adapting the predicate and driver.

You can also test any candidate directly (exit 0 means interesting):

```sh
BUILD_DIR=build-runtime python3 reductions/check-sign-bug.py --verbose \
  build-runtime/sign-bug-reduction/reduced.ll
```

The workflow additionally supports `LLVM_REDUCE` and `PYTHON` tool overrides.

## Bug found: multiplication ignores wraparound

No injected bug is needed. The `llvm.mul` transfer function in
`SignAnalysis.cpp` claims `x * x` is always `NonNegative`, which is false for
fixed-width multiplication without `nsw`:

```mlir
%square = llvm.mul %x, %x : i8
// inserted check: assert signed(%square) >= 0
```

With `x = 12`, the mathematical square is 144, whose 8-bit representation is
`0x90`, or **-112** as a signed value. The original executable returns -112;
the checked executable aborts with:

```text
sign-analysis assertion failed: expected nonnegative at loc("test/runtime.mlir":6:15)
```

The same bug occurs with `i32`: `46341 * 46341` wraps to **-2147479015**.
With `--random-inputs 1000 --seed 0`, the validation run exercised 2,296 inputs:
1,688 passed and 608 triggered this false nonnegative claim. Every original
execution matched the integer oracle.

These inputs have defined LLVM behavior because the multiplies have no overflow
flags. This distinguishes a false analysis fact from executing poison or
undefined behavior. Tests of other programs must likewise use defined inputs;
executing a poison value cannot validate an analysis claim.

The existing transfer functions are retained so this workflow reproduces the
bug. A repair should account for bit width and overflow: return `Top` when a
sign rule depends on overflow being impossible, or use justified no-overflow
facts. Other add/subtract/multiply rules also need that audit. Passing an input
sweep alone does not prove soundness.

## Nontrivial result

In SQLite's `sqlite3Update`, the analysis proves that an `i8` sum is
nonnegative:

```mlir
%578 = llvm.add %575, %574 overflow<nsw, nuw> : i8 // %578 is nonnegative
```

Both operands are nonnegative block arguments, obtained by joining the
zero-initialized and loop-carried paths. The fact is propagated through
control flow rather than read from a constant.

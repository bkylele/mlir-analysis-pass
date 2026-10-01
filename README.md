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

Use `SignAnalysis.dylib` on macOS. The annotated MLIR is written to stderr.

## Nontrivial result

In SQLite's `sqlite3Update`, the analysis proves that an `i8` sum is
nonnegative:

```mlir
%578 = llvm.add %575, %574 overflow<nsw, nuw> : i8 // %578 is nonnegative
```

Both operands are nonnegative block arguments, obtained by joining the
zero-initialized and loop-carried paths. The fact is propagated through
control flow rather than read from a constant.

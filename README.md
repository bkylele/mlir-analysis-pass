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

## Runtime sign checks

Add assertions that check the analysis's sign facts when the program runs:

```sh
./run.sh --signanalysischeck report/reproducer.mlir -o build/checked.mlir
```

To also lower to LLVM IR, compile, and run the report's reproducer:

```sh
sh signanalysischeck.sh report/reproducer.mlir build/checked report/driver.c
./build/checked
```

A report of found bugs is in `./report/`.

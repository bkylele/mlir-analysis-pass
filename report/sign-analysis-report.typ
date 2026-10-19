#set page(
  paper: "us-letter",
  margin: (x: 0.72in, y: 0.65in),
)
#set text(font: "DejaVu Sans", size: 10pt)
#set par(leading: 0.6em)
#set heading(numbering: none)
#show heading.where(level: 1): set text(size: 13pt)
#show raw: set text(size: 8.5pt)
#show raw.where(block: true): it => block(
  width: 100%, fill: luma(245), inset: 8pt, it,
)

= Sign Analysis Analysis

I added the checks as an optional pass run after my sign analysis. The
implementation is a `signanalysischeck()` helper in `Plugin.cpp`, called from
`runOnOperation()` after the dataflow solver reaches a fixed point. It walks
LLVM function bodies, looks up each integer values assigned abstract value,
and saves `(Value, Kind)` pairs in a vector. Missing states and `Top`/`Bottom`
are skipped.

Each useful abstract fact, non-Top/Bototom, becomes an `arith.cmpi` followed by
`cf.assert`. Comparisons retain the original integer width and use signed
ordering:

#table(
  columns: (1fr, 1fr),
  inset: (x: 8pt, y: 3pt),
  stroke: 0.4pt + luma(210),
  table.header([*Inferred fact*], [*Assertion*]),
  [`One`], [`x == 1`],
  [`Zero`], [`x == 0`],
  [`Negative`], [`x < 0`],
  [`Positive`], [`x > 0`],
  [`NonPositive`], [`x <= 0`],
  [`NonNegative`], [`x >= 0`],
)

For example, a `NonNegative` fact on an 8-bit square produces the following
check:

```text
%square = llvm.mul %small, %small : i8
%zero = arith.constant 0 : i8
%valid = arith.cmpi sge, %square, %zero : i8
cf.assert %valid, "expected nonnegative at report/reproducer.mlir:4:15"
```

The actual diagnostic includes the expected sign and the value's source
location. I then lower `arith` and `cf` to the LLVM dialect, translate with
`mlir-translate --mlir-to-llvmir`, and compile with clang at `-O0`.
The lowered assertion prints a message and aborts when its condition is false.

It turns out this example would also be a bug in my dataflow analysis. Codex
managed to find a minimal reproducer in squaring signed 8-bit integers.

#raw(read("reproducer.mlir"), block: true, lang: "text")

The small C driver in `report/driver.c` calls `square_i8(12)` and prints the
returned value. The unmodified program returns *−112*. The checked program
aborts at the multiply with this message (wrapped here for display):

```text
sign-analysis assertion failed: expected nonnegative at
loc("report/reproducer.mlir":4:15)
```

This was a pretty simple mistake that was already in my implementation. I assumed that whenever both operands had the same SSA value that the result would be nonnegative, but I forgot to take into account signed integer wrapping. This issue would be trivial to replicate for other signed integer sizes.


// Exercises the sign transfer rules, the lattice's one-sided bounds, and
// several cases where the analysis must give up.
// Run with: ctest --test-dir build --output-on-failure
module {
  llvm.func @constants() -> i32 {
    %neg = llvm.mlir.constant(-7 : i32) : i32   // negative
    %zero = llvm.mlir.constant(0 : i32) : i32   // zero
    %one = llvm.mlir.constant(1 : i32) : i32    // one
    %pos = llvm.mlir.constant(5 : i32) : i32    // positive
    llvm.return %pos : i32
  }

  llvm.func @add_sub(%arg0: i32) -> i32 {
    %zero = llvm.mlir.constant(0 : i32) : i32
    %one = llvm.mlir.constant(1 : i32) : i32
    %neg = llvm.mlir.constant(-7 : i32) : i32

    // Identities: adding or subtracting zero keeps the operand's sign.
    %add_id = llvm.add %zero, %one : i32        // one
    %sub_id = llvm.sub %neg, %zero : i32        // negative

    // 0 - x flips the sign.
    %negate = llvm.sub %zero, %one : i32        // negative

    // x - x is zero whatever x is, including an unknown argument.
    %self = llvm.sub %arg0, %arg0 : i32         // zero

    // 1 - 1 is zero; 1 - positive is nonpositive, since the positive side may
    // be exactly one.
    %one_minus_one = llvm.sub %one, %one : i32  // zero
    %five = llvm.mlir.constant(5 : i32) : i32
    %one_minus_pos = llvm.sub %one, %five : i32 // nonpositive

    llvm.return %self : i32
  }

  llvm.func @mul_div(%arg0: i32) -> i32 {
    %zero = llvm.mlir.constant(0 : i32) : i32
    %one = llvm.mlir.constant(1 : i32) : i32
    %neg = llvm.mlir.constant(-7 : i32) : i32

    // Either operand zero annihilates, even an unknown one.
    %mul_zero = llvm.mul %arg0, %zero : i32     // zero
    // Multiplying by one is the identity.
    %mul_one = llvm.mul %neg, %one : i32        // negative
    // x * x is never negative.
    %square = llvm.mul %arg0, %arg0 : i32       // nonnegative

    // x / x is one, and 0 / y is zero.
    %div_self = llvm.sdiv %arg0, %arg0 : i32    // one
    %div_zero = llvm.sdiv %zero, %neg : i32     // zero
    // Truncation means negative / negative is only nonnegative, not positive.
    %div_neg = llvm.sdiv %neg, %neg : i32       // one: same value
    llvm.return %mul_zero : i32
  }

  llvm.func @unknown(%arg0: i32, %arg1: i32) -> i32 {
    // Nothing is known about a function argument, so nothing is known about
    // any of these.  A rule that claims otherwise is unsound.
    %sum = llvm.add %arg0, %arg1 : i32          // top
    %and = llvm.and %arg0, %arg1 : i32          // top: no rule for `and`
    %shl = llvm.shl %arg0, %arg1 : i32          // top: no rule for `shl`
    llvm.return %sum : i32
  }

  // Block arguments join facts from every predecessor, which is the solver
  // iterating rather than any single rule firing.
  llvm.func @join(%flag: i1) -> i32 {
    %zero = llvm.mlir.constant(0 : i32) : i32
    %pos = llvm.mlir.constant(5 : i32) : i32
    %neg = llvm.mlir.constant(-7 : i32) : i32
    llvm.cond_br %flag, ^lhs, ^rhs
  ^lhs:
    llvm.br ^mid(%zero : i32)
  ^rhs:
    llvm.br ^mid(%pos : i32)
  ^mid(%nonneg: i32):                           // nonnegative: zero join positive
    llvm.cond_br %flag, ^tail, ^exit(%nonneg : i32)
  ^tail:
    llvm.br ^exit(%neg : i32)
  ^exit(%merged: i32):                          // top: nonnegative join negative
    llvm.return %merged : i32
  }
}

//===- SignAnalysis.cpp - Transfer functions ------------------------------===//

#include "SignAnalysis.h"

#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "mlir/IR/Matchers.h"

using namespace mlir;

namespace sign {

void SignAnalysis::setToEntryState(SignLattice *lattice) {
  propagateIfChanged(lattice, lattice->join(SignState::top()));
}

LogicalResult
SignAnalysis::visitOperation(Operation *op,
                              ArrayRef<const SignLattice *> operands,
                              ArrayRef<SignLattice *> results) {
  // Raising a result to top says "this operation could produce anything",
  // which is always a sound answer and is what every unhandled case does.
  auto unknown = [&] {
    setAllToEntryStates(results);
    return success();
  };

  // Only single-result integer operations are interesting here.  Calls, loads,
  // floats, and vectors all land in `unknown`.
  if (op->getNumResults() != 1 || !op->getResult(0).getType().isIntOrIndex())
    return unknown();
  SignLattice *result = results[0];

  // a constant's sign follows directly from its value.
  // This is the only rule that does not consult its operands, and without some
  // rule of this kind the analysis would have no facts to propagate at all.
  IntegerAttr value;
  if (matchPattern(op, m_Constant(&value))) {
    SignState state;
    if (value.getValue().isZero())
      state = Kind::Zero;
    else if (value.getValue().isOne())
      state = Kind::One;
    else if (value.getValue().isNegative())
      state = Kind::Negative;
    else
      state = Kind::Positive;
    propagateIfChanged(result, result->join(SignState(state)));
    return success();
  }

  // x + y
  if (isa<LLVM::AddOp>(op)) {
    SignState lhs = operands[0]->getValue();
    SignState rhs = operands[1]->getValue();

    if (lhs.isBottom() || rhs.isBottom())
      return success();

    // x+0
    if (lhs.kind == Kind::Zero) {
      propagateIfChanged(result, result->join(rhs));
      return success();
    }
    if (rhs.kind == Kind::Zero) {
      propagateIfChanged(result, result->join(lhs));
      return success();
    }

    if (lhs == rhs) {
      if (lhs.kind == Kind::One)
        propagateIfChanged(result, result->join(SignState(Kind::Positive)));
      else
        propagateIfChanged(result, result->join(lhs));
      return success();
    }

    if (lhs.kind == Kind::NonNegative && rhs.kind == Kind::Positive) {
      propagateIfChanged(result, result->join(SignState(Kind::Positive)));
      return success();
    }

    if (lhs.kind == Kind::NonPositive && rhs.kind == Kind::Negative) {
      propagateIfChanged(result, result->join(SignState(Kind::Negative)));
      return success();
    }
  }

  // x - y
  if (isa<LLVM::SubOp>(op)) {
    SignState lhs = operands[0]->getValue();
    SignState rhs = operands[1]->getValue();

    if (lhs.isBottom() || rhs.isBottom())
      return success();

    if (op->getOperand(0) == op->getOperand(1)) {
        propagateIfChanged(result, result->join(SignState(Kind::Zero)));
        return success();
    }

    // x-0
    if (rhs.kind == Kind::Zero) {
        propagateIfChanged(result, result->join(lhs));
        return success();
    }

    // 0-x
    if (lhs.kind == Kind::Zero) {
      switch (rhs.kind) {
        case Kind::Positive:
          propagateIfChanged(result, result->join(SignState(Kind::Negative)));
          break;
        case Kind::Zero:
          propagateIfChanged(result, result->join(SignState(Kind::Zero)));
          break;
        case Kind::Negative:
          propagateIfChanged(result, result->join(SignState(Kind::Positive)));
          break;
        case Kind::NonPositive:
          propagateIfChanged(result, result->join(SignState(Kind::NonNegative)));
          break;
        case Kind::NonNegative:
          propagateIfChanged(result, result->join(SignState(Kind::NonPositive)));
          break;
        case Kind::One:
          propagateIfChanged(result, result->join(SignState(Kind::Negative)));
          break;
        default:
          propagateIfChanged(result, result->join(SignState(Kind::Top)));
          break;
      }
      return success();
    }

    if (lhs.kind == Kind::One) {
        switch (rhs.kind) {
            case Kind::Zero:
                propagateIfChanged(result, result->join(SignState(Kind::One)));
                break;
            case Kind::One:
                propagateIfChanged(result, result->join(SignState(Kind::Zero)));
                break;
            case Kind::Positive:
                propagateIfChanged(result, result->join(SignState(Kind::NonPositive)));
                break;
            case Kind::Negative:
            case Kind::NonPositive:
                propagateIfChanged(result, result->join(SignState(Kind::Positive)));
                break;
            default:
                propagateIfChanged(result, result->join(SignState(Kind::Top)));
                break;
        }
      return success();
    }

    if (lhs.kind == Kind::Positive && rhs.kind == Kind::One) {
        propagateIfChanged(result, result->join(SignState(Kind::NonNegative)));
        return success();
    }
    if (lhs.kind == Kind::Positive
            && (rhs.kind == Kind::Negative
                || rhs.kind == Kind::NonPositive)) {
        propagateIfChanged(result, result->join(SignState(Kind::Positive)));
        return success();
    }

    if (lhs.kind == Kind::NonNegative && rhs.kind == Kind::NonPositive) {
        propagateIfChanged(result, result->join(SignState(Kind::NonNegative)));
        return success();
    }
    if (lhs.kind == Kind::NonNegative && rhs.kind == Kind::Negative) {
        propagateIfChanged(result, result->join(SignState(Kind::Positive)));
        return success();
    }

    if (lhs.kind == Kind::Negative && rhs.kind == Kind::One) {
        propagateIfChanged(result, result->join(SignState(Kind::Negative)));
        return success();
    }
    if (lhs.kind == Kind::Negative
            && (rhs.kind == Kind::Positive
                || rhs.kind == Kind::NonNegative)) {
        propagateIfChanged(result, result->join(SignState(Kind::Negative)));
        return success();
    }

    if (lhs.kind == Kind::NonPositive && rhs.kind == Kind::One) {
        propagateIfChanged(result, result->join(SignState(Kind::Negative)));
        return success();
    }
    if (lhs.kind == Kind::NonPositive && rhs.kind == Kind::NonNegative) {
        propagateIfChanged(result, result->join(SignState(Kind::NonPositive)));
        return success();
    }
    if (lhs.kind == Kind::NonPositive  && rhs.kind == Kind::Positive) {
        propagateIfChanged(result, result->join(SignState(Kind::Negative)));
        return success();
    }
  }

  // x * y
  if (isa<LLVM::MulOp>(op)) {
    SignState lhs = operands[0]->getValue();
    SignState rhs = operands[1]->getValue();

    if (lhs.isBottom() || rhs.isBottom())
      return success();

    // x * y is zero if either operand is zero
    if (lhs.kind == Kind::Zero || rhs.kind == Kind::Zero) {
      propagateIfChanged(result, result->join(SignState(Kind::Zero)));
      return success();
    }

    if (op->getOperand(0) == op->getOperand(1)) {
      propagateIfChanged(result, result->join(SignState(Kind::NonNegative)));
      return success();
    }

    if (lhs.kind == Kind::One) {
      propagateIfChanged(result, result->join(rhs));
      return success();
    }
    if (rhs.kind == Kind::One) {
      propagateIfChanged(result, result->join(lhs));
      return success();
    }

    if (lhs.kind == Kind::Positive) {
      switch (rhs.kind) {
          case Kind::Positive:
              propagateIfChanged(result, result->join(SignState(Kind::Positive)));
              break;
          case Kind::Negative:
              propagateIfChanged(result, result->join(SignState(Kind::Negative)));
              break;
          case Kind::NonNegative:
              propagateIfChanged(result, result->join(SignState(Kind::NonNegative)));
              break;
          default:
              propagateIfChanged(result, result->join(SignState(Kind::Top)));
              break;
      }
      return success();
    }

    auto lstrict = lhs.kind == Kind::Positive || lhs.kind == Kind::Negative;
    auto rstrict = rhs.kind == Kind::Positive || rhs.kind == Kind::Negative;
    auto lneg = lhs.kind == Kind::NonPositive || lhs.kind == Kind::Negative;
    auto rneg = rhs.kind == Kind::NonPositive || rhs.kind == Kind::Negative;
    auto positive = lneg == rneg;
    if (lhs.kind != Kind::Top && rhs.kind != Kind::Top) {
      if (lstrict && rstrict)
        propagateIfChanged(result, result->join(
                    SignState(positive ? Kind::Positive : Kind::Negative)));
      else
        propagateIfChanged(result, result->join(
                    SignState(positive ? Kind::NonNegative : Kind::NonPositive)));
      return success();
    }
  }

  // x / y
  if (isa<LLVM::SDivOp>(op)) {
    SignState lhs = operands[0]->getValue();
    SignState rhs = operands[1]->getValue();

    if (lhs.isBottom() || rhs.isBottom())
      return success();

    if (rhs.kind == Kind::Zero)
      return unknown();

    // x / x
    if (op->getOperand(0) == op->getOperand(1)) {
      propagateIfChanged(result, result->join(SignState(Kind::One)));
      return success();
    }

    // 0 / y
    if (lhs.kind == Kind::Zero) {
      propagateIfChanged(result, result->join(SignState(Kind::Zero)));
      return success();
    }

    // x / 1
    if (rhs.kind == Kind::One) {
      propagateIfChanged(result, result->join(lhs));
      return success();
    }

    auto lneg = lhs.kind == Kind::NonPositive || lhs.kind == Kind::Negative;
    auto rneg = rhs.kind == Kind::NonPositive || rhs.kind == Kind::Negative;
    auto positive = lneg == rneg;
    if (lhs.kind != Kind::Top && rhs.kind != Kind::Top) {
      propagateIfChanged(result, result->join(
                  SignState(positive ? Kind::NonNegative : Kind::NonPositive)));
      return success();
    }
  }

  return unknown();
}

} // namespace sign

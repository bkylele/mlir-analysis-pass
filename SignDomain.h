//===- SignDomain.h - The abstract domain ---------------------------------===//

#ifndef SIGN_DOMAIN_H
#define SIGN_DOMAIN_H

#include "llvm/Support/raw_ostream.h"

namespace sign {

enum class Kind { Bottom, One, Negative, Zero, Positive, NonPositive, NonNegative, Top };

inline const char *name(Kind kind) {
  switch (kind) {
  case Kind::Bottom:
    return "bottom";
  case Kind::One:
    return "one";
  case Kind::Negative:
    return "negative";
  case Kind::Zero:
    return "zero";
  case Kind::Positive:
    return "positive";
  case Kind::NonPositive:
    return "nonpositive";
  case Kind::NonNegative:
    return "nonnegative";
  case Kind::Top:
    return "top";
  }
  return "top";
}

struct SignState {
  Kind kind = Kind::Bottom;

  SignState() = default;
  /* implicit */ SignState(Kind kind) : kind(kind) {}

  static SignState bottom() { return Kind::Bottom; }
  static SignState top() { return Kind::Top; }

  bool isBottom() const { return kind == Kind::Bottom; }

  /// Least upper bound.  Two disagreeing facts lose all information.
  static SignState join(const SignState &lhs, const SignState &rhs) {
    if (lhs.kind == Kind::Bottom)
      return rhs;
    if (rhs.kind == Kind::Bottom)
      return lhs;
    if (lhs.kind == rhs.kind)
      return lhs;

    if (lhs.kind == Kind::Zero) {
        if (rhs.kind == Kind::Negative
                || rhs.kind == Kind::NonPositive)
            return Kind::NonPositive;
        if (rhs.kind == Kind::One
                || rhs.kind == Kind::Positive
                || rhs.kind == Kind::NonNegative)
            return Kind::NonNegative;
    }
    if (rhs.kind == Kind::Zero) {
        if (lhs.kind == Kind::Negative
                || lhs.kind == Kind::NonPositive)
            return Kind::NonPositive;
        if (lhs.kind == Kind::One
                || lhs.kind == Kind::Positive
                || lhs.kind == Kind::NonNegative)
            return Kind::NonNegative;
    }

    if (lhs.kind == Kind::Negative && rhs.kind == Kind::NonPositive)
        return rhs;
    if (rhs.kind == Kind::Negative && lhs.kind == Kind::NonPositive)
        return lhs;

    if (lhs.kind == Kind::One &&
            (rhs.kind == Kind::Positive || rhs.kind == Kind::NonNegative))
        return rhs;
    if (rhs.kind == Kind::One &&
            (lhs.kind == Kind::Positive || lhs.kind == Kind::NonNegative))
        return lhs;

    return top();
  }

  bool operator==(const SignState &other) const { return kind == other.kind; }
  bool operator!=(const SignState &other) const { return kind != other.kind; }

  void print(llvm::raw_ostream &os) const { os << name(kind); }
};

inline llvm::raw_ostream &operator<<(llvm::raw_ostream &os,
                                     const SignState &state) {
  state.print(os);
  return os;
}

} // namespace sign

#endif

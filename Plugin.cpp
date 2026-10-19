//===- Plugin.cpp - Pass definition and plugin entry point ----------------===//
//
// Scaffolding: wires the analysis into a pass and exposes it to mlir-opt.
//
//===----------------------------------------------------------------------===//

#include "Annotate.h"
#include "ZeroAnalysis.h"
#include "SignAnalysis.h"

#include "mlir/Analysis/DataFlow/ConstantPropagationAnalysis.h"
#include "mlir/Analysis/DataFlow/DeadCodeAnalysis.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/ControlFlow/IR/ControlFlowOps.h"
#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "mlir/IR/AsmState.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/Builders.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Pass/PassRegistry.h"
#include "mlir/Tools/Plugins/PassPlugin.h"
#include "llvm/Config/llvm-config.h"
#include "llvm/Support/Compiler.h"
#include "llvm/Support/raw_ostream.h"

#include <utility>
#include <vector>

using namespace mlir;

namespace {

struct ZeroAnalysisPass
    : PassWrapper<ZeroAnalysisPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(ZeroAnalysisPass)

  ZeroAnalysisPass() = default;
  ZeroAnalysisPass(const ZeroAnalysisPass &other) : PassWrapper(other) {}

  Option<bool> enableSignAnalysisCheck{
      *this, "signanalysischeck",
      llvm::cl::desc("Check inferred sign facts with runtime assertions"),
      llvm::cl::init(false)};

  void getDependentDialects(DialectRegistry &registry) const override {
    registry.insert<arith::ArithDialect, cf::ControlFlowDialect>();
  }

  StringRef getArgument() const final { return "zero-analysis"; }

  StringRef getDescription() const final {
    return "Infer integer signs and optionally check them at runtime";
  }

  void runOnOperation() override {
    DataFlowConfig config;
    config.setInterprocedural(false);

    DataFlowSolver solver(config);
    // DeadCodeAnalysis supplies reachability, without which the solver must
    // assume every branch is taken; SparseConstantPropagation resolves branch
    // conditions for it.  Both are prerequisites, not extras.
    solver.load<dataflow::DeadCodeAnalysis>();
    solver.load<dataflow::SparseConstantPropagation>();
    // solver.load<zero::ZeroAnalysis>();
    solver.load<sign::SignAnalysis>();

    if (failed(solver.initializeAndRun(getOperation()))) {
      getOperation().emitError("zero analysis failed to reach a fixed point");
      return signalPassFailure();
    }

    // Query states only now that the solver has converged.
    auto describe = [&](Value value, AsmState &asmState) -> std::string {
      const auto *lattice = solver.lookupState<sign::SignLattice>(value);
      if (!lattice)
        return {};
      sign::Kind kind = lattice->getValue().kind;
      // Top and bottom say nothing; printing them would bury the real facts.
      if (kind == sign::Kind::Top || kind == sign::Kind::Bottom)
        return {};
      std::string description;
      llvm::raw_string_ostream os(description);
      value.printAsOperand(os, asmState);
      os << " is " << sign::name(kind);
      return description;
    };

    // Print the original facts before adding any runtime checks.
    zero::printAnnotated(getOperation(), describe, llvm::errs());

    if (!enableSignAnalysisCheck) {
      markAllAnalysesPreserved();
      return;
    }

    signanalysischeck(solver);
  }

  void signanalysischeck(DataFlowSolver &solver) {
    using sign::Kind;
    std::vector<std::pair<Value, Kind>> checks;

    // Collect the final facts before changing the program.
    getOperation().walk([&](Operation *op) {
      if (!isa<LLVM::LLVMFuncOp>(op) &&
          !op->getParentOfType<LLVM::LLVMFuncOp>())
        return;

      std::vector<Value> values;
      if (!op->hasTrait<OpTrait::IsTerminator>())
        for (Value result : op->getResults())
          values.push_back(result);
      for (Region &region : op->getRegions())
        for (Block &block : region)
          if (!block.empty())
            for (BlockArgument argument : block.getArguments())
              values.push_back(argument);

      for (Value value : values) {
        if (!value.getType().isIntOrIndex())
          continue;
        const auto *lattice = solver.lookupState<sign::SignLattice>(value);
        if (!lattice)
          continue;
        Kind kind = lattice->getValue().kind;
        if (kind == Kind::Bottom || kind == Kind::Top)
          continue;

        checks.emplace_back(value, kind);
      }
    });

    // Add a comparison and assertion for each saved fact.
    OpBuilder builder(&getContext());
    for (const auto &[value, kind] : checks) {
      if (auto result = dyn_cast<OpResult>(value))
        builder.setInsertionPointAfter(result.getOwner());
      else
        builder.setInsertionPointToStart(
            cast<BlockArgument>(value).getOwner());

      arith::CmpIPredicate predicate;
      switch (kind) {
      case Kind::One:
      case Kind::Zero:
        predicate = arith::CmpIPredicate::eq;
        break;
      case Kind::Negative:
        predicate = arith::CmpIPredicate::slt;
        break;
      case Kind::Positive:
        predicate = arith::CmpIPredicate::sgt;
        break;
      case Kind::NonPositive:
        predicate = arith::CmpIPredicate::sle;
        break;
      case Kind::NonNegative:
        predicate = arith::CmpIPredicate::sge;
        break;
      default:
        llvm_unreachable("only informative sign facts are collected");
      }

      Location loc = value.getLoc();
      std::string message;
      llvm::raw_string_ostream os(message);
      os << "sign-analysis assertion failed: expected " << sign::name(kind)
         << " at " << loc;
      Value bound = arith::ConstantOp::create(
          builder, loc, builder.getIntegerAttr(value.getType(),
                                             kind == Kind::One ? 1 : 0));
      Value condition = arith::CmpIOp::create(builder, loc, predicate, value, bound);
      cf::AssertOp::create(builder, loc, condition, message);
    }
  }
};

} // namespace

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo mlirGetPassPluginInfo() {
  // LLVM_VERSION_STRING is baked in at compile time and checked by mlir-opt at
  // load time, which is what turns an ABI mismatch into a clear diagnostic.
  return {MLIR_PLUGIN_API_VERSION, "ZeroAnalysis", LLVM_VERSION_STRING,
          []() { PassRegistration<ZeroAnalysisPass>(); }};
}

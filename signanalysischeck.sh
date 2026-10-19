#!/bin/sh
# Compile LLVM-dialect MLIR with sign checks. Extra arguments go to clang.
# Usage: sh signanalysischeck.sh input.mlir output-executable [driver.c ...]
set -eu

if [ "$#" -lt 2 ]; then
  echo "usage: $0 input.mlir output-executable [extra clang arguments ...]" >&2
  exit 2
fi
input=$1
output=$2
shift 2

mkdir -p "$(dirname "$output")"
if ! sh "$(dirname "$0")/run.sh" --signanalysischeck \
  "$input" -o "$output.signanalysischeck.mlir" 2>"$output.facts.log"; then
  cat "$output.facts.log" >&2
  exit 1
fi
"${MLIR_OPT:-mlir-opt}" "$output.signanalysischeck.mlir" \
  --convert-arith-to-llvm --convert-cf-to-llvm \
  --reconcile-unrealized-casts -o "$output.llvm.mlir"
"${MLIR_TRANSLATE:-mlir-translate}" --mlir-to-llvmir \
  "$output.llvm.mlir" -o "$output.ll"
"${CLANG:-clang}" -O0 "$output.ll" "$@" -o "$output"
echo "Built $output"

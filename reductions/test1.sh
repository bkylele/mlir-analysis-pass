#!/bin/sh
# Tests whether an addition is nonnegative.
mlir-translate --import-llvm "$1" |
    mlir-opt --load-pass-plugin=build/SignAnalysis.so \
        --pass-pipeline='builtin.module(zero-analysis)' 2>&1 1>/dev/null |
    grep -q 'llvm\.add.*is nonnegative'

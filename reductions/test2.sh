#!/bin/sh
# Tests whether a multiplication is positive.
mlir-translate --import-llvm "$1" |
    mlir-opt --load-pass-plugin=build/SignAnalysis.so \
        --pass-pipeline='builtin.module(zero-analysis)' 2>&1 1>/dev/null |
    grep -q 'llvm\.mul.*is positive'

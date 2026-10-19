#!/bin/sh
# Run the analysis over an MLIR file.
#
#   ./run.sh input.mlir
#   ./run.sh --signanalysischeck input.mlir [-o checked.mlir]
#
# The plugin is SignAnalysis.dylib on macOS and SignAnalysis.so on Linux and
# WSL2, so probe for it rather than hard-coding a suffix.  Set PLUGIN or
# BUILD_DIR to override.
set -eu

check_signs=false
if [ "${1:-}" = "--signanalysischeck" ]; then
  check_signs=true
  shift
fi

if [ "$#" -lt 1 ]; then
  echo "usage: $0 [--signanalysischeck] input.mlir [mlir-opt options ...]" >&2
  exit 2
fi

BUILD_DIR="${BUILD_DIR:-build}"

if [ -z "${PLUGIN:-}" ]; then
  for candidate in "$BUILD_DIR"/SignAnalysis.so "$BUILD_DIR"/SignAnalysis.dylib; do
    if [ -f "$candidate" ]; then
      PLUGIN="$candidate"
      break
    fi
  done
fi

if [ -z "${PLUGIN:-}" ]; then
  echo "No plugin found in $BUILD_DIR; build it first (see README.md)." >&2
  exit 1
fi

if [ "$check_signs" = true ]; then
  # Keep the transformed MLIR on stdout (or in the file specified by -o).
  # The original annotated listing remains on stderr.
  exec "${MLIR_OPT:-mlir-opt}" --load-pass-plugin="$PLUGIN" \
       --pass-pipeline='builtin.module(zero-analysis{signanalysischeck=true})' \
       "$@"
fi

# stdout is the unchanged IR and stderr is the annotated listing; send the
# listing to this script's stdout so it can be piped or paged.
exec "${MLIR_OPT:-mlir-opt}" --load-pass-plugin="$PLUGIN" \
         --pass-pipeline='builtin.module(zero-analysis)' \
         "$@" 2>&1 1>/dev/null

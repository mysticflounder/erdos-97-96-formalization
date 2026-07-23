#!/usr/bin/env bash
set -euo pipefail

# Invoked through lake-build as REAL_LAKE; lake-build owns the shared project
# lock and installs the memory-capped `lean` shim before this script starts.
if [[ "${1:-}" == "build" ]]; then
  shift
fi

task_lean_path="../scratch/atail-force/unique4-exact-two-source-bridge/Kalmanson:../scratch/atail-force/unique4-exact-two-schema-decoder:../scratch/atail-force/unique4-kalmanson-core-port:../scratch/atail-force/unique4-aligned-p5-occurrence:../scratch/atail-force/unique4-source-field-audit:../scratch/atail-force/unique4-kalmanson-occurrence"

LEAN_PATH="${task_lean_path}" lake env lean --root=.. -DwarningAsError=true \
  -o ../scratch/atail-force/unique4-exact-two-source-bridge/Kalmanson/ExactTwoSchemaDecoder.olean \
  ../scratch/atail-force/unique4-exact-two-schema-decoder/ExactTwoSchemaDecoder.lean

LEAN_PATH="${task_lean_path}" lake env lean --root=.. -DwarningAsError=true \
  -o ../scratch/atail-force/unique4-exact-two-source-bridge/Kalmanson/MissingRetainedOrientations.olean \
  ../scratch/atail-force/unique4-exact-two-source-bridge/Kalmanson/MissingRetainedOrientations.lean

LEAN_PATH="${task_lean_path}" lake env lean --root=.. -DwarningAsError=true \
  ../scratch/atail-force/unique4-exact-two-source-bridge/Kalmanson/RetainedKalmansonDecoder.lean

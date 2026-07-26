#!/usr/bin/env bash
set -euo pipefail

# This may be invoked through lake-build as REAL_LAKE, but can also run on its
# own; lean427 pins the compiler in both cases.
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"
if [[ "${1:-}" == "build" ]]; then
  shift
fi

task_lean_path="../scratch/atail-force/unique4-exact-two-source-bridge/Kalmanson:../scratch/atail-force/unique4-exact-two-schema-decoder:../scratch/atail-force/unique4-kalmanson-core-port:../scratch/atail-force/unique4-aligned-p5-occurrence:../scratch/atail-force/unique4-source-field-audit:../scratch/atail-force/unique4-kalmanson-occurrence"

LEAN_PATH="${task_lean_path}" "$ROOT/scripts/lean427" lake env lean -M16384 --root=.. -DwarningAsError=true \
  -o ../scratch/atail-force/unique4-exact-two-source-bridge/Kalmanson/ExactTwoSchemaDecoder.olean \
  ../scratch/atail-force/unique4-exact-two-schema-decoder/ExactTwoSchemaDecoder.lean

LEAN_PATH="${task_lean_path}" "$ROOT/scripts/lean427" lake env lean -M16384 --root=.. -DwarningAsError=true \
  -o ../scratch/atail-force/unique4-exact-two-source-bridge/Kalmanson/MissingRetainedOrientations.olean \
  ../scratch/atail-force/unique4-exact-two-source-bridge/Kalmanson/MissingRetainedOrientations.lean

LEAN_PATH="${task_lean_path}" "$ROOT/scripts/lean427" lake env lean -M16384 --root=.. -DwarningAsError=true \
  ../scratch/atail-force/unique4-exact-two-source-bridge/Kalmanson/RetainedKalmansonDecoder.lean

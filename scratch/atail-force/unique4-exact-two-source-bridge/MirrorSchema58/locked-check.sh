#!/usr/bin/env bash
set -euo pipefail

# Invoked through lake-build as REAL_LAKE; lake-build owns the shared project
# lock and installs the memory-capped `lean` shim before this script starts.
if [[ "${1:-}" == "build" ]]; then
  shift
fi

task_dir="../scratch/atail-force/unique4-exact-two-source-bridge/MirrorSchema58"
task_lean_path="${task_dir}:../scratch/atail-force/unique4-exact-two-source-bridge/Kalmanson:../scratch/atail-force/unique4-exact-two-occurrence:../scratch/atail-force/unique4-exact-two-schema-decoder:../scratch/atail-force/unique4-kalmanson-core-port:../scratch/atail-force/unique4-aligned-p5-occurrence:../scratch/atail-force/unique4-n11-source-lift:../scratch/atail-force/unique4-class-cap-distribution:../scratch/atail-force/unique-arm-route-audit:../scratch/atail-force/unique-row-producer:../scratch/atail-force/unique4-source-field-audit:../scratch/atail-force/unique4-kalmanson-occurrence"

LEAN_PATH="${task_lean_path}" lake env lean --root=.. -DwarningAsError=true \
  -o "${task_dir}/ExactTwoSchemaDecoder.olean" \
  ../scratch/atail-force/unique4-exact-two-schema-decoder/ExactTwoSchemaDecoder.lean

LEAN_PATH="${task_lean_path}" lake env lean --root=.. -DwarningAsError=true \
  -o "${task_dir}/MissingRetainedOrientations.olean" \
  ../scratch/atail-force/unique4-exact-two-source-bridge/Kalmanson/MissingRetainedOrientations.lean

LEAN_PATH="${task_lean_path}" lake env lean --root=.. -DwarningAsError=true \
  -o "${task_dir}/RetainedKalmansonDecoder.olean" \
  ../scratch/atail-force/unique4-exact-two-source-bridge/Kalmanson/RetainedKalmansonDecoder.lean

LEAN_PATH="${task_lean_path}" lake env lean --root=.. -DwarningAsError=true \
  -o "${task_dir}/MirrorSchema58.olean" \
  "${task_dir}/MirrorSchema58.lean"

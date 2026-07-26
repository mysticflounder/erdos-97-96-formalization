#!/usr/bin/env bash
set -euo pipefail

# This may be invoked through lake-build as REAL_LAKE, but can also run on its
# own; lean427 pins the compiler in both cases.
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"
if [[ "${1:-}" == "build" ]]; then
  shift
fi

task_dir="../scratch/atail-force/unique4-exact-two-source-bridge/MirrorSchema58"
task_lean_path="${task_dir}:../scratch/atail-force/unique4-exact-two-source-bridge/Kalmanson:../scratch/atail-force/unique4-exact-two-occurrence:../scratch/atail-force/unique4-exact-two-schema-decoder:../scratch/atail-force/unique4-kalmanson-core-port:../scratch/atail-force/unique4-aligned-p5-occurrence:../scratch/atail-force/unique4-n11-source-lift:../scratch/atail-force/unique4-class-cap-distribution:../scratch/atail-force/unique-arm-route-audit:../scratch/atail-force/unique-row-producer:../scratch/atail-force/unique4-source-field-audit:../scratch/atail-force/unique4-kalmanson-occurrence"

LEAN_PATH="${task_lean_path}" "$ROOT/scripts/lean427" lake env lean -M16384 --root=.. -DwarningAsError=true \
  -o "${task_dir}/ExactTwoSchemaDecoder.olean" \
  ../scratch/atail-force/unique4-exact-two-schema-decoder/ExactTwoSchemaDecoder.lean

LEAN_PATH="${task_lean_path}" "$ROOT/scripts/lean427" lake env lean -M16384 --root=.. -DwarningAsError=true \
  -o "${task_dir}/MissingRetainedOrientations.olean" \
  ../scratch/atail-force/unique4-exact-two-source-bridge/Kalmanson/MissingRetainedOrientations.lean

LEAN_PATH="${task_lean_path}" "$ROOT/scripts/lean427" lake env lean -M16384 --root=.. -DwarningAsError=true \
  -o "${task_dir}/RetainedKalmansonDecoder.olean" \
  ../scratch/atail-force/unique4-exact-two-source-bridge/Kalmanson/RetainedKalmansonDecoder.lean

LEAN_PATH="${task_lean_path}" "$ROOT/scripts/lean427" lake env lean -M16384 --root=.. -DwarningAsError=true \
  -o "${task_dir}/MirrorSchema58.olean" \
  "${task_dir}/MirrorSchema58.lean"

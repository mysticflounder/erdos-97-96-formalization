#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
LEAN_DIR="$ROOT_DIR/lean"
TASK_DIR="../scratch/atail-force/unique4-p4-row-at-least-four-occurrence-bridge"
GENERATED_DIR="$TASK_DIR/generated"
BUILD_DIR="$(mktemp -d "${TMPDIR:-/tmp}/p4-row-at-least-four-bridge.XXXXXX")"
trap 'rm -rf "$BUILD_DIR"' EXIT

UV_CACHE_DIR="/private/tmp/p4_row_at_least_four_uv_cache" uv run python \
  "$ROOT_DIR/scratch/atail-force/unique4-p4-row-at-least-four-occurrence-bridge/generate.py" --verify-only
UV_CACHE_DIR="/private/tmp/p4_row_at_least_four_uv_cache" uv run python \
  "$ROOT_DIR/scratch/atail-force/unique4-exact-two-core-map/materialize_p4_compact_seed0.py" --verify-only

cd "$LEAN_DIR"
BASE_LEAN_PATH="$TASK_DIR:$GENERATED_DIR:../scratch/atail-force/unique4-exact-two-occurrence:../scratch/atail-force/unique4-exact-two-source-bridge/OccurrenceBridge:../scratch/atail-force/unique4-exact-two-source-bridge/MirrorSchema58:../scratch/atail-force/unique4-exact-two-schema-decoder:../scratch/atail-force/unique4-kalmanson-core-port:../scratch/atail-force/unique4-aligned-p5-occurrence:../scratch/atail-force/unique4-n11-source-lift:../scratch/atail-force/unique4-class-cap-distribution:../scratch/atail-force/unique-arm-route-audit:../scratch/atail-force/unique-row-producer:../scratch/atail-force/unique4-source-field-audit:../scratch/atail-force/unique4-kalmanson-occurrence:../scratch/atail-force/unique4-exact-two-source-bridge/IndexedSource"

for source in \
  ../scratch/atail-force/unique4-selected-class-curvature-adapter/SelectedFourClassCurvature.lean \
  ../scratch/atail-force/unique4-exact-two-source-bridge/Curvature/P5RetainedOuterArcMasks.lean \
  ../scratch/atail-force/unique4-p4-source-bridge/P4DirectOuterArcAdapter.lean \
  ../scratch/atail-force/unique4-p4-source-bridge/P4GenericFamilies.lean; do
  module="$(basename "$source" .lean)"
  echo "== $module"
  LEAN_PATH="$BUILD_DIR:$BASE_LEAN_PATH" "$ROOT_DIR/scripts/lean427" lake env lean -M16384 -DwarningAsError=true \
    -R "$(dirname "$source")" -o "$BUILD_DIR/$module.olean" "$source"
done

for module in Core Families BridgeChunk01 BridgeChunk02 BridgeChunk03 BridgeChunk04 BridgeChunk05 BridgeChunk06 BridgeChunk07 BridgeChunk08 BridgeAll Main AxiomAudit; do
  source="$TASK_DIR/$module.lean"
  if [[ "$module" == BridgeChunk* || "$module" == BridgeAll || "$module" == Main ]]; then
    source="$TASK_DIR/generated/$module.lean"
  fi
  echo "== $module"
  LEAN_PATH="$BUILD_DIR:$BASE_LEAN_PATH" "$ROOT_DIR/scripts/lean427" lake env lean -M16384 -DwarningAsError=true \
    -R "$TASK_DIR" -o "$BUILD_DIR/$module.olean" "$source"
done

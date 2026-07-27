#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
LEAN_DIR="$ROOT_DIR/lean"
TASK_DIR="../scratch/atail-force/unique4-p4-cyclic-alternation-occurrence-bridge"
GENERATED_DIR="$TASK_DIR/generated"
BUILD_DIR="$(mktemp -d "${TMPDIR:-/tmp}/p4-cyclic-bridge.XXXXXX")"
trap 'rm -rf "$BUILD_DIR"' EXIT

UV_CACHE_DIR="/private/tmp/p4-cyclic-uv-cache" uv run python \
  "$ROOT_DIR/scratch/atail-force/unique4-p4-cyclic-alternation-occurrence-bridge/generate.py" --verify-only
UV_CACHE_DIR="/private/tmp/p4-cyclic-uv-cache" uv run python \
  "$ROOT_DIR/scratch/atail-force/unique4-exact-two-core-map/materialize_p4_compact_seed0.py" --verify-only

cd "$LEAN_DIR"
BASE_LEAN_PATH="$TASK_DIR:$GENERATED_DIR:../scratch/atail-force/unique4-exact-two-occurrence:../scratch/atail-force/unique4-exact-two-source-bridge/OccurrenceBridge:../scratch/atail-force/unique4-exact-two-source-bridge/MirrorSchema58:../scratch/atail-force/unique4-exact-two-schema-decoder:../scratch/atail-force/unique4-kalmanson-core-port:../scratch/atail-force/unique4-aligned-p5-occurrence:../scratch/atail-force/unique4-n11-source-lift:../scratch/atail-force/unique4-class-cap-distribution:../scratch/atail-force/unique-arm-route-audit:../scratch/atail-force/unique-row-producer:../scratch/atail-force/unique4-source-field-audit:../scratch/atail-force/unique4-kalmanson-occurrence:../scratch/atail-force/unique4-exact-two-source-bridge/IndexedSource"

compile() {
  LEAN_PATH="$BUILD_DIR:$BASE_LEAN_PATH" "$ROOT_DIR/scripts/lean427" lake env lean -M16384 -DwarningAsError=true \
    -R "$1" -o "$BUILD_DIR/$2.olean" "$3"
}

compile ../scratch/atail-force/unique4-selected-class-curvature-adapter SelectedFourClassCurvature \
  ../scratch/atail-force/unique4-selected-class-curvature-adapter/SelectedFourClassCurvature.lean
compile ../scratch/atail-force/unique4-exact-two-source-bridge/Curvature P5RetainedOuterArcMasks \
  ../scratch/atail-force/unique4-exact-two-source-bridge/Curvature/P5RetainedOuterArcMasks.lean
compile ../scratch/atail-force/unique4-p4-source-bridge P4DirectOuterArcAdapter \
  ../scratch/atail-force/unique4-p4-source-bridge/P4DirectOuterArcAdapter.lean
compile ../scratch/atail-force/unique4-p4-source-bridge P4GenericFamilies \
  ../scratch/atail-force/unique4-p4-source-bridge/P4GenericFamilies.lean

for module in Core Families BridgeChunk{01..10} BridgeAll Main AxiomAudit; do
  source="$TASK_DIR/$module.lean"
  if [[ "$module" == BridgeChunk* || "$module" == BridgeAll || "$module" == Main ]]; then
    source="$GENERATED_DIR/$module.lean"
  fi
  echo "== $module"
  compile "$TASK_DIR" "$module" "$source"
done

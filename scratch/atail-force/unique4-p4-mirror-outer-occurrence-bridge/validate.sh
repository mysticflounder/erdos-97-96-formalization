#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
LEAN_ROOT="$ROOT/lean"
TASK_DIR="../scratch/atail-force/unique4-p4-mirror-outer-occurrence-bridge"
GENERATED_DIR="$TASK_DIR/generated"
SOURCE_BRIDGE_DIR="../scratch/atail-force/unique4-p4-source-bridge"
BUILD_DIR="$(mktemp -d /private/tmp/p4-mirror-occurrence.XXXXXX)"
trap 'rm -rf "$BUILD_DIR"' EXIT

UV_CACHE_DIR=/private/tmp/p4-mirror-uv-cache uv run --no-project python \
  "$ROOT/scratch/atail-force/unique4-p4-mirror-outer-occurrence-bridge/generate.py" --verify
(
  cd "$ROOT/scratch/atail-force/unique4-p4-mirror-outer-occurrence-bridge"
  UV_CACHE_DIR=/private/tmp/p4-mirror-uv-cache uv run --no-project python -m unittest -v test_generate.py
)

cd "$LEAN_ROOT"
BASE_LEAN_PATH="$GENERATED_DIR:../scratch/atail-force/unique4-exact-two-occurrence:../scratch/atail-force/unique4-exact-two-source-bridge/OccurrenceBridge:../scratch/atail-force/unique4-exact-two-source-bridge/MirrorSchema58:../scratch/atail-force/unique4-exact-two-schema-decoder:../scratch/atail-force/unique4-kalmanson-core-port:../scratch/atail-force/unique4-aligned-p5-occurrence:../scratch/atail-force/unique4-n11-source-lift:../scratch/atail-force/unique4-class-cap-distribution:../scratch/atail-force/unique-arm-route-audit:../scratch/atail-force/unique-row-producer:../scratch/atail-force/unique4-source-field-audit:../scratch/atail-force/unique4-kalmanson-occurrence:../scratch/atail-force/unique4-exact-two-source-bridge/IndexedSource"

compile() {
  local root="$1" module="$2" source="$3"
  echo "== $module"
  LEAN_PATH="$BUILD_DIR:$BASE_LEAN_PATH" "$ROOT/scripts/lean427" lake env lean -M16384 \
    -DwarningAsError=true -R "$root" -o "$BUILD_DIR/$module.olean" "$source"
}

compile ../scratch/atail-force/unique4-selected-class-curvature-adapter SelectedFourClassCurvature \
  ../scratch/atail-force/unique4-selected-class-curvature-adapter/SelectedFourClassCurvature.lean
compile ../scratch/atail-force/unique4-exact-two-source-bridge/Curvature P5RetainedOuterArcMasks \
  ../scratch/atail-force/unique4-exact-two-source-bridge/Curvature/P5RetainedOuterArcMasks.lean
compile "$SOURCE_BRIDGE_DIR" P4DirectOuterArcAdapter "$SOURCE_BRIDGE_DIR/P4DirectOuterArcAdapter.lean"
compile "$SOURCE_BRIDGE_DIR" P4DirectOuterArcFinite "$SOURCE_BRIDGE_DIR/P4DirectOuterArcFinite.lean"
compile "$SOURCE_BRIDGE_DIR" P4MirrorOuterArcTransport "$SOURCE_BRIDGE_DIR/P4MirrorOuterArcTransport.lean"
compile "$GENERATED_DIR" Core "$GENERATED_DIR/Core.lean"
compile "$GENERATED_DIR" Families "$GENERATED_DIR/Families.lean"

for source in "$GENERATED_DIR"/BridgeChunk*.lean; do
  module="${source##*/}"
  compile "$GENERATED_DIR" "${module%.lean}" "$source"
done

compile "$GENERATED_DIR" BridgeAll "$GENERATED_DIR/BridgeAll.lean"
compile "$GENERATED_DIR" Main "$GENERATED_DIR/Main.lean"
compile "$GENERATED_DIR" AxiomAudit "$GENERATED_DIR/AxiomAudit.lean"

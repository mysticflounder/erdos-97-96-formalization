#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
LEAN_DIR="$ROOT_DIR/lean"
SOURCE_DIR="../scratch/atail-force/unique4-p4-prefixed-closures"
OUTPUT_DIR="$SOURCE_DIR/olean-427"

export TMPDIR="$ROOT_DIR/scratch/run-tmp"
mkdir -p "$TMPDIR"
mkdir -p \
  "$ROOT_DIR/scratch/atail-force/unique4-p4-prefixed-closures/olean-427/P4OccurrenceClosure/MutualTransport" \
  "$ROOT_DIR/scratch/atail-force/unique4-p4-prefixed-closures/olean-427/P4OccurrenceClosure/CyclicAlternation" \
  "$ROOT_DIR/scratch/atail-force/unique4-p4-prefixed-closures/olean-427/P4OccurrenceClosure/Kalmanson"

cd "$LEAN_DIR"
BASE_LEAN_PATH="$OUTPUT_DIR:../scratch/atail-force/unique4-p4-source-bridge/olean-427:../scratch/atail-force/unique4-p4-direct-outer-occurrence-bridge/olean-427:../scratch/atail-force/unique4-exact-two-occurrence:../scratch/atail-force/unique4-exact-two-source-bridge/OccurrenceBridge:../scratch/atail-force/unique4-exact-two-source-bridge/MirrorSchema58:../scratch/atail-force/unique4-exact-two-schema-decoder:../scratch/atail-force/unique4-kalmanson-core-port:../scratch/atail-force/unique4-aligned-p5-occurrence:../scratch/atail-force/unique4-n11-source-lift:../scratch/atail-force/unique4-class-cap-distribution:../scratch/atail-force/unique-arm-route-audit:../scratch/atail-force/unique-row-producer:../scratch/atail-force/unique4-source-field-audit:../scratch/atail-force/unique4-kalmanson-occurrence:../scratch/atail-force/unique4-exact-two-source-bridge/IndexedSource"

compile() {
  local module="$1"
  LEAN_PATH="$BASE_LEAN_PATH" "$ROOT_DIR/scripts/lean427" lake env lean \
    -M16384 -DwarningAsError=true -R "$SOURCE_DIR" \
    -o "$OUTPUT_DIR/${module//.//}.olean" "$SOURCE_DIR/${module//.//}.lean"
}

echo "== mutual transport"
for module in Core Families BridgeChunk{01..04} BridgeAll Main Orientation AxiomAudit; do
  compile "P4OccurrenceClosure.MutualTransport.$module"
done

echo "== cyclic alternation"
for module in Core Families BridgeChunk{01..10} BridgeAll Main AxiomAudit; do
  compile "P4OccurrenceClosure.CyclicAlternation.$module"
done

echo "== Kalmanson"
for module in KalmansonCore Core Families BridgeChunk{01..15} BridgeAll Main AxiomAudit; do
  compile "P4OccurrenceClosure.Kalmanson.$module"
done

echo "== simultaneous import smoke"
compile "P4OccurrenceClosure.Smoke"

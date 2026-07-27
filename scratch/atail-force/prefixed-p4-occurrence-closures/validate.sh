#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
TASK_DIR="../scratch/atail-force/prefixed-p4-occurrence-closures"
OUTPUT_DIR="$ROOT_DIR/scratch/run-tmp/prefixed-p4-occurrence-closures-olean-427"

: "${TMPDIR:?set TMPDIR to the repository scratch/run-tmp directory}"
mkdir -p "$TMPDIR" "$OUTPUT_DIR"

UV_CACHE_DIR="$ROOT_DIR/scratch/run-tmp/uv-cache" uv run --no-project python \
  "$ROOT_DIR/scratch/atail-force/prefixed-p4-occurrence-closures/materialize_prefixed_closures.py" \
    --check

BASE_LEAN_PATH="../scratch/atail-force/unique4-p4-source-bridge/olean-427:../scratch/atail-force/unique4-p4-direct-outer-occurrence-bridge/olean-427:../scratch/atail-force/unique4-exact-two-source-bridge/OccurrenceBridge:../scratch/atail-force/unique4-exact-two-occurrence:../scratch/atail-force/unique4-exact-two-source-bridge/MirrorSchema58:../scratch/atail-force/unique4-exact-two-schema-decoder:../scratch/atail-force/unique4-kalmanson-core-port:../scratch/atail-force/unique4-aligned-p5-occurrence:../scratch/atail-force/unique4-n11-source-lift:../scratch/atail-force/unique4-class-cap-distribution:../scratch/atail-force/unique-arm-route-audit:../scratch/atail-force/unique-row-producer:../scratch/atail-force/unique4-source-field-audit:../scratch/atail-force/unique4-kalmanson-occurrence:../scratch/atail-force/unique4-exact-two-source-bridge/IndexedSource"

compile_module() {
  local prefix=$1
  local module=$2
  local source="$TASK_DIR/$prefix/$module.lean"
  local output="$OUTPUT_DIR/$prefix/$module.olean"
  local log="$OUTPUT_DIR/$prefix/$module.log"
  mkdir -p "$(dirname "$output")"
  if ! LEAN_PATH="$OUTPUT_DIR:$BASE_LEAN_PATH" \
    "$ROOT_DIR/scripts/lean427" lake env lean -M16384 -DwarningAsError=true \
      -R "$TASK_DIR" -o "$output" "$source" >"$log" 2>&1; then
    tail -40 "$log"
    return 1
  fi
}

compile_closure() {
  local prefix=$1
  local source_dir="$ROOT_DIR/scratch/atail-force/prefixed-p4-occurrence-closures/$prefix"
  local chunk

  compile_module "$prefix" Core
  compile_module "$prefix" Families
  while IFS= read -r chunk; do
    compile_module "$prefix" "$(basename "$chunk" .lean)"
  done < <(find "$source_dir" -maxdepth 1 -name 'BridgeChunk*.lean' | sort)
  compile_module "$prefix" BridgeAll
  compile_module "$prefix" Main
  if [[ -f "$source_dir/Orientation.lean" ]]; then
    compile_module "$prefix" Orientation
  fi
  compile_module "$prefix" AxiomAudit
}

compile_closure P4RadiusPartitionOccurrenceBridge
compile_closure P4RowAtLeastFourOccurrenceBridge
compile_closure P4RowRadiusOccurrenceBridge

if ! LEAN_PATH="$OUTPUT_DIR:$BASE_LEAN_PATH" \
  "$ROOT_DIR/scripts/lean427" lake env lean -M16384 -DwarningAsError=true \
    -R "$TASK_DIR" -o "$OUTPUT_DIR/AllThreeSmoke.olean" \
    "$TASK_DIR/AllThreeSmoke.lean" >"$OUTPUT_DIR/AllThreeSmoke.log" 2>&1; then
  tail -40 "$OUTPUT_DIR/AllThreeSmoke.log"
  exit 1
fi

printf 'compiled 3 prefixed closures and AllThreeSmoke.lean\n'

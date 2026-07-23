#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"
LEAN_ROOT="$ROOT/lean"
LOCKFILE="$LEAN_ROOT/.lake/lake-build.lock"
TASK_DIR="../scratch/atail-force/unique4-exact-two-source-bridge/OccurrenceBridge"

acquire_lock() {
  while true; do
    if (set -o noclobber; printf '%s\n' "$$" >"$LOCKFILE") 2>/dev/null; then
      return 0
    fi
    if IFS= read -r lock_pid <"$LOCKFILE" && [[ "$lock_pid" =~ ^[0-9]+$ ]] &&
        kill -0 "$lock_pid" 2>/dev/null; then
      echo "another Lean build is already running (pid $lock_pid): $LOCKFILE" >&2
      exit 1
    fi
    rm -f "$LOCKFILE"
  done
}

LOCK_ACQUIRED=0
cleanup() {
  if [[ "$LOCK_ACQUIRED" == "1" ]]; then
    rm -f "$LOCKFILE"
  fi
}
trap cleanup EXIT INT TERM HUP

acquire_lock
LOCK_ACQUIRED=1

cd "$LEAN_ROOT"

# RetainedKalmansonDecoder/ExactTwoSchemaDecoder/MissingRetainedOrientations
# oleans live in MirrorSchema58; the Kalmanson source dir is intentionally
# NOT on the path (it holds sources without oleans).
TASK_LEAN_PATH="${TASK_DIR}:\
../scratch/atail-force/unique4-exact-two-source-bridge/IndexedSource:\
../scratch/atail-force/unique4-exact-two-source-bridge/MirrorSchema58:\
../scratch/atail-force/unique4-exact-two-occurrence:\
../scratch/atail-force/unique4-exact-two-schema-decoder:\
../scratch/atail-force/unique4-kalmanson-core-port:\
../scratch/atail-force/unique4-aligned-p5-occurrence:\
../scratch/atail-force/unique4-n11-source-lift:\
../scratch/atail-force/unique4-class-cap-distribution:\
../scratch/atail-force/unique-arm-route-audit:\
../scratch/atail-force/unique-row-producer:\
../scratch/atail-force/unique4-source-field-audit:\
../scratch/atail-force/unique4-kalmanson-occurrence"

DEFAULT_MODULES="BridgeCore BridgeFamilies \
    BridgeChunk01 BridgeChunk02 BridgeChunk03 BridgeChunk04 BridgeChunk05 BridgeChunk06 BridgeChunk07 BridgeChunk08 BridgeChunk09 BridgeChunk10 BridgeChunk11 BridgeChunk12 BridgeChunk13 BridgeChunk14 BridgeChunk15 BridgeChunk16 BridgeChunk17 BridgeChunk18 BridgeChunk19 BridgeChunk20 BridgeChunk21 BridgeChunk22 BridgeChunk23 BridgeChunk24 BridgeChunk25 BridgeChunk26 BridgeChunk27 BridgeChunk28 BridgeChunk29 BridgeChunk30 BridgeChunk31 BridgeChunk32 BridgeChunk33 BridgeChunk34 BridgeChunk35 BridgeChunk36 BridgeChunk37 BridgeChunk38 BridgeChunk39 BridgeChunk40 \
    BridgeChunkAll BridgeMain"
MODULES="${*:-$DEFAULT_MODULES}"

for module in $MODULES; do
  echo "== $module"
  LEAN_PATH="$TASK_LEAN_PATH" lake env lean -M16384 -DwarningAsError=true \
    -R "$TASK_DIR" \
    -o "$TASK_DIR/$module.olean" \
    "$TASK_DIR/$module.lean"
done

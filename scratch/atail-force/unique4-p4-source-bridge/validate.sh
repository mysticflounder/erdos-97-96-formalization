#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
LEAN_ROOT="$ROOT/lean"
LOCKFILE="$LEAN_ROOT/.lake/lake-build.lock"
TASK_DIR="../scratch/atail-force/unique4-p4-source-bridge"
GENERATED_DIR="$TASK_DIR/generated/p4-direct-row-arc-finite"
INDEXED_SOURCE_DIR="../scratch/atail-force/unique4-exact-two-source-bridge/IndexedSource"
MODULE_DIR="$(mktemp -d "${TMPDIR:-/tmp}/p4-direct-source-bridge.XXXXXX")"

acquire_lock() {
  while true; do
    if (set -o noclobber; printf '%s\n' "$$" >"$LOCKFILE") 2>/dev/null; then
      return 0
    fi
    if IFS= read -r lock_pid <"$LOCKFILE" &&
        [[ "$lock_pid" =~ ^[0-9]+$ ]] &&
        kill -0 "$lock_pid" 2>/dev/null; then
      echo "another Lean build is already running (pid $lock_pid): $LOCKFILE" >&2
      exit 1
    fi
    rm -f "$LOCKFILE"
  done
}

LOCK_ACQUIRED=0
cleanup() {
  rm -rf "$MODULE_DIR"
  if [[ "$LOCK_ACQUIRED" == "1" ]]; then
    rm -f "$LOCKFILE"
  fi
}
trap cleanup EXIT INT TERM HUP

echo "== generated package integrity"
python3 "$ROOT/scratch/atail-force/unique4-p4-source-bridge/\
materialize_p4_direct_row_arc_finite.py" --verify-only

acquire_lock
LOCK_ACQUIRED=1
cd "$LEAN_ROOT"

BASE_LEAN_PATH="../scratch/atail-force/unique4-exact-two-occurrence:\
../scratch/atail-force/unique4-exact-two-source-bridge/MirrorSchema58:\
../scratch/atail-force/unique4-exact-two-schema-decoder:\
../scratch/atail-force/unique4-kalmanson-core-port:\
../scratch/atail-force/unique4-aligned-p5-occurrence:\
../scratch/atail-force/unique4-n11-source-lift:\
../scratch/atail-force/unique4-class-cap-distribution:\
../scratch/atail-force/unique-arm-route-audit:\
../scratch/atail-force/unique-row-producer:\
../scratch/atail-force/unique4-source-field-audit:\
../scratch/atail-force/unique4-kalmanson-occurrence:\
$INDEXED_SOURCE_DIR"

echo "== SelectedFourClassCurvature"
LEAN_PATH="$BASE_LEAN_PATH" "$ROOT/scripts/lean427" lake env lean -M16384 -DwarningAsError=true \
  -R ../scratch/atail-force/unique4-selected-class-curvature-adapter \
  -o "$MODULE_DIR/SelectedFourClassCurvature.olean" \
  ../scratch/atail-force/unique4-selected-class-curvature-adapter/\
SelectedFourClassCurvature.lean

echo "== P5RetainedOuterArcMasks"
LEAN_PATH="$BASE_LEAN_PATH:$MODULE_DIR" "$ROOT/scripts/lean427" lake env lean -M16384 \
  -DwarningAsError=true \
  -R ../scratch/atail-force/unique4-exact-two-source-bridge/Curvature \
  -o "$MODULE_DIR/P5RetainedOuterArcMasks.olean" \
  ../scratch/atail-force/unique4-exact-two-source-bridge/Curvature/\
P5RetainedOuterArcMasks.lean

echo "== P4DirectOuterArcAdapter"
LEAN_PATH="$BASE_LEAN_PATH:$MODULE_DIR" "$ROOT/scripts/lean427" lake env lean -M16384 \
  -DwarningAsError=true \
  -R "$TASK_DIR" \
  -o "$MODULE_DIR/P4DirectOuterArcAdapter.olean" \
  "$TASK_DIR/P4DirectOuterArcAdapter.lean"

echo "== P4GenericFamilies"
LEAN_PATH="$BASE_LEAN_PATH:$MODULE_DIR" "$ROOT/scripts/lean427" lake env lean -M16384 \
  -DwarningAsError=true \
  -R "$TASK_DIR" \
  -o "$MODULE_DIR/P4GenericFamilies.olean" \
  "$TASK_DIR/P4GenericFamilies.lean"

echo "== P4DirectOuterArcFinite"
LEAN_PATH="$BASE_LEAN_PATH:$MODULE_DIR" "$ROOT/scripts/lean427" lake env lean -M16384 \
  -DwarningAsError=true \
  -R "$TASK_DIR" \
  -o "$MODULE_DIR/P4DirectOuterArcFinite.olean" \
  "$TASK_DIR/P4DirectOuterArcFinite.lean"

echo "== P4MirrorOuterArcTransport"
LEAN_PATH="$BASE_LEAN_PATH:$MODULE_DIR" "$ROOT/scripts/lean427" lake env lean -M16384 \
  -DwarningAsError=true \
  -R "$TASK_DIR" \
  -o "$MODULE_DIR/P4MirrorOuterArcTransport.olean" \
  "$TASK_DIR/P4MirrorOuterArcTransport.lean"

chunk_count=0
for chunk_source in "$GENERATED_DIR"/P4DirectOuterArcFiniteDataChunk*.lean; do
  chunk_module="${chunk_source##*/}"
  chunk_module="${chunk_module%.lean}"
  echo "== $chunk_module"
  LEAN_PATH="$BASE_LEAN_PATH:$MODULE_DIR" "$ROOT/scripts/lean427" lake env lean -M16384 \
    -DwarningAsError=true \
    -R "$GENERATED_DIR" \
    -o "$MODULE_DIR/$chunk_module.olean" \
    "$chunk_source"
  chunk_count=$((chunk_count + 1))
done

if [[ "$chunk_count" -ne 25 ]]; then
  echo "expected 25 generated chunks, found $chunk_count" >&2
  exit 1
fi

echo "== P4DirectOuterArcFiniteData"
LEAN_PATH="$BASE_LEAN_PATH:$MODULE_DIR" "$ROOT/scripts/lean427" lake env lean -M16384 \
  -DwarningAsError=true \
  -R "$GENERATED_DIR" \
  -o "$MODULE_DIR/P4DirectOuterArcFiniteData.olean" \
  "$GENERATED_DIR/P4DirectOuterArcFiniteData.lean"

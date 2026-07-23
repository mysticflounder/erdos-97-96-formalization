#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"
LEAN_ROOT="$ROOT/lean"
LOCKFILE="$LEAN_ROOT/.lake/lake-build.lock"
MODULE_DIR="/tmp/p5-exact-two-curvature-modules"

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
mkdir -p "$MODULE_DIR"

cd "$LEAN_ROOT"

BASE_LEAN_PATH="../scratch/atail-force/unique4-exact-two-occurrence:\
../scratch/atail-force/unique4-aligned-p5-occurrence:\
../scratch/atail-force/unique4-n11-source-lift:\
../scratch/atail-force/unique4-class-cap-distribution:\
../scratch/atail-force/unique-arm-route-audit:\
../scratch/atail-force/unique-row-producer"

LEAN_PATH="$BASE_LEAN_PATH" lake env lean -M16384 -DwarningAsError=true \
  -R ../scratch/atail-force/unique4-selected-class-curvature-adapter \
  -o "$MODULE_DIR/SelectedFourClassCurvature.olean" \
  ../scratch/atail-force/unique4-selected-class-curvature-adapter/\
SelectedFourClassCurvature.lean

LEAN_PATH="$BASE_LEAN_PATH:$MODULE_DIR" lake env lean -M16384 \
  -DwarningAsError=true \
  -R ../scratch/atail-force/unique4-exact-two-source-bridge/Curvature \
  ../scratch/atail-force/unique4-exact-two-source-bridge/Curvature/\
P5RetainedOuterArcMasks.lean

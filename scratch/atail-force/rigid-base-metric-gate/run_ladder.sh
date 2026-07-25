#!/usr/bin/env bash
# Relaxation ladder for the rigid-base (6,6,6) gate.
#
# Each rung imposes the K4 selected-row hypothesis at a subset of the 15
# centers; the robustness structure at apices 0 and 5 is always present.
# Dropping centers is a sound relaxation, so UNSAT on any rung transfers upward
# to the full problem.  SAT on a rung transfers nowhere.
#
# Usage: run_ladder.sh <per-solve-timeout-ms> <with|without>
#   with    -- include the one-sided cap-distance injectivity layer
#   without -- omit it (triangle + Kalmanson + incidence only)
set -u
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$HERE/../../.." && pwd)"
TIMEOUT_MS="${1:-300000}"
CAPINJ="${2:-with}"
WALL=$(( TIMEOUT_MS / 1000 + 120 ))

EXTRA=()
SUFFIX="capinj"
if [ "$CAPINJ" = "without" ]; then
  EXTRA=(--no-cap-injectivity)
  SUFFIX="nocapinj"
fi

for RUNG in none apex3 apex3+opp0 apex3+opp0+opp5 interiors all; do
  SAFE="${RUNG//+/_}"
  OUT="$HERE/relax_${SUFFIX}_${SAFE}.json"
  echo "=== rung ${RUNG} (${SUFFIX}, per-solve ${TIMEOUT_MS} ms) ==="
  timeout "${WALL}" uv run --project "$ROOT" python "$HERE/rigid_base_gate.py" \
    --mode integrated \
    --row-centers "$RUNG" \
    "${EXTRA[@]}" \
    --metric-timeout-ms "$TIMEOUT_MS" \
    --output "$OUT" 2>&1 | tail -2
done

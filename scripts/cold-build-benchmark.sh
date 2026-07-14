#!/usr/bin/env bash
# Timed cold build of the Erdos9796 workspace libraries, for measuring what
# an external reproducer pays. Cleans ONLY the workspace package's build
# artifacts; dependency oleans (mathlib etc.) come from `lake exe cache get`.
#
# Usage:
#   ./scripts/cold-build-benchmark.sh                # baseline
#   ELAB_ASYNC=1 ./scripts/cold-build-benchmark.sh   # + parallel elaboration
#   JOBS=8 ./scripts/cold-build-benchmark.sh         # cap lake parallelism
#
# Output: scripts/../benchmarks/cold-build-<timestamp>.log (full lake log)
# and a printed summary (wall time, slowest modules).
#
# NOTE (RAM): before the grobner-certificate refactor, a few P97/Census554
# modules have multi-GB elaboration peaks; on <32 GB machines expect swapping
# there. That behavior is itself a benchmark datum — please note it.

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LEAN_ROOT="$ROOT/lean"
OUT_DIR="$ROOT/benchmarks"
mkdir -p "$OUT_DIR"
STAMP="$(date +%Y%m%d-%H%M%S)"
LOG="$OUT_DIR/cold-build-$STAMP.log"

cd "$LEAN_ROOT"

echo "=== machine ==="                                   | tee "$LOG"
sysctl -n machdep.cpu.brand_string 2>/dev/null           | tee -a "$LOG" || true
echo "cores: $(sysctl -n hw.ncpu 2>/dev/null)"           | tee -a "$LOG"
echo "ram bytes: $(sysctl -n hw.memsize 2>/dev/null)"    | tee -a "$LOG"
echo "toolchain: $(cat lean-toolchain)"                  | tee -a "$LOG"
echo "commit: $(git -C "$ROOT" rev-parse --short HEAD)"  | tee -a "$LOG"
echo "elab_async: ${ELAB_ASYNC:-0}  jobs: ${JOBS:-default}" | tee -a "$LOG"

restore_lakefile() { git -C "$ROOT" checkout -- lean/lakefile.toml; }
if [[ "${ELAB_ASYNC:-0}" == "1" ]]; then
  if ! git -C "$ROOT" diff --quiet -- lean/lakefile.toml; then
    echo "lakefile.toml is dirty; refusing to edit it for ELAB_ASYNC" >&2
    exit 1
  fi
  trap restore_lakefile EXIT
  # same dotted-key style as the existing pp.unicode.fun entry
  sed -i '' 's/^\[leanOptions\]$/[leanOptions]\nElab.async = true/' lakefile.toml
  echo "enabled Elab.async = true (lakefile restored on exit)" | tee -a "$LOG"
fi

echo "=== fetching mathlib cache ===" | tee -a "$LOG"
lake exe cache get >>"$LOG" 2>&1

echo "=== cleaning workspace build artifacts ===" | tee -a "$LOG"
rm -rf .lake/build

JOBS_ARG=()
[[ -n "${JOBS:-}" ]] && JOBS_ARG=(-j "$JOBS")

echo "=== building (default targets) ===" | tee -a "$LOG"
T0=$(date +%s)
lake build "${JOBS_ARG[@]}" >>"$LOG" 2>&1 && STATUS=ok || STATUS=FAILED
T1=$(date +%s)

echo "=== summary ==="
echo "status: $STATUS"
echo "wall seconds: $((T1 - T0))"
echo "log: $LOG"
echo "slowest modules:"
grep -oE "Built [A-Za-z0-9._]+ \([0-9.]+s\)" "$LOG" \
  | sed -E 's/Built ([A-Za-z0-9._]+) \(([0-9.]+)s\)/\2 \1/' \
  | sort -rn | head -30
{
  echo "=== summary ==="
  echo "status: $STATUS  wall_seconds: $((T1 - T0))"
} >>"$LOG"
[[ "$STATUS" == ok ]]

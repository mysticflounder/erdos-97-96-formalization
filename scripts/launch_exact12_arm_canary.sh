#!/usr/bin/env bash
# Launch one immutable exact-12 arm-static canary via PIQD from an
# exact-SHA detached worktree.  The canary creates the workdir itself
# (required mode 0700) and refuses a dirty or wrong-mode target.
#
# Usage:
#   scripts/launch_exact12_arm_canary.sh [WORKTREE] [WORKDIR] [TIMEOUT_SECONDS]
#
# Defaults target the v24 run at commit 5fc7ade0.
set -euo pipefail

REPO="/Users/adam/projects/math-projects/erdos-97-96-formalization"
WORKTREE="${1:-$REPO/scratch/rigid221-sourceheavy-anchor/exact-sha-worktrees/5fc7ade0}"
WORKDIR="${2:-$REPO/scratch/arm-static-cell6-v24-live-5fc7ade0-20260815}"
TIMEOUT="${3:-3600}"

cd "$WORKTREE"
exec "$REPO/.venv/bin/python" -m census.card_head.exact12_next_row_arm_static_canary \
  --repo-root "$WORKTREE" \
  --workdir "$WORKDIR" \
  --timeout-seconds "$TIMEOUT"

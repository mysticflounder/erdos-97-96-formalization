#!/usr/bin/env bash
# Launch one immutable exact-12 arm-static canary via PIQD from an
# exact-SHA detached worktree.  The canary creates the workdir itself
# (required mode 0700) and refuses a dirty or wrong-mode target.
#
# Usage:
#   scripts/launch_exact12_arm_canary.sh WORKTREE WORKDIR [TIMEOUT_SECONDS]
#
# WORKTREE and WORKDIR are required.  Each wave uses its own commit, so
# there is no safe default; a stale default silently launches the wrong
# source revision.  The exact-SHA worktree is created on demand and is
# removed again once its wave is frozen:
#
#   git worktree add --detach \
#     scratch/rigid221-sourceheavy-anchor/exact-sha-worktrees/<sha> <sha>
#
# Past waves: v24 ran at commit 5fc7ade0, v25 at commit 898fbd78.
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "usage: $0 WORKTREE WORKDIR [TIMEOUT_SECONDS]" >&2
  exit 2
fi

REPO="/Users/adam/projects/math-projects/erdos-97-96-formalization"
WORKTREE="$1"
WORKDIR="$2"
TIMEOUT="${3:-3600}"

if [ ! -d "$WORKTREE" ]; then
  echo "worktree does not exist: $WORKTREE" >&2
  echo "create it with: git worktree add --detach $WORKTREE <sha>" >&2
  exit 2
fi

cd "$WORKTREE"
exec "$REPO/.venv/bin/python" -m census.card_head.exact12_next_row_arm_static_canary \
  --repo-root "$WORKTREE" \
  --workdir "$WORKDIR" \
  --timeout-seconds "$TIMEOUT"

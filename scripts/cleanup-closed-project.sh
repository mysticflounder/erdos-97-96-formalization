#!/usr/bin/env bash
# Delete generated data, build output, caches, and worktree folders left on
# disk after the project closed (2026-09-13). The tracked banks were already
# removed from the tree in commit 963bec743; git history keeps them.
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

echo "Disk usage before: $(du -sh . | cut -f1)"

# Untracked and ignored files under census/ (solver data, __pycache__, outputs).
# Tracked .py and .md sources stay.
git clean -fdx -- census

# Some sealed run artifacts in scratch/ are read-only; restore owner write so
# rm can remove them.
if [ -d scratch ]; then
  chmod -R u+w scratch
fi

rm -rf \
  scratch \
  certificates \
  attic \
  lean/.lake \
  data \
  .worktrees \
  .claude/worktrees \
  prove2me/scratch \
  .venv \
  .ruff_cache \
  .pytest_cache \
  .uv-cache \
  .uv-cache-v5 \
  .uv-cache-exact17-audit \
  .scratch-uv-cache \
  ../.audit-worktrees

git worktree prune

echo "Disk usage after: $(du -sh . | cut -f1)"
echo "Remaining ignored paths (dry run):"
git clean -ndX

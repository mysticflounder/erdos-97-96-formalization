#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

export UV_NO_CACHE=1
export PYTHONPATH="$ROOT${PYTHONPATH:+:$PYTHONPATH}"
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export RAYON_NUM_THREADS=1

PYTHON_FILES=(
  scripts/check_worktree_hygiene.py
  census/p97_search/tests/test_worktree_hygiene.py
)

uv run --with pytest pytest -q \
  census/p97_search/tests/test_worktree_hygiene.py

uv run --with ruff ruff check "${PYTHON_FILES[@]}"
uv run --with ruff ruff format --check "${PYTHON_FILES[@]}"

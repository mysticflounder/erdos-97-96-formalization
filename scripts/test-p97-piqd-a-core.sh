#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

# Keep all tool state inside the worktree and keep computational concurrency at
# one worker/thread while other solver lanes are active.
export UV_CACHE_DIR="$ROOT/.uv-cache"
export PYTHONPATH="$ROOT${PYTHONPATH:+:$PYTHONPATH}"
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export RAYON_NUM_THREADS=1

PYTHON_FILES=(
  census/p97_search/phase3_piqd_a_core_package.py
  census/p97_search/phase3_piqd_a_core_adapter.py
  census/p97_search/tests/test_phase3_piqd_a_core_package.py
  census/p97_search/tests/test_phase3_piqd_a_core_adapter.py
)

uv run --with pytest --with pytest-xdist pytest -q -n 1 \
  census/p97_search/tests/test_phase3_piqd_a_core_package.py \
  census/p97_search/tests/test_phase3_piqd_a_core_adapter.py

uv run --with ruff ruff check "${PYTHON_FILES[@]}"
uv run --with ruff ruff format --check "${PYTHON_FILES[@]}"

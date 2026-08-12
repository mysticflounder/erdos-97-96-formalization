#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

export UV_CACHE_DIR="$ROOT/.uv-cache"
export PYTHONPATH="$ROOT${PYTHONPATH:+:$PYTHONPATH}"
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export RAYON_NUM_THREADS=1
export PYTHONHASHSEED=0
export PYTEST_DISABLE_PLUGIN_AUTOLOAD=1

uv run ruff check \
  census/card_head/piqd_frontier_package.py \
  census/card_head/tests/test_piqd_frontier_package.py
uv run ruff format --check \
  census/card_head/piqd_frontier_package.py \
  census/card_head/tests/test_piqd_frontier_package.py
uv run pytest -q census/card_head/tests/test_piqd_frontier_package.py

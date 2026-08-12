#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

export UV_CACHE_DIR="$ROOT/.uv-cache"
export PYTHONPATH="$ROOT${PYTHONPATH:+:$PYTHONPATH}"
export PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export RAYON_NUM_THREADS=1

PYTHON_FILES=(
  census/card_head/piqd_frontier_bc.py
  census/card_head/tests/test_piqd_frontier_bc.py
  census/frontier-packages/b_core/run.py
  census/frontier-packages/b_core/smoke.py
  census/frontier-packages/c_core/run.py
  census/frontier-packages/c_core/smoke.py
)

uv run python -m py_compile "${PYTHON_FILES[@]}"
uv run pytest -q census/card_head/tests/test_piqd_frontier_bc.py
uv run --with ruff ruff check --select I,RUF022 "${PYTHON_FILES[@]}"

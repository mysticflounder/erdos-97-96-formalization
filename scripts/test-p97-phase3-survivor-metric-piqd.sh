#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

export UV_CACHE_DIR="$ROOT/scratch/uv-cache"
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export RAYON_NUM_THREADS=1
export UV_THREADPOOL_SIZE=1
export PYTHONHASHSEED=0
export PYTHONDONTWRITEBYTECODE=1
export PYTHONPATH="$ROOT${PYTHONPATH:+:$PYTHONPATH}"

PYTHON_FILES=(
  census/p97_search/phase3_survivor_metric_driver.py
  census/p97_search/phase3_survivor_metric_piqd.py
  census/p97_search/tests/test_phase3_survivor_metric_piqd.py
  census/p97_search/tests/test_phase3_survivor_metric_driver.py
)

# One sequential pytest process; the current-schema fake never contacts PIQD
# or invokes a local solver. This also exercises the bounded case/order CLI
# selector through the injected, one-worker driver route. Ruff lint and format
# are separate read-only gates.
uv run --with pytest pytest -q \
  census/p97_search/tests/test_phase3_survivor_metric_piqd.py \
  census/p97_search/tests/test_phase3_survivor_metric_driver.py

uv run --with ruff ruff check "${PYTHON_FILES[@]}"
uv run --with ruff ruff format --check "${PYTHON_FILES[@]}"

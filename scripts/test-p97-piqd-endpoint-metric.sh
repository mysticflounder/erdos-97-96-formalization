#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

export UV_CACHE_DIR="$ROOT/scratch/uv-cache"
export PYTHONPATH="$ROOT${PYTHONPATH:+:$PYTHONPATH}"
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export RAYON_NUM_THREADS=1
export UV_THREADPOOL_SIZE=1
export PYTHONHASHSEED=0
export PYTHONDONTWRITEBYTECODE=1

PYTHON_FILES=(
  census/endpoint_confinement/metric_realizability_piqd.py
  census/endpoint_confinement/metric_realizability_probe.py
  census/endpoint_confinement/test_metric_realizability_piqd.py
)

FORMATTED_FILES=(
  census/endpoint_confinement/metric_realizability_piqd.py
  census/endpoint_confinement/test_metric_realizability_piqd.py
)

# One sequential pytest process; authenticated fixture-pin, fake production,
# prefilter, and offline publication checks never contact PIQD or Z3.
uv run --with pytest pytest -q \
  census/endpoint_confinement/test_metric_realizability_piqd.py

# The three ignored findings predate this adapter in the legacy producer body.
uv run --with ruff ruff check --ignore TRY004,B023,UP017 "${PYTHON_FILES[@]}"
uv run --with ruff ruff format --check "${FORMATTED_FILES[@]}"

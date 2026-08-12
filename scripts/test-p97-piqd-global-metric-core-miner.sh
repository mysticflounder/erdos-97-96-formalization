#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT"

export PYTHONPATH="$REPO_ROOT"
export UV_THREADPOOL_SIZE=1
export RAYON_NUM_THREADS=1
export BLIS_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export NUMEXPR_NUM_THREADS=1

FILES=(
  census/global_confinement/metric_realizability_cvc5_core_miner.py
  census/global_confinement/metric_realizability_piqd_core_miner.py
  census/global_confinement/tests/test_metric_realizability_piqd_core_miner.py
)

uv run pytest -q \
  census/global_confinement/tests/test_metric_realizability_piqd_core_miner.py
uv run --with ruff ruff check "${FILES[@]}"
uv run --with ruff ruff format --check "${FILES[@]}"

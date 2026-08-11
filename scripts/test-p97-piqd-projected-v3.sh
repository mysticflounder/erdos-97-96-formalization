#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

export PYTHONPATH=.
export OPENBLAS_NUM_THREADS=1
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export RAYON_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1

PYTHON_FILES=(
  scripts/run-p97-piqd-projected-v3-canary.py
  census/p97_search/phase3_piqd_incremental_discovery.py
  census/p97_search/phase3_piqd_projected_v3_qualification.py
  census/p97_search/phase3_piqd_incremental_v3.py
  census/p97_search/tests/test_phase3_piqd_incremental_discovery.py
  census/p97_search/tests/test_phase3_piqd_projected_v3_canary.py
  census/p97_search/tests/test_phase3_piqd_projected_v3_qualification.py
  census/p97_search/tests/test_phase3_piqd_incremental_v3.py
)

uv run --with pytest pytest -q -p no:xdist \
  census/p97_search/tests/test_phase3_piqd_incremental_discovery.py \
  census/p97_search/tests/test_phase3_piqd_projected_v3_canary.py \
  census/p97_search/tests/test_phase3_piqd_projected_v3_qualification.py \
  census/p97_search/tests/test_phase3_piqd_incremental_v3.py
uv run --with ruff ruff check "${PYTHON_FILES[@]}"
uv run --with ruff ruff format --check "${PYTHON_FILES[@]}"

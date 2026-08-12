#!/usr/bin/env bash
set -euo pipefail

export OPENBLAS_NUM_THREADS=1
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export PYTHONPATH=.

uv run ruff check \
  census/p97_search/a_core_metric_driver.py \
  census/p97_search/a_core_metric_piqd.py \
  census/p97_search/tests/test_a_core_metric_piqd.py
uv run pytest -q -p no:xdist \
  census/p97_search/tests/test_a_core_metric_piqd.py

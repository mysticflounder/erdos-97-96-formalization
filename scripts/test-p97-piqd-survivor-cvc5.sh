#!/usr/bin/env bash
set -euo pipefail

export OPENBLAS_NUM_THREADS=1
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export BLIS_NUM_THREADS=1
export RAYON_NUM_THREADS=1
export TOKIO_WORKER_THREADS=1
export PYTHONHASHSEED=0
export UV_CONCURRENT_BUILDS=1
export UV_CONCURRENT_DOWNLOADS=1
export UV_CONCURRENT_INSTALLS=1
export UV_CACHE_DIR="${UV_CACHE_DIR:-scratch/.uv-cache}"

PYTHONPATH=. uv run --with pytest pytest -q \
  census/p97_search/tests/test_phase3_piqd_smt_source_adapter.py \
  census/p97_search/tests/test_phase3_piqd_survivor_cvc5.py \
  census/p97_search/tests/test_phase3_survivor_cvc5_driver.py \
  census/p97_search/tests/test_phase3_piqd_survivor_cvc5_canary.py

PYTHONPATH=. uv run --with ruff ruff check \
  census/p97_search/phase3_piqd_smt_source_adapter.py \
  census/p97_search/tests/test_phase3_piqd_smt_source_adapter.py \
  census/p97_search/phase3_survivor_cvc5_driver.py \
  census/p97_search/phase3_piqd_survivor_cvc5.py \
  census/p97_search/tests/test_phase3_piqd_survivor_cvc5.py \
  census/p97_search/tests/test_phase3_survivor_cvc5_driver.py \
  scripts/run-p97-piqd-survivor-cvc5-canary.py \
  census/p97_search/tests/test_phase3_piqd_survivor_cvc5_canary.py

PYTHONPATH=. uv run --with ruff ruff format --check \
  census/p97_search/phase3_piqd_smt_source_adapter.py \
  census/p97_search/tests/test_phase3_piqd_smt_source_adapter.py \
  census/p97_search/phase3_survivor_cvc5_driver.py \
  census/p97_search/phase3_piqd_survivor_cvc5.py \
  census/p97_search/tests/test_phase3_piqd_survivor_cvc5.py \
  census/p97_search/tests/test_phase3_survivor_cvc5_driver.py \
  scripts/run-p97-piqd-survivor-cvc5-canary.py \
  census/p97_search/tests/test_phase3_piqd_survivor_cvc5_canary.py

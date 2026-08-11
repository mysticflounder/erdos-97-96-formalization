#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

export OPENBLAS_NUM_THREADS=1
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export BLIS_NUM_THREADS=1
export GOTO_NUM_THREADS=1
export JULIA_NUM_THREADS=1
export GOMAXPROCS=1
export RAYON_NUM_THREADS=1
export TOKIO_WORKER_THREADS=1
export PYTHONHASHSEED=0
export UV_CONCURRENT_BUILDS=1
export UV_CONCURRENT_DOWNLOADS=1
export UV_CONCURRENT_INSTALLS=1
export UV_CACHE_DIR="${UV_CACHE_DIR:-scratch/.uv-cache}"

if [[ -x .venv/bin/pytest && -x .venv/bin/ruff ]]; then
  PYTEST=(.venv/bin/pytest)
  RUFF=(.venv/bin/ruff)
else
  PYTEST=(uv run --with pytest pytest)
  RUFF=(uv run --with ruff ruff)
fi

PYTHONPATH=. "${PYTEST[@]}" -q -p no:xdist \
  census/p97_search/tests/test_phase3_piqd_smt_source_adapter.py \
  census/global_confinement/tests/test_metric_realizability_piqd_cvc5.py

PYTHONPATH=. "${RUFF[@]}" check \
  census/p97_search/phase3_piqd_smt_source_adapter.py \
  census/p97_search/tests/test_phase3_piqd_smt_source_adapter.py \
  census/global_confinement/metric_realizability_piqd_cvc5.py \
  census/global_confinement/tests/test_metric_realizability_piqd_cvc5.py

PYTHONPATH=. "${RUFF[@]}" format --check \
  census/p97_search/phase3_piqd_smt_source_adapter.py \
  census/p97_search/tests/test_phase3_piqd_smt_source_adapter.py \
  census/global_confinement/metric_realizability_piqd_cvc5.py \
  census/global_confinement/tests/test_metric_realizability_piqd_cvc5.py

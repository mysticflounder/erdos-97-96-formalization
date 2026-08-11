#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export BLIS_NUM_THREADS=1
export RAYON_NUM_THREADS=1
export PYTHONHASHSEED=0

uv run pytest -q census/atail_force/tests/test_piqd_cvc5_adapter.py
uv run --with ruff ruff check \
  census/atail_force/piqd_cvc5_adapter.py \
  census/atail_force/tests/test_piqd_cvc5_adapter.py
uv run --with ruff ruff format --check \
  census/atail_force/piqd_cvc5_adapter.py \
  census/atail_force/tests/test_piqd_cvc5_adapter.py

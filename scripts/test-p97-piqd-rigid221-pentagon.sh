#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "${script_dir}/.." && pwd)"
cd "${repo_root}"

export OPENBLAS_NUM_THREADS=1
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export RAYON_NUM_THREADS=1
export PYTHONDONTWRITEBYTECODE=1

uv run --with ruff ruff format --check \
  census/rigid221_pentagon_oracle.py \
  census/rigid221_pentagon_piqd.py \
  census/test_rigid221_pentagon_piqd.py
uv run --with ruff ruff check \
  census/rigid221_pentagon_oracle.py \
  census/rigid221_pentagon_piqd.py \
  census/test_rigid221_pentagon_piqd.py
uv run pytest -q -p no:cacheprovider census/test_rigid221_pentagon_piqd.py

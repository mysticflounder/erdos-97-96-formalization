#!/usr/bin/env bash
set -euo pipefail

repo_root="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
cd "$repo_root"

export PYTHONPATH="$repo_root"
export UV_CACHE_DIR="$repo_root/.uv-cache"
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export RAYON_NUM_THREADS=1

uv run --with pytest pytest -q \
  census/p97_search/tests/test_phase3_piqd_theorem_bank_migration.py
uv run --with ruff ruff check \
  census/p97_search/phase3_piqd_theorem_bank_migration.py \
  census/p97_search/tests/test_phase3_piqd_theorem_bank_migration.py
uv run --with ruff ruff format --check \
  census/p97_search/phase3_piqd_theorem_bank_migration.py \
  census/p97_search/tests/test_phase3_piqd_theorem_bank_migration.py

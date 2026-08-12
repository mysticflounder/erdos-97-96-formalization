#!/usr/bin/env bash
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
set -euo pipefail

export PYTHONDONTWRITEBYTECODE=1
export OPENBLAS_NUM_THREADS=1
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export UV_THREADPOOL_SIZE=1
export UV_CACHE_DIR="${UV_CACHE_DIR:-scratch/uv-cache-pinned-generalm}"

uv run --with pytest pytest -q -p no:xdist \
  census/global_confinement/tests/test_pinned_generalm_piqd.py
uv run --with ruff ruff check \
  census/global_confinement/pinned_generalm_piqd.py \
  census/global_confinement/tests/test_pinned_generalm_piqd.py \
  scripts/pinned-generalm-certificate-coverage.py
uv run --with ruff ruff format --check \
  census/global_confinement/pinned_generalm_piqd.py \
  census/global_confinement/tests/test_pinned_generalm_piqd.py \
  scripts/pinned-generalm-certificate-coverage.py

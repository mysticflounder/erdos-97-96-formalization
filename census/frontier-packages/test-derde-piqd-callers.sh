#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "${repo_root}"

export UV_CACHE_DIR="${repo_root}/.uv-cache"
export UV_THREADPOOL_SIZE=1
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export PYTEST_DISABLE_PLUGIN_AUTOLOAD=1

exec uv run pytest -q census/card_head/tests/test_frontier_derde_piqd_callers.py

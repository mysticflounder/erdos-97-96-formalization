#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT"

# This lane and its fake daemon are intentionally single-worker. Keep native
# libraries from adding hidden worker pools while the broader solver census is
# active.
export PYTHONPATH="$REPO_ROOT${PYTHONPATH:+:$PYTHONPATH}"
export PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
export UV_CACHE_DIR="$REPO_ROOT/.uv-cache"
export UV_THREADPOOL_SIZE=1
export RAYON_NUM_THREADS=1
export BLIS_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export NUMEXPR_NUM_THREADS=1

FILES=(
  census/global_confinement/piqd_singular_backend.py
  census/global_confinement/tests/test_piqd_singular_backend.py
)
CAP_SECONDS=120

run_capped() {
  perl -e 'alarm shift; exec @ARGV or die "exec: $!\n"' "$CAP_SECONDS" "$@"
}

run_capped uv run --with pytest pytest -q \
  census/global_confinement/tests/test_piqd_singular_backend.py
run_capped uv run --with ruff ruff check "${FILES[@]}"
run_capped uv run --with ruff ruff format --check "${FILES[@]}"

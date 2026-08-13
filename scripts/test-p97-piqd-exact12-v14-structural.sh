#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

# This gate is intentionally offline and capped: no daemon, solver, Lean, or
# parallel worker is permitted while checking the PIQD boundary.
export PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
export PYTHONDONTWRITEBYTECODE=1
export PYTHONHASHSEED=0
export PYTEST_ADDOPTS="-p no:xdist"
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export BLIS_NUM_THREADS=1
export RAYON_NUM_THREADS=1

uv run pytest -q census/card_head/tests/test_exact12_v14_structural_piqd.py
uv run python -m census.card_head.exact12_v14_structural_cegar --help >/dev/null

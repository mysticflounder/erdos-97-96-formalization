#!/usr/bin/env bash
# Copyright (c) 2026 Adam McKenna
# SPDX-License-Identifier: MIT
# Author: Adam McKenna

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

export UV_CACHE_DIR="$ROOT/.uv-cache"
export PYTHONPATH="$ROOT${PYTHONPATH:+:$PYTHONPATH}"
export PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export RAYON_NUM_THREADS=1

PYTHON_FILES=(
  census/p97_search/phase3_piqd_clause_map.py
  census/p97_search/tests/test_phase3_piqd_clause_map.py
  census/p97_search/phase3_piqd_card_head_adapter.py
  census/p97_search/tests/test_phase3_piqd_card_head_adapter.py
  census/card_head/piqd_certified_solver.py
  census/card_head/tests/test_piqd_certified_solver.py
)

# No xdist: exactly one pytest process and one worker.
uv run --with pytest pytest -q \
  census/p97_search/tests/test_phase3_piqd_clause_map.py \
  census/p97_search/tests/test_phase3_piqd_card_head_adapter.py \
  census/card_head/tests/test_piqd_certified_solver.py

uv run --with ruff ruff check "${PYTHON_FILES[@]}"
uv run --with ruff ruff format --check "${PYTHON_FILES[@]}"

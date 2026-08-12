#!/usr/bin/env bash
# Copyright (c) 2026 Adam McKenna
# SPDX-License-Identifier: MIT

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

export UV_CACHE_DIR="$ROOT/.uv-cache"
export PYTHONPATH="$ROOT${PYTHONPATH:+:$PYTHONPATH}"
export PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
export PYTHONHASHSEED=0
export UV_THREADPOOL_SIZE=1
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export BLIS_NUM_THREADS=1
export RAYON_NUM_THREADS=1

TEST_FILES=(
  census/p97_search/tests/test_phase3_piqd_clause_map.py
  census/p97_search/tests/test_phase3_piqd_card_head_adapter.py
  census/card_head/tests/test_piqd_certified_solver.py
  census/card_head/tests/test_piqd_frontier_package.py
  census/card_head/tests/test_piqd_frontier_bc.py
  census/card_head/tests/test_frontier_derde_piqd_callers.py
)

OWNED_PYTHON_FILES=(
  census/p97_search/phase3_piqd_clause_map.py
  census/p97_search/tests/test_phase3_piqd_clause_map.py
  census/p97_search/phase3_piqd_card_head_adapter.py
  census/p97_search/tests/test_phase3_piqd_card_head_adapter.py
  census/card_head/piqd_certified_solver.py
  census/card_head/tests/test_piqd_certified_solver.py
  census/card_head/piqd_frontier_package.py
  census/card_head/tests/test_piqd_frontier_package.py
  census/card_head/frontier_lane_piqd.py
  census/card_head/piqd_frontier_bc.py
  census/card_head/tests/test_piqd_frontier_bc.py
  census/card_head/tests/test_frontier_derde_piqd_callers.py
)

CALLER_FILES=(
  census/frontier-packages/b_core/run.py
  census/frontier-packages/b_core/smoke.py
  census/frontier-packages/c_core/run.py
  census/frontier-packages/c_core/smoke.py
  census/frontier-packages/de_core/run.py
  census/frontier-packages/de_core/smoke.py
  census/frontier-packages/dr_core/run.py
  census/frontier-packages/dr_core/smoke.py
  census/frontier-packages/e_core/run.py
  census/frontier-packages/e_core/smoke.py
)

# One pytest process and no xdist: the frontier checkpoint is intentionally
# single-worker even though every production query also receives a fresh job.
uv run --with pytest pytest -q "${TEST_FILES[@]}"
uv run python -m py_compile "${CALLER_FILES[@]}"
uv run --with ruff ruff check "${OWNED_PYTHON_FILES[@]}"
uv run --with ruff ruff format --check "${OWNED_PYTHON_FILES[@]}"
uv run --with ruff ruff check --select I,RUF022 "${CALLER_FILES[@]}"

bash -n \
  scripts/test-p97-piqd-certified-frontier.sh \
  scripts/test-p97-piqd-frontier-package.sh \
  scripts/test-p97-piqd-bc-core.sh \
  census/frontier-packages/test-derde-piqd-callers.sh

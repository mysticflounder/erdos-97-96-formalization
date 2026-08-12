#!/usr/bin/env bash
set -euo pipefail

ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$ROOT"

export PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
export PYTHONDONTWRITEBYTECODE=1
export PYTHONHASHSEED=0
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export UV_THREADPOOL_SIZE=1
export UV_CACHE_DIR="$ROOT/scratch/uv-cache"

uv run pytest -q \
  census/card_head/tests/test_exact12_next_row_arm_static_piqd.py \
  census/card_head/tests/test_exact12_next_row_arm_static_canary.py::Exact12NextRowArmStaticCanaryTests::test_job_and_required_artifacts_bind_new_family_fail_closed
uv run ruff check \
  census/card_head/exact12_next_row_arm_static_canary.py \
  census/card_head/exact12_next_row_arm_static_piqd.py \
  census/card_head/tests/test_exact12_next_row_arm_static_canary.py \
  census/card_head/tests/test_exact12_next_row_arm_static_piqd.py
uv run ruff format --check \
  census/card_head/exact12_next_row_arm_static_piqd.py \
  census/card_head/tests/test_exact12_next_row_arm_static_piqd.py

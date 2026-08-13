#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

# Keep the remaining-solver onboarding gate sequential. Each lane-local runner
# applies the same one-worker/thread caps and uses fake transports only.
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
export UV_THREADPOOL_SIZE=1
export UV_CACHE_DIR="${UV_CACHE_DIR:-$ROOT/scratch/uv-cache}"

./scripts/test-p97-piqd-atail-geometry.sh
./scripts/test-p97-piqd-exact12-next-row-arm-static.sh
uv run pytest -q \
  census/card_head/tests/test_exact12_next_row_arm_static_validator.py \
  census/card_head/tests/test_exact12_next_row_arm_static_v22_validator.py \
  census/card_head/tests/test_exact12_next_row_postwave.py \
  census/card_head/tests/test_exact12_next_row_arm_postwave.py \
  census/card_head/tests/test_exact12_next_row_structural_postwave.py
./scripts/test-p97-piqd-exact12-next-row-static.sh
./scripts/test-p97-piqd-exact12-v14-structural.sh
uv run pytest -q \
  census/card_head/tests/test_sat_encoding.py \
  census/card_head/tests/test_exact12_next_row_structural_cegar.py \
  census/card_head/tests/test_exact12_next_row_structural_piqd.py
uv run python scripts/run-exact12-next-row-structural-piqd.py --help >/dev/null
# This file includes the frozen-generator SHA guard, a fake persistent PIQD
# production run replayed by verify_production_run_artifacts, and the --check
# CLI dispatch test.  The help smoke and AST/hash checker remain offline.
uv run pytest -q \
  census/p97_search/tests/test_phase3_piqd_sat_generate_adapter.py
PYTHONPATH="$ROOT:$ROOT/census/p97_search" uv run python \
  -m census.p97_search.phase3_piqd_sat_generate_adapter --help >/dev/null
uv run python scripts/check_p97_sat_generate_piqd.py
./scripts/test-p97-piqd-global-metric-core-miner.sh
./scripts/test-p97-phase3-survivor-metric-piqd.sh
./scripts/test-p97-piqd-projected-v3.sh
./scripts/test-p97-a-core-metric-piqd.sh
./scripts/test-p97-piqd-pinned-generalm.sh
./scripts/test-p97-piqd-rigid221-pentagon.sh
./scripts/test-p97-piqd-singular-backend.sh
./scripts/test-p97-piqd-certified-frontier-all.sh

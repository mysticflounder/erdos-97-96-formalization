#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

export PYTHONPATH=.
export OPENBLAS_NUM_THREADS=1
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export RAYON_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export UV_CACHE_DIR="${UV_CACHE_DIR:-scratch/.uv-cache}"
export UV_CONCURRENT_BUILDS=1
export UV_CONCURRENT_DOWNLOADS=1
export UV_CONCURRENT_INSTALLS=1

PYTHON_FILES=(
  scripts/prepare-p97-piqd-projected-v3-production.py
  scripts/run-p97-piqd-projected-v3-canary.py
  scripts/run-p97-piqd-projected-v3-production.py
  census/p97_search/phase3_piqd_incremental_discovery.py
  census/p97_search/phase3_piqd_incremental_v3.py
  census/p97_search/phase3_piqd_projected_v3_provisioning.py
  census/p97_search/phase3_piqd_projected_v3_qualification.py
  census/p97_search/phase3_structural_cegar_projected_static_v3.py
  census/p97_search/tests/test_phase3_piqd_incremental_discovery.py
  census/p97_search/tests/test_phase3_piqd_incremental_v3.py
  census/p97_search/tests/test_phase3_piqd_projected_v3_canary.py
  census/p97_search/tests/test_phase3_piqd_projected_v3_production_launcher.py
  census/p97_search/tests/test_phase3_piqd_projected_v3_provisioning.py
  census/p97_search/tests/test_phase3_piqd_projected_v3_qualification.py
  census/p97_search/tests/test_phase3_structural_cegar_projected_static_v3.py
)

# The two structural-v3 files are shared integration surfaces with concurrent,
# separately owned hunks and pre-existing formatter drift. Keep them in the
# lint and pytest gates, but format-check only the checkpoint-owned files.
FORMAT_PYTHON_FILES=(
  scripts/prepare-p97-piqd-projected-v3-production.py
  scripts/run-p97-piqd-projected-v3-canary.py
  scripts/run-p97-piqd-projected-v3-production.py
  census/p97_search/phase3_piqd_incremental_discovery.py
  census/p97_search/phase3_piqd_incremental_v3.py
  census/p97_search/phase3_piqd_projected_v3_provisioning.py
  census/p97_search/phase3_piqd_projected_v3_qualification.py
  census/p97_search/tests/test_phase3_piqd_incremental_discovery.py
  census/p97_search/tests/test_phase3_piqd_incremental_v3.py
  census/p97_search/tests/test_phase3_piqd_projected_v3_canary.py
  census/p97_search/tests/test_phase3_piqd_projected_v3_production_launcher.py
  census/p97_search/tests/test_phase3_piqd_projected_v3_provisioning.py
  census/p97_search/tests/test_phase3_piqd_projected_v3_qualification.py
)

uv run --with pytest pytest -q -p no:xdist \
  census/p97_search/tests/test_phase3_piqd_incremental_discovery.py \
  census/p97_search/tests/test_phase3_piqd_incremental_v3.py \
  census/p97_search/tests/test_phase3_piqd_projected_v3_canary.py \
  census/p97_search/tests/test_phase3_piqd_projected_v3_production_launcher.py \
  census/p97_search/tests/test_phase3_piqd_projected_v3_provisioning.py \
  census/p97_search/tests/test_phase3_piqd_projected_v3_qualification.py \
  census/p97_search/tests/test_phase3_structural_cegar_projected_static_v3.py
uv run --with ruff ruff check "${PYTHON_FILES[@]}"
uv run --with ruff ruff format --check "${FORMAT_PYTHON_FILES[@]}"

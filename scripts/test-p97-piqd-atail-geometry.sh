#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export BLIS_NUM_THREADS=1
export RAYON_NUM_THREADS=1
export PYTHONHASHSEED=0

uv run pytest -q \
  census/atail_force/tests/test_piqd_cvc5_adapter.py \
  census/atail_force/tests/test_cvc5_pilot.py::Cvc5PilotTests::test_manifest_write_requires_legacy_local_before_discovery \
  census/atail_force/tests/test_cvc5_pilot.py::Cvc5PilotTests::test_manifest_check_requires_legacy_local_before_discovery \
  census/atail_force/tests/test_inequality_pilot.py::InequalityPilotTests::test_manifest_write_requires_legacy_local_before_discovery \
  census/atail_force/tests/test_producer_geometry.py::ProducerGeometryTests::test_cvc5_bounded_requires_explicit_backend_before_discovery \
  census/atail_force/tests/test_producer_geometry.py::ProducerGeometryTests::test_cvc5_smoke_requires_explicit_backend_before_discovery
uv run python -m py_compile \
  census/atail_force/cvc5_pilot.py \
  census/atail_force/inequality_pilot.py \
  census/atail_force/producer_geometry.py \
  census/atail_force/producer_probe.py \
  census/atail_force/producer_pattern_census.py
uv run --with ruff ruff check \
  census/atail_force/piqd_cvc5_adapter.py \
  census/atail_force/tests/test_piqd_cvc5_adapter.py
uv run --with ruff ruff format --check \
  census/atail_force/piqd_cvc5_adapter.py \
  census/atail_force/tests/test_piqd_cvc5_adapter.py

#!/usr/bin/env bash
#
# Lane runner for the non-piqd computation validation campaign.
# Deterministic environment, explicit file list, no xdist.

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

export UV_NO_CACHE=1
export PYTHONPATH="$ROOT${PYTHONPATH:+:$PYTHONPATH}"
export PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
export PYTHONHASHSEED=0
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export BLIS_NUM_THREADS=1
export RAYON_NUM_THREADS=1
export UV_THREADPOOL_SIZE=1

PYTHON_FILES=(
  scripts/audit_nonpiqd_custody.py
  scripts/classify_writer_fields.py
  scripts/recheck_algebraic_certificates.py
  scripts/recheck_inventory_certificates.py
  scripts/verify_lean_transcription.py
  scripts/test_audit_nonpiqd_custody.py
  scripts/test_classify_writer_fields.py
  scripts/test_recheck_algebraic_certificates.py
  scripts/test_recheck_inventory_certificates.py
  scripts/test_verify_lean_transcription.py
)

uv run --with pytest --with sympy pytest -q \
  scripts/test_audit_nonpiqd_custody.py \
  scripts/test_classify_writer_fields.py \
  scripts/test_recheck_algebraic_certificates.py \
  scripts/test_recheck_inventory_certificates.py \
  scripts/test_verify_lean_transcription.py

uv run --with ruff ruff check "${PYTHON_FILES[@]}"
uv run --with ruff ruff format --check "${PYTHON_FILES[@]}"

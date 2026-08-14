#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$repo_root"

export PYTHONPATH="$repo_root"
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export BLIS_NUM_THREADS=1
export RAYON_NUM_THREADS=1

python_files=(
  census/p97_search/phase3_cegar_runtime.py
  census/p97_search/phase3_cegar_wave_control.py
  census/p97_search/phase3_cegar_wave_engine.py
  census/p97_search/phase3_cegar_cleanup.py
  census/p97_search/cegar_exact17_shadow.py
  census/p97_search/cegar_wave_registry.py
  census/p97_search/cegar_wave_cli.py
  census/p97_search/tests/test_phase3_cegar_runtime.py
  census/p97_search/tests/test_phase3_cegar_wave_control.py
  census/p97_search/tests/test_phase3_cegar_wave_engine.py
  census/p97_search/tests/test_phase3_cegar_cleanup.py
  census/p97_search/tests/test_cegar_exact17_shadow.py
  census/p97_search/tests/test_cegar_wave_registry.py
  census/p97_search/tests/test_cegar_wave_cli.py
)

# The shared runtime files participate in tests and lint, but retain unrelated
# pre-existing whole-file formatting drift.  Keep this checkpoint's format
# gate scoped to the new framework files instead of rewriting shared history.
format_files=(
  census/p97_search/phase3_cegar_wave_control.py
  census/p97_search/phase3_cegar_wave_engine.py
  census/p97_search/phase3_cegar_cleanup.py
  census/p97_search/cegar_exact17_shadow.py
  census/p97_search/cegar_wave_registry.py
  census/p97_search/cegar_wave_cli.py
  census/p97_search/tests/test_phase3_cegar_wave_control.py
  census/p97_search/tests/test_phase3_cegar_wave_engine.py
  census/p97_search/tests/test_phase3_cegar_cleanup.py
  census/p97_search/tests/test_cegar_exact17_shadow.py
  census/p97_search/tests/test_cegar_wave_registry.py
  census/p97_search/tests/test_cegar_wave_cli.py
)

.venv/bin/pytest -q -p no:cacheprovider \
  census/p97_search/tests/test_phase3_cegar_runtime.py \
  census/p97_search/tests/test_phase3_cegar_wave_control.py \
  census/p97_search/tests/test_phase3_cegar_wave_engine.py \
  census/p97_search/tests/test_phase3_cegar_cleanup.py \
  census/p97_search/tests/test_cegar_exact17_shadow.py \
  census/p97_search/tests/test_cegar_wave_registry.py \
  census/p97_search/tests/test_cegar_wave_cli.py
.venv/bin/ruff check "${python_files[@]}"
.venv/bin/ruff format --check "${format_files[@]}"

#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "${script_dir}/.." && pwd)"
cd "${repo_root}"

export PYTHONUTF8=1
export PYTHONIOENCODING=utf-8
export PYTHONHASHSEED=0
export PYTHONDONTWRITEBYTECODE=1
export LANG=C.UTF-8
export LC_ALL=C.UTF-8
export TZ=UTC
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export RAYON_NUM_THREADS=1
export UV_NO_PROGRESS=1

# Keep dependency setup out of the worktree.  A fresh explicit project
# environment gives the gate isolation without leaving a local .venv behind.
cap_test_root="$(mktemp -d /tmp/p97-cap-config-test.XXXXXX)"
cleanup() {
  rm -rf -- "${cap_test_root}"
}
trap cleanup EXIT
trap 'exit 129' HUP
trap 'exit 130' INT
trap 'exit 143' TERM
export UV_PROJECT_ENVIRONMENT="${cap_test_root}/venv"

uv sync --frozen

cap_paths=(
  census/cap_configuration
  census/p97_search/phase3_piqd_smt_source_adapter.py
  census/p97_search/tests/test_phase3_piqd_smt_source_adapter.py
)

uv run --frozen --no-sync ruff format --check --no-cache "${cap_paths[@]}"
uv run --frozen --no-sync ruff check --no-cache "${cap_paths[@]}"
uv run --frozen --no-sync pytest -q -p no:cacheprovider \
  census/cap_configuration/tests \
  census/p97_search/tests/test_phase3_piqd_smt_source_adapter.py

uv run --frozen --no-sync python -m census.cap_configuration.campaign --help >/dev/null
uv run --frozen --no-sync python -m census.cap_configuration.campaign plan --help >/dev/null
uv run --frozen --no-sync python -m census.cap_configuration.campaign run --help >/dev/null
uv run --frozen --no-sync python -m census.cap_configuration.campaign status --help >/dev/null
uv run --frozen --no-sync python -m census.cap_configuration.validate --help >/dev/null

printf '%s\n' 'CAP_CONFIG_TEST_GATE=PASSED'

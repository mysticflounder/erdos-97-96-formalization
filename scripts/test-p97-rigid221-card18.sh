#!/usr/bin/env bash
# Copyright (c) 2026 Adam McKenna
# SPDX-License-Identifier: MIT
# Author: Adam McKenna

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

export UV_CACHE_DIR="${UV_CACHE_DIR:-${TMPDIR:-/tmp}/p97-rigid221-card18-uv-cache}"
export PYTHONPATH="$ROOT${PYTHONPATH:+:$PYTHONPATH}"
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

PYTHON_FILES=(
  census/p97_search/tests/conftest.py
  census/p97_search/rigid221_card18_source_packet.py
  census/p97_search/rigid221_card18_source_custody.py
  census/p97_search/rigid221_card18_crossed_incidence_custody.py
  census/p97_search/rigid221_card18_crossed_incidence_custody_v2.py
  census/p97_search/rigid221_card18_labeled_projection_custody.py
  census/p97_search/rigid221_card18_labeled_projection_custody_v2.py
  census/p97_search/rigid221_card18_predicate_coverage.py
  census/p97_search/rigid221_card18_predicate_coverage_v2.py
  census/p97_search/rigid221_card18_predicate_coverage_v3.py
  census/p97_search/rigid221_card18_predicate_coverage_v4.py
  census/p97_search/tests/test_rigid221_card18_source_packet.py
  census/p97_search/tests/test_rigid221_card18_source_custody.py
  census/p97_search/tests/test_rigid221_card18_crossed_incidence_custody.py
  census/p97_search/tests/test_rigid221_card18_crossed_incidence_custody_v2.py
  census/p97_search/tests/test_rigid221_card18_labeled_projection_custody.py
  census/p97_search/tests/test_rigid221_card18_labeled_projection_custody_v2.py
  census/p97_search/tests/test_rigid221_card18_predicate_coverage.py
  census/p97_search/tests/test_rigid221_card18_predicate_coverage_v2.py
  census/p97_search/tests/test_rigid221_card18_predicate_coverage_v3.py
  census/p97_search/tests/test_rigid221_card18_predicate_coverage_v4.py
)

uv run --with ruff ruff check "${PYTHON_FILES[@]}"

HISTORICAL_HEAD="9abb3417c06fd973dfa502009d5f517f0b25c24c"
HISTORICAL_TMP_BASE="${TMPDIR:-/tmp}"
HISTORICAL_TMP_BASE="${HISTORICAL_TMP_BASE%/}"
HISTORICAL_ROOT="$(mktemp -d "$HISTORICAL_TMP_BASE/p97-rigid221-card18-history.XXXXXX")"

cleanup_historical_root() {
  if [[ -n "$HISTORICAL_ROOT" \
    && "$HISTORICAL_ROOT" == "$HISTORICAL_TMP_BASE/p97-rigid221-card18-history."* \
    && -d "$HISTORICAL_ROOT" ]]; then
    rm -rf -- "$HISTORICAL_ROOT"
  fi
}
trap cleanup_historical_root EXIT

git archive --format=tar "$HISTORICAL_HEAD" | tar -xf - -C "$HISTORICAL_ROOT"
(
  cd "$HISTORICAL_ROOT"
  PYTHONPATH="$HISTORICAL_ROOT" uv run --project "$ROOT" pytest -q -p no:cacheprovider \
    census/p97_search/tests/test_rigid221_card18_source_packet.py \
    census/p97_search/tests/test_rigid221_card18_source_custody.py \
    census/p97_search/tests/test_rigid221_card18_crossed_incidence_custody.py \
    census/p97_search/tests/test_rigid221_card18_labeled_projection_custody.py \
    census/p97_search/tests/test_rigid221_card18_predicate_coverage.py \
    census/p97_search/tests/test_rigid221_card18_predicate_coverage_v2.py \
    census/p97_search/tests/test_rigid221_card18_predicate_coverage_v3.py
)

uv run pytest -q -p no:cacheprovider \
  census/p97_search/tests/test_rigid221_card18_crossed_incidence_custody_v2.py \
  census/p97_search/tests/test_rigid221_card18_labeled_projection_custody_v2.py \
  census/p97_search/tests/test_rigid221_card18_predicate_coverage_v4.py

LAKE_BUILD_NO_REFRESH=1 lake-build \
  Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18Aggregate

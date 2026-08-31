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
  census/p97_search/rigid221_card18_crossed_incidence_custody_v3.py
  census/p97_search/rigid221_card18_crossed_incidence_custody_v4.py
  census/p97_search/rigid221_card18_labeled_projection_custody.py
  census/p97_search/rigid221_card18_labeled_projection_custody_v2.py
  census/p97_search/rigid221_card18_labeled_projection_custody_v3.py
  census/p97_search/rigid221_card18_labeled_projection_custody_v4.py
  census/p97_search/rigid221_card18_predicate_coverage.py
  census/p97_search/rigid221_card18_predicate_coverage_v2.py
  census/p97_search/rigid221_card18_predicate_coverage_v3.py
  census/p97_search/rigid221_card18_predicate_coverage_v4.py
  census/p97_search/rigid221_card18_predicate_coverage_v5.py
  census/p97_search/rigid221_card18_predicate_coverage_v6.py
  census/p97_search/tests/test_rigid221_card18_source_packet.py
  census/p97_search/tests/test_rigid221_card18_source_custody.py
  census/p97_search/tests/test_rigid221_card18_crossed_incidence_custody.py
  census/p97_search/tests/test_rigid221_card18_crossed_incidence_custody_v2.py
  census/p97_search/tests/test_rigid221_card18_crossed_incidence_custody_v3.py
  census/p97_search/tests/test_rigid221_card18_crossed_incidence_custody_v4.py
  census/p97_search/tests/test_rigid221_card18_labeled_projection_custody.py
  census/p97_search/tests/test_rigid221_card18_labeled_projection_custody_v2.py
  census/p97_search/tests/test_rigid221_card18_labeled_projection_custody_v3.py
  census/p97_search/tests/test_rigid221_card18_labeled_projection_custody_v4.py
  census/p97_search/tests/test_rigid221_card18_predicate_coverage.py
  census/p97_search/tests/test_rigid221_card18_predicate_coverage_v2.py
  census/p97_search/tests/test_rigid221_card18_predicate_coverage_v3.py
  census/p97_search/tests/test_rigid221_card18_predicate_coverage_v4.py
  census/p97_search/tests/test_rigid221_card18_predicate_coverage_v5.py
  census/p97_search/tests/test_rigid221_card18_predicate_coverage_v6.py
)

uv run --with ruff ruff check "${PYTHON_FILES[@]}"

HISTORICAL_V2_HEAD="7cf1e60bde589fe27c246c0edbc7ad20e96d6db3"
HISTORICAL_V3_HEAD="7cbb8071ce07a0413c82042713ca0c5999890747"
HISTORICAL_TMP_BASE="${TMPDIR:-/tmp}"
HISTORICAL_TMP_BASE="${HISTORICAL_TMP_BASE%/}"
HISTORICAL_V2_ROOT="$(mktemp -d "$HISTORICAL_TMP_BASE/p97-rigid221-card18-history-v2.XXXXXX")"
HISTORICAL_V3_ROOT="$(mktemp -d "$HISTORICAL_TMP_BASE/p97-rigid221-card18-history-v3.XXXXXX")"

cleanup_historical_root() {
  if [[ -n "$HISTORICAL_V2_ROOT" \
    && "$HISTORICAL_V2_ROOT" == "$HISTORICAL_TMP_BASE/p97-rigid221-card18-history-v2."* \
    && -d "$HISTORICAL_V2_ROOT" ]]; then
    rm -rf -- "$HISTORICAL_V2_ROOT"
  fi
  if [[ -n "$HISTORICAL_V3_ROOT" \
    && "$HISTORICAL_V3_ROOT" == "$HISTORICAL_TMP_BASE/p97-rigid221-card18-history-v3."* \
    && -d "$HISTORICAL_V3_ROOT" ]]; then
    rm -rf -- "$HISTORICAL_V3_ROOT"
  fi
}
trap cleanup_historical_root EXIT

git archive --format=tar "$HISTORICAL_V2_HEAD" | tar -xf - -C "$HISTORICAL_V2_ROOT"
(
  cd "$HISTORICAL_V2_ROOT"
  PYTHONPATH="$HISTORICAL_V2_ROOT" uv run --project "$ROOT" pytest -q -p no:cacheprovider \
    census/p97_search/tests/test_rigid221_card18_source_packet.py \
    census/p97_search/tests/test_rigid221_card18_source_custody.py \
    census/p97_search/tests/test_rigid221_card18_crossed_incidence_custody.py \
    census/p97_search/tests/test_rigid221_card18_labeled_projection_custody.py \
    census/p97_search/tests/test_rigid221_card18_predicate_coverage.py \
    census/p97_search/tests/test_rigid221_card18_predicate_coverage_v2.py \
    census/p97_search/tests/test_rigid221_card18_predicate_coverage_v3.py \
    census/p97_search/tests/test_rigid221_card18_crossed_incidence_custody_v2.py \
    census/p97_search/tests/test_rigid221_card18_labeled_projection_custody_v2.py \
    census/p97_search/tests/test_rigid221_card18_predicate_coverage_v4.py
)

git archive --format=tar "$HISTORICAL_V3_HEAD" | tar -xf - -C "$HISTORICAL_V3_ROOT"
(
  cd "$HISTORICAL_V3_ROOT"
  PYTHONPATH="$HISTORICAL_V3_ROOT" uv run --project "$ROOT" pytest -q -p no:cacheprovider \
    census/p97_search/tests/test_rigid221_card18_crossed_incidence_custody_v3.py \
    census/p97_search/tests/test_rigid221_card18_labeled_projection_custody_v3.py \
    census/p97_search/tests/test_rigid221_card18_predicate_coverage_v5.py
)

uv run pytest -q -p no:cacheprovider \
  census/p97_search/tests/test_rigid221_card18_crossed_incidence_custody_v4.py \
  census/p97_search/tests/test_rigid221_card18_labeled_projection_custody_v4.py \
  census/p97_search/tests/test_rigid221_card18_predicate_coverage_v6.py

LAKE_BUILD_NO_REFRESH=1 lake-build \
  Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18Aggregate

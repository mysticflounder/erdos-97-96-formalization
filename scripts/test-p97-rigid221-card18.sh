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
  census/p97_search/rigid221_card18_source_packet.py
  census/p97_search/rigid221_card18_source_custody.py
  census/p97_search/rigid221_card18_crossed_incidence_custody.py
  census/p97_search/rigid221_card18_labeled_projection_custody.py
  census/p97_search/rigid221_card18_predicate_coverage.py
  census/p97_search/rigid221_card18_predicate_coverage_v2.py
  census/p97_search/rigid221_card18_predicate_coverage_v3.py
  census/p97_search/tests/test_rigid221_card18_source_packet.py
  census/p97_search/tests/test_rigid221_card18_source_custody.py
  census/p97_search/tests/test_rigid221_card18_crossed_incidence_custody.py
  census/p97_search/tests/test_rigid221_card18_labeled_projection_custody.py
  census/p97_search/tests/test_rigid221_card18_predicate_coverage.py
  census/p97_search/tests/test_rigid221_card18_predicate_coverage_v2.py
  census/p97_search/tests/test_rigid221_card18_predicate_coverage_v3.py
)

uv run --with ruff ruff check "${PYTHON_FILES[@]}"
uv run pytest -q -p no:cacheprovider \
  census/p97_search/tests/test_rigid221_card18_source_packet.py \
  census/p97_search/tests/test_rigid221_card18_source_custody.py \
  census/p97_search/tests/test_rigid221_card18_crossed_incidence_custody.py \
  census/p97_search/tests/test_rigid221_card18_labeled_projection_custody.py \
  census/p97_search/tests/test_rigid221_card18_predicate_coverage.py \
  census/p97_search/tests/test_rigid221_card18_predicate_coverage_v2.py \
  census/p97_search/tests/test_rigid221_card18_predicate_coverage_v3.py

LAKE_BUILD_NO_REFRESH=1 lake-build \
  Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18Aggregate

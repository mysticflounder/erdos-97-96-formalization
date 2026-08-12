#!/usr/bin/env bash
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

export UV_CACHE_DIR="${UV_CACHE_DIR:-/private/tmp/p97-exact12-static-uv-cache}"
export PYTHONPATH="$ROOT${PYTHONPATH:+:$PYTHONPATH}"
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export RAYON_NUM_THREADS=1
export PYTEST_ADDOPTS="-p no:xdist"

# These settings cap software concurrency. They do not claim physical CPU
# affinity, one physical core, or one solver process.
uv run --with pytest pytest -q \
  census/card_head/tests/test_exact12_next_row_static_cegar.py \
  census/card_head/tests/test_exact12_next_row_static_piqd.py

PYTHON_FILES=(
  census/card_head/exact12_next_row_static_cegar.py
  census/card_head/exact12_next_row_static_piqd.py
  census/card_head/tests/test_exact12_next_row_static_cegar.py
  census/card_head/tests/test_exact12_next_row_static_piqd.py
)

uv run --with ruff ruff check "${PYTHON_FILES[@]}"
uv run --with ruff ruff format --check \
  census/card_head/exact12_next_row_static_piqd.py \
  census/card_head/tests/test_exact12_next_row_static_piqd.py

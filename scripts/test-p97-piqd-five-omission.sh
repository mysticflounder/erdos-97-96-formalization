#!/usr/bin/env bash
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

export UV_CACHE_DIR="$ROOT/.uv-cache"
export PYTHONPATH="$ROOT${PYTHONPATH:+:$PYTHONPATH}"
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export RAYON_NUM_THREADS=1

# These settings and pytest -n 1 cap software concurrency; they do not provide
# physical core affinity and make no one-physical-core execution claim.
uv run --with pytest --with pytest-xdist pytest -q -n 1 \
  census/card_head/tests/test_source_faithful_five_omission_piqd.py

PYTHON_FILES=(
  census/card_head/source_faithful_five_omission_cegar.py
  census/card_head/source_faithful_five_omission_piqd.py
  census/card_head/tests/test_source_faithful_five_omission_piqd.py
)

NEW_PYTHON_FILES=(
  census/card_head/source_faithful_five_omission_piqd.py
  census/card_head/tests/test_source_faithful_five_omission_piqd.py
)

uv run --with ruff ruff check "${PYTHON_FILES[@]}"
uv run --with ruff ruff format --check "${NEW_PYTHON_FILES[@]}"

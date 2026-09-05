#!/usr/bin/env python3
"""Repository entry point for the profile-0034 reduced singleton deletion."""

from __future__ import annotations

import importlib
import sys
from pathlib import Path

REPOSITORY_ROOT = Path(__file__).resolve().parents[1]
if str(REPOSITORY_ROOT) not in sys.path:
    sys.path.insert(0, str(REPOSITORY_ROOT))

main = importlib.import_module(
    "census.card_head."
    "exactfive_profile0034_new_mirror_reduced_singleton_deletion_piqd"
).main


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))

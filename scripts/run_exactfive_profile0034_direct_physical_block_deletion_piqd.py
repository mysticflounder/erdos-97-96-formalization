#!/usr/bin/env python3
"""CLI entry point for the direct profile-0034 physical-block PIQD lane."""

from __future__ import annotations

import sys
from importlib import import_module
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

main = import_module(
    "census.card_head.exactfive_profile0034_direct_physical_block_deletion_piqd"
).main


if __name__ == "__main__":
    raise SystemExit(main())

"""Readiness entrypoint for the exact-five seven-order PIQD coverage lane."""

from __future__ import annotations

import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.card_head.exactfive_profile0034_seven_order_coverage_piqd import main

if __name__ == "__main__":
    raise SystemExit(main())

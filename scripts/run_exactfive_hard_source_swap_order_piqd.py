"""Run the branch-D complete order/equality census through PIQD."""

from __future__ import annotations

import sys
from pathlib import Path

REPOSITORY_ROOT = Path(__file__).resolve().parents[1]
if str(REPOSITORY_ROOT) not in sys.path:
    sys.path.insert(0, str(REPOSITORY_ROOT))

from census.card_head.exactfive_hard_source_swap_order_piqd import main

if __name__ == "__main__":
    raise SystemExit(main())

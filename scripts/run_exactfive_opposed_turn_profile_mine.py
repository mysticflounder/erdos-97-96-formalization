#!/usr/bin/env python3
"""Run the governed deterministic opposed-turn profile mine."""

import sys
from pathlib import Path

REPOSITORY_ROOT = Path(__file__).resolve().parents[1]
if str(REPOSITORY_ROOT) not in sys.path:
    sys.path.insert(0, str(REPOSITORY_ROOT))

from census.card_head.exactfive_opposed_turn_profile_mine import main

if __name__ == "__main__":
    raise SystemExit(main())

"""Entry point for the governed six-profile residual QF_NRA lane."""

from __future__ import annotations

import importlib
import sys
from pathlib import Path

REPOSITORY_ROOT = Path(__file__).resolve().parents[1]
if str(REPOSITORY_ROOT) not in sys.path:
    sys.path.insert(0, str(REPOSITORY_ROOT))

main = importlib.import_module("census.card_head.exactfive_opposed_turn_residual_qfnra_piqd").main


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))

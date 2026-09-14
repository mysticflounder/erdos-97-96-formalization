# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Thin entry point for the governed rigid221 S0 C3 PIQD diagnostic."""

from __future__ import annotations

import sys
from pathlib import Path

REPOSITORY_ROOT = Path(__file__).resolve().parents[1]
if str(REPOSITORY_ROOT) not in sys.path:
    sys.path.insert(0, str(REPOSITORY_ROOT))

from census.card_head.rigid221_s0_c3_fullrow_planar_qfnra_piqd import main

if __name__ == "__main__":
    raise SystemExit(main())

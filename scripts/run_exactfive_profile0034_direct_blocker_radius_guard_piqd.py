#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""CLI for the governed profile-0034 direct blocker-radius PIQD canary."""

from __future__ import annotations

import sys
from importlib import import_module
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

main = import_module(
    "census.card_head.exactfive_profile0034_direct_blocker_radius_guard_piqd"
).main

if __name__ == "__main__":
    raise SystemExit(main())

"""Run or offline-verify the profile-0034 cvc5 long replay producer."""

from __future__ import annotations

import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.card_head.exactfive_profile0034_new_mirror_supporting_edge_long_replay_piqd import (
    main,
)

if __name__ == "__main__":
    raise SystemExit(main())

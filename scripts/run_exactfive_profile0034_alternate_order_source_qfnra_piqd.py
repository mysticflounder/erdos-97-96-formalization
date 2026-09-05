"""Run the governed profile-0034 source QF_NRA PIQD diagnostic."""

import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.card_head.exactfive_profile0034_alternate_order_source_qfnra_piqd import (
    main,
)

if __name__ == "__main__":
    raise SystemExit(main())

"""Test the A5.2/A5.4 forced cap order against the 48-order deck.

Read-only diagnostic.  The descent prose (16.5.A5, A5.3/A5.4) proves that
the strict interior of the physical second cap is exactly {u, c, xv, xu}
and that these four points occur, up to reversal of the oriented cap, in
the order u < c < xv < xu.  Labels in this encoding: U=6, C=7, XV=8, XU=9
(census/card_head/exact12_next_row_valuation.py).

This script checks, exhaustively over the 48 canonical boundary orders in
census/card_head/exact12_v14_ordered_coverage.py:source_boundary_orders():

  * the cap labels {6,7,8,9} occupy contiguous positions (A5.3);
  * their subsequence is (6,7,8,9) or its reversal (9,8,7,6) (A5.4);
  * therefore how many deck orders the constraint removes.

Result on 2026-08-20: the constraint removes 0 of 48.  The deck already
uses exactly the 2 internal cap orders A5.4 admits out of 24 permutations.
The finer question, whether the cap reversal is coupled to the other
blocks, is explicitly open in the prose (line 2352-2354: the
crossing/orientation premise "must be derived rather than assumed"), so
the deck's independent +/- on the cap is the sound abstraction of what is
proved today.
"""

from __future__ import annotations

import itertools
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(REPO_ROOT))

from census.card_head.exact12_v14_ordered_coverage import source_boundary_orders

U, C, XV, XU = 6, 7, 8, 9
CAP = (U, C, XV, XU)
FORWARD = CAP
REVERSED = tuple(reversed(CAP))


def main() -> None:
    orders = source_boundary_orders()
    assert len(orders) == 48, len(orders)

    counts = {"forward": 0, "reversed": 0, "other": 0, "non_contiguous": 0}
    per_orientation: dict[str, dict[str, int]] = {}
    for orientation, order in orders:
        positions = [order.index(label) for label in CAP]
        if max(positions) - min(positions) != 3:
            counts["non_contiguous"] += 1
        sub = tuple(label for label in order if label in CAP)
        key = "forward" if sub == FORWARD else "reversed" if sub == REVERSED else "other"
        counts[key] += 1
        bucket = per_orientation.setdefault(
            orientation, {"forward": 0, "reversed": 0, "other": 0}
        )
        bucket[key] += 1

    admissible = counts["forward"] + counts["reversed"]
    print("deck size:", len(orders))
    print("cap subsequence forward u,c,xv,xu:", counts["forward"])
    print("cap subsequence reversed xu,xv,c,u:", counts["reversed"])
    print("cap subsequence other (violates A5.4):", counts["other"])
    print("cap block non-contiguous (violates A5.3):", counts["non_contiguous"])
    print("per orientation:", per_orientation)
    print("orders admissible under A5.4:", admissible, "of", len(orders))
    print("orders REMOVED by A5.4:", len(orders) - admissible)

    admitted = [p for p in itertools.permutations(CAP) if p in (FORWARD, REVERSED)]
    used = sorted({tuple(l for l in o if l in CAP) for _, o in orders})
    print("internal cap permutations:", 24, "; admitted by A5.4:", len(admitted))
    print("deck internal cap orders used:", used)

    assert counts["other"] == 0
    assert counts["non_contiguous"] == 0
    assert used == sorted((FORWARD, REVERSED))


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Authors: Adam McKenna

"""Schema-v12 fresh-arm probe: v11 plus two-centre acute-base cuts.

In the fresh ``reverseHitFreshCommonDeletion`` arm, let ``a`` be the first
apex, ``c`` the blocker chosen for the deleted endpoint, and ``k,d`` the
kept/deleted first-rich-shell endpoints.  The normal form gives

``|a-k| = |a-d|`` and ``|c-k| = |c-d|``.

Convex independence puts the two distinct carrier centres ``a,c`` on
opposite sides of the midpoint of ``kd``: if they were on the same side, the
nearer one would lie in the triangle spanned by the farther one and ``k,d``.
Writing

``A = |a-c|^2, B = |a-x|^2, C = |c-x|^2`` for ``x`` in ``{k,d}``, this gives
the strict acute-base inequalities ``A + B > C`` and ``A + C > B``.  Since
the squared-distance relaxation is homogeneous, each strict inequality is
encoded with margin one.

The convex-independence side bridge and squared-distance corollary are
kernel-checked in ``Problem97.TwoCenterAcute`` and
``Problem97.ATailFrontierLiveClosure.reverseHit_twoCenter_sqdist_acute``.
This runner uses that theorem as a sound cut in a finite distance relaxation;
it is not itself a Lean closure.  It makes no assertion about the fresh B1
packet, and does not assume that the fresh source differs from the deleted
blocker's centre.
"""

from __future__ import annotations

import sys
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_VERSION = 12
V11_DIR = HERE.parent / "round11-fresh-between-cnd"
if str(V11_DIR) not in sys.path:
    sys.path.insert(0, str(V11_DIR))

import run_fresh_between_cnd as v11


class FreshTwoCenterAcuteEncoding(v11.FreshBlockerBetweenCNDEncoding):
    """Add the two squared acute-base inequalities at each licensed centre."""

    def _build_normal_form(self) -> None:
        super()._build_normal_form()
        base = v11.v9.v7.v6.v5.v4.base
        if self.case.arm != "fresh":
            return
        apex = base.APICES[0]
        kept = self.case.kept
        deleted = self.case.deleted
        for center in base.INTERIORS[0]:
            for endpoint in (kept, deleted):
                # In the fresh normal form, `dynamic_row_member(deleted,
                # kept)` plus the unique blocker for `deleted` forces
                # `row[center, kept]` whenever `block[deleted, center]`.
                # The blocker therefore supplies the complete two-hit Lean
                # antecedent by itself.  This remains fresh-arm-only.
                self.add(
                    "fresh_two_center_acute_base",
                    z3.Implies(
                        self.block[deleted, center],
                        self.s(apex, center) + self.s(apex, endpoint)
                        >= self.s(center, endpoint) + 1,
                    ),
                    z3.Implies(
                        self.block[deleted, center],
                        self.s(apex, center) + self.s(center, endpoint)
                        >= self.s(apex, endpoint) + 1,
                    ),
                )


def main() -> int:
    """Reuse v11's fresh-only runner with v12 provenance and cut class."""
    v11.v9.v7.HERE = HERE
    v11.v9.v7.SCRIPT_PATH = SCRIPT_PATH
    v11.v9.v7.SCHEMA_VERSION = SCHEMA_VERSION
    v11.v9.v7.v6.selected_cases = v11.selected_cases
    v11.v9.v7.FullMultiplicityTripleCenterEncoding = FreshTwoCenterAcuteEncoding
    return v11.v9.v7.main()


if __name__ == "__main__":
    raise SystemExit(main())

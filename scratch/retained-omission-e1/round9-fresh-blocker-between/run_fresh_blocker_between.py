#!/usr/bin/env python3
"""Schema-v9 fresh-arm probe: v7 plus the strict cap-interval blocker cut.

In the ``reverseHitFreshCommonDeletion`` arm of the live retained-omission
normal form, the centre of the deleted blocker is in the first strict cap and
is equidistant from the kept and deleted first-apex rich-shell points.
``CGN.index_strictly_between_of_equidistant`` therefore puts that centre
strictly between the two points in the canonical first-cap order.  This file
adds only that Boolean consequence; it deliberately remains fresh-arm-only.

The corresponding Lean helper is being added beside
``false_of_retainedOmission_triApexAllLarge_core``.  Until that focused build
has passed, this remains an externally audited search constraint, not a Lean
closure claim.
"""

from __future__ import annotations

import sys
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_VERSION = 9
V7_DIR = HERE.parent / "round7-triple-center-multiplicity"
if str(V7_DIR) not in sys.path:
    sys.path.insert(0, str(V7_DIR))

import run_full_multiplicity_triple_center as v7


class FreshBlockerBetweenEncoding(v7.FullMultiplicityTripleCenterEncoding):
    """Add the first-cap strict-between restriction for the fresh blocker."""

    def _build_normal_form(self) -> None:
        super()._build_normal_form()
        if self.case.arm != "fresh":
            return
        base = v7.v6.v5.v4.base
        kept = self.case.kept
        deleted = self.case.deleted
        for center in base.INTERIORS[0]:
            strictly_between = (
                (kept < center < deleted) or (deleted < center < kept)
            )
            self.add(
                "fresh_deleted_blocker_strictly_between_endpoints",
                z3.Implies(
                    self.block[deleted, center], z3.BoolVal(strictly_between)
                ),
            )


def main() -> int:
    """Reuse the v7 runner with v9 provenance and the interval encoding."""
    v7.HERE = HERE
    v7.SCRIPT_PATH = SCRIPT_PATH
    v7.SCHEMA_VERSION = SCHEMA_VERSION
    v7.FullMultiplicityTripleCenterEncoding = FreshBlockerBetweenEncoding
    return v7.main()


if __name__ == "__main__":
    raise SystemExit(main())

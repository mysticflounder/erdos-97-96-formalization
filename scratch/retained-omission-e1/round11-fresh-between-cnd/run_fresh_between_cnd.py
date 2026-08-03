#!/usr/bin/env python3
"""Schema-v11 fresh-arm probe: strict blocker-between plus balanced CND.

This is an exact-n=15 external relaxation of the fresh
``reverseHitFreshCommonDeletion`` normal-form arm only.  It composes the v9
first-cap strict-between cut for the deleted blocker's centre with the v10
three balanced four-point Schoenberg inequalities on squared distances, while
retaining v7's full-shell, cap-localization, and carrier-triple capacity
constraints.  The strict-between cut is the audited consequence of the
deleted blocker being equidistant from the kept and deleted first-apex shell
points; the CND cuts are necessary for every squared Euclidean distance
matrix.  This script is a computational filter, not a Lean closure or a
universal consequence of the live core, until the relevant source helpers and
any finite-cardinality reduction are separately proved.
"""

from __future__ import annotations

import itertools
import sys
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_VERSION = 11
V9_DIR = HERE.parent / "round9-fresh-blocker-between"
if str(V9_DIR) not in sys.path:
    sys.path.insert(0, str(V9_DIR))

import run_fresh_blocker_between as v9


class FreshBlockerBetweenCNDEncoding(v9.FreshBlockerBetweenEncoding):
    """Add balanced four-point CND cuts to v9's fresh-only interval encoding."""

    def _build(self) -> None:
        super()._build()
        self._build_four_point_schoenberg_balanced_cnd()

    def _build_four_point_schoenberg_balanced_cnd(self) -> None:
        base = v9.v7.v6.v5.v4.base
        for a, b, c, d in itertools.combinations(base.POINTS, 4):
            for positive, negative in (
                ((a, b), (c, d)),
                ((a, c), (b, d)),
                ((a, d), (b, c)),
            ):
                p0, p1 = positive
                n0, n1 = negative
                self.add(
                    "four_point_schoenberg_balanced_cnd",
                    self.s(p0, p1) + self.s(n0, n1)
                    <= self.s(p0, n0) + self.s(p0, n1)
                    + self.s(p1, n0) + self.s(p1, n1),
                )


def selected_cases(case_ids: list[str]):
    """Reject paired-arm cases: v11's blocker-between premise is fresh-only."""
    base = v9.v7.v6.v5.v4.base
    by_id = {case.case_id: case for case in base.all_cases()}
    missing = sorted(set(case_ids) - by_id.keys())
    if missing:
        raise SystemExit(f"unknown case ids: {missing}")
    cases = [by_id[case_id] for case_id in case_ids]
    invalid = [case.case_id for case in cases if case.arm != "fresh"]
    if invalid:
        raise SystemExit(f"schema v11 is fresh-arm only: {invalid}")
    return cases


def main() -> int:
    """Run v9's fresh arm with v11 provenance and the CND extension."""
    v9.v7.HERE = HERE
    v9.v7.SCRIPT_PATH = SCRIPT_PATH
    v9.v7.SCHEMA_VERSION = SCHEMA_VERSION
    v9.v7.v6.selected_cases = selected_cases
    v9.v7.FullMultiplicityTripleCenterEncoding = FreshBlockerBetweenCNDEncoding
    return v9.v7.main()


if __name__ == "__main__":
    raise SystemExit(main())

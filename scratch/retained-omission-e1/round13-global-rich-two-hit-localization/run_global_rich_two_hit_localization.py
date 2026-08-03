#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Authors: Adam McKenna

"""Schema-v13 exact-15 probe: global distinct-cap rich two-hit localization.

For a used critical-row centre ``c``, a pair of row members in one rich shell
of apex ``i`` that also lie in ``C_i^o`` forces ``c ∈ C_i^o``.  Thus the same
full critical row cannot contain two such hits in a rich shell at a distinct
apex ``j``: the strict cap interiors are disjoint.

This is the all-arm consequence
``Problem97.ATailFrontierLiveClosure
.criticalShellCenter_mem_capInteriorByIndex_of_two_hits`` together with
``false_of_criticalShell_center_in_cap_of_two_hits_in_distinct_cap``.  The
encoding uses full rich distance classes and full exact critical rows only;
it never treats absence from a selected common-deletion subset as a circle
nonmembership fact.  The runner is an external finite relaxation, not a Lean
closure.  It inherits v12's fresh-only acute-base cuts, which remain inert in
the paired arm.
"""

from __future__ import annotations

import itertools
import sys
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_VERSION = 13
V12_DIR = HERE.parent / "round12-fresh-two-center-acute"
if str(V12_DIR) not in sys.path:
    sys.path.insert(0, str(V12_DIR))

import run_fresh_two_center_acute as v12


class GlobalRichTwoHitLocalizationEncoding(v12.FreshTwoCenterAcuteEncoding):
    """Forbid one full critical row from two-hitting two strict rich caps."""

    def _build(self) -> None:
        super()._build()
        self._build_distinct_cap_rich_two_hit_localization()

    def _rich_cap_two_hits(self, center: int, apex_index: int, cls: int) -> z3.BoolRef:
        """Whether this exact full row has two hits in one rich cap slice."""
        base = v12.v11.v9.v7.v6.v5.v4.base
        support = self.rich[apex_index, cls]["support"]
        assert isinstance(support, list)
        return z3.Not(
            base.at_most(
                [
                    z3.And(self.row[center, point], support[point])
                    for point in base.INTERIORS[apex_index]
                ],
                1,
            )
        )

    def _build_distinct_cap_rich_two_hit_localization(self) -> None:
        base = v12.v11.v9.v7.v6.v5.v4.base
        class_counts = [1 if profile == "S" else 2 for profile in self.case.profiles]
        for left, right in itertools.combinations(range(3), 2):
            for left_cls in range(class_counts[left]):
                for right_cls in range(class_counts[right]):
                    for center in base.NONAPICES:
                        # Any two row hits make `center` used.  At a used
                        # centre, `critical_full_row` and
                        # `critical_no_competing_K4` instantiate the Lean
                        # `IsUniqueFourCenter` antecedent.  Each rich support
                        # is the full selected class at its displayed apex.
                        self.add(
                            "global_distinct_cap_rich_two_hit_localization",
                            z3.Not(
                                z3.And(
                                    self._rich_cap_two_hits(center, left, left_cls),
                                    self._rich_cap_two_hits(center, right, right_cls),
                                )
                            ),
                        )


def selected_cases(case_ids: list[str]):
    """Use the full paired/fresh case matrix; the new cut is all-arm."""
    base = v12.v11.v9.v7.v6.v5.v4.base
    by_id = {case.case_id: case for case in base.all_cases()}
    missing = sorted(set(case_ids) - by_id.keys())
    if missing:
        raise SystemExit(f"unknown case ids: {missing}")
    return [by_id[case_id] for case_id in case_ids]


def main() -> int:
    """Reuse the v7 driver with all-arm v13 provenance and cut class."""
    runner = v12.v11.v9.v7
    runner.HERE = HERE
    runner.SCRIPT_PATH = SCRIPT_PATH
    runner.SCHEMA_VERSION = SCHEMA_VERSION
    runner.v6.selected_cases = selected_cases
    runner.FullMultiplicityTripleCenterEncoding = GlobalRichTwoHitLocalizationEncoding
    return runner.main()


if __name__ == "__main__":
    raise SystemExit(main())

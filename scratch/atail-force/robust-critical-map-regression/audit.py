#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Finite regression for the retained critical map at a robust second apex.

This deliberately tests a necessary incidence/cyclic-order abstraction, not
Euclidean realizability.  The smallest live higher-cap profile is ``(6,6,5)``:
it has fourteen carrier labels and a six-point closed cap opposite physical
second apex ``1``.

The surface simultaneously retains:

* one admissible selected K4 row at every carrier center (global K4);
* a total source-indexed blocker map, avoiding self-blockers;
* exact-row locking at every center in the blocker-map image;
* source membership in the selected exact row at its blocker;
* exclusion of the robust second apex from the blocker-map image; and
* two support-disjoint selected K4 rows at that apex, which is a sufficient
  finite cause of ``FullyDeletionRobustAt``.

A SAT result is a countermodel only to a contradiction using these represented
finite consequences.  It is not a counterexample to the Lean/Euclidean theorem.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import re
import sys
from typing import Any, Iterable

import z3

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.atail_force import producer_bank
from census.global_confinement import shadow
from census.multi_center import multi_center_census as mc


RESULTS = HERE / "audit_results.json"
BANK_CLEAN_RESULTS = HERE / "bank_clean_results.json"
PROFILE = (6, 6, 5)
SECOND_APEX = 1
EXPECTED_CARRIER_CARD = 14
INCOMPATIBLE_GLOBAL_RE = re.compile(
    r"incompatible rows global:(\d+), global:(\d+)"
)
INCOMPATIBLE_ROBUST_RE = re.compile(
    r"incompatible rows global:(\d+), robust:second-radius"
)


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


class Surface:
    """Z3 choice layer with an independent permanent verifier."""

    def __init__(self) -> None:
        frame, candidates = mc.cached_candidate_lists(PROFILE, set(mc.PROVEN_ROWS))
        if candidates is None:
            raise RuntimeError("profile has no admissible selected-row domain")
        if frame.n != EXPECTED_CARRIER_CARD:
            raise RuntimeError("cardinality drift")
        if len(frame.O1) != 6 or SECOND_APEX in frame.O1:
            raise RuntimeError("physical second-cap role drift")
        self.frame = frame
        self.candidates = {
            center: tuple(sorted(rows, key=lambda row: tuple(sorted(row))))
            for center, rows in candidates.items()
        }
        self.row_choice = {
            center: z3.Int(f"row_choice_{center}")
            for center in range(frame.n)
        }
        self.robust_choice = z3.Int("robust_choice")
        self.blocker = {
            source: z3.Int(f"blocker_{source}")
            for source in range(frame.n)
        }
        self._member_cache: dict[tuple[int, int], z3.BoolRef] = {}
        self._robust_member_cache: dict[int, z3.BoolRef] = {}

    def member(self, center: int, point: int) -> z3.BoolRef:
        key = (center, point)
        if key not in self._member_cache:
            self._member_cache[key] = z3.Or(
                *(
                    self.row_choice[center] == index
                    for index, support in enumerate(self.candidates[center])
                    if point in support
                )
            )
        return self._member_cache[key]

    def robust_member(self, point: int) -> z3.BoolRef:
        if point not in self._robust_member_cache:
            self._robust_member_cache[point] = z3.Or(
                *(
                    self.robust_choice == index
                    for index, support in enumerate(self.candidates[SECOND_APEX])
                    if point in support
                )
            )
        return self._robust_member_cache[point]

    def solver(self) -> z3.Solver:
        solver = z3.Solver()
        solver.set(timeout=30_000, random_seed=0)
        for center, variable in self.row_choice.items():
            solver.add(0 <= variable, variable < len(self.candidates[center]))
            solver.add(z3.Not(self.member(center, center)))
        solver.add(
            0 <= self.robust_choice,
            self.robust_choice < len(self.candidates[SECOND_APEX]),
        )

        # Two selected rows at the physical second apex have disjoint supports.
        for point in range(self.frame.n):
            solver.add(
                z3.Not(
                    z3.And(
                        self.member(SECOND_APEX, point),
                        self.robust_member(point),
                    )
                )
            )

        # Distinct centers cannot have three common radius-class points.
        for left in range(self.frame.n):
            for right in range(left + 1, self.frame.n):
                solver.add(
                    z3.Sum(
                        *(
                            z3.If(
                                z3.And(
                                    self.member(left, point),
                                    self.member(right, point),
                                ),
                                1,
                                0,
                            )
                            for point in range(self.frame.n)
                        )
                    )
                    <= 2
                )
        for center in range(self.frame.n):
            if center == SECOND_APEX:
                continue
            solver.add(
                z3.Sum(
                    *(
                        z3.If(
                            z3.And(
                                self.member(center, point),
                                self.robust_member(point),
                            ),
                            1,
                            0,
                        )
                        for point in range(self.frame.n)
                    )
                )
                <= 2
            )

        # If two radius classes share two carrier points, their center chord
        # and common-point chord must alternate in the convex cyclic order.
        order = shadow.hull_order(self.frame)
        for left in range(self.frame.n):
            for right in range(left + 1, self.frame.n):
                for first in range(self.frame.n):
                    for second in range(first + 1, self.frame.n):
                        if shadow.cyclic_separated(
                            order, left, right, first, second
                        ):
                            continue
                        solver.add(
                            z3.Not(
                                z3.And(
                                    self.member(left, first),
                                    self.member(left, second),
                                    self.member(right, first),
                                    self.member(right, second),
                                )
                            )
                        )
        for center in range(self.frame.n):
            if center == SECOND_APEX:
                continue
            for first in range(self.frame.n):
                for second in range(first + 1, self.frame.n):
                    if shadow.cyclic_separated(
                        order, center, SECOND_APEX, first, second
                    ):
                        continue
                    solver.add(
                        z3.Not(
                            z3.And(
                                self.member(center, first),
                                self.member(center, second),
                                self.robust_member(first),
                                self.robust_member(second),
                            )
                        )
                    )

        # A pair of carrier points has at most two carrier bisector centers.
        for first in range(self.frame.n):
            for second in range(first + 1, self.frame.n):
                centers = z3.Sum(
                    *(
                        z3.If(
                            z3.And(
                                self.member(center, first),
                                self.member(center, second),
                            ),
                            1,
                            0,
                        )
                        for center in range(self.frame.n)
                    )
                )
                solver.add(centers <= 2)

        # Total retained critical map.  Robustness forces its physical center
        # out of the image, while shell locking forces source membership.
        for source, variable in self.blocker.items():
            allowed = [
                center
                for center in range(self.frame.n)
                if center not in {source, SECOND_APEX}
            ]
            solver.add(z3.Or(*(variable == center for center in allowed)))
            solver.add(
                z3.Or(
                    *(
                        z3.And(variable == center, self.member(center, source))
                        for center in allowed
                    )
                )
            )
        return solver

    def rows_from_model(self, model: z3.ModelRef) -> tuple[shadow.ClassRow, ...]:
        blocker_image = {
            model.eval(variable).as_long() for variable in self.blocker.values()
        }
        rows = tuple(
            shadow.ClassRow(
                f"global:{center}",
                center,
                self.candidates[center][
                    model.eval(self.row_choice[center]).as_long()
                ],
                exact=center in blocker_image,
            )
            for center in range(self.frame.n)
        )
        robust_support = self.candidates[SECOND_APEX][
            model.eval(self.robust_choice).as_long()
        ]
        return (
            *rows,
            shadow.ClassRow(
                "robust:second-radius",
                SECOND_APEX,
                robust_support,
                exact=False,
            ),
        )

    def blockers_from_model(self, model: z3.ModelRef) -> dict[int, int]:
        return {
            source: model.eval(variable).as_long()
            for source, variable in self.blocker.items()
        }

    def verify(
        self, rows: Iterable[shadow.ClassRow], blockers: dict[int, int]
    ) -> tuple[bool, str | None]:
        rows = tuple(rows)
        ok, reason = shadow.verify_assignment(
            self.frame, set(mc.PROVEN_ROWS), rows
        )
        if not ok:
            return False, reason
        by_center = {
            row.center: row for row in rows if row.name.startswith("global:")
        }
        if set(by_center) != set(range(self.frame.n)):
            return False, "global K4 row coverage drift"
        robust = next(row for row in rows if row.name == "robust:second-radius")
        if by_center[SECOND_APEX].support & robust.support:
            return False, "robust rows are not support-disjoint"
        if SECOND_APEX in set(blockers.values()):
            return False, "robust apex occurs in critical-map image"
        for source, center in blockers.items():
            if center == source:
                return False, f"self blocker {source}"
            if source not in by_center[center].support:
                return False, f"source {source} absent from blocker row {center}"
            if not by_center[center].exact:
                return False, f"blocker row {center} not exact"
        return True, None


def serialize(surface: Surface, rows: tuple[shadow.ClassRow, ...], blockers: dict[int, int]) -> dict[str, Any]:
    payload_rows = [
        {
            "name": row.name,
            "center": row.center,
            "support": sorted(row.support),
            "exact": row.exact,
        }
        for row in rows
    ]
    return {
        "profile": list(PROFILE),
        "carrier_card": surface.frame.n,
        "physical_second_apex": SECOND_APEX,
        "physical_second_opposite_cap": sorted(surface.frame.O1),
        "physical_second_opposite_cap_card": len(surface.frame.O1),
        "rows": payload_rows,
        "blockers": {str(source): center for source, center in blockers.items()},
        "row_sha256": canonical_sha256(payload_rows),
        "blocker_sha256": canonical_sha256(blockers),
    }


def bank_matches(
    surface: Surface, rows: tuple[shadow.ClassRow, ...]
) -> tuple[dict[str, Any], ...]:
    metric_rows = tuple(
        producer_bank.MetricRow(
            row.center, tuple(sorted(row.support)), exact=row.exact
        )
        for row in rows
    )
    return tuple(
        dict(match)
        for match in producer_bank.scan_all_formalized_cores(
            metric_rows,
            surface.frame.n,
            shadow.hull_order(surface.frame),
        )
    )


def run(max_iterations: int, require_bank_clean: bool) -> dict[str, Any]:
    surface = Surface()
    solver = surface.solver()
    refinements = []
    for iteration in range(1, max_iterations + 1):
        verdict = solver.check()
        if verdict == z3.unknown:
            return {
                "status": "UNKNOWN_FAIL_CLOSED",
                "reason": solver.reason_unknown(),
                "iterations": iteration,
            }
        if verdict == z3.unsat:
            return {
                "status": "UNSAT_REPRESENTED_FINITE_SURFACE",
                "iterations": iteration,
                "refinements": refinements,
            }
        model = solver.model()
        rows = surface.rows_from_model(model)
        blockers = surface.blockers_from_model(model)
        ok, reason = surface.verify(rows, blockers)
        if ok:
            matches = bank_matches(surface, rows)
            if require_bank_clean and matches:
                choices = {
                    center: model.eval(variable).as_long()
                    for center, variable in surface.row_choice.items()
                }
                robust_choice = model.eval(surface.robust_choice).as_long()
                blocker_choices = {
                    source: model.eval(variable).as_long()
                    for source, variable in surface.blocker.items()
                }
                solver.add(
                    z3.Or(
                        *(
                            surface.row_choice[center] != choice
                            for center, choice in choices.items()
                        ),
                        surface.robust_choice != robust_choice,
                        *(
                            surface.blocker[source] != center
                            for source, center in blocker_choices.items()
                        ),
                    )
                )
                refinements.append(
                    {
                        "reason": "producer-bank-match",
                        "stages": sorted(
                            {str(match["stage"]) for match in matches}
                        ),
                    }
                )
                continue
            witness = serialize(surface, rows, blockers)
            witness["producer_bank_matches"] = matches
            return {
                "status": (
                    "SAT_BANK_CLEAN_FINITE_STRUCTURAL_SHADOW_ONLY"
                    if require_bank_clean
                    else "SAT_FINITE_STRUCTURAL_SHADOW_ONLY"
                ),
                "iterations": iteration,
                "refinements": refinements,
                "witness": witness,
            }

        # Pair-local verifier failures get pair-local CEGAR clauses.  Unknown
        # wording falls back to blocking the full represented assignment.
        assert reason is not None
        choices = {
            center: model.eval(variable).as_long()
            for center, variable in surface.row_choice.items()
        }
        robust_choice = model.eval(surface.robust_choice).as_long()
        global_pair = INCOMPATIBLE_GLOBAL_RE.fullmatch(reason)
        robust_pair = INCOMPATIBLE_ROBUST_RE.fullmatch(reason)
        if global_pair is not None:
            left, right = map(int, global_pair.groups())
            solver.add(
                z3.Or(
                    surface.row_choice[left] != choices[left],
                    surface.row_choice[right] != choices[right],
                )
            )
        elif robust_pair is not None:
            center = int(robust_pair.group(1))
            solver.add(
                z3.Or(
                    surface.row_choice[center] != choices[center],
                    surface.robust_choice != robust_choice,
                )
            )
        else:
            solver.add(
                z3.Or(
                    *(
                        surface.row_choice[center] != choice
                        for center, choice in choices.items()
                    ),
                    surface.robust_choice != robust_choice,
                )
            )
        refinements.append({"reason": reason})
    return {
        "status": "ITERATION_BUDGET_FAIL_CLOSED",
        "iterations": max_iterations,
        "refinements": refinements,
    }


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--max-iterations", type=int, default=500)
    parser.add_argument("--require-bank-clean", action="store_true")
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--summary", action="store_true")
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    result = run(args.max_iterations, args.require_bank_clean)
    result_path = BANK_CLEAN_RESULTS if args.require_bank_clean else RESULTS
    if args.check and result_path.exists():
        expected = json.loads(result_path.read_text(encoding="utf-8"))
        if json.dumps(result, sort_keys=True) != json.dumps(expected, sort_keys=True):
            raise RuntimeError("stored robust critical-map regression drift")
    elif not args.check:
        result_path.write_text(
            json.dumps(result, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
    if args.summary:
        witness = result.get("witness", {})
        print(
            json.dumps(
                {
                    "status": result["status"],
                    "iterations": result["iterations"],
                    "profile": witness.get("profile"),
                    "carrier_card": witness.get("carrier_card"),
                    "cap_card": witness.get("physical_second_opposite_cap_card"),
                    "row_sha256": witness.get("row_sha256"),
                    "blocker_sha256": witness.get("blocker_sha256"),
                },
                sort_keys=True,
            )
        )
    else:
        print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

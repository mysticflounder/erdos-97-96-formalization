#!/usr/bin/env python3
"""Quick source-backed branch probe layered on the generic v4 frontend.

This diagnostic keeps v4's named necessary-condition projection and adds the
smallest missing consequence already proved in Lean: equal actual blockers
have equal canonical selected-four supports.

The other audited candidate, indexed strict-cap localization of each actual
blocker center, is already entailed by v4: actual blockers are excluded from
all three apices, every named non-apex lies in exactly one cap, and each cap's
endpoints are apices.  It is therefore used below but not redundantly re-added.

The seven branch formulas are the literal decision tree obtained after choosing
strict-cap indices for ``bs`` and ``bq``.  Branches 1--6 partition the
no-alignment side.  Branch 7 is the positive alignment arm, so it is expected
to conflict with v4's retained ``hnoAlignment`` assumption.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import sys
import time
from pathlib import Path

import z3


MODEL_PATH = Path(__file__).with_name("model.py")
SPEC = importlib.util.spec_from_file_location(
    "fresh_third_no_alignment_generic_v4", MODEL_PATH
)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError(f"could not load {MODEL_PATH}")
v4 = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = v4
SPEC.loader.exec_module(v4)


SCHEMA_VERSION = "p97-fresh-third-no-alignment-generic-v5-branch-probe"
BRANCH_DESCRIPTIONS = {
    1: "bs = bq",
    2: "bs != bq and q1 is outside the source selected support",
    3: "bs != bq, q1 is in the source support, q2 is outside it",
    4: "distinct blockers, both row hits, distinct strict-cap indices",
    5: "distinct blockers, both row hits, same cap, q1 lies in that cap",
    6: (
        "distinct blockers, both row hits, same cap, q1 off-cap and "
        "q2 on-cap"
    ),
    7: (
        "distinct blockers, both row hits, same cap, q1 and q2 off-cap "
        "(positive alignment arm)"
    ),
}
WITNESS_REFINEMENTS = (
    "none",
    "branch2-cap0-cap2-both-row-miss",
    "branch3-q1-s2",
)


class StrengthenedEncoding(v4.FreshThirdEncoding):
    """v4 plus the missing support-coherence consequence and one branch."""

    def __init__(
        self,
        *,
        branch: int,
        surplus_index: int = 0,
        timeout_ms: int = 60_000,
        random_seed: int = 0,
    ) -> None:
        super().__init__(
            surplus_index=surplus_index,
            timeout_ms=timeout_ms,
            random_seed=random_seed,
        )
        self.branch = branch
        self.add(
            "proved_coincident_blocker_selected_support_equality",
            z3.Implies(
                self.same("bs", "bq"),
                self.support_set_equal_formula(
                    v4.SOURCE_SUPPORT, v4.Q1_SUPPORT
                ),
            ),
        )
        self.add(
            f"requested_exact_branch_{branch}", self.branch_formula(branch)
        )

    def common_strict_cap_arm(self, cap: int) -> z3.BoolRef:
        return z3.And(
            self.in_strict_cap_interior("bs", cap),
            self.in_strict_cap_interior("bq", cap),
        )

    def branch_formula(self, branch: int) -> z3.BoolRef:
        if branch not in BRANCH_DESCRIPTIONS:
            raise ValueError(f"unknown branch: {branch}")

        blockers_distinct = self.different("bs", "bq")
        q1_in_row = self.in_support("q1", v4.SOURCE_SUPPORT)
        q2_in_row = self.in_support("q2", v4.SOURCE_SUPPORT)
        common_cap = [
            self.common_strict_cap_arm(cap) for cap in range(3)
        ]

        if branch == 1:
            return self.same("bs", "bq")
        if branch == 2:
            return z3.And(blockers_distinct, z3.Not(q1_in_row))
        if branch == 3:
            return z3.And(
                blockers_distinct, q1_in_row, z3.Not(q2_in_row)
            )
        if branch == 4:
            return z3.And(
                blockers_distinct,
                q1_in_row,
                q2_in_row,
                *(z3.Not(arm) for arm in common_cap),
            )
        if branch == 5:
            return z3.And(
                blockers_distinct,
                q1_in_row,
                q2_in_row,
                z3.Or(
                    *(
                        z3.And(common_cap[cap], self.in_cap("q1", cap))
                        for cap in range(3)
                    )
                ),
            )
        if branch == 6:
            return z3.And(
                blockers_distinct,
                q1_in_row,
                q2_in_row,
                z3.Or(
                    *(
                        z3.And(
                            common_cap[cap],
                            z3.Not(self.in_cap("q1", cap)),
                            self.in_cap("q2", cap),
                        )
                        for cap in range(3)
                    )
                ),
            )
        return z3.And(
            blockers_distinct,
            q1_in_row,
            q2_in_row,
            z3.Or(
                *(
                    z3.And(
                        common_cap[cap],
                        z3.Not(self.in_cap("q1", cap)),
                        z3.Not(self.in_cap("q2", cap)),
                    )
                    for cap in range(3)
                )
            ),
        )

    def apply_sat_witness_refinement(self, refinement: str) -> None:
        """Choose a smaller case solely to find a SAT witness.

        These are not source consequences and must never be used to interpret
        an UNSAT result.  A SAT result does lift to the unrefined branch.
        """
        if refinement == "none":
            return
        if refinement == "branch2-cap0-cap2-both-row-miss":
            if self.branch != 2 or self.surplus_index != 0:
                raise ValueError(
                    "branch2 refinement requires branch 2 and surplus index 0"
                )
            self.add(
                "optional_sat_witness_refinement",
                self.in_strict_cap_interior("bs", 0),
                self.in_strict_cap_interior("bq", 2),
                z3.Not(self.in_support("q2", v4.SOURCE_SUPPORT)),
            )
            return
        if refinement == "branch3-q1-s2":
            if self.branch != 3:
                raise ValueError("branch3 refinement requires branch 3")
            self.add(
                "optional_sat_witness_refinement", self.same("q1", "s2")
            )
            return
        raise ValueError(f"unknown SAT witness refinement: {refinement}")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--branch", type=int, choices=range(1, 8), required=True)
    parser.add_argument("--surplus-index", type=int, choices=(0, 1, 2), default=0)
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--random-seed", type=int, default=0)
    parser.add_argument(
        "--sat-witness-refinement",
        choices=WITNESS_REFINEMENTS,
        default="none",
        help=(
            "optional case choice used only to exhibit SAT; an UNSAT result "
            "with this option has no branch-level force"
        ),
    )
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    if not 1 <= args.timeout_ms <= 60_000:
        parser.error("--timeout-ms must be between 1 and 60000")
    return args


def main() -> int:
    args = parse_args()
    encoding = StrengthenedEncoding(
        branch=args.branch,
        surplus_index=args.surplus_index,
        timeout_ms=args.timeout_ms,
        random_seed=args.random_seed,
    )
    encoding.apply_sat_witness_refinement(args.sat_witness_refinement)
    started = time.monotonic()
    status = encoding.solver.check()
    elapsed = time.monotonic() - started
    payload = encoding.payload(status, elapsed, "free", "free")
    payload.update(
        {
            "schema": SCHEMA_VERSION,
            "requested_exact_branch": args.branch,
            "requested_exact_branch_description": BRANCH_DESCRIPTIONS[
                args.branch
            ],
            "optional_sat_witness_refinement": args.sat_witness_refinement,
            "sat_witness_refinement_scope": (
                "SAT lifts to the exact branch; refined UNSAT would not."
            ),
            "v5_strengthenings": [
                (
                    "bs = bq implies equality of the source and q1 canonical "
                    "selected-four supports"
                ),
            ],
            "v4_already_entails": [
                (
                    "actual bs and bq each lie in some indexed strict cap "
                    "interior"
                )
            ],
            "branch_7_note": (
                "Branch 7 is the positive alignment arm and directly "
                "contradicts the retained hnoAlignment formula."
            ),
        }
    )
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(rendered, end="")
    else:
        args.output.write_text(rendered)
        print(args.output)
    return 0 if status in (z3.sat, z3.unsat) else 2


if __name__ == "__main__":
    raise SystemExit(main())

#!/usr/bin/env python3
"""Decision gate for the exact-five card-13 distinct-radius cross-color arm.

This is a focused extension of ``exact5-full-role-retained-gate``.  It keeps
the complete card-13 parent projection, restricts to an asymmetric global
cover-star orbit, imposes the kernel-checked distinct-radius conclusions, and
then asks whether the two outside points of the two-hit row can use opposite
first-apex classes.

The output is exact only within the encoded finite plus rational
triangle/Kalmanson abstraction.  It is not a planar or MEC realization.
"""

from __future__ import annotations

import argparse
import json
import sys
import time
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
BASE = ROOT / "scratch/atail-force/exact5-global-cover-parent-gate"
FOCUS = ROOT / "scratch/atail-force/exact5-full-role-retained-gate"
sys.path.insert(0, str(BASE))
sys.path.insert(0, str(FOCUS))

from encode import Outer as BaseOuter  # noqa: E402
from verify import (  # noqa: E402
    FIRST_APEX,
    N,
    ORBIT_ROLES,
    PHYSICAL_CAP,
    PHYSICAL_INTERIOR,
    VERTICES,
    sink_sccs,
)
from decision import (  # noqa: E402
    FocusOuter,
    STRICT_FIRST_OPPOSITE,
    linear_check,
    verify_focus,
)


ASYMMETRIC_ORBITS = (
    "asymmetricSourceLeft",
    "asymmetricSourceRight",
)


class DistinctCrossOuter(FocusOuter):
    """Full retained-role gate specialized to the strict cross-color case."""

    def __init__(self, orbit: str, timeout_ms: int, seed: int) -> None:
        if orbit not in ASYMMETRIC_ORBITS:
            raise ValueError(orbit)
        self.radius_arm = "distinct"
        BaseOuter.__init__(self, orbit, timeout_ms, seed)

        # Reuse the exact retained-row and ordinal-distance contract, without
        # the all-one-only constructor guard in FocusOuter's initializer.
        finite_assertions = self.solver.assertions()
        self.solver = z3.Solver()
        self.solver.set(timeout=timeout_ms, random_seed=seed)
        self.solver.add(*finite_assertions)
        self.parent_first = [
            z3.Bool(f"parent_first_{point}") for point in VERTICES
        ]
        self.parent_second = [
            z3.Bool(f"parent_second_{point}") for point in VERTICES
        ]
        FocusOuter._add_focused_contract(self)
        self._add_distinct_cross_contract()

    def _add_distinct_cross_contract(self) -> None:
        solver = self.solver
        roles = ORBIT_ROLES[self.orbit]
        hub = roles["hub"]

        # Kernel-checked card-13 coupling:
        # R.common.packet.B1 = P.doubleRow.support.
        for point in VERTICES:
            solver.add(self.parent_first[point] == self.b1[point])

        # The residual under audit assumes both outside points lie in the
        # strict first opposite cap.  Since the hub row already contains its
        # source and third physical vertices, these are exactly its other two
        # support points.
        solver.add(z3.PbEq([
            (self.m[hub, point], 1)
            for point in sorted(STRICT_FIRST_OPPOSITE)
        ], 2))
        for point in VERTICES:
            if point not in PHYSICAL_INTERIOR | STRICT_FIRST_OPPOSITE:
                solver.add(z3.Not(self.m[hub, point]))

        # The checked crossing theorem says the outside pair uses the two
        # complete first-apex classes once each.  The exact-class partition
        # already makes every strict point belong to exactly one class.
        solver.add(z3.PbEq([
            (z3.And(self.m[hub, point], self.m[FIRST_APEX, point]), 1)
            for point in sorted(STRICT_FIRST_OPPOSITE)
        ], 1))
        solver.add(z3.PbEq([
            (z3.And(self.m[hub, point], self.b1[point]), 1)
            for point in sorted(STRICT_FIRST_OPPOSITE)
        ], 1))

    def decode(self, model: z3.ModelRef) -> dict[str, object]:
        return FocusOuter.decode(self, model)

    def assignment_atoms(
        self, decoded: dict[str, object]
    ) -> list[z3.BoolRef]:
        return FocusOuter.assignment_atoms(self, decoded)

    def block_full(self, decoded: dict[str, object]) -> None:
        FocusOuter.block_full(self, decoded)

    def block_core(self, core: list[str], decoded: dict[str, object]) -> bool:
        return FocusOuter.block_core(self, core, decoded)


def verify_cross(decoded: dict[str, object]) -> list[str]:
    errors = verify_focus(decoded)
    if decoded["orbit"] not in ASYMMETRIC_ORBITS:
        errors.append("not an asymmetric orbit")
        return errors
    roles = ORBIT_ROLES[str(decoded["orbit"])]
    hub = roles["hub"]
    rows = {int(center): set(support)
            for center, support in decoded["rows"].items()}
    retained = rows[FIRST_APEX]
    double = set(decoded["b1"])
    parent_first = set(decoded["parent_first"])
    outside = rows[hub] - set(PHYSICAL_CAP)
    if parent_first != double:
        errors.append("parent first row is not the complete double class")
    if len(outside) != 2 or not outside <= STRICT_FIRST_OPPOSITE:
        errors.append("asymmetric outside pair is not the strict-cap pair")
    if len(outside & retained) != 1 or len(outside & double) != 1:
        errors.append("outside pair does not cross the two exact classes")
    return errors


def solve(orbit: str, seconds: float, seed: int) -> dict[str, object]:
    started = time.monotonic()
    deadline = started + seconds
    outer = DistinctCrossOuter(orbit, max(1, int(seconds * 1000)), seed)
    counters = {
        "outer_candidates": 0,
        "metric_unsat": 0,
        "focused_core_blocks": 0,
        "full_assignment_blocks": 0,
        "connectivity_cuts": {"m": 0, "g0": 0, "g1": 0},
    }
    first_core: list[str] | None = None
    while True:
        remaining_ms = int((deadline - time.monotonic()) * 1000)
        if remaining_ms <= 0:
            return {
                "schema": "p97-exact5-card13-distinct-cross-v1",
                "status": "UNKNOWN",
                "reason": "wall budget",
                "orbit": orbit,
                "counters": counters,
                "first_core": first_core,
            }
        outer.solver.set(timeout=max(1, remaining_ms), random_seed=seed)
        status = outer.solver.check()
        if status == z3.unsat:
            return {
                "schema": "p97-exact5-card13-distinct-cross-v1",
                "status": "UNSAT",
                "orbit": orbit,
                "counters": counters,
                "first_core": first_core,
                "certificate": "none; solver verdict only",
            }
        if status == z3.unknown:
            return {
                "schema": "p97-exact5-card13-distinct-cross-v1",
                "status": "UNKNOWN",
                "reason": f"outer: {outer.solver.reason_unknown()}",
                "orbit": orbit,
                "counters": counters,
                "first_core": first_core,
            }

        decoded = outer.decode(outer.solver.model())
        families = [
            {int(center): set(support)
             for center, support in decoded["rows"].items()},
            *[
                {int(center): set(support)
                 for center, support in raw.items()}
                for raw in decoded["cover_rows"]
            ],
        ]
        symbolic = [outer.m, *outer.cover]
        added_cut = False
        for name, family, symbolic_family in zip(
            ("m", "g0", "g1"), families, symbolic, strict=True
        ):
            for component in sink_sccs(family):
                if len(component) < N:
                    outer.add_connectivity_cut(symbolic_family, component)
                    counters["connectivity_cuts"][name] += 1
                    added_cut = True
        if added_cut:
            continue

        errors = verify_cross(decoded)
        if errors:
            return {
                "schema": "p97-exact5-card13-distinct-cross-v1",
                "status": "ENCODER_ERROR",
                "orbit": orbit,
                "errors": errors,
            }
        counters["outer_candidates"] += 1
        metric = linear_check(decoded, min(10_000, remaining_ms), seed)
        if metric["status"] == "SAT":
            return {
                "schema": "p97-exact5-card13-distinct-cross-v1",
                "status": "SAT",
                "label": "SAT_VERIFIED_EXACT5_CARD13_DISTINCT_CROSS_LRA_SHADOW",
                "orbit": orbit,
                "counters": counters,
                "decoded": decoded,
                "distances": metric["distances"],
                "omitted": [
                    "rank-two Euclidean coordinate realization",
                    "MEC containment and nonobtuse support geometry",
                    "noM44 over all alternative support triangles",
                    "full subset minimality beyond selected-row connectivity",
                ],
            }
        if metric["status"] == "UNKNOWN":
            return {
                "schema": "p97-exact5-card13-distinct-cross-v1",
                "status": "UNKNOWN",
                "reason": f"metric: {metric.get('reason', 'unknown')}",
                "orbit": orbit,
                "counters": counters,
                "first_core": first_core,
            }
        if metric["status"] == "ENCODER_ERROR":
            return {
                "schema": "p97-exact5-card13-distinct-cross-v1",
                "status": "ENCODER_ERROR",
                "orbit": orbit,
                **metric,
            }

        counters["metric_unsat"] += 1
        core = list(metric.get("core", []))
        if first_core is None:
            first_core = core
        if core and outer.block_core(core, decoded):
            counters["focused_core_blocks"] += 1
        else:
            outer.block_full(decoded)
            counters["full_assignment_blocks"] += 1


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orbit", choices=ASYMMETRIC_ORBITS, required=True)
    parser.add_argument("--seconds", type=float, default=60.0)
    parser.add_argument("--seed", type=int, default=1)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = solve(args.orbit, args.seconds, args.seed)
    payload = json.dumps(result, indent=2, sort_keys=True)
    if args.output is not None:
        args.output.write_text(payload + "\n")
    print(payload)


if __name__ == "__main__":
    main()

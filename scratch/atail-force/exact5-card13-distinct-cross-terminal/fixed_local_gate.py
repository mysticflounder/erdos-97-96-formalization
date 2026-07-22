#!/usr/bin/env python3
"""Try to complete the verified local LRA witness to the full finite parent.

The key rows are fixed to ``local-lra.json``.  The solver must fill the total
critical map, all selected rows, the two global-cover row families, and their
connectivity constraints.  The inherited ordinal prefilter is enabled only
after fixing these roles, avoiding the unconstrained mixed-solver stall seen
in the broad decision surface.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import time
from pathlib import Path

import z3

HERE = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location(
    "distinct_cross_decision", HERE / "decision.py"
)
assert SPEC is not None and SPEC.loader is not None
DECISION = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(DECISION)

DistinctCrossOuter = DECISION.DistinctCrossOuter
linear_check = DECISION.linear_check
verify_cross = DECISION.verify_cross
FIRST_APEX = DECISION.FIRST_APEX
N = DECISION.N
ORBIT_ROLES = DECISION.ORBIT_ROLES
SECOND_APEX = 8
VERTICES = DECISION.VERTICES
sink_sccs = DECISION.sink_sccs


RETAINED = frozenset({3, 5, 9, 10})
DOUBLE = frozenset({2, 6, 11, 12})
SECOND_CLASS = frozenset({0, 1, 2, 3, 4})
TWO_HIT = frozenset({1, 3, 9, 11})
PARENT_SECOND = frozenset({0, 1, 2, 3})
Q = 9
W = 3


def fix_row(solver: z3.Solver, row: list[z3.BoolRef], support: frozenset[int]) -> None:
    for point in VERTICES:
        solver.add(row[point] == z3.BoolVal(point in support))


def solve(seconds: float, seed: int, ordinal: bool) -> dict[str, object]:
    started = time.monotonic()
    deadline = started + seconds
    orbit = "asymmetricSourceLeft"
    outer = DistinctCrossOuter(orbit, max(1, int(seconds * 1000)), seed)
    roles = ORBIT_ROLES[orbit]
    hub = roles["hub"]
    source = roles["source"]

    fix_row(outer.solver, [outer.m[FIRST_APEX, p] for p in VERTICES], RETAINED)
    fix_row(outer.solver, outer.b1, DOUBLE)
    fix_row(outer.solver, outer.shell, SECOND_CLASS)
    fix_row(outer.solver, [outer.m[hub, p] for p in VERTICES], TWO_HIT)
    fix_row(outer.solver, outer.parent_first, DOUBLE)
    fix_row(outer.solver, outer.parent_second, PARENT_SECOND)
    outer.solver.add(outer.q == Q, outer.w == W, outer.blocker[source] == hub)

    # All triangle/Kalmanson inequalities and all selected-row equalities.
    if ordinal:
        outer._add_ordinal_prefilter()
    cuts = {"m": 0, "g0": 0, "g1": 0}
    while True:
        remaining_ms = int((deadline - time.monotonic()) * 1000)
        if remaining_ms <= 0:
            return {
                "status": "UNKNOWN",
                "reason": "wall budget",
                "ordinal_prefilter": ordinal,
                "connectivity_cuts": cuts,
            }
        outer.solver.set(timeout=max(1, remaining_ms), random_seed=seed)
        status = outer.solver.check()
        if status == z3.unsat:
            return {
                "status": "UNSAT",
                "certificate": "none; fixed-role solver verdict only",
                "ordinal_prefilter": ordinal,
                "connectivity_cuts": cuts,
            }
        if status == z3.unknown:
            return {
                "status": "UNKNOWN",
                "reason": outer.solver.reason_unknown(),
                "ordinal_prefilter": ordinal,
                "connectivity_cuts": cuts,
            }
        decoded = outer.decode(outer.solver.model())
        families = [
            {int(center): set(support) for center, support in decoded["rows"].items()},
            *[
                {int(center): set(support) for center, support in raw.items()}
                for raw in decoded["cover_rows"]
            ],
        ]
        symbolic = [outer.m, *outer.cover]
        added = False
        for name, family, symbolic_family in zip(
            ("m", "g0", "g1"), families, symbolic, strict=True
        ):
            for component in sink_sccs(family):
                if len(component) < N:
                    outer.add_connectivity_cut(symbolic_family, component)
                    cuts[name] += 1
                    added = True
        if added:
            continue
        errors = verify_cross(decoded)
        if errors:
            return {"status": "ENCODER_ERROR", "errors": errors}
        metric = linear_check(decoded, min(30_000, remaining_ms), seed)
        return {
            "status": metric["status"],
            "label": "FIXED_LOCAL_FULL_PARENT_COMPLETION",
            "ordinal_prefilter": ordinal,
            "connectivity_cuts": cuts,
            "decoded": decoded,
            "metric": metric,
        }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--seconds", type=float, default=300.0)
    parser.add_argument("--seed", type=int, default=17)
    parser.add_argument("--no-ordinal", action="store_true")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    payload = solve(args.seconds, args.seed, not args.no_ordinal)
    text = json.dumps(payload, indent=2, sort_keys=True)
    if args.output is not None:
        args.output.write_text(text + "\n")
    print(text)


if __name__ == "__main__":
    main()

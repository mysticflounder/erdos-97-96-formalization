#!/usr/bin/env python3
"""QF_NRA order-case diagnostic for the equal-blocker first-fiber core."""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path

import z3


SOURCES = ("p1", "p2", "r1", "r2", "q1", "q2")
POINTS = ("a1", "a2", "bp", "br", "bq", *SOURCES)
WITNESS_ORDER = ("p1", "q1", "q2", "p2", "r2", "r1")
RATIONAL_WITNESS = {
    "a1": (0, 0),
    "a2": (0, -1),
    "bp": (0, 1),
    "br": (0, 4),
    "bq": (0, 3),
    "p1": (-2, 5),
    "p2": (2, 5),
    "r1": (-3, 10),
    "r2": (3, 10),
    "q1": (-1, 2),
    "q2": (1, 2),
}


def sqdist(points: dict[str, tuple[z3.ArithRef, z3.ArithRef]], u: str, v: str):
    ux, uy = points[u]
    vx, vy = points[v]
    return (ux - vx) ** 2 + (uy - vy) ** 2


def orient(
    points: dict[str, tuple[z3.ArithRef, z3.ArithRef]], a: str, b: str, c: str
):
    ax, ay = points[a]
    bx, by = points[b]
    cx, cy = points[c]
    return (bx - ax) * (cy - ay) - (by - ay) * (cx - ax)


def build_case(order: tuple[str, ...], timeout_ms: int, replay_witness: bool = False):
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms)
    points = {name: z3.Reals(f"{name}_x {name}_y") for name in POINTS}

    # Safe Euclidean normalization: translation sends a1 to the origin.
    solver.add(points["a1"][0] == 0, points["a1"][1] == 0)

    # All six sources are distinct points on one strict cap arc.  Their exact
    # boundary order is not known, so each invocation supplies one order case.
    for i, j, k in itertools.combinations(range(len(order)), 3):
        solver.add(orient(points, order[i], order[j], order[k]) > 0)

    # Three distinct first-apex radii.
    dp = sqdist(points, "a1", "p1")
    dr = sqdist(points, "a1", "r1")
    dq = sqdist(points, "a1", "q1")
    solver.add(dp > 0, dr > 0, dq > 0)
    solver.add(dp == sqdist(points, "a1", "p2"))
    solver.add(dr == sqdist(points, "a1", "r2"))
    solver.add(dq == sqdist(points, "a1", "q2"))
    solver.add(dp != dr, dp != dq, dr != dq)

    # Exact equal-distance consequences of the three equal-blocker rows.
    solver.add(sqdist(points, "bp", "p1") == sqdist(points, "bp", "p2"))
    solver.add(sqdist(points, "br", "r1") == sqdist(points, "br", "r2"))
    solver.add(sqdist(points, "bq", "q1") == sqdist(points, "bq", "q2"))
    solver.add(sqdist(points, "bp", "p1") > 0)
    solver.add(sqdist(points, "br", "r1") > 0)
    solver.add(sqdist(points, "bq", "q1") > 0)

    # The three blocker values are distinct; the fresh blocker is not either
    # opposite apex.
    solver.add(
        z3.Or(
            points["a1"][0] != points["a2"][0],
            points["a1"][1] != points["a2"][1],
        )
    )
    for u, v in (("bp", "br"), ("bp", "bq"), ("br", "bq")):
        solver.add(z3.Or(points[u][0] != points[v][0], points[u][1] != points[v][1]))
    for apex in ("a1", "a2"):
        solver.add(
            z3.Or(
                points["bq"][0] != points[apex][0],
                points["bq"][1] != points[apex][1],
            )
        )

    # Each CrossPairDeletionView omits at least one endpoint from q1's exact
    # selected row.  Since q1 and q2 share bq and its selected radius, this is
    # exactly a disjunction of squared-distance inequalities.
    solver.add(
        z3.Or(
            sqdist(points, "bq", "p1") != sqdist(points, "bq", "q1"),
            sqdist(points, "bq", "p2") != sqdist(points, "bq", "q1"),
        )
    )
    solver.add(
        z3.Or(
            sqdist(points, "bq", "r1") != sqdist(points, "bq", "q1"),
            sqdist(points, "bq", "r2") != sqdist(points, "bq", "q1"),
        )
    )
    if replay_witness:
        for name, (x_value, y_value) in RATIONAL_WITNESS.items():
            solver.add(points[name][0] == x_value, points[name][1] == y_value)
    return solver, points


def value_text(model: z3.ModelRef, value: z3.ArithRef) -> str:
    return str(model.eval(value, model_completion=True))


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-ms", type=int, default=10_000)
    parser.add_argument("--output", type=Path)
    parser.add_argument(
        "--all-orders",
        action="store_true",
        help="search all 120 cases instead of replaying the exact SAT witness",
    )
    args = parser.parse_args()

    # Fix p1 as the cyclic starting label.  The 5! permutations include both
    # orientations, so no reflection or relative-order case is assumed.  One
    # exact rational case suffices to prove that their existential union is SAT.
    orders = (
        [("p1", *tail) for tail in itertools.permutations(SOURCES[1:])]
        if args.all_orders
        else [WITNESS_ORDER]
    )
    counts = {"sat": 0, "unsat": 0, "unknown": 0}
    first_sat = None
    unknown_reasons: dict[str, int] = {}

    for order in orders:
        solver, points = build_case(
            order, args.timeout_ms, replay_witness=not args.all_orders
        )
        status = solver.check()
        key = str(status)
        counts[key] += 1
        if status == z3.sat and first_sat is None:
            model = solver.model()
            first_sat = {
                "cyclic_order": list(order),
                "coordinates": {
                    name: [value_text(model, x), value_text(model, y)]
                    for name, (x, y) in points.items()
                },
            }
        elif status == z3.unknown:
            reason = solver.reason_unknown()
            unknown_reasons[reason] = unknown_reasons.get(reason, 0) + 1

    verdict = "SAT" if counts["sat"] else ("UNKNOWN" if counts["unknown"] else "UNSAT")
    result = {
        "verdict": verdict,
        "logic": "QF_NRA",
        "solver": f"Z3 {z3.get_version_string()}",
        "timeout_ms_per_case": args.timeout_ms,
        "order_case_space": 120,
        "order_cases_checked": len(orders),
        "mode": "all-order search" if args.all_orders else "exact rational witness replay",
        "counts": counts,
        "unknown_reasons": unknown_reasons,
        "first_sat_model": first_sat,
    }
    rendered = json.dumps(result, indent=2, sort_keys=True)
    if args.output:
        args.output.write_text(rendered + "\n")
    print(rendered)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

#!/usr/bin/env python3
"""Exact QF_NRA probe for one card-three continuation-order cap word.

The numerical continuation-order probe records a role-faithful equality and
cap contract but cannot distinguish a near boundary from an infeasible cell.
This script turns one *fixed* cyclic word of that contract into exact real
arithmetic for Z3/NLSAT.  It is deliberately a cell probe: UNSAT eliminates
only the supplied word, while SAT is an exact local countermodel to any claim
that this displayed-role contract is already contradictory.

The omitted full-parent data is listed in the JSON result.  Solver output is
discovery evidence, not a Lean proof or a coverage claim.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Iterable

import z3

from search_card3_continuation_order_one_hit import CAP_CELL, OUTSIDE_NAMES


BASE = ("o", "left", "right", "q0", "q1", "q2", "u")
NAMES = BASE + OUTSIDE_NAMES
ROWS = {
    "source": ("blocker_source", ("q0", "source_x0", "source_x1", "source_x2")),
    "target": ("blocker_target", ("q2", "target_x0", "target_x1", "target_x2")),
    "unused": ("blocker_unused", ("u", "q1", "unused_x0", "unused_x1")),
}
PHYSICAL_EXACT_FIVE = {"left", "q0", "q1", "q2", "right"}


def d2(
    points: dict[str, tuple[z3.ArithRef, z3.ArithRef]], left: str, right: str
) -> z3.ArithRef:
    dx = points[left][0] - points[right][0]
    dy = points[left][1] - points[right][1]
    return z3.simplify(dx * dx + dy * dy)


def cross(
    points: dict[str, tuple[z3.ArithRef, z3.ArithRef]], first: str, second: str, third: str
) -> z3.ArithRef:
    abx = points[second][0] - points[first][0]
    aby = points[second][1] - points[first][1]
    acx = points[third][0] - points[first][0]
    acy = points[third][1] - points[first][1]
    return z3.simplify(abx * acy - aby * acx)


def cap_margin(
    points: dict[str, tuple[z3.ArithRef, z3.ArithRef]], name: str, cap: str
) -> z3.ArithRef:
    if cap == "physical":
        apex, first, second = "o", "left", "right"
    elif cap == "lower":
        apex, first, second = "right", "o", "left"
    elif cap == "upper":
        apex, first, second = "left", "right", "o"
    else:
        raise ValueError(cap)
    return z3.simplify(-cross(points, name, first, second) * cross(points, apex, first, second))


def parse_order(text: str) -> tuple[str, ...]:
    order = tuple(part.strip() for part in text.split(",") if part.strip())
    if set(order) != set(NAMES) or len(order) != len(NAMES):
        missing = sorted(set(NAMES) - set(order))
        extra = sorted(set(order) - set(NAMES))
        raise ValueError(f"order must contain every role once; missing={missing}, extra={extra}")
    return order


def add_named(
    solver: z3.Solver, assertions: dict[str, z3.BoolRef], name: str, proposition: z3.BoolRef
) -> None:
    tracker = z3.Bool(name)
    assertions[name] = tracker
    solver.assert_and_track(proposition, tracker)


def build(order: tuple[str, ...], timeout_ms: int) -> tuple[z3.Solver, dict[str, z3.BoolRef]]:
    points: dict[str, tuple[z3.ArithRef, z3.ArithRef]] = {
        name: z3.Reals(f"x_{name} y_{name}") for name in NAMES
    }
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms)
    assertions: dict[str, z3.BoolRef] = {}
    add_named(solver, assertions, "normalize_o", z3.And(points["o"][0] == 0, points["o"][1] == 0))
    add_named(solver, assertions, "normalize_left", z3.And(points["left"][0] == 1, points["left"][1] == 0))
    for name in PHYSICAL_EXACT_FIVE:
        add_named(solver, assertions, f"physical_radius_{name}", d2(points, "o", name) == 1)
    add_named(solver, assertions, "right_upper", points["right"][1] > 0)
    add_named(solver, assertions, "support_triangle_nonobtuse_o", points["right"][0] > 0)
    add_named(solver, assertions, "support_triangle_nonobtuse_left", points["right"][0] < 1)

    for index, first in enumerate(order):
        second = order[(index + 1) % len(order)]
        for third in order:
            if third not in (first, second):
                add_named(solver, assertions, f"ccw_{first}_{second}_{third}",
                          cross(points, first, second, third) > 0)

    for name in ("q0", "u", "q1", "q2"):
        add_named(solver, assertions, f"physical_cap_{name}", cap_margin(points, name, "physical") > 0)
    for name, cap in CAP_CELL.items():
        add_named(solver, assertions, f"{cap}_cap_{name}", cap_margin(points, name, cap) > 0)

    cx, cy, radius2 = z3.Reals("mec_cx mec_cy mec_radius2")
    for name in ("o", "left", "right"):
        add_named(solver, assertions, f"mec_boundary_{name}",
                  (points[name][0] - cx) ** 2 + (points[name][1] - cy) ** 2 == radius2)
    for name in NAMES:
        add_named(solver, assertions, f"mec_contains_{name}",
                  (points[name][0] - cx) ** 2 + (points[name][1] - cy) ** 2 <= radius2)

    for left_index, left in enumerate(NAMES):
        for right in NAMES[:left_index]:
            add_named(solver, assertions, f"distinct_{left}_{right}", d2(points, left, right) > 0)
    for name in NAMES:
        if name not in PHYSICAL_EXACT_FIVE and name != "o":
            add_named(solver, assertions, f"physical_filter_off_{name}", d2(points, "o", name) != 1)

    for row, (center, support) in ROWS.items():
        source = support[0]
        radius = d2(points, center, source)
        for point in support[1:]:
            add_named(solver, assertions, f"{row}_support_{point}", d2(points, center, point) == radius)
        for point in NAMES:
            if point != center and point not in support:
                add_named(solver, assertions, f"{row}_filter_off_{point}", d2(points, center, point) != radius)

    return solver, assertions


def model_point(model: z3.ModelRef, point: tuple[z3.ArithRef, z3.ArithRef]) -> list[str]:
    return [str(model.eval(coordinate, model_completion=True)) for coordinate in point]


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--order", required=True, help="comma-separated cyclic order of all role names")
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    order = parse_order(args.order)
    solver, assertions = build(order, args.timeout_ms)
    verdict = solver.check()
    payload: dict[str, object] = {
        "schema": "p97-exact6-card3-continuation-order-one-hit-qfnra-cell-v1",
        "epistemic_status": "EXACT_QF_NRA_CELL_CHECK_NOT_COVERAGE_OR_LEAN_PROOF",
        "order": order,
        "cap_cell": CAP_CELL,
        "assertion_count": len(assertions),
        "timeout_ms": args.timeout_ms,
        "status": str(verdict),
        "omitted": [
            "all other cyclic words in this cap cell",
            "other role orbits and the unused-zero-hit subcase",
            "full CriticalShellSystem, global K4, bi-apex robustness, minimality, and noM44",
        ],
    }
    if verdict == z3.sat:
        model = solver.model()
        point_variables = {name: z3.Reals(f"x_{name} y_{name}") for name in NAMES}
        payload["model"] = {name: model_point(model, point) for name, point in point_variables.items()}
    elif verdict == z3.unsat:
        payload["unsat_core"] = sorted(str(item) for item in solver.unsat_core())
    else:
        payload["reason_unknown"] = solver.reason_unknown()
    text = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(text)
    print(text, end="")
    return 0 if verdict in (z3.sat, z3.unsat) else 2


if __name__ == "__main__":
    raise SystemExit(main())

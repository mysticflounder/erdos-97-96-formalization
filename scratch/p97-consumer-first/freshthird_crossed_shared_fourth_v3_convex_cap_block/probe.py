#!/usr/bin/env python3
"""Probe the six cap-block survivors in actual convex Euclidean coordinates.

Diagnostic only: SAT is checked again by exact substitution into every emitted
polynomial constraint.  UNSAT has no certificate and is not a Lean result.
"""

from __future__ import annotations

import json
from fractions import Fraction
from pathlib import Path

from z3 import Real, SolverFor, is_rational_value, sat

HERE = Path(__file__).resolve().parent
V2 = HERE.parent / "freshthird_crossed_shared_fourth_v2_cross_inequalities"
ROLES = (
    "firstCenter",
    "commonCenter",
    "oppositeCenter",
    "commonOutside",
    "oppositeOutside",
    "sharedFourth",
)


def sqdist(point, left, right):
    return (point[left][0] - point[right][0]) ** 2 + (point[left][1] - point[right][1]) ** 2


def orient(point, left, middle, right):
    return ((point[middle][0] - point[left][0]) * (point[right][1] - point[left][1])
            - (point[middle][1] - point[left][1]) * (point[right][0] - point[left][0]))


def rational(value):
    if not is_rational_value(value):
        return None
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def exact_check(order, signs, coords):
    point = {name: tuple(Fraction(v) for v in coords[name]) for name in ROLES}
    checks = []
    for i in range(6):
        for j in range(i + 1, 6):
            for k in range(j + 1, 6):
                checks.append(orient(point, order[i], order[j], order[k]) > 0)
    checks.extend((
        sqdist(point, "firstCenter", "commonOutside")
        == sqdist(point, "firstCenter", "oppositeOutside"),
        sqdist(point, "commonCenter", "commonOutside")
        == sqdist(point, "commonCenter", "sharedFourth"),
        sqdist(point, "oppositeCenter", "oppositeOutside")
        == sqdist(point, "oppositeCenter", "sharedFourth"),
    ))
    cross = (
        (sqdist(point, "commonCenter", "oppositeOutside"),
         sqdist(point, "commonCenter", "commonOutside")),
        (sqdist(point, "oppositeCenter", "commonOutside"),
         sqdist(point, "oppositeCenter", "oppositeOutside")),
    )
    checks.extend(left < right if sign == "0" else left > right
                  for (left, right), sign in zip(cross, signs))
    return all(checks), len(checks)


def solve(row):
    order = row["order"]
    signs = row["signs"]
    solver = SolverFor("QF_NRA")
    solver.set(timeout=60_000)
    point = {role: (Real(f"x_{role}"), Real(f"y_{role}")) for role in ROLES}

    # Translation, rotation, reflection, and positive scale normalization.
    first, second = order[:2]
    solver.add(point[first][0] == 0, point[first][1] == 0)
    solver.add(point[second][0] == 1, point[second][1] == 0)
    for role in ROLES:
        solver.add(point[role][0] > -100, point[role][0] < 100)
        solver.add(point[role][1] > -100, point[role][1] < 100)

    # For a linearly listed strict CCW convex polygon, every ordered triple is CCW.
    for i in range(6):
        for j in range(i + 1, 6):
            for k in range(j + 1, 6):
                solver.add(orient(point, order[i], order[j], order[k]) > 0)

    solver.add(sqdist(point, "firstCenter", "commonOutside")
               == sqdist(point, "firstCenter", "oppositeOutside"))
    solver.add(sqdist(point, "commonCenter", "commonOutside")
               == sqdist(point, "commonCenter", "sharedFourth"))
    solver.add(sqdist(point, "oppositeCenter", "oppositeOutside")
               == sqdist(point, "oppositeCenter", "sharedFourth"))
    cross = (
        (sqdist(point, "commonCenter", "oppositeOutside"),
         sqdist(point, "commonCenter", "commonOutside")),
        (sqdist(point, "oppositeCenter", "commonOutside"),
         sqdist(point, "oppositeCenter", "oppositeOutside")),
    )
    for (left, right), sign in zip(cross, signs):
        solver.add(left < right if sign == "0" else left > right)

    status = solver.check()
    out = {"order_index": row["order_index"], "order": order, "signs": signs,
           "z3": str(status)}
    if status != sat:
        return out
    model = solver.model()
    coords = {}
    for role in ROLES:
        pair = [rational(model.eval(term, model_completion=True)) for term in point[role]]
        if None in pair:
            out["exact_rational"] = False
            out["model"] = str(model)
            return out
        coords[role] = [str(pair[0]), str(pair[1])]
    checked, count = exact_check(order, signs, coords)
    out.update({"exact_rational": checked, "exact_checks": count, "coordinates": coords})
    return out


def main():
    summary = json.loads((V2 / "results/contiguous-first-cap-summary.json").read_text())
    rows = [solve(row) for row in summary["sat_rows"]]
    result = {
        "scope": "six strict-Kalmanson survivors with one contiguous three-center cap block",
        "trust": "diagnostic only; UNSAT is uncertified",
        "rows": rows,
        "counts": {
            "total": len(rows),
            "sat": sum(row["z3"] == "sat" for row in rows),
            "unsat": sum(row["z3"] == "unsat" for row in rows),
            "unknown": sum(row["z3"] == "unknown" for row in rows),
            "exact_rational": sum(row.get("exact_rational", False) for row in rows),
        },
    }
    (HERE / "results.json").write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps(result["counts"], sort_keys=True))


if __name__ == "__main__":
    main()

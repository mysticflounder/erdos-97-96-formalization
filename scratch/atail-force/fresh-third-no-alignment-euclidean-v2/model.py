#!/usr/bin/env python3
"""Exact QF_NRA diagnostic for the equal-blocker first-fiber caller.

The search is a disjoint union of:

* every source-permitted blocker alias map; and
* cyclic orders of every distinct named carrier point in that alias case.

A SAT result needs only one branch.  An UNSAT result would require exhausting
the reported branch space without UNKNOWN.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
from pathlib import Path
from typing import Iterable

import z3


APICES = ("a1", "a2", "a3")
SOURCES = ("p1", "p2", "r1", "r2", "q1", "q2")
BLOCKERS = ("bp", "br", "bq")
ALIAS_OPTIONS = {
    "bp": (None, "r1", "r2", "q1", "q2"),
    "br": (None, "p1", "p2", "q1", "q2"),
    "bq": (None, "p1", "p2", "r1", "r2"),
}

# Priority full cyclic branches. bp and br have proved strict first-cap
# placement. A fresh bq is tried on every structural arc.
PRIORITY_CYCLIC_ORDERS = (
    ("a1", "a2", "p1", "q1", "q2", "bq", "p2", "bp", "r2", "br", "r1", "a3"),
    ("a1", "bq", "a2", "p1", "q1", "q2", "p2", "bp", "r2", "br", "r1", "a3"),
    ("a1", "a2", "p1", "q1", "q2", "p2", "bp", "r2", "br", "r1", "a3", "bq"),
    ("a1", "a2", "p1", "bp", "q1", "bq", "q2", "p2", "r2", "br", "r1", "a3"),
    ("a1", "a2", "p1", "q1", "bq", "q2", "bp", "p2", "r2", "br", "r1", "a3"),
)


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


def alias_maps() -> Iterable[dict[str, str]]:
    """Enumerate exactly the blocker/source aliases not excluded by live facts."""
    for bp, br, bq in itertools.product(
        ALIAS_OPTIONS["bp"], ALIAS_OPTIONS["br"], ALIAS_OPTIONS["bq"]
    ):
        chosen = {"bp": bp or "bp", "br": br or "br", "bq": bq or "bq"}
        # The three blocker values are proved pairwise distinct.
        if len(set(chosen.values())) == 3:
            yield chosen


def interior_representatives(alias: dict[str, str]) -> tuple[str, ...]:
    reps = list(SOURCES)
    reps.extend(b for b in BLOCKERS if alias[b] == b)
    return tuple(reps)


def normalized_priority_cyclic_order(
    alias: dict[str, str], proposed: tuple[str, ...]
) -> tuple[str, ...] | None:
    collapsed = [alias.get(name, name) for name in proposed]
    order = tuple(dict.fromkeys(collapsed))
    reps = (*APICES, *interior_representatives(alias))
    if len(order) != len(reps) or set(order) != set(reps) or order[0] != "a1":
        return None
    i2, i3 = order.index("a2"), order.index("a3")
    if not all(i2 < order.index(source) < i3 for source in SOURCES):
        return None
    if not all(
        alias[blocker] != blocker or i2 < order.index(blocker) < i3
        for blocker in ("bp", "br")
    ):
        return None
    return order


def build_case(alias: dict[str, str], cyclic_order: tuple[str, ...], timeout_ms: int):
    reps = (*APICES, *interior_representatives(alias))
    raw = {name: z3.Reals(f"{name}_x {name}_y") for name in reps}
    points = {
        name: raw[alias.get(name, name)]
        for name in (*APICES, *BLOCKERS, *SOURCES)
    }
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms)
    mec_center = z3.Reals("mec_x mec_y")
    mec_radius_sq = z3.Real("mec_radius_sq")

    # Similarity normalization.  a1 and a2 are distinct structural apices.
    solver.add(raw["a1"][0] == 0, raw["a1"][1] == 0)
    solver.add(raw["a2"][0] == 1, raw["a2"][1] == 0)

    # Exact alias-aware strict convexity branch. Every distinct named carrier
    # representative occurs once. All sources lie on the open a2-to-a3 arc.
    for i, j, k in itertools.combinations(range(len(cyclic_order)), 3):
        solver.add(
            orient(points, cyclic_order[i], cyclic_order[j], cyclic_order[k]) > 0
        )

    # The promoted Moser triangle is non-obtuse.
    d12 = sqdist(points, "a1", "a2")
    d13 = sqdist(points, "a1", "a3")
    d23 = sqdist(points, "a2", "a3")
    solver.add(d12 + d13 >= d23, d12 + d23 >= d13, d13 + d23 >= d12)

    # The three apices are on the MEC boundary, and every named carrier
    # representative is enclosed by that same disk.
    def mec_sq(name: str):
        x, y = points[name]
        return (x - mec_center[0]) ** 2 + (y - mec_center[1]) ** 2

    solver.add(mec_radius_sq > 0)
    for apex in APICES:
        solver.add(mec_sq(apex) == mec_radius_sq)
    for representative in reps:
        solver.add(mec_sq(representative) <= mec_radius_sq)

    # Three distinct positive first-apex radii.
    dp = sqdist(points, "a1", "p1")
    dr = sqdist(points, "a1", "r1")
    dq = sqdist(points, "a1", "q1")
    solver.add(dp > 0, dr > 0, dq > 0)
    solver.add(dp == sqdist(points, "a1", "p2"))
    solver.add(dr == sqdist(points, "a1", "r2"))
    solver.add(dq == sqdist(points, "a1", "q2"))
    solver.add(dp != dr, dp != dq, dr != dq)

    # The three common-blocker equal-distance rows, with positive radii.
    for blocker, left, right in (
        ("bp", "p1", "p2"),
        ("br", "r1", "r2"),
        ("bq", "q1", "q2"),
    ):
        radius = sqdist(points, blocker, left)
        solver.add(radius > 0, radius == sqdist(points, blocker, right))

    # q1's exact selected row omits an endpoint of each foreign collision pair.
    qrad = sqdist(points, "bq", "q1")
    solver.add(
        z3.Or(
            sqdist(points, "bq", "p1") != qrad,
            sqdist(points, "bq", "p2") != qrad,
        ),
        z3.Or(
            sqdist(points, "bq", "r1") != qrad,
            sqdist(points, "bq", "r2") != qrad,
        ),
    )

    return solver, points, cyclic_order


def value_text(model: z3.ModelRef, value: z3.ArithRef) -> str:
    return str(model.eval(value, model_completion=True))


def branch_count() -> tuple[int, int]:
    maps = list(alias_maps())
    total = 0
    for alias in maps:
        first_cap_count = 6 + sum(alias[b] == b for b in ("bp", "br"))
        bq_fresh = alias["bq"] == "bq"
        total += math.factorial(first_cap_count) * (
            first_cap_count + 3 if bq_fresh else 1
        )
    return len(maps), total


def complete_cyclic_orders(alias: dict[str, str]):
    first_cap = (*SOURCES, *(b for b in ("bp", "br") if alias[b] == b))
    for first_cap_order in itertools.permutations(first_cap):
        base = ("a2", *first_cap_order, "a3")
        if alias["bq"] != "bq":
            yield ("a1", *base)
            continue
        for gap in range(len(base) + 1):
            yield ("a1", *base[:gap], "bq", *base[gap:])


def candidate_branches(all_branches: bool):
    seen: set[tuple[tuple[tuple[str, str], ...], tuple[str, ...]]] = set()
    maps = list(alias_maps())
    # Prefer aliases (fewer convex vertices) and then fresh blocker cases.
    maps.sort(
        key=lambda a: (
            len(interior_representatives(a)),
            tuple(a[b] for b in BLOCKERS),
        )
    )
    for alias in maps:
        for proposed in PRIORITY_CYCLIC_ORDERS:
            order = normalized_priority_cyclic_order(alias, proposed)
            if order is None:
                continue
            key = (tuple(alias.items()), order)
            if key not in seen:
                seen.add(key)
                yield alias, order
    if all_branches:
        for alias in maps:
            for order in complete_cyclic_orders(alias):
                key = (tuple(alias.items()), order)
                if key not in seen:
                    seen.add(key)
                    yield alias, order


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-ms", type=int, default=10_000)
    parser.add_argument("--max-cases", type=int, default=0)
    parser.add_argument("--all-branches", action="store_true")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    alias_count, total_count = branch_count()
    counts = {"sat": 0, "unsat": 0, "unknown": 0}
    unknown_reasons: dict[str, int] = {}
    first_sat = None
    checked = 0
    for alias, order in candidate_branches(args.all_branches):
        if args.max_cases and checked >= args.max_cases:
            break
        solver, points, cyclic_order = build_case(alias, order, args.timeout_ms)
        status = solver.check()
        checked += 1
        counts[str(status)] += 1
        if status == z3.sat:
            model = solver.model()
            first_sat = {
                "alias_map": alias,
                "cyclic_order_representatives": list(cyclic_order),
                "coordinates": {
                    name: [
                        value_text(model, points[name][0]),
                        value_text(model, points[name][1]),
                    ]
                    for name in (*APICES, *BLOCKERS, *SOURCES)
                },
            }
            break
        if status == z3.unknown:
            reason = solver.reason_unknown()
            unknown_reasons[reason] = unknown_reasons.get(reason, 0) + 1

    exhausted = checked == total_count
    verdict = (
        "SAT"
        if first_sat
        else ("UNSAT" if exhausted and counts["unknown"] == 0 else "UNKNOWN")
    )
    result = {
        "verdict": verdict,
        "logic": "QF_NRA",
        "carrier_scope": "local named roles only; no fixed carrier cardinality",
        "solver": f"Z3 {z3.get_version_string()}",
        "timeout_ms_per_case": args.timeout_ms,
        "alias_maps": alias_count,
        "exact_alias_order_branch_space": total_count,
        "branches_checked": checked,
        "complete_branch_exhaustion": exhausted,
        "counts": counts,
        "unknown_reasons": unknown_reasons,
        "first_sat_model": first_sat,
    }
    rendered = json.dumps(result, indent=2, sort_keys=True)
    if args.output:
        args.output.write_text(rendered + "\n")
    print(rendered)
    return 0 if first_sat else 2


if __name__ == "__main__":
    raise SystemExit(main())

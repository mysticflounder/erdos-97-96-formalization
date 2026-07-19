#!/usr/bin/env python3
"""Exact SMT audit for the localized-collision on-cap Kalmanson marginal.

The abstraction keeps two complete four-point critical supports.  Their
centers and all support points occur on one abstract strictly convex cyclic
boundary.  Every cyclic quadruple receives both strict Kalmanson inequalities,
normalized to integral slack at least one, and every triple receives the
triangle inequalities.  The nonlinear survivor pass additionally installs
every squared-distance nonacute inequality on the named cap subchain.  Z3
therefore decides the displayed metric shadows over exact rationals.

These are necessary metric shadows of convex Euclidean cap geometry, not a
Euclidean realization and not a Lean proof of the parent branch.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import subprocess
from dataclasses import dataclass
from fractions import Fraction


@dataclass(frozen=True)
class Instance:
    order: tuple[str, ...]
    collision_support: frozenset[str]
    fresh_support: frozenset[str]


def edge(a: str, b: str) -> tuple[str, str]:
    return tuple(sorted((a, b)))  # type: ignore[return-value]


def var(a: str, b: str) -> str:
    x, y = edge(a, b)
    return f"d_{x}_{y}"


def smt_for(
    instance: Instance, include_cap_nonacute: bool, include_row_ptolemy: bool = False
) -> str:
    points = instance.order
    edges = [edge(a, b) for a, b in itertools.combinations(points, 2)]
    logic = "QF_NRA" if include_cap_nonacute else "QF_LRA"
    lines = [f"(set-logic {logic})", "(set-option :produce-models true)"]
    for a, b in edges:
        lines.append(f"(declare-const {var(a, b)} Real)")
        lines.append(f"(assert (>= {var(a, b)} 1))")

    # Every triangle inequality on the named boundary points.
    for a, b, c in itertools.combinations(points, 3):
        lines.append(f"(assert (>= (+ {var(a, b)} {var(a, c)}) {var(b, c)}))")
        lines.append(f"(assert (>= (+ {var(a, b)} {var(b, c)}) {var(a, c)}))")
        lines.append(f"(assert (>= (+ {var(a, c)} {var(b, c)}) {var(a, b)}))")

    if include_cap_nonacute:
        # Every increasing triple of the named cap subchain is nonacute at
        # its middle vertex: d(i,k)^2 >= d(i,j)^2 + d(j,k)^2.
        for ia, ib, ic in itertools.combinations(range(5), 3):
            a, b, c = points[ia], points[ib], points[ic]
            lines.append(
                f"(assert (>= (* {var(a, c)} {var(a, c)}) "
                f"(+ (* {var(a, b)} {var(a, b)}) (* {var(b, c)} {var(b, c)}))))"
            )

    # Both strict Kalmanson inequalities for each increasing cyclic quadruple.
    for ia, ib, ic, id_ in itertools.combinations(range(len(points)), 4):
        a, b, c, d = points[ia], points[ib], points[ic], points[id_]
        diagonal_sum = f"(+ {var(a, c)} {var(b, d)})"
        lines.append(
            f"(assert (>= (- {diagonal_sum} (+ {var(a, b)} {var(c, d)})) 1))"
        )
        lines.append(
            f"(assert (>= (- {diagonal_sum} (+ {var(a, d)} {var(b, c)})) 1))"
        )

    def exact_four(center: str, support: frozenset[str]) -> None:
        support_list = sorted(support)
        radius = var(center, support_list[0])
        for p in support_list[1:]:
            lines.append(f"(assert (= {var(center, p)} {radius}))")
        # This records exactness on every other named carrier vertex.
        for p in points:
            if p != center and p not in support:
                lines.append(f"(assert (not (= {var(center, p)} {radius})))")

    exact_four("A", instance.collision_support)
    exact_four("B", instance.fresh_support)
    if include_row_ptolemy:
        # Actual Euclidean row supports are concyclic.  For their induced
        # cyclic order, Ptolemy is therefore an equality, not merely the
        # general metric inequality.
        for support in (instance.collision_support, instance.fresh_support):
            a, b, c, d = sorted(support, key=points.index)
            lines.append(
                f"(assert (= (+ (* {var(a, b)} {var(c, d)}) "
                f"(* {var(b, c)} {var(a, d)})) (* {var(a, c)} {var(b, d)})))"
            )
    lines.extend(["(check-sat)", "(get-model)"])
    return "\n".join(lines) + "\n"


def solve(
    instance: Instance, include_cap_nonacute: bool, include_row_ptolemy: bool = False
) -> tuple[str, str | None, str]:
    smt = smt_for(instance, include_cap_nonacute, include_row_ptolemy)
    result = subprocess.run(
        ["z3", "-in"], input=smt, text=True, capture_output=True, check=False
    )
    if result.returncode != 0 and not result.stdout.startswith("unsat"):
        raise RuntimeError(result.stderr or result.stdout)
    first, *_ = result.stdout.splitlines()
    model = result.stdout if first == "sat" else None
    return first, model, hashlib.sha256(smt.encode()).hexdigest()


def verify_pinned_model() -> dict[str, object]:
    """Independently replay the first SAT model using exact fractions."""
    order = ("s1", "A", "s2", "B", "f", "x", "y", "z")
    raw = {
        "A_f": "1361/8",
        "A_s2": 14,
        "B_z": "343/4",
        "s2_z": "91/4",
        "f_y": "659/4",
        "A_y": 14,
        "s1_z": "119/16",
        "B_x": 83,
        "x_z": "23/4",
        "f_s2": 169,
        "B_f": "343/4",
        "f_s1": 171,
        "s1_s2": 26,
        "s2_y": "95/4",
        "s1_y": "21/2",
        "f_x": 161,
        "y_z": "25/8",
        "f_z": "663/4",
        "x_y": "15/4",
        "s1_x": 12,
        "s2_x": 22,
        "A_x": 14,
        "A_B": 88,
        "B_s1": 90,
        "B_s2": "343/4",
        "B_y": "343/4",
        "A_z": "383/32",
        "A_s1": 14,
    }
    values = {tuple(sorted(name.split("_"))): Fraction(value) for name, value in raw.items()}

    def distance(a: str, b: str) -> Fraction:
        if a == b:
            return Fraction(0)
        return values[edge(a, b)]

    triangle_slacks = []
    for a, b, c in itertools.combinations(order, 3):
        triangle_slacks.extend(
            (
                distance(a, b) + distance(a, c) - distance(b, c),
                distance(a, b) + distance(b, c) - distance(a, c),
                distance(a, c) + distance(b, c) - distance(a, b),
            )
        )
    kalmanson_slacks = []
    ptolemy_slacks = []
    minimum_ptolemy_quadruple = None
    for ia, ib, ic, id_ in itertools.combinations(range(len(order)), 4):
        a, b, c, d = order[ia], order[ib], order[ic], order[id_]
        diagonal_sum = distance(a, c) + distance(b, d)
        kalmanson_slacks.extend(
            (
                diagonal_sum - distance(a, b) - distance(c, d),
                diagonal_sum - distance(a, d) - distance(b, c),
            )
        )
    for a, b, c, d in itertools.permutations(order, 4):
        ptolemy_slack = (
            distance(a, b) * distance(c, d)
            + distance(a, d) * distance(b, c)
            - distance(a, c) * distance(b, d)
        )
        ptolemy_slacks.append(ptolemy_slack)
        if minimum_ptolemy_quadruple is None or ptolemy_slack < minimum_ptolemy_quadruple[0]:
            minimum_ptolemy_quadruple = (ptolemy_slack, (a, b, c, d))
    gram_determinants = []
    for base, p, q, r in itertools.combinations(order, 4):
        others = (p, q, r)
        gram = [
            [
                (
                    distance(base, left) ** 2
                    + distance(base, right) ** 2
                    - distance(left, right) ** 2
                )
                / 2
                for right in others
            ]
            for left in others
        ]
        determinant = (
            gram[0][0] * (gram[1][1] * gram[2][2] - gram[1][2] * gram[2][1])
            - gram[0][1] * (gram[1][0] * gram[2][2] - gram[1][2] * gram[2][0])
            + gram[0][2] * (gram[1][0] * gram[2][1] - gram[1][1] * gram[2][0])
        )
        gram_determinants.append((determinant, (base, p, q, r)))
    cap_nonacute_slacks = []
    for ia, ib, ic in itertools.combinations(range(5), 3):
        a, b, c = order[ia], order[ib], order[ic]
        cap_nonacute_slacks.append(
            distance(a, c) ** 2 - distance(a, b) ** 2 - distance(b, c) ** 2
        )
    collision = {distance("A", p) for p in ("s1", "s2", "x", "y")}
    fresh = {distance("B", p) for p in ("f", "s2", "y", "z")}
    assert collision == {Fraction(14)}
    assert fresh == {Fraction(343, 4)}
    assert all(distance("A", p) != 14 for p in ("B", "f", "z"))
    assert all(distance("B", p) != Fraction(343, 4) for p in ("A", "s1", "x"))
    assert min(triangle_slacks) >= 0
    assert min(kalmanson_slacks) >= 1
    assert min(cap_nonacute_slacks) >= 0
    canonical = json.dumps(raw, sort_keys=True, separators=(",", ":"))
    assert minimum_ptolemy_quadruple is not None
    return {
        "order": order,
        "distance_model": raw,
        "distance_model_sha256": hashlib.sha256(canonical.encode()).hexdigest(),
        "minimum_triangle_slack": str(min(triangle_slacks)),
        "minimum_kalmanson_slack": str(min(kalmanson_slacks)),
        "minimum_cap_nonacute_squared_slack": str(min(cap_nonacute_slacks)),
        "minimum_ptolemy_slack": str(min(ptolemy_slacks)),
        "minimum_ptolemy_quadruple": minimum_ptolemy_quadruple[1],
        "minimum_four_point_gram_determinant": str(min(gram_determinants)[0]),
        "minimum_four_point_gram_quadruple": min(gram_determinants)[1],
    }


def instances() -> list[Instance]:
    # Minimal source-faithful overlap: the collision row is {s1,s2,x,y};
    # the fresh row is {f,s2,y,z}.  Thus the chosen collision source s1 is
    # omitted by the fresh row, fresh f is omitted by the collision row, the
    # outside pair banks differ but share y, and the complete supports share
    # exactly two points (s2,y).
    cap = ("A", "B", "s1", "s2", "f")
    outside = ("x", "y", "z")
    def between(order: tuple[str, ...], left: str, middle: str, right: str) -> bool:
        i, j, k = order.index(left), order.index(middle), order.index(right)
        return i < j < k or k < j < i

    # The repository's one-sided cap-distance injectivity forces the center
    # of each row between its two same-cap support points.
    cap_orders = [
        order
        for order in itertools.permutations(cap)
        if between(order, "s1", "A", "s2") and between(order, "f", "B", "s2")
    ]
    return [
        Instance(
            order=cap_order + outside_order,
            collision_support=frozenset(("s1", "s2", "x", "y")),
            fresh_support=frozenset(("f", "s2", "y", "z")),
        )
        for cap_order in cap_orders
        for outside_order in itertools.permutations(outside)
    ]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--all", action="store_true", help="enumerate every named order")
    parser.add_argument(
        "--linear-all",
        action="store_true",
        help="exhaust only the fast triangle plus Kalmanson linear stage",
    )
    args = parser.parse_args()

    if args.linear_all:
        rows = []
        for instance in instances():
            status, _model, digest = solve(instance, False)
            rows.append({"order": instance.order, "status": status, "smt_sha256": digest})
        summary = {
            "scope": "exact rational triangle plus strict Kalmanson linear shadow",
            "checked": len(rows),
            "sat": sum(row["status"] == "sat" for row in rows),
            "unsat": sum(row["status"] == "unsat" for row in rows),
            "unknown": sum(row["status"] == "unknown" for row in rows),
            "sat_orders": [row["order"] for row in rows if row["status"] == "sat"],
        }
        print(json.dumps(summary, indent=2, sort_keys=True))
        return

    rows = []
    for instance in instances():
        linear_status, _linear_model, linear_digest = solve(instance, False)
        if linear_status == "sat":
            status, model, digest = solve(instance, True)
        else:
            status, model, digest = "unsat", None, None
        rows.append(
            {
                "order": instance.order,
                "linear_status": linear_status,
                "linear_smt_sha256": linear_digest,
                "status": status,
                "nonacute_smt_sha256": digest,
                "model": model if status == "sat" else None,
            }
        )
        if status == "sat" and not args.all:
            break

    summary = {
        "scope": "exact rational triangle plus Kalmanson plus cap-nonacute metric shadow",
        "collision_support": ["s1", "s2", "x", "y"],
        "fresh_support": ["f", "s2", "y", "z"],
        "checked": len(rows),
        "sat": sum(row["status"] == "sat" for row in rows),
        "unsat": sum(row["status"] == "unsat" for row in rows),
        "unknown": sum(row["status"] == "unknown" for row in rows),
        "linear_unsat": sum(row["linear_status"] == "unsat" for row in rows),
        "nonacute_checked": sum(row["linear_status"] == "sat" for row in rows),
        "first_sat": next((row for row in rows if row["status"] == "sat"), None),
        "independent_exact_replay": verify_pinned_model(),
    }
    if args.all:
        summary["sat_orders"] = [row["order"] for row in rows if row["status"] == "sat"]
    print(json.dumps(summary, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

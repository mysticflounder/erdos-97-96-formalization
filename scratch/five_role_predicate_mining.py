#!/usr/bin/env python3
"""Bounded geometric mining for the two five-role residual leaves.

This is a diagnostic search, not a certificate producer.  It asks whether a
candidate same-cap predicate is compatible with an actual strictly convex
Euclidean five-point configuration satisfying the retained equalities and
strict Kalmanson gaps.  The candidate is the cap-region consequence

    <C-O, K-O> >= 0,

which is the distance form of ``inner_nonneg_of_cap_region_pair`` when C and K
are in the same first cap.  Every result is reported with the solver status;
an optimizer failure or timeout is never treated as a contradiction.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import z3

from five_role_kalmanson_enumeration import (
    SYSTEMS,
    kalmanson_gaps,
    pair,
)


def zreal(name: str) -> z3.ArithRef:
    return z3.Real(name)


def orientation(points, a, b, c):
    ax, ay = points[a]
    bx, by = points[b]
    cx, cy = points[c]
    return (bx - ax) * (cy - ay) - (by - ay) * (cx - ax)


def build_problem(name: str, order: tuple[str, ...], capdot: bool):
    data = SYSTEMS[name]
    roles = data["roles"]
    pairs = sorted(pair(a, b) for i, a in enumerate(roles) for b in roles[i + 1 :])
    distances = {p: zreal("d_" + "".join(p)) for p in pairs}
    points = {"O": (zreal("x_O"), zreal("y_O"))}
    points["O"] = (z3.RealVal(0), z3.RealVal(0))
    for role in roles:
        if role != "O":
            points[role] = (zreal("x_" + role), zreal("y_" + role))

    s = z3.Solver()
    # A fixed nonzero scale removes the homogeneous scaling freedom.  Both
    # systems have OA=OC or OJ=OC, so this is a legitimate normalization.
    oa = distances[pair("O", "A")]
    s.add(oa == 1, oa > 0)
    for d in distances.values():
        s.add(d > 0)

    # Euclidean distance equations.  They are polynomial, so Z3's NRA
    # procedure can decide the bounded instances or return unknown.
    for (a, b), d in distances.items():
        dx = points[a][0] - points[b][0]
        dy = points[a][1] - points[b][1]
        s.add(d * d == dx * dx + dy * dy)

    # Retained equalities are equalities of distances in the source row data.
    for left, right in data["equalities"]:
        s.add(distances[left] == distances[right])

    # Strict Kalmanson gaps for this cyclic order.
    pair_index = {p: i for i, p in enumerate(pairs)}
    for _, coeffs in kalmanson_gaps(order, pair_index):
        expr = z3.RealVal(0)
        for coeff, p in zip(coeffs, pairs):
            # The audit helper uses SymPy rationals; convert their exact text.
            expr += z3.RealVal(str(coeff)) * distances[p]
        s.add(expr > 0)

    # Strict convexity: every triple in cyclic order has positive orientation.
    for i in range(len(order)):
        for j in range(i + 1, len(order)):
            for k in range(j + 1, len(order)):
                s.add(orientation(points, order[i], order[j], order[k]) > 0)

    if capdot:
        # 2 <C-O, K-O> = d_OC^2 + d_OK^2 - d_CK^2.
        oc = distances[pair("O", "C")]
        ok = distances[pair("O", "K")]
        ck = distances[pair("C", "K")]
        s.add(oc * oc + ok * ok - ck * ck >= 0)
    return s, points, distances


def check(name, order, capdot, timeout_ms):
    solver, points, distances = build_problem(name, order, capdot)
    solver.set(timeout=timeout_ms)
    status = solver.check()
    out = {"status": str(status), "order": "".join(order), "capdot": capdot}
    if status == z3.sat:
        model = solver.model()
        out["distances"] = {
            "".join(p): str(model.eval(d, model_completion=True))
            for p, d in distances.items()
        }
        out["points"] = {
            r: [str(model.eval(x, model_completion=True)), str(model.eval(y, model_completion=True))]
            for r, (x, y) in points.items()
        }
    return out


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-ms", type=int, default=20_000)
    parser.add_argument("--json", type=Path, default=Path("scratch/five_role_predicate_mining.json"))
    args = parser.parse_args()
    results = []
    for name, data in SYSTEMS.items():
        # Preserve the audit's O-anchored order convention and only run the
        # 16 Kalmanson-feasible residual orders.
        from itertools import permutations

        for tail in permutations([r for r in data["roles"] if r != "O"]):
            order = ("O",) + tail
            baseline = check(name, order, False, args.timeout_ms)
            if baseline["status"] == "sat":
                with_cap = check(name, order, True, args.timeout_ms)
            else:
                with_cap = {"status": "skipped", "order": "".join(order), "capdot": True}
            results.append({"system": name, "baseline": baseline, "capdot": with_cap})
    args.json.write_text(json.dumps(results, indent=2) + "\n")
    for name in SYSTEMS:
        rows = [r for r in results if r["system"] == name]
        print(name)
        for key in ("baseline", "capdot"):
            counts = {}
            for row in rows:
                status = row[key]["status"]
                counts[status] = counts.get(status, 0) + 1
            print(f"  {key}: {counts}")
        print("  capdot UNSAT among baseline SAT:", [
            r["baseline"]["order"] for r in rows
            if r["baseline"]["status"] == "sat" and r["capdot"]["status"] == "unsat"
        ])
    print(args.json)


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Construct exact-rational Euclidean witnesses by a five-parameter search.

The parametrizations satisfy every required metric equality identically.  A
floating-point optimizer is used only to locate an open strict-orientation
cell; candidate parameters are rounded to Fractions and all conditions are
then rechecked exactly before a witness is emitted.
"""

from __future__ import annotations

import json
from fractions import Fraction
from itertools import combinations, product
from pathlib import Path

import numpy as np
from scipy.optimize import differential_evolution

from five_role_euclidean_qfnra_audit import BRANCHES, validate_fraction_witness, witness_size


INPUT = Path("scratch/five_role_extended_packet_results.json")
OUT = Path("scratch/five_role_euclidean_qfnra_rational_search_results.json")


def circle(t):
    return np.array(((1 - t * t) / (1 + t * t), 2 * t / (1 + t * t)))


def rot(v, t):
    c, s = circle(t)
    return np.array((c * v[0] - s * v[1], s * v[0] + c * v[1]))


def perp(v):
    return np.array((-v[1], v[0]))


def coordinates(branch, p):
    if branch == "A=J":
        tc, tm, sk, lx, lb = p
        O = np.zeros(2); A = circle(0); C = circle(tc); M = circle(tm)
        K = A + rot(C - A, sk)
        X = (A + K) / 2 + lx * perp(K - A)
        B = (C + M) / 2 + lb * perp(M - C)
        return {"O": O, "A": A, "C": C, "M": M, "K": K, "X": X, "B": B}
    tj, tm, sk, la, lb = p
    O = np.zeros(2); C = circle(0); J = circle(tj); M = circle(tm)
    K = C + rot(J - C, sk)
    A = (C + K) / 2 + la * perp(K - C)
    B = (C + M) / 2 + lb * perp(M - C)
    return {"O": O, "C": C, "J": J, "M": M, "K": K, "A": A, "B": B}


def margin(branch, order, p):
    q = coordinates(branch, p)
    vals = []
    for i, j, k in combinations(range(7), 3):
        a, b, c = q[order[i]], q[order[j]], q[order[k]]
        u, v = b - a, c - a
        vals.append(u[0] * v[1] - u[1] * v[0])
    diameter2 = max(np.dot(q[a] - q[b], q[a] - q[b])
                    for a, b in combinations(order, 2))
    if not np.isfinite(diameter2) or diameter2 < 1e-12:
        return -1e6
    return float(min(vals) / diameter2)


def fcircle(t):
    return ((1 - t * t) / (1 + t * t), 2 * t / (1 + t * t))


def fadd(a, b): return (a[0] + b[0], a[1] + b[1])
def fsub(a, b): return (a[0] - b[0], a[1] - b[1])
def fscale(c, a): return (c * a[0], c * a[1])
def fperp(a): return (-a[1], a[0])
def frot(v, t):
    c, s = fcircle(t)
    return (c * v[0] - s * v[1], s * v[0] + c * v[1])


def fraction_coordinates(branch, params):
    half = Fraction(1, 2)
    if branch == "A=J":
        tc, tm, sk, lx, lb = params
        O = (Fraction(0), Fraction(0)); A = fcircle(Fraction(0))
        C = fcircle(tc); M = fcircle(tm)
        K = fadd(A, frot(fsub(C, A), sk))
        X = fadd(fscale(half, fadd(A, K)), fscale(lx, fperp(fsub(K, A))))
        B = fadd(fscale(half, fadd(C, M)), fscale(lb, fperp(fsub(M, C))))
        return {"O": O, "A": A, "C": C, "M": M, "K": K, "X": X, "B": B}
    tj, tm, sk, la, lb = params
    O = (Fraction(0), Fraction(0)); C = fcircle(Fraction(0))
    J = fcircle(tj); M = fcircle(tm)
    K = fadd(C, frot(fsub(J, C), sk))
    A = fadd(fscale(half, fadd(C, K)), fscale(la, fperp(fsub(K, C))))
    B = fadd(fscale(half, fadd(C, M)), fscale(lb, fperp(fsub(M, C))))
    return {"O": O, "C": C, "J": J, "M": M, "K": K, "A": A, "B": B}


def encoded(q):
    return {r: {"x": str(p[0]), "y": str(p[1])} for r, p in q.items()}


def cap_assignments(branch, order, coords):
    q = {r: tuple(Fraction(coords[r][a]) for a in ("x", "y")) for r in order}
    def d2(a, b): return sum((q[a][i] - q[b][i]) ** 2 for i in (0, 1))
    unknown = [r for r in order if r not in ("C", "M", "K", "B", "O")]
    for bits in product((False, True), repeat=len(unknown)):
        cap = {r: True for r in ("C", "M", "K", "B")}; cap["O"] = False
        cap.update(dict(zip(unknown, bits)))
        exits = sum(cap[order[i]] and not cap[order[(i + 1) % 7]] for i in range(7))
        if exits > 1: continue
        if all(((cap[r] and r != "B" and d2("B", "C") == d2("B", r))
                == (r in ("C", "M"))) for r in order):
            yield cap


def find(branch, order):
    bounds = [(-8, 8)] * 5
    best = None
    for seed in range(4):
        res = differential_evolution(lambda p: -margin(branch, order, p), bounds,
                                     seed=seed, popsize=18, maxiter=250,
                                     polish=True, tol=1e-9, workers=1)
        if best is None or res.fun < best.fun: best = res
        if -res.fun > 1e-5: break
    if best is None or -best.fun <= 1e-8:
        return {"status": "NOT_FOUND", "best_normalized_margin": None if best is None else -best.fun}
    for denominator in (100, 1000, 10000, 1000000):
        params = tuple(Fraction(float(x)).limit_denominator(denominator) for x in best.x)
        coords = encoded(fraction_coordinates(branch, params))
        for cap in cap_assignments(branch, order, coords):
            ok, detail = validate_fraction_witness(branch, tuple(order), coords, cap,
                                                   require_gauge=False)
            if ok:
                return {"status": "SAT", "search_margin": -best.fun,
                        "parameters": list(map(str, params)), "coordinates": coords,
                        "cap": cap, "exact_fraction_validation": detail,
                        "witness_size": witness_size(coords)}
    return {"status": "NOT_FOUND", "best_normalized_margin": -best.fun,
            "reason": "rational reconstruction or full exact validation failed"}


def main():
    packet = json.loads(INPUT.read_text())
    rows = []
    for branch, bdata in packet["branches"].items():
        for row in bdata["rows"]:
            if row["baseline"]["status"] != "SAT":
                continue
            result = find(branch, row["order"])
            rows.append({"branch": branch, "residual": row["residual"],
                         "order": row["order"], "result": result})
            print(branch, row["residual"], row["order"], result["status"], flush=True)
    out = {"method": "floating search followed by independent exact Fraction validation",
           "candidate_count": len(rows),
           "counts": {k: sum(r["result"]["status"] == k for r in rows)
                      for k in ("SAT", "NOT_FOUND")}, "rows": rows}
    OUT.write_text(json.dumps(out, indent=2) + "\n")
    print(json.dumps(out["counts"]))


if __name__ == "__main__": main()

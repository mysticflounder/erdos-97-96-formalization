#!/usr/bin/env python3
"""Constructive exact-rational search for the four endpoint order residuals.

This is deliberately independent of the QF_NRA coordinate encoding.  It uses
the rational unit-circle parametrization and rational perpendicular bisectors,
so all metric equalities hold by construction; only exact determinant signs
are tested during the search.
"""

from __future__ import annotations

from fractions import Fraction as Q
import json
import random
from pathlib import Path


OUT = Path("scratch/endpoint_constructive_geometry_results.json")


def add(p, q):
    return (p[0] + q[0], p[1] + q[1])


def sub(p, q):
    return (p[0] - q[0], p[1] - q[1])


def scale(a, p):
    return (a * p[0], a * p[1])


def perp(p):
    return (-p[1], p[0])


def cross(p, q, r):
    u, v = sub(q, p), sub(r, p)
    return u[0] * v[1] - u[1] * v[0]


def d2(p, q):
    u = sub(p, q)
    return u[0] * u[0] + u[1] * u[1]


def circle(t):
    """Tangent-half-angle point ((1-t^2)/(1+t^2), 2t/(1+t^2))."""
    den = 1 + t * t
    return ((1 - t * t) / den, 2 * t / den)


def rotate(v, t):
    """Rotate v by the rational unit-circle angle parametrized by t."""
    c, s = circle(t)
    return (c * v[0] - s * v[1], s * v[0] + c * v[1])


def bisector(u, v, lam):
    """A rational point on the perpendicular bisector of uv."""
    return add(scale(Q(1, 2), add(u, v)), scale(lam, perp(sub(v, u))))


def ccw_hull(points):
    """Exact monotone-chain hull, returned counterclockwise without repeats."""
    items = sorted((p[0], p[1], name) for name, p in points.items())

    def turn(a, b, c):
        return cross((a[0], a[1]), (b[0], b[1]), (c[0], c[1]))

    lo = []
    for item in items:
        while len(lo) >= 2 and turn(lo[-2], lo[-1], item) <= 0:
            lo.pop()
        lo.append(item)
    hi = []
    for item in reversed(items):
        while len(hi) >= 2 and turn(hi[-2], hi[-1], item) <= 0:
            hi.pop()
        hi.append(item)
    return [x[2] for x in lo[:-1] + hi[:-1]]


def rotate_to(seq, first):
    i = seq.index(first)
    return seq[i:] + seq[:i]


def qstr(x):
    return str(x.numerator) if x.denominator == 1 else f"{x.numerator}/{x.denominator}"


def point_json(p):
    return [qstr(p[0]), qstr(p[1])]


TARGETS = {
    "A=J/OAKXC": ("A=J", "OAKXC"),
    "A=J/OCXKA": ("A=J", "OCXKA"),
    "X=C/OCAKJ": ("X=C", "OCAKJ"),
    "X=C/OJKAC": ("X=C", "OJKAC"),
}


def candidate(branch, tc, tm, tj, tk, la, lb, lx):
    O = (Q(0), Q(0))
    C, M, J = circle(tc), circle(tm), circle(tj)
    if branch == "A=J":
        A = J
        K = add(J, rotate(sub(C, J), tk))
        X = bisector(J, K, lx)
    else:
        X = C
        K = add(C, rotate(sub(J, C), tk))
        A = bisector(C, K, la)
    B = bisector(C, M, lb)
    return {"O": O, "A": A, "B": B, "C": C, "J": J, "K": K, "M": M, "X": X}


def distinct_reps(points, branch):
    aliases = {"J": "A"} if branch == "A=J" else {"X": "C"}
    reps = {k: v for k, v in points.items() if k not in aliases}
    return reps if len(set(reps.values())) == len(reps) else None


def valid_for(points, branch, target):
    reps = distinct_reps(points, branch)
    if reps is None:
        return None
    hull = ccw_hull(reps)
    if len(hull) != len(reps):
        return None
    hull = rotate_to(hull, "O")
    wanted = list(target)
    projection = [x for x in hull if x in wanted]
    if projection != wanted:
        return None
    # The two actual exact-shell nonincidences from the source packet.
    if d2(points["A"], points["M"]) == d2(points["A"], points["C"]):
        return None
    if d2(points["B"], points["K"]) == d2(points["B"], points["C"]):
        return None
    return hull


def main():
    rng = random.Random(979604)
    pool_t = [Q(n, d) for d in range(1, 10) for n in range(-12, 13) if n != 0]
    pool_lam = [Q(n, d) for d in range(1, 7) for n in range(-18, 19) if n != 0]
    found = {}
    attempts = 0
    for attempts in range(1, 2_000_001):
        tc, tm, tj, tk = (rng.choice(pool_t) for _ in range(4))
        la, lb, lx = (rng.choice(pool_lam) for _ in range(3))
        if len({tc, tm, tj}) < 3:
            continue
        for key, (branch, target) in TARGETS.items():
            if key in found:
                continue
            pts = candidate(branch, tc, tm, tj, tk, la, lb, lx)
            hull = valid_for(pts, branch, target)
            if hull is None:
                continue
            reps = distinct_reps(pts, branch)
            signs = [cross(reps[hull[i]], reps[hull[(i + 1) % len(hull)]],
                           reps[hull[(i + 2) % len(hull)]])
                     for i in range(len(hull))]
            checks = {
                "OC2=OM2": d2(pts["O"], pts["C"]) == d2(pts["O"], pts["M"]),
                "OC2=OJ2": d2(pts["O"], pts["C"]) == d2(pts["O"], pts["J"]),
                "AC2=AK2": d2(pts["A"], pts["C"]) == d2(pts["A"], pts["K"]),
                "BC2=BM2": d2(pts["B"], pts["C"]) == d2(pts["B"], pts["M"]),
                "XJ2=XK2": d2(pts["X"], pts["J"]) == d2(pts["X"], pts["K"]),
                "AM2!=AC2": d2(pts["A"], pts["M"]) != d2(pts["A"], pts["C"]),
                "BK2!=BC2": d2(pts["B"], pts["K"]) != d2(pts["B"], pts["C"]),
                "all_strict_convex": all(s > 0 for s in signs),
            }
            assert all(checks.values())
            found[key] = {
                "parameters": {n: qstr(v) for n, v in
                               (("tC", tc), ("tM", tm), ("tJ", tj), ("tK", tk),
                                ("lambdaA", la), ("lambdaB", lb), ("lambdaX", lx))},
                "coordinates": {n: point_json(p) for n, p in pts.items()},
                "ccw_hull_representatives": hull,
                "target_projection": "".join(x for x in hull if x in target),
                "consecutive_cross_products": [qstr(s) for s in signs],
                "squared_distances": {
                    "OC2": qstr(d2(pts["O"], pts["C"])),
                    "OM2": qstr(d2(pts["O"], pts["M"])),
                    "OJ2": qstr(d2(pts["O"], pts["J"])),
                    "AC2": qstr(d2(pts["A"], pts["C"])),
                    "AK2": qstr(d2(pts["A"], pts["K"])),
                    "AM2": qstr(d2(pts["A"], pts["M"])),
                    "BC2": qstr(d2(pts["B"], pts["C"])),
                    "BM2": qstr(d2(pts["B"], pts["M"])),
                    "BK2": qstr(d2(pts["B"], pts["K"])),
                    "XJ2": qstr(d2(pts["X"], pts["J"])),
                    "XK2": qstr(d2(pts["X"], pts["K"])),
                },
                "checks": checks,
            }
        if len(found) == len(TARGETS):
            break
    if len(found) != len(TARGETS):
        raise SystemExit(f"found only {sorted(found)} after {attempts} attempts")
    payload = {
        "status": "SAT_EXACT_RATIONAL_CONSTRUCTIVE",
        "scope": "local named-role geometry only; not a global P97 model",
        "attempts": attempts,
        "construction": "unit circle plus rational rotations and perpendicular bisectors",
        "witnesses": found,
    }
    OUT.write_text(json.dumps(payload, indent=2) + "\n")
    print(f"wrote {OUT} with {len(found)} exact witnesses after {attempts} attempts")


if __name__ == "__main__":
    main()

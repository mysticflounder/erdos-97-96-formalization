#!/usr/bin/env python3
"""T9: hunt for an all-K4 point set with NO 3 collinear points (general position)
that carries an admissible cube — the falsifier shape for the noncollinearity-
saturated (Gamma-repaired) uniform statement.

Family: two concentric regular m-gons (radii 1 and b, twist tau in {0, pi/m}),
n = 2m points, m >= 6. For each point we need SOME squared distance realized by
>= 4 points of the set. Screening is numeric (mpmath-free, plain float with
tolerance sweep + exactness re-check on the minimal polynomial level is left
as a flag); collinearity checked numerically with tight tolerance.

Also: mixed three-ring variants (m outer, m inner, optional center point are
collinear-free only without the center; center adds collinear triples).
"""
import json
import math
import random
from collections import defaultdict
from itertools import combinations

TOL = 1e-9


def ring_points(m, b, tau):
    pts = []
    for k in range(m):
        a = 2 * math.pi * k / m
        pts.append((math.cos(a), math.sin(a)))
    for k in range(m):
        a = 2 * math.pi * k / m + tau
        pts.append((b * math.cos(a), b * math.sin(a)))
    return pts


def d2(p, q):
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def all_k4(pts, tol=1e-7):
    """every point has >=4 others at a common distance (within tol clustering)"""
    for p in pts:
        ds = sorted(d2(p, q) for q in pts if q != p)
        best = 1
        run = 1
        for i in range(1, len(ds)):
            if abs(ds[i] - ds[i - 1]) < tol:
                run += 1
                best = max(best, run)
            else:
                run = 1
        if best < 4:
            return False
    return True


def no3collinear(pts, tol=1e-7):
    for a, b_, c in combinations(pts, 3):
        det = (b_[0] - a[0]) * (c[1] - a[1]) - (b_[1] - a[1]) * (c[0] - a[0])
        if abs(det) < tol:
            return False
    return True


def scan():
    hits = []
    for m in (6, 7, 8, 9):
        for tau_name, tau in (("0", 0.0), ("half", math.pi / m)):
            # scan b densely; refine around promising values
            for bi in range(30, 400):
                b = bi / 100.0
                if abs(b - 1.0) < 1e-6:
                    continue
                pts = ring_points(m, b, tau)
                if all_k4(pts, tol=1e-6):
                    gp = no3collinear(pts)
                    hits.append((m, tau_name, b, gp))
                    print(f"m={m} tau={tau_name} b={b:.4f}: all-K4 (coarse) "
                          f"no3collinear={gp}")
    return hits


def refine(m, tau, b0, span=0.02, steps=4001):
    """refine b around b0 maximizing the all-K4 margin"""
    best = None
    for i in range(steps):
        b = b0 - span / 2 + span * i / (steps - 1)
        pts = ring_points(m, b, tau)
        # margin: for each point the 4th-nearest gap of its best cluster
        ok = all_k4(pts, tol=1e-9)
        if ok:
            gp = no3collinear(pts, tol=1e-9)
            if best is None:
                best = (b, gp)
                print(f"  refined: m={m} b={b:.6f} no3col={gp}")
    return best


if __name__ == "__main__":
    hits = scan()
    print(f"coarse hits: {len(hits)}")
    for m, tn, b, gp in hits[:20]:
        tau = 0.0 if tn == "0" else math.pi / m
        refine(m, tau, b)
    if not hits:
        print("NO two-ring all-K4 configuration found in scan range "
              "(m in 6..9, b in 0.30..4.00, tau in {0, pi/m})")

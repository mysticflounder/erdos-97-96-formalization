"""Orchestrator's independent exact-arithmetic verification of the 9-point
k=3 control candidate (scratch/p97-search-lane/k3-control-research.md §6).

Written from the raw coordinates only — independent of the researcher
agent's script and of both upstream GitHub PRs.

Checks, all in exact arithmetic over ℚ(√3) (sympy Rational + sqrt(3),
no floats anywhere):
  1. K3 property: every point has some squared-distance value shared by
     >= 3 of the other 8 points (also report the exact multiset).
  2. Strict convex position: sorted by exact angle around the centroid,
     every consecutive triple has strictly positive cross product (all 9
     points are hull vertices of a strictly convex 9-gon).
  3. All 9 points pairwise distinct.

Run: uv run python scratch/p97-search-lane/verify_k3_control.py
Exit 0 iff all checks pass.
"""
from __future__ import annotations

import sys
from itertools import combinations

from sympy import Rational as Q, sqrt, expand, simplify

R3 = sqrt(3)

PTS = [
    (-R3, Q(-1)),
    (Q(-8991, 10927) * R3, Q(-26503, 10927)),
    (Q(-10753, 18529) * R3, Q(-44665, 18529)),
    (R3, Q(-1)),
    (Q(17747, 10927) * R3, Q(-235, 10927)),
    (Q(27709, 18529) * R3, Q(6203, 18529)),
    (Q(0), Q(2)),
    (Q(-8756, 10927) * R3, Q(26738, 10927)),
    (Q(-16956, 18529) * R3, Q(38462, 18529)),
]
N = len(PTS)


def d2(p, q):
    return expand((p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2)


def sign(e):
    """Exact sign of an element of Q(sqrt3)."""
    s = simplify(expand(e))
    if s == 0:
        return 0
    return 1 if s.is_positive else -1


ok = True

# 3. pairwise distinct
for i, j in combinations(range(N), 2):
    if simplify(expand(PTS[i][0] - PTS[j][0])) == 0 and \
       simplify(expand(PTS[i][1] - PTS[j][1])) == 0:
        print(f"FAIL distinct: P{i} == P{j}")
        ok = False

# 1. K3 property
for i in range(N):
    groups: dict = {}
    for j in range(N):
        if j == i:
            continue
        key = simplify(d2(PTS[i], PTS[j]))
        groups.setdefault(key, []).append(j)
    best = max(len(v) for v in groups.values())
    sizes = sorted((len(v) for v in groups.values()), reverse=True)
    status = "ok" if best >= 3 else "FAIL"
    print(f"P{i}: equidistant group sizes {sizes} -> max {best} [{status}]")
    if best < 3:
        ok = False

# 2. strict convex position: exact angle sort around exact centroid
cx = sum(p[0] for p in PTS) / N
cy = sum(p[1] for p in PTS) / N


def half_and_key(p):
    """Total angular order around (cx,cy) without trig: split into upper
    (dy>0 or (dy==0 and dx>0)) and lower half-planes, order within each
    half by exact cross-product comparisons via sorting key emulation."""
    dx, dy = expand(p[0] - cx), expand(p[1] - cy)
    upper = (sign(dy) > 0) or (sign(dy) == 0 and sign(dx) > 0)
    return (0 if upper else 1, dx, dy)


def cross(o, a, b):
    return expand((a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0]))


idx = list(range(N))
# insertion sort with exact angular comparator (avoids float keys entirely)
def ang_less(i, j):
    hi, dxi, dyi = half_and_key(PTS[i])
    hj, dxj, dyj = half_and_key(PTS[j])
    if hi != hj:
        return hi < hj
    c = sign(expand(dxi * dyj - dyi * dxj))
    if c == 0:
        raise RuntimeError(f"P{i},P{j} collinear with centroid — not strictly convex")
    return c > 0


for a in range(1, N):
    b = a
    while b > 0 and ang_less(idx[b], idx[b - 1]):
        idx[b], idx[b - 1] = idx[b - 1], idx[b]
        b -= 1

convex = True
for t in range(N):
    o, a, b = idx[t], idx[(t + 1) % N], idx[(t + 2) % N]
    s = sign(cross(PTS[o], PTS[a], PTS[b]))
    if s <= 0:
        print(f"FAIL convex: triple P{o},P{a},P{b} cross sign {s}")
        convex = False
print(f"hull order: {idx}")
print(f"strict convex position: {'ok' if convex else 'FAIL'}")
ok = ok and convex

print(f"K3_CONTROL_VERIFIED = {ok}")
sys.exit(0 if ok else 1)

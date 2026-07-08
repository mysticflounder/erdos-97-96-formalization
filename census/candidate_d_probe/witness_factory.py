#!/usr/bin/env python3
"""Exact rational witness factory for the Q1 decorated windows.

Pure-rational search (Fractions): fixed rational MEC frame, rational points
on the packet circle via rational rotations from a rational base point,
exact sign/disk checks, then final exact verification against the SAME
constraint system the solvers see (encoder.build_window + verify_exact).

A success is an exact realization of the decorated minimal window for that
class (verdict REALIZED-MINIMAL-WINDOW at class level)."""
from __future__ import annotations

import json
import math
import os
import sys
from fractions import Fraction as F
from itertools import combinations

import sympy as sp

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from encoder import CLASSES, build_window, verify_exact, HERE  # noqa: E402

# frames: v2=(0,0), v3=(1,0), O=(1/2,oy), R2=1/4+oy^2, v1 rational on circle
V2 = (F(0), F(0))
V3 = (F(1), F(0))
FRAMES = [
    {"oy": F(0), "v1": (F(1, 2), F(1, 2))},        # max own lens (right angle at v1)
    {"oy": F(1, 4), "v1": (F(124, 289), F(465, 578))},  # acute frame
    {"oy": F(0), "v1": (F(1, 10), F(3, 10))},      # asymmetric v1 (left)
    {"oy": F(0), "v1": (F(9, 10), F(3, 10))},      # asymmetric v1 (right)
    {"oy": F(0), "v1": (F(4, 5), F(2, 5))},        # asymmetric v1 (right, higher)
]
OY = FRAMES[0]["oy"]
OC = (F(1, 2), OY)
R2 = F(1, 4) + OY * OY
V1 = FRAMES[0]["v1"]


def set_frame(fr):
    global OY, OC, R2, V1
    OY = fr["oy"]
    OC = (F(1, 2), OY)
    R2 = F(1, 4) + OY * OY
    V1 = fr["v1"]


def d2(p, q):
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def sA2(v, vj, vk):
    return (vj[0] - v[0]) * (vk[1] - v[1]) - (vk[0] - v[0]) * (vj[1] - v[1])


def in_disk(p):
    return d2(p, OC) <= R2


def cap_of(p):
    """Exact strict cap of a non-Moser point; None if any sign degenerate
    or not exactly-one-cap."""
    chords = {1: (V2, V3, V1), 2: (V3, V1, V2), 3: (V1, V2, V3)}
    inside = []
    for ci, (ca, cb, opp) in chords.items():
        pr = sA2(p, ca, cb) * sA2(opp, ca, cb)
        if pr == 0:
            return None
        if pr < 0:
            inside.append(ci)
    return inside[0] if len(inside) == 1 else None


def rot(u, v):
    """Rational rotation by angle with tan(theta/2)=u applied to vector v."""
    den = 1 + u * u
    c, s = (1 - u * u) / den, 2 * u / den
    return (c * v[0] - s * v[1], s * v[0] + c * v[1])


def circle_pts(x, t0, us):
    """Rational points on the circle about x through t0."""
    base = (t0[0] - x[0], t0[1] - x[1])
    out = []
    for u in us:
        w = rot(u, base)
        out.append((x[0] + w[0], x[1] + w[1]))
    return out


def ang(p):
    return math.atan2(float(p[1] - OY), float(p[0]) - 0.5)


def try_assemble(m, s, l, r, vc, x, rho_base):
    """rho_base: a point ON the packet circle (defines rho2). Returns
    (subs, k, vcnames) or None."""
    names = {"v1": V1, "v2": V2, "v3": V3}
    need_extra = {1: s, 2: l, 3: r}
    # vertex members must be at equal distance already (caller ensures)
    us = [F(i, 60) for i in range(-360, 361)]
    pool = {1: [], 2: [], 3: []}
    for t in circle_pts(x, rho_base, us):
        if not in_disk(t):
            continue
        c = cap_of(t)
        if c and len(pool[c]) < 60 and t != x:
            pool[c].append(t)
    if any(len(pool[c]) < need_extra[c] for c in (1, 2, 3)):
        return None
    # pick spread selections: greedy by angle diversity
    def pick(lst, kk):
        if kk == 0:
            return []
        lst = sorted(set(lst), key=ang)
        if len(lst) < kk:
            return None
        idx = [round(i * (len(lst) - 1) / max(kk - 1, 1)) for i in range(kk)]
        if len(set(idx)) < kk:
            idx = list(range(kk))
        return [lst[i] for i in idx]

    as_ = pick(pool[2], l)
    bs = pick(pool[3], r)
    if as_ is None or bs is None:
        return None
    # own-cap selection: straddle-aware for s<=2, spread otherwise
    own_opts = []
    lefts = [p for p in pool[1] if p[0] < x[0]]
    rights = [p for p in pool[1] if p[0] > x[0]]
    if s == 0:
        own_opts = [[]]
    elif s == 1:
        own_opts = [[p] for p in (lefts[:3] + rights[:3])]
    elif s == 2:
        own_opts = [[pl, pr] for pl in lefts[:4] for pr in rights[:4]]
    else:
        base = pick(pool[1], s)
        own_opts = [base] if base else []
        for i in range(min(3, len(lefts))):
            for j in range(min(3, len(rights))):
                if len(lefts) >= s - 1 - j:
                    pass
        # also try s-2 spread + straddle pair
        if lefts and rights and len(pool[1]) >= s:
            mid = [p for p in pool[1] if p not in (lefts[0], rights[0])]
            if len(mid) >= s - 2:
                own_opts.append([lefts[0], rights[0]] + mid[:s - 2])
    for ys in own_opts:
        if ys is None or len(ys) != s:
            continue
        got = order_by_hull(x, ys, as_, bs)
        if got is not None:
            return got
    return None


def order_by_hull(x, ys, as_, bs):
    """Derive sigma from the actual convex hull (float guess; exact verify
    downstream). Returns (subs, k) or None if some point is hull-interior
    or blocks are not contiguous as (v2, own, v3, a's, v1, b's)."""
    pts = [("v2", V2), ("v3", V3), ("v1", V1), ("x", x)]
    pts += [(f"Y{i}", p) for i, p in enumerate(ys)]
    pts += [(f"A{i}", p) for i, p in enumerate(as_)]
    pts += [(f"B{i}", p) for i, p in enumerate(bs)]
    fl = [(float(p[0]), float(p[1]), nm) for nm, p in pts]
    if len({(a, b) for a, b, _ in fl}) < len(fl):
        return None
    # Andrew monotone chain (CCW)
    fl.sort()
    def half(seq):
        h = []
        for q in seq:
            while len(h) >= 2 and ((h[-1][0]-h[-2][0])*(q[1]-h[-2][1])
                                   - (h[-1][1]-h[-2][1])*(q[0]-h[-2][0])) <= 0:
                h.pop()
            h.append(q)
        return h
    lower, upper = half(fl), half(fl[::-1])
    hull = lower[:-1] + upper[:-1]
    if len(hull) != len(fl):
        return None                      # some point interior/collinear
    names = [nm for _, _, nm in hull]    # CCW cyclic
    i2 = names.index("v2")
    names = names[i2:] + names[:i2]
    d = {nm: p for nm, p in pts}
    # expected pattern: v2, own(x/Y..), v3, A.., v1, B..
    try:
        iv3, iv1 = names.index("v3"), names.index("v1")
    except ValueError:
        return None
    if not (0 < iv3 < iv1):
        return None
    own_blk = names[1:iv3]
    a_blk = names[iv3 + 1:iv1]
    b_blk = names[iv1 + 1:]
    if (sorted(own_blk) != sorted(["x"] + [f"Y{i}" for i in range(len(ys))])
            or sorted(a_blk) != sorted(f"A{i}" for i in range(len(as_)))
            or sorted(b_blk) != sorted(f"B{i}" for i in range(len(bs)))):
        return None
    k = own_blk.index("x")
    subs = {"v1x": V1[0], "v1y": V1[1], "xx": x[0], "xy": x[1],
            "oy": OY, "R2": R2, "rho2": d2(d[own_blk[0] if own_blk[0] != "x"
                                             else (a_blk[0] if a_blk else
                                                   (b_blk[0] if b_blk else own_blk[-1]))], x)
            if False else None}
    # rho2 from any packet member actually present
    member = None
    for nm in own_blk + a_blk + b_blk:
        if nm != "x":
            member = d[nm]
            break
    subs["rho2"] = d2(member, x) if member is not None else None
    yi = 0
    for nm in own_blk:
        if nm == "x":
            continue
        yi += 1
        subs[f"y{yi}x"], subs[f"y{yi}y"] = d[nm][0], d[nm][1]
    for i, nm in enumerate(a_blk):
        subs[f"a{i+1}x"], subs[f"a{i+1}y"] = d[nm][0], d[nm][1]
    for i, nm in enumerate(b_blk):
        subs[f"b{i+1}x"], subs[f"b{i+1}y"] = d[nm][0], d[nm][1]
    return subs, k


def x_candidates(vc):
    """Rational x in cap C1 respecting forced bisector constraints."""
    out = []
    if set(vc) == {"v2", "v3"}:
        xs = [F(1, 2)]
    elif set(vc) == {"v1", "v2"}:
        # bisector of v1,v2: param rational points x = mid + t*perp
        mid = (V1[0] / 2, V1[1] / 2)
        per = (V1[1], -V1[0])
        return [(mid[0] + t * per[0], mid[1] + t * per[1])
                for t in [F(i, 32) for i in range(8, 33)]]
    elif set(vc) == {"v1", "v3"}:
        mid = ((V1[0] + 1) / 2, V1[1] / 2)
        per = (V1[1], -(V1[0] - 1))
        return [(mid[0] + t * per[0], mid[1] + t * per[1])
                for t in [F(-i, 32) for i in range(8, 33)]]
    else:
        xs = [F(1, 2), F(2, 5), F(3, 5), F(3, 10), F(7, 10), F(1, 4), F(3, 4),
              F(3, 20), F(1, 5), F(9, 20), F(11, 20), F(4, 5), F(17, 20)]
    ys = [F(-1, 8), F(-1, 5), F(-1, 4), F(-3, 10), F(-1, 16), F(-2, 5),
          F(-7, 16), F(-1, 3)]
    for a in xs:
        for b in ys:
            out.append((a, b))
    return out


def rho_bases(x, vc, m, s, l, r):
    """Candidate base points on the packet circle."""
    names = {"v1": V1, "v2": V2, "v3": V3}
    if vc:
        return [names[vc[0]]]
    # anchor in a target lens: rational grid points, filtered by cap
    want = 2 if l else (3 if r else 1)
    grid = []
    for a in [F(i, 16) for i in range(-4, 21)]:
        for b in [F(j, 16) for j in range(-6, 15)]:
            p = (a, b)
            if p != x and in_disk(p) and cap_of(p) == want:
                grid.append(p)
    grid.sort(key=lambda p: abs(d2(p, x) - F(1, 2)))
    return grid[:14]


def find_witness(m, s, l, r):
    for fr in FRAMES:
        set_frame(fr)
        w = find_witness_in_frame(m, s, l, r)
        if w:
            return w
    return None


def find_witness_in_frame(m, s, l, r):
    for vc in ([()] if m == 0 else
               ([("v2", "v3"), ("v1", "v2"), ("v1", "v3")] if m == 2 else
                [("v2",), ("v3",), ("v1",)])):
        vcl = list(vc)
        for x in x_candidates(vcl):
            if not (in_disk(x) and cap_of(x) == 1):
                continue
            names = {"v1": V1, "v2": V2, "v3": V3}
            if m == 2 and d2(names[vcl[0]], x) != d2(names[vcl[1]], x):
                continue
            for rb in rho_bases(x, vcl, m, s, l, r):
                got = try_assemble(m, s, l, r, vcl, x, rb)
                if got is None:
                    stats["pool"] += 1
                    continue
                subs, k = got
                cs = build_window(m, s, l, r, vcl, k)
                sy = {kk: sp.Rational(v.numerator, v.denominator)
                      for kk, v in subs.items()}
                ok, bad = verify_exact(cs, sy)
                if ok:
                    return {"vc": vcl, "k": k, "witness":
                            {kk: str(v) for kk, v in subs.items()}}
                stats["verify"] += 1
                if stats["verify"] <= 3:
                    stats["first_bad"].append(bad[0])
    return None


stats = {"pool": 0, "verify": 0, "first_bad": []}


def main():
    only = sys.argv[1] if len(sys.argv) > 1 else None
    results = {}
    outp = os.path.join(HERE, "witnesses.json")
    if os.path.exists(outp):
        results = json.load(open(outp))
    PROVEN_KILLED = {"2101", "2200"}   # kill_notes.md K-C
    for (m, s, l, r) in CLASSES:
        key = f"{m}{s}{l}{r}"
        if only and key != only:
            continue
        if key in results and results[key]:
            continue
        if key in PROVEN_KILLED and not only:
            continue
        stats["pool"] = stats["verify"] = 0
        stats["first_bad"] = []
        w = find_witness(m, s, l, r)
        results[key] = w
        json.dump(results, open(outp, "w"), indent=1)
        print(f"({m},{s},{l},{r}): "
              + ("REALIZED vc=%s k=%s" % (w["vc"], w["k"]) if w
                 else f"no witness (pool-fails={stats['pool']} "
                      f"verify-fails={stats['verify']} "
                      f"first_bad={[str(b)[:90] for b in stats['first_bad'][:2]]})"),
              flush=True)


if __name__ == "__main__":
    main()

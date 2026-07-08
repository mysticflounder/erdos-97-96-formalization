#!/usr/bin/env python3
"""Q3 exact witness factory v3 (constructive rational; see formulation.md).

Frame: rational apex U above the axis; oy = (ux^2-ux+uy^2)/(2uy) rational,
R2 = 1/4 + oy^2. Radius equalities hold exactly by construction (members
are rational rotations of a base point about their center). Region/order
constraints screened with exact Fraction arithmetic; witnesses re-verified
through the OFFICIAL build_w2c + verify_exact in verify.py.

v3 resolution order (kill_notes.md F-Q3-2 structure), with backtracking:
 1. K-Q3-1 classes (io2=ident AND io1=ident) -> KILLED-PROVEN, no search.
 2. Coupled members first (shared s-point, cross-interior identifications):
    they DEFINE the radii; two-forced-radii cases use the exact rational
    circle intersection (x0, +-y0), incl. the Thales-frame forcing for the
    {U, shared-s} pair.
 3. Remaining specials placed on the now-known circles by directed
    rotation; plains fill up gamma counts.
Each stage is a generator over candidate states and the plains tail runs
inside the nested iteration (budgeted), so a failed tail retries the next
sample/candidate instead of abandoning the apex.
Classes whose forced structure is provably irrational in this gauge
(e.g. rv2 = rw2 = 1 identifications, the equilateral U) are returned
NEEDS-SPECIAL for the exact-algebraic pass (specials.py).
"""
from __future__ import annotations

import json
import math
import os
import sys
from fractions import Fraction as Fr

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import q3lib as q

HERE = os.path.dirname(os.path.abspath(__file__))


# ---------------------------------------------------------------- geometry

def fr_d2(a, b):
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def fr_sA2(v, vj, vk):
    return (vj[0] - v[0]) * (vk[1] - v[1]) - (vk[0] - v[0]) * (vj[1] - v[1])


def rot(t, c, p):
    co = Fr(1 - t * t, 1) / (1 + t * t)
    si = Fr(2, 1) * t / (1 + t * t)
    dx, dy = p[0] - c[0], p[1] - c[1]
    return (c[0] + co * dx - si * dy, c[1] + si * dx + co * dy)


V = (Fr(0), Fr(0))
W = (Fr(1), Fr(0))


def frame(U):
    ux, uy = U
    oy = (ux * ux - ux + uy * uy) / (2 * uy)
    return (Fr(1, 2), oy), Fr(1, 4) + oy * oy


def nonobtuse(U):
    a = (V[0] - U[0]) * (W[0] - U[0]) + (V[1] - U[1]) * (W[1] - U[1])
    b = (U[0] - V[0]) * (W[0] - V[0]) + (U[1] - V[1]) * (W[1] - V[1])
    c = (U[0] - W[0]) * (V[0] - W[0]) + (U[1] - W[1]) * (V[1] - W[1])
    return a >= 0 and b >= 0 and c >= 0


def in_cap(p, own, U, O, R2):
    if fr_d2(p, O) > R2:
        return False
    chords = {1: (V, W, U), 2: (W, U, V), 3: (U, V, W)}
    for ci, (ca, cb, opp) in chords.items():
        prod = fr_sA2(p, ca, cb) * fr_sA2(opp, ca, cb)
        if (prod >= 0) if ci == own else (prod <= 0):
            return False
    return True


def convex_ccw(seq):
    n = len(seq)
    for i in range(n):
        for j in range(i + 1, n):
            for k in range(j + 1, n):
                if fr_sA2(seq[i], seq[j], seq[k]) <= 0:
                    return False
    return True


def frac_sqrt(x):
    if x < 0:
        return None
    rn, rd = math.isqrt(x.numerator), math.isqrt(x.denominator)
    if rn * rn == x.numerator and rd * rd == x.denominator:
        return Fr(rn, rd)
    return None


def circle_pts(a, b):
    """C(V, a) n C(W, b) = (x0, +-y). Rational pair or None."""
    x0 = (a - b + 1) / 2
    y2 = a - x0 * x0
    if y2 <= 0:
        return None
    y = frac_sqrt(y2)
    if y is None:
        return None
    return (x0, y), (x0, -y)


# ---------------------------------------------------------------- menus

T_SMALL = [Fr(1, 24), Fr(1, 16), Fr(1, 12), Fr(1, 10), Fr(1, 8), Fr(1, 6),
           Fr(1, 5), Fr(1, 4), Fr(1, 3)]

U_MENU = [(Fr(1, 2), Fr(1)), (Fr(1, 2), Fr(3, 4)), (Fr(1, 2), Fr(3, 2)),
          (Fr(2, 5), Fr(1)), (Fr(3, 5), Fr(1)), (Fr(1, 2), Fr(2)),
          (Fr(1, 3), Fr(1)), (Fr(1, 2), Fr(5, 8)), (Fr(2, 5), Fr(6, 5)),
          (Fr(1, 4), Fr(7, 8))]

U_DENSE = [(Fr(nx, 12), Fr(ny, 12)) for nx in range(2, 11)
           for ny in range(4, 25, 2)]

# skewed apexes: right angle at W (ux=1) / at V (ux=0) — nonobtuse holds
# for every uy > 0; z3 subsystem models for the anchored-ident families
# sit here and the interior grid never reaches them
U_SKEW = [(Fr(x), Fr(ny, 8)) for x in (1, 0) for ny in range(3, 14, 2)]


def u_on_unit_circle_about(center):
    other = W if center == V else V
    out = []
    for t in [Fr(1, 3), Fr(2, 5), Fr(1, 2), Fr(3, 5), Fr(2, 3), Fr(3, 4),
              Fr(4, 5), Fr(1)]:
        p = rot(t if center == V else -t, center, other)
        if p[1] > 0:
            out.append(p)
    return out


def u_thales():
    """Rational points on the circle with diameter VW (forces oy = 0).
    Rotate W (angle 0 about the center) CCW so the image lands ABOVE the
    axis; rotating V (angle pi) by positive t always lands below."""
    out = []
    C = (Fr(1, 2), Fr(0))
    for t in [Fr(1, 4), Fr(1, 3), Fr(2, 5), Fr(1, 2), Fr(3, 5), Fr(2, 3),
              Fr(3, 4), Fr(1), Fr(4, 3), Fr(3, 2)]:
        p = rot(t, C, W)
        if p[1] > 0:
            out.append(p)
    return out


def u_conic_ident(mirror=False):
    """Apexes for the both-forced ident shape rv2 = |UV|^2, rw2 = 1 (or
    its mirror): the two-circle intersection (x0, +-y0) is rational iff
    duv*(4-duv) is a rational square, i.e. duv = 4b^2/(a^2+b^2). Build a
    rational U0 with |U0|^2 = duv (namely (2ab/N, 2b^2/N), N = a^2+b^2),
    then rational rotations about the center keep duv fixed."""
    out = []
    for a, b in [(2, 1), (3, 2), (4, 3), (5, 3), (3, 1), (5, 2), (1, 1),
                 (5, 4), (7, 5)]:
        N = a * a + b * b
        U0 = (Fr(2 * a * b, N), Fr(2 * b * b, N))
        for t in (Fr(0), Fr(1, 8), Fr(-1, 8), Fr(1, 4), Fr(-1, 4),
                  Fr(1, 2), Fr(-1, 2), Fr(1, 16), Fr(-1, 16)):
            p = rot(t, V, U0) if t else U0
            if mirror:
                p = (1 - p[0], p[1])
            if p[1] > 0 and nonobtuse(p):
                out.append(p)
    return out


def region_samples(own, U, O, R2):
    """Samples in cap `own`, mu-outer / lam-inner so a short prefix already
    sweeps the full chord (diverse distances from either center)."""
    chords = {1: (V, W), 2: (W, U), 3: (U, V)}
    A, B = chords[own]
    out = []
    for mu in (Fr(1, 4), Fr(1, 2), Fr(1, 8), Fr(1), Fr(1, 16), Fr(3, 2)):
        for lam in (Fr(1, 2), Fr(1, 4), Fr(3, 4), Fr(1, 8), Fr(7, 8),
                    Fr(3, 8), Fr(5, 8)):
            M = (A[0] + lam * (B[0] - A[0]), A[1] + lam * (B[1] - A[1]))
            c = (M[0] + mu * (M[0] - O[0]), M[1] + mu * (M[1] - O[1]))
            if in_cap(c, own, U, O, R2):
                out.append(c)
    return out


def circle_cands(center, base, count, own, U, O, R2,
                 include_base=True, avoid=()):
    """Up to count points in cap `own` on circle(center, |base-center|), by
    directed rational rotations of base; exact in_cap acceptance. Returns
    whatever was found (possibly fewer than count)."""
    got = []
    if include_base and in_cap(base, own, U, O, R2) and base not in avoid:
        got.append(base)
    thb = math.atan2(float(base[1] - center[1]), float(base[0] - center[0]))
    t_cands = []
    for s in region_samples(own, U, O, R2):
        ths = math.atan2(float(s[1] - center[1]), float(s[0] - center[0]))
        dth = ths - thb
        while dth > math.pi:
            dth -= 2 * math.pi
        while dth < -math.pi:
            dth += 2 * math.pi
        t_cands.append(Fr(math.tan(dth / 2)).limit_denominator(64))
    wig = [Fr(0), Fr(1, 64), Fr(-1, 64), Fr(1, 32), Fr(-1, 32), Fr(1, 16),
           Fr(-1, 16), Fr(1, 8), Fr(-1, 8), Fr(1, 4), Fr(-1, 4)]
    # wiggle-OUTER: the first pass sweeps every aim direction once, so the
    # pool is angularly diverse instead of clustering at the first aim
    for dw in wig:
        for t0 in t_cands:
            if len(got) >= count:
                return got[:count]
            cand = rot(t0 + dw, center, base)
            if (cand not in got and cand not in avoid
                    and in_cap(cand, own, U, O, R2)):
                got.append(cand)
    for t in T_SMALL:
        for tt in (t, -t):
            if len(got) >= count:
                return got[:count]
            cand = rot(tt, center, base)
            if (cand not in got and cand not in avoid
                    and in_cap(cand, own, U, O, R2)):
                got.append(cand)
    return got[:count]


def members_on_circle(center, base, count, own, U, O, R2,
                      include_base=True, avoid=()):
    """Exactly count points or None (strict wrapper over circle_cands)."""
    got = circle_cands(center, base, count, own, U, O, R2,
                       include_base=include_base, avoid=avoid)
    return got if len(got) >= count else None


def sort_block(pts, ref):
    return sorted(pts, key=lambda p: math.atan2(float(p[1] - ref[1]),
                                                float(p[0] - ref[0])))


# ---------------------------------------------------------------- assembly
#
# v3: staged generators with full backtracking. Each stage yields candidate
# states (rv2, rw2, vbase, wbase, extras); the plains tail runs inside the
# nested iteration, so a failed tail retries the next candidate instead of
# abandoning the apex (v2 regression: the defining-sample loops committed
# to the first sample that satisfied the side's specials).

CAND_LIMIT = 6      # circle candidates per special slot
SAMPLE_LIMIT = 14   # region samples tried per defining slot
TAIL_BUDGET = 400   # ps/qs attempts per (class, U); ps fails are cheap
CLASS_BUDGET = 16000  # total attempts per class across the U menu


def _st(rv2, rw2, vbase, wbase, extras):
    return {"rv2": rv2, "rw2": rw2, "vbase": vbase, "wbase": wbase,
            "extras": extras}


def gen_shared(cls, U, O, R2, st):
    """Shared s-point stage (F-Q3-2): defines both radii when free; the
    o2/o1-ident partner, if any, is the exact mirror across VW."""
    if cls["isv"] != "shared":
        yield st
        return
    rv2, rw2 = st["rv2"], st["rw2"]

    def with_z(z, rv2n, vb, rw2n, wb):
        ex = dict(st["extras"])
        ex["svw"] = z
        if cls["io2"] == "ident" or cls["io1"] == "ident":
            zm = (z[0], -z[1])  # exact mirror (F-Q3-2)
            reg = 3 if cls["io2"] == "ident" else 2
            if not in_cap(zm, reg, U, O, R2):
                return None
            ex["_ident_o2" if reg == 3 else "_ident_o1"] = zm
        return _st(rv2n, rw2n, vb, wb, ex)

    if rv2 is not None and rw2 is not None:
        pts = circle_pts(rv2, rw2)
        if pts is None:
            return  # this U gives no rational shared point
        z = pts[1]  # lower
        if in_cap(z, 1, U, O, R2):
            n = with_z(z, rv2, st["vbase"], rw2, st["wbase"])
            if n:
                yield n
    elif rv2 is not None:
        for z in circle_cands(V, st["vbase"], CAND_LIMIT, 1, U, O, R2,
                              include_base=False):
            n = with_z(z, rv2, st["vbase"], fr_d2(z, W), z)
            if n:
                yield n
    elif rw2 is not None:
        for z in circle_cands(W, st["wbase"], CAND_LIMIT, 1, U, O, R2,
                              include_base=False):
            n = with_z(z, fr_d2(z, V), z, rw2, st["wbase"])
            if n:
                yield n
    else:
        for z in region_samples(1, U, O, R2)[:SAMPLE_LIMIT]:
            n = with_z(z, fr_d2(z, V), z, fr_d2(z, W), z)
            if n:
                yield n


def gen_ident(cls, U, O, R2, st, which):
    """Cross-interior identification stage; which in ('o2','o1').
    o2 lives in region 3, o1 in region 2; the point is on BOTH circles."""
    key = "_ident_" + which
    reg = 3 if which == "o2" else 2
    if cls["i" + which] != "ident" or key in st["extras"]:
        yield st
        return
    rv2, rw2 = st["rv2"], st["rw2"]

    def with_z(z, rv2n, vb, rw2n, wb):
        ex = dict(st["extras"])
        ex[key] = z
        return _st(rv2n, rw2n, vb, wb, ex)

    if rv2 is not None and rw2 is not None:
        pts = circle_pts(rv2, rw2)
        if pts is None:
            return
        z = pts[0]  # upper
        if in_cap(z, reg, U, O, R2):
            yield with_z(z, rv2, st["vbase"], rw2, st["wbase"])
    elif rv2 is not None:
        for z in circle_cands(V, st["vbase"], CAND_LIMIT, reg, U, O, R2,
                              include_base=False):
            yield with_z(z, rv2, st["vbase"], fr_d2(z, W), z)
    elif rw2 is not None:
        for z in circle_cands(W, st["wbase"], CAND_LIMIT, reg, U, O, R2,
                              include_base=False):
            yield with_z(z, fr_d2(z, V), z, rw2, st["wbase"])
    else:
        for z in region_samples(reg, U, O, R2)[:SAMPLE_LIMIT]:
            yield with_z(z, fr_d2(z, V), z, fr_d2(z, W), z)


def _spec_product(center, base, specials, U, O, R2):
    """Yield dicts assigning each special (nm, reg) a distinct candidate on
    circle(center, |base-center|)."""
    if not specials:
        yield {}
        return
    nm, reg = specials[0]
    for z in circle_cands(center, base, CAND_LIMIT, reg, U, O, R2,
                          include_base=False):
        for rest in _spec_product(center, base, specials[1:], U, O, R2):
            if z in rest.values():
                continue
            yield {nm: z, **rest}


def gen_v_side(cls, U, O, R2, st):
    """Leftover V-side specials; a defining sample fixes rv2 if still free."""
    v_specials = []
    if cls["av"] == "s" and cls["isv"] != "shared":
        v_specials.append(("sv", 1))
    if cls["bv"] == "o2" and cls["io2"] != "ident":
        v_specials.append(("vo2", 3))
    if st["rv2"] is not None:
        for asg in _spec_product(V, st["vbase"], v_specials, U, O, R2):
            ex = dict(st["extras"])
            ex.update(asg)
            yield _st(st["rv2"], st["rw2"], st["vbase"], st["wbase"], ex)
        return
    for nm0, reg0 in v_specials + [("_p0", 2)]:
        for s in region_samples(reg0, U, O, R2)[:SAMPLE_LIMIT]:
            rest = [spec for spec in v_specials if spec[0] != nm0]
            for asg in _spec_product(V, s, rest, U, O, R2):
                ex = dict(st["extras"])
                ex[nm0] = s
                ex.update(asg)
                yield _st(fr_d2(s, V), st["rw2"], s, st["wbase"], ex)


def gen_w_side(cls, U, O, R2, st):
    """Leftover W-side specials; a defining sample fixes rw2 if still free."""
    w_specials = []
    if cls["aw"] == "s" and cls["isv"] != "shared":
        w_specials.append(("sw", 1))
    if cls["bw"] == "o1" and cls["io1"] != "ident":
        w_specials.append(("wo1", 2))
    if st["rw2"] is not None:
        for asg in _spec_product(W, st["wbase"], w_specials, U, O, R2):
            ex = dict(st["extras"])
            ex.update(asg)
            yield _st(st["rv2"], st["rw2"], st["vbase"], st["wbase"], ex)
        return
    for nm0, reg0 in w_specials + [("_q0", 3)]:
        for s in region_samples(reg0, U, O, R2)[:SAMPLE_LIMIT]:
            rest = [spec for spec in w_specials if spec[0] != nm0]
            for asg in _spec_product(W, s, rest, U, O, R2):
                ex = dict(st["extras"])
                ex[nm0] = s
                ex.update(asg)
                yield _st(st["rv2"], fr_d2(s, W), st["vbase"], s, ex)


def tail_ps(cls, U, O, R2, st):
    """V-side plain p block; depends only on the V-side state (regions
    keep the W-side extras collision-free). None on failure."""
    extras = st["extras"]
    avoid_v = tuple(v for k, v in extras.items() if not k.startswith("_q"))
    seedp = extras.get("_ident_o1") or extras.get("_p0") or st["vbase"]
    ps = members_on_circle(V, seedp, cls["gv"], 2, U, O, R2,
                           include_base=(seedp not in (W, U)
                                         and in_cap(seedp, 2, U, O, R2)),
                           avoid=tuple(a for a in avoid_v if a != seedp))
    if ps is None:
        return None
    if "_ident_o1" in extras and extras["_ident_o1"] not in ps:
        ps = [extras["_ident_o1"]] + ps[:cls["gv"] - 1]
    if len(set(ps)) < cls["gv"]:
        return None
    return ps


def tail_qs(cls, U, O, R2, st, ps):
    """W-side plain q block + finalize. The W side often has a single
    state, so on convexity failure retry over subsets of a larger
    candidate pool (angular spread) instead of giving up."""
    from itertools import combinations
    extras = st["extras"]
    seedq = extras.get("_ident_o2") or extras.get("_q0") or st["wbase"]
    pool = circle_cands(W, seedq, cls["gw"] + 3, 3, U, O, R2,
                        include_base=(seedq not in (V, U)
                                      and in_cap(seedq, 3, U, O, R2)),
                        avoid=tuple(p for p in ps) + tuple(
                            v for k, v in extras.items()
                            if not k.startswith("_p")))
    ident = extras.get("_ident_o2")
    if ident is not None:
        pool = [ident] + [p for p in pool if p != ident]
    if len(pool) < cls["gw"]:
        return None
    fin = {k: v for k, v in extras.items() if k not in ("_p0", "_q0")}
    tried = 0
    for idx in combinations(range(len(pool)), cls["gw"]):
        if ident is not None and 0 not in idx:
            continue  # the identified point must BE a q-member
        qs = [pool[i] for i in idx]
        tried += 1
        res = finalize(cls, U, O, R2, st["rv2"], st["rw2"], ps, qs, fin)
        if res is not None:
            return res
        if tried >= 12:
            break
    return None


def try_assemble(cls, U, budget=TAIL_BUDGET):
    """Returns (witness-or-None, tails_used)."""
    O, R2 = frame(U)
    if U[1] <= 0 or not nonobtuse(U):
        return None, 0
    av, bv, aw, bw = cls["av"], cls["bv"], cls["aw"], cls["bw"]
    duv, duw = fr_d2(U, V), fr_d2(U, W)
    if av == "W" and bv == "U" and duv != 1:
        return None, 0
    if aw == "V" and bw == "U" and duw != 1:
        return None, 0
    rv2 = Fr(1) if av == "W" else (duv if bv == "U" else None)
    rw2 = Fr(1) if aw == "V" else (duw if bw == "U" else None)
    # base point ON the V-circle when its radius is forced
    vbase = W if av == "W" else (U if bv == "U" else None)
    wbase = V if aw == "V" else (U if bw == "U" else None)
    st0 = _st(rv2, rw2, vbase, wbase, {})
    used = 0
    for st1 in gen_shared(cls, U, O, R2, st0):
        for st2 in gen_ident(cls, U, O, R2, st1, "o2"):
            for st3 in gen_ident(cls, U, O, R2, st2, "o1"):
                for st4 in gen_v_side(cls, U, O, R2, st3):
                    used += 1
                    ps = tail_ps(cls, U, O, R2, st4)
                    if ps is None:
                        if used >= budget:
                            return None, used
                        continue
                    for st5 in gen_w_side(cls, U, O, R2, st4):
                        used += 1
                        res = tail_qs(cls, U, O, R2, st5, ps)
                        if res is not None:
                            return res, used
                        if used >= budget:
                            return None, used
    return None, used


def finalize(cls, U, O, R2, rv2, rw2, ps, qs, extras):
    p_block_pts = list(ps) + ([extras["wo1"]] if "wo1" in extras else [])
    q_block_pts = list(qs) + ([extras["vo2"]] if "vo2" in extras else [])
    s_block_pts = ([extras["svw"]] if "svw" in extras else
                   [extras[k] for k in ("sv", "sw") if k in extras])
    p_block = sort_block(p_block_pts, O)
    q_block = sort_block(q_block_pts, O)
    s_block = sort_block(s_block_pts, O)
    for pb in (p_block, list(reversed(p_block))):
        for qb in (q_block, list(reversed(q_block))):
            sbs = ((s_block, list(reversed(s_block)))
                   if len(s_block) > 1 else (s_block,))
            for sb in sbs:
                seq = [V] + list(sb) + [W] + list(pb) + [U] + list(qb)
                if convex_ccw(seq):
                    return pack(cls, U, O, R2, rv2, rw2, ps, qs, extras,
                                sb, pb, qb)
    return None


def pack(cls, U, O, R2, rv2, rw2, ps, qs, extras, sb, pb, qb):
    sc = {"pslot": None, "pident": None, "qslot": None, "qident": None,
          "sord": None}
    if "wo1" in extras:
        sc["pslot"] = pb.index(extras["wo1"])
    if cls["io1"] == "ident":
        sc["pident"] = pb.index(extras["_ident_o1"])
    if "vo2" in extras:
        sc["qslot"] = qb.index(extras["vo2"])
    if cls["io2"] == "ident":
        sc["qident"] = qb.index(extras["_ident_o2"])
    if cls["isv"] == "sep":
        sc["sord"] = "vw" if sb and sb[0] == extras.get("sv") else "wv"
    subs = {"v1x": U[0], "v1y": U[1], "oy": O[1], "R2": R2,
            "rv2": rv2, "rw2": rw2}

    def put(nm, p):
        subs[nm + "x"], subs[nm + "y"] = p[0], p[1]

    plain_ps = [p for p in pb if p != extras.get("wo1")]
    for i, p in enumerate(plain_ps):
        put(f"p{i+1}", p)
    if "wo1" in extras:
        put("wo1", extras["wo1"])
    plain_qs = [p for p in qb if p != extras.get("vo2")]
    for i, p in enumerate(plain_qs):
        put(f"q{i+1}", p)
    if "vo2" in extras:
        put("vo2", extras["vo2"])
    for nm in ("svw", "sv", "sw"):
        if nm in extras:
            put(nm, extras[nm])
    return {"sc": sc, "subs": subs}


def u_candidates(cls):
    need_uv1 = (cls["av"] == "W" and cls["bv"] == "U")
    need_uw1 = (cls["aw"] == "V" and cls["bw"] == "U")
    if need_uv1 and need_uw1:
        return []  # equilateral apex: irrational -- specials.py
    if need_uv1:
        return u_on_unit_circle_about(V)
    if need_uw1:
        return u_on_unit_circle_about(W)
    menu = list(U_MENU)
    if cls["isv"] == "shared" and cls["bv"] == "U" and cls["bw"] == "U":
        menu = u_thales() + menu  # F-Q3-2 forced frame
    if cls["bv"] == "U" and cls["io1"] == "ident" and cls["aw"] == "V":
        menu = u_conic_ident() + menu  # rational (duv,1) intersection
    if cls["av"] == "W" and cls["io2"] == "ident" and cls["bw"] == "U":
        menu = u_conic_ident(mirror=True) + menu
    return menu + U_SKEW + U_DENSE  # breadth; CLASS_BUDGET bounds work


def realize(cls):
    if cls["io2"] == "ident" and cls["io1"] == "ident":
        return {"status": "KILLED-PROVEN", "ref": "K-Q3-1"}
    if cls["isv"] == "shared":
        # K-Q3-5 (kill_notes.md): any shared intS member is impossible;
        # subsumes K-Q3-3 (the bv=U ∧ bw=U case)
        return {"status": "KILLED-PROVEN", "ref": "K-Q3-5"}
    if (cls["av"] == "W" and cls["aw"] == "V"
            and (cls["io2"] == "ident" or cls["io1"] == "ident")):
        # rv2 = rw2 = 1: the ident point is (1/2, +-sqrt(3)/2) — never
        # rational; exact-algebraic pass (specials.py)
        return {"status": "NEEDS-SPECIAL"}
    cands = u_candidates(cls)
    if not cands:
        return {"status": "NEEDS-SPECIAL"}
    total = CLASS_BUDGET
    for U in cands:
        res, used = try_assemble(cls, U, min(TAIL_BUDGET, total))
        total -= used
        if res is not None:
            return {"status": "witness", **res}
        if total <= 0:
            break
    return {"status": "no-witness-in-menu"}


if __name__ == "__main__":
    only = set(sys.argv[1:])  # class ids; empty = full sweep
    path = os.path.join(HERE, "factory_raw.json")
    out = {}
    if only and os.path.exists(path):
        out = json.load(open(path))  # merge mode: update named classes only
    for cls in q.all_classes():
        if only and cls["id"] not in only:
            continue
        r = realize(cls)
        out[cls["id"]] = {"status": r["status"]}
        if r.get("ref"):
            out[cls["id"]]["ref"] = r["ref"]
        if r["status"] == "witness":
            out[cls["id"]]["sc"] = r["sc"]
            out[cls["id"]]["subs"] = {k: str(v) for k, v in r["subs"].items()}
        print(cls["id"], r["status"], flush=True)
    with open(path, "w") as f:
        json.dump(out, f, indent=1)

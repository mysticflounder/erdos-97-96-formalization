#!/usr/bin/env python3
"""Q3 exact witness factory v2 (constructive rational; see formulation.md).

Frame: rational apex U above the axis; oy = (ux^2-ux+uy^2)/(2uy) rational,
R2 = 1/4 + oy^2. Radius equalities hold exactly by construction (members
are rational rotations of a base point about their center). Region/order
constraints screened with exact Fraction arithmetic; witnesses re-verified
through the OFFICIAL build_w2c + verify_exact in verify.py.

v2 resolution order (kill_notes.md F-Q3-2 structure):
 1. K-Q3-1 classes (io2=ident AND io1=ident) -> KILLED-PROVEN, no search.
 2. Coupled members first (shared s-point, cross-interior identifications):
    they DEFINE the radii; two-forced-radii cases use the exact rational
    circle intersection (x0, +-y0), incl. the Thales-frame forcing for the
    {U, shared-s} pair.
 3. Remaining specials placed on the now-known circles by directed
    rotation; plains fill up gamma counts.
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
    """Rational points on the circle with diameter VW (forces oy = 0)."""
    out = []
    C = (Fr(1, 2), Fr(0))
    for t in [Fr(1, 4), Fr(1, 3), Fr(2, 5), Fr(1, 2), Fr(3, 5), Fr(2, 3),
              Fr(3, 4), Fr(1), Fr(4, 3), Fr(3, 2)]:
        p = rot(t, C, V)
        if p[1] > 0:
            out.append(p)
    return out


def region_samples(own, U, O, R2):
    chords = {1: (V, W), 2: (W, U), 3: (U, V)}
    A, B = chords[own]
    out = []
    for lam in (Fr(1, 2), Fr(1, 4), Fr(3, 4), Fr(3, 8), Fr(5, 8)):
        M = (A[0] + lam * (B[0] - A[0]), A[1] + lam * (B[1] - A[1]))
        for mu in (Fr(1, 4), Fr(1, 2), Fr(1, 8), Fr(1)):
            c = (M[0] + mu * (M[0] - O[0]), M[1] + mu * (M[1] - O[1]))
            if in_cap(c, own, U, O, R2):
                out.append(c)
    return out


def members_on_circle(center, base, count, own, U, O, R2,
                      include_base=True, avoid=()):
    """count points in cap `own` on circle(center, |base-center|), by
    directed rational rotations of base; exact in_cap acceptance."""
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
    for t0 in t_cands:
        for dw in wig:
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
    return got[:count] if len(got) >= count else None


def sort_block(pts, ref):
    return sorted(pts, key=lambda p: math.atan2(float(p[1] - ref[1]),
                                                float(p[0] - ref[0])))


# ---------------------------------------------------------------- assembly


def try_assemble(cls, U):
    O, R2 = frame(U)
    if U[1] <= 0 or not nonobtuse(U):
        return None
    av, bv, aw, bw = cls["av"], cls["bv"], cls["aw"], cls["bw"]
    duv, duw = fr_d2(U, V), fr_d2(U, W)
    if av == "W" and bv == "U" and duv != 1:
        return None
    if aw == "V" and bw == "U" and duw != 1:
        return None
    rv2 = Fr(1) if av == "W" else (duv if bv == "U" else None)
    rw2 = Fr(1) if aw == "V" else (duw if bw == "U" else None)
    # base point ON the V-circle when its radius is forced
    vbase = W if av == "W" else (U if bv == "U" else None)
    wbase = V if aw == "V" else (U if bw == "U" else None)
    extras = {}

    # ---- coupled members first (F-Q3-2)
    if cls["isv"] == "shared":
        if rv2 is not None and rw2 is not None:
            pts = circle_pts(rv2, rw2)
            if pts is None:
                return None  # this U gives no rational shared point
            z = pts[1]  # lower
            if not in_cap(z, 1, U, O, R2):
                return None
            extras["svw"] = z
        elif rv2 is not None:
            zc = members_on_circle(V, vbase, 1, 1, U, O, R2,
                                   include_base=False)
            if zc is None:
                return None
            z = zc[0]
            extras["svw"] = z
            rw2, wbase = fr_d2(z, W), z
        elif rw2 is not None:
            zc = members_on_circle(W, wbase, 1, 1, U, O, R2,
                                   include_base=False)
            if zc is None:
                return None
            z = zc[0]
            extras["svw"] = z
            rv2, vbase = fr_d2(z, V), z
        else:
            smp = region_samples(1, U, O, R2)
            if not smp:
                return None
            z = smp[0]
            extras["svw"] = z
            rv2, vbase = fr_d2(z, V), z
            rw2, wbase = fr_d2(z, W), z
        if cls["io2"] == "ident" or cls["io1"] == "ident":
            # second shared member = exact mirror of the s-point (F-Q3-2)
            zs = extras["svw"]
            zm = (zs[0], -zs[1])
            reg = 3 if cls["io2"] == "ident" else 2
            if not in_cap(zm, reg, U, O, R2):
                return None
            extras["_ident_o2" if reg == 3 else "_ident_o1"] = zm

    if cls["io2"] == "ident" and "_ident_o2" not in extras:
        if rv2 is not None and rw2 is not None:
            pts = circle_pts(rv2, rw2)
            if pts is None:
                return None
            z = pts[0]  # upper
            if not in_cap(z, 3, U, O, R2):
                return None
        elif rv2 is not None:
            zc = members_on_circle(V, vbase, 1, 3, U, O, R2,
                                   include_base=False)
            if zc is None:
                return None
            z = zc[0]
            rw2, wbase = fr_d2(z, W), z
        elif rw2 is not None:
            zc = members_on_circle(W, wbase, 1, 3, U, O, R2,
                                   include_base=False)
            if zc is None:
                return None
            z = zc[0]
            rv2, vbase = fr_d2(z, V), z
        else:
            smp = region_samples(3, U, O, R2)
            if not smp:
                return None
            z = smp[0]
            rv2, vbase = fr_d2(z, V), z
            rw2, wbase = fr_d2(z, W), z
        extras["_ident_o2"] = z
    if cls["io1"] == "ident" and "_ident_o1" not in extras:
        if rv2 is not None and rw2 is not None:
            pts = circle_pts(rv2, rw2)
            if pts is None:
                return None
            z = pts[0]
            if not in_cap(z, 2, U, O, R2):
                return None
        elif rw2 is not None:
            zc = members_on_circle(W, wbase, 1, 2, U, O, R2,
                                   include_base=False)
            if zc is None:
                return None
            z = zc[0]
            rv2, vbase = fr_d2(z, V), z
        elif rv2 is not None:
            zc = members_on_circle(V, vbase, 1, 2, U, O, R2,
                                   include_base=False)
            if zc is None:
                return None
            z = zc[0]
            rw2, wbase = fr_d2(z, W), z
        else:
            smp = region_samples(2, U, O, R2)
            if not smp:
                return None
            z = smp[0]
            rv2, vbase = fr_d2(z, V), z
            rw2, wbase = fr_d2(z, W), z
        extras["_ident_o1"] = z

    # ---- V side: leftover specials define the circle if still free
    v_specials = []
    if av == "s" and cls["isv"] != "shared":
        v_specials.append(("sv", 1))
    if bv == "o2" and cls["io2"] != "ident":
        v_specials.append(("vo2", 3))
    if rv2 is None:
        defined = False
        for nm0, reg0 in v_specials + [("_p0", 2)]:
            for s in region_samples(reg0, U, O, R2):
                rv2c, vbc = fr_d2(s, V), s
                ok = True
                tmp = {}
                for nm, reg in v_specials:
                    if nm == nm0:
                        tmp[nm] = s
                        continue
                    zc = members_on_circle(V, vbc, 1, reg, U, O, R2,
                                           include_base=False)
                    if zc is None:
                        ok = False
                        break
                    tmp[nm] = zc[0]
                if not ok:
                    continue
                rv2, vbase = rv2c, vbc
                extras.update(tmp)
                if nm0 == "_p0":
                    extras["_p0"] = s
                defined = True
                break
            if defined:
                break
        if not defined:
            return None
    else:
        for nm, reg in v_specials:
            zc = members_on_circle(V, vbase, 1, reg, U, O, R2,
                                   include_base=False)
            if zc is None:
                return None
            extras[nm] = zc[0]

    # ---- W side
    w_specials = []
    if aw == "s" and cls["isv"] != "shared":
        w_specials.append(("sw", 1))
    if bw == "o1" and cls["io1"] != "ident":
        w_specials.append(("wo1", 2))
    if rw2 is None:
        defined = False
        for nm0, reg0 in w_specials + [("_q0", 3)]:
            for s in region_samples(reg0, U, O, R2):
                rw2c, wbc = fr_d2(s, W), s
                ok = True
                tmp = {}
                for nm, reg in w_specials:
                    if nm == nm0:
                        tmp[nm] = s
                        continue
                    zc = members_on_circle(W, wbc, 1, reg, U, O, R2,
                                           include_base=False)
                    if zc is None:
                        ok = False
                        break
                    tmp[nm] = zc[0]
                if not ok:
                    continue
                rw2, wbase = rw2c, wbc
                extras.update(tmp)
                if nm0 == "_q0":
                    extras["_q0"] = s
                defined = True
                break
            if defined:
                break
        if not defined:
            return None
    else:
        for nm, reg in w_specials:
            zc = members_on_circle(W, wbase, 1, reg, U, O, R2,
                                   include_base=False)
            if zc is None:
                return None
            extras[nm] = zc[0]

    # ---- plains
    avoid_v = tuple(v for k, v in extras.items() if not k.startswith("_q"))
    seedp = extras.get("_ident_o1") or extras.get("_p0") or vbase
    ps = members_on_circle(V, seedp, cls["gv"], 2, U, O, R2,
                           include_base=(seedp not in (W, U)
                                         and in_cap(seedp, 2, U, O, R2)),
                           avoid=tuple(a for a in avoid_v if a != seedp))
    if ps is None:
        return None
    seedq = extras.get("_ident_o2") or extras.get("_q0") or wbase
    qs = members_on_circle(W, seedq, cls["gw"], 3, U, O, R2,
                           include_base=(seedq not in (V, U)
                                         and in_cap(seedq, 3, U, O, R2)),
                           avoid=tuple(p for p in ps) + tuple(
                               v for k, v in extras.items()
                               if not k.startswith("_p")))
    if qs is None:
        return None
    # the identified points must BE members of the respective plain lists
    if "_ident_o1" in extras and extras["_ident_o1"] not in ps:
        ps = [extras["_ident_o1"]] + ps[:cls["gv"] - 1]
    if "_ident_o2" in extras and extras["_ident_o2"] not in qs:
        qs = [extras["_ident_o2"]] + qs[:cls["gw"] - 1]
    if len(set(ps)) < cls["gv"] or len(set(qs)) < cls["gw"]:
        return None

    return finalize(cls, U, O, R2, rv2, rw2, ps, qs,
                    {k: v for k, v in extras.items()
                     if k not in ("_p0", "_q0")})


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
    if (cls["io2"] == "ident" or cls["io1"] == "ident") and (
            cls["av"] == "W" or cls["bv"] == "U" or cls["aw"] == "V"
            or cls["bw"] == "U"):
        menu = menu + U_DENSE  # need rational circle intersections
    return menu


def realize(cls):
    if cls["io2"] == "ident" and cls["io1"] == "ident":
        return {"status": "KILLED-PROVEN", "ref": "K-Q3-1"}
    cands = u_candidates(cls)
    if not cands:
        return {"status": "NEEDS-SPECIAL"}
    for U in cands:
        res = try_assemble(cls, U)
        if res is not None:
            return {"status": "witness", **res}
    return {"status": "no-witness-in-menu"}


if __name__ == "__main__":
    only = sys.argv[1] if len(sys.argv) > 1 else None
    out = {}
    for cls in q.all_classes():
        if only and cls["id"] != only:
            continue
        r = realize(cls)
        out[cls["id"]] = {"status": r["status"]}
        if r.get("ref"):
            out[cls["id"]]["ref"] = r["ref"]
        if r["status"] == "witness":
            out[cls["id"]]["sc"] = r["sc"]
            out[cls["id"]]["subs"] = {k: str(v) for k, v in r["subs"].items()}
        print(cls["id"], r["status"], flush=True)
    with open(os.path.join(HERE, "factory_raw.json"), "w") as f:
        json.dump(out, f, indent=1)

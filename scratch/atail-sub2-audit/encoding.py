#!/usr/bin/env python3
"""ATAIL-SUB2 shared encoding library.

Exact (Fraction) evaluators for the SUB2/SUB2-H constraint systems,
mirroring census/candidate_d_probe/encoder.py build_sub2 (left/right) and
the emitted runs/SUB2_{left,right}.smt2 artifacts; z3 builders for the
smoke-test kill systems; the frame-free SUB2 sub-configuration predicate
used by witness_scan.py.

Conventions: v2 = (0,0), v3 = (1,0), O = (1/2, oy), R^2 = 1/4 + oy^2.
SUB2-H = oy fixed to 0. sA2(v,vj,vk) = (vj-v) x (vk-v).
"""
from fractions import Fraction

V2 = (Fraction(0), Fraction(0))
V3 = (Fraction(1), Fraction(0))


def sA2(v, vj, vk):
    return ((vj[0] - v[0]) * (vk[1] - v[1])
            - (vk[0] - v[0]) * (vj[1] - v[1]))


def d2(p, q):
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def convex_triples(seq):
    """All (i<j<k) signed areas of a cyclic CCW listing (positive iff
    strictly convex position in that order)."""
    out = []
    for i in range(len(seq) - 2):
        for j in range(i + 1, len(seq) - 1):
            for k in range(j + 1, len(seq)):
                out.append(((i, j, k), sA2(seq[i], seq[j], seq[k])))
    return out


def sub2_constraints(x, wa, wb, rho2, oy, side):
    """The build_sub2 system, verbatim semantics. Returns a list of
    (name, value, kind) with kind in {'eq0','gt0','ge0'}; the system is
    satisfied iff eq0 == 0, gt0 > 0, ge0 >= 0 for every row."""
    R2 = Fraction(1, 4) + oy * oy if isinstance(oy, Fraction) else \
        0.25 + oy * oy
    O = (Fraction(1, 2) if isinstance(oy, Fraction) else 0.5, oy)
    rows = [
        ("E_PKT_a", d2(wa, x) - rho2, "eq0"),
        ("E_PKT_b", d2(wb, x) - rho2, "eq0"),
        ("I_POS_rho2", rho2, "gt0"),
        ("oy_nonneg", oy, "ge0"),
    ]
    for nm, p in (("x", x), ("wa", wa), ("wb", wb)):
        rows.append((f"disk_{nm}", R2 - d2(p, O), "ge0"))
        rows.append((f"below_{nm}", -p[1], "gt0"))
    seq = ([V2, wa, wb, x, V3] if side == "left"
           else [V2, x, wa, wb, V3])
    names = (["v2", "wa", "wb", "x", "v3"] if side == "left"
             else ["v2", "x", "wa", "wb", "v3"])
    for (i, j, k), val in convex_triples(seq):
        rows.append((f"ord_{names[i]}_{names[j]}_{names[k]}", val, "gt0"))
    return rows


def eval_rows(rows):
    """-> (ok, failures) where failures = [(name, value)]."""
    fails = []
    for name, val, kind in rows:
        if kind == "eq0" and val != 0:
            fails.append((name, val))
        elif kind == "gt0" and not val > 0:
            fails.append((name, val))
        elif kind == "ge0" and not val >= 0:
            fails.append((name, val))
    return (not fails), fails


# --------------------------------------------------------------------------
# Hand transcription of runs/SUB2_left.smt2 / SUB2_right.smt2 (assert-by-
# assert), used to cross-check sub2_constraints against the on-disk
# artifacts on random samples (smoke S5).
# --------------------------------------------------------------------------

def smt2_left_asserts(xx, xy, wax, way, wbx, wby, rho2, oy):
    return [
        ("eq0", wax**2 + way**2 + xx**2 + xy**2 - rho2
         - 2 * wax * xx - 2 * way * xy),
        ("eq0", wbx**2 + wby**2 + xx**2 + xy**2 - rho2
         - 2 * wbx * xx - 2 * wby * xy),
        ("ge0", oy),
        ("ge0", xx - xx**2 - xy**2 + 2 * oy * xy),
        ("ge0", wax - wax**2 - way**2 + 2 * oy * way),
        ("ge0", wbx - wbx**2 - wby**2 + 2 * oy * wby),
        ("gt0", rho2),
        ("gt0", -xy),
        ("gt0", -way),
        ("gt0", -wby),
        ("gt0", wax * wby - way * wbx),
        ("gt0", wax * xy - way * xx),
        ("gt0", -way),
        ("gt0", wbx * xy - wby * xx),
        ("gt0", -wby),
        ("gt0", -xy),
        ("gt0", wax * wby + way * xx + wbx * xy - wax * xy
         - way * wbx - wby * xx),
        ("gt0", way - wby + wax * wby - way * wbx),
        ("gt0", way - xy + wax * xy - way * xx),
        ("gt0", wby - xy + wbx * xy - wby * xx),
    ]


def smt2_right_asserts(xx, xy, wax, way, wbx, wby, rho2, oy):
    return [
        ("eq0", wax**2 + way**2 + xx**2 + xy**2 - rho2
         - 2 * wax * xx - 2 * way * xy),
        ("eq0", wbx**2 + wby**2 + xx**2 + xy**2 - rho2
         - 2 * wbx * xx - 2 * wby * xy),
        ("ge0", oy),
        ("ge0", xx - xx**2 - xy**2 + 2 * oy * xy),
        ("ge0", wax - wax**2 - way**2 + 2 * oy * way),
        ("ge0", wbx - wbx**2 - wby**2 + 2 * oy * wby),
        ("gt0", rho2),
        ("gt0", -xy),
        ("gt0", -way),
        ("gt0", -wby),
        ("gt0", way * xx - wax * xy),
        ("gt0", wby * xx - wbx * xy),
        ("gt0", -xy),
        ("gt0", wax * wby - way * wbx),
        ("gt0", -way),
        ("gt0", -wby),
        ("gt0", wax * wby + way * xx + wbx * xy - wax * xy
         - way * wbx - wby * xx),
        ("gt0", xy - way + way * xx - wax * xy),
        ("gt0", xy - wby + wby * xx - wbx * xy),
        ("gt0", way - wby + wax * wby - way * wbx),
    ]


def smt2_sat(asserts):
    for kind, val in asserts:
        if kind == "eq0" and val != 0:
            return False
        if kind == "gt0" and not val > 0:
            return False
        if kind == "ge0" and not val >= 0:
            return False
    return True


# --------------------------------------------------------------------------
# Frame-free SUB2 sub-configuration predicate (for the banked-witness scan).
# alpha, beta play (v2, v3); the closed disk with diameter [alpha, beta] is
# {w : (w-alpha).(w-beta) <= 0}. A hit = the certificate's hypothesis set:
# equal radius from x, both w in the diameter disk, and all 10 triples of
# one of the chains (alpha, wa, wb, x, beta) / (alpha, x, wa, wb, beta)
# strictly positive. The PROVEN theorem says NO hit can exist anywhere.
# --------------------------------------------------------------------------

def dot(p, q):
    return p[0] * q[0] + p[1] * q[1]


def sub2_hit(alpha, beta, x, w1, w2, strict_margin=0):
    """Return list of (chain, labeling) combos that satisfy the full
    hypothesis set with every strict value > strict_margin and disk
    values <= -strict_margin... (margin only used for float inputs;
    exact inputs use 0)."""
    if d2(x, w1) != d2(x, w2):
        return []
    hits = []
    for wa, wb in ((w1, w2), (w2, w1)):
        # disk membership for wa, wb
        if not (dot((wa[0] - alpha[0], wa[1] - alpha[1]),
                    (wa[0] - beta[0], wa[1] - beta[1])) <= strict_margin
                and dot((wb[0] - alpha[0], wb[1] - alpha[1]),
                        (wb[0] - beta[0], wb[1] - beta[1]))
                <= strict_margin):
            continue
        for chain_name, seq in (("left", [alpha, wa, wb, x, beta]),
                                ("right", [alpha, x, wa, wb, beta])):
            vals = [v for _, v in convex_triples(seq)]
            if all(v > strict_margin for v in vals):
                hits.append((chain_name, (wa, wb)))
    return hits


# --------------------------------------------------------------------------
# z3 kill systems for smoke S1/S2 (the PROVEN probe cuts).
# --------------------------------------------------------------------------

def z3_kill_systems():
    """Build the m<=2 and K-C (vertex-pair s>=1) systems.
    Returns dict name -> z3 solver. Shared frame: v2=(0,0), v3=(1,0),
    v1=(a,b) with b>0 on the MEC (a^2+b^2 = a + 2*oy*b), oy >= 0,
    non-obtuse at v2/v3 (0 <= a <= 1), x below axis inside the disk,
    y (own-cap interior member) below axis inside the disk."""
    import z3
    a, b, oy = z3.Reals("a b oy")
    xx, xy, yx, yy, rho2 = z3.Reals("xx xy yx yy rho2")

    def disk(px, py):
        return (px - z3.RealVal("1/2")) ** 2 + (py - oy) ** 2 \
            <= z3.RealVal("1/4") + oy**2

    base = [
        b > 0,
        a * a + b * b == a + 2 * oy * b,   # v1 on the MEC
        oy >= 0,                            # non-obtuse at v1
        a >= 0, a <= 1,                     # non-obtuse at v2, v3
        xy < 0, disk(xx, xy),               # x in the own lens L1
        rho2 > 0,
    ]
    dxv1 = (xx - a) ** 2 + (xy - b) ** 2
    dxv2 = xx**2 + xy**2
    dxv3 = (xx - 1) ** 2 + xy**2
    dxy = (xx - yx) ** 2 + (xy - yy) ** 2
    own_y = [yy < 0, disk(yx, yy), dxy == rho2]   # own-interior member at rho

    systems = {}
    s = z3.Solver()
    s.add(*base, dxv1 == rho2, dxv2 == rho2, dxv3 == rho2)
    systems["m3_all_three_vertices"] = s
    s = z3.Solver()
    s.add(*base, dxv2 == rho2, dxv3 == rho2, *own_y)
    systems["KC_pair_v2v3_s1"] = s
    s = z3.Solver()
    s.add(*base, dxv1 == rho2, dxv2 == rho2, *own_y)
    systems["KC_pair_v1v2_s1"] = s
    s = z3.Solver()
    s.add(*base, dxv1 == rho2, dxv3 == rho2, *own_y)
    systems["KC_pair_v1v3_s1"] = s
    return systems

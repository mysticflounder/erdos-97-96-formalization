#!/usr/bin/env python3
"""Rationalize the float-feasible residue-class solutions (float_resid.json)
into exact rational witnesses, verified via the OFFICIAL window
(q3lib.build_w2c + encoder.verify_exact) with mutation controls.

Construction (all equalities exact by construction):
  - The ident (double-circle) point d is placed as an exact rational point
    on the KNOWN-radius circle via tan-half-angle parametrization; the
    other radius is derived: rv2 = |d|^2 or rw2 = |d-W|^2.
  - U: rationalized (or, when bv=U, placed rationally ON C(V,1)).
    oy = (ux^2-ux+uy^2)/(2uy), R2 = 1/4 + oy^2 exactly (E-MEC).
  - Every other member is an exact rational rotation (tan-half-angle
    matrix) of a known rational point on its circle, aimed at its float
    position. Rational rotations are dense, so each lands within ~1e-7.
  - All inequalities are open; solutions are re-polished to margin >=
    5e-4 before rationalizing, so ~1e-7 perturbations keep them strict.
"""
import json
import os
import sys
from fractions import Fraction as Fr

import numpy as np
import sympy as sp
from scipy.optimize import minimize

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import q3lib as q                      # noqa: E402
enc = q.enc

PICK = {
    "V0o2_WV0_o2i": "V0o2_WV0_o2i_qi2",
    "V0o2_WVo1_o2i_o1d": "V0o2_WVo1_o2i_o1d_ps3_qi0",
    "VWU_Wso1_o1i": "VWU_Wso1_o1i_pi1",
    "VWo2_Wso1_o2d_o1i": "VWo2_Wso1_o2d_o1i_pi0_qs0",
    "Vso2_Wso1_o2d_o1i_ssep": "Vso2_Wso1_o2d_o1i_ssep_pi0_qs0_wv",
}
MARGIN = 5e-4
DEN = 10**4


def polish(cls, sc, x0_map):
    cs = q.build_w2c(cls, sc)
    names = [str(v) for v in cs.vars]
    f_eqs = sp.lambdify(cs.vars, cs.eqs, "numpy")
    f_ge = sp.lambdify(cs.vars, cs.ge, "numpy")
    f_gt = sp.lambdify(cs.vars, cs.gt, "numpy")

    def obj(x):
        e = np.asarray(f_eqs(*x), dtype=float)
        return float(e @ e)

    cons = [{"type": "ineq",
             "fun": lambda x: np.asarray(f_ge(*x), dtype=float)},
            {"type": "ineq",
             "fun": lambda x: np.asarray(f_gt(*x), dtype=float) - MARGIN}]
    x0 = np.array([x0_map[nm] for nm in names])
    r = minimize(obj, x0, method="SLSQP", constraints=cons,
                 options={"maxiter": 500, "ftol": 1e-16})
    o = obj(r.x)
    tmin = float(np.min(f_gt(*r.x)))
    if o < 1e-12 and tmin >= MARGIN * 0.9:
        return dict(zip(names, map(float, r.x)))
    print(f"  polish weak (obj={o:.2e}, gt_min={tmin:.2e}); "
          "using original", flush=True)
    return x0_map


def rot(s):
    """Exact rotation matrix for angle 2*atan(s), s rational."""
    d = 1 + s * s
    return ((1 - s * s) / d, Fr(-2) * s / d, Fr(2) * s / d, (1 - s * s) / d)


def rotate_about(c, seed, s):
    a, b, cc, dd = rot(s)
    vx, vy = seed[0] - c[0], seed[1] - c[1]
    return (c[0] + a * vx + b * vy, c[1] + cc * vx + dd * vy)


def aim(c, seed, target_f, r2):
    """Exact rational point on circle(c, sqrt(r2)) nearest the float
    target: rotate seed about c by the needed angle, tan-half rationalized."""
    import math
    a0 = math.atan2(float(seed[1] - c[1]), float(seed[0] - c[0]))
    a1 = math.atan2(target_f[1] - float(c[1]), target_f[0] - float(c[0]))
    da = a1 - a0
    while da > math.pi:
        da -= 2 * math.pi
    while da < -math.pi:
        da += 2 * math.pi
    s = Fr(math.tan(da / 2)).limit_denominator(DEN)
    return rotate_about(c, seed, s)


def unit_pt(f):
    """Rational point on the unit circle at origin near float f."""
    u = Fr(f[1] / (1 + f[0])).limit_denominator(DEN)
    d = 1 + u * u
    return ((1 - u * u) / d, Fr(2) * u / d)


def wc_unit_pt(f):
    """Rational point on C(W=(1,0), 1) near float f (t = y/x param)."""
    t = Fr(f[1] / f[0]).limit_denominator(DEN)
    d = 1 + t * t
    return (Fr(2) / d, Fr(2) * t / d)


def construct(cls, sc, x):
    V, W = (Fr(0), Fr(0)), (Fr(1), Fr(0))
    fpt = lambda nm: (x[nm + "x"], x[nm + "y"])   # noqa: E731
    subs = {}
    gv, gw = cls["gv"], cls["gw"]

    # --- U ---
    if cls["bv"] == "U":
        U = unit_pt(fpt("v1"))         # av=W & bv=U => |UV| = 1
    else:
        U = (Fr(x["v1x"]).limit_denominator(DEN),
             Fr(x["v1y"]).limit_denominator(DEN))
    ux, uy = U
    oy = (ux * ux - ux + uy * uy) / (2 * uy)
    R2 = Fr(1, 4) + oy * oy
    subs["v1x"], subs["v1y"], subs["oy"], subs["R2"] = ux, uy, oy, R2

    # --- radii + ident double point ---
    rv2 = Fr(1) if cls["av"] == "W" else None
    rw2 = Fr(1) if cls["aw"] == "V" else None
    if cls["bv"] == "U":
        rv2 = Fr(1)
    if cls["io2"] == "ident":
        dname = f"q{sc['qident'] + 1}"
        d = wc_unit_pt(fpt(dname))     # rw2 = 1 in these classes
        assert rw2 == Fr(1)
        rv2 = d[0] * d[0] + d[1] * d[1]
    elif rv2 == Fr(1):                 # io1 == "ident", rv2 known
        dname = f"p{sc['pident'] + 1}"
        d = unit_pt(fpt(dname))
        rw2 = (d[0] - 1) ** 2 + d[1] ** 2
    else:                              # io1 == "ident", both radii free:
        dname = f"p{sc['pident'] + 1}"  # any rational d defines both circles
        df = fpt(dname)
        d = (Fr(df[0]).limit_denominator(DEN),
             Fr(df[1]).limit_denominator(DEN))
        rv2 = d[0] * d[0] + d[1] * d[1]
        rw2 = (d[0] - 1) ** 2 + d[1] ** 2
    subs["rv2"], subs["rw2"] = rv2, rw2
    subs[dname + "x"], subs[dname + "y"] = d

    # --- seeds on each circle ---
    seed_v = d if cls["io2"] == "ident" else d      # d is on C(V) either way
    seed_w = d                                      # d is on C(W) either way

    # --- remaining members ---
    def place(nm, center, seed, r2):
        p = aim(center, seed, fpt(nm), r2)
        subs[nm + "x"], subs[nm + "y"] = p

    for i in range(gv):
        nm = f"p{i + 1}"
        if nm + "x" not in subs:
            place(nm, V, seed_v, rv2)
    for i in range(gw):
        nm = f"q{i + 1}"
        if nm + "x" not in subs:
            place(nm, W, seed_w, rw2)
    for nm, center, seed, r2 in (("vo2", V, seed_v, rv2),
                                 ("sv", V, seed_v, rv2),
                                 ("wo1", W, seed_w, rw2),
                                 ("sw", W, seed_w, rw2),
                                 ("svw", V, seed_v, rv2)):
        if nm + "x" in x and nm + "x" not in subs:
            place(nm, center, seed, r2)
    return subs


def main():
    classes = {c["id"]: c for c in q.all_classes()}
    fr = json.load(open(os.path.join(HERE, "float_resid.json")))
    out = {}
    for cid, sid in PICK.items():
        cls = classes[cid]
        sc = next(s for s in q.subcases(cls) if q.subcase_id(cls, s) == sid)
        rec = fr[cid][sid]
        assert rec["feasible"], (cid, sid)
        print(f"{cid} ({sid}): polishing…", flush=True)
        x = polish(cls, sc, rec["x"])
        subs = construct(cls, sc, x)
        subs_sp = {k: sp.Rational(v.numerator, v.denominator)
                   for k, v in subs.items()}
        cs = q.build_w2c(cls, sc)
        ok, bad = enc.verify_exact(cs, subs_sp)
        mut = dict(subs_sp)
        mut["rv2"] = mut["rv2"] + sp.Rational(1, 7)
        mok, _ = enc.verify_exact(cs, mut)
        status = ("VERIFIED" if ok and not mok else
                  "FAILED" if not ok else "MUTATION-NOT-REJECTED")
        print(f"{cid}: {status}"
              + (f" first_bad={bad[:2]}" if not ok else ""), flush=True)
        out[cid] = {"status": status, "sc": sc,
                    "subs": {k: str(v) for k, v in subs.items()}}
    with open(os.path.join(HERE, "resid_witnesses.json"), "w") as f:
        json.dump(out, f, indent=1)
    n_ok = sum(1 for v in out.values() if v["status"] == "VERIFIED")
    print(f"{n_ok}/{len(out)} residue classes VERIFIED")


if __name__ == "__main__":
    main()

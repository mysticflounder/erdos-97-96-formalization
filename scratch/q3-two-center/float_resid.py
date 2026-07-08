#!/usr/bin/env python3
"""Float feasibility probe for the 5 true-residue classes (STATE 7b).

Uses the OFFICIAL window encoding (q3lib.build_w2c — eqs/ge/gt including
cap signs and I-ORD convexity) lambdified to numpy, then SLSQP multistart:
minimize sum(eq_i^2) s.t. ge >= 0, gt >= MARGIN. A converged point with
objective ~ 0 is a float witness (HEURISTIC — rationalize + verify_exact
before any claim). Persistent failure across all subcases/starts is
evidence the class is killed at full-window granularity by ORDER.

Usage: float_resid.py [class ids]   (default: the 5 residue classes)
"""
import json
import os
import sys

import numpy as np
import sympy as sp
from scipy.optimize import minimize

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import q3lib as q                      # noqa: E402

RESIDUE = [
    "V0o2_WV0_o2i",
    "V0o2_WVo1_o2i_o1d",
    "VWU_Wso1_o1i",
    "VWo2_Wso1_o2d_o1i",
    "Vso2_Wso1_o2d_o1i_ssep",
]
MARGIN = 1e-6
STARTS = 120
rng = np.random.default_rng(20260707)

CAP_OF_PREFIX = {"p": 2, "wo1": 2, "q": 3, "vo2": 3,
                 "sv": 1, "sw": 1, "svw": 1}


def cap_of(name):
    for pre, cap in CAP_OF_PREFIX.items():
        if name.startswith(pre):
            return cap
    return None


def sA2(a, b, c):
    return (b[0]-a[0])*(c[1]-a[1]) - (c[0]-a[0])*(b[1]-a[1])


def sample_cap(cap, U, O, R):
    Vv, Wv = (0.0, 0.0), (1.0, 0.0)
    chords = {1: (Vv, Wv, U), 2: (Wv, U, Vv), 3: (U, Vv, Wv)}
    for _ in range(400):
        ang = rng.uniform(0, 2*np.pi)
        rad = R * np.sqrt(rng.uniform(0, 1)) * 0.97
        p = (O[0] + rad*np.cos(ang), O[1] + rad*np.sin(ang))
        ok = True
        for ci, (ca, cb, opp) in chords.items():
            prod = sA2(p, ca, cb) * sA2(opp, ca, cb)
            if (prod >= 0) if ci == cap else (prod <= 0):
                ok = False
                break
        if ok:
            return p
    return (O[0], O[1])


def init_vec(names):
    while True:
        ux = rng.uniform(0.05, 0.95)
        uy = rng.uniform(0.2, 1.5)
        if ux*ux - ux + uy*uy >= 1e-3:
            break
    oy = (ux*ux - ux + uy*uy) / (2*uy)
    R2 = 0.25 + oy*oy
    U, O, R = (ux, uy), (0.5, oy), np.sqrt(R2)
    coords = {}
    pts = {}
    for nm in names:
        if nm in ("v1x", "v1y", "oy", "R2", "rv2", "rw2"):
            continue
        base, axis = nm[:-1], nm[-1]
        if base not in pts:
            pts[base] = sample_cap(cap_of(base), U, O, R)
        coords[nm] = pts[base][0 if axis == "x" else 1]
    p1 = pts.get("p1", (1.0, 0.3))
    q1 = pts.get("q1", (0.2, 0.6))
    rv2 = p1[0]**2 + p1[1]**2
    rw2 = (q1[0]-1)**2 + q1[1]**2
    fixed = {"v1x": ux, "v1y": uy, "oy": oy, "R2": R2,
             "rv2": rv2, "rw2": rw2}
    return np.array([fixed.get(nm, coords.get(nm)) for nm in names])


def probe(cls, sc):
    cs = q.build_w2c(cls, sc)
    names = [str(v) for v in cs.vars]
    syms = cs.vars
    f_eqs = sp.lambdify(syms, cs.eqs, "numpy")
    f_ge = sp.lambdify(syms, cs.ge, "numpy")
    f_gt = sp.lambdify(syms, cs.gt, "numpy")

    def obj(x):
        e = np.asarray(f_eqs(*x), dtype=float)
        return float(e @ e)

    cons = [{"type": "ineq",
             "fun": lambda x: np.asarray(f_ge(*x), dtype=float)},
            {"type": "ineq",
             "fun": lambda x: np.asarray(f_gt(*x), dtype=float) - MARGIN}]
    best = None
    for _ in range(STARTS):
        x0 = init_vec(names)
        try:
            r = minimize(obj, x0, method="SLSQP", constraints=cons,
                         options={"maxiter": 300, "ftol": 1e-16})
        except Exception:
            continue
        if not np.all(np.isfinite(r.x)):
            continue
        o = obj(r.x)
        gmin = float(np.min(f_ge(*r.x))) if cs.ge else 0.0
        tmin = float(np.min(f_gt(*r.x))) if cs.gt else 1.0
        score = o + max(0.0, -gmin)**2 + max(0.0, MARGIN-tmin)**2
        if best is None or score < best[0]:
            best = (score, o, gmin, tmin, dict(zip(names, map(float, r.x))))
        if o < 1e-12 and gmin >= -1e-9 and tmin >= MARGIN/2:
            return {"feasible": True, "obj": o, "ge_min": gmin,
                    "gt_min": tmin, "x": best[4]}
    return {"feasible": False, "best_score": best[0] if best else None,
            "best_obj": best[1] if best else None,
            "best_ge_min": best[2] if best else None,
            "best_gt_min": best[3] if best else None,
            "x": best[4] if best else None}


def main():
    classes = {c["id"]: c for c in q.all_classes()}
    out = {}
    for cid in (sys.argv[1:] or RESIDUE):
        cls = classes[cid]
        out[cid] = {}
        for sc in q.subcases(cls):
            sid = q.subcase_id(cls, sc)
            r = probe(cls, sc)
            out[cid][sid] = r
            print(f"{cid} {sid}: "
                  f"{'FLOAT-FEASIBLE' if r['feasible'] else 'no float point'}"
                  f" (obj={r.get('obj', r.get('best_obj'))!r},"
                  f" gt_min={r.get('gt_min', r.get('best_gt_min'))!r})",
                  flush=True)
    with open(os.path.join(HERE, "float_resid.json"), "w") as f:
        json.dump(out, f, indent=1)


if __name__ == "__main__":
    main()

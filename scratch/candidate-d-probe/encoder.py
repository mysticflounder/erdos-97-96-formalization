#!/usr/bin/env python3
"""Candidate-D probe encoder: decorated per-type windows for the 19 primitive
N8 tuples (Q1), smoke gates G1/G2/G3, and the shared exact machinery.

Semantics grounded in formulation.md (read that first). Soundness contract:
every emitted constraint is IMPLIED by a real |A|>=12 DoubleApex leaf
configuration hosting a type-(m,s,l,r) packet, so UNSAT verdicts are
exclusion-sound. SAT verdicts are only reported with exact verification.

Exact layers: sympy Rational symbolic constraints (single source of truth),
msolve char-0 (variety emptiness; [-1] == C-empty), sympy Groebner (second
engine for kills), z3 QF_NRA (qfnra-nlsat) for the decorated system.
No floats anywhere in constraint construction.
"""
from __future__ import annotations

import argparse
import json
import os
import subprocess
import sys
import tempfile
import time
from fractions import Fraction
from itertools import combinations

import sympy as sp

HERE = os.path.dirname(os.path.abspath(__file__))
RUNS = os.path.join(HERE, "runs")

R0, R1 = sp.Integer(0), sp.Integer(1)
HALF = sp.Rational(1, 2)

# ---------------------------------------------------------------- geometry


def d2(p, q):
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def sA2(v, vj, vk):
    """signedArea2 per Foundation.lean:49."""
    return (vj[0] - v[0]) * (vk[1] - v[1]) - (vk[0] - v[0]) * (vj[1] - v[1])


def dot(u, v):
    return u[0] * v[0] + u[1] * v[1]


def sub(u, v):
    return (u[0] - v[0], u[1] - v[1])


# ---------------------------------------------------------------- system


class CS:
    """Polynomial constraint system: eqs == 0, ge >= 0, gt > 0."""

    def __init__(self, name):
        self.name = name
        self.vars = []
        self.eqs = []
        self.ge = []
        self.gt = []
        self.points = {}          # name -> (expr, expr)
        self.meta = {}

    def var(self, nm):
        s = sp.Symbol(nm, real=True)
        self.vars.append(s)
        return s

    def point(self, nm):
        p = (self.var(nm + "x"), self.var(nm + "y"))
        self.points[nm] = p
        return p

    def fixed(self, nm, p):
        self.points[nm] = p
        return p


# vertex-index helpers: caps per Cap/Structure.lean (C_i opposite v_i)
# chord of C1 = (v2,v3) opp v1; C2 = (v3,v1) opp v2; C3 = (v1,v2) opp v3.
def cap_chords(v1, v2, v3):
    return {1: (v2, v3, v1), 2: (v3, v1, v2), 3: (v1, v2, v3)}


def add_cap_signs(cs, p, own, v1, v2, v3):
    """Strict 3-chord signs for a non-Moser point (formulation 2.2)."""
    for ci, (ca, cb, opp) in cap_chords(v1, v2, v3).items():
        prod = sp.expand(sA2(p, ca, cb) * sA2(opp, ca, cb))
        cs.gt.append(-prod if ci == own else prod)


def add_convex_order(cs, seq):
    """All cyclic triples positive (formulation 2.3), seq listed CCW."""
    n = len(seq)
    for i, j, k in combinations(range(n), 3):
        cs.gt.append(sp.expand(sA2(seq[i], seq[j], seq[k])))


# ---------------------------------------------------------------- Q1 window

CLASSES = [
    (0, 0, 0, 4), (0, 0, 1, 3), (0, 0, 2, 2), (0, 1, 0, 3), (0, 1, 1, 2),
    (0, 2, 0, 2), (0, 2, 1, 1), (0, 3, 0, 1), (0, 4, 0, 0), (1, 0, 0, 3),
    (1, 0, 1, 2), (1, 1, 0, 2), (1, 1, 1, 1), (1, 2, 0, 1), (1, 3, 0, 0),
    (2, 0, 0, 2), (2, 0, 1, 1), (2, 1, 0, 1), (2, 2, 0, 0),
]


def vertex_choices(m, l, r):
    if m == 0:
        return [()]
    if m == 1:
        return [("v1",), ("v2",)] if l == r else [("v1",), ("v2",), ("v3",)]
    if m == 2:
        if l == r:
            return [("v1", "v2"), ("v2", "v3")]
        return [("v1", "v2"), ("v1", "v3"), ("v2", "v3")]
    raise ValueError(m)


def q1_cases():
    out = []
    for (m, s, l, r) in CLASSES:
        for vc in vertex_choices(m, l, r):
            for k in range(s + 1):
                cid = f"m{m}s{s}l{l}r{r}" + (
                    "_" + "".join(v.replace("v", "V") for v in vc) if vc else ""
                ) + f"_k{k}"
                out.append({"tuple": [m, s, l, r], "vc": list(vc), "k": k,
                            "id": cid})
    return out


def build_window(m, s, l, r, vc, k):
    """Decorated minimal window W(tau), formulation section 3."""
    cs = CS(f"m{m}s{s}l{l}r{r}_{''.join(vc)}_k{k}")
    v2 = cs.fixed("v2", (R0, R0))
    v3 = cs.fixed("v3", (R1, R0))
    v1 = cs.point("v1")
    x = cs.point("x")
    ys = [cs.point(f"y{i+1}") for i in range(s)]
    as_ = [cs.point(f"a{i+1}") for i in range(l)]
    bs = [cs.point(f"b{i+1}") for i in range(r)]
    oy = cs.var("oy")
    O = (HALF, oy)
    R2 = cs.var("R2")
    rho2 = cs.var("rho2")

    # E-MEC (O_x = 1/2 substituted; v3 equation then redundant)
    cs.eqs.append(sp.expand(d2(v1, O) - R2))
    cs.eqs.append(sp.expand(d2(v2, O) - R2))
    # E-PKT
    named = {"v1": v1, "v2": v2, "v3": v3}
    packet = [named[v] for v in vc] + ys + as_ + bs
    assert len(packet) == 4
    for t in packet:
        cs.eqs.append(sp.expand(d2(t, x) - rho2))
    # I-POS
    cs.gt += [R2, rho2]
    # I-DISK (non-vertex points)
    for p in [x] + ys + as_ + bs:
        cs.ge.append(sp.expand(R2 - d2(p, O)))
    # I-OBT
    cs.ge.append(sp.expand(dot(sub(v2, v1), sub(v3, v1))))
    cs.ge.append(sp.expand(dot(sub(v3, v2), sub(v1, v2))))
    cs.ge.append(sp.expand(dot(sub(v1, v3), sub(v2, v3))))
    # I-CAP
    for p in [x] + ys:
        add_cap_signs(cs, p, 1, v1, v2, v3)
    for p in as_:
        add_cap_signs(cs, p, 2, v1, v2, v3)
    for p in bs:
        add_cap_signs(cs, p, 3, v1, v2, v3)
    # I-ORD: sigma = (v2, own-block, v3, a's, v1, b's), x at slot k
    own = ys[:k] + [x] + ys[k:]
    seq = [v2] + own + [v3] + as_ + [v1] + bs
    add_convex_order(cs, seq)
    cs.meta = {"tuple": [m, s, l, r], "vc": list(vc), "k": k,
               "window_points": ["v2"] + [f"own{i}" for i in range(len(own))]
               + ["v3"] + [f"a{i+1}" for i in range(l)] + ["v1"]
               + [f"b{i+1}" for i in range(r)],
               "n_vars": len(cs.vars), "n_eqs": len(cs.eqs),
               "n_ge": len(cs.ge), "n_gt": len(cs.gt)}
    return cs


# ---------------------------------------------------------------- msolve


def msolve_check(cs, separators, timeout=60, tag=""):
    """Equality-ideal check with Rabinowitsch separators (exprs forced != 0).

    Returns dict with verdict in {C-EMPTY, POSDIM, ZERODIM, TIMEOUT, ERROR}.
    Parses the msolve tuple per (D-msolve): [-1] empty; [1,n,-1,[]] posdim;
    [0,...] zero-dim.
    """
    vs = [str(v) for v in cs.vars]
    polys = [str(sp.expand(e)) for e in cs.eqs]
    for i, sep in enumerate(separators):
        u = f"u{i}"
        vs.append(u)
        polys.append(str(sp.expand(sep * sp.Symbol(u) - 1)))
    polys = [p.replace("**", "^") for p in polys]
    base = os.path.join(RUNS, f"{cs.name}{tag}.msolve")
    with open(base + ".in", "w") as f:
        f.write(",".join(vs) + "\n0\n" + ",\n".join(polys) + "\n")
    out = base + ".out"
    t0 = time.time()
    try:
        subprocess.run(["msolve", "-f", base + ".in", "-o", out, "-t", "1"],
                       capture_output=True, text=True, timeout=timeout)
        raw = open(out).read().strip()
    except subprocess.TimeoutExpired:
        return {"verdict": "TIMEOUT", "secs": time.time() - t0}
    except Exception as e:  # noqa: BLE001
        return {"verdict": "ERROR", "err": str(e)}
    if raw.startswith("[-1]"):
        v = "C-EMPTY"
    elif raw.startswith("[1,"):
        v = "POSDIM"
    elif raw.startswith("[0,"):
        v = "ZERODIM"
    else:
        v = "UNPARSED"
    return {"verdict": v, "secs": round(time.time() - t0, 2),
            "raw_prefix": raw[:80], "in": base + ".in", "out": out}


def sympy_gb_one(cs, separators):
    """Second engine for kills: reduced Groebner == [1]?"""
    vs = list(cs.vars)
    polys = [sp.expand(e) for e in cs.eqs]
    for i, sep in enumerate(separators):
        u = sp.Symbol(f"u{i}", real=True)
        vs.append(u)
        polys.append(sp.expand(sep * u - 1))
    gb = sp.groebner(polys, *vs, order="grevlex")
    return list(gb.exprs) == [sp.Integer(1)]


# ---------------------------------------------------------------- z3


def to_z3(e, zv, z3):
    if e.is_Symbol:
        return zv[e.name]
    if e.is_Integer:
        return z3.RealVal(int(e))
    if e.is_Rational:
        return z3.RealVal(f"{int(e.p)}/{int(e.q)}")
    if e.is_Add:
        args = [to_z3(a, zv, z3) for a in e.args]
        s = args[0]
        for a in args[1:]:
            s = s + a
        return s
    if e.is_Mul:
        args = [to_z3(a, zv, z3) for a in e.args]
        s = args[0]
        for a in args[1:]:
            s = s * a
        return s
    if e.is_Pow:
        b, ex = e.args
        assert ex.is_Integer and int(ex) >= 1, e
        zb = to_z3(b, zv, z3)
        out = zb
        for _ in range(int(ex) - 1):
            out = out * zb
        return out
    raise ValueError(f"unsupported expr {e!r}")


def z3_check(cs, timeout_s=60, save_smt2=True):
    import z3
    zv = {str(v): z3.Real(str(v)) for v in cs.vars}
    sol = z3.Tactic("qfnra-nlsat").solver()
    sol.set("timeout", int(timeout_s * 1000))
    for e in cs.eqs:
        sol.add(to_z3(e, zv, z3) == 0)
    for e in cs.ge:
        sol.add(to_z3(e, zv, z3) >= 0)
    for e in cs.gt:
        sol.add(to_z3(e, zv, z3) > 0)
    if save_smt2:
        with open(os.path.join(RUNS, cs.name + ".smt2"), "w") as f:
            f.write("(set-logic QF_NRA)\n" + sol.to_smt2())
    t0 = time.time()
    res = sol.check()
    dt = round(time.time() - t0, 2)
    if res == z3.sat:
        mdl = sol.model()
        vals, all_rat = {}, True
        for v in cs.vars:
            d = mdl[zv[str(v)]]
            if d is None:
                vals[str(v)] = "0"
            elif z3.is_rational_value(d):
                vals[str(v)] = f"{d.numerator_as_long()}/{d.denominator_as_long()}"
            else:
                all_rat = False
                vals[str(v)] = f"ALG:{d.approx(30)}"
        return {"status": "sat", "secs": dt, "model": vals,
                "all_rational": all_rat}
    if res == z3.unsat:
        return {"status": "unsat", "secs": dt}
    return {"status": "unknown", "secs": dt,
            "reason": sol.reason_unknown()}


# ---------------------------------------------------------------- verify


def verify_exact(cs, subs_map):
    """Exact check of every constraint at exact values {varname: sympy expr}.

    Returns (ok, detail). Uses sympy exact arithmetic; every substituted
    expression must simplify to an exact number.
    """
    subs = {sp.Symbol(k, real=True): v for k, v in subs_map.items()}
    bad = []

    def sign_of(val):
        """Exact tri-state sign: 1/0/-1, or None if undecidable exactly."""
        v = sp.simplify(sp.expand(val))
        if v == 0:
            return 0
        if v.is_positive:
            return 1
        if v.is_negative:
            return -1
        v2 = sp.radsimp(sp.nsimplify(v))
        if v2 == 0 or sp.simplify(v2) == 0:
            return 0
        if v2.is_positive:
            return 1
        if v2.is_negative:
            return -1
        return None

    for e in cs.eqs:
        sg = sign_of(e.subs(subs))
        if sg != 0:
            bad.append(("eq", str(e), f"sign={sg}"))
    for e in cs.ge:
        sg = sign_of(e.subs(subs))
        if sg is None or sg < 0:
            bad.append(("ge", str(e), f"sign={sg}"))
    for e in cs.gt:
        sg = sign_of(e.subs(subs))
        if sg is None or sg <= 0:
            bad.append(("gt", str(e), f"sign={sg}"))
    return (len(bad) == 0, bad)


def parse_frac(s):
    if "/" in s:
        a, b = s.split("/")
        return sp.Rational(int(a), int(b))
    return sp.Integer(int(s))


# ---------------------------------------------------------------- gates


def gate_g1(args):
    """k=4 vesica collapse (report section 5.D(iv)) must be KILLED exact."""
    cs = CS("G1_vesica_k4")
    p0 = cs.fixed("p0", (R0, R0))
    p1 = cs.fixed("p1", (R1, R0))
    p2 = cs.point("p2")
    p3 = cs.point("p3")
    # classes 0:[1,2,3]; 1:[2,3]; 2:[0,1,3]  (equal squared dists per center)
    cs.eqs += [sp.expand(d2(p0, p1) - d2(p0, p2)),
               sp.expand(d2(p0, p1) - d2(p0, p3)),
               sp.expand(d2(p1, p2) - d2(p1, p3)),
               sp.expand(d2(p2, p0) - d2(p2, p1)),
               sp.expand(d2(p2, p0) - d2(p2, p3))]
    pts = {"p0": p0, "p1": p1, "p2": p2, "p3": p3}
    seps_all = [sp.expand(d2(pts[a], pts[b]))
                for a, b in combinations(sorted(pts), 2)]
    res_all = msolve_check(cs, seps_all, timeout=120, tag="_allpairs")
    sep_min = [sp.expand(d2(p1, p3))]
    res_min = msolve_check(cs, sep_min, timeout=120, tag="_minsep")
    gb_all = sympy_gb_one(cs, seps_all)
    gb_min = sympy_gb_one(cs, sep_min)
    ok = (res_all["verdict"] == "C-EMPTY" and gb_all
          and res_min["verdict"] == "C-EMPTY" and gb_min)
    out = {"gate": "G1", "pass": ok,
           "msolve_allpairs": res_all, "msolve_minsep_p1p3": res_min,
           "sympy_gb_one_allpairs": gb_all, "sympy_gb_one_minsep": gb_min}
    print(json.dumps(out, indent=1))
    return 0 if ok else 1


def gate_g2(args):
    """Center + 4 cocircular on a minor arc, 5 pts convex: NOT excluded."""
    cs = CS("G2_cocircular_minor_arc")
    x = cs.fixed("x", (R0, R0))
    t1 = cs.fixed("t1", (R1, R0))
    t2, t3, t4 = cs.point("t2"), cs.point("t3"), cs.point("t4")
    for t in (t2, t3, t4):
        cs.eqs.append(sp.expand(d2(t, x) - 1))
    add_convex_order(cs, [x, t1, t2, t3, t4])
    # (a) exact hand witness through the verifier: tan-half-angle points on
    # the unit circle, minor arc, listed so that (x,t1,t2,t3,t4) is CCW convex
    def circ(u):
        return ((1 - u**2) / (1 + u**2), 2 * u / (1 + u**2))
    w = {}
    for nm, u in (("t2", sp.Rational(1, 8)), ("t3", sp.Rational(1, 4)),
                  ("t4", sp.Rational(1, 2))):
        cx, cy = circ(u)
        w[nm + "x"], w[nm + "y"] = sp.nsimplify(cx), sp.nsimplify(cy)
    ok_w, bad = verify_exact(cs, w)
    # (b) pipeline: z3 must return sat (and if rational, verify)
    zres = z3_check(cs, timeout_s=60)
    z_ok = zres["status"] == "sat"
    z_verified = None
    if z_ok and zres.get("all_rational"):
        subs = {k: parse_frac(v) for k, v in zres["model"].items()}
        z_verified, _ = verify_exact(cs, subs)
    ok = ok_w and z_ok
    out = {"gate": "G2", "pass": ok, "hand_witness_exact": ok_w,
           "hand_witness_failures": bad, "z3": zres,
           "z3_model_exact_verified": z_verified}
    print(json.dumps(out, indent=1))
    return 0 if ok else 1


def w20_exact_points():
    """Regenerate W20 (t9_wit_m10_0.6180) exactly: outer unit 10-gon +
    inner 10-gon radius b = 1/phi twisted pi/10."""
    b = (sp.sqrt(5) - 1) / 2
    pts = {}
    for kk in range(10):
        th = 2 * sp.pi * kk / 10
        pts[f"O{kk}"] = (sp.cos(th), sp.sin(th))
        th2 = th + sp.pi / 10
        pts[f"I{kk}"] = (b * sp.cos(th2), b * sp.sin(th2))
    return pts


def gate_g3(args):
    """Ring-witness local structure, convexity/order dropped: the incidence
    part must NOT exclude it. Two checks: (a) exact evaluation of the
    incidence system at the witness coordinates; (b) msolve step-(i) on that
    system (with all-pair separators) is NOT C-EMPTY."""
    pts = w20_exact_points()
    # designated exhibit W20 sol#0 (candidateB report): center O0,
    # class K(O0) = {O2, O8, I2, I7}, r^2 = 4 sin^2(pi/5)
    center, members = "O0", ["O2", "O8", "I2", "I7"]
    cs = CS("G3_w20_incidence")
    xs = {}
    for nm in [center] + members:
        xs[nm] = cs.point(nm)
    for t in members:
        cs.eqs.append(sp.expand(d2(xs[t], xs[center]) - d2(xs[members[0]], xs[center])))
    subs = {}
    for nm in [center] + members:
        subs[nm + "x"] = pts[nm][0]
        subs[nm + "y"] = pts[nm][1]
    ok_eval, bad = verify_exact(cs, subs)
    # distinctness exact
    names = [center] + members
    dist_ok = all(sp.simplify(d2(pts[a], pts[b])) != 0
                  for a, b in combinations(names, 2))
    # msolve on incidence system + separators, gauged (else trivially posdim
    # by translation): fix center=(0,0), first member=(1,0)?? NO: gauge scale
    # changes nothing about emptiness; leave ungauged (posdim expected, and
    # posdim/zerodim both count as NOT excluded).
    seps = [sp.expand(d2(xs[a], xs[b])) for a, b in combinations(names, 2)]
    res = msolve_check(cs, seps, timeout=120, tag="")
    ok = ok_eval and dist_ok and res["verdict"] in ("POSDIM", "ZERODIM")
    out = {"gate": "G3", "pass": ok, "exact_eval": ok_eval,
           "eval_failures": bad[:3], "distinct": dist_ok, "msolve": res}
    print(json.dumps(out, indent=1))
    return 0 if ok else 1


# ------------------------------------------------------- sub-window kill


def build_sub2(side):
    """Sub-window: two own-cap packet members on ONE side of the center x
    in the own block, plus disk + equal-radius. Constraints are a SUBSET of
    every full case containing this pattern (s>=3 any k; s=2 with k in
    {0,s}), so UNSAT here kills all those cases. Order-only version is SAT
    (verified by hand exploration); the disk is load-bearing.

    Frame: v2=(0,0), v3=(1,0), O=(1/2,oy), R2=1/4+oy^2 (substituted),
    oy>=0 (non-obtuse at v1), own cap = below axis (v1 above by I-ORD in
    the full window)."""
    cs = CS(f"SUB2_{side}")
    v2 = cs.fixed("v2", (R0, R0))
    v3 = cs.fixed("v3", (R1, R0))
    x = cs.point("x")
    wa = cs.point("wa")
    wb = cs.point("wb")
    oy = cs.var("oy")
    rho2 = cs.var("rho2")
    O = (HALF, oy)
    R2e = sp.Rational(1, 4) + oy**2
    cs.eqs.append(sp.expand(d2(wa, x) - rho2))
    cs.eqs.append(sp.expand(d2(wb, x) - rho2))
    cs.gt.append(rho2)
    cs.ge.append(oy)
    for p in (x, wa, wb):
        cs.ge.append(sp.expand(R2e - d2(p, O)))
        cs.gt.append(-p[1])          # strictly below axis (own cap side)
    seq = [v2, wa, wb, x, v3] if side == "left" else [v2, x, wa, wb, v3]
    add_convex_order(cs, seq)
    return cs


def cmd_sub2(args):
    out = {}
    for side in ("left", "right"):
        cs = build_sub2(side)
        zr = z3_check(cs, timeout_s=args.tmo)
        out[side] = zr
        print(f"SUB2_{side}: {zr['status']} ({zr['secs']}s)", flush=True)
    with open(os.path.join(HERE, "sub2_results.json"), "w") as f:
        json.dump(out, f, indent=1)
    return 0


# ---------------------------------------------------------------- Q1 driver


def run_case(case, tmo_msolve=60, tmo_z3=60):
    m, s, l, r = case["tuple"]
    cs = build_window(m, s, l, r, case["vc"], case["k"])
    cs.name = case["id"]
    rec = {"id": case["id"], "tuple": case["tuple"], "vc": case["vc"],
           "k": case["k"], "meta": cs.meta}
    # ladder (i): equality ideal + all-pair separators
    pts = {nm: p for nm, p in cs.points.items()}
    seps = [sp.expand(d2(pts[a], pts[b]))
            for a, b in combinations(sorted(pts), 2)]
    ms = msolve_check(cs, seps, timeout=tmo_msolve)
    rec["msolve_eq"] = ms
    if ms["verdict"] == "C-EMPTY":
        gb = sympy_gb_one(cs, seps)
        rec["sympy_gb_one"] = gb
        rec["verdict"] = "KILLED" if gb else "KILLED-MSOLVE-ONLY(gb-disagree!)"
        return rec
    # ladder (ii): z3 QF_NRA full decorated system
    zr = z3_check(cs, timeout_s=tmo_z3)
    rec["z3"] = zr
    if zr["status"] == "unsat":
        rec["verdict"] = "KILLED-QFNRA"
    elif zr["status"] == "sat":
        if zr.get("all_rational"):
            subs = {k: parse_frac(v) for k, v in zr["model"].items()}
            ok, bad = verify_exact(cs, subs)
            rec["exact_verified"] = ok
            rec["verify_failures"] = bad[:5]
            rec["verdict"] = ("REALIZED-MINIMAL-WINDOW" if ok
                              else "SAT-UNVERIFIED")
        else:
            rec["verdict"] = "SAT-ALGEBRAIC-UNVERIFIED"
    else:
        rec["verdict"] = "NOT-KILLED-AT-SCALE(z3-" + zr["status"] + ")"
    return rec


def cmd_cases(args):
    cases = q1_cases()
    print(json.dumps(cases, indent=1))
    print(f"total cases: {len(cases)}", file=sys.stderr)
    return 0


def cmd_q1(args):
    os.makedirs(RUNS, exist_ok=True)
    cases = q1_cases()
    if args.case:
        cases = [c for c in cases if c["id"] == args.case]
    if args.limit:
        cases = cases[: args.limit]
    results = []
    outpath = os.path.join(HERE, args.out)
    done_ids = set()
    if os.path.exists(outpath) and not args.fresh:
        with open(outpath) as f:
            results = json.load(f)
        done_ids = {r["id"] for r in results}
    for c in cases:
        if c["id"] in done_ids and not args.rerun:
            continue
        t0 = time.time()
        rec = run_case(c, tmo_msolve=args.tmo_msolve, tmo_z3=args.tmo_z3)
        rec["wall"] = round(time.time() - t0, 2)
        results = [r for r in results if r["id"] != c["id"]] + [rec]
        with open(outpath, "w") as f:
            json.dump(results, f, indent=1)
        print(f"{c['id']}: {rec['verdict']} ({rec['wall']}s)", flush=True)
    return 0


def main():
    ap = argparse.ArgumentParser()
    sub = ap.add_subparsers(dest="cmd", required=True)
    sub.add_parser("cases")
    sub.add_parser("g1")
    sub.add_parser("g2")
    sub.add_parser("g3")
    q1 = sub.add_parser("q1")
    q1.add_argument("--case", default=None)
    q1.add_argument("--limit", type=int, default=0)
    q1.add_argument("--tmo-msolve", type=int, default=60)
    q1.add_argument("--tmo-z3", type=int, default=60)
    q1.add_argument("--out", default="q1_results.json")
    q1.add_argument("--fresh", action="store_true")
    q1.add_argument("--rerun", action="store_true")
    s2 = sub.add_parser("sub2")
    s2.add_argument("--tmo", type=int, default=300)
    args = ap.parse_args()
    os.makedirs(RUNS, exist_ok=True)
    return {"cases": cmd_cases, "g1": gate_g1, "g2": gate_g2, "g3": gate_g3,
            "q1": cmd_q1, "sub2": cmd_sub2}[args.cmd](args)


if __name__ == "__main__":
    sys.exit(main())

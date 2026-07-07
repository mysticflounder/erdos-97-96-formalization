#!/usr/bin/env python3
"""Witness search for the erased-pin row-truth probe.

Float maximin-margin hill climb over the construction parameters (equalities
exact by construction), then rationalization (limit_denominator ladder) and a
full exact-Fraction accept via rowlib.exact_check.  NO float ever appears in
an accepted witness: the stored witness is rebuilt from rational parameters
and every final check is exact.

Modes:
  --gates    G1 positive controls + G2 negative controls (G0 parity is run by
             verify_rows.py --parity separately).
  --sweep    all right-side non-terminal rows, then exact mirrors for left.
  --surplus  the two direct surplus-side ErasedPinTriple probes.
"""
from __future__ import annotations

import argparse
import json
import math
import random
import sys
import time
from fractions import Fraction
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
import rowlib as RL

F = Fraction
HERE = Path(__file__).parent
RESULTS = HERE / "results"
RESULTS.mkdir(exist_ok=True)

# ---------- templates --------------------------------------------------------

TEMPLATE10 = {
    "k": 0.28, "t_u": 1.7,
    "Q1": (0.30, 0.72), "Q2": (0.15, 0.52),
    "s1": (0.20, -0.07), "s2": (0.45, -0.09), "s3": (0.72, -0.07),
    "Pw": (1.03, 0.16), "Pu": (0.97, 0.34),
}
TEMPLATE11 = {
    "k": 0.28, "t_u": 1.7,
    "Q1": (0.30, 0.72), "Q2": (0.15, 0.52),
    "s1": (0.16, -0.05), "s2": (0.36, -0.085), "s3": (0.58, -0.09),
    "s4": (0.80, -0.055),
    "Pw": (1.03, 0.16), "Pu": (0.97, 0.34),
}

SCALES = {"disk": 0.05, "acute": 0.2, "capIn": 0.005, "capOut": 0.005,
          "cvx": 0.02, "dist": 0.01, "off": 0.01, "rho": 0.05}


def fam(cid):
    return cid.split("[")[0]


def norm_score(pts, k, spec):
    vals = RL.margins(pts, k, spec)
    best = None
    for cid, v in vals:
        s = v / SCALES.get(fam(cid), 0.02)
        if best is None or s < best[0]:
            best = (s, cid)
    return best  # (normalized min margin, worst check id)


# ---------- parameter init ---------------------------------------------------

def template_for(model):
    return TEMPLATE10 if model.n == 10 else TEMPLATE11


def chord_point_f(k, t):
    x = (1 + 2 * k * t) / (1 + t * t)
    return (x, t * x)


def init_params(spec, rng, jitter=1.0):
    tpl = template_for(spec.model)
    prm = {}
    k = tpl["k"] + rng.gauss(0, 0.02 * jitter)
    t_u = tpl["t_u"] + rng.gauss(0, 0.12 * jitter)
    prm["k"], prm["t_u"] = k, t_u
    upos = chord_point_f(k, t_u)
    posf = dict(tpl)
    posf["u"], posf["v"], posf["w"] = upos, (0.0, 0.0), (1.0, 0.0)

    def tpos(lab, sig=0.04):
        x, y = posf[lab]
        return (x + rng.gauss(0, sig * jitter), y + rng.gauss(0, sig * jitter))

    # center
    if spec.center_kind == "free":
        cx, cy = tpos(spec.center)
        prm["p_x"], prm["p_y"] = cx, cy
        p0 = (cx, cy)
    elif spec.center_kind == "circumcenter":
        p0 = (0.5, k)
    elif spec.center_kind == "bisector":
        m1, m2 = spec.moser_hits
        a, b = posf[m1], posf[m2]
        midx, midy = (a[0] + b[0]) / 2, (a[1] + b[1]) / 2
        perp = (-(b[1] - a[1]), b[0] - a[0])
        tgt = tpos(spec.center)
        den = perp[0] ** 2 + perp[1] ** 2
        s0 = ((tgt[0] - midx) * perp[0] + (tgt[1] - midy) * perp[1]) / den
        prm["p_s"] = s0
        p0 = (midx + s0 * perp[0], midy + s0 * perp[1])
    else:  # moser_u
        p0 = upos
    # anchor
    if spec.anchor in spec.model.moser:
        a0 = posf[spec.anchor]
    else:
        a0 = tpos(spec.anchor)
        prm["anchor_x"], prm["anchor_y"] = a0
    # rotations: aim each rotated member at its template spot
    ang_a = math.atan2(a0[1] - p0[1], a0[0] - p0[0])
    for z in spec.rotated:
        zt = tpos(z)
        ang_z = math.atan2(zt[1] - p0[1], zt[0] - p0[0])
        th = ang_z - ang_a
        while th > math.pi:
            th -= 2 * math.pi
        while th < -math.pi:
            th += 2 * math.pi
        th = max(-2.9, min(2.9, th))
        prm[f"t_{z}"] = math.tan(th / 2)
    for z in spec.free:
        prm[f"{z}_x"], prm[f"{z}_y"] = tpos(z)
    return prm


SIGMA = {"k": 0.015, "t_u": 0.08, "p_x": 0.03, "p_y": 0.03, "p_s": 0.03,
         "anchor_x": 0.03, "anchor_y": 0.03}


def sigma_of(name):
    if name in SIGMA:
        return SIGMA[name]
    if name.startswith("t_"):
        return 0.06
    return 0.03


# ---------- hill climb -------------------------------------------------------

def climb(spec, rng, steps=3500, jitter=1.0):
    prm = init_params(spec, rng, jitter)
    names = list(prm.keys())
    try:
        pts, k, _ = spec.build(prm)
        cur, worst = norm_score(pts, k, spec)
    except ZeroDivisionError:
        return None, -1e9, "init-div0"
    temp = 1.0
    for step in range(steps):
        nb = dict(prm)
        for _ in range(rng.randint(1, 3)):
            nm = rng.choice(names)
            nb[nm] += rng.gauss(0, sigma_of(nm) * temp)
        try:
            pts, k, _ = spec.build(nb)
            sc, wid = norm_score(pts, k, spec)
        except ZeroDivisionError:
            continue
        if sc > cur:
            prm, cur, worst = nb, sc, wid
        if step % 250 == 249:
            temp = max(0.05, temp * 0.90)
        if cur > 1.0:
            break
    return prm, cur, worst


def rationalize(prm, denom):
    return {k: F(v).limit_denominator(denom) for k, v in prm.items()}


def try_exact(spec, prm):
    for denom in (400, 3000, 30000, 300000, 3000000):
        qprm = rationalize(prm, denom)
        pts, k, _p = spec.build(qprm)
        ok, checks = RL.exact_check(pts, k, spec)
        if ok:
            return qprm, pts, k, checks
    return None


def search_assignment(spec, seed, restarts, steps, log):
    best_overall = (-1e9, None, None)
    for rst in range(restarts):
        rng = random.Random(f"{seed}|{rst}")
        jitter = 0.6 if rst < 2 else (1.0 if rst < restarts * 2 // 3 else 1.8)
        prm, sc, worst = climb(spec, rng, steps=steps, jitter=jitter)
        if sc > best_overall[0]:
            best_overall = (sc, worst, prm)
        if prm is not None and sc > 0.02:
            got = try_exact(spec, prm)
            if got:
                qprm, pts, k, checks = got
                log(f"    [{spec.tag}] restart {rst}: float score {sc:.4f} "
                    f"-> EXACT WITNESS ({sum(c.ok for c in checks)}/"
                    f"{len(checks)} checks)")
                return ("witness", qprm, pts, k, checks, rst)
            log(f"    [{spec.tag}] restart {rst}: float ok ({sc:.4f}) but "
                f"rationalization failed; continuing")
    sc, worst, _ = best_overall
    return ("none", sc, worst, None, None, None)


# ---------- witness serialization -------------------------------------------

def dump_witness(path, spec, qprm, pts, k, checks, extra=None):
    model = spec.model
    payload = {
        "schema": "erased_pin_row_truth_witness.v1",
        "tag": spec.tag,
        "side": spec.side,
        "row_mslr": list(spec.row) if spec.row else None,
        "model_n": model.n,
        "k": str(F(k)),
        "mec_center": [str(F(1, 2)), str(F(k))],
        "mec_radius2": str(F(1, 4) + F(k) ** 2),
        "hull_order": list(model.hull),
        "center": spec.center,
        "class": list(spec.cls),
        "erased_x": spec.x,
        "radius2": str(RL.d2(pts[spec.center], pts[spec.x])),
        "points": {lab: [str(pts[lab][0]), str(pts[lab][1])]
                   for lab in model.labels},
        "params": {k2: str(v) for k2, v in qprm.items()} if qprm else None,
        "n_checks": len(checks),
        "all_pass": all(c.ok for c in checks),
    }
    if extra:
        payload.update(extra)
    Path(path).write_text(json.dumps(payload, indent=2) + "\n")


def dump_mirror_witness(path, right_spec, pts, k, tag, row_left):
    """Mirror a right witness to the left side, exact, re-check, dump."""
    model = right_spec.model
    mpts, relabel = RL.mirror_witness(pts, model)
    mspec = RL.Spec(model, relabel[right_spec.center],
                    tuple(relabel[z] for z in right_spec.cls),
                    relabel[right_spec.x], side="left", row=row_left, tag=tag)
    ok, checks = RL.exact_check(mpts, k, mspec)
    if not ok:
        for c in checks:
            if not c.ok:
                print("MIRROR FAIL:", c.row())
        return None
    payload = {
        "schema": "erased_pin_row_truth_witness.v1",
        "tag": tag,
        "side": "left",
        "row_mslr": list(row_left),
        "model_n": model.n,
        "k": str(F(k)),
        "mec_center": [str(F(1, 2)), str(F(k))],
        "mec_radius2": str(F(1, 4) + F(k) ** 2),
        "hull_order": list(model.hull),
        "center": mspec.center,
        "class": list(mspec.cls),
        "erased_x": mspec.x,
        "radius2": str(RL.d2(mpts[mspec.center], mpts[mspec.x])),
        "points": {lab: [str(mpts[lab][0]), str(mpts[lab][1])]
                   for lab in model.labels},
        "params": None,
        "mirror_of": right_spec.tag,
        "n_checks": len(checks),
        "all_pass": True,
    }
    Path(path).write_text(json.dumps(payload, indent=2) + "\n")
    return mspec, mpts, checks


# ---------- assignment enumeration ------------------------------------------

def right_row_assignments(m, s, l, r):
    """Yield Spec-argument tuples (model, center, class, x, tag) for a right
    row.  Structural impossibilities (l>2) yield nothing."""
    if l > 2:
        return
    model = RL.MODEL11 if r >= 4 else RL.MODEL10
    sints = model.surplus_ints
    if r > len(sints):
        return
    moser_opts = {0: [()], 1: [("u",), ("w",), ("v",)],
                  2: [("u", "w"), ("v", "w"), ("u", "v")]}[m]
    l_opts = {0: [()], 1: [("Q1",), ("Q2",)], 2: [("Q1", "Q2")]}[l]
    if r == 1:
        r_opts = [("s2",), ("s3",), ("s1",)]
    elif r == 2:
        r_opts = [("s2", "s3"), ("s1", "s2"), ("s1", "s3")]
    elif r == 3:
        r_opts = [tuple(sints)] if len(sints) == 3 else \
            [("s1", "s2", "s3"), ("s2", "s3", "s4")]
    else:
        r_opts = [tuple(sints)]
    for center in ("Pu", "Pw"):
        s_hit = ("Pw",) if center == "Pu" else ("Pu",)
        s_opts = [()] if s == 0 else [s_hit]
        for mo in moser_opts:
            for so in s_opts:
                for lo in l_opts:
                    for ro in r_opts:
                        cls = tuple(mo) + tuple(so) + tuple(lo) + tuple(ro)
                        if len(cls) != 4:
                            continue
                        x = ro[0]
                        tag = (f"r{m}{s}{l}{r}_{center}_" +
                               "".join(mo) + "".join(so) + "".join(lo) +
                               "".join(ro))
                        yield (model, center, cls, x, tag)


# ---------- results file -----------------------------------------------------

def load_results():
    f = RESULTS / "row_truth_results.json"
    if f.exists():
        return json.loads(f.read_text())
    return {"schema": "erased_pin_row_truth_results.v1", "rows": {},
            "gates": {}, "surplus": {}}


def save_results(res):
    (RESULTS / "row_truth_results.json").write_text(
        json.dumps(res, indent=2, sort_keys=True) + "\n")


# ---------- row driver -------------------------------------------------------

RIGHT_ROWS = [
    # (m,s,l,r, route)
    (0, 0, 2, 2, "LRS"), (0, 0, 1, 3, "LRS"), (0, 1, 2, 1, "LRS"),
    (0, 1, 1, 2, "LRS"), (1, 0, 2, 1, "LRS"), (1, 0, 1, 2, "LRS"),
    (1, 1, 1, 1, "LRS"), (2, 0, 1, 1, "LRS"),
    (0, 0, 0, 4, "SSH"), (0, 1, 0, 3, "SSH"), (1, 0, 0, 3, "SSH"),
    (1, 1, 0, 2, "SSH"), (2, 0, 0, 2, "SSH"),
]


def run_row(m, s, l, r, res, log, restarts=10, steps=3500,
            deep_restarts=40, deep_steps=7000):
    rid = f"ep_right_m{m}_s{s}_l{l}_r{r}"
    rid_left = f"ep_left_m{m}_s{s}_l{r}_r{l}"
    if rid in res["rows"] and res["rows"][rid].get("verdict", "").startswith(
            "WITNESS"):
        log(f"  {rid}: already done")
        return
    log(f"== row {rid} (and mirror {rid_left}) ==")
    t0 = time.time()
    assignments = list(right_row_assignments(m, s, l, r))
    log(f"  {len(assignments)} label assignments")
    tried = []
    found = None
    for ai, (model, center, cls, x, tag) in enumerate(assignments):
        spec = RL.Spec(model, center, cls, x, side="right", row=(m, s, l, r),
                       tag=tag)
        out = search_assignment(spec, seed=(rid, tag), restarts=restarts,
                                steps=steps, log=log)
        if out[0] == "witness":
            found = (spec, out)
            break
        tried.append((tag, out[1], out[2]))
        log(f"    [{tag}] no witness at quick budget "
            f"(best {out[1]:.4f} worst {out[2]})")
    if not found:
        # deep pass on the 3 best-scoring assignments
        tried.sort(key=lambda z: -z[1])
        for tag, _, _ in tried[:3]:
            for (model, center, cls, x, tag2) in assignments:
                if tag2 != tag:
                    continue
                spec = RL.Spec(model, center, cls, x, side="right",
                               row=(m, s, l, r), tag=tag + "_deep")
                out = search_assignment(spec, seed=(rid, tag, "deep"),
                                        restarts=deep_restarts,
                                        steps=deep_steps, log=log)
                if out[0] == "witness":
                    found = (spec, out)
                    break
            if found:
                break
    dt = time.time() - t0
    if found:
        spec, (_, qprm, pts, k, checks, rst) = found
        wf = RESULTS / f"witness_{rid}.json"
        dump_witness(wf, spec, qprm, pts, k, checks)
        res["rows"][rid] = {
            "verdict": "WITNESS-FOUND", "witness_file": wf.name,
            "assignment": spec.tag, "restart": rst, "model_n": spec.model.n,
            "checks": f"{sum(c.ok for c in checks)}/{len(checks)}",
            "seconds": round(dt, 1),
        }
        # mirror to left
        mtag = f"mirror_{rid_left}"
        mrow = (m, s, r, l)
        got = dump_mirror_witness(RESULTS / f"witness_{rid_left}.json", spec,
                                  pts, k, mtag, mrow)
        if got:
            _, _, mchecks = got
            res["rows"][rid_left] = {
                "verdict": "WITNESS-FOUND",
                "witness_file": f"witness_{rid_left}.json",
                "mirror_of": rid,
                "checks": f"{sum(c.ok for c in mchecks)}/{len(mchecks)}",
            }
        else:
            res["rows"][rid_left] = {"verdict": "MIRROR-FAILED (investigate)"}
        log(f"  {rid}: WITNESS-FOUND ({spec.tag}) in {dt:.0f}s; mirror "
            f"{res['rows'][rid_left]['verdict']}")
    else:
        n_r = restarts * len(assignments) + deep_restarts * min(3, len(tried))
        res["rows"][rid] = {
            "verdict": "NO-WITNESS-AT-BUDGET",
            "budget": {"assignments": len(assignments),
                       "quick_restarts": restarts, "quick_steps": steps,
                       "deep_restarts": deep_restarts,
                       "deep_steps": deep_steps, "total_restarts": n_r},
            "best_scores": [(t, round(sc, 4), w) for t, sc, w in tried[:6]],
            "seconds": round(dt, 1),
        }
        res["rows"][rid_left] = {
            "verdict": "NO-WITNESS-AT-BUDGET",
            "mirror_of": rid,
            "note": "mirror-equivalent to right row (exact reflection)",
        }
        log(f"  {rid}: NO-WITNESS-AT-BUDGET after {dt:.0f}s")
    save_results(res)


# ---------- gates -------------------------------------------------------------

def run_gates(res, log):
    log("== G1 positive control: (1,0,2,1) right ==")
    run_row(1, 0, 2, 1, res, log)
    v = res["rows"].get("ep_right_m1_s0_l2_r1", {}).get("verdict")
    vl = res["rows"].get("ep_left_m1_s0_l1_r2", {}).get("verdict")
    res["gates"]["G1_right_1021"] = v
    res["gates"]["G1_left_1012_mirror"] = vl
    g1 = v == "WITNESS-FOUND" and vl == "WITNESS-FOUND"
    log(f"G1: {'PASS' if g1 else 'FAIL'} (right {v}, left-mirror {vl})")

    log("== G2-N1 negative control: moser=3 class {u,v,w,s2} at Pu ==")
    spec = RL.Spec(RL.MODEL10, "Pu", ("u", "v", "w", "s2"), "s2",
                   side=None, row=None, tag="G2N1_m3")
    # NOTE m=3 puts u,v,w on the class circle: center must be the circumcenter
    out = search_assignment(spec, seed=("G2N1",), restarts=60, steps=4000,
                            log=log)
    res["gates"]["G2_N1_moser3"] = (
        "NO-WITNESS (expected; PROVEN impossible)" if out[0] == "none"
        else "!!! WITNESS FOUND - ENCODING BUG")
    log(f"G2-N1: {'PASS' if out[0] == 'none' else 'FAIL'} "
        f"(best {out[1]:.4f} worst {out[2]})")

    log("== G2-N2 negative control: center u, class {Pw,Pu,s2,s3} ==")
    spec = RL.Spec(RL.MODEL10, "u", ("Pw", "Pu", "s2", "s3"), "s2",
                   side=None, row=None, tag="G2N2_endpoint2hit")
    out = search_assignment(spec, seed=("G2N2",), restarts=60, steps=4000,
                            log=log)
    res["gates"]["G2_N2_endpoint_two_hit"] = (
        "NO-WITNESS (expected; PROVEN impossible)" if out[0] == "none"
        else "!!! WITNESS FOUND - ENCODING BUG")
    log(f"G2-N2: {'PASS' if out[0] == 'none' else 'FAIL'} "
        f"(best {out[1]:.4f} worst {out[2]})")

    log("== G2-N3: s=2 and l=3 (right) have no label assignment ==")
    n_s2 = 0  # s=2 not constructible: home ints minus center is 1 label
    n_l3 = len(list(right_row_assignments(0, 0, 3, 1)))
    ok = (n_s2 == 0 and n_l3 == 0)
    res["gates"]["G2_N3_cardinality_vacuous"] = (
        f"PASS (s2 assignments={n_s2}, l3 assignments={n_l3})" if ok
        else "FAIL")
    log(f"G2-N3: {'PASS' if ok else 'FAIL'}")
    save_results(res)


# ---------- surplus-side probes ----------------------------------------------

def run_surplus(res, log):
    # SO: center u (surplus-opposite Moser vertex), ErasedPinTriple at u.
    # Compositions respect the PROVEN endpoint one-hit bounds:
    # |class ∩ {w,Pw,Pu}| <= 1 and |class ∩ {v,Q1,Q2}| <= 1.
    log("== surplus-opposite probe: center u ==")
    so_comps = [
        ("SO_t2_PuQ1", ("s2", "s3", "Pu", "Q1"), "s2", RL.MODEL10),
        ("SO_t2_PwQ2", ("s1", "s2", "Pw", "Q2"), "s1", RL.MODEL10),
        ("SO_t3_Q1", ("s1", "s2", "s3", "Q1"), "s2", RL.MODEL10),
        ("SO_t3_Pw", ("s1", "s2", "s3", "Pw"), "s2", RL.MODEL10),
        ("SO_t4", ("s1", "s2", "s3", "s4"), "s2", RL.MODEL11),
        ("SO_t2_vPw", ("s2", "s3", "v", "Pw"), "s2", RL.MODEL10),
        ("SO_t2_wQ1", ("s1", "s2", "w", "Q1"), "s2", RL.MODEL10),
    ]
    found_any = []
    for tag, cls, x, model in so_comps:
        if "surplus_opposite" in res["surplus"] and res["surplus"][
                "surplus_opposite"].get("verdict") == "WITNESS-FOUND":
            break
        spec = RL.Spec(model, "u", cls, x, side=None, row=None, tag=tag)
        out = search_assignment(spec, seed=(tag,), restarts=12, steps=4000,
                                log=log)
        if out[0] == "witness":
            _, qprm, pts, k, checks, rst = out
            wf = RESULTS / f"witness_surplus_opposite_{tag}.json"
            dump_witness(wf, spec, qprm, pts, k, checks,
                         extra={"probe": "surplus_opposite_erasedPinTriple"})
            res["surplus"]["surplus_opposite"] = {
                "verdict": "WITNESS-FOUND", "witness_file": wf.name,
                "composition": tag,
                "checks": f"{sum(c.ok for c in checks)}/{len(checks)}"}
            found_any.append(tag)
            save_results(res)
            break
        log(f"    [{tag}] no witness (best {out[1]:.4f} worst {out[2]})")
    if "surplus_opposite" not in res["surplus"]:
        res["surplus"]["surplus_opposite"] = {
            "verdict": "NO-WITNESS-AT-BUDGET",
            "compositions_tried": [t for t, _, _, _ in so_comps]}

    # SI: center a surplus interior, ErasedPinTriple at it.
    log("== surplus-interior probe: center in surplus ints ==")
    si_comps = [
        ("SI_c-s3_uQ1Pw", "s3", ("s2", "u", "Q1", "Pw"), "s2", RL.MODEL10),
        ("SI_c-s3_s1Q1u", "s3", ("s2", "s1", "Q1", "u"), "s2", RL.MODEL10),
        ("SI_c-s1_Q2vPu", "s1", ("s2", "Q2", "v", "Pu"), "s2", RL.MODEL10),
        ("SI_c-s3_vwQ1", "s3", ("s2", "v", "w", "Q1"), "s2", RL.MODEL10),
        ("SI_c-s2_s1s3u", "s2", ("s1", "s3", "u", "Q1"), "s1", RL.MODEL10),
    ]
    for tag, center, cls, x, model in si_comps:
        if "surplus_interior" in res["surplus"] and res["surplus"][
                "surplus_interior"].get("verdict") == "WITNESS-FOUND":
            break
        spec = RL.Spec(model, center, cls, x, side=None, row=None, tag=tag)
        out = search_assignment(spec, seed=(tag,), restarts=12, steps=4000,
                                log=log)
        if out[0] == "witness":
            _, qprm, pts, k, checks, rst = out
            wf = RESULTS / f"witness_surplus_interior_{tag}.json"
            dump_witness(wf, spec, qprm, pts, k, checks,
                         extra={"probe": "surplus_interior_erasedPinTriple"})
            res["surplus"]["surplus_interior"] = {
                "verdict": "WITNESS-FOUND", "witness_file": wf.name,
                "composition": tag,
                "checks": f"{sum(c.ok for c in checks)}/{len(checks)}"}
            save_results(res)
            break
        log(f"    [{tag}] no witness (best {out[1]:.4f} worst {out[2]})")
    if "surplus_interior" not in res["surplus"]:
        res["surplus"]["surplus_interior"] = {
            "verdict": "NO-WITNESS-AT-BUDGET",
            "compositions_tried": [t for t, _, _, _, _ in si_comps]}
    save_results(res)


# ---------- main --------------------------------------------------------------

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--gates", action="store_true")
    ap.add_argument("--sweep", action="store_true")
    ap.add_argument("--surplus", action="store_true")
    ap.add_argument("--rows", type=str, default="",
                    help="comma list like 0022,1102 to restrict sweep")
    args = ap.parse_args()

    (HERE / "logs").mkdir(exist_ok=True)
    logf = open(HERE / "logs" / f"run_{int(time.time())}.log", "a")

    def log(msg):
        print(msg, flush=True)
        logf.write(msg + "\n")
        logf.flush()

    res = load_results()
    if args.gates:
        run_gates(res, log)
    if args.sweep:
        want = set(args.rows.split(",")) if args.rows else None
        for (m, s, l, r, route) in RIGHT_ROWS:
            key = f"{m}{s}{l}{r}"
            if want and key not in want:
                continue
            run_row(m, s, l, r, res, log)
    if args.surplus:
        run_surplus(res, log)
    log("DONE")


if __name__ == "__main__":
    main()

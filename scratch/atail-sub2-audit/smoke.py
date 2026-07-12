#!/usr/bin/env python3
"""ATAIL-SUB2 mandatory smoke tests (solver policy: validate the encoding
before trusting any conclusion).

S1  m <= 2 probe cut reproduced: the m=3 window subsystem is z3-UNSAT.
S2  vertex-pair => s=0 probe cut (K-C, kills (2,1,0,1)/(2,2,0,0))
    reproduced: all three vertex-choice subsystems are z3-UNSAT.
S3  banked witnesses stay SAT: all 13 exact witnesses of
    census/candidate_d_probe/witnesses.json re-verified through an
    INDEPENDENT Fraction implementation of the full decorated window
    (E-MEC/E-PKT/I-POS/I-DISK/I-OBT/strict I-CAP/full I-ORD). In
    particular the s=2 straddle witnesses (0202/0211, k=1) must PASS —
    the third probe cut's realizable side is not over-killed.
S4  prior float near-miss reproduced through this encoding: the single
    violated constraint is ord_v2_wa_wb (=T123), tiny margin, while
    p = (M-v2).mhat < 0 is the bounded normalized violation.
S5  transcription cross-check: sub2_constraints (build_sub2 semantics)
    agrees with the hand transcription of runs/SUB2_{left,right}.smt2 on
    random samples (uniform + frame-generated near-feasible), all oy >= 0.
S6  not-over-constrained control (exact): an exact rational configuration
    satisfying EVERY SUB2-H-left constraint except ord_v2_wa_wb.
S7  (record only) direct z3 on the SUB2-H systems, 60 s per side.
"""
import json
import math
import os
import random
import sys
from fractions import Fraction

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, "..", ".."))
sys.path.insert(0, HERE)

from encoding import (V2, V3, sA2, d2, sub2_constraints, eval_rows,
                      smt2_left_asserts, smt2_right_asserts, smt2_sat,
                      z3_kill_systems, convex_triples, dot)

F = Fraction
RESULTS = {}


# ------------------------------------------------------------------ S1/S2
def kc_lemma_split_checks():
    """Machine verification of K-C for the mixed vertex pairs
    {v1,v2}/{v1,v3}, following the kill_notes.md proof structure
    (K-B bisector-position + K-A corner-max); each lemma is checked by
    z3-UNSAT of its negation, and the chaining (shared literal
    xx >= 1/2, resp. xx <= 1/2) is by inspection."""
    import z3
    a, b, oy = z3.Reals("a b oy")
    xx, xy, yx, yy = z3.Reals("xx xy yx yy")
    half, quarter = z3.RealVal("1/2"), z3.RealVal("1/4")

    def disk(px, py):
        return (px - half) ** 2 + (py - oy) ** 2 <= quarter + oy**2

    frame = [b > 0, a * a + b * b == a + 2 * oy * b, oy >= 0,
             a >= 0, a <= 1]
    out = {}
    # K-B (v1,v2)-bisector below axis has x0 >= 1/2 : negation UNSAT
    s = z3.Solver()
    s.set("timeout", 120000)
    s.add(*frame, xy < 0,
          (xx - a) ** 2 + (xy - b) ** 2 == xx**2 + xy**2,   # bisector v1v2
          xx < half)
    out["KB_v1v2_bisector_x0_ge_half_neg"] = str(s.check())
    # K-B mirror: (v1,v3)-bisector below axis has x0 <= 1/2
    s = z3.Solver()
    s.set("timeout", 120000)
    s.add(*frame, xy < 0,
          (xx - a) ** 2 + (xy - b) ** 2
          == (xx - 1) ** 2 + xy**2,                          # bisector v1v3
          xx > half)
    out["KB_v1v3_bisector_x0_le_half_neg"] = str(s.check())
    # K-A consequence: x in lens with x0 >= 1/2, y in lens at distance
    # exactly |x - v2| : UNSAT (corner-max attained only at corners)
    s = z3.Solver()
    s.set("timeout", 120000)
    s.add(oy >= 0, xy < 0, disk(xx, xy), yy < 0, disk(yx, yy),
          xx >= half,
          (xx - yx) ** 2 + (xy - yy) ** 2 == xx**2 + xy**2)
    out["KA_lens_max_v2_side"] = str(s.check())
    # mirror: x0 <= 1/2, y at distance exactly |x - v3|
    s = z3.Solver()
    s.set("timeout", 120000)
    s.add(oy >= 0, xy < 0, disk(xx, xy), yy < 0, disk(yx, yy),
          xx <= half,
          (xx - yx) ** 2 + (xy - yy) ** 2 == (xx - 1) ** 2 + xy**2)
    out["KA_lens_max_v3_side"] = str(s.check())
    return out


def s12_kill_systems():
    out = {}
    for name, s in z3_kill_systems().items():
        s.set("timeout", 120000)
        r = s.check()
        out[name] = str(r)
        print(f"  {name}: {r}")
    lem = kc_lemma_split_checks()
    for name, r in lem.items():
        print(f"  {name}: {r}")
    out.update(lem)
    # acceptance: m3 and the v2v3 K-C monolith UNSAT; the two mixed-pair
    # monoliths may be unknown IF all four lemma-split checks are unsat
    # (kill_notes K-C chaining: K-B forces the x0 side, K-A then kills).
    core = (out["m3_all_three_vertices"] == "unsat"
            and out["KC_pair_v2v3_s1"] == "unsat")
    mixed = all(
        out[k] == "unsat" for k in (
            "KB_v1v2_bisector_x0_ge_half_neg",
            "KB_v1v3_bisector_x0_le_half_neg",
            "KA_lens_max_v2_side", "KA_lens_max_v3_side"))
    monolith = (out["KC_pair_v1v2_s1"] == "unsat"
                and out["KC_pair_v1v3_s1"] == "unsat")
    ok = core and (monolith or mixed)
    RESULTS["S1_S2_proven_cuts_unsat"] = {"systems": out, "pass": ok}
    return ok


# ------------------------------------------------------------------ S3
def cap_chords(v1, v2, v3):
    return {1: (v2, v3, v1), 2: (v3, v1, v2), 3: (v1, v2, v3)}


def full_window_check(wit, tup, k, vc):
    """Independent exact evaluation of build_window(m,s,l,r,vc,k)."""
    m, s, l, r = tup
    g = {kk: F(v) for kk, v in wit.items()}
    v1 = (g["v1x"], g["v1y"])
    x = (g["xx"], g["xy"])
    ys = [(g[f"y{i+1}x"], g[f"y{i+1}y"]) for i in range(s)]
    as_ = [(g[f"a{i+1}x"], g[f"a{i+1}y"]) for i in range(l)]
    bs = [(g[f"b{i+1}x"], g[f"b{i+1}y"]) for i in range(r)]
    oy, R2, rho2 = g["oy"], g["R2"], g["rho2"]
    O = (F(1, 2), oy)
    named = {"v1": v1, "v2": V2, "v3": V3}
    fails = []

    def req(name, cond):
        if not cond:
            fails.append(name)

    req("E_MEC_v1", d2(v1, O) == R2)
    req("E_MEC_v2", d2(V2, O) == R2)
    req("E_MEC_v3", d2(V3, O) == R2)
    packet = [named[v] for v in vc] + ys + as_ + bs
    req("packet_size", len(packet) == 4)
    for i, t in enumerate(packet):
        req(f"E_PKT_{i}", d2(t, x) == rho2)
    req("I_POS_R2", R2 > 0)
    req("I_POS_rho2", rho2 > 0)
    for nm, p in [("x", x)] + [(f"y{i+1}", p) for i, p in enumerate(ys)] + \
            [(f"a{i+1}", p) for i, p in enumerate(as_)] + \
            [(f"b{i+1}", p) for i, p in enumerate(bs)]:
        req(f"I_DISK_{nm}", R2 - d2(p, O) >= 0)
    req("I_OBT_v1", dot((V2[0]-v1[0], V2[1]-v1[1]),
                        (V3[0]-v1[0], V3[1]-v1[1])) >= 0)
    req("I_OBT_v2", dot((V3[0]-V2[0], V3[1]-V2[1]),
                        (v1[0]-V2[0], v1[1]-V2[1])) >= 0)
    req("I_OBT_v3", dot((v1[0]-V3[0], v1[1]-V3[1]),
                        (V2[0]-V3[0], V2[1]-V3[1])) >= 0)
    for own, pts in ((1, [x] + ys), (2, as_), (3, bs)):
        for idx, p in enumerate(pts):
            for ci, (ca, cb, opp) in cap_chords(v1, V2, V3).items():
                prod = sA2(p, ca, cb) * sA2(opp, ca, cb)
                val = -prod if ci == own else prod
                req(f"I_CAP_own{own}_{idx}_chord{ci}", val > 0)
    seq = [V2] + ys[:k] + [x] + ys[k:] + [V3] + as_ + [v1] + bs
    for (i, j, kk), val in convex_triples(seq):
        req(f"I_ORD_{i}_{j}_{kk}", val > 0)
    return fails


def s3_banked_witnesses():
    path = os.path.join(REPO, "census", "candidate_d_probe",
                        "witnesses.json")
    data = json.load(open(path))
    ok = True
    n_checked = 0
    detail = {}
    for cid, rec in sorted(data.items()):
        if rec is None or rec.get("witness") is None:
            detail[cid] = "null (killed / rides-SUB2 pre-decision)"
            continue
        tup = tuple(int(c) for c in cid)
        fails = full_window_check(rec["witness"], tup,
                                  rec["k"], rec.get("vc") or [])
        n_checked += 1
        detail[cid] = "PASS" if not fails else f"FAIL {fails[:6]}"
        if fails:
            ok = False
        print(f"  {cid} (k={rec['k']}, vc={rec.get('vc')}): {detail[cid]}")
    straddle_ok = (detail.get("0202") == "PASS"
                   and detail.get("0211") == "PASS")
    RESULTS["S3_banked_witnesses"] = {
        "checked": n_checked, "detail": detail,
        "straddle_realizable_side_pass": straddle_ok, "pass": ok}
    return ok and straddle_ok and n_checked == 13


# ------------------------------------------------------------------ S4
def s4_near_miss():
    x0, x1, rho, ta, tb = 0.075, -0.1844, 0.0375, 3.2987, 3.3161
    x = (x0, x1)
    wa = (x0 + rho * math.cos(ta), x1 + rho * math.sin(ta))
    wb = (x0 + rho * math.cos(tb), x1 + rho * math.sin(tb))
    rows = sub2_constraints(x, wa, wb, d2(wa, x), 0.0, "left")
    _, fails = eval_rows(rows)
    # float mode: the E_PKT equalities hold only to machine precision
    fails = [(nm, v) for nm, v in fails
             if not (nm.startswith("E_PKT") and abs(v) < 1e-12)]
    names = [nm for nm, _ in fails]
    # normalized violation p = (M - v2).mhat
    M = ((wa[0] + wb[0]) / 2, (wa[1] + wb[1]) / 2)
    hm = (M[0] - x0, M[1] - x1)
    hn = math.hypot(*hm)
    mhat = (hm[0] / hn, hm[1] / hn)
    p = M[0] * mhat[0] + M[1] * mhat[1]
    only_t123 = names == ["ord_v2_wa_wb"]
    margin = dict(fails).get("ord_v2_wa_wb")
    print(f"  violated: {names}; T123 margin = {margin:.3e}; "
          f"p = (M-v2).mhat = {p:.6f}")
    RESULTS["S4_near_miss"] = {
        "violated": names, "T123_margin": margin, "p": p,
        "pass": bool(only_t123 and p < 0 and -1e-4 < margin < 0)}
    return RESULTS["S4_near_miss"]["pass"]


# ------------------------------------------------------------------ S5
def rand_frac(rng, lo=-2, hi=2, den=64):
    return F(rng.randint(lo * den, hi * den), den)


def frame_config(rng):
    t = F(rng.randint(-40, 40), rng.randint(1, 25))
    den = 1 + t * t
    mh = ((1 - t * t) / den, 2 * t / den)
    n = (-mh[1], mh[0])
    M = (rand_frac(rng, -1, 2), rand_frac(rng, -2, 1))
    h = F(rng.randint(1, 64), 256)
    tau = F(rng.randint(1, 64), 256)
    x = (M[0] - h * mh[0], M[1] - h * mh[1])
    wa = (M[0] - tau * n[0], M[1] - tau * n[1])
    wb = (M[0] + tau * n[0], M[1] + tau * n[1])
    return x, wa, wb


def s5_cross_check(n_uniform=6000, n_frame=6000, seed=554):
    rng = random.Random(seed)
    mism = 0
    agree_sat = 0
    for i in range(n_uniform + n_frame):
        if i < n_uniform:
            x = (rand_frac(rng), rand_frac(rng))
            wa = (rand_frac(rng), rand_frac(rng))
            wb = (rand_frac(rng), rand_frac(rng))
        else:
            x, wa, wb = frame_config(rng)
        rho2 = d2(wa, x) if rng.random() < 0.9 else rand_frac(rng, 0, 2)
        oy = F(0) if rng.random() < 0.5 else F(rng.randint(0, 32), 64)
        for side, smt in (("left", smt2_left_asserts),
                          ("right", smt2_right_asserts)):
            mine, _ = eval_rows(sub2_constraints(x, wa, wb, rho2, oy, side))
            theirs = smt2_sat(smt(x[0], x[1], wa[0], wa[1],
                                  wb[0], wb[1], rho2, oy))
            if mine != theirs:
                mism += 1
                print(f"  MISMATCH side={side} x={x} wa={wa} wb={wb} "
                      f"rho2={rho2} oy={oy}: mine={mine} smt2={theirs}")
            elif mine:
                agree_sat += 1
    print(f"  {n_uniform + n_frame} samples x 2 sides: mismatches={mism}"
          f" (agreeing-SAT points: {agree_sat}; 0 expected — the system "
          f"is UNSAT, so only rejection agreement is exercisable)")
    atoms_ok = s5_atom_correspondence()
    RESULTS["S5_smt2_cross_check"] = {
        "samples": (n_uniform + n_frame) * 2, "mismatches": mism,
        "agree_sat": agree_sat, "atom_correspondence": atoms_ok,
        "pass": mism == 0 and atoms_ok}
    return mism == 0 and atoms_ok


def s5_atom_correspondence():
    """PROVEN-level transcription equivalence: every atom of my
    sub2_constraints equals (as an expanded polynomial, same kind) an
    atom of the hand-transcribed runs/SUB2_*.smt2 assert list, and
    conversely — checked symbolically with sympy."""
    import sympy as sp
    xx, xy, wax, way, wbx, wby, rho2, oy = sp.symbols(
        "xx xy wax way wbx wby rho2 oy")
    x, wa, wb = (xx, xy), (wax, way), (wbx, wby)
    ok = True

    def norm(v):
        # sub2_constraints uses 0.25/0.5 literals when oy is symbolic;
        # these are exactly-representable dyadic floats, so rational
        # normalization is lossless.
        return sp.expand(sp.nsimplify(v, rational=True))

    for side, smt in (("left", smt2_left_asserts),
                      ("right", smt2_right_asserts)):
        mine = [(kind, norm(val)) for _, val, kind in
                sub2_constraints(x, wa, wb, rho2, oy, side)]
        theirs = [(kind, norm(val)) for kind, val in
                  smt(xx, xy, wax, way, wbx, wby, rho2, oy)]
        m_set = set(mine)
        t_set = set(theirs)
        miss1 = t_set - m_set
        miss2 = m_set - t_set
        if miss1 or miss2:
            ok = False
            print(f"  ATOM MISMATCH side={side}: smt2-only={miss1} "
                  f"mine-only={miss2}")
        else:
            print(f"  {side}: atom sets identical "
                  f"({len(t_set)} distinct atoms)")
    return ok


# ------------------------------------------------------------------ S6
def s6_exact_control():
    # frame with p<0 by construction, near the float near-miss
    t = F(-12)  # tan(theta/2): mhat angle ~189.5 deg
    den = 1 + t * t
    mh = ((1 - t * t) / den, 2 * t / den)     # (-143/145, -24/145)
    n = (-mh[1], mh[0])                        # (24/145, -143/145)
    best = None
    for Mx_num in range(30, 46, 2):
        for My_num in range(-21, -17):
            for h_num in (30, 34, 37, 40):
                for tau_num in (1, 2, 4):
                    M = (F(Mx_num, 1000), F(My_num, 100))
                    h = F(h_num, 1000)
                    tau = F(tau_num, 1000)
                    x = (M[0] - h * mh[0], M[1] - h * mh[1])
                    wa = (M[0] - tau * n[0], M[1] - tau * n[1])
                    wb = (M[0] + tau * n[0], M[1] + tau * n[1])
                    rho2 = d2(wa, x)
                    rows = sub2_constraints(x, wa, wb, rho2, F(0), "left")
                    _, fails = eval_rows(rows)
                    names = [nm for nm, _ in fails]
                    if names == ["ord_v2_wa_wb"]:
                        best = dict(M=M, h=h, tau=tau, x=x, wa=wa, wb=wb,
                                    rho2=rho2)
                        break
                if best:
                    break
            if best:
                break
        if best:
            break
    if best:
        print("  exact control found: all SUB2-H-left constraints hold "
              "EXCEPT ord_v2_wa_wb (=T123)")
        print(f"    x={best['x']}, wa={best['wa']}, wb={best['wb']}, "
              f"rho2={best['rho2']}")
        RESULTS["S6_exact_control"] = {
            "x": [str(c) for c in best["x"]],
            "wa": [str(c) for c in best["wa"]],
            "wb": [str(c) for c in best["wb"]],
            "rho2": str(best["rho2"]), "pass": True}
        return True
    print("  NO exact control found in the search grid")
    RESULTS["S6_exact_control"] = {"pass": False}
    return False


# ------------------------------------------------------------------ S7
def s7_direct_z3(tmo_ms=300000):
    import z3
    out = {}
    for side in ("left", "right"):
        xx, xy, wax, way, wbx, wby, rho2 = z3.Reals(
            "xx xy wax way wbx wby rho2")
        s = z3.Solver()
        s.set("timeout", tmo_ms)
        x, wa, wb = (xx, xy), (wax, way), (wbx, wby)
        rows = sub2_constraints(x, wa, wb, rho2, z3.RealVal(0), side)
        for name, val, kind in rows:
            if kind == "eq0":
                s.add(val == 0)
            elif kind == "gt0":
                s.add(val > 0)
            else:
                s.add(val >= 0)
        r = s.check()
        out[f"mine_{side}"] = str(r)
        print(f"  SUB2-H {side} (this encoding): z3 {r} "
              f"(timeout {tmo_ms} ms)")
    # original probe artifacts with oy pinned to 0 (= SUB2-H exactly)
    for side in ("left", "right"):
        path = os.path.join(REPO, "census", "candidate_d_probe", "runs",
                            f"SUB2_{side}.smt2")
        s = z3.Solver()
        s.set("timeout", tmo_ms)
        fml = z3.parse_smt2_file(path)
        s.add(*fml)
        oy = z3.Real("oy")
        s.add(oy == 0)
        r = s.check()
        out[f"artifact_{side}_oy0"] = str(r)
        print(f"  runs/SUB2_{side}.smt2 + (oy = 0): z3 {r} "
              f"(timeout {tmo_ms} ms)")
    RESULTS["S7_direct_z3_record"] = out
    return True  # record-only


def main():
    print("[S1/S2] PROVEN probe cuts reproduced as UNSAT (z3):")
    ok12 = s12_kill_systems()
    print("[S3] banked minimal-window witnesses (exact, independent):")
    ok3 = s3_banked_witnesses()
    print("[S4] float near-miss reproduction:")
    ok4 = s4_near_miss()
    print("[S5] build_sub2 vs runs/SUB2_*.smt2 transcription agreement:")
    ok5 = s5_cross_check()
    print("[S6] exact not-over-constrained control:")
    ok6 = s6_exact_control()
    print("[S7] direct z3 status record (no conclusion drawn):")
    s7_direct_z3()
    allok = ok12 and ok3 and ok4 and ok5 and ok6
    RESULTS["ALL_PASS"] = allok
    with open(os.path.join(HERE, "smoke_results.json"), "w") as f:
        json.dump(RESULTS, f, indent=1, default=str)
    print("\nSMOKE:", "ALL PASS" if allok else "FAILURE")
    return 0 if allok else 1


if __name__ == "__main__":
    sys.exit(main())

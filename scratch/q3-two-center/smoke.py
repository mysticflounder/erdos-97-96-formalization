#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Q3 smoke gates (mandatory before the sweep; fix the encoder, never the gate).

SG1  known-kill through the solver harness: D-probe G1 vesica collapse rerun
     with runs/ redirected here — must be C-EMPTY + GB={1} on both separator
     choices.
SG2  known-witness through the verifier: a Q1 REALIZED witness from
     candidate-d-probe/witnesses.json re-verified via build_window +
     verify_exact — must PASS (validates the imported exact machinery).
SG3  builder-binding mutations on the Q3 two-center window:
     (a) tier0 baseline z3 -> sat expected;
     (b) contiguity mutation: one q-point given O1 cap signs while seated in
         the q-block of sigma -> must be unsat (I-CAP x I-ORD interact);
     (c) radius mutation: rv2 = 4*R2 + 1 (member farther from the on-circle
         vertex V than any disk point can be) -> must be unsat
         (E-KV x I-DISK interact).
"""
import json
import sys
import os

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import q3lib as q
import sympy as sp
enc = q.enc


def sg1():
    import io
    import contextlib
    buf = io.StringIO()
    with contextlib.redirect_stdout(buf):
        rc = enc.gate_g1(None)
    out = json.loads(buf.getvalue())
    return {"gate": "SG1", "pass": rc == 0, "detail": out}


def sg2():
    wits = json.load(open(os.path.join(q.DPROBE, "witnesses.json")))
    rec = wits["0022"]
    vc = tuple(rec["vc"])
    cs = enc.build_window(0, 0, 2, 2, vc, rec["k"])
    subs = {k: enc.parse_frac(v) for k, v in rec["witness"].items()}
    ok, bad = enc.verify_exact(cs, subs)
    return {"gate": "SG2", "pass": ok, "bad": bad[:3]}


def sg3():
    res = {}
    # (a) baseline
    cs = q.build_w2c(q.TIER0, {"pslot": None, "pident": None,
                               "qslot": None, "qident": None, "sord": None})
    za = enc.z3_check(cs, timeout_s=120)
    res["a_baseline"] = {"status": za["status"], "secs": za["secs"],
                         "all_rational": za.get("all_rational")}
    res["a_model"] = za.get("model")
    # (b) contiguity mutation: q1 gets O1 (cap 2) signs instead of O2
    cs_b = q.build_w2c(q.TIER0, {"pslot": None, "pident": None,
                                 "qslot": None, "qident": None, "sord": None})
    cs_b.name += "_mutB"
    V, W, U = cs_b.points["v2"], cs_b.points["v3"], cs_b.points["v1"]
    q1 = cs_b.points["q1"]
    # remove q1's original cap-sign triple (last-added block was q's; rebuild
    # instead: drop all gt that mention q1 from cap signs is fragile -- easier:
    # add the CONTRADICTING own-cap-2 signs on top; a point cannot satisfy
    # strict signs for two different own caps simultaneously, but that alone
    # is trivial; the geometric content is O1-signs vs q-block seat in sigma.
    # So: rebuild tier0 with q1 given cap-2 signs only.
    cs_b2 = q.CS("tier0_mutB")
    V = cs_b2.fixed("v2", (q.R0, q.R0))
    W = cs_b2.fixed("v3", (q.R1, q.R0))
    U = cs_b2.point("v1")
    oy = cs_b2.var("oy")
    O = (q.HALF, oy)
    R2 = cs_b2.var("R2")
    rv2 = cs_b2.var("rv2")
    rw2 = cs_b2.var("rw2")
    cs_b2.eqs.append(sp.expand(q.d2(U, O) - R2))
    cs_b2.eqs.append(sp.expand(q.d2(V, O) - R2))
    ps = [cs_b2.point("p1"), cs_b2.point("p2")]
    qs = [cs_b2.point("q1"), cs_b2.point("q2")]
    for t in ps:
        cs_b2.eqs.append(sp.expand(q.d2(t, V) - rv2))
    for t in qs:
        cs_b2.eqs.append(sp.expand(q.d2(t, W) - rw2))
    cs_b2.gt += [R2, rv2, rw2]
    for p in ps + qs:
        cs_b2.ge.append(sp.expand(R2 - q.d2(p, O)))
    cs_b2.ge.append(sp.expand(q.dot(q.sub(V, U), q.sub(W, U))))
    cs_b2.ge.append(sp.expand(q.dot(q.sub(W, V), q.sub(U, V))))
    cs_b2.ge.append(sp.expand(q.dot(q.sub(U, W), q.sub(V, W))))
    for p in ps:
        enc.add_cap_signs(cs_b2, p, 2, U, V, W)
    enc.add_cap_signs(cs_b2, qs[0], 2, U, V, W)   # MUTATION: q1 in O1
    enc.add_cap_signs(cs_b2, qs[1], 3, U, V, W)
    enc.add_convex_order(cs_b2, [V, W] + ps + [U] + qs)
    zb = enc.z3_check(cs_b2, timeout_s=120)
    res["b_contiguity_mut"] = {"status": zb["status"], "secs": zb["secs"]}
    # (c) radius mutation
    cs_c = q.build_w2c(q.TIER0, {"pslot": None, "pident": None,
                                 "qslot": None, "qident": None, "sord": None})
    cs_c.name += "_mutC"
    rv2s = [v for v in cs_c.vars if str(v) == "rv2"][0]
    R2s = [v for v in cs_c.vars if str(v) == "R2"][0]
    cs_c.eqs.append(sp.expand(rv2s - 4 * R2s - 1))
    zc = enc.z3_check(cs_c, timeout_s=120)
    res["c_radius_mut"] = {"status": zc["status"], "secs": zc["secs"]}
    ok = (res["a_baseline"]["status"] == "sat"
          and res["b_contiguity_mut"]["status"] == "unsat"
          and res["c_radius_mut"]["status"] == "unsat")
    return {"gate": "SG3", "pass": ok, "detail": res}


if __name__ == "__main__":
    out = [sg1(), sg2(), sg3()]
    print(json.dumps(out, indent=1, default=str))
    with open(os.path.join(os.path.dirname(os.path.abspath(__file__)),
                           "smoke_results.json"), "w") as f:
        json.dump(out, f, indent=1, default=str)
    sys.exit(0 if all(g["pass"] for g in out) else 1)

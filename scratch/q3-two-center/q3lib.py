#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Q3 two-center probe: {V,W} joint-class windows (formulation.md section 1).

Reuses the validated candidate-d-probe encoder primitives read-only
(sys.path import; artifact writes redirected to this directory's runs/).
Soundness contract: every emitted constraint is implied by a real
|A| >= 12 DoubleApex leaf configuration whose vertex classes K(V), K(W)
have the case's joint type, so UNSAT verdicts are exclusion-sound.
"""
from __future__ import annotations

import os
import sys
from itertools import combinations

import sympy as sp

HERE = os.path.dirname(os.path.abspath(__file__))
DPROBE = os.path.normpath(os.path.join(HERE, "..", "candidate-d-probe"))
sys.path.insert(0, DPROBE)
import encoder as enc  # noqa: E402  (validated D-probe machinery)

enc.RUNS = os.path.join(HERE, "runs")  # never write into candidate-d-probe/

CS = enc.CS
d2, sA2, dot, sub = enc.d2, enc.sA2, enc.dot, enc.sub
R0, R1, HALF = enc.R0, enc.R1, enc.HALF

# ------------------------------------------------------------- enumeration
# Side-V type: av in {'0','W','s'} (the <=1 member of {W} u intS),
#              bv in {'0','U','o2'} (the <=1 member of {U} u intO2).
# Side-W type: aw in {'0','V','s'}, bw in {'0','U','o1'}.
# gamma = 4 - (av!='0') - (bv!='0') forced members in the opposite interior.
# Identifications: io2 in {None,'dist','ident'} iff bv=='o2';
#                  io1 in {None,'dist','ident'} iff bw=='o1';
#                  isv in {None,'shared','sep'} iff av==aw=='s'.
# C2 (|K(V) n K(W)| <= 2) prunes patterns with >2 shared members.

AV = ["0", "W", "s"]
BV = ["0", "U", "o2"]
AW = ["0", "V", "s"]
BW = ["0", "U", "o1"]


def gamma(a, b):
    return 4 - (a != "0") - (b != "0")


def class_id(av, bv, aw, bw, io2, io1, isv):
    s = f"V{av}{bv}_W{aw}{bw}"
    if io2:
        s += f"_o2{io2[0]}"
    if io1:
        s += f"_o1{io1[0]}"
    if isv:
        s += f"_s{isv[0]}"
    return s


def mirror_key(av, bv, aw, bw, io2, io1, isv):
    """Map V<->W, O1<->O2 (formulation 1.4); return the mirrored tuple."""
    m_av = {"0": "0", "V": "W", "s": "s"}[aw]  # side-W a-slot becomes side-V
    m_bv = {"0": "0", "U": "U", "o1": "o2"}[bw]
    m_aw = {"0": "0", "W": "V", "s": "s"}[av]
    m_bw = {"0": "0", "U": "U", "o2": "o1"}[bv]
    return (m_av, m_bv, m_aw, m_bw, io1, io2, isv)


def all_classes(mirror_reduce=True):
    seen = set()
    out = []
    for av in AV:
        for bv in BV:
            for aw in AW:
                for bw in BW:
                    io2s = [None] if bv != "o2" else ["dist", "ident"]
                    io1s = [None] if bw != "o1" else ["dist", "ident"]
                    isvs = [None] if not (av == "s" and aw == "s") else [
                        "shared", "sep"]
                    for io2 in io2s:
                        for io1 in io1s:
                            for isv in isvs:
                                nshared = ((bv == "U" and bw == "U")
                                           + (io2 == "ident")
                                           + (io1 == "ident")
                                           + (isv == "shared"))
                                if nshared > 2:
                                    continue  # C2 prunes
                                key = (av, bv, aw, bw, io2, io1, isv)
                                if mirror_reduce:
                                    mk = mirror_key(*key)
                                    canon = min(key, mk,
                                                key=lambda t: str(t))
                                    if canon in seen:
                                        continue
                                    seen.add(canon)
                                out.append({
                                    "id": class_id(*key),
                                    "av": av, "bv": bv, "aw": aw, "bw": bw,
                                    "io2": io2, "io1": io1, "isv": isv,
                                    "gv": gamma(av, bv),
                                    "gw": gamma(aw, bw),
                                    "nshared": nshared,
                                })
    return out


def subcases(cls):
    """Order sub-cases: slots for differently-constrained block members."""
    gv, gw = cls["gv"], cls["gw"]
    # p-block: gv identical p's; K(W)'s o1 member either inserted ('dist',
    # gv+1 slots) or identified with one p ('ident', gv slots).
    if cls["io1"] == "dist":
        pslots = list(range(gv + 1))
        pident = [None]
    elif cls["io1"] == "ident":
        pslots = [None]
        pident = list(range(gv))
    else:
        pslots, pident = [None], [None]
    if cls["io2"] == "dist":
        qslots = list(range(gw + 1))
        qident = [None]
    elif cls["io2"] == "ident":
        qslots = [None]
        qident = list(range(gw))
    else:
        qslots, qident = [None], [None]
    sorders = ["vw", "wv"] if cls["isv"] == "sep" else [None]
    out = []
    for ps in pslots:
        for pi in pident:
            for qs in qslots:
                for qi in qident:
                    for so in sorders:
                        out.append({"pslot": ps, "pident": pi,
                                    "qslot": qs, "qident": qi, "sord": so})
    return out


def subcase_id(cls, sc):
    tag = cls["id"]
    for k in ("pslot", "pident", "qslot", "qident"):
        if sc[k] is not None:
            tag += f"_{k[0]}{k[1]}{sc[k]}"
    if sc["sord"]:
        tag += f"_{sc['sord']}"
    return tag


# ------------------------------------------------------------- window build


TIER0 = {"id": "tier0_forced", "av": "0", "bv": "0", "aw": "0", "bw": "0",
         "io2": None, "io1": None, "isv": None, "gv": 2, "gw": 2,
         "nshared": 0, "_partial": True}


def build_w2c(cls, sc):
    """Two-center decorated window (formulation 1.5). CCW sigma:
    (V, s-block, W, p-block, U, q-block). cls may be TIER0 (the forced-only
    relaxation common to every joint class: 2 p's + 2 q's, remaining class
    members' locations forgotten — still exclusion-sound)."""
    cs = CS(subcase_id(cls, sc))
    V = cs.fixed("v2", (R0, R0))
    W = cs.fixed("v3", (R1, R0))
    U = cs.point("v1")
    oy = cs.var("oy")
    O = (HALF, oy)
    R2 = cs.var("R2")
    rv2 = cs.var("rv2")
    rw2 = cs.var("rw2")

    # E-MEC (Ox = 1/2 substituted; v3 equation redundant)
    cs.eqs.append(sp.expand(d2(U, O) - R2))
    cs.eqs.append(sp.expand(d2(V, O) - R2))

    kv_members = []  # points at rv2 from V
    kw_members = []  # points at rw2 from W

    # forced interior members
    ps = [cs.point(f"p{i+1}") for i in range(cls["gv"])]
    qs = [cs.point(f"q{i+1}") for i in range(cls["gw"])]
    kv_members += ps
    kw_members += qs

    s_block = []
    if cls["isv"] == "shared":
        z = cs.point("svw")
        kv_members.append(z)
        kw_members.append(z)
        s_block = [z]
    else:
        sv = sw = None
        if cls["av"] == "s":
            sv = cs.point("sv")
            kv_members.append(sv)
        if cls["aw"] == "s":
            sw = cs.point("sw")
            kw_members.append(sw)
        if sv is not None and sw is not None:
            s_block = [sv, sw] if sc["sord"] == "vw" else [sw, sv]
        elif sv is not None:
            s_block = [sv]
        elif sw is not None:
            s_block = [sw]

    # vertex memberships (equalities on existing anchors)
    if cls["av"] == "W":
        kv_members.append(W)
    if cls["bv"] == "U":
        kv_members.append(U)
    if cls["aw"] == "V":
        kw_members.append(V)
    if cls["bw"] == "U":
        kw_members.append(U)

    # optional cross-interior members
    p_block = list(ps)
    if cls["io1"] == "dist":
        w_o1 = cs.point("wo1")
        kw_members.append(w_o1)
        p_block = ps[:sc["pslot"]] + [w_o1] + ps[sc["pslot"]:]
    elif cls["io1"] == "ident":
        kw_members.append(ps[sc["pident"]])
    q_block = list(qs)
    if cls["io2"] == "dist":
        v_o2 = cs.point("vo2")
        kv_members.append(v_o2)
        q_block = qs[:sc["qslot"]] + [v_o2] + qs[sc["qslot"]:]
    elif cls["io2"] == "ident":
        kv_members.append(qs[sc["qident"]])

    if not cls.get("_partial"):
        assert len(kv_members) == 4, (cls, len(kv_members))
        assert len(kw_members) == 4, (cls, len(kw_members))

    for t in kv_members:
        cs.eqs.append(sp.expand(d2(t, V) - rv2))
    for t in kw_members:
        cs.eqs.append(sp.expand(d2(t, W) - rw2))

    # I-POS
    cs.gt += [R2, rv2, rw2]
    # I-DISK for all non-anchor points
    nonanchor = list({id(pt): pt for pt in
                      s_block + p_block + q_block}.values())
    for p in nonanchor:
        cs.ge.append(sp.expand(R2 - d2(p, O)))
    # I-OBT
    cs.ge.append(sp.expand(dot(sub(V, U), sub(W, U))))
    cs.ge.append(sp.expand(dot(sub(W, V), sub(U, V))))
    cs.ge.append(sp.expand(dot(sub(U, W), sub(V, W))))
    # I-CAP: s-block own cap 1, p-block own cap 2, q-block own cap 3
    for p in s_block:
        enc.add_cap_signs(cs, p, 1, U, V, W)
    for p in p_block:
        enc.add_cap_signs(cs, p, 2, U, V, W)
    for p in q_block:
        enc.add_cap_signs(cs, p, 3, U, V, W)
    # I-ORD
    seq = [V] + s_block + [W] + p_block + [U] + q_block
    enc.add_convex_order(cs, seq)

    cs.meta = {"class": {k: cls[k] for k in
                         ("id", "av", "bv", "aw", "bw", "io2", "io1", "isv",
                          "gv", "gw")},
               "sub": sc,
               "sigma": [next(nm for nm, pp in cs.points.items()
                              if pp is pt) for pt in seq],
               "n_vars": len(cs.vars), "n_eqs": len(cs.eqs),
               "n_ge": len(cs.ge), "n_gt": len(cs.gt)}
    return cs


def separators(cs):
    """Rabinowitsch separators for the equality-ideal step: pairwise point
    distinctness + nondegenerate triangle."""
    pts = list(cs.points.values())
    seps = [sp.expand(d2(a, b)) for a, b in combinations(pts, 2)]
    v1 = cs.points["v1"]
    seps.append(sp.expand(sA2((R0, R0), (R1, R0), v1)))
    return seps

#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Exact-rational witness construction for the erased-pin adjacency probe.

Two configurations over the same IsM44 frame (m = 5, n = 10, gauge
v=(0,0), w=(1,0), Moser triangle u,v,w on the MEC, all caps strict):

  GATE-I  (one-hit, smoke gate (i)):  class(p) = {s3, Q1, u, w},
          counts (moser, sameCap, leftAdj, rightAdj) = (2, 0, 1, 1)
          -- the known-realizable one-hit primitive row.  MUST be SAT.

  PRIMARY (two-hit, the probe):       class(p) = {s2, Q1, Q2, u},
          counts (1, 0, 2, 1) -- TWO same-side adjacent-interior hits
          (Q1, Q2 in the left-adjacent short-cap interior), x = s2 the
          erased surplus interior, center p = Pu a non-surplus strict
          interior.

Construction guarantees the equalities EXACTLY:
  * u = chord_point(k, t): exactly on the MEC circle;
  * class members = rational rotations rot_t(u, p, t): exactly on the
    class circle (cos^2+sin^2 = 1 identically over Q);
  * GATE-I center = perp_bisector_point(u, w, s): exactly equidistant
    from u and w.
All inequalities (cap sides, convex position, in-disk, acuteness,
distinctness, off-circle) are then verified as exact Fraction sign checks.
No floating point anywhere.
"""
from __future__ import annotations

import json
import sys
from fractions import Fraction as F
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
import probe_lib as PL

HERE = Path(__file__).parent


def build_primary(k, t_u, pu, t_q1, t_q2, t_s, s1, s3, pw):
    u = PL.chord_point(k, t_u)
    pts = {
        "u": u, "v": (F(0), F(0)), "w": (F(1), F(0)),
        "Pu": pu, "Pw": pw,
        "Q1": PL.rot_t(u, pu, t_q1),
        "Q2": PL.rot_t(u, pu, t_q2),
        "s2": PL.rot_t(u, pu, t_s),
        "s1": s1, "s3": s3,
    }
    return pts, dict(center_label="Pu", class_labels=("s2", "Q1", "Q2", "u"),
                     x_label="s2", expected_counts=(1, 0, 2, 1))


def build_gate1(k, t_u, s_bis, t_q1, t_s, q2, s1, s2, pw):
    u = PL.chord_point(k, t_u)
    pu = PL.perp_bisector_point(u, (F(1), F(0)), s_bis)
    pts = {
        "u": u, "v": (F(0), F(0)), "w": (F(1), F(0)),
        "Pu": pu, "Pw": pw,
        "Q1": PL.rot_t(u, pu, t_q1),
        "Q2": q2,
        "s3": PL.rot_t(u, pu, t_s),
        "s1": s1, "s2": s2,
    }
    return pts, dict(center_label="Pu", class_labels=("s3", "Q1", "u", "w"),
                     x_label="s3", expected_counts=(2, 0, 1, 1))


def audit(tag, pts, k, spec, verbose_fail=True):
    ok, checks = PL.check_configuration(pts, k, spec["center_label"],
                                        spec["class_labels"], spec["x_label"],
                                        spec["expected_counts"])
    n_pass = sum(1 for c in checks if c.ok)
    print(f"[{tag}] {n_pass}/{len(checks)} checks pass -> "
          f"{'WITNESS' if ok else 'REJECT'}")
    if not ok and verbose_fail:
        for c in checks:
            if not c.ok:
                print(f"    {c.row()}")
    return ok, checks


def dump(tag, pts, k, spec, checks, path):
    payload = {
        "schema": "two_hit_probe_witness.v1",
        "tag": tag,
        "frame": {
            "gauge": "v=(0,0), w=(1,0)",
            "mec_center": [str(F(1, 2)), str(F(k))],
            "mec_radius2": str(F(1, 4) + F(k) ** 2),
            "hull_order": list(PL.HULL_ORDER),
            "caps": {
                "surplus (opp u, card 5)": ["v", "w", "s1", "s2", "s3"],
                "opp v (card 4)": ["w", "u", "Pw", "Pu"],
                "opp w (card 4)": ["u", "v", "Q1", "Q2"],
            },
        },
        "center": spec["center_label"],
        "class": list(spec["class_labels"]),
        "erased_x": spec["x_label"],
        "counts_moser_same_left_right": list(spec["expected_counts"]),
        "radius2": str(PL.d2(pts[spec["center_label"]], pts[spec["x_label"]])),
        "points": {lab: [str(pts[lab][0]), str(pts[lab][1])]
                   for lab in PL.LABELS},
        "n_checks": len(checks),
        "all_pass": all(c.ok for c in checks),
    }
    Path(path).write_text(json.dumps(payload, indent=2) + "\n")
    print(f"    wrote {path}")


def main():
    print("== witness construction (exact rational, no floats) ==")
    results = {}

    # ---------- smoke gate (i): one-hit configuration --------------------
    print()
    print("GATE-I: one-hit configuration {s3, Q1, u, w} at p = Pu "
          "(row (2,0,1,1))")
    seed_g1 = dict(
        k=F(2, 7), t_u=F(12, 7), s_bis=F(1, 10),
        t_q1=F(1, 6), t_s=F(7, 3),
        q2=(F(7, 25), F(27, 50)),
        s1=(F(1, 4), F(-3, 100)), s2=(F(11, 20), F(-7, 200)),
        pw=(F(99, 100), F(17, 100)),
    )
    pts, spec = build_gate1(**seed_g1)
    ok, checks = audit("gate-i seed", pts, seed_g1["k"], spec)
    if not ok:
        # small exact tuning grids on the free entries
        tune_ok = False
        for t_q1 in (F(1, 6), F(1, 7), F(1, 8), F(1, 5)):
            for q2 in ((F(7, 25), F(27, 50)), (F(6, 25), F(12, 25)),
                       (F(8, 25), F(3, 5))):
                for pw in ((F(99, 100), F(17, 100)), (F(49, 50), F(3, 20)),
                           (F(1, 1), F(1, 5))):
                    trial = dict(seed_g1, t_q1=t_q1, q2=q2, pw=pw)
                    pts, spec = build_gate1(**trial)
                    ok, checks = audit("gate-i tune", pts, trial["k"], spec,
                                       verbose_fail=False)
                    if ok:
                        seed_g1 = trial
                        tune_ok = True
                        break
                if tune_ok:
                    break
            if tune_ok:
                break
        if not tune_ok:
            print("GATE-I FAILED: no one-hit witness found in the seed "
                  "neighborhood -- STOP (spec: do not improvise)")
            sys.exit(1)
    dump("one_hit_gate", pts, seed_g1["k"], spec, checks,
         HERE / "witness_one_hit.json")
    results["gate_i"] = "SAT (exact witness)"

    # ---------- PRIMARY: two-hit configuration ---------------------------
    print()
    print("PRIMARY: two-hit configuration {s2, Q1, Q2, u} at p = Pu "
          "(counts (1,0,2,1); leftAdjCount = 2)")
    seed_pr = dict(
        k=F(2, 7), t_u=F(12, 7), pu=(F(19, 20), F(7, 20)),
        t_q1=F(1, 16), t_q2=F(1, 8), t_s=F(49, 50),
        s1=(F(9, 50), F(-31, 500)), s3=(F(7, 10), F(-3, 40)),
        pw=(F(209, 200), F(19, 100)),
    )
    pts, spec = build_primary(**seed_pr)
    ok, checks = audit("primary seed", pts, seed_pr["k"], spec)
    if not ok:
        tune_ok = False
        for t_q1, t_q2 in ((F(1, 16), F(1, 8)), (F(1, 14), F(1, 7)),
                           (F(1, 20), F(1, 9)), (F(1, 12), F(1, 6))):
            for t_s in (F(49, 50), F(19, 20), F(9, 10), F(1, 1)):
                for pw in ((F(209, 200), F(19, 100)), (F(21, 20), F(1, 5)),
                           (F(103, 100), F(4, 25))):
                    trial = dict(seed_pr, t_q1=t_q1, t_q2=t_q2, t_s=t_s, pw=pw)
                    pts, spec = build_primary(**trial)
                    ok, checks = audit("primary tune", pts, trial["k"], spec,
                                       verbose_fail=False)
                    if ok:
                        seed_pr = trial
                        tune_ok = True
                        break
                if tune_ok:
                    break
            if tune_ok:
                break
        if not tune_ok:
            print("PRIMARY: no two-hit witness in the seed neighborhood; "
                  "run a wider search or escalate to solver-assisted search "
                  "before claiming UNSAT.")
            sys.exit(2)
    dump("two_hit_primary", pts, seed_pr["k"], spec, checks,
         HERE / "witness_two_hit.json")
    results["primary"] = "SAT (exact witness)"

    # ---------- MIRROR: right-side two-hit from the primary ---------------
    # Reflect across x = 1/2 ((x,y) -> (1-x,y); fixes the MEC) and relabel by
    # the permutation (v w)(Pw Q2)(Pu Q1)(s1 s3).  The left-side two-hit at
    # p in C_v-interior becomes a right-side two-hit at p in C_w-interior
    # (i = oppIndex2), refuting rightAdjCount <= 1 as well.
    print()
    print("MIRROR: right-side two-hit {s2, Pw, Pu, u} at p = Q1 "
          "(counts (1,0,1,2); rightAdjCount = 2)")

    def mir(q):
        return (F(1) - q[0], q[1])

    mpts = {
        "u": mir(pts["u"]), "v": mir(pts["w"]), "w": mir(pts["v"]),
        "Q1": mir(pts["Pu"]), "Q2": mir(pts["Pw"]),
        "s1": mir(pts["s3"]), "s2": mir(pts["s2"]), "s3": mir(pts["s1"]),
        "Pw": mir(pts["Q2"]), "Pu": mir(pts["Q1"]),
    }
    mspec = dict(center_label="Q1", class_labels=("s2", "Pw", "Pu", "u"),
                 x_label="s2", expected_counts=(1, 0, 1, 2))
    ok, checks = audit("mirror", mpts, seed_pr["k"], mspec)
    if not ok:
        print("MIRROR FAILED -- symmetry argument broken, investigate")
        sys.exit(3)
    dump("two_hit_mirror_right", mpts, seed_pr["k"], mspec, checks,
         HERE / "witness_two_hit_mirror.json")
    results["mirror"] = "SAT (exact witness)"

    print()
    print(f"RESULTS: {results}")


if __name__ == "__main__":
    main()

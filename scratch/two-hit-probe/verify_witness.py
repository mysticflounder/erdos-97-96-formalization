#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Independent exact re-verification of a two-hit-probe witness JSON.

Deliberately self-contained: re-implements every predicate inline from the
stored coordinate strings (fractions.Fraction), shares no construction code
with witness_search.py.  Verifies:

  V1  gauge v=(0,0), w=(1,0)
  V2  u, v, w exactly on the MEC circle (center (1/2,k), R^2 = 1/4+k^2)
  V3  all ten points in the closed MEC disk, non-Moser strictly inside
  V4  Moser triangle strictly acute (=> non-obtuse)
  V5  every non-Moser point strictly inside its home cap and strictly
      outside the other two caps (chord-separation sign tests)
  V6  all 120 cyclic hull triples strictly positively oriented
      (=> strict convex position => ConvexIndep)
  V7  all 45 pairs distinct
  V8  the selected class at p is EXACTLY the four claimed labels at the
      claimed radius^2 (recomputed from scratch), radius^2 > 0
  V9  the (moser, sameCap, leftAdj, rightAdj) counts match the claim,
      recomputed from cap layout + class membership
  V10 ErasedPinTriple shape: x in class, x a surplus interior, p a
      non-surplus strict interior, |class \\ {x}| = 3, p not in class

Exit 0 iff every check passes.
"""
from __future__ import annotations

import json
import sys
from fractions import Fraction as F
from pathlib import Path

MOSER = ("u", "v", "w")
HULL = ("u", "Q1", "Q2", "v", "s1", "s2", "s3", "w", "Pw", "Pu")
CAPS = {
    "u": ("v", "w", ("s1", "s2", "s3")),
    "v": ("w", "u", ("Pw", "Pu")),
    "w": ("u", "v", ("Q1", "Q2")),
}

failures = []


def check(cid, ok, note=""):
    line = f"  [{'PASS' if ok else 'FAIL'}] {cid}" + (f"  ({note})" if note else "")
    print(line)
    if not ok:
        failures.append(cid)


def d2(a, b):
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def sa2(a, b, c):
    return (b[0] - a[0]) * (c[1] - a[1]) - (c[0] - a[0]) * (b[1] - a[1])


def main(path):
    data = json.loads(Path(path).read_text())
    assert data["schema"] == "two_hit_probe_witness.v1"
    pts = {lab: (F(x), F(y)) for lab, (x, y) in data["points"].items()}
    O = (F(data["frame"]["mec_center"][0]), F(data["frame"]["mec_center"][1]))
    R2 = F(data["frame"]["mec_radius2"])
    p_lab = data["center"]
    cls = tuple(data["class"])
    x_lab = data["erased_x"]
    exp_counts = tuple(data["counts_moser_same_left_right"])
    rho_claim = F(data["radius2"])
    p = pts[p_lab]

    print(f"== independent verification: {data['tag']} ({path}) ==")
    print(f"   center p = {p_lab}, class = {cls}, x = {x_lab}, "
          f"claimed counts (m,s,l,r) = {exp_counts}")

    # V1 gauge
    check("V1 gauge v=(0,0)", pts["v"] == (F(0), F(0)))
    check("V1 gauge w=(1,0)", pts["w"] == (F(1), F(0)))
    # V2 Moser on MEC; R2 consistent
    check("V2 R2 = 1/4 + k^2", R2 == F(1, 4) + O[1] ** 2 and O[0] == F(1, 2))
    for m in MOSER:
        check(f"V2 onMEC[{m}]", d2(pts[m], O) == R2)
    # V3 disk
    for lab in HULL:
        dd = d2(pts[lab], O)
        if lab in MOSER:
            check(f"V3 inDisk[{lab}]", dd <= R2)
        else:
            check(f"V3 strictInDisk[{lab}]", dd < R2, f"margin {R2 - dd}")
    # V4 acute
    for m in MOSER:
        o1, o2 = [pts[z] for z in MOSER if z != m]
        dot = ((o1[0] - pts[m][0]) * (o2[0] - pts[m][0])
               + (o1[1] - pts[m][1]) * (o2[1] - pts[m][1]))
        check(f"V4 acuteAt[{m}]", dot > 0, f"dot {dot}")
    # V5 caps
    for m, (a, b, interiors) in CAPS.items():
        ref = sa2(pts[m], pts[a], pts[b])
        check(f"V5 chordRef[C_{m}] nonzero", ref != 0)
        for z in interiors:
            val = sa2(pts[z], pts[a], pts[b]) * ref
            check(f"V5 capSide[{z} in C_{m}]", val < 0, f"prod {val}")
        for m2, (_, _, ints2) in CAPS.items():
            if m2 == m:
                continue
            for z in ints2:
                val = sa2(pts[z], pts[a], pts[b]) * ref
                check(f"V5 notInCap[{z} vs C_{m}]", val > 0)
    # V6 convexity (all cyclic triples)
    n = len(HULL)
    bad = 0
    worst = None
    for i in range(n):
        for j in range(i + 1, n):
            for kk in range(j + 1, n):
                val = sa2(pts[HULL[i]], pts[HULL[j]], pts[HULL[kk]])
                if worst is None or val < worst[0]:
                    worst = (val, (HULL[i], HULL[j], HULL[kk]))
                if not (val > 0):
                    bad += 1
    check("V6 convex position (120 cyclic triples all > 0)", bad == 0,
          f"min sa2 = {worst[0]} at {worst[1]}")
    # V7 distinctness
    bad = [(a, b) for i, a in enumerate(HULL) for b in HULL[i + 1:]
           if d2(pts[a], pts[b]) == 0]
    check("V7 all 45 pairs distinct", not bad, str(bad) if bad else "")
    # V8 the selected class, recomputed from scratch
    check("V8 radius2 > 0", rho_claim > 0, f"rho {rho_claim}")
    sel = tuple(lab for lab in HULL
                if lab != p_lab and d2(p, pts[lab]) == rho_claim)
    check("V8 SelectedClass(A, p, r) == claimed class",
          sorted(sel) == sorted(cls), f"recomputed {sel}")
    check("V8 class card = 4", len(sel) == 4)
    check("V8 p itself not in class (dist 0 != r)",
          rho_claim != 0)
    # V9 counts from cap layout.  Lean adjacency ((v1,v2,v3) = (u,v,w),
    # surplusIdx = 0): p in C_v ints -> left = C_w ints, right = surplus;
    # p in C_w ints -> left = surplus, right = C_v ints.
    moser_ct = len(set(cls) & set(MOSER))
    home = next(m for m, (_, _, ints) in CAPS.items() if p_lab in ints)
    same_ct = len((set(cls) & set(CAPS[home][2])) - {p_lab})
    if home == "v":
        left_ints, right_ints = CAPS["w"][2], CAPS["u"][2]
    else:
        left_ints, right_ints = CAPS["u"][2], CAPS["v"][2]
    left_ct = len(set(cls) & set(left_ints))
    right_ct = len(set(cls) & set(right_ints))
    got = (moser_ct, same_ct, left_ct, right_ct)
    check("V9 counts (moser, sameCap, leftAdj, rightAdj)", got == exp_counts,
          f"recomputed {got}")
    check("V9 home cap of p is non-surplus", home in ("v", "w"),
          f"home C_{home}")
    # V10 erased-pin shape
    check("V10 x in class", x_lab in cls)
    check("V10 x is a surplus interior", x_lab in CAPS["u"][2])
    check("V10 residual triple card 3", len([z for z in sel if z != x_lab]) == 3)
    print()
    if failures:
        print(f"VERDICT: REJECT ({len(failures)} failures)")
        return 1
    print("VERDICT: WITNESS VERIFIED (all checks exact)")
    return 0


if __name__ == "__main__":
    rc = 0
    for arg in sys.argv[1:]:
        rc |= main(arg)
        print()
    sys.exit(rc)

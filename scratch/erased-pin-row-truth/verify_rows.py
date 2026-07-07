#!/usr/bin/env python3
"""Independent exact re-verification of erased-pin row-truth witnesses.

Deliberately self-contained: re-implements every predicate inline from the
stored coordinate strings (fractions.Fraction); shares no construction code
with rowlib/search.  Handles:
  * schema erased_pin_row_truth_witness.v1 (this probe; n = 10 or 11; center
    may be an opp-cap interior, the vertex u, or a surplus interior), and
  * schema two_hit_probe_witness.v1 (parity mode against the original
    two-hit-probe witnesses).

Checks (all exact; strict where the probe convention is strict):
  V1  gauge v=(0,0), w=(1,0)
  V2  u,v,w exactly on the MEC circle (center (1/2,k), R^2=1/4+k^2)
  V3  all points in the closed disk, non-Moser strictly inside
  V4  Moser triangle strictly acute
  V5  every non-Moser point strictly inside its home cap, strictly outside
      the other two caps
  V6  all cyclic hull triples strictly positively oriented
  V7  all pairs distinct
  V8  the selected class at p is EXACTLY the four claimed labels at radius^2
      recomputed from scratch; radius^2 > 0
  V9  (row witnesses) the (m,s,l,r) counts match, recomputed from cap layout
      per the Lean adjacency mapping; center in the claimed side's cap
  V10 erased-pin shape: x in class, x a surplus interior, x != center,
      residual triple card 3

Exit 0 iff every check in every file passes.
"""
from __future__ import annotations

import json
import sys
from fractions import Fraction as F
from pathlib import Path

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


def model_tables(n_surplus):
    sints = tuple(f"s{i+1}" for i in range(n_surplus))
    hull = ("u", "Q1", "Q2", "v") + sints + ("w", "Pw", "Pu")
    caps = {
        "u": ("v", "w", sints),
        "v": ("w", "u", ("Pw", "Pu")),
        "w": ("u", "v", ("Q1", "Q2")),
    }
    return sints, hull, caps


def verify(path):
    data = json.loads(Path(path).read_text())
    schema = data["schema"]
    pts = {lab: (F(x), F(y)) for lab, (x, y) in data["points"].items()}
    if schema == "erased_pin_row_truth_witness.v1":
        n_surplus = 4 if data["model_n"] == 11 else 3
        O = (F(data["mec_center"][0]), F(data["mec_center"][1]))
        R2 = F(data["mec_radius2"])
        row = tuple(data["row_mslr"]) if data.get("row_mslr") else None
        side = data.get("side")
    elif schema == "two_hit_probe_witness.v1":
        n_surplus = 3
        O = (F(data["frame"]["mec_center"][0]),
             F(data["frame"]["mec_center"][1]))
        R2 = F(data["frame"]["mec_radius2"])
        row = tuple(data["counts_moser_same_left_right"])
        side = None  # inferred below from the center's cap
    else:
        raise SystemExit(f"unknown schema {schema}")
    sints, hull, caps = model_tables(n_surplus)
    moser = ("u", "v", "w")
    p_lab = data["center"]
    cls = tuple(data["class"])
    x_lab = data["erased_x"]
    rho_claim = F(data["radius2"])
    p = pts[p_lab]

    print(f"== verify {Path(path).name}: center {p_lab}, class {cls}, "
          f"x {x_lab}, row {row}, side {side} ==")

    check("V1 gauge v", pts["v"] == (F(0), F(0)))
    check("V1 gauge w", pts["w"] == (F(1), F(0)))
    check("V2 R2 = 1/4+k^2, Ox = 1/2",
          R2 == F(1, 4) + O[1] ** 2 and O[0] == F(1, 2))
    for m in moser:
        check(f"V2 onMEC[{m}]", d2(pts[m], O) == R2)
    for lab in hull:
        dd = d2(pts[lab], O)
        if lab in moser:
            check(f"V3 inDisk[{lab}]", dd <= R2)
        else:
            check(f"V3 strictInDisk[{lab}]", dd < R2)
    for m in moser:
        o1, o2 = [pts[z] for z in moser if z != m]
        dot = ((o1[0] - pts[m][0]) * (o2[0] - pts[m][0])
               + (o1[1] - pts[m][1]) * (o2[1] - pts[m][1]))
        check(f"V4 acuteAt[{m}]", dot > 0)
    for m, (a, b, interiors) in caps.items():
        ref = sa2(pts[m], pts[a], pts[b])
        check(f"V5 chordRef[C_{m}] != 0", ref != 0)
        for z in interiors:
            check(f"V5 capSide[{z} in C_{m}]",
                  sa2(pts[z], pts[a], pts[b]) * ref < 0)
        for m2, (_, _, ints2) in caps.items():
            if m2 == m:
                continue
            for z in ints2:
                check(f"V5 notInCap[{z} vs C_{m}]",
                      sa2(pts[z], pts[a], pts[b]) * ref > 0)
    n = len(hull)
    bad, worst = 0, None
    for i in range(n):
        for j in range(i + 1, n):
            for kk in range(j + 1, n):
                val = sa2(pts[hull[i]], pts[hull[j]], pts[hull[kk]])
                if worst is None or val < worst:
                    worst = val
                if not (val > 0):
                    bad += 1
    check(f"V6 convex ({n*(n-1)*(n-2)//6} triples)", bad == 0,
          f"min sa2 {worst}")
    dup = [(a, b) for i, a in enumerate(hull) for b in hull[i + 1:]
           if d2(pts[a], pts[b]) == 0]
    check("V7 all pairs distinct", not dup)
    check("V8 radius2 > 0", rho_claim > 0)
    sel = tuple(lab for lab in hull
                if lab != p_lab and d2(p, pts[lab]) == rho_claim)
    check("V8 class recomputed == claimed", sorted(sel) == sorted(cls),
          f"recomputed {sel}")
    check("V8 class card 4", len(sel) == 4)
    # V9 counts (only when the center is an opp-cap interior)
    home = None
    for m, (_, _, ints) in caps.items():
        if p_lab in ints:
            home = m
    if p_lab in ("Pw", "Pu") or p_lab in ("Q1", "Q2"):
        inferred_side = "right" if p_lab in ("Pw", "Pu") else "left"
        if side is not None:
            check("V9 side matches center cap", side == inferred_side)
        m_ct = len(set(cls) & set(moser))
        s_ct = len((set(cls) & set(caps[home][2])) - {p_lab})
        if inferred_side == "right":
            l_ct = len(set(cls) & {"Q1", "Q2"})
            r_ct = len(set(cls) & set(sints))
        else:
            l_ct = len(set(cls) & set(sints))
            r_ct = len(set(cls) & {"Pw", "Pu"})
        got = (m_ct, s_ct, l_ct, r_ct)
        if row is not None:
            check(f"V9 counts {got} == row {row}", got == row)
    elif p_lab == "u":
        check("V9 center u = surplus-opposite Moser vertex", True)
    elif p_lab in sints:
        check("V9 center is a surplus interior", True)
    else:
        check("V9 center classified", False, f"unknown center {p_lab}")
    check("V10 x in class", x_lab in cls)
    check("V10 x is surplus interior", x_lab in sints)
    check("V10 x != center", x_lab != p_lab)
    check("V10 residual triple card 3",
          len([z for z in sel if z != x_lab]) == 3)
    print()


def main():
    for arg in sys.argv[1:]:
        verify(arg)
    if failures:
        print(f"VERDICT: REJECT ({len(failures)} failures)")
        return 1
    print("VERDICT: ALL WITNESSES VERIFIED (exact)")
    return 0


if __name__ == "__main__":
    sys.exit(main())

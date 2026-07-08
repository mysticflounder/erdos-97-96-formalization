#!/usr/bin/env python3
"""Falsifier gate for the Q3 kills (STATE item 9, formulation.md §"Falsifier
gate"): the W20 ring witness and the d3-formulation lattice/ring witnesses
must not realize a claimed-killed joint type.

The kills' hypotheses are the LEAF's geometric facts — E-MEC (Moser
triangle on the configuration's minimal enclosing circle), I-DISK, I-OBT,
STRICT chord-sign cap membership, and the exact-radius class structure.
The d3 witnesses' cube-level cap LABELS do not carry that geometry (their
labeled triangles need not sit on the MEC at all — that gap is exactly
what made them census-level falsifiers), so the gate checks hypotheses
geometrically:

For each witness configuration: compute the MEC; for every pair (V',W')
of distinct MEC-boundary points and every third boundary point U' with
triangle (U',V',W') nonobtuse (the leaf's Moser-triangle shape), test:
  K-Q3-1: two distinct members of K(V') ∩ K(W'), both STRICTLY on the
          U'-side of line V'W' (the proof's minimal hypothesis set).
  K-Q3-5: a shared member z with strict cap-S signs and in the disk,
          plus a K(V') member with strict cap-O1 signs in the disk and
          a K(W') member with strict cap-O2 signs in the disk.
Any hit = GATE FAIL (kill falsified by a real configuration). Sign tests
use a 1e-7 guard band; a test inside the band raises (escalate to exact).
"""
import json
import math
import os
import sys
from itertools import combinations

HERE = os.path.dirname(os.path.abspath(__file__))
D3 = os.path.normpath(os.path.join(HERE, "..", "d3-formulation"))
EPS = 1e-7

FILES = [
    ("t1", os.path.join(D3, "t1_results.json")),
    ("t1b", os.path.join(D3, "t1b_results.json")),
    ("t9_m8a", os.path.join(D3, "t9_wit_m8_1.4534.json")),
    ("t9_m8b", os.path.join(D3, "t9_wit_m8_2.2853.json")),
    ("t9_m10_W20", os.path.join(D3, "t9_wit_m10_0.6180.json")),
]


def to_xy(pt, lattice):
    if lattice:
        i, j = pt
        return (i + j / 2.0, j * math.sqrt(3) / 2.0)
    return (pt[0], pt[1])


def key(pt):
    return (round(pt[0], 7), round(pt[1], 7))


def d2(a, b):
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def sA2(v, vj, vk):
    return ((vj[0] - v[0]) * (vk[1] - v[1])
            - (vk[0] - v[0]) * (vj[1] - v[1]))


def strict_sign(x, what):
    if abs(x) < EPS:
        raise RuntimeError(f"sign test in guard band: {what} = {x}")
    return x > 0


def mec(points):
    """Brute-force minimal enclosing circle (n <= 20)."""
    best = None
    for a, b in combinations(points, 2):
        c = ((a[0] + b[0]) / 2, (a[1] + b[1]) / 2)
        r2 = d2(a, b) / 4
        if all(d2(p, c) <= r2 + 1e-9 for p in points):
            if best is None or r2 < best[1]:
                best = (c, r2)
    for a, b, cc in combinations(points, 3):
        ax, ay, bx, by, cx, cy = *a, *b, *cc
        dd = 2 * (ax * (by - cy) + bx * (cy - ay) + cx * (ay - by))
        if abs(dd) < 1e-12:
            continue
        ux = ((ax**2 + ay**2) * (by - cy) + (bx**2 + by**2) * (cy - ay)
              + (cx**2 + cy**2) * (ay - by)) / dd
        uy = ((ax**2 + ay**2) * (cx - bx) + (bx**2 + by**2) * (ax - cx)
              + (cx**2 + cy**2) * (bx - ax)) / dd
        c = (ux, uy)
        r2 = d2(a, c)
        if all(d2(p, c) <= r2 + 1e-9 for p in points):
            if best is None or r2 < best[1]:
                best = (c, r2)
    return best


def in_cap(p, own, tri, O, R2):
    """Strict cap signs for cap `own` (1=S opp U, 2=O1 opp V, 3=O2 opp W;
    tri = (U, V, W)) plus I-DISK; guard-banded floats."""
    U, V, W = tri
    if d2(p, O) > R2 + EPS:
        return False
    chords = {1: (V, W, U), 2: (W, U, V), 3: (U, V, W)}
    for ci, (ca, cb, opp) in chords.items():
        prod = sA2(p, ca, cb) * sA2(opp, ca, cb)
        if abs(prod) < EPS:
            return False        # boundary — not strictly interior
        if (prod > 0) if ci == own else (prod < 0):
            return False
    return True


def check_config(tag, pts_xy, classes):
    O, R2 = mec(pts_xy)
    R = math.sqrt(R2)
    boundary = [p for p in pts_xy if abs(math.sqrt(d2(p, O)) - R) < 1e-6]
    findings = []
    n_tri = 0
    for V, W in combinations(boundary, 2):
        kv = classes.get(key(V))
        kw = classes.get(key(W))
        if not kv or not kw:
            continue
        shared = kv & kw
        for U in boundary:
            if U in (V, W):
                continue
            dots = [
                (U[0]-V[0])*(W[0]-V[0]) + (U[1]-V[1])*(W[1]-V[1]),
                (U[0]-W[0])*(V[0]-W[0]) + (U[1]-W[1])*(V[1]-W[1]),
                (V[0]-U[0])*(W[0]-U[0]) + (V[1]-U[1])*(W[1]-U[1]),
            ]
            if any(d < -EPS for d in dots):
                continue        # obtuse — not a leaf Moser triangle
            n_tri += 1
            tri = (U, V, W)
            # K-Q3-1 minimal: two distinct shared members strictly on
            # the U-side of line VW
            sU = sA2(V, W, U)
            same_side = [z for z in shared
                         if strict_sign(sA2(V, W, pts_xy[pt_idx[z]]),
                                        "q31") == (sU > 0)]
            if len(same_side) >= 2:
                findings.append(("K-Q3-1-FALSIFIED", tag, key(V), key(W)))
            # K-Q3-5: shared z in intS + K(V) member in intO1 +
            # K(W) member in intO2
            z_s = [z for z in shared if in_cap(pts_xy[pt_idx[z]], 1,
                                               tri, O, R2)]
            p_o1 = [p for p in kv if in_cap(pts_xy[pt_idx[p]], 2,
                                            tri, O, R2)]
            q_o2 = [q for q in kw if in_cap(pts_xy[pt_idx[q]], 3,
                                            tri, O, R2)]
            if z_s and p_o1 and q_o2:
                findings.append(("K-Q3-5-FALSIFIED", tag, key(V), key(W),
                                 key(U)))
    print(f"{tag}: n={len(pts_xy)} boundary={len(boundary)} "
          f"nonobtuse_triangles={n_tri} findings={len(findings)}",
          flush=True)
    return findings


def main():
    global pt_idx
    all_findings = []
    for tag, path in FILES:
        data = json.load(open(path))
        entries = data if isinstance(data, list) else [data]
        for i, entry in enumerate(entries):
            w = entry["witness"]
            lattice = tag.startswith("t1")
            raw_pts = ([tuple(p) for p in entry["subset"]] if lattice
                       else [tuple(json.loads(
                           k.replace("(", "[").replace(")", "]")))
                           for k in w["classes"]])
            pts_xy = [to_xy(p, lattice) for p in raw_pts]
            pt_idx = {key(p): j for j, p in enumerate(pts_xy)}
            classes = {}
            for kstr, members in w["classes"].items():
                pt = tuple(json.loads(
                    kstr.replace("(", "[").replace(")", "]")))
                classes[key(to_xy(pt, lattice))] = {
                    key(to_xy(tuple(m), lattice)) for m in members}
            all_findings += check_config(f"{tag}[{i}]", pts_xy, classes)
    if all_findings:
        print("GATE FAIL — kill falsified:", all_findings)
        sys.exit(1)
    print("GATE PASS — no configuration realizes a killed joint type "
          "under the kills' geometric hypotheses")


if __name__ == "__main__":
    main()

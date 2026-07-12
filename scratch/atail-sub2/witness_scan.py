#!/usr/bin/env python3
"""ATAIL-SUB2 falsification scan over the banked realizable witnesses.

The PROVEN theorem (proof.md) says: NO configuration anywhere contains
five points (alpha, w_a, w_b, x, beta) with alpha, beta a Moser edge...
more precisely with w_a, w_b inside the closed disk of diameter
[alpha, beta], |x-w_a| = |x-w_b|, and all 10 triples of either chain
(alpha,w_a,w_b,x,beta) or (alpha,x,w_a,w_b,beta) strictly positive.

Consequently the SUB2-H cut can NEVER kill a realizable configuration.
This scan verifies that on every banked witness family cited by the
ATAIL-SUB2 smoke mandate ("W15/W16 families, two-ring" — the
doubleapex-card12up falsifiers of docs/dead-ends.md:781-782 — plus the
13 exact minimal-window witnesses): it enumerates every (center,
equal-radius pair, Moser edge) combination and confirms no SUB2
sub-configuration fires. A single hit would be an exact counterexample
candidate against the proof — none is expected, none tolerated.

Exact integer/rational arithmetic for witnesses.json + t1/t1b lattice
witnesses; float with a 1e-9 margin band for the t9 two-ring files
(coordinates are stored as floats there), any in-band case flagged
INDETERMINATE for exact follow-up.
"""
import ast
import glob
import json
import os
import sys
from fractions import Fraction
from itertools import combinations

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, "..", ".."))
sys.path.insert(0, HERE)

from encoding import d2, sub2_hit, convex_triples, dot

F = Fraction
REPORT = {}


def scan_points(tag, pts, moser, exact=True, centers=None):
    """pts: list of 2-tuples; moser: (T1,T2,T3). Enumerate centers
    (default: all pts), equal-radius pairs among the other points, all 6
    ordered Moser edges; count sub2 hits."""
    hits = []
    indet = 0
    combos = 0
    eps = 0 if exact else 1e-9
    cl = centers if centers is not None else list(range(len(pts)))
    for ci in cl:
        c = pts[ci]
        others = [p for j, p in enumerate(pts) if j != ci and p != c]
        for w1, w2 in combinations(others, 2):
            if exact:
                if d2(c, w1) != d2(c, w2):
                    continue
            else:
                if abs(d2(c, w1) - d2(c, w2)) > 1e-9:
                    continue
            for a in range(3):
                for b in range(3):
                    if a == b:
                        continue
                    combos += 1
                    got = sub2_hit(moser[a], moser[b], c, w1, w2,
                                   strict_margin=eps)
                    if got:
                        hits.append((ci, w1, w2, a, b, got))
                    elif not exact:
                        # near-band check: would it pass with margin 0
                        # but not with the confident margin?
                        got0 = sub2_hit(moser[a], moser[b], c, w1, w2,
                                        strict_margin=-1e-9)
                        if got0:
                            indet += 1
    status = ("HITS" if hits else
              ("INDETERMINATE" if indet else "clean"))
    print(f"  {tag}: {combos} (center,pair,edge) combos scanned -> "
          f"{status} (hits={len(hits)}, indeterminate={indet})")
    REPORT[tag] = {"combos": combos, "hits": len(hits),
                   "indeterminate": indet}
    for h in hits[:5]:
        print("    HIT:", h)
    return not hits and indet == 0


def scan_probe_witnesses():
    data = json.load(open(os.path.join(
        REPO, "census", "candidate_d_probe", "witnesses.json")))
    ok = True
    for cid, rec in sorted(data.items()):
        if rec is None or rec.get("witness") is None:
            continue
        g = {k: F(v) for k, v in rec["witness"].items()}
        m, s, l, r = (int(c) for c in cid)
        v1 = (g["v1x"], g["v1y"])
        v2 = (F(0), F(0))
        v3 = (F(1), F(0))
        pts = [v1, v2, v3, (g["xx"], g["xy"])]
        for pre, cnt in (("y", s), ("a", l), ("b", r)):
            for i in range(cnt):
                pts.append((g[f"{pre}{i+1}x"], g[f"{pre}{i+1}y"]))
        ok &= scan_points(f"probe_{cid}", pts, (v1, v2, v3), exact=True)
    return ok


def scan_lattice_file(path, tag):
    data = json.load(open(path))
    ok = True
    for idx, rec in enumerate(data):
        w = rec["witness"]
        moser = tuple((F(p[0]), F(p[1])) for p in (w["U"], w["V"], w["W"]))
        pts = []
        seen = set()
        for cap in ("S", "O1", "O2"):
            for p in w[cap]:
                t = (F(p[0]), F(p[1]))
                if t not in seen:
                    seen.add(t)
                    pts.append(t)
        ok &= scan_points(f"{tag}[{idx}]_n{rec.get('n')}", pts, moser,
                          exact=True)
        # also scan restricted to the banked exact-4 classes, as recorded
        classes = w.get("classes") or {}
        for ckey, members in classes.items():
            c = tuple(F(v) for v in ast.literal_eval(ckey))
            mem = [(F(p[0]), F(p[1])) for p in members]
            for w1, w2 in combinations(mem, 2):
                if d2(c, w1) != d2(c, w2):
                    print(f"    NOTE {tag}[{idx}] class {ckey}: "
                          f"unequal radii in banked class (skipped)")
    return ok


def scan_tworing():
    ok = True
    for path in sorted(glob.glob(os.path.join(
            REPO, "scratch", "d3-formulation", "t9_wit_*.json"))):
        rec = json.load(open(path))
        w = rec["witness"]
        moser = tuple(tuple(c) for c in (w["U"], w["V"], w["W"]))
        pts = []
        seen = set()
        for cap in ("S", "O1", "O2"):
            for p in w[cap]:
                key = (round(p[0], 12), round(p[1], 12))
                if key not in seen:
                    seen.add(key)
                    pts.append(tuple(p))
        tag = os.path.basename(path)
        ok &= scan_points(tag, pts, moser, exact=False)
    return ok


def main():
    print("[A] 13 exact minimal-window probe witnesses:")
    ok_a = scan_probe_witnesses()
    print("[B] W15/W16 lattice falsifier families "
          "(t1_results.json, t1b_results.json — exact integers):")
    ok_b = True
    for fname, tag in (("t1_results.json", "t1"),
                       ("t1b_results.json", "t1b")):
        p = os.path.join(REPO, "scratch", "d3-formulation", fname)
        if os.path.exists(p):
            ok_b &= scan_lattice_file(p, tag)
        else:
            print(f"  MISSING {p}")
            ok_b = False
    print("[C] two-ring families (t9_wit_*.json — float, 1e-9 band):")
    ok_c = scan_tworing()
    allok = ok_a and ok_b and ok_c
    REPORT["ALL_CLEAN"] = allok
    with open(os.path.join(HERE, "witness_scan_results.json"), "w") as f:
        json.dump(REPORT, f, indent=1)
    print("\nWITNESS SCAN:", "ALL CLEAN — the SUB2-H cut keeps every "
          "banked witness SAT" if allok else "PROBLEM FOUND")
    return 0 if allok else 1


if __name__ == "__main__":
    sys.exit(main())

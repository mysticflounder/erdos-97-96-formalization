#!/usr/bin/env python3
"""Exact decision, on each stored witness, of the five ambient facts the
routed-rows statement supplies to the row producer:

  h1  (∀ radius rho x, EndpointEscapeLeftAt oppIndex1 radius rho x → False)
  h2  (∀ radius rho x, EndpointEscapeRightAt oppIndex2 radius rho x → False)
  h3  (∀ radius x, PinnedRightSurplusResidualAt radius x → False)
  h4  (∀ radius x, PinnedLeftSurplusResidualAt radius x → False)
  h5  NonSurplusMoserCapContainment
      (= MoserCapContainmentAt oppIndex1 ∧ oppIndex2)

All quantifiers are finite on a concrete A (radii range over realized
center-to-point distances), so each fact is decided EXACTLY (Fraction
arithmetic on squared distances; dist equalities ⟺ d2 equalities).

Frame: surplusIdx = 0, (v1,v2,v3) = (u,v,w).
  oppositeVertex(oppIndex1) = v, cap C2 (closed {w,u,Pw,Pu});
  oppositeVertex(oppIndex2) = w, cap C3 (closed {u,v,Q1,Q2});
  leftOuter(oppIndex1) = u, rightOuter(oppIndex1) = w;
  leftOuter(oppIndex2) = v, rightOuter(oppIndex2) = u;
  leftAdjCap(oppIndex1) = C3, rightAdjCap(oppIndex1) = C1;
  leftAdjCap(oppIndex2) = C1, rightAdjCap(oppIndex2) = C2.
(Verified against SurplusM44Packet.lean lines 293-320, 532-566, 1914-1941,
3604-3645, 1819-1835.)
"""
from __future__ import annotations

import json
import sys
from fractions import Fraction as F
from pathlib import Path


def d2(a, b):
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def main(paths):
    all_ok = True
    for path in paths:
        data = json.loads(Path(path).read_text())
        pts = {lab: (F(x), F(y)) for lab, (x, y) in data["points"].items()}
        labels = list(pts.keys())
        sints = [z for z in labels if z.startswith("s")]
        C1 = set(["v", "w"] + sints)          # closed surplus cap
        C2 = {"w", "u", "Pw", "Pu"}           # closed opp1 cap
        C3 = {"u", "v", "Q1", "Q2"}           # closed opp2 cap

        def classes_at(c):
            """center label -> dict r2 -> set of labels at that squared dist
            (excluding the center itself, which is at r2=0 only)."""
            out = {}
            for z in labels:
                if z == c:
                    continue
                out.setdefault(d2(pts[c], pts[z]), set()).add(z)
            return out

        clsV, clsW, clsU = classes_at("v"), classes_at("w"), classes_at("u")

        # h1: EndpointEscapeLeftAt oppIndex1 (center v; escape in C3-only;
        # second class at rightOuter(oppIndex1) = w; rho = d(x,w) = d(u,w);
        # blocked branch needs d(u,v) != radius)
        h1_viol = []
        for r2, cls in clsV.items():
            if len(cls) < 4:
                continue
            for x in cls & {"Q1", "Q2"}:
                rho2 = d2(pts[x], pts["w"])
                if rho2 != d2(pts["u"], pts["w"]):
                    continue
                wcls = clsW.get(rho2, set())
                if len(wcls) >= 4 and d2(pts["u"], pts["v"]) != r2:
                    h1_viol.append((r2, x))
        # h2: EndpointEscapeRightAt oppIndex2 (center w; escape in C2-only;
        # second class at leftOuter(oppIndex2) = v; rho = d(x,v) = d(u,v);
        # needs d(u,w) != radius)
        h2_viol = []
        for r2, cls in clsW.items():
            if len(cls) < 4:
                continue
            for x in cls & {"Pw", "Pu"}:
                rho2 = d2(pts[x], pts["v"])
                if rho2 != d2(pts["u"], pts["v"]):
                    continue
                vcls = clsV.get(rho2, set())
                if len(vcls) >= 4 and d2(pts["u"], pts["w"]) != r2:
                    h2_viol.append((r2, x))
        # h3: PinnedRightSurplusResidualAt (T = class(v, radius), card 4,
        # {Pw,Pu} ⊆ T, u ∈ T, T∩C3 = {u}, T∩C1 = {x}, plus the two
        # p1,p2 non-equidistance facts vs w and u)
        h3_viol = []
        for r2, cls in clsV.items():
            if len(cls) != 4 or not {"Pw", "Pu", "u"} <= cls:
                continue
            rest = cls - {"Pw", "Pu", "u"}
            if len(rest) != 1:
                continue
            x = next(iter(rest))
            if cls & C3 != {"u"} or cls & C1 != {x}:
                continue
            if (d2(pts["Pw"], pts["w"]) != d2(pts["Pu"], pts["w"]) and
                    d2(pts["Pw"], pts["u"]) != d2(pts["Pu"], pts["u"])):
                h3_viol.append((r2, x))
        # h4: PinnedLeftSurplusResidualAt (T = class(w, radius), card 4,
        # {Q1,Q2} ⊆ T, u ∈ T, T∩C1 = {x}, T∩C2 = {u}, non-equidistance of
        # Q1,Q2 vs rightOuter(oppIndex2)=u and leftOuter(oppIndex2)=v)
        h4_viol = []
        for r2, cls in clsW.items():
            if len(cls) != 4 or not {"Q1", "Q2", "u"} <= cls:
                continue
            rest = cls - {"Q1", "Q2", "u"}
            if len(rest) != 1:
                continue
            x = next(iter(rest))
            if cls & C1 != {x} or cls & C2 != {"u"}:
                continue
            if (d2(pts["Q1"], pts["u"]) != d2(pts["Q2"], pts["u"]) and
                    d2(pts["Q1"], pts["v"]) != d2(pts["Q2"], pts["v"])):
                h4_viol.append((r2, x))
        # h5: containment: every >=4 class at v ⊆ C2; every >=4 class at w ⊆ C3
        h5_viol = []
        for r2, cls in clsV.items():
            if len(cls) >= 4 and not cls <= C2:
                h5_viol.append(("v", r2, sorted(cls)))
        for r2, cls in clsW.items():
            if len(cls) >= 4 and not cls <= C3:
                h5_viol.append(("w", r2, sorted(cls)))

        maxu = max(len(c) for c in clsU.values())
        maxv = max(len(c) for c in clsV.values())
        maxw = max(len(c) for c in clsW.values())
        facts = {
            "h1_endpointEscapeLeft_excluded": not h1_viol,
            "h2_endpointEscapeRight_excluded": not h2_viol,
            "h3_pinnedRight_excluded": not h3_viol,
            "h4_pinnedLeft_excluded": not h4_viol,
            "h5_nonSurplusMoserCapContainment": not h5_viol,
        }
        ok = all(facts.values())
        all_ok = all_ok and ok
        print(f"{Path(path).name}: "
              f"{'ALL 5 AMBIENT INPUTS HOLD' if ok else 'SOME INPUT FAILS'} "
              f"(max class card at u/v/w = {maxu}/{maxv}/{maxw})")
        for k, v in facts.items():
            if not v:
                print(f"    FAIL {k}: witnesses {h1_viol or h2_viol or h3_viol or h4_viol or h5_viol}")
    print()
    print("SUMMARY:", "all witnesses satisfy the five ambient inputs"
          if all_ok else "SOME WITNESS VIOLATES AN AMBIENT INPUT (see above)")
    return 0 if all_ok else 1


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))

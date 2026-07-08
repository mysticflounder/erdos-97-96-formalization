#!/usr/bin/env python3
"""Exact-algebraic witnesses for NEEDS-SPECIAL classes (STATE.md item 6).

These classes force rv2 = rw2 = 1 (av='W' plus aw='V', possibly with
b-slots = U adding |UV|=1 / |UW|=1), so any point on BOTH circles is
(1/2, +-sqrt(3)/2) and any U on both unit circles is the equilateral
apex — never rational. Everything lives in Q(sqrt 3), where sympy
arithmetic is exact: reuse the factory assembler with frac_sqrt patched
to return exact symbolic roots, and sympy-rational apexes chosen so the
forced algebraic point lands strictly inside its cap:
  z = (1/2, sqrt(3)/2) in intO1 needs Uy < sqrt(3)(1-Ux) and
  oy >= sqrt(3)/6 (disk), checked per-apex below.
Witnesses are verified through the OFFICIAL build_w2c + verify_exact.
"""
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import factory as F
import q3lib as q
import sympy as sp

HERE = os.path.dirname(os.path.abspath(__file__))
enc = q.enc


def sym_sqrt(x):
    x = sp.nsimplify(x, rational=True) if not isinstance(
        x, sp.Basic) else x
    if x < 0:
        return None
    return sp.sqrt(x)


F.frac_sqrt = sym_sqrt  # exact algebraic roots for the Q(sqrt 3) pass

R = sp.Rational
SPECIAL_US = {
    # equilateral apex (duv = duw = 1)
    "VWU_WVU": [(R(1, 2), sp.sqrt(3) / 2)],
    # rv2 = rw2 = 1, ident z = (1/2, sqrt(3)/2); U free
    "VW0_WVo1_o1i": [(R(1, 4), R(1)), (R(1, 3), R(1)),
                     (R(1, 4), R(9, 10)), (R(1, 5), R(11, 10))],
    # additionally duv = 1: U rational on C(V,1)
    "VWU_WVo1_o1i": [(R(7, 25), R(24, 25)), (R(5, 13), R(12, 13)),
                     (R(3, 5), R(4, 5))],
    # additionally io2 = dist: vo2 on C(V,1) in intO2 needs duv > 1;
    # prefer taller apexes (bigger duv) so C(V,1) cuts deep into intO2
    "VWo2_WVo1_o2d_o1i": [(R(1, 5), R(6, 5)), (R(1, 8), R(9, 8)),
                          (R(1, 6), R(5, 4)), (R(1, 4), R(1)),
                          (R(1, 3), R(1)), (R(1, 5), R(11, 10))],
}


# hand witnesses where the auto-assembler's directed aim misses the
# feasible corner of a region (tried before auto assembly)
HAND = {
    # U=(1/5,6/5): p-block (p1, z) on C(V,1) in intO1; vo2 on C(V,1) at
    # the chord-UV end of intO2; q's LOW on C(W,1) so the convex chain
    # U -> vo2 -> q1 -> q2 -> V closes (left turns throughout)
    "VWo2_WVo1_o2d_o1i": {
        "sc": {"pslot": None, "pident": 1, "qslot": 0, "qident": None,
               "sord": None},
        "subs": {
            "v1x": R(1, 5), "v1y": R(6, 5),
            "oy": R(8, 15), "R2": R(481, 900),
            "rv2": sp.Integer(1), "rw2": sp.Integer(1),
            "p1x": R(35, 37), "p1y": R(12, 37),
            "p2x": R(1, 2), "p2y": sp.sqrt(3) / 2,
            "q1x": R(2, 101), "q1y": R(20, 101),
            "q2x": R(2, 901), "q2y": R(60, 901),
            "vo2x": R(15, 113), "vo2y": R(112, 113),
        },
    },
}


def main():
    classes = {c["id"]: c for c in q.all_classes()}
    out = {}
    for cid, us in SPECIAL_US.items():
        cls = classes[cid]
        got = None
        if cid in HAND:
            got = HAND[cid]
        for U in us if got is None else []:
            res, used = F.try_assemble(cls, U, budget=3000)
            if res is not None:
                got = res
                break
        if got is None:
            print(cid, "NO-SPECIAL-WITNESS")
            continue
        sc = got["sc"]
        subs = {k: sp.nsimplify(v, rational=True)
                if not isinstance(v, sp.Basic) else sp.simplify(v)
                for k, v in got["subs"].items()}
        cs = q.build_w2c(cls, sc)
        need = {str(v) for v in cs.vars}
        assert need == set(subs), (cid, sorted(need), sorted(subs))
        ok, bad = enc.verify_exact(cs, subs)
        m = dict(subs)
        m["rv2"] = m["rv2"] + sp.Rational(1, 7)
        mok, _ = enc.verify_exact(cs, m)
        print(cid, "VERIFIED" if ok else "FAIL",
              "mutation_rejects" if not mok else "MUTATION-ACCEPTED-BAD")
        if not ok:
            for b in bad[:4]:
                print("  bad:", str(b)[:100])
            continue
        if mok:
            continue  # mutation control failed: do not record
        out[cid] = {"sc": sc,
                    "subs": {k: str(v) for k, v in subs.items()},
                    "field": "Q(sqrt(3))"}
    with open(os.path.join(HERE, "specials_witnesses.json"), "w") as f:
        json.dump(out, f, indent=1)
    print(json.dumps({"special_verified": sorted(out)}, indent=1))


if __name__ == "__main__":
    main()

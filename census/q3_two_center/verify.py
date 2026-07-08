#!/usr/bin/env python3
"""Verify factory witnesses against the OFFICIAL window systems.

For each factory witness: rebuild the exact window build_w2c(cls, sc) and
run the D-probe verify_exact (sympy exact arithmetic) on the substitution
map. Factory semantics (Fraction) and encoder semantics (sympy) are
independent implementations of formulation.md section 1.5 — a pass here is
the cross-check that they agree on this witness.

Writes q3_witnesses.json (verified witnesses only) and prints a summary.
Also runs a mutation control: the first verified witness re-checked with
one coordinate perturbed must FAIL.
"""
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import q3lib as q
import sympy as sp

HERE = os.path.dirname(os.path.abspath(__file__))
enc = q.enc


def parse(v):
    return sp.Rational(v)


def main():
    raw = json.load(open(os.path.join(HERE, "factory_raw.json")))
    classes = {c["id"]: c for c in q.all_classes()}
    verified, failed, other = {}, {}, {}
    mutation_done = False
    mutation_ok = None
    for cid, rec in raw.items():
        if rec["status"] != "witness":
            other[cid] = rec["status"]
            continue
        cls = classes[cid]
        sc = rec["sc"]
        subs = {k: parse(v) for k, v in rec["subs"].items()}
        cs = q.build_w2c(cls, sc)
        need = {str(v) for v in cs.vars}
        have = set(subs)
        if need - have:
            failed[cid] = f"missing vars {sorted(need - have)[:4]}"
            continue
        ok, bad = enc.verify_exact(cs, {k: v for k, v in subs.items()
                                        if k in need})
        if ok:
            verified[cid] = {"sc": sc, "subs": rec["subs"]}
            if not mutation_done:
                m = dict(subs)
                m["rv2"] = m["rv2"] + sp.Rational(1, 7)
                mok, _ = enc.verify_exact(cs, {k: v for k, v in m.items()
                                               if k in need})
                mutation_ok = (not mok)
                mutation_done = True
        else:
            failed[cid] = [str(b)[:90] for b in bad[:2]]
        print(cid, "VERIFIED" if ok else "FAIL", flush=True)
    with open(os.path.join(HERE, "q3_witnesses.json"), "w") as f:
        json.dump(verified, f, indent=1)
    print(json.dumps({
        "verified": len(verified), "failed": len(failed),
        "no_witness": sum(1 for s in other.values()
                          if s == "no-witness-in-menu"),
        "needs_special": sum(1 for s in other.values()
                             if s == "NEEDS-SPECIAL"),
        "mutation_control_rejects": mutation_ok,
        "failed_detail": failed,
        "other": other}, indent=1))


if __name__ == "__main__":
    main()

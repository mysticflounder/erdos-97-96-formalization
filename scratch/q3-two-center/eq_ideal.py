#!/usr/bin/env python3
"""Equality-ideal step for the residue classes (STATE item 7b).

For each residue class, run msolve on the equality subsystem of EVERY
sub-case (E-MEC + radius equalities + ident identifications) with
Rabinowitsch separators (pairwise distinctness + nondegenerate
triangle). C-EMPTY would be an equality-only kill certificate
(cross-check with sympy GB == {1}); POSDIM is the expected verdict —
no kill available from equalities alone, class stays with the
inequality side.
"""
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import q3lib as q                      # noqa: E402
enc = q.enc

RESIDUE = [
    "V0o2_WV0_o2i",
    "V0o2_WVo1_o2i_o1d",
    "VWU_Wso1_o1i",
    "VWo2_Wso1_o2d_o1i",
    "Vso2_Wso1_o2d_o1i_ssep",
]

classes = {c["id"]: c for c in q.all_classes()}
results = {}
for cid in (sys.argv[1:] or RESIDUE):
    cls = classes[cid]
    results[cid] = {}
    for sc in q.subcases(cls):
        cs = q.build_w2c(cls, sc)
        seps = q.separators(cs)
        r = enc.msolve_check(cs, seps, timeout=120, tag="_eqi")
        v = r["verdict"]
        if v == "C-EMPTY":
            gb1 = enc.sympy_gb_one(cs, seps)
            v = f"C-EMPTY(gb_one={gb1})"
        results[cid][q.subcase_id(cls, sc)] = v
        print(f"{cid} {q.subcase_id(cls, sc)}: {v}", flush=True)

with open(os.path.join(HERE, "eq_ideal_results.json"), "w") as f:
    json.dump(results, f, indent=1)
verdicts = {v for per in results.values() for v in per.values()}
print("verdict set:", sorted(verdicts))

#!/usr/bin/env python3
"""Residue pass 4: targeted apex sweep for the 5 true-residue classes.

check_kq34.py shows the anchored subsystems are z3-SAT at right-angle
apexes like U=(1,1) — an apex NOT in any factory menu (U_SKEW carries
only odd ny/8; U_DENSE tops at ux=10/12). Sweep right-angle frames
(ux ∈ {0,1}) and near-right skews with boosted budgets; merge any
witnesses into factory_raw.json (same schema as factory main).
"""
import json
import os
import sys
from fractions import Fraction as Fr

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import factory as F           # noqa: E402
import q3lib as q             # noqa: E402

RESIDUE = [
    "V0o2_WV0_o2i",
    "V0o2_WVo1_o2i_o1d",
    "VWU_Wso1_o1i",
    "VWo2_Wso1_o2d_o1i",
    "Vso2_Wso1_o2d_o1i_ssep",
]

# right-angle frames first (the z3-SAT shape), then near-right skews
U_RIGHT = [(Fr(x), Fr(n, d)) for x in (1, 0)
           for n, d in ((1, 1), (3, 4), (5, 4), (2, 3), (4, 3), (1, 2),
                        (3, 2), (5, 6), (7, 6), (2, 1), (7, 8), (9, 8))]
U_NEAR = [(Fr(nx, 24), Fr(ny, 8)) for nx in (23, 22, 1, 2)
          for ny in range(4, 13)]
APEXES = U_RIGHT + U_NEAR

TAIL = 1200
CLASS_TOTAL = 60000

classes = {c["id"]: c for c in q.all_classes()}
path = os.path.join(HERE, "factory_raw.json")
out = json.load(open(path))
found = 0
for cid in (sys.argv[1:] or RESIDUE):
    cls = classes[cid]
    total = CLASS_TOTAL
    hit = None
    for U in APEXES:
        res, used = F.try_assemble(cls, U, min(TAIL, total))
        total -= used
        if res is not None:
            hit = res
            print(f"{cid} witness at U={U}", flush=True)
            break
        if total <= 0:
            break
    if hit is not None:
        out[cid] = {"status": "witness", "sc": hit["sc"],
                    "subs": {k: str(v) for k, v in hit["subs"].items()}}
        found += 1
    else:
        print(f"{cid} no-witness (residue4)", flush=True)
with open(path, "w") as f:
    json.dump(out, f, indent=1)
print(f"residue4: {found}/{len(sys.argv[1:] or RESIDUE)} new witnesses")

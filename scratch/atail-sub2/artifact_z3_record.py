#!/usr/bin/env python3
"""Record-only: z3 on the ORIGINAL runs/SUB2_{left,right}.smt2 (omega free,
the 8-variable SUB2). The PROVEN certificate covers these too (below-axis +
oy>=0 give ga, gb >= 0); this run records whether z3 now corroborates.
No conclusion is drawn from unknown."""
import json, os, sys, z3
HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, "..", ".."))
out = {}
for side in ("left", "right"):
    path = os.path.join(REPO, "census", "candidate_d_probe", "runs",
                        f"SUB2_{side}.smt2")
    s = z3.Solver()
    s.set("timeout", 300000)
    s.add(*z3.parse_smt2_file(path))
    r = s.check()
    out[side] = str(r)
    print(f"runs/SUB2_{side}.smt2 (omega free): z3 {r}")
with open(os.path.join(HERE, "artifact_z3_record.json"), "w") as f:
    json.dump(out, f, indent=1)

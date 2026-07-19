#!/usr/bin/env python3
"""Decisive Stage-B probe on the one base with M3 verdicts.

Three parts:

P0 (positive control, rad_ne bites): take an fc-SAT triple, then ADD a
   row_eq forcing one excluded point co-radial with u at the same center.
   That directly contradicts the exclusion rad_ne for that point, so the
   schema MUST flip to UNSAT.  If it stays SAT the exclusion encoding is
   inert and N3=0 would be meaningless; if it flips, N3=0 is a true
   geometric finding (the base simply does not force that co-radiality).

P1 (no_qfree flip rate): over every |M|=3-SAT triple of this base, compare
   fc (Stage A) vs fcq (Stage B) verdict.  Count fc-SAT -> fcq-UNSAT flips.
   A high flip rate means no_qfree is the closure lever; ~0 means the full
   forced row still admits a placement on this base (row obstruction inert).

P2 (per-(u,uc) group deadness under Stage B): a group is row-dead iff EVERY
   triangle is fcq-UNSAT.  Report dead groups; a base with all groups dead
   is CLOSED.  This tells us whether Stage B can close even one base.
"""

import copy
import glob
import json
from collections import defaultdict

from build_l2u_fc import fc_schema
from build_l2u_fcq import fcq_schema
from gate_encoder import check_schema


def parse_m3_id(sid: str):
    head, tail = sid.split(".U.")
    base = head[len("l2m3."):]
    u, _c, uc, _m, tri = tail.split(".")
    return base, u, uc, tuple(tri.split("-"))


def load_m3_sat():
    sat = []
    for f in glob.glob("l2u_m3_ledger_shard*.jsonl"):
        for line in open(f):
            r = json.loads(line)
            if r["verdict"] == "sat":
                sat.append(r["schema_id"])
    return sat


def poison(fc: dict, u: str) -> dict:
    """Force one excluded point co-radial with u -> must contradict rad_ne."""
    out = copy.deepcopy(fc)
    center = out["row_eqs"][0]["center"]
    row = set(out["row_eqs"][0]["members"])
    other = next(p for p in out["points"] if p not in row and p != center)
    out["row_eqs"].append({"name": "poison", "center": center, "members": [u, other]})
    out["id"] = fc["id"] + ".POISON"
    return out


def main() -> None:
    schemas = {s["id"]: s for s in json.load(open("retro_schemas.json"))}
    m3_sat = load_m3_sat()

    out = {"P0": [], "P1": {}, "P2": {}}

    # P0: positive control on the first 5 fc-SAT triples
    p0_pass = True
    for sid in m3_sat[:5]:
        base, u, uc, tri = parse_m3_id(sid)
        fc = fc_schema(schemas[base], u, uc, tri)
        v = check_schema(poison(fc, u))["verdict"]
        ok = v == "unsat"
        p0_pass = p0_pass and ok
        out["P0"].append({"id": sid, "poisoned_verdict": v, "pass": ok})

    # P1/P2: fc vs fcq over every m3-SAT triple of this (one) base
    group_all = defaultdict(list)   # (u,uc) -> [fcq verdicts]
    flips = 0
    n = 0
    for sid in m3_sat:
        base, u, uc, tri = parse_m3_id(sid)
        fcv = check_schema(fc_schema(schemas[base], u, uc, tri))["verdict"]
        fcqv = check_schema(fcq_schema(schemas[base], u, uc, tri))["verdict"]
        if fcv == "sat" and fcqv == "unsat":
            flips += 1
        group_all[(u, uc)].append(fcqv)
        n += 1

    dead_groups = {f"{u}/{uc}": v for (u, uc), v in group_all.items()
                   if all(x == "unsat" for x in v)}
    out["P1"] = {"triples": n, "fc_sat_to_fcq_unsat_flips": flips,
                 "flip_rate": round(flips / n, 4) if n else 0.0}
    out["P2"] = {"groups": len(group_all), "dead_groups": len(dead_groups),
                 "dead_group_keys": sorted(dead_groups)[:40]}

    out["summary"] = {"P0_pass": p0_pass, "P0_count": len(out["P0"]),
                      "P1_flips": flips, "P1_triples": n,
                      "P2_dead_groups": len(dead_groups),
                      "P2_total_groups": len(group_all)}
    json.dump(out, open("probe_l2u_stageb_results.json", "w"), indent=1)
    print(json.dumps(out["summary"], indent=1))
    assert p0_pass, "P0 FAILED: rad_ne exclusion does not bite"


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Analyze the full-class (co-radial + exclusion) census.

Closure logic (DESIGN-L2, Finding 15c): the forced unused critical row is a
4-class through u at a placed center uc != O.  fc adds exactness (support_eq)
to the |M|=3 co-radiality.  A (base, u, uc) group is ROW-DEAD iff EVERY
candidate triangle is fc-UNSAT (no exact 4-class can center at uc through u).
A base is CLOSED iff every (u, uc) group is row-dead.

Also reports the exclusion-flip count: triangles fc-UNSAT whose |M|=3 verdict
was SAT (exclusion added the kill).  Cross-checks soundness: every |M|=3-UNSAT
triangle must stay fc-UNSAT (a tightening cannot revive).
"""

import glob
import json
from collections import defaultdict


def parse_fc(sid: str):
    head, tail = sid.split(".U.")
    base = head[len("l2fc."):]
    u, _c, uc, _m, tri = tail.split(".")
    return base, u, uc, tuple(tri.split("-"))


def parse_m3(sid: str):
    head, tail = sid.split(".U.")
    base = head[len("l2m3."):]
    u, _c, uc, _m, tri = tail.split(".")
    return base, u, uc, tuple(tri.split("-"))


def load_fc():
    v = {}
    for f in glob.glob("l2u_fc_ledger_shard*.jsonl"):
        for line in open(f):
            r = json.loads(line)
            v[r["schema_id"]] = r["verdict"]
    return v


def load_m3():
    v = {}
    for f in glob.glob("l2u_m3_ledger_shard*.jsonl"):
        for line in open(f):
            r = json.loads(line)
            v[(parse_m3(r["schema_id"]))] = r["verdict"]
    return v


def main() -> None:
    fc = load_fc()
    m3 = load_m3()

    groups = defaultdict(list)          # (base,u,uc) -> [verdicts]
    base_groups = defaultdict(set)      # base -> set of (u,uc)
    n_unsat = flips = sound_viol = 0

    for sid, verd in fc.items():
        base, u, uc, tri = parse_fc(sid)
        groups[(base, u, uc)].append(verd)
        base_groups[base].add((u, uc))
        if verd == "unsat":
            n_unsat += 1
            if m3.get((base, u, uc, tri)) == "sat":
                flips += 1
        # soundness: m3-UNSAT must stay fc-UNSAT
        if m3.get((base, u, uc, tri)) == "unsat" and verd != "unsat":
            sound_viol += 1

    dead_groups = {k: v for k, v in groups.items()
                   if all(x == "unsat" for x in v)}
    dead_by_base = defaultdict(int)
    for (base, u, uc) in dead_groups:
        dead_by_base[base] += 1
    closed = [b for b, gs in base_groups.items()
              if all((u, uc) in dead_groups for (u, uc) in gs)]

    out = {
        "total_rows": len(fc),
        "unsat_rows": n_unsat,
        "kill_rate": round(n_unsat / len(fc), 4) if fc else 0.0,
        "exclusion_flips_m3sat_to_fcunsat": flips,
        "soundness_violations_m3unsat_revived": sound_viol,
        "total_groups": len(groups),
        "dead_groups": len(dead_groups),
        "bases": len(base_groups),
        "closed_bases": len(closed),
        "closed_base_ids": closed[:20],
        "dead_group_sample": [f"{b}|{u}|{uc}" for (b, u, uc) in
                              list(dead_groups)[:30]],
    }
    json.dump(out, open("l2u_fc_closure.json", "w"), indent=1)
    print(json.dumps({k: out[k] for k in
                      ["total_rows", "unsat_rows", "kill_rate",
                       "exclusion_flips_m3sat_to_fcunsat",
                       "soundness_violations_m3unsat_revived",
                       "total_groups", "dead_groups", "bases",
                       "closed_bases"]}, indent=1))


if __name__ == "__main__":
    main()

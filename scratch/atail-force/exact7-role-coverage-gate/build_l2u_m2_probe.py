#!/usr/bin/env python3
"""L2u |M|=2 probe: joint co-radiality of member PAIRS (REPORT item 10c).

The forced unused critical row (DESIGN-L2.md) is a full 4-class through the
unused point u at a placed center uc != O: support_card = 4, i.e. u plus
THREE named members all co-radial from uc.  The |M|=1 probe
(l2u_probe_ledger) gave, per (base, u, uc), the set of members individually
co-radial with u (5-15 per group, median 12) — so no group is row-dead on
single-tooth grounds.

This probe adds the JOINT constraint: for every unordered pair {m1, m2} of
individually-compatible members, is {u, m1, m2} jointly co-radial from uc
(row_eqs members [u, m1, m2])?  A kill means the pair cannot coexist in the
row.  The kills are edges REMOVED from the compatibility graph on the
individually-compatible members; the forced row needs a triangle (3
mutually-coexisting members), so a (u, uc) whose graph is triangle-free is
row-dead, and a base whose every (u, uc) is triangle-free is CLOSED.

Only pairs among the |M|=1-SAT members are built (a pair with an
individually-killed member is already dead a fortiori — no new information).
"""

import copy
import glob
import json
from collections import defaultdict

from build_l2u_probe import FRESH_BAGS, bag_block_index, reverse_row_members


def sat_members():
    """(base, u, uc) -> sorted list of |M|=1-SAT members."""
    sat = defaultdict(set)
    for f in glob.glob("l2u_probe_ledger_shard*.jsonl"):
        for line in open(f):
            r = json.loads(line)
            head, tail = r["schema_id"].split(".U.")
            base = head[len("l2u."):]
            u, _, uc, _, m = tail.split(".")
            if r["verdict"] == "sat":
                sat[(base, u, uc)].add(m)
    return {k: sorted(v) for k, v in sat.items()}


def m2_schema(base: dict, u: str, uc: str, m1: str, m2: str) -> dict:
    out = copy.deepcopy(base)
    center = uc
    if uc in FRESH_BAGS:
        center = "uc"
        out["points"] = out["points"] + [center]
        out["blocks"][bag_block_index(out, FRESH_BAGS[uc])]["points"].append(center)
    out["row_eqs"] = [{"name": "unu", "center": center, "members": [u, m1, m2]}]
    out["id"] = f"l2m2.{base['id']}.U.{u}.C.{uc}.M.{m1}-{m2}"
    out["timeout_ms"] = 600_000
    return out


def main() -> None:
    schemas = {s["id"]: s for s in json.load(open("retro_schemas.json"))}
    sat = sat_members()
    built, skipped = [], 0
    for (base_id, u, uc), members in sat.items():
        base = schemas[base_id]
        rows = reverse_row_members(base)
        row = rows.get(uc, set())  # citation-dead members already SAT-filtered out
        for i in range(len(members)):
            for j in range(i + 1, len(members)):
                m1, m2 = members[i], members[j]
                if m1 in row or m2 in row:
                    skipped += 1
                    continue
                built.append(m2_schema(base, u, uc, m1, m2))
    assert len({s["id"] for s in built}) == len(built)
    json.dump(built, open("l2u_m2_probe_schemas.json", "w"))
    print(f"built {len(built)} |M|=2 probe schemas ({skipped} citation-skipped)")


if __name__ == "__main__":
    main()

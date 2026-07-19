#!/usr/bin/env python3
"""Scale the L2u structural kill patterns to all 876 retro survivors.

Probe result (l2u_probe_kills.json): base-independent pure-equality cores
for (u=b0,uc=s0,m=s1) and (u=b1,uc=s2,m=s1) killed 12/12 sampled bases;
(u=b0,uc=s0/s1,m=O) killed exactly the r0-O-carrying samples.  This sweep
runs the two universal candidates plus the full O-coupling family
u in {b0,b1} x uc in {s0,s1,s2} x m=O over every survivor, so r1/r2
O-carrier variants can surface.  Dead-by-citation branches (m a member of
the reverse row centered at uc) are skipped per schema, as in the probe.
"""

import gzip
import json

from build_l2u_probe import probe_schema, reverse_row_members

PATTERNS = [
    ("b0", "s0", "s1"),
    ("b1", "s2", "s1"),
] + [(u, uc, "O") for u in ("b0", "b1") for uc in ("s0", "s1", "s2")]


def survivors() -> list[str]:
    out = []
    with gzip.open("retro_ledger.jsonl.gz", "rt") as fh:
        for line in fh:
            row = json.loads(line)
            if row["verdict"] == "sat":
                out.append(row["schema_id"])
    return sorted(out)


def main() -> None:
    schemas = {s["id"]: s for s in json.load(open("retro_schemas.json"))}
    built, skipped = [], 0
    for sid in survivors():
        base = schemas[sid]
        rows = reverse_row_members(base)
        for u, uc, m in PATTERNS:
            if uc in rows and m in rows[uc]:
                skipped += 1
                continue
            if u in rows.get(uc, set()):
                skipped += 1
                continue
            built.append(probe_schema(base, u, uc, m))
    assert len({s["id"] for s in built}) == len(built)
    json.dump(built, open("l2u_scale_schemas.json", "w"))
    print(f"built {len(built)} scale schemas ({skipped} skipped by citation)")


if __name__ == "__main__":
    main()

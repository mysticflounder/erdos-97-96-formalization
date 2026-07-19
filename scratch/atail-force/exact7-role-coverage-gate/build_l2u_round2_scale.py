#!/usr/bin/env python3
"""Scale the L2u round-2 kill candidates to all 876 retro survivors.

Probe result (l2u_round2_kills.json): 20 (u, uc, m) patterns killed all
12/12 sample bases; 2 more (u=O, m=b0) killed exactly the 4 O-carrier
samples (conditional-law candidates, the round-1 O-coupling analogue).

- (O, s0, s1) and (O, s2, s1) are PURE-EQUALITY universal candidates
  whose cores are the already-ported three-center chain
  (false_of_mutualClassPair_sharedMember_thirdClassExcludes).
- The 18 p2a/p2b patterns are Kalmanson-cored (order-coupled) — scaled
  for coverage; Lean shape assessed after the law statements are exact.

Skips: citation branches (u or m on uc's reverse row) as in round 1,
plus patterns whose points are absent in a schema (p2 merges).
"""

import json

from build_l2u_probe import probe_schema, reverse_row_members

PATTERNS = [
    ("O", "s0", "s1"),
    ("O", "s2", "s1"),
    ("O", "s0", "b0"),
    ("O", "s1", "b0"),
] + [
    (u, uc, m)
    for u in ("p2a", "p2b")
    for uc, m in [
        ("EA", "s0"), ("W", "s2"), ("b0", "s2"), ("b1", "s0"),
        ("s0", "s1"), ("s0", "s2"), ("s2", "s0"), ("s2", "s1"),
    ]
] + [("p2a", "p2b", "s1"), ("p2b", "p2a", "s1")]


def survivors() -> list[str]:
    import gzip
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
        points = set(base["points"])
        rows = reverse_row_members(base)
        for u, uc, m in PATTERNS:
            if not {u, uc, m} <= points:
                skipped += 1
                continue
            row = rows.get(uc, set())
            if u in row or m in row:
                skipped += 1
                continue
            built.append(probe_schema(base, u, uc, m))
    assert len({s["id"] for s in built}) == len(built)
    json.dump(built, open("l2u_round2_scale_schemas.json", "w"))
    print(f"built {len(built)} round-2 scale schemas ({skipped} skipped)")


if __name__ == "__main__":
    main()

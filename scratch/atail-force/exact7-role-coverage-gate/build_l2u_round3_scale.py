#!/usr/bin/env python3
"""Scale the L2u round-3 kill candidates (e/p0/p1 through-points).

Round-2 probe evidence (l2u_round2_ledger.jsonl.gz, 12 stratified
bases): every pattern below killed ALL its buildable probe samples.
Selection rule: probe denominator >= 4, or >= 2 when the through-point
or center is an e-point (e2 exists in only 219 bases, e1 in 657, so
probe denominators are structurally small there).

Same builder contract as rounds 1-2 (build_l2u_probe.probe_schema,
unchanged encoder): skip citation branches (u or m on uc's reverse
row) and patterns with absent points.
"""

import json

from build_l2u_probe import probe_schema, reverse_row_members

PATTERNS = [
    ("e1", "e2", "s0"),
    ("e1", "e2", "s1"),
    ("e1", "e2", "s2"),
    ("e2", "b1", "s0"),
    ("e2", "e1", "s0"),
    ("e2", "e1", "s1"),
    ("e2", "e1", "s2"),
    ("e2", "EA", "s0"),
    ("e2", "EA", "s1"),
    ("e2", "EA", "s2"),
    ("e2", "s2", "s0"),
    ("e2", "s2", "s1"),
    ("p0a", "b1", "s0"),
    ("p0a", "e2", "s1"),
    ("p0a", "e2", "s2"),
    ("p0a", "EA", "s0"),
    ("p0a", "p0b", "s1"),
    ("p0a", "p0b", "s2"),
    ("p0a", "p0b+p1b", "s0"),
    ("p0a", "p0b+p1b", "s1"),
    ("p0a", "p1a", "s1"),
    ("p0a", "p1b", "s1"),
    ("p0a", "p1b", "s2"),
    ("p0a", "p2a", "s1"),
    ("p0a", "p2b", "s1"),
    ("p0a", "s0", "s1"),
    ("p0a", "s0", "s2"),
    ("p0a", "s2", "s0"),
    ("p0a", "W", "s1"),
    ("p0a", "W", "s2"),
    ("p0a+p1a", "e1", "s1"),
    ("p0a+p1a", "EA", "O"),
    ("p0a+p1a", "EA", "s0"),
    ("p0a+p1a", "EA", "s1"),
    ("p0a+p1a", "p1b", "s1"),
    ("p0a+p1a", "p1b", "s2"),
    ("p0a+p1a", "p2a", "s1"),
    ("p0a+p1a", "p2a", "s2"),
    ("p0a+p1a", "p2b", "s1"),
    ("p0a+p1a", "p2b", "s2"),
    ("p0a+p1a", "s0", "O"),
    ("p0a+p1a", "s0", "s1"),
    ("p0a+p1a", "s0", "s2"),
    ("p0a+p1a", "s1", "O"),
    ("p0a+p1a", "s2", "O"),
    ("p0a+p1a", "s2", "s0"),
    ("p0a+p1a", "s2", "s1"),
    ("p0a+p1a", "W", "O"),
    ("p0a+p1a", "W", "s1"),
    ("p0a+p1a", "W", "s2"),
    ("p0b", "b1", "s0"),
    ("p0b", "EA", "s0"),
    ("p0b", "p0a", "s1"),
    ("p0b", "p0a", "s2"),
    ("p0b", "p1a", "s1"),
    ("p0b", "p1a", "s2"),
    ("p0b", "p1b", "s1"),
    ("p0b", "p1b", "s2"),
    ("p0b", "p2a", "s1"),
    ("p0b", "p2a", "s2"),
    ("p0b", "p2b", "s1"),
    ("p0b", "p2b", "s2"),
    ("p0b", "s0", "s1"),
    ("p0b", "s0", "s2"),
    ("p0b", "s2", "s0"),
    ("p0b", "W", "s1"),
    ("p0b", "W", "s2"),
    ("p0b+p1b", "e1", "s1"),
    ("p0b+p1b", "EA", "O"),
    ("p0b+p1b", "EA", "s0"),
    ("p0b+p1b", "EA", "s1"),
    ("p0b+p1b", "p0a", "s0"),
    ("p0b+p1b", "p0a", "s1"),
    ("p0b+p1b", "p1a", "s0"),
    ("p0b+p1b", "p1a", "s1"),
    ("p0b+p1b", "p2a", "s0"),
    ("p0b+p1b", "p2a", "s1"),
    ("p0b+p1b", "p2b", "s0"),
    ("p0b+p1b", "p2b", "s1"),
    ("p0b+p1b", "s0", "s1"),
    ("p0b+p1b", "s0", "s2"),
    ("p0b+p1b", "s2", "s0"),
    ("p0b+p1b", "s2", "s1"),
    ("p0b+p1b", "W", "s1"),
    ("p0b+p1b", "W", "s2"),
    ("p1a", "b0", "s2"),
    ("p1a", "e2", "s2"),
    ("p1a", "EA", "s0"),
    ("p1a", "EA", "s1"),
    ("p1a", "p0a", "s1"),
    ("p1a", "p0b", "s1"),
    ("p1a", "p0b", "s2"),
    ("p1a", "p0b+p1b", "s0"),
    ("p1a", "p0b+p1b", "s1"),
    ("p1a", "p1b", "s1"),
    ("p1a", "p1b", "s2"),
    ("p1a", "p2a", "s1"),
    ("p1a", "p2b", "s1"),
    ("p1a", "s0", "s2"),
    ("p1a", "s2", "s0"),
    ("p1a", "s2", "s1"),
    ("p1a", "W", "s2"),
    ("p1b", "b0", "s2"),
    ("p1b", "e1", "s1"),
    ("p1b", "e2", "s1"),
    ("p1b", "e2", "s2"),
    ("p1b", "EA", "s0"),
    ("p1b", "EA", "s1"),
    ("p1b", "p0a", "s1"),
    ("p1b", "p0a", "s2"),
    ("p1b", "p0a+p1a", "s1"),
    ("p1b", "p0a+p1a", "s2"),
    ("p1b", "p0b", "s1"),
    ("p1b", "p0b", "s2"),
    ("p1b", "p1a", "s1"),
    ("p1b", "p1a", "s2"),
    ("p1b", "p2a", "s1"),
    ("p1b", "p2a", "s2"),
    ("p1b", "p2b", "s1"),
    ("p1b", "p2b", "s2"),
    ("p1b", "s0", "s1"),
    ("p1b", "s0", "s2"),
    ("p1b", "s2", "s0"),
    ("p1b", "s2", "s1"),
    ("p1b", "W", "s1"),
    ("p1b", "W", "s2"),
]


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
    json.dump(built, open("l2u_round3_scale_schemas.json", "w"))
    print(f"built {len(built)} round-3 scale schemas ({skipped} skipped)")


if __name__ == "__main__":
    main()

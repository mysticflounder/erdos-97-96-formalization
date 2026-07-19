#!/usr/bin/env python3
"""Build the L2u round-2 probe: unused-row equalities through the
generalized carrier points.

Round 1 (Finding 13) probed the Q1 cap candidates {EA, W, b0, b1}.  The
shell system supplies a critical row through EVERY carrier point with
centerAt != O (DESIGN-L2.md "Stronger" note: class(O) keeps >= 4 members
under any single deletion, so K4 at O survives while no_qfree fails at
the blocker center; for u = O the center is in A.erase O outright).
Round 2 probes the remaining through-points u in {O, e1, e2, p*} present
in each schema.

Restrictions carried from the round-1 kill evidence (REPORT item 10):
- m ranges over closed-cap points + O only — every round-1 structural
  core had m in {s1, O}, and citation kills had u, m both closed-cap;
- uc ranges over named points minus {O, u} — fresh centers are provably
  toothless (Q2), so round 2 has no fresh-bag variants.

Dead-by-citation branches (u or m a member of the reverse row centered
at uc) are skipped as in round 1; smoke gate N3 verifies one by hand.

Stratified sample: the same 12 bases as round 1 (build_l2u_probe.sample_ids).
"""

import json

from build_l2u_probe import probe_schema, reverse_row_members, sample_ids

CAP_M = ["EA", "s0", "b0", "s1", "b1", "s2", "W", "O"]


def u_candidates(schema: dict) -> list[str]:
    return [p for p in schema["points"] if p == "O" or p[0] in ("e", "p")]


def patterns(schema: dict) -> tuple[list[tuple[str, str, str]], int]:
    rows = reverse_row_members(schema)
    out, skipped = [], 0
    for u in u_candidates(schema):
        for uc in [p for p in schema["points"] if p not in ("O", u)]:
            row = rows.get(uc, set())
            if u in row:
                skipped += len([m for m in CAP_M if m not in (u, uc)])
                continue
            for m in CAP_M:
                if m in (u, uc):
                    continue
                if m in row:
                    skipped += 1
                    continue
                out.append((u, uc, m))
    return out, skipped


def main() -> None:
    schemas = {s["id"]: s for s in json.load(open("retro_schemas.json"))}
    built, skipped = [], 0
    for sid in sample_ids():
        base = schemas[sid]
        pats, skip = patterns(base)
        skipped += skip
        for u, uc, m in pats:
            built.append(probe_schema(base, u, uc, m))
    assert len({s["id"] for s in built}) == len(built)
    json.dump(built, open("l2u_round2_schemas.json", "w"))
    by_base: dict[str, int] = {}
    for s in built:
        key = s["id"].split(".U.")[0]
        by_base[key] = by_base.get(key, 0) + 1
    print(f"built {len(built)} round-2 probe schemas over {len(by_base)} bases "
          f"({skipped} skipped by citation)")
    for k, v in sorted(by_base.items()):
        print(f"  {k}: {v}")


if __name__ == "__main__":
    main()

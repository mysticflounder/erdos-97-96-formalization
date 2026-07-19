#!/usr/bin/env python3
"""Build the L2u probe: bare named-part equalities of the unused critical row.

The unused row (DESIGN-L2.md) is a full 4-class through the unused point u
at a placed center uc != O.  Its only candidate teeth (Finding 12 / Law C)
are the equalities d(uc,u) = d(uc,m) with m named.  A bare single equality
is the factored named-part with |M| = 1: if it is UNSAT on a base schema,
every completion of the row containing m dies a fortiori (l1f logic).

Pattern space per schema:
- u: unused-point candidates by e-pattern (Q1 table in DESIGN-L2.md);
- uc named: schema points minus {O, u};
- uc fresh: one new point in the S-bag ("fS") or O1-bag ("fO1");
- m: schema points minus {u, uc}; m = O allowed.

Dead-by-citation branches are skipped, not censused: when uc is a reverse
row's center (b0/b1/s1), any m in that row's members forces d(uc,u) onto
the row radius against the row's exactness exclude of u
(U5QDeletedK4Class.inter_card_le_two / same-center-distinct-radius
disjointness) — smoke N1/N3 verify two such branches are UNSAT as built.

Stratified sample: per e-pattern 2 hard-core (no-O-row) + 1 O-carrier
survivor, deterministic picks.
"""

import copy
import gzip
import json

U_CANDIDATES = {
    "eS-O1": ["EA", "W", "b0", "b1"],
    "eS-W": ["EA", "b0", "b1"],
    "eO1-EA": ["W", "b0", "b1"],
    "eEA-W": ["b0", "b1"],
}

FRESH_BAGS = {"fS": "S", "fO1": "O1"}


def e_pattern(sid: str) -> str:
    return sid.split(".")[2]


def survivors() -> list[str]:
    out = []
    with gzip.open("retro_ledger.jsonl.gz", "rt") as fh:
        for line in fh:
            row = json.loads(line)
            if row["verdict"] == "sat":
                out.append(row["schema_id"])
    return sorted(out)


def sample_ids() -> list[str]:
    hard_core = set(
        json.load(open("l1f_coverage_summary.json"))["retro_no_factored_kill"]
    )
    picks = []
    for pattern in U_CANDIDATES:
        hc = [s for s in survivors() if e_pattern(s) == pattern and s in hard_core]
        oc = [s for s in survivors() if e_pattern(s) == pattern and s not in hard_core]
        assert hc and oc, pattern
        picks.append(hc[0])
        picks.append(hc[-1])
        merged = [s for s in oc if ".m" in s]
        picks.append(merged[0] if merged else oc[0])
    assert len(picks) == len(set(picks)) == 12
    return picks


def bag_block_index(schema: dict, arc: str) -> int:
    # Block layout is uniform: [EA][S-bag][O][O1-bag][W][interior chain].
    ordered = [b.get("ordered", True) for b in schema["blocks"]]
    assert ordered == [True, False, True, False, True, True], schema["id"]
    return 1 if arc == "S" else 3


def probe_schema(base: dict, u: str, uc: str, m: str) -> dict:
    out = copy.deepcopy(base)
    center = uc
    if uc in FRESH_BAGS:
        center = "uc"
        out["points"] = out["points"] + [center]
        out["blocks"][bag_block_index(out, FRESH_BAGS[uc])]["points"].append(center)
    out["row_eqs"] = [{"name": "unu", "center": center, "members": [u, m]}]
    out["id"] = f"l2u.{base['id']}.U.{u}.C.{uc}.M.{m}"
    out["timeout_ms"] = 600_000
    return out


def reverse_row_members(schema: dict) -> dict:
    return {
        cls["center"]: set(cls["members"])
        for cls in schema["exact_classes"]
        if cls["center"] != "O"
    }


def patterns(schema: dict) -> list[tuple[str, str, str]]:
    points = schema["points"]
    rows = reverse_row_members(schema)
    out = []
    for u in U_CANDIDATES[e_pattern(schema["id"])]:
        assert u in points
        for uc in [p for p in points if p not in ("O", u)] + list(FRESH_BAGS):
            for m in points:
                if m in (u, uc):
                    continue
                if uc in rows and m in rows[uc]:
                    continue  # dead by citation: same-center distinct-radius
                out.append((u, uc, m))
    return out


def main() -> None:
    schemas = {s["id"]: s for s in json.load(open("retro_schemas.json"))}
    built = []
    for sid in sample_ids():
        base = schemas[sid]
        for u, uc, m in patterns(base):
            built.append(probe_schema(base, u, uc, m))
    assert len({s["id"] for s in built}) == len(built)
    json.dump(built, open("l2u_probe_schemas.json", "w"))
    by_base = {}
    for s in built:
        by_base.setdefault(s["id"].split(".U.")[0], 0)
        by_base[s["id"].split(".U.")[0]] += 1
    print(f"built {len(built)} probe schemas over {len(by_base)} bases")
    for k, v in sorted(by_base.items()):
        print(f"  {k}: {v}")


if __name__ == "__main__":
    main()

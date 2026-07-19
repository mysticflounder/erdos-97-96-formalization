#!/usr/bin/env python3
"""Smoke gates for the L2u round-2 probe (known-verdict validation).

The encoder and probe_schema are unchanged from round 1 (already
smoke-gated); the new inputs are u in {O, e*, p*} as members[0] of the
probed row equality.  Members [x, y] and [y, x] encode the same single
equality d(uc, x) = d(uc, y), so round-1 recorded verdicts give known
results for round-2-shaped branches:

- N1 swap-consistency (recorded verdict): round-2 branch
  (u=O, uc=s0, m=EA) must match round-1 probe verdict for
  (u=EA, uc=s0, m=O) on the same base.
- N2 swap-consistency (known UNSAT): (u=s1, uc=s0, m=b0) must be UNSAT
  on any survivor — round-1 scale killed (b0, s0, s1) on all 876
  (Law U1).  u=s1 is not a round-2 candidate; this validates the swap
  symmetry on the unsat polarity.
- N3 citation chain with u=O (known UNSAT): on an O-in-r0 carrier,
  (u=O, uc=b0, m=EA) forces EA onto r0's radius against r0's exactness
  exclude.  The builder SKIPS these branches (u in rows[uc]); built by
  hand here as in round-1 smoke N1.
"""

import gzip
import json

from build_l2u_probe import probe_schema, reverse_row_members
from gate_encoder import check_schema

BASE_ID = "retro.L0.eS-O1.r0S-S.r1S-S.r2O1-O1"


def recorded_swap_target() -> tuple[str, str]:
    """First round-1 probe branch (u=EA, uc=s0, m=O): (base_id, verdict)."""
    with gzip.open("l2u_probe_ledger.jsonl.gz", "rt") as fh:
        for line in fh:
            row = json.loads(line)
            if row["schema_id"].endswith(".U.EA.C.s0.M.O"):
                base = row["schema_id"].removeprefix("l2u.").removesuffix(
                    ".U.EA.C.s0.M.O")
                return base, row["verdict"]
    raise RuntimeError("no (EA, s0, O) branch in the round-1 probe ledger")


def first_o_in_r0_survivor(schemas: dict) -> dict:
    with gzip.open("retro_ledger.jsonl.gz", "rt") as fh:
        for line in fh:
            row = json.loads(line)
            if row["verdict"] != "sat":
                continue
            base = schemas[row["schema_id"]]
            if "O" in reverse_row_members(base).get("b0", set()):
                return base
    raise RuntimeError("no O-in-r0 survivor found")


def main() -> None:
    schemas = {s["id"]: s for s in json.load(open("retro_schemas.json"))}
    results = {}
    ok = True

    swap_base, want1 = recorded_swap_target()
    v1 = check_schema(probe_schema(schemas[swap_base], "O", "s0", "EA"))
    pass1 = v1["verdict"] == want1
    results["N1_swap_matches_round1"] = {
        "base": swap_base, "verdict": v1["verdict"],
        "expected": want1, "pass": pass1}
    ok &= pass1

    v2 = check_schema(probe_schema(schemas[BASE_ID], "s1", "s0", "b0"))
    pass2 = v2["verdict"] == "unsat"
    results["N2_swap_lawU1_unsat"] = {
        "verdict": v2["verdict"], "core": v2.get("core", []), "pass": pass2}
    ok &= pass2

    carrier = first_o_in_r0_survivor(schemas)
    v3 = check_schema(probe_schema(carrier, "O", "b0", "EA"))
    core3 = v3.get("core", [])
    pass3 = (
        v3["verdict"] == "unsat"
        and any(name.startswith("row_eq|unu|") for name in core3)
    )
    results["N3_citation_u_O"] = {
        "base": carrier["id"], "verdict": v3["verdict"],
        "core": core3, "pass": pass3}
    ok &= pass3

    json.dump(results, open("smoke_l2u_round2_results.json", "w"), indent=1)
    for name, r in results.items():
        print(name, "PASS" if r["pass"] else "FAIL", r["verdict"])
    print("ALL PASS" if ok else "SMOKE FAILURE")
    raise SystemExit(0 if ok else 1)


if __name__ == "__main__":
    main()

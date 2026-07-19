#!/usr/bin/env python3
"""Smoke gate for the L2u round-3 scale (known-verdict validation).

The encoder and probe_schema are unchanged from rounds 1-2 (already
smoke-gated).  Round 3 only widens the pattern list, so the known
results are the round-2 probe's recorded verdicts on the SAME branch
ids: rebuild the first recorded branch for three round-3 patterns
(one p0, one p1, one e2 through-point) and require identical verdicts.
"""

import gzip
import json

from build_l2u_probe import probe_schema
from gate_encoder import check_schema

TARGETS = [("p0a", "EA", "s0"), ("p1b", "W", "s2"), ("e2", "EA", "s1")]


def recorded(u: str, uc: str, m: str) -> tuple[str, str]:
    suffix = f".U.{u}.C.{uc}.M.{m}"
    with gzip.open("l2u_round2_ledger.jsonl.gz", "rt") as fh:
        for line in fh:
            row = json.loads(line)
            if row["schema_id"].endswith(suffix):
                base = row["schema_id"].removeprefix("l2u.").removesuffix(suffix)
                return base, row["verdict"]
    raise RuntimeError(f"no recorded branch for {(u, uc, m)}")


def main() -> None:
    schemas = {s["id"]: s for s in json.load(open("retro_schemas.json"))}
    results, ok = {}, True
    for u, uc, m in TARGETS:
        base, want = recorded(u, uc, m)
        got = check_schema(probe_schema(schemas[base], u, uc, m))["verdict"]
        ok &= got == want
        results[f"{u},{uc},{m}"] = {
            "base": base, "verdict": got, "expected": want,
            "pass": got == want}
    json.dump(results, open("smoke_l2u_round3_results.json", "w"), indent=1)
    for name, r in results.items():
        print(name, "PASS" if r["pass"] else "FAIL", r["verdict"])
    print("ALL PASS" if ok else "SMOKE FAILURE")
    raise SystemExit(0 if ok else 1)


if __name__ == "__main__":
    main()

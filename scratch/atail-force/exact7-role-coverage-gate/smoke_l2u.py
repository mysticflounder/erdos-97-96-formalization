#!/usr/bin/env python3
"""Smoke gates for the L2u probe builder (known-verdict validation).

- N1 UNSAT (citation chain): uc = b0, u = EA, m = s1 on a hard-core
  survivor.  s1 is an r0 member, so d(b0,EA) = d(b0,s1) = r0 radius
  contradicts r0's exactness exclude of EA.  These branches are SKIPPED
  by the builder (dead by citation); built by hand here to verify the
  chain fires with exactly that core shape.
- N2 UNSAT (citation chain, p-point): uc = b0, u = EA, m = p0b.
- N3 SAT (fresh-center structure): uc fresh in the S-bag with a single
  equality d(uc,EA) = d(uc,e1) — fresh bag point with one equality must
  extend (Finding 8/12 analogue); also checks the point/blocks/Kalmanson
  wiring for the added point.
"""

import json

from build_l2u_probe import probe_schema
from gate_encoder import check_schema

BASE_ID = "retro.L0.eS-O1.r0S-S.r1S-S.r2O1-O1"


def main() -> None:
    schemas = {s["id"]: s for s in json.load(open("retro_schemas.json"))}
    base = schemas[BASE_ID]
    results = {}
    ok = True

    v1 = check_schema(probe_schema(base, "EA", "b0", "s1"))
    core1 = v1.get("core", [])
    pass1 = (
        v1["verdict"] == "unsat"
        and any(name.startswith("row_eq|unu|") for name in core1)
        and any(name.startswith("cls_ne|b0|EA") or name.startswith("cls_eq|b0|") for name in core1)
    )
    results["N1_citation_s1"] = {"verdict": v1["verdict"], "core": core1, "pass": pass1}
    ok &= pass1

    v2 = check_schema(probe_schema(base, "EA", "b0", "p0b"))
    pass2 = v2["verdict"] == "unsat"
    results["N2_citation_p0b"] = {"verdict": v2["verdict"], "core": v2.get("core", []), "pass": pass2}
    ok &= pass2

    s3 = probe_schema(base, "EA", "fS", "e1")
    assert "uc" in s3["points"] and "uc" in s3["blocks"][1]["points"]
    v3 = check_schema(s3)
    pass3 = v3["verdict"] == "sat"
    results["N3_fresh_center_sat"] = {"verdict": v3["verdict"], "pass": pass3}
    ok &= pass3

    json.dump(results, open("smoke_l2u_results.json", "w"), indent=1)
    for name, r in results.items():
        print(name, "PASS" if r["pass"] else "FAIL", r["verdict"])
    print("ALL PASS" if ok else "SMOKE FAILURE")
    raise SystemExit(0 if ok else 1)


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Smoke gates for the ``no_k4`` encoder family (L2n layer).

Validates the encoding against constructed known results before any census
run (solver policy):

- N1 UNSAT: a 4-point co-radial row at center c avoiding u, plus
  no_k4(c, avoid=[u]) — the nok4 quad must fire; core must contain a nok4
  label and the row_eq labels.
- N2 SAT: same schema with only 3 co-radial points — no complete quad
  avoiding u, so no_k4 is inert.
- N3 SAT (exemption): 4 co-radial points INCLUDING u — every co-radial
  quad meets ``avoid``, so no_k4 says nothing about it.
- N4 regression: a real retro survivor with no ``no_k4`` field encodes to
  the same verdict as before (field absent == old behavior).
"""

import json

from gate_encoder import check_schema


def base_schema(members: list[str]) -> dict:
    return {
        "id": f"smoke_l2n.{'_'.join(members)}",
        "points": ["c", "u", "a", "b", "d", "f"],
        "blocks": [{"points": ["c", "u", "a", "b", "d", "f"], "ordered": False}],
        "row_eqs": [{"name": "w4", "center": "c", "members": members}],
        "no_k4": [{"center": "c", "avoid": ["u"]}],
    }


def main() -> None:
    results = {}
    ok = True

    v1 = check_schema(base_schema(["a", "b", "d", "f"]))
    core1 = v1.get("core", [])
    pass1 = (
        v1["verdict"] == "unsat"
        and any(name.startswith("nok4|c|") for name in core1)
        and any(name.startswith("row_eq|w4|") for name in core1)
    )
    results["N1_quad_fires_unsat"] = {"verdict": v1["verdict"], "core": core1, "pass": pass1}
    ok &= pass1

    v2 = check_schema(base_schema(["a", "b", "d"]))
    pass2 = v2["verdict"] == "sat"
    results["N2_three_coradial_sat"] = {"verdict": v2["verdict"], "pass": pass2}
    ok &= pass2

    v3 = check_schema(base_schema(["u", "a", "b", "d"]))
    pass3 = v3["verdict"] == "sat"
    results["N3_avoid_exempt_sat"] = {"verdict": v3["verdict"], "pass": pass3}
    ok &= pass3

    schemas = {s["id"]: s for s in json.load(open("retro_schemas.json"))}
    survivor = schemas["retro.L0.eS-O1.r0S-S.r1S-S.r2O1-O1"]
    v4 = check_schema(survivor)
    pass4 = v4["verdict"] == "sat"
    results["N4_retro_regression_sat"] = {"verdict": v4["verdict"], "pass": pass4}
    ok &= pass4

    json.dump(results, open("smoke_l2n_results.json", "w"), indent=1)
    for name, r in results.items():
        print(name, "PASS" if r["pass"] else "FAIL", r["verdict"])
    print("ALL PASS" if ok else "SMOKE FAILURE")
    raise SystemExit(0 if ok else 1)


if __name__ == "__main__":
    main()

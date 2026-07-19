#!/usr/bin/env python3
"""Smoke gates for the L1 additions (DESIGN-L1.md step 1).

- H  e-pattern kill: both exact-five extras in the O1 bag; the O-opp1
     one-hit family must close it with the exact 3-label core;
- I  row surplus one-hit: a retained row with one S-bag completion and one
     completion landed on O (both closed-surplus) must die with the exact
     3-label core;
- J1 radius_rel "ne" on two EA-rows sharing a member: UNSAT, 2-label core;
- J2 radius_rel "eq" on the same rows: SAT;
- K  fixture region audit (no Z3): every radius fiber of the 15-point
     incidence fixture meets each apex-adjacent closed cap at most once,
     and the fixture's e-pattern is one of the four one-hit survivors;
- L  smoke-A schema (full fixture, fixed order) + region families: still
     UNSAT (families are sound additions, core unpinned);
- M  smoke-B schema (named-forced, de-accidented) + region families: the
     schema's e-pattern is SS (extras 5 and eb both in the surplus arc),
     so the O-surplus one-hit family must now kill it with the exact
     3-label core.  B stays SAT without the families (smoke_fixture.py
     regression), so this pins exactly the new teeth.
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(HERE.parent / "exact7-global-coradial-producer"))

import verify_global_marginal_countermodel as fixture  # noqa: E402
from gate_encoder import check_schema  # noqa: E402
from regions import SITE_REGIONS, onehit_rad_ne  # noqa: E402
from smoke_fixture import (  # noqa: E402
    OPP1_ARC,
    SURPLUS_ARC,
    FRESH_EXTRA,
    fixture_schema,
    named_schema,
)

NAMED = ["EA", "O", "W", "s0", "b0", "s1", "b1", "s2"]
NAMED_SITES = {p: p for p in NAMED}


def named_blocks(s_bag: list[str], o1_bag: list[str]) -> list[dict]:
    return [
        {"points": ["EA"], "ordered": True},
        {"points": s_bag, "ordered": False},
        {"points": ["O"], "ordered": True},
        {"points": o1_bag, "ordered": False},
        {"points": ["W"], "ordered": True},
        {"points": ["s0", "b0", "s1", "b1", "s2"], "ordered": True},
    ]


def schema_h() -> dict:
    placement = dict(NAMED_SITES) | {"e1": "O1", "e2": "O1"}
    points = NAMED + ["e1", "e2"]
    members = ["s0", "s1", "s2", "e1", "e2"]
    return {
        "id": "H_epattern_O1O1",
        "points": points,
        "blocks": named_blocks([], ["e1", "e2"]),
        "exact_classes": [
            {
                "center": "O",
                "members": members,
                "exclude": sorted(set(points) - {"O"} - set(members)),
            }
        ],
        "rad_ne": onehit_rad_ne(placement),
    }


EXPECTED_H_CORE = ["cls_eq|O|e1", "cls_eq|O|e2", "rad_ne|O|e1,e2"]


def schema_i() -> dict:
    placement = dict(NAMED_SITES) | {"q": "O1", "w": "O1", "c1": "S"}
    points = NAMED + ["q", "w", "c1"]
    return {
        "id": "I_row_surplus_onehit",
        "points": points,
        "blocks": named_blocks(["c1"], ["q", "w"]),
        "row_eqs": [
            {"name": "ret", "center": "EA", "members": ["q", "w", "c1", "O"]}
        ],
        "rad_ne": onehit_rad_ne(placement),
    }


EXPECTED_I_CORE = ["rad_ne|EA|O,c1", "row_eq|ret|O", "row_eq|ret|c1"]


def schema_j(relation: str) -> dict:
    points = ["EA", "a", "b", "c"]
    return {
        "id": f"J_radrel_{relation}",
        "points": points,
        "blocks": [{"points": points, "ordered": True}],
        "row_eqs": [
            {"name": "u", "center": "EA", "members": ["a", "b"]},
            {"name": "v", "center": "EA", "members": ["b", "c"]},
        ],
        "radius_rel": [{"rows": ["u", "v"], "relation": relation}],
        "no_kalmanson": True,
        "no_triangle": True,
    }


EXPECTED_J1_CORE = ["radrel|u,v|ne", "row_eq|u|b"]


def fixture_site(point: int) -> str:
    if point == fixture.FIRST_APEX:
        return "EA"
    if point == fixture.SECOND_APEX:
        return "O"
    if point == fixture.SURPLUS_VERTEX:
        return "W"
    if point in SURPLUS_ARC:
        return "S"
    if point in OPP1_ARC:
        return "O1"
    assert point in fixture.PHYSICAL_INTERIOR
    return "PHY"


def audit_fixture_regions() -> bool:
    """Smoke K: incidence-level one-hit audit of the fixture."""
    closed = {
        "surplus": fixture.SURPLUS_CAP,
        "physical": fixture.PHYSICAL_CAP,
        "opp1": fixture.OPP_CAP_1,
    }
    adjacency = {
        fixture.FIRST_APEX: ("surplus", "physical"),
        fixture.SECOND_APEX: ("surplus", "opp1"),
    }
    ok = True
    for apex, cap_names in adjacency.items():
        for fiber in fixture.complete_radius_partition(apex):
            for cap_name in cap_names:
                hits = len(fiber & closed[cap_name])
                if hits > 1:
                    print(
                        f"  K violation: apex {apex} fiber {sorted(fiber)}"
                        f" hits {cap_name} {hits}x"
                    )
                    ok = False
    extras = fixture.SECOND_APEX_EXACT_FIVE - fixture.PHYSICAL_INTERIOR
    e_pattern = tuple(sorted(fixture_site(p) for p in extras))
    surviving = [("O1", "S"), ("S", "W"), ("EA", "O1"), ("EA", "W")]
    if e_pattern not in surviving:
        print(f"  K violation: fixture e-pattern {e_pattern} not a survivor")
        ok = False
    return ok


def with_regions(schema: dict) -> dict:
    placement = {
        str(p): fixture_site(p)
        for p in sorted(fixture.A)
    }
    if FRESH_EXTRA in schema["points"]:
        placement[FRESH_EXTRA] = "S"
    extra = onehit_rad_ne(placement)
    existing = {
        (spec["center"], spec["a"], spec["b"])
        for spec in schema.get("rad_ne", [])
    }
    merged = schema.get("rad_ne", []) + [
        spec
        for spec in extra
        if (spec["center"], spec["a"], spec["b"]) not in existing
    ]
    return {**schema, "rad_ne": merged}


# members[0] of the exact-five class is "5" (sorted), so cls_eq|1|eb alone
# equates dist(1,eb) with dist(1,5) and the minimal core has two labels.
EXPECTED_M_CORE = ["cls_eq|1|eb", "rad_ne|1|5,eb"]


def main() -> None:
    fixture.check()
    for site in set(NAMED_SITES.values()) | {"S", "O1", "PHY"}:
        assert site in SITE_REGIONS

    gates = {
        "H_epattern_O1O1": (schema_h(), "unsat", EXPECTED_H_CORE),
        "I_row_surplus_onehit": (schema_i(), "unsat", EXPECTED_I_CORE),
        "J1_radrel_ne": (schema_j("ne"), "unsat", EXPECTED_J1_CORE),
        "J2_radrel_eq": (schema_j("eq"), "sat", None),
        "L_fixture_regions": (
            with_regions(
                fixture_schema("L_fixture_regions", symbolic=False, hinge_free=False)
            ),
            "unsat",
            None,
        ),
        "M_named_regions": (
            with_regions(named_schema("M_named_regions", symbolic=False)),
            "unsat",
            EXPECTED_M_CORE,
        ),
    }

    results = {}
    failures = []

    k_ok = audit_fixture_regions()
    print(f"{'PASS' if k_ok else 'FAIL'} K_fixture_region_audit")
    if not k_ok:
        failures.append("K_fixture_region_audit")

    for gate_id, (schema, expected_verdict, expected_core) in gates.items():
        verdict = check_schema(schema)
        results[gate_id] = verdict
        ok = verdict["verdict"] == expected_verdict
        if ok and expected_core is not None:
            ok = sorted(verdict.get("core", [])) == sorted(expected_core)
        status = "PASS" if ok else "FAIL"
        if not ok:
            failures.append(gate_id)
        print(
            f"{status} {gate_id}: verdict={verdict['verdict']}"
            f" assertions={verdict['assertions']}"
            + (
                f" core={verdict.get('core')}"
                if verdict["verdict"] == "unsat"
                else ""
            )
        )

    (HERE / "smoke_l1_results.json").write_text(json.dumps(results, indent=2))
    print(f"output={HERE / 'smoke_l1_results.json'}")
    if failures:
        raise SystemExit(f"smoke failures: {failures}")
    print("ALL L1 SMOKE GATES PASS")


if __name__ == "__main__":
    main()

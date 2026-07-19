#!/usr/bin/env python3
"""Smoke gates for the role-coverage gate encoder (DESIGN.md pipeline 1-2).

Five gates, all through the production ``gate_encoder`` codepath:

- A  fixed boundary order, full fixture supports: must be UNSAT and the
     minimized core must equal the recorded equilateral-hinge core
     (``fixture_unsat_core.json``);
- B  named-forced schema (see below), fixed order: must be SAT — the
     forced constraint families alone must not close the branch, so the
     encoder is not manufacturing UNSAT;
- C  symbolic within-arc order (surplus and opp-1 strict arcs become bags,
     conditional Kalmanson), full supports: must be UNSAT with the same
     order-free hinge core — validates the branch machinery end to end;
- D  named-forced schema, symbolic order: must be SAT (relaxation of B);
- E  fixed order, full supports minus the (7,8) hinge memberships: must be
     UNSAT via the second recorded accident — the bisector-parity core
     {cls_eq: 3, kal: 2} on points {5,11} against centers {1,2}.  This
     validates that Kalmanson constraints participate in minimized cores.

The named-forced schema keeps only constraint families that are forced for
every aligned exact-seven configuration given the fixture's role choices:
the exact-five class at the second apex, the three support-locked reverse
rows (centers b0=14, b1=4, s1=12), the two first-apex fibers with the
distinct-radius arm, plus lower/triangle/Kalmanson.  Two of the fixture's
accidents are removed: the arbitrary supports at non-named centers
(2,3,5,6,7,8,9,10) are dropped, and the fixture's identification of the
second exact-five extra with the b1-row outside point 8 (which forces the
non-crossing bisector pair {8,12} against centers {1,4}) is replaced by a
fresh extra ``eb`` in the surplus arc.  K4 is passed for every center with
escape 3 (anonymous row slots), exercising the trivial-K4 bookkeeping.
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

BOUNDARY = [0, 5, 6, 7, 1, 3, 8, 9, 10, 2, 11, 14, 12, 4, 13]
PHYSICAL_INTERIOR_ORDER = [11, 14, 12, 4, 13]
SURPLUS_ARC = [5, 6, 7]
OPP1_ARC = [3, 8, 9, 10]
HINGE = (7, 8)
FRESH_EXTRA = "eb"

REVERSE_CENTERS = (14, 4, 12)

EXPECTED_BISECTOR_CORE = [
    "cls_eq|1|11",
    "cls_eq|2|11",
    "cls_eq|2|5",
    "kal|0,1,2,11|ac+bd-ab-cd",
    "kal|0,5,1,2|ac+bd-ad-bc",
]


def name(point: int) -> str:
    return str(point)


def names(points) -> list[str]:
    return [name(p) for p in sorted(points)]


def fixture_schema(schema_id: str, symbolic: bool, hinge_free: bool) -> dict:
    """The full fixture as a schema (smokes A, C, E)."""
    supports = dict(fixture.CRITICAL_SUPPORT)
    if hinge_free:
        a, b = HINGE
        supports[a] = supports[a] - {b}
        supports[b] = supports[b] - {a}

    if symbolic:
        blocks = [
            {"points": [name(fixture.FIRST_APEX)], "ordered": True},
            {"points": names(SURPLUS_ARC), "ordered": False},
            {"points": [name(fixture.SECOND_APEX)], "ordered": True},
            {"points": names(OPP1_ARC), "ordered": False},
            {"points": [name(fixture.SURPLUS_VERTEX)], "ordered": True},
            {"points": [name(p) for p in PHYSICAL_INTERIOR_ORDER], "ordered": True},
        ]
    else:
        blocks = [{"points": [name(p) for p in BOUNDARY], "ordered": True}]

    exact_classes = [
        {
            "center": name(fixture.SECOND_APEX),
            "members": names(fixture.SECOND_APEX_EXACT_FIVE),
            "exclude": names(
                fixture.A - {fixture.SECOND_APEX} - fixture.SECOND_APEX_EXACT_FIVE
            ),
        }
    ]
    for center in sorted(supports):
        exact_classes.append(
            {
                "center": name(center),
                "members": names(supports[center]),
                "exclude": names(fixture.A - {center} - supports[center]),
            }
        )

    fibers = list(fixture.FIRST_APEX_RADIUS_FIBERS)
    row_eqs = [
        {"name": str(i), "center": name(fixture.FIRST_APEX), "members": names(fiber)}
        for i, fiber in enumerate(fibers)
    ]
    rad_ne = [
        {
            "center": name(fixture.FIRST_APEX),
            "a": name(min(fibers[0])),
            "b": name(min(fibers[1])),
        }
    ]
    k4 = [
        {"center": name(c), "candidates": names(fixture.A - {c}), "escape": 0}
        for c in sorted(
            fixture.A - set(supports) - {fixture.FIRST_APEX, fixture.SECOND_APEX}
        )
    ]

    return {
        "id": schema_id,
        "points": names(fixture.A),
        "blocks": blocks,
        "exact_classes": exact_classes,
        "row_eqs": row_eqs,
        "rad_ne": rad_ne,
        "k4": k4,
    }


def named_schema(schema_id: str, symbolic: bool) -> dict:
    """The named-forced, de-accidented schema (smokes B, D)."""
    points = names(fixture.A) + [FRESH_EXTRA]
    surplus_arc = [name(5), FRESH_EXTRA, name(6), name(7)]

    if symbolic:
        blocks = [
            {"points": [name(fixture.FIRST_APEX)], "ordered": True},
            {"points": surplus_arc, "ordered": False},
            {"points": [name(fixture.SECOND_APEX)], "ordered": True},
            {"points": names(OPP1_ARC), "ordered": False},
            {"points": [name(fixture.SURPLUS_VERTEX)], "ordered": True},
            {"points": [name(p) for p in PHYSICAL_INTERIOR_ORDER], "ordered": True},
        ]
    else:
        fixed = (
            [name(fixture.FIRST_APEX)]
            + surplus_arc
            + [name(fixture.SECOND_APEX)]
            + names(OPP1_ARC)
            + [name(fixture.SURPLUS_VERTEX)]
            + [name(p) for p in PHYSICAL_INTERIOR_ORDER]
        )
        blocks = [{"points": fixed, "ordered": True}]

    exact_five = names(fixture.SECOND_APEX_EXACT_FIVE - {8}) + [FRESH_EXTRA]
    point_set = set(points)
    exact_classes = [
        {
            "center": name(fixture.SECOND_APEX),
            "members": exact_five,
            "exclude": sorted(
                point_set - {name(fixture.SECOND_APEX)} - set(exact_five)
            ),
        }
    ]
    for center in REVERSE_CENTERS:
        members = names(fixture.CRITICAL_SUPPORT[center])
        exact_classes.append(
            {
                "center": name(center),
                "members": members,
                "exclude": sorted(point_set - {name(center)} - set(members)),
            }
        )

    fibers = list(fixture.FIRST_APEX_RADIUS_FIBERS)
    row_eqs = [
        {"name": str(i), "center": name(fixture.FIRST_APEX), "members": names(fiber)}
        for i, fiber in enumerate(fibers)
    ]
    rad_ne = [
        {
            "center": name(fixture.FIRST_APEX),
            "a": name(min(fibers[0])),
            "b": name(min(fibers[1])),
        }
    ]
    k4 = [
        {"center": p, "candidates": sorted(point_set - {p}), "escape": 3}
        for p in points
    ]

    return {
        "id": schema_id,
        "points": points,
        "blocks": blocks,
        "exact_classes": exact_classes,
        "row_eqs": row_eqs,
        "rad_ne": rad_ne,
        "k4": k4,
    }


def main() -> None:
    fixture.check()
    assert set(BOUNDARY) == fixture.A
    assert (
        [fixture.FIRST_APEX]
        + SURPLUS_ARC
        + [fixture.SECOND_APEX]
        + OPP1_ARC
        + [fixture.SURPLUS_VERTEX]
        + PHYSICAL_INTERIOR_ORDER
        == BOUNDARY
    )

    recorded = json.loads((HERE / "fixture_unsat_core.json").read_text())
    hinge_core = recorded["core"]

    schemas = {
        "A_fixed_full": (
            fixture_schema("A_fixed_full", symbolic=False, hinge_free=False),
            "unsat",
            hinge_core,
        ),
        "B_named_fixed": (
            named_schema("B_named_fixed", symbolic=False),
            "sat",
            None,
        ),
        "C_symbolic_full": (
            fixture_schema("C_symbolic_full", symbolic=True, hinge_free=False),
            "unsat",
            hinge_core,
        ),
        "D_named_symbolic": (
            named_schema("D_named_symbolic", symbolic=True),
            "sat",
            None,
        ),
        "E_fixed_hingefree": (
            fixture_schema("E_fixed_hingefree", symbolic=False, hinge_free=True),
            "unsat",
            EXPECTED_BISECTOR_CORE,
        ),
    }

    results = {}
    failures = []
    for schema_id, (schema, expected_verdict, expected_core) in schemas.items():
        verdict = check_schema(schema)
        results[schema_id] = verdict
        ok = verdict["verdict"] == expected_verdict
        if ok and expected_core is not None:
            ok = verdict.get("core") == expected_core
        status = "PASS" if ok else "FAIL"
        if not ok:
            failures.append(schema_id)
        print(
            f"{status} {schema_id}: verdict={verdict['verdict']}"
            f" assertions={verdict['assertions']}"
            + (
                f" core_size={verdict['core_size']} families={verdict['families']}"
                if verdict["verdict"] == "unsat"
                else ""
            )
        )
        if verdict["verdict"] == "unsat" and expected_core is not None:
            if verdict.get("core") != expected_core:
                print(f"  expected core: {expected_core}")
                print(f"  actual core:   {verdict.get('core')}")

    (HERE / "smoke_results.json").write_text(json.dumps(results, indent=2))
    print(f"output={HERE / 'smoke_results.json'}")
    if failures:
        raise SystemExit(f"smoke failures: {failures}")
    print("ALL SMOKE GATES PASS")


if __name__ == "__main__":
    main()

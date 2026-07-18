#!/usr/bin/env python3
"""Audit the complete-row-compatible period-three 25-role seed cell.

This is a source/role/order audit around the existing QF_LRA encoder.  It
does not introduce a second encoding.  The script:

* checks that the chosen role profiles occur in the full-role source census;
* checks the common-cap blocker straddles in the displayed boundary word;
* maps the exact rational eleven-point complete-row model into an ordered
  cyclic subsequence of that word; and
* replays the existing exact QF_LRA probe on the audited word.
"""

from __future__ import annotations

from fractions import Fraction as F
import json
from pathlib import Path
import sys


HERE = Path(__file__).resolve().parent
ATAIL = HERE.parent
FULL_QUOTIENT = ATAIL / "period-three-full-role-identity-quotient"
NUMERICAL = ATAIL / "period-three-rank2-numerical-seed"
EXACT_SEED = ATAIL / "period-three-exact-seed-lift"

sys.path.insert(0, str(FULL_QUOTIENT))
import enumerate_schema as schema  # noqa: E402
import probe_fully_disjoint as lra  # noqa: E402


Point = tuple[F, F]


def point(raw: list[str]) -> Point:
    return F(raw[0]), F(raw[1])


def cross(a: Point, b: Point, c: Point) -> F:
    return ((b[0] - a[0]) * (c[1] - a[1])
            - (b[1] - a[1]) * (c[0] - a[0]))


def sqdist(a: Point, b: Point) -> F:
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def strict_hull_margins(boundary: list[Point]) -> list[F]:
    margins: list[F] = []
    for i, a in enumerate(boundary):
        b = boundary[(i + 1) % len(boundary)]
        for j, p in enumerate(boundary):
            if j not in (i, (i + 1) % len(boundary)):
                margins.append(cross(a, b, p))
    assert margins and min(margins) > 0
    return margins


def lies_strictly_between(word: tuple[str, ...], left: str,
                          middle: str, right: str) -> bool:
    return word.index(left) < word.index(middle) < word.index(right)


def main() -> None:
    cell = json.loads(
        (NUMERICAL / "COMPLETE_ROW_WORD_LRA.json").read_text()
    )
    seed = json.loads((EXACT_SEED / "SEED.json").read_text())
    boundary = tuple(cell["boundary"])

    assert len(boundary) == len(set(boundary)) == 25
    assert boundary[0] == "first"
    assert boundary[3] == "second"
    assert boundary[17] == "surplus"

    surplus_block = boundary[1:3]
    first_block = boundary[4:17]
    physical_block = boundary[18:]
    assert surplus_block == ("t0s", "nS")
    assert first_block == (
        "x0", "y0", "q", "w", "t0i", "t1i0", "t1i1", "t1i2",
        "nI", "x1", "y1", "x2", "y2",
    )
    assert physical_block == (
        "c0", "b0", "b2", "c1", "b1", "c2", "t1o",
    )

    # Exact labelled source-census membership of the chosen unequal-radius
    # first rows: T0 = 3I+S and T1 = 3I+O, with frontier q,w = II.
    first_cell = schema.UnequalRadiusCell(
        frontier_roles="II",
        t0_completion_roles=("I", "S"),
        t1_roles=("I", "I", "I", "O"),
    )
    assert first_cell in schema.unequal_radius_cells()

    # Physical exact five = three strict physical points plus one point in
    # each adjacent open block.  All blockers are fresh strict physical
    # points, which is one enumerated legal blocker matching.
    physical_cell = schema.PhysicalFiveCell(("S", "I"))
    assert physical_cell in schema.physical_five_cells()
    blocker_cell = schema.BlockerMatching((None, None, None))
    assert blocker_cell in schema.blocker_matchings(physical_cell)

    # Six private outside targets are the six-block member of the complete
    # 53-partition quotient.
    six_singletons = tuple(
        frozenset((name,)) for name in schema.TARGET_SLOTS
    )
    assert any(
        set(partition) == set(six_singletons)
        for partition in schema.reverse_target_partitions()
    )

    # The single common physical-cap order supplies every all-reverse
    # straddle, including the non-obvious b2 position for the c2--c0 edge.
    straddles = {
        "b0": lies_strictly_between(physical_block, "c0", "b0", "c1"),
        "b1": lies_strictly_between(physical_block, "c1", "b1", "c2"),
        "b2": lies_strictly_between(physical_block, "c0", "b2", "c2"),
    }
    assert all(straddles.values())

    expected_seed_labels = {
        "second": "o",
        "nI": "left",
        "c0": "q0",
        "b0": "c0",
        "b2": "c2",
        "c1": "q1",
        "b1": "c1",
        "c2": "q2",
        "nS": "right",
    }
    for role, label in expected_seed_labels.items():
        assert seed["mapped_roles"][role]["source_label"] == label

    coordinates = {
        role: point(seed["mapped_roles"][role]["xy"])
        for role in expected_seed_labels
    }
    complete = seed["unmapped_complete_reverse0_targets"]["targets"]
    coordinates["x0"] = point(complete["source_x"]["xy"])
    coordinates["y0"] = point(complete["source_y"]["xy"])

    subsequence = (
        "second", "x0", "y0", "nI", "c0", "b0", "b2", "c1",
        "b1", "c2", "nS",
    )
    assert tuple(cell["complete_row_subsequence"]) == subsequence
    start = boundary.index("second")
    positions = [
        (boundary.index(role) - start) % len(boundary)
        for role in subsequence
    ]
    assert positions == sorted(positions)
    hull_margins = strict_hull_margins(
        [coordinates[role] for role in subsequence]
    )

    physical_support = ("nI", "c0", "c1", "c2", "nS")
    physical_radius = sqdist(coordinates["second"], coordinates["nI"])
    assert all(
        sqdist(coordinates["second"], coordinates[role]) == physical_radius
        for role in physical_support
    )
    assert all(
        sqdist(coordinates["second"], coordinates[role]) != physical_radius
        for role in ("x0", "y0", "b0", "b1", "b2")
    )

    reverse0_support = ("c0", "c1", "x0", "y0")
    reverse0_radius = sqdist(coordinates["b0"], coordinates["c0"])
    assert all(
        sqdist(coordinates["b0"], coordinates[role]) == reverse0_radius
        for role in reverse0_support
    )
    assert all(
        sqdist(coordinates["b0"], coordinates[role]) != reverse0_radius
        for role in subsequence
        if role not in {*reverse0_support, "b0"}
    )

    # The exact seed also keeps the remaining two adjacent-source equalities;
    # their four-shell completions are deliberately left unassigned.
    assert sqdist(coordinates["b1"], coordinates["c1"]) == \
        sqdist(coordinates["b1"], coordinates["c2"])
    assert sqdist(coordinates["b2"], coordinates["c2"]) == \
        sqdist(coordinates["b2"], coordinates["c0"])

    # Replay, rather than reimplement, the audited exact abstract-distance
    # encoder on this word.  Its solver model is independently substituted
    # into every triangle, Kalmanson, row, and named-exclusion constraint by
    # probe_fully_disjoint.solve.
    lra.smoke_tests()
    lra.BOUNDARY = boundary
    lra.POINTS = boundary
    replay = lra.solve()
    assert replay["status"] == "sat"
    assert replay["ledger"] == cell["result"]["ledger"]

    seed_payload = {
        "schema": "period-three-seed-compatible-fully-disjoint-cell-v1",
        "epistemic_status": (
            "SOURCE_ROLE_ORDER_AUDITED_EXACT_QF_LRA_SAT_WITH_EXACT_"
            "ELEVEN_POINT_PARTIAL_EUCLIDEAN_SEED_NOT_FULL_EUCLIDEAN_"
            "NOT_MEC_NOT_CSS_NOT_LEAN"
        ),
        "boundary": list(boundary),
        "cap_blocks": {
            "surplus_open_block": list(surplus_block),
            "first_open_block": list(first_block),
            "physical_open_block": list(physical_block),
        },
        "profiles": {
            "radius_arm": "unequal",
            "frontier_roles": "II",
            "T0": "3I+S",
            "T1": "3I+O",
            "physical_exact_five": "3O+I+S",
            "blockers": "three fresh O roles",
            "reverse_targets": "six fresh I roles in three disjoint pairs",
            "cross_front_identity": "fully disjoint",
        },
        "common_order_straddles": straddles,
        "exact_seed_subsequence": list(subsequence),
        "exact_seed_coordinates": {
            role: [str(value) for value in coordinates[role]]
            for role in subsequence
        },
        "exact_seed_equalities": {
            "physical_support": list(physical_support),
            "physical_radius_sq": str(physical_radius),
            "complete_reverse0_support": list(reverse0_support),
            "complete_reverse0_radius_sq": str(reverse0_radius),
            "reverse1_cap_pair": ["c1", "c2"],
            "reverse2_cap_pair": ["c2", "c0"],
        },
        "exact_seed_minimum_strict_hull_margin": str(min(hull_margins)),
        "unassigned_roles": [
            role for role in boundary if role not in coordinates
        ],
        "qf_lra_replay": {
            "status": replay["status"],
            "point_count": replay["point_count"],
            "ledger": replay["ledger"],
            "scope": (
                "all positive distances, all strict triangles, both strict "
                "Kalmanson inequalities for every cyclic quadruple, T0/T1 "
                "selected-row equalities and unequal radii, exact physical "
                "and reverse named-support exclusions, and second-q/w "
                "inequality"
            ),
        },
        "not_claimed": [
            "coordinates for the fourteen unassigned roles",
            "one planar Euclidean realization of all 25 roles",
            "MEC/nonobtuse realization for the live distinguished triangle",
            "global exactness beyond named roles",
            "total CriticalShellSystem or minimality",
            "Lean theorem or production closure",
        ],
    }
    (HERE / "SEED.json").write_text(
        json.dumps(seed_payload, indent=2) + "\n"
    )
    print("PASS: source-legal complete-row-compatible 25-role cell")
    print(f"qf_lra={replay['status']}")
    print(f"exact_seed_roles={len(coordinates)}")
    print(f"min_exact_seed_hull_margin={min(hull_margins)}")
    print(f"wrote={HERE / 'SEED.json'}")


if __name__ == "__main__":
    main()

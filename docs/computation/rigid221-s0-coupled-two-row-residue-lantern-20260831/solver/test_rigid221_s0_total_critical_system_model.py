# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import hashlib
import json
import sys
from fractions import Fraction as F
from itertools import combinations
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).parent))

import rigid221_s0_total_critical_system_model as model


def add(first: model.Point, second: model.Point) -> model.Point:
    return first[0] + second[0], first[1] + second[1]


def sub(first: model.Point, second: model.Point) -> model.Point:
    return first[0] - second[0], first[1] - second[1]


def dot(first: model.Point, second: model.Point) -> F:
    return first[0] * second[0] + first[1] * second[1]


def dist2(first: model.Point, second: model.Point) -> F:
    difference = sub(first, second)
    return dot(difference, difference)


def orient(first: model.Point, second: model.Point, third: model.Point) -> F:
    return (second[0] - first[0]) * (third[1] - first[1]) - (second[1] - first[1]) * (
        third[0] - first[0]
    )


def rotate(center: model.Point, point: model.Point, parameter: F) -> model.Point:
    denominator = 1 + parameter * parameter
    a = (1 - parameter * parameter) / denominator
    b = 2 * parameter / denominator
    x, y = sub(point, center)
    return add(center, (a * x - b * y, b * x + a * y))


def complete_fiber(
    points: MappingPoints,
    center: str,
    radius2: F,
    deleted: frozenset[str] = frozenset(),
) -> frozenset[str]:
    return frozenset(
        role
        for role, point in points.items()
        if role not in deleted and dist2(points[center], point) == radius2
    )


MappingPoints = dict[str, model.Point]


def radial_maximum(
    points: MappingPoints, center: str, deleted: frozenset[str] = frozenset()
) -> int:
    classes: dict[F, int] = {}
    for role, point in points.items():
        if role in deleted:
            continue
        radius2 = dist2(points[center], point)
        if radius2 > 0:
            classes[radius2] = classes.get(radius2, 0) + 1
    return max(classes.values(), default=0)


def independent_points() -> MappingPoints:
    retained = json.loads(model.L3_JSON.read_text(encoding="utf-8"))
    raw_points = retained["branches"]["S0-I"]["points"]
    points = {
        role: (F(raw_points[role][0]), F(raw_points[role][1]))
        for role in model.BASE_ORDER
    }
    for spec in model.EXTENSION_ROWS.values():
        center = points[spec["center"]]
        anchor = points[spec["anchor"]]
        for role, parameter in spec["parameters"].items():
            points[role] = rotate(center, anchor, parameter)
    return points


def test_retained_l3_input_and_nine_rotation_formulas_are_exact() -> None:
    retained, raw = model.load_l3_certificate()
    assert retained["status"] == "SAT_EXACT_L3_FIELD_LEVEL_GEOMETRIC_PACKET"
    assert retained["branches"]["S0-I"]["role_count"] == 19
    assert tuple(retained["branches"]["S0-I"]["cyclic_order"]) == model.BASE_ORDER
    points = independent_points()
    assert points == model.build_points(retained)
    assert set(points) == set(model.ORDER)
    assert len(points) == 28
    assert all(
        isinstance(coordinate, F) for point in points.values() for coordinate in point
    )
    report = model.build_report()
    assert report["input_provenance"]["sha256"] == hashlib.sha256(raw).hexdigest()


def test_all_roles_distinct_and_every_hull_edge_orientation_is_positive() -> None:
    points = independent_points()
    report = model.build_report()
    squared_distances = [
        dist2(points[first], points[second])
        for first, second in combinations(model.ORDER, 2)
    ]
    assert len(squared_distances) == 378
    assert all(value > 0 for value in squared_distances)
    orientations = [
        (orient(points[first], points[second], points[other]), first, second, other)
        for index, first in enumerate(model.ORDER)
        for second in (model.ORDER[(index + 1) % len(model.ORDER)],)
        for other in model.ORDER
        if other not in (first, second)
    ]
    assert len(orientations) == 28 * 26
    assert all(value[0] > 0 for value in orientations)
    minimum = min(orientations)
    convexity = report["strict_convexity"]
    assert convexity["check_count"] == 728
    assert F(convexity["minimum_orientation"]) == minimum[0]
    assert convexity["minimum_roles"] == list(minimum[1:]) == ["a1", "a2", "a3"]


def test_mec_and_cap_membership_are_independently_replayed() -> None:
    points = independent_points()
    report = model.build_report()
    center = (F(137, 210), F(0))
    radius2 = F(18769, 44100)
    boundary = {
        role for role, point in points.items() if dist2(center, point) == radius2
    }
    assert boundary == {"O", "delta", "xv"}
    assert all(dist2(center, point) <= radius2 for point in points.values())
    frames = (
        ("delta", "xv", "O"),
        ("xv", "O", "delta"),
        ("O", "delta", "xv"),
    )
    caps = tuple(
        {
            role
            for role, point in points.items()
            if orient(point, points[endpoint1], points[endpoint2])
            * orient(points[apex], points[endpoint1], points[endpoint2])
            <= 0
        }
        for apex, endpoint1, endpoint2 in frames
    )
    assert tuple(map(len, caps)) == (8, 10, 13)
    assert report["caps"]["cardinalities"] == {"C1": 8, "C2": 10, "C3": 13}
    assert report["caps"]["endpoint_pattern"] == {
        "v1": {"C1": False, "C2": True, "C3": True},
        "v2": {"C1": True, "C2": False, "C3": True},
        "v3": {"C1": True, "C2": True, "C3": False},
    }


def test_seven_rows_are_complete_exact_four_fibers_and_partition_carrier() -> None:
    points = independent_points()
    report = model.build_report()
    rows = report["critical_rows"]
    supports: list[frozenset[str]] = []
    for name, spec in model.ROW_SPECS.items():
        row = rows[name]
        support = frozenset(spec["labels"])
        radius2 = dist2(points[spec["center"]], points[spec["labels"][0]])
        assert F(row["radius_squared"]) == radius2 > 0
        assert complete_fiber(points, spec["center"], radius2) == support
        assert frozenset(row["complete_ambient_fiber_roles"]) == support
        assert all(row["modeled_field_checks"].values())
        supports.append(support)
    assert all(not first & second for first, second in combinations(supports, 2))
    assert frozenset().union(*supports) == set(points)
    assert sum(map(len, supports)) == 28


def test_kdelta_is_at_xu_and_supplied_fq_center_is_rejected() -> None:
    points = independent_points()
    row = model.build_report()["critical_rows"]["Kdelta"]
    support = frozenset({"delta", "d1", "d2", "d3"})
    assert row["center"] == "xu"
    assert F(row["radius_squared"]) == F(80656, 54389)
    assert complete_fiber(points, "xu", F(80656, 54389)) == support
    assert radial_maximum(points, "fq") == 1
    bad_spec = dict(model.ROW_SPECS["Kdelta"])
    bad_spec["center"] = "fq"
    with pytest.raises(ValueError, match="Kdelta"):
        model.critical_row_certificate(points, "Kdelta", bad_spec)


def test_total_source_assignment_and_no_qfree_after_every_deletion() -> None:
    points = independent_points()
    system = model.build_report()["critical_shell_system_geometric_model"]
    assignments = system["source_assignments"]
    assert set(assignments) == set(points)
    assert system["modeled_total_source_count"] == 28
    assert system["modeled_all_carrier_sources_assigned_once"]
    for source, assignment in assignments.items():
        center = assignment["centerAt"]
        support = frozenset(assignment["selectedAt_support_roles"])
        assert source in support
        assert center in points and center != source
        assert radial_maximum(points, center, frozenset({source})) <= 3
        assert all(assignment["modeled_field_checks"].values())


def test_blocker_orbit_and_cycle_are_exact() -> None:
    system = model.build_report()["critical_shell_system_geometric_model"]
    assignments = system["source_assignments"]
    assert system["blocker_orbit"] == ["u", "cu", "fw", "xv", "cv", "fp", "xv"]
    assert system["blocker_cycle"] == ["xv", "cv", "fp", "xv"]
    assert assignments["u"]["centerAt"] == "cu"
    assert assignments["cu"]["centerAt"] == "fw"
    assert assignments["fw"]["centerAt"] == "xv"
    assert assignments["xv"]["centerAt"] == "cv"
    assert assignments["cv"]["centerAt"] == "fp"
    assert assignments["fp"]["centerAt"] == "xv"


def test_centerwise_has_four_census_is_exactly_eight_and_twenty() -> None:
    points = independent_points()
    census = model.build_report()["centerwise_HasNEquidistantPointsAt_4_census"]
    satisfying = {
        center for center in model.ORDER if radial_maximum(points, center) >= 4
    }
    assert satisfying == model.EXPECTED_HAS_FOUR_CENTERS
    assert (
        set(census["centers_satisfying_modeled_HasNEquidistantPointsAt_4"])
        == satisfying
    )
    assert len(satisfying) == census["satisfying_center_count"] == 8
    assert census["non_satisfying_center_count"] == 20
    assert not census["modeled_global_HasNEquidistantProperty_4"]
    for center, profile in census["by_center"].items():
        assert profile["maximum_positive_distance_multiplicity"] == radial_maximum(
            points, center
        )
        assert profile["HasNEquidistantPointsAt_4"] == (center in satisfying)


def test_source_contract_scope_and_supplied_discrepancies_are_explicit() -> None:
    report = model.build_report()
    contract = report["current_source_contract"]
    assert contract["source_text_fragments_validated"]
    assert contract["CriticalShellSystem_fields"] == ["shellAt", "no_qfree"]
    assert len(contract["u1_carrier_injection_sha256"]) == 64
    discrepancies = report["supplied_value_discrepancies"]
    assert [item["field"] for item in discrepancies] == [
        "cap cardinalities (C1,C2,C3)",
        "Kdelta complete-fiber center",
    ]
    assert discrepancies[0]["supplied"] == {"C1": 8, "C2": 7, "C3": 16}
    assert discrepancies[0]["observed"] == {"C1": 8, "C2": 10, "C3": 13}
    assert discrepancies[1]["supplied"] == "fq"
    assert discrepancies[1]["observed"] == "xu"
    assert report["status"] == model.STATUS
    assert report["all_named_finite_CriticalShellSystem_geometry_replayed"]
    assert report["claim_scope"] == {
        "total_finite_CriticalShellSystem_geometry": True,
        "actual_typed_Lean_CriticalShellSystem": False,
        "CounterexampleData": False,
        "D.K4": False,
        "D.Minimal": False,
        "full_theorem": False,
        "lean_claim": False,
        "promotion_claim": False,
    }


@pytest.mark.parametrize("role", ["a1", "b2", "c3"])
def test_mutating_any_new_row_coordinate_is_rejected(role: str) -> None:
    points = independent_points()
    point = points[role]
    points[role] = (point[0] + F(1, 10**30), point[1])
    with pytest.raises(ValueError):
        model.certify_model(points)


def test_collision_and_missing_role_mutations_are_rejected() -> None:
    collision = independent_points()
    collision["a1"] = collision["a2"]
    with pytest.raises(ValueError, match="pairwise distinct"):
        model.certify_model(collision)
    missing = independent_points()
    del missing["c3"]
    with pytest.raises(ValueError, match="28-role"):
        model.certify_model(missing)


def test_json_artifacts_and_markdown_are_deterministic_and_identical(
    tmp_path: Path,
) -> None:
    report = model.build_report()
    expected_json = json.dumps(report, indent=2, sort_keys=True) + "\n"
    retained_json = (
        model.SOLVER_DIR / "s0-total-critical-system-wave1-model.json"
    ).read_text(encoding="utf-8")
    retained_report = (
        model.REPOSITORY
        / "scratch/runs/rigid221-s0-coupled-two-row-residue-lantern-20260831/"
        "total-critical-system-wave1/total-critical-system-report.json"
    ).read_text(encoding="utf-8")
    retained_markdown = (
        model.SOLVER_DIR.parent / "s0-total-critical-system-wave1.md"
    ).read_text(encoding="utf-8")
    assert retained_json == retained_report == expected_json
    assert retained_markdown == model.render_markdown(report)
    output = tmp_path / "model.json"
    model.write_json(output, report)
    assert output.read_text(encoding="utf-8") == expected_json
    assert (
        hashlib.sha256(retained_json.encode()).hexdigest()
        == hashlib.sha256(retained_report.encode()).hexdigest()
    )

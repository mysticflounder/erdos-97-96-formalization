# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
import sys
from fractions import Fraction as F
from itertools import combinations
from pathlib import Path
from typing import Any

sys.path.insert(0, str(Path(__file__).parent))

import rigid221_s0_l2_source_context_witnesses as witnesses  # noqa: I001


SPECS: dict[str, dict[str, Any]] = {
    "S0-I": {
        "order": (
            "O",
            "fq",
            "fw",
            "fp",
            "r1",
            "r2",
            "delta",
            "v",
            "u",
            "cu",
            "cv",
            "xu",
            "xv",
            "q1",
            "q2",
            "s",
        ),
        "triple": ("delta", "xv", "O"),
        "first_center": "xv",
        "parameters": {"fq": F(1, 1000), "fw": F(1, 500), "fp": F(3, 1000)},
        "Ku": frozenset({"u", "xu", "q1", "q2"}),
        "Kv": frozenset({"v", "xv", "r1", "r2"}),
        "caps": (
            frozenset({"O", "q1", "q2", "s", "xv"}),
            frozenset({"O", "delta", "fp", "fq", "fw", "r1", "r2"}),
            frozenset({"cu", "cv", "delta", "u", "v", "xu", "xv"}),
        ),
        "J1": frozenset({"fp", "fq", "fw", "r1", "r2"}),
        "J2": frozenset({"cu", "cv", "u", "v", "xu"}),
        "cross": frozenset({"u", "xu"}),
    },
    "S0-N": {
        "order": (
            "O",
            "qu2",
            "qu1",
            "qv2",
            "delta",
            "v",
            "u",
            "cv",
            "cu",
            "xv",
            "xu",
            "qv1",
            "fq",
            "fw",
            "fp",
        ),
        "triple": ("xu", "delta", "O"),
        "first_center": "delta",
        "parameters": {
            "fq": F(-3, 1000),
            "fw": F(-1, 500),
            "fp": F(-1, 1000),
        },
        "Ku": frozenset({"u", "xu", "qu1", "qu2"}),
        "Kv": frozenset({"v", "xv", "qv1", "qv2"}),
        "caps": (
            frozenset({"O", "delta", "qu1", "qu2", "qv2"}),
            frozenset({"O", "fp", "fq", "fw", "qv1", "xu"}),
            frozenset({"cu", "cv", "delta", "u", "v", "xu", "xv"}),
        ),
        "J1": frozenset({"fp", "fq", "fw", "qv1"}),
        "J2": frozenset({"cu", "cv", "u", "v", "xv"}),
        "cross": frozenset({"u"}),
    },
}


def add(first: witnesses.Point, second: witnesses.Point) -> witnesses.Point:
    return first[0] + second[0], first[1] + second[1]


def sub(first: witnesses.Point, second: witnesses.Point) -> witnesses.Point:
    return first[0] - second[0], first[1] - second[1]


def scale(value: F, point: witnesses.Point) -> witnesses.Point:
    return value * point[0], value * point[1]


def dot(first: witnesses.Point, second: witnesses.Point) -> F:
    return first[0] * second[0] + first[1] * second[1]


def dist2(first: witnesses.Point, second: witnesses.Point) -> F:
    difference = sub(first, second)
    return dot(difference, difference)


def orient(
    first: witnesses.Point, second: witnesses.Point, third: witnesses.Point
) -> F:
    return (second[0] - first[0]) * (third[1] - first[1]) - (second[1] - first[1]) * (
        third[0] - first[0]
    )


def p(parameter: F) -> witnesses.Point:
    denominator = 1 + parameter * parameter
    return (1 - parameter * parameter) / denominator, 2 * parameter / denominator


def rot(
    center: witnesses.Point, point: witnesses.Point, parameter: F
) -> witnesses.Point:
    denominator = 1 + parameter * parameter
    a = (1 - parameter * parameter) / denominator
    b = 2 * parameter / denominator
    x, y = sub(point, center)
    return add(center, (a * x - b * y, b * x + a * y))


def on_arc_opposite(
    vi: witnesses.Point,
    vj: witnesses.Point,
    vk: witnesses.Point,
    point: witnesses.Point,
) -> bool:
    return orient(point, vj, vk) * orient(vi, vj, vk) <= 0


def independent_points(branch: str) -> dict[str, witnesses.Point]:
    points = {
        "O": (F(0), F(0)),
        "delta": p(F(-4, 11)),
        "v": p(F(-10, 29)),
        "u": p(F(-6, 19)),
    }
    if branch == "S0-I":
        points.update(
            {
                "xu": p(F(6, 19)),
                "xv": p(F(4, 11)),
                "cu": (F(83, 100), F(0)),
            }
        )
        points["cv"] = scale(F(267, 500), add(points["v"], points["xv"]))
        points.update(
            {
                "q1": rot(points["cu"], points["u"], F(-15, 4)),
                "q2": rot(points["cu"], points["u"], F(-2)),
                "r1": rot(points["cv"], points["v"], F(-5, 12)),
                "r2": rot(points["cv"], points["v"], F(-7, 20)),
                "s": (F(1, 10), F(1, 10)),
            }
        )
    else:
        points.update({"xv": p(F(6, 19)), "xu": p(F(4, 11))})
        points["cu"] = scale(F(157, 300), add(points["u"], points["xu"]))
        points["cv"] = scale(F(31, 60), add(points["v"], points["xv"]))
        points.update(
            {
                "qu1": rot(points["cu"], points["u"], F(-3, 10)),
                "qu2": rot(points["cu"], points["u"], F(-2, 5)),
                "qv1": rot(points["cv"], points["v"], F(-31, 20)),
                "qv2": rot(points["cv"], points["v"], F(-1, 9)),
            }
        )
    spec = SPECS[branch]
    for role, parameter in spec["parameters"].items():
        points[role] = rot(points[spec["first_center"]], points["O"], parameter)
    return points


def independent_caps(
    points: dict[str, witnesses.Point], triple: tuple[str, str, str]
) -> tuple[frozenset[str], ...]:
    frames = (
        (triple[0], triple[1], triple[2]),
        (triple[1], triple[2], triple[0]),
        (triple[2], triple[0], triple[1]),
    )
    return tuple(
        frozenset(
            role
            for role, point in points.items()
            if on_arc_opposite(
                points[apex], points[endpoint1], points[endpoint2], point
            )
        )
        for apex, endpoint1, endpoint2 in frames
    )


def complete_fiber(
    points: dict[str, witnesses.Point],
    center: str,
    radius2: F,
    deleted: frozenset[str] = frozenset(),
) -> frozenset[str]:
    return frozenset(
        role
        for role, point in points.items()
        if role not in deleted and dist2(points[center], point) == radius2
    )


def radial_multiplicities(
    points: dict[str, witnesses.Point],
    center: str,
    deleted: frozenset[str] = frozenset(),
) -> dict[F, frozenset[str]]:
    classes: dict[F, set[str]] = {}
    for role, point in points.items():
        if role in deleted:
            continue
        radius2 = dist2(points[center], point)
        if radius2 > 0:
            classes.setdefault(radius2, set()).add(role)
    return {radius2: frozenset(roles) for radius2, roles in classes.items()}


def test_formulas_orders_distinctness_and_strict_convexity() -> None:
    report = witnesses.build_report()
    for branch, spec in SPECS.items():
        points = independent_points(branch)
        order = spec["order"]
        assert points == witnesses.build_branch_points(branch)
        assert set(points) == set(order)
        assert all(
            isinstance(coordinate, F)
            for point in points.values()
            for coordinate in point
        )
        assert all(dist2(points[a], points[b]) > 0 for a, b in combinations(order, 2))
        orientations = []
        for index, first in enumerate(order):
            second = order[(index + 1) % len(order)]
            for other in order:
                if other not in (first, second):
                    value = orient(points[first], points[second], points[other])
                    assert value > 0
                    orientations.append(value)
        assert len(orientations) == len(order) * (len(order) - 2)
        certificate = report["branches"][branch]["strict_convexity"]
        assert certificate["check_count"] == len(orientations)
        assert F(certificate["minimum_orientation"]) == min(orientations)


def test_inherited_mec_moser_caps_and_new_J1_J2() -> None:
    center = (F(137, 210), F(0))
    radius2 = F(18769, 44100)
    weights = (radius2, radius2, 1 - 2 * radius2)
    report = witnesses.build_report()
    for branch, spec in SPECS.items():
        points = independent_points(branch)
        triple = spec["triple"]
        slacks = {
            role: radius2 - dist2(center, point) for role, point in points.items()
        }
        assert all(slack >= 0 for slack in slacks.values())
        assert {role for role, slack in slacks.items() if slack == 0} == set(triple)
        barycenter = (
            sum(
                (
                    weight * points[role][0]
                    for role, weight in zip(triple, weights, strict=True)
                ),
                start=F(0),
            ),
            sum(
                (
                    weight * points[role][1]
                    for role, weight in zip(triple, weights, strict=True)
                ),
                start=F(0),
            ),
        )
        assert barycenter == center
        v1, v2, v3 = triple
        assert dot(sub(points[v2], points[v1]), sub(points[v3], points[v1])) >= 0
        assert dot(sub(points[v3], points[v2]), sub(points[v1], points[v2])) >= 0
        assert dot(sub(points[v1], points[v3]), sub(points[v2], points[v3])) >= 0

        caps = independent_caps(points, triple)
        assert caps == spec["caps"]
        assert tuple(map(len, caps)) == tuple(
            report["branches"][branch]["caps"]["cardinalities"][name]
            for name in ("C1", "C2", "C3")
        )
        assert all(
            sum(role in cap for cap in caps) == (2 if role in triple else 1)
            for role in points
        )
        endpoint_pattern = {
            vertex_name: {
                cap_name: role in cap
                for cap_name, cap in zip(("C1", "C2", "C3"), caps, strict=True)
            }
            for vertex_name, role in zip(("v1", "v2", "v3"), triple, strict=True)
        }
        assert endpoint_pattern == {
            "v1": {"C1": False, "C2": True, "C3": True},
            "v2": {"C1": True, "C2": False, "C3": True},
            "v3": {"C1": True, "C2": True, "C3": False},
        }
        assert (
            report["branches"][branch]["caps"]["cap_triple_axioms"]["endpoint_pattern"]
            == endpoint_pattern
        )
        j1 = caps[1] - frozenset({triple[2], triple[0]})
        j2 = caps[2] - frozenset({triple[0], triple[1]})
        assert j1 == spec["J1"]
        assert j2 == spec["J2"]
        assert report["branches"][branch]["packet"]["J1"] == sorted(j1)
        assert report["branches"][branch]["packet"]["J2"] == sorted(j2)
        opposite_mapping = report["branches"][branch]["packet"][
            "conditional_surplus_index_zero_mapping"
        ]
        assert opposite_mapping == {
            "statement": (
                "surplusIdx=0 and triangle.v3=O imply oppIndex2=2 and oppApex2=O"
            ),
            "surplusIdx_eq_zero": True,
            "triangle_v3_role": "O",
            "triangle_v3_eq_O": True,
            "computed_oppIndex1": 1,
            "computed_oppIndex2": 2,
            "computed_oppApex2": "O",
            "premises_hold": True,
            "conclusion_holds": True,
        }
        assert ("xu" in j2) is (branch == "S0-I")


def test_all_inherited_exact_fibers_traces_and_singleton_blocking() -> None:
    physical = frozenset({"u", "xu", "delta", "v", "xv"})
    for branch, spec in SPECS.items():
        points = independent_points(branch)
        ku_radius2 = dist2(points["cu"], points["u"])
        kv_radius2 = dist2(points["cv"], points["v"])
        assert complete_fiber(points, "O", F(1)) == physical
        assert complete_fiber(points, "cu", ku_radius2) == spec["Ku"]
        assert complete_fiber(points, "cv", kv_radius2) == spec["Kv"]
        assert spec["Ku"] & physical == {"u", "xu"}
        assert spec["Kv"] & physical == {"v", "xv"}
        assert physical - spec["Ku"] - spec["Kv"] == {"delta"}
        assert "v" not in spec["Ku"] and "u" not in spec["Kv"]
        assert "delta" not in spec["Ku"] and "delta" not in spec["Kv"]
        for center, deleted in (("cu", "u"), ("cv", "v")):
            classes = radial_multiplicities(points, center, frozenset({deleted}))
            assert max(map(len, classes.values())) == 3
        modeled = witnesses.build_report()["branches"][branch]["rows"][
            "global_deletion_modeled_finite_set_predicates"
        ]
        assert modeled["modeled_rigid_2_plus_2_plus_1"]
        assert modeled["modeled_center_role"] == "cu"
        assert modeled["modeled_deleted_roles"] == ["u"]
        assert modeled["modeled_center_in_carrier_outside_physical_class"]
        assert modeled["modeled_deleted_nonempty"]
        assert modeled["modeled_deleted_subset_physical_class"]
        assert modeled["modeled_deleted_cardinality"] == 1
        assert modeled["modeled_deleted_cardinality_le_five"]
        assert modeled["modeled_blocked_after_delete_u"]
        assert modeled["modeled_restored_deleted_roles"] == []
        assert modeled["modeled_restores_four_class_at_cu"]
        assert not any(
            modeled["actual_Lean_global_deletion_fields_instantiated"].values()
        )
        assert not modeled["theorem_level_MinimalDeletionCore_instantiated"]


def test_first_apex_unique_four_deletions_caps_and_localization() -> None:
    first_class = frozenset({"O", "fp", "fq", "fw"})
    physical = frozenset({"u", "xu", "delta", "v", "xv"})
    report = witnesses.build_report()
    for branch, spec in SPECS.items():
        points = independent_points(branch)
        center = spec["first_center"]
        assert complete_fiber(points, center, F(1)) == first_class
        classes = radial_multiplicities(points, center)
        assert {
            radius2: roles for radius2, roles in classes.items() if len(roles) >= 4
        } == {F(1): first_class}
        for deleted in first_class:
            after = radial_multiplicities(points, center, frozenset({deleted}))
            assert max(map(len, after.values())) == 3
        assert points["fq"] != points["fw"]
        assert {"fq", "fw"} <= spec["J1"]
        assert "fq" not in spec["caps"][0] and "fw" not in spec["caps"][0]
        for deleted in ("fq", "fw"):
            assert complete_fiber(points, "O", F(1), frozenset({deleted})) == physical
        blocker_centers = witnesses.modeled_blocker_centers(points, branch)
        blocker_fiber = {
            role
            for role, blocker in blocker_centers.items()
            if blocker == blocker_centers["fq"]
        }
        assert blocker_fiber == first_class
        assert blocker_centers["u"] == "cu"
        assert blocker_centers["v"] == "cv"
        assert all(source != blocker for source, blocker in blocker_centers.items())
        checks = report["branches"][branch]["first_apex"][
            "retained_pair_localization_over_every_modeled_carrier_role"
        ]
        assert checks["quantified_roles"] == list(spec["order"])
        for role in spec["order"]:
            antecedent = role != center and dist2(points[role], points["fq"]) == dist2(
                points[role], points["fw"]
            )
            assert (not antecedent) or role in spec["J1"]
            assert checks["checks"][role]["implication_holds"]


def test_modeled_source_context_geometry_and_both_survivals() -> None:
    physical = frozenset({"u", "xu", "delta", "v", "xv"})
    first_class = frozenset({"O", "fp", "fq", "fw"})
    report = witnesses.build_report()
    for branch, spec in SPECS.items():
        points = independent_points(branch)
        ku = spec["Ku"]
        cross = ku & (physical & spec["J2"])
        assert cross == spec["cross"] and len(cross) <= 2
        assert "u" not in first_class
        assert "fq" not in ku and "fw" not in ku
        ku_radius2 = dist2(points["cu"], points["u"])
        assert complete_fiber(points, "cu", ku_radius2, frozenset({"fq"})) == ku
        assert complete_fiber(points, "cu", ku_radius2, frozenset({"fw"})) == ku
        context = report["branches"][branch]["source_context"]
        assert context["modeled_first_apex_blocker_fiber_at_fq_roles"] == sorted(
            first_class
        )
        assert context["source_outside_modeled_first_apex_blocker_fiber"]
        assert context["assignments"] == {
            "source": "u",
            "other": "v",
            "q": "fq",
            "w": "fw",
            "source_blocker": "cu",
            "other_blocker": "cv",
            "selected_S0_arm": "u = source",
        }
        checks = context["modeled_source_context_geometry_checks"]
        assert len(checks) == context["modeled_geometry_check_count"] == 13
        assert checks["modeled_source_outside_first_apex_blocker_fiber_proxy"]
        assert all(checks.values())
        assert context["Lean_source_context_field_count"] == 13
        assert context["Lean_source_context_fields_instantiated_count"] == 0
        assert context["all_finite_source_context_geometry_holds"]
        assert not context["lean_subtype_and_system_fields_instantiated"]


def test_global_K4_is_false_and_claim_scope_is_fail_closed() -> None:
    report = witnesses.build_report()
    assert report["source_anchors"]["opp_index1"].endswith(
        "Cap/PartitionFromMEC.lean:543"
    )
    assert report["source_anchors"]["opp_index2"].endswith(
        "Cap/PartitionFromMEC.lean:550"
    )
    assert report["source_anchors"]["opp_apex2"].endswith(
        "P97/U1TwoShortCapReduction.lean:305"
    )
    expected_false = {
        "full_field_level_Lean_source_context",
        "CounterexampleData",
        "CriticalShellSystem",
        "OriginalUniqueFourResidual",
        "Minimal",
        "JointDeletion",
        "CommonDeletion",
        "robust_surface",
        "global_K4",
        "full_theorem",
        "lean_claim",
        "promotion_claim",
    }
    assert report["status"] == witnesses.STATUS
    assert all(report["claim_scope"][key] is False for key in expected_false)
    assert report["first_unmodeled_next_interface"]["name"] == (
        "Lean-bound source-indexed CriticalShellSystem ingress"
    )
    assert report["supplied_value_discrepancies"] == []
    for branch in SPECS:
        census = report["branches"][branch]["global_K4_census"]
        assert census["global_K4_holds_on_modeled_carrier"] is False
        assert census["centers_without_a_modeled_four_class"]

    status_labels: set[str] = set()

    def collect(value: Any) -> None:
        if isinstance(value, dict):
            for nested in value.values():
                collect(nested)
        elif isinstance(value, list):
            for nested in value:
                collect(nested)
        elif isinstance(value, str) and value.startswith("SAT_"):
            status_labels.add(value)

    collect(report)
    assert status_labels == {witnesses.STATUS}


def test_source_and_report_JSON_are_deterministic_and_byte_identical(
    tmp_path: Path,
) -> None:
    report = witnesses.build_report()
    expected = json.dumps(report, indent=2, sort_keys=True) + "\n"
    first = tmp_path / "first.json"
    second = tmp_path / "second.json"
    witnesses.write_json(first, report)
    witnesses.write_json(second, witnesses.build_report())
    assert first.read_bytes() == second.read_bytes()
    assert first.read_text(encoding="utf-8") == expected

    solver_dir = Path(__file__).resolve().parent
    repository = Path(__file__).resolve().parents[4]
    source_json = solver_dir / "s0-true-cap-wave2-l2-witnesses.json"
    report_json = repository / (
        "scratch/runs/rigid221-s0-coupled-two-row-residue-lantern-20260831/"
        "l2-source-context-wave1/source-context-witness-report.json"
    )
    assert source_json.read_text(encoding="utf-8") == expected
    assert report_json.read_text(encoding="utf-8") == expected
    assert source_json.read_bytes() == report_json.read_bytes()

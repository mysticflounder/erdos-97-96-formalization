# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
import sys
from fractions import Fraction as F
from itertools import combinations
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).parent))

import rigid221_s0_l3_field_packet_witnesses as witnesses  # noqa: I001


SPECS = {
    "S0-I": {
        "order": (
            "O",
            "fq",
            "fw",
            "fp",
            "r1",
            "r2",
            "d3",
            "d2",
            "d1",
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
        "cdelta": "xu",
        "Ku": frozenset({"u", "xu", "q1", "q2"}),
        "Kv": frozenset({"v", "xv", "r1", "r2"}),
        "caps": (5, 10, 7),
        "growth": "firstOpposite",
    },
    "S0-N": {
        "order": (
            "O",
            "qu2",
            "qu1",
            "qv2",
            "d3",
            "d2",
            "d1",
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
        "cdelta": "xv",
        "Ku": frozenset({"u", "xu", "qu1", "qu2"}),
        "Kv": frozenset({"v", "xv", "qv1", "qv2"}),
        "caps": (8, 6, 7),
        "growth": "surplus",
    },
}


def add(first: witnesses.Point, second: witnesses.Point) -> witnesses.Point:
    return first[0] + second[0], first[1] + second[1]


def sub(first: witnesses.Point, second: witnesses.Point) -> witnesses.Point:
    return first[0] - second[0], first[1] - second[1]


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
    retained = json.loads(witnesses.L2_JSON.read_text(encoding="utf-8"))
    points = {
        role: (F(value[0]), F(value[1]))
        for role, value in retained["branches"][branch]["points"].items()
    }
    center = SPECS[branch]["cdelta"]
    for role, parameter in witnesses.DELTA_PARAMETERS.items():
        points[role] = rot(points[center], points["delta"], parameter)
    return points


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


def radial_maximum(
    points: dict[str, witnesses.Point],
    center: str,
    deleted: frozenset[str] = frozenset(),
) -> int:
    classes: dict[F, int] = {}
    for role, point in points.items():
        if role in deleted:
            continue
        radius2 = dist2(points[center], point)
        if radius2 > 0:
            classes[radius2] = classes.get(radius2, 0) + 1
    return max(classes.values(), default=0)


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


def test_l2_certificate_input_and_l3_formulas_are_exact() -> None:
    l2_report, raw = witnesses.load_l2_certificate()
    assert l2_report["status"] == witnesses.l2_input.STATUS
    report = witnesses.build_report()
    assert (
        report["input_provenance"]["sha256"]
        == witnesses.hashlib.sha256(raw).hexdigest()
    )
    for branch, spec in SPECS.items():
        points = independent_points(branch)
        assert points == witnesses.build_branch_points(branch)
        assert set(points) == set(spec["order"])
        assert all(
            isinstance(coordinate, F)
            for point in points.values()
            for coordinate in point
        )
        assert dist2(points[spec["cdelta"]], points["delta"]) == F(80656, 54389)


def test_pairwise_distinct_strict_convexity_and_MEC_boundary() -> None:
    report = witnesses.build_report()
    mec_center = (F(137, 210), F(0))
    mec_radius2 = F(18769, 44100)
    for branch, spec in SPECS.items():
        points = independent_points(branch)
        order = spec["order"]
        assert all(dist2(points[a], points[b]) > 0 for a, b in combinations(order, 2))
        orientations = []
        for index, first in enumerate(order):
            second = order[(index + 1) % len(order)]
            for other in order:
                if other not in (first, second):
                    value = orient(points[first], points[second], points[other])
                    assert value > 0
                    orientations.append(value)
        certificate = report["branches"][branch]["strict_convexity"]
        assert certificate["check_count"] == len(order) * (len(order) - 2)
        assert F(certificate["minimum_orientation"]) == min(orientations)
        slacks = {
            role: mec_radius2 - dist2(mec_center, point)
            for role, point in points.items()
        }
        assert all(slack >= 0 for slack in slacks.values())
        assert {role for role, slack in slacks.items() if slack == 0} == set(
            spec["triple"]
        )


def test_cap_cards_endpoint_pattern_and_growth_cells() -> None:
    report = witnesses.build_report()
    expected_endpoint_pattern = {
        "v1": {"C1": False, "C2": True, "C3": True},
        "v2": {"C1": True, "C2": False, "C3": True},
        "v3": {"C1": True, "C2": True, "C3": False},
    }
    for branch, spec in SPECS.items():
        points = independent_points(branch)
        caps = independent_caps(points, spec["triple"])
        assert tuple(map(len, caps)) == spec["caps"]
        endpoint_pattern = {
            vertex_name: {
                cap_name: role in cap
                for cap_name, cap in zip(("C1", "C2", "C3"), caps, strict=True)
            }
            for vertex_name, role in zip(
                ("v1", "v2", "v3"), spec["triple"], strict=True
            )
        }
        assert endpoint_pattern == expected_endpoint_pattern
        branch_report = report["branches"][branch]
        assert branch_report["caps"]["endpoint_pattern"] == endpoint_pattern
        assert (
            branch_report["robust_surface"]["modeled_capGrowth"]["constructor"]
            == spec["growth"]
        )


def test_exact_fibers_delta_row_and_all_three_critical_deletions() -> None:
    physical = frozenset({"u", "xu", "delta", "v", "xv"})
    first_class = frozenset({"O", "fp", "fq", "fw"})
    kdelta = frozenset({"delta", "d1", "d2", "d3"})
    for branch, spec in SPECS.items():
        points = independent_points(branch)
        ku_radius2 = dist2(points["cu"], points["u"])
        kv_radius2 = dist2(points["cv"], points["v"])
        delta_radius2 = dist2(points[spec["cdelta"]], points["delta"])
        assert complete_fiber(points, "O", F(1)) == physical
        assert complete_fiber(points, "cu", ku_radius2) == spec["Ku"]
        assert complete_fiber(points, "cv", kv_radius2) == spec["Kv"]
        first_center = witnesses.l2_input.BRANCH_SPECS[branch]["first_center"]
        assert complete_fiber(points, first_center, F(1)) == first_class
        assert complete_fiber(points, spec["cdelta"], delta_radius2) == kdelta
        assert radial_maximum(points, "cu", frozenset({"u"})) == 3
        assert radial_maximum(points, "cv", frozenset({"v"})) == 3
        assert radial_maximum(points, spec["cdelta"], frozenset({"delta"})) == 3


def test_joint_deletion_and_nested_common_packets_replay_every_field() -> None:
    report = witnesses.build_report()
    physical_without_delta = frozenset({"u", "xu", "v", "xv"})
    for branch, spec in SPECS.items():
        points = independent_points(branch)
        joint = report["branches"][branch]["joint_deletion"]
        assert all(joint["modeled_outer_field_checks"].values())
        assert joint["assignments"] == {
            "deleted": "delta",
            "actual_blocker_of_deleted_proxy": spec["cdelta"],
        }
        for packet_name, support1 in (
            ("modeled_uPacket", spec["Ku"]),
            ("modeled_vPacket", spec["Kv"]),
        ):
            packet = joint[packet_name]
            assert all(packet["modeled_outer_field_checks"].values())
            assert packet["assignments"]["B1"] == sorted(support1)
            assert packet["assignments"]["B2"] == sorted(physical_without_delta)
            assert packet["modeled_overlap_cardinality"] == 2
            for row_name in ("modeled_row1", "modeled_row2"):
                row = packet[row_name]
                assert row["modeled_subset_of_carrier_erase_q_erase_center"]
                assert row["modeled_cardinality"] == 4
                assert row["modeled_cardinality_ge_four"]
                assert row["modeled_q_not_mem"]
                assert row["modeled_radius_squared_positive"]
                assert not row["actual_typed_U5QDeletedK4Class_instantiated"]
        assert not joint[
            "actual_typed_ExactFourMutualOmissionJointDeletion_instantiated"
        ]
        assert points[spec["cdelta"]] != points["cu"]
        assert points[spec["cdelta"]] != points["cv"]
        assert points[spec["cdelta"]] != points["O"]


def test_robust_surface_ingress_deletion_quantifier_and_radius_classification() -> None:
    report = witnesses.build_report()
    physical = frozenset({"u", "xu", "delta", "v", "xv"})
    for branch in SPECS:
        robust = report["branches"][branch]["robust_surface"]
        assert all(robust["modeled_outer_field_checks"].values())
        for deleted, check in robust[
            "modeled_secondApex_robust_deletion_checks"
        ].items():
            expected = 4 if deleted in physical else 5
            assert check["remaining_cardinality"] == expected
            assert check["survives"]
        radius = robust["modeled_radiusClassification"]
        assert radius["constructor"] == "fivePointRadius"
        assert radius["radius_squared"] == "1/1"
        assert radius["class_roles"] == sorted(physical)
        assert radius["class_cardinality"] == 5
        ingress = robust["modeled_ingress"]
        assert ingress["assignments"] == {
            "deleted": "fq",
            "source": "u",
            "blocker": "cu",
        }
        assert all(ingress["modeled_packet"]["modeled_outer_field_checks"].values())
        assert not robust[
            "actual_typed_ExactFourPostCardElevenRobustSurface_instantiated"
        ]


def test_global_deletion_and_singleton_minimal_core_geometry() -> None:
    report = witnesses.build_report()
    for branch, spec in SPECS.items():
        global_deletion = report["branches"][branch]["global_deletion"]
        assert global_deletion["assignments"] == {"center": "cu", "deleted": ["u"]}
        assert all(global_deletion["modeled_field_checks"].values())
        geometry = global_deletion["modeled_geometry_branch"]
        assert geometry["constructor"] == "MinimalDeletionCore"
        core = geometry["modeled_singleton_core"]
        assert core["modeled_shellAt_index_roles"] == ["u"]
        assert core["modeled_shellAt_support"] == sorted(spec["Ku"])
        assert core["modeled_shellAt_complete_ambient_fiber"]
        assert core["modeled_supports_pairwise_disjoint_vacuous_for_singleton"]
        assert core["modeled_pairwise_disjoint_quantified_pairs"] == [
            {"s": "u", "t": "u", "s_ne_t": False, "implication_holds": True}
        ]
        shell = geometry["modeled_shell"]
        assert shell["assignments"]["source"] == "u"
        assert shell["assignments"]["center"] == "cu"
        assert shell["assignments"]["support"] == sorted(spec["Ku"])
        assert all(shell["modeled_field_checks"].values())
        assert not shell["actual_typed_CriticalSelectedFourClass_instantiated"]
        assert global_deletion["modeled_restores_quantified_over_deleted"] == [
            {
                "s": "u",
                "s_mem_deleted": True,
                "deleted_erase_s": [],
                "restored_K4_support": sorted(spec["Ku"]),
                "restored_K4_holds": True,
            }
        ]
        assert not geometry["actual_typed_MinimalDeletionCore_instantiated"]
        assert not global_deletion[
            "actual_typed_ExactFourMutualOmissionRigid221GlobalDeletion_instantiated"
        ]


def test_scope_discrepancies_and_first_global_boundary() -> None:
    report = witnesses.build_report()
    assert report["status"] == witnesses.STATUS
    assert report["supplied_value_discrepancies"] == []
    assert report["first_unmodeled_next_interface"]["name"] == (
        "conditional downstream R.minimal : D.Minimal ingress"
    )
    for key in (
        "full_typed_Lean_packets",
        "CounterexampleData",
        "CriticalShellSystem",
        "OriginalUniqueFourResidual",
        "global_K4",
        "full_theorem",
        "lean_claim",
        "promotion_claim",
    ):
        assert report["claim_scope"][key] is False
    for branch in SPECS:
        data = report["branches"][branch]
        assert data["all_named_finite_packet_geometry_replayed"]
        assert not data["global_K4_census"]["global_K4_holds_on_modeled_carrier"]
        assert data["global_K4_census"]["centers_without_a_modeled_four_class"]


@pytest.mark.parametrize("branch", ("S0-I", "S0-N"))
def test_mutation_of_delta_row_coordinate_is_rejected(branch: str) -> None:
    points = independent_points(branch)
    x, y = points["d1"]
    points["d1"] = x + F(1, 10**12), y
    with pytest.raises(ValueError):
        witnesses.certify_branch(branch, points)


@pytest.mark.parametrize("branch", ("S0-I", "S0-N"))
def test_mutation_collision_or_missing_role_is_rejected(branch: str) -> None:
    collision = independent_points(branch)
    collision["d2"] = collision["d1"]
    with pytest.raises(ValueError):
        witnesses.certify_branch(branch, collision)

    missing = independent_points(branch)
    del missing["d3"]
    with pytest.raises(ValueError):
        witnesses.certify_branch(branch, missing)


def test_JSON_artifacts_and_markdown_are_deterministic_and_identical(
    tmp_path: Path,
) -> None:
    report = witnesses.build_report()
    expected_json = json.dumps(report, indent=2, sort_keys=True) + "\n"
    first = tmp_path / "first.json"
    second = tmp_path / "second.json"
    witnesses.write_json(first, report)
    witnesses.write_json(second, witnesses.build_report())
    assert first.read_bytes() == second.read_bytes()
    assert first.read_text(encoding="utf-8") == expected_json

    source_json = witnesses.SOLVER_DIR / "s0-true-cap-wave2-l3-witnesses.json"
    run_json = witnesses.REPOSITORY / (
        "scratch/runs/rigid221-s0-coupled-two-row-residue-lantern-20260831/"
        "l3-field-packet-wave1/field-packet-witness-report.json"
    )
    markdown = witnesses.REPOSITORY / (
        "docs/computation/rigid221-s0-coupled-two-row-residue-lantern-20260831/"
        "s0-true-cap-wave2-l3.md"
    )
    assert source_json.read_text(encoding="utf-8") == expected_json
    assert run_json.read_text(encoding="utf-8") == expected_json
    assert source_json.read_bytes() == run_json.read_bytes()
    assert markdown.read_text(encoding="utf-8") == witnesses.render_markdown(report)

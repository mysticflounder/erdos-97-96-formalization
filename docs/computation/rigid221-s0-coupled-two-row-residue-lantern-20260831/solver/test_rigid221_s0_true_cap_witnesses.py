# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
import sys
from collections import Counter
from fractions import Fraction as F
from itertools import combinations
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))

import rigid221_s0_true_cap_witnesses as witnesses  # noqa: I001


SPECS = {
    "S0-I": {
        "order": (
            "O",
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
        "Ku": frozenset({"u", "xu", "q1", "q2"}),
        "Kv": frozenset({"v", "xv", "r1", "r2"}),
        "caps": (
            frozenset({"O", "q1", "q2", "s", "xv"}),
            frozenset({"O", "delta", "r1", "r2"}),
            frozenset({"cu", "cv", "delta", "u", "v", "xu", "xv"}),
        ),
        "J": frozenset({"cu", "cv", "u", "v", "xu"}),
        "minimum_hull": F(17677329, 639750612500),
        "minimum_hull_roles": ("cu", "cv", "xu"),
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
        ),
        "triple": ("xu", "delta", "O"),
        "Ku": frozenset({"u", "xu", "qu1", "qu2"}),
        "Kv": frozenset({"v", "xv", "qv1", "qv2"}),
        "caps": (
            frozenset({"O", "delta", "qu1", "qu2", "qv2"}),
            frozenset({"O", "qv1", "xu"}),
            frozenset({"cu", "cv", "delta", "u", "v", "xu", "xv"}),
        ),
        "J": frozenset({"cu", "cv", "u", "v", "xv"}),
        "minimum_hull": F(3840, 51180049),
        "minimum_hull_roles": ("delta", "v", "u"),
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
    a = (1 - parameter * parameter) / (1 + parameter * parameter)
    b = 2 * parameter / (1 + parameter * parameter)
    x, y = sub(point, center)
    return add(center, (a * x - b * y, b * x + a * y))


def on_arc_opposite(
    vi: witnesses.Point,
    vj: witnesses.Point,
    vk: witnesses.Point,
    point: witnesses.Point,
) -> bool:
    return orient(point, vj, vk) * orient(vi, vj, vk) <= 0


def independent_formula(branch: str) -> dict[str, witnesses.Point]:
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
        return points
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
    points: dict[str, witnesses.Point], center: str, radius2: F
) -> frozenset[str]:
    return frozenset(
        role
        for role, point in points.items()
        if dist2(points[center], point) == radius2
    )


def test_raw_formulas_reconstruct_every_coordinate_with_fraction_only() -> None:
    assert p(F(-4, 11)) == (F(105, 137), F(-88, 137))
    assert p(F(-10, 29)) == (F(741, 941), F(-580, 941))
    assert p(F(-6, 19)) == (F(325, 397), F(-228, 397))
    for branch in SPECS:
        expected = independent_formula(branch)
        actual = witnesses.build_branch_points(branch)
        assert actual == expected
        assert all(
            isinstance(coordinate, F)
            for point in actual.values()
            for coordinate in point
        )
        assert set(actual) == set(SPECS[branch]["order"])


def test_all_roles_distinct_and_every_hull_edge_check_is_strict() -> None:
    report = witnesses.build_report()
    for branch, spec in SPECS.items():
        points = independent_formula(branch)
        order = spec["order"]
        assert len(set(points.values())) == len(points)
        assert all(dist2(points[a], points[b]) > 0 for a, b in combinations(order, 2))

        values = []
        for index, first in enumerate(order):
            second = order[(index + 1) % len(order)]
            for other in order:
                if other in (first, second):
                    continue
                value = orient(points[first], points[second], points[other])
                assert value > 0
                values.append((value, first, second, other))
        assert len(values) == len(order) * (len(order) - 2)
        assert min(values) == (
            spec["minimum_hull"],
            *spec["minimum_hull_roles"],
        )
        certificate = report["branches"][branch]["strict_convexity"]
        assert F(certificate["minimum_orientation"]) == spec["minimum_hull"]
        assert certificate["check_count"] == len(values)


def test_mec_enclosure_exact_boundary_and_minimality_witness() -> None:
    center = (F(137, 210), F(0))
    radius = F(137, 210)
    radius2 = F(18769, 44100)
    assert dist2(center, (F(0), F(0))) == radius2
    weights_by_vertex = (radius2, radius2, 1 - 2 * radius2)
    assert weights_by_vertex == (
        F(18769, 44100),
        F(18769, 44100),
        F(3281, 22050),
    )
    assert sum(weights_by_vertex, start=F(0)) == 1
    assert all(weight > 0 for weight in weights_by_vertex)

    for branch, spec in SPECS.items():
        points = independent_formula(branch)
        triple = spec["triple"]
        slacks = {
            role: radius2 - dist2(center, point) for role, point in points.items()
        }
        assert all(slack >= 0 for slack in slacks.values())
        assert {role for role, slack in slacks.items() if slack == 0} == set(triple)
        assert all(slacks[role] > 0 for role in set(points) - set(triple))
        barycenter = (
            sum(
                (
                    weight * points[role][0]
                    for role, weight in zip(triple, weights_by_vertex, strict=True)
                ),
                start=F(0),
            ),
            sum(
                (
                    weight * points[role][1]
                    for role, weight in zip(triple, weights_by_vertex, strict=True)
                ),
                start=F(0),
            ),
        )
        assert barycenter == center
        assert (
            sum(
                (
                    weight * dist2(points[role], center)
                    for role, weight in zip(triple, weights_by_vertex, strict=True)
                ),
                start=F(0),
            )
            == radius2
        )
        # Positive boundary weights summing to one and barycentered at M give
        # sum w_b |b-c|^2 = r^2 + |M-c|^2 for every candidate center c.
        for candidate_center in ((F(0), F(0)), (F(1, 3), F(-2, 5)), center):
            left = sum(
                (
                    weight * dist2(points[role], candidate_center)
                    for role, weight in zip(triple, weights_by_vertex, strict=True)
                ),
                start=F(0),
            )
            assert left == radius2 + dist2(center, candidate_center)
        assert radius > 0


def test_moser_source_fields_and_ordered_non_obtuse_dots() -> None:
    report = witnesses.build_report()
    center = (F(137, 210), F(0))
    radius2 = F(18769, 44100)
    for branch, spec in SPECS.items():
        points = independent_formula(branch)
        v1, v2, v3 = spec["triple"]
        assert points[v1] != points[v2]
        assert points[v1] != points[v3]
        assert points[v2] != points[v3]
        assert all(dist2(center, points[role]) == radius2 for role in (v1, v2, v3))
        assert all(
            dist2(points[first], points[second]) > 0
            for first, second in ((v1, v2), (v1, v3), (v2, v3))
        )
        dots = (
            dot(sub(points[v2], points[v1]), sub(points[v3], points[v1])),
            dot(sub(points[v3], points[v2]), sub(points[v1], points[v2])),
            dot(sub(points[v1], points[v3]), sub(points[v2], points[v3])),
        )
        assert dots == (
            F(15488, 18769),
            F(15488, 18769),
            F(3281, 18769),
        )
        assert all(value >= 0 for value in dots)
        moser = report["branches"][branch]["moser"]
        assert moser["source_extra_pair_distance_conditions"] == []
        assert list(moser["non_obtuse_dot_products"].values()) == [
            "15488/18769",
            "15488/18769",
            "3281/18769",
        ]


def test_on_arc_filters_and_every_cap_triple_membership_axiom() -> None:
    report = witnesses.build_report()
    expected_endpoint_patterns = {
        "v1": (False, True, True),
        "v2": (True, False, True),
        "v3": (True, True, False),
    }
    for branch, spec in SPECS.items():
        points = independent_formula(branch)
        triple = spec["triple"]
        caps = independent_caps(points, triple)
        assert caps == spec["caps"]
        assert tuple(map(len, caps)) == ((5, 4, 7) if branch == "S0-I" else (5, 3, 7))
        assert all(cap <= set(points) for cap in caps)
        for vertex_index, (vertex_name, role) in enumerate(
            zip(("v1", "v2", "v3"), triple, strict=True)
        ):
            pattern = tuple(role in cap for cap in caps)
            assert pattern == expected_endpoint_patterns[vertex_name]
            assert sum(pattern) == 2
            assert not pattern[vertex_index]
        for role in points:
            multiplicity = sum(role in cap for cap in caps)
            assert multiplicity == (2 if role in triple else 1)
        certificate = report["branches"][branch]["caps"]
        assert certificate["surplus_idx"] == 0
        assert certificate["surplus_cardinality_strictly_greater_than_four"] is True
        for cap_index, cap_name in enumerate(("C1", "C2", "C3")):
            assert set(certificate["members"][cap_name]) == set(caps[cap_index])
            assert {
                role
                for role, accepted in certificate["on_arc_opposite_truth_table"][
                    cap_name
                ].items()
                if accepted
            } == set(caps[cap_index])


def test_opp_index_rotation_endpoints_J_and_separate_s0_branches() -> None:
    report = witnesses.build_report()
    assert (2, 0, 1)[0] == 2
    for branch, spec in SPECS.items():
        triple = spec["triple"]
        caps = spec["caps"]
        opp_index2 = (2, 0, 1)[0]
        endpoints_by_index = ((1, 2), (2, 0), (0, 1))
        endpoints = tuple(triple[index] for index in endpoints_by_index[opp_index2])
        j = caps[opp_index2] - frozenset(endpoints)
        triangle_by_index = tuple(
            triple[(opp_index2 + offset) % 3] for offset in range(3)
        )
        cap_frame = (triangle_by_index[1], triangle_by_index[2], triangle_by_index[0])
        packet = report["branches"][branch]["packet"]
        assert opp_index2 == 2
        assert triple[opp_index2] == "O"
        assert tuple(packet["triangle_by_opp_index2"]) == triangle_by_index
        assert tuple(packet["cap_frame_by_opp_index2"]) == cap_frame
        assert tuple(packet["cap_endpoints"]) == endpoints
        assert j == spec["J"] == set(packet["J"])
        assert "u" in j and "v" in j
        assert ("xu" in j) is (branch == "S0-I")


def test_exact_five_and_complete_Ku_Kv_fibers_in_full_carrier() -> None:
    physical = frozenset({"u", "xu", "delta", "v", "xv"})
    for branch, spec in SPECS.items():
        points = independent_formula(branch)
        assert complete_fiber(points, "O", F(1)) == physical
        assert len(physical) == 5
        assert all(dist2(points["O"], points[role]) == 1 for role in physical)
        ku_radius2 = dist2(points["cu"], points["u"])
        kv_radius2 = dist2(points["cv"], points["v"])
        assert ku_radius2 > 0 and kv_radius2 > 0
        assert complete_fiber(points, "cu", ku_radius2) == spec["Ku"]
        assert complete_fiber(points, "cv", kv_radius2) == spec["Kv"]


def test_traces_omissions_source_other_and_centers() -> None:
    physical = frozenset({"u", "xu", "delta", "v", "xv"})
    for branch, spec in SPECS.items():
        points = independent_formula(branch)
        ku = spec["Ku"]
        kv = spec["Kv"]
        j = spec["J"]
        assert ku & physical == {"u", "xu"}
        assert kv & physical == {"v", "xv"}
        assert (ku & physical).isdisjoint(kv & physical)
        assert physical - ku - kv == {"delta"}
        assert "v" not in ku and "u" not in kv
        assert "delta" not in ku and "delta" not in kv
        assert "u" in ku and "u" in j

        # The optional assignment other := v satisfies the listed later-layer
        # compatibility fields; the retained document explicitly keeps L2 false.
        assert points["v"] != points["u"]
        assert "v" in physical and "v" in j and "v" not in ku
        assert points["cu"] != points["cv"]
        assert "cu" not in complete_fiber(points, "O", F(1))


def test_deletion_multiplicity_maxima_are_three_from_full_distance_classes() -> None:
    report = witnesses.build_report()
    for branch in SPECS:
        points = independent_formula(branch)
        for center, deleted, report_key in (
            ("cu", "u", "delete_u_at_cu"),
            ("cv", "v", "delete_v_at_cv"),
        ):
            multiplicities = Counter(
                dist2(points[center], point)
                for role, point in points.items()
                if role != deleted and dist2(points[center], point) > 0
            )
            assert max(multiplicities.values()) == 3
            certificate = report["branches"][branch]["rows"]["deletion_multiplicity"][
                report_key
            ]
            assert certificate["maximum_positive_radius_multiplicity"] == 3
            assert {
                F(entry["radius_squared"]): frozenset(entry["roles"])
                for entry in certificate["radius_classes"]
            } == {
                radius2: frozenset(
                    role
                    for role, point in points.items()
                    if role != deleted and dist2(points[center], point) == radius2
                )
                for radius2 in multiplicities
            }


def test_claim_scope_is_fail_closed_and_only_one_status_label_is_used() -> None:
    report = witnesses.build_report()
    assert report["schema"] == "rigid221-s0-true-cap-witnesses/v1"
    assert report["status"] == "SAT_EXACT_L1_CAP_TWO_ROW_CORE"
    assert report["solver_invoked"] is False
    assert report["claim_scope"] == {
        "l1_cap_two_row_core": True,
        "full_theorem": False,
        "counterexample_data": False,
        "l2": False,
        "l3": False,
        "lean_claim": False,
        "promotion_claim": False,
    }
    assert set(report["branches"]) == {"S0-I", "S0-N"}
    assert all("status" not in branch for branch in report["branches"].values())
    discrepancy = report["supplied_value_discrepancies"]
    assert discrepancy[0]["exact_replay_order"] == [
        "15488/18769",
        "15488/18769",
        "3281/18769",
    ]


def test_source_and_report_json_are_deterministic_and_byte_identical(
    tmp_path: Path,
) -> None:
    first = tmp_path / "first.json"
    second = tmp_path / "second.json"
    witnesses.write_json(first, witnesses.build_report())
    witnesses.write_json(second, witnesses.build_report())
    assert first.read_bytes() == second.read_bytes()

    source = Path(__file__).with_name("s0-true-cap-wave2-witnesses.json")
    repo_root = Path(__file__).resolve().parents[4]
    retained_report = (
        repo_root
        / "scratch/runs/rigid221-s0-coupled-two-row-residue-lantern-20260831"
        / "l1-cap-wave2/true-cap-witness-report.json"
    )
    assert source.read_bytes() == retained_report.read_bytes() == first.read_bytes()
    assert json.loads(source.read_text(encoding="utf-8"))["status"] == witnesses.STATUS

#!/usr/bin/env python3
"""Exact local models separating transition data from MEC retriangulation.

The arithmetic is rational throughout.  These are deliberately not models of
``OriginalUniqueFourResidual``: they do not supply global all-center K4,
minimality, a critical-shell system, or the protected-deletion-set provenance.
They test the narrower proposed implication from a fresh-center collision or
minimal core, together with the physical MEC/cap geometry, to an alternative
MEC support triangle with two exact four-caps.
"""

from __future__ import annotations

import json
from fractions import Fraction
from typing import Iterable


Q = Fraction
Point = tuple[Q, Q]


def add(a: Point, b: Point) -> Point:
    return a[0] + b[0], a[1] + b[1]


def sub(a: Point, b: Point) -> Point:
    return a[0] - b[0], a[1] - b[1]


def scale(c: Q, a: Point) -> Point:
    return c * a[0], c * a[1]


def dot(a: Point, b: Point) -> Q:
    return a[0] * b[0] + a[1] * b[1]


def cross(o: Point, a: Point, b: Point) -> Q:
    oa = sub(a, o)
    ob = sub(b, o)
    return oa[0] * ob[1] - oa[1] * ob[0]


def norm_sq(a: Point) -> Q:
    return dot(a, a)


def dist_sq(a: Point, b: Point) -> Q:
    return norm_sq(sub(a, b))


def rational_unit(t: Q) -> Point:
    """The standard rational parametrization of the unit circle."""

    denominator = 1 + t * t
    return (1 - t * t) / denominator, 2 * t / denominator


def radius_profile(
    points: dict[str, Point], center: str, deleted: Iterable[str] = ()
) -> dict[Q, set[str]]:
    erased = set(deleted)
    profile: dict[Q, set[str]] = {}
    for name, point in points.items():
        if name == center or name in erased:
            continue
        radius = dist_sq(points[center], point)
        if radius != 0:
            profile.setdefault(radius, set()).add(name)
    return profile


def has_k4(profile: dict[Q, set[str]]) -> bool:
    return any(len(members) >= 4 for members in profile.values())


def build_points(include_fifth_shell_point: bool) -> dict[str, Point]:
    boundary = {
        "B0": rational_unit(Q(3, 28)),
        "B1": rational_unit(Q(-18)),
        "B2": rational_unit(Q(-1, 12)),
    }
    center = (Q(-11, 40), Q(11, 80))
    shell_radius = Q(8, 11)
    shell_directions = [Q(-17), Q(-18, 5), Q(-19, 10), Q(-6, 5)]
    if include_fifth_shell_point:
        shell_directions.append(Q(-4, 5))
    shell = {
        f"p{index}": add(center, scale(shell_radius, rational_unit(t)))
        for index, t in enumerate(shell_directions)
    }

    # Two strict carrier points on the short B2--B0 MEC arc.
    near_boundary = {
        "a0": scale(Q(999, 1000), rational_unit(Q(-1, 25))),
        "a1": scale(Q(999, 1000), rational_unit(Q(1, 23))),
    }

    # A rational point just outside the old B0--X chord, but strictly inside
    # the unit disk.  It subdivides that hull edge without hiding either end.
    edge = sub(center, boundary["B0"])
    midpoint = scale(Q(1, 2), add(center, boundary["B0"]))
    chord_point = add(midpoint, scale(Q(1, 50), (edge[1], -edge[0])))

    return {
        **boundary,
        "X": center,
        **shell,
        **near_boundary,
        "e": chord_point,
    }


def barycentric_origin(a: Point, b: Point, c: Point) -> tuple[Q, Q, Q]:
    denominator = cross(a, b, c)
    alpha = cross((Q(0), Q(0)), b, c) / denominator
    beta = cross(a, (Q(0), Q(0)), c) / denominator
    gamma = cross(a, b, (Q(0), Q(0))) / denominator
    return alpha, beta, gamma


def verify_common_geometry(
    points: dict[str, Point], expected_order: list[str], expected_profile: list[int]
) -> None:
    assert set(points) == set(expected_order)
    for index, name in enumerate(expected_order):
        successor = expected_order[(index + 1) % len(expected_order)]
        for other in expected_order:
            if other not in {name, successor}:
                assert cross(points[name], points[successor], points[other]) > 0

    boundary = {"B0", "B1", "B2"}
    for name, point in points.items():
        defect = 1 - norm_sq(point)
        assert defect == 0 if name in boundary else defect > 0

    # Positive barycentric coordinates put the origin in the interior of the
    # boundary triangle.  Hence its three unit-circle points force MEC radius
    # at least one, while the unit disk already contains the whole carrier.
    weights = barycentric_origin(points["B0"], points["B1"], points["B2"])
    assert all(weight > 0 for weight in weights)
    assert sum(weights) == 1
    weighted_sum = add(
        add(scale(weights[0], points["B0"]), scale(weights[1], points["B1"])),
        scale(weights[2], points["B2"]),
    )
    assert weighted_sum == (0, 0)

    # The boundary triangle is nonobtuse.
    triangle = [points["B0"], points["B1"], points["B2"]]
    for index, vertex in enumerate(triangle):
        assert dot(
            sub(triangle[(index + 1) % 3], vertex),
            sub(triangle[(index + 2) % 3], vertex),
        ) >= 0

    positions = sorted(expected_order.index(name) for name in boundary)
    gaps = [
        positions[1] - positions[0],
        positions[2] - positions[1],
        positions[0] + len(expected_order) - positions[2],
    ]
    assert sorted(gap + 1 for gap in gaps) == sorted(expected_profile)
    assert expected_profile.count(4) == 1

    # Exactly three carrier points are on the MEC boundary, so every
    # circumscribed support triangle uses this same triple.  Its unique cap
    # profile has only one exact four-cap, never an exact pair.
    assert {name for name, point in points.items() if norm_sq(point) == 1} == boundary
    assert 1 - norm_sq(points["X"]) > 0


def verify_collision_model() -> dict[str, object]:
    points = build_points(include_fifth_shell_point=True)
    order = ["p0", "B1", "p1", "p2", "p3", "p4", "B2", "a0", "a1", "B0", "e", "X"]
    verify_common_geometry(points, order, [6, 4, 5])

    profile = radius_profile(points, "X")
    k4_classes = [members for members in profile.values() if len(members) >= 4]
    assert k4_classes == [{"p0", "p1", "p2", "p3", "p4"}]
    deleted = {"p0", "p1"}
    assert not has_k4(radius_profile(points, "X", deleted))
    for source in deleted:
        assert has_k4(radius_profile(points, "X", deleted - {source}))
    for source in points:
        assert has_k4(radius_profile(points, "X", {source}))
    assert dist_sq(points["X"], points["p0"]) == dist_sq(points["X"], points["p1"])

    return {
        "carrier_card": len(points),
        "cap_profile": [6, 4, 5],
        "fresh_center": "X",
        "fresh_center_strictly_inside_mec": True,
        "unique_fresh_center_k4_class": ["p0", "p1", "p2", "p3", "p4"],
        "minimal_blocking_deletion": ["p0", "p1"],
        "deleted_sources_co_radial": True,
        "fresh_center_fully_singleton_deletion_robust": True,
        "alternative_exact_pair_support_triangle": False,
    }


def verify_singleton_model() -> dict[str, object]:
    points = build_points(include_fifth_shell_point=False)
    order = ["p0", "B1", "p1", "p2", "p3", "B2", "a0", "a1", "B0", "e", "X"]
    verify_common_geometry(points, order, [5, 4, 5])

    profile = radius_profile(points, "X")
    k4_classes = [members for members in profile.values() if len(members) >= 4]
    assert k4_classes == [{"p0", "p1", "p2", "p3"}]
    assert not has_k4(radius_profile(points, "X", {"p0"}))
    assert has_k4(profile)

    return {
        "carrier_card": len(points),
        "cap_profile": [5, 4, 5],
        "fresh_center": "X",
        "fresh_center_strictly_inside_mec": True,
        "complete_exact_four_shell": ["p0", "p1", "p2", "p3"],
        "singleton_blocking_deletion": "p0",
        "restoring_singleton_restores_k4": True,
        "alternative_exact_pair_support_triangle": False,
    }


def verify_two_shell_model() -> dict[str, object]:
    boundary = {
        "B0": rational_unit(Q(3, 28)),
        "B1": rational_unit(Q(-18)),
        "B2": rational_unit(Q(-1, 12)),
    }
    center = (Q(-11, 40), Q(11, 80))
    first_shell = {
        f"p{index}": add(center, scale(Q(8, 11), rational_unit(t)))
        for index, t in enumerate([Q(-7), Q(-207, 59), Q(-57, 25), Q(-85, 52)])
    }
    second_shell = {
        f"q{index}": add(center, scale(Q(20, 17), rational_unit(t)))
        for index, t in enumerate([Q(-37, 58), Q(-7, 12), Q(-25, 47), Q(-29, 60)])
    }
    near_boundary = {
        "a0": scale(Q(999, 1000), rational_unit(Q(-1, 23))),
        "a1": scale(Q(999, 1000), rational_unit(Q(0))),
        "a2": scale(Q(999, 1000), rational_unit(Q(1, 19))),
    }
    points = {**boundary, "X": center, **first_shell, **second_shell, **near_boundary}
    order = [
        "B1", "p1", "p2", "p3", "q0", "q1", "q2", "q3", "B2",
        "a0", "a1", "a2", "B0", "X", "p0",
    ]
    verify_common_geometry(points, order, [9, 5, 4])

    profile = radius_profile(points, "X")
    k4_classes = {frozenset(members) for members in profile.values() if len(members) >= 4}
    expected = {
        frozenset({"p0", "p1", "p2", "p3"}),
        frozenset({"q0", "q1", "q2", "q3"}),
    }
    assert k4_classes == expected
    deleted = {"p0", "q0"}
    assert not has_k4(radius_profile(points, "X", deleted))
    for source in deleted:
        assert has_k4(radius_profile(points, "X", deleted - {source}))
    assert set(first_shell).isdisjoint(second_shell)

    # X lies strictly between B0 and B1 on the four-point cap
    # B0--X--p0--B1.  Its complement is therefore large enough for the
    # source theorem's packed-core cardinality inequality.
    packed_cap = {"B0", "X", "p0", "B1"}
    assert 2 * len(deleted) <= len(set(points) - packed_cap)

    return {
        "carrier_card": len(points),
        "cap_profile": [9, 5, 4],
        "fresh_center": "X",
        "fresh_center_strictly_inside_mec": True,
        "disjoint_complete_exact_four_shells": [
            ["p0", "p1", "p2", "p3"],
            ["q0", "q1", "q2", "q3"],
        ],
        "minimal_blocking_deletion": ["p0", "q0"],
        "restoring_each_source_restores_k4": True,
        "packed_core_cap_complement_bound": True,
        "alternative_exact_pair_support_triangle": False,
    }


def main() -> None:
    report = {
        "status": "PASS_EXACT_LOCAL_TRANSITION_NOT_RETRIANGULATION",
        "epistemic_status": (
            "EXACT_RATIONAL_LOCAL_MODELS; NOT_COUNTEREXAMPLE_DATA; "
            "PROTECTED_PROVENANCE_AND_GLOBAL_K4_MINIMALITY_ABSENT"
        ),
        "collision_model": verify_collision_model(),
        "singleton_core_model": verify_singleton_model(),
        "two_shell_core_model": verify_two_shell_model(),
        "first_missing_source_field": (
            "a theorem using protectedDeletionSet provenance plus global all-center K4/minimality "
            "to exclude the strict-MEC-interior fresh center"
        ),
    }
    print(json.dumps(report, sort_keys=True))


if __name__ == "__main__":
    main()

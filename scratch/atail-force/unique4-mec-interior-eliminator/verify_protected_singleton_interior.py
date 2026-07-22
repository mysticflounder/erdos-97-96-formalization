#!/usr/bin/env python3
"""Exact protected-singleton model for the unique-four MEC-interior arm.

This checker extends the exact unique-four endpoint model by three rational
rotations of ``J`` about ``t1``.  The resulting full radius class

    {J, J_core_1, J_core_2, J_core_3}

is an exact deletion-critical four-shell centered at ``t1``.  Its deletion
set ``{J}`` lies in the actual protected set (the exact first-apex class union
the three Moser vertices), while ``t1`` lies outside that set and strictly
inside the minimum enclosing disk.

The model deliberately fails all-center K4.  It therefore does not construct
``CounterexampleData`` or refute the live theorem.  It exactly tests whether
the protected-set provenance and the complete local exact-four/MEC data can,
without carrier-wide K4, eliminate the strict-interior transition arm.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
from pathlib import Path
from typing import Any

import sympy as sp


HERE = Path(__file__).resolve().parent
ENDPOINT_PATH = HERE.parent / "endpoint-blocker-geometry" / "analyze.py"
CHECKPOINT_PATH = HERE / "checkpoint.json"

EXPECTED_ENDPOINT_SHA256 = (
    "88ee5fbc55d4e6ffada9be413009ee3e786acc4e4c85eaae481519b8283cb222"
)
EXPECTED_SOURCE_SHA256 = (
    "6d51c5ef22e550a4719db31a47d49350bc2a6658fb89cc01a1b18f94ca0e459d"
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def load_endpoint() -> Any:
    digest = sha256(ENDPOINT_PATH)
    assert digest == EXPECTED_ENDPOINT_SHA256, (
        "the pinned endpoint checker changed; re-audit this extension "
        f"(expected {EXPECTED_ENDPOINT_SHA256}, got {digest})"
    )
    spec = importlib.util.spec_from_file_location("unique4_endpoint_model", ENDPOINT_PATH)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


ENDPOINT = load_endpoint()
GEOMETRY = ENDPOINT.load_source()
assert sha256(ENDPOINT.SOURCE) == EXPECTED_SOURCE_SHA256

Point = tuple[sp.Expr, sp.Expr]

ROTATION_PARAMETERS = (
    sp.Rational(1, 20000),
    sp.Rational(1, 10000),
    sp.Rational(3, 20000),
)

HULL_ORDER = [
    "O",
    "t1",
    "I",
    "F",
    "t2",
    "A",
    "J",
    "J_core_1",
    "J_core_2",
    "J_core_3",
    "E",
    "C",
    "G",
    "K",
    "H",
]


def rational_rotation(point: Point, center: Point, parameter: sp.Rational) -> Point:
    """Rotate ``point`` about ``center`` using a rational half-angle."""

    vx, vy = GEOMETRY.sub(point, center)
    denominator = 1 + parameter**2
    cosine = (1 - parameter**2) / denominator
    sine = 2 * parameter / denominator
    return GEOMETRY.point(
        sp.factor(center[0] + cosine * vx - sine * vy),
        sp.factor(center[1] + sine * vx + cosine * vy),
    )


def build_points() -> dict[str, Point]:
    points = GEOMETRY.build_points()
    del points["D"]
    for index, parameter in enumerate(ROTATION_PARAMETERS, start=1):
        points[f"J_core_{index}"] = rational_rotation(
            points["J"], points["t1"], parameter
        )
    return points


def expression_string(value: sp.Expr) -> str:
    return sp.sstr(sp.factor(value), order="lex")


def coordinate_digest(points: dict[str, Point]) -> str:
    payload = {
        name: [expression_string(point[0]), expression_string(point[1])]
        for name, point in sorted(points.items())
    }
    return canonical_sha256(payload)


def max_class_card(profile: dict[sp.Expr, set[str]]) -> int:
    return max((len(support) for support in profile.values()), default=0)


def has_k4_after_deletion(
    profile: dict[sp.Expr, set[str]], deleted: set[str]
) -> bool:
    return any(len(support - deleted) >= 4 for support in profile.values())


def critical_shell_candidates(
    profiles: dict[str, dict[sp.Expr, set[str]]], source: str
) -> list[dict[str, object]]:
    candidates: list[dict[str, object]] = []
    for center, profile in sorted(profiles.items()):
        if center == source or has_k4_after_deletion(profile, {source}):
            continue
        for radius, support in profile.items():
            if len(support) == 4 and source in support:
                candidates.append(
                    {
                        "center": center,
                        "radius_squared": expression_string(radius),
                        "support": sorted(support),
                    }
                )
    return candidates


def subset_has_global_k4(
    names: tuple[str, ...],
    profiles: dict[str, dict[sp.Expr, set[str]]],
) -> bool:
    subset = set(names)
    return all(
        any(len(support & subset) >= 4 for support in profiles[center].values())
        for center in subset
    )


def check() -> dict[str, object]:
    endpoint_report = ENDPOINT.build()
    assert endpoint_report["status"] == "PASS"

    points = build_points()
    assert len(points) == len(HULL_ORDER) == 15
    assert set(points) == set(HULL_ORDER)

    # Exact supporting-line certificate, stronger than consecutive turns.
    for index, first in enumerate(HULL_ORDER):
        second = HULL_ORDER[(index + 1) % len(HULL_ORDER)]
        for third in HULL_ORDER:
            if third not in {first, second}:
                GEOMETRY.exact_positive(
                    GEOMETRY.cross(points[first], points[second], points[third])
                )

    for index, first in enumerate(HULL_ORDER):
        for second in HULL_ORDER[index + 1 :]:
            GEOMETRY.exact_positive(
                GEOMETRY.squared_distance(points[first], points[second])
            )

    mec_center = GEOMETRY.point(sp.Rational(1, 2), sp.sqrt(3) / 6)
    mec_radius_squared = sp.Rational(1, 3)
    boundary = {"O", "A", "C"}
    mec_defects: dict[str, str] = {}
    for name, point in points.items():
        defect = sp.factor(
            mec_radius_squared - GEOMETRY.squared_distance(mec_center, point)
        )
        mec_defects[name] = expression_string(defect)
        if name in boundary:
            assert GEOMETRY.exact_zero(defect)
        else:
            GEOMETRY.exact_positive(defect)

    for vertex, left, right in (
        ("C", "O", "A"),
        ("O", "C", "A"),
        ("A", "C", "O"),
    ):
        GEOMETRY.exact_nonnegative(
            GEOMETRY.dot(
                GEOMETRY.sub(points[left], points[vertex]),
                GEOMETRY.sub(points[right], points[vertex]),
            )
        )

    added = {f"J_core_{index}" for index in range(1, 4)}
    surplus_cap = {"O", "t1", "I", "F", "t2", "A"}
    first_opposite_cap = {"A", "J", "E", "C"} | added
    second_opposite_cap = {"C", "G", "K", "H", "O"}
    caps = (surplus_cap, first_opposite_cap, second_opposite_cap)
    assert [len(cap) for cap in caps] == [6, 7, 5]
    assert set.union(*caps) == set(points)
    assert sum(map(len, caps)) == len(points) + 3
    for name in points:
        multiplicity = sum(name in cap for cap in caps)
        assert multiplicity == (2 if name in boundary else 1)

    for apex, left, right, cap in (
        ("C", "O", "A", surplus_cap),
        ("O", "A", "C", first_opposite_cap),
        ("A", "C", "O", second_opposite_cap),
    ):
        apex_area = GEOMETRY.cross(points[apex], points[left], points[right])
        for name, point in points.items():
            product = sp.factor(
                GEOMETRY.cross(point, points[left], points[right]) * apex_area
            )
            if name in cap:
                GEOMETRY.exact_nonpositive(product)
            else:
                GEOMETRY.exact_positive(product)

    # The unique MEC boundary means every circumscribed support triangle is a
    # permutation of O,A,C.  Its cap-cardinality multiset has no exact pair.
    assert sum(len(cap) == 4 for cap in caps) == 0

    profiles = {
        center: GEOMETRY.radius_profile(points, center)
        for center in sorted(points)
    }

    first_apex = "O"
    first_class = GEOMETRY.named_class(profiles[first_apex], sp.Integer(1))
    assert first_class == {"A", "C", "E", "J"}
    first_large_classes = [
        support for support in profiles[first_apex].values() if len(support) >= 4
    ]
    assert first_large_classes == [first_class]
    for source in first_class:
        assert not has_k4_after_deletion(profiles[first_apex], {source})

    # Retained frontier pair and the second-apex double-deletion witness.
    frontier_pair = {"E", "C"}
    assert frontier_pair <= first_class
    assert frontier_pair.isdisjoint(surplus_cap)
    second_survivors = [
        support - frontier_pair
        for support in profiles["A"].values()
        if len(support - frontier_pair) >= 4
    ]
    assert second_survivors == [{"O", "G", "H", "K"}]

    # The residual's strict-cap pair and complete carrier-bisector location.
    strict_first_cap = first_opposite_cap - {"A", "C"}
    interior_pair = {"J", "E"}
    assert interior_pair <= first_class & strict_first_cap
    bisector_centers = {
        center
        for center in points
        if center != first_apex
        and GEOMETRY.exact_zero(
            GEOMETRY.squared_distance(points[center], points["J"])
            - GEOMETRY.squared_distance(points[center], points["E"])
        )
    }
    assert bisector_centers <= strict_first_cap

    protected = first_class | boundary
    assert protected == {"A", "C", "E", "J", "O"}
    fresh_center = "t1"
    deleted = {"J"}
    assert fresh_center not in protected
    assert fresh_center in surplus_cap - {"O", "A"}
    assert deleted <= protected
    GEOMETRY.exact_positive(sp.sympify(mec_defects[fresh_center]))

    transition_radius = GEOMETRY.squared_distance(
        points[fresh_center], points["J"]
    )
    transition_shell = GEOMETRY.named_class(
        profiles[fresh_center], transition_radius
    )
    assert transition_shell == {"J", *added}
    assert max_class_card(profiles[fresh_center]) == 4
    assert not has_k4_after_deletion(profiles[fresh_center], deleted)
    assert has_k4_after_deletion(profiles[fresh_center], set())

    candidates = {
        source: critical_shell_candidates(profiles, source)
        for source in sorted(points)
    }
    assert all(candidates[source] for source in first_class)
    assert all(candidates[source] for source in transition_shell)
    sources_without_candidate = sorted(
        source for source, rows in candidates.items() if not rows
    )

    centers_without_k4 = sorted(
        center for center, profile in profiles.items() if max_class_card(profile) < 4
    )
    assert centers_without_k4

    # Exhaustively check the same-carrier consequence of minimality: no
    # nonempty subcarrier of this fixed model has all-center K4.  This does
    # not establish D.Minimal, which quantifies over every finite planar set.
    global_k4_subcarriers: list[list[str]] = []
    names = tuple(sorted(points))
    for mask in range(1, 1 << len(names)):
        subset = tuple(names[index] for index in range(len(names)) if mask & (1 << index))
        if len(subset) >= 5 and subset_has_global_k4(subset, profiles):
            global_k4_subcarriers.append(list(subset))
    assert global_k4_subcarriers == []

    return {
        "schema": 1,
        "status": "PASS_EXACT_PROTECTED_SINGLETON_STRICT_INTERIOR",
        "trust_boundary": "EXACT_SYMBOLIC_SYMPY_NOT_LEAN_KERNEL",
        "epistemic_scope": (
            "exact unique-four local residual plus protected singleton transition; "
            "not all-center K4, CounterexampleData, D.Minimal, or total CSS"
        ),
        "endpoint_checker_sha256": EXPECTED_ENDPOINT_SHA256,
        "endpoint_source_sha256": EXPECTED_SOURCE_SHA256,
        "coordinate_sha256": coordinate_digest(points),
        "carrier_card": len(points),
        "strict_hull_order": HULL_ORDER,
        "unique_mec_boundary": sorted(boundary),
        "cap_cards": [len(cap) for cap in caps],
        "no_m44_all_mec_permutations": True,
        "first_apex": first_apex,
        "first_apex_unique_exact_four_class": sorted(first_class),
        "every_first_class_deletion_blocks_first_apex": True,
        "frontier_pair": sorted(frontier_pair),
        "second_apex_double_deletion_support": sorted(second_survivors[0]),
        "strict_first_cap_pair": sorted(interior_pair),
        "carrier_bisector_centers_for_strict_pair": sorted(bisector_centers),
        "protected_deletion_set": sorted(protected),
        "fresh_center": fresh_center,
        "fresh_center_strictly_inside_mec": True,
        "minimal_blocking_deletion": sorted(deleted),
        "fresh_center_exact_critical_shell": sorted(transition_shell),
        "protected_set_provenance_realized": True,
        "partial_critical_system_sources": sorted(
            source for source, rows in candidates.items() if rows
        ),
        "sources_without_critical_shell_candidate": sources_without_candidate,
        "total_critical_shell_system_exists": not sources_without_candidate,
        "centers_without_global_k4": centers_without_k4,
        "all_center_global_k4": False,
        "same_carrier_global_k4_subcarrier_count": len(global_k4_subcarriers),
        "first_isolated_missing_layer": "all-center HasNEquidistantProperty 4",
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--check",
        action="store_true",
        help="compare the exact result with the pinned checkpoint",
    )
    args = parser.parse_args()
    result = check()
    if args.check:
        expected = json.loads(CHECKPOINT_PATH.read_text(encoding="utf-8"))
        assert result == expected, "protected singleton regression drifted"
        print("PASS: protected singleton strict-interior regression matches checkpoint.json")
    else:
        print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Exact local countermodel for the card-five cap-local cross producer.

The checker extends the already-audited exact blocker/cap construction by one
point, while replacing two old hull points.  Every geometric comparison is
performed symbolically by SymPy; floating-point numerics play no role.

This is deliberately a *local-surface* test.  It checks strict convexity, the
unique non-obtuse MEC triangle, all three exact caps, no-M44 for every
permutation of that triangle, the exact-card-five first-apex row, robust
second-apex deletion survival, and two distinct exact deletion blockers.  It
does not assume or construct CounterexampleData or a total
CriticalShellSystem.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
from typing import Any

import sympy as sp


HERE = Path(__file__).resolve().parent
BASE_PATH = HERE.parent / "blocker-cap-geometry" / "exact_blocker_cap_countermodel.py"
CHECKPOINT_PATH = HERE / "checkpoint.json"
EXPECTED_BASE_SHA256 = "6d51c5ef22e550a4719db31a47d49350bc2a6658fb89cc01a1b18f94ca0e459d"


def load_base() -> Any:
    digest = hashlib.sha256(BASE_PATH.read_bytes()).hexdigest()
    assert digest == EXPECTED_BASE_SHA256, (
        "the pinned exact blocker/cap checker changed; re-audit this extension "
        f"before accepting it (expected {EXPECTED_BASE_SHA256}, got {digest})"
    )
    spec = importlib.util.spec_from_file_location("exact_blocker_cap_countermodel", BASE_PATH)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


B = load_base()
Point = tuple[sp.Expr, sp.Expr]


def rational_rotation(point: Point, center: Point, parameter: sp.Rational) -> Point:
    """Rotate ``point`` about ``center`` using a rational half-angle parameter."""

    vx, vy = B.sub(point, center)
    denominator = 1 + parameter**2
    cosine = (1 - parameter**2) / denominator
    sine = 2 * parameter / denominator
    return B.point(
        sp.factor(center[0] + cosine * vx - sine * vy),
        sp.factor(center[1] + sine * vx + cosine * vy),
    )


ROTATION_PARAMETERS = {
    "X": sp.Rational(-139, 707),
    "Y": sp.Rational(-41, 216),
    "Z": sp.Rational(-136, 743),
}


def build_points() -> dict[str, Point]:
    points = B.build_points()
    del points["t2"]
    del points["H"]
    for name, parameter in ROTATION_PARAMETERS.items():
        points[name] = rational_rotation(points["D"], points["t1"], parameter)
    return points


def expression_string(value: sp.Expr) -> str:
    return sp.sstr(sp.factor(value), order="lex")


def coordinate_digest(points: dict[str, Point]) -> str:
    payload = {
        name: [expression_string(value[0]), expression_string(value[1])]
        for name, value in sorted(points.items())
    }
    encoded = json.dumps(payload, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(encoded).hexdigest()


def has_k4_after_deletion(
    profile: dict[sp.Expr, set[str]], source: str
) -> bool:
    """Read a deletion profile by removing one name from cached supports."""

    return any(len(support - {source}) >= 4 for support in profile.values())


def exact_blocker_candidates(
    profiles: dict[str, dict[sp.Expr, set[str]]], source: str
) -> list[dict[str, object]]:
    """Enumerate every exact deletion-critical four-shell for ``source``."""

    candidates: list[dict[str, object]] = []
    for center in sorted(profiles):
        if center == source:
            continue
        full_profile = profiles[center]
        if has_k4_after_deletion(full_profile, source):
            continue
        for radius, support in full_profile.items():
            if len(support) == 4 and source in support:
                candidates.append(
                    {
                        "center": center,
                        "radius_sq": expression_string(radius),
                        "support": sorted(support),
                    }
                )
    return candidates


def check_model() -> dict[str, object]:
    points = build_points()
    hull_order = ["O", "t1", "I", "F", "A", "X", "Y", "Z", "D", "J", "E", "C", "G", "K"]
    assert set(hull_order) == set(points)
    assert len(hull_order) == 14

    # A supporting-line certificate for the complete strict hull order.
    for index, first_name in enumerate(hull_order):
        second_name = hull_order[(index + 1) % len(hull_order)]
        for third_name in points:
            if third_name in {first_name, second_name}:
                continue
            B.exact_positive(B.cross(points[first_name], points[second_name], points[third_name]))

    # Distinct carrier points and hence positive distances for every pair.
    names = sorted(points)
    for index, first_name in enumerate(names):
        for second_name in names[index + 1 :]:
            B.exact_positive(B.squared_distance(points[first_name], points[second_name]))

    # Unique MEC boundary {O,A,C}; all other points are strictly interior.
    mec_center = B.point(sp.Rational(1, 2), sp.sqrt(3) / 6)
    mec_radius_sq = sp.Rational(1, 3)
    boundary = {"O", "A", "C"}
    for name, value in points.items():
        defect = sp.simplify(mec_radius_sq - B.squared_distance(mec_center, value))
        if name in boundary:
            assert B.exact_zero(defect)
        else:
            B.exact_positive(defect)

    # The boundary triangle is equilateral, hence non-obtuse at every vertex.
    for vertex, left, right in (("C", "O", "A"), ("O", "C", "A"), ("A", "C", "O")):
        B.exact_nonnegative(
            B.dot(B.sub(points[left], points[vertex]), B.sub(points[right], points[vertex]))
        )

    surplus_cap = {"O", "t1", "I", "F", "A"}
    opposite_cap_1 = {"A", "X", "Y", "Z", "D", "J", "E", "C"}
    opposite_cap_2 = {"C", "G", "K", "O"}
    caps = (surplus_cap, opposite_cap_1, opposite_cap_2)
    assert [len(cap) for cap in caps] == [5, 8, 4]
    assert sum(map(len, caps)) == len(points) + 3
    assert set.union(*caps) == set(points)
    for name in points:
        multiplicity = sum(name in cap for cap in caps)
        assert multiplicity == (2 if name in boundary else 1)

    # Exact arc membership under the project's OnArcOpposite convention for
    # (v1,v2,v3)=(C,O,A).
    arc_specs = (
        ("C", "O", "A", surplus_cap),
        ("O", "A", "C", opposite_cap_1),
        ("A", "C", "O", opposite_cap_2),
    )
    for apex, endpoint_1, endpoint_2, cap in arc_specs:
        apex_area = B.cross(points[apex], points[endpoint_1], points[endpoint_2])
        for name, value in points.items():
            product = sp.expand(
                B.cross(value, points[endpoint_1], points[endpoint_2]) * apex_area
            )
            if name in cap:
                B.exact_nonpositive(product)
            else:
                B.exact_positive(product)

    # The unique MEC boundary makes every circumscribed Moser triangle a
    # permutation of O,A,C.  A permutation only permutes cap cards (5,8,4),
    # so no orientation can have both opposite caps of card four.
    assert sum(card == 4 for card in map(len, caps)) == 1

    q = "E"
    w = "D"
    q_blocker = "D"
    w_blocker = "t1"
    assert q != w and q_blocker != w_blocker
    assert q not in surplus_cap and w not in surplus_cap
    assert q_blocker not in surplus_cap
    assert w_blocker in surplus_cap

    first_profile = B.radius_profile(points, "O")
    first_class = B.named_class(first_profile, sp.Integer(1))
    assert first_class == {"A", "D", "J", "E", "C"}
    assert {q, w} <= first_class
    first_large_rows = [support for support in first_profile.values() if len(support) >= 4]
    assert first_large_rows == [first_class]

    second_profile = B.radius_profile(points, "A")
    second_class = B.named_class(second_profile, sp.Integer(1))
    assert second_class == {"O", "C", "G", "K"}
    assert B.has_k4(B.radius_profile(points, "A", {q}))
    assert B.has_k4(B.radius_profile(points, "A", {w}))
    assert B.has_k4(B.radius_profile(points, "A", {q, w}))

    q_radius = sp.Rational(2, 13)
    q_shell = B.named_class(B.radius_profile(points, q_blocker), q_radius)
    assert q_shell == {"A", "E", "F", "I"}
    assert q in q_shell and w not in q_shell
    assert not B.has_k4(B.radius_profile(points, q_blocker, {q}))
    assert B.has_k4(B.radius_profile(points, q_blocker, {w}))

    w_radius = B.squared_distance(points[w_blocker], points[w])
    w_shell = B.named_class(B.radius_profile(points, w_blocker), w_radius)
    assert w_shell == {"D", "X", "Y", "Z"}
    assert w in w_shell and q not in w_shell
    assert not B.has_k4(B.radius_profile(points, w_blocker, {w}))
    assert B.has_k4(B.radius_profile(points, w_blocker, {q}))

    # The exact hypothesis is false on both directed arms.  The q-blocker's
    # selected support omits w; the w-blocker's selected support omits q.
    assert w not in q_shell
    assert q not in w_shell

    # Cache one exact profile per center.  A deletion only removes one name
    # from each support, so recomputing and regrouping symbolic radii would be
    # redundant.
    all_profiles = {center: B.radius_profile(points, center) for center in sorted(points)}
    candidates = {
        name: exact_blocker_candidates(all_profiles, name) for name in sorted(points)
    }
    sources_without_blocker = [name for name, rows in candidates.items() if not rows]
    max_row_cards = {
        center: max((len(support) for support in all_profiles[center].values()), default=0)
        for center in sorted(points)
    }
    centers_without_k4 = [name for name, card in max_row_cards.items() if card < 4]

    return {
        "schema": 1,
        "trust_boundary": "EXACT_SYMBOLIC_SYMPY_NOT_LEAN_KERNEL",
        "base_checker_sha256": EXPECTED_BASE_SHA256,
        "coordinate_sha256": coordinate_digest(points),
        "carrier_card": len(points),
        "rotation_half_angle_parameters": {
            name: str(parameter) for name, parameter in ROTATION_PARAMETERS.items()
        },
        "strict_hull_order": hull_order,
        "unique_mec_boundary": sorted(boundary),
        "mec_triangle_nonobtuse": True,
        "caps": {
            "surplus": sorted(surplus_cap),
            "opposite_1": sorted(opposite_cap_1),
            "opposite_2": sorted(opposite_cap_2),
        },
        "cap_cards": [len(cap) for cap in caps],
        "no_m44_all_mec_permutations": True,
        "first_apex": "O",
        "first_apex_card_five_class": sorted(first_class),
        "first_apex_unique_k4_radius": True,
        "second_apex": "A",
        "second_apex_radius_one_class": sorted(second_class),
        "second_apex_survives_q_w_and_double_deletion": True,
        "pair": {"q": q, "w": w},
        "blockers": {"q": q_blocker, "w": w_blocker},
        "blocker_shells": {"q": sorted(q_shell), "w": sorted(w_shell)},
        "source_deletion_kills_selected_k4": {"q": True, "w": True},
        "opposite_deletion_preserves_selected_k4": {"q": True, "w": True},
        "directed_cross_hits": {"w_in_q_shell": False, "q_in_w_shell": False},
        "card_five_distinct_cap_local_cross_hypothesis": False,
        "max_row_cards_by_center": max_row_cards,
        "centers_without_k4": centers_without_k4,
        "exact_deletion_blocker_candidate_counts": {
            name: len(rows) for name, rows in candidates.items()
        },
        "sources_without_exact_deletion_blocker": sources_without_blocker,
        "scope": (
            "exact local Euclidean/strict-convex/MEC/cap/no-M44/card-five/"
            "second-apex/two-distinct-blocker surface; excludes all-center K4, "
            "CounterexampleData, and a total CriticalShellSystem"
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--check",
        action="store_true",
        help="compare the exact result with the pinned checkpoint",
    )
    args = parser.parse_args()
    report = check_model()
    if args.check:
        expected = json.loads(CHECKPOINT_PATH.read_text())
        assert report == expected, "exact result drifted from checkpoint.json"
        print("PASS: exact cap-local cross countermodel matches checkpoint.json")
    else:
        print(json.dumps(report, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

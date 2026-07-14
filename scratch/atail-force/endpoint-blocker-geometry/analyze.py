#!/usr/bin/env python3
"""Replay an exact non-M44 chosen MEC packet with endpoint blockers."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
from pathlib import Path

import sympy as sp


HERE = Path(__file__).resolve().parent
SOURCE = HERE.parent / "blocker-cap-geometry/exact_blocker_cap_countermodel.py"


def load_source():
    spec = importlib.util.spec_from_file_location("blocker_cap_exact", SOURCE)
    if spec is None or spec.loader is None:
        raise AssertionError("cannot load exact blocker-cap checker")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def build() -> dict[str, object]:
    exact = load_source()
    points = exact.build_points()

    # Delete D from the exact 13-point model.  A subset of vertices of a
    # strictly convex polygon stays strictly convex; replay the stronger
    # supporting-line certificate directly for the new adjacent edge A -> J.
    del points["D"]
    hull = ["O", "t1", "I", "F", "t2", "A", "J", "E", "C", "G", "K", "H"]
    assert set(hull) == set(points)
    for index, name in enumerate(hull):
        next_name = hull[(index + 1) % len(hull)]
        for other_name in hull:
            if other_name in {name, next_name}:
                continue
            exact.exact_positive(
                exact.cross(points[name], points[next_name], points[other_name])
            )

    # The same exact equilateral, non-obtuse circumscribed MEC frame.
    mec_center = exact.point(sp.Rational(1, 2), sp.sqrt(3) / 6)
    mec_radius_sq = sp.Rational(1, 3)
    boundary = {"C", "O", "A"}
    for name, value in points.items():
        defect = sp.simplify(
            mec_radius_sq - exact.squared_distance(mec_center, value)
        )
        if name in boundary:
            assert exact.exact_zero(defect)
        else:
            exact.exact_positive(defect)

    surplus = {"O", "t1", "I", "F", "t2", "A"}
    opposite_one = {"A", "J", "E", "C"}
    opposite_two = {"C", "G", "K", "H", "O"}
    caps = (surplus, opposite_one, opposite_two)
    assert [len(cap) for cap in caps] == [6, 4, 5]
    assert sum(map(len, caps)) == len(points) + 3
    assert set.union(*caps) == set(points)
    assert not (len(opposite_one) == 4 and len(opposite_two) == 4)

    # Replay exact OnArcOpposite signs for the reduced carrier.
    arc_specs = (
        ("C", "O", "A", surplus),
        ("O", "A", "C", opposite_one),
        ("A", "C", "O", opposite_two),
    )
    for apex, left, right, cap in arc_specs:
        apex_area = exact.cross(points[apex], points[left], points[right])
        for name, value in points.items():
            product = sp.expand(
                exact.cross(value, points[left], points[right]) * apex_area
            )
            if name in cap:
                exact.exact_nonpositive(product)
            else:
                exact.exact_positive(product)

    # q,w form the live first-apex off-surplus pair.  The first apex O is an
    # exact card-four endpoint blocker for both sources.
    q, w = "E", "C"
    first_profile = exact.radius_profile(points, "O")
    first_class = exact.named_class(first_profile, sp.Integer(1))
    assert first_class == {"A", "J", "E", "C"}
    assert q in first_class and w in first_class
    assert q not in surplus and w not in surplus and q != w
    assert not exact.has_k4(exact.radius_profile(points, "O", {q}))
    assert not exact.has_k4(exact.radius_profile(points, "O", {w}))

    # Both deletions preserve K4 at the second apex A, so O is separated from
    # that endpoint exactly as required by SurvivorPairRelocationPacket.
    second_profile_q = exact.radius_profile(points, "A", {q})
    second_profile_w = exact.radius_profile(points, "A", {w})
    assert exact.has_k4(second_profile_q)
    assert exact.has_k4(second_profile_w)
    assert points["O"] != points["A"]

    k4_centers = [
        name for name in hull if exact.has_k4(exact.radius_profile(points, name))
    ]
    failed_k4_centers = [name for name in hull if name not in k4_centers]
    assert "O" in k4_centers and "A" in k4_centers
    assert failed_k4_centers

    return {
        "status": "PASS",
        "epistemic_status": (
            "EXACT_REAL_ALGEBRAIC_LOCAL_SURVIVOR_PACKET; "
            "NOT_COUNTEREXAMPLE_DATA"
        ),
        "cardinality": len(points),
        "cap_profile": [len(cap) for cap in caps],
        "strict_convex_supporting_lines": True,
        "nonobtuse_circumscribed_mec": True,
        "chosen_packet_is_not_m44": True,
        "pair": [q, w],
        "first_endpoint": "O",
        "second_endpoint": "A",
        "first_endpoint_exact_class": sorted(first_class),
        "deleting_each_source_kills_k4_at_first_endpoint": True,
        "deleting_each_source_preserves_k4_at_second_endpoint": True,
        "centers_with_k4": k4_centers,
        "centers_without_k4": failed_k4_centers,
        "first_absent_full_field": (
            "global all-center K4, hence a total CriticalShellSystem; "
            "the global nonexistence of every alternative M44 packet is also "
            "not checked"
        ),
        "source_sha256": hashlib.sha256(SOURCE.read_bytes()).hexdigest(),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    report = build()
    print(json.dumps(report, sort_keys=args.check, indent=None if args.check else 2))


if __name__ == "__main__":
    main()

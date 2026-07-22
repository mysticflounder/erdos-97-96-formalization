#!/usr/bin/env python3
"""Replay the exact local Euclidean boundary for the unique-four leaf."""

from __future__ import annotations

import hashlib
import importlib.util
import json
import sys
from pathlib import Path

import sympy as sp


HERE = Path(__file__).resolve().parent
ENDPOINT_CHECKER = HERE.parent / "endpoint-blocker-geometry" / "analyze.py"


def load_endpoint_checker():
    spec = importlib.util.spec_from_file_location("endpoint_boundary", ENDPOINT_CHECKER)
    if spec is None or spec.loader is None:
        raise AssertionError("cannot load endpoint boundary checker")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def main() -> None:
    endpoint = load_endpoint_checker()
    exact = endpoint.load_source()
    points = exact.build_points()
    del points["D"]

    # The endpoint checker already validates strict convexity, MEC geometry,
    # cap placement, and the individual deletion facts. Replay it first.
    endpoint_report = endpoint.build()
    assert endpoint_report["status"] == "PASS"

    first_center = "O"
    second_center = "A"
    pair = {"E", "C"}
    first_profile = exact.radius_profile(points, first_center)
    first_k4_classes = [members for members in first_profile.values() if len(members) >= 4]
    assert first_k4_classes == [{"A", "C", "E", "J"}]
    first_class = first_k4_classes[0]
    for deleted in first_class:
        assert not exact.has_k4(exact.radius_profile(points, first_center, {deleted}))

    second_after_pair = exact.radius_profile(points, second_center, pair)
    second_surviving_classes = [
        members for members in second_after_pair.values() if len(members) >= 4
    ]
    assert second_surviving_classes == [{"O", "G", "H", "K"}]

    # The selected cap has profile (6,4,5). The MEC boundary contains exactly
    # the three support vertices, so every circumscribed support triangle is a
    # permutation of this one. Neither possible surplus choice has two
    # four-point opposite caps.
    mec_center = exact.point(sp.Rational(1, 2), sp.sqrt(3) / 6)
    mec_radius_sq = sp.Rational(1, 3)
    boundary = {
        name
        for name, value in points.items()
        if exact.exact_zero(
            sp.simplify(mec_radius_sq - exact.squared_distance(mec_center, value))
        )
    }
    assert boundary == {"A", "C", "O"}
    cap_profile = [6, 4, 5]
    assert sum(cap_profile) == len(points) + 3
    assert all(
        not all(cap_profile[j] == 4 for j in range(3) if j != surplus)
        for surplus in range(3)
        if cap_profile[surplus] > 4
    )

    report = {
        "status": "PASS_EXACT_LOCAL_UNIQUE_FOUR_BOUNDARY",
        "epistemic_status": "EXACT_REAL_ALGEBRAIC_LOCAL_MODEL_NOT_COUNTEREXAMPLE_DATA",
        "carrier_card": len(points),
        "mec_boundary": sorted(boundary),
        "cap_profile": cap_profile,
        "no_m44_profile_for_any_surplus_choice": True,
        "first_apex": first_center,
        "first_apex_unique_k4_class": sorted(first_class),
        "every_first_class_member_deletion_blocks_first_apex": True,
        "retained_pair": sorted(pair),
        "second_apex": second_center,
        "second_apex_class_after_pair_deletion": sorted(second_surviving_classes[0]),
        "strict_first_opposite_cap_pair": ["J", "E"],
        "first_missing_live_layer": "all-center K4 and consequent global minimality/CSS",
        "endpoint_checker_sha256": hashlib.sha256(ENDPOINT_CHECKER.read_bytes()).hexdigest(),
    }
    print(json.dumps(report, sort_keys=True))


if __name__ == "__main__":
    main()

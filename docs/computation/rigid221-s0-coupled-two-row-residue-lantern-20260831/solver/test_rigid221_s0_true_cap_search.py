# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
import sys
from fractions import Fraction as F
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))

import rigid221_s0_true_cap_search as search


def test_rational_circle_parameterization_is_exact() -> None:
    for center in search.TWO_ROLE_CENTERS:
        radius2 = search.dist2(center, search.POINTS["O"])
        for slope in (F(-60), F(-7, 3), F(0), F(11, 5), F(60)):
            point = search.circle_point_through_origin(center, slope)
            assert search.dist2(center, point) == radius2
            assert point[1] == slope * point[0]


def test_cap_and_rotation_positive_control() -> None:
    # This is a source-shape smoke test for the cap/index transcription only;
    # it deliberately does not claim to be a Rigid221 row witness.
    points = {
        "O": (F(0), F(0)),
        "m1": (F(2), F(0)),
        "m2": (F(1), F(1)),
        "a": (F(2, 5), F(4, 5)),
        "b": (F(1, 2), F(3, 4)),
        "c": (F(3, 5), F(4, 5)),
        "u": (F(8, 5), F(4, 5)),
        "xu": (F(3, 2), F(3, 4)),
    }
    triple = ("m1", "m2", "O")
    assert search.non_obtuse(points, triple) == (F(2), F(0), F(2))
    caps = search.cap_sets(points, triple)
    assert search.cap_triple_valid(points, triple, caps)
    assert tuple(len(cap) for cap in caps) == (5, 2, 4)
    assert search.opp_index2(0) == 2
    assert triple[search.opp_index2(0)] == "O"
    assert search.cap_interior(caps, triple, 2) == {"u", "xu"}


def test_old_two_point_mec_cannot_be_relabelled_as_true_cap() -> None:
    center = search.scale(F(1, 2), search.add(search.POINTS["v"], search.POINTS["xv"]))
    radius2 = search.dist2(center, search.POINTS["v"])
    slacks = {
        role: radius2 - search.dist2(center, point)
        for role, point in search.POINTS.items()
    }
    boundary = {role for role, slack in slacks.items() if slack == 0}
    assert boundary == {"v", "xv"}
    assert slacks["O"] == F(3051, 6749)
    assert "O" not in boundary


def test_bounded_search_exhaustion_has_exact_scope_and_counts() -> None:
    report = search.build_report()
    assert report["status"] == "ENCODING_BLOCKED"
    assert report["evidence_label"] == (
        "EMPIRICALLY_VERIFIED_FINITE_EXACT_GRID_EXHAUSTION"
    )
    assert report["witness"] is None
    assert report["exact_search_bounds"]["slope_grid"]["distinct_values"] == 899
    assert report["search_counts"]["one_added_role"] == {
        "center_parameter_cells": 671,
        "exact_enclosing_circles_with_boundary_O_and_one_old_role": 45,
        "boundary_slope_values_tested": 40455,
        "strict_convex_single_insertions": 3394,
        "non_obtuse_boundary_triples": 0,
        "source_packet_candidates": 0,
    }
    assert report["search_counts"]["two_added_roles"] == {
        "center_cells": 8,
        "exact_enclosing_circles_strict_on_old_non_O_roles": 8,
        "boundary_slope_values_tested": 7192,
        "strict_convex_single_insertions": 273,
        "unordered_boundary_pairs": 16385,
        "non_obtuse_boundary_pairs": 0,
        "strict_convex_pair_insertions": 0,
        "source_packet_candidates": 0,
    }
    assert report["open_boundary"]["unrestricted_addition_only_family"] == "OPEN"
    assert report["open_boundary"]["universal_unsat_claim"] is False
    assert report["claim_scope"]["l1_s0_i_decided"] is False
    assert report["claim_scope"]["l1_s0_n_decided"] is False


def test_retained_json_artifacts_are_byte_replayable(tmp_path: Path) -> None:
    report = search.build_report()
    first = tmp_path / "first.json"
    second = tmp_path / "second.json"
    search.write_json(first, report)
    search.write_json(second, search.build_report())
    assert first.read_bytes() == second.read_bytes()

    retained = Path(__file__).with_name("s0-true-cap-wave1-result.json")
    assert json.loads(retained.read_text(encoding="utf-8")) == report


def test_nonobtuse_mutation_is_detected_exactly() -> None:
    points = {
        "O": (F(0), F(0)),
        "m1": (F(1), F(-2)),
        "m2": (F(1), F(2)),
    }
    dots = search.non_obtuse(points, ("m1", "m2", "O"))
    assert dots[2] == F(-3)
    assert min(dots) < 0

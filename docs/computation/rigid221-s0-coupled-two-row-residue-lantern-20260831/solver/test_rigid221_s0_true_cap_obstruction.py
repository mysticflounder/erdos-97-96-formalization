# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
import sys
from fractions import Fraction as F
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))

import rigid221_s0_true_cap_obstruction as obstruction


def test_hand_checked_signed_area_and_cap_smoke() -> None:
    points = {
        "a": (F(0), F(0)),
        "b": (F(1), F(0)),
        "c": (F(0), F(1)),
    }
    triple = ("a", "b", "c")
    assert obstruction.signed_area2(points["a"], points["b"], points["c"]) == 1
    assert not obstruction.on_arc_opposite(
        points["a"], points["b"], points["c"], points["a"]
    )
    assert obstruction.on_arc_opposite(
        points["a"], points["b"], points["c"], points["b"]
    )
    caps = obstruction.cap_sets(points, triple)
    assert obstruction.non_obtuse(points, triple)
    assert obstruction.cap_triple_valid(points, triple, caps)
    assert caps == (
        frozenset({"b", "c"}),
        frozenset({"a", "c"}),
        frozenset({"a", "b"}),
    )


def test_source_index_rotation_and_interiors() -> None:
    assert [obstruction.opp_index2(index) for index in range(3)] == [2, 0, 1]
    caps = (
        frozenset({"b", "c", "x"}),
        frozenset({"c", "a", "y"}),
        frozenset({"a", "b", "z"}),
    )
    triple = ("a", "b", "c")
    assert obstruction.cap_interior(caps, triple, 0) == {"x"}
    assert obstruction.cap_interior(caps, triple, 1) == {"y"}
    assert obstruction.cap_interior(caps, triple, 2) == {"z"}


def test_fixed_cell_exact_mec_and_physical_O_obstruction() -> None:
    report = obstruction.build_report()
    mec = report["exact_mec_certificate"]
    assert report["status"] == "UNSAT_FIXED_CELL_EXACT"
    assert report["solver_invoked"] is False
    assert mec["center"] == ["3526/6749", "-215/6749"]
    assert mec["diameter_squared"] == "19600/6749"
    assert mec["radius_squared"] == "4900/6749"
    assert mec["boundary_roles"] == ["v", "xv"]
    assert mec["boundary_cardinality"] == 2
    assert mec["physical_O"] == {
        "role_identity": "O = S.oppApex2",
        "distance_squared_to_mec_center": "1849/6749",
        "strict_interior_slack": "3051/6749",
        "on_boundary": False,
    }
    assert all(F(value) >= 0 for value in mec["enclosure_slacks"].values())


def test_S0_I_and_S0_N_are_separate_with_same_minimal_obstruction() -> None:
    report = obstruction.build_report()
    assert set(report["formulas"]) == {"S0-I", "S0-N"}
    assert report["formulas"]["S0-I"]["branch_condition"] == "xu in J"
    assert (
        report["formulas"]["S0-N"]["branch_condition"]
        == "xu not in J; no endpoint inference"
    )
    for branch in ("S0-I", "S0-N"):
        formula = report["formulas"][branch]
        assert formula["verdict"] == "UNSAT_FIXED_CELL_EXACT"
        assert formula["source_packet_candidates"] == 0
        assert formula["first_failed_requirement"] == "TC-02"
        assert formula["minimal_source_core_relative_to_fixed_cell"] == ["TC-03"]


def test_hCirc_dropped_smoke_finds_only_non_source_candidates() -> None:
    report = obstruction.build_report()
    smoke = report["stronger_claim_test"]["hCirc_dropped_exact_smoke"]
    assert smoke["status"] == "SAT_ABSTRACTION"
    assert smoke["dropped_source_requirement"].startswith("SurplusCapPacket.hCirc")
    assert smoke["not_a_source_witness"] is True
    assert smoke["counts"] == {"S0-I": 18, "S0-N": 69}


def test_report_scope_and_minimization_are_fail_closed() -> None:
    report = obstruction.build_report()
    scope = report["claim_scope"]
    minimization = report["hypothesis_minimization"]
    symbolic = report["stronger_claim_test"][
        "variable_coordinate_same_support_order_relaxation"
    ]
    assert scope["fixed_coordinates_only"] is True
    assert scope["variable_coordinate_cell"] is False
    assert scope["source_universal_claim"] is False
    assert minimization["minimal_source_core_relative_to_background"] == ["TC-03"]
    assert minimization["independent_cardinality_obstruction"] == "TC-02"
    assert symbolic["status"] == "ENCODING_BLOCKED"


def test_json_replay_is_byte_identical(tmp_path: Path) -> None:
    report = obstruction.build_report()
    first = tmp_path / "first.json"
    second = tmp_path / "second.json"
    obstruction.write_json(first, report)
    obstruction.write_json(second, obstruction.build_report())
    assert first.read_bytes() == second.read_bytes()
    assert json.loads(first.read_text(encoding="utf-8"))["schema"] == obstruction.SCHEMA

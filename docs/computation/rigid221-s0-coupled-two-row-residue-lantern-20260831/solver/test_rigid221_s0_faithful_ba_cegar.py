# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Mutation and replay tests for the fixed-cell faithful B=A CEGAR wave."""

from __future__ import annotations

import hashlib
import json
import sys
from dataclasses import replace
from fractions import Fraction
from pathlib import Path

import pytest

SOLVER_DIR = Path(__file__).resolve().parent
if str(SOLVER_DIR) not in sys.path:
    sys.path.insert(0, str(SOLVER_DIR))

import rigid221_s0_faithful_ba_cegar as producer


@pytest.fixture(scope="module")
def cell() -> producer.FixedCell:
    return producer.load_fixed_cell()


@pytest.fixture(scope="module")
def first_rows(cell: producer.FixedCell) -> tuple[producer.RowSpec, ...]:
    return next(producer.iter_structural_signatures(cell))


def test_fixed_cell_freezes_labels_aliases_order_and_named_union(
    cell: producer.FixedCell,
) -> None:
    assert len(cell.order) == 18
    assert cell.order == producer.ROLE_ORDER
    assert set(producer.CANONICAL_LABELS) == set(cell.order)
    assert set(producer.CANONICAL_LABELS.values()) == set(range(18))
    assert producer.CANONICAL_LABELS == {
        "xu": 0,
        "delta": 1,
        "O": 2,
        "d1": 3,
        "d2": 4,
        "d3": 5,
        "qv2": 6,
        "qu1": 7,
        "qu2": 8,
        "fp": 9,
        "fw": 10,
        "fq": 11,
        "qv1": 12,
        "xv": 13,
        "cu": 14,
        "cv": 15,
        "u": 16,
        "v": 17,
    }
    assert {row.center for row in cell.named_rows} == {"O", "cu", "cv", "xv", "delta"}
    assert {row.center for row in cell.named_rows} | {
        point for row in cell.named_rows for point in row.support
    } == set(cell.order)
    physical = next(row for row in cell.named_rows if row.name == "physical_Q")
    assert not physical.exact
    assert set(physical.support) == {"u", "xu", "v", "xv"}
    assert all(row.exact for row in cell.named_rows if row.name != "physical_Q")


def test_retained_named_geometry_replays_exactly(cell: producer.FixedCell) -> None:
    replay = producer.replay_fixed_cell_geometry(cell.points, cell, cell.named_rows)
    assert replay["accepted"]
    assert replay["checks"] == {
        "ambient_distinctness": 153,
        "exact_off_row_exclusions": 52,
        "physical_five_surplus_incidence": 1,
        "positive_radii": 5,
        "row_equalities": 15,
        "strict_convexity": 288,
    }


def test_first_structural_signature_replays_c2_c4_and_all_centers(
    cell: producer.FixedCell, first_rows: tuple[producer.RowSpec, ...]
) -> None:
    replay = producer.replay_structural_assignment(first_rows, cell)
    assert replay["accepted"]
    assert replay["row_count"] == 18
    assert replay["checks"]["C2_pairwise_intersections"] == 153
    assert replay["maximum_pair_multiplicity"] <= 2
    assert {row.center for row in first_rows} == set(cell.order)
    assert (
        sum(row.origin == "CEGAR_SELECTED_ROW_FROM_GLOBAL_K4" for row in first_rows)
        == 13
    )


def test_structural_mutations_are_rejected(
    cell: producer.FixedCell, first_rows: tuple[producer.RowSpec, ...]
) -> None:
    by_center = {row.center: row for row in first_rows}
    physical = by_center["O"]
    mutated_named = tuple(
        replace(row, exact=True) if row.center == "O" else row for row in first_rows
    )
    assert producer.replay_structural_assignment(mutated_named, cell) == {
        "accepted": False,
        "reason": "named_row_drift",
    }

    free = next(
        row for row in first_rows if row.origin == "CEGAR_SELECTED_ROW_FROM_GLOBAL_K4"
    )
    bad_support = (free.center, *free.support[:3])
    bad_row = replace(free, support=bad_support)
    mutated_shape = tuple(
        bad_row if row.center == free.center else row for row in first_rows
    )
    assert producer.replay_structural_assignment(mutated_shape, cell) == {
        "accepted": False,
        "reason": "selected_four_class_shape",
    }
    assert not physical.exact


def test_geometry_coordinate_mutation_is_detected(cell: producer.FixedCell) -> None:
    mutated = dict(cell.points)
    mutated["qu2"] = mutated["O"]
    replay = producer.replay_geometry(mutated, cell.order, cell.named_rows)
    assert replay == {"accepted": False, "reason": "ambient_distinctness"}


def test_qf_nra_formula_has_all_required_assertion_families(
    cell: producer.FixedCell, first_rows: tuple[producer.RowSpec, ...]
) -> None:
    smt2, counts = producer.build_smt2(cell, first_rows)
    assert counts == {
        "ambient_distinctness": 153,
        "exact_off_row_exclusions": 52,
        "physical_five_surplus_incidence": 1,
        "positive_radii": 18,
        "row_equalities": 54,
        "similarity_gauge": 4,
        "strict_convexity": 288,
        "total": 570,
    }
    assert smt2.startswith("(set-logic QF_NRA)\n")
    assert smt2.count("; strict_convexity ") == 288
    assert smt2.count("; ambient_distinctness ") == 153
    assert smt2.count("; exact_off_row_exclusions ") == 52
    assert smt2.count("; physical_five_surplus_incidence ") == 1
    assert "; exact_off_row_exclusions global_" not in smt2
    assert smt2.endswith("(check-sat)\n(exit)\n")
    assert "(get-value" not in smt2
    model_query = producer.build_sat_model_query(smt2)
    assert "(check-sat)\n(get-value" in model_query


def test_exact_flag_mutation_changes_only_complete_fiber_exclusions(
    cell: producer.FixedCell, first_rows: tuple[producer.RowSpec, ...]
) -> None:
    free = next(
        row for row in first_rows if row.origin == "CEGAR_SELECTED_ROW_FROM_GLOBAL_K4"
    )
    mutated = tuple(
        replace(row, exact=True) if row is free else row for row in first_rows
    )
    _, original_counts = producer.build_smt2(cell, first_rows)
    _, mutated_counts = producer.build_smt2(cell, mutated)
    assert mutated_counts["exact_off_row_exclusions"] == (
        original_counts["exact_off_row_exclusions"] + 13
    )
    assert mutated_counts["total"] == original_counts["total"] + 13


def test_cvc5_rational_parser_accepts_exact_and_rejects_algebraic(
    cell: producer.FixedCell,
) -> None:
    pairs = " ".join(
        f"(x_{index} (/ {index} 3)) (y_{index} (- {index}))"
        for index in range(len(cell.order))
    )
    parsed = producer.parse_cvc5_rational_values(f"sat\n({pairs})\n", cell)
    assert parsed[cell.order[2]] == (Fraction(2, 3), Fraction(-2))
    algebraic = pairs.replace("(/ 2 3)", "(root-obj (+ (^ x 2) (- 2)) 0)")
    with pytest.raises(producer.CegarError, match="not an exact rational"):
        producer.parse_cvc5_rational_values(f"sat\n({algebraic})\n", cell)


def test_unsat_cegar_blocks_only_exact_signatures_and_report_is_deterministic(
    tmp_path: Path, cell: producer.FixedCell
) -> None:
    def fake_unsat(
        smt2: str, candidate_index: int, run_root: Path, timeout_ms: int
    ) -> dict[str, object]:
        del run_root
        return {
            "backend": "fake-cvc5",
            "candidate_index": candidate_index,
            "smt2_sha256": hashlib.sha256(smt2.encode()).hexdigest(),
            "status": "UNSAT",
            "stdout": "unsat\n",
            "timed_out": False,
            "timeout_ms": timeout_ms,
        }

    wave = producer.run_wave(
        cell,
        run_root=tmp_path,
        max_candidates=2,
        timeout_ms=100,
        max_wall_seconds=30,
        solver_runner=fake_unsat,
    )
    assert wave["status"] == producer.SCOPED_UNSAT
    assert wave["reason"] == "EXPLICIT_CANDIDATE_CAP_REACHED"
    assert wave["candidate_count"] == 2
    assert wave["signature_block_count"] == 2
    assert wave["semantic_refinement_count"] == 0
    assert (
        len({item["signature_sha256"] for item in wave["blocked_exact_signatures"]})
        == 2
    )
    assert all(
        item
        == {
            "clause_class": "ENUMERATION_CONTROL",
            "scope": "EXACT_COMPLETE_STRUCTURAL_SIGNATURE_ONLY",
            "signature_sha256": item["signature_sha256"],
            "source_preserving_semantic_refinement": False,
        }
        for item in wave["blocked_exact_signatures"]
    )
    report = producer.build_report(cell, wave)
    producer.verify_report(report, cell)
    assert producer.canonical_json(report) == producer.canonical_json(
        producer.build_report(cell, wave)
    )


def test_candidate_receipt_mutation_is_detected(
    tmp_path: Path, cell: producer.FixedCell
) -> None:
    def fake_unknown(
        smt2: str, candidate_index: int, run_root: Path, timeout_ms: int
    ) -> dict[str, object]:
        del candidate_index, run_root
        return {
            "backend": "fake-cvc5",
            "smt2_sha256": hashlib.sha256(smt2.encode()).hexdigest(),
            "status": "UNKNOWN",
            "stdout": "unknown\n",
            "timed_out": True,
            "timeout_ms": timeout_ms,
        }

    wave = producer.run_wave(
        cell,
        run_root=tmp_path,
        max_candidates=1,
        timeout_ms=100,
        max_wall_seconds=30,
        solver_runner=fake_unknown,
    )
    report = producer.build_report(cell, wave)
    report["cegar"]["attempts"][0]["candidate"]["signature_sha256"] = "0" * 64
    with pytest.raises(producer.CegarError, match="signature hash drifted"):
        producer.verify_report(report, cell)


def test_archived_certificate_report_solver_receipt_and_docs_are_replayable(
    cell: producer.FixedCell,
) -> None:
    result_bytes = producer.DEFAULT_RESULT.read_bytes()
    report_bytes = producer.DEFAULT_REPORT.read_bytes()
    assert result_bytes == report_bytes
    report = json.loads(result_bytes)
    producer.verify_report(report, cell)
    assert report["status"] == producer.SCOPED_UNSAT
    assert report["claim_scope"]["bounded_UNSAT"] is False
    assert report["claim_scope"]["complete_candidate_coverage"] is False
    assert report["claim_scope"]["relaxed_incidence_order_metric_model_only"] is True
    assert report["relaxed_metric_model_scope"]["not_retained"] == {
        "J1_J2_or_endpoint_geometry": False,
        "MEC": False,
        "cap_triples_or_cards": False,
        "exact_physical_O_off_row_constraints": False,
        "source_coordinates": False,
    }
    assert report["governance_revision_boundary"] == {
        "checkpoint_meaning": "repository input checkpoint used by this audit rerun",
        "current_input_checkpoint": producer.CURRENT_INPUT_CHECKPOINT,
        "run_manifest_base_head": producer.RUN_MANIFEST_HISTORICAL_BASE_HEAD,
        "run_manifest_base_head_meaning": (
            "historical original lane base retained as required by governance"
        ),
    }
    assert report["fixed_cell"]["physical_five"] == {
        "center": "O",
        "roles": ["delta", "v", "u", "xv", "xu"],
        "selected_Q": ["v", "u", "xv", "xu"],
        "surplus_incidence_role": "delta",
    }
    assert json.loads(producer.DEFAULT_SOLVER_RESULT.read_bytes()) == (
        producer.solver_result_from_report(report)
    )
    assert producer.DEFAULT_MARKDOWN.read_text(encoding="utf-8") == (
        producer.render_markdown(report)
    )
    for attempt in report["cegar"]["attempts"]:
        solver = attempt["solver"]
        smt_path = producer.REPOSITORY / solver["smt2_path"]
        stdout_path = producer.REPOSITORY / solver["stdout_path"]
        stderr_path = producer.REPOSITORY / solver["stderr_path"]
        assert "(get-value" not in smt_path.read_text(encoding="utf-8")
        assert stdout_path.read_text(encoding="utf-8") == "unsat\n"
        assert stderr_path.read_text(encoding="utf-8") == ""

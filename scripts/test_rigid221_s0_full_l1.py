#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Focused tests for the bounded Rigid221 S0/full-L1 harness."""

from __future__ import annotations

import copy
import json
import subprocess
import sys
from fractions import Fraction as F
from pathlib import Path

import pytest
import z3

sys.path.insert(0, str(Path(__file__).resolve().parent))

import rigid221_s0_full_l1 as mod


def assert_rejected(code: str, action: object) -> None:
    with pytest.raises(mod.VerificationError) as caught:
        action()  # type: ignore[operator]
    assert caught.value.code == code


def authenticated_unknown(
    cell: mod.Cell, input_sha256: str, script_sha256: str
) -> dict[str, object]:
    payload = mod._base_result(
        cell=cell,
        status=mod.UNKNOWN_UNSAT_STATUS,
        solver_result="unsat",
        input_sha256=input_sha256,
        script_sha256=script_sha256,
        git_head="test-head",
        reason="fixed cell only",
    )
    return mod.authenticate_payload(payload)


def test_canonical_carrier_and_mec_certificate() -> None:
    assert len(mod.ROLE_ORDER) == 14
    assert mod.ROLE_SET == set(mod.ROLE_ORDER)
    assert mod.MOSER == ("m1", "m2", "O")
    assert mod.FIXED_POINTS == {
        "O": (F(0), F(0)),
        "m1": (F(8, 5), F(-4, 5)),
        "m2": (F(8, 5), F(4, 5)),
    }
    for role in mod.MOSER:
        assert mod.dist2(mod.MEC_CENTER, mod.FIXED_POINTS[role]) == 1
    m1, m2, o = (mod.FIXED_POINTS[role] for role in mod.MOSER)
    assert (
        mod.dot(mod.sub(m2, m1), mod.sub(o, m1)),
        mod.dot(mod.sub(o, m2), mod.sub(m1, m2)),
        mod.dot(mod.sub(m1, o), mod.sub(m2, o)),
    ) == (F(32, 25), F(32, 25), F(48, 25))


def test_cells_are_separate_s0_branches_in_one_extensible_schema() -> None:
    assert [cell.branch for cell in mod.CELL_TEMPLATES] == ["S0-I", "S0-N"]
    assert [cell.xu_in_j for cell in mod.CELL_TEMPLATES] == [True, False]
    for cell in mod.CELL_TEMPLATES:
        assert cell.overlap_cell == "M0"
        assert cell.equality_cell == "all-distinct"
        assert len(cell.order) == 14
        assert set(cell.order) == mod.ROLE_SET
        assert cell.order[0] == "O"
        assert cell.order.index("m1") < cell.order.index("m2")
    endpoint_family = next(
        family
        for family in mod.UNSUPPORTED_CELL_FAMILIES
        if family["dimension"] == "moser_endpoint_identification"
    )
    assert endpoint_family["status"] == mod.BLOCKED_STATUS
    assert {"S0-N xu=m1", "S0-N xu=m2"} <= set(endpoint_family["cells"])


def test_fixed_orders_pin_each_non_moser_cap_arm() -> None:
    s0_i, s0_n = mod.CELL_TEMPLATES
    assert {
        role
        for role in mod.ROLE_ORDER
        if role not in mod.MOSER and mod.cap_arm_from_order(s0_i, role) == 2
    } == {
        "u",
        "cv",
        "cu",
        "xu",
    }
    assert {
        role
        for role in mod.ROLE_ORDER
        if role not in mod.MOSER and mod.cap_arm_from_order(s0_n, role) == 2
    } == {
        "u",
        "cv",
        "cu",
    }
    assert mod.cap_arm_from_order(s0_n, "xu") == 0
    assert_rejected("cap_arm_role", lambda: mod.cap_arm_from_order(s0_i, "m1"))


def test_closed_on_arc_predicate_retains_moser_endpoints() -> None:
    m1, m2, o = (mod.FIXED_POINTS[role] for role in mod.MOSER)
    assert mod.on_arc_opposite(m1, m2, o, m2)
    assert mod.on_arc_opposite(m1, m2, o, o)
    assert not (mod.orient(m2, m2, o) * mod.orient(m1, m2, o) < 0)


def test_endpoint_erasure_and_opposite_index_are_literal() -> None:
    caps = (
        frozenset({"m2", "O", "xv"}),
        frozenset({"O", "m1", "v"}),
        frozenset({"m1", "m2", "u", "xu", "cu"}),
    )
    assert mod.cap_interior(caps, 0) == {"xv"}
    assert mod.cap_interior(caps, 1) == {"v"}
    assert mod.cap_interior(caps, 2) == {"u", "xu", "cu"}
    assert [mod.opp_index2(index) for index in range(3)] == [2, 0, 1]
    assert mod.SURPLUS_CAP_INDEX == mod.SURPLUS_INDEX == 0
    assert mod.opp_index2(mod.SURPLUS_INDEX) == mod.J_CAP_INDEX == 2


def test_surplus_c1_is_distinct_from_rotated_j_in_c3() -> None:
    caps = (
        frozenset({"m2", "O", "xv", "bv", "bu"}),
        frozenset({"O", "m1", "au", "av", "v", "delta"}),
        frozenset({"m1", "m2", "u", "xu", "cu", "cv"}),
    )
    interiors = tuple(mod.cap_interior(caps, index) for index in range(3))
    mod.verify_surplus_and_j(caps, interiors, mod.CELL_TEMPLATES[0])
    assert len(caps[mod.SURPLUS_CAP_INDEX]) == 5
    assert interiors[mod.J_CAP_INDEX] == {"u", "xu", "cu", "cv"}
    assert_rejected("surplus_cap_size", mod._reject_surplus_j_conflation)
    assert mod.CAP_INDEXING["surplus_cap_name"] == "C1"
    assert mod.CAP_INDEXING["j_cap_name"] == "C3"


def test_known_sat_unsat_and_all_mutation_smokes() -> None:
    result = mod.run_solver_smokes(timeout_ms=5_000)
    assert result["status"] == "PASS"
    assert result["known_sat"] == {
        "solver_result": "sat",
        "exact_readback": "3/2",
    }
    assert result["known_unsat"] == {"solver_result": "unsat"}
    assert set(result["mutation_controls"]) == {
        "closed_vs_open_cap_inequality",
        "opposite_cap_index",
        "endpoint_erasure",
        "surplus_c1_not_rotated_j_c3",
        "post_deletion_no_qfree",
        "normalization",
        "pairwise_distinctness",
        "mec_enclosure",
        "mec_boundary",
        "exact_physical_fiber",
        "exact_source_row_fiber",
        "mutual_omission",
        "global_convexity",
    }
    assert all(
        control["status"] == "PASS" for control in result["mutation_controls"].values()
    )


def test_convexity_checks_every_edge_against_every_nonincident_point() -> None:
    points = mod._convex_control_points()
    assert mod.verify_strict_convexity(points, mod.ROLE_ORDER) > 0
    assert_rejected("strict_convexity", mod._reject_convexity_mutation)


def test_no_qfree_rejects_four_equal_positive_distances_after_deletion() -> None:
    assert_rejected("no_qfree", mod._synthetic_no_qfree_failure)


def test_normalization_and_pairwise_distinctness_mutations() -> None:
    mod.verify_carrier_shape(mod._shape_control_points())
    assert_rejected("normalization", mod._reject_normalization_mutation)
    assert_rejected("pairwise_distinct", mod._reject_pairwise_distinct_mutation)


def test_mec_enclosure_and_boundary_mutations() -> None:
    assert mod.verify_mec_certificate(mod._mec_control_points()) == (
        F(32, 25),
        F(32, 25),
        F(48, 25),
    )
    assert_rejected("mec_enclosure", mod._reject_mec_enclosure_mutation)
    assert_rejected("mec_boundary", mod._reject_mec_boundary_mutation)


def test_exact_physical_and_row_fiber_mutations() -> None:
    physical_points = mod._physical_fiber_control_points()
    mod.verify_exact_fiber(physical_points, "O", F(1), mod.PHYSICAL, "physical_fiber")
    assert_rejected("physical_fiber", mod._reject_physical_fiber_mutation)

    row_points = mod._row_fiber_control_points()
    mod.verify_exact_fiber(row_points, "cu", F(1), mod.KU, "ku_fiber")
    assert_rejected("ku_fiber", mod._reject_row_fiber_mutation)


def test_mutual_omission_mutation() -> None:
    mod.verify_rigid_packet(mod.PHYSICAL, mod.KU, mod.KV)
    assert_rejected("mutual_omission", mod._reject_mutual_omission_mutation)


def test_build_solver_is_deterministic_and_exports_runnable_qf_nra() -> None:
    cell = mod.CELL_TEMPLATES[0]
    first, _points1, _radii1 = mod.build_solver(cell, timeout_ms=1234)
    second, _points2, _radii2 = mod.build_solver(cell, timeout_ms=1234)
    first_text = mod.export_smt2(first)
    assert first_text == mod.export_smt2(second)
    unrelated, _points3, _radii3 = mod.build_solver(mod.CELL_TEMPLATES[1], 1234)
    mod.export_smt2(unrelated)
    rebuilt, _points4, _radii4 = mod.build_solver(cell, 1234)
    assert first_text == mod.export_smt2(rebuilt)
    assert first_text.endswith("(check-sat)\n")
    assert "QF_NRA" in first_text
    assert len(first.assertions()) > 1_000


def test_fixed_cap_arms_replace_three_way_pb_disjunctions() -> None:
    solver, _points, _radii = mod.build_solver(mod.CELL_TEMPLATES[0], 1000)
    text = mod.export_smt2(solver)
    assert "((_ pb" not in text
    assert "(^ " not in text
    assert "m0_distinct_s0_i__u_x" in text


def test_cvc5_fallback_uses_nl_cov_millisecond_limit_and_exact_get_value(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    cell = mod.CELL_TEMPLATES[0]
    names = mod._cvc5_value_names(cell)
    stdout = "sat\n(" + " ".join(f"({name} (/ 0 1))" for name in names) + ")\n"

    def fake_run(args: list[str], **kwargs: object) -> subprocess.CompletedProcess[str]:
        assert args == [
            "cvc5",
            "--lang",
            "smt2",
            "--nl-cov",
            "--produce-models",
            "--tlimit",
            "321",
        ]
        assert kwargs["timeout"] == pytest.approx(30.321)
        assert "(check-sat)" in str(kwargs["input"])
        assert "(get-value (" in str(kwargs["input"])
        return subprocess.CompletedProcess(args, 0, stdout, "")

    monkeypatch.setattr(mod.subprocess, "run", fake_run)
    solver, _points, _radii = mod.build_solver(cell, 321)
    status, witness, engine = mod.run_cvc5(cell, mod.export_smt2(solver), 321)
    assert status == "sat"
    assert witness is not None
    assert set(witness.point_map().values()) == {(F(0), F(0))}
    assert engine["model_readback"] == "exact-rational"


def test_cvc5_value_parser_rejects_nonrational_algebraic_terms() -> None:
    assert_rejected(
        "nonrational_model",
        lambda: mod._sexpr_fraction(["root-of", "p", "1"], "x"),
    )


def test_fraction_serialization_is_canonical_and_fail_closed() -> None:
    assert mod._fraction_text(F(-4, 6)) == "-2/3"
    assert mod._parse_fraction("-2/3", "x") == F(-2, 3)
    assert_rejected("rational_canonical", lambda: mod._parse_fraction("2/4", "x"))
    assert_rejected("rational_format", lambda: mod._parse_fraction("0.5", "x"))


def test_exact_model_readback_accepts_rationals() -> None:
    solver = z3.SolverFor("QF_NRA")
    point_vars = {
        role: (z3.Real(f"readback_{role}_x"), z3.Real(f"readback_{role}_y"))
        for role in mod.ROLE_ORDER
    }
    radius_vars = tuple(z3.Real(f"readback_r{index}") for index in range(3))
    for index, role in enumerate(mod.ROLE_ORDER):
        solver.add(point_vars[role][0] == index, point_vars[role][1] == F(index, 2))
    solver.add(radius_vars[0] == 1, radius_vars[1] == 2, radius_vars[2] == 3)
    assert solver.check() == z3.sat
    witness = mod.read_exact_model(solver.model(), point_vars, radius_vars)
    assert witness.point_map()["bv"] == (F(13), F(13, 2))
    assert (witness.physical_radius2, witness.ku_radius2, witness.kv_radius2) == (
        1,
        2,
        3,
    )


def test_exact_model_readback_rejects_algebraic_coordinates() -> None:
    solver = z3.SolverFor("QF_NRA")
    x = z3.Real("algebraic_x")
    solver.add(x * x == 2, x > 0)
    assert solver.check() == z3.sat
    assert_rejected(
        "nonrational_model",
        lambda: mod._z3_fraction(solver.model().eval(x), "algebraic_x"),
    )


def test_witness_json_round_trip_uses_only_exact_rationals() -> None:
    witness = mod.ExactWitness(
        points=tuple(
            (role, (F(index), F(-index, index + 1)))
            for index, role in enumerate(mod.ROLE_ORDER)
        ),
        physical_radius2=F(7, 5),
        ku_radius2=F(3, 2),
        kv_radius2=F(11, 7),
    )
    assert mod._parse_witness(mod._witness_json(witness)) == witness


def test_authentication_detects_nested_payload_mutation() -> None:
    cell = mod.CELL_TEMPLATES[0]
    result = authenticated_unknown(cell, "a" * 64, "b" * 64)
    assert mod.verify_authentication(result) == result
    corrupt = copy.deepcopy(result)
    corrupt["claim"]["source_universal_claim"] = True  # type: ignore[index]
    assert_rejected("authentication_digest", lambda: mod.verify_authentication(corrupt))


def test_terminal_fixed_order_unknown_is_reusable_without_broader_claim(
    tmp_path: Path,
) -> None:
    cell = mod.CELL_TEMPLATES[0]
    input_sha256 = "c" * 64
    script_sha256 = mod.current_script_sha256()
    result = authenticated_unknown(cell, input_sha256, script_sha256)
    path = tmp_path / "result.json"
    path.write_text(mod.canonical_json(result, pretty=True), encoding="utf-8")
    reused = mod.load_reusable_result(path, cell, input_sha256, script_sha256)
    assert reused == result
    assert reused["status"] == mod.UNKNOWN_UNSAT_STATUS
    assert reused["claim"]["full_L1_claim"] is False
    assert reused["claim"]["source_universal_claim"] is False


def test_timeout_artifact_is_not_terminal_for_resume(tmp_path: Path) -> None:
    cell = mod.CELL_TEMPLATES[0]
    input_sha256 = "d" * 64
    script_sha256 = mod.current_script_sha256()
    payload = mod._base_result(
        cell=cell,
        status=mod.UNKNOWN_TIMEOUT_STATUS,
        solver_result="unknown",
        input_sha256=input_sha256,
        script_sha256=script_sha256,
        git_head="test-head",
        reason="timeout",
    )
    path = tmp_path / "result.json"
    path.write_text(
        mod.canonical_json(mod.authenticate_payload(payload), pretty=True),
        encoding="utf-8",
    )
    assert mod.load_reusable_result(path, cell, input_sha256, script_sha256) is None


@pytest.mark.parametrize(
    ("statuses", "expected"),
    [
        ([mod.SAT_STATUS, mod.SAT_STATUS], mod.SAT_STATUS),
        ([mod.SAT_STATUS, mod.UNKNOWN_TIMEOUT_STATUS], mod.PARTIAL_SAT_STATUS),
        ([mod.UNKNOWN_UNSAT_STATUS, mod.UNKNOWN_TIMEOUT_STATUS], "UNKNOWN"),
        ([mod.SAT_STATUS, mod.ERROR_STATUS], mod.ERROR_STATUS),
        ([mod.UNKNOWN_TIMEOUT_STATUS, mod.ERROR_STATUS], mod.ERROR_STATUS),
    ],
)
def test_aggregate_status_is_fail_closed(statuses: list[str], expected: str) -> None:
    assert mod.aggregate_run_status(statuses) == expected


def test_run_resume_never_constructs_executor_for_authenticated_terminal_cells(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    script_sha256 = mod.current_script_sha256()
    for cell in mod.CELL_TEMPLATES:
        solver, _points, _radii = mod.build_solver(cell, 77)
        smt2 = mod.export_smt2(solver)
        input_sha256 = mod._sha256_text(smt2)
        result = authenticated_unknown(cell, input_sha256, script_sha256)
        cell_dir = tmp_path / "cells" / cell.cell_id
        cell_dir.mkdir(parents=True)
        (cell_dir / mod.SMT2_FILENAME).write_text(smt2, encoding="utf-8")
        (cell_dir / mod.RESULT_FILENAME).write_text(
            mod.canonical_json(result, pretty=True), encoding="utf-8"
        )

    def forbidden_executor(*_args: object, **_kwargs: object) -> object:
        raise AssertionError("resume attempted to launch a solver executor")

    monkeypatch.setattr(mod, "ProcessPoolExecutor", forbidden_executor)
    run = mod.run_cells(tmp_path, 2, 77, cvc5_fallback=False)
    assert [cell["status"] for cell in run["cells"]] == [
        mod.UNKNOWN_UNSAT_STATUS,
        mod.UNKNOWN_UNSAT_STATUS,
    ]


def test_resume_regenerates_and_rejects_self_hashed_noncanonical_smt2(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    script_sha256 = mod.current_script_sha256()
    canonical_by_cell: dict[str, str] = {}
    for index, cell in enumerate(mod.CELL_TEMPLATES):
        solver, _points, _radii = mod.build_solver(cell, 91)
        canonical = mod.export_smt2(solver)
        canonical_by_cell[cell.cell_id] = canonical
        stored = canonical + "; mutation\n" if index == 0 else canonical
        input_sha256 = mod._sha256_text(stored)
        result = authenticated_unknown(cell, input_sha256, script_sha256)
        cell_dir = tmp_path / "cells" / cell.cell_id
        cell_dir.mkdir(parents=True)
        (cell_dir / mod.SMT2_FILENAME).write_text(stored, encoding="utf-8")
        (cell_dir / mod.RESULT_FILENAME).write_text(
            mod.canonical_json(result, pretty=True), encoding="utf-8"
        )

    def expected_executor(*_args: object, **_kwargs: object) -> object:
        raise AssertionError("noncanonical input correctly forced a fresh run")

    monkeypatch.setattr(mod, "ProcessPoolExecutor", expected_executor)
    with pytest.raises(AssertionError, match="forced a fresh run"):
        mod.run_cells(tmp_path, 2, 91, cvc5_fallback=False)
    first = mod.CELL_TEMPLATES[0]
    assert (tmp_path / "cells" / first.cell_id / mod.SMT2_FILENAME).read_text(
        encoding="utf-8"
    ) == canonical_by_cell[first.cell_id]


def test_result_replay_rejects_stale_input_or_script_digest() -> None:
    cell = mod.CELL_TEMPLATES[0]
    result = authenticated_unknown(cell, "e" * 64, "f" * 64)
    assert_rejected(
        "result_input",
        lambda: mod.replay_result_document(result, expected_input_sha256="0" * 64),
    )
    assert_rejected(
        "result_script",
        lambda: mod.replay_result_document(result, expected_script_sha256="0" * 64),
    )


def test_result_replay_rejects_unknown_status_even_with_valid_digest() -> None:
    cell = mod.CELL_TEMPLATES[0]
    payload = mod._base_result(
        cell=cell,
        status="UNSAT_EXACT",
        solver_result="unsat",
        input_sha256="1" * 64,
        script_sha256="2" * 64,
        git_head="test-head",
        reason="invalid promotion",
    )
    result = mod.authenticate_payload(payload)
    assert_rejected("result_status", lambda: mod.replay_result_document(result))


def test_positive_claim_vocabulary_is_strictly_finite() -> None:
    cell = mod.CELL_TEMPLATES[0]
    claim = mod._claim_json(mod.SAT_STATUS, cell)
    assert claim["full_L1_claim"] is False
    assert "never covers the full L1 partition" in claim["full_L1_claim_meaning"]
    assert claim["l1_existential_cell_witness_claim"] is True
    assert claim["bounded_cell_claim"] is True
    assert claim["fixed_cardinality"] == 14
    assert claim["fixed_order_only"] is True
    assert claim["overlap_cell"] == "M0"
    assert claim["equality_cell"] == "all-distinct"
    assert claim["order_template"] == "M0-I-v1"
    assert claim["source_universal_claim"] is False
    assert claim["lean_claim"] is False
    assert claim["promotion_claim"] is False


@pytest.mark.parametrize("workers", [0, 21, -1])
def test_worker_limit_hard_rejects_out_of_range(workers: int) -> None:
    assert_rejected("workers", lambda: mod._validate_limits(workers, 1000))


def test_worker_limit_accepts_twenty_and_timeout_must_be_positive() -> None:
    mod._validate_limits(20, 1)
    assert_rejected("timeout", lambda: mod._validate_limits(1, 0))


def test_run_cells_enforces_limits_for_direct_callers(tmp_path: Path) -> None:
    output = tmp_path / "must-not-be-created"
    assert_rejected(
        "workers", lambda: mod.run_cells(output, 21, 1, cvc5_fallback=False)
    )
    assert not output.exists()


def test_cli_modes_are_mutually_exclusive() -> None:
    parser = mod.build_parser()
    with pytest.raises(SystemExit):
        parser.parse_args([])
    with pytest.raises(SystemExit):
        parser.parse_args(["--smoke", "--output-dir", "somewhere"])


def test_cli_smoke_is_sparse_unless_verbose(capsys: pytest.CaptureFixture[str]) -> None:
    assert mod.main(["--smoke", "--timeout-ms", "5000"]) == 0
    sparse = capsys.readouterr()
    assert sparse.out == "smoke PASS\n"
    assert sparse.err == ""

    assert mod.main(["--smoke", "--timeout-ms", "5000", "--verbose"]) == 0
    verbose = capsys.readouterr()
    document = json.loads(verbose.out)
    assert document["schema"] == "rigid221-s0-full-l1-smoke/v1"
    assert document["status"] == "PASS"


def test_process_pool_run_writes_authenticated_per_cell_artifacts(
    tmp_path: Path,
) -> None:
    result = mod.run_cells(tmp_path, workers=2, timeout_ms=1, cvc5_fallback=False)
    assert result["schema"] == mod.RUN_SCHEMA
    assert len(result["cells"]) == 2
    assert all(cell["status"] != mod.ERROR_STATUS for cell in result["cells"])
    for cell in mod.CELL_TEMPLATES:
        cell_dir = tmp_path / "cells" / cell.cell_id
        smt2 = (cell_dir / mod.SMT2_FILENAME).read_text(encoding="utf-8")
        document = json.loads(
            (cell_dir / mod.RESULT_FILENAME).read_text(encoding="utf-8")
        )
        assert smt2.startswith("(set-logic QF_NRA)\n")
        assert smt2.count("(check-sat)") == 1
        replayed, report = mod.replay_result_document(
            document,
            expected_cell=cell,
            expected_input_sha256=mod._sha256_text(smt2),
            expected_script_sha256=mod.current_script_sha256(),
        )
        assert replayed["status"] in mod.ALLOWED_STATUSES
        assert report is None


def test_active_and_omitted_ledgers_keep_the_claim_fail_closed() -> None:
    assert any("whole carrier" in fact for fact in mod.ACTIVE_CONSTRAINTS)
    assert any("M1/M2" in fact for fact in mod.OMITTED_CONSTRAINTS)
    assert any("universal coverage" in fact for fact in mod.OMITTED_CONSTRAINTS)
    assert {
        "CounterexampleData.K4 and the all-center ambient K4 existential surface",
        "OriginalUniqueFourResidual and global noM44 across alternative cap packets",
        "counterexample and deletion minimality beyond the two encoded singleton obstructions",
        "first-apex exact-four, unique-radius, and original-residual obligations",
        "q/w identities, memberships, bisector geometry, other, and source-survival data",
        "source-legal Moser-endpoint identifications, including S0-N xu at an endpoint",
    } <= set(mod.OMITTED_CONSTRAINTS)
    assert mod.ALGEBRAIC_DOF == {
        "named_point_coordinate_variables": 28,
        "fixed_coordinate_equalities": 6,
        "free_coordinate_variables": 22,
        "radius_variables": 3,
        "raw_physical_and_row_equalities": 13,
        "independent_equalities_after_eliminating_three_radii": 10,
        "nominal_residual_coordinate_dof": 12,
        "qualification": (
            "structural bookkeeping before inequalities and disequalities; "
            "not a certified Jacobian-rank calculation"
        ),
    }

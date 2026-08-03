from __future__ import annotations

from pathlib import Path

import z3

import round5_cegar_v17 as v17


def tracker_formula(*constraints: z3.BoolRef) -> tuple[z3.BoolRef, ...]:
    trackers = [z3.Bool(name) for name in sorted(v17.TRACKER_ALLOWLIST)]
    guarded = [z3.Implies(trackers[index % len(trackers)], constraint) for index, constraint in enumerate(constraints)]
    return tuple(guarded + trackers)


def test_exact_pb_normalization_has_no_pb_or_ite() -> None:
    x = z3.Real("x")
    units = [x != index for index in range(13)]
    heavy = x != 20
    formula = tracker_formula(
        z3.AtLeast(*units, 11),
        z3.PbGe([(unit, 1) for unit in units] + [(heavy, 2)], 13),
    )
    normalized, trackers, record = v17._fixed_normalized_formula(formula, ())
    assert len(trackers) == 26
    assert record["pre_normalization_pb_nodes"] == 2
    assert record["logic_audit"]["accepted"] is True
    assert record["logic_audit"]["pb_nodes"] == 0
    assert record["logic_audit"]["ite_nodes"] == 0
    assert normalized


def test_logic_audit_rejects_non_qf_lra_constructs() -> None:
    b = z3.Bool("b")
    x = z3.Real("x")
    n = z3.Int("n")
    audit = v17.logic_audit((z3.If(b, x, x + 1) >= 0, n >= 0, x * x >= 1))
    assert audit["accepted"] is False
    assert audit["ite_nodes"] == 1
    assert audit["integer_nodes"] > 0
    assert audit["nonlinear_nodes"] == 1


def test_raw_formula_hash_is_context_safe() -> None:
    fresh = z3.Context()
    x = z3.Real("context_x", ctx=fresh)
    assertions = (x > 0, x < 1)
    fresh_hash = v17.raw_formula_sha256(assertions)
    main_hash = v17.raw_formula_sha256(tuple(item.translate(z3.main_ctx()) for item in assertions))
    assert fresh_hash == main_hash


def test_tracker_allowlist_is_exact_not_prefix_based() -> None:
    formula = tracker_formula(z3.Bool("track_unapproved_extra"))
    try:
        v17._fixed_normalized_formula(formula, ())
    except RuntimeError as exc:
        assert "tracker allowlist mismatch" in str(exc)
    else:
        raise AssertionError("extra track_ name was accepted")


def test_equality_closure_returns_concrete_explanation() -> None:
    values: dict[str, bool] = {}
    for center in (4, 5, 11):
        for point in v17.v8.POINTS:
            if point != center:
                values[f"k4_{center}_{point}"] = False
    for point in v17.v8.POINTS:
        if point != 4:
            values[f"critical_row_4_{point}"] = False
    values.update({
        "block_0_4": True,
        "critical_row_4_6": True,
        "critical_row_4_11": False,
        "k4_4_5": True,
        "k4_4_6": True,
        "k4_5_4": True,
        "k4_5_11": True,
        "k4_11_4": True,
        "k4_11_5": True,
    })
    fixes = tuple(v17.Fix(z3.Bool(name), value) for name, value in sorted(values.items()))
    core = v17.equality_closure_core(fixes)
    names = {str(fix.variable) for fix in core}
    assert core
    assert {"block_0_4", "critical_row_4_6"} <= names
    assert any(name.startswith("critical_row_4_") and not values[name] for name in names)
    assert all(dict(values)[str(fix.variable)] == fix.value for fix in core)


def test_complete_assignment_unsat_replay_and_hash_binding() -> None:
    x = z3.Real("theory_x")
    trackers = [z3.Bool(name) for name in sorted(v17.TRACKER_ALLOWLIST)]
    frozen = tuple([
        z3.Implies(trackers[0], x > 0),
        z3.Implies(trackers[1], x < 0),
    ] + trackers)
    fixes = tuple(v17.Fix(z3.Bool(f"synthetic_semantic_{index:03d}"), index % 2 == 0) for index in range(825))
    status, model, core, record = v17.check_assignment(frozen, fixes, 5_000, 97, 0)
    assert status == "unsat"
    assert model is None
    assert core == fixes
    assert record["generalized"] is False
    assert record["blocker_scope"] == "complete_semantic_assignment"
    assert record["assignment_sha256"] == v17.canonical_sha256(v17._assignment_record(fixes))
    assert record["expected_complete_blocker_sha256"]
    assert record["fresh_normalized_full_replay"]["status"] == "unsat"
    replay = record["fresh_normalized_full_replay"]
    assert replay["replay_status"] == "unsat"
    assert replay["theory_logic"] == "QF_LRA"
    assert replay["qf_lra_audit"]["accepted"] is True
    assert replay["normalized_formula_sha256"] == replay["normalization"]["normalized_formula_sha256"]
    assert replay["fixed_assignment_pb_nodes"] == replay["normalization"]["pre_normalization_pb_nodes"]
    assert replay["raw_formula_sha256"] == record["frozen_full_formula_sha256"]
    assert replay["source_assertions_sha256"] == replay["reconstructed_assertions_sha256"]
    assert replay["semantic_bool_universe_sha256"] == record["semantic_bool_universe_sha256"]
    assert replay["assignment_sha256"] == record["assignment_sha256"]
    assert replay["complete_blocker_sha256"] == record["expected_complete_blocker_sha256"]
    assert replay["complete_assignment_size"] == 825
    assert replay["tracker_mode"] == "exact_allowlist_substituted_true"
    assert replay["tracker_core"] == []


def test_unknown_is_fail_closed(monkeypatch) -> None:
    fixes = tuple(v17.Fix(z3.Bool(f"opaque_{index:03d}"), False) for index in range(825))
    monkeypatch.setattr(v17, "equality_closure_core", lambda _: ())
    monkeypatch.setattr(
        v17,
        "_normalized_check",
        lambda *args: ("unknown", None, {"reason_unknown": "canceled"}),
    )
    status, model, core, record = v17.check_assignment((), fixes, 1, 97, 0)
    assert status == "unknown"
    assert model is None and core == ()
    assert record["reason_unknown"] == "canceled"


def test_provenance_pins_v16_and_v17_sources() -> None:
    provenance = v17.provenance()
    assert provenance["schema_version"] == 17
    assert provenance["script_sha256"] == v17.file_sha256(v17.SCRIPT_PATH)
    assert provenance["schema_sha256"] == v17.file_sha256(v17.SCHEMA_PATH)
    assert provenance["base_v16_script_sha256"] == v17.file_sha256(v17.HERE / "round5_cegar_v16.py")
    assert provenance["base_v16_schema_sha256"] == v17.file_sha256(v17.HERE / "schema_v16.json")
    assert provenance["focused_test_source"] == v17.TEST_PATH.name
    assert provenance["focused_test_source_sha256"] == v17.file_sha256(v17.TEST_PATH)
    assert provenance["focused_test_log"] == v17.FOCUSED_TEST_LOG_PATH.name
    assert provenance["focused_test_log_sha256"] == v17.optional_file_sha256(v17.FOCUSED_TEST_LOG_PATH)
    assert provenance["focused_test_command"] == v17.FOCUSED_TEST_COMMAND


def test_artifact_blob_hashes_and_result_self_hash_contract(tmp_path: Path) -> None:
    (tmp_path / "boolean_master_v16.smt2.gz").write_bytes(b"boolean-master")
    (tmp_path / "full_frozen_v16.smt2.gz").write_bytes(b"full-frozen")
    result: dict[str, object] = {
        "boolean_master_file": "boolean_master_v16.smt2.gz",
        "full_frozen_file": "full_frozen_v16.smt2.gz",
    }
    v17._rename_v17_artifacts(tmp_path, result)
    hashes = result["frozen_blob_hashes"]
    assert hashes["boolean_master"]["sha256"] == v17.file_sha256(tmp_path / "boolean_master_v17.smt2.gz")
    assert hashes["full_frozen"]["sha256"] == v17.file_sha256(tmp_path / "full_frozen_v17.smt2.gz")
    assert result["result_hash_contract"]["embedded"] is False
    assert result["result_hash_contract"]["external_attestation"] == "summary.json:results[0].result_file_sha256"


def test_v16_budget_reasons_are_renamed() -> None:
    assignment = {"reason_incomplete": "v16_assignment_budget_exhausted"}
    wall = {"reason_incomplete": "v16_wall_clock_budget_exhausted"}
    v17._rename_incomplete_reason(assignment)
    v17._rename_incomplete_reason(wall)
    assert assignment["reason_incomplete"] == "v17_assignment_budget_exhausted"
    assert wall["reason_incomplete"] == "v17_wall_clock_budget_exhausted"

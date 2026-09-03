from __future__ import annotations

import hashlib
import json
from fractions import Fraction

import pytest

from census.card_head import (
    exactfive_hard_source_swap_adaptive_order_nra_piqd as subject,
)
from census.p97_search.tests.test_phase3_piqd_smt_source_adapter import (
    FakeCurrentPiqd,
)


def _readback(prepared: subject.PreparedQuery, values: dict[str, Fraction]) -> str:
    def show(value: Fraction) -> str:
        if value.denominator == 1:
            return str(value.numerator)
        return f"(/ {value.numerator} {value.denominator})"

    return "(" + " ".join(
        f"({term} {show(values[term])})" for term in prepared.query.get_values
    ) + ")"


def _origin(order: tuple[str, ...], solver: str = "z3") -> dict[str, object]:
    digest = hashlib.sha256(b"fixture").hexdigest()
    value: dict[str, object] = {
        "schema": subject.LINEAR_ORIGIN_SCHEMA,
        "profile_index": subject.PROFILE_INDEX,
        "profile_sha256": subject.PROFILE_SHA256,
        "linear_query_id": "linear-profile-1697",
        "linear_query_sha256": digest,
        "linear_result_sha256": digest,
        "linear_solver": solver,
        "linear_engine_sha256": digest,
        "linear_semantic_replay_sha256": digest,
        "model_sha256": digest,
        "values_sha256": digest,
        "order": list(order),
        "order_sha256": subject.order_sha256(order),
    }
    value["origin_sha256"] = subject._self_hash(value, "origin_sha256")
    return value


def _write_positive_control_tree(output) -> subject.PreparedQuery:
    prepared = subject.prepare_linear_query(
        subject.build_linear_system("positive"), timeout_ms=1_000
    )
    values = subject.frozen_order.control_assignment("positive")

    class ControlTransport(FakeCurrentPiqd):
        def _answer(self, solver: str) -> dict[str, object]:
            answer = super()._answer(solver)
            answer["values"] = _readback(prepared, values)
            return answer

        def request_json(self, method, path, body=None):
            if method != "POST" or not path.endswith("/solve"):
                return super().request_json(method, path, body)
            assert body is not None
            expected_values = list(body["get_values"])
            fixture_body = dict(body)
            fixture_body["get_values"] = ["x"]
            response = super().request_json(method, path, fixture_body)
            session_id = path.split("/")[2]
            self.sessions[session_id]["solve_request"]["get_values"] = expected_values
            self.sessions[session_id]["receipt"]["get_values"] = expected_values
            return response

    subject.adapter.run_source_semantic_query(
        prepared.query,
        output,
        ControlTransport(),
        subject.verify_linear_sat_model,
    )
    return prepared


def _rewrite_engine_json_artifact(
    output, solver: str, label: str, value, *, inline_field: str | None = None
) -> None:
    result_path = output / "result.json"
    result = json.loads(result_path.read_text())
    engine = next(row for row in result["engines"] if row["solver"] == solver)
    record = engine["artifacts"][label]
    payload = subject._json(value)
    artifact_path = output / record["path"]
    artifact_path.chmod(0o600)
    artifact_path.write_bytes(payload)
    record.update(bytes=len(payload), sha256=hashlib.sha256(payload).hexdigest())
    if inline_field is not None:
        engine[inline_field] = value
    result_path.chmod(0o600)
    result_path.write_bytes(subject._json(result))


def test_initial_blocks_are_exact_frozen_nra_orders() -> None:
    assert subject.initial_blocked_orders() == tuple(
        tuple(subject.frozen_nra.ORDERS[key]) for key in subject.frozen_nra.ORDER_IDS
    )
    assert len(set(subject.initial_blocked_orders())) == 2


def test_full_permutation_block_bytes_and_hash_are_deterministic() -> None:
    order = subject.initial_blocked_orders()[0]
    command = subject.order_block_command(order)
    expected_terms = " ".join(
        f"(= rank_{class_id} {rank})" for rank, class_id in enumerate(order)
    )
    assert command == f"(assert (not (and {expected_terms})))"
    assert subject.order_block_command(order) == command
    assert subject.order_sha256(order) == subject.order_sha256(tuple(order))
    system = subject.build_linear_system()
    assert subject.linear_smt_journal(system) == subject.linear_smt_journal(
        subject.build_linear_system()
    )
    assert [row["clause_class"] for row in system["enumeration_controls"]] == [
        "ENUMERATION_CONTROL",
        "ENUMERATION_CONTROL",
    ]


def test_blocked_exact_old_replay_is_rejected(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    order = subject.initial_blocked_orders()[0]
    ranks = {class_id: rank for rank, class_id in enumerate(order)}
    monkeypatch.setattr(
        subject.frozen_order,
        "replay_assignment",
        lambda _system, _values: subject.frozen_order.ReplayOutcome(
            True, {"ranks": ranks, "all_asserted_atoms_replayed": True}
        ),
    )
    replay = subject.replay_linear_assignment(subject.build_linear_system(), {})
    assert not replay.accepted
    assert replay.evidence["reason"] == "enumeration_control_block"


def test_structural_controls_replay_through_old_exact_checker() -> None:
    positive = subject.build_linear_system("positive")
    negative = subject.build_linear_system("negative")
    assert subject.replay_linear_assignment(
        positive, subject.frozen_order.control_assignment("positive")
    ).accepted
    rejected = subject.replay_linear_assignment(
        negative, subject.frozen_order.control_assignment("negative")
    )
    assert not rejected.accepted
    assert rejected.evidence["reason"] == "kalmanson"


def test_structural_positive_control_query_exactly_replays() -> None:
    prepared = subject.prepare_linear_query(
        subject.build_linear_system("positive"), timeout_ms=1_000
    )
    values = subject.frozen_order.control_assignment("positive")
    replay = subject.verify_linear_sat_model(
        prepared.query, "z3", "(model)", _readback(prepared, values)
    )
    assert replay.accepted
    assert replay.evidence["old_formula_exact_replay"] is True


def test_supplied_empty_linear_system_is_rejected() -> None:
    with pytest.raises(subject.AdaptiveOrderNraError, match="wrong schema"):
        subject.prepare_linear_query({})


def test_fresh_order_extraction_is_exact_ordered_and_deduplicated() -> None:
    prepared = subject.prepare_linear_query(timeout_ms=1_000)
    blocked = set(subject.initial_blocked_orders())
    base = list(subject.initial_blocked_orders()[0])
    base[-2], base[-1] = base[-1], base[-2]
    fresh = tuple(base)
    assert fresh not in blocked
    evidence = {
        "order": list(fresh),
        "order_sha256": subject.order_sha256(fresh),
        "model_sha256": "1" * 64,
        "values_sha256": "2" * 64,
    }
    engines = [
        {
            "solver": solver,
            "raw_status": "SAT",
            "semantic_replay": {"accepted": True, "evidence": evidence},
        }
        for solver in subject.adapter.SOLVERS
    ]
    result = {"engines": engines}
    verified = subject.VerifiedTree(
        subject._sha(prepared.query.descriptor_bytes), result, "3" * 64
    )
    witnesses = subject.extract_fresh_witnesses(prepared, verified)
    assert [row.order for row in witnesses] == [fresh]
    assert witnesses[0].solver == "z3"
    assert witnesses[0].origin["order_sha256"] == subject.order_sha256(fresh)


def test_extraction_rejects_a_blocked_semantic_replay() -> None:
    prepared = subject.prepare_linear_query(timeout_ms=1_000)
    blocked = subject.initial_blocked_orders()[0]
    evidence = {
        "order": list(blocked),
        "order_sha256": subject.order_sha256(blocked),
        "model_sha256": "1" * 64,
        "values_sha256": "2" * 64,
    }
    verified = subject.VerifiedTree(
        subject._sha(prepared.query.descriptor_bytes),
        {
            "engines": [
                {
                    "solver": "z3",
                    "raw_status": "SAT",
                    "semantic_replay": {"accepted": True, "evidence": evidence},
                },
                {"solver": "cvc5", "raw_status": "UNSAT"},
            ]
        },
        "3" * 64,
    )
    with pytest.raises(subject.AdaptiveOrderNraError, match="enumeration controls"):
        subject.extract_fresh_witnesses(prepared, verified)


def test_dynamic_planar_system_is_current_and_matches_frozen_formula_shape() -> None:
    order = subject.initial_blocked_orders()[0]
    system = subject.build_planar_system(order)
    assert subject._validate_planar_system_current(system) == system
    inventory = subject.frozen_nra.formula_inventory(system)
    assert inventory == {
        "coordinate_declarations": 22,
        "gauge_assertions": 4,
        "fixed_coordinate_assertions": 0,
        "strict_signed_area_assertions": 165,
        "row_equality_assertions": 13,
        "radius_disequality_assertions": 1,
        "source_strict_assertions": 1,
    }
    commands = subject.frozen_nra.build_smt_commands(system)
    assert commands[0] == "(set-logic QF_NRA)"
    assert not any("declare-fun d_" in command for command in commands)


def test_planar_controls_have_expected_exact_coordinate_replay() -> None:
    positive = subject.build_planar_system(control="positive")
    negative = subject.build_planar_system(control="negative")
    positive_coords = {
        key: tuple(Fraction(item) for item in value)
        for key, value in positive["coordinate_pins"].items()
    }
    negative_coords = {
        key: tuple(Fraction(item) for item in value)
        for key, value in negative["coordinate_pins"].items()
    }
    assert subject.frozen_nra.check_coordinates(positive, positive_coords)["accepted"]
    assert not subject.frozen_nra.check_coordinates(negative, negative_coords)[
        "accepted"
    ]


def test_planar_origin_and_descriptor_tampering_are_rejected() -> None:
    order = subject.initial_blocked_orders()[0]
    origin = _origin(order)
    tampered = dict(origin)
    tampered["linear_result_sha256"] = "0" * 64
    with pytest.raises(subject.AdaptiveOrderNraError, match="provenance"):
        subject.prepare_planar_query(
            subject.build_planar_system(order), tampered, timeout_ms=1_000
        )


def test_planar_origin_rejects_nonhex_digest_even_with_rehashed_record() -> None:
    order = subject.initial_blocked_orders()[0]
    origin = _origin(order)
    origin["linear_result_sha256"] = "g" * 64
    origin["origin_sha256"] = subject._self_hash(origin, "origin_sha256")
    with pytest.raises(subject.AdaptiveOrderNraError, match="digest"):
        subject.prepare_planar_query(
            subject.build_planar_system(order), origin, timeout_ms=1_000
        )


def test_planar_query_binds_origin_snapshot_and_digest() -> None:
    order = subject.initial_blocked_orders()[0]
    origin = _origin(order)
    prepared = subject.prepare_planar_query(
        subject.build_planar_system(order), origin, timeout_ms=1_000
    )
    semantic = prepared.query.descriptor["semantic_input"]
    assert semantic["linear_origin"] == origin
    assert semantic["linear_origin_sha256"] == origin["origin_sha256"]
    snapshots = {row.path: row.payload for row in prepared.query.source_files}
    assert snapshots["linear-origin.json"] == subject._json(origin)


@pytest.mark.parametrize("value", [1.5, True, 0, 3_600_001])
def test_descriptor_timeout_ms_is_strict_integer(value: object) -> None:
    with pytest.raises(subject.AdaptiveOrderNraError, match="timeout_ms"):
        subject.prepare_linear_query(timeout_ms=value)  # type: ignore[arg-type]


def test_launch_timeout_is_exact_milliseconds_and_workers_bounded() -> None:
    with pytest.raises(subject.AdaptiveOrderNraError, match="workers"):
        subject.run_census(workers=3)
    with pytest.raises(subject.AdaptiveOrderNraError, match="millisecond"):
        subject.run_census(timeout_s=0.0001)
    with pytest.raises(subject.AdaptiveOrderNraError, match="millisecond"):
        subject.run_census(timeout_s=float("nan"))


def test_manifest_creation_is_checkpoint_bound(
    tmp_path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(subject, "RUN_ROOT", tmp_path / "run-0001")
    root, manifest = subject.ensure_run_root()
    assert root == tmp_path / "run-0001"
    assert manifest["schema"] == subject.RUN_MANIFEST_SCHEMA
    assert manifest["base_head"] == subject._load_checkpoint()["base_head"]
    assert manifest["manifest_sha256"] == subject._self_hash(
        manifest, "manifest_sha256"
    )
    assert (
        "census/card_head/exactfive_hard_source_swap_grid.py"
        in manifest["source_digests"]
    )


def test_checkpoint_rejects_rehashed_wrong_owner(
    tmp_path, monkeypatch: pytest.MonkeyPatch
) -> None:
    checkpoint = subject._load_checkpoint()
    checkpoint["owner"] = "fabricated-owner"
    checkpoint["manifest_sha256"] = subject._self_hash(
        checkpoint, "manifest_sha256"
    )
    path = tmp_path / "checkpoint.json"
    path.write_bytes(subject._json(checkpoint))
    monkeypatch.setattr(subject, "CHECKPOINT_PATH", path)
    with pytest.raises(subject.AdaptiveOrderNraError, match="unauthenticated"):
        subject._load_checkpoint()


def test_run_root_rejects_unbound_tmp_output(
    tmp_path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(subject, "RUN_ROOT", tmp_path / "run-0001")
    root, _manifest = subject.ensure_run_root()
    (root / "tmp" / "unbound").write_bytes(b"partial")
    with pytest.raises(subject.AdaptiveOrderNraError, match="tmp"):
        subject.ensure_run_root()


def test_completed_resume_makes_no_transport_or_solver_call(
    tmp_path, monkeypatch: pytest.MonkeyPatch
) -> None:
    root = tmp_path / "run"
    (root / "events").mkdir(parents=True)
    (root / "artifacts").mkdir()
    (root / "tmp").mkdir()
    manifest = {"manifest_sha256": "m"}
    launch = {
        "run_manifest_sha256": "1" * 64,
        "launch_sha256": "2" * 64,
    }
    terminal = {"status": "TARGET_RESULTS"}
    (root / "events" / "launch.json").write_bytes(subject._json(launch))
    (root / "events" / "terminal.json").write_bytes(b"{}\n")
    monkeypatch.setattr(subject, "ensure_run_root", lambda: (root, manifest))
    monkeypatch.setattr(subject, "_launch_record", lambda *_args, **_kwargs: launch)
    monkeypatch.setattr(subject, "_read_terminal", lambda _path: terminal)
    monkeypatch.setattr(
        subject,
        "_verify_completed_terminal",
        lambda *_args, **_kwargs: terminal,
    )
    monkeypatch.setattr(
        subject.adapter,
        "UrllibPiqdTransport",
        lambda *_args, **_kwargs: pytest.fail("resume created a transport"),
    )
    assert subject.run_census(timeout_s=1, workers=1) == terminal


def test_partial_adapter_tree_fails_closed_without_solver_call(
    tmp_path, monkeypatch: pytest.MonkeyPatch
) -> None:
    prepared = subject.prepare_linear_query(
        subject.build_linear_system("positive"), timeout_ms=1_000
    )
    output = tmp_path / "partial-adapter-output"
    output.mkdir()
    monkeypatch.setattr(
        subject.adapter,
        "run_source_semantic_query",
        lambda *_args, **_kwargs: pytest.fail("partial resume called the solver"),
    )
    with pytest.raises(subject.AdaptiveOrderNraError, match="missing or unreadable"):
        subject._execute_or_resume(prepared, output, transport=object())  # type: ignore[arg-type]


def test_artifact_custody_tamper_is_rejected(tmp_path) -> None:
    payload = b"immutable"
    path = tmp_path / "artifact"
    path.write_bytes(payload)
    record = {"path": "artifact", "bytes": len(payload), "sha256": "0" * 64}
    with pytest.raises(subject.AdaptiveOrderNraError, match="digest mismatch"):
        subject._verify_artifact(tmp_path, record, set())


def test_complete_adapter_custody_and_extra_output_rejection(tmp_path) -> None:
    output = tmp_path / "adapter-output"
    prepared = _write_positive_control_tree(output)
    verified = subject.verify_adapter_tree(prepared, output)
    assert verified.result["overall_status"] == "FINITE_DIAGNOSTIC_COMPLETE"
    unbound = output / "unbound"
    unbound.write_bytes(b"extra")
    with pytest.raises(subject.AdaptiveOrderNraError, match="unbound"):
        subject.verify_adapter_tree(prepared, output)
    unbound.unlink()

    session_path = output / "z3.session.json"
    session = json.loads(session_path.read_text())
    session["label"] = "fabricated-session"
    _rewrite_engine_json_artifact(output, "z3", "session", session)
    with pytest.raises(subject.AdaptiveOrderNraError, match="custody failed replay"):
        subject.verify_adapter_tree(prepared, output)


def test_solve_model_replay_schema_tamper_is_rejected(tmp_path) -> None:
    output = tmp_path / "adapter-output"
    prepared = _write_positive_control_tree(output)
    solve_path = output / "z3.solve.json"
    solve = json.loads(solve_path.read_text())
    del solve["model_replay"]["script_sha256"]
    _rewrite_engine_json_artifact(output, "z3", "solve", solve)
    with pytest.raises(subject.AdaptiveOrderNraError, match="custody failed replay"):
        subject.verify_adapter_tree(prepared, output)


def test_embedded_solve_result_digest_tamper_is_rejected(tmp_path) -> None:
    output = tmp_path / "adapter-output"
    prepared = _write_positive_control_tree(output)
    solve = json.loads((output / "z3.solve.json").read_text())
    solve["result_sha256"] = "0" * 64
    _rewrite_engine_json_artifact(output, "z3", "solve", solve)
    with pytest.raises(subject.AdaptiveOrderNraError, match="custody failed replay"):
        subject.verify_adapter_tree(prepared, output)


def test_semantic_replay_schema_tamper_in_both_copies_is_rejected(tmp_path) -> None:
    output = tmp_path / "adapter-output"
    prepared = _write_positive_control_tree(output)
    semantic = json.loads((output / "z3.semantic.json").read_text())
    del semantic["verifier"]
    _rewrite_engine_json_artifact(
        output,
        "z3",
        "semantic",
        semantic,
        inline_field="semantic_replay",
    )
    with pytest.raises(subject.AdaptiveOrderNraError, match="semantic replay"):
        subject.verify_adapter_tree(prepared, output)


def test_adapter_output_directory_symlink_is_rejected(tmp_path) -> None:
    prepared = subject.prepare_linear_query(
        subject.build_linear_system("positive"), timeout_ms=1_000
    )
    real = tmp_path / "real"
    real.mkdir()
    linked = tmp_path / "linked"
    linked.symlink_to(real, target_is_directory=True)
    with pytest.raises(subject.AdaptiveOrderNraError, match="regular directory"):
        subject.verify_adapter_tree(prepared, linked)


def test_terminal_statuses_distinguish_no_fresh_target_unknown_and_disagreement() -> None:
    def tree(*statuses: str) -> subject.VerifiedTree:
        return subject.VerifiedTree(
            "1" * 64,
            {"engines": [{"raw_status": status} for status in statuses]},
            "2" * 64,
        )

    assert subject._classify_terminal(tree("UNSAT", "UNSAT"), (), 0)[0] == "NO_FRESH_SAT"
    assert subject._classify_terminal(
        tree("SAT", "SAT"), (tree("UNSAT", "UNSAT"),), 1
    )[0] == "TARGET_RESULTS"
    assert subject._classify_terminal(tree("UNKNOWN", "UNKNOWN"), (), 0)[0] == "STRUCTURAL_UNKNOWN"
    assert subject._classify_terminal(tree("SAT", "UNSAT"), (), 1)[0] == "STRUCTURAL_DISAGREEMENT"
    assert subject._classify_terminal(
        tree("SAT", "SAT"), (tree("UNKNOWN", "UNKNOWN"),), 1
    )[0] == "PLANAR_UNKNOWN"
    assert subject._classify_terminal(
        tree("SAT", "SAT"), (tree("SAT", "UNSAT"),), 1
    )[0] == "PLANAR_DISAGREEMENT"

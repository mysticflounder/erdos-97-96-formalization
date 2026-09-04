from __future__ import annotations

import json
from dataclasses import replace
from pathlib import Path

import pytest

from census.card_head import exactfive_opposed_turn_residual_qfnra_piqd as lane
from census.p97_search import phase3_piqd_smt_source_adapter as adapter
from census.p97_search.tests import test_phase3_piqd_smt_source_adapter as adapter_test


def _fixture_prepared(tmp_path: Path, key: str = "profile-0360") -> lane.PreparedQuery:
    query, _ = adapter_test._load(tmp_path)
    descriptor = json.loads(lane._canonical(query.descriptor))
    descriptor["query_id"] = key
    query = replace(query, descriptor=descriptor, descriptor_bytes=lane._json(descriptor))
    return lane.PreparedQuery(key, {"fixture": True}, query)


def _genuine_tree(
    tmp_path: Path,
    *,
    key: str = "profile-0360",
    statuses: dict[str, str] | None = None,
) -> tuple[lane.PreparedQuery, Path, adapter_test.FakeCurrentPiqd]:
    prepared = _fixture_prepared(tmp_path / "packet", key)
    output = tmp_path / "result"
    transport = adapter_test.FakeCurrentPiqd(statuses)
    adapter.run_source_semantic_query(
        prepared.query,
        output,
        transport,
        adapter_test._accepting_verifier,
    )
    return prepared, output, transport


def _runtime_root(tmp_path: Path) -> Path:
    root = tmp_path / "run"
    for name in ("artifacts", "events", "tmp"):
        (root / name).mkdir(parents=True, exist_ok=True)
    (root / "run_manifest.json").write_text("{}\n")
    return root


def _replace_bytes(path: Path, payload: bytes) -> None:
    path.chmod(0o600)
    path.write_bytes(payload)


def test_authenticated_profiles_and_orders_are_frozen() -> None:
    assert lane.PROFILE_INDICES == (360, 363, 376, 467, 470, 483)
    for index in lane.PROFILE_INDICES:
        system = lane.build_system(index)
        assert system["profile_sha256"] == lane.PROFILE_HASHES[index]
        assert len(system["classes"]) in (12, 13)
        assert len(system["order"]) == len(system["classes"])
        assert set(system["order"]) == {row["id"] for row in system["classes"]}


def test_full_formula_inventory_and_qfnra() -> None:
    for index in lane.PROFILE_INDICES:
        system = lane.build_system(index)
        inventory = lane.formula_inventory(system)
        assert inventory["row_equality_assertions"] == 13
        assert inventory["strict_signed_area_assertions"] == (
            220 if len(system["classes"]) == 12 else 286
        )
        commands = lane.build_smt_commands(system)
        assert commands[0] == "(set-logic QF_NRA)"
        assert sum("(assert (> " in command for command in commands) == (
            inventory["strict_signed_area_assertions"] + 1
        )
        assert any("(assert (< " in command for command in commands)
        assert any("(assert (not (= " in command for command in commands)


def test_gauge_and_source_roles_are_present() -> None:
    for index in lane.PROFILE_INDICES:
        system = lane.build_system(index)
        role = system["role_class"]
        assert system["gauge"] == {
            "B": role["c1"],
            "B_xy": ["0", "0"],
            "O": role["O"],
            "O_xy": ["1", "0"],
            "sigma": -1,
        }
        assert system["source_strict"]["positive"] == [role["e"], role["a"]]
        assert system["source_strict"]["negative"] == [role["e"], role["d"]]
        assert system["radius_disequality"]["old"] == role["O"]
        assert system["radius_disequality"]["replacement"] == role["d"]


def test_descriptor_is_state_only_and_execution_sources_are_bound() -> None:
    query = lane.prepare_query(360)
    descriptor = query.query.descriptor
    assert descriptor["solve"]["assumption_ids"] == []
    assert descriptor["named_atoms"] == []
    assert descriptor["solver_profile"]["solvers"] == ["z3", "cvc5"]
    source_paths = {entry["path"] for entry in descriptor["sources"]}
    assert {
        "census/card_head/exactfive_opposed_turn_residual_qfnra_piqd.py",
        "census/card_head/tests/test_exactfive_opposed_turn_residual_qfnra_piqd.py",
        "scripts/run_exactfive_opposed_turn_residual_qfnra.py",
        ".codex/worktree-checkpoints/exactfive-opposed-turn-residual-qfnra-20260903.json",
    } <= source_paths
    if (lane.RUN_ROOT / "run_manifest.json").exists():
        assert f"scratch/runs/{lane.LANE_ID}/{lane.RUN_ID}/run_manifest.json" in source_paths


def test_controls_have_opposite_exact_geometry_outcomes() -> None:
    for control, expected in (("positive", True), ("negative", False)):
        query = lane.prepare_control_query(control).query
        system = query.descriptor["semantic_input"]["system"]
        values = "(" + " ".join(
            f"({term} {system['pins'][term]})" for term in query.get_values
        ) + ")"
        assert lane.verify_sat_model(query, "z3", "(model)", values).accepted is expected


def test_authenticated_input_mine_has_six_selected_cells() -> None:
    inputs = lane.authenticate_inputs()
    assert set(map(int, inputs["profiles"])) == set(lane.PROFILE_INDICES)
    for index in lane.PROFILE_INDICES:
        record = inputs["profiles"][str(index)]["mine_record"]
        assert record["residual"] is True
        z3 = next(cell for cell in record["engine_cells"] if cell["solver"] == "z3")
        assert z3["opposed_turn"]["matched"] is False


def test_run_query_passes_absent_output_and_resumes_without_transport(tmp_path: Path) -> None:
    prepared = _fixture_prepared(tmp_path / "fresh")
    output = tmp_path / "output"
    transport = adapter_test.FakeCurrentPiqd({"z3": "UNKNOWN", "cvc5": "UNKNOWN"})
    assert not output.exists()
    first = lane.run_query(prepared, output, transport)
    assert output.is_dir()

    class NoTransport:
        def __getattr__(self, name: str) -> object:
            raise AssertionError(f"transport used on immutable resume: {name}")

    assert lane.run_query(prepared, output, NoTransport()) == first


@pytest.mark.parametrize(
    "mutation",
    [
        "descriptor-bytes",
        "original-bytes",
        "source-bytes",
        "session-bytes",
        "receipt-bytes",
        "artifact-label",
        "solver-signature",
        "piqd-digest",
        "effective-status",
        "overall-status",
        "extra-result-field",
        "extra-engine-field",
        "extra-file",
    ],
)
def test_complete_adapter_verifier_rejects_mutations(tmp_path: Path, mutation: str) -> None:
    prepared, output, _ = _genuine_tree(
        tmp_path, statuses={"z3": "UNKNOWN", "cvc5": "UNKNOWN"}
    )
    result_path = output / "result.json"
    result = json.loads(result_path.read_bytes())
    if mutation == "descriptor-bytes":
        _replace_bytes(output / result["custody"]["descriptor"]["path"], b"{}\n")
    elif mutation == "original-bytes":
        _replace_bytes(
            output / result["custody"]["original_smt2"]["path"],
            b"(set-logic QF_NRA)\n",
        )
    elif mutation == "source-bytes":
        _replace_bytes(output / result["custody"]["sources"][0]["path"], b"changed")
    elif mutation == "session-bytes":
        record = result["engines"][0]["artifacts"]["session"]
        _replace_bytes(output / record["path"], b"{}\n")
    elif mutation == "receipt-bytes":
        record = result["engines"][0]["artifacts"]["receipts"]
        _replace_bytes(output / record["path"], b"{}\n")
    elif mutation == "artifact-label":
        result["engines"][0]["artifacts"].pop("session")
        _replace_bytes(result_path, lane._json(result))
    elif mutation == "solver-signature":
        result["engines"][0]["solver_signature"] += "-changed"
        _replace_bytes(result_path, lane._json(result))
    elif mutation == "piqd-digest":
        result["engines"][0]["result_digest_advisory"]["locally_recomputed"] = "0" * 64
        _replace_bytes(result_path, lane._json(result))
    elif mutation == "effective-status":
        result["engines"][0]["effective_status"] = "UNSAT_DISCOVERY_ONLY"
        _replace_bytes(result_path, lane._json(result))
    elif mutation == "overall-status":
        result["overall_status"] = "FINITE_DIAGNOSTIC_COMPLETE"
        _replace_bytes(result_path, lane._json(result))
    elif mutation == "extra-result-field":
        result["future_adapter_field"] = False
        _replace_bytes(result_path, lane._json(result))
    elif mutation == "extra-engine-field":
        result["engines"][0]["future_engine_field"] = False
        _replace_bytes(result_path, lane._json(result))
    elif mutation == "extra-file":
        (output / "unbound.bin").write_bytes(b"extra")
    else:  # pragma: no cover - the parametrization is an exact mutation inventory
        raise AssertionError(f"undeclared mutation: {mutation}")
    with pytest.raises(lane.ResidualQfnraError):
        lane.verify_adapter_tree(prepared, output)


def test_sat_adapter_verifier_reruns_exact_semantic_check(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    monkeypatch.setattr(lane, "verify_sat_model", adapter_test._accepting_verifier)
    prepared, output, _ = _genuine_tree(tmp_path)
    lane.verify_adapter_tree(prepared, output)

    def reject(*_args: object) -> adapter.SemanticVerification:
        return adapter.SemanticVerification(False, {"reason": "changed verifier"})

    monkeypatch.setattr(lane, "verify_sat_model", reject)
    with pytest.raises(lane.ResidualQfnraError, match="semantic replay drifted"):
        lane.verify_adapter_tree(prepared, output)


def test_reconciled_solve_tree_is_verified_and_mutation_is_rejected(tmp_path: Path) -> None:
    prepared = _fixture_prepared(tmp_path / "packet")
    output = tmp_path / "result"
    transport = adapter_test.FakeCurrentPiqd(
        {"z3": "UNKNOWN", "cvc5": "UNKNOWN"},
        solve_transport_loss={"z3"},
    )
    adapter.run_source_semantic_query(
        prepared.query,
        output,
        transport,
        adapter_test._accepting_verifier,
    )
    result = lane.verify_adapter_tree(prepared, output)
    z3 = result["engines"][0]
    assert z3["response_lost"] is True
    record = z3["artifacts"]["reconciled_solve"]
    _replace_bytes(output / record["path"], b"{}\n")
    with pytest.raises(lane.ResidualQfnraError):
        lane.verify_adapter_tree(prepared, output)


def test_exact_phase_inventory_uses_argument_and_rejects_nested_entries(tmp_path: Path) -> None:
    root = _runtime_root(tmp_path / "first")
    other = _runtime_root(tmp_path / "second")
    assert lane._inventory(root) == "INITIALIZED"
    (other / "tmp" / "foreign.bin").write_bytes(b"x")
    with pytest.raises(lane.ResidualQfnraError, match="tmp"):
        lane._inventory(other)
    assert lane._inventory(root) == "INITIALIZED"
    query = root / "artifacts" / "profile-0360"
    query.mkdir()
    (query / "nested").mkdir()
    with pytest.raises(lane.ResidualQfnraError, match="nested"):
        lane._inventory(root)


def test_inventory_rejects_symlink(tmp_path: Path) -> None:
    root = _runtime_root(tmp_path)
    (root / "events" / "bad").symlink_to(root / "artifacts", target_is_directory=True)
    with pytest.raises(lane.ResidualQfnraError):
        lane._inventory(root)


def test_publish_handles_partial_writes_and_fsyncs_parent(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    original_write = lane.os.write
    original_fsync = lane.os.fsync
    fsync_calls: list[int] = []

    def short_write(fd: int, payload: object) -> int:
        return original_write(fd, memoryview(payload)[:3])

    def recording_fsync(fd: int) -> None:
        fsync_calls.append(fd)
        original_fsync(fd)

    monkeypatch.setattr(lane.os, "write", short_write)
    monkeypatch.setattr(lane.os, "fsync", recording_fsync)
    path = tmp_path / "record.json"
    lane._publish_once(path, b"{\"long\":true}\n")
    assert path.read_bytes() == b"{\"long\":true}\n"
    assert len(fsync_calls) == 2
    with pytest.raises(FileExistsError):
        lane._publish_once(path, b"changed\n")


def test_publish_removes_created_inode_after_raised_write(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    def raised_write(_fd: int, _payload: object) -> int:
        raise OSError("injected write failure")

    monkeypatch.setattr(lane.os, "write", raised_write)
    path = tmp_path / "record.json"
    with pytest.raises(OSError, match="injected write failure"):
        lane._publish_once(path, b"payload\n")
    assert not path.exists()
    assert tuple(tmp_path.iterdir()) == ()


def test_publish_cleanup_never_unlinks_substituted_path(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    path = tmp_path / "record.json"
    displaced = tmp_path / "displaced-created-inode"

    def substitute_then_raise(_fd: int, _payload: object) -> int:
        path.rename(displaced)
        path.write_bytes(b"foreign replacement\n")
        raise OSError("injected substitution failure")

    monkeypatch.setattr(lane.os, "write", substitute_then_raise)
    with pytest.raises(OSError, match="injected substitution failure"):
        lane._publish_once(path, b"owned payload\n")
    assert path.read_bytes() == b"foreign replacement\n"
    assert not displaced.exists()


def test_failure_record_binds_exact_retained_state(tmp_path: Path) -> None:
    root = _runtime_root(tmp_path)
    manifest = {"manifest_sha256": "a" * 64}
    failure = lane._write_failure(root, manifest, RuntimeError("boom"))
    assert failure == lane._read_failure(root, manifest)
    (root / "tmp" / "late.bin").write_bytes(b"mutation")
    with pytest.raises(lane.ResidualQfnraError):
        lane._read_failure(root, manifest)


def test_failure_never_coexists_with_terminal(tmp_path: Path) -> None:
    root = _runtime_root(tmp_path)
    (root / "events" / "terminal.json").write_text("{}\n")
    with pytest.raises(lane.ResidualQfnraError, match="cannot acquire"):
        lane._write_failure(root, {"manifest_sha256": "a" * 64}, "boom")
    assert not (root / "events" / "failure.json").exists()


def test_timeout_and_worker_bounds_are_enforced() -> None:
    for kwargs in (
        {"timeout_s": 3600.001},
        {"timeout_s": 0.0001},
        {"timeout_s": True},
        {"workers": 0},
        {"workers": 21},
        {"workers": True},
    ):
        with pytest.raises(lane.ResidualQfnraError):
            lane.run_campaign(init_only=True, **kwargs)
    with pytest.raises(lane.ResidualQfnraError):
        lane.prepare_query(360, 3_600_001)


def test_completed_terminal_replay_constructs_no_transport(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    root = _runtime_root(tmp_path)
    manifest = {"manifest_sha256": "b" * 64}
    prepared: dict[str, lane.PreparedQuery] = {}
    transport = adapter_test.FakeCurrentPiqd({"z3": "UNKNOWN", "cvc5": "UNKNOWN"})
    results: dict[str, dict[str, object]] = {}
    for key in lane.QUERY_KEYS:
        item = _fixture_prepared(tmp_path / f"packet-{key}", key)
        prepared[key] = item
        output = root / "artifacts" / key
        results[key] = adapter.run_source_semantic_query(
            item.query,
            output,
            transport,
            adapter_test._accepting_verifier,
        )
    launch = lane._launch_record(manifest, "http://127.0.0.1:7272", 60_000, 2)
    lane._publish_once(root / "events" / "launch.json", lane._json(launch))
    terminal = lane._terminal_record(root, launch, results)
    lane._publish_once(root / "events" / "terminal.json", lane._json(terminal))

    monkeypatch.setattr(lane, "RUN_ROOT", root)
    monkeypatch.setattr(lane, "ensure_run_root", lambda: (root, manifest))
    monkeypatch.setattr(lane, "authenticate_inputs", dict)
    monkeypatch.setattr(
        lane,
        "prepare_control_query",
        lambda control, _timeout: prepared[f"control-{control}"],
    )
    monkeypatch.setattr(
        lane,
        "prepare_query",
        lambda index, _timeout: prepared[f"profile-{index:04d}"],
    )
    monkeypatch.setattr(lane, "_require_control", lambda *_args: None)

    class ForbiddenTransport:
        def __init__(self, *_args: object, **_kwargs: object) -> None:
            raise AssertionError("terminal replay constructed a transport")

    monkeypatch.setattr(adapter, "UrllibPiqdTransport", ForbiddenTransport)
    assert lane.run_campaign() == terminal
    assert not (root / "events" / "failure.json").exists()
    corrupted = dict(terminal)
    corrupted["status"] = "TARGETS_UNSAT_DISCOVERY_ONLY"
    _replace_bytes(root / "events" / "terminal.json", lane._json(corrupted))
    with pytest.raises(lane.ResidualQfnraError, match="terminal"):
        lane.run_campaign()
    assert not (root / "events" / "failure.json").exists()


def test_quarantine_receipts_and_run_rotation_are_self_hashed() -> None:
    assert lane.RUN_ID == "run-0005"
    for path in lane.QUARANTINE_RECEIPT_PATHS:
        receipt = json.loads(path.read_bytes())
        assert receipt["receipt_sha256"] == lane._self_hash(receipt, "receipt_sha256")
    run1 = json.loads(lane.QUARANTINE_RECEIPT_PATHS[0].read_bytes())
    assert run1["historical_evidence"]["original_manifest_bytes_retained"] is False
    run2 = json.loads(lane.QUARANTINE_RECEIPT_PATHS[1].read_bytes())
    assert run2["historical_evidence"]["original_reference_scan_record"]["status"] == (
        "internally_inconsistent_unrecoverable"
    )

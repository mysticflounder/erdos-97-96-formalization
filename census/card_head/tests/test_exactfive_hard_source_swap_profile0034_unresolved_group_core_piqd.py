from __future__ import annotations

import json
import subprocess
import sys
import threading
from pathlib import Path
from typing import Any

import pytest

from census.card_head import (
    exactfive_hard_source_swap_profile0034_unresolved_group_core_piqd as lane,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter
from census.p97_search.tests import test_phase3_piqd_smt_source_adapter as adapter_test


@pytest.fixture(scope="module")
def custody() -> dict[str, Any]:
    return lane.authenticate_parent_run()


class GenericNamedPiqd(adapter_test.FakeCurrentPiqd):
    def request_json(
        self, method: str, path: str, body: dict[str, object] | None = None
    ) -> adapter.JsonResponse:
        if method == "POST" and path.endswith("/solve") and body is not None:
            original = json.loads(lane._canonical(body))
            adapted = dict(body)
            adapted["get_values"] = ["x"]
            response = super().request_json(method, path, adapted)
            data = self.sessions[path.split("/")[2]]
            data["solve_request"] = original
            receipt = data["receipt"]
            if receipt is not None:
                receipt["get_values"] = list(original["get_values"])
                receipt["request_sha256"] = adapter_test._solve_request_sha(
                    data["journal"], original
                )
            return response
        return super().request_json(method, path, body)


def test_runner_imports_from_an_external_directory(tmp_path: Path) -> None:
    completed = subprocess.run(
        [sys.executable, str(lane.RUNNER_PATH), "--help"],
        cwd=tmp_path,
        check=False,
        capture_output=True,
        text=True,
    )
    assert completed.returncode == 0
    assert "--init-only" in completed.stdout
    assert completed.stderr == ""


def test_parent_authenticates_exact_unknown_inventory(custody: dict[str, Any]) -> None:
    assert custody["producer_sha256"] == lane.PARENT_PRODUCER_SHA256
    assert custody["adapter_sha256"] == lane.ADAPTER_SHA256
    assert custody["terminal_sha256"] == lane.PARENT_TERMINAL_SHA256
    assert custody["execution_commit"] == lane.PARENT_EXECUTION_COMMIT
    assert custody["unknown_result_sha256"] == lane.EXPECTED_UNKNOWN_RESULTS
    assert custody["unknown_result_file_sha256"] == lane.EXPECTED_UNKNOWN_RESULT_FILES
    assert custody["parent_custody_sha256"] == lane._self_hash(
        custody, "parent_custody_sha256"
    )


def test_plan_timeout_workers_and_request_ids() -> None:
    assert lane.TIMEOUT_MS == 60_000
    assert lane.DEFAULT_TIMEOUT_S == 60.0
    assert lane.DEFAULT_WORKERS == lane.MAX_WORKERS == 4
    assert len(lane.QUERY_KEYS) == 4
    ids = [lane._query_request_id(key) for key in lane.QUERY_KEYS]
    assert len(set(ids)) == 4


@pytest.mark.parametrize(("branch", "count"), [("lt", 5), ("gt", 6)])
def test_targets_guard_only_authenticated_unknown_groups(
    branch: str, count: int, custody: dict[str, Any]
) -> None:
    source_id = f"parent-z3-mirror-radius-{branch}"
    system = lane.build_group_system(source_id, custody)
    assert system["assumption_group_ids"] == list(lane.UNRESOLVED_GROUPS[branch])
    assert len(system["group_bindings"]) == count
    assert set(system["hard_group_ids"]).isdisjoint(system["assumption_group_ids"])
    assert set(system["hard_group_ids"]) | set(system["assumption_group_ids"]) == {
        row["group_id"] for row in system["source_groups"]
    }


@pytest.mark.parametrize("branch", ["lt", "gt"])
def test_edge_partition_and_row_singletons_survive_grouping(
    branch: str, custody: dict[str, Any]
) -> None:
    system = lane.build_group_system(f"parent-z3-mirror-radius-{branch}", custody)
    groups = system["source_groups"]
    assert len(groups) == 26
    assert [len(row["source_commands"]) for row in groups[:13]] == [11] * 13
    assert [len(row["source_commands"]) for row in groups[13:24]] == [1] * 11
    assert sum(len(row["source_commands"]) for row in groups) == 156


@pytest.mark.parametrize("branch", ["lt", "gt"])
def test_one_bool_gates_every_assertion_in_each_unresolved_group(
    branch: str, custody: dict[str, Any]
) -> None:
    system = lane.build_group_system(f"parent-z3-mirror-radius-{branch}", custody)
    commands = lane.build_smt_commands(system)
    for binding in system["group_bindings"]:
        term = binding["assumption_term"]
        guarded = [command for command in commands if command.startswith(f"(assert (=> {term} ")]
        assert len(guarded) == len(binding["source_commands"])
        assert binding["source_commands_sha256"] == lane._sha(
            lane._canonical(binding["source_commands"])
        )
        assert binding["source_entries_sha256"] == lane._sha(
            lane._canonical(binding["source_entries"])
        )
        assert binding["label_sha256"] == lane._self_hash(binding, "label_sha256")


@pytest.mark.parametrize("branch", ["lt", "gt"])
def test_hard_and_guarded_command_inventory_is_exact(
    branch: str, custody: dict[str, Any]
) -> None:
    system = lane.build_group_system(f"parent-z3-mirror-radius-{branch}", custody)
    commands = lane.build_smt_commands(system)
    bindings = {row["group_id"]: row for row in system["group_bindings"]}
    expected_tail: list[str] = []
    hard_commands: list[str] = []
    for group in system["source_groups"]:
        binding = bindings.get(group["group_id"])
        if binding is None:
            expected_tail.extend(group["source_commands"])
            hard_commands.extend(group["source_commands"])
        else:
            expected_tail.extend(
                f"(assert (=> {binding['assumption_term']} {command[len('(assert '):-1]}))"
                for command in group["source_commands"]
            )
    tail_offset = system["assertion_offset"] + len(bindings)
    assert list(commands[tail_offset:]) == expected_tail
    assert [
        command for command in commands[tail_offset:] if not command.startswith("(assert (=> ")
    ] == hard_commands
    assert len(expected_tail) == 156
    assert len(hard_commands) == {"lt": 121, "gt": 130}[branch]


@pytest.mark.parametrize("source_id", [row[1] for row in lane.QUERY_PLAN])
def test_enabling_all_groups_reconstructs_full_original_source(
    source_id: str, custody: dict[str, Any]
) -> None:
    system = lane.build_group_system(source_id, custody)
    reconstructed = lane.reconstruct_unguarded_commands(system)
    assert reconstructed == tuple(system["source_unguarded_commands"])
    assert lane._sha(lane.parent._journal(reconstructed)) == system[
        "source_unguarded_journal_sha256"
    ]


def test_descriptor_maps_named_atoms_groups_and_labels(custody: dict[str, Any]) -> None:
    prepared = lane.prepare_query("z3-target-mirror-radius-lt", custody=custody)
    descriptor = prepared.query.descriptor
    bindings = prepared.system["group_bindings"]
    assert descriptor["named_atoms"] == [
        {"id": row["group_id"], "assumption_term": row["assumption_term"]}
        for row in bindings
    ]
    assert descriptor["semantic_input"]["system"]["group_bindings"] == bindings
    assert descriptor["solve"]["assumption_ids"] == list(lane.UNRESOLVED_GROUPS["lt"])
    assert prepared.assumption_labels == tuple(row["label_sha256"] for row in bindings)


def test_source_snapshots_and_manifest_bind_transitive_parent(
    custody: dict[str, Any]
) -> None:
    prepared = lane.prepare_query("z3-target-mirror-radius-lt", custody=custody)
    snapshots = {row.path: row for row in prepared.query.source_files}
    stable_name = "implementation-supporting-edge-qfnra-parent.py"
    assert snapshots[stable_name].payload == lane._read(Path(lane.parent.source.__file__))
    assert prepared.query.descriptor["sources"] == [
        {"path": row.path, "bytes": len(row.payload), "sha256": lane._sha(row.payload)}
        for row in prepared.query.source_files
    ]
    assert set(lane._manifest_sources()) == {
        Path(lane.__file__),
        Path(lane.parent.__file__),
        Path(lane.parent.source.__file__),
        Path(lane.adapter.__file__),
        lane.TEST_PATH,
        lane.RUNNER_PATH,
        lane.SPEC_PATH,
        lane.CHECKPOINT_PATH,
    }
    expected_static = {
        "0000-parent-custody.json",
        "0001-group-system.json",
        "parent-run-manifest.json",
        "parent-launch.json",
        "parent-terminal.json",
        "prelaunch-obsolete-run-manifest.json",
        "prelaunch-manifest-quarantine-receipt.json",
        "prelaunch-second-obsolete-run-manifest.json",
        "prelaunch-second-manifest-quarantine-receipt.json",
        "prelaunch-third-obsolete-run-manifest.json",
        "prelaunch-third-manifest-quarantine-receipt.json",
        "implementation-group-core.py",
        "implementation-parent.py",
        stable_name,
        "implementation-adapter.py",
        "tests.py",
        "runner.py",
        "checkpoint.json",
        "specification.md",
    }
    expected_results = {
        f"parent-unknown-result-{key}.json" for key in lane.EXPECTED_UNKNOWN_RESULTS
    } | {
        f"parent-control-result-{key}.json" for key in lane.EXPECTED_CONTROL_RESULTS
    }
    expected_systems = {
        f"parent-system-{key}.json"
        for key in set(lane.EXPECTED_UNKNOWN_RESULTS) | set(lane.EXPECTED_CONTROL_RESULTS)
    }
    assert set(snapshots) == expected_static | expected_results | expected_systems
    parent_keys = set(lane.EXPECTED_UNKNOWN_RESULTS) | set(lane.EXPECTED_CONTROL_RESULTS)
    assert set(lane._manifest_inputs()) == {
        lane.PARENT_MANIFEST_PATH,
        lane.PARENT_LAUNCH_PATH,
        lane.PARENT_TERMINAL_PATH,
        lane.PREVIOUS_MANIFEST_PATH,
        lane.PRELAUNCH_QUARANTINE_RECEIPT_PATH,
        lane.SECOND_PREVIOUS_MANIFEST_PATH,
        lane.SECOND_PRELAUNCH_QUARANTINE_RECEIPT_PATH,
        lane.THIRD_PREVIOUS_MANIFEST_PATH,
        lane.THIRD_PRELAUNCH_QUARANTINE_RECEIPT_PATH,
        *{
            lane.PARENT_ROOT / "artifacts" / key / name
            for key in parent_keys
            for name in ("result.json", "system.json")
        },
    }


def test_sat_replay_uses_complete_original_source(
    monkeypatch: pytest.MonkeyPatch, custody: dict[str, Any]
) -> None:
    prepared = lane.prepare_query("z3-target-mirror-radius-gt", custody=custody)
    observed: dict[str, Any] = {}

    def exact(
        query: adapter.SourceSemanticQuery, solver: str, model: str, values: str
    ) -> adapter.SemanticVerification:
        observed.update(query=query, solver=solver, model=model, values=values)
        return adapter.SemanticVerification(True, {"exact": True})

    monkeypatch.setattr(lane.parent.source, "verify_sat_model", exact)
    result = lane.verify_sat_model(prepared.query, "z3", "(model)", "((x 1))")
    assert result.accepted is True
    assert observed["query"].journal_commands == tuple(
        prepared.system["source_unguarded_commands"]
    )


def test_unsat_tree_has_nonempty_group_core_and_offline_replay(
    tmp_path: Path, custody: dict[str, Any]
) -> None:
    prepared = lane.prepare_query("z3-target-mirror-radius-lt", custody=custody)
    bindings = prepared.system["group_bindings"]
    transport = GenericNamedPiqd(
        {"z3": "UNSAT"},
        unsat_core=[bindings[0]["assumption_term"], bindings[-1]["assumption_term"]],
    )
    output = tmp_path / "tree"
    first = lane.run_query(prepared, output, transport, set())
    core = first["engine"]["unsat_assumptions"]
    assert core["source_atom_ids"] == [bindings[0]["group_id"], bindings[-1]["group_id"]]
    assert core["core_labels"] == [bindings[0]["label_sha256"], bindings[-1]["label_sha256"]]
    assert core["terminal_unsat"] is False
    assert first["engine"]["session_lifecycle"]["close_observed_state"] == "closed"

    class NoTransport:
        def __getattr__(self, name: str) -> object:
            raise AssertionError(name)

    assert lane.run_query(prepared, output, NoTransport()) == first


def test_unknown_target_is_accepted_and_identity_or_artifact_swaps_fail(
    tmp_path: Path, custody: dict[str, Any]
) -> None:
    prepared = lane.prepare_query("z3-target-mirror-radius-gt", custody=custody)
    result = lane.run_query(
        prepared, tmp_path / "unknown", GenericNamedPiqd({"z3": "UNKNOWN"}), set()
    )
    assert result["engine"]["raw_status"] == "UNKNOWN"
    assert result["engine"]["effective_status"] == "INCONCLUSIVE_UNKNOWN"
    output = tmp_path / "unknown"
    result_path = output / "result.json"
    original = result_path.read_bytes()
    output.chmod(0o700)
    result_path.chmod(0o600)
    for field, value in (("solver", "cvc5"), ("session_id", "crossed-session")):
        mutated = json.loads(original)
        mutated["engine"][field] = value
        mutated["result_sha256"] = lane._self_hash(mutated, "result_sha256")
        result_path.write_bytes(lane._json(mutated))
        with pytest.raises(lane.Profile0034UnresolvedGroupCoreError):
            lane.verify_query_tree(prepared, output)
        result_path.write_bytes(original)
    nested = output / "malicious"
    nested.mkdir()
    (nested / "payload").write_bytes(b"nested")
    with pytest.raises(lane.Profile0034UnresolvedGroupCoreError):
        lane.verify_query_tree(prepared, output)
    (nested / "payload").unlink()
    nested.rmdir()
    unexpected = output / "unexpected.bin"
    unexpected.write_bytes(b"unexpected")
    with pytest.raises(lane.Profile0034UnresolvedGroupCoreError):
        lane.verify_query_tree(prepared, output)
    unexpected.unlink()
    session_record = result["engine"]["artifacts"]["session"]
    session_path = output / session_record["path"]
    session_original = session_path.read_bytes()
    session_path.chmod(0o600)
    crossed_session = json.loads(session_original)
    crossed_session["id"] = "crossed-session"
    crossed_payload = lane._json(crossed_session)
    session_path.write_bytes(crossed_payload)
    crossed_result = json.loads(original)
    crossed_result["engine"]["artifacts"]["session"] = lane._artifact_record(
        session_record["path"], crossed_payload
    )
    crossed_result["result_sha256"] = lane._self_hash(
        crossed_result, "result_sha256"
    )
    result_path.write_bytes(lane._json(crossed_result))
    with pytest.raises(lane.Profile0034UnresolvedGroupCoreError):
        lane.verify_query_tree(prepared, output)
    session_path.write_bytes(session_original)
    result_path.write_bytes(original)
    reconciliation_name = "malicious-reconciliation.json"
    reconciliation_path = output / reconciliation_name
    reconciliation_path.write_bytes(session_original)
    reconciliation_result = json.loads(original)
    reconciliation_result["engine"]["artifacts"]["reconciliation_session"] = (
        lane._artifact_record(reconciliation_name, session_original)
    )
    reconciliation_result["result_sha256"] = lane._self_hash(
        reconciliation_result, "result_sha256"
    )
    result_path.write_bytes(lane._json(reconciliation_result))
    with pytest.raises(lane.Profile0034UnresolvedGroupCoreError):
        lane.verify_query_tree(prepared, output)
    reconciliation_path.unlink()
    result_path.write_bytes(original)


def test_empty_unsat_core_fails_closed(tmp_path: Path, custody: dict[str, Any]) -> None:
    prepared = lane.prepare_query("z3-target-mirror-radius-gt", custody=custody)
    with pytest.raises(lane.Profile0034UnresolvedGroupCoreError):
        lane.run_query(
            prepared, tmp_path / "empty", GenericNamedPiqd({"z3": "UNSAT"}, unsat_core=[]), set()
        )


@pytest.mark.parametrize(("workers", "ok"), [(1, False), (2, True), (4, True), (5, False)])
def test_worker_limits(monkeypatch: pytest.MonkeyPatch, workers: int, ok: bool) -> None:
    monkeypatch.setattr(lane, "ensure_run_root", lambda: (_ for _ in ()).throw(StopIteration))
    if ok:
        with pytest.raises(StopIteration):
            lane.run_campaign(workers=workers, init_only=True)
    else:
        with pytest.raises(lane.Profile0034UnresolvedGroupCoreError):
            lane.run_campaign(workers=workers, init_only=True)


def test_source_commit_replay_uses_recorded_commit(monkeypatch: pytest.MonkeyPatch) -> None:
    observed: list[object] = []
    monkeypatch.setattr(
        lane, "_authenticate_source_commit", lambda manifest, commit: observed.append(commit) or str(commit)
    )
    assert lane.authenticate_recorded_execution_commit({}, {"execution_commit": "a" * 40}) == "a" * 40
    assert observed == ["a" * 40]


def test_source_commit_rejects_committed_byte_swap(monkeypatch: pytest.MonkeyPatch) -> None:
    manifest = {"source_digests": lane._source_map(lane._manifest_sources())}
    monkeypatch.setattr(lane, "_git_read", lambda _arguments, _where: b"crossed\n")
    with pytest.raises(lane.Profile0034UnresolvedGroupCoreError):
        lane._authenticate_source_commit(manifest, "a" * 40)


def test_source_commit_rejects_manifest_digest_swap(monkeypatch: pytest.MonkeyPatch) -> None:
    manifest = {"source_digests": lane._source_map(lane._manifest_sources())}
    first = min(manifest["source_digests"])
    manifest["source_digests"][first] = "0" * 64
    monkeypatch.setattr(
        lane,
        "_git_read",
        lambda _arguments, _where: (_ for _ in ()).throw(AssertionError("Git read")),
    )
    with pytest.raises(lane.Profile0034UnresolvedGroupCoreError):
        lane._authenticate_source_commit(manifest, "a" * 40)


def test_controls_finish_before_concurrent_targets(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    events: list[str] = []
    lock = threading.Lock()
    target_barrier = threading.Barrier(2)

    def fake_run(
        _prepared: object, output: Path, _transport: object
    ) -> dict[str, Any]:
        key = output.name
        with lock:
            events.append(f"start:{key}")
        if key in lane.TARGET_KEYS:
            target_barrier.wait(timeout=5)
        with lock:
            events.append(f"end:{key}")
        return {"engine": {"session_id": f"session-{key}"}}

    monkeypatch.setattr(lane, "run_query", fake_run)
    prepared = {key: object() for key in lane.QUERY_KEYS}
    results = lane._execute_queries(prepared, tmp_path, object(), lane.MAX_WORKERS)
    assert list(results) == list(lane.QUERY_KEYS)
    assert events[:4] == [
        "start:z3-control-positive",
        "end:z3-control-positive",
        "start:z3-control-negative",
        "end:z3-control-negative",
    ]
    assert set(events[4:6]) == {f"start:{key}" for key in lane.TARGET_KEYS}
    assert set(events[6:]) == {f"end:{key}" for key in lane.TARGET_KEYS}


def test_all_claims_are_false() -> None:
    assert lane.FALSE_CLAIMS
    assert set(lane.FALSE_CLAIMS.values()) == {False}

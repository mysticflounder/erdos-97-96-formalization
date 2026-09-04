from __future__ import annotations

import json
import subprocess
import sys
from fractions import Fraction
from pathlib import Path
from typing import Any

import pytest

from census.card_head import (
    exactfive_hard_source_swap_profile0034_supporting_edge_unguarded_deletion_piqd as lane,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter
from census.p97_search.tests import (
    test_phase3_piqd_smt_source_adapter as adapter_test,
)


@pytest.fixture(scope="module")
def parent() -> dict[str, Any]:
    return lane.authenticate_parent_run()


class GenericNamedPiqd(adapter_test.FakeCurrentPiqd):
    """Adapt the maintained fake to arbitrary exact-readback variables."""

    def request_json(
        self,
        method: str,
        path: str,
        body: dict[str, object] | None = None,
    ) -> adapter.JsonResponse:
        if method == "POST" and path.endswith("/solve") and body is not None:
            original = json.loads(lane._canonical(body))
            adapted = dict(body)
            adapted["get_values"] = ["x"]
            response = super().request_json(method, path, adapted)
            session_id = path.split("/")[2]
            data = self.sessions[session_id]
            data["solve_request"] = original
            receipt = data["receipt"]
            if receipt is not None:
                receipt["get_values"] = list(original["get_values"])
                receipt["request_sha256"] = adapter_test._solve_request_sha(
                    data["journal"], original
                )
            return response
        return super().request_json(method, path, body)


def _result(
    raw: str | None,
    effective: str,
    *,
    accepted: bool | None = None,
) -> dict[str, Any]:
    provenance = None
    semantic = None
    if raw == "UNSAT":
        provenance = {
            "basis": "get-unsat-assumptions",
            "named_core_support": False,
            "daemon_field": "core",
            "assumption_terms": [],
            "source_atom_ids": [],
            "terminal_unsat": True,
        }
    if raw == "SAT":
        semantic = {"accepted": accepted}
    value = {
        "engine": {
            "raw_status": raw,
            "effective_status": effective,
            "unsat_assumptions": provenance,
            "semantic_replay": semantic,
        },
        "result_sha256": lane._sha(f"{raw}:{effective}:{accepted}".encode()),
    }
    return value


def _probe_results(default: dict[str, Any] | None = None) -> dict[str, dict[str, Any]]:
    baseline = default or _result("SAT", "SAT_SEMANTICALLY_REPLAYED", accepted=True)
    return {key: json.loads(json.dumps(baseline)) for key in lane.PROBE_KEYS}


def test_runner_bootstraps_repository_import_from_external_cwd(tmp_path: Path) -> None:
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


def test_parent_run_is_fully_authenticated(parent: dict[str, Any]) -> None:
    assert parent["producer_sha256"] == lane.PARENT_PRODUCER_SHA256
    assert parent["run_manifest_file_sha256"] == lane.PARENT_MANIFEST_FILE_SHA256
    assert parent["run_manifest_sha256"] == lane.PARENT_MANIFEST_SHA256
    assert parent["launch_file_sha256"] == lane.PARENT_LAUNCH_FILE_SHA256
    assert parent["launch_sha256"] == lane.PARENT_LAUNCH_SHA256
    assert parent["terminal_file_sha256"] == lane.PARENT_TERMINAL_FILE_SHA256
    assert parent["terminal_sha256"] == lane.PARENT_TERMINAL_SHA256
    assert parent["terminal_status"] == "TARGET_INCONCLUSIVE"
    assert parent["result_file_sha256"] == lane.EXPECTED_PARENT_RESULTS
    assert parent["mirror_engine_statuses"] == {
        "parent-z3-mirror-radius-lt": [["z3", "UNSAT"], ["cvc5", "UNKNOWN"]],
        "parent-z3-mirror-radius-gt": [["z3", "UNSAT"], ["cvc5", "UNKNOWN"]],
    }
    assert parent["parent_custody_sha256"] == lane._self_hash(
        parent, "parent_custody_sha256"
    )


@pytest.mark.parametrize(
    "target",
    [lane.PARENT_MANIFEST_PATH, lane.PARENT_LAUNCH_PATH, lane.PARENT_TERMINAL_PATH],
)
def test_parent_record_tamper_fails_closed(
    monkeypatch: pytest.MonkeyPatch, target: Path
) -> None:
    original = lane._read

    def tampered(path: Path, limit: int = 96 * 1024 * 1024) -> bytes:
        payload = original(path, limit)
        return payload + b" " if path == target else payload

    monkeypatch.setattr(lane, "_read", tampered)
    with pytest.raises(lane.Profile0034SupportingEdgeUnguardedDeletionError):
        lane.authenticate_parent_run()


def test_fixed_query_plan_and_unique_request_ids() -> None:
    assert lane.SOLVER == "z3"
    assert lane.TIMEOUT_MS == 60_000
    assert lane.DEFAULT_TIMEOUT_S == 60.0
    assert lane.DEFAULT_WORKERS == lane.MAX_WORKERS == 20
    assert len(lane.CONTROL_KEYS) == 2
    assert len(lane.BRANCH_PROBE_KEYS) == 50
    assert len(lane.PROBE_KEYS) == 51
    assert len(lane.CANDIDATE_KEYS) == 2
    assert len(lane.QUERY_KEYS) == 55
    assert len(set(lane.QUERY_KEYS)) == 55
    request_ids = [lane._query_request_id(key) for key in lane.QUERY_KEYS]
    assert len(set(request_ids)) == 55
    assert request_ids == [lane._query_request_id(key) for key in lane.QUERY_KEYS]


@pytest.mark.parametrize("branch_id", lane.BRANCH_IDS)
def test_edge_and_row_partition_is_exact(
    branch_id: str, parent: dict[str, Any]
) -> None:
    system = lane._target_source(parent, branch_id)
    groups = lane.assertion_group_ledger(system)
    assert [group["group_id"] for group in groups] == list(lane.TARGET_GROUP_IDS)
    assert len(groups) == 26
    edge_groups = groups[:13]
    row_groups = groups[13:24]
    assert [len(group["source_entries"]) for group in edge_groups] == [11] * 13
    assert [len(group["source_commands"]) for group in edge_groups] == [11] * 13
    assert {
        entry["edge_index"]
        for group in edge_groups
        for entry in group["source_entries"]
    } == set(range(13))
    assert len(
        {
            (entry["edge_index"], entry["vertex"])
            for group in edge_groups
            for entry in group["source_entries"]
        }
    ) == 143
    assert [len(group["source_commands"]) for group in row_groups] == [1] * 11
    assert len({group["source_entries"][0]["row_id"] for group in row_groups}) >= 1
    expanded = [command for group in groups for command in group["source_commands"]]
    original = [
        command
        for command in lane.source._build_smt_commands_current(system)
        if command.startswith("(assert ")
    ]
    assert expanded == original


def test_all_deletion_journals_physically_omit_one_group(
    parent: dict[str, Any]
) -> None:
    for key in lane.PROBE_KEYS:
        system = lane.build_system(key, parent)
        commands = lane.build_smt_commands(system)
        journal = lane._journal(commands)
        assert len(system["omitted_group_ids"]) == 1
        omitted = system["omitted_group_ids"][0]
        group_map = {
            group["group_id"]: group
            for group in lane.assertion_group_ledger(system["source_system"])
        }
        assert all(
            command.encode("ascii") + b"\n" not in journal
            for command in group_map[omitted]["source_commands"]
        )
        retained_commands = [
            command
            for group_id in system["retained_group_ids"]
            for command in group_map[group_id]["source_commands"]
        ]
        assert [command for command in commands if command.startswith("(assert ")] == retained_commands
        assert b" Bool)" not in journal
        assert b"(=>" not in journal
        assert b"assume_" not in journal


def test_shared_radius_free_journal_identity(parent: dict[str, Any]) -> None:
    shared = lane.build_system(lane.RADIUS_PROBE_KEY, parent)
    identity = shared["radius_free_journal_identity"]
    assert identity["byte_identical"] is True
    assert identity["lt_sha256"] == identity["gt_sha256"]
    retained = shared["retained_group_ids"]
    lt = lane._target_source(parent, "lt")
    gt = lane._target_source(parent, "gt")
    assert lane._journal(lane._commands_for_groups(lt, retained)) == lane._journal(
        lane._commands_for_groups(gt, retained)
    )
    assert lane.RADIUS_GROUP_ID not in retained


def test_descriptor_has_no_guards_or_assumptions(parent: dict[str, Any]) -> None:
    prepared = lane.prepare_query("probe-lt-edge-index-00", parent=parent)
    assert prepared.query.descriptor["named_atoms"] == []
    assert prepared.query.descriptor["solve"]["assumption_ids"] == []
    assert prepared.query.assumptions == ()
    assert prepared.assumption_labels == ()
    assert prepared.query.descriptor["solver_profile"] == {
        "schema": lane.SOLVER_PROFILE_SCHEMA,
        "solvers": ["z3"],
        "timeout_ms": 60_000,
    }
    with pytest.raises(lane.Profile0034SupportingEdgeUnguardedDeletionError):
        lane.prepare_query("probe-lt-edge-index-00", parent=parent, timeout_ms=59_999)


@pytest.mark.parametrize(
    ("result", "expected"),
    [
        (_result("UNSAT", "UNSAT_DISCOVERY_ONLY"), "UNSAT_CUSTODY_VALID"),
        (_result("SAT", "SAT_SEMANTICALLY_REPLAYED", accepted=True), "SAT_REPLAYED"),
        (
            _result(
                "SAT", "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED", accepted=False
            ),
            "SAT_REPLAY_UNRESOLVED",
        ),
        (_result("UNKNOWN", "INCONCLUSIVE_UNKNOWN"), "UNKNOWN"),
        (_result(None, "INCONCLUSIVE_TRANSPORT_LOSS"), "TRANSPORT_LOST"),
        ({"engine": {"raw_status": "UNSAT"}}, "MALFORMED"),
        (None, "MALFORMED"),
    ],
)
def test_result_status_handling(result: object, expected: str) -> None:
    assert lane.classify_result(result) == expected


def test_candidate_omits_only_custody_valid_unsat(
    parent: dict[str, Any]
) -> None:
    results = _probe_results()
    results["probe-lt-edge-index-00"] = _result("UNSAT", "UNSAT_DISCOVERY_ONLY")
    results["probe-lt-source-row-equality-00"] = _result(
        "UNKNOWN", "INCONCLUSIVE_UNKNOWN"
    )
    results[lane.RADIUS_PROBE_KEY] = _result("UNSAT", "UNSAT_DISCOVERY_ONLY")
    results["probe-lt-source-strict"] = {"engine": {"raw_status": "UNSAT"}}
    lt = lane.build_system("candidate-lt-reduced", parent, results)
    gt = lane.build_system("candidate-gt-reduced", parent, results)
    assert lt["omitted_group_ids"] == ["edge-index-00", lane.RADIUS_GROUP_ID]
    assert gt["omitted_group_ids"] == [lane.RADIUS_GROUP_ID]
    assert "source-row-equality-00" in lt["retained_group_ids"]
    assert lane.STRICT_GROUP_ID in lt["retained_group_ids"]
    assert all(
        record["omit"]
        is (record["disposition"] == "UNSAT_CUSTODY_VALID")
        for record in lt["decision_records"] + gt["decision_records"]
    )


def test_candidate_decision_sources_are_exact_and_ordered(
    parent: dict[str, Any]
) -> None:
    results = _probe_results(_result("UNKNOWN", "INCONCLUSIVE_UNKNOWN"))
    snapshots = tuple(
        adapter.SourceSnapshot(f"probe-result-{key}.json", lane._json(results[key]))
        for key in lane.PROBE_KEYS
    )
    prepared = lane.prepare_query(
        "candidate-lt-reduced",
        parent=parent,
        probe_results=results,
        decision_sources=snapshots,
    )
    assert prepared.system["omitted_group_ids"] == []
    assert prepared.system["retained_group_ids"] == list(lane.TARGET_GROUP_IDS)
    assert prepared.decision_sources == snapshots
    with pytest.raises(lane.Profile0034SupportingEdgeUnguardedDeletionError):
        lane.prepare_query(
            "candidate-lt-reduced",
            parent=parent,
            probe_results=results,
            decision_sources=tuple(reversed(snapshots)),
        )


def _frame_coords(system: dict[str, Any]) -> dict[str, tuple[Fraction, Fraction]]:
    coords = {
        class_id: (Fraction(0), Fraction(0)) for class_id in lane.source.CLASS_IDS
    }
    coords.update(lane.source.predecessor._frame_coordinates(system["order_id"]))
    return coords


def test_exact_replay_checks_only_retained_assertions(
    monkeypatch: pytest.MonkeyPatch, parent: dict[str, Any]
) -> None:
    system = lane.build_system("probe-lt-edge-index-00", parent)
    original = system["source_system"]
    coords = _frame_coords(original)
    omitted_entries = lane.assertion_group_ledger(original)[0]["source_entries"]
    omitted = {(tuple(entry["edge"]), entry["vertex"]) for entry in omitted_entries}
    role = original["role_class"]
    radius_left_family = {
        frozenset((role["c2"], role[item])) for item in ("O", "a", "u", "v")
    }
    radius_right_family = {
        frozenset((role["c2"], role[item])) for item in ("d", "e", "x", "y")
    }
    strict_left = frozenset((role["e"], role["d"]))
    strict_right = frozenset((role["e"], role["a"]))

    def area(
        _coords: object, left: str, right: str, vertex: str
    ) -> Fraction:
        return Fraction(-1) if ((left, right), vertex) in omitted else Fraction(1)

    def distance(_coords: object, left: str, right: str) -> Fraction:
        pair = frozenset((left, right))
        if pair in radius_left_family or pair == strict_left:
            return Fraction(0)
        if pair in radius_right_family or pair == strict_right:
            return Fraction(1)
        return Fraction(2)

    monkeypatch.setattr(lane.source, "_area_value", area)
    monkeypatch.setattr(lane.source, "_distance_value", distance)
    replay = lane._replay_target(system, coords)
    assert replay["accepted"] is True
    assert replay["supporting_edge_assertions"] == 132
    assert replay["row_equality_assertions"] == 11
    assert replay["radius_assertions"] == 1
    assert replay["source_strict_assertions"] == 1


def test_exact_replay_rejects_failed_retained_assertion(
    monkeypatch: pytest.MonkeyPatch, parent: dict[str, Any]
) -> None:
    system = lane.build_system("probe-lt-source-strict", parent)
    coords = _frame_coords(system["source_system"])
    monkeypatch.setattr(lane.source, "_area_value", lambda *_args: Fraction(-1))
    result = lane._replay_target(system, coords)
    assert result["accepted"] is False
    assert result["reason"] == "edge-index-00"


def test_worker_limits_and_deterministic_batches() -> None:
    batches = lane._probe_batches(20)
    assert [len(batch) for batch in batches] == [20, 20, 11]
    assert [key for batch in batches for key in batch] == list(lane.PROBE_KEYS)
    assert max(map(len, batches)) <= lane.MAX_WORKERS
    for invalid in (0, 21, True):
        with pytest.raises(lane.Profile0034SupportingEdgeUnguardedDeletionError):
            lane._probe_batches(invalid)


def test_genuine_assumption_free_unsat_tree_has_full_custody(
    tmp_path: Path, parent: dict[str, Any]
) -> None:
    prepared = lane.prepare_query("probe-lt-edge-index-00", parent=parent)
    transport = GenericNamedPiqd({"z3": "UNSAT"}, unsat_core=[])
    output = tmp_path / prepared.key
    result = lane.run_query(prepared, output, transport, set())
    assert result["disposition"] == "UNSAT_CUSTODY_VALID"
    assert result["engine"]["assumption_labels"] == []
    assert result["engine"]["unsat_assumptions"]["terminal_unsat"] is True
    assert result["engine"]["session_lifecycle"]["close_observed_state"] == "closed"
    assert result["result_sha256"] == lane._self_hash(result, "result_sha256")
    assert lane.verify_query_tree(prepared, output) == result
    assert transport.actual_solves == 1
    assert all(session["state"] == "closed" for session in transport.sessions.values())


def test_query_tree_tamper_fails_closed(
    tmp_path: Path, parent: dict[str, Any]
) -> None:
    prepared = lane.prepare_query("probe-gt-source-strict", parent=parent)
    output = tmp_path / prepared.key
    lane.run_query(
        prepared,
        output,
        GenericNamedPiqd({"z3": "UNKNOWN"}, unsat_core=[]),
        set(),
    )
    journal = output / "journal.smt2"
    journal.chmod(0o600)
    journal.write_bytes(journal.read_bytes() + b" ")
    with pytest.raises(lane.Profile0034SupportingEdgeUnguardedDeletionError):
        lane.verify_query_tree(prepared, output)


def test_manifest_binds_checkpoint_base_and_exact_digests() -> None:
    manifest = lane._strict(lane._read(lane.RUN_ROOT / "run_manifest.json"), "manifest")
    checkpoint = lane._load_checkpoint()
    assert manifest["schema"] == lane.RUN_MANIFEST_SCHEMA
    assert manifest["base_head"] == checkpoint["base_head"]
    assert manifest["base_head"] == "d07392f52c05c1d2d68abc37c058ffe296e751cd"
    assert manifest["source_digests"] == lane._source_map(lane._manifest_sources())
    parent = lane.authenticate_parent_run()
    assert manifest["input_digests"] == lane._source_map(lane._manifest_inputs(parent))
    assert manifest["manifest_sha256"] == lane._self_hash(
        manifest, "manifest_sha256"
    )


@pytest.mark.parametrize(
    ("field", "replacement"),
    (("owner", "attacker"), ("base_head", "0" * 40)),
)
def test_checkpoint_owner_and_base_are_pinned(
    monkeypatch: pytest.MonkeyPatch,
    field: str,
    replacement: str,
) -> None:
    checkpoint = lane._strict(lane._read(lane.CHECKPOINT_PATH), "checkpoint")
    checkpoint[field] = replacement
    checkpoint["manifest_sha256"] = lane._self_hash(
        checkpoint, "manifest_sha256"
    )
    payload = lane._json(checkpoint)
    original_read = lane._read

    def read(path: Path, limit: int = 96 * 1024 * 1024) -> bytes:
        if path == lane.CHECKPOINT_PATH:
            return payload
        return original_read(path, limit)

    monkeypatch.setattr(lane, "_read", read)
    with pytest.raises(
        lane.Profile0034SupportingEdgeUnguardedDeletionError,
        match="lane checkpoint drifted",
    ):
        lane._load_checkpoint()


def test_source_commit_binding_and_recorded_replay(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    manifest = lane._strict(lane._read(lane.RUN_ROOT / "run_manifest.json"), "manifest")
    commit = "1" * 40

    def git_read(arguments: tuple[str, ...], _where: str) -> bytes:
        if arguments[0] == "rev-parse":
            return f"{commit}\n".encode()
        assert arguments[0] == "show"
        relative = arguments[1].split(":", 1)[1]
        return lane._read(lane.REPOSITORY_ROOT / relative)

    monkeypatch.setattr(lane, "_git_read", git_read)
    assert lane.authenticate_execution_commit(manifest) == commit
    assert lane.authenticate_recorded_execution_commit(
        manifest, {"execution_commit": commit}
    ) == commit
    with pytest.raises(lane.Profile0034SupportingEdgeUnguardedDeletionError):
        lane.authenticate_recorded_execution_commit(
            manifest, {"execution_commit": "short"}
        )


def test_launch_and_terminal_keep_all_claims_false() -> None:
    manifest = lane._strict(lane._read(lane.RUN_ROOT / "run_manifest.json"), "manifest")
    launch = lane._launch_record(
        manifest, "1" * 40, "http://127.0.0.1:7272", lane.DEFAULT_WORKERS
    )
    assert launch["sessions"] == 55
    assert launch["solves_per_session"] == 1
    assert launch["claims"] == lane.FALSE_CLAIMS
    assert not any(launch["claims"].values())
    assert launch["launch_sha256"] == lane._self_hash(launch, "launch_sha256")


def test_init_only_never_constructs_transport(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    manifest = lane._strict(lane._read(lane.RUN_ROOT / "run_manifest.json"), "manifest")
    monkeypatch.setattr(lane, "ensure_run_root", lambda: (lane.RUN_ROOT, manifest))
    monkeypatch.setattr(lane, "authenticate_parent_run", lambda: {"parent": "bound"})
    monkeypatch.setattr(lane, "_inventory", lambda *_args: "INITIALIZED")

    class ForbiddenTransport:
        def __init__(self, *_args: object, **_kwargs: object) -> None:
            raise AssertionError("init-only constructed a transport")

    monkeypatch.setattr(lane.adapter, "UrllibPiqdTransport", ForbiddenTransport)
    result = lane.run_campaign(init_only=True)
    assert result["status"] == "INITIALIZED"
    assert result["queries"] == list(lane.QUERY_KEYS)

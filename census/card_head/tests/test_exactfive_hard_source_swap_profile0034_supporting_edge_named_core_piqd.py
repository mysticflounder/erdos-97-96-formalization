from __future__ import annotations

import json
import subprocess
import sys
import threading
from pathlib import Path
from types import SimpleNamespace
from typing import Any

import pytest

from census.card_head import (
    exactfive_hard_source_swap_profile0034_supporting_edge_named_core_piqd as lane,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter
from census.p97_search.tests import (
    test_phase3_piqd_smt_source_adapter as adapter_test,
)


@pytest.fixture(scope="module")
def parent() -> dict[str, Any]:
    return lane.authenticate_parent_run()


def _replace(path: Path, payload: bytes) -> None:
    path.chmod(0o600)
    path.write_bytes(payload)


def _rewrite_result(path: Path, result: dict[str, Any]) -> None:
    result["result_sha256"] = lane._self_hash(result, "result_sha256")
    _replace(path, lane._json(result))


class GenericNamedPiqd(adapter_test.FakeCurrentPiqd):
    """Use the genuine adapter fixture with arbitrary readback terms."""

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


def _genuine_tree(
    tmp_path: Path,
    prepared: lane.PreparedQuery,
    *,
    status: str = "UNSAT",
) -> tuple[Path, GenericNamedPiqd, dict[str, Any]]:
    bindings = prepared.system["assumption_bindings"]
    transport = GenericNamedPiqd(
        {prepared.solver: status},
        unsat_core=[
            bindings[0]["assumption_term"],
            bindings[-1]["assumption_term"],
        ],
    )
    output = tmp_path / prepared.key
    result = lane.run_query(prepared, output, transport, set())
    return output, transport, result


def _accepting_verifier(
    _query: adapter.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> adapter.SemanticVerification:
    assert solver == "z3"
    assert type(model) is str and type(values) is str
    return adapter.SemanticVerification(True, {"fixture_exact_replay": True})


def test_runner_bootstraps_repository_import_from_external_cwd(
    tmp_path: Path,
) -> None:
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


def test_parent_run_is_fully_reconstructed(parent: dict[str, Any]) -> None:
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
    with pytest.raises(lane.Profile0034SupportingEdgeNamedCoreError):
        lane.authenticate_parent_run()


def test_query_plan_is_four_fresh_z3_cells() -> None:
    assert lane.DEFAULT_TIMEOUT_S == 60.0
    assert lane.DEFAULT_WORKERS == lane.MAX_WORKERS == 4
    assert lane.QUERY_PLAN == (
        ("z3-control-positive", "z3", "control-positive"),
        ("z3-control-negative", "z3", "control-negative"),
        (
            "z3-target-mirror-radius-lt",
            "z3",
            "parent-z3-mirror-radius-lt",
        ),
        (
            "z3-target-mirror-radius-gt",
            "z3",
            "parent-z3-mirror-radius-gt",
        ),
    )
    request_ids = [lane._query_request_id(key) for key in lane.QUERY_KEYS]
    assert len(request_ids) == len(set(request_ids)) == 4


@pytest.mark.parametrize(
    "source_id",
    ["parent-z3-mirror-radius-lt", "parent-z3-mirror-radius-gt"],
)
def test_target_named_inventory_and_ordered_parent_reconstruction(
    source_id: str,
    parent: dict[str, Any],
) -> None:
    named = lane.build_named_system(source_id, "z3", parent)
    ledger = named["source_ledger"]
    assert len(ledger) == 156
    assert [entry["family"] for entry in ledger].count("supporting-edge") == 143
    assert [entry["family"] for entry in ledger].count("source-row-equality") == 11
    assert [entry["family"] for entry in ledger].count("radius-branch") == 1
    assert [entry["family"] for entry in ledger].count("source-strict") == 1
    expanded = [command for entry in ledger for command in entry["source_commands"]]
    assertions = [
        command
        for command in named["source_unguarded_commands"]
        if command.startswith("(assert ")
    ]
    assert expanded == assertions
    journal = b"".join(
        command.encode("ascii") + b"\n"
        for command in named["source_unguarded_commands"]
    )
    assert named["source_unguarded_journal_sha256"] == lane._sha(journal)


@pytest.mark.parametrize(
    ("source_id", "count"),
    [("control-positive", 1), ("control-negative", 2)],
)
def test_controls_are_named_and_source_complete(source_id: str, count: int) -> None:
    named = lane.build_named_system(source_id, "z3")
    assert len(named["assumption_bindings"]) == count
    assert [
        command
        for entry in named["source_ledger"]
        for command in entry["source_commands"]
    ] == [
        command
        for command in named["source_unguarded_commands"]
        if command.startswith("(assert ")
    ]


def test_labels_are_stable_self_hashes_with_exact_order(
    parent: dict[str, Any],
) -> None:
    named = lane.build_named_system("parent-z3-mirror-radius-lt", "z3", parent)
    bindings = named["assumption_bindings"]
    assert len({row["assumption_id"] for row in bindings}) == 156
    assert len({row["assumption_term"] for row in bindings}) == 156
    assert len({row["label_sha256"] for row in bindings}) == 156
    assert all(
        row["label_sha256"] == lane._self_hash(row, "label_sha256") for row in bindings
    )
    assert [row["assumption_id"] for row in bindings[:2]] == [
        "supporting-edge-000",
        "supporting-edge-001",
    ]
    assert bindings[-1]["assumption_id"] == "source-strict-000"


def test_prepare_query_binds_parent_results_and_assumption_order(
    parent: dict[str, Any],
) -> None:
    prepared = lane.prepare_query("z3-target-mirror-radius-lt", parent=parent)
    descriptor = prepared.query.descriptor
    bindings = prepared.system["assumption_bindings"]
    assert descriptor["solver_profile"]["solvers"] == ["z3"]
    assert descriptor["solver_profile"]["timeout_ms"] == 60_000
    assert descriptor["solve"]["assumption_ids"] == [
        row["assumption_id"] for row in bindings
    ]
    assert prepared.assumption_labels == tuple(row["label_sha256"] for row in bindings)
    snapshot_names = {item.path for item in prepared.query.source_files}
    assert {
        f"parent-result-{key}.json" for key in lane.EXPECTED_PARENT_RESULTS
    } <= snapshot_names


def test_sat_replay_delegates_to_parent_exact_checker(
    monkeypatch: pytest.MonkeyPatch, parent: dict[str, Any]
) -> None:
    prepared = lane.prepare_query("z3-target-mirror-radius-lt", parent=parent)
    observed: dict[str, Any] = {}

    def exact(
        query: object, solver: str, model: str, values: str
    ) -> adapter.SemanticVerification:
        observed.update(query=query, solver=solver, model=model, values=values)
        return adapter.SemanticVerification(True, {"exact": True})

    monkeypatch.setattr(lane.source, "verify_sat_model", exact)
    verification = lane.verify_sat_model(prepared.query, "z3", "(model)", "((x 1))")
    assert verification.accepted is True
    assert observed["solver"] == "z3"
    assert observed["query"].journal_commands == tuple(
        prepared.system["source_unguarded_commands"]
    )


def test_genuine_named_tree_closes_and_replays_without_transport(
    tmp_path: Path, parent: dict[str, Any]
) -> None:
    prepared = lane.prepare_query("z3-target-mirror-radius-lt", parent=parent)
    output, transport, first = _genuine_tree(tmp_path, prepared)
    engine = first["engine"]
    assert set(engine) == lane._ENGINE_KEYS
    assert engine["raw_status"] == "UNSAT"
    assert engine["unsat_assumptions"]["basis"] == "get-unsat-assumptions"
    assert engine["unsat_assumptions"]["terminal_unsat"] is False
    assert engine["unsat_assumptions"]["named_core_support"] is True
    assert engine["session_lifecycle"]["close_observed_state"] == "closed"
    assert transport.actual_solves == 1

    class NoTransport:
        def __getattr__(self, name: str) -> object:
            raise AssertionError(f"replay used transport: {name}")

    assert lane.run_query(prepared, output, NoTransport()) == first


@pytest.mark.parametrize(
    "mutation",
    [
        "extra-result-key",
        "extra-engine-key",
        "source-record",
        "session-create-request",
        "journal-frontiers",
        "solve-request",
        "session",
        "receipts-before",
        "receipts",
        "session-lifecycle",
        "closed-session",
        "core-label",
        "extra-file",
    ],
)
def test_genuine_named_tree_mutations_fail_closed(
    tmp_path: Path,
    parent: dict[str, Any],
    mutation: str,
) -> None:
    prepared = lane.prepare_query("z3-target-mirror-radius-gt", parent=parent)
    output, _, _ = _genuine_tree(tmp_path, prepared)
    result_path = output / "result.json"
    result = json.loads(result_path.read_bytes())
    if mutation == "extra-result-key":
        result["future_result"] = False
        _rewrite_result(result_path, result)
    elif mutation == "extra-engine-key":
        result["engine"]["future_engine"] = False
        _rewrite_result(result_path, result)
    elif mutation == "core-label":
        result["engine"]["unsat_assumptions"]["core_labels"][0] = "0" * 64
        _rewrite_result(result_path, result)
    elif mutation == "extra-file":
        (output / "unbound.bin").write_bytes(b"extra")
    else:
        key = mutation.replace("-", "_")
        artifact = result["custody"].get(key)
        if artifact is None:
            artifact = result["engine"]["artifacts"][key]
        _replace(output / artifact["path"], b"{}\n")
    with pytest.raises(lane.Profile0034SupportingEdgeNamedCoreError):
        lane.verify_query_tree(prepared, output)


def test_core_rejects_empty_terminal_duplicate_and_wrong_mapping(
    parent: dict[str, Any],
) -> None:
    prepared = lane.prepare_query("z3-target-mirror-radius-lt", parent=parent)
    provenance = {
        "basis": "get-unsat-assumptions",
        "named_core_support": True,
        "daemon_field": "core",
        "assumption_terms": [],
        "source_atom_ids": [],
        "terminal_unsat": True,
        "ordered_assumption_labels": list(prepared.assumption_labels),
        "core_labels": [],
    }
    engine = {
        "raw_status": "UNSAT",
        "effective_status": "UNSAT_DISCOVERY_ONLY",
        "unsat_assumptions": provenance,
    }
    with pytest.raises(lane.Profile0034SupportingEdgeNamedCoreError):
        lane._validate_core(prepared, engine)
    first = prepared.system["assumption_bindings"][0]
    provenance.update(
        assumption_terms=[first["assumption_term"], first["assumption_term"]],
        source_atom_ids=[first["assumption_id"], first["assumption_id"]],
        terminal_unsat=False,
        core_labels=[first["label_sha256"], first["label_sha256"]],
    )
    with pytest.raises(lane.Profile0034SupportingEdgeNamedCoreError):
        lane._validate_core(prepared, engine)
    provenance.update(
        assumption_terms=[first["assumption_term"]],
        source_atom_ids=["source-strict-000"],
        core_labels=[first["label_sha256"]],
    )
    with pytest.raises(lane.Profile0034SupportingEdgeNamedCoreError):
        lane._validate_core(prepared, engine)


@pytest.mark.parametrize(
    ("key", "status"),
    [("z3-control-positive", "SAT"), ("z3-control-negative", "UNSAT")],
)
def test_genuine_named_controls(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    parent: dict[str, Any],
    key: str,
    status: str,
) -> None:
    prepared = lane.prepare_query(key, parent=parent)
    if status == "SAT":
        monkeypatch.setattr(lane, "verify_sat_model", _accepting_verifier)
    _, _, result = _genuine_tree(tmp_path, prepared, status=status)
    assert result["engine"]["raw_status"] == status
    if status == "SAT":
        assert result["engine"]["effective_status"] == "SAT_SEMANTICALLY_REPLAYED"
    else:
        assert result["engine"]["unsat_assumptions"]["core_labels"]


@pytest.mark.parametrize("status", ["SAT", "UNKNOWN"])
def test_target_requires_z3_unsat(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    parent: dict[str, Any],
    status: str,
) -> None:
    prepared = lane.prepare_query("z3-target-mirror-radius-lt", parent=parent)
    monkeypatch.setattr(lane, "verify_sat_model", _accepting_verifier)
    with pytest.raises(lane.Profile0034SupportingEdgeNamedCoreError):
        _genuine_tree(tmp_path, prepared, status=status)


def test_execution_commit_gate_checks_every_source(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    head = "1" * 40
    manifest = {
        "source_digests": {
            lane._repo_path(path): lane._sha(lane._read(path))
            for path in lane._manifest_sources()
        }
    }

    def git_read(arguments: tuple[str, ...], _where: str) -> bytes:
        if arguments[0] == "rev-parse":
            return f"{head}\n".encode("ascii")
        relative = arguments[1].split(":", 1)[1]
        return lane._read(lane.REPOSITORY_ROOT / relative)

    monkeypatch.setattr(lane, "_git_read", git_read)
    assert lane.authenticate_execution_commit(manifest) == head
    first = next(iter(manifest["source_digests"]))
    manifest["source_digests"][first] = "0" * 64
    with pytest.raises(lane.Profile0034SupportingEdgeNamedCoreError):
        lane.authenticate_execution_commit(manifest)


def test_recorded_execution_commit_survives_unrelated_head_advance(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    recorded = "2" * 40
    manifest = {
        "source_digests": {
            lane._repo_path(path): lane._sha(lane._read(path))
            for path in lane._manifest_sources()
        }
    }

    def git_read(arguments: tuple[str, ...], _where: str) -> bytes:
        assert arguments[0] == "show"
        commit, relative = arguments[1].split(":", 1)
        assert commit == recorded
        return lane._read(lane.REPOSITORY_ROOT / relative)

    monkeypatch.setattr(lane, "_git_read", git_read)
    assert (
        lane.authenticate_recorded_execution_commit(
            manifest, {"execution_commit": recorded}
        )
        == recorded
    )


@pytest.mark.parametrize("workers", [0, 5, True])
def test_worker_bounds_fail_before_root_access(
    monkeypatch: pytest.MonkeyPatch, workers: object
) -> None:
    monkeypatch.setattr(
        lane,
        "ensure_run_root",
        lambda: (_ for _ in ()).throw(AssertionError("root accessed")),
    )
    with pytest.raises(lane.Profile0034SupportingEdgeNamedCoreError):
        lane.run_campaign(workers=workers)  # type: ignore[arg-type]


def test_incomplete_launch_is_never_resumed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    root = tmp_path / "run"
    for name in ("artifacts", "events", "tmp"):
        (root / name).mkdir(parents=True, exist_ok=True)
    (root / "run_manifest.json").write_text("{}\n")
    (root / "events/launch.json").write_text("{}\n")
    monkeypatch.setattr(
        lane, "ensure_run_root", lambda: (root, {"manifest_sha256": "m"})
    )
    monkeypatch.setattr(lane, "authenticate_parent_run", dict)
    monkeypatch.setattr(
        lane, "prepare_query", lambda key, **_kw: SimpleNamespace(key=key)
    )
    monkeypatch.setattr(lane, "_inventory", lambda *_args: "LAUNCHED")
    monkeypatch.setattr(
        lane, "authenticate_execution_commit", lambda _manifest: "1" * 40
    )
    with pytest.raises(
        lane.Profile0034SupportingEdgeNamedCoreError, match="cannot resume"
    ):
        lane.run_campaign(transport=object())


def test_controls_precede_concurrent_targets(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    root = tmp_path / "run"
    root.mkdir()
    (root / "run_manifest.json").write_text("{}\n")
    manifest = {"manifest_sha256": "m"}
    phases = iter(["INITIALIZED", "LAUNCHED", "TERMINAL"])
    calls: list[str] = []
    barrier = threading.Barrier(2)
    lock = threading.Lock()

    monkeypatch.setattr(lane, "ensure_run_root", lambda: (root, manifest))
    monkeypatch.setattr(lane, "authenticate_parent_run", dict)
    monkeypatch.setattr(
        lane, "prepare_query", lambda key, **_kw: SimpleNamespace(key=key)
    )
    monkeypatch.setattr(lane, "_inventory", lambda *_args: next(phases))
    monkeypatch.setattr(
        lane, "authenticate_execution_commit", lambda _manifest: "1" * 40
    )
    monkeypatch.setattr(lane, "_publish_once", lambda _path, _payload: None)

    def fake_run(prepared: SimpleNamespace, *_args: object) -> dict[str, Any]:
        key = prepared.key
        if key in lane.TARGET_KEYS:
            barrier.wait(timeout=5)
        with lock:
            calls.append(key)
        raw = "SAT" if key in lane.POSITIVE_CONTROL_KEYS else "UNSAT"
        effective = (
            "SAT_SEMANTICALLY_REPLAYED" if raw == "SAT" else "UNSAT_DISCOVERY_ONLY"
        )
        return {
            "solver": "z3",
            "source_id": {row[0]: row[2] for row in lane.QUERY_PLAN}[key],
            "result_sha256": lane._sha(key.encode("ascii")),
            "engine": {
                "session_id": f"session-{key}",
                "raw_status": raw,
                "effective_status": effective,
            },
        }

    monkeypatch.setattr(lane, "run_query", fake_run)
    terminal = lane.run_campaign(workers=2, transport=object())
    assert calls[:2] == list(lane.POSITIVE_CONTROL_KEYS + lane.NEGATIVE_CONTROL_KEYS)
    assert set(calls[2:]) == set(lane.TARGET_KEYS)
    assert terminal["status"] == "NAMED_CORES_COMPLETE"
    assert terminal["core_scope"].startswith("Z3-returned cores only")


def test_claim_boundary_remains_false(parent: dict[str, Any]) -> None:
    prepared = lane.prepare_query("z3-target-mirror-radius-gt", parent=parent)
    assert prepared.system["claims"] == lane.FALSE_CLAIMS
    assert all(value is False for value in lane.FALSE_CLAIMS.values())
    assert lane.FALSE_CLAIMS["core_minimality"] is False

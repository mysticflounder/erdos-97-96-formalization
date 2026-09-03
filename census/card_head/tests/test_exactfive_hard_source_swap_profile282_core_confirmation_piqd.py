from __future__ import annotations

import json
import os
from fractions import Fraction
from pathlib import Path

import pytest

from census.card_head import (
    exactfive_hard_source_swap_profile282_core_confirmation_piqd as subject,
)


class NoTransport:
    def request_json(self, *_args: object, **_kwargs: object) -> object:
        raise AssertionError("transport must not be used")

    def request_bytes(self, *_args: object, **_kwargs: object) -> object:
        raise AssertionError("transport must not be used")


class PredecessorReadTransport:
    def __init__(self, local: dict[str, object]) -> None:
        prepared = subject.predecessor.prepare_query(
            "cvc5-target-direct", parent=local["parent"]
        )
        self.prepared = prepared
        self.session = {
            "id": subject.PREDECESSOR_UNKNOWN_SESSION_ID,
            "state": "closed",
            "lane": "smt",
            "solver_name": "cvc5",
            "solver_signature": "cvc5-1.3.3",
            "solver_sha256": subject.PREDECESSOR_UNKNOWN_SOLVER_SHA256,
            "solves": 1,
            "last_solve_index": 1,
            "last_status": "UNKNOWN",
            "last_assumption_free": False,
            "last_terminal_unsat": None,
        }
        receipt = {
            "status": "UNKNOWN",
            "request_id": subject.PREDECESSOR_UNKNOWN_REQUEST_ID,
            "request_sha256": subject.PREDECESSOR_UNKNOWN_REQUEST_SHA256,
            "result_sha256": subject.PREDECESSOR_UNKNOWN_RESULT_SHA256,
            "base_sha256": subject.PREDECESSOR_UNKNOWN_JOURNAL_SHA256,
            "base_bytes": len(prepared.query.journal_smt2),
            "base_commands": len(prepared.query.journal_commands),
            "assumptions": list(prepared.query.assumptions),
            "assumption_labels": list(prepared.assumption_labels),
            "timeout_ms": 60_000,
            "effective_deadline_ms": 90_000,
            "interrupted_by": "daemon_deadline",
            "include_model": True,
            "get_values": list(prepared.query.get_values),
            "solver_sha256": subject.PREDECESSOR_UNKNOWN_SOLVER_SHA256,
        }
        self.receipts = {
            "session_id": subject.PREDECESSOR_UNKNOWN_SESSION_ID,
            "lane": "smt",
            "count": 1,
            "receipts": [receipt],
        }
        self.calls: list[tuple[str, str]] = []

    def request_json(
        self, method: str, path: str, _body: object = None
    ) -> subject.adapter.JsonResponse:
        self.calls.append((method, path))
        body = self.receipts if path.endswith("/receipts") else self.session
        return subject.adapter.JsonResponse(200, body)

    def request_bytes(self, method: str, path: str) -> subject.adapter.BytesResponse:
        self.calls.append((method, path))
        return subject.adapter.BytesResponse(200, self.prepared.query.journal_smt2)


@pytest.fixture(scope="module")
def local() -> dict[str, object]:
    return subject.authenticate_predecessor_local()


def _fake_engine(
    prepared: subject.PreparedQuery, raw: str | None = "UNSAT"
) -> dict[str, object]:
    bindings = {
        binding["assumption_id"]: binding
        for binding in prepared.system["assumption_bindings"]
    }
    chosen = [bindings[item] for item in prepared.selected_ids[:2]]
    base: dict[str, object] = {
        "solver": prepared.solver,
        "session_id": f"fake-{prepared.key}",
        "raw_status": raw,
        "solve_index": None if raw is None else 1,
        "result_sha256": None if raw is None else "1" * 64,
        "response_lost": raw is None,
        "reconciled_from_receipt": False,
        "reconciliation_attempts": 0,
        "result_digest_advisory": None,
        "semantic_replay": None,
        "artifacts": {},
        "request_id": subject._request_id(prepared.key),
        "request_sha256": subject.adapter.piqd_solve_request_digest(
            prepared.query, prepared.assumption_labels
        ),
        "assumption_labels": list(prepared.assumption_labels),
        "claims": dict(subject.adapter.FALSE_CLAIMS),
        "unsat_assumptions": None,
    }
    if raw == "UNSAT":
        base["effective_status"] = "UNSAT_DISCOVERY_ONLY"
        base["unsat_assumptions"] = {
            "basis": "get-unsat-assumptions",
            "named_core_support": True,
            "daemon_field": "core",
            "assumption_terms": [item["assumption_term"] for item in chosen],
            "source_atom_ids": [item["assumption_id"] for item in chosen],
            "terminal_unsat": False,
            "ordered_assumption_labels": list(prepared.assumption_labels),
            "core_labels": [item["label_sha256"] for item in chosen],
        }
    elif raw == "UNKNOWN":
        base["effective_status"] = "INCONCLUSIVE_UNKNOWN"
    elif raw is None:
        base["effective_status"] = "INCONCLUSIVE_TRANSPORT_LOSS"
    else:
        base["effective_status"] = "SAT_SEMANTICALLY_REPLAYED"
        base["semantic_replay"] = {"accepted": True}
    return base


def _install_fake(
    monkeypatch: pytest.MonkeyPatch,
    prepared: subject.PreparedQuery,
    raw: str | None = "UNSAT",
) -> None:
    def run(query: object, **kwargs: object) -> dict[str, object]:
        assert query is prepared.query
        assert kwargs["solver"] == prepared.solver
        assert kwargs["assumption_labels"] == prepared.assumption_labels
        assert kwargs["request_id"] == subject._request_id(prepared.key)
        return _fake_engine(prepared, raw)

    monkeypatch.setattr(subject.adapter, "run_authenticated_single_solver_query", run)


@pytest.mark.parametrize(
    ("key", "solver", "source_id", "selected"),
    [
        ("z3-mirror-five", "z3", "parent-z3-mirror", subject.FIVE_CORE_IDS),
        ("cvc5-mirror-five", "cvc5", "parent-z3-mirror", subject.FIVE_CORE_IDS),
        ("z3-mirror-four", "z3", "parent-z3-mirror", subject.FOUR_CORE_IDS),
        ("cvc5-mirror-four", "cvc5", "parent-z3-mirror", subject.FOUR_CORE_IDS),
        ("z3-direct-four", "z3", "parent-cvc5-direct", subject.DIRECT_FOUR_IDS),
        ("cvc5-direct-four", "cvc5", "parent-cvc5-direct", subject.DIRECT_FOUR_IDS),
    ],
)
def test_exact_matrix_and_named_custody(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    local: dict[str, object],
    key: str,
    solver: str,
    source_id: str,
    selected: tuple[str, ...],
) -> None:
    prepared = subject.prepare_query(key, local=local)
    assert prepared.solver == solver
    assert prepared.system["source_id"] == source_id
    assert prepared.selected_ids == selected
    assert prepared.query.descriptor["solve"]["assumption_ids"] == list(selected)
    assert len(prepared.query.descriptor["named_atoms"]) == 302
    atom_ids = [item["id"] for item in prepared.query.descriptor["named_atoms"]]
    assert atom_ids == sorted(atom_ids)
    by_id = {
        item["assumption_id"]: item for item in prepared.system["assumption_bindings"]
    }
    assert prepared.assumption_labels == tuple(
        by_id[item]["label_sha256"] for item in selected
    )
    assert len(prepared.query.journal_commands) == 624
    assert all(
        value is False
        for value in prepared.query.descriptor["semantic_input"]["claims"].values()
    )
    _install_fake(monkeypatch, prepared)
    result = subject.run_cell(prepared, tmp_path / key, NoTransport(), set())
    assert result["state"] == "UNSAT_SELECTED_FORMULAS"


def test_mirror_and_direct_source_hashes_are_distinct(
    local: dict[str, object],
) -> None:
    mirror = subject.prepare_query("z3-mirror-four", local=local)
    direct = subject.prepare_query("z3-direct-four", local=local)
    assert (
        mirror.system["source_system_sha256"]
        == "43cf4cf25c68a27a2f833d3d281e709aa787b0b24bc333c618299a7250d007da"
    )
    assert (
        mirror.system["source_ledger_sha256"]
        == "f862e385a2e084ada846f489dd3a5bccfd842f35b9bb99b08e0b16c4725c9f27"
    )
    assert (
        direct.system["source_system_sha256"]
        == "24121735ea7639cdd24924dea7315a293fd939bcbeba689eb75dd8353dd8c0fa"
    )
    assert (
        direct.system["source_ledger_sha256"]
        == "71cec98ed9d5b2d4f7cf2cbd77db7721da21bc4ded34a28c4c34a0765368292d"
    )


def test_selected_exact_fraction_evaluator_uses_only_requested_atoms(
    local: dict[str, object],
) -> None:
    mirror = subject.prepare_query("z3-mirror-five", local=local)
    checks = subject.evaluate_selected_assignment(
        mirror.system,
        ("area-059", "area-144"),
        {"r": Fraction(1), "y_c009": Fraction(1)},
    )
    assert checks == {"area-059": True, "area-144": True}
    direct = subject.prepare_query("z3-direct-four", local=local)
    checks = subject.evaluate_selected_assignment(
        direct.system,
        ("area-023", "area-184"),
        {"r": Fraction(1), "x_c009": Fraction(0), "y_c009": Fraction(-1)},
    )
    assert checks == {"area-023": True, "area-184": True}


def test_imports_and_replays_closed_unknown_without_solve(
    tmp_path: Path, local: dict[str, object]
) -> None:
    transport = PredecessorReadTransport(local)
    output = tmp_path / "predecessor"
    record = subject.import_predecessor_custody(output, transport)
    assert record["unknown_status"] == "UNKNOWN"
    assert record["mirror_core_adjudicated"] is False
    assert transport.calls == [
        ("GET", f"/sessions/{subject.PREDECESSOR_UNKNOWN_SESSION_ID}"),
        ("GET", f"/sessions/{subject.PREDECESSOR_UNKNOWN_SESSION_ID}/receipts"),
        ("GET", f"/sessions/{subject.PREDECESSOR_UNKNOWN_SESSION_ID}/smt2"),
    ]
    assert subject.import_predecessor_custody(output, NoTransport()) == record


def test_predecessor_crossed_receipt_fails_closed(
    tmp_path: Path, local: dict[str, object]
) -> None:
    transport = PredecessorReadTransport(local)
    transport.receipts["receipts"][0]["assumption_labels"][0] = "0" * 64
    with pytest.raises(
        subject.Profile282CoreConfirmationError, match="receipt drifted"
    ):
        subject.import_predecessor_custody(tmp_path / "crossed", transport)


@pytest.mark.parametrize(
    ("raw", "state"),
    [
        ("UNSAT", "UNSAT_SELECTED_FORMULAS"),
        ("UNKNOWN", "INCONCLUSIVE_UNKNOWN"),
        (None, "INCONCLUSIVE_TRANSPORT_LOSS"),
    ],
)
def test_publishes_solver_outcomes_and_resumes_without_transport(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    local: dict[str, object],
    raw: str | None,
    state: str,
) -> None:
    prepared = subject.prepare_query("z3-mirror-five", local=local)
    _install_fake(monkeypatch, prepared, raw)
    output = tmp_path / state
    result = subject.run_cell(prepared, output, NoTransport(), set())
    assert result["state"] == state
    monkeypatch.setattr(
        subject.adapter,
        "run_authenticated_single_solver_query",
        lambda *_args, **_kwargs: pytest.fail("resume invoked transport"),
    )
    assert subject.run_cell(prepared, output, NoTransport(), set()) == result


def test_adapter_failure_is_published_with_partial_custody(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    local: dict[str, object],
) -> None:
    prepared = subject.prepare_query("cvc5-direct-four", local=local)

    def failed(_query: object, **kwargs: object) -> dict[str, object]:
        descriptor = os.open(
            "partial.json",
            os.O_WRONLY | os.O_CREAT | os.O_EXCL,
            0o600,
            dir_fd=kwargs["output_fd"],
        )
        os.write(descriptor, b"{}\n")
        os.close(descriptor)
        raise subject.adapter.SmtSourceAdapterError("simulated")

    monkeypatch.setattr(
        subject.adapter, "run_authenticated_single_solver_query", failed
    )
    output = tmp_path / "failed"
    result = subject.run_cell(prepared, output, NoTransport(), set())
    assert result["state"] == "FAILED_CUSTODY"
    assert result["failure_type"] == "SmtSourceAdapterError"
    assert (output / "partial.json").is_file()


def test_tamper_crossed_custody_symlink_and_hardlink_fail_closed(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    local: dict[str, object],
) -> None:
    prepared = subject.prepare_query("z3-mirror-four", local=local)
    _install_fake(monkeypatch, prepared)
    clean = tmp_path / "clean"
    subject.run_cell(prepared, clean, NoTransport(), set())

    result_path = clean / "result.json"
    result = json.loads(result_path.read_bytes())
    result["selected_assumption_ids"] = list(subject.FIVE_CORE_IDS)
    result["result_sha256"] = subject._self_hash(result, "result_sha256")
    result_path.chmod(0o600)
    result_path.write_bytes(subject._json(result))
    with pytest.raises(subject.Profile282CoreConfirmationError, match="identity"):
        subject.verify_cell_tree(prepared, clean)

    linked = tmp_path / "linked"
    linked.symlink_to(clean, target_is_directory=True)
    with pytest.raises(subject.Profile282CoreConfirmationError, match="unsafe"):
        subject.verify_cell_tree(prepared, linked)

    tampered = tmp_path / "tampered"
    subject.run_cell(prepared, tampered, NoTransport(), set())
    journal = tampered / "journal.smt2"
    journal.chmod(0o600)
    journal.write_bytes(journal.read_bytes() + b"\n")
    with pytest.raises(subject.Profile282CoreConfirmationError, match="digest"):
        subject.verify_cell_tree(prepared, tampered)

    second = tmp_path / "second"
    subject.run_cell(prepared, second, NoTransport(), set())
    source_record = second / "source-record.json"
    source_record.unlink()
    os.link(clean / "source-record.json", source_record)
    with pytest.raises(subject.Profile282CoreConfirmationError, match="single-link"):
        subject.verify_cell_tree(prepared, second)


def test_default_sparse_verbose_and_error_output(
    monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    manifest = {"schema": subject.RUN_MANIFEST_SCHEMA, "manifest_sha256": "a" * 64}
    monkeypatch.setattr(
        subject, "ensure_run_root", lambda: (subject.RUN_ROOT, manifest)
    )
    assert subject.main(["--init-only"]) == 0
    assert capsys.readouterr() == ("", "")
    assert subject.main(["--init-only", "--verbose"]) == 0
    captured = capsys.readouterr()
    assert json.loads(captured.out) == manifest
    assert captured.err == ""

    def fail() -> tuple[Path, dict[str, object]]:
        raise subject.Profile282CoreConfirmationError("broken")

    monkeypatch.setattr(subject, "ensure_run_root", fail)
    assert subject.main(["--init-only"]) == 1
    assert capsys.readouterr() == ("", "error: broken\n")


def test_run_root_rejects_symlinked_lane_ancestor_without_outside_write(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repository = tmp_path / "repository"
    runs = repository / "scratch/runs"
    runs.mkdir(parents=True)
    outside = tmp_path / "outside"
    outside.mkdir()
    lane = runs / subject.LANE_ID
    lane.symlink_to(outside, target_is_directory=True)
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", repository)
    monkeypatch.setattr(subject, "RUN_ROOT", lane / subject.RUN_ID)
    with pytest.raises(subject.Profile282CoreConfirmationError, match="symlink"):
        subject.ensure_run_root()
    assert not (outside / subject.RUN_ID).exists()


def test_run_root_rejects_escape_bad_repository_and_file_ancestor(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repository = tmp_path / "repository"
    repository.mkdir()
    escaped = tmp_path / "outside/run-0002"
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", repository)
    monkeypatch.setattr(subject, "RUN_ROOT", escaped)
    with pytest.raises(subject.Profile282CoreConfirmationError, match="escapes"):
        subject.ensure_run_root()
    assert not escaped.exists()

    bad_repository = tmp_path / "bad-repository"
    bad_repository.write_text("not a directory", encoding="utf-8")
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", bad_repository)
    monkeypatch.setattr(subject, "RUN_ROOT", bad_repository / "scratch/run-0002")
    with pytest.raises(
        subject.Profile282CoreConfirmationError, match="repository root"
    ):
        subject.ensure_run_root()

    repository_two = tmp_path / "repository-two"
    runs = repository_two / "scratch/runs"
    runs.mkdir(parents=True)
    lane_file = runs / subject.LANE_ID
    lane_file.write_text("not a directory", encoding="utf-8")
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", repository_two)
    monkeypatch.setattr(subject, "RUN_ROOT", lane_file / subject.RUN_ID)
    with pytest.raises(subject.Profile282CoreConfirmationError, match="ancestor"):
        subject.ensure_run_root()


@pytest.mark.parametrize("unsafe_kind", ["symlink", "file"])
def test_existing_run_root_rejects_unsafe_output_children(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    unsafe_kind: str,
) -> None:
    repository = tmp_path / unsafe_kind
    root = repository / "scratch/runs" / subject.LANE_ID / subject.RUN_ID
    root.mkdir(parents=True)
    outside = tmp_path / f"outside-{unsafe_kind}"
    outside.mkdir()
    artifacts = root / "artifacts"
    if unsafe_kind == "symlink":
        artifacts.symlink_to(outside, target_is_directory=True)
    else:
        artifacts.write_text("not a directory", encoding="utf-8")
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", repository)
    monkeypatch.setattr(subject, "RUN_ROOT", root)
    with pytest.raises(subject.Profile282CoreConfirmationError, match="child"):
        subject.ensure_run_root()


def test_new_run_root_children_are_real_directories(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repository = tmp_path / "repository"
    repository.mkdir()
    root = repository / "scratch/runs" / subject.LANE_ID / subject.RUN_ID
    manifest = {
        "schema": subject.RUN_MANIFEST_SCHEMA,
        "created_utc": "2026-09-03T00:00:00Z",
        "manifest_sha256": "a" * 64,
    }
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", repository)
    monkeypatch.setattr(subject, "RUN_ROOT", root)
    monkeypatch.setattr(subject, "_expected_manifest", lambda _created: manifest)
    observed_root, observed_manifest = subject.ensure_run_root()
    assert observed_root == root
    assert observed_manifest == manifest
    for name in ("artifacts", "events", "tmp"):
        child = root / name
        assert child.is_dir()
        assert not child.is_symlink()


def test_campaign_is_six_sequential_single_solve_cells() -> None:
    assert subject.WORKERS == 1
    assert subject.DEFAULT_TIMEOUT_S == 60.0
    assert len(subject.QUERY_PLAN) == 6
    assert [item[1] for item in subject.QUERY_PLAN] == [
        "z3",
        "cvc5",
        "z3",
        "cvc5",
        "z3",
        "cvc5",
    ]
    with pytest.raises(subject.Profile282CoreConfirmationError, match="exactly 1"):
        subject.run_campaign(workers=2)

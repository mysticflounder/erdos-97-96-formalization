from __future__ import annotations

import hashlib
import json
import os
import uuid
from collections.abc import Mapping
from dataclasses import replace
from pathlib import Path

import pytest
import sympy as sp

from census.cap_configuration import piqd_adapter as subject
from census.cap_configuration.encode import (
    NamedPolynomialAtom,
    PolynomialSystem,
    SparsePolynomial,
)
from census.cap_configuration.schema import (
    canonical_json_bytes,
    stored_json_bytes,
    structured_hash,
)
from census.p97_search import phase3_piqd_smt_source_adapter as shared

REQUEST_ID = "12345678-1234-4234-9234-123456789abc"


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _system() -> PolynomialSystem:
    x = sp.Symbol("x")
    atom = NamedPolynomialAtom(
        atom_id="x_is_one",
        relation="eq",
        polynomials=(SparsePolynomial.from_sympy(x - 1, (x,)),),
        family="fixture",
        source_provenance="fixture.x_is_one",
    )
    return PolynomialSystem(("x",), (atom,), ("x_is_one",), (), ())


def _query(*, solver: str = "cvc5", timeout_ms: int = 1_000):
    system = _system()
    body = {
        "schema": subject.CAP_CELL_SCHEMA,
        "cell_id": "fixture-sat",
        "polynomial_system": system.to_record(),
    }
    cell = {
        **body,
        "cell_sha256": structured_hash(subject.CAP_CELL_SCHEMA, body),
    }
    return subject.build_authenticated_cell_query(
        cell_bytes=stored_json_bytes(cell),
        system_bytes=stored_json_bytes(system.to_record()),
        solver=solver,
        timeout_ms=timeout_ms,
    )


def _session(
    session_id: str,
    *,
    state: str,
    commands: int,
    solves: int,
    status: str | None,
    terminal_unsat: bool | None,
) -> dict[str, object]:
    return {
        "id": session_id,
        "lane": "smt",
        "state": state,
        "solver_name": "cvc5",
        "solver_sha256": _sha(b"fake-cvc5"),
        "solver_signature": "cvc5 fake/v1",
        "protocol_version": 1,
        "journal_path": f"/daemon/sessions/{session_id}/journal.smt2",
        "created_at": 10,
        "updated_at": 10 + commands + solves,
        "clauses": commands,
        "max_var": 0,
        "solves": solves,
        "last_status": status,
        "declared_num_vars": None,
        "last_solve_index": None if solves == 0 else 1,
        "last_assumption_free": None if solves == 0 else True,
        "last_terminal_unsat": None if solves == 0 else terminal_unsat,
        "label": "",
    }


class FakeTransport:
    def __init__(
        self,
        status: str = "SAT",
        *,
        values: str = "((|x| 1))",
        lose_first_solve: bool = False,
        commit_lost_solve: bool = True,
        fail_create: bool = False,
        replay_conflict: bool = False,
    ) -> None:
        self.status = status
        self.values = values
        self.lose_first_solve = lose_first_solve
        self.commit_lost_solve = commit_lost_solve
        self.fail_create = fail_create
        self.replay_conflict = replay_conflict
        self.calls: list[tuple[str, str, object]] = []
        self.actual_solves = 0
        self.commands: list[str] = []
        self.journal = b""
        self.request: dict[str, object] | None = None
        self.answer: dict[str, object] | None = None
        self.receipt: dict[str, object] | None = None
        self.closed = False
        self.created = False
        self.session_id = str(uuid.UUID(int=7))
        self.label = ""

    def _answer(self) -> dict[str, object]:
        if self.status == "SAT":
            return {
                "status": "SAT",
                "model": "(model (define-fun x () Real 1))",
                "values": self.values,
            }
        if self.status == "UNSAT":
            return {"status": "UNSAT", "core": [], "terminal_unsat": True}
        return {"status": "UNKNOWN", "interrupted_by": "daemon_deadline"}

    def _request_sha(self, body: Mapping[str, object]) -> str:
        digest = hashlib.sha256(shared.PIQD_SOLVE_REQUEST_DIGEST_VERSION)
        digest.update(
            f"\nbase={len(self.commands)}:{len(self.journal)}:{_sha(self.journal)}".encode()
        )
        digest.update(f"\ntimeout={body['timeout_ms']}\nmodel=true".encode())
        for name in ("assumptions", "get_values"):
            values = body[name]
            assert type(values) is list
            digest.update(f"\n{name}={len(values)}".encode())
            for value in values:
                encoded = value.encode()
                digest.update(f"\n{len(encoded)}:".encode())
                digest.update(encoded)
        return digest.hexdigest()

    def _store_solve(self, body: Mapping[str, object]) -> dict[str, object]:
        self.actual_solves += 1
        self.request = dict(body)
        self.answer = self._answer()
        result_sha = shared.piqd_result_digest(self.answer)
        self.receipt = {
            "solve_index": 1,
            "base_commands": len(self.commands),
            "base_bytes": len(self.journal),
            "base_sha256": _sha(self.journal),
            "solver_signature": "cvc5 fake/v1",
            "solver_sha256": _sha(b"fake-cvc5"),
            "assumptions": [],
            "timeout_ms": body["timeout_ms"],
            "effective_deadline_ms": (
                body["timeout_ms"] + shared.PIQD_EFFECTIVE_DEADLINE_GRACE_MS
            ),
            "include_model": True,
            "get_values": list(body["get_values"]),
            **self.answer,
            "solve_ms": 2,
            "result_sha256": result_sha,
            "at": 20,
            "request_id": body["request_id"],
            "request_sha256": self._request_sha(body),
        }
        return {
            **self.answer,
            "solve_ms": 2,
            "solve_index": 1,
            "result_sha256": result_sha,
            "effective_deadline_ms": (
                body["timeout_ms"] + shared.PIQD_EFFECTIVE_DEADLINE_GRACE_MS
            ),
            "replayed": False,
        }

    def request_json(
        self,
        method: str,
        path: str,
        body: Mapping[str, object] | None = None,
    ) -> subject.JsonResponse:
        snapshot = None if body is None else json.loads(json.dumps(body))
        self.calls.append((method, path, snapshot))
        if method == "GET" and path == "/sessions":
            sessions: list[dict[str, object]] = []
            if self.created:
                status = None if self.answer is None else str(self.answer["status"])
                terminal = (
                    None if self.answer is None else self.answer.get("terminal_unsat")
                )
                listed = _session(
                    self.session_id,
                    state="closed" if self.closed else "live",
                    commands=len(self.commands),
                    solves=0 if self.answer is None else 1,
                    status=status,
                    terminal_unsat=terminal,
                )
                listed["label"] = self.label
                sessions.append(listed)
            return subject.JsonResponse(
                200,
                {"sessions": sessions, "live": int(self.created and not self.closed)},
            )
        if method == "POST" and path == "/sessions":
            if self.fail_create:
                raise OSError("simulated create failure")
            assert body is not None and body["solver"] == "cvc5"
            self.created = True
            self.label = str(body["label"])
            created = _session(
                self.session_id,
                state="live",
                commands=0,
                solves=0,
                status=None,
                terminal_unsat=None,
            )
            created["label"] = self.label
            return subject.JsonResponse(201, created)
        prefix = f"/sessions/{self.session_id}"
        assert path.startswith(prefix)
        suffix = path[len(prefix) :]
        if method == "POST" and suffix == "/assert":
            assert body is not None and body["expect_commands"] == 0
            self.commands = list(body["commands"])
            self.journal = b"".join(item.encode() + b"\n" for item in self.commands)
            return subject.JsonResponse(
                200, {"added": len(self.commands), "commands": len(self.commands)}
            )
        if method == "POST" and suffix == "/solve":
            assert body is not None
            assert body["request_id"] == REQUEST_ID
            assert body["assumption_labels"] == []
            if self.receipt is not None:
                if self.replay_conflict or dict(body) != self.request:
                    return subject.JsonResponse(409, {"error": "request conflict"})
                assert self.answer is not None
                return subject.JsonResponse(
                    200,
                    {
                        **self.answer,
                        "solve_ms": 0,
                        "solve_index": 1,
                        "result_sha256": self.receipt["result_sha256"],
                        "effective_deadline_ms": self.receipt["effective_deadline_ms"],
                        "replayed": True,
                    },
                )
            if self.lose_first_solve and not self.commit_lost_solve:
                raise subject.PiqdTransportLoss("simulated pre-commit solve loss")
            response = self._store_solve(body)
            if self.lose_first_solve:
                raise subject.PiqdTransportLoss("simulated solve response loss")
            return subject.JsonResponse(200, response)
        if method == "GET" and suffix == "/receipts":
            receipts = [] if self.receipt is None else [self.receipt]
            return subject.JsonResponse(
                200,
                {
                    "session_id": self.session_id,
                    "lane": "smt",
                    "journal_path": f"/daemon/sessions/{self.session_id}/journal.smt2",
                    "receipts_path": f"/daemon/sessions/{self.session_id}/receipts.jsonl",
                    "count": len(receipts),
                    "receipts": receipts,
                },
            )
        if method == "GET" and suffix == "":
            status = None if self.answer is None else str(self.answer["status"])
            terminal = (
                None if self.answer is None else self.answer.get("terminal_unsat")
            )
            live = _session(
                self.session_id,
                state="live",
                commands=len(self.commands),
                solves=0 if self.answer is None else 1,
                status=status,
                terminal_unsat=terminal,
            )
            live["label"] = self.label
            return subject.JsonResponse(200, live)
        if method == "DELETE" and suffix == "":
            self.closed = True
            status = None if self.answer is None else str(self.answer["status"])
            terminal = (
                None if self.answer is None else self.answer.get("terminal_unsat")
            )
            closed = _session(
                self.session_id,
                state="closed",
                commands=len(self.commands),
                solves=0 if self.answer is None else 1,
                status=status,
                terminal_unsat=terminal,
            )
            closed["label"] = self.label
            return subject.JsonResponse(200, closed)
        raise AssertionError((method, path))

    def request_bytes(self, method: str, path: str) -> subject.BytesResponse:
        self.calls.append((method, path, None))
        assert method == "GET" and path.endswith("/smt2")
        return subject.BytesResponse(200, self.journal)


def _run(
    tmp_path: Path,
    fake: FakeTransport,
    *,
    query=None,
    resume_policy: str | None = None,
) -> tuple[dict[str, object], Path]:
    query = _query() if query is None else query
    output = tmp_path / "shared-output"
    output.mkdir(parents=True)
    output_fd = os.open(
        output, os.O_RDONLY | os.O_DIRECTORY | getattr(os, "O_NOFOLLOW", 0)
    )
    try:
        result = subject.run_authenticated_cell_query(
            query,
            request_id=REQUEST_ID,
            transport=fake,
            output_fd=output_fd,
            resume_policy=resume_policy,
        )
    finally:
        os.close(output_fd)
    return result, output


def _validate_offline(
    query: subject.SourceSemanticQuery,
    result: Mapping[str, object],
    output: Path,
) -> dict[str, object]:
    snapshots = {source.path: source.payload for source in query.source_files}
    profile = query.descriptor["solver_profile"]
    solver = profile["solvers"][0]
    timeout_ms = profile["timeout_ms"]
    assert type(solver) is str and type(timeout_ms) is int
    output_fd = os.open(
        output, os.O_RDONLY | os.O_DIRECTORY | getattr(os, "O_NOFOLLOW", 0)
    )
    try:
        return subject.validate_retained_cell_query_result(
            cell_bytes=snapshots["cell.json"],
            system_bytes=snapshots["polynomial-system.json"],
            solver=solver,
            timeout_ms=timeout_ms,
            request_id=REQUEST_ID,
            adapter_result=result,
            output_fd=output_fd,
        )
    finally:
        os.close(output_fd)


def test_build_query_authenticates_cell_system_and_complete_readback() -> None:
    query = _query()
    assert query.descriptor["schema"] == subject.CAP_QUERY_SCHEMA
    assert query.journal_commands == _system().state_commands()
    assert query.descriptor["named_atoms"] == []
    assert query.assumptions == ()
    assert query.get_values == ("|x|",)
    assert query.descriptor["solve"]["readback_variable_ids"] == ["variable-000000"]
    assert [source.path for source in query.source_files] == [
        "cell.json",
        "polynomial-system.json",
    ]

    system = _system()
    body = {
        "schema": subject.CAP_CELL_SCHEMA,
        "cell_id": "bad",
        "polynomial_system": system.to_record(),
    }
    bad = {**body, "cell_sha256": "0" * 64}
    with pytest.raises(subject.CapConfigurationPiqdAdapterError, match="cell_sha256"):
        subject.build_authenticated_cell_query(
            cell_bytes=stored_json_bytes(bad),
            system_bytes=stored_json_bytes(system.to_record()),
            solver="cvc5",
            timeout_ms=1_000,
        )


def test_online_boundary_reauthenticates_cell_semantic_bindings(
    tmp_path: Path,
) -> None:
    query = _query()
    descriptor = json.loads(query.descriptor_bytes)
    cell = dict(descriptor["semantic_input"]["cell"])
    cell["cell_id"] = "tampered"
    cell_body = {key: value for key, value in cell.items() if key != "cell_sha256"}
    cell["cell_sha256"] = structured_hash(subject.CAP_CELL_SCHEMA, cell_body)
    descriptor["semantic_input"]["cell"] = cell
    descriptor["semantic_sha256"] = _sha(
        canonical_json_bytes(descriptor["semantic_input"])
    )
    tampered = replace(
        query,
        descriptor=descriptor,
        descriptor_bytes=stored_json_bytes(descriptor),
    )

    with pytest.raises(subject.CapConfigurationPiqdAdapterError, match="cell"):
        _run(tmp_path, FakeTransport(), query=tampered)


@pytest.mark.parametrize(
    ("status", "classification"),
    [
        ("SAT", "SAT_SEMANTICALLY_REPLAYED"),
        ("UNSAT", "UNSAT_DISCOVERY_ONLY"),
        ("UNKNOWN", "INCONCLUSIVE_UNKNOWN"),
    ],
)
def test_adapter_maps_only_frozen_classifications_and_solves_once(
    tmp_path: Path, status: str, classification: str
) -> None:
    fake = FakeTransport(status)
    result, output = _run(tmp_path, fake)
    assert result["schema"] == subject.CAP_ADAPTER_RESULT_SCHEMA
    assert result["classification"] == classification
    assert result["effective_status"] == classification
    assert result["request_id"] == REQUEST_ID
    assert result["assumption_labels"] == []
    assert fake.actual_solves == 1 and fake.closed
    solve_posts = [
        call for call in fake.calls if call[0] == "POST" and call[1].endswith("/solve")
    ]
    assert len(solve_posts) == 1
    assert (output / "cvc5.solve-request.json").is_file()
    if status == "SAT":
        assert result["cap_semantic_replay"]["outcome"] == "accepted"
        assert result["cap_values_artifact"]["path"] == "cvc5.solve.json"
        assert result["cap_values_json_field"] == "values"
        assert result["cap_values_raw_sha256"] == _sha(b"((|x| 1))")
        retained = json.loads((output / "cvc5.solve.json").read_bytes())
        assert retained["values"] == "((|x| 1))"
        assert result["cap_values_raw_sha256"] == _sha(
            retained["values"].encode("utf-8")
        )
    else:
        assert result["cap_semantic_replay"] is None
        assert result["cap_values_artifact"] is None


@pytest.mark.parametrize(
    ("status", "values", "classification"),
    [
        ("SAT", "((|x| 1))", "SAT_SEMANTICALLY_REPLAYED"),
        ("SAT", "((|x| 2))", "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED"),
        ("UNSAT", "unused", "UNSAT_DISCOVERY_ONLY"),
        ("UNKNOWN", "unused", "INCONCLUSIVE_UNKNOWN"),
    ],
)
def test_offline_validator_reconstructs_retained_terminal_result(
    tmp_path: Path,
    status: str,
    values: str,
    classification: str,
) -> None:
    query = _query()
    result, output = _run(tmp_path, FakeTransport(status, values=values), query=query)

    assert result["classification"] == classification
    assert _validate_offline(query, result, output) == result


def test_offline_validator_reconstructs_retained_transport_loss(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(shared, "_bounded_reconciliation_wait", lambda _delay: None)
    query = _query()
    result, output = _run(
        tmp_path,
        FakeTransport(lose_first_solve=True, commit_lost_solve=False),
        query=query,
    )

    assert result["classification"] == "INCONCLUSIVE_TRANSPORT_LOSS"
    assert _validate_offline(query, result, output) == result


def test_offline_validator_rejects_result_and_lifecycle_mutation(
    tmp_path: Path,
) -> None:
    query = _query()
    result, output = _run(tmp_path, FakeTransport(), query=query)
    bad_request = json.loads(json.dumps(result))
    bad_request["request_sha256"] = "0" * 64
    with pytest.raises(
        subject.CapConfigurationPiqdAdapterError,
        match="request digest",
    ):
        _validate_offline(query, bad_request, output)

    bad_lifecycle = json.loads(json.dumps(result))
    bad_lifecycle["session_lifecycle"]["close_observed_state"] = "absent"
    lifecycle_payload = stored_json_bytes(bad_lifecycle["session_lifecycle"])
    lifecycle_path = bad_lifecycle["artifacts"]["session_lifecycle"]["path"]
    retained_lifecycle = output / lifecycle_path
    retained_lifecycle.chmod(0o600)
    retained_lifecycle.write_bytes(lifecycle_payload)
    bad_lifecycle["artifacts"]["session_lifecycle"] = {
        "path": lifecycle_path,
        "bytes": len(lifecycle_payload),
        "sha256": _sha(lifecycle_payload),
    }
    with pytest.raises(
        subject.CapConfigurationPiqdAdapterError,
        match="close lifecycle",
    ):
        _validate_offline(query, bad_lifecycle, output)


def test_offline_validator_rejects_raw_values_tamper_and_unreferenced_files(
    tmp_path: Path,
) -> None:
    query = _query()
    result, output = _run(tmp_path, FakeTransport(), query=query)
    bad_values_binding = json.loads(json.dumps(result))
    bad_values_binding["cap_values_raw_sha256"] = "0" * 64
    with pytest.raises(
        subject.CapConfigurationPiqdAdapterError,
        match="cap values binding",
    ):
        _validate_offline(query, bad_values_binding, output)

    bad_descriptor = json.loads(json.dumps(result))
    bad_descriptor["artifacts"]["solve"]["sha256"] = "0" * 64
    with pytest.raises(
        subject.CapConfigurationPiqdAdapterError,
        match="solve disagrees with its descriptor",
    ):
        _validate_offline(query, bad_descriptor, output)

    (output / "unreferenced.json").write_bytes(b"{}\n")
    with pytest.raises(
        subject.CapConfigurationPiqdAdapterError,
        match="unreferenced files",
    ):
        _validate_offline(query, result, output)


def test_offline_validator_rejects_substituted_initial_or_final_lifecycle(
    tmp_path: Path,
) -> None:
    query = _query()
    result, output = _run(tmp_path, FakeTransport(), query=query)
    lifecycle_path = output / "cvc5.session-lifecycle.json"
    lifecycle = json.loads(lifecycle_path.read_bytes())

    bad_initial = json.loads(json.dumps(result))
    initial = dict(lifecycle)
    initial["request_id"] = str(uuid.UUID(int=8))
    initial_payload = stored_json_bytes(initial)
    lifecycle_path.chmod(0o600)
    lifecycle_path.write_bytes(initial_payload)
    bad_initial["artifacts"]["session_lifecycle"] = {
        "path": "cvc5.session-lifecycle.json",
        "bytes": len(initial_payload),
        "sha256": _sha(initial_payload),
    }
    with pytest.raises(
        subject.CapConfigurationPiqdAdapterError,
        match="lifecycle identity",
    ):
        _validate_offline(query, bad_initial, output)

    lifecycle_payload = stored_json_bytes(lifecycle)
    lifecycle_path.write_bytes(lifecycle_payload)
    bad_final = json.loads(json.dumps(result))
    final = dict(lifecycle)
    final["request_id"] = str(uuid.UUID(int=8))
    final_payload = stored_json_bytes(final)
    final_path = output / "cvc5.session-lifecycle-final.json"
    final_path.write_bytes(final_payload)
    bad_final["artifacts"]["final_session_lifecycle"] = {
        "path": "cvc5.session-lifecycle-final.json",
        "bytes": len(final_payload),
        "sha256": _sha(final_payload),
    }
    bad_final["artifacts"]["session_lifecycle"] = {
        "path": "cvc5.session-lifecycle.json",
        "bytes": len(lifecycle_payload),
        "sha256": _sha(lifecycle_payload),
    }
    with pytest.raises(
        subject.CapConfigurationPiqdAdapterError,
        match="failed offline validation",
    ):
        _validate_offline(query, bad_final, output)


def test_sat_replay_rejection_is_retained_not_promoted(tmp_path: Path) -> None:
    result, _ = _run(tmp_path, FakeTransport(values="((|x| 2))"))
    assert result["classification"] == "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED"
    assert result["cap_semantic_replay"]["outcome"] == "rejected"
    assert result["cap_semantic_replay"]["values_raw_sha256"] == _sha(b"((|x| 2))")


def test_same_id_same_digest_replays_after_lost_response_without_second_solve(
    tmp_path: Path,
) -> None:
    fake = FakeTransport(lose_first_solve=True)
    query = _query()
    result, output = _run(tmp_path, fake, query=query)
    solve_posts = [
        call for call in fake.calls if call[0] == "POST" and call[1].endswith("/solve")
    ]
    assert len(solve_posts) == 2 and solve_posts[0][2] == solve_posts[1][2]
    assert fake.actual_solves == 1
    assert result["request_replay_attempted"] is True
    assert result["request_replayed"] is True
    assert result["classification"] == "SAT_SEMANTICALLY_REPLAYED"
    assert _validate_offline(query, result, output) == result


def test_offline_validator_rejects_reconciled_solve_without_replay_proof(
    tmp_path: Path,
) -> None:
    query = _query()
    result, output = _run(tmp_path, FakeTransport(lose_first_solve=True), query=query)
    solve_path = output / result["artifacts"]["reconciled_solve"]["path"]
    solve = json.loads(solve_path.read_bytes())
    solve["replayed"] = False
    payload = stored_json_bytes(solve)
    solve_path.chmod(0o600)
    solve_path.write_bytes(payload)
    result["artifacts"]["reconciled_solve"] = {
        "path": solve_path.name,
        "bytes": len(payload),
        "sha256": _sha(payload),
    }

    with pytest.raises(subject.CapConfigurationPiqdAdapterError, match="replay proof"):
        _validate_offline(query, result, output)


def test_cap_adapter_forwards_explicit_safe_missing_session_resume_policy(
    tmp_path: Path,
) -> None:
    fake = FakeTransport()

    result, _ = _run(
        tmp_path,
        fake,
        resume_policy=subject.PIQD_RESUME_ALLOW_CREATE_IF_MISSING,
    )

    assert result["classification"] == "SAT_SEMANTICALLY_REPLAYED"
    assert result["session_lifecycle"]["resume_policy"] == (
        subject.PIQD_RESUME_ALLOW_CREATE_IF_MISSING
    )
    assert result["session_lifecycle"]["resumed_existing_session"] is False
    assert fake.actual_solves == 1


def test_transport_loss_without_receipt_is_inconclusive_and_no_fallback(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(shared, "_bounded_reconciliation_wait", lambda _delay: None)
    fake = FakeTransport(lose_first_solve=True, commit_lost_solve=False)
    result, _ = _run(tmp_path, fake)
    assert result["classification"] == "INCONCLUSIVE_TRANSPORT_LOSS"
    assert result["cap_semantic_replay"] is None
    assert fake.actual_solves == 0
    assert all(
        not (method == "POST" and path.endswith("/solve") and body is None)
        for method, path, body in fake.calls
    )


def test_changed_payload_conflict_and_transport_failure_raise(tmp_path: Path) -> None:
    conflict = FakeTransport(lose_first_solve=True, replay_conflict=True)
    with pytest.raises(subject.CapConfigurationPiqdAdapterError, match="failed closed"):
        _run(tmp_path, conflict)
    assert conflict.actual_solves == 1 and conflict.closed

    failed = FakeTransport(fail_create=True)
    with pytest.raises(subject.CapConfigurationPiqdAdapterError, match="failed closed"):
        _run(tmp_path / "failure", failed)
    assert failed.actual_solves == 0


def test_stdlib_transport_uses_solver_deadline_plus_response_margin() -> None:
    transport = subject.stdlib_piqd_transport("http://127.0.0.1:7272", timeout_ms=1_000)
    assert transport._timeout == shared.bounded_solve_http_timeout_s(1_000)
    with pytest.raises(subject.CapConfigurationPiqdAdapterError):
        subject.stdlib_piqd_transport("file:///tmp/piqd", timeout_ms=1_000)

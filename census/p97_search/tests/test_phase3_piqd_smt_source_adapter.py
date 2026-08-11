from __future__ import annotations

import hashlib
import json
import os
import uuid
from collections.abc import Mapping
from dataclasses import replace
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import phase3_piqd_smt_source_adapter as subject

_ABSENT = object()


def _canonical(value: object) -> bytes:
    return json.dumps(
        value,
        ensure_ascii=False,
        allow_nan=False,
        sort_keys=True,
        separators=(",", ":"),
    ).encode()


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _packet(
    root: Path,
    *,
    smt2: bytes | None = None,
    semantic_input: object | None = None,
) -> tuple[Path, bytes]:
    root.mkdir(parents=True)
    source = b"producer source bytes\x00\xff\n"
    original = smt2 or (
        b"; custody comment\r\n"
        b"(set-logic QF_LIA)\r\n"
        b"(declare-const gate Bool)\n"
        b"(declare-const x Int)\n"
        b"(assert (! (=> gate (= x 1)) :named source_guard))\n"
    )
    semantic = (
        {"bound": 1, "enabled": True, "labels": ["gate", None]}
        if semantic_input is None
        else semantic_input
    )
    (root / "producer.bin").write_bytes(source)
    (root / "query.smt2").write_bytes(original)
    descriptor = {
        "schema": subject.QUERY_SCHEMA,
        "producer": {"id": "test-producer", "version": "1.2.3"},
        "semantic_verifier": {"id": "test-replay", "version": "4"},
        "stage_id": "stage-7",
        "query_id": "query-11",
        "sources": [
            {"path": "producer.bin", "bytes": len(source), "sha256": _sha(source)}
        ],
        "semantic_input": semantic,
        "semantic_sha256": _sha(_canonical(semantic)),
        "original_smt2": {
            "path": "query.smt2",
            "bytes": len(original),
            "sha256": _sha(original),
        },
        "variables": [{"id": "x", "term": "x", "sort": "Int"}],
        "named_atoms": [{"id": "source-gate", "assumption_term": "gate"}],
        "solve": {
            "assumption_ids": ["source-gate"],
            "readback_variable_ids": ["x"],
            "include_model": True,
        },
        "solver_profile": {
            "schema": subject.SOLVER_PROFILE_SCHEMA,
            "solvers": ["z3", "cvc5"],
            "timeout_ms": 17_000,
        },
    }
    descriptor_path = root / "descriptor.json"
    descriptor_path.write_bytes(_canonical(descriptor) + b"\n")
    return descriptor_path, original


def _session(
    session_id: str,
    solver: str,
    label: str,
    *,
    state: str = "live",
    commands: int = 0,
    solves: int = 0,
    status: str | None = None,
    assumptions: list[str] | None = None,
    terminal_unsat: bool | None = None,
    journal_path: str | None = None,
) -> dict[str, object]:
    return {
        "id": session_id,
        "lane": "smt",
        "state": state,
        "solver_name": solver,
        "solver_sha256": _sha(f"binary:{solver}".encode()),
        "solver_signature": f"{solver} test-current-schema",
        "protocol_version": 1,
        "journal_path": journal_path
        if journal_path is not None
        else f"/daemon/sessions/{session_id}/journal.smt2",
        "created_at": 10,
        "updated_at": 10 + commands + solves,
        "clauses": commands,
        "max_var": 0,
        "solves": solves,
        "last_status": status,
        "declared_num_vars": None,
        "last_solve_index": None if solves == 0 else solves,
        "last_assumption_free": None if solves == 0 else not bool(assumptions),
        "last_terminal_unsat": None if solves == 0 else terminal_unsat,
        "label": label,
    }


class FakeCurrentPiqd:
    """In-memory implementation of only the current PIQD SMT session routes."""

    def __init__(
        self,
        statuses: Mapping[str, str] | None = None,
        *,
        unknown_interruption: str | None = None,
        exported_suffix: bytes = b"",
        receipt_digest_mismatch: bool = False,
        receipt_base_hash_mismatch: bool = False,
        receipts_path_mismatch: bool = False,
        noncanonical_journal_path: bool = False,
        untrusted_consistent_digest: bool = False,
        unsat_core: list[str] | None = None,
        unsat_terminal_mismatch: bool = False,
        receipt_terminal_mismatch: bool = False,
        solve_transport_loss: set[str] | None = None,
        transport_loss_commits: bool = True,
        transport_loss_visibility_delay: int = 0,
        malformed_create: bool = False,
        nonfresh_create: bool = False,
        reuse_session_id: bool = False,
        close_status_mismatch: bool = False,
        solve_replayed: object = False,
        effective_deadline_tamper: str | None = None,
    ) -> None:
        self.statuses = dict(statuses or {"z3": "SAT", "cvc5": "SAT"})
        self.unknown_interruption = unknown_interruption
        self.exported_suffix = exported_suffix
        self.receipt_digest_mismatch = receipt_digest_mismatch
        self.receipt_base_hash_mismatch = receipt_base_hash_mismatch
        self.receipts_path_mismatch = receipts_path_mismatch
        self.noncanonical_journal_path = noncanonical_journal_path
        self.untrusted_consistent_digest = untrusted_consistent_digest
        self.unsat_core = ["gate"] if unsat_core is None else unsat_core
        self.unsat_terminal_mismatch = unsat_terminal_mismatch
        self.receipt_terminal_mismatch = receipt_terminal_mismatch
        self.solve_transport_loss = solve_transport_loss or set()
        self.transport_loss_commits = transport_loss_commits
        self.transport_loss_visibility_delay = transport_loss_visibility_delay
        self.malformed_create = malformed_create
        self.nonfresh_create = nonfresh_create
        self.reuse_session_id = reuse_session_id
        self.close_status_mismatch = close_status_mismatch
        self.solve_replayed = solve_replayed
        self.effective_deadline_tamper = effective_deadline_tamper
        self.sessions: dict[str, dict[str, Any]] = {}
        self.calls: list[tuple[str, str, object]] = []
        self.active = 0
        self.max_active = 0
        self.created_solvers: list[str] = []
        self.deleted_session_ids: list[str] = []

    def request_json(
        self,
        method: str,
        path: str,
        body: Mapping[str, object] | None = None,
    ) -> subject.JsonResponse:
        snap = None if body is None else json.loads(_canonical(body))
        self.calls.append((method, path, snap))
        if method == "POST" and path == "/sessions":
            assert body is not None
            assert set(body) == {"solver", "lane", "label"}
            assert body["lane"] == "smt"
            solver = str(body["solver"])
            assert solver in {"z3", "cvc5"}
            session_id = str(
                uuid.UUID(int=1 if self.reuse_session_id else len(self.sessions) + 1)
            )
            data: dict[str, Any] = {
                "id": session_id,
                "solver": solver,
                "label": str(body["label"]),
                "commands": [],
                "journal": b"",
                "receipt": None,
                "solve_request": None,
                "answer": None,
                "pending_answer": None,
                "pending_receipt": None,
                "visibility_delay": 0,
            }
            self.sessions[session_id] = data
            self.active += 1
            self.max_active = max(self.max_active, self.active)
            self.created_solvers.append(solver)
            created = _session(
                session_id,
                solver,
                data["label"],
                solves=1 if self.nonfresh_create else 0,
                status="UNKNOWN" if self.nonfresh_create else None,
                journal_path=self._journal_path(session_id),
            )
            if self.malformed_create:
                created["unexpected"] = True
            return subject.JsonResponse(201, created)

        session_id, suffix = self._session_route(path)
        data = self.sessions[session_id]
        if method == "POST" and suffix == "/assert":
            assert body is not None
            assert set(body) == {"commands", "expect_commands"}
            assert body["expect_commands"] == 0
            commands = list(body["commands"])
            assert all(type(command) is str for command in commands)
            data["commands"] = commands
            data["journal"] = b"".join(command.encode() + b"\n" for command in commands)
            return subject.JsonResponse(
                200, {"added": len(commands), "commands": len(commands)}
            )
        if method == "POST" and suffix == "/solve":
            assert body is not None
            assert set(body) == {
                "assumptions",
                "timeout_ms",
                "include_model",
                "get_values",
            }
            assert body["include_model"] is True
            assert body["get_values"] == ["x"]
            data["solve_request"] = dict(body)
            answer = self._answer(data["solver"])
            digest = subject.piqd_result_digest(answer)
            if self.untrusted_consistent_digest:
                digest = "d" * 64
            response = {
                **answer,
                "solve_ms": 3,
                "solve_index": 1,
                "result_sha256": digest,
                "effective_deadline_ms": (
                    body["timeout_ms"] + subject.PIQD_EFFECTIVE_DEADLINE_GRACE_MS
                ),
            }
            if self.solve_replayed is not _ABSENT:
                response["replayed"] = self.solve_replayed
            terminal = answer.get("terminal_unsat")
            receipt = {
                "solve_index": 1,
                "base_commands": len(data["commands"]),
                "base_bytes": len(data["journal"]),
                "base_sha256": (
                    "e" * 64
                    if self.receipt_base_hash_mismatch
                    else _sha(data["journal"])
                ),
                "solver_signature": f"{data['solver']} test-current-schema",
                "solver_sha256": _sha(f"binary:{data['solver']}".encode()),
                "assumptions": list(body["assumptions"]),
                "timeout_ms": body["timeout_ms"],
                "effective_deadline_ms": (
                    body["timeout_ms"] + subject.PIQD_EFFECTIVE_DEADLINE_GRACE_MS
                ),
                "include_model": body["include_model"],
                "get_values": list(body["get_values"]),
                **answer,
                "solve_ms": 3,
                "result_sha256": ("f" * 64 if self.receipt_digest_mismatch else digest),
                "at": 14,
            }
            if self.effective_deadline_tamper == "response_missing":
                response.pop("effective_deadline_ms")
            elif self.effective_deadline_tamper == "response_extra":
                response["unexpected_deadline_field"] = 1
            elif self.effective_deadline_tamper == "response_bool":
                response["effective_deadline_ms"] = True
            elif self.effective_deadline_tamper == "response_float":
                response["effective_deadline_ms"] = float(
                    response["effective_deadline_ms"]
                )
            elif self.effective_deadline_tamper == "response_arithmetic":
                response["effective_deadline_ms"] += 1
            elif self.effective_deadline_tamper == "receipt_missing":
                receipt.pop("effective_deadline_ms")
            elif self.effective_deadline_tamper == "receipt_extra":
                receipt["unexpected_deadline_field"] = 1
            elif self.effective_deadline_tamper == "receipt_bool":
                receipt["effective_deadline_ms"] = True
            elif self.effective_deadline_tamper == "receipt_float":
                receipt["effective_deadline_ms"] = float(
                    receipt["effective_deadline_ms"]
                )
            elif self.effective_deadline_tamper == "receipt_arithmetic":
                receipt["effective_deadline_ms"] += 1
            elif self.effective_deadline_tamper == "crossed_response_receipt":
                receipt["timeout_ms"] += 1_000
                receipt["effective_deadline_ms"] += 1_000
            if self.receipt_terminal_mismatch and answer["status"] == "UNSAT":
                receipt["terminal_unsat"] = not receipt["terminal_unsat"]
            if (
                data["solver"] not in self.solve_transport_loss
                or self.transport_loss_commits
            ):
                if (
                    data["solver"] in self.solve_transport_loss
                    and self.transport_loss_visibility_delay > 0
                ):
                    data["pending_answer"] = answer
                    data["pending_receipt"] = receipt
                    data["visibility_delay"] = self.transport_loss_visibility_delay
                else:
                    data["answer"] = answer
                    data["receipt"] = receipt
            if data["solver"] in self.solve_transport_loss:
                raise subject.PiqdTransportLoss("simulated response loss")
            return subject.JsonResponse(200, response)
        if method == "GET" and suffix == "":
            assert body is None
            if data["pending_answer"] is not None:
                if data["visibility_delay"] == 0:
                    data["answer"] = data["pending_answer"]
                    data["receipt"] = data["pending_receipt"]
                    data["pending_answer"] = None
                    data["pending_receipt"] = None
                else:
                    data["visibility_delay"] -= 1
            answer = data["answer"] or {}
            return subject.JsonResponse(
                200,
                _session(
                    session_id,
                    data["solver"],
                    data["label"],
                    commands=len(data["commands"]),
                    solves=0 if not answer else 1,
                    status=answer.get("status"),
                    assumptions=(data["solve_request"] or {}).get("assumptions"),
                    terminal_unsat=answer.get("terminal_unsat"),
                    journal_path=self._journal_path(session_id),
                ),
            )
        if method == "GET" and suffix == "/receipts":
            assert body is None
            receipts = [] if data["receipt"] is None else [data["receipt"]]
            return subject.JsonResponse(
                200,
                {
                    "session_id": session_id,
                    "lane": "smt",
                    "journal_path": self._journal_path(session_id),
                    "receipts_path": (
                        f"/daemon/sessions/{session_id}/other-receipts.jsonl"
                        if self.receipts_path_mismatch
                        else f"/daemon/sessions/{session_id}/receipts.jsonl"
                    ),
                    "count": len(receipts),
                    "receipts": receipts,
                },
            )
        if method == "DELETE" and suffix == "":
            self.deleted_session_ids.append(session_id)
            answer = data["answer"] or {}
            status = answer.get("status")
            terminal = answer.get("terminal_unsat")
            self.active -= 1
            return subject.JsonResponse(
                200,
                _session(
                    session_id,
                    data["solver"],
                    data["label"],
                    state="closed",
                    commands=len(data["commands"]),
                    solves=0 if status is None else 1,
                    status=(
                        "UNKNOWN" if self.close_status_mismatch and status else status
                    ),
                    assumptions=(data["solve_request"] or {}).get("assumptions"),
                    terminal_unsat=terminal,
                    journal_path=self._journal_path(session_id),
                ),
            )
        raise AssertionError(f"adapter invented or misused PIQD route {method} {path}")

    def request_bytes(self, method: str, path: str) -> subject.BytesResponse:
        self.calls.append((method, path, None))
        session_id, suffix = self._session_route(path)
        assert method == "GET" and suffix == "/smt2"
        return subject.BytesResponse(
            200, self.sessions[session_id]["journal"] + self.exported_suffix
        )

    def _session_route(self, path: str) -> tuple[str, str]:
        parts = path.split("/")
        assert len(parts) in {3, 4} and parts[:2] == ["", "sessions"]
        session_id = parts[2]
        assert session_id in self.sessions
        suffix = "" if len(parts) == 3 else "/" + "/".join(parts[3:])
        return session_id, suffix

    def _journal_path(self, session_id: str) -> str:
        parent = "not-sessions" if self.noncanonical_journal_path else "sessions"
        return f"/daemon/{parent}/{session_id}/journal.smt2"

    def _answer(self, solver: str) -> dict[str, object]:
        status = self.statuses[solver]
        if status == "SAT":
            return {
                "status": "SAT",
                "model": "(model (define-fun x () Int 1))",
                "values": "((x 1))",
            }
        if status == "UNSAT":
            core = list(self.unsat_core)
            return {
                "status": "UNSAT",
                "core": core,
                "terminal_unsat": (
                    bool(core) if self.unsat_terminal_mismatch else not core
                ),
            }
        assert status == "UNKNOWN"
        answer: dict[str, object] = {"status": "UNKNOWN"}
        if self.unknown_interruption is not None:
            answer["interrupted_by"] = self.unknown_interruption
        return answer


def _load(
    tmp_path: Path, **packet_options: object
) -> tuple[subject.SourceSemanticQuery, bytes]:
    descriptor, original = _packet(tmp_path / "packet", **packet_options)
    return subject.load_source_semantic_query(
        descriptor.parent, descriptor.name
    ), original


def _single_solver_query(
    query: subject.SourceSemanticQuery, solver: str = "cvc5"
) -> subject.SourceSemanticQuery:
    descriptor = json.loads(_canonical(query.descriptor))
    descriptor["schema"] = "test-authenticated-single-solver-query/v1"
    descriptor["solver_profile"] = {
        "schema": "test-authenticated-single-solver-profile/v1",
        "solvers": [solver],
        "timeout_ms": 17_000,
    }
    return replace(
        query,
        descriptor=descriptor,
        descriptor_bytes=_canonical(descriptor) + b"\n",
    )


def _assert_empty_tombstones(parent: Path, *, minimum: int = 1) -> list[Path]:
    tombstones = list(parent.glob(".piqd-smt-tombstone-*"))
    assert len(tombstones) >= minimum
    assert all(path.is_dir() and not list(path.iterdir()) for path in tombstones)
    return tombstones


def _accepting_verifier(
    query: subject.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> subject.SemanticVerification:
    assert query.descriptor["semantic_input"]["bound"] == 1
    assert query.source_files == (
        subject.SourceSnapshot("producer.bin", b"producer source bytes\x00\xff\n"),
    )
    assert solver in {"z3", "cvc5"}
    assert model == "(model (define-fun x () Int 1))"
    assert values == "((x 1))"
    return subject.SemanticVerification(
        True, {"checked_assignment": {"x": 1}, "producer_semantics": True}
    )


def test_sat_custody_real_routes_sequential_sessions_and_semantic_replay(
    tmp_path: Path,
) -> None:
    query, original = _load(tmp_path)
    fake = FakeCurrentPiqd()
    output = tmp_path / "receipts"

    result = subject.run_source_semantic_query(query, output, fake, _accepting_verifier)

    assert fake.created_solvers == ["z3", "cvc5"]
    assert fake.max_active == 1 and fake.active == 0
    assert (output / "original.smt2").read_bytes() == original
    assert (output / "journal.smt2").read_bytes() == query.journal_smt2
    source_artifact = next(output.glob("source-0000-*.bin"))
    assert source_artifact.read_bytes() == query.source_files[0].payload
    assert all(
        (output / f"{solver}.smt2").read_bytes() == query.journal_smt2
        for solver in ("z3", "cvc5")
    )
    assert result["overall_status"] == "FINITE_DIAGNOSTIC_COMPLETE"
    assert [engine["effective_status"] for engine in result["engines"]] == [
        "SAT_SEMANTICALLY_REPLAYED",
        "SAT_SEMANTICALLY_REPLAYED",
    ]
    assert result["claims"] == {
        "source_entitlement": False,
        "theorem": False,
        "universal": False,
        "lean": False,
        "euclidean": False,
    }
    manifest = json.loads((output / "source-manifest.json").read_bytes())
    assert [
        {key: entry[key] for key in ("path", "bytes", "sha256")}
        for entry in manifest["sources"]
    ] == query.descriptor["sources"]
    assert manifest["sources"][0]["custody_artifact"] == source_artifact.name
    assert manifest["semantic_input"] == query.descriptor["semantic_input"]
    assert manifest["semantic_sha256"] == query.descriptor["semantic_sha256"]
    assert manifest["original_smt2"] == {
        "path": "query.smt2",
        "bytes": len(original),
        "sha256": _sha(original),
    }
    called_suffixes = [path.rsplit("/", 1)[-1] for _, path, _ in fake.calls]
    assert "model" not in called_suffixes
    assert set(called_suffixes) <= {
        "sessions",
        "assert",
        "solve",
        "smt2",
        "receipts",
        *fake.sessions,
    }
    expected_deadline = 17_000 + subject.PIQD_EFFECTIVE_DEADLINE_GRACE_MS
    for solver in ("z3", "cvc5"):
        solve = json.loads((output / f"{solver}.solve.json").read_bytes())
        receipt = json.loads((output / f"{solver}.receipts.json").read_bytes())[
            "receipts"
        ][0]
        assert solve["effective_deadline_ms"] == expected_deadline
        assert receipt["effective_deadline_ms"] == expected_deadline


def test_bounded_http_timeout_is_strictly_above_effective_deadline() -> None:
    timeout_ms = 20_000
    effective = subject.effective_deadline_ms(timeout_ms)
    http_timeout_ms = subject.bounded_solve_http_timeout_s(timeout_ms) * 1000
    assert effective == 50_000
    assert http_timeout_ms == 55_000
    assert http_timeout_ms > effective


@pytest.mark.parametrize("invalid", [True, 20_000.0, 0, -1])
def test_bounded_http_timeout_rejects_nonexact_or_unbounded_limits(
    invalid: object,
) -> None:
    with pytest.raises(subject.SmtSourceAdapterError, match="exact integer"):
        subject.bounded_solve_http_timeout_s(invalid)


def test_public_authenticated_single_solver_boundary_binds_exact_selection(
    tmp_path: Path,
) -> None:
    generic, _ = _load(tmp_path)
    query = _single_solver_query(generic)
    fake = FakeCurrentPiqd()
    artifact_root = tmp_path / "single-solver-artifacts"
    artifact_root.mkdir()
    output_fd = os.open(
        artifact_root,
        os.O_RDONLY | os.O_DIRECTORY | getattr(os, "O_NOFOLLOW", 0),
    )
    try:
        engine = subject.run_authenticated_single_solver_query(
            query,
            solver="cvc5",
            descriptor_schema="test-authenticated-single-solver-query/v1",
            solver_profile_schema="test-authenticated-single-solver-profile/v1",
            authenticated_journal_commands=query.journal_commands,
            transport=fake,
            semantic_verifier=_accepting_verifier,
            output_fd=output_fd,
        )
    finally:
        os.close(output_fd)
    assert engine["effective_status"] == "SAT_SEMANTICALLY_REPLAYED"
    assert fake.created_solvers == ["cvc5"]
    assert fake.active == 0

    crossed = FakeCurrentPiqd()
    with pytest.raises(subject.SmtSourceAdapterError, match="must run z3"):
        subject.run_authenticated_single_solver_query(
            query,
            solver="z3",
            descriptor_schema="test-authenticated-single-solver-query/v1",
            solver_profile_schema="test-authenticated-single-solver-profile/v1",
            authenticated_journal_commands=query.journal_commands,
            transport=crossed,
            semantic_verifier=_accepting_verifier,
            output_fd=-1,
        )
    assert crossed.calls == []


@pytest.mark.parametrize(
    ("solve_replayed", "present"),
    [(_ABSENT, False), (False, True)],
    ids=("old-daemon-absent", "restarted-daemon-false"),
)
def test_solve_replayed_compatibility_preserves_digest_and_receipts(
    tmp_path: Path, solve_replayed: object, present: bool
) -> None:
    query, _ = _load(tmp_path)
    output = tmp_path / "receipts"
    result = subject.run_source_semantic_query(
        query,
        output,
        FakeCurrentPiqd(solve_replayed=solve_replayed),
        _accepting_verifier,
    )

    for engine in result["engines"]:
        solver = engine["solver"]
        solve = json.loads((output / f"{solver}.solve.json").read_bytes())
        assert ("replayed" in solve) is present
        if present:
            assert solve["replayed"] is False
        assert engine["result_sha256"] == subject.piqd_result_digest(solve)
        receipt_envelope = json.loads((output / f"{solver}.receipts.json").read_bytes())
        assert "replayed" not in receipt_envelope["receipts"][0]


class _BooleanImpostor(int):
    pass


@pytest.mark.parametrize(
    ("solve_replayed", "message"),
    [
        (True, "exact false Boolean"),
        (0, "exact false Boolean"),
        (1, "exact false Boolean"),
        ("false", "exact false Boolean"),
        (None, "exact false Boolean"),
        (_BooleanImpostor(0), "non-builtin JSON value"),
    ],
    ids=("true", "zero", "one", "text", "null", "subclass"),
)
def test_solve_replayed_rejects_true_and_type_attacks(
    tmp_path: Path, solve_replayed: object, message: str
) -> None:
    query, _ = _load(tmp_path)
    output = tmp_path / "receipts"
    fake = FakeCurrentPiqd(solve_replayed=solve_replayed)
    with pytest.raises(subject.SmtSourceAdapterError, match=message):
        subject.run_source_semantic_query(query, output, fake, _accepting_verifier)
    assert fake.active == 0
    assert not output.exists()


@pytest.mark.parametrize(
    ("tamper", "message"),
    [
        ("response_missing", "unexpected keys"),
        ("response_extra", "unexpected keys"),
        ("response_bool", "exact integer"),
        ("response_float", "non-builtin JSON value"),
        ("response_arithmetic", r"request timeout_ms \+ 30000"),
        ("receipt_missing", "unexpected keys"),
        ("receipt_extra", "unexpected keys"),
        ("receipt_bool", "exact integer"),
        ("receipt_float", "non-builtin JSON value"),
        ("receipt_arithmetic", r"receipt timeout_ms \+ 30000"),
        ("crossed_response_receipt", "solve response disagree"),
    ],
)
def test_effective_deadline_schema_and_cross_binding_fail_closed(
    tmp_path: Path, tamper: str, message: str
) -> None:
    query, _ = _load(tmp_path)
    fake = FakeCurrentPiqd(effective_deadline_tamper=tamper)
    output = tmp_path / tamper
    with pytest.raises(subject.SmtSourceAdapterError, match=message):
        subject.run_source_semantic_query(query, output, fake, _accepting_verifier)
    assert fake.active == 0
    assert not output.exists()


def test_unsat_core_is_renamed_to_unsat_assumptions_with_source_provenance(
    tmp_path: Path,
) -> None:
    query, _ = _load(tmp_path)
    fake = FakeCurrentPiqd({"z3": "UNSAT", "cvc5": "UNSAT"})

    def verifier(*_args: object) -> subject.SemanticVerification:
        raise AssertionError("UNSAT must not invoke SAT semantic replay")

    result = subject.run_source_semantic_query(
        query, tmp_path / "receipts", fake, verifier
    )

    assert result["overall_status"] == "FINITE_DIAGNOSTIC_COMPLETE"
    for engine in result["engines"]:
        assert "core_provenance" not in engine
        assert engine["effective_status"] == "UNSAT_DISCOVERY_ONLY"
        assert engine["unsat_assumptions"] == {
            "basis": "get-unsat-assumptions",
            "named_core_support": False,
            "daemon_field": "core",
            "assumption_terms": ["gate"],
            "source_atom_ids": ["source-gate"],
            "terminal_unsat": False,
        }


def test_unknown_and_semantic_verifier_failure_downgrade(tmp_path: Path) -> None:
    query, _ = _load(tmp_path)
    unknown = FakeCurrentPiqd(
        {"z3": "UNKNOWN", "cvc5": "UNKNOWN"},
        unknown_interruption="daemon_deadline",
    )
    unknown_result = subject.run_source_semantic_query(
        query, tmp_path / "unknown", unknown, _accepting_verifier
    )
    assert unknown_result["overall_status"] == "INCONCLUSIVE"
    assert all(
        engine["effective_status"] == "INCONCLUSIVE_UNKNOWN"
        for engine in unknown_result["engines"]
    )

    def broken(
        _query: subject.SourceSemanticQuery,
        _solver: str,
        _model: str,
        _values: str | None,
    ) -> subject.SemanticVerification:
        raise ValueError("producer-side replay failed")

    failed = subject.run_source_semantic_query(
        query, tmp_path / "failed", FakeCurrentPiqd(), broken
    )
    assert failed["overall_status"] == "INCONCLUSIVE"
    assert all(
        engine["effective_status"] == "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE"
        and engine["semantic_replay"]["failure"] == "ValueError"
        for engine in failed["engines"]
    )

    def reject(
        _query: subject.SourceSemanticQuery,
        _solver: str,
        _model: str,
        _values: str | None,
    ) -> subject.SemanticVerification:
        return subject.SemanticVerification(False, {"reason": "domain mismatch"})

    rejected = subject.run_source_semantic_query(
        query, tmp_path / "rejected", FakeCurrentPiqd(), reject
    )
    assert rejected["overall_status"] == "INCONCLUSIVE"
    assert all(
        engine["effective_status"] == "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED"
        and engine["semantic_replay"]["accepted"] is False
        for engine in rejected["engines"]
    )


def test_consistent_daemon_digest_is_gate_and_local_recomputation_is_advisory(
    tmp_path: Path,
) -> None:
    query, _ = _load(tmp_path)
    result = subject.run_source_semantic_query(
        query,
        tmp_path / "receipts",
        FakeCurrentPiqd(untrusted_consistent_digest=True),
        _accepting_verifier,
    )
    assert all(
        engine["result_sha256"] == "d" * 64
        and engine["result_digest_advisory"]["matches_daemon"] is False
        for engine in result["engines"]
    )


@pytest.mark.parametrize(
    ("fake", "message"),
    [
        (FakeCurrentPiqd(exported_suffix=b"\n"), "GET /smt2 differs"),
        (FakeCurrentPiqd(receipt_digest_mismatch=True), "receipt and solve"),
        (FakeCurrentPiqd(receipt_base_hash_mismatch=True), "cross-binding"),
        (FakeCurrentPiqd(receipts_path_mismatch=True), "receipts path"),
        (
            FakeCurrentPiqd(noncanonical_journal_path=True),
            "canonical PIQD SMT session path",
        ),
        (
            FakeCurrentPiqd(
                {"z3": "UNSAT", "cvc5": "UNSAT"},
                receipt_terminal_mismatch=True,
            ),
            "receipt terminal_unsat disagrees",
        ),
        (
            FakeCurrentPiqd(
                {"z3": "UNSAT", "cvc5": "UNSAT"},
                unsat_terminal_mismatch=True,
            ),
            "solve terminal_unsat disagrees",
        ),
        (
            FakeCurrentPiqd(
                {"z3": "UNSAT", "cvc5": "UNSAT"}, unsat_core=["not-requested"]
            ),
            "unrequested terms",
        ),
    ],
)
def test_cross_binding_and_assumption_provenance_fail_closed(
    tmp_path: Path, fake: FakeCurrentPiqd, message: str
) -> None:
    query, _ = _load(tmp_path)
    with pytest.raises(subject.SmtSourceAdapterError, match=message):
        subject.run_source_semantic_query(
            query, tmp_path / "receipts", fake, _accepting_verifier
        )
    assert fake.active == 0


@pytest.mark.parametrize(
    ("smt2", "message"),
    [
        (b"(declare-const x Int)\n(check-sat)\n", "not a PIQD state command"),
        (b"(set-option :produce-models true)\n", "reserved by PIQD"),
        (b"(get-model)\n", "not a PIQD state command"),
    ],
)
def test_source_must_be_only_whitelisted_state_commands(
    tmp_path: Path, smt2: bytes, message: str
) -> None:
    descriptor, _ = _packet(tmp_path / "packet", smt2=smt2)
    with pytest.raises(subject.SmtSourceAdapterError, match=message):
        subject.load_source_semantic_query(descriptor.parent, descriptor.name)


def test_exact_command_spelling_is_lf_journalized_without_outer_comments() -> None:
    original = (
        b"; outer\r\n  (set-logic   QF_LIA) ; between\r\n"
        b"(assert\n ; inner retained exactly\n (= |x y| 1))\r\n"
    )
    commands, journal = subject.normalize_state_journal(original)
    assert commands == (
        "(set-logic   QF_LIA)",
        "(assert\n ; inner retained exactly\n (= |x y| 1))",
    )
    assert journal == (
        b"(set-logic   QF_LIA)\n(assert\n ; inner retained exactly\n (= |x y| 1))\n"
    )


def test_descriptor_exact_types_hashes_nofollow_and_create_once(tmp_path: Path) -> None:
    descriptor, _ = _packet(tmp_path / "float", semantic_input={"bound": 1.5})
    with pytest.raises(subject.SmtSourceAdapterError, match="non-builtin JSON value"):
        subject.load_source_semantic_query(descriptor.parent, descriptor.name)

    descriptor, _ = _packet(tmp_path / "hash")
    (descriptor.parent / "producer.bin").write_bytes(b"changed")
    with pytest.raises(subject.SmtSourceAdapterError, match="source hash mismatch"):
        subject.load_source_semantic_query(descriptor.parent, descriptor.name)

    descriptor, _ = _packet(tmp_path / "link")
    real = descriptor.parent / "producer.bin"
    real.rename(descriptor.parent / "producer-real.bin")
    os.symlink("producer-real.bin", real)
    with pytest.raises(subject.SmtSourceAdapterError, match="without following links"):
        subject.load_source_semantic_query(descriptor.parent, descriptor.name)

    descriptor, _ = _packet(tmp_path / "root-real")
    root_link = tmp_path / "root-link"
    os.symlink(descriptor.parent, root_link)
    with pytest.raises(subject.SmtSourceAdapterError, match="artifact root"):
        subject.load_source_semantic_query(root_link, descriptor.name)

    query, _ = _load(tmp_path / "once")
    output = tmp_path / "once-output"
    subject.run_source_semantic_query(
        query, output, FakeCurrentPiqd(), _accepting_verifier
    )
    with pytest.raises(subject.SmtSourceAdapterError, match="already exists"):
        subject.run_source_semantic_query(
            query, output, FakeCurrentPiqd(), _accepting_verifier
        )


@pytest.mark.parametrize(
    "artifact",
    ["descriptor.json", "query.smt2", "producer.bin"],
    ids=("descriptor", "original-smt2", "source"),
)
def test_offline_capture_rejects_hardlinked_regular_files(
    tmp_path: Path, artifact: str
) -> None:
    descriptor, _ = _packet(tmp_path / "packet")
    os.link(descriptor.parent / artifact, tmp_path / f"attacker-{artifact}")

    with pytest.raises(subject.SmtSourceAdapterError, match="hard-linked"):
        subject.load_source_semantic_query(descriptor.parent, descriptor.name)


@pytest.mark.parametrize(
    ("mutation", "message"),
    [
        (
            lambda query: replace(
                query,
                descriptor={**query.descriptor, "query_id": "fabricated"},
            ),
            "descriptor disagrees",
        ),
        (
            lambda query: replace(query, original_smt2=query.original_smt2 + b" "),
            "original SMT2 custody",
        ),
        (
            lambda query: replace(query, journal_smt2=query.journal_smt2 + b" "),
            "journal cross-binding",
        ),
        (
            lambda query: replace(
                query,
                source_files=(subject.SourceSnapshot("producer.bin", b"changed"),),
            ),
            "source custody",
        ),
    ],
)
def test_public_boundary_reconstructs_and_rejects_mutated_queries(
    tmp_path: Path,
    mutation: object,
    message: str,
) -> None:
    query, _ = _load(tmp_path)
    malformed = mutation(query)  # type: ignore[operator]
    output = tmp_path / "receipts"
    with pytest.raises(subject.SmtSourceAdapterError, match=message):
        subject.run_source_semantic_query(
            malformed, output, FakeCurrentPiqd(), _accepting_verifier
        )
    assert not output.exists()


def test_source_snapshot_is_archived_and_replayed_without_reopening(
    tmp_path: Path,
) -> None:
    query, _ = _load(tmp_path)
    (tmp_path / "packet" / "producer.bin").write_bytes(b"changed after capture")
    seen: list[bytes] = []

    def verifier(
        verifier_query: subject.SourceSemanticQuery,
        _solver: str,
        _model: str,
        _values: str | None,
    ) -> subject.SemanticVerification:
        seen.append(verifier_query.source_files[0].payload)
        verifier_query.descriptor["semantic_input"]["bound"] = 999
        return subject.SemanticVerification(True, {"snapshot": True})

    output = tmp_path / "receipts"
    subject.run_source_semantic_query(query, output, FakeCurrentPiqd(), verifier)
    expected = b"producer source bytes\x00\xff\n"
    assert seen == [expected, expected]
    assert next(output.glob("source-0000-*.bin")).read_bytes() == expected


def test_nonfinite_json_and_non_builtin_daemon_values_fail_closed(
    tmp_path: Path,
) -> None:
    descriptor, _ = _packet(tmp_path / "nan")
    descriptor.write_bytes(
        descriptor.read_bytes().replace(b'"bound":1', b'"bound":NaN')
    )
    with pytest.raises(subject.SmtSourceAdapterError, match="strict UTF-8 JSON"):
        subject.load_source_semantic_query(descriptor.parent, descriptor.name)

    class FloatResponse(FakeCurrentPiqd):
        def request_json(
            self,
            method: str,
            path: str,
            body: Mapping[str, object] | None = None,
        ) -> subject.JsonResponse:
            response = super().request_json(method, path, body)
            if method == "POST" and path == "/sessions":
                response.body["created_at"] = 1.5  # type: ignore[index]
            return response

    query, _ = _load(tmp_path / "daemon")
    with pytest.raises(subject.SmtSourceAdapterError, match="non-builtin JSON value"):
        subject.run_source_semantic_query(
            query, tmp_path / "daemon-output", FloatResponse(), _accepting_verifier
        )
    assert not (tmp_path / "daemon-output").exists()


@pytest.mark.parametrize("malformed", [True, False])
def test_bad_create_is_deleted_once_and_publication_is_rolled_back(
    tmp_path: Path, malformed: bool
) -> None:
    query, _ = _load(tmp_path)
    fake = FakeCurrentPiqd(
        malformed_create=malformed,
        nonfresh_create=not malformed,
    )
    output = tmp_path / "receipts"
    with pytest.raises(subject.SmtSourceAdapterError):
        subject.run_source_semantic_query(query, output, fake, _accepting_verifier)
    assert fake.deleted_session_ids == [str(uuid.UUID(int=1))]
    assert fake.active == 0
    assert not output.exists()
    assert not list(tmp_path.glob(".piqd-smt-staging-*"))
    _assert_empty_tombstones(tmp_path)


def test_session_identity_uniqueness_and_close_state_are_bound(tmp_path: Path) -> None:
    query, _ = _load(tmp_path)
    for name, fake, message in (
        ("reuse", FakeCurrentPiqd(reuse_session_id=True), "reused a session"),
        ("close", FakeCurrentPiqd(close_status_mismatch=True), "solve state"),
    ):
        output = tmp_path / name
        with pytest.raises(subject.SmtSourceAdapterError, match=message):
            subject.run_source_semantic_query(query, output, fake, _accepting_verifier)
        assert fake.active == 0
        assert not output.exists()


@pytest.mark.parametrize("committed", [True, False])
def test_solve_response_loss_reconciles_receipt_or_downgrades_and_closes(
    tmp_path: Path, committed: bool, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(subject, "_bounded_reconciliation_wait", lambda _: None)
    query, _ = _load(tmp_path)
    fake = FakeCurrentPiqd(
        solve_transport_loss={"z3"}, transport_loss_commits=committed
    )
    output = tmp_path / "receipts"
    result = subject.run_source_semantic_query(query, output, fake, _accepting_verifier)
    z3 = result["engines"][0]
    assert z3["response_lost"] is True
    assert z3["reconciled_from_receipt"] is committed
    assert z3["effective_status"] == (
        "SAT_SEMANTICALLY_REPLAYED" if committed else "INCONCLUSIVE_TRANSPORT_LOSS"
    )
    expected_attempts = (
        1 if committed else len(subject.TRANSPORT_RECONCILIATION_DELAYS_S)
    )
    assert z3["reconciliation_attempts"] == expected_attempts
    assert z3["result_sha256"] is not None if committed else z3["result_sha256"] is None
    if committed:
        reconciled = json.loads((output / "z3.reconciled-solve.json").read_bytes())
        receipts = json.loads((output / "z3.receipts.json").read_bytes())
        assert "replayed" not in reconciled
        assert "replayed" not in receipts["receipts"][0]
        assert z3["result_sha256"] == subject.piqd_result_digest(reconciled)
    assert fake.active == 0
    assert len(fake.deleted_session_ids) == 2
    z3_id = str(uuid.UUID(int=1))
    assert (
        sum(
            method == "POST" and path == f"/sessions/{z3_id}/solve"
            for method, path, _ in fake.calls
        )
        == 1
    )
    assert fake.deleted_session_ids.count(z3_id) == 1
    assert (
        sum(
            method == "GET" and path == f"/sessions/{z3_id}"
            for method, path, _ in fake.calls
        )
        == expected_attempts
    )


def test_response_loss_waits_for_delayed_unknown_receipt_without_second_solve(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    query, _ = _load(tmp_path)
    waits: list[float] = []
    monkeypatch.setattr(subject, "_bounded_reconciliation_wait", waits.append)
    fake = FakeCurrentPiqd(
        statuses={"z3": "UNKNOWN", "cvc5": "SAT"},
        unknown_interruption="daemon_deadline",
        solve_transport_loss={"z3"},
        transport_loss_visibility_delay=1,
    )

    result = subject.run_source_semantic_query(
        query, tmp_path / "delayed-receipt", fake, _accepting_verifier
    )

    z3 = result["engines"][0]
    assert z3["raw_status"] == "UNKNOWN"
    assert z3["effective_status"] == "INCONCLUSIVE_UNKNOWN"
    assert z3["response_lost"] is True
    assert z3["reconciled_from_receipt"] is True
    assert z3["reconciliation_attempts"] == 2
    assert waits == [subject.TRANSPORT_RECONCILIATION_DELAYS_S[1]]
    z3_id = str(uuid.UUID(int=1))
    assert (
        sum(
            method == "POST" and path == f"/sessions/{z3_id}/solve"
            for method, path, _ in fake.calls
        )
        == 1
    )
    assert fake.deleted_session_ids.count(z3_id) == 1
    receipt = json.loads(
        (tmp_path / "delayed-receipt" / "z3.receipts.json").read_bytes()
    )["receipts"][0]
    assert receipt["status"] == "UNKNOWN"
    assert receipt["interrupted_by"] == "daemon_deadline"


def test_private_staging_rolls_back_and_atomic_publication_resists_races(
    tmp_path: Path,
) -> None:
    query, _ = _load(tmp_path)
    output = tmp_path / "receipts"
    fake = FakeCurrentPiqd(receipt_digest_mismatch=True)
    with pytest.raises(subject.SmtSourceAdapterError, match="receipt and solve"):
        subject.run_source_semantic_query(query, output, fake, _accepting_verifier)
    assert not output.exists()
    assert not list(tmp_path.glob(".piqd-smt-staging-*"))
    _assert_empty_tombstones(tmp_path)
    subject.run_source_semantic_query(
        query, output, FakeCurrentPiqd(), _accepting_verifier
    )
    assert (output / "result.json").is_file()

    raced_output = tmp_path / "raced"
    raced = False

    def racing_verifier(
        *_args: object,
    ) -> subject.SemanticVerification:
        nonlocal raced
        if not raced:
            raced_output.mkdir()
            raced = True
        return subject.SemanticVerification(True, {"accepted": True})

    with pytest.raises(subject.SmtSourceAdapterError, match="already exists"):
        subject.run_source_semantic_query(
            query, raced_output, FakeCurrentPiqd(), racing_verifier
        )
    assert raced_output.is_dir() and not list(raced_output.iterdir())
    assert not list(tmp_path.glob(".piqd-smt-staging-*"))


def test_immutable_writer_rejects_hardlink_before_creation_verification(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    staging = tmp_path / "private-staging"
    staging.mkdir()
    staging_fd = os.open(staging, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
    alias = tmp_path / "attacker-alias"
    original_write_all = subject._write_all

    def linking_write_all(descriptor: int, payload: bytes) -> None:
        original_write_all(descriptor, payload)
        os.link(staging / "artifact.bin", alias)

    monkeypatch.setattr(subject, "_write_all", linking_write_all)
    try:
        with pytest.raises(
            subject.SmtSourceAdapterError,
            match="immutable output verification failed",
        ):
            subject._write_immutable(staging_fd, "artifact.bin", b"custody bytes")
    finally:
        os.close(staging_fd)
    assert alias.read_bytes() == b"custody bytes"


def test_final_publication_rejects_hardlink_added_after_initial_verification(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    query, _ = _load(tmp_path)
    output = tmp_path / "receipts"
    alias = tmp_path / "attacker-alias"
    original_rename = subject._rename_directory_noreplace
    linked = False

    def linking_rename(root_fd: int, source: str, target: str) -> None:
        nonlocal linked
        original_rename(root_fd, source, target)
        if not linked and target == output.name:
            published_fd = os.open(
                target,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=root_fd,
            )
            try:
                os.link(
                    "descriptor.json",
                    alias.name,
                    src_dir_fd=published_fd,
                    dst_dir_fd=root_fd,
                )
            finally:
                os.close(published_fd)
            linked = True

    monkeypatch.setattr(subject, "_rename_directory_noreplace", linking_rename)
    with pytest.raises(subject.SmtSourceAdapterError, match="hard-linked file"):
        subject.run_source_semantic_query(
            query, output, FakeCurrentPiqd(), _accepting_verifier
        )
    assert linked
    assert alias.read_bytes().startswith(b'{"named_atoms"')
    assert not output.exists()
    _assert_empty_tombstones(tmp_path)


def test_cleanup_removes_nondirectory_injections_without_following_links(
    tmp_path: Path,
) -> None:
    query, _ = _load(tmp_path)
    output = tmp_path / "receipts"
    target = tmp_path / "outside.txt"
    target.write_text("preserve me")
    injected = False

    def injecting_verifier(*_args: object) -> subject.SemanticVerification:
        nonlocal injected
        if not injected:
            staging = next(tmp_path.glob(".piqd-smt-staging-*"))
            os.symlink(target, staging / "hostile-link")
            os.mkfifo(staging / "hostile-fifo")
            injected = True
        return subject.SemanticVerification(True, {"accepted": True})

    with pytest.raises(subject.SmtSourceAdapterError, match="non-file"):
        subject.run_source_semantic_query(
            query, output, FakeCurrentPiqd(), injecting_verifier
        )
    assert target.read_text() == "preserve me"
    assert not output.exists()
    assert not list(tmp_path.glob(".piqd-smt-staging-*"))
    _assert_empty_tombstones(tmp_path)


def test_cleanup_finds_renamed_staging_and_preserves_rebound_entry(
    tmp_path: Path,
) -> None:
    query, _ = _load(tmp_path)
    output = tmp_path / "receipts"
    moved = tmp_path / "attacker-moved-staging"
    rebound: Path | None = None

    def rebinding_verifier(*_args: object) -> subject.SemanticVerification:
        nonlocal rebound
        if rebound is None:
            staging = next(tmp_path.glob(".piqd-smt-staging-*"))
            staging.rename(moved)
            staging.mkdir()
            rebound = staging
        return subject.SemanticVerification(True, {"accepted": True})

    with pytest.raises(subject.SmtSourceAdapterError, match="identity changed"):
        subject.run_source_semantic_query(
            query, output, FakeCurrentPiqd(), rebinding_verifier
        )
    assert rebound is not None and rebound.is_dir() and not list(rebound.iterdir())
    assert not moved.exists()
    assert not output.exists()
    _assert_empty_tombstones(tmp_path)


def test_cleanup_rescans_when_staging_moves_during_quarantine(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    query, _ = _load(tmp_path)
    output = tmp_path / "receipts"
    moved_name = "attacker-moved-during-quarantine"
    original_rename = subject._rename_directory_noreplace
    raced = False

    def racing_rename(root_fd: int, source: str, target: str) -> None:
        nonlocal raced
        if not raced and target.startswith(".piqd-smt-tombstone-"):
            os.rename(
                source,
                moved_name,
                src_dir_fd=root_fd,
                dst_dir_fd=root_fd,
            )
            raced = True
            raise FileNotFoundError(source)
        original_rename(root_fd, source, target)

    monkeypatch.setattr(subject, "_rename_directory_noreplace", racing_rename)
    with pytest.raises(subject.SmtSourceAdapterError, match="receipt and solve"):
        subject.run_source_semantic_query(
            query,
            output,
            FakeCurrentPiqd(receipt_digest_mismatch=True),
            _accepting_verifier,
        )
    assert raced
    assert not (tmp_path / moved_name).exists()
    assert not output.exists()
    assert not list(tmp_path.glob(".piqd-smt-staging-*"))
    _assert_empty_tombstones(tmp_path)


def test_cleanup_allocates_at_most_one_tombstone_under_repeated_rebind_race(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    query, _ = _load(tmp_path)
    output = tmp_path / "receipts"
    original_rename = subject._rename_directory_noreplace
    attempts = 0
    moved_originals: list[Path] = []

    def repeatedly_rebinding_rename(root_fd: int, source: str, target: str) -> None:
        nonlocal attempts
        original_rename(root_fd, source, target)
        if not target.startswith(".piqd-smt-tombstone-"):
            return
        attempts += 1
        moved_name = f"attacker-held-original-{attempts}"
        os.rename(
            target,
            moved_name,
            src_dir_fd=root_fd,
            dst_dir_fd=root_fd,
        )
        os.mkdir(target, 0o700, dir_fd=root_fd)
        (tmp_path / target / "replacement-sentinel").write_bytes(b"preserve")
        os.mkdir(source, 0o700, dir_fd=root_fd)
        moved_originals.append(tmp_path / moved_name)

    monkeypatch.setattr(
        subject, "_rename_directory_noreplace", repeatedly_rebinding_rename
    )
    with pytest.raises(
        subject.SmtSourceAdapterError,
        match="identity changed after quarantine; preserved fail-closed",
    ):
        subject.run_source_semantic_query(
            query,
            output,
            FakeCurrentPiqd(receipt_digest_mismatch=True),
            _accepting_verifier,
        )
    assert attempts == 1
    tombstones = list(tmp_path.glob(".piqd-smt-tombstone-*"))
    assert len(tombstones) == 1
    assert (tombstones[0] / "replacement-sentinel").read_bytes() == b"preserve"
    assert len(moved_originals) == 1 and moved_originals[0].is_dir()
    assert not output.exists()


def test_cleanup_preserves_directory_rebound_during_child_unlink(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    query, _ = _load(tmp_path)
    output = tmp_path / "receipts"
    original_unlink = os.unlink
    raced = False

    def racing_unlink(path: str | bytes, *, dir_fd: int | None = None) -> None:
        nonlocal raced
        if not raced and dir_fd is not None:
            original_unlink(path, dir_fd=dir_fd)
            os.mkdir(path, 0o700, dir_fd=dir_fd)
            raced = True
        original_unlink(path, dir_fd=dir_fd)

    monkeypatch.setattr(os, "unlink", racing_unlink)
    with pytest.raises(subject.SmtSourceAdapterError, match="hostile directories"):
        subject.run_source_semantic_query(
            query,
            output,
            FakeCurrentPiqd(receipt_digest_mismatch=True),
            _accepting_verifier,
        )
    assert raced
    assert not output.exists()
    cleanup = list(tmp_path.glob(".piqd-smt-tombstone-*"))
    assert len(cleanup) == 1
    rebound = list(cleanup[0].iterdir())
    assert len(rebound) == 1 and rebound[0].is_dir()


def test_final_cleanup_rebind_seam_never_deletes_replacement(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    query, _ = _load(tmp_path)
    output = tmp_path / "receipts"
    moved_original = tmp_path / "held-original-after-final-check"
    original_preserve = subject._preserve_cleanup_tombstone
    replacement_name: str | None = None

    def rebind_after_final_identity_check(
        staging: subject._OutputStaging, cleanup_name: str
    ) -> None:
        nonlocal replacement_name
        original_preserve(staging, cleanup_name)
        os.rename(
            cleanup_name,
            moved_original.name,
            src_dir_fd=staging.parent_fd,
            dst_dir_fd=staging.parent_fd,
        )
        os.mkdir(cleanup_name, 0o700, dir_fd=staging.parent_fd)
        replacement_fd = os.open(
            cleanup_name,
            os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
            dir_fd=staging.parent_fd,
        )
        try:
            sentinel_fd = os.open(
                "replacement-sentinel",
                os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
                0o400,
                dir_fd=replacement_fd,
            )
            try:
                os.write(sentinel_fd, b"do not delete")
            finally:
                os.close(sentinel_fd)
        finally:
            os.close(replacement_fd)
        replacement_name = cleanup_name

    monkeypatch.setattr(
        subject, "_preserve_cleanup_tombstone", rebind_after_final_identity_check
    )
    with pytest.raises(subject.SmtSourceAdapterError, match="receipt and solve"):
        subject.run_source_semantic_query(
            query,
            output,
            FakeCurrentPiqd(receipt_digest_mismatch=True),
            _accepting_verifier,
        )
    assert replacement_name is not None
    replacement = tmp_path / replacement_name
    assert (replacement / "replacement-sentinel").read_bytes() == b"do not delete"
    assert moved_original.is_dir() and not list(moved_original.iterdir())
    assert not output.exists()


def test_publication_remains_rooted_in_held_parent_descriptor(tmp_path: Path) -> None:
    query, _ = _load(tmp_path)
    parent = tmp_path / "parent"
    parent.mkdir()
    moved_parent = tmp_path / "moved-parent"
    output = parent / "receipts"
    moved = False

    def moving_verifier(*_args: object) -> subject.SemanticVerification:
        nonlocal moved
        if not moved:
            parent.rename(moved_parent)
            parent.mkdir()
            moved = True
        return subject.SemanticVerification(True, {"accepted": True})

    with pytest.raises(subject.SmtSourceAdapterError, match="parent identity changed"):
        subject.run_source_semantic_query(
            query, output, FakeCurrentPiqd(), moving_verifier
        )
    assert not output.exists()
    assert not (moved_parent / "receipts").exists()
    assert not list(moved_parent.glob(".piqd-smt-staging-*"))
    _assert_empty_tombstones(moved_parent)


def test_result_digest_uses_utf8_byte_lengths() -> None:
    result = {"status": "SAT", "model": "λ", "values": "((x é))"}
    assert (
        subject.piqd_result_digest(result)
        == hashlib.sha256(
            subject.PIQD_RESULT_DIGEST_VERSION
            + b"\nstatus=3:SAT"
            + b"\ninterrupted_by=-"
            + b"\nterminal_unsat=-"
            + b"\ncore=-"
            + b"\nmodel=2:\xce\xbb"
            + b"\nvalues=8:((x \xc3\xa9))"
        ).hexdigest()
    )

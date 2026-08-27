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


def _solve_request_sha(journal: bytes, body: Mapping[str, object]) -> str:
    commands = journal.count(b"\n")
    digest = hashlib.sha256(subject.PIQD_SOLVE_REQUEST_DIGEST_VERSION)
    digest.update(f"\nbase={commands}:{len(journal)}:{_sha(journal)}".encode())
    digest.update(f"\ntimeout={body['timeout_ms']}\nmodel=true".encode())
    for name in ("assumptions", "get_values"):
        values = body[name]
        assert type(values) is list
        digest.update(f"\n{name}={len(values)}".encode())
        for value in values:
            assert type(value) is str
            encoded = value.encode()
            digest.update(f"\n{len(encoded)}:".encode())
            digest.update(encoded)
    labels = body.get("assumption_labels", [])
    assert type(labels) is list
    if labels:
        digest.update(f"\nassumption_labels={len(labels)}".encode())
        for label in labels:
            assert type(label) is str
            encoded = label.encode()
            digest.update(f"\n{len(encoded)}:".encode())
            digest.update(encoded)
    return digest.hexdigest()


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
        named_replay_value: object = True,
        effective_deadline_tamper: str | None = None,
        named_receipt_digest_mismatch: bool = False,
        named_replay_conflict: bool = False,
        create_transport_loss: bool = False,
        create_loss_commits: bool = True,
        listing_variant: str = "exact",
        listing_transport_losses: int = 0,
        append_transport_losses: int = 0,
        append_loss_commits: bool = True,
        append_divergent_on_loss: bool = False,
        export_transport_losses: int = 0,
        close_transport_losses: int = 0,
        close_loss_commits: bool = True,
        status_transport_losses: int = 0,
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
        self.named_replay_value = named_replay_value
        self.effective_deadline_tamper = effective_deadline_tamper
        self.named_receipt_digest_mismatch = named_receipt_digest_mismatch
        self.named_replay_conflict = named_replay_conflict
        self.create_transport_loss = create_transport_loss
        self.create_loss_commits = create_loss_commits
        self.listing_variant = listing_variant
        self.listing_transport_losses = listing_transport_losses
        self.append_transport_losses = append_transport_losses
        self.append_loss_commits = append_loss_commits
        self.append_divergent_on_loss = append_divergent_on_loss
        self.export_transport_losses = export_transport_losses
        self.close_transport_losses = close_transport_losses
        self.close_loss_commits = close_loss_commits
        self.status_transport_losses = status_transport_losses
        self.sessions: dict[str, dict[str, Any]] = {}
        self.calls: list[tuple[str, str, object]] = []
        self.active = 0
        self.max_active = 0
        self.created_solvers: list[str] = []
        self.deleted_session_ids: list[str] = []
        self.actual_appends = 0
        self.actual_solves = 0

    def request_json(
        self,
        method: str,
        path: str,
        body: Mapping[str, object] | None = None,
    ) -> subject.JsonResponse:
        snap = None if body is None else json.loads(_canonical(body))
        self.calls.append((method, path, snap))
        if method == "GET" and path == "/sessions":
            if self.listing_transport_losses:
                self.listing_transport_losses -= 1
                raise subject.PiqdTransportLoss("simulated listing response loss")
            listed = [
                self._session_snapshot(session_id) for session_id in self.sessions
            ]
            if self.listing_variant == "zero":
                listed = []
            elif self.listing_variant == "mismatch" and listed:
                listed[0]["solver_name"] = "z3"
            elif self.listing_variant == "multiple" and listed:
                duplicate = dict(listed[0])
                duplicate["id"] = str(uuid.UUID(int=99))
                duplicate["journal_path"] = (
                    f"/daemon/sessions/{duplicate['id']}/journal.smt2"
                )
                listed.append(duplicate)
            assert self.listing_variant in {"exact", "zero", "mismatch", "multiple"}
            return subject.JsonResponse(
                200,
                {
                    "sessions": listed,
                    "live": sum(item["state"] == "live" for item in listed),
                },
            )
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
                "state": "live",
            }
            if not self.create_transport_loss or self.create_loss_commits:
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
            if self.create_transport_loss:
                self.create_transport_loss = False
                raise subject.PiqdTransportLoss("simulated create response loss")
            return subject.JsonResponse(201, created)

        session_id, suffix = self._session_route(path)
        data = self.sessions[session_id]
        if method == "POST" and suffix == "/assert":
            assert body is not None
            assert set(body) == {"commands", "expect_commands"}
            assert body["expect_commands"] == 0
            commands = list(body["commands"])
            assert all(type(command) is str for command in commands)
            if not self.append_transport_losses or self.append_loss_commits:
                data["commands"] = commands
                data["journal"] = b"".join(
                    command.encode() + b"\n" for command in commands
                )
                self.actual_appends += 1
                if self.append_divergent_on_loss and self.append_transport_losses:
                    data["journal"] += b"(assert false)\n"
            if self.append_transport_losses:
                self.append_transport_losses -= 1
                raise subject.PiqdTransportLoss("simulated append response loss")
            return subject.JsonResponse(
                200, {"added": len(commands), "commands": len(commands)}
            )
        if method == "POST" and suffix == "/solve":
            assert body is not None
            named = "request_id" in body
            expected_keys = {
                "assumptions",
                "timeout_ms",
                "include_model",
                "get_values",
            }
            if named:
                expected_keys |= {"assumption_labels", "request_id"}
            assert set(body) == expected_keys
            assert body["include_model"] is True
            assert body["get_values"] == ["x"]
            if named:
                assert str(uuid.UUID(str(body["request_id"]))) == body["request_id"]
                assert type(body["assumption_labels"]) is list
            if named and data["receipt"] is not None:
                if self.named_replay_conflict or body != data["solve_request"]:
                    return subject.JsonResponse(409, {"error": "request_id conflict"})
                recorded = data["answer"]
                assert type(recorded) is dict
                return subject.JsonResponse(
                    200,
                    {
                        **recorded,
                        "solve_ms": 0,
                        "solve_index": 1,
                        "result_sha256": data["receipt"]["result_sha256"],
                        "effective_deadline_ms": (
                            body["timeout_ms"]
                            + subject.PIQD_EFFECTIVE_DEADLINE_GRACE_MS
                        ),
                        "replayed": self.named_replay_value,
                    },
                )
            data["solve_request"] = dict(body)
            self.actual_solves += 1
            answer = self._answer(data["solver"])
            labels = list(body.get("assumption_labels", []))
            if labels and answer["status"] == "UNSAT":
                by_term = dict(zip(body["assumptions"], labels, strict=True))
                answer["core_labels"] = [
                    by_term.get(member) for member in answer["core"]
                ]
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
            if named:
                response["replayed"] = False
            elif self.solve_replayed is not _ABSENT:
                response["replayed"] = self.solve_replayed
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
            if labels:
                receipt["assumption_labels"] = labels
            if named:
                receipt["request_id"] = body["request_id"]
                receipt["request_sha256"] = (
                    "a" * 64
                    if self.named_receipt_digest_mismatch
                    else _solve_request_sha(data["journal"], body)
                )
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
            if self.status_transport_losses:
                self.status_transport_losses -= 1
                raise subject.PiqdTransportLoss("simulated status response loss")
            if data["pending_answer"] is not None:
                if data["visibility_delay"] == 0:
                    data["answer"] = data["pending_answer"]
                    data["receipt"] = data["pending_receipt"]
                    data["pending_answer"] = None
                    data["pending_receipt"] = None
                else:
                    data["visibility_delay"] -= 1
            return subject.JsonResponse(200, self._session_snapshot(session_id))
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
            if (not self.close_transport_losses or self.close_loss_commits) and data[
                "state"
            ] != "closed":
                data["state"] = "closed"
                self.active -= 1
            if self.close_transport_losses:
                self.close_transport_losses -= 1
                raise subject.PiqdTransportLoss("simulated close response loss")
            closed = self._session_snapshot(session_id)
            closed["state"] = "closed"
            if self.close_status_mismatch and closed["last_status"] is not None:
                closed["last_status"] = "UNKNOWN"
            return subject.JsonResponse(200, closed)
        raise AssertionError(f"adapter invented or misused PIQD route {method} {path}")

    def request_bytes(self, method: str, path: str) -> subject.BytesResponse:
        self.calls.append((method, path, None))
        session_id, suffix = self._session_route(path)
        assert method == "GET" and suffix == "/smt2"
        if self.export_transport_losses:
            self.export_transport_losses -= 1
            raise subject.PiqdTransportLoss("simulated export response loss")
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

    def _session_snapshot(self, session_id: str) -> dict[str, object]:
        data = self.sessions[session_id]
        answer = data["answer"] or {}
        return _session(
            session_id,
            data["solver"],
            data["label"],
            state=data["state"],
            commands=len(data["commands"]),
            solves=0 if not answer else 1,
            status=answer.get("status"),
            assumptions=(data["solve_request"] or {}).get("assumptions"),
            terminal_unsat=answer.get("terminal_unsat"),
            journal_path=self._journal_path(session_id),
        )

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


def _run_named_single_solver(
    query: subject.SourceSemanticQuery,
    fake: FakeCurrentPiqd,
    output: Path,
    *,
    request_id: str = "12345678-1234-4234-9234-123456789abc",
    assumption_labels: tuple[str, ...] = ("source/source-gate",),
    resume_policy: str | None = None,
) -> dict[str, object]:
    output.mkdir(exist_ok=resume_policy is not None)
    output_fd = os.open(
        output, os.O_RDONLY | os.O_DIRECTORY | getattr(os, "O_NOFOLLOW", 0)
    )
    try:
        return subject.run_authenticated_single_solver_query(
            query,
            solver="cvc5",
            descriptor_schema="test-authenticated-single-solver-query/v1",
            solver_profile_schema="test-authenticated-single-solver-profile/v1",
            authenticated_journal_commands=query.journal_commands,
            transport=fake,
            semantic_verifier=_accepting_verifier,
            output_fd=output_fd,
            request_id=request_id,
            assumption_labels=assumption_labels,
            resume_policy=resume_policy,
        )
    finally:
        os.close(output_fd)


def test_named_single_solver_binds_exact_request_and_receipt(tmp_path: Path) -> None:
    generic, _ = _load(tmp_path)
    query = _single_solver_query(generic)
    fake = FakeCurrentPiqd()
    output = tmp_path / "named"

    engine = _run_named_single_solver(query, fake, output)

    request_body = next(
        body
        for method, path, body in fake.calls
        if method == "POST" and path.endswith("/solve")
    )
    assert type(request_body) is dict
    expected_sha = _solve_request_sha(query.journal_smt2, request_body)
    assert (
        subject.piqd_solve_request_digest(query, ("source/source-gate",))
        == expected_sha
    )
    assert engine["request_id"] == request_body["request_id"]
    assert engine["request_sha256"] == expected_sha
    assert engine["assumption_labels"] == ["source/source-gate"]
    assert engine["request_replay_attempted"] is False
    assert engine["request_replayed"] is False
    binding = json.loads((output / "cvc5.solve-request.json").read_bytes())
    assert binding["request"] == request_body
    assert binding["request_sha256"] == expected_sha
    receipt = json.loads((output / "cvc5.receipts.json").read_bytes())["receipts"][0]
    assert receipt["request_id"] == request_body["request_id"]
    assert receipt["request_sha256"] == expected_sha
    assert receipt["assumption_labels"] == ["source/source-gate"]
    referenced = {artifact["path"] for artifact in engine["artifacts"].values()}
    assert referenced == {path.name for path in output.iterdir()}


def test_named_response_loss_replays_same_request_without_second_solve(
    tmp_path: Path,
) -> None:
    generic, _ = _load(tmp_path)
    query = _single_solver_query(generic)
    fake = FakeCurrentPiqd(solve_transport_loss={"cvc5"})

    engine = _run_named_single_solver(query, fake, tmp_path / "replayed")

    requests = [
        body
        for method, path, body in fake.calls
        if method == "POST" and path.endswith("/solve")
    ]
    assert len(requests) == 2 and requests[0] == requests[1]
    assert engine["response_lost"] is True
    assert engine["request_replay_attempted"] is True
    assert engine["request_replayed"] is True
    assert engine["reconciled_from_receipt"] is False
    assert engine["effective_status"] == "SAT_SEMANTICALLY_REPLAYED"
    assert len(fake.sessions) == 1
    assert next(iter(fake.sessions.values()))["receipt"] is not None


def test_named_response_loss_replay_false_fails_closed_without_accepting_new_solve(
    tmp_path: Path,
) -> None:
    generic, _ = _load(tmp_path)
    query = _single_solver_query(generic)
    fake = FakeCurrentPiqd(solve_transport_loss={"cvc5"}, named_replay_value=False)

    with pytest.raises(subject.SmtSourceAdapterError, match="replay"):
        _run_named_single_solver(query, fake, tmp_path / "replay-false")

    assert fake.actual_solves == 1
    assert (
        len(
            [
                call
                for call in fake.calls
                if call[0] == "POST" and call[1].endswith("/solve")
            ]
        )
        == 2
    )


def test_named_create_response_loss_reconciles_one_exact_session(
    tmp_path: Path,
) -> None:
    generic, _ = _load(tmp_path)
    query = _single_solver_query(generic)
    fake = FakeCurrentPiqd(create_transport_loss=True)

    engine = _run_named_single_solver(query, fake, tmp_path / "create-reconciled")

    create_posts = [
        call for call in fake.calls if call[0] == "POST" and call[1] == "/sessions"
    ]
    assert len(create_posts) == 1
    assert fake.actual_appends == 1 and fake.actual_solves == 1
    lifecycle = engine["session_lifecycle"]
    assert lifecycle["create_response_lost"] is True
    assert lifecycle["create_reconciled_from_listing"] is True
    assert lifecycle["session_label"].endswith(
        "/12345678-1234-4234-9234-123456789abc/"
        + lifecycle["solver_profile_sha256"][:12]
    )


@pytest.mark.parametrize(
    ("fake", "message"),
    [
        (
            FakeCurrentPiqd(
                create_transport_loss=True,
                create_loss_commits=False,
                listing_variant="zero",
            ),
            "no unique label match",
        ),
        (
            FakeCurrentPiqd(
                create_transport_loss=True,
                listing_variant="multiple",
            ),
            "no unique label match",
        ),
        (
            FakeCurrentPiqd(
                create_transport_loss=True,
                listing_variant="mismatch",
            ),
            "session identity mismatch",
        ),
        (
            FakeCurrentPiqd(
                create_transport_loss=True,
                listing_transport_losses=1,
            ),
            "listing response loss",
        ),
    ],
    ids=("zero", "multiple", "identity-mismatch", "listing-unavailable"),
)
def test_named_create_loss_never_guesses_or_replaces_session(
    tmp_path: Path, fake: FakeCurrentPiqd, message: str
) -> None:
    generic, _ = _load(tmp_path)
    query = _single_solver_query(generic)

    with pytest.raises(subject.SmtSourceAdapterError, match=message):
        _run_named_single_solver(query, fake, tmp_path / "create-failed")

    assert [
        call for call in fake.calls if call[0] == "POST" and call[1] == "/sessions"
    ] == [fake.calls[0]]
    assert fake.actual_solves == 0


@pytest.mark.parametrize(
    ("commit_lost", "expected_posts", "retried", "from_export"),
    [
        (True, 1, False, True),
        (False, 2, True, False),
    ],
    ids=("exact-post", "exact-pre-retry"),
)
def test_named_append_loss_reconciles_only_exact_pre_or_post_state(
    tmp_path: Path,
    commit_lost: bool,
    expected_posts: int,
    retried: bool,
    from_export: bool,
) -> None:
    generic, _ = _load(tmp_path)
    query = _single_solver_query(generic)
    fake = FakeCurrentPiqd(
        append_transport_losses=1,
        append_loss_commits=commit_lost,
    )

    engine = _run_named_single_solver(query, fake, tmp_path / "append-reconciled")

    append_posts = [
        call for call in fake.calls if call[0] == "POST" and call[1].endswith("/assert")
    ]
    assert len(append_posts) == expected_posts
    assert fake.actual_appends == 1 and fake.actual_solves == 1
    lifecycle = engine["session_lifecycle"]
    assert lifecycle["append_response_losses"] == 1
    assert lifecycle["append_retry_attempted"] is retried
    assert lifecycle["append_reconciled_from_export"] is from_export


def test_named_append_loss_rejects_divergent_export_without_solve(
    tmp_path: Path,
) -> None:
    generic, _ = _load(tmp_path)
    query = _single_solver_query(generic)
    fake = FakeCurrentPiqd(
        append_transport_losses=1,
        append_loss_commits=True,
        append_divergent_on_loss=True,
    )

    with pytest.raises(subject.SmtSourceAdapterError, match="divergent journal"):
        _run_named_single_solver(query, fake, tmp_path / "append-divergent")

    assert fake.actual_appends == 1 and fake.actual_solves == 0


def test_named_export_response_loss_gets_one_bounded_read_retry(
    tmp_path: Path,
) -> None:
    generic, _ = _load(tmp_path)
    query = _single_solver_query(generic)
    fake = FakeCurrentPiqd(export_transport_losses=1)

    engine = _run_named_single_solver(query, fake, tmp_path / "export-reconciled")

    assert engine["session_lifecycle"]["export_response_losses"] == 1
    assert fake.actual_appends == 1 and fake.actual_solves == 1


def test_legacy_export_response_loss_gets_one_bounded_read_retry(
    tmp_path: Path,
) -> None:
    query, _ = _load(tmp_path)
    fake = FakeCurrentPiqd(export_transport_losses=1)

    result = subject.run_source_semantic_query(
        query, tmp_path / "legacy-export-reconciled", fake, _accepting_verifier
    )

    assert result["overall_status"] == "FINITE_DIAGNOSTIC_COMPLETE"
    z3_id = str(uuid.UUID(int=1))
    z3_exports = [
        call
        for call in fake.calls
        if call[0] == "GET" and call[1] == f"/sessions/{z3_id}/smt2"
    ]
    assert len(z3_exports) == 2


@pytest.mark.parametrize(
    ("commits", "expected_deletes", "outcome"),
    [
        (True, 1, "closed_status"),
        (False, 2, "closed_after_cleanup"),
    ],
    ids=("committed", "cleanup-required"),
)
def test_named_close_loss_is_reconciled_with_bounded_authenticated_cleanup(
    tmp_path: Path,
    commits: bool,
    expected_deletes: int,
    outcome: str,
) -> None:
    generic, _ = _load(tmp_path)
    query = _single_solver_query(generic)
    fake = FakeCurrentPiqd(
        close_transport_losses=1,
        close_loss_commits=commits,
    )

    engine = _run_named_single_solver(query, fake, tmp_path / "close-reconciled")

    lifecycle = engine["session_lifecycle"]
    assert lifecycle["close_response_lost"] is True
    assert lifecycle["close_outcome"] == outcome
    assert lifecycle["close_cleanup_delete_attempted"] is (not commits)
    assert lifecycle["close_status_lookups"] == (1 if commits else 2)
    assert len(fake.deleted_session_ids) == expected_deletes
    assert fake.active == 0 and fake.actual_solves == 1


def test_named_close_status_loss_is_bounded_and_persists_unproven_lifecycle(
    tmp_path: Path,
) -> None:
    generic, _ = _load(tmp_path)
    query = _single_solver_query(generic)
    output = tmp_path / "close-status-loss"
    fake = FakeCurrentPiqd(
        close_transport_losses=1,
        close_loss_commits=True,
        status_transport_losses=2,
    )

    with pytest.raises(subject.PiqdTransportLoss):
        _run_named_single_solver(query, fake, output)

    lifecycle = json.loads((output / "cvc5.session-lifecycle.json").read_bytes())
    assert lifecycle["close_outcome"] == "closure_unproven"
    assert lifecycle["close_observed_state"] == "unknown"
    assert lifecycle["close_status_response_losses"] == 2
    assert not (output / "cvc5.result.json").exists()


def test_named_process_and_daemon_restart_resume_existing_fresh_session(
    tmp_path: Path,
) -> None:
    generic, _ = _load(tmp_path)
    query = _single_solver_query(generic)
    fake = FakeCurrentPiqd(
        create_transport_loss=True,
        listing_transport_losses=1,
    )
    output = tmp_path / "resume-fresh"
    with pytest.raises(subject.PiqdTransportLoss, match="listing response loss"):
        _run_named_single_solver(query, fake, output)
    session_id = next(iter(fake.sessions))
    fake.sessions[session_id]["state"] = "detached"
    fake.active = 0

    engine = _run_named_single_solver(
        query,
        fake,
        output,
        resume_policy=subject.PIQD_RESUME_REQUIRE_EXISTING,
    )

    assert len([call for call in fake.calls if call[:2] == ("POST", "/sessions")]) == 1
    assert fake.actual_appends == 1 and fake.actual_solves == 1
    lifecycle = engine["session_lifecycle"]
    assert lifecycle["resumed_existing_session"] is True
    assert lifecycle["resume_journal_state"] == "exact_pre"


def test_named_restart_rebuilds_result_from_closed_receipt_without_second_solve(
    tmp_path: Path,
) -> None:
    generic, _ = _load(tmp_path)
    query = _single_solver_query(generic)
    fake = FakeCurrentPiqd(
        close_transport_losses=1,
        close_loss_commits=True,
        status_transport_losses=2,
    )
    output = tmp_path / "resume-receipt"
    with pytest.raises(subject.PiqdTransportLoss, match="status response loss"):
        _run_named_single_solver(query, fake, output)
    assert fake.actual_solves == 1
    initial_lifecycle_bytes = (output / "cvc5.session-lifecycle.json").read_bytes()

    engine = _run_named_single_solver(
        query,
        fake,
        output,
        resume_policy=subject.PIQD_RESUME_REQUIRE_EXISTING,
    )

    assert fake.actual_solves == 1
    assert engine["resumed_from_receipt"] is True
    assert engine["session_lifecycle"]["close_outcome"] == "closed_resume_status"
    assert engine["artifacts"]["solve"]["path"] == "cvc5.solve.json"
    assert (
        output / "cvc5.session-lifecycle.json"
    ).read_bytes() == initial_lifecycle_bytes
    assert engine["artifacts"]["session_lifecycle"]["path"] == (
        "cvc5.session-lifecycle.json"
    )
    assert engine["artifacts"]["final_session_lifecycle"]["path"] == (
        "cvc5.session-lifecycle-final.json"
    )
    assert (output / "cvc5.session-lifecycle-final.json").is_file()


def test_named_resume_creates_only_from_empty_preexisting_adapter_inventory(
    tmp_path: Path,
) -> None:
    generic, _ = _load(tmp_path)
    query = _single_solver_query(generic)
    output = tmp_path / "resume-missing"
    failed = FakeCurrentPiqd(
        create_transport_loss=True,
        create_loss_commits=False,
        listing_variant="zero",
    )
    with pytest.raises(subject.SmtSourceAdapterError, match="no unique label match"):
        _run_named_single_solver(query, failed, output)

    require_existing = FakeCurrentPiqd(listing_variant="zero")
    with pytest.raises(
        subject.SmtSourceAdapterError, match="absent during required resume"
    ):
        _run_named_single_solver(
            query,
            require_existing,
            output,
            resume_policy=subject.PIQD_RESUME_REQUIRE_EXISTING,
        )
    assert not [
        call
        for call in require_existing.calls
        if call[0] == "POST" and call[1] == "/sessions"
    ]

    blocked_replacement = FakeCurrentPiqd(listing_variant="zero")
    with pytest.raises(
        subject.SmtSourceAdapterError, match="absent during required resume"
    ):
        _run_named_single_solver(
            query,
            blocked_replacement,
            output,
            resume_policy=subject.PIQD_RESUME_ALLOW_CREATE_IF_MISSING,
        )
    assert not [
        call
        for call in blocked_replacement.calls
        if call[0] == "POST" and call[1] == "/sessions"
    ]

    allowed = FakeCurrentPiqd(listing_variant="zero")
    engine = _run_named_single_solver(
        query,
        allowed,
        tmp_path / "resume-empty-prefix",
        resume_policy=subject.PIQD_RESUME_ALLOW_CREATE_IF_MISSING,
    )
    assert engine["effective_status"] == "SAT_SEMANTICALLY_REPLAYED"
    assert allowed.actual_solves == 1


def test_named_resume_ambiguous_matching_inventory_blocks_without_create(
    tmp_path: Path,
) -> None:
    generic, _ = _load(tmp_path)
    query = _single_solver_query(generic)
    fake = FakeCurrentPiqd(
        create_transport_loss=True,
        listing_transport_losses=1,
    )
    output = tmp_path / "resume-ambiguous"
    with pytest.raises(subject.PiqdTransportLoss):
        _run_named_single_solver(query, fake, output)
    fake.listing_variant = "multiple"

    with pytest.raises(subject.SmtSourceAdapterError, match="ambiguous"):
        _run_named_single_solver(
            query,
            fake,
            output,
            resume_policy=subject.PIQD_RESUME_REQUIRE_EXISTING,
        )

    assert len([call for call in fake.calls if call[:2] == ("POST", "/sessions")]) == 1
    assert fake.actual_solves == 0


@pytest.mark.parametrize(
    ("fake", "message"),
    [
        (FakeCurrentPiqd(named_receipt_digest_mismatch=True), "request identity"),
        (
            FakeCurrentPiqd(solve_transport_loss={"cvc5"}, named_replay_conflict=True),
            "HTTP status mismatch",
        ),
    ],
)
def test_named_request_digest_or_replay_conflict_fails_closed(
    tmp_path: Path, fake: FakeCurrentPiqd, message: str
) -> None:
    generic, _ = _load(tmp_path)
    query = _single_solver_query(generic)
    with pytest.raises(subject.SmtSourceAdapterError, match=message):
        _run_named_single_solver(query, fake, tmp_path / "rejected")
    assert fake.active == 0


@pytest.mark.parametrize(
    ("request_id", "labels", "message"),
    [
        ("NOT-A-UUID", ("source/source-gate",), "canonical UUID"),
        ("12345678-1234-4234-9234-123456789abc", (), "label every assumption"),
    ],
)
def test_named_request_validation_precedes_transport(
    tmp_path: Path, request_id: str, labels: tuple[str, ...], message: str
) -> None:
    generic, _ = _load(tmp_path)
    query = _single_solver_query(generic)
    fake = FakeCurrentPiqd()
    with pytest.raises(subject.SmtSourceAdapterError, match=message):
        _run_named_single_solver(
            query,
            fake,
            tmp_path / "invalid",
            request_id=request_id,
            assumption_labels=labels,
        )
    assert fake.calls == []


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


def test_public_single_solver_loader_authenticates_exact_descriptor_root(
    tmp_path: Path,
) -> None:
    descriptor_path, _ = _packet(tmp_path / "single")
    descriptor = json.loads(descriptor_path.read_bytes())
    descriptor["schema"] = "test-authenticated-single-solver-query/v1"
    descriptor["solver_profile"] = {
        "schema": "test-authenticated-single-solver-profile/v1",
        "solvers": ["z3"],
        "timeout_ms": 17_000,
    }
    descriptor_path.write_bytes(_canonical(descriptor) + b"\n")
    query = subject.load_authenticated_single_solver_query(
        descriptor_path.parent,
        descriptor_path.name,
        solver="z3",
        descriptor_schema="test-authenticated-single-solver-query/v1",
        solver_profile_schema="test-authenticated-single-solver-profile/v1",
    )
    assert query.descriptor == descriptor
    assert query.descriptor["solver_profile"]["solvers"] == ["z3"]
    with pytest.raises(subject.SmtSourceAdapterError, match="must run cvc5"):
        subject.load_authenticated_single_solver_query(
            descriptor_path.parent,
            descriptor_path.name,
            solver="cvc5",
            descriptor_schema="test-authenticated-single-solver-query/v1",
            solver_profile_schema="test-authenticated-single-solver-profile/v1",
        )


def test_public_output_transaction_is_create_once_and_atomic(tmp_path: Path) -> None:
    output = tmp_path / "published"
    with subject.SmtOutputTransaction(output) as transaction:
        metadata = transaction.write_bytes("artifact.bin", b"exact bytes")
        transaction.publish()
    assert metadata == {
        "path": "artifact.bin",
        "bytes": 11,
        "sha256": hashlib.sha256(b"exact bytes").hexdigest(),
    }
    assert (output / "artifact.bin").read_bytes() == b"exact bytes"
    with pytest.raises(subject.SmtSourceAdapterError, match="already exists"):
        subject.SmtOutputTransaction(output)

from __future__ import annotations

import hashlib
import json
import os
import uuid
from dataclasses import replace
from fractions import Fraction
from pathlib import Path
from typing import Any

import pytest

from census.global_confinement import metric_realizability_piqd_cvc5 as subject
from census.p97_search import phase3_piqd_smt_source_adapter as neutral


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _session(
    session_id: str,
    label: str,
    *,
    state: str = "live",
    commands: int = 0,
    solves: int = 0,
    status: str | None = None,
    terminal_unsat: bool | None = None,
) -> dict[str, object]:
    return {
        "id": session_id,
        "lane": "smt",
        "state": state,
        "solver_name": "cvc5",
        "solver_sha256": _sha(b"fake-cvc5-binary"),
        "solver_signature": "cvc5 fake-current-schema",
        "protocol_version": 1,
        "journal_path": f"/daemon/sessions/{session_id}/journal.smt2",
        "created_at": 10,
        "updated_at": 10 + commands + solves,
        "clauses": commands,
        "max_var": 0,
        "solves": solves,
        "last_status": status,
        "declared_num_vars": None,
        "last_solve_index": None if solves == 0 else solves,
        "last_assumption_free": None if solves == 0 else True,
        "last_terminal_unsat": None if solves == 0 else terminal_unsat,
        "label": label,
    }


def _smt(value: Fraction) -> str:
    if value.denominator == 1:
        return str(value.numerator)
    return f"(/ {value.numerator} {value.denominator})"


def _values(terms: list[str], *, false_model: bool = False) -> str:
    coordinates = {
        "x_2": Fraction(1),
        "y_2": Fraction(1),
        "x_3": Fraction(0),
        "y_3": Fraction(1),
    }
    if false_model:
        coordinates["y_2"] = Fraction(0)
    return "(" + " ".join(f"({term} {_smt(coordinates[term])})" for term in terms) + ")"


class FakePiqd:
    def __init__(
        self,
        status: str,
        *,
        tamper: str | None = None,
        response_loss: bool = False,
        response_loss_visibility_delay: int = 0,
        false_model: bool = False,
    ) -> None:
        self.status = status
        self.tamper = tamper
        self.response_loss = response_loss
        self.response_loss_visibility_delay = response_loss_visibility_delay
        self.false_model = false_model
        self.calls: list[tuple[str, str, object]] = []
        self.sessions: dict[str, dict[str, Any]] = {}
        self.solve_calls = 0
        self.delete_calls = 0
        self.active = 0

    def request_json(
        self,
        method: str,
        path: str,
        body: dict[str, object] | None = None,
    ) -> neutral.JsonResponse:
        self.calls.append((method, path, body))
        if method == "POST" and path == "/sessions":
            assert body is not None
            assert body["solver"] == "cvc5" and body["lane"] == "smt"
            identity = 1 if self.tamper == "reuse_identity" else len(self.sessions) + 1
            session_id = str(uuid.UUID(int=identity))
            self.sessions[session_id] = {
                "label": body["label"],
                "commands": [],
                "journal": b"",
                "receipt": None,
                "answer": None,
                "pending_receipt": None,
                "pending_answer": None,
                "visibility_delay": 0,
            }
            self.active += 1
            created = _session(session_id, str(body["label"]))
            if self.tamper == "create_identity":
                created["solver_name"] = "z3"
            return neutral.JsonResponse(201, created)

        session_id, suffix = self._route(path)
        data = self.sessions[session_id]
        if method == "POST" and suffix == "/assert":
            assert body is not None and body["expect_commands"] == 0
            commands = list(body["commands"])
            assert commands[0] == subject.NL_COV_COMMAND
            assert commands[1] == "(set-logic QF_NRA)"
            data["commands"] = commands
            data["journal"] = b"".join(
                str(command).encode() + b"\n" for command in commands
            )
            return neutral.JsonResponse(
                200, {"added": len(commands), "commands": len(commands)}
            )
        if method == "POST" and suffix == "/solve":
            assert body is not None
            self.solve_calls += 1
            answer = self._answer(list(body["get_values"]))
            digest = neutral.piqd_result_digest(answer)
            response = {
                **answer,
                "solve_ms": 3,
                "solve_index": 1,
                "result_sha256": digest,
                "effective_deadline_ms": (
                    body["timeout_ms"] + neutral.PIQD_EFFECTIVE_DEADLINE_GRACE_MS
                ),
                "replayed": False,
            }
            receipt = {
                "solve_index": 1,
                "base_commands": len(data["commands"]),
                "base_bytes": len(data["journal"]),
                "base_sha256": _sha(data["journal"]),
                "solver_signature": "cvc5 fake-current-schema",
                "solver_sha256": _sha(b"fake-cvc5-binary"),
                "assumptions": list(body["assumptions"]),
                "timeout_ms": body["timeout_ms"],
                "effective_deadline_ms": (
                    body["timeout_ms"] + neutral.PIQD_EFFECTIVE_DEADLINE_GRACE_MS
                ),
                "include_model": body["include_model"],
                "get_values": list(body["get_values"]),
                **answer,
                "solve_ms": 3,
                "result_sha256": digest,
                "at": 14,
            }
            if self.tamper == "response_deadline_missing":
                response.pop("effective_deadline_ms")
            if self.tamper == "response_deadline_bool":
                response["effective_deadline_ms"] = True
            if self.tamper == "response_deadline_arithmetic":
                response["effective_deadline_ms"] += 1
            if self.tamper == "receipt_deadline_extra":
                receipt["unexpected_deadline_field"] = 1
            if self.tamper == "receipt_deadline_float":
                receipt["effective_deadline_ms"] = float(
                    receipt["effective_deadline_ms"]
                )
            if self.tamper == "receipt_deadline_arithmetic":
                receipt["effective_deadline_ms"] += 1
            if self.tamper == "crossed_deadline":
                receipt["timeout_ms"] += 1_000
                receipt["effective_deadline_ms"] += 1_000
            if self.tamper == "receipt_base_hash":
                receipt["base_sha256"] = "0" * 64
            if self.tamper == "receipt_signature":
                receipt["solver_signature"] = "cvc5 crossed-session"
            if self.tamper == "solve_receipt_status_mismatch":
                receipt.pop("model", None)
                receipt.pop("values", None)
                receipt.update({"status": "UNSAT", "core": [], "terminal_unsat": True})
            if self.response_loss:
                if self.response_loss_visibility_delay:
                    data["pending_answer"] = answer
                    data["pending_receipt"] = receipt
                    data["visibility_delay"] = self.response_loss_visibility_delay
                else:
                    data["answer"], data["receipt"] = answer, receipt
                raise neutral.PiqdTransportLoss("synthetic lost solve response")
            data["answer"], data["receipt"] = answer, receipt
            return neutral.JsonResponse(200, response)
        if method == "GET" and suffix == "":
            if data["pending_answer"] is not None:
                if data["visibility_delay"] == 0:
                    data["answer"] = data["pending_answer"]
                    data["receipt"] = data["pending_receipt"]
                    data["pending_answer"] = None
                    data["pending_receipt"] = None
                else:
                    data["visibility_delay"] -= 1
            answer = data["answer"] or {}
            return neutral.JsonResponse(
                200,
                _session(
                    session_id,
                    str(data["label"]),
                    commands=len(data["commands"]),
                    solves=0 if not answer else 1,
                    status=answer.get("status"),
                    terminal_unsat=answer.get("terminal_unsat"),
                ),
            )
        if method == "GET" and suffix == "/receipts":
            receipts = (
                []
                if data["receipt"] is None or self.tamper == "missing_receipt"
                else [data["receipt"]]
            )
            if self.tamper == "duplicate_receipts" and receipts:
                receipts = [receipts[0], dict(receipts[0])]
            return neutral.JsonResponse(
                200,
                {
                    "session_id": session_id,
                    "lane": "smt",
                    "journal_path": f"/daemon/sessions/{session_id}/journal.smt2",
                    "receipts_path": f"/daemon/sessions/{session_id}/receipts.jsonl",
                    "count": len(receipts),
                    "receipts": receipts,
                },
            )
        if method == "DELETE" and suffix == "":
            self.delete_calls += 1
            answer = data["answer"] or {}
            self.active -= 1
            return neutral.JsonResponse(
                200,
                _session(
                    session_id,
                    str(data["label"]),
                    state="closed",
                    commands=len(data["commands"]),
                    solves=0 if not answer else 1,
                    status=answer.get("status"),
                    terminal_unsat=answer.get("terminal_unsat"),
                ),
            )
        raise AssertionError(f"unexpected fake route: {method} {path}")

    def request_bytes(self, method: str, path: str) -> neutral.BytesResponse:
        self.calls.append((method, path, None))
        session_id, suffix = self._route(path)
        assert method == "GET" and suffix == "/smt2"
        journal = self.sessions[session_id]["journal"]
        if self.tamper == "export":
            journal += b"(set-option :nl-cov true)\n"
        return neutral.BytesResponse(200, journal)

    @staticmethod
    def _route(path: str) -> tuple[str, str]:
        parts = path.split("/")
        return parts[2], "" if len(parts) == 3 else "/" + "/".join(parts[3:])

    def _answer(self, terms: list[str]) -> dict[str, object]:
        if self.status == "SAT":
            return {
                "status": "SAT",
                "model": "(model)",
                "values": _values(terms, false_model=self.false_model),
            }
        if self.status == "UNSAT":
            return {"status": "UNSAT", "core": [], "terminal_unsat": True}
        return {"status": "UNKNOWN", "interrupted_by": "daemon_deadline"}


def _square_system() -> dict[str, Any]:
    return {
        "system_id": "1234567890abcdef1234",
        "n": 4,
        "profile": [1, 1, 1],
        "order": [0, 1, 2, 3],
        "rows": [
            {"center": 0, "support": [1, 3], "exact": True},
        ],
        "sources": [],
    }


def _selection(tmp_path: Path) -> subject.AuthenticatedSelection:
    source = tmp_path / "source.json"
    source.write_text("{}\n", encoding="utf-8")
    custody = subject._capture_inputs((source,))
    system = _square_system()
    return subject.AuthenticatedSelection(
        system,
        {
            "input_files": [
                {
                    "path": os.path.relpath(source, subject.ROOT),
                    "sha256": _sha(source.read_bytes()),
                }
            ]
        },
        (system["system_id"],),
        custody,
    )


@pytest.fixture
def prepared(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> subject.PreparedSystem:
    selection = _selection(tmp_path)

    def fake_extract(
        paths: tuple[Path, ...],
    ) -> tuple[list[dict[str, Any]], dict[str, Any]]:
        return [selection.system], selection.extraction

    monkeypatch.setattr(subject.producer, "extract_systems", fake_extract)
    monkeypatch.setattr(subject.producer, "_frontier", lambda systems: systems)
    return subject.prepare_system(selection, timeout_ms=5000)


def test_exact_first_command_profile_and_arbitrary_n_counts(
    prepared: subject.PreparedSystem,
) -> None:
    assert prepared.query.journal_commands[0] == subject.NL_COV_COMMAND
    assert prepared.query.journal_commands[1] == "(set-logic QF_NRA)"
    assert prepared.source_record["constraint_counts"] == {
        "convex_order": 8,
        "distinctness": 6,
        "exact_exclusions": 1,
        "row_equalities": 1,
        "selected_rows": 1,
        "total": 16,
    }
    assert prepared.source_record["profile"] == {
        "schema": subject.PROFILE_SCHEMA,
        "solver": "cvc5",
        "lane": "smt",
        "first_command": subject.NL_COV_COMMAND,
        "fresh_session": True,
        "sequential": True,
        "solve_count": 1,
        "workers": 1,
        "timeout_ms": 5000,
        "local_fallback": False,
    }


def test_known_sat_control_replays_every_assertion_exactly(
    tmp_path: Path, prepared: subject.PreparedSystem
) -> None:
    fake = FakePiqd("SAT")
    result = subject.run_prepared_system(prepared, tmp_path / "sat", fake)
    assert result["effective_status"] == "SAT_SEMANTICALLY_REPLAYED"
    assert result["classification"] == "SAT_EXACT_RATIONAL_REPLAYED_DIAGNOSTIC"
    semantic = result["engine"]["semantic_replay"]
    assert semantic["evidence"]["checks"] == {
        "row_equalities": 1,
        "exact_exclusions": 1,
        "distinctness": 6,
        "convex_order": 8,
    }
    assert fake.solve_calls == 1 and fake.active == 0
    solve = json.loads((tmp_path / "sat" / "cvc5.solve.json").read_bytes())
    receipt = json.loads((tmp_path / "sat" / "cvc5.receipts.json").read_bytes())[
        "receipts"
    ][0]
    assert solve["effective_deadline_ms"] == 35_000
    assert receipt["effective_deadline_ms"] == 35_000


def test_historical_full_convex_unsat_control_is_diagnostic_only(
    tmp_path: Path,
) -> None:
    selection = subject.load_selected_system("0b12b25bf5daa7566f98")
    prepared = subject.prepare_system(selection, timeout_ms=5000)
    assert prepared.source_record["constraint_counts"] == {
        "convex_order": 120,
        "distinctness": 66,
        "exact_exclusions": 42,
        "row_equalities": 36,
        "selected_rows": 12,
        "total": 264,
    }
    result = subject.run_prepared_system(
        prepared, tmp_path / "known-unsat", FakePiqd("UNSAT")
    )
    assert result["effective_status"] == "UNSAT_DISCOVERY_ONLY"
    assert result["classification"] == "CVC5_UNSAT_DIAGNOSTIC_NOT_KERNEL_CHECKED"
    assert result["claims"] == subject.FALSE_CLAIMS
    assert result["proof_blueprint"] == subject.PROOF_BLUEPRINT


def test_false_sat_model_is_rejected(
    tmp_path: Path, prepared: subject.PreparedSystem
) -> None:
    result = subject.run_prepared_system(
        prepared, tmp_path / "false-model", FakePiqd("SAT", false_model=True)
    )
    assert result["raw_status"] == "SAT"
    assert result["effective_status"] == "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED"
    assert result["classification"] == "ERROR_OR_REPLAY_REJECTION_INCONCLUSIVE"


def test_unknown_is_inconclusive(
    tmp_path: Path, prepared: subject.PreparedSystem
) -> None:
    result = subject.run_prepared_system(
        prepared, tmp_path / "unknown", FakePiqd("UNKNOWN")
    )
    assert result["effective_status"] == "INCONCLUSIVE_UNKNOWN"
    assert result["classification"] == "UNKNOWN_INCONCLUSIVE"


def test_lost_solve_response_reconciles_from_durable_receipt(
    tmp_path: Path, prepared: subject.PreparedSystem
) -> None:
    result = subject.run_prepared_system(
        prepared,
        tmp_path / "reconciled",
        FakePiqd("SAT", response_loss=True),
    )
    assert result["effective_status"] == "SAT_SEMANTICALLY_REPLAYED"
    assert result["engine"]["response_lost"] is True
    assert result["engine"]["reconciled_from_receipt"] is True
    reconciled = json.loads(
        (tmp_path / "reconciled" / "cvc5.reconciled-solve.json").read_bytes()
    )
    assert reconciled["effective_deadline_ms"] == 35_000


def test_lost_response_waits_for_delayed_unknown_receipt_once(
    tmp_path: Path,
    prepared: subject.PreparedSystem,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    waits: list[float] = []
    monkeypatch.setattr(neutral, "_bounded_reconciliation_wait", waits.append)
    fake = FakePiqd("UNKNOWN", response_loss=True, response_loss_visibility_delay=1)

    result = subject.run_prepared_system(prepared, tmp_path / "delayed-unknown", fake)

    assert result["raw_status"] == "UNKNOWN"
    assert result["effective_status"] == "INCONCLUSIVE_UNKNOWN"
    assert result["classification"] == "UNKNOWN_INCONCLUSIVE"
    assert result["engine"]["response_lost"] is True
    assert result["engine"]["reconciled_from_receipt"] is True
    assert result["engine"]["reconciliation_attempts"] == 2
    assert waits == [neutral.TRANSPORT_RECONCILIATION_DELAYS_S[1]]
    assert fake.solve_calls == 1
    assert fake.delete_calls == 1
    receipt = json.loads(
        (tmp_path / "delayed-unknown" / "cvc5.receipts.json").read_bytes()
    )["receipts"][0]
    assert receipt["status"] == "UNKNOWN"
    assert receipt["interrupted_by"] == "daemon_deadline"


@pytest.mark.parametrize(
    ("tamper", "message"),
    [
        ("duplicate_receipts", "excess receipts"),
        ("solve_receipt_status_mismatch", "receipt and solve response disagree"),
        ("missing_receipt", "completed solve has no durable receipt"),
    ],
)
def test_receipt_reconciliation_adversaries_fail_closed(
    tmp_path: Path,
    prepared: subject.PreparedSystem,
    tamper: str,
    message: str,
) -> None:
    fake = FakePiqd("SAT", tamper=tamper)
    with pytest.raises(neutral.SmtSourceAdapterError, match=message):
        subject.run_prepared_system(prepared, tmp_path / tamper, fake)
    assert fake.solve_calls == 1 and fake.active == 0


@pytest.mark.parametrize(
    ("tamper", "message"),
    [
        ("response_deadline_missing", "unexpected keys"),
        ("response_deadline_bool", "exact integer"),
        ("response_deadline_arithmetic", r"request timeout_ms \+ 30000"),
        ("receipt_deadline_extra", "unexpected keys"),
        ("receipt_deadline_float", "non-builtin JSON value"),
        ("receipt_deadline_arithmetic", r"receipt timeout_ms \+ 30000"),
        ("crossed_deadline", "solve response disagree"),
    ],
)
def test_effective_deadline_adversaries_fail_closed_through_metric_adapter(
    tmp_path: Path,
    prepared: subject.PreparedSystem,
    tamper: str,
    message: str,
) -> None:
    fake = FakePiqd("SAT", tamper=tamper)
    with pytest.raises(neutral.SmtSourceAdapterError, match=message):
        subject.run_prepared_system(prepared, tmp_path / tamper, fake)
    assert fake.solve_calls == 1 and fake.active == 0


@pytest.mark.parametrize(
    "tamper",
    ["export", "create_identity", "receipt_base_hash", "receipt_signature"],
)
def test_crossed_or_tampered_transport_identity_fails_closed(
    tmp_path: Path, prepared: subject.PreparedSystem, tamper: str
) -> None:
    fake = FakePiqd("UNSAT", tamper=tamper)
    with pytest.raises(neutral.SmtSourceAdapterError):
        subject.run_prepared_system(prepared, tmp_path / tamper, fake)
    assert fake.active == 0


def test_reused_session_identity_fails_closed(
    tmp_path: Path, prepared: subject.PreparedSystem
) -> None:
    fake = FakePiqd("UNSAT", tamper="reuse_identity")
    used: set[str] = set()
    subject.run_prepared_system(
        prepared, tmp_path / "first", fake, used_session_ids=used
    )
    with pytest.raises(
        neutral.SmtSourceAdapterError, match="reused a session identity"
    ):
        subject.run_prepared_system(
            prepared, tmp_path / "second", fake, used_session_ids=used
        )
    assert fake.solve_calls == 1 and fake.active == 0


def test_local_custody_tamper_fails_before_transport(
    tmp_path: Path, prepared: subject.PreparedSystem
) -> None:
    changed = replace(prepared, source_record_bytes=prepared.source_record_bytes + b" ")
    fake = FakePiqd("UNSAT")
    with pytest.raises(subject.MetricPiqdCvc5Error, match="custody mismatch"):
        subject.run_prepared_system(changed, tmp_path / "tampered", fake)
    assert fake.calls == []


def test_forged_nonfrontier_selection_is_rejected(tmp_path: Path) -> None:
    with pytest.raises(subject.MetricPiqdCvc5Error, match="current frontier"):
        subject.prepare_system(_selection(tmp_path), timeout_ms=5000)


def test_descriptor_cannot_inject_assumptions_or_omit_readback(
    tmp_path: Path, prepared: subject.PreparedSystem
) -> None:
    descriptor = dict(prepared.query.descriptor)
    descriptor["named_atoms"] = [{"id": "bad", "assumption_term": "false"}]
    descriptor["solve"] = {
        "assumption_ids": ["bad"],
        "readback_variable_ids": [],
        "include_model": False,
    }
    changed_query = replace(
        prepared.query,
        descriptor=descriptor,
        descriptor_bytes=subject._canonical(descriptor) + b"\n",
    )
    fake = FakePiqd("UNSAT")
    with pytest.raises(subject.MetricPiqdCvc5Error, match="custody mismatch"):
        subject.run_prepared_system(
            replace(prepared, query=changed_query), tmp_path / "injected", fake
        )
    assert fake.calls == []


def test_source_change_during_reconstruction_fails_closed(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    path = tmp_path / "source.json"
    raw = b"{}\n"
    path.write_bytes(raw)

    def fake_extract(
        paths: tuple[Path, ...],
    ) -> tuple[list[dict[str, Any]], dict[str, Any]]:
        assert paths[0].read_bytes() == raw
        path.write_text('{"changed":true}\n', encoding="utf-8")
        return [subject._validate_system(_square_system())], {
            "input_files": [
                {
                    "path": os.path.relpath(paths[0], subject.ROOT),
                    "sha256": _sha(raw),
                },
            ]
        }

    monkeypatch.setattr(subject.producer, "extract_systems", fake_extract)
    monkeypatch.setattr(subject.producer, "_frontier", lambda systems: systems)
    with pytest.raises(subject.MetricPiqdCvc5Error, match="changed after capture"):
        subject.load_selected_system(_square_system()["system_id"], (path,))


def test_nofollow_source_and_nonbuiltin_fields_are_rejected(tmp_path: Path) -> None:
    target = tmp_path / "target.json"
    target.write_text("{}\n", encoding="utf-8")
    link = tmp_path / "link.json"
    link.symlink_to(target)
    with pytest.raises(subject.MetricPiqdCvc5Error, match="without following links"):
        subject._capture_inputs((link,))
    invalid = _square_system()
    invalid["n"] = True
    with pytest.raises(subject.MetricPiqdCvc5Error, match="bounded range"):
        subject._validate_system(invalid)


def test_create_once_canonical_artifacts(
    tmp_path: Path, prepared: subject.PreparedSystem
) -> None:
    output = tmp_path / "result"
    result = subject.run_prepared_system(prepared, output, FakePiqd("UNSAT"))
    raw = (output / "result.json").read_bytes()
    assert raw == subject._canonical(result) + b"\n"
    with pytest.raises(neutral.SmtSourceAdapterError, match="already exists"):
        subject.run_prepared_system(prepared, output, FakePiqd("UNSAT"))


def test_cli_has_no_worker_or_local_solver_surface() -> None:
    args = subject._parse_args(
        ["--system-id", "0b12b25bf5daa7566f98", "--out", "scratch/fake"]
    )
    assert args.system_id == "0b12b25bf5daa7566f98"
    assert not hasattr(args, "workers")
    assert not hasattr(args, "cvc5")


def test_cli_http_timeout_exceeds_disclosed_effective_deadline(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    captured: dict[str, object] = {}
    selection = object()
    prepared = object()
    transport = object()

    monkeypatch.setattr(subject, "load_selected_system", lambda *_args: selection)

    def fake_prepare(candidate: object, *, timeout_ms: int) -> object:
        assert candidate is selection
        captured["timeout_ms"] = timeout_ms
        return prepared

    def fake_transport(server: str, *, http_timeout_s: float) -> object:
        captured["server"] = server
        captured["http_timeout_s"] = http_timeout_s
        return transport

    def fake_run(candidate: object, output: Path, client: object) -> dict[str, object]:
        assert candidate is prepared and client is transport
        assert output == tmp_path / "out"
        return {
            "classification": "UNKNOWN_INCONCLUSIVE",
            "effective_status": "INCONCLUSIVE_UNKNOWN",
            "system_id": "system",
        }

    monkeypatch.setattr(subject, "prepare_system", fake_prepare)
    monkeypatch.setattr(subject.neutral, "UrllibPiqdTransport", fake_transport)
    monkeypatch.setattr(subject, "run_prepared_system", fake_run)

    assert (
        subject.main(
            [
                "--system-id",
                "system",
                "--out",
                os.fspath(tmp_path / "out"),
                "--timeout-ms",
                "20000",
            ]
        )
        == 0
    )
    assert captured == {
        "timeout_ms": 20_000,
        "server": "http://127.0.0.1:7272",
        "http_timeout_s": 55.0,
    }
    assert captured["http_timeout_s"] * 1000 > 50_000

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

from census.p97_search import phase3_piqd_smt_source_adapter as neutral
from census.p97_search import phase3_piqd_survivor_cvc5 as subject
from census.p97_search import phase3_survivor_cvc5_driver as legacy


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


def _convex_values(terms: list[str]) -> str:
    coordinates: dict[str, Fraction] = {}
    for point, parameter in enumerate(
        (
            Fraction(1, 8),
            Fraction(1, 4),
            Fraction(1, 2),
            Fraction(3, 4),
            Fraction(1),
            Fraction(3, 2),
            Fraction(2),
            Fraction(4),
        ),
        start=2,
    ):
        coordinates[f"x_{point}"] = 1 / (1 + parameter * parameter)
        coordinates[f"y_{point}"] = parameter / (1 + parameter * parameter)

    def smt(value: Fraction) -> str:
        if value.denominator == 1:
            return str(value.numerator)
        return f"(/ {value.numerator} {value.denominator})"

    return "(" + " ".join(f"({term} {smt(coordinates[term])})" for term in terms) + ")"


class FakePiqd:
    def __init__(
        self,
        status: str,
        *,
        tamper: str | None = None,
        interrupted_by: str | None = None,
        include_replayed: bool = True,
    ) -> None:
        self.status = status
        self.tamper = tamper
        self.interrupted_by = interrupted_by
        self.include_replayed = include_replayed
        self.calls: list[tuple[str, str, object]] = []
        self.sessions: dict[str, dict[str, Any]] = {}
        self.solve_calls = 0
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
            session_id = str(
                uuid.UUID(
                    int=1 if self.tamper == "reuse_identity" else len(self.sessions) + 1
                )
            )
            data = {
                "label": body["label"],
                "commands": [],
                "journal": b"",
                "receipt": None,
                "solve": None,
                "answer": None,
            }
            self.sessions[session_id] = data
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
            data["solve"] = dict(body)
            answer = self._answer(list(body["get_values"]))
            digest = neutral.piqd_result_digest(answer)
            # Optional current-daemon compatibility field: receipt/result
            # binding intentionally remains keyed to the answer fields only.
            response = {
                **answer,
                "solve_ms": 3,
                "solve_index": 1,
                "result_sha256": digest,
            }
            if self.include_replayed:
                response["replayed"] = False
            receipt = {
                "solve_index": 1,
                "base_commands": len(data["commands"]),
                "base_bytes": len(data["journal"]),
                "base_sha256": _sha(data["journal"]),
                "solver_signature": "cvc5 fake-current-schema",
                "solver_sha256": _sha(b"fake-cvc5-binary"),
                "assumptions": list(body["assumptions"]),
                "timeout_ms": body["timeout_ms"],
                "include_model": body["include_model"],
                "get_values": list(body["get_values"]),
                **answer,
                "solve_ms": 3,
                "result_sha256": digest,
                "at": 14,
            }
            if self.tamper == "receipt_base_hash":
                receipt["base_sha256"] = "0" * 64
            if self.tamper == "receipt_signature":
                receipt["solver_signature"] = "cvc5 different"
            if self.tamper == "receipt_query":
                receipt["get_values"] = []
            data["answer"], data["receipt"] = answer, receipt
            return neutral.JsonResponse(200, response)
        if method == "GET" and suffix == "/receipts":
            receipts = [] if data["receipt"] is None else [data["receipt"]]
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
        extra = b"(set-option :nl-cov true)\n" if self.tamper == "export" else b""
        return neutral.BytesResponse(200, self.sessions[session_id]["journal"] + extra)

    def _route(self, path: str) -> tuple[str, str]:
        parts = path.split("/")
        session_id = parts[2]
        return session_id, "" if len(parts) == 3 else "/" + "/".join(parts[3:])

    def _answer(self, terms: list[str]) -> dict[str, object]:
        if self.status == "SAT":
            return {
                "status": "SAT",
                "model": "(model)",
                "values": _convex_values(terms),
            }
        if self.status == "UNSAT":
            return {"status": "UNSAT", "core": [], "terminal_unsat": True}
        answer: dict[str, object] = {"status": "UNKNOWN"}
        if self.interrupted_by is not None:
            answer["interrupted_by"] = self.interrupted_by
        return answer


@pytest.fixture(scope="module")
def prepared() -> subject.PreparedSystem:
    rows = [
        {
            "center": center,
            "support": [point for point in range(10) if point != center][:4],
            "exact": False,
        }
        for center in range(10)
    ]
    system = {
        "system_id": "synthetic-phase3-control",
        "n": 10,
        "profile": [4, 4, 5],
        "order": list(range(10)),
        "rows": rows,
    }
    item = legacy.UniqueSystem(
        system_id=system["system_id"],
        system=system,
        prior_z3_status="UNKNOWN",
        source_leaves=({"synthetic": True},),
    )
    return subject.prepare_system(
        0, item, {"manifest_sha256": "a" * 64}, timeout_ms=5000
    )


def test_packet_binds_exact_archived_query_and_first_nl_cov(
    prepared: subject.PreparedSystem,
) -> None:
    assert prepared.query.journal_commands[0] == subject.NL_COV_COMMAND
    assert prepared.query.journal_commands[1:] == tuple(
        neutral.split_smt2_commands(
            subject._strip_terminal_query(prepared.original_smt2).decode()
        )
    )
    assert prepared.original_smt2.endswith(b"(check-sat)\n(exit)\n")
    assert prepared.query.descriptor["solver_profile"]["solvers"] == ["cvc5"]
    subject._validate_prepared(prepared)


def test_known_sat_control_replays_exact_rationals(
    prepared: subject.PreparedSystem,
) -> None:
    descriptor = json.loads(json.dumps(prepared.query.descriptor))
    descriptor["semantic_input"]["system"] = {"rows": [], "order": list(range(10))}
    query = replace(prepared.query, descriptor=descriptor)
    verification = subject.verify_sat_model(
        query, "cvc5", "(model)", _convex_values(list(query.get_values))
    )
    assert verification.accepted is True
    assert verification.evidence["checks"] == {
        "distinctness": 45,
        "row_equalities": 0,
        "convex_order": 80,
    }


def test_known_unsat_control_is_diagnostic_only(
    tmp_path: Path, prepared: subject.PreparedSystem
) -> None:
    fake = FakePiqd("UNSAT")
    result = subject.run_prepared_system(prepared, tmp_path / "unsat", fake)
    assert result["effective_status"] == "UNSAT_DISCOVERY_ONLY"
    assert result["classification"] == "CVC5_UNSAT_DIAGNOSTIC_NOT_KERNEL_CHECKED"
    assert result["claims"] == subject.FALSE_CLAIMS
    assert fake.solve_calls == 1 and fake.active == 0


def test_unknown_daemon_deadline_is_explicit(
    tmp_path: Path, prepared: subject.PreparedSystem
) -> None:
    result = subject.run_prepared_system(
        prepared,
        tmp_path / "unknown",
        FakePiqd("UNKNOWN", interrupted_by="daemon_deadline"),
    )
    assert result["effective_status"] == "INCONCLUSIVE_UNKNOWN"
    assert result["engine"]["raw_status"] == "UNKNOWN"


def test_current_daemon_response_without_optional_replayed_is_valid(
    tmp_path: Path, prepared: subject.PreparedSystem
) -> None:
    result = subject.run_prepared_system(
        prepared,
        tmp_path / "absent-replayed",
        FakePiqd("UNSAT", include_replayed=False),
    )
    assert result["raw_status"] == "UNSAT"
    assert result["effective_status"] == "UNSAT_DISCOVERY_ONLY"


def test_sat_model_that_does_not_satisfy_rows_is_rejected(
    tmp_path: Path, prepared: subject.PreparedSystem
) -> None:
    result = subject.run_prepared_system(prepared, tmp_path / "sat", FakePiqd("SAT"))
    assert result["raw_status"] == "SAT"
    assert result["effective_status"] == "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED"


@pytest.mark.parametrize(
    "tamper",
    [
        "export",
        "create_identity",
        "receipt_base_hash",
        "receipt_signature",
        "receipt_query",
    ],
)
def test_transport_tamper_fails_closed(
    tmp_path: Path, prepared: subject.PreparedSystem, tamper: str
) -> None:
    fake = FakePiqd("UNSAT", tamper=tamper)
    with pytest.raises(neutral.SmtSourceAdapterError):
        subject.run_prepared_system(prepared, tmp_path / tamper, fake)
    assert fake.active == 0


def test_reused_session_identity_fails_closed_across_systems(
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


@pytest.mark.parametrize("part", ["source", "descriptor", "original", "journal"])
def test_local_custody_tamper_fails_before_transport(
    tmp_path: Path, prepared: subject.PreparedSystem, part: str
) -> None:
    query = prepared.query
    changed = prepared
    if part == "source":
        changed = replace(
            prepared, source_record_bytes=prepared.source_record_bytes + b" "
        )
    elif part == "descriptor":
        changed = replace(
            prepared,
            query=replace(query, descriptor_bytes=query.descriptor_bytes + b" "),
        )
    elif part == "original":
        changed = replace(prepared, original_smt2=prepared.original_smt2 + b" ")
    else:
        changed = replace(
            prepared, query=replace(query, journal_smt2=query.journal_smt2 + b" ")
        )
    fake = FakePiqd("UNSAT")
    with pytest.raises(subject.Phase3PiqdCvc5Error, match="custody mismatch"):
        subject.run_prepared_system(changed, tmp_path / part, fake)
    assert fake.calls == []


def test_production_cli_defaults_to_piqd_and_one_worker() -> None:
    args = legacy._parse_args([])
    assert args.backend == "piqd"
    assert args.workers is None


def test_backend_worker_defaults_are_resolved_after_backend_selection(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    seen: dict[str, object] = {}

    def fake_legacy_run(**kwargs: object) -> dict[str, object]:
        seen.update(kwargs)
        return {"counts": {"status": {"ERROR": 0}}}

    monkeypatch.setattr(legacy, "run_driver", fake_legacy_run)
    assert (
        legacy.main(["--backend", "legacy-local", "--out", str(tmp_path / "legacy")])
        == 0
    )
    assert seen["workers"] == min(legacy.MAX_WORKERS, os.cpu_count() or 1)


def test_offline_validator_rejects_permuted_indices_and_noncanonical_scalars(
    tmp_path: Path,
) -> None:
    output = tmp_path / "wave"
    subject.run_wave(
        source_dir=subject.DEFAULT_SOURCE,
        out_dir=output,
        server="fake",
        workers=1,
        timeout_ms=1000,
        transport=FakePiqd("UNSAT"),
    )
    manifest_path = output / "manifest.json"
    original = manifest_path.read_bytes()

    def check_tamper(mutator: Any, match: str) -> None:
        manifest = json.loads(original)
        mutator(manifest)
        unsigned = dict(manifest)
        unsigned.pop("manifest_sha256", None)
        manifest["manifest_sha256"] = subject._sha(subject._canonical(unsigned))
        manifest_path.chmod(0o600)
        manifest_path.write_bytes(subject._canonical(manifest) + b"\n")
        try:
            with pytest.raises(subject.Phase3PiqdCvc5Error, match=match):
                subject.validate_wave_output(output, subject.DEFAULT_SOURCE)
        finally:
            manifest_path.write_bytes(original)
            manifest_path.chmod(0o400)

    check_tamper(
        lambda manifest: manifest["results"].__setitem__(
            0,
            {
                **manifest["results"][0],
                "system_id": manifest["results"][1]["system_id"],
            },
        ),
        "index/system pairing",
    )
    check_tamper(
        lambda manifest: manifest["profile"].__setitem__("workers", 2),
        "scalar schema",
    )
    check_tamper(
        lambda manifest: manifest["results"][0].__setitem__("status", "ERROR"),
        "result status",
    )


def test_piqd_default_is_authenticated_current_fixture() -> None:
    assert subject.DEFAULT_SOURCE.name == "phase3_survivor_metric_100_current"
    authenticated = subject.load_authenticated_current_source(subject.DEFAULT_SOURCE)
    assert (
        authenticated.manifest["manifest_sha256"]
        == "2cabdd2f9270c332b7f12ff8af843768b57d27c5a90a5805acc5b33833affd39"
    )
    assert len(authenticated.systems) == legacy.EXPECTED_UNIQUE_SYSTEMS
    assert authenticated.token.digest == subject._snapshot_digest(
        dict(authenticated.token._snapshot)
    )
    subject.recheck_authenticated_current_source(authenticated.token)


def test_wave_publication_rejects_missing_entry_before_rename(
    tmp_path: Path,
) -> None:
    output = tmp_path / "missing-entry"
    root = subject._wave_root(output)
    try:
        subject._write_wave_file(root, "source-manifest.json", b"{}\n")
        subject._write_wave_file(root, "manifest.json", b"{}\n")
        with pytest.raises(subject.Phase3PiqdCvc5Error, match="before publication"):
            subject._publish_wave_root(
                root, {"source-manifest.json", "manifest.json", "00-missing-leaf"}
            )
    finally:
        neutral._close_output_staging(root.staging, keep=False)
    assert not (tmp_path / "missing-entry").exists()


def test_wave_publication_is_create_once_and_offline_replay(
    tmp_path: Path,
) -> None:
    output = tmp_path / "wave"
    manifest = subject.run_wave(
        source_dir=subject.DEFAULT_SOURCE,
        out_dir=output,
        server="fake",
        workers=1,
        timeout_ms=1000,
        transport=FakePiqd("UNSAT"),
    )
    assert manifest["status_counts"] == {
        "SAT": 0,
        "UNSAT": 48,
        "UNKNOWN": 0,
        "ERROR": 0,
    }
    assert (
        subject.validate_wave_output(output, subject.DEFAULT_SOURCE)["system_count"]
        == 48
    )
    with pytest.raises(subject.Phase3PiqdCvc5Error, match="already exists"):
        subject.run_wave(
            source_dir=subject.DEFAULT_SOURCE,
            out_dir=output,
            server="fake",
            workers=1,
            timeout_ms=1000,
            transport=FakePiqd("UNSAT"),
        )


def test_deterministic_producer_failure_aborts_whole_wave(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    def fail_prepare(*_args: object, **_kwargs: object) -> subject.PreparedSystem:
        raise subject.Phase3PiqdCvc5Error("synthetic producer failure")

    monkeypatch.setattr(subject, "prepare_system", fail_prepare)
    with pytest.raises(subject.Phase3PiqdCvc5Error, match="synthetic producer failure"):
        subject.run_wave(
            source_dir=subject.DEFAULT_SOURCE,
            out_dir=tmp_path / "aborted",
            server="fake",
            workers=1,
            timeout_ms=1000,
            transport=FakePiqd("UNSAT"),
        )


def test_solver_failure_aborts_and_preserves_private_staging(tmp_path: Path) -> None:
    with pytest.raises((subject.Phase3PiqdSolverError, neutral.SmtSourceAdapterError)):
        subject.run_wave(
            source_dir=subject.DEFAULT_SOURCE,
            out_dir=tmp_path / "errors",
            server="fake",
            workers=1,
            timeout_ms=1000,
            transport=FakePiqd("UNSAT", tamper="export"),
        )
    assert not (tmp_path / "errors").exists()
    assert any(
        path.name.startswith(".piqd-smt-tombstone-") for path in tmp_path.iterdir()
    )


def test_wave_rejects_more_than_one_worker_before_source_access(tmp_path: Path) -> None:
    with pytest.raises(ValueError, match="workers=1"):
        subject.run_wave(
            source_dir=tmp_path / "missing",
            out_dir=tmp_path / "out",
            server="http://127.0.0.1:7272",
            workers=2,
            timeout_ms=5000,
            transport=FakePiqd("UNSAT"),
        )


def test_production_piqd_route_bypasses_every_local_gate(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    seen: dict[str, object] = {}

    def fake_wave(**kwargs: object) -> dict[str, object]:
        seen.update(kwargs)
        return {"status_counts": {"SAT": 0, "UNSAT": 1, "UNKNOWN": 0, "ERROR": 0}}

    monkeypatch.setattr(subject, "run_wave", fake_wave)
    monkeypatch.setattr(
        legacy,
        "_resolve_cvc5",
        lambda _value: pytest.fail("PIQD route called the local executable resolver"),
    )
    assert legacy.main(["--source", str(tmp_path / "source")]) == 0
    assert seen["out_dir"] == subject.DEFAULT_OUT
    assert seen["workers"] == 1


@pytest.mark.parametrize(
    "error",
    [
        subject.Phase3PiqdCvc5Error("fake PIQD adapter failure"),
        neutral.SmtSourceAdapterError("fake PIQD transport failure"),
    ],
)
def test_production_piqd_route_expected_failures_exit_two(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
    error: BaseException,
) -> None:
    def fail_wave(**kwargs: object) -> dict[str, object]:
        raise error

    monkeypatch.setattr(subject, "run_wave", fail_wave)
    assert legacy.main(["--source", str(tmp_path / "source")]) == 2
    assert "driver failed: fake PIQD" in capsys.readouterr().out


def test_production_piqd_route_unexpected_runtime_error_propagates(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    def fail_wave(**kwargs: object) -> dict[str, object]:
        raise RuntimeError("unexpected runtime failure")

    monkeypatch.setattr(subject, "run_wave", fail_wave)
    with pytest.raises(RuntimeError, match="unexpected runtime failure"):
        legacy.main(["--source", str(tmp_path / "source")])

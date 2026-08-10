from __future__ import annotations

import hashlib
import json
import os
import shutil
import uuid
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import phase3_piqd_freshthird_smt_session as subject
from census.p97_search.phase3_piqd_statement_bank_runner import JsonHttpResponse


def _session(
    session_id: str,
    solver: str,
    label: str,
    journal_path: object,
    *,
    state: str = "live",
    clauses: int = 0,
    solves: int = 0,
    status: str | None = None,
) -> dict[str, object]:
    return {
        "id": session_id,
        "lane": "smt",
        "state": state,
        "solver_name": solver,
        "solver_sha256": hashlib.sha256(f"binary:{solver}".encode()).hexdigest(),
        "solver_signature": f"{solver}-test",
        "protocol_version": 1,
        "journal_path": journal_path,
        "created_at": 1,
        "updated_at": 2,
        "clauses": clauses,
        "max_var": 0,
        "solves": solves,
        "last_status": status,
        "declared_num_vars": None,
        "last_solve_index": None if solves == 0 else 1,
        "last_assumption_free": None if solves == 0 else True,
        "last_terminal_unsat": True if status == "UNSAT" else None,
        "label": label,
    }


class FakePiqd:
    def __init__(
        self,
        *,
        lose_solve_response: bool = False,
        lose_without_receipt: bool = False,
        corrupt_receipt: bool = False,
        extra_create_key: bool = False,
        extra_solve_key: bool = False,
        sat_with_invalid_model: bool = False,
        all_sat_complete: bool = False,
        sat_model: str | None = None,
        journal_path_mode: str = "valid",
        receipts_path_mode: str = "valid",
        create_status: int = 201,
    ) -> None:
        self.sessions: dict[str, dict[str, Any]] = {}
        self.calls: list[tuple[str, str, object]] = []
        self.lose_solve_response = lose_solve_response
        self.lose_without_receipt = lose_without_receipt
        self.corrupt_receipt = corrupt_receipt
        self.extra_create_key = extra_create_key
        self.extra_solve_key = extra_solve_key
        self.sat_with_invalid_model = sat_with_invalid_model
        self.all_sat_complete = all_sat_complete
        self.sat_model = sat_model
        self.journal_path_mode = journal_path_mode
        self.receipts_path_mode = receipts_path_mode
        self.create_status = create_status
        self._lost_once = False
        self.data_root: Path | None = None

    def bind_data_root(self, data_root: Path) -> None:
        if self.data_root is not None:
            assert self.data_root == data_root
            return
        self.data_root = data_root
        (data_root / "sessions").mkdir(parents=True, exist_ok=True)

    def _artifact_path(self, session_id: str, basename: str, mode: str) -> object:
        assert self.data_root is not None
        if mode == "type":
            return 7
        if mode == "outside":
            return str(self.data_root.parent / "outside" / session_id / basename)
        if mode == "crossed":
            crossed = str(uuid.UUID(int=999))
            return str(self.data_root / "sessions" / crossed / basename)
        if mode == "noncanonical":
            return f"{self.data_root}/sessions/{session_id}/../{session_id}/{basename}"
        if mode == "wrong_basename":
            return str(self.data_root / "sessions" / session_id / f"wrong-{basename}")
        assert mode == "valid"
        return str(self.data_root / "sessions" / session_id / basename)

    @staticmethod
    def _complete_values(terms: list[str]) -> str:
        pairs: list[str] = []
        for term in terms:
            if term.startswith(("mode_", "inter_", "shell_outside_")):
                value = (
                    "2"
                    if term.startswith("mode_")
                    else ("3" if term.startswith("shell_outside_") else "0")
                )
            elif (
                term.startswith("shell_pc_") and term.endswith("_q")
            ) or term == "true":
                value = "true"
            else:
                value = "false"
            pairs.append(f"({term} {value})")
        return "(" + " ".join(pairs) + ")"

    def request(self, method: str, path: str, body=None) -> JsonHttpResponse:
        self.calls.append((method, path, body))
        assert not path.endswith("/model"), "the adapter must never use GET /model"
        if method == "POST" and path == "/sessions":
            assert self.data_root is not None
            assert body["solver"] in subject.SOLVERS
            assert body["lane"] == "smt"
            session_id = str(uuid.UUID(int=len(self.sessions) + 1))
            session_dir = self.data_root / "sessions" / session_id
            session_dir.mkdir(parents=True)
            (session_dir / "journal.smt2").write_bytes(b"")
            (session_dir / "receipts.jsonl").write_bytes(b"")
            data = _session(
                session_id,
                body["solver"],
                body["label"],
                self._artifact_path(session_id, "journal.smt2", self.journal_path_mode),
            )
            self.sessions[session_id] = {
                "data": data,
                "commands": [],
                "journal": b"",
                "receipt": None,
            }
            if self.extra_create_key:
                data["unexpected"] = True
            return JsonHttpResponse(self.create_status, data)
        session_id, tail = self._route(path)
        current = self.sessions[session_id]
        data = current["data"]
        if method == "POST" and tail == "assert":
            assert body["expect_commands"] == 0
            assert not current["commands"]
            current["commands"] = list(body["commands"])
            current["journal"] = b"".join(
                command.encode() + b"\n" for command in body["commands"]
            )
            assert self.data_root is not None
            (self.data_root / "sessions" / session_id / "journal.smt2").write_bytes(
                current["journal"]
            )
            data["clauses"] = len(body["commands"])
            return JsonHttpResponse(
                200, {"added": len(body["commands"]), "commands": len(body["commands"])}
            )
        if method == "GET" and tail == "receipts":
            receipts = [] if current["receipt"] is None else [current["receipt"]]
            return JsonHttpResponse(
                200,
                {
                    "session_id": session_id,
                    "lane": "smt",
                    "journal_path": data["journal_path"],
                    "receipts_path": self._artifact_path(
                        session_id, "receipts.jsonl", self.receipts_path_mode
                    ),
                    "count": len(receipts),
                    "receipts": receipts,
                },
            )
        if method == "POST" and tail == "solve":
            assert body == {
                "assumptions": [],
                "timeout_ms": 20_000,
                "include_model": True,
                "get_values": body["get_values"],
            }
            if self.lose_without_receipt and not self._lost_once:
                self._lost_once = True
                raise OSError("connection disappeared before commit")
            if self.sat_model is not None:
                answer = {
                    "status": "SAT",
                    "model": self.sat_model,
                    "values": self._complete_values(body["get_values"]),
                }
            elif self.all_sat_complete:
                answer = {
                    "status": "SAT",
                    "model": "(model (define-fun witness () Bool true))",
                    "values": self._complete_values(body["get_values"]),
                }
            elif self.sat_with_invalid_model:
                answer: dict[str, object] = {
                    "status": "SAT",
                    "model": "not-a-model",
                    "values": "("
                    + " ".join(f"({term} false)" for term in body["get_values"])
                    + ")",
                }
            else:
                answer = {"status": "UNSAT", "core": [], "terminal_unsat": True}
            result_sha256 = subject._piqd_result_digest(answer)
            solve = {
                **answer,
                "solve_ms": 3,
                "solve_index": 1,
                "result_sha256": result_sha256,
            }
            receipt = {
                "solve_index": 1,
                "base_commands": len(current["commands"]),
                "base_bytes": len(current["journal"]),
                "base_sha256": hashlib.sha256(current["journal"]).hexdigest(),
                "solver_signature": data["solver_signature"],
                "solver_sha256": data["solver_sha256"],
                "assumptions": [],
                "timeout_ms": 20_000,
                "include_model": True,
                "get_values": body["get_values"],
                **answer,
                "solve_ms": 3,
                "result_sha256": result_sha256,
                "at": 3,
            }
            if self.corrupt_receipt:
                receipt["base_sha256"] = "b" * 64
            current["receipt"] = receipt
            data["solves"] = 1
            data["last_status"] = answer["status"]
            data["last_solve_index"] = 1
            data["last_assumption_free"] = True
            data["last_terminal_unsat"] = True if answer["status"] == "UNSAT" else None
            if self.lose_solve_response and not self._lost_once:
                self._lost_once = True
                raise OSError("response lost after durable commit")
            if self.extra_solve_key:
                solve["unexpected"] = True
            return JsonHttpResponse(200, solve)
        if method == "DELETE" and tail == "":
            data["state"] = "closed"
            return JsonHttpResponse(200, data)
        raise AssertionError((method, path, body))

    @staticmethod
    def _route(path: str) -> tuple[str, str]:
        parts = path.strip("/").split("/")
        assert parts[0] == "sessions" and len(parts) in {2, 3}
        return parts[1], "" if len(parts) == 2 else parts[2]


class FakeDownload:
    def __init__(self, piqd: FakePiqd, *, lie_about_digest: bool = False) -> None:
        self.piqd = piqd
        self.lie_about_digest = lie_about_digest

    def download(
        self, method: str, path: str, destination_fd: int, *, byte_cap: int
    ) -> subject.DownloadResponse:
        assert method == "GET" and path.endswith("/smt2")
        session_id = path.strip("/").split("/")[1]
        payload = self.piqd.sessions[session_id]["journal"]
        assert len(payload) <= byte_cap
        os.write(destination_fd, payload)
        digest = (
            "0" * 64 if self.lie_about_digest else hashlib.sha256(payload).hexdigest()
        )
        return subject.DownloadResponse(200, len(payload), digest)


def _run(
    tmp_path: Path,
    fake: FakePiqd,
    *,
    downloader: FakeDownload | None = None,
    frozen_root: Path = subject.DEFAULT_FROZEN_ROOT,
):
    data_root = tmp_path / "piqd-data"
    fake.bind_data_root(data_root)
    return subject.run_freshthird_smt_session(
        output_dir=tmp_path / "run",
        piqd_data_root=data_root,
        json_transport=fake,
        download_transport=downloader or FakeDownload(fake),
        frozen_root=frozen_root,
    )


def _validate_session_response(
    tmp_path: Path,
    *,
    phase: str,
    field: str | None = None,
    value: object = None,
    missing: bool = False,
) -> dict[str, object]:
    assert phase in {"create", "close"}
    data_root = tmp_path / "piqd-data"
    session_id = str(uuid.UUID(int=1))
    session_dir = data_root / "sessions" / session_id
    session_dir.mkdir(parents=True)
    journal = session_dir / "journal.smt2"
    journal.write_bytes(b"")
    closed = phase == "close"
    data = _session(
        session_id,
        "z3",
        "schema regression",
        str(journal),
        state="closed" if closed else "live",
        solves=1 if closed else 0,
        status="UNSAT" if closed else None,
    )
    if field is not None:
        if missing:
            data.pop(field)
        else:
            data[field] = value
    data_root_text, data_root_fd = subject._open_piqd_data_root(data_root)
    try:
        return subject._session(
            data,
            solver="z3",
            state="closed" if closed else "live",
            solves=1 if closed else 0,
            last_status="UNSAT" if closed else None,
            data_root=data_root_text,
            data_root_fd=data_root_fd,
        )
    finally:
        os.close(data_root_fd)


def test_full_fake_run_is_strictly_sequential_and_self_hashed(tmp_path: Path) -> None:
    fake = FakePiqd()
    result = _run(tmp_path, fake)
    receipt = result.receipt
    unsigned = dict(receipt)
    digest = unsigned.pop("receipt_sha256")
    assert digest == hashlib.sha256(subject._canonical(unsigned)).hexdigest()
    assert receipt["claims"] == subject.FALSE_CLAIMS
    assert [case["case"] for case in receipt["cases"]] == list(subject.CASE_NAMES)
    creates = [
        body["solver"]
        for method, path, body in fake.calls
        if (method, path) == ("POST", "/sessions")
    ]
    assert creates == [
        solver for _case in subject.CASE_NAMES for solver in subject.SOLVERS
    ]
    assert len(set(fake.sessions)) == 24
    assert all(
        session["data"]["state"] == "closed" for session in fake.sessions.values()
    )
    assert not any(path.endswith("/model") for _, path, _ in fake.calls)
    assert (tmp_path / "run/receipt.json").is_file()
    assert all(case["verdict"] != "UNKNOWN" for case in receipt["cases"])
    first_engine = receipt["cases"][0]["engines"]["z3"]
    assert {
        key: first_engine["session"][key]
        for key in subject._SESSION_KEYS
        & {
            "declared_num_vars",
            "last_solve_index",
            "last_assumption_free",
            "last_terminal_unsat",
        }
    } == {
        "declared_num_vars": None,
        "last_solve_index": None,
        "last_assumption_free": None,
        "last_terminal_unsat": None,
    }
    assert {
        key: first_engine["closed_session"][key]
        for key in subject._SESSION_KEYS
        & {
            "declared_num_vars",
            "last_solve_index",
            "last_assumption_free",
            "last_terminal_unsat",
        }
    } == {
        "declared_num_vars": None,
        "last_solve_index": 1,
        "last_assumption_free": True,
        "last_terminal_unsat": True,
    }
    data_root = tmp_path / "piqd-data"
    assert all(
        session["data"]["journal_path"]
        == str(data_root / "sessions" / session_id / "journal.smt2")
        for session_id, session in fake.sessions.items()
    )


def test_create_requires_current_core_http_201(tmp_path: Path) -> None:
    with pytest.raises(subject.FreshThirdSmtSessionError, match="exact HTTP 201"):
        _run(tmp_path, FakePiqd(create_status=200))


@pytest.mark.parametrize("phase", ["create", "close"])
@pytest.mark.parametrize(
    "field",
    [
        "declared_num_vars",
        "last_solve_index",
        "last_assumption_free",
        "last_terminal_unsat",
    ],
)
def test_session_response_requires_all_current_provenance_keys(
    tmp_path: Path, phase: str, field: str
) -> None:
    with pytest.raises(subject.FreshThirdSmtSessionError, match="unexpected JSON keys"):
        _validate_session_response(tmp_path, phase=phase, field=field, missing=True)


@pytest.mark.parametrize(
    ("phase", "field", "value"),
    [
        ("create", "declared_num_vars", 0),
        ("create", "last_solve_index", 1),
        ("create", "last_assumption_free", True),
        ("create", "last_terminal_unsat", False),
        ("close", "declared_num_vars", 0),
        ("close", "last_solve_index", 2),
        ("close", "last_assumption_free", False),
        ("close", "last_terminal_unsat", False),
    ],
)
def test_session_response_rejects_wrong_provenance_values(
    tmp_path: Path, phase: str, field: str, value: object
) -> None:
    with pytest.raises(subject.FreshThirdSmtSessionError, match="solve provenance"):
        _validate_session_response(tmp_path, phase=phase, field=field, value=value)


@pytest.mark.parametrize(
    ("field", "value", "message"),
    [
        ("declared_num_vars", True, "exact integer or null"),
        ("declared_num_vars", 0.0, "exact integer or null"),
        ("last_solve_index", True, "exact integer or null"),
        ("last_solve_index", 1.0, "exact integer or null"),
        ("last_assumption_free", 1, "Boolean or null"),
        ("last_assumption_free", 1.0, "Boolean or null"),
        ("last_terminal_unsat", 1, "Boolean or null"),
        ("last_terminal_unsat", 1.0, "Boolean or null"),
    ],
)
def test_session_response_rejects_bool_float_type_confusion(
    tmp_path: Path, field: str, value: object, message: str
) -> None:
    with pytest.raises(subject.FreshThirdSmtSessionError, match=message):
        _validate_session_response(tmp_path, phase="close", field=field, value=value)


@pytest.mark.parametrize(
    "mode", ["outside", "crossed", "noncanonical", "wrong_basename", "type"]
)
def test_journal_path_rejects_adversarial_absolute_contracts(
    tmp_path: Path, mode: str
) -> None:
    with pytest.raises(subject.FreshThirdSmtSessionError):
        _run(tmp_path, FakePiqd(journal_path_mode=mode))


@pytest.mark.parametrize(
    "mode", ["outside", "crossed", "noncanonical", "wrong_basename", "type"]
)
def test_receipts_path_rejects_adversarial_absolute_contracts(
    tmp_path: Path, mode: str
) -> None:
    with pytest.raises(subject.FreshThirdSmtSessionError):
        _run(tmp_path, FakePiqd(receipts_path_mode=mode))


def test_symlinked_piqd_sessions_parent_is_rejected(tmp_path: Path) -> None:
    data_root = tmp_path / "piqd-data"
    data_root.mkdir()
    real_sessions = tmp_path / "real-sessions"
    real_sessions.mkdir()
    (data_root / "sessions").symlink_to(real_sessions, target_is_directory=True)
    fake = FakePiqd()
    fake.bind_data_root(data_root)
    with pytest.raises(subject.FreshThirdSmtSessionError, match="following links"):
        subject.run_freshthird_smt_session(
            output_dir=tmp_path / "run",
            piqd_data_root=data_root,
            json_transport=fake,
            download_transport=FakeDownload(fake),
        )


def test_noncanonical_piqd_data_root_is_rejected(tmp_path: Path) -> None:
    canonical = tmp_path / "piqd-data"
    fake = FakePiqd()
    fake.bind_data_root(canonical)
    noncanonical = tmp_path / "child" / ".." / "piqd-data"
    with pytest.raises(subject.FreshThirdSmtSessionError, match="canonical absolute"):
        subject.run_freshthird_smt_session(
            output_dir=tmp_path / "run",
            piqd_data_root=noncanonical,
            json_transport=fake,
            download_transport=FakeDownload(fake),
        )


def test_lost_solve_response_is_reconciled_without_retry(tmp_path: Path) -> None:
    fake = FakePiqd(lose_solve_response=True)
    result = _run(tmp_path, fake)
    first = result.receipt["cases"][0]["engines"]["z3"]
    assert first["response_loss"] is True
    assert first["reconciled_from_receipt"] is True
    first_id = str(uuid.UUID(int=1))
    solves_for_first = [
        call
        for call in fake.calls
        if call[:2] == ("POST", f"/sessions/{first_id}/solve")
    ]
    assert len(solves_for_first) == 1
    replay = subject.validate_freshthird_smt_session_output(tmp_path / "run")
    assert replay["cases"][0]["verdict"] == result.receipt["cases"][0]["verdict"]


def test_unreceipted_solve_loss_becomes_unknown_without_retry(tmp_path: Path) -> None:
    fake = FakePiqd(lose_without_receipt=True)
    result = _run(tmp_path, fake)
    first = result.receipt["cases"][0]["engines"]["z3"]
    assert first["effective_status"] == "UNKNOWN"
    assert result.receipt["cases"][0]["verdict"] == "UNKNOWN"
    first_id = str(uuid.UUID(int=1))
    assert (
        len(
            [
                call
                for call in fake.calls
                if call[:2] == ("POST", f"/sessions/{first_id}/solve")
            ]
        )
        == 1
    )
    replay = subject.validate_freshthird_smt_session_output(tmp_path / "run")
    assert replay["cases"][0]["verdict"] == "UNKNOWN"


@pytest.mark.parametrize(
    ("root", "profile"),
    [
        (subject.PREDECESSOR_FROZEN_ROOT, subject.PREDECESSOR_PROFILE),
        (subject.SUCCESSOR_FROZEN_ROOT, subject.SUCCESSOR_PROFILE),
        (
            subject.NONVACUOUS_SUCCESSOR_FROZEN_ROOT,
            subject.NONVACUOUS_SUCCESSOR_PROFILE,
        ),
    ],
)
def test_approved_wave_packages_preflight_read_only(
    root: Path,
    profile: subject.WaveProfile,
) -> None:
    before = {
        path: path.stat().st_mtime_ns
        for path in (root / "manifest.json", root / "case_matrix.json")
    }
    result = subject.preflight_frozen_wave(root)
    assert result["namespace"] == profile.namespace
    assert result["manifest_sha256"] == profile.manifest_sha256
    assert result["case_count"] == 12
    assert [row["case"] for row in result["cases"]] == list(subject.CASE_NAMES)
    assert before == {path: path.stat().st_mtime_ns for path in before}


def test_corrupt_durable_receipt_fails_closed(tmp_path: Path) -> None:
    fake = FakePiqd(corrupt_receipt=True)
    with pytest.raises(
        subject.FreshThirdSmtSessionError, match="receipt journal binding mismatch"
    ):
        _run(tmp_path, fake)


def test_strict_session_schema_rejects_an_extra_key(tmp_path: Path) -> None:
    fake = FakePiqd(extra_create_key=True)
    with pytest.raises(subject.FreshThirdSmtSessionError, match="unexpected JSON keys"):
        _run(tmp_path, fake)


def test_malformed_solve_response_is_not_treated_as_response_loss(
    tmp_path: Path,
) -> None:
    fake = FakePiqd(extra_solve_key=True)
    with pytest.raises(subject.FreshThirdSmtSessionError, match="unexpected JSON keys"):
        _run(tmp_path, fake)
    first_id = str(uuid.UUID(int=1))
    assert (
        len(
            [
                call
                for call in fake.calls
                if call[:2] == ("POST", f"/sessions/{first_id}/solve")
            ]
        )
        == 1
    )


def test_download_digest_lie_fails_closed(tmp_path: Path) -> None:
    fake = FakePiqd()
    with pytest.raises(subject.FreshThirdSmtSessionError, match="digest mismatch"):
        _run(tmp_path, fake, downloader=FakeDownload(fake, lie_about_digest=True))


def test_invalid_sat_model_is_downgraded_to_unknown(tmp_path: Path) -> None:
    fake = FakePiqd(sat_with_invalid_model=True)
    result = _run(tmp_path, fake)
    assert all(case["verdict"] == "UNKNOWN" for case in result.receipt["cases"])
    assert result.receipt["cases"][0]["engines"]["z3"]["readback"]["valid"] is False
    assert (
        subject.validate_freshthird_smt_session_output(tmp_path / "run")["cases"][0][
            "verdict"
        ]
        == "UNKNOWN"
    )


@pytest.mark.parametrize("model", ["(model)", "()"])
def test_semantically_empty_sat_model_is_downgraded_to_unknown(
    tmp_path: Path, model: str
) -> None:
    result = _run(tmp_path, FakePiqd(sat_model=model))
    assert all(case["verdict"] == "UNKNOWN" for case in result.receipt["cases"])
    assert result.receipt["cases"][0]["engines"]["z3"]["effective_status"] == "UNKNOWN"


def test_nonvacuous_smoke_sat_declares_and_constrains_readback_symbol() -> None:
    original = (
        subject.NONVACUOUS_SUCCESSOR_FROZEN_ROOT / "models/smoke_sat.smt2"
    ).read_bytes()
    commands, _journal = subject.normalize_script(original)
    assert "(declare-fun smoke_dummy () Bool)" in commands
    assert "(assert smoke_dummy)" in commands
    assert subject._declared_terms(commands) == ["smoke_dummy"]


@pytest.mark.parametrize(
    ("frozen_root", "has_shell"),
    [
        (subject.PREDECESSOR_FROZEN_ROOT, False),
        (subject.SUCCESSOR_FROZEN_ROOT, True),
        (subject.NONVACUOUS_SUCCESSOR_FROZEN_ROOT, True),
    ],
)
def test_all_24_sat_responses_have_complete_p97_and_shell_readback(
    tmp_path: Path, frozen_root: Path, has_shell: bool
) -> None:
    result = _run(
        tmp_path,
        FakePiqd(all_sat_complete=True),
        frozen_root=frozen_root,
    )
    engines = [
        case["engines"][solver]
        for case in result.receipt["cases"]
        for solver in subject.SOLVERS
    ]
    assert len(engines) == 24
    assert all(engine["solve"]["status"] == "SAT" for engine in engines)
    p97_engines = [
        case["engines"][solver]
        for case in result.receipt["cases"]
        if not case["case"].startswith("smoke_")
        for solver in subject.SOLVERS
    ]
    assert all(engine["readback"]["missing"] == [] for engine in p97_engines)
    live = result.receipt["cases"][-1]["engines"]
    assert all(live[solver]["readback"]["valid"] is True for solver in subject.SOLVERS)
    assert all(
        (live[solver]["readback"]["shell_distribution"] is not None) is has_shell
        for solver in subject.SOLVERS
    )
    replay = subject.validate_freshthird_smt_session_output(tmp_path / "run")
    assert replay["namespace"] == frozen_root.name
    assert len(replay["cases"]) == 12


@pytest.mark.parametrize("field", ["status", "model", "values"])
def test_result_digest_rejects_consistent_payload_tampering(field: str) -> None:
    solve: dict[str, object] = {
        "status": "SAT",
        "model": "(model (define-fun witness () Bool true))",
        "values": "((x true))",
        "solve_ms": 3,
        "solve_index": 1,
    }
    solve["result_sha256"] = subject._piqd_result_digest(solve)
    if field == "status":
        solve["status"] = "UNKNOWN"
        solve.pop("model")
        solve.pop("values")
    elif field == "model":
        solve["model"] = "(model (define-fun witness () Bool false))"
    else:
        solve["values"] = "((x false))"
    with pytest.raises(
        subject.FreshThirdSmtSessionError, match="result digest mismatch"
    ):
        subject._solve_response(solve)


def test_output_is_create_once(tmp_path: Path) -> None:
    output = tmp_path / "run"
    output.mkdir()
    fake = FakePiqd()
    data_root = tmp_path / "piqd-data"
    fake.bind_data_root(data_root)
    with pytest.raises(subject.FreshThirdSmtSessionError, match="already exists"):
        subject.run_freshthird_smt_session(
            output_dir=output,
            piqd_data_root=data_root,
            json_transport=fake,
            download_transport=FakeDownload(fake),
        )


def test_symlinked_output_parent_is_rejected(tmp_path: Path) -> None:
    real = tmp_path / "real"
    real.mkdir()
    alias = tmp_path / "alias"
    alias.symlink_to(real, target_is_directory=True)
    fake = FakePiqd()
    data_root = tmp_path / "piqd-data"
    fake.bind_data_root(data_root)
    with pytest.raises(subject.FreshThirdSmtSessionError):
        subject.run_freshthird_smt_session(
            output_dir=alias / "run",
            piqd_data_root=data_root,
            json_transport=fake,
            download_transport=FakeDownload(fake),
        )


def test_reserve_output_closes_descriptor_when_listdir_fails(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    opened: list[int] = []

    def fail_listdir(descriptor: int) -> list[str]:
        opened.append(descriptor)
        raise OSError("synthetic race")

    monkeypatch.setattr(subject.os, "listdir", fail_listdir)
    with pytest.raises(subject.FreshThirdSmtSessionError, match="reserve"):
        subject._reserve_output(tmp_path / "run")
    assert len(opened) == 1
    with pytest.raises(OSError):
        os.fstat(opened[0])


def test_same_size_input_mutation_during_capture_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    artifact = tmp_path / "artifact"
    artifact.write_bytes(b"original")
    root_fd = subject._open_directory_nofollow(tmp_path)
    original_read = subject.os.read
    mutated = False

    def mutate_after_read(descriptor: int, count: int) -> bytes:
        nonlocal mutated
        payload = original_read(descriptor, count)
        if payload and not mutated:
            mutated = True
            artifact.write_bytes(b"mutated!")
        return payload

    monkeypatch.setattr(subject.os, "read", mutate_after_read)
    try:
        with pytest.raises(subject.FreshThirdSmtSessionError, match="changed"):
            subject._read_bounded_relative(root_fd, "artifact", cap=64)
    finally:
        os.close(root_fd)


def test_same_size_export_mutation_during_verification_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    class Download:
        def download(
            self,
            method: str,
            path: str,
            destination_fd: int,
            *,
            byte_cap: int,
        ) -> subject.DownloadResponse:
            payload = b"journal"
            os.write(destination_fd, payload)
            return subject.DownloadResponse(
                200, len(payload), hashlib.sha256(payload).hexdigest()
            )

    output_fd = subject._reserve_output(tmp_path / "capture")
    original_read = subject.os.read
    mutated = False

    def mutate_after_read(descriptor: int, count: int) -> bytes:
        nonlocal mutated
        payload = original_read(descriptor, count)
        if payload and not mutated:
            mutated = True
            os.pwrite(descriptor, b"J", 0)
        return payload

    monkeypatch.setattr(subject.os, "read", mutate_after_read)
    try:
        with pytest.raises(subject.FreshThirdSmtSessionError, match="changed"):
            subject._capture_download(output_fd, "journal.smt2", "/smt2", Download())
    finally:
        os.close(output_fd)


def test_json_response_is_detached_from_transport_owned_mutation() -> None:
    body: dict[str, object] = {"outer": [1, {"value": "before"}]}

    class Transport:
        def request(
            self, method: str, path: str, request_body=None
        ) -> JsonHttpResponse:
            return JsonHttpResponse(200, body)

    snapshot = subject._json_request(Transport(), "GET", "/snapshot")
    body["outer"][1]["value"] = "after"
    assert snapshot == {"outer": [1, {"value": "before"}]}


def test_json_depth_and_node_budgets_are_enforced(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(subject, "MAX_JSON_DEPTH", 2)
    with pytest.raises(subject.FreshThirdSmtSessionError, match="depth cap"):
        subject._validate_builtin_json([[[0]]], "adversarial JSON")
    monkeypatch.setattr(subject, "MAX_JSON_DEPTH", 32)
    monkeypatch.setattr(subject, "MAX_JSON_NODES", 3)
    with pytest.raises(subject.FreshThirdSmtSessionError, match="node cap"):
        subject._validate_builtin_json([0, 1, 2], "adversarial JSON")


def test_sexpression_depth_node_and_token_budgets_are_enforced(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(subject, "MAX_SEXPR_DEPTH", 2)
    with pytest.raises(subject.FreshThirdSmtSessionError, match="depth cap"):
        subject._parse_sexpr("(((x)))")
    monkeypatch.setattr(subject, "MAX_SEXPR_DEPTH", 256)
    monkeypatch.setattr(subject, "MAX_SEXPR_NODES", 3)
    with pytest.raises(subject.FreshThirdSmtSessionError, match="node count"):
        subject._parse_sexpr("(a b c)")
    monkeypatch.setattr(subject, "MAX_SEXPR_NODES", 250_000)
    monkeypatch.setattr(subject, "MAX_SEXPR_TOKENS", 4)
    with pytest.raises(subject.FreshThirdSmtSessionError, match="token count"):
        subject._parse_sexpr("(a b c)")


def test_structural_split_preserves_spelling_and_ignores_parens_in_literals() -> None:
    source = b'; outside (comment)\n(set-info :x "a)""b")\n(assert (= |x)y| 1))\n(check-sat)\n(exit)\n'
    commands, journal = subject.normalize_script(source)
    assert commands == ['(set-info :x "a)""b")', "(assert (= |x)y| 1))"]
    assert journal == b'(set-info :x "a)""b")\n(assert (= |x)y| 1))\n'


def test_only_exact_true_produce_models_option_is_removed() -> None:
    commands, _ = subject.normalize_script(
        b"(set-option :produce-models false)\n(check-sat)\n(exit)\n"
    )
    assert commands == ["(set-option :produce-models false)"]
    commands, _ = subject.normalize_script(
        b"(set-option :produce-models true)\n(check-sat)\n(exit)\n"
    )
    assert commands == []


@pytest.mark.parametrize(
    "source",
    [
        b"(assert true)\n(exit)\n(check-sat)\n",
        b"(assert true)\n(check-sat)\n",
        b"(check-sat)\n(assert true)\n(check-sat)\n(exit)\n",
        b"(assert true",
    ],
)
def test_bad_query_structure_fails_closed(source: bytes) -> None:
    with pytest.raises(subject.FreshThirdSmtSessionError):
        subject.normalize_script(source)


def test_p97_readback_is_independent_and_rejects_incomplete_models() -> None:
    result = subject._validate_p97("confined_structural", {})
    assert result["valid"] is False
    assert len(result["missing"]) == 48


def test_successor_shell_distribution_is_independently_rechecked() -> None:
    values: dict[str, object] = {}
    for center in subject.CENTER_NAMES:
        values[f"mode_{center}"] = 2
        for label in subject.LABELS:
            values[f"m_{center}_{label}"] = False
        for label in ("q", "t1", "t2", "t3"):
            values[f"shell_pc_{center}_{label}"] = label == "q"
        values[f"shell_outside_{center}"] = 3
    for index, center in enumerate(subject.CENTER_NAMES):
        for other in subject.CENTER_NAMES[index + 1 :]:
            values[f"inter_{center}_{other}"] = 0
    valid = subject._validate_p97(
        "live_escape_or_shell",
        values,
        shell_distribution=True,
    )
    assert valid["valid"] is True
    values[f"shell_outside_{subject.CENTER_NAMES[0]}"] = 2
    invalid = subject._validate_p97(
        "live_escape_or_shell",
        values,
        shell_distribution=True,
    )
    assert invalid["valid"] is False
    assert invalid["checks"]["shell_distribution_encoding"] is False
    values[f"shell_outside_{subject.CENTER_NAMES[0]}"] = 3
    values[f"m_{subject.CENTER_NAMES[0]}_p"] = 1
    mistyped = subject._validate_p97(
        "live_escape_or_shell",
        values,
        shell_distribution=True,
    )
    assert mistyped["valid"] is False


@pytest.fixture(scope="module")
def replay_packet(tmp_path_factory: pytest.TempPathFactory) -> Path:
    root = tmp_path_factory.mktemp("freshthird-replay")
    _run(root, FakePiqd(all_sat_complete=True))
    return root / "run"


def _copy_packet(packet: Path, tmp_path: Path) -> Path:
    target = tmp_path / "packet"
    shutil.copytree(packet, target)
    return target


def _rewrite_receipt(path: Path, mutate) -> None:
    receipt_path = path / "receipt.json"
    receipt_path.chmod(0o600)
    receipt = json.loads(receipt_path.read_bytes())
    mutate(receipt)
    unsigned = {key: value for key, value in receipt.items() if key != "receipt_sha256"}
    receipt["receipt_sha256"] = subject._sha(subject._canonical(unsigned))
    receipt_path.write_bytes(subject._canonical(receipt) + b"\n")
    receipt_path.chmod(0o400)


def test_standalone_replay_and_cli_check(
    replay_packet: Path, capsys: pytest.CaptureFixture[str]
) -> None:
    summary = subject.validate_freshthird_smt_session_output(replay_packet)
    assert summary["status"] == subject.STATUS
    assert len(summary["cases"]) == 12
    assert (
        subject.main(
            ["--check", str(replay_packet), "--repo-root", str(subject.REPO_ROOT)]
        )
        == 0
    )
    printed = json.loads(capsys.readouterr().out)
    assert printed["receipt_sha256"] == summary["receipt_sha256"]


def test_replay_rejects_noncanonical_or_subclass_roots(replay_packet: Path) -> None:
    class PathSubclass(type(Path())):
        pass

    with pytest.raises(subject.FreshThirdSmtSessionError, match="exact Path"):
        subject.validate_freshthird_smt_session_output(PathSubclass(replay_packet))
    with pytest.raises(subject.FreshThirdSmtSessionError):
        subject.validate_freshthird_smt_session_output(replay_packet / "child" / "..")


@pytest.mark.parametrize("attack", ["undeclared", "symlink", "hardlink"])
def test_replay_rejects_tree_alias_and_declaration_attacks(
    replay_packet: Path, tmp_path: Path, attack: str
) -> None:
    packet = _copy_packet(replay_packet, tmp_path)
    if attack == "undeclared":
        (packet / "extra").write_bytes(b"x")
    elif attack == "symlink":
        target = packet / "smoke_sat.z3.journal.smt2"
        target.unlink()
        target.symlink_to("smoke_sat.cvc5.journal.smt2")
    else:
        target = packet / "smoke_sat.z3.journal.smt2"
        target.unlink()
        os.link(packet / "smoke_sat.cvc5.journal.smt2", target)
    with pytest.raises(subject.FreshThirdSmtSessionError):
        subject.validate_freshthird_smt_session_output(packet)


@pytest.mark.parametrize("attack", ["artifact", "canonical", "self_hash"])
def test_replay_rejects_byte_and_receipt_tampering(
    replay_packet: Path, tmp_path: Path, attack: str
) -> None:
    packet = _copy_packet(replay_packet, tmp_path)
    if attack == "artifact":
        path = packet / "smoke_sat.original.smt2"
        path.chmod(0o600)
        payload = path.read_bytes()
        path.write_bytes(bytes([payload[0] ^ 1]) + payload[1:])
        path.chmod(0o400)
    elif attack == "canonical":
        path = packet / "receipt.json"
        path.chmod(0o600)
        path.write_bytes(path.read_bytes() + b" ")
        path.chmod(0o400)
    else:
        path = packet / "receipt.json"
        path.chmod(0o600)
        receipt = json.loads(path.read_bytes())
        receipt["receipt_sha256"] = "0" * 64
        path.write_bytes(subject._canonical(receipt) + b"\n")
        path.chmod(0o400)
    with pytest.raises(subject.FreshThirdSmtSessionError):
        subject.validate_freshthird_smt_session_output(packet)


@pytest.mark.parametrize(
    "mutate",
    [
        lambda receipt: receipt["cases"].__setitem__(
            slice(0, 2), list(reversed(receipt["cases"][:2]))
        ),
        lambda receipt: receipt["cases"][0]["engines"].__setitem__(
            "z3", receipt["cases"][0]["engines"]["cvc5"]
        ),
        lambda receipt: receipt["cases"][0].__setitem__("journal_bytes", True),
        lambda receipt: receipt["cases"][0].__setitem__("commands", 1.0),
        lambda receipt: receipt["claims"].__setitem__("theorem_proved", 0),
        lambda receipt: receipt["execution"].__setitem__("sequential", 1),
        lambda receipt: receipt["cases"][0]["engines"]["z3"]["readback"].__setitem__(
            "valid", 1
        ),
        lambda receipt: receipt["current_source_observation"]["hashes"].__setitem__(
            next(iter(receipt["current_source_observation"]["hashes"])), "0" * 64
        ),
    ],
    ids=[
        "cross-case",
        "cross-solver",
        "bool",
        "float",
        "false-as-zero",
        "true-as-one",
        "readback-bool",
        "source",
    ],
)
def test_replay_rejects_resigned_semantic_tampering(
    replay_packet: Path, tmp_path: Path, mutate
) -> None:
    packet = _copy_packet(replay_packet, tmp_path)
    _rewrite_receipt(packet, mutate)
    with pytest.raises(subject.FreshThirdSmtSessionError):
        subject.validate_freshthird_smt_session_output(packet)


def test_replay_rejects_json_container_subclasses(
    replay_packet: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    original_loads = subject.json.loads

    class DictSubclass(dict):
        pass

    def subclass_loads(*args, **kwargs):
        return DictSubclass(original_loads(*args, **kwargs))

    monkeypatch.setattr(subject.json, "loads", subclass_loads)
    with pytest.raises(subject.FreshThirdSmtSessionError, match="non-builtin"):
        subject.validate_freshthird_smt_session_output(replay_packet)


def test_replay_rejects_same_size_post_capture_mutation(
    replay_packet: Path, tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    packet = _copy_packet(replay_packet, tmp_path)
    target = packet / "smoke_sat.z3.journal.smt2"
    original = subject._validate_replay_engine
    changed = False

    def mutate_after_capture(*args, **kwargs):
        nonlocal changed
        result = original(*args, **kwargs)
        if not changed:
            changed = True
            target.chmod(0o600)
            payload = target.read_bytes()
            target.write_bytes(bytes([payload[0] ^ 1]) + payload[1:])
            target.chmod(0o400)
        return result

    monkeypatch.setattr(subject, "_validate_replay_engine", mutate_after_capture)
    with pytest.raises(
        subject.FreshThirdSmtSessionError, match="changed after capture"
    ):
        subject.validate_freshthird_smt_session_output(packet)

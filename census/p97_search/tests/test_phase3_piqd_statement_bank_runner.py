from __future__ import annotations

import hashlib
import io
import os
import urllib.error
from collections.abc import Mapping
from pathlib import Path
from types import SimpleNamespace

import pytest

from census.p97_search import phase3_piqd_statement_bank as bank
from census.p97_search import phase3_piqd_statement_bank_runner as runner

SESSION_ID = "60d64e0a-828d-4cc4-ab8d-eeea25429dfc"
SOLVER = "piqd-satworker-cadical-3.0.0"
CONFLICT_LIMIT = 10_000


def _plan() -> bank.SelectorPlan:
    manifest = {
        "base_clauses": [[1]],
        "schema": bank.MANIFEST_SCHEMA,
        "source_num_vars": 1,
        "statement_groups": [
            {"clauses": [[-1]], "statement_id": "A"},
            {"clauses": [[1]], "statement_id": "B"},
        ],
    }
    return bank.build_selector_plan(
        bank.load_manifest_bytes(bank.canonical_json_bytes(manifest))
    )


class FakePiqd:
    """In-process HTTP seam with persisted journal and receipt behavior."""

    def __init__(
        self,
        root: Path,
        plan: bank.SelectorPlan,
        statuses: list[str],
        *,
        symlink_journal: bool = False,
    ) -> None:
        self.data_root = root
        self.plan = plan
        self.statuses = statuses
        self.calls: list[tuple[str, str, Mapping[str, object] | None]] = []
        self.receipts: list[dict[str, object]] = []
        self.clauses: list[list[int]] = []
        self.max_var = 0
        self.last_status: str | None = None
        self.solver = ""
        self.label = ""
        self.closed = False
        self.solve_index_delta = 0
        self.extra_solve_field = False
        self.close_session_mismatch = False
        self.append_on_receipts = b""
        self.create_status = 201
        self.extra_create_field = False
        self.omit_create_id = False
        self.reported_journal_path: str | None = None
        session_dir = root / SESSION_ID
        session_dir.mkdir()
        self.journal_path = session_dir / "journal.cnf"
        if symlink_journal:
            target = root / "actual-journal.cnf"
            target.write_bytes(b"")
            self.journal_path.symlink_to(target)

    def _session(self, *, state: str) -> dict[str, object]:
        return {
            "id": (
                "ee7aa6fe-a6dc-4d94-ac11-c3d14a47e30d"
                if state == "closed" and self.close_session_mismatch
                else SESSION_ID
            ),
            "lane": "sat",
            "state": state,
            "solver_name": self.solver,
            "solver_sha256": "a" * 64,
            "solver_signature": "fake solver signature",
            "protocol_version": 1,
            "journal_path": self.reported_journal_path or str(self.journal_path),
            "created_at": 1_786_218_000,
            "updated_at": 1_786_218_000 + len(self.receipts),
            "clauses": len(self.clauses),
            "max_var": self.max_var,
            "solves": len(self.receipts),
            "last_status": self.last_status,
            "label": self.label,
        }

    def request(
        self, method: str, path: str, body: Mapping[str, object] | None = None
    ) -> runner.JsonHttpResponse:
        self.calls.append((method, path, body))
        session_path = f"/sessions/{SESSION_ID}"
        if method == "POST" and path == "/sessions":
            assert body is not None
            self.solver = str(body["solver"])
            self.label = str(body["label"])
            response = self._session(state="live")
            if self.extra_create_field:
                response["extra"] = False
            if self.omit_create_id:
                del response["id"]
            return runner.JsonHttpResponse(self.create_status, response)
        if method == "POST" and path == f"{session_path}/clauses":
            assert body is not None
            self.clauses = [list(clause) for clause in body["clauses"]]  # type: ignore[arg-type]
            self.max_var = self.plan.document["gated_cnf"]["num_vars"]
            payload = "".join(
                "".join(f"{literal} " for literal in clause) + "0\n"
                for clause in self.clauses
            ).encode("ascii")
            self.journal_path.write_bytes(payload)
            return runner.JsonHttpResponse(
                200,
                {
                    "added": len(self.clauses),
                    "clauses": len(self.clauses),
                    "max_var": self.max_var,
                },
            )
        if method == "POST" and path == f"{session_path}/solve":
            assert body is not None
            status = self.statuses[len(self.receipts)]
            true_index = len(self.receipts) + 1
            assumptions = list(body["assumptions"])  # type: ignore[arg-type]
            result_sha256 = f"{true_index:064x}"
            response: dict[str, object] = {
                "result_sha256": result_sha256,
                "solve_index": true_index + self.solve_index_delta,
                "solve_ms": 1,
                "status": status,
            }
            receipt: dict[str, object] = {
                "assumptions": assumptions,
                "at": 1_786_218_000 + true_index,
                "base_bytes": self.journal_path.stat().st_size,
                "base_clauses": len(self.clauses),
                "base_sha256": hashlib.sha256(
                    self.journal_path.read_bytes()
                ).hexdigest(),
                "conflict_limit": body["conflict_limit"],
                "model_recorded": False,
                "result_sha256": result_sha256,
                "solve_index": true_index,
                "status": status,
            }
            if status == "UNSAT":
                core = assumptions[:1]
                response.update(core=core, terminal_unsat=not core)
                receipt["core"] = core
            elif status == "UNKNOWN":
                response["interrupted_by"] = "conflict_limit"
                receipt["interrupted_by"] = "conflict_limit"
            if self.extra_solve_field:
                response["extra"] = False
            self.receipts.append(receipt)
            self.last_status = status
            return runner.JsonHttpResponse(200, response)
        if method == "DELETE" and path == session_path:
            self.closed = True
            return runner.JsonHttpResponse(200, self._session(state="closed"))
        if method == "GET" and path == f"{session_path}/receipts":
            if self.append_on_receipts:
                with self.journal_path.open("ab") as stream:
                    stream.write(self.append_on_receipts)
            return runner.JsonHttpResponse(
                200,
                {
                    "count": len(self.receipts),
                    "journal_path": str(self.journal_path),
                    "receipts": self.receipts,
                    "receipts_path": str(self.journal_path.with_name("receipts.jsonl")),
                    "session_id": SESSION_ID,
                },
            )
        raise AssertionError(f"unexpected fake request: {method} {path}")


def _run(
    fake: FakePiqd, plan: bank.SelectorPlan, **kwargs
) -> runner.StatementBankRunResult:
    kwargs.setdefault("piqd_data_root", str(fake.data_root))
    return runner.run_statement_bank_session(
        plan,
        solver_name=SOLVER,
        conflict_limit=CONFLICT_LIMIT,
        transport=fake,
        **kwargs,
    )


def _solve_calls(fake: FakePiqd) -> list[tuple[str, str, Mapping[str, object] | None]]:
    return [call for call in fake.calls if call[1].endswith("/solve")]


def test_success_uploads_once_then_runs_exact_queries_in_canonical_order(
    tmp_path: Path,
) -> None:
    plan = _plan()
    fake = FakePiqd(tmp_path, plan, ["UNSAT", "SAT", "UNSAT"])

    result = _run(fake, plan)

    assert result.outcome is runner.RunnerOutcome.COMPLETE
    assert result.statement_solve_indexes == {"A": 2, "B": 3}
    assert result.adapter_result is not None
    assert [
        item["label"] for item in result.adapter_result.interpretation["groups"]
    ] == [
        bank.ESSENTIAL,
        bank.REDUNDANT,
    ]
    assert [(method, path) for method, path, _ in fake.calls] == [
        ("POST", "/sessions"),
        ("POST", f"/sessions/{SESSION_ID}/clauses"),
        ("POST", f"/sessions/{SESSION_ID}/solve"),
        ("POST", f"/sessions/{SESSION_ID}/solve"),
        ("POST", f"/sessions/{SESSION_ID}/solve"),
        ("DELETE", f"/sessions/{SESSION_ID}"),
        ("GET", f"/sessions/{SESSION_ID}/receipts"),
    ]
    add_body = fake.calls[1][2]
    assert add_body == {"clauses": plan.document["gated_cnf"]["clauses"]}
    expected_assumptions = [
        plan.document["queries"]["baseline"]["assumptions"],
        *[
            query["assumptions"]
            for query in plan.document["queries"]["leave_one_group_out"]
        ],
    ]
    assert [
        call[2]["assumptions"] for call in _solve_calls(fake)
    ] == expected_assumptions  # type: ignore[index]
    assert all(
        call[2]
        == {
            "assumptions": assumptions,
            "conflict_limit": CONFLICT_LIMIT,
            "include_model": False,
        }
        for call, assumptions in zip(
            _solve_calls(fake), expected_assumptions, strict=True
        )
    )
    assert result.audit["status"] == runner.RUNNER_STATUS
    assert result.audit["claims"]["daemon_concurrent_actor_exclusion"] is False  # type: ignore[index]


@pytest.mark.parametrize("baseline", ["SAT", "UNKNOWN"])
def test_non_unsat_baseline_short_circuits_all_omissions(
    tmp_path: Path, baseline: str
) -> None:
    plan = _plan()
    fake = FakePiqd(tmp_path, plan, [baseline])

    result = _run(fake, plan)

    assert result.outcome is runner.RunnerOutcome.BASELINE_NOT_UNSAT
    assert result.baseline_status.value == baseline
    assert result.statement_solve_indexes == {}
    assert result.adapter_result is None
    assert len(_solve_calls(fake)) == 1
    assert fake.closed


def test_rejects_malformed_solve_response_and_attempts_close(tmp_path: Path) -> None:
    plan = _plan()
    fake = FakePiqd(tmp_path, plan, ["UNSAT"])
    fake.extra_solve_field = True

    with pytest.raises(runner.StatementBankRunnerError, match="missing or extra"):
        _run(fake, plan)

    assert any(method == "DELETE" for method, _, _ in fake.calls)


def test_rejects_unexpected_http_status(tmp_path: Path) -> None:
    plan = _plan()
    fake = FakePiqd(tmp_path, plan, ["SAT"])
    fake.create_status = 200

    with pytest.raises(runner.StatementBankRunnerError, match="expected 201"):
        _run(fake, plan)


def test_malformed_create_with_strict_uuid_gets_exactly_one_cleanup(
    tmp_path: Path,
) -> None:
    plan = _plan()
    fake = FakePiqd(tmp_path, plan, ["SAT"])
    fake.extra_create_field = True

    with pytest.raises(runner.StatementBankRunnerError, match="noncanonical keys"):
        _run(fake, plan)

    assert [(method, path) for method, path, _ in fake.calls] == [
        ("POST", "/sessions"),
        ("DELETE", f"/sessions/{SESSION_ID}"),
    ]


def test_malformed_create_without_strict_uuid_fails_without_guessed_cleanup(
    tmp_path: Path,
) -> None:
    plan = _plan()
    fake = FakePiqd(tmp_path, plan, ["SAT"])
    fake.omit_create_id = True

    with pytest.raises(
        runner.StatementBankRunnerError, match="no strict candidate session UUID"
    ):
        _run(fake, plan)

    assert [(method, path) for method, path, _ in fake.calls] == [("POST", "/sessions")]


def test_rejects_noncanonical_journal_path(tmp_path: Path) -> None:
    plan = _plan()
    fake = FakePiqd(tmp_path, plan, ["SAT"])
    fake.reported_journal_path = f"{tmp_path}/{SESSION_ID}/../{SESSION_ID}/journal.cnf"

    with pytest.raises(runner.StatementBankRunnerError, match="dot components"):
        _run(fake, plan)


def test_rejects_session_journal_outside_configured_data_root(
    tmp_path: Path,
) -> None:
    plan = _plan()
    data_root = tmp_path / "configured"
    data_root.mkdir()
    fake = FakePiqd(data_root, plan, ["SAT"])
    arbitrary_root = tmp_path / "arbitrary" / SESSION_ID
    arbitrary_root.mkdir(parents=True)
    fake.reported_journal_path = str(arbitrary_root / "journal.cnf")

    with pytest.raises(runner.StatementBankRunnerError, match="outside the configured"):
        _run(fake, plan)

    assert [(method, path) for method, path, _ in fake.calls] == [
        ("POST", "/sessions"),
        ("DELETE", f"/sessions/{SESSION_ID}"),
    ]


def test_rejects_symlink_data_root_before_any_transport_call(tmp_path: Path) -> None:
    plan = _plan()
    real_root = tmp_path / "real"
    real_root.mkdir()
    fake = FakePiqd(real_root, plan, ["SAT"])
    alias = tmp_path / "alias"
    alias.symlink_to(real_root, target_is_directory=True)

    with pytest.raises(runner.StatementBankRunnerError, match="piqd_data_root"):
        _run(fake, plan, piqd_data_root=str(alias))

    assert fake.calls == []


def test_rejects_unexpected_solve_index(tmp_path: Path) -> None:
    plan = _plan()
    fake = FakePiqd(tmp_path, plan, ["UNSAT"])
    fake.solve_index_delta = 1

    with pytest.raises(runner.StatementBankRunnerError, match="unexpected solve_index"):
        _run(fake, plan)


def test_rejects_session_mismatch_on_close(tmp_path: Path) -> None:
    plan = _plan()
    fake = FakePiqd(tmp_path, plan, ["SAT"])
    fake.close_session_mismatch = True

    with pytest.raises(runner.StatementBankRunnerError, match="changed session id"):
        _run(fake, plan)


def test_rejects_symlink_journal_snapshot(tmp_path: Path) -> None:
    plan = _plan()
    fake = FakePiqd(tmp_path, plan, ["SAT"], symlink_journal=True)

    with pytest.raises(
        runner.StatementBankRunnerError, match="secure journal snapshot"
    ):
        _run(fake, plan)


def test_rejects_journal_over_size_cap(tmp_path: Path) -> None:
    plan = _plan()
    fake = FakePiqd(tmp_path, plan, ["SAT"])

    with pytest.raises(runner.StatementBankRunnerError, match="size_cap"):
        _run(fake, plan, journal_size_cap=1)


def test_rejects_journal_bytes_added_before_snapshot(tmp_path: Path) -> None:
    plan = _plan()
    fake = FakePiqd(tmp_path, plan, ["SAT"])
    fake.append_on_receipts = b"99 0\n"

    with pytest.raises(runner.StatementBankRunnerError, match="not exactly"):
        _run(fake, plan)


def test_rejects_journal_metadata_change_during_single_snapshot(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    plan = _plan()
    fake = FakePiqd(tmp_path, plan, ["SAT"])
    real_fstat = os.fstat
    seen = 0

    def changing_fstat(fd: int):
        nonlocal seen
        value = real_fstat(fd)
        seen += 1
        if seen != 2:
            return value
        return SimpleNamespace(
            st_dev=value.st_dev,
            st_ino=value.st_ino,
            st_mode=value.st_mode,
            st_size=value.st_size,
            st_mtime_ns=value.st_mtime_ns + 1,
            st_ctime_ns=value.st_ctime_ns,
        )

    monkeypatch.setattr(runner.os, "fstat", changing_fstat)
    with pytest.raises(runner.StatementBankRunnerError, match="changed during"):
        _run(fake, plan)


class _TrackingResponse:
    def __init__(self, payload: bytes, *, status: int = 200) -> None:
        self._stream = io.BytesIO(payload)
        self.status = status
        self.bytes_read = 0
        self.closed = False

    def read(self, size: int = -1) -> bytes:
        chunk = self._stream.read(size)
        self.bytes_read += len(chunk)
        return chunk

    def close(self) -> None:
        self.closed = True
        self._stream.close()


class _ReturningOpener:
    def __init__(self, response: _TrackingResponse | urllib.error.HTTPError) -> None:
        self.response = response
        self.timeout_seen: float | None = None

    def open(self, request, *, timeout: float):
        self.timeout_seen = timeout
        if isinstance(self.response, urllib.error.HTTPError):
            raise self.response
        return self.response


class _StallingOpener:
    def __init__(self) -> None:
        self.timeout_seen: float | None = None

    def open(self, request, *, timeout: float):
        self.timeout_seen = timeout
        raise TimeoutError("synthetic timeout without waiting")


def test_urllib_transport_passes_explicit_timeout_without_real_wait() -> None:
    transport = runner.UrllibJsonTransport(request_timeout_s=0.25)
    opener = _StallingOpener()
    transport._opener = opener

    with pytest.raises(runner.StatementBankRunnerError, match="HTTP request failed"):
        transport.request("GET", "/version")

    assert opener.timeout_seen == 0.25


@pytest.mark.parametrize("http_error", [False, True])
def test_urllib_transport_bounds_success_and_error_response_bodies(
    http_error: bool,
) -> None:
    response = _TrackingResponse(b'{"oversize":"xxxxxxxxxxxxxxxx"}')
    opened: _TrackingResponse | urllib.error.HTTPError = response
    if http_error:
        opened = urllib.error.HTTPError(
            "http://127.0.0.1:7272/version", 500, "synthetic", {}, response
        )
    transport = runner.UrllibJsonTransport(response_byte_cap=8)
    opener = _ReturningOpener(opened)
    transport._opener = opener

    with pytest.raises(runner.StatementBankRunnerError, match="response exceeded"):
        transport.request("GET", "/version")

    assert response.bytes_read == 9
    assert response.closed


@pytest.mark.parametrize("timeout", [0, -1, float("inf"), float("nan"), 10**1000, True])
def test_runner_rejects_nonpositive_or_nonfinite_http_timeout_before_transport(
    tmp_path: Path, timeout: object
) -> None:
    plan = _plan()
    fake = FakePiqd(tmp_path, plan, ["SAT"])

    with pytest.raises(runner.StatementBankRunnerError, match="positive finite"):
        _run(fake, plan, http_request_timeout_s=timeout)

    assert fake.calls == []


def test_runner_rejects_invalid_http_response_cap_before_transport(
    tmp_path: Path,
) -> None:
    plan = _plan()
    fake = FakePiqd(tmp_path, plan, ["SAT"])

    with pytest.raises(runner.StatementBankRunnerError, match="byte_cap"):
        _run(fake, plan, http_response_byte_cap=0)

    assert fake.calls == []


def test_piqd_i32_selector_overflow_fails_before_session_creation(
    tmp_path: Path,
) -> None:
    manifest = {
        "base_clauses": [[1]],
        "schema": bank.MANIFEST_SCHEMA,
        "source_num_vars": 2**31 - 1,
        "statement_groups": [{"clauses": [[1]], "statement_id": "A"}],
    }
    plan = bank.build_selector_plan(
        bank.load_manifest_bytes(bank.canonical_json_bytes(manifest))
    )
    fake = FakePiqd(tmp_path, plan, ["SAT"])

    with pytest.raises(runner.StatementBankRunnerError, match="PIQD"):
        _run(fake, plan)

    assert fake.calls == []

from __future__ import annotations

import hashlib
import json
from collections.abc import Mapping
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import phase3_piqd_oracle
from census.p97_search.phase3_piqd_incremental_discovery import (
    HttpResponse,
    _result_digest,
)
from census.p97_search.phase3_piqd_preappended_snapshot import (
    CAPTURE_SCHEMA,
    PREAPPENDED_HTTP_TIMEOUT_SECONDS,
    SCHEMA,
    PiqdPreappendedSnapshotError,
    PiqdPreappendedSnapshotRunner,
    _preappended_transport,
)

SESSION = "11111111-1111-4111-8111-111111111111"
SOLVER = "a" * 64
ROOT = b"p cnf 2 2\n1 0\n-1 2 0\n"
JOURNAL = b"1 0\n-1 2 0\n"
PREFIX = b"1 0\n"


def _response(status: int, value: Any) -> HttpResponse:
    return HttpResponse(
        status,
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode(),
        {"content-type": "application/json"},
    )


def test_preappended_transport_uses_recovery_timeout(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    captured: dict[str, Any] = {}

    def fake_transport(
        method: str,
        url: str,
        body: bytes | None,
        headers: Mapping[str, str],
        *,
        timeout_seconds: float,
    ) -> HttpResponse:
        captured.update(
            method=method,
            url=url,
            body=body,
            headers=headers,
            timeout_seconds=timeout_seconds,
        )
        return HttpResponse(200, b"{}", {})

    monkeypatch.setattr(phase3_piqd_oracle, "_stdlib_transport", fake_transport)
    response = _preappended_transport("GET", "http://piqd.test/session", None, {})

    assert response.status == 200
    assert captured["timeout_seconds"] == PREAPPENDED_HTTP_TIMEOUT_SECONDS


class FakeSnapshotTransport:
    def __init__(
        self,
        *,
        model: list[int] | None = None,
        prefix_sha256: str | None = None,
        post_base_sha256: str | None = None,
        max_var: Any = 2,
        initial_state: str = "live",
    ) -> None:
        self.calls: list[tuple[str, str, bytes | None]] = []
        self.model = [1, 2] if model is None else model
        self.prefix_sha256 = prefix_sha256 or hashlib.sha256(PREFIX).hexdigest()
        self.post_base_sha256 = post_base_sha256
        self.max_var = max_var
        self.state = initial_state
        first_result = _result_digest("SAT", None, None, [1, 2])
        self.receipts: list[dict[str, Any]] = [
            {
                "solve_index": 1,
                "base_clauses": 1,
                "base_bytes": len(PREFIX),
                "base_sha256": self.prefix_sha256,
                "assumptions": [],
                "status": "SAT",
                "model_recorded": True,
                "result_sha256": first_result,
                "at": 1,
            }
        ]

    def _session(self) -> dict[str, Any]:
        latest = self.receipts[-1]
        return {
            "id": SESSION,
            "lane": "sat",
            "state": self.state,
            "solver_name": "fake-cadical",
            "solver_sha256": SOLVER,
            "solver_signature": "fake-cadical",
            "protocol_version": 1,
            "journal_path": "/var/lib/piqd/fake.journal",
            "created_at": 1,
            "updated_at": 2,
            "clauses": 2,
            "max_var": self.max_var,
            "solves": len(self.receipts),
            "last_status": latest["status"],
            "declared_num_vars": 2,
            "last_solve_index": latest["solve_index"],
            "last_assumption_free": True,
            "last_terminal_unsat": None,
            "label": "fake-preappended",
        }

    def _receipt_payload(self) -> dict[str, Any]:
        return {
            "session_id": SESSION,
            "lane": "sat",
            "journal_path": "/var/lib/piqd/fake.journal",
            "receipts_path": "/var/lib/piqd/fake.receipts.jsonl",
            "count": len(self.receipts),
            "receipts": self.receipts,
        }

    def __call__(
        self,
        method: str,
        url: str,
        body: bytes | None,
        headers: dict[str, str],
    ) -> HttpResponse:
        del headers
        self.calls.append((method, url, body))
        path = url.split("/", 3)[-1]
        if method == "GET" and path == f"sessions/{SESSION}":
            return _response(200, self._session())
        if method == "GET" and path == f"sessions/{SESSION}/receipts":
            return _response(200, self._receipt_payload())
        if method == "POST" and path == f"sessions/{SESSION}/solve":
            request = json.loads((body or b"").decode())
            assert request == {"assumptions": [], "include_model": True}
            self.state = "live"
            result = _result_digest("SAT", None, None, self.model)
            self.receipts.append(
                {
                    "solve_index": 2,
                    "base_clauses": 2,
                    "base_bytes": len(JOURNAL),
                    "base_sha256": self.post_base_sha256
                    or hashlib.sha256(JOURNAL).hexdigest(),
                    "assumptions": [],
                    "status": "SAT",
                    "model_recorded": True,
                    "result_sha256": result,
                    "at": 2,
                }
            )
            return _response(
                200,
                {
                    "status": "SAT",
                    "solve_ms": 1,
                    "solve_index": 2,
                    "result_sha256": result,
                    "model": self.model,
                },
            )
        raise AssertionError((method, path))


def _runner(
    tmp_path: Path,
    transport: FakeSnapshotTransport,
    *,
    pending: int = 1,
    expected_solve_count: int = 1,
    export_sha256: str | None = None,
    output_dir: Path | None = None,
) -> PiqdPreappendedSnapshotRunner:
    root = tmp_path / "root.cnf"
    if not root.exists():
        root.write_bytes(ROOT)
    digest = export_sha256 or hashlib.sha256(ROOT).hexdigest()
    output_dir = tmp_path if output_dir is None else output_dir
    return PiqdPreappendedSnapshotRunner(
        "http://piqd.test",
        SESSION,
        root,
        expected_solve_count=expected_solve_count,
        expected_solver_sha256=SOLVER,
        expected_pending_clauses=pending,
        snapshot_path=output_dir / "snapshot.json",
        raw_response_path=output_dir / "solve.raw.json",
        capture_path=output_dir / "capture.json",
        model_path=output_dir / "model.json",
        transport=transport,
        export_digest=lambda _url: digest,
    )


def test_successful_one_shot_captures_and_replays_model(tmp_path: Path) -> None:
    transport = FakeSnapshotTransport()
    runner = _runner(tmp_path, transport)

    result = runner.solve()

    assert result.status == "SAT"
    assert result.solve_index == 2
    assert result.assignment == (1, 2)
    assert sum(method == "POST" for method, _url, _body in transport.calls) == 1
    snapshot = json.loads((tmp_path / "snapshot.json").read_text())
    assert snapshot["schema"] == SCHEMA
    assert snapshot["root"]["pending_clauses"] == 1
    raw = json.loads((tmp_path / "solve.raw.json").read_text())
    assert raw["model"] == [1, 2]
    capture = json.loads((tmp_path / "capture.json").read_text())
    assert capture["schema"] == CAPTURE_SCHEMA
    assert "model" not in capture["solve_response"]
    assert json.loads((tmp_path / "model.json").read_text()) == {
        "model": [1, 2],
        "vars": 2,
    }
    with pytest.raises(PiqdPreappendedSnapshotError, match="one-shot"):
        runner.solve()


def test_detached_session_revives_during_authorized_solve(tmp_path: Path) -> None:
    transport = FakeSnapshotTransport(initial_state="detached")
    runner = _runner(tmp_path, transport)

    result = runner.solve()

    assert result.status == "SAT"
    snapshot = json.loads((tmp_path / "snapshot.json").read_text())
    assert snapshot["session_before"]["state"] == "detached"
    assert transport.state == "live"


def test_closed_session_is_rejected_before_solve(tmp_path: Path) -> None:
    transport = FakeSnapshotTransport(initial_state="closed")

    with pytest.raises(PiqdPreappendedSnapshotError, match="identity/state"):
        _runner(tmp_path, transport)

    assert all(method != "POST" for method, _url, _body in transport.calls)


def test_wrong_remote_export_stops_before_solve(tmp_path: Path) -> None:
    transport = FakeSnapshotTransport()
    with pytest.raises(PiqdPreappendedSnapshotError, match="export differs"):
        _runner(tmp_path, transport, export_sha256="f" * 64)
    assert all(method != "POST" for method, _url, _body in transport.calls)


def test_pending_clause_mismatch_stops_before_solve(tmp_path: Path) -> None:
    transport = FakeSnapshotTransport()
    with pytest.raises(PiqdPreappendedSnapshotError, match="pending clause count"):
        _runner(tmp_path, transport, pending=2)
    assert all(method != "POST" for method, _url, _body in transport.calls)


def test_receipt_prefix_hash_mismatch_stops_before_solve(tmp_path: Path) -> None:
    transport = FakeSnapshotTransport(prefix_sha256="e" * 64)
    with pytest.raises(PiqdPreappendedSnapshotError, match="body prefix"):
        _runner(tmp_path, transport)
    assert all(method != "POST" for method, _url, _body in transport.calls)


def test_bad_sat_model_preserves_raw_evidence_but_not_capture(tmp_path: Path) -> None:
    transport = FakeSnapshotTransport(model=[1, -2])
    runner = _runner(tmp_path, transport)

    with pytest.raises(PiqdPreappendedSnapshotError, match="fails root clause"):
        runner.solve()

    assert (tmp_path / "snapshot.json").exists()
    assert (tmp_path / "solve.raw.json").exists()
    assert not (tmp_path / "capture.json").exists()
    assert not (tmp_path / "model.json").exists()
    assert sum(method == "POST" for method, _url, _body in transport.calls) == 1


def test_postsolve_receipt_must_authenticate_full_root(tmp_path: Path) -> None:
    transport = FakeSnapshotTransport(post_base_sha256="d" * 64)
    runner = _runner(tmp_path, transport)

    with pytest.raises(PiqdPreappendedSnapshotError, match="preappended root"):
        runner.solve()

    assert (tmp_path / "solve.raw.json").exists()
    assert not (tmp_path / "capture.json").exists()
    assert not (tmp_path / "model.json").exists()


def test_existing_output_artifact_stops_before_remote_contact(tmp_path: Path) -> None:
    (tmp_path / "snapshot.json").write_text("existing\n")
    transport = FakeSnapshotTransport()
    with pytest.raises(PiqdPreappendedSnapshotError, match="existing custody artifact"):
        _runner(tmp_path, transport)
    assert transport.calls == []


def test_local_root_drift_stops_before_solve(tmp_path: Path) -> None:
    transport = FakeSnapshotTransport()
    runner = _runner(tmp_path, transport)
    (tmp_path / "root.cnf").write_bytes(ROOT + b"c drift\n")

    with pytest.raises(PiqdPreappendedSnapshotError, match="local root changed"):
        runner.solve()

    assert all(method != "POST" for method, _url, _body in transport.calls)
    assert not (tmp_path / "snapshot.json").exists()


def test_malformed_session_dimension_fails_closed(tmp_path: Path) -> None:
    transport = FakeSnapshotTransport(max_var="2")
    with pytest.raises(RuntimeError, match="session.max_var"):
        _runner(tmp_path, transport)
    assert all(method != "POST" for method, _url, _body in transport.calls)


def test_root_symlink_is_rejected_before_remote_contact(tmp_path: Path) -> None:
    target = tmp_path / "target.cnf"
    target.write_bytes(ROOT)
    (tmp_path / "root.cnf").symlink_to(target)
    transport = FakeSnapshotTransport()

    with pytest.raises(PiqdPreappendedSnapshotError, match="non-symlink"):
        _runner(tmp_path, transport)

    assert transport.calls == []


def test_malformed_dimacs_body_is_rejected_before_solve(tmp_path: Path) -> None:
    malformed = b"p cnf 2 2\n1 0\nnot-a-clause\n"
    (tmp_path / "root.cnf").write_bytes(malformed)
    transport = FakeSnapshotTransport()

    with pytest.raises(PiqdPreappendedSnapshotError, match="malformed clause"):
        _runner(
            tmp_path,
            transport,
            export_sha256=hashlib.sha256(malformed).hexdigest(),
        )

    assert all(method != "POST" for method, _url, _body in transport.calls)


def test_every_historical_receipt_prefix_is_authenticated(tmp_path: Path) -> None:
    transport = FakeSnapshotTransport()
    first = dict(transport.receipts[0])
    first["base_sha256"] = "e" * 64
    second = dict(transport.receipts[0])
    second["solve_index"] = 2
    second["at"] = 2
    transport.receipts = [first, second]

    with pytest.raises(PiqdPreappendedSnapshotError, match="historical receipt"):
        _runner(tmp_path, transport, expected_solve_count=2)

    assert all(method != "POST" for method, _url, _body in transport.calls)


def test_partial_batch_metadata_is_rejected(tmp_path: Path) -> None:
    transport = FakeSnapshotTransport()
    transport.receipts[0]["batch_key"] = "incomplete"

    with pytest.raises(PiqdPreappendedSnapshotError, match="must be complete"):
        _runner(tmp_path, transport)

    assert all(method != "POST" for method, _url, _body in transport.calls)


def test_sat_receipt_must_record_its_model(tmp_path: Path) -> None:
    transport = FakeSnapshotTransport()
    transport.receipts[0]["model_recorded"] = False

    with pytest.raises(PiqdPreappendedSnapshotError, match="model-recording"):
        _runner(tmp_path, transport)

    assert all(method != "POST" for method, _url, _body in transport.calls)


def test_symlinked_output_parent_is_rejected(tmp_path: Path) -> None:
    external = tmp_path / "external"
    external.mkdir()
    linked = tmp_path / "linked"
    linked.symlink_to(external, target_is_directory=True)
    transport = FakeSnapshotTransport()

    with pytest.raises(PiqdPreappendedSnapshotError, match="directory is symlinked"):
        _runner(tmp_path, transport, output_dir=linked)

    assert transport.calls == []
    assert list(external.iterdir()) == []


def test_root_mutation_during_post_is_rejected(tmp_path: Path) -> None:
    class MutatingTransport(FakeSnapshotTransport):
        root: Path | None = None

        def __call__(
            self,
            method: str,
            url: str,
            body: bytes | None,
            headers: dict[str, str],
        ) -> HttpResponse:
            if method == "POST":
                assert self.root is not None
                self.root.write_bytes(ROOT + b"c changed during solve\n")
            return super().__call__(method, url, body, headers)

    transport = MutatingTransport()
    runner = _runner(tmp_path, transport)
    transport.root = tmp_path / "root.cnf"

    with pytest.raises(PiqdPreappendedSnapshotError, match="changed during solve"):
        runner.solve()

    assert (tmp_path / "solve.raw.json").exists()
    assert not (tmp_path / "capture.json").exists()


def test_non_successful_solve_response_is_preserved_before_rejection(
    tmp_path: Path,
) -> None:
    class FailingSolveTransport(FakeSnapshotTransport):
        def __call__(
            self,
            method: str,
            url: str,
            body: bytes | None,
            headers: dict[str, str],
        ) -> HttpResponse:
            if method == "POST":
                self.calls.append((method, url, body))
                return _response(500, {"error": "legacy model read failed"})
            return super().__call__(method, url, body, headers)

    transport = FailingSolveTransport()
    runner = _runner(tmp_path, transport)

    with pytest.raises(PiqdPreappendedSnapshotError, match="returned HTTP 500"):
        runner.solve()

    assert json.loads((tmp_path / "solve.raw.json").read_text()) == {
        "error": "legacy model read failed"
    }
    assert not (tmp_path / "capture.json").exists()
    assert not (tmp_path / "model.json").exists()


def test_artifact_created_after_construction_stops_before_post(tmp_path: Path) -> None:
    transport = FakeSnapshotTransport()
    runner = _runner(tmp_path, transport)
    (tmp_path / "snapshot.json").write_text("raced\n")

    with pytest.raises(PiqdPreappendedSnapshotError, match="existing custody artifact"):
        runner.solve()

    assert all(method != "POST" for method, _url, _body in transport.calls)

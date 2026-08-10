from __future__ import annotations

import hashlib
import json
from dataclasses import replace
from pathlib import Path
from typing import Any

import pytest

from census.p97_search.phase3_piqd_incremental_discovery import (
    HttpResponse,
    _result_digest,
)
from census.p97_search.phase3_piqd_legacy_snapshot_successor import (
    PiqdLegacySnapshotSuccessorError,
    PiqdLegacySnapshotSuccessorRunner,
)
from census.p97_search.phase3_piqd_postwave_gate import (
    PostwaveAuthorization,
    ValidatedPostwaveReceipt,
)
from census.p97_search.phase3_piqd_preappended_snapshot import (
    PiqdPreappendedSnapshotError,
)
from census.p97_search.phase3_piqd_theorem_gated_discovery import (
    TheoremGatedDiscoveryError,
    run_validated_successor,
)

SESSION = "11111111-1111-4111-8111-111111111111"
SOLVER = "a" * 64
INPUT_BODY = b"1 0\n2 0\n"
SUCCESSOR_BODY = INPUT_BODY + b"-1 2 0\n"
INPUT = b"p cnf 2 2\n" + INPUT_BODY
SUCCESSOR = b"p cnf 2 3\n" + SUCCESSOR_BODY


def _response(status: int, value: Any) -> HttpResponse:
    return HttpResponse(status, json.dumps(value).encode(), {})


class FakeLegacyTransport:
    def __init__(
        self,
        *,
        bad_append_ack: bool = False,
        bad_export_after_append: bool = False,
        mutate_receipt_during_append: bool = False,
    ) -> None:
        self.calls: list[tuple[str, str, bytes | None]] = []
        self.closed = False
        self.clauses = 2
        self.current_root = INPUT
        self.bad_append_ack = bad_append_ack
        self.bad_export_after_append = bad_export_after_append
        self.mutate_receipt_during_append = mutate_receipt_during_append
        initial_result = _result_digest("SAT", None, None, [1, 2])
        self.receipts: list[dict[str, Any]] = [
            {
                "solve_index": 1,
                "base_clauses": 2,
                "base_bytes": len(INPUT_BODY),
                "base_sha256": hashlib.sha256(INPUT_BODY).hexdigest(),
                "assumptions": [],
                "status": "SAT",
                "model_recorded": True,
                "result_sha256": initial_result,
                "at": 1,
            }
        ]

    def _session(self) -> dict[str, Any]:
        latest = self.receipts[-1]
        return {
            "id": SESSION,
            "lane": "sat",
            "state": "closed" if self.closed else "live",
            "solver_name": "fake-cadical",
            "solver_sha256": SOLVER,
            "solver_signature": "fake-cadical",
            "protocol_version": 1,
            "journal_path": "/var/lib/piqd/fake.journal",
            "created_at": 1,
            "updated_at": 2,
            "clauses": self.clauses,
            "max_var": 2,
            "solves": len(self.receipts),
            "last_status": latest["status"],
            "declared_num_vars": 2,
            "last_solve_index": latest["solve_index"],
            "last_assumption_free": True,
            "last_terminal_unsat": None,
            "label": "fake-legacy-successor",
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
        if method == "DELETE" and path == f"sessions/{SESSION}":
            self.closed = True
            return _response(200, self._session())
        if method == "POST" and path == f"sessions/{SESSION}/clauses":
            assert json.loads((body or b"").decode()) == {"clauses": [[-1, 2]]}
            self.clauses = 3
            self.current_root = (
                b"p cnf 2 3\n1 0\n2 0\n-2 1 0\n"
                if self.bad_export_after_append
                else SUCCESSOR
            )
            if self.mutate_receipt_during_append:
                self.receipts[0]["at"] = 3
            return _response(
                200,
                {
                    "added": 0 if self.bad_append_ack else 1,
                    "clauses": 3,
                    "max_var": 2,
                },
            )
        if method == "POST" and path == f"sessions/{SESSION}/solve":
            assert json.loads((body or b"").decode()) == {
                "assumptions": [],
                "include_model": True,
            }
            result = _result_digest("SAT", None, None, [1, 2])
            self.receipts.append(
                {
                    "solve_index": 2,
                    "base_clauses": 3,
                    "base_bytes": len(SUCCESSOR_BODY),
                    "base_sha256": hashlib.sha256(SUCCESSOR_BODY).hexdigest(),
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
                    "model": [1, 2],
                },
            )
        raise AssertionError((method, path))


def _validated_receipt(tmp_path: Path) -> ValidatedPostwaveReceipt:
    return ValidatedPostwaveReceipt(
        path=tmp_path / "postwave.receipt.json",
        receipt_sha256="b" * 64,
        lane="exact17-rigid221-blockerv-piqd-wave6-canary",
        first_wave=48,
        wave_ordinal=62,
        authorization=_authorization(),
    )


def _runner(
    tmp_path: Path,
    transport: FakeLegacyTransport,
    *,
    validated_receipt: ValidatedPostwaveReceipt | None = None,
):
    input_root = tmp_path / "input.cnf"
    successor_root = tmp_path / "successor.cnf"
    input_root.write_bytes(INPUT)
    successor_root.write_bytes(SUCCESSOR)
    return PiqdLegacySnapshotSuccessorRunner(
        "http://piqd.test",
        SESSION,
        input_root,
        successor_root,
        validated_receipt=validated_receipt or _validated_receipt(tmp_path),
        snapshot_path=tmp_path / "snapshot.json",
        raw_response_path=tmp_path / "raw.json",
        capture_path=tmp_path / "capture.json",
        model_path=tmp_path / "model.json",
        transport=transport,
        export_digest=lambda _url: hashlib.sha256(transport.current_root).hexdigest(),
    )


def _authorization() -> PostwaveAuthorization:
    return PostwaveAuthorization(
        wave_ordinal=62,
        outcome="reusable-theorem",
        successor_authorized=True,
        source_session_id=SESSION,
        source_solve_index=1,
        source_solver_sha256=SOLVER,
        input_root_sha256=hashlib.sha256(INPUT).hexdigest(),
        successor_root_sha256=hashlib.sha256(SUCCESSOR).hexdigest(),
        lean_consumer="Problem97.Example.false_of_pattern",
        admitted_clauses=((-1, 2),),
    )


def test_normal_legacy_append_and_solve_is_authenticated(tmp_path: Path) -> None:
    transport = FakeLegacyTransport()
    runner = _runner(tmp_path, transport)

    authorization, result = run_validated_successor(
        runner, authorization=_authorization()
    )

    assert authorization.wave_ordinal == 62
    assert result.status == "SAT"
    assert result.root_sha256 == hashlib.sha256(SUCCESSOR).hexdigest()
    assert transport.clauses == 3
    assert not transport.closed


def test_bad_append_ack_terminalizes_legacy_session(tmp_path: Path) -> None:
    transport = FakeLegacyTransport(bad_append_ack=True)
    runner = _runner(tmp_path, transport)

    with pytest.raises(TheoremGatedDiscoveryError, match="session was terminalized"):
        run_validated_successor(runner, authorization=_authorization())

    assert transport.closed
    assert not (tmp_path / "snapshot.json").exists()


@pytest.mark.parametrize(
    "transport",
    [
        FakeLegacyTransport(bad_export_after_append=True),
        FakeLegacyTransport(mutate_receipt_during_append=True),
    ],
)
def test_postappend_custody_failure_terminalizes_session(
    tmp_path: Path, transport: FakeLegacyTransport
) -> None:
    runner = _runner(tmp_path, transport)

    with pytest.raises(TheoremGatedDiscoveryError, match="session was terminalized"):
        run_validated_successor(runner, authorization=_authorization())

    assert transport.closed
    assert not (tmp_path / "snapshot.json").exists()


def test_duplicate_append_is_rejected_without_remote_contact(tmp_path: Path) -> None:
    transport = FakeLegacyTransport()
    runner = _runner(tmp_path, transport)
    assert runner.append_clauses(((-1, 2),)) == 1
    posts_before = sum(method == "POST" for method, _url, _body in transport.calls)

    with pytest.raises(PiqdLegacySnapshotSuccessorError, match="one-shot"):
        runner.append_clauses(((-1, 2),))

    assert (
        sum(method == "POST" for method, _url, _body in transport.calls) == posts_before
    )


def test_receipt_transition_mismatch_stops_before_remote_contact(
    tmp_path: Path,
) -> None:
    transport = FakeLegacyTransport()
    receipt = _validated_receipt(tmp_path)
    bad_authorization = replace(
        receipt.authorization,
        successor_root_sha256="f" * 64,
    )
    bad_receipt = replace(receipt, authorization=bad_authorization)

    with pytest.raises(PiqdLegacySnapshotSuccessorError, match="does not bind"):
        _runner(tmp_path, transport, validated_receipt=bad_receipt)

    assert transport.calls == []


def test_wrong_live_solve_frontier_stops_before_append(tmp_path: Path) -> None:
    transport = FakeLegacyTransport()
    transport.receipts.append(dict(transport.receipts[0], solve_index=2, at=2))

    with pytest.raises(PiqdPreappendedSnapshotError, match="solve frontier changed"):
        _runner(tmp_path, transport)

    assert all(method != "POST" for method, _url, _body in transport.calls)

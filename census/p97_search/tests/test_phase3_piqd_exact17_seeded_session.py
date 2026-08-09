from __future__ import annotations

import json
from pathlib import Path
from types import MappingProxyType
from typing import Any

import pytest

from census.p97_search import phase3_piqd_exact17_seeded_session as seeded
from census.p97_search.phase3_cegar_wave import canonical_json_bytes
from census.p97_search.phase3_piqd_exact17_direct6_package import PackageResult
from census.p97_search.phase3_piqd_exact17_runner import RunPacket
from census.p97_search.phase3_piqd_statement_bank_runner import JsonHttpResponse

SESSION_ID = "11111111-1111-4111-8111-111111111111"
AGGREGATE_SHA = "a" * 64


class FakeTransport:
    def __init__(self, responses: list[JsonHttpResponse]) -> None:
        self.responses = responses
        self.calls: list[tuple[str, str, object]] = []

    def request(
        self, method: str, path: str, body: dict[str, object] | None = None
    ) -> JsonHttpResponse:
        self.calls.append((method, path, body))
        if not self.responses:
            raise AssertionError("unexpected HTTP request")
        return self.responses.pop(0)


def _packet() -> RunPacket:
    return RunPacket(
        packet_id="fixture-direct6",
        cnf=b"p cnf 2 1\n1 0\n",
        producer_manifest=b"{}",
        wave_manifest={},
        package_hashes={},
        exact17_package=True,
    )


def _package(tmp_path: Path) -> PackageResult:
    document = {"lane_manifest_sha256": "9" * 64}
    return PackageResult(
        output_dir=tmp_path / "package",
        canonical_bytes=canonical_json_bytes(document),
        sha256="b" * 64,
        aggregate_sha256=AGGREGATE_SHA,
        aggregate_byte_count=20,
        num_variables=2,
        num_clauses=1,
        artifact_hashes=MappingProxyType({}),
    )


def _static_receipt(*, blob_hash: str = AGGREGATE_SHA) -> dict[str, Any]:
    return {
        "terminal_status": "completed",
        "terminal_result": "SAT",
        "terminal_outcome": "STRUCTURAL_SAT",
        "receipt_sha256": "c" * 64,
        "claims": {
            "source_semantics_checked": False,
            "source_entitlement": False,
            "complete_source_coverage": False,
            "aggregate_order_case_coverage": False,
            "universal_lift": False,
            "theorem_closure": False,
        },
        "job_identity": {
            "job_id": "22222222-2222-4222-8222-222222222222",
            "backend": "cadical",
            "solver_profile": "sat",
            "cnf_blob_hash": blob_hash,
            "num_variables": 2,
            "num_clauses": 1,
        },
    }


def _write_static(tmp_path: Path, document: dict[str, Any]) -> tuple[Path, Path]:
    receipt = tmp_path / "static-receipt.json"
    receipt.write_bytes(canonical_json_bytes(document) + b"\n")
    journal = tmp_path / "static-journal.jsonl"
    journal.write_text("fixture\n")
    return receipt, journal


def _session(root: Path, *, state: str, clauses: int = 1) -> dict[str, Any]:
    return {
        "id": SESSION_ID,
        "lane": "sat",
        "state": state,
        "solver_name": seeded.DEFAULT_SOLVER,
        "solver_sha256": "d" * 64,
        "solver_signature": "fixture-cadical",
        "protocol_version": 1,
        "journal_path": f"{root}/{SESSION_ID}/journal.cnf",
        "created_at": 10,
        "updated_at": 11 if state == "closed" else 10,
        "clauses": clauses,
        "max_var": 2,
        "solves": 0,
        "last_status": None,
        "label": seeded.DEFAULT_LABEL,
    }


def _run(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    transport: FakeTransport,
    *,
    document: dict[str, Any] | None = None,
    seed_mode: str = "job",
) -> seeded.SeededSessionQualification:
    root = tmp_path / "piqd-data"
    root.mkdir()
    receipt, journal = _write_static(tmp_path, document or _static_receipt())
    monkeypatch.setattr(
        seeded,
        "validate_run_receipt",
        lambda receipt_path, packet, journal_path: json.loads(receipt_path.read_text()),
    )
    monkeypatch.setattr(seeded, "wave_manifest_sha256", lambda value: "e" * 64)
    return seeded.qualify_seeded_session(
        _packet(),
        _package(tmp_path),
        static_receipt_path=receipt,
        static_journal_path=journal,
        output_receipt_path=tmp_path / "qualification.json",
        transport=transport,
        piqd_data_root=str(root),
        seed_mode=seed_mode,
    )


def test_seed_from_job_qualifies_and_closes(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    root = tmp_path / "piqd-data"
    transport = FakeTransport(
        [
            JsonHttpResponse(201, _session(root, state="live")),
            JsonHttpResponse(200, _session(root, state="closed")),
        ]
    )
    result = _run(tmp_path, monkeypatch, transport)
    assert result.session_id == SESSION_ID
    assert [call[:2] for call in transport.calls] == [
        ("POST", "/sessions"),
        ("DELETE", f"/sessions/{SESSION_ID}"),
    ]
    assert transport.calls[0][2] == {
        "solver": seeded.DEFAULT_SOLVER,
        "lane": "sat",
        "label": seeded.DEFAULT_LABEL,
        "seed_from_job": "22222222-2222-4222-8222-222222222222",
    }
    assert result.receipt["claims"] == seeded._FALSE_CLAIMS
    assert result.receipt["session"]["closed"]["state"] == "closed"
    raw = result.receipt_path.read_bytes()
    assert raw == canonical_json_bytes(result.receipt) + b"\n"


def test_blob_seed_is_bound_to_exact_aggregate(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    root = tmp_path / "piqd-data"
    transport = FakeTransport(
        [
            JsonHttpResponse(201, _session(root, state="live")),
            JsonHttpResponse(200, _session(root, state="closed")),
        ]
    )
    _run(tmp_path, monkeypatch, transport, seed_mode="blob")
    body = transport.calls[0][2]
    assert type(body) is dict
    assert body["seed_blob_hash"] == AGGREGATE_SHA
    assert "seed_from_job" not in body


@pytest.mark.parametrize("extra", [False, True])
def test_bad_created_session_fails_and_attempts_cleanup(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, extra: bool
) -> None:
    root = tmp_path / "piqd-data"
    created = _session(root, state="live", clauses=7)
    if extra:
        created["unexpected"] = True
    transport = FakeTransport(
        [
            JsonHttpResponse(201, created),
            JsonHttpResponse(200, _session(root, state="closed")),
        ]
    )
    with pytest.raises(seeded.SeededSessionQualificationError):
        _run(tmp_path, monkeypatch, transport)
    assert transport.calls[-1][:2] == ("DELETE", f"/sessions/{SESSION_ID}")


def test_static_blob_mismatch_fails_before_http(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    transport = FakeTransport([])
    with pytest.raises(
        seeded.SeededSessionQualificationError,
        match="exact package aggregate",
    ):
        _run(
            tmp_path,
            monkeypatch,
            transport,
            document=_static_receipt(blob_hash="f" * 64),
        )
    assert transport.calls == []


def test_invalid_seed_mode_fails_before_http(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    transport = FakeTransport([])
    with pytest.raises(seeded.SeededSessionQualificationError, match="seed_mode"):
        _run(tmp_path, monkeypatch, transport, seed_mode="both")
    assert transport.calls == []


def test_http_error_retains_bounded_daemon_explanation(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    transport = FakeTransport(
        [JsonHttpResponse(422, {"error": "solver is not registered"})]
    )
    with pytest.raises(
        seeded.SeededSessionQualificationError,
        match="solver is not registered",
    ):
        _run(tmp_path, monkeypatch, transport)
    assert [call[:2] for call in transport.calls] == [("POST", "/sessions")]

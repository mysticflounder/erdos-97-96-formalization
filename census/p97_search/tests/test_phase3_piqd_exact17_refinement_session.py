from __future__ import annotations

import hashlib
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import phase3_piqd_exact17_refinement_session as replay
from census.p97_search.phase3_piqd_exact17_refinement_chain import (
    FileRef,
    FrozenRefinementChain,
    Refinement,
)
from census.p97_search.phase3_piqd_statement_bank_runner import JsonHttpResponse

SESSION_ID = "11111111-1111-4111-8111-111111111111"
JOB_ID = "22222222-2222-4222-8222-222222222222"


def _sha(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


class FakeJsonTransport:
    def __init__(self, responses: list[JsonHttpResponse]) -> None:
        self.responses = responses
        self.calls: list[tuple[str, str, object]] = []

    def request(
        self, method: str, path: str, body: dict[str, object] | None = None
    ) -> JsonHttpResponse:
        self.calls.append((method, path, body))
        if not self.responses:
            raise AssertionError("unexpected JSON request")
        return self.responses.pop(0)


class FakeDownloader:
    def __init__(self, payloads: list[bytes]) -> None:
        self.payloads = payloads
        self.calls: list[tuple[str, str, int]] = []

    def download(
        self, method: str, path: str, destination: Path, *, byte_cap: int
    ) -> replay.DownloadResponse:
        self.calls.append((method, path, byte_cap))
        if not self.payloads:
            raise AssertionError("unexpected download")
        raw = self.payloads.pop(0)
        destination.write_bytes(raw)
        return replay.DownloadResponse(200, len(raw), _sha(raw))


def _file_ref(path: Path, raw: bytes) -> FileRef:
    path.write_bytes(raw)
    return FileRef(path, path.name, len(raw), _sha(raw))


def _chain(tmp_path: Path) -> tuple[FrozenRefinementChain, bytes, bytes]:
    root_raw = b"p cnf 3 1\n1 0\n"
    first_raw = b"-1 2 0\n"
    second_raw = b"3 0\n"
    aggregate_raw = b"p cnf 3 3\n1 0\n-1 2 0\n3 0\n"
    root = _file_ref(tmp_path / "root.cnf", root_raw)
    variable_map = _file_ref(tmp_path / "map.json", b"{}")
    receipt1 = _file_ref(tmp_path / "receipt1.json", b"{}")
    receipt2 = _file_ref(tmp_path / "receipt2.json", b"{}")
    fragment1 = _file_ref(tmp_path / "fragment1.cnf", first_raw)
    fragment2 = _file_ref(tmp_path / "fragment2.cnf", second_raw)
    refinements = (
        Refinement(
            1, "first", receipt1, "fixture/v1", fragment1, 1, "a" * 64, 1, "b" * 64, 2
        ),
        Refinement(
            2,
            "second",
            receipt2,
            "fixture/v1",
            fragment2,
            1,
            "b" * 64,
            2,
            _sha(aggregate_raw),
            3,
        ),
    )
    chain = FrozenRefinementChain(
        manifest_path=tmp_path / "manifest.json",
        manifest_sha256="c" * 64,
        root=root,
        root_num_vars=3,
        root_num_clauses=1,
        variable_map=variable_map,
        refinements=refinements,
        aggregate_sha256=_sha(aggregate_raw),
        aggregate_byte_count=len(aggregate_raw),
        aggregate_num_clauses=3,
    )
    return chain, root_raw, aggregate_raw


def _session(root: Path, *, state: str, clauses: int) -> dict[str, Any]:
    return {
        "id": SESSION_ID,
        "lane": "sat",
        "state": state,
        "solver_name": replay.DEFAULT_SOLVER,
        "solver_sha256": "d" * 64,
        "solver_signature": "fixture-cadical",
        "protocol_version": 1,
        "journal_path": f"{root}/{SESSION_ID}/journal.cnf",
        "created_at": 10,
        "updated_at": 11 if state == "closed" else 10,
        "clauses": clauses,
        "max_var": 3,
        "solves": 0,
        "last_status": None,
        "label": replay.DEFAULT_LABEL,
    }


def _responses(root: Path, *, first_added: int = 1) -> list[JsonHttpResponse]:
    return [
        JsonHttpResponse(201, _session(root, state="live", clauses=1)),
        JsonHttpResponse(200, {"added": first_added, "clauses": 2, "max_var": 3}),
        JsonHttpResponse(200, {"added": 1, "clauses": 3, "max_var": 3}),
        JsonHttpResponse(200, _session(root, state="closed", clauses=3)),
    ]


def test_replay_authenticates_every_append_and_both_exports(tmp_path: Path) -> None:
    chain, root_raw, aggregate_raw = _chain(tmp_path)
    data_root = tmp_path / "piqd-data"
    data_root.mkdir()
    transport = FakeJsonTransport(_responses(data_root))
    downloader = FakeDownloader([root_raw, aggregate_raw])

    result = replay.replay_refinement_session(
        chain,
        root_job_id=JOB_ID,
        output_receipt_path=tmp_path / "receipt.json",
        transport=transport,
        downloader=downloader,
        piqd_data_root=str(data_root),
    )

    assert result.session_id == SESSION_ID
    assert [call[:2] for call in transport.calls] == [
        ("POST", "/sessions"),
        ("POST", f"/sessions/{SESSION_ID}/clauses"),
        ("POST", f"/sessions/{SESSION_ID}/clauses"),
        ("DELETE", f"/sessions/{SESSION_ID}"),
    ]
    assert transport.calls[1][2] == {"clauses": [[-1, 2]]}
    assert transport.calls[2][2] == {"clauses": [[3]]}
    assert result.receipt["claims"] == replay._FALSE_CLAIMS
    assert result.receipt["session"]["closed"]["clauses"] == 3
    assert not list(tmp_path.glob(".*.tmp"))


def test_append_counter_mismatch_fails_and_closes(tmp_path: Path) -> None:
    chain, root_raw, _ = _chain(tmp_path)
    data_root = tmp_path / "piqd-data"
    data_root.mkdir()
    responses = _responses(data_root, first_added=2)
    responses = [responses[0], responses[1], responses[-1]]
    transport = FakeJsonTransport(responses)

    with pytest.raises(replay.RefinementSessionError, match="append counters"):
        replay.replay_refinement_session(
            chain,
            root_job_id=JOB_ID,
            output_receipt_path=tmp_path / "receipt.json",
            transport=transport,
            downloader=FakeDownloader([root_raw]),
            piqd_data_root=str(data_root),
        )
    assert transport.calls[-1][:2] == ("DELETE", f"/sessions/{SESSION_ID}")


def test_final_export_mismatch_fails_and_closes(tmp_path: Path) -> None:
    chain, root_raw, aggregate_raw = _chain(tmp_path)
    data_root = tmp_path / "piqd-data"
    data_root.mkdir()
    responses = _responses(data_root)
    transport = FakeJsonTransport(responses[:-1] + [responses[-1]])
    tampered = aggregate_raw[:-2] + b"1\n"

    with pytest.raises(replay.RefinementSessionError, match="export identity"):
        replay.replay_refinement_session(
            chain,
            root_job_id=JOB_ID,
            output_receipt_path=tmp_path / "receipt.json",
            transport=transport,
            downloader=FakeDownloader([root_raw, tampered]),
            piqd_data_root=str(data_root),
        )
    assert transport.calls[-1][:2] == ("DELETE", f"/sessions/{SESSION_ID}")

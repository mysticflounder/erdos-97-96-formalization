from __future__ import annotations

import itertools
import json
import random
from pathlib import Path
from typing import Any

import pytest
import rvol_wave2b_piqd_canary as producer
import verify_rvol_wave2b_piqd_canary as verifier


def cyclic_rows() -> tuple[tuple[int, ...], ...]:
    offsets = (1, 2, 4, 8)
    return tuple(
        tuple(sorted((center + offset) % 9 for offset in offsets))
        for center in range(9)
    )


def assignment_for(rows: tuple[tuple[int, ...], ...]) -> list[int]:
    positive = {
        producer.var_id(center, point)
        for center, row in enumerate(rows)
        for point in row
    }
    return [
        variable if variable in positive else -variable for variable in range(1, 73)
    ]


def independent_valid(rows: tuple[tuple[int, ...], ...]) -> bool:
    if any(len(row) != 4 or center in row for center, row in enumerate(rows)):
        return False
    if any(not any(point in row for row in rows) for point in range(9)):
        return False
    for first, second in itertools.combinations(range(9), 2):
        common = set(rows[first]) & set(rows[second])
        if len(common) > 2:
            return False
        if len(common) == 2:
            p, q = sorted(common)
            between_p = producer.between_cyclic(first, p, second)
            between_q = producer.between_cyclic(first, q, second)
            if between_p == between_q:
                return False
    for p, q in itertools.combinations(range(9), 2):
        if sum(p in row and q in row for row in rows) > 2:
            return False
    for mask in range(1, (1 << 9) - 1):
        if not any(
            point in rows[center]
            for center in range(9)
            if mask & (1 << center)
            for point in range(9)
            if not mask & (1 << point)
        ):
            return False
    return True


class FakeTransport:
    mode = "FAKE"
    solver_name = "fake-cadical"

    def __init__(self, responses: list[dict[str, Any]]) -> None:
        self.responses = list(responses)
        self.calls: list[tuple[Any, ...]] = []

    def open(self, root_cnf: bytes) -> str:
        self.calls.append(("open", producer.sha256_bytes(root_cnf)))
        return "fake-session"

    def solve(self, session_id: str, *, conflict_limit: int) -> dict[str, Any]:
        self.calls.append(("solve", session_id, conflict_limit))
        return self.responses.pop(0)

    def add_clause(self, session_id: str, clause: tuple[int, ...]) -> dict[str, Any]:
        self.calls.append(("add", session_id, clause))
        return {"status": "OK"}

    def receipts(self, session_id: str) -> bytes:
        raise AssertionError("FAKE terminals must not request PiQD receipts")

    def close(self, session_id: str) -> None:
        self.calls.append(("close", session_id))


class FailingLiveTransport(FakeTransport):
    mode = "LIVE"
    solver_name = "piqd-satworker-cadical-3.0.1"

    def open(self, root_cnf: bytes) -> str:
        raise RuntimeError("open failed\nwith control detail")


class RecordingLiveTransport(FakeTransport):
    mode = "LIVE"
    solver_name = "piqd-satworker-cadical-3.0.1"

    def __init__(self, responses: list[dict[str, Any]]) -> None:
        super().__init__(responses)
        self.clauses: list[tuple[int, ...]] = []

    def open(self, root_cnf: bytes) -> str:
        self.clauses = list(producer.parse_dimacs(root_cnf))
        return super().open(root_cnf)

    def add_clause(self, session_id: str, clause: tuple[int, ...]) -> dict[str, Any]:
        self.clauses.append(clause)
        return super().add_clause(session_id, clause)

    def receipts(self, session_id: str) -> bytes:
        self.calls.append(("receipts", session_id))
        return b"{}"

    def export_cnf(self, session_id: str) -> bytes:
        self.calls.append(("export", session_id))
        return producer.dimacs_bytes(self.clauses)


def test_contract_variable_map_and_root_inventory() -> None:
    contract = producer.load_contract()
    assert contract.contract_sha256 == contract.payload["contract_sha256"]
    assert len(producer.variable_map()) == 72
    assert all(
        producer.var_id(*producer.membership_of_var(variable)) == variable
        for variable in range(1, 73)
    )
    partitions = producer.root_clause_partitions()
    assert [name for name, _clauses in partitions] == contract.payload[
        "clause_classes"
    ]["ROOT_STATIC"]
    assert [len(clauses) for _name, clauses in partitions] == [
        1008,
        0,
        9,
        1260,
        1260,
        510,
        504,
    ]
    clauses = producer.root_clauses()
    assert len(clauses) == 4551
    assert len(clauses) - len(set(clauses)) == 9
    assert producer.parse_dimacs(producer.dimacs_bytes(clauses)) == clauses


def test_root_cnf_matches_independent_predicates() -> None:
    rng = random.Random(9796)
    clauses = producer.root_clauses()
    controls = [cyclic_rows()]
    controls.extend(
        tuple(
            tuple(
                sorted(rng.sample([point for point in range(9) if point != center], 4))
            )
            for center in range(9)
        )
        for _ in range(300)
    )
    for rows in controls:
        assert producer.replay_clauses(
            clauses, assignment_for(rows)
        ) is independent_valid(rows)
    assert independent_valid(cyclic_rows())


def test_atomic_certificate_and_cut_replay() -> None:
    rows = cyclic_rows()
    certificate = producer.detect_atomic_certificate(rows)
    assert certificate is not None
    assert certificate["kind"] == "ZERO_VECTOR"
    assert certificate["inequalities"][0]["kind"] == "K1"
    assert certificate["inequalities"][0]["indices"] == [0, 1, 2, 3]
    antecedents = producer.verify_certificate(certificate)
    assert antecedents
    cut = producer.local_cut(certificate)
    clause = producer.verify_local_cut(certificate, cut)
    assignment = set(assignment_for(rows))
    assert all(-literal in assignment for literal in clause)
    forged = json.loads(json.dumps(cut))
    forged["clause"] = forged["clause"][:-1]
    forged["cut_sha256"] = producer._self_hash(forged, "cut_sha256")
    with pytest.raises(producer.CanaryError):
        producer.verify_local_cut(certificate, forged)


def test_detector_nonvacuity_control() -> None:
    partial_rows = ((1, 2, 3, 4),) + ((),) * 8
    assert producer.detect_atomic_certificate(partial_rows) is None


def test_fake_cegar_and_independent_verifier(tmp_path: Path) -> None:
    transport = FakeTransport(
        [
            {"status": "SAT", "model": assignment_for(cyclic_rows())},
            {"status": "UNSAT"},
        ]
    )
    terminal = producer.run_cegar(
        transport, producer.DirectoryArtifactSink(tmp_path), max_iterations=4
    )
    assert terminal["status"] == "DISCOVERY_UNSAT"
    assert terminal["iteration_count"] == 1
    assert terminal["detail"] is None
    summary = verifier.verify_run(tmp_path, producer.DEFAULT_CONTRACT_PATH)
    assert summary["status"] == "VERIFIED"
    assert summary["terminal_status"] == "DISCOVERY_UNSAT"
    assert summary["iteration_count"] == 1
    with pytest.raises(verifier.VerificationError, match="requires LIVE PiQD"):
        verifier.verify_run(
            tmp_path,
            producer.DEFAULT_CONTRACT_PATH,
            require_live_piqd=True,
        )


@pytest.mark.parametrize(
    ("response", "expected", "has_detail"),
    [
        ({"status": "UNKNOWN"}, "UNKNOWN_FAIL_CLOSED", False),
        ({"status": "SAT", "model": [1]}, "INVALID_ENCODING_MODEL", True),
    ],
)
def test_fail_closed_statuses(
    response: dict[str, Any], expected: str, has_detail: bool
) -> None:
    sink = producer.MemoryArtifactSink()
    terminal = producer.run_cegar(FakeTransport([response]), sink)
    assert terminal["status"] == expected
    assert (terminal["detail"] is not None) is has_detail


def test_maxiter_and_alive_do_not_overclaim(monkeypatch: pytest.MonkeyPatch) -> None:
    assignment = assignment_for(cyclic_rows())
    maxiter = producer.run_cegar(
        FakeTransport([{"status": "SAT", "model": assignment}]),
        producer.MemoryArtifactSink(),
        max_iterations=1,
    )
    assert maxiter["status"] == "MAXITER"
    assert maxiter["iteration_count"] == 1

    monkeypatch.setattr(producer, "detect_atomic_certificate", lambda _rows: None)
    alive = producer.run_cegar(
        FakeTransport([{"status": "SAT", "model": assignment}]),
        producer.MemoryArtifactSink(),
    )
    assert alive["status"] == "ALIVE_UNRESOLVED_ABSTRACT_MODEL"
    assert alive["iteration_count"] == 1


def test_resume_is_noop() -> None:
    sink = producer.MemoryArtifactSink()
    first = FakeTransport([{"status": "UNSAT"}])
    terminal = producer.run_cegar(first, sink)
    original = dict(sink.files)
    second = FakeTransport([])
    assert producer.run_cegar(second, sink) == terminal
    assert second.calls == []
    assert sink.files == original


def test_live_open_failure_records_piqd_error() -> None:
    terminal = producer.run_cegar(
        FailingLiveTransport([]), producer.MemoryArtifactSink()
    )
    assert terminal["status"] == "PIQD_ERROR"
    assert terminal["piqd"]["session_id"] is None
    assert terminal["piqd"]["receipts_path"] is None
    assert terminal["detail"]
    assert "\n" not in terminal["detail"]


def test_live_run_exports_and_checks_final_session_formula() -> None:
    sink = producer.MemoryArtifactSink()
    terminal = producer.run_cegar(
        RecordingLiveTransport(
            [{"status": "SAT", "model": assignment_for(cyclic_rows())}]
        ),
        sink,
        max_iterations=1,
    )
    assert terminal["status"] == "MAXITER"
    assert sink.read_bytes("artifacts/piqd-final.cnf") == sink.read_bytes(
        "artifacts/final.cnf"
    )


def test_live_receipts_bind_reconstructed_parent_clause_body(tmp_path: Path) -> None:
    parent = producer.dimacs_bytes(producer.root_clauses())
    body = parent.split(b"\n", 1)[1]
    session_id = "receipt-test-session"
    payload = {
        "count": 1,
        "journal_path": f"/custody/{session_id}/journal.cnf",
        "lane": "sat",
        "receipts": [
            {
                "assumptions": [],
                "at": 1,
                "base_bytes": len(body),
                "base_clauses": 4551,
                "base_sha256": producer.sha256_bytes(body),
                "conflict_limit": 1_000_000,
                "model_recorded": True,
                "result_sha256": "0" * 64,
                "solve_index": 1,
                "status": "SAT",
            }
        ],
        "receipts_path": f"/custody/{session_id}/receipts.jsonl",
        "session_id": session_id,
    }
    path = tmp_path / "piqd-receipts.json"
    path.write_text(json.dumps(payload), encoding="utf-8")
    assert (
        verifier._validate_live_receipts(
            path,
            session_id=session_id,
            terminal_status="MAXITER",
            conflict_limit=1_000_000,
            recorded_parent_cnfs=[parent],
            final_cnf=parent,
        )
        == 1
    )

    payload["receipts"][0]["base_sha256"] = "f" * 64
    path.write_text(json.dumps(payload), encoding="utf-8")
    with pytest.raises(verifier.VerificationError, match="clause-body hash mismatch"):
        verifier._validate_live_receipts(
            path,
            session_id=session_id,
            terminal_status="MAXITER",
            conflict_limit=1_000_000,
            recorded_parent_cnfs=[parent],
            final_cnf=parent,
        )


def test_unsat_receipt_requires_empty_assumption_core(tmp_path: Path) -> None:
    parent = producer.dimacs_bytes(producer.root_clauses())
    body = parent.split(b"\n", 1)[1]
    session_id = "unsat-receipt-test"
    receipt = {
        "assumptions": [],
        "at": 1,
        "base_bytes": len(body),
        "base_clauses": 4551,
        "base_sha256": producer.sha256_bytes(body),
        "conflict_limit": 1_000_000,
        "core": [],
        "model_recorded": False,
        "result_sha256": "0" * 64,
        "solve_index": 1,
        "status": "UNSAT",
    }
    payload = {
        "count": 1,
        "journal_path": f"/custody/{session_id}/journal.cnf",
        "lane": "sat",
        "receipts": [receipt],
        "receipts_path": f"/custody/{session_id}/receipts.jsonl",
        "session_id": session_id,
    }
    path = tmp_path / "piqd-unsat-receipts.json"
    path.write_text(json.dumps(payload), encoding="utf-8")
    assert (
        verifier._validate_live_receipts(
            path,
            session_id=session_id,
            terminal_status="DISCOVERY_UNSAT",
            conflict_limit=1_000_000,
            recorded_parent_cnfs=[],
            final_cnf=parent,
        )
        == 1
    )

    receipt.pop("core")
    path.write_text(json.dumps(payload), encoding="utf-8")
    with pytest.raises(verifier.VerificationError, match=r"missing=\['core'\]"):
        verifier._validate_live_receipts(
            path,
            session_id=session_id,
            terminal_status="DISCOVERY_UNSAT",
            conflict_limit=1_000_000,
            recorded_parent_cnfs=[],
            final_cnf=parent,
        )

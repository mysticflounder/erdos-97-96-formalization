from __future__ import annotations

import hashlib
import importlib
import json
import os
from pathlib import Path
from typing import Any

import pytest

incremental = importlib.import_module(
    "census.p97_search.phase3_piqd_incremental_discovery"
)

SEED = b"c source\np cnf 2 1\n1 2 0\n"
PRODUCER = b'{"producer":"fake"}'
SOURCE = b'{"source":"test"}'
SESSION = "11111111-1111-4111-8111-111111111111"
JOB_ID = "22222222-2222-4222-8222-222222222222"


def _response(status: int, value: Any = None) -> incremental.HttpResponse:
    if value is None:
        return incremental.HttpResponse(status, b"", {})
    return incremental.HttpResponse(
        status,
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode(),
        {"content-type": "application/json"},
    )


class FakeSessionTransport:
    def __init__(
        self,
        *,
        model: list[int] | None = None,
        job_id: str = JOB_ID,
        job_blob_hash: str | None = None,
        job_cnf: bytes | None = None,
        status: str = "SAT",
        core: list[int] | None = None,
        interrupted_by: str | None = None,
        result_hash_override: str | None = None,
        create_malformed: bool = False,
        close_404: bool = False,
        close_transport_loss: bool = False,
        close_transport_committed: bool = True,
        close_malformed: bool = False,
        append_response_loss: bool = False,
        solve_receipts_loss: bool = False,
        model_route_missing: bool = False,
        last_status_override: str | None = None,
    ) -> None:
        self.calls: list[tuple[str, str, bytes | None]] = []
        self.job_id = job_id
        self.job_blob_hash = job_blob_hash or hashlib.sha256(SEED).hexdigest()
        self.job_cnf = job_cnf if job_cnf is not None else SEED
        self.clauses = [(1, 2)]
        self.variable_count = 2
        self.receipts: list[dict[str, Any]] = []
        self.model = model if model is not None else [1, -2]
        self.status = status
        self.core = core
        self.interrupted_by = interrupted_by
        self.result_hash_override = result_hash_override
        self.create_malformed = create_malformed
        self.close_404 = close_404
        self.close_transport_loss = close_transport_loss
        self.close_transport_committed = close_transport_committed
        self.close_malformed = close_malformed
        self.append_response_loss = append_response_loss
        self.solve_receipts_loss = solve_receipts_loss
        self.model_route_missing = model_route_missing
        self.last_status_override = last_status_override
        self._append_lost = False
        self._solve_receipts_lost = False
        self.close_calls = 0
        self.model_get_calls = 0
        self.closed = False
        self._close_lost = False
        self._close_malformed = False

    def _session(self) -> dict[str, Any]:
        latest = self.receipts[-1] if self.receipts else None
        return {
            "id": SESSION,
            "lane": "sat",
            "state": "closed" if self.closed else "live",
            "solver_name": "fake-cadical",
            "solver_sha256": "a" * 64,
            "solver_signature": "fake-cadical",
            "protocol_version": 1,
            "journal_path": "/var/lib/piqd/sessions/fake.journal",
            "created_at": 1,
            "updated_at": 2,
            "clauses": len(self.clauses),
            "max_var": self.variable_count,
            "solves": len(self.receipts),
            "last_status": (
                self.last_status_override
                if self.last_status_override is not None
                else latest["status"]
                if latest
                else None
            ),
            "declared_num_vars": 2,
            "last_solve_index": latest["solve_index"] if latest else None,
            "last_assumption_free": True if latest else None,
            "last_terminal_unsat": (
                latest["status"] == "UNSAT" and latest.get("core") == []
            )
            if latest
            else None,
            "label": "fake",
        }

    def _cnf(self) -> bytes:
        lines = [f"p cnf {self.variable_count} {len(self.clauses)}\n"]
        lines.extend(" ".join(map(str, clause)) + " 0\n" for clause in self.clauses)
        return "".join(lines).encode()

    def _journal(self) -> bytes:
        return incremental._journal_bytes(self.clauses)

    def __call__(
        self, method: str, url: str, body: bytes | None, _headers: dict[str, str]
    ) -> incremental.HttpResponse:
        path = url.split("/", 3)[-1]
        self.calls.append((method, path, body))
        payload = json.loads(body) if body else {}
        if method == "GET" and path.startswith("blobs/"):
            raise AssertionError("bare blob route used")
        if method == "GET" and path.startswith("jobs/") and "/blobs/" in path:
            job_id, requested_hash = path.removeprefix("jobs/").split("/blobs/", 1)
            if job_id != self.job_id or requested_hash != self.job_blob_hash:
                return _response(404, {"error": "not found"})
            return incremental.HttpResponse(200, self.job_cnf, {})
        if method == "POST" and path == "sessions":
            assert payload == {
                "lane": "sat",
                "label": payload["label"],
                "seed_blob_hash": self.job_blob_hash,
                "solver": "fake-cadical",
            }
            session = self._session()
            if self.create_malformed:
                session.pop("solver_name")
            return _response(201, session)
        if path == f"sessions/{SESSION}":
            if method == "GET":
                return _response(200, self._session())
            if method == "DELETE":
                self.close_calls += 1
                if self.close_404:
                    return _response(404, {"error": "already closed"})
                if self.close_transport_loss and not self._close_lost:
                    self._close_lost = True
                    self.closed = self.close_transport_committed
                    raise RuntimeError("simulated close transport loss")
                if self.close_malformed and not self._close_malformed:
                    self._close_malformed = True
                    self.closed = True
                    return incremental.HttpResponse(200, b"not-json", {})
                self.closed = True
                return _response(200, self._session())
        if method == "GET" and path == f"sessions/{SESSION}/cnf":
            return incremental.HttpResponse(200, self._cnf(), {})
        if method == "GET" and path == f"sessions/{SESSION}/model":
            self.model_get_calls += 1
            if self.model_route_missing:
                return _response(409, {"error": "no running solver"})
            return _response(200, {"vars": self.variable_count, "model": self.model})
        if method == "POST" and path == f"sessions/{SESSION}/clauses":
            additions = [tuple(clause) for clause in payload["clauses"]]
            self.clauses.extend(additions)
            self.variable_count = max(
                self.variable_count,
                max(
                    (abs(lit) for clause in additions for lit in clause),
                    default=self.variable_count,
                ),
            )
            response = _response(
                200,
                {
                    "added": len(additions),
                    "clauses": len(self.clauses),
                    "max_var": self.variable_count,
                },
            )
            if self.append_response_loss and not self._append_lost:
                self._append_lost = True
                return _response(503, {"error": "response lost after commit"})
            return response
        if method == "POST" and path == f"sessions/{SESSION}/solve":
            assert payload["assumptions"] == [] and payload["include_model"] is True
            index = len(self.receipts) + 1
            model = list(self.model) if self.status == "SAT" else None
            core = (
                list(self.core)
                if self.status == "UNSAT" and self.core is not None
                else ([] if self.status == "UNSAT" else None)
            )
            if self.status == "UNKNOWN" and self.core is not None:
                core = list(self.core)
            terminal = (core == []) if self.status == "UNSAT" else None
            result_hash = incremental._result_digest(
                self.status, self.interrupted_by, core, model
            )
            if self.result_hash_override is not None:
                result_hash = self.result_hash_override
            receipt: dict[str, Any] = {
                "solve_index": index,
                "base_clauses": len(self.clauses),
                "base_bytes": len(self._journal()),
                "base_sha256": hashlib.sha256(self._journal()).hexdigest(),
                "assumptions": [],
                "status": self.status,
                "model_recorded": model is not None,
                "result_sha256": result_hash,
                "at": index,
            }
            if payload.get("timeout_ms") is not None:
                receipt["timeout_ms"] = payload["timeout_ms"]
            if payload.get("conflict_limit") is not None:
                receipt["conflict_limit"] = payload["conflict_limit"]
            if self.interrupted_by is not None:
                receipt["interrupted_by"] = self.interrupted_by
            if core is not None:
                receipt["core"] = core
            self.receipts.append(receipt)
            response: dict[str, Any] = {
                "status": self.status,
                "solve_ms": 1,
                "solve_index": index,
                "result_sha256": result_hash,
            }
            if model is not None:
                response["model"] = model
            if core is not None:
                response["core"] = core
                response["terminal_unsat"] = terminal
            if self.interrupted_by is not None:
                response["interrupted_by"] = self.interrupted_by
            return _response(200, response)
        if method == "GET" and path == f"sessions/{SESSION}/receipts":
            if (
                self.solve_receipts_loss
                and self.receipts
                and not self._solve_receipts_lost
            ):
                self._solve_receipts_lost = True
                return _response(503, {"error": "receipt read lost after commit"})
            return _response(
                200,
                {
                    "session_id": SESSION,
                    "lane": "sat",
                    "journal_path": "/var/lib/piqd/sessions/fake.journal",
                    "receipts_path": "/var/lib/piqd/sessions/fake.receipts",
                    "count": len(self.receipts),
                    "receipts": self.receipts,
                },
            )
        raise AssertionError(f"unhandled fake request {method} {path}")


def descriptor(
    job_id: str = JOB_ID, *, seed: bytes = SEED
) -> incremental.DiscoveryDescriptor:
    return incremental.DiscoveryDescriptor(
        seed_cnf=seed,
        producer_manifest=PRODUCER,
        source_manifest=SOURCE,
        solver_name="fake-cadical",
        producer_job_id=job_id,
    )


def runner(
    tmp_path: Path,
    transport: FakeSessionTransport,
    name: str = "receipts.jsonl",
    **kwargs: Any,
) -> incremental.PiqdIncrementalDiscoveryRunner:
    return incremental.PiqdIncrementalDiscoveryRunner(
        "http://piqd.test",
        descriptor(),
        receipt_path=tmp_path / name,
        transport=transport,
        **kwargs,
    )


def test_seed_frontier_append_solve_and_receipt_custody(tmp_path: Path) -> None:
    transport = FakeSessionTransport()
    active = runner(tmp_path, transport)
    assert active.frontier_count == 1
    assert active.append_clauses([(-2,)]) == 1
    result = active.solve(timeout_ms=25, conflict_limit=7)
    assert result.status == "SAT" and result.assignment == (1, -2)
    assert result.proof_verified is False and result.closure_claim is False
    assert result.receipt["base_bytes"] == len(transport._journal())
    assert all(not path.startswith("blobs/") for _, path, _ in transport.calls)


def test_receipt_base_binds_headerless_live_journal_not_exported_cnf(
    tmp_path: Path,
) -> None:
    transport = FakeSessionTransport()
    active = runner(tmp_path, transport)
    result = active.solve()
    # Fixed live-shaped PIQD bytes: journal.rs writes clause lines without the
    # export's p-line, and the receipt names that exact byte prefix.
    journal = b"1 2 0\n"
    exported = b"p cnf 2 1\n1 2 0\n"
    assert result.receipt["base_bytes"] == 6
    assert result.receipt["base_sha256"] == (
        "f33e4ee3af37194d557c0d8d3f2d801aa383e27bb0a40b3a4cc76ca9ffeaca97"
    )
    assert hashlib.sha256(journal).hexdigest() == result.receipt["base_sha256"]
    assert hashlib.sha256(exported).hexdigest() != result.receipt["base_sha256"]
    assert active.exported_cnf_sha256 == hashlib.sha256(transport._cnf()).hexdigest()


def test_empty_clause_journal_uses_exact_rust_bytes_and_digest() -> None:
    # Fixed independently of _journal_bytes: seed.rs writes an empty clause
    # as exactly `0\n`, with no leading space.
    journal = b"0\n"
    assert incremental._journal_bytes([()]) == journal
    assert hashlib.sha256(journal).hexdigest() == (
        "9a271f2a916b0b6ee6cecb2426f0b3206ef074578be55d9bc94f6f3fe3ab86aa"
    )


def test_restart_restores_frontier_not_learned_state(tmp_path: Path) -> None:
    transport = FakeSessionTransport()
    active = runner(tmp_path, transport)
    active.append_clauses([(-2,)])
    active.solve()
    revived = runner(tmp_path, transport, session_id=SESSION)
    assert revived.clauses == active.clauses
    assert revived.solve_count == 1
    assert revived.manifest_metadata()["learned_state"] == "not_claimed"


def test_restart_rebinds_receipts_across_later_frontier_append(tmp_path: Path) -> None:
    transport = FakeSessionTransport()
    active = runner(tmp_path, transport)
    active.solve()
    active.append_clauses([(-2,)])
    revived = runner(tmp_path, transport, session_id=SESSION)
    assert revived.frontier_count == 2 and revived.solve_count == 1


def test_restart_repairs_remote_append_without_resending(tmp_path: Path) -> None:
    transport = FakeSessionTransport(append_response_loss=True)
    active = runner(tmp_path, transport)
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError, match="503"):
        active.append_clauses([(-2,)])
    post_count = sum(
        method == "POST" and path == f"sessions/{SESSION}/clauses"
        for method, path, _ in transport.calls
    )
    revived = runner(tmp_path, transport, session_id=SESSION)
    assert revived.frontier_count == 2
    assert (
        sum(
            method == "POST" and path == f"sessions/{SESSION}/clauses"
            for method, path, _ in transport.calls
        )
        == post_count
    )


def test_restart_repairs_append_after_local_write_loss(
    tmp_path: Path, monkeypatch
) -> None:
    transport = FakeSessionTransport()
    active = runner(tmp_path, transport)
    original = incremental._append_file
    failed = False

    def fail_append(path, root, data):
        nonlocal failed
        if not failed and b'"event":"append"' in data:
            failed = True
            raise incremental.PiqdIncrementalDiscoveryError(
                "simulated local write loss"
            )
        return original(path, root, data)

    monkeypatch.setattr(incremental, "_append_file", fail_append)
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError, match="local write"):
        active.append_clauses([(-2,)])
    monkeypatch.setattr(incremental, "_append_file", original)
    revived = runner(tmp_path, transport, session_id=SESSION)
    assert revived.frontier_count == 2


def test_bad_model_is_rejected_and_boundary_is_not_proof(tmp_path: Path) -> None:
    with pytest.raises(
        incremental.PiqdIncrementalDiscoveryError, match="formula replay"
    ):
        runner(tmp_path, FakeSessionTransport(model=[-1, -2])).solve()


def test_descriptor_rejects_duplicate_nonfinite_and_noncanonical_identity() -> None:
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError):
        incremental.DiscoveryDescriptor(
            seed_cnf=SEED,
            producer_manifest=b'{"x":1,"x":2}',
            source_manifest=SOURCE,
            solver_name="fake",
            producer_job_id=JOB_ID,
        )
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError):
        incremental.DiscoveryDescriptor(
            seed_cnf=SEED,
            producer_manifest=b'{"x":NaN}',
            source_manifest=SOURCE,
            solver_name="fake",
            producer_job_id=JOB_ID,
        )
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError, match="UUID"):
        descriptor("JOB")


def test_fresh_session_refuses_preexisting_journal(tmp_path: Path) -> None:
    journal = tmp_path / "receipts.jsonl"
    journal.write_bytes(b"tampered\n")
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError, match="preexisting"):
        runner(tmp_path, FakeSessionTransport())


def test_wrong_missing_and_cross_job_hash_bytes_are_bound(tmp_path: Path) -> None:
    wrong_job = "33333333-3333-4333-8333-333333333333"
    wrong_transport = FakeSessionTransport(job_id=wrong_job)
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError, match="HTTP 404"):
        incremental.PiqdIncrementalDiscoveryRunner(
            "http://piqd.test",
            descriptor(),
            receipt_path=tmp_path / "wrong.jsonl",
            transport=wrong_transport,
        )
    bytes_transport = FakeSessionTransport(job_cnf=b"p cnf 2 1\n-1 0\n")
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError, match="bytes"):
        runner(tmp_path, bytes_transport, name="bytes.jsonl")


def test_job_scoped_route_binds_exact_job_hash_and_bytes(tmp_path: Path) -> None:
    transport = FakeSessionTransport()
    runner(tmp_path, transport)
    paths = [path for _, path, _ in transport.calls]
    assert f"jobs/{JOB_ID}/blobs/{hashlib.sha256(SEED).hexdigest()}" in paths
    assert all(path != f"blobs/{hashlib.sha256(SEED).hexdigest()}" for path in paths)


def test_empty_clause_unsat_and_malformed_terminals_fail_closed(tmp_path: Path) -> None:
    empty_seed = b"p cnf 2 1\n0\n"
    empty_descriptor = incremental.DiscoveryDescriptor(
        seed_cnf=empty_seed,
        producer_manifest=PRODUCER,
        source_manifest=SOURCE,
        solver_name="fake-cadical",
        producer_job_id=JOB_ID,
    )
    transport = FakeSessionTransport(
        job_cnf=empty_seed,
        job_blob_hash=hashlib.sha256(empty_seed).hexdigest(),
        status="UNSAT",
        core=[],
    )
    transport.clauses = [()]
    active = incremental.PiqdIncrementalDiscoveryRunner(
        "http://piqd.test",
        empty_descriptor,
        receipt_path=tmp_path / "empty.jsonl",
        transport=transport,
    )
    assert active.solve().status == "UNSAT"
    bad = FakeSessionTransport(status="UNKNOWN", interrupted_by=None)
    bad.core = [1]
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError):
        runner(tmp_path, bad, name="bad.jsonl").solve()
    bad_core = FakeSessionTransport(status="UNSAT", core=[3])
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError, match="universe"):
        runner(tmp_path, bad_core, name="bad-core.jsonl").solve()
    assumption_core = FakeSessionTransport(status="UNSAT", core=[1])
    with pytest.raises(
        incremental.PiqdIncrementalDiscoveryError, match="assumption-free"
    ):
        runner(tmp_path, assumption_core, name="assumption-core.jsonl").solve()


def test_restart_repairs_unknown_solve_after_receipt_read_loss(tmp_path: Path) -> None:
    transport = FakeSessionTransport(status="UNKNOWN", solve_receipts_loss=True)
    active = runner(tmp_path, transport)
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError, match="503"):
        active.solve()
    revived = runner(tmp_path, transport, session_id=SESSION)
    assert revived.solve_count == 1


def test_restart_reports_missing_sat_model_for_solve_journal_repair(
    tmp_path: Path, monkeypatch
) -> None:
    transport = FakeSessionTransport(model_route_missing=True)
    active = runner(tmp_path, transport)
    original = incremental._append_file
    failed = False

    def fail_solve_append(path, root, data):
        nonlocal failed
        if not failed and b'"event":"solve"' in data:
            failed = True
            raise incremental.PiqdIncrementalDiscoveryError(
                "simulated local write loss"
            )
        return original(path, root, data)

    monkeypatch.setattr(incremental, "_append_file", fail_solve_append)
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError, match="local write"):
        active.solve()
    monkeypatch.setattr(incremental, "_append_file", original)
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError, match="exact model"):
        runner(tmp_path, transport, session_id=SESSION)


def test_restart_repairs_sat_solve_from_live_model_surface(
    tmp_path: Path, monkeypatch
) -> None:
    transport = FakeSessionTransport()
    active = runner(tmp_path, transport)
    original = incremental._append_file
    failed = False

    def fail_solve_append(path, root, data):
        nonlocal failed
        if not failed and b'"event":"solve"' in data:
            failed = True
            raise incremental.PiqdIncrementalDiscoveryError(
                "simulated local write loss"
            )
        return original(path, root, data)

    monkeypatch.setattr(incremental, "_append_file", fail_solve_append)
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError, match="local write"):
        active.solve()
    monkeypatch.setattr(incremental, "_append_file", original)
    revived = runner(tmp_path, transport, session_id=SESSION)
    assert revived.solve_count == 1


def test_historical_sat_does_not_probe_model_when_current_status_is_not_sat(
    tmp_path: Path, monkeypatch
) -> None:
    transport = FakeSessionTransport(last_status_override="UNKNOWN")
    active = runner(tmp_path, transport)
    original = incremental._append_file
    failed = False

    def fail_solve_append(path, root, data):
        nonlocal failed
        if not failed and b'"event":"solve"' in data:
            failed = True
            raise incremental.PiqdIncrementalDiscoveryError(
                "simulated local write loss"
            )
        return original(path, root, data)

    monkeypatch.setattr(incremental, "_append_file", fail_solve_append)
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError, match="local write"):
        active.solve()
    monkeypatch.setattr(incremental, "_append_file", original)
    with pytest.raises(
        incremental.PiqdIncrementalDiscoveryError,
        match="current session last_status SAT",
    ):
        runner(tmp_path, transport, session_id=SESSION)
    assert transport.model_get_calls == 0


def test_create_failure_with_recovered_uuid_closes_once(tmp_path: Path) -> None:
    transport = FakeSessionTransport(create_malformed=True)
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError, match="wrong keys"):
        runner(tmp_path, transport)
    assert transport.close_calls == 1


def test_close_is_idempotent_and_accepts_current_session_404(tmp_path: Path) -> None:
    transport = FakeSessionTransport(close_404=True)
    active = runner(tmp_path, transport)
    active.close()
    active.close()
    assert transport.close_calls == 1


def test_uncertain_close_reconciles_committed_delete_without_retrying_delete(
    tmp_path: Path,
) -> None:
    transport = FakeSessionTransport(close_transport_loss=True)
    active = runner(tmp_path, transport)
    with pytest.raises(RuntimeError, match="transport loss"):
        active.close()
    active.close()
    active.close()
    assert transport.closed is True
    assert transport.close_calls == 1


def test_uncertain_close_retries_when_reconciliation_still_live(tmp_path: Path) -> None:
    transport = FakeSessionTransport(
        close_transport_loss=True, close_transport_committed=False
    )
    active = runner(tmp_path, transport)
    with pytest.raises(RuntimeError, match="transport loss"):
        active.close()
    active.close()
    assert transport.closed is True
    assert transport.close_calls == 2


def test_malformed_close_response_reconciles_without_double_delete(
    tmp_path: Path,
) -> None:
    transport = FakeSessionTransport(close_malformed=True)
    active = runner(tmp_path, transport)
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError, match="strict JSON"):
        active.close()
    active.close()
    assert transport.closed is True
    assert transport.close_calls == 1


def test_custody_root_must_be_private_to_current_user(tmp_path: Path) -> None:
    tmp_path.chmod(0o755)
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError, match="private"):
        runner(tmp_path, FakeSessionTransport())


def test_result_digest_is_independently_recomputed(tmp_path: Path) -> None:
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError, match="digest"):
        runner(
            tmp_path,
            FakeSessionTransport(result_hash_override="f" * 64),
            name="digest.jsonl",
        ).solve()


def test_result_digest_fixed_vectors_match_piqd_absence_encoding() -> None:
    # These are fixed PIQD vectors, deliberately not generated by the helper
    # under test.  An absent interruption is empty bytes, while absent and
    # present-empty cores have distinct encodings.
    assert (
        incremental._result_digest("UNKNOWN", None, None, None)
        == "633202f225dc7c22776f6229777c1a5b8a9343719683ebe57a0441e7011e8d80"
    )
    assert (
        incremental._result_digest("UNSAT", None, [], None)
        == "094cb34820cf39c65ec70c8a2abb09b1cb3068ff034b3c08ac9c90473168a26d"
    )
    assert (
        incremental._result_digest("UNSAT", None, None, None)
        == "e286a8770f094a7e28901b177246a97f5f3c0c725aea3d5a9ea1edc20baac61e"
    )
    assert incremental._result_digest(
        "UNSAT", None, [], None
    ) != incremental._result_digest("UNSAT", None, None, None)


def test_zero_variable_and_unconstrained_policy_fail_closed(tmp_path: Path) -> None:
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError, match="positive"):
        incremental.DiscoveryDescriptor(
            seed_cnf=b"p cnf 0 1\n0\n",
            producer_manifest=PRODUCER,
            source_manifest=SOURCE,
            solver_name="fake",
            producer_job_id=JOB_ID,
        )
    unconstrained = b"p cnf 2 1\n1 0\n"
    desc = incremental.DiscoveryDescriptor(
        seed_cnf=unconstrained,
        producer_manifest=PRODUCER,
        source_manifest=SOURCE,
        solver_name="fake-cadical",
        producer_job_id=JOB_ID,
    )
    transport = FakeSessionTransport(
        job_cnf=unconstrained,
        job_blob_hash=hashlib.sha256(unconstrained).hexdigest(),
    )
    transport.clauses = [(1,)]
    with pytest.raises(
        incremental.PiqdIncrementalDiscoveryError, match="unconstrained"
    ):
        incremental.PiqdIncrementalDiscoveryRunner(
            "http://piqd.test",
            desc,
            receipt_path=tmp_path / "u.jsonl",
            transport=transport,
        ).solve()


def test_journal_authentication_rejects_gaps_and_arbitrary_state(
    tmp_path: Path,
) -> None:
    transport = FakeSessionTransport()
    runner(tmp_path, transport)
    journal = tmp_path / "receipts.jsonl"
    events = [json.loads(line) for line in journal.read_text().splitlines()]
    events[0]["sequence"] = 4
    journal.write_text(
        "\n".join(
            json.dumps(event, sort_keys=True, separators=(",", ":")) for event in events
        )
        + "\n"
    )
    with pytest.raises(
        incremental.PiqdIncrementalDiscoveryError, match="sequence|authentication"
    ):
        runner(tmp_path, transport, name="receipts.jsonl", session_id=SESSION)


def test_custody_root_rejects_symlinked_input(tmp_path: Path) -> None:
    target = tmp_path / "real.cnf"
    target.write_bytes(SEED)
    link = tmp_path / "link.cnf"
    link.symlink_to(target)
    active = runner(tmp_path, FakeSessionTransport())
    with pytest.raises(incremental.PiqdIncrementalDiscoveryError):
        active(link, 1, None)
    assert os.path.islink(link)

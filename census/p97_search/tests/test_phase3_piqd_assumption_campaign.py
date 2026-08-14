from __future__ import annotations

import hashlib
import json
import os
from collections.abc import Callable
from pathlib import Path
from typing import Any, Self

import pytest

from census.p97_search import phase3_piqd_assumption_campaign as campaign

PARENT = b"c reviewed parent\np cnf 3 3\n1 2 0\n-1 3 0\n2 -3 0\n"
SESSION_ID = "11111111-1111-4111-8111-111111111111"
JOB_ID = "22222222-2222-4222-8222-222222222222"
REQUEST_ID = "aaaaaaaa-aaaa-4aaa-8aaa-aaaaaaaaaaaa"
SOLVER_SHA = "b" * 64
MANIFEST_SHA = "c" * 64


def _response(status: int, value: Any) -> campaign.HttpResponse:
    return campaign.HttpResponse(
        status,
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode(),
        {"content-type": "application/json"},
    )


class FakePiqd:
    def __init__(
        self,
        parent_identity: campaign.CnfStreamIdentity,
        *,
        status: str = "SAT",
        core: list[int] | None = None,
        response_losses: int = 0,
        response_extra: bool = False,
        crossed_receipt: bool = False,
        solve_ms: Any = 4,
        close_response_loss: bool = False,
        solver_sha256: str = SOLVER_SHA,
        protocol_version: int = 7,
        hook: Callable[[str, str], None] | None = None,
        producer_status: Any = "completed",
        producer_blob_hash: Any = None,
        producer_manifest_hash: Any = MANIFEST_SHA,
        response_status_override: Any = None,
        receipt_status_override: Any = None,
        receipt_conflict_override: Any = None,
        receipt_timeout_override: Any = None,
        receipt_lane_override: Any = None,
        receipt_journal_override: Any = None,
        receipt_path_override: Any = None,
        session_create_override: dict[str, Any] | None = None,
    ) -> None:
        self.parent = parent_identity
        self.status = status
        self.core = core
        self.response_losses = response_losses
        self.response_extra = response_extra
        self.crossed_receipt = crossed_receipt
        self.solve_ms = solve_ms
        self.close_response_loss = close_response_loss
        self.solver_sha256 = solver_sha256
        self.protocol_version = protocol_version
        self.hook = hook
        self.producer_status = producer_status
        self.producer_blob_hash = producer_blob_hash
        self.producer_manifest_hash = producer_manifest_hash
        self.response_status_override = response_status_override
        self.receipt_status_override = receipt_status_override
        self.receipt_conflict_override = receipt_conflict_override
        self.receipt_timeout_override = receipt_timeout_override
        self.receipt_lane_override = receipt_lane_override
        self.receipt_journal_override = receipt_journal_override
        self.receipt_path_override = receipt_path_override
        self.session_create_override = session_create_override
        self.session_solves_override: Any = None
        self.receipt_count_override: Any = None
        self.calls: list[tuple[str, str, bytes | None]] = []
        self.receipts: list[dict[str, Any]] = []
        self.responses: dict[str, dict[str, Any]] = {}
        self.requests: dict[str, bytes] = {}
        self.label = ""
        self.closed = False
        self.solver_runs = 0

    def _session(self) -> dict[str, Any]:
        latest = self.receipts[-1] if self.receipts else None
        return {
            "id": SESSION_ID,
            "lane": "sat",
            "state": "closed" if self.closed else "live",
            "solver_name": "fake-cadical",
            "solver_sha256": self.solver_sha256,
            "solver_signature": "fake-cadical --threads=1 --sequential",
            "protocol_version": self.protocol_version,
            "journal_path": "/var/lib/piqd/journal.cnf",
            "created_at": 1,
            "updated_at": 2,
            "clauses": self.parent.num_clauses,
            "max_var": self.parent.max_var,
            "solves": len(self.receipts)
            if self.session_solves_override is None
            else self.session_solves_override,
            "last_status": None if latest is None else latest["status"],
            "declared_num_vars": self.parent.num_vars,
            "last_solve_index": None if latest is None else latest["solve_index"],
            "last_assumption_free": None if latest is None else False,
            "last_terminal_unsat": (
                latest.get("core") == []
                if latest and latest["status"] == "UNSAT"
                else None
            ),
            "label": self.label,
        }

    def _commit_solve(self, body: bytes, request: dict[str, Any]) -> dict[str, Any]:
        request_id = request["request_id"]
        if request_id in self.responses:
            assert self.requests[request_id] == body
            return {**self.responses[request_id], "replayed": True}
        self.requests[request_id] = body
        self.solver_runs += 1
        model: list[int] | None = [1, 2, 3] if self.status == "SAT" else None
        core = self.core if self.status == "UNSAT" else None
        interrupted = "conflict_limit" if self.status == "UNKNOWN" else None
        result_hash = campaign._result_digest(self.status, interrupted, core, model)
        request_hash = campaign._solve_request_digest(
            base_clauses=self.parent.num_clauses,
            base_bytes=self.parent.journal_bytes,
            base_sha256=self.parent.journal_sha256,
            assumptions=request["assumptions"],
            conflict_limit=request["conflict_limit"],
            timeout_ms=request.get("timeout_ms"),
        )
        receipt: dict[str, Any] = {
            "solve_index": len(self.receipts) + 1,
            "base_clauses": self.parent.num_clauses,
            "base_bytes": self.parent.journal_bytes,
            "base_sha256": self.parent.journal_sha256,
            "assumptions": request["assumptions"],
            "status": self.status
            if self.receipt_status_override is None
            else self.receipt_status_override,
            "model_recorded": self.status == "SAT",
            "result_sha256": result_hash,
            "at": 3,
            "conflict_limit": request["conflict_limit"]
            if self.receipt_conflict_override is None
            else self.receipt_conflict_override,
            "request_id": "dddddddd-dddd-4ddd-8ddd-dddddddddddd"
            if self.crossed_receipt
            else request_id,
            "request_sha256": request_hash,
        }
        if "timeout_ms" in request:
            receipt["timeout_ms"] = (
                request["timeout_ms"]
                if self.receipt_timeout_override is None
                else self.receipt_timeout_override
            )
        if core is not None:
            receipt["core"] = core
        if interrupted is not None:
            receipt["interrupted_by"] = interrupted
        self.receipts.append(receipt)
        response: dict[str, Any] = {
            "status": self.status
            if self.response_status_override is None
            else self.response_status_override,
            "solve_ms": self.solve_ms,
            "solve_index": len(self.receipts),
            "result_sha256": result_hash,
            "replayed": False,
        }
        if model is not None:
            response["model"] = model
        if core is not None:
            response["core"] = core
            response["terminal_unsat"] = not core
        if interrupted is not None:
            response["interrupted_by"] = interrupted
        if self.response_extra:
            response["foreign"] = True
        self.responses[request_id] = response
        return response

    def __call__(
        self, method: str, url: str, body: bytes | None, _headers: dict[str, str]
    ) -> campaign.HttpResponse:
        path = url.removeprefix("http://fake")
        self.calls.append((method, path, body))
        if self.hook is not None:
            self.hook(method, path)
        if method == "POST" and path == "/sessions":
            request = json.loads(body or b"null")
            assert request["seed_blob_hash"] == self.parent.sha256
            assert request["solver"] == "fake-cadical"
            self.label = request["label"]
            session = self._session()
            if self.session_create_override is not None:
                session.update(self.session_create_override)
            return _response(201, session)
        if method == "GET" and path == f"/jobs/{JOB_ID}":
            return _response(
                200,
                {
                    "id": JOB_ID,
                    "status": self.producer_status,
                    "cnf_blob_hash": self.parent.sha256
                    if self.producer_blob_hash is None
                    else self.producer_blob_hash,
                    "producer_manifest_hash": self.producer_manifest_hash,
                },
            )
        if method == "GET" and path == f"/sessions/{SESSION_ID}":
            return _response(200, self._session())
        if method == "POST" and path == f"/sessions/{SESSION_ID}/solve":
            assert body is not None
            request = json.loads(body)
            response = self._commit_solve(body, request)
            if self.response_losses:
                self.response_losses -= 1
                raise OSError("response lost after committed solve")
            return _response(200, response)
        if method == "GET" and path == f"/sessions/{SESSION_ID}/receipts":
            return _response(
                200,
                {
                    "session_id": SESSION_ID,
                    "lane": "sat"
                    if self.receipt_lane_override is None
                    else self.receipt_lane_override,
                    "journal_path": "/var/lib/piqd/journal.cnf"
                    if self.receipt_journal_override is None
                    else self.receipt_journal_override,
                    "receipts_path": "/var/lib/piqd/receipts.jsonl"
                    if self.receipt_path_override is None
                    else self.receipt_path_override,
                    "count": len(self.receipts)
                    if self.receipt_count_override is None
                    else self.receipt_count_override,
                    "receipts": self.receipts,
                },
            )
        if method == "DELETE" and path == f"/sessions/{SESSION_ID}":
            self.closed = True
            if self.close_response_loss:
                self.close_response_loss = False
                raise OSError("close response lost after commit")
            return _response(200, self._session())
        raise AssertionError((method, path))


def make_spec(path: Path, **changes: Any) -> campaign.AssumptionCampaignSpec:
    identity = campaign.stream_parent_identity(path)
    values: dict[str, Any] = {
        "parent_cnf_path": path,
        "parent_sha256": identity.sha256,
        "parent_num_bytes": identity.num_bytes,
        "parent_num_vars": identity.num_vars,
        "parent_num_clauses": identity.num_clauses,
        "producer_job_id": JOB_ID,
        "producer_job_status": "completed",
        "producer_manifest_sha256": MANIFEST_SHA,
        "solver_name": "fake-cadical",
        "solver_sha256": SOLVER_SHA,
        "solver_signature": "fake-cadical --threads=1 --sequential",
        "protocol_version": 7,
        "conflict_limit": 3000,
    }
    values.update(changes)
    return campaign.AssumptionCampaignSpec(**values)


def make_session(
    path: Path, *, fake_changes: dict[str, Any] | None = None, **spec_changes: Any
) -> tuple[campaign.AssumptionCampaignSession, FakePiqd, list[str]]:
    identity = campaign.stream_parent_identity(path)
    fake = FakePiqd(identity, **(fake_changes or {}))
    exports: list[str] = []

    def export_digest(url: str) -> campaign.CnfStreamIdentity:
        exports.append(url)
        return campaign.stream_parent_identity(path)

    session = campaign.AssumptionCampaignSession(
        "http://fake",
        make_spec(path, **spec_changes),
        transport=fake,
        export_digest=export_digest,
        job_blob_digest=export_digest,
    )
    return session, fake, exports


@pytest.fixture
def parent_path(tmp_path: Path) -> Path:
    path = tmp_path / "parent.cnf"
    path.write_bytes(PARENT)
    return path


def test_streamed_parent_identity_and_session_retain_no_parent_bytes(
    parent_path: Path,
) -> None:
    session, _fake, exports = make_session(parent_path)
    identity = session.parent_identity
    assert identity.sha256 == hashlib.sha256(PARENT).hexdigest()
    assert (identity.num_vars, identity.num_clauses, identity.journal_bytes) == (
        3,
        3,
        len(b"1 2 0\n-1 3 0\n2 -3 0\n"),
    )
    assert exports == [
        f"http://fake/jobs/{JOB_ID}/blobs/{identity.sha256}",
        f"http://fake/sessions/{SESSION_ID}/cnf",
    ]
    assert all(not isinstance(value, bytes) for value in vars(session).values())
    assert all(not isinstance(value, bytes) for value in vars(session.spec).values())


def test_sat_is_total_and_stream_replayed_without_default_timeout(
    parent_path: Path,
) -> None:
    session, fake, _exports = make_session(parent_path)
    result = session.solve(
        campaign.AssumptionCell("next-center-13", (1, 3)), request_id=REQUEST_ID
    )
    assert result.status == "SAT"
    assert result.assignment == (1, 2, 3)
    assert result.discovery_scope == "sat-witness-replayed"
    assert result.source_replayed
    assert not result.proof_verified and not result.closure_claim
    solve_body = next(
        body
        for method, path, body in fake.calls
        if method == "POST" and path.endswith("/solve")
    )
    assert json.loads(solve_body or b"null") == {
        "assumptions": [1, 3],
        "conflict_limit": 3000,
        "include_model": True,
        "request_id": REQUEST_ID,
    }
    assert result.request_sha256 == result.receipt.request_sha256
    session.close()
    assert fake.closed


@pytest.mark.parametrize(
    ("core", "scope"),
    [([1], "cell-discovery-only"), ([], "terminal-discovery-only")],
)
def test_unsat_core_scope_is_discovery_only(
    parent_path: Path, core: list[int], scope: str
) -> None:
    session, _fake, _exports = make_session(
        parent_path, fake_changes={"status": "UNSAT", "core": core}
    )
    result = session.solve(
        campaign.AssumptionCell("cell-1", (1, 3)), request_id=REQUEST_ID
    )
    assert result.core == tuple(core)
    assert result.discovery_scope == scope
    assert not result.proof_verified and not result.closure_claim


def test_unknown_is_inconclusive(parent_path: Path) -> None:
    session, _fake, _exports = make_session(
        parent_path, fake_changes={"status": "UNKNOWN"}
    )
    result = session.solve(
        campaign.AssumptionCell("cell-u", (1,)), request_id=REQUEST_ID
    )
    assert result.status == "UNKNOWN"
    assert result.discovery_scope == "inconclusive"
    assert result.assignment == () and result.core is None


def test_response_loss_retries_identical_request_once(parent_path: Path) -> None:
    session, fake, _exports = make_session(
        parent_path, fake_changes={"response_losses": 1}
    )
    result = session.solve(
        campaign.AssumptionCell("cell-r", (1,)), request_id=REQUEST_ID
    )
    bodies = [
        body
        for method, path, body in fake.calls
        if method == "POST" and path.endswith("/solve")
    ]
    assert len(bodies) == 2 and bodies[0] == bodies[1]
    assert fake.solver_runs == 1
    assert result.replayed is True


def test_adopt_existing_live_session_from_contiguous_receipts(
    parent_path: Path,
) -> None:
    session, fake, _exports = make_session(parent_path)
    first = session.solve(
        campaign.AssumptionCell("cell-adopted", (1,)), request_id=REQUEST_ID
    )
    calls_before_adoption = len(fake.calls)
    adopted = campaign.AssumptionCampaignSession(
        "http://fake",
        make_spec(parent_path),
        transport=fake,
        export_digest=lambda _url: campaign.stream_parent_identity(parent_path),
        job_blob_digest=lambda _url: campaign.stream_parent_identity(parent_path),
        existing_session_id=first.session_id,
    )
    assert adopted.session_id == session.session_id
    assert not any(
        method == "POST" and path == "/sessions"
        for method, path, _body in fake.calls[calls_before_adoption:]
    )
    with pytest.raises(campaign.AssumptionCampaignError, match="assumptions"):
        adopted.solve(
            campaign.AssumptionCell("same-assumptions", (1,)),
            request_id="bbbbbbbb-bbbb-4bbb-8bbb-bbbbbbbbbbbb",
        )
    continued = adopted.solve(
        campaign.AssumptionCell("cell-after-adoption", (2,)),
        request_id="bbbbbbbb-bbbb-4bbb-8bbb-bbbbbbbbbbbb",
    )
    assert continued.solve_index == 2


def test_adoption_rejects_crossed_receipt_frontier(parent_path: Path) -> None:
    session, fake, _exports = make_session(parent_path)
    session.solve(campaign.AssumptionCell("cell-adopted", (1,)), request_id=REQUEST_ID)
    fake.receipts[0]["base_sha256"] = "d" * 64
    with pytest.raises(campaign.AssumptionCampaignError, match="source-bound"):
        campaign.AssumptionCampaignSession(
            "http://fake",
            make_spec(parent_path),
            transport=fake,
            export_digest=lambda _url: campaign.stream_parent_identity(parent_path),
            job_blob_digest=lambda _url: campaign.stream_parent_identity(parent_path),
            existing_session_id=session.session_id,
        )


def test_adoption_failure_does_not_close_existing_session(parent_path: Path) -> None:
    session, fake, _exports = make_session(parent_path)
    session.solve(campaign.AssumptionCell("cell-adopted", (1,)), request_id=REQUEST_ID)
    fake.receipts[0]["base_sha256"] = "d" * 64
    with pytest.raises(campaign.AssumptionCampaignError, match="source-bound"):
        campaign.AssumptionCampaignSession(
            "http://fake",
            make_spec(parent_path),
            transport=fake,
            export_digest=lambda _url: campaign.stream_parent_identity(parent_path),
            job_blob_digest=lambda _url: campaign.stream_parent_identity(parent_path),
            existing_session_id=session.session_id,
        )
    assert not fake.closed
    assert not any(method == "DELETE" for method, _path, _body in fake.calls)


def test_adoption_binds_authoritative_journal_path(parent_path: Path) -> None:
    session, fake, _exports = make_session(parent_path)
    session.solve(campaign.AssumptionCell("cell-adopted", (1,)), request_id=REQUEST_ID)
    fake.receipt_journal_override = "/crossed/journal"
    with pytest.raises(campaign.AssumptionCampaignError, match="path"):
        campaign.AssumptionCampaignSession(
            "http://fake",
            make_spec(parent_path),
            transport=fake,
            export_digest=lambda _url: campaign.stream_parent_identity(parent_path),
            job_blob_digest=lambda _url: campaign.stream_parent_identity(parent_path),
            existing_session_id=session.session_id,
        )
    assert not fake.closed
    assert not any(method == "DELETE" for method, _path, _body in fake.calls)


def test_recovery_binds_adopted_receipts_path(parent_path: Path) -> None:
    session, fake, _exports = make_session(parent_path)
    session.solve(campaign.AssumptionCell("cell-adopted", (1,)), request_id=REQUEST_ID)
    adopted = campaign.AssumptionCampaignSession(
        "http://fake",
        make_spec(parent_path),
        transport=fake,
        export_digest=lambda _url: campaign.stream_parent_identity(parent_path),
        job_blob_digest=lambda _url: campaign.stream_parent_identity(parent_path),
        existing_session_id=session.session_id,
    )
    fake.receipt_path_override = "/crossed/receipts"
    with pytest.raises(campaign.AssumptionCampaignError, match="path"):
        adopted.recover_first_cell(
            campaign.AssumptionCell("cell-adopted", (1,)), request_id=REQUEST_ID
        )
    assert not fake.closed


def test_adoption_rejects_receipts_path_outside_session_directory(
    parent_path: Path,
) -> None:
    session, fake, _exports = make_session(parent_path)
    session.solve(campaign.AssumptionCell("cell-adopted", (1,)), request_id=REQUEST_ID)
    fake.receipt_path_override = "/crossed/receipts.jsonl"
    with pytest.raises(campaign.AssumptionCampaignError, match="derived"):
        campaign.AssumptionCampaignSession(
            "http://fake",
            make_spec(parent_path),
            transport=fake,
            export_digest=lambda _url: campaign.stream_parent_identity(parent_path),
            job_blob_digest=lambda _url: campaign.stream_parent_identity(parent_path),
            existing_session_id=session.session_id,
        )
    assert not fake.closed
    assert not any(method == "DELETE" for method, _path, _body in fake.calls)


def test_recover_first_result_replays_without_second_receipt(parent_path: Path) -> None:
    session, fake, _exports = make_session(parent_path)
    first = session.solve(
        campaign.AssumptionCell("cell-adopted", (1,)), request_id=REQUEST_ID
    )
    adopted = campaign.AssumptionCampaignSession(
        "http://fake",
        make_spec(parent_path),
        transport=fake,
        export_digest=lambda _url: campaign.stream_parent_identity(parent_path),
        job_blob_digest=lambda _url: campaign.stream_parent_identity(parent_path),
        existing_session_id=first.session_id,
    )
    recovered = adopted.recover_first_result(
        campaign.AssumptionCell("cell-adopted", (1,)), request_id=REQUEST_ID
    )
    assert recovered.replayed is True
    assert recovered.solve_index == 1
    assert recovered.assignment == first.assignment
    assert len(fake.receipts) == 1
    assert fake.solver_runs == 1


def test_recover_first_result_rejects_wrong_request_or_missing_model(
    parent_path: Path,
) -> None:
    session, fake, _exports = make_session(parent_path)
    first = session.solve(
        campaign.AssumptionCell("cell-adopted", (1,)), request_id=REQUEST_ID
    )
    adopted = campaign.AssumptionCampaignSession(
        "http://fake",
        make_spec(parent_path),
        transport=fake,
        export_digest=lambda _url: campaign.stream_parent_identity(parent_path),
        job_blob_digest=lambda _url: campaign.stream_parent_identity(parent_path),
        existing_session_id=first.session_id,
    )
    with pytest.raises(campaign.AssumptionCampaignError, match="match"):
        adopted.recover_first_result(
            campaign.AssumptionCell("cell-adopted", (1,)),
            request_id="bbbbbbbb-bbbb-4bbb-8bbb-bbbbbbbbbbbb",
        )

    unknown_session, unknown_fake, _exports = make_session(
        parent_path, fake_changes={"status": "UNKNOWN"}
    )
    unknown_first = unknown_session.solve(
        campaign.AssumptionCell("cell-unknown", (1,)), request_id=REQUEST_ID
    )
    unknown_adopted = campaign.AssumptionCampaignSession(
        "http://fake",
        make_spec(parent_path),
        transport=unknown_fake,
        export_digest=lambda _url: campaign.stream_parent_identity(parent_path),
        job_blob_digest=lambda _url: campaign.stream_parent_identity(parent_path),
        existing_session_id=unknown_first.session_id,
    )
    with pytest.raises(campaign.AssumptionCampaignError, match="SAT cell"):
        unknown_adopted.recover_first_result(
            campaign.AssumptionCell("cell-unknown", (1,)), request_id=REQUEST_ID
        )


def test_recover_first_result_requires_one_receipt(parent_path: Path) -> None:
    fresh, fresh_fake, _exports = make_session(parent_path)
    fresh_adopted = campaign.AssumptionCampaignSession(
        "http://fake",
        make_spec(parent_path),
        transport=fresh_fake,
        export_digest=lambda _url: campaign.stream_parent_identity(parent_path),
        job_blob_digest=lambda _url: campaign.stream_parent_identity(parent_path),
        existing_session_id=fresh.session_id,
    )
    with pytest.raises(campaign.AssumptionCampaignError, match="exactly one adopted"):
        fresh_adopted.recover_first_result(
            campaign.AssumptionCell("cell-empty", (1,)), request_id=REQUEST_ID
        )

    first = fresh.solve(
        campaign.AssumptionCell("cell-one", (1,)), request_id=REQUEST_ID
    )
    fresh.solve(
        campaign.AssumptionCell("cell-two", (2,)),
        request_id="bbbbbbbb-bbbb-4bbb-8bbb-bbbbbbbbbbbb",
    )
    two_adopted = campaign.AssumptionCampaignSession(
        "http://fake",
        make_spec(parent_path),
        transport=fresh_fake,
        export_digest=lambda _url: campaign.stream_parent_identity(parent_path),
        job_blob_digest=lambda _url: campaign.stream_parent_identity(parent_path),
        existing_session_id=first.session_id,
    )
    with pytest.raises(campaign.AssumptionCampaignError, match="exactly one adopted"):
        two_adopted.recover_first_result(
            campaign.AssumptionCell("cell-one", (1,)), request_id=REQUEST_ID
        )


def test_campaign_http_timeout_is_explicit_and_solver_aware(parent_path: Path) -> None:
    spec = make_spec(parent_path, timeout_ms=400_000)
    assert campaign._campaign_http_timeout_seconds(spec, None) == 430.0
    assert campaign._campaign_http_timeout_seconds(spec, 17.5) == 17.5
    with pytest.raises(campaign.AssumptionCampaignError, match="http_timeout_seconds"):
        campaign._campaign_http_timeout_seconds(spec, 0)


def test_two_response_losses_recover_publicly_on_exact_third_attempt(
    parent_path: Path,
) -> None:
    session, fake, _exports = make_session(
        parent_path, fake_changes={"response_losses": 2}
    )
    with pytest.raises(OSError, match="response lost"):
        session.solve(campaign.AssumptionCell("cell-p", (1,)), request_id=REQUEST_ID)
    assert session.pending_request_id == REQUEST_ID
    with pytest.raises(campaign.AssumptionCampaignError, match="cannot close"):
        session.close()
    assert not fake.closed
    with pytest.raises(campaign.AssumptionCampaignError, match="retry_pending"):
        session.solve(
            campaign.AssumptionCell("different-cell", (2,)),
            request_id="bbbbbbbb-bbbb-4bbb-8bbb-bbbbbbbbbbbb",
        )
    recovered = session.retry_pending()
    assert recovered.cell_id == "cell-p" and recovered.replayed
    bodies = [
        body
        for method, path, body in fake.calls
        if method == "POST" and path.endswith("/solve")
    ]
    assert len(bodies) == 3 and bodies[0] == bodies[1] == bodies[2]
    assert fake.solver_runs == 1
    continued = session.solve(
        campaign.AssumptionCell("continued-cell", (2,)),
        request_id="bbbbbbbb-bbbb-4bbb-8bbb-bbbbbbbbbbbb",
    )
    assert continued.solve_index == 2
    session.close()
    assert fake.closed


def test_close_loss_reconciles_without_second_delete(parent_path: Path) -> None:
    session, fake, _exports = make_session(
        parent_path, fake_changes={"close_response_loss": True}
    )
    with pytest.raises(OSError, match="close response lost"):
        session.close()
    session.close()
    session.close()
    deletes = [
        call for call in fake.calls if call[:2] == ("DELETE", f"/sessions/{SESSION_ID}")
    ]
    assert len(deletes) == 1
    assert fake.closed


@pytest.mark.parametrize(
    "fake_changes",
    [
        {"response_extra": True},
        {"crossed_receipt": True},
        {"solve_ms": True},
    ],
)
def test_schema_and_crossed_receipt_fail_closed(
    parent_path: Path, fake_changes: dict[str, Any]
) -> None:
    session, _fake, _exports = make_session(parent_path, fake_changes=fake_changes)
    with pytest.raises(campaign.AssumptionCampaignError):
        session.solve(campaign.AssumptionCell("cell-x", (1,)), request_id=REQUEST_ID)
    assert session.pending_request_id == REQUEST_ID


@pytest.mark.parametrize(
    "fake_changes",
    [{"solver_sha256": "d" * 64}, {"protocol_version": 8}],
)
def test_solver_and_protocol_crossing_rejected(
    parent_path: Path, fake_changes: dict[str, Any]
) -> None:
    with pytest.raises(campaign.AssumptionCampaignError, match="descriptor-bound"):
        make_session(parent_path, fake_changes=fake_changes)


def test_export_digest_crossing_rejected(parent_path: Path, tmp_path: Path) -> None:
    other = tmp_path / "other.cnf"
    other.write_bytes(b"p cnf 3 3\n1 0\n2 0\n3 0\n")
    identity = campaign.stream_parent_identity(parent_path)
    fake = FakePiqd(identity)
    with pytest.raises(campaign.AssumptionCampaignError, match="export"):
        campaign.AssumptionCampaignSession(
            "http://fake",
            make_spec(parent_path),
            transport=fake,
            export_digest=lambda _url: campaign.stream_parent_identity(other),
            job_blob_digest=lambda _url: campaign.stream_parent_identity(parent_path),
        )
    deletes = [
        call for call in fake.calls if call[:2] == ("DELETE", f"/sessions/{SESSION_ID}")
    ]
    assert len(deletes) == 1 and fake.closed


def test_default_export_digest_uses_exact_bounded_timeout(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    calls: list[tuple[Any, float]] = []

    class Response:
        status = 200

        def __init__(self) -> None:
            self.sent = False

        def __enter__(self) -> Self:
            return self

        def __exit__(self, *_args: object) -> None:
            return None

        def read(self, size: int) -> bytes:
            assert size == 1024 * 1024
            if self.sent:
                return b""
            self.sent = True
            return PARENT

    def urlopen(request: Any, *, timeout: float) -> Response:
        calls.append((request, timeout))
        return Response()

    monkeypatch.setattr(campaign.urllib.request, "urlopen", urlopen)
    identity = campaign._default_export_digest("http://fake/export")

    assert identity.num_bytes == len(PARENT)
    assert len(calls) == 1
    request, timeout = calls[0]
    assert request.get_method() == "GET"
    assert timeout == campaign.DEFAULT_ASSUMPTION_HTTP_TIMEOUT_SECONDS


def test_constructor_closes_once_after_create_validation_failure(
    parent_path: Path,
) -> None:
    identity = campaign.stream_parent_identity(parent_path)
    fake = FakePiqd(identity, session_create_override={"label": "crossed"})

    with pytest.raises(campaign.AssumptionCampaignError, match="descriptor-bound"):
        campaign.AssumptionCampaignSession(
            "http://fake",
            make_spec(parent_path),
            transport=fake,
            export_digest=lambda _url: identity,
            job_blob_digest=lambda _url: identity,
        )

    deletes = [
        call for call in fake.calls if call[:2] == ("DELETE", f"/sessions/{SESSION_ID}")
    ]
    assert len(deletes) == 1 and fake.closed


def test_constructor_closes_once_after_keyboard_interrupt_during_export(
    parent_path: Path,
) -> None:
    identity = campaign.stream_parent_identity(parent_path)
    fake = FakePiqd(identity)

    def interrupt(_url: str) -> campaign.CnfStreamIdentity:
        raise KeyboardInterrupt()

    with pytest.raises(KeyboardInterrupt):
        campaign.AssumptionCampaignSession(
            "http://fake",
            make_spec(parent_path),
            transport=fake,
            export_digest=interrupt,
            job_blob_digest=lambda _url: identity,
        )

    deletes = [
        call for call in fake.calls if call[:2] == ("DELETE", f"/sessions/{SESSION_ID}")
    ]
    assert len(deletes) == 1 and fake.closed


def test_constructor_preserves_primary_when_cleanup_fails(
    parent_path: Path,
) -> None:
    identity = campaign.stream_parent_identity(parent_path)
    fake = FakePiqd(identity, close_response_loss=True)

    def fail_export(_url: str) -> campaign.CnfStreamIdentity:
        raise ValueError("primary export failure")

    with pytest.raises(ValueError, match="primary export failure") as caught:
        campaign.AssumptionCampaignSession(
            "http://fake",
            make_spec(parent_path),
            transport=fake,
            export_digest=fail_export,
            job_blob_digest=lambda _url: identity,
        )

    assert any("session cleanup failed" in note for note in caught.value.__notes__)
    deletes = [
        call for call in fake.calls if call[:2] == ("DELETE", f"/sessions/{SESSION_ID}")
    ]
    assert len(deletes) == 1 and fake.closed


def test_constructor_precreate_failure_does_not_close(parent_path: Path) -> None:
    identity = campaign.stream_parent_identity(parent_path)
    fake = FakePiqd(identity, producer_status="crossed")

    with pytest.raises(campaign.AssumptionCampaignError, match="producer job"):
        campaign.AssumptionCampaignSession(
            "http://fake",
            make_spec(parent_path),
            transport=fake,
            export_digest=lambda _url: identity,
            job_blob_digest=lambda _url: identity,
        )

    assert not any(
        method == "POST" and path == "/sessions" for method, path, _ in fake.calls
    )
    assert not any(method == "DELETE" for method, _path, _body in fake.calls)


def test_source_mutation_and_append_refuse(parent_path: Path) -> None:
    session, fake, _exports = make_session(parent_path)
    with pytest.raises(campaign.AssumptionCampaignError, match="refuse append"):
        session.append_clauses(((1,),))
    parent_path.write_bytes(PARENT.replace(b"1 2 0", b"1 -2 0"))
    with pytest.raises(
        campaign.AssumptionCampaignError,
        match="reviewed identity|streamed parent replay",
    ):
        session.solve(campaign.AssumptionCell("cell-m", (1,)), request_id=REQUEST_ID)
    assert not any(path.endswith("/solve") for _method, path, _body in fake.calls)


def test_noncanonical_cell_and_reviewed_counts_rejected(parent_path: Path) -> None:
    with pytest.raises(campaign.AssumptionCampaignError, match="reviewed identity"):
        campaign.AssumptionCampaignSession(
            "http://fake",
            make_spec(parent_path, parent_num_clauses=4),
            transport=FakePiqd(campaign.stream_parent_identity(parent_path)),
            export_digest=lambda _url: campaign.stream_parent_identity(parent_path),
            job_blob_digest=lambda _url: campaign.stream_parent_identity(parent_path),
        )
    session, _fake, _exports = make_session(parent_path)
    with pytest.raises(campaign.AssumptionCampaignError, match="canonical"):
        session.solve(campaign.AssumptionCell("cell-n", (3, 1)), request_id=REQUEST_ID)


def test_unique_regular_and_exact_native_path_required(
    parent_path: Path, tmp_path: Path
) -> None:
    hardlink = tmp_path / "hardlink.cnf"
    hardlink.hardlink_to(parent_path)
    with pytest.raises(campaign.AssumptionCampaignError, match="unique regular"):
        campaign.stream_parent_identity(parent_path)
    with pytest.raises(campaign.AssumptionCampaignError, match="native absolute"):
        campaign.stream_parent_identity(Path("relative.cnf"))


def test_multiline_clauses_and_comments_have_canonical_journal_parity(
    tmp_path: Path,
) -> None:
    multiline = (
        b"c first\np cnf 3 3\n1\nc inside a clause\n2 0\n-1 3\n0\nc between\n2 -3 0\n"
    )
    path = tmp_path / "multiline.cnf"
    path.write_bytes(multiline)
    identity = campaign.stream_parent_identity(path)
    canonical = b"1 2 0\n-1 3 0\n2 -3 0\n"
    assert identity.journal_sha256 == hashlib.sha256(canonical).hexdigest()
    assert identity.journal_bytes == len(canonical)
    campaign.stream_parent_identity(path, assignment=(1, 2, 3))


@pytest.mark.parametrize(
    ("cnf", "message"),
    [
        (b"p cnf 2147483648 1\n1 0\n", "Rust i32"),
        (
            f"p cnf {campaign.MAX_PARENT_VARIABLES + 1} 1\n1 0\n".encode(),
            "campaign ceiling",
        ),
        (b"p cnf 3 1\n-2147483648 0\n", "safe Rust i32"),
        (b"p cnf 3 1\n2147483648 0\n", "safe Rust i32"),
    ],
)
def test_i32_and_allocation_bounds_fail_before_large_allocation(
    tmp_path: Path, cnf: bytes, message: str
) -> None:
    path = tmp_path / "edge.cnf"
    path.write_bytes(cnf)
    with pytest.raises(campaign.AssumptionCampaignError, match=message):
        campaign.stream_parent_identity(path)


def test_strict_builtin_envelope_types_and_malformed_arrays(
    parent_path: Path,
) -> None:
    session, fake, _exports = make_session(parent_path)
    fake.session_solves_override = True
    with pytest.raises(campaign.AssumptionCampaignError, match="builtin integer"):
        session.solve(
            campaign.AssumptionCell("strict-session", (1,)), request_id=REQUEST_ID
        )

    session2, fake2, _exports = make_session(parent_path)
    fake2.receipt_count_override = True
    with pytest.raises(campaign.AssumptionCampaignError, match="builtin integer"):
        session2.solve(
            campaign.AssumptionCell("strict-count", (1,)), request_id=REQUEST_ID
        )

    fake3: FakePiqd

    def corrupt_receipt(method: str, path: str) -> None:
        if method == "GET" and path.endswith("/receipts") and fake3.receipts:
            fake3.receipts[-1]["assumptions"] = {"not": "an array"}

    session3, fake3, _exports = make_session(
        parent_path, fake_changes={"hook": corrupt_receipt}
    )
    with pytest.raises(campaign.AssumptionCampaignError, match="builtin list"):
        session3.solve(
            campaign.AssumptionCell("strict-array", (1,)), request_id=REQUEST_ID
        )


@pytest.mark.parametrize(
    ("fake_changes", "spec_changes", "message"),
    [
        ({"response_status_override": True}, {}, "builtin string"),
        ({"receipt_status_override": True}, {}, "builtin string"),
        ({"receipt_conflict_override": True}, {}, "builtin integer"),
        ({"receipt_lane_override": True}, {}, "builtin string"),
        (
            {"receipt_timeout_override": True},
            {"timeout_ms": 20},
            "builtin integer",
        ),
    ],
)
def test_status_lane_limit_and_timeout_types_are_strict(
    parent_path: Path,
    fake_changes: dict[str, Any],
    spec_changes: dict[str, Any],
    message: str,
) -> None:
    session, _fake, _exports = make_session(
        parent_path, fake_changes=fake_changes, **spec_changes
    )
    with pytest.raises(campaign.AssumptionCampaignError, match=message):
        session.solve(
            campaign.AssumptionCell("strict-fields", (1,)), request_id=REQUEST_ID
        )


@pytest.mark.parametrize("mutation_point", ["solve", "receipts"])
def test_source_mutation_during_or_after_solve_fails_closed(
    parent_path: Path, mutation_point: str
) -> None:
    fired = False

    def mutate(method: str, path: str) -> None:
        nonlocal fired
        if not fired and (
            (mutation_point == "solve" and method == "POST" and path.endswith("/solve"))
            or (mutation_point == "receipts" and path.endswith("/receipts"))
        ):
            fired = True
            parent_path.write_bytes(PARENT.replace(b"2 -3 0", b"-2 -3 0"))

    session, _fake, _exports = make_session(parent_path, fake_changes={"hook": mutate})
    with pytest.raises(
        campaign.AssumptionCampaignError,
        match="reviewed identity|streamed parent replay",
    ):
        session.solve(campaign.AssumptionCell("mutating", (1,)), request_id=REQUEST_ID)
    assert session.pending_request_id == REQUEST_ID


def test_byte_identical_file_and_ancestor_replacement_break_path_custody(
    tmp_path: Path,
) -> None:
    source_dir = tmp_path / "source"
    source_dir.mkdir()
    parent = source_dir / "parent.cnf"
    parent.write_bytes(PARENT)
    session, _fake, _exports = make_session(parent)
    replacement = source_dir / "replacement.cnf"
    replacement.write_bytes(PARENT)
    os.replace(replacement, parent)
    with pytest.raises(campaign.AssumptionCampaignError, match="pathname/inode"):
        session.solve(
            campaign.AssumptionCell("inode-swap", (1,)), request_id=REQUEST_ID
        )

    second_dir = tmp_path / "second-source"
    second_dir.mkdir()
    second_parent = second_dir / "parent.cnf"
    second_parent.write_bytes(PARENT)
    session2, _fake2, _exports = make_session(second_parent)
    old_dir = tmp_path / "old-source"
    os.replace(second_dir, old_dir)
    second_dir.mkdir()
    (second_dir / "parent.cnf").write_bytes(PARENT)
    with pytest.raises(campaign.AssumptionCampaignError, match="pathname/inode"):
        session2.solve(
            campaign.AssumptionCell("ancestor-swap", (1,)), request_id=REQUEST_ID
        )


def test_producer_job_and_blob_are_authenticated_before_session(
    parent_path: Path,
) -> None:
    identity = campaign.stream_parent_identity(parent_path)
    fake = FakePiqd(identity)
    with pytest.raises(campaign.AssumptionCampaignError, match="producer blob"):
        campaign.AssumptionCampaignSession(
            "http://fake",
            make_spec(parent_path),
            transport=fake,
            export_digest=lambda _url: identity,
            job_blob_digest=lambda _url: campaign.CnfStreamIdentity(
                "d" * 64,
                identity.num_bytes,
                identity.num_vars,
                identity.num_clauses,
                identity.max_var,
                identity.journal_sha256,
                identity.journal_bytes,
                identity.all_variables_used,
            ),
        )
    assert not any(path == "/sessions" for _method, path, _body in fake.calls)


@pytest.mark.parametrize(
    "fake_changes",
    [
        {"producer_status": True},
        {"producer_status": "running"},
        {"producer_blob_hash": "e" * 64},
        {"producer_manifest_hash": "f" * 64},
    ],
)
def test_producer_status_fields_are_strict_and_cross_bound(
    parent_path: Path, fake_changes: dict[str, Any]
) -> None:
    identity = campaign.stream_parent_identity(parent_path)
    fake = FakePiqd(identity, **fake_changes)
    with pytest.raises(campaign.AssumptionCampaignError):
        campaign.AssumptionCampaignSession(
            "http://fake",
            make_spec(parent_path),
            transport=fake,
            export_digest=lambda _url: identity,
            job_blob_digest=lambda _url: identity,
        )
    assert not any(path == "/sessions" for _method, path, _body in fake.calls)

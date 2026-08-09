"""Run a receipt-authenticated P97 inclusion-minimality campaign over HTTP.

Every adaptive round owns a fresh PIQD SAT session.  A round is interpreted
only after that session is closed and its complete receipts plus a rooted,
stable journal snapshot have been authenticated.  The audit documents emitted
here remain observational; only the minimality interpreter's result document
may carry the bank-relative inclusion-minimality claim.
"""

from __future__ import annotations

import uuid
from collections.abc import Mapping
from dataclasses import dataclass
from enum import StrEnum
from pathlib import Path
from types import MappingProxyType
from typing import Any

from census.p97_search import phase3_piqd_statement_bank as statement_bank
from census.p97_search import phase3_piqd_statement_bank_minimality as minimality
from census.p97_search import (
    phase3_piqd_statement_bank_round_receipts as round_receipts,
)
from census.p97_search import phase3_piqd_statement_bank_runner as session_runner

CAMPAIGN_SCHEMA = "p97-piqd-statement-bank-minimality-runner/v1"
ROUND_AUDIT_SCHEMA = "p97-piqd-statement-bank-minimality-runner-round/v1"
OBSERVATIONAL_STATUS = "OBSERVATIONAL_ONLY"
_MAX_BATCH_QUERIES = 4096
_I32_MAX = 2**31 - 1


class StatementBankMinimalityRunnerError(statement_bank.StatementBankError):
    """The campaign exchange, custody chain, or adaptive state failed closed."""


class CampaignOutcome(StrEnum):
    """Control-flow outcome; the audit itself makes no minimality claim."""

    INCLUSION_MINIMAL = minimality.INCLUSION_MINIMAL
    INCONCLUSIVE = minimality.INCONCLUSIVE


@dataclass(frozen=True)
class MinimalityRoundEvidence:
    """Typed, closed-session evidence and interpretation for one round."""

    round_plan: minimality.MinimalityRoundPlan
    session_id: str
    batch_key: str
    receipt_evidence: round_receipts.AuthenticatedRoundReceiptResult
    minimality_result: minimality.MinimalityRoundResult | None
    audit: Mapping[str, Any]


@dataclass(frozen=True)
class MinimalityCampaignResult:
    """A terminal adaptive campaign and its observational custody chain."""

    outcome: CampaignOutcome
    rounds: tuple[MinimalityRoundEvidence, ...]
    terminal_result: minimality.MinimalityRoundResult | None
    audit: Mapping[str, Any]


def _fail(message: str) -> None:
    raise StatementBankMinimalityRunnerError(message)


def _exact_int(value: object, *, where: str, minimum: int, maximum: int) -> int:
    if type(value) is not int or not minimum <= value <= maximum:
        _fail(f"{where} must be an integer in {minimum}..{maximum}")
    return value


def _deep_freeze(value: Any) -> Any:
    """Recursively freeze runner-owned audit containers after canonical hashing."""

    if type(value) is dict:
        return MappingProxyType(
            {key: _deep_freeze(item) for key, item in value.items()}
        )
    if type(value) in {list, tuple}:
        return tuple(_deep_freeze(item) for item in value)
    return value


def _request(
    transport: session_runner.JsonHttpTransport,
    method: str,
    path: str,
    *,
    expected_status: int,
    body: Mapping[str, object] | None = None,
) -> object:
    response = transport.request(method, path, body)
    if type(response) is not session_runner.JsonHttpResponse:
        _fail("HTTP transport returned a non-exact JsonHttpResponse")
    if type(response.status) is not int or response.status != expected_status:
        _fail(
            f"{method} {path} returned HTTP {response.status}, "
            f"expected {expected_status}"
        )
    return response.body


def _create_session(
    transport: session_runner.JsonHttpTransport,
    *,
    solver_name: str,
    label: str,
    piqd_data_root: str,
) -> tuple[str, dict[str, Any]]:
    """Create a session while exposing a strict candidate UUID for cleanup."""

    response = transport.request(
        "POST",
        "/sessions",
        {"label": label, "lane": "sat", "solver": solver_name},
    )
    candidate: str | None = None
    if (
        isinstance(response, session_runner.JsonHttpResponse)
        and isinstance(response.status, int)
        and response.status == 201
    ):
        try:
            candidate = session_runner._extract_create_candidate_session_id(
                response.body
            )
        except session_runner.StatementBankRunnerError:
            candidate = None
    try:
        if type(response) is not session_runner.JsonHttpResponse:
            _fail("HTTP transport returned a non-exact JsonHttpResponse")
        if type(response.status) is not int or response.status != 201:
            _fail(f"POST /sessions returned HTTP {response.status}, expected 201")
        session_id = session_runner._extract_create_candidate_session_id(response.body)
        created = session_runner._validate_session(
            response.body,
            expected_id=session_id,
            expected_state="live",
            expected_solver=solver_name,
            expected_label=label,
            expected_clauses=0,
            expected_max_var=0,
            expected_solves=0,
            expected_last_status=None,
            piqd_data_root=piqd_data_root,
        )
    except Exception:
        if candidate is not None:
            try:
                transport.request("DELETE", f"/sessions/{candidate}")
            except Exception as cleanup_error:  # noqa: BLE001
                _ = cleanup_error
        raise
    return session_id, created


def _batch_key(
    plan: statement_bank.SelectorPlan,
    round_plan: minimality.MinimalityRoundPlan,
) -> str:
    name = f"{CAMPAIGN_SCHEMA}:{plan.plan_sha256}:{round_plan.round_sha256}"
    return str(uuid.uuid5(uuid.NAMESPACE_URL, name))


def _batch_body(
    round_plan: minimality.MinimalityRoundPlan,
    *,
    batch_key: str,
    conflict_limit: int,
) -> dict[str, object]:
    queries = round_plan.document["queries"]
    ordered = [queries["baseline"], *queries["leave_one_group_out"]]
    if not 1 <= len(ordered) <= _MAX_BATCH_QUERIES:
        _fail(f"minimality round must contain 1..{_MAX_BATCH_QUERIES} queries")
    request_queries: list[dict[str, object]] = []
    for index, query in enumerate(ordered):
        assumptions = query["assumptions"]
        canonical = session_runner._canonical_literals(
            assumptions, where=f"round query {index} assumptions"
        )
        if list(canonical) != assumptions:
            _fail(f"round query {index} assumptions are not canonical")
        request_queries.append(
            {"assumptions": assumptions, "conflict_limit": conflict_limit}
        )
    return {
        "batch_key": batch_key,
        "continue_after_first_only_if": "UNSAT",
        "queries": request_queries,
    }


def _validate_receipt_paths(
    value: object,
    *,
    session_id: str,
    journal_path: str,
    expected_count: int,
    piqd_data_root: str,
) -> dict[str, Any]:
    if type(value) is not dict:
        _fail("receipts response must be an exact object")
    expected_keys = {
        "count",
        "journal_path",
        "receipts",
        "receipts_path",
        "session_id",
    }
    if set(value) != expected_keys:
        _fail("receipts response has noncanonical top-level keys")
    if (
        session_runner._uuid(value["session_id"], where="receipts.session_id")
        != session_id
    ):
        _fail("receipts response changed session id")
    returned_journal = session_runner._canonical_absolute_path(
        value["journal_path"], where="receipts.journal_path"
    )
    if returned_journal != journal_path:
        _fail("receipts response changed journal_path")
    receipts_path = session_runner._canonical_absolute_path(
        value["receipts_path"], where="receipts.receipts_path"
    )
    session_runner._relative_below_root(
        receipts_path, piqd_data_root, where="receipts.receipts_path"
    )
    if (
        Path(receipts_path).parent != Path(journal_path).parent
        or Path(receipts_path).name != "receipts.jsonl"
    ):
        _fail("receipts_path is not the session receipts.jsonl sibling")
    if (
        _exact_int(
            value["count"],
            where="receipts.count",
            minimum=0,
            maximum=2**64 - 1,
        )
        != expected_count
        or type(value["receipts"]) is not list
        or len(value["receipts"]) != expected_count
    ):
        _fail("fresh-session receipts do not exactly exhaust the batch records")
    return value


def _round_audit(
    *,
    plan: statement_bank.SelectorPlan,
    round_plan: minimality.MinimalityRoundPlan,
    session_id: str,
    batch_key: str,
    receipt_evidence: round_receipts.AuthenticatedRoundReceiptResult,
    result: minimality.MinimalityRoundResult | None,
    previous_round_audit_sha256: str | None,
) -> Mapping[str, Any]:
    body: dict[str, Any] = {
        "adapter_sha256": receipt_evidence.audit["adapter_sha256"],
        "batch_key": batch_key,
        "claims": {
            "cardinality_minimum": False,
            "daemon_attestation": False,
            "global_minimum": False,
            "inclusion_minimal_relative_to_supplied_bank": False,
            "solver_attestation": False,
            "source_entitlement": False,
            "theorem_closure": False,
        },
        "has_minimality_result": result is not None,
        "minimality_result_sha256": (None if result is None else result.result_sha256),
        "plan_sha256": plan.plan_sha256,
        "previous_round_audit_sha256": previous_round_audit_sha256,
        "round_ordinal": round_plan.document["round_ordinal"],
        "round_receipt_status": receipt_evidence.status,
        "round_sha256": round_plan.round_sha256,
        "schema": ROUND_AUDIT_SCHEMA,
        "session_id": session_id,
        "status": OBSERVATIONAL_STATUS,
    }
    return _deep_freeze(
        {
            **body,
            "round_audit_sha256": statement_bank.sha256_json(body),
        }
    )


def _campaign_result(
    plan: statement_bank.SelectorPlan,
    rounds: list[MinimalityRoundEvidence],
    *,
    outcome: CampaignOutcome,
    terminal_result: minimality.MinimalityRoundResult | None,
) -> MinimalityCampaignResult:
    body: dict[str, Any] = {
        "claims": {
            "cardinality_minimum": False,
            "daemon_attestation": False,
            "global_minimum": False,
            "inclusion_minimal_relative_to_supplied_bank": False,
            "solver_attestation": False,
            "source_entitlement": False,
            "theorem_closure": False,
        },
        "control_outcome": (
            "TERMINAL_MINIMALITY_RESULT"
            if terminal_result is not None
            else outcome.value
        ),
        "plan_sha256": plan.plan_sha256,
        "round_audit_sha256": [item.audit["round_audit_sha256"] for item in rounds],
        "round_count": len(rounds),
        "schema": CAMPAIGN_SCHEMA,
        "status": OBSERVATIONAL_STATUS,
        "terminal_result_sha256": (
            None if terminal_result is None else terminal_result.result_sha256
        ),
    }
    audit = _deep_freeze({**body, "campaign_sha256": statement_bank.sha256_json(body)})
    return MinimalityCampaignResult(
        outcome=outcome,
        rounds=tuple(rounds),
        terminal_result=terminal_result,
        audit=audit,
    )


def _run_round_session(
    plan: statement_bank.SelectorPlan,
    round_plan: minimality.MinimalityRoundPlan,
    *,
    solver_name: str,
    conflict_limit: int,
    transport: session_runner.JsonHttpTransport,
    label: str,
    journal_size_cap: int,
    piqd_data_root: str,
) -> tuple[
    str,
    str,
    round_receipts.AuthenticatedRoundReceiptResult,
]:
    minimality.validate_round_plan(plan, round_plan)
    key = _batch_key(plan, round_plan)
    batch_request = _batch_body(
        round_plan, batch_key=key, conflict_limit=conflict_limit
    )
    clauses = plan.document["gated_cnf"]["clauses"]
    expected_count = len(clauses)
    expected_max_var = plan.document["gated_cnf"]["num_vars"]
    expected_journal = session_runner._journal_body(plan)
    session_id: str | None = None
    delete_attempted = False
    try:
        session_id, created = _create_session(
            transport,
            solver_name=solver_name,
            label=label,
            piqd_data_root=piqd_data_root,
        )
        journal_path = created["journal_path"]
        session_path = f"/sessions/{session_id}"
        added = _request(
            transport,
            "POST",
            f"{session_path}/clauses",
            expected_status=200,
            body={"clauses": clauses},
        )
        if type(added) is not dict or set(added) != {"added", "clauses", "max_var"}:
            _fail("add-clauses response has noncanonical keys")
        if (
            _exact_int(
                added["added"], where="clauses.added", minimum=0, maximum=2**63 - 1
            )
            != expected_count
            or _exact_int(
                added["clauses"],
                where="clauses.clauses",
                minimum=0,
                maximum=2**63 - 1,
            )
            != expected_count
            or _exact_int(
                added["max_var"],
                where="clauses.max_var",
                minimum=0,
                maximum=_I32_MAX,
            )
            != expected_max_var
        ):
            _fail("add-clauses response does not describe the exact selector plan")

        batch_raw = _request(
            transport,
            "POST",
            f"{session_path}/batch-solve",
            expected_status=200,
            body=batch_request,
        )
        batch, records = round_receipts._parse_batch_response(
            batch_raw, session_id=session_id
        )
        if batch["batch_key"] != key:
            _fail("batch response changed the canonical batch key")
        if batch["replayed"] or batch["executed"] != len(records):
            _fail("a fresh round session must freshly execute every returned record")
        if [record.solve_index for record in records] != list(
            range(1, len(records) + 1)
        ):
            _fail("fresh-session batch solve indexes must be dense from one")
        if not records:
            _fail("minimality batch returned no baseline record")

        delete_attempted = True
        closed_raw = _request(transport, "DELETE", session_path, expected_status=200)
        closed = session_runner._validate_session(
            closed_raw,
            expected_id=session_id,
            expected_state="closed",
            expected_solver=solver_name,
            expected_label=label,
            expected_clauses=expected_count,
            expected_max_var=expected_max_var,
            expected_solves=len(records),
            expected_last_status=records[-1].status.value,
            piqd_data_root=piqd_data_root,
        )
        if any(
            closed[field] != created[field]
            for field in (
                "solver_sha256",
                "solver_signature",
                "protocol_version",
                "journal_path",
                "created_at",
            )
        ):
            _fail("closed session changed immutable identity fields")

        receipts_raw = _request(
            transport,
            "GET",
            f"{session_path}/receipts",
            expected_status=200,
        )
        receipts_response = _validate_receipt_paths(
            receipts_raw,
            session_id=session_id,
            journal_path=journal_path,
            expected_count=len(records),
            piqd_data_root=piqd_data_root,
        )
        session_runner._snapshot_regular_file(
            receipts_response["receipts_path"],
            session_id=session_id,
            size_cap=journal_size_cap,
            piqd_data_root=piqd_data_root,
        )
        snapshot = session_runner._snapshot_regular_file(
            journal_path,
            session_id=session_id,
            size_cap=journal_size_cap,
            piqd_data_root=piqd_data_root,
        )
        if snapshot.journal_bytes != expected_journal:
            _fail("closed journal snapshot is not exactly the uploaded gated CNF")
        receipt_evidence = round_receipts.adapt_authenticated_minimality_round_receipts(
            plan,
            round_plan,
            batch_raw,
            receipts_response,
            snapshot,
        )
        return session_id, key, receipt_evidence
    except Exception:
        if session_id is not None and not delete_attempted:
            delete_attempted = True
            try:
                transport.request("DELETE", f"/sessions/{session_id}")
            except Exception as cleanup_error:  # noqa: BLE001
                _ = cleanup_error
        raise


def run_statement_bank_minimality_campaign(
    plan: statement_bank.SelectorPlan,
    *,
    solver_name: str,
    conflict_limit: int,
    transport: session_runner.JsonHttpTransport | None = None,
    base_url: str = "http://127.0.0.1:7272",
    label_prefix: str = "p97-statement-bank-minimality",
    max_rounds: int | None = None,
    journal_size_cap: int = session_runner.DEFAULT_JOURNAL_SIZE_CAP,
    http_request_timeout_s: float = session_runner.DEFAULT_HTTP_REQUEST_TIMEOUT_S,
    http_response_byte_cap: int = session_runner.DEFAULT_HTTP_RESPONSE_BYTE_CAP,
    piqd_data_root: str | None = None,
) -> MinimalityCampaignResult:
    """Run adaptive deletion rounds, each against one fresh closed session."""

    try:
        if (
            type(plan) is not statement_bank.SelectorPlan
            or type(plan.dimacs_bytes) is not bytes
        ):
            _fail("plan must be an exact SelectorPlan with exact bytes")
        statement_bank.validate_selector_plan(plan)
        session_runner._preflight_piqd_i32(plan)
        if type(solver_name) is not str or not solver_name or "\x00" in solver_name:
            _fail("solver_name must be a nonempty exact string")
        if type(label_prefix) is not str or not label_prefix or "\x00" in label_prefix:
            _fail("label_prefix must be a nonempty exact string")
        limit = _exact_int(
            conflict_limit, where="conflict_limit", minimum=1, maximum=_I32_MAX
        )
        request_timeout = session_runner._positive_finite_float(
            http_request_timeout_s, where="http_request_timeout_s"
        )
        response_cap = _exact_int(
            http_response_byte_cap,
            where="http_response_byte_cap",
            minimum=1,
            maximum=2**63 - 1,
        )
        snapshot_cap = _exact_int(
            journal_size_cap,
            where="journal_size_cap",
            minimum=1,
            maximum=2**63 - 1,
        )
        configured_data_root = session_runner._validate_data_root(
            str(Path.home() / ".piqd") if piqd_data_root is None else piqd_data_root
        )
        client = (
            transport
            if transport is not None
            else session_runner.UrllibJsonTransport(
                base_url,
                request_timeout_s=request_timeout,
                response_byte_cap=response_cap,
            )
        )

        group_count = len(plan.document["selector_allocation"])
        hard_round_bound = group_count + 1
        round_bound = (
            hard_round_bound
            if max_rounds is None
            else _exact_int(
                max_rounds,
                where="max_rounds",
                minimum=1,
                maximum=hard_round_bound,
            )
        )
        round_plan = minimality.build_initial_round(plan)
        evidence: list[MinimalityRoundEvidence] = []

        for expected_ordinal in range(round_bound):
            minimality.validate_round_plan(plan, round_plan)
            if round_plan.document["round_ordinal"] != expected_ordinal:
                _fail("round plan ordinal is not the exact campaign successor")
            label = f"{label_prefix}-r{expected_ordinal}-{round_plan.round_sha256[:12]}"
            session_id, key, receipt_evidence = _run_round_session(
                plan,
                round_plan,
                solver_name=solver_name,
                conflict_limit=limit,
                transport=client,
                label=label,
                journal_size_cap=snapshot_cap,
                piqd_data_root=configured_data_root,
            )
            result: minimality.MinimalityRoundResult | None = None
            if type(receipt_evidence) is round_receipts.AuthenticatedCompleteRound:
                result = minimality.interpret_complete_round(
                    plan,
                    round_plan,
                    receipt_evidence.authenticated_verdicts,
                )
            elif (
                type(receipt_evidence)
                is not round_receipts.AuthenticatedGuardedBaseline
            ):
                _fail("round receipt adapter returned an unknown result type")

            previous_audit = (
                None if not evidence else evidence[-1].audit["round_audit_sha256"]
            )
            audit = _round_audit(
                plan=plan,
                round_plan=round_plan,
                session_id=session_id,
                batch_key=key,
                receipt_evidence=receipt_evidence,
                result=result,
                previous_round_audit_sha256=previous_audit,
            )
            evidence.append(
                MinimalityRoundEvidence(
                    round_plan=round_plan,
                    session_id=session_id,
                    batch_key=key,
                    receipt_evidence=receipt_evidence,
                    minimality_result=result,
                    audit=audit,
                )
            )

            if result is None:
                return _campaign_result(
                    plan,
                    evidence,
                    outcome=CampaignOutcome.INCONCLUSIVE,
                    terminal_result=None,
                )
            status = result.document["status"]
            if status == minimality.INCLUSION_MINIMAL:
                return _campaign_result(
                    plan,
                    evidence,
                    outcome=CampaignOutcome.INCLUSION_MINIMAL,
                    terminal_result=result,
                )
            if status == minimality.INCONCLUSIVE:
                return _campaign_result(
                    plan,
                    evidence,
                    outcome=CampaignOutcome.INCONCLUSIVE,
                    terminal_result=result,
                )
            if status != minimality.DELETE_AND_CONTINUE:
                _fail("minimality interpreter returned an unknown status")
            if len(evidence) >= round_bound:
                _fail("max_rounds ended before the deletion campaign became terminal")
            next_round = minimality.build_next_round(plan, round_plan, result)
            if (
                len(next_round.document["active_groups"])
                != len(round_plan.document["active_groups"]) - 1
            ):
                _fail("deletion successor did not remove exactly one active group")
            round_plan = next_round

        _fail("campaign exhausted its safe round bound without a terminal result")
    except StatementBankMinimalityRunnerError:
        raise
    except statement_bank.StatementBankError as exc:
        raise StatementBankMinimalityRunnerError(str(exc)) from exc


# Short spelling for callers that already name the statement-bank context.
run_minimality_campaign = run_statement_bank_minimality_campaign

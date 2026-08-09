"""Bind one PIQD batch response to one P97 minimality round.

This module is the narrow bridge between the durable PIQD receipt schema and
the typed authentication seam in :mod:`phase3_piqd_statement_bank_minimality`.
It deliberately does not interpret a result.  A complete outcome carries an
``AuthenticatedCompleteRoundVerdicts`` value which the caller may pass to
``minimality.interpret_complete_round``.  A guard-stopped outcome is a
different type and can never be passed as a complete round.
"""

from __future__ import annotations

import hashlib
import re
import uuid
from collections.abc import Mapping
from dataclasses import dataclass
from itertools import pairwise
from typing import Any

from census.p97_search import phase3_piqd_statement_bank as statement_bank
from census.p97_search import phase3_piqd_statement_bank_minimality as minimality
from census.p97_search import phase3_piqd_statement_bank_receipts as receipts

ADAPTER_SCHEMA = "p97-piqd-statement-bank-round-receipts/v1"
OBSERVATIONAL_STATUS = "OBSERVATIONAL_ONLY"
COMPLETE_STATUS = "COMPLETE"
INCONCLUSIVE_STATUS = "INCONCLUSIVE"
RESULT_SHA256_POLICY = receipts.RESULT_SHA256_POLICY

_HEX64 = re.compile(r"[0-9a-f]{64}\Z")
_I32_MIN = -(2**31)
_I32_MAX = 2**31 - 1
_I64_MIN = -(2**63)
_I64_MAX = 2**63 - 1
_U64_MAX = 2**64 - 1
_MAX_BATCH_SIZE = 4096
_BATCH_RESPONSE_KEYS = frozenset(
    {
        "batch_key",
        "batch_request_sha256",
        "batch_size",
        "complete",
        "executed",
        "records",
        "replayed",
        "session_id",
        "stopped_by_guard",
    }
)
_BATCH_RECORD_REQUIRED_KEYS = frozenset(
    {
        "assumptions",
        "at",
        "base_bytes",
        "base_clauses",
        "base_sha256",
        "batch_position",
        "conflict_limit",
        "result_sha256",
        "solve_index",
        "status",
    }
)
_BATCH_RECORD_OPTIONAL_KEYS = frozenset({"core", "interrupted_by", "terminal_unsat"})


class StatementBankRoundReceiptError(receipts.StatementBankReceiptError):
    """A batch response or durable receipt failed closed."""


@dataclass(frozen=True)
class AuthenticatedRoundReceipt:
    """A selected durable receipt retained with the authenticated outcome."""

    batch_key: str
    batch_size: int
    batch_request_sha256: str
    batch_position: int
    solve_index: int
    assumptions: tuple[int, ...]
    status: statement_bank.SolverVerdict
    conflict_limit: int
    base_clauses: int
    base_bytes: int
    base_sha256: str
    result_sha256: str
    at: int
    interrupted_by: str | None
    core: tuple[int, ...] | None
    model_recorded: bool
    timeout_ms: int | None


@dataclass(frozen=True)
class AuthenticatedCompleteRound:
    """A dense, receipt-authenticated minimality batch."""

    authenticated_verdicts: minimality.AuthenticatedCompleteRoundVerdicts
    receipts: tuple[AuthenticatedRoundReceipt, ...]
    audit: Mapping[str, Any]
    status: str = COMPLETE_STATUS

    @property
    def verdicts(self) -> minimality.AuthenticatedCompleteRoundVerdicts:
        """Compatibility spelling for the typed minimality evidence."""

        return self.authenticated_verdicts


@dataclass(frozen=True)
class AuthenticatedGuardedBaseline:
    """A guard-stopped SAT/UNKNOWN baseline, never a complete round."""

    baseline: minimality.AuthenticatedQueryVerdict
    receipt: AuthenticatedRoundReceipt
    audit: Mapping[str, Any]
    status: str = INCONCLUSIVE_STATUS


type AuthenticatedRoundReceiptResult = (
    AuthenticatedCompleteRound | AuthenticatedGuardedBaseline
)


@dataclass(frozen=True)
class _BatchRecord:
    batch_position: int
    solve_index: int
    assumptions: tuple[int, ...]
    status: statement_bank.SolverVerdict
    conflict_limit: int
    base_clauses: int
    base_bytes: int
    base_sha256: str
    result_sha256: str
    at: int
    interrupted_by: str | None
    core: tuple[int, ...] | None


def _fail(message: str) -> None:
    raise StatementBankRoundReceiptError(message)


def _exact_int(value: object, *, where: str, minimum: int, maximum: int) -> int:
    if type(value) is not int or not minimum <= value <= maximum:
        _fail(f"{where} must be an integer in {minimum}..{maximum}")
    return value


def _sha256(value: object, *, where: str) -> str:
    if type(value) is not str or _HEX64.fullmatch(value) is None:
        _fail(f"{where} must be a lowercase 64-hex SHA-256")
    return value


def _uuid(value: object, *, where: str) -> str:
    if type(value) is not str:
        _fail(f"{where} must be a canonical UUID string")
    try:
        parsed = uuid.UUID(value)
    except (AttributeError, ValueError):
        _fail(f"{where} must be a canonical UUID string")
    if str(parsed) != value:
        _fail(f"{where} must be a canonical UUID string")
    return value


def _literals(value: object, *, where: str) -> tuple[int, ...]:
    if type(value) is not list:
        _fail(f"{where} must be a canonical literal array")
    result: list[int] = []
    for index, item in enumerate(value):
        literal = _exact_int(
            item, where=f"{where}[{index}]", minimum=_I32_MIN, maximum=_I32_MAX
        )
        if literal == 0 or literal == _I32_MIN:
            _fail(f"{where} contains an invalid literal")
        result.append(literal)
    expected = tuple(sorted(set(result), key=lambda item: (abs(item), item)))
    if tuple(result) != expected:
        _fail(f"{where} is not canonical")
    if any(left == -right for left, right in pairwise(expected)):
        _fail(f"{where} is contradictory")
    return expected


def _status(value: object, *, where: str) -> statement_bank.SolverVerdict:
    if type(value) is not str:
        _fail(f"{where} must be SAT, UNSAT, or UNKNOWN")
    try:
        return statement_bank.SolverVerdict(value)
    except ValueError:
        _fail(f"{where} must be SAT, UNSAT, or UNKNOWN")


def _validate_plan_and_round(
    plan: object, round_plan: object
) -> tuple[statement_bank.SelectorPlan, minimality.MinimalityRoundPlan]:
    if type(plan) is not statement_bank.SelectorPlan:
        _fail("plan must be an exact SelectorPlan")
    if type(plan.dimacs_bytes) is not bytes:
        _fail("plan.dimacs_bytes must be exact bytes")
    if plan.plan_sha256 != plan.document.get("plan_sha256"):
        _fail("plan.plan_sha256 does not match its canonical document")
    try:
        statement_bank.validate_selector_plan(plan)
        minimality.validate_round_plan(plan, round_plan)
    except (TypeError, ValueError, KeyError) as exc:
        _fail(f"plan or round plan failed validation: {exc}")
    return plan, round_plan  # type: ignore[return-value]


def _parse_batch_response(
    value: object, *, session_id: str
) -> tuple[dict[str, Any], tuple[_BatchRecord, ...]]:
    if type(value) is not dict or set(value) != _BATCH_RESPONSE_KEYS:
        _fail("batch response has missing, extra, or non-object keys")
    if _uuid(value["session_id"], where="batch.session_id") != session_id:
        _fail("batch response targets a different session")
    _uuid(value["batch_key"], where="batch.batch_key")
    _sha256(value["batch_request_sha256"], where="batch.batch_request_sha256")
    batch_size = _exact_int(
        value["batch_size"],
        where="batch.batch_size",
        minimum=1,
        maximum=_MAX_BATCH_SIZE,
    )
    for key in ("complete", "replayed", "stopped_by_guard"):
        if type(value[key]) is not bool:
            _fail(f"batch.{key} must be a Boolean")
    _exact_int(value["executed"], where="batch.executed", minimum=0, maximum=_U64_MAX)
    raw_records = value["records"]
    if type(raw_records) is not list:
        _fail("batch.records must be an array")
    parsed: list[_BatchRecord] = []
    for index, raw in enumerate(raw_records):
        where = f"batch.records[{index}]"
        if type(raw) is not dict:
            _fail(f"{where} must be an object")
        keys = set(raw)
        if keys - _BATCH_RECORD_REQUIRED_KEYS - _BATCH_RECORD_OPTIONAL_KEYS:
            _fail(f"{where} has extra keys")
        if _BATCH_RECORD_REQUIRED_KEYS - keys:
            _fail(f"{where} has missing keys")
        status = _status(raw["status"], where=f"{where}.status")
        assumptions = _literals(raw["assumptions"], where=f"{where}.assumptions")
        conflict_limit = _exact_int(
            raw["conflict_limit"],
            where=f"{where}.conflict_limit",
            minimum=1,
            maximum=_I32_MAX,
        )
        interrupted_by = raw.get("interrupted_by")
        if interrupted_by is not None and (
            type(interrupted_by) is not str or interrupted_by not in {"conflict_limit"}
        ):
            _fail(f"{where}.interrupted_by must be conflict_limit")
        core: tuple[int, ...] | None = None
        if "core" in raw:
            core = _literals(raw["core"], where=f"{where}.core")
        if status is statement_bank.SolverVerdict.UNSAT and core is None:
            _fail(f"{where}.core is required for UNSAT")
        if status is not statement_bank.SolverVerdict.UNSAT and core is not None:
            _fail(f"{where}.core is allowed only for UNSAT")
        if status is statement_bank.SolverVerdict.UNKNOWN:
            if interrupted_by != "conflict_limit":
                _fail(f"{where}.UNKNOWN must be interrupted by conflict_limit")
        elif interrupted_by is not None:
            _fail(f"{where}.interrupted_by is allowed only for UNKNOWN")
        terminal = raw.get("terminal_unsat")
        if terminal is not None and (
            type(terminal) is not bool
            or terminal != (status is statement_bank.SolverVerdict.UNSAT and core == ())
        ):
            _fail(f"{where}.terminal_unsat is inconsistent with status/core")
        parsed.append(
            _BatchRecord(
                batch_position=_exact_int(
                    raw["batch_position"],
                    where=f"{where}.batch_position",
                    minimum=0,
                    maximum=_MAX_BATCH_SIZE - 1,
                ),
                solve_index=_exact_int(
                    raw["solve_index"],
                    where=f"{where}.solve_index",
                    minimum=1,
                    maximum=_U64_MAX,
                ),
                assumptions=assumptions,
                status=status,
                conflict_limit=conflict_limit,
                base_clauses=_exact_int(
                    raw["base_clauses"],
                    where=f"{where}.base_clauses",
                    minimum=0,
                    maximum=_U64_MAX,
                ),
                base_bytes=_exact_int(
                    raw["base_bytes"],
                    where=f"{where}.base_bytes",
                    minimum=0,
                    maximum=_U64_MAX,
                ),
                base_sha256=_sha256(raw["base_sha256"], where=f"{where}.base_sha256"),
                result_sha256=_sha256(
                    raw["result_sha256"], where=f"{where}.result_sha256"
                ),
                at=_exact_int(
                    raw["at"], where=f"{where}.at", minimum=_I64_MIN, maximum=_I64_MAX
                ),
                interrupted_by=interrupted_by,
                core=core,
            )
        )
    if [record.batch_position for record in parsed] != list(range(len(parsed))):
        _fail("batch records must have dense positions in response order")
    if any(left.solve_index >= right.solve_index for left, right in pairwise(parsed)):
        _fail("batch records must have increasing solve indexes")
    if len(parsed) > batch_size:
        _fail("batch records exceed batch_size")
    if value["executed"] > len(parsed):
        _fail("batch.executed exceeds the returned record count")
    if value["replayed"] and value["executed"] != 0:
        _fail("a replayed batch must report zero executed solves")
    if not value["replayed"] and value["executed"] == 0:
        _fail("a non-replayed batch must report an executed solve")
    return value, tuple(parsed)


def _batch_digest(
    assumptions: list[tuple[int, ...]], conflict_limit: int, *, guard: str
) -> str:
    digest = hashlib.sha256()
    digest.update(b"piqd-batch-request/v1")
    digest.update(b"\nguard=" + guard.encode())
    digest.update(f"\nqueries={len(assumptions)}".encode())
    for index, literals in enumerate(assumptions):
        digest.update(f"\n{index} limit={conflict_limit} assumptions=".encode())
        digest.update(" ".join(str(literal) for literal in literals).encode())
    return digest.hexdigest()


def _journal_check(
    plan: statement_bank.SelectorPlan,
    snapshot: receipts.AuthenticatedJournalSnapshot,
    selected: tuple[receipts._Receipt, ...],
) -> tuple[int, str]:
    if type(snapshot) is not receipts.AuthenticatedJournalSnapshot:
        _fail("snapshot must be an exact AuthenticatedJournalSnapshot")
    if _uuid(snapshot.session_id, where="snapshot.session_id") != snapshot.session_id:
        _fail("snapshot.session_id is invalid")
    if type(snapshot.journal_bytes) is not bytes:
        _fail("snapshot.journal_bytes must be exact bytes")
    if (
        _sha256(snapshot.journal_sha256, where="snapshot.journal_sha256")
        != hashlib.sha256(snapshot.journal_bytes).hexdigest()
    ):
        _fail("snapshot.journal_sha256 does not match journal_bytes")
    clauses = plan.document["gated_cnf"]["clauses"]
    expected = receipts._render_journal(clauses)
    if not selected:
        _fail("batch must contain at least one selected receipt")
    base_bytes = selected[0].base_bytes
    base_clauses = selected[0].base_clauses
    base_sha = selected[0].base_sha256
    if base_bytes != len(expected) or base_clauses != len(clauses):
        _fail("receipt base does not match selector plan")
    if base_bytes > len(snapshot.journal_bytes):
        _fail("journal snapshot is shorter than receipt base")
    prefix = snapshot.journal_bytes[:base_bytes]
    if prefix != expected or hashlib.sha256(prefix).hexdigest() != base_sha:
        _fail("receipt base is not the exact authenticated selector journal")
    if hashlib.sha256(
        prefix
    ).hexdigest() != snapshot.journal_sha256 and base_bytes == len(
        snapshot.journal_bytes
    ):
        _fail("snapshot hash does not match the selected journal base")
    for receipt in selected:
        if (receipt.base_clauses, receipt.base_bytes, receipt.base_sha256) != (
            base_clauses,
            base_bytes,
            base_sha,
        ):
            _fail("selected receipts disagree about journal base")
    return base_bytes, base_sha


def _audit(
    *,
    plan: statement_bank.SelectorPlan,
    round_plan: minimality.MinimalityRoundPlan,
    batch: dict[str, Any],
    snapshot: receipts.AuthenticatedJournalSnapshot,
    selected: tuple[receipts._Receipt, ...],
    records: tuple[_BatchRecord, ...],
) -> dict[str, Any]:
    body: dict[str, Any] = {
        "adapter_schema": ADAPTER_SCHEMA,
        "status": OBSERVATIONAL_STATUS,
        "claims": {
            "cardinality_minimum": False,
            "daemon_attestation": False,
            "global_minimum": False,
            "inclusion_minimal_relative_to_supplied_bank": False,
            "solver_attestation": False,
            "source_entitlement": False,
            "theorem_closure": False,
        },
        "plan_sha256": plan.plan_sha256,
        "round_sha256": round_plan.round_sha256,
        "round_ordinal": round_plan.document["round_ordinal"],
        "session_id": snapshot.session_id,
        "journal_sha256": snapshot.journal_sha256,
        "batch": {
            "batch_key": batch["batch_key"],
            "batch_size": batch["batch_size"],
            "batch_request_sha256": batch["batch_request_sha256"],
            "stopped_by_guard": batch["stopped_by_guard"],
            "complete": batch["complete"],
            "positions": [record.batch_position for record in records],
            "solve_indexes": [record.solve_index for record in records],
        },
        "result_sha256_policy": RESULT_SHA256_POLICY,
        "selected_result_sha256": [receipt.result_sha256 for receipt in selected],
    }
    body["adapter_sha256"] = statement_bank.sha256_json(body)
    return body


def adapt_authenticated_minimality_round_receipts(
    plan: statement_bank.SelectorPlan,
    round_plan: minimality.MinimalityRoundPlan,
    batch_response: object,
    receipts_response: object,
    snapshot: receipts.AuthenticatedJournalSnapshot,
) -> AuthenticatedRoundReceiptResult:
    """Authenticate a complete or guard-stopped PIQD batch for one round.

    The request is the canonical P97 batch: all round queries, positive
    uniform conflict limit, and ``continue_after_first_only_if=UNSAT``.  The
    digest is independently recomputed from those values; daemon ``complete``
    is never treated as sufficient evidence of a complete round.
    """

    plan, round_plan = _validate_plan_and_round(plan, round_plan)
    if type(snapshot) is not receipts.AuthenticatedJournalSnapshot:
        _fail("snapshot must be an exact AuthenticatedJournalSnapshot")
    session_id = _uuid(snapshot.session_id, where="snapshot.session_id")
    try:
        batch, records = _parse_batch_response(batch_response, session_id=session_id)
        _, durable = receipts._parse_response(
            receipts_response, expected_session_id=session_id
        )
    except receipts.StatementBankReceiptError as exc:
        _fail(str(exc))

    queries = round_plan.document["queries"]
    omission_queries = queries["leave_one_group_out"]
    expected_size = 1 + len(omission_queries)
    if batch["batch_size"] != expected_size:
        _fail("batch_size does not equal baseline plus every active omission")
    expected_query_assumptions = [
        tuple(queries["baseline"]["assumptions"]),
        *(tuple(query["assumptions"]) for query in omission_queries),
    ]
    if not records:
        _fail("batch records must contain the baseline")
    limit = records[0].conflict_limit
    if any(record.conflict_limit != limit for record in records):
        _fail("batch records must use one positive uniform conflict limit")
    expected_digest = _batch_digest(expected_query_assumptions, limit, guard="UNSAT")
    if batch["batch_request_sha256"] != expected_digest:
        _fail("batch_request_sha256 does not bind the exact minimality queries")

    selected: list[receipts._Receipt] = []
    key = batch["batch_key"]
    for receipt in durable.values():
        if receipt.batch_key == key:
            selected.append(receipt)
    selected.sort(
        key=lambda item: item.batch_position if item.batch_position is not None else -1
    )
    if len(selected) != len(records):
        _fail("durable batch receipts do not exactly match response records")
    if not selected or any(
        receipt.batch_key != key
        or receipt.batch_size != batch["batch_size"]
        or receipt.batch_request_sha256 != batch["batch_request_sha256"]
        or receipt.batch_position != record.batch_position
        or receipt.solve_index != record.solve_index
        for receipt, record in zip(selected, records, strict=True)
    ):
        _fail("response records disagree with durable batch receipt identity")
    selected_tuple = tuple(selected)
    _journal_check(plan, snapshot, selected_tuple)

    for receipt, record in zip(selected_tuple, records, strict=True):
        if (
            receipt.assumptions != record.assumptions
            or receipt.status is not record.status
        ):
            _fail("batch response disagrees with durable receipt query or status")
        if receipt.conflict_limit != record.conflict_limit:
            _fail("batch response disagrees with durable conflict limit")
        if (
            receipt.base_clauses != record.base_clauses
            or receipt.base_bytes != record.base_bytes
            or receipt.base_sha256 != record.base_sha256
        ):
            _fail("batch response disagrees with durable journal base")
        if (
            receipt.result_sha256 != record.result_sha256
            or receipt.at != record.at
            or receipt.core != record.core
            or receipt.interrupted_by != record.interrupted_by
        ):
            _fail("batch response disagrees with durable receipt evidence")
        if receipt.model_recorded or receipt.timeout_ms is not None:
            _fail("batch durable receipt records a model or wall-clock timeout")

    if (
        expected_size > 1
        and len(records) == 1
        and records[0].status is not statement_bank.SolverVerdict.UNSAT
    ):
        if not batch["complete"] or not batch["stopped_by_guard"]:
            _fail("SAT/UNKNOWN baseline must be an explicitly guard-stopped batch")
        if (
            records[0].batch_position != 0
            or records[0].assumptions != expected_query_assumptions[0]
        ):
            _fail("guard-stopped batch must retain exactly position-0 baseline")
        baseline = minimality.AuthenticatedQueryVerdict(
            query_sha256=queries["baseline"]["query_sha256"],
            assumptions=records[0].assumptions,
            verdict=records[0].status,
        )
        audit = _audit(
            plan=plan,
            round_plan=round_plan,
            batch=batch,
            snapshot=snapshot,
            selected=selected_tuple,
            records=records,
        )
        return AuthenticatedGuardedBaseline(
            baseline=baseline,
            receipt=_public_receipt(selected_tuple[0], records[0]),
            audit=audit,
        )

    if (
        batch["stopped_by_guard"]
        or not batch["complete"]
        or len(records) != expected_size
    ):
        _fail(
            "complete minimality round requires a dense full batch without guard stop"
        )
    if any(
        record.assumptions != expected
        for record, expected in zip(records, expected_query_assumptions, strict=True)
    ):
        _fail("batch records are not in exact round query order")
    verdicts = minimality.AuthenticatedCompleteRoundVerdicts(
        plan_sha256=plan.plan_sha256,
        round_sha256=round_plan.round_sha256,
        round_ordinal=round_plan.document["round_ordinal"],
        complete=True,
        baseline=minimality.AuthenticatedQueryVerdict(
            query_sha256=queries["baseline"]["query_sha256"],
            assumptions=records[0].assumptions,
            verdict=records[0].status,
        ),
        leave_one_group_out=tuple(
            minimality.AuthenticatedOmissionVerdict(
                statement_id=query["statement_id"],
                query_sha256=query["query_sha256"],
                assumptions=record.assumptions,
                verdict=record.status,
            )
            for query, record in zip(omission_queries, records[1:], strict=True)
        ),
    )
    minimality._validate_authenticated_verdicts(plan, round_plan, verdicts)
    audit = _audit(
        plan=plan,
        round_plan=round_plan,
        batch=batch,
        snapshot=snapshot,
        selected=selected_tuple,
        records=records,
    )
    return AuthenticatedCompleteRound(
        authenticated_verdicts=verdicts,
        receipts=tuple(
            _public_receipt(receipt, record)
            for receipt, record in zip(selected_tuple, records, strict=True)
        ),
        audit=audit,
    )


def _public_receipt(
    receipt: receipts._Receipt, record: _BatchRecord
) -> AuthenticatedRoundReceipt:
    return AuthenticatedRoundReceipt(
        batch_key=receipt.batch_key,
        batch_size=receipt.batch_size,
        batch_request_sha256=receipt.batch_request_sha256,
        batch_position=record.batch_position,
        solve_index=receipt.solve_index,
        assumptions=receipt.assumptions,
        status=receipt.status,
        conflict_limit=receipt.conflict_limit
        if receipt.conflict_limit is not None
        else record.conflict_limit,
        base_clauses=receipt.base_clauses,
        base_bytes=receipt.base_bytes,
        base_sha256=receipt.base_sha256,
        result_sha256=receipt.result_sha256,
        at=receipt.at,
        interrupted_by=receipt.interrupted_by,
        core=receipt.core,
        model_recorded=receipt.model_recorded,
        timeout_ms=receipt.timeout_ms,
    )


# Explicit aliases keep the seam discoverable without creating another API.
adapt_authenticated_round_receipts = adapt_authenticated_minimality_round_receipts
adapt_authenticated_piqd_round_receipts = adapt_authenticated_minimality_round_receipts

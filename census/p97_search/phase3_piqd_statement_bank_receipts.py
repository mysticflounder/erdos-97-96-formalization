"""Authenticate PIQD stage-1 and proposed stage-2 receipts against a plan.

The adapter is intentionally observational.  It checks that selected receipt
records describe exact plan queries over exact authenticated journal bytes, but
it does not attest the daemon or solver and it does not turn incremental UNSAT
observations into a proof artifact.
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

ADAPTER_SCHEMA = "p97-piqd-statement-bank-receipts/v1"
ADAPTER_STATUS = "OBSERVATIONAL_ONLY"
RESULT_SHA256_POLICY = "OPAQUE_64_HEX_NOT_RECOMPUTED"

_TOP_LEVEL_KEYS = frozenset(
    {"count", "journal_path", "receipts", "receipts_path", "session_id"}
)
_RECEIPT_REQUIRED_KEYS = frozenset(
    {
        "assumptions",
        "at",
        "base_bytes",
        "base_clauses",
        "base_sha256",
        "model_recorded",
        "result_sha256",
        "solve_index",
        "status",
    }
)
_RECEIPT_OPTIONAL_KEYS = frozenset(
    {
        "batch_key",
        "batch_position",
        "batch_request_sha256",
        "batch_size",
        "conflict_limit",
        "core",
        "interrupted_by",
        "timeout_ms",
    }
)
_RECEIPT_BATCH_KEYS = frozenset(
    {"batch_key", "batch_position", "batch_request_sha256", "batch_size"}
)
_LOWER_HEX_64 = re.compile(r"[0-9a-f]{64}\Z")
_I32_MIN = -(2**31)
_I32_MAX = 2**31 - 1
_I64_MIN = -(2**63)
_I64_MAX = 2**63 - 1
_U64_MAX = 2**64 - 1
_BATCH_MAX_SIZE = 4096


class StatementBankReceiptError(statement_bank.StatementBankError):
    """A receipt response, selection, or journal snapshot failed closed."""


@dataclass(frozen=True)
class AuthenticatedJournalSnapshot:
    """Journal bytes whose custody and expected digest a caller authenticated.

    Construction of this value is an authentication boundary, not daemon-origin
    attestation.  The adapter still recomputes ``journal_sha256`` and binds the
    bytes to ``session_id`` and the selected receipt prefix.
    """

    session_id: str
    journal_bytes: bytes
    journal_sha256: str


@dataclass(frozen=True)
class AuthenticatedBatchBinding:
    """Expected identity of one complete, caller-authenticated solve batch.

    Construction is an authentication boundary.  The adapter validates the
    values again and requires the selected receipts to exhaust the batch in
    canonical query order.
    """

    batch_key: str
    batch_size: int
    batch_request_sha256: str


@dataclass(frozen=True)
class ReceiptAdapterResult:
    """Typed verdicts, their bank-relative interpretation, and audit metadata."""

    verdict_inputs: statement_bank.AuthenticatedVerdictInputs
    interpretation: Mapping[str, Any]
    audit: Mapping[str, Any]


@dataclass(frozen=True)
class _Receipt:
    solve_index: int
    base_clauses: int
    base_bytes: int
    base_sha256: str
    assumptions: tuple[int, ...]
    conflict_limit: int | None
    timeout_ms: int | None
    status: statement_bank.SolverVerdict
    interrupted_by: str | None
    core: tuple[int, ...] | None
    model_recorded: bool
    result_sha256: str
    at: int
    batch_key: str | None
    batch_position: int | None
    batch_size: int | None
    batch_request_sha256: str | None


def _fail(message: str) -> None:
    raise StatementBankReceiptError(message)


def _exact_int(value: object, *, where: str, minimum: int, maximum: int) -> int:
    if type(value) is not int or not minimum <= value <= maximum:
        _fail(f"{where} must be an integer in {minimum}..{maximum}")
    return value


def _hex_sha256(value: object, *, where: str) -> str:
    if type(value) is not str or _LOWER_HEX_64.fullmatch(value) is None:
        _fail(f"{where} must be a lowercase 64-hex SHA-256")
    return value


def _session_id(value: object, *, where: str) -> str:
    if type(value) is not str:
        _fail(f"{where} must be a canonical UUID string")
    try:
        parsed = uuid.UUID(value)
    except (ValueError, AttributeError):
        _fail(f"{where} must be a canonical UUID string")
    if str(parsed) != value:
        _fail(f"{where} must be a canonical UUID string")
    return value


def _canonical_literals(value: object, *, where: str) -> tuple[int, ...]:
    if type(value) is not list:
        _fail(f"{where} must be a canonical literal array")
    literals = tuple(
        _exact_int(item, where=f"{where}[{index}]", minimum=_I32_MIN, maximum=_I32_MAX)
        for index, item in enumerate(value)
    )
    if any(literal == 0 for literal in literals):
        _fail(f"{where} contains zero")
    expected = tuple(sorted(set(literals), key=lambda literal: (abs(literal), literal)))
    for left, right in pairwise(expected):
        if left == -right:
            _fail(f"{where} is contradictory")
    if literals != expected:
        _fail(f"{where} is not canonical")
    return literals


def _optional_int(
    raw: dict[str, Any], key: str, *, where: str, minimum: int, maximum: int
) -> int | None:
    if key not in raw:
        return None
    return _exact_int(
        raw[key], where=f"{where}.{key}", minimum=minimum, maximum=maximum
    )


def _parse_receipt(value: object, *, position: int) -> _Receipt:
    where = f"receipts[{position}]"
    if type(value) is not dict:
        _fail(f"{where} must be an object")
    keys = set(value)
    missing = _RECEIPT_REQUIRED_KEYS - keys
    extra = keys - _RECEIPT_REQUIRED_KEYS - _RECEIPT_OPTIONAL_KEYS
    if missing or extra:
        _fail(f"{where} has missing or extra keys")

    batch_keys = keys & _RECEIPT_BATCH_KEYS
    if batch_keys and batch_keys != _RECEIPT_BATCH_KEYS:
        _fail(f"{where} must contain all batch fields or none")

    solve_index = _exact_int(
        value["solve_index"], where=f"{where}.solve_index", minimum=1, maximum=_U64_MAX
    )
    base_clauses = _exact_int(
        value["base_clauses"],
        where=f"{where}.base_clauses",
        minimum=0,
        maximum=_U64_MAX,
    )
    base_bytes = _exact_int(
        value["base_bytes"], where=f"{where}.base_bytes", minimum=0, maximum=_U64_MAX
    )
    base_sha256 = _hex_sha256(value["base_sha256"], where=f"{where}.base_sha256")
    assumptions = _canonical_literals(
        value["assumptions"], where=f"{where}.assumptions"
    )
    conflict_limit = _optional_int(
        value, "conflict_limit", where=where, minimum=0, maximum=_I32_MAX
    )
    timeout_ms = _optional_int(
        value, "timeout_ms", where=where, minimum=0, maximum=_U64_MAX
    )

    raw_status = value["status"]
    if type(raw_status) is not str:
        _fail(f"{where}.status must be SAT, UNSAT, or UNKNOWN")
    try:
        status = statement_bank.SolverVerdict(raw_status)
    except (TypeError, ValueError):
        _fail(f"{where}.status must be SAT, UNSAT, or UNKNOWN")

    interrupted_by: str | None = None
    if "interrupted_by" in value:
        interrupted_by = value["interrupted_by"]
        if type(interrupted_by) is not str or interrupted_by not in {
            "cancel",
            "conflict_limit",
            "timeout",
        }:
            _fail(f"{where}.interrupted_by is not a PIQD cutoff value")

    core: tuple[int, ...] | None = None
    if "core" in value:
        core = _canonical_literals(value["core"], where=f"{where}.core")
        if not set(core).issubset(assumptions):
            _fail(f"{where}.core must be a subset of assumptions")

    model_recorded = value["model_recorded"]
    if type(model_recorded) is not bool:
        _fail(f"{where}.model_recorded must be a Boolean")
    result_sha256 = _hex_sha256(value["result_sha256"], where=f"{where}.result_sha256")
    at = _exact_int(
        value["at"], where=f"{where}.at", minimum=_I64_MIN, maximum=_I64_MAX
    )

    batch_key: str | None = None
    batch_position: int | None = None
    batch_size: int | None = None
    batch_request_sha256: str | None = None
    if batch_keys:
        batch_key = _session_id(value["batch_key"], where=f"{where}.batch_key")
        batch_position = _exact_int(
            value["batch_position"],
            where=f"{where}.batch_position",
            minimum=0,
            maximum=_BATCH_MAX_SIZE - 1,
        )
        batch_size = _exact_int(
            value["batch_size"],
            where=f"{where}.batch_size",
            minimum=1,
            maximum=_BATCH_MAX_SIZE,
        )
        if batch_position >= batch_size:
            _fail(f"{where}.batch_position must be less than batch_size")
        batch_request_sha256 = _hex_sha256(
            value["batch_request_sha256"],
            where=f"{where}.batch_request_sha256",
        )

    if status is statement_bank.SolverVerdict.UNSAT:
        if core is None:
            _fail(f"{where}.core is required for UNSAT")
    elif core is not None:
        _fail(f"{where}.core is allowed only for UNSAT")
    if status is not statement_bank.SolverVerdict.SAT and model_recorded:
        _fail(f"{where}.model_recorded is true for a non-SAT receipt")
    if (
        status is not statement_bank.SolverVerdict.UNKNOWN
        and interrupted_by is not None
    ):
        _fail(f"{where}.interrupted_by is allowed only for UNKNOWN")

    return _Receipt(
        solve_index=solve_index,
        base_clauses=base_clauses,
        base_bytes=base_bytes,
        base_sha256=base_sha256,
        assumptions=assumptions,
        conflict_limit=conflict_limit,
        timeout_ms=timeout_ms,
        status=status,
        interrupted_by=interrupted_by,
        core=core,
        model_recorded=model_recorded,
        result_sha256=result_sha256,
        at=at,
        batch_key=batch_key,
        batch_position=batch_position,
        batch_size=batch_size,
        batch_request_sha256=batch_request_sha256,
    )


def _parse_response(
    response: object, *, expected_session_id: str
) -> tuple[dict[str, Any], dict[int, _Receipt]]:
    if type(response) is not dict or set(response) != _TOP_LEVEL_KEYS:
        _fail("receipts response has noncanonical top-level keys")
    if (
        _session_id(response["session_id"], where="receipts response session_id")
        != expected_session_id
    ):
        _fail("receipts response targets a different session")
    for key in ("journal_path", "receipts_path"):
        value = response[key]
        if type(value) is not str or not value or "\x00" in value:
            _fail(f"receipts response {key} must be a nonempty path string")
    receipts_value = response["receipts"]
    if type(receipts_value) is not list:
        _fail("receipts response receipts must be an array")
    count = _exact_int(
        response["count"], where="receipts response count", minimum=0, maximum=_U64_MAX
    )
    if count != len(receipts_value):
        _fail("receipts response count does not match receipts")
    receipts = [
        _parse_receipt(item, position=index)
        for index, item in enumerate(receipts_value)
    ]
    indexes = [receipt.solve_index for receipt in receipts]
    if indexes != list(range(1, count + 1)):
        _fail("receipt solve_index values must be unique, ordered, and dense from one")
    return response, {receipt.solve_index: receipt for receipt in receipts}


def _render_journal(clauses: object) -> bytes:
    if not isinstance(clauses, list):
        _fail("selector plan gated clauses are not an array")
    lines: list[str] = []
    for clause in clauses:
        if not isinstance(clause, list):
            _fail("selector plan gated clause is not an array")
        lines.append("".join(f"{literal} " for literal in clause) + "0\n")
    return "".join(lines).encode("ascii")


def _parse_journal_prefix(prefix: bytes) -> tuple[tuple[int, ...], ...]:
    try:
        text = prefix.decode("ascii")
    except UnicodeDecodeError:
        _fail("journal prefix is not ASCII DIMACS-body bytes")
    if prefix and not text.endswith("\n"):
        _fail("journal prefix ends in a partial clause line")
    clauses: list[tuple[int, ...]] = []
    for line_number, line in enumerate(text.splitlines(), start=1):
        tokens = line.split(" ")
        if not tokens or tokens[-1] != "0" or "" in tokens:
            _fail(f"journal prefix line {line_number} is not canonical")
        literals: list[int] = []
        for token in tokens[:-1]:
            try:
                literal = int(token)
            except ValueError:
                _fail(f"journal prefix line {line_number} has a non-integer token")
            if literal == 0 or not _I32_MIN <= literal <= _I32_MAX:
                _fail(f"journal prefix line {line_number} has an invalid literal")
            literals.append(literal)
        clauses.append(tuple(literals))
    result = tuple(clauses)
    rendered = "".join(
        "".join(f"{literal} " for literal in clause) + "0\n" for clause in result
    ).encode("ascii")
    if rendered != prefix:
        _fail("journal prefix is not exact PIQD clause-line rendering")
    return result


def _query_map(
    plan: statement_bank.SelectorPlan,
) -> tuple[dict[str, Any], dict[str, dict[str, Any]]]:
    queries = plan.document["queries"]
    baseline = queries["baseline"]
    omissions = queries["leave_one_group_out"]
    return baseline, {query["statement_id"]: query for query in omissions}


def _validate_batch_binding(value: object) -> AuthenticatedBatchBinding:
    if not isinstance(value, AuthenticatedBatchBinding):
        _fail("expected batch binding has the wrong in-memory type")
    return AuthenticatedBatchBinding(
        batch_key=_session_id(
            value.batch_key, where="expected batch binding batch_key"
        ),
        batch_size=_exact_int(
            value.batch_size,
            where="expected batch binding batch_size",
            minimum=1,
            maximum=_BATCH_MAX_SIZE,
        ),
        batch_request_sha256=_hex_sha256(
            value.batch_request_sha256,
            where="expected batch binding batch_request_sha256",
        ),
    )


def adapt_authenticated_piqd_receipts(
    plan: statement_bank.SelectorPlan,
    receipts_response: object,
    journal_snapshot: AuthenticatedJournalSnapshot,
    *,
    baseline_solve_index: int,
    statement_solve_indexes: Mapping[str, int],
    expected_conflict_limit: int,
    expected_batch_binding: AuthenticatedBatchBinding | None = None,
) -> ReceiptAdapterResult:
    """Bind selected PIQD receipts to exact plan queries and interpret them."""

    statement_bank.validate_selector_plan(plan)
    if not isinstance(journal_snapshot, AuthenticatedJournalSnapshot):
        _fail("journal snapshot has the wrong in-memory type")
    session_id = _session_id(
        journal_snapshot.session_id, where="journal snapshot session_id"
    )
    if type(journal_snapshot.journal_bytes) is not bytes:
        _fail("journal snapshot bytes must be bytes")
    journal_sha256 = _hex_sha256(
        journal_snapshot.journal_sha256, where="journal snapshot sha256"
    )
    if hashlib.sha256(journal_snapshot.journal_bytes).hexdigest() != journal_sha256:
        _fail("journal snapshot sha256 does not match its bytes")

    _, receipts = _parse_response(receipts_response, expected_session_id=session_id)
    batch_receipts = tuple(
        receipt for receipt in receipts.values() if receipt.batch_key is not None
    )
    batch_binding: AuthenticatedBatchBinding | None = None
    if expected_batch_binding is None:
        if batch_receipts:
            _fail("batch receipts require an authenticated expected batch binding")
    else:
        batch_binding = _validate_batch_binding(expected_batch_binding)
    baseline_index = _exact_int(
        baseline_solve_index, where="baseline_solve_index", minimum=1, maximum=_U64_MAX
    )
    conflict_limit = _exact_int(
        expected_conflict_limit,
        where="expected_conflict_limit",
        minimum=0,
        maximum=_I32_MAX,
    )

    allocations = plan.document["selector_allocation"]
    statement_ids = [item["statement_id"] for item in allocations]
    if not isinstance(statement_solve_indexes, dict) or set(
        statement_solve_indexes
    ) != set(statement_ids):
        _fail(
            "statement_solve_indexes must bind exactly the selector-plan statement IDs"
        )
    selected_by_statement: dict[str, int] = {}
    for statement_id in statement_ids:
        selected_by_statement[statement_id] = _exact_int(
            statement_solve_indexes[statement_id],
            where=f"statement_solve_indexes[{statement_id}]",
            minimum=1,
            maximum=_U64_MAX,
        )
    selected_indexes = [baseline_index, *selected_by_statement.values()]
    if len(set(selected_indexes)) != len(selected_indexes):
        _fail("baseline and statement selection bindings must be pairwise distinct")
    missing_receipts = [index for index in selected_indexes if index not in receipts]
    if missing_receipts:
        _fail("a selected solve_index is absent from the receipts response")

    baseline_query, omission_queries = _query_map(plan)
    baseline_receipt = receipts[baseline_index]
    if list(baseline_receipt.assumptions) != baseline_query["assumptions"]:
        _fail("baseline receipt assumptions do not exactly equal the plan query")
    selected_receipts = [baseline_receipt]
    leave_one_out: dict[str, statement_bank.SolverVerdict] = {}
    for statement_id in statement_ids:
        receipt = receipts[selected_by_statement[statement_id]]
        if list(receipt.assumptions) != omission_queries[statement_id]["assumptions"]:
            _fail(f"receipt assumptions do not exactly equal query for {statement_id}")
        selected_receipts.append(receipt)
        leave_one_out[statement_id] = receipt.status

    batch_audit: dict[str, Any] | None = None
    if batch_binding is not None:
        if conflict_limit == 0:
            _fail("authenticated batches require a positive conflict_limit")
        if batch_binding.batch_size != len(selected_receipts):
            _fail(
                "expected batch_size does not equal the complete selected query count"
            )
        expected_batch_identity = (
            batch_binding.batch_key,
            batch_binding.batch_size,
            batch_binding.batch_request_sha256,
        )
        for receipt in selected_receipts:
            if receipt.batch_key is None:
                _fail("selected receipts must not mix batch and non-batch records")
            if receipt.model_recorded:
                _fail("selected batch receipts must have model_recorded false")
            if (
                receipt.batch_key,
                receipt.batch_size,
                receipt.batch_request_sha256,
            ) != expected_batch_identity:
                _fail("selected receipt does not match the expected batch binding")

        expected_positions = list(range(batch_binding.batch_size))
        selected_positions = [receipt.batch_position for receipt in selected_receipts]
        if selected_positions != expected_positions:
            _fail(
                "selected batch positions must be ordered and dense from zero "
                "in canonical query order"
            )

        batch_members = [
            receipt
            for receipt in batch_receipts
            if receipt.batch_key == batch_binding.batch_key
        ]
        if any(
            (receipt.batch_size, receipt.batch_request_sha256)
            != (batch_binding.batch_size, batch_binding.batch_request_sha256)
            for receipt in batch_members
        ):
            _fail("the expected batch_key has inconsistent digest or size metadata")
        if len(batch_members) != batch_binding.batch_size:
            _fail("the complete expected batch is not present in the receipts response")
        ordered_members = sorted(batch_members, key=lambda receipt: receipt.solve_index)
        if [
            receipt.batch_position for receipt in ordered_members
        ] != expected_positions:
            _fail("the expected batch is not ordered and dense by solve_index")
        if {receipt.solve_index for receipt in batch_members} != set(selected_indexes):
            _fail("the selected receipts do not exhaust the complete expected batch")

        batch_audit = {
            "batch_key": batch_binding.batch_key,
            "batch_request_sha256": batch_binding.batch_request_sha256,
            "batch_size": batch_binding.batch_size,
            "positions": {
                "baseline": baseline_receipt.batch_position,
                "leave_one_out": {
                    statement_id: receipts[
                        selected_by_statement[statement_id]
                    ].batch_position
                    for statement_id in statement_ids
                },
            },
        }

    for receipt in selected_receipts:
        if receipt.conflict_limit != conflict_limit:
            _fail(
                "every selected receipt must use the expected deterministic conflict_limit"
            )
        if receipt.timeout_ms is not None:
            _fail("selected receipts must not use a wall-clock timeout")
        if (
            receipt.status is statement_bank.SolverVerdict.UNKNOWN
            and receipt.interrupted_by != "conflict_limit"
        ):
            _fail("selected UNKNOWN receipts must be interrupted by conflict_limit")

    base_identity = {
        (receipt.base_clauses, receipt.base_bytes, receipt.base_sha256)
        for receipt in selected_receipts
    }
    if len(base_identity) != 1:
        _fail("selected receipts disagree about the clause-journal base")
    base_clauses, base_bytes, base_sha256 = next(iter(base_identity))
    expected_clauses = plan.document["gated_cnf"]["clauses"]
    expected_journal = _render_journal(expected_clauses)
    expected_base_sha256 = hashlib.sha256(expected_journal).hexdigest()
    if base_clauses != len(expected_clauses):
        _fail("selected receipt base_clauses does not equal the plan clause count")
    if base_bytes != len(expected_journal):
        _fail("selected receipt base_bytes does not equal the rendered plan journal")
    if base_sha256 != expected_base_sha256:
        _fail("selected receipt base_sha256 does not equal the rendered plan journal")

    parsed_prefixes: dict[int, tuple[tuple[int, ...], ...]] = {}
    for receipt in receipts.values():
        if receipt.base_bytes > len(journal_snapshot.journal_bytes):
            _fail("a receipt base prefix exceeds the authenticated journal snapshot")
        receipt_prefix = journal_snapshot.journal_bytes[: receipt.base_bytes]
        if hashlib.sha256(receipt_prefix).hexdigest() != receipt.base_sha256:
            _fail("a receipt base_sha256 does not match its journal prefix")
        parsed = parsed_prefixes.get(receipt.base_bytes)
        if parsed is None:
            parsed = _parse_journal_prefix(receipt_prefix)
            parsed_prefixes[receipt.base_bytes] = parsed
        if len(parsed) != receipt.base_clauses:
            _fail("a receipt base_clauses does not match its journal prefix")

    prefix = journal_snapshot.journal_bytes[:base_bytes]
    if hashlib.sha256(prefix).hexdigest() != base_sha256:
        _fail("journal prefix SHA-256 does not equal the selected receipt")
    parsed_prefix = _parse_journal_prefix(prefix)
    if parsed_prefix != tuple(tuple(clause) for clause in expected_clauses):
        _fail("journal prefix clauses are not semantically equal to the selector plan")
    if prefix != expected_journal:
        _fail("journal prefix is not the exact PIQD rendering of the selector plan")

    verdict_inputs = statement_bank.AuthenticatedVerdictInputs(
        plan_sha256=plan.plan_sha256,
        baseline=baseline_receipt.status,
        leave_one_out=leave_one_out,
    )
    interpretation = statement_bank.interpret_authenticated_verdicts(
        plan, verdict_inputs
    )
    audit_body: dict[str, Any] = {
        "base": {
            "base_bytes": base_bytes,
            "base_clauses": base_clauses,
            "base_sha256": base_sha256,
        },
        "claims": {
            "daemon_attestation": False,
            "global_minimum": False,
            "incremental_unsat_proof": False,
            "observational_only": True,
            "solver_attestation": False,
            "source_entitlement": False,
            "theorem_closure": False,
        },
        "conflict_limit": conflict_limit,
        "journal_snapshot_sha256": journal_sha256,
        "plan_sha256": plan.plan_sha256,
        "result_sha256_policy": RESULT_SHA256_POLICY,
        "schema": ADAPTER_SCHEMA,
        "selection": {
            "baseline_solve_index": baseline_index,
            "statement_solve_indexes": selected_by_statement,
        },
        "selected_result_sha256": {
            "baseline": baseline_receipt.result_sha256,
            "leave_one_out": {
                statement_id: receipts[
                    selected_by_statement[statement_id]
                ].result_sha256
                for statement_id in statement_ids
            },
        },
        "session_id": session_id,
        "status": ADAPTER_STATUS,
    }
    if batch_audit is not None:
        audit_body["batch"] = batch_audit
    audit = {
        **audit_body,
        "adapter_sha256": statement_bank.sha256_json(audit_body),
    }
    return ReceiptAdapterResult(
        verdict_inputs=verdict_inputs,
        interpretation=interpretation,
        audit=audit,
    )

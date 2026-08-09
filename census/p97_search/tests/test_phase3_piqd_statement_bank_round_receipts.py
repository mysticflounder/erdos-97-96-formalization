from __future__ import annotations

import copy
import hashlib

import pytest

from census.p97_search import phase3_piqd_statement_bank as bank
from census.p97_search import phase3_piqd_statement_bank_minimality as minimality
from census.p97_search import phase3_piqd_statement_bank_receipts as legacy
from census.p97_search import phase3_piqd_statement_bank_round_receipts as adapter

SESSION_ID = "60d64e0a-828d-4cc4-ab8d-eeea25429dfc"
BATCH_KEY = "e038a1cd-0768-4d82-8277-88f84c156ba4"
LIMIT = 10_000


def _plan(*, base: list[list[int]] | None = None) -> bank.SelectorPlan:
    manifest = {
        "base_clauses": [[1]] if base is None else base,
        "schema": bank.MANIFEST_SCHEMA,
        "source_num_vars": 1,
        "statement_groups": [
            {"clauses": [[-1]], "statement_id": "A"},
            {"clauses": [[-1]], "statement_id": "B"},
        ],
    }
    parsed = bank.load_manifest_bytes(bank.canonical_json_bytes(manifest))
    return bank.build_selector_plan(parsed)


def _sat_plan() -> bank.SelectorPlan:
    manifest = {
        "base_clauses": [[1]],
        "schema": bank.MANIFEST_SCHEMA,
        "source_num_vars": 1,
        "statement_groups": [
            {"clauses": [[1]], "statement_id": "A"},
            {"clauses": [[1]], "statement_id": "B"},
        ],
    }
    parsed = bank.load_manifest_bytes(bank.canonical_json_bytes(manifest))
    return bank.build_selector_plan(parsed)


def _journal(plan: bank.SelectorPlan) -> bytes:
    return b"".join(
        (" ".join(str(literal) for literal in clause) + " 0\n").encode()
        for clause in plan.document["gated_cnf"]["clauses"]
    )


def _snapshot(plan: bank.SelectorPlan) -> legacy.AuthenticatedJournalSnapshot:
    payload = _journal(plan)
    return legacy.AuthenticatedJournalSnapshot(
        session_id=SESSION_ID,
        journal_bytes=payload,
        journal_sha256=hashlib.sha256(payload).hexdigest(),
    )


def _round(plan: bank.SelectorPlan) -> minimality.MinimalityRoundPlan:
    return minimality.build_initial_round(plan)


def _digest(round_plan: minimality.MinimalityRoundPlan) -> str:
    queries = round_plan.document["queries"]
    assumptions = [
        tuple(queries["baseline"]["assumptions"]),
        *(tuple(query["assumptions"]) for query in queries["leave_one_group_out"]),
    ]
    return adapter._batch_digest(assumptions, LIMIT, guard="UNSAT")


def _receipt(
    plan: bank.SelectorPlan,
    position: int,
    assumptions: list[int],
    status: str,
    digit: str,
    *,
    round_plan: minimality.MinimalityRoundPlan | None = None,
    batch_size: int = 3,
    solve_index: int | None = None,
) -> dict:
    journal = _journal(plan)
    round_plan = _round(plan) if round_plan is None else round_plan
    result = {
        "assumptions": assumptions,
        "at": 1_786_218_000 + position,
        "base_bytes": len(journal),
        "base_clauses": len(plan.document["gated_cnf"]["clauses"]),
        "base_sha256": hashlib.sha256(journal).hexdigest(),
        "batch_key": BATCH_KEY,
        "batch_position": position,
        "batch_request_sha256": _digest(round_plan),
        "batch_size": batch_size,
        "conflict_limit": LIMIT,
        "model_recorded": False,
        "result_sha256": digit * 64,
        "solve_index": position + 1 if solve_index is None else solve_index,
        "status": status,
    }
    if status == "UNSAT":
        result["core"] = [assumptions[0]]
    elif status == "UNKNOWN":
        result["interrupted_by"] = "conflict_limit"
    return result


def _batch_record(receipt: dict, *, terminal_unsat: bool | None = None) -> dict:
    record = {
        key: receipt[key]
        for key in (
            "batch_position",
            "solve_index",
            "status",
            "assumptions",
            "conflict_limit",
            "base_clauses",
            "base_bytes",
            "base_sha256",
            "result_sha256",
            "at",
        )
    }
    for key in ("interrupted_by", "core"):
        if key in receipt:
            record[key] = receipt[key]
    if terminal_unsat is not None:
        record["terminal_unsat"] = terminal_unsat
    return record


def _fixtures(
    plan: bank.SelectorPlan | None = None,
    statuses: tuple[str, ...] = ("UNSAT", "SAT", "UNSAT"),
    round_plan: minimality.MinimalityRoundPlan | None = None,
) -> tuple[
    bank.SelectorPlan,
    minimality.MinimalityRoundPlan,
    dict,
    dict,
    legacy.AuthenticatedJournalSnapshot,
]:
    plan = _plan() if plan is None else plan
    round_plan = _round(plan) if round_plan is None else round_plan
    queries = round_plan.document["queries"]
    assumptions = [
        queries["baseline"]["assumptions"],
        *(query["assumptions"] for query in queries["leave_one_group_out"]),
    ]
    durable = [
        _receipt(
            plan,
            index,
            values,
            statuses[index],
            str(index + 1),
            round_plan=round_plan,
            batch_size=len(assumptions),
        )
        for index, values in enumerate(assumptions)
    ]
    response = {
        "session_id": SESSION_ID,
        "batch_key": BATCH_KEY,
        "batch_size": len(assumptions),
        "batch_request_sha256": _digest(round_plan),
        "replayed": False,
        "executed": len(assumptions),
        "stopped_by_guard": False,
        "complete": True,
        "records": [
            _batch_record(
                receipt,
                terminal_unsat=(
                    receipt["status"] == "UNSAT" and receipt.get("core") == []
                ),
            )
            for receipt in durable
        ],
    }
    receipts_response = {
        "count": len(durable),
        "journal_path": f"/authenticated/sessions/{SESSION_ID}/journal.cnf",
        "receipts": durable,
        "receipts_path": f"/authenticated/sessions/{SESSION_ID}/receipts.jsonl",
        "session_id": SESSION_ID,
    }
    return plan, round_plan, response, receipts_response, _snapshot(plan)


def test_dense_batch_maps_to_typed_round_evidence_and_retains_receipts() -> None:
    plan, round_plan, batch, durable, snapshot = _fixtures()
    result = adapter.adapt_authenticated_minimality_round_receipts(
        plan, round_plan, batch, durable, snapshot
    )
    assert isinstance(result, adapter.AuthenticatedCompleteRound)
    assert result.status == "COMPLETE"
    assert result.authenticated_verdicts.plan_sha256 == plan.plan_sha256
    assert result.authenticated_verdicts.round_sha256 == round_plan.round_sha256
    assert [
        item.statement_id for item in result.authenticated_verdicts.leave_one_group_out
    ] == ["A", "B"]
    assert [
        item.assumptions for item in result.authenticated_verdicts.leave_one_group_out
    ] == [(-2, 3), (2, -3)]
    assert [item.solve_index for item in result.receipts] == [1, 2, 3]
    assert all(
        not item.model_recorded and item.timeout_ms is None for item in result.receipts
    )
    assert all(item.batch_key == BATCH_KEY for item in result.receipts)
    interpreted = minimality.interpret_complete_round(
        plan, round_plan, result.authenticated_verdicts
    )
    assert interpreted.document["status"] == minimality.DELETE_AND_CONTINUE


def test_duplicate_two_round_mapping_keeps_first_redundant_group() -> None:
    plan, first_round, batch, durable, snapshot = _fixtures(
        statuses=("UNSAT", "UNSAT", "SAT")
    )
    first_evidence = adapter.adapt_authenticated_round_receipts(
        plan, first_round, batch, durable, snapshot
    )
    assert isinstance(first_evidence, adapter.AuthenticatedCompleteRound)
    first_result = minimality.interpret_complete_round(
        plan, first_round, first_evidence.authenticated_verdicts
    )
    assert first_result.document["deleted_statement_id"] == "A"

    second_round = minimality.build_next_round(plan, first_round, first_result)
    assert (
        second_round.document["queries"]["leave_one_group_out"][0]["statement_id"]
        == "B"
    )


@pytest.mark.parametrize("baseline_status", ["SAT", "UNKNOWN"])
def test_guard_stopped_baseline_is_distinct_and_never_interpreted(
    baseline_status: str,
) -> None:
    plan = _sat_plan()
    round_plan = _round(plan)
    _, _, _, durable, snapshot = _fixtures(
        plan=plan, statuses=(baseline_status, "SAT", "SAT")
    )
    baseline = durable["receipts"][0]
    durable = {**durable, "count": 1, "receipts": [baseline]}
    batch = {
        "session_id": SESSION_ID,
        "batch_key": BATCH_KEY,
        "batch_size": 3,
        "batch_request_sha256": _digest(round_plan),
        "replayed": False,
        "executed": 1,
        "stopped_by_guard": True,
        "complete": True,
        "records": [_batch_record(baseline)],
    }
    result = adapter.adapt_authenticated_round_receipts(
        plan, round_plan, batch, durable, snapshot
    )
    assert isinstance(result, adapter.AuthenticatedGuardedBaseline)
    assert result.status == minimality.INCONCLUSIVE
    assert result.baseline.verdict.value == baseline_status
    assert result.receipt.batch_position == 0


def test_empty_active_set_is_a_dense_one_query_round() -> None:
    manifest = {
        "base_clauses": [[1]],
        "schema": bank.MANIFEST_SCHEMA,
        "source_num_vars": 1,
        "statement_groups": [{"clauses": [[1]], "statement_id": "A"}],
    }
    plan = bank.build_selector_plan(
        bank.load_manifest_bytes(bank.canonical_json_bytes(manifest))
    )
    first_round = _round(plan)
    _, _, first_batch, first_durable, snapshot = _fixtures(
        plan=plan, round_plan=first_round, statuses=("UNSAT", "UNSAT")
    )
    first_evidence = adapter.adapt_authenticated_round_receipts(
        plan, first_round, first_batch, first_durable, snapshot
    )
    first_result = minimality.interpret_complete_round(
        plan, first_round, first_evidence.authenticated_verdicts
    )
    empty_round = minimality.build_next_round(plan, first_round, first_result)
    _, _, batch, durable, snapshot = _fixtures(
        plan=plan,
        round_plan=empty_round,
        statuses=("SAT",),
    )
    result = adapter.adapt_authenticated_round_receipts(
        plan, empty_round, batch, durable, snapshot
    )
    assert isinstance(result, adapter.AuthenticatedCompleteRound)
    interpreted = minimality.interpret_complete_round(
        plan, empty_round, result.authenticated_verdicts
    )
    assert interpreted.document["status"] == minimality.INCONCLUSIVE


@pytest.mark.parametrize(
    "mutator, message",
    [
        (
            lambda batch, durable: batch["complete"] and batch["records"].pop(),
            "executed",
        ),
        (
            lambda batch, durable: batch["records"].__setitem__(1, batch["records"][2]),
            "dense positions",
        ),
        (
            lambda batch, durable: batch["records"][0].__setitem__("solve_index", 99),
            "increasing solve",
        ),
        (
            lambda batch, durable: durable["receipts"][1].__setitem__(
                "assumptions", [2, -3]
            ),
            "query or status",
        ),
    ],
)
def test_rejects_partial_reordered_or_inconsistent_evidence(
    mutator, message: str
) -> None:
    plan, round_plan, batch, durable, snapshot = _fixtures()
    batch = copy.deepcopy(batch)
    durable = copy.deepcopy(durable)
    mutator(batch, durable)
    with pytest.raises(adapter.StatementBankRoundReceiptError, match=message):
        adapter.adapt_authenticated_round_receipts(
            plan, round_plan, batch, durable, snapshot
        )


def test_rejects_guard_after_unsat_and_subclass_plan_spoof() -> None:
    plan, round_plan, batch, durable, snapshot = _fixtures()
    batch["stopped_by_guard"] = True
    with pytest.raises(
        adapter.StatementBankRoundReceiptError, match="complete minimality"
    ):
        adapter.adapt_authenticated_round_receipts(
            plan, round_plan, batch, durable, snapshot
        )

    class ForgedPlan(bank.SelectorPlan):
        @property
        def plan_sha256(self) -> str:
            return "f" * 64

    forged = ForgedPlan(document=plan.document, dimacs_bytes=plan.dimacs_bytes)
    with pytest.raises(
        adapter.StatementBankRoundReceiptError, match="exact SelectorPlan"
    ):
        adapter.adapt_authenticated_round_receipts(
            forged, round_plan, batch, durable, snapshot
        )

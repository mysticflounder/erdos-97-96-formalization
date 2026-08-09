from __future__ import annotations

import hashlib
from dataclasses import replace

import pytest

from census.p97_search import phase3_piqd_statement_bank as bank
from census.p97_search import phase3_piqd_statement_bank_receipts as adapter

SESSION_ID = "60d64e0a-828d-4cc4-ab8d-eeea25429dfc"
BATCH_KEY = "e038a1cd-0768-4d82-8277-88f84c156ba4"
BATCH_REQUEST_SHA256 = "a" * 64
CONFLICT_LIMIT = 10_000


def _plan() -> bank.SelectorPlan:
    manifest = {
        "base_clauses": [[1]],
        "schema": bank.MANIFEST_SCHEMA,
        "source_num_vars": 1,
        "statement_groups": [
            {"clauses": [[-1]], "statement_id": "A"},
            {"clauses": [[1]], "statement_id": "B"},
        ],
    }
    parsed = bank.load_manifest_bytes(bank.canonical_json_bytes(manifest))
    return bank.build_selector_plan(parsed)


def _journal_bytes() -> bytes:
    # PIQD journals the DIMACS body only: base [1], gated A [-2,-1], gated B [-3,1].
    return b"1 0\n-2 -1 0\n-3 1 0\n"


def _snapshot(payload: bytes | None = None) -> adapter.AuthenticatedJournalSnapshot:
    payload = _journal_bytes() if payload is None else payload
    return adapter.AuthenticatedJournalSnapshot(
        session_id=SESSION_ID,
        journal_bytes=payload,
        journal_sha256=hashlib.sha256(payload).hexdigest(),
    )


def _receipt(
    solve_index: int,
    assumptions: list[int],
    status: str,
    result_digit: str,
) -> dict:
    journal = _journal_bytes()
    result = {
        "assumptions": assumptions,
        "at": 1_786_218_000 + solve_index,
        "base_bytes": len(journal),
        "base_clauses": 3,
        "base_sha256": hashlib.sha256(journal).hexdigest(),
        "conflict_limit": CONFLICT_LIMIT,
        "model_recorded": False,
        "result_sha256": result_digit * 64,
        "solve_index": solve_index,
        "status": status,
    }
    if status == "UNSAT":
        result["core"] = [2]
    return result


def _response() -> dict:
    return {
        "count": 3,
        "journal_path": f"/authenticated/sessions/{SESSION_ID}/journal.cnf",
        "receipts": [
            _receipt(1, [2, 3], "UNSAT", "1"),
            _receipt(2, [-2, 3], "SAT", "2"),
            _receipt(3, [2, -3], "UNSAT", "3"),
        ],
        "receipts_path": f"/authenticated/sessions/{SESSION_ID}/receipts.jsonl",
        "session_id": SESSION_ID,
    }


def _batch_response() -> dict:
    response = _response()
    for position, receipt in enumerate(response["receipts"]):
        receipt.update(
            {
                "batch_key": BATCH_KEY,
                "batch_position": position,
                "batch_request_sha256": BATCH_REQUEST_SHA256,
                "batch_size": 3,
            }
        )
    return response


def _batch_binding(
    *,
    batch_key: str = BATCH_KEY,
    batch_size: int = 3,
    batch_request_sha256: str = BATCH_REQUEST_SHA256,
) -> adapter.AuthenticatedBatchBinding:
    return adapter.AuthenticatedBatchBinding(
        batch_key=batch_key,
        batch_size=batch_size,
        batch_request_sha256=batch_request_sha256,
    )


def _adapt(
    *,
    plan: bank.SelectorPlan | None = None,
    response: object | None = None,
    snapshot: adapter.AuthenticatedJournalSnapshot | None = None,
    baseline_solve_index: int = 1,
    statement_solve_indexes: dict[str, int] | None = None,
    conflict_limit: int = CONFLICT_LIMIT,
    expected_batch_binding: adapter.AuthenticatedBatchBinding | None = None,
) -> adapter.ReceiptAdapterResult:
    return adapter.adapt_authenticated_piqd_receipts(
        _plan() if plan is None else plan,
        _response() if response is None else response,
        _snapshot() if snapshot is None else snapshot,
        baseline_solve_index=baseline_solve_index,
        statement_solve_indexes=(
            {"A": 2, "B": 3}
            if statement_solve_indexes is None
            else statement_solve_indexes
        ),
        expected_conflict_limit=conflict_limit,
        expected_batch_binding=expected_batch_binding,
    )


def test_live_shape_is_bound_and_interpreted_only_relative_to_supplied_bank() -> None:
    plan = _plan()
    assert plan.document["gated_cnf"]["clauses"] == [[1], [-2, -1], [-3, 1]]
    assert len(_journal_bytes()) == 19

    result = _adapt(plan=plan)

    assert result.verdict_inputs == bank.AuthenticatedVerdictInputs(
        plan_sha256=plan.plan_sha256,
        baseline=bank.SolverVerdict.UNSAT,
        leave_one_out={
            "A": bank.SolverVerdict.SAT,
            "B": bank.SolverVerdict.UNSAT,
        },
    )
    assert [
        (group["statement_id"], group["label"])
        for group in result.interpretation["groups"]
    ] == [
        ("A", bank.ESSENTIAL),
        ("B", bank.REDUNDANT),
    ]
    assert result.audit["claims"] == {
        "daemon_attestation": False,
        "global_minimum": False,
        "incremental_unsat_proof": False,
        "observational_only": True,
        "solver_attestation": False,
        "source_entitlement": False,
        "theorem_closure": False,
    }
    assert result.audit["result_sha256_policy"] == adapter.RESULT_SHA256_POLICY
    body = {
        key: value for key, value in result.audit.items() if key != "adapter_sha256"
    }
    assert result.audit["adapter_sha256"] == bank.sha256_json(body)


def test_complete_authenticated_batch_is_bound_into_audit() -> None:
    result = _adapt(response=_batch_response(), expected_batch_binding=_batch_binding())

    assert result.audit["batch"] == {
        "batch_key": BATCH_KEY,
        "batch_request_sha256": BATCH_REQUEST_SHA256,
        "batch_size": 3,
        "positions": {
            "baseline": 0,
            "leave_one_out": {"A": 1, "B": 2},
        },
    }
    body = {
        key: value for key, value in result.audit.items() if key != "adapter_sha256"
    }
    assert result.audit["adapter_sha256"] == bank.sha256_json(body)


def test_batch_receipts_require_explicit_authenticated_binding() -> None:
    with pytest.raises(
        adapter.StatementBankReceiptError, match="authenticated expected batch binding"
    ):
        _adapt(response=_batch_response())


@pytest.mark.parametrize(
    "missing_key",
    ["batch_key", "batch_position", "batch_request_sha256", "batch_size"],
)
def test_batch_receipt_requires_all_four_fields(missing_key: str) -> None:
    response = _batch_response()
    del response["receipts"][0][missing_key]
    with pytest.raises(adapter.StatementBankReceiptError, match="all batch fields"):
        _adapt(response=response, expected_batch_binding=_batch_binding())


def test_batch_receipt_still_rejects_unknown_extra_field() -> None:
    response = _batch_response()
    response["receipts"][0]["batch_extra"] = 0
    with pytest.raises(adapter.StatementBankReceiptError, match="missing or extra"):
        _adapt(response=response, expected_batch_binding=_batch_binding())


@pytest.mark.parametrize(
    ("field", "value", "message"),
    [
        ("batch_key", "E038A1CD-0768-4D82-8277-88F84C156BA4", "canonical UUID"),
        ("batch_key", None, "canonical UUID"),
        ("batch_position", True, "must be an integer"),
        ("batch_position", 1.0, "must be an integer"),
        ("batch_position", -1, "must be an integer"),
        ("batch_position", 4096, "must be an integer"),
        ("batch_position", 3, "less than batch_size"),
        ("batch_size", True, "must be an integer"),
        ("batch_size", 3.0, "must be an integer"),
        ("batch_size", 0, "must be an integer"),
        ("batch_size", 4097, "must be an integer"),
        ("batch_request_sha256", "A" * 64, "lowercase 64-hex"),
        ("batch_request_sha256", None, "lowercase 64-hex"),
    ],
)
def test_rejects_malformed_batch_receipt_fields(
    field: str, value: object, message: str
) -> None:
    response = _batch_response()
    response["receipts"][0][field] = value
    with pytest.raises(adapter.StatementBankReceiptError, match=message):
        _adapt(response=response, expected_batch_binding=_batch_binding())


@pytest.mark.parametrize(
    ("binding", "message"),
    [
        (
            _batch_binding(batch_key="4d077863-e96c-4988-8f65-5b4bb38a0b76"),
            "expected batch binding",
        ),
        (_batch_binding(batch_size=2), "complete selected query count"),
        (
            _batch_binding(batch_request_sha256="b" * 64),
            "expected batch binding",
        ),
    ],
)
def test_rejects_wrong_expected_batch_binding(
    binding: adapter.AuthenticatedBatchBinding, message: str
) -> None:
    with pytest.raises(adapter.StatementBankReceiptError, match=message):
        _adapt(response=_batch_response(), expected_batch_binding=binding)


def test_revalidates_expected_batch_binding_fields() -> None:
    with pytest.raises(adapter.StatementBankReceiptError, match="in-memory type"):
        _adapt(response=_batch_response(), expected_batch_binding=True)  # type: ignore[arg-type]
    with pytest.raises(adapter.StatementBankReceiptError, match="canonical UUID"):
        _adapt(
            response=_batch_response(),
            expected_batch_binding=_batch_binding(batch_key=BATCH_KEY.upper()),
        )
    with pytest.raises(adapter.StatementBankReceiptError, match="must be an integer"):
        _adapt(
            response=_batch_response(),
            expected_batch_binding=_batch_binding(batch_size=True),
        )
    with pytest.raises(adapter.StatementBankReceiptError, match="must be an integer"):
        _adapt(
            response=_batch_response(),
            expected_batch_binding=_batch_binding(batch_size=4097),
        )
    with pytest.raises(adapter.StatementBankReceiptError, match="lowercase 64-hex"):
        _adapt(
            response=_batch_response(),
            expected_batch_binding=_batch_binding(batch_request_sha256="A" * 64),
        )


def test_rejects_mixed_selected_batch_and_nonbatch_receipts() -> None:
    response = _batch_response()
    for key in (
        "batch_key",
        "batch_position",
        "batch_request_sha256",
        "batch_size",
    ):
        del response["receipts"][1][key]
    with pytest.raises(adapter.StatementBankReceiptError, match="must not mix"):
        _adapt(response=response, expected_batch_binding=_batch_binding())

    with pytest.raises(adapter.StatementBankReceiptError, match="must not mix"):
        _adapt(response=_response(), expected_batch_binding=_batch_binding())


@pytest.mark.parametrize("positions", [[0, 1, 1], [0, 2, 1], [1, 0, 2]])
def test_rejects_duplicate_gapped_or_reordered_batch_positions(
    positions: list[int],
) -> None:
    response = _batch_response()
    for receipt, position in zip(response["receipts"], positions, strict=True):
        receipt["batch_position"] = position
    with pytest.raises(adapter.StatementBankReceiptError, match="ordered and dense"):
        _adapt(response=response, expected_batch_binding=_batch_binding())


def test_rejects_incomplete_batch_prefix_before_interpretation() -> None:
    response = _batch_response()
    for receipt in response["receipts"]:
        receipt["batch_size"] = 4
    with pytest.raises(
        adapter.StatementBankReceiptError, match="complete selected query count"
    ):
        _adapt(
            response=response,
            expected_batch_binding=_batch_binding(batch_size=4),
        )


def test_rejects_truncated_batch_response_before_interpretation() -> None:
    response = _batch_response()
    response["receipts"].pop()
    response["count"] = 2
    with pytest.raises(adapter.StatementBankReceiptError, match="absent"):
        _adapt(response=response, expected_batch_binding=_batch_binding())


def test_rejects_additional_member_of_expected_batch() -> None:
    response = _batch_response()
    extra = _receipt(4, [], "SAT", "4")
    extra.update(
        {
            "batch_key": BATCH_KEY,
            "batch_position": 2,
            "batch_request_sha256": BATCH_REQUEST_SHA256,
            "batch_size": 3,
        }
    )
    response["receipts"].append(extra)
    response["count"] = 4
    with pytest.raises(
        adapter.StatementBankReceiptError, match="complete expected batch"
    ):
        _adapt(response=response, expected_batch_binding=_batch_binding())


def test_rejects_extra_or_inconsistent_receipt_reusing_expected_batch_key() -> None:
    response = _batch_response()
    extra = _receipt(4, [], "SAT", "4")
    extra.update(
        {
            "batch_key": BATCH_KEY,
            "batch_position": 3,
            "batch_request_sha256": BATCH_REQUEST_SHA256,
            "batch_size": 4,
        }
    )
    response["receipts"].append(extra)
    response["count"] = 4
    with pytest.raises(adapter.StatementBankReceiptError, match="inconsistent"):
        _adapt(response=response, expected_batch_binding=_batch_binding())


def test_batch_requires_positive_limit_and_omitted_models() -> None:
    response = _batch_response()
    for receipt in response["receipts"]:
        receipt["conflict_limit"] = 0
    with pytest.raises(
        adapter.StatementBankReceiptError, match="positive conflict_limit"
    ):
        _adapt(
            response=response,
            conflict_limit=0,
            expected_batch_binding=_batch_binding(),
        )

    response = _batch_response()
    response["receipts"][1]["model_recorded"] = True
    with pytest.raises(adapter.StatementBankReceiptError, match="model_recorded false"):
        _adapt(response=response, expected_batch_binding=_batch_binding())


def test_batch_rejects_wall_clock_timeout() -> None:
    response = _batch_response()
    response["receipts"][1]["timeout_ms"] = 1
    with pytest.raises(adapter.StatementBankReceiptError, match="wall-clock timeout"):
        _adapt(response=response, expected_batch_binding=_batch_binding())


@pytest.mark.parametrize("interrupted_by", ["cancel", "timeout"])
def test_batch_rejects_nondeterministic_unknown_cutoff(interrupted_by: str) -> None:
    response = _batch_response()
    baseline = response["receipts"][0]
    baseline["status"] = "UNKNOWN"
    del baseline["core"]
    baseline["interrupted_by"] = interrupted_by
    with pytest.raises(adapter.StatementBankReceiptError, match="conflict_limit"):
        _adapt(response=response, expected_batch_binding=_batch_binding())


def test_nonbatch_audit_shape_remains_unchanged() -> None:
    result = _adapt()
    assert "batch" not in result.audit
    assert (
        result.audit["adapter_sha256"]
        == "160f22c47e02493d335254bcc5cc04bd18bbd345974d6a2e0a2ba51fb80d6686"
    )

    response = _response()
    for receipt in response["receipts"]:
        receipt["conflict_limit"] = 0
    response["receipts"][1]["model_recorded"] = True
    legacy = _adapt(response=response, conflict_limit=0)
    assert "batch" not in legacy.audit


@pytest.mark.parametrize(
    "key", ["count", "journal_path", "receipts_path", "session_id"]
)
def test_rejects_missing_top_level_key(key: str) -> None:
    response = _response()
    del response[key]
    with pytest.raises(adapter.StatementBankReceiptError, match="top-level keys"):
        _adapt(response=response)


def test_rejects_extra_top_level_key_and_bad_count_or_session() -> None:
    response = _response()
    response["extra"] = False
    with pytest.raises(adapter.StatementBankReceiptError, match="top-level keys"):
        _adapt(response=response)

    response = _response()
    response["count"] = 2
    with pytest.raises(adapter.StatementBankReceiptError, match="count does not match"):
        _adapt(response=response)

    response = _response()
    response["session_id"] = "ee7aa6fe-a6dc-4d94-ac11-c3d14a47e30d"
    with pytest.raises(adapter.StatementBankReceiptError, match="different session"):
        _adapt(response=response)


@pytest.mark.parametrize("value", [True, 3.0, "3", None])
def test_rejects_non_integer_response_count(value: object) -> None:
    response = _response()
    response["count"] = value
    with pytest.raises(
        adapter.StatementBankReceiptError, match="count must be an integer"
    ):
        _adapt(response=response)


def test_rejects_noncanonical_session_and_path_metadata() -> None:
    with pytest.raises(adapter.StatementBankReceiptError, match="canonical UUID"):
        _adapt(
            snapshot=replace(
                _snapshot(), session_id="60D64E0A-828D-4CC4-AB8D-EEEA25429DFC"
            )
        )

    response = _response()
    response["journal_path"] = ""
    with pytest.raises(adapter.StatementBankReceiptError, match="journal_path"):
        _adapt(response=response)


def test_rejects_duplicate_out_of_order_or_non_dense_solve_indexes() -> None:
    for indexes in ([1, 1, 3], [1, 3, 2], [2, 3, 4]):
        response = _response()
        for receipt, solve_index in zip(response["receipts"], indexes, strict=True):
            receipt["solve_index"] = solve_index
        with pytest.raises(
            adapter.StatementBankReceiptError, match="unique, ordered, and dense"
        ):
            _adapt(response=response)


@pytest.mark.parametrize(
    ("field", "value", "message"),
    [
        ("solve_index", True, "solve_index must be an integer"),
        ("base_clauses", 3.0, "base_clauses must be an integer"),
        ("base_bytes", -1, "base_bytes must be an integer"),
        ("base_sha256", "A" * 64, "lowercase 64-hex"),
        ("assumptions", "2 3", "literal array"),
        ("status", "TIMEOUT", "SAT, UNSAT, or UNKNOWN"),
        ("model_recorded", 0, "must be a Boolean"),
        ("result_sha256", "not-a-digest", "lowercase 64-hex"),
        ("at", 1.5, "at must be an integer"),
    ],
)
def test_rejects_malformed_required_receipt_fields(
    field: str, value: object, message: str
) -> None:
    response = _response()
    response["receipts"][0][field] = value
    with pytest.raises(adapter.StatementBankReceiptError, match=message):
        _adapt(response=response)


def test_rejects_missing_or_extra_receipt_fields() -> None:
    response = _response()
    del response["receipts"][0]["at"]
    with pytest.raises(adapter.StatementBankReceiptError, match="missing or extra"):
        _adapt(response=response)

    response = _response()
    response["receipts"][0]["unexpected"] = None
    with pytest.raises(adapter.StatementBankReceiptError, match="missing or extra"):
        _adapt(response=response)


@pytest.mark.parametrize(
    ("assumptions", "message"),
    [
        ([3, 2], "not canonical"),
        ([2, 2, 3], "not canonical"),
        ([2, -2, 3], "contradictory"),
        ([0, 2, 3], "contains zero"),
        ([2, 3.0], "must be an integer"),
    ],
)
def test_rejects_noncanonical_receipt_assumptions(
    assumptions: list[object], message: str
) -> None:
    response = _response()
    response["receipts"][0]["assumptions"] = assumptions
    with pytest.raises(adapter.StatementBankReceiptError, match=message):
        _adapt(response=response)


@pytest.mark.parametrize(
    ("key", "value", "message"),
    [
        ("conflict_limit", None, "conflict_limit must be an integer"),
        ("timeout_ms", None, "timeout_ms must be an integer"),
        ("interrupted_by", None, "PIQD cutoff value"),
        ("core", None, "literal array"),
    ],
)
def test_rejects_malformed_optional_receipt_fields(
    key: str, value: object, message: str
) -> None:
    response = _response()
    response["receipts"][0][key] = value
    with pytest.raises(adapter.StatementBankReceiptError, match=message):
        _adapt(response=response)


def test_rejects_receipt_status_field_incoherence() -> None:
    response = _response()
    response["receipts"][0]["status"] = True
    with pytest.raises(
        adapter.StatementBankReceiptError, match="SAT, UNSAT, or UNKNOWN"
    ):
        _adapt(response=response)

    response = _response()
    del response["receipts"][0]["core"]
    with pytest.raises(adapter.StatementBankReceiptError, match="required for UNSAT"):
        _adapt(response=response)

    response = _response()
    response["receipts"][1]["core"] = []
    with pytest.raises(
        adapter.StatementBankReceiptError, match="allowed only for UNSAT"
    ):
        _adapt(response=response)

    response = _response()
    response["receipts"][0]["model_recorded"] = True
    with pytest.raises(adapter.StatementBankReceiptError, match="non-SAT"):
        _adapt(response=response)

    response = _response()
    response["receipts"][0]["interrupted_by"] = "conflict_limit"
    with pytest.raises(adapter.StatementBankReceiptError, match="only for UNKNOWN"):
        _adapt(response=response)


def test_rejects_core_not_canonical_or_not_a_subset_of_assumptions() -> None:
    response = _response()
    response["receipts"][0]["core"] = [3, 2]
    with pytest.raises(adapter.StatementBankReceiptError, match="not canonical"):
        _adapt(response=response)

    response = _response()
    response["receipts"][0]["core"] = [1]
    with pytest.raises(adapter.StatementBankReceiptError, match="subset"):
        _adapt(response=response)


def test_requires_exact_complete_noncontradictory_selection_bindings() -> None:
    for selection in ({"A": 2}, {"A": 2, "B": 3, "C": 4}):
        with pytest.raises(adapter.StatementBankReceiptError, match="exactly"):
            _adapt(statement_solve_indexes=selection)

    with pytest.raises(adapter.StatementBankReceiptError, match="pairwise distinct"):
        _adapt(statement_solve_indexes={"A": 1, "B": 3})
    with pytest.raises(adapter.StatementBankReceiptError, match="pairwise distinct"):
        _adapt(statement_solve_indexes={"A": 2, "B": 2})
    with pytest.raises(adapter.StatementBankReceiptError, match="absent"):
        _adapt(statement_solve_indexes={"A": 2, "B": 4})


def test_requires_exact_plan_query_assumptions_for_each_binding() -> None:
    response = _response()
    response["receipts"][1]["assumptions"] = [2, -3]
    response["receipts"][2]["assumptions"] = [-2, 3]
    response["receipts"][2]["core"] = [-2]
    with pytest.raises(adapter.StatementBankReceiptError, match="query for A"):
        _adapt(response=response)

    response = _response()
    response["receipts"][0]["assumptions"] = [-2, 3]
    response["receipts"][0]["core"] = [-2]
    with pytest.raises(adapter.StatementBankReceiptError, match="baseline receipt"):
        _adapt(response=response)


def test_requires_same_exact_deterministic_budget_and_no_wall_timeout() -> None:
    response = _response()
    response["receipts"][2]["conflict_limit"] = CONFLICT_LIMIT - 1
    with pytest.raises(
        adapter.StatementBankReceiptError, match="expected deterministic"
    ):
        _adapt(response=response)

    response = _response()
    response["receipts"][1]["timeout_ms"] = 1
    with pytest.raises(adapter.StatementBankReceiptError, match="wall-clock timeout"):
        _adapt(response=response)

    with pytest.raises(
        adapter.StatementBankReceiptError, match="expected_conflict_limit"
    ):
        _adapt(conflict_limit=-1)


def test_rejects_disagreement_or_mismatch_in_selected_base_identity() -> None:
    for field, value, message in (
        ("base_clauses", 2, "disagree"),
        ("base_bytes", 18, "disagree"),
        ("base_sha256", "a" * 64, "disagree"),
    ):
        response = _response()
        response["receipts"][2][field] = value
        with pytest.raises(adapter.StatementBankReceiptError, match=message):
            _adapt(response=response)

    response = _response()
    for receipt in response["receipts"]:
        receipt["base_clauses"] = 4
    with pytest.raises(adapter.StatementBankReceiptError, match="plan clause count"):
        _adapt(response=response)


def test_rederives_snapshot_and_prefix_hashes_and_exact_journal_bytes() -> None:
    snapshot = replace(_snapshot(), journal_sha256="f" * 64)
    with pytest.raises(
        adapter.StatementBankReceiptError, match="does not match its bytes"
    ):
        _adapt(snapshot=snapshot)

    tampered = bytearray(_journal_bytes())
    tampered[0] = ord("2")
    with pytest.raises(adapter.StatementBankReceiptError, match="base_sha256"):
        _adapt(snapshot=_snapshot(bytes(tampered)))

    short = _journal_bytes()[:-1]
    with pytest.raises(adapter.StatementBankReceiptError, match="exceeds"):
        _adapt(snapshot=_snapshot(short))


def test_rejects_semantically_equal_but_differently_rendered_journal() -> None:
    alternate = b"1 0\n-2  -1 0\n-3 1 0\n"
    response = _response()
    for receipt in response["receipts"]:
        receipt["base_bytes"] = len(alternate)
        receipt["base_sha256"] = hashlib.sha256(alternate).hexdigest()
    with pytest.raises(adapter.StatementBankReceiptError, match="base_bytes"):
        _adapt(response=response, snapshot=_snapshot(alternate))


def test_journal_snapshot_may_include_authenticated_suffix_after_selected_prefix() -> (
    None
):
    suffix = b"4 0\n"
    result = _adapt(snapshot=_snapshot(_journal_bytes() + suffix))
    assert result.audit["base"]["base_bytes"] == len(_journal_bytes())


def test_result_sha256_is_validated_as_opaque_and_not_recomputed() -> None:
    response = _response()
    response["receipts"][0]["result_sha256"] = "d" * 64
    result = _adapt(response=response)
    assert result.audit["selected_result_sha256"]["baseline"] == "d" * 64


def test_unknown_is_accepted_but_interpreted_inconclusively() -> None:
    response = _response()
    receipt = response["receipts"][1]
    receipt["status"] = "UNKNOWN"
    receipt["interrupted_by"] = "conflict_limit"
    result = _adapt(response=response)
    assert result.interpretation["groups"][0]["label"] == bank.INCONCLUSIVE


def test_selected_unknown_requires_deterministic_conflict_limit_interruption() -> None:
    for interrupted_by in (None, "cancel", "timeout"):
        response = _response()
        receipt = response["receipts"][1]
        receipt["status"] = "UNKNOWN"
        if interrupted_by is not None:
            receipt["interrupted_by"] = interrupted_by
        with pytest.raises(adapter.StatementBankReceiptError, match="conflict_limit"):
            _adapt(response=response)


def test_unselected_receipts_are_still_schema_checked_but_need_not_share_base() -> None:
    response = _response()
    extra = _receipt(4, [], "SAT", "4")
    journal = _journal_bytes() + b"4 0\n"
    extra["base_clauses"] = 4
    extra["base_bytes"] = len(journal)
    extra["base_sha256"] = hashlib.sha256(journal).hexdigest()
    response["receipts"].append(extra)
    response["count"] = 4
    result = _adapt(response=response, snapshot=_snapshot(journal))
    assert result.audit["selection"]["statement_solve_indexes"] == {"A": 2, "B": 3}

    response["receipts"][3]["assumptions"] = [1, 1]
    with pytest.raises(adapter.StatementBankReceiptError, match="not canonical"):
        _adapt(response=response, snapshot=_snapshot(journal))

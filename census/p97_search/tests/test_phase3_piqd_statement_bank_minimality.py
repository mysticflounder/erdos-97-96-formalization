from __future__ import annotations

import copy
import itertools
from dataclasses import replace

import pytest

from census.p97_search import phase3_piqd_statement_bank as bank
from census.p97_search import phase3_piqd_statement_bank_minimality as minimality


def _plan(
    *,
    base_clauses: list[list[int]] | None = None,
    groups: list[tuple[str, list[list[int]]]] | None = None,
    source_num_vars: int = 1,
) -> bank.SelectorPlan:
    manifest = {
        "base_clauses": [[1]] if base_clauses is None else base_clauses,
        "schema": bank.MANIFEST_SCHEMA,
        "source_num_vars": source_num_vars,
        "statement_groups": [
            {"clauses": clauses, "statement_id": statement_id}
            for statement_id, clauses in (
                [("A", [[-1]]), ("B", [[-1]])] if groups is None else groups
            )
        ],
    }
    parsed = bank.load_manifest_bytes(bank.canonical_json_bytes(manifest))
    return bank.build_selector_plan(parsed)


def _satisfies_clause(clause: list[int], assignment: tuple[bool, ...]) -> bool:
    return any(assignment[abs(literal) - 1] == (literal > 0) for literal in clause)


def _brute_verdict(
    num_vars: int, clauses: list[list[int]], assumptions: list[int]
) -> bank.SolverVerdict:
    augmented = [*clauses, *[[literal] for literal in assumptions]]
    for assignment in itertools.product((False, True), repeat=num_vars):
        if all(_satisfies_clause(clause, assignment) for clause in augmented):
            return bank.SolverVerdict.SAT
    return bank.SolverVerdict.UNSAT


def _authenticated(
    plan: bank.SelectorPlan,
    round_plan: minimality.MinimalityRoundPlan,
    *,
    baseline: bank.SolverVerdict,
    omissions: tuple[bank.SolverVerdict, ...],
) -> minimality.AuthenticatedCompleteRoundVerdicts:
    queries = round_plan.document["queries"]
    omission_queries = queries["leave_one_group_out"]
    assert len(omissions) == len(omission_queries)
    return minimality.AuthenticatedCompleteRoundVerdicts(
        plan_sha256=plan.plan_sha256,
        round_sha256=round_plan.round_sha256,
        round_ordinal=round_plan.document["round_ordinal"],
        complete=True,
        baseline=minimality.AuthenticatedQueryVerdict(
            query_sha256=queries["baseline"]["query_sha256"],
            assumptions=tuple(queries["baseline"]["assumptions"]),
            verdict=baseline,
        ),
        leave_one_group_out=tuple(
            minimality.AuthenticatedOmissionVerdict(
                statement_id=query["statement_id"],
                query_sha256=query["query_sha256"],
                assumptions=tuple(query["assumptions"]),
                verdict=verdict,
            )
            for query, verdict in zip(omission_queries, omissions, strict=True)
        ),
    )


def _solve_round(
    plan: bank.SelectorPlan, round_plan: minimality.MinimalityRoundPlan
) -> minimality.MinimalityRoundResult:
    cnf = plan.document["gated_cnf"]
    queries = round_plan.document["queries"]
    baseline = _brute_verdict(
        cnf["num_vars"], cnf["clauses"], queries["baseline"]["assumptions"]
    )
    omissions = tuple(
        _brute_verdict(cnf["num_vars"], cnf["clauses"], query["assumptions"])
        for query in queries["leave_one_group_out"]
    )
    return minimality.interpret_complete_round(
        plan,
        round_plan,
        _authenticated(plan, round_plan, baseline=baseline, omissions=omissions),
    )


def test_initial_round_binds_plan_active_selectors_assumptions_and_hashes() -> None:
    plan = _plan()
    round_plan = minimality.build_initial_round(plan)
    document = round_plan.document

    assert document["active_groups"] == [
        {"selector_var": 2, "statement_id": "A"},
        {"selector_var": 3, "statement_id": "B"},
    ]
    assert document["queries"]["baseline"]["assumptions"] == [2, 3]
    assert [
        query["assumptions"] for query in document["queries"]["leave_one_group_out"]
    ] == [[-2, 3], [2, -3]]
    assert document["plan_sha256"] == plan.plan_sha256
    assert document["previous_round_sha256"] is None
    assert document["previous_result_sha256"] is None
    assert document["round_sha256"] == bank.sha256_json(
        {key: value for key, value in document.items() if key != "round_sha256"}
    )
    for query in [
        document["queries"]["baseline"],
        *document["queries"]["leave_one_group_out"],
    ]:
        assert query["query_sha256"] == bank.sha256_json(
            {key: value for key, value in query.items() if key != "query_sha256"}
        )
    minimality.validate_round_plan(plan, round_plan)


def test_selector_plan_subclass_cannot_override_the_authenticated_plan_hash() -> None:
    plan = _plan()

    class ForgedPlan(bank.SelectorPlan):
        @property
        def plan_sha256(self) -> str:
            return "f" * 64

    forged = ForgedPlan(document=plan.document, dimacs_bytes=plan.dimacs_bytes)
    assert forged.plan_sha256 != forged.document["plan_sha256"]

    with pytest.raises(
        minimality.StatementBankMinimalityError, match="exact SelectorPlan"
    ):
        minimality.build_initial_round(forged)


def test_duplicate_groups_require_deterministic_rerun_and_retain_one() -> None:
    """A full-bank LOO marks both duplicates redundant; deleting both is wrong."""

    plan = _plan()
    first_round = minimality.build_initial_round(plan)
    first = _solve_round(plan, first_round)
    assert first.document["status"] == minimality.DELETE_AND_CONTINUE
    assert first.document["deleted_statement_id"] == "A"
    assert first.document["next_active_statement_ids"] == ["B"]

    second_round = minimality.build_next_round(plan, first_round, first)
    assert second_round.document["queries"]["baseline"]["assumptions"] == [-2, 3]
    assert second_round.document["queries"]["leave_one_group_out"][0][
        "assumptions"
    ] == [-2, -3]
    second = _solve_round(plan, second_round)
    assert second.document["status"] == minimality.INCLUSION_MINIMAL
    assert second.document["active_statement_ids"] == ["B"]
    assert second.document["deleted_statement_id"] is None

    # Deterministic replay has byte-identical round/result documents and hashes.
    replay_first_round = minimality.build_initial_round(plan)
    replay_first = _solve_round(plan, replay_first_round)
    replay_second_round = minimality.build_next_round(
        plan, replay_first_round, replay_first
    )
    replay_second = _solve_round(plan, replay_second_round)
    assert replay_first_round.document == first_round.document
    assert replay_first.document == first.document
    assert replay_second_round.document == second_round.document
    assert replay_second.document == second.document


def test_first_unsat_omission_wins_even_if_an_earlier_omission_is_unknown() -> None:
    plan = _plan(groups=[("A", [[-1]]), ("B", [[-1]]), ("C", [[-1]])])
    round_plan = minimality.build_initial_round(plan)
    result = minimality.interpret_complete_round(
        plan,
        round_plan,
        _authenticated(
            plan,
            round_plan,
            baseline=bank.SolverVerdict.UNSAT,
            omissions=(
                bank.SolverVerdict.UNKNOWN,
                bank.SolverVerdict.UNSAT,
                bank.SolverVerdict.UNSAT,
            ),
        ),
    )
    assert result.document["deleted_statement_id"] == "B"
    assert result.document["next_active_statement_ids"] == ["A", "C"]


@pytest.mark.parametrize(
    "baseline", [bank.SolverVerdict.SAT, bank.SolverVerdict.UNKNOWN]
)
def test_non_unsat_baseline_is_inconclusive_and_deletes_nothing(
    baseline: bank.SolverVerdict,
) -> None:
    plan = _plan()
    round_plan = minimality.build_initial_round(plan)
    result = minimality.interpret_complete_round(
        plan,
        round_plan,
        _authenticated(
            plan,
            round_plan,
            baseline=baseline,
            omissions=(bank.SolverVerdict.UNSAT, bank.SolverVerdict.UNSAT),
        ),
    )
    assert result.document["status"] == minimality.INCONCLUSIVE
    assert result.document["deleted_statement_id"] is None
    assert result.document["next_active_statement_ids"] == ["A", "B"]


def test_unknown_omission_without_unsat_is_inconclusive() -> None:
    plan = _plan()
    round_plan = minimality.build_initial_round(plan)
    result = minimality.interpret_complete_round(
        plan,
        round_plan,
        _authenticated(
            plan,
            round_plan,
            baseline=bank.SolverVerdict.UNSAT,
            omissions=(bank.SolverVerdict.SAT, bank.SolverVerdict.UNKNOWN),
        ),
    )
    assert result.document["status"] == minimality.INCONCLUSIVE
    assert result.document["deleted_statement_id"] is None


def test_base_unsat_reaches_the_valid_empty_inclusion_minimal_result() -> None:
    plan = _plan(base_clauses=[[]], groups=[("A", [[1]]), ("B", [[-1]])])
    round_plan = minimality.build_initial_round(plan)
    result = _solve_round(plan, round_plan)
    assert result.document["deleted_statement_id"] == "A"

    round_plan = minimality.build_next_round(plan, round_plan, result)
    result = _solve_round(plan, round_plan)
    assert result.document["deleted_statement_id"] == "B"

    round_plan = minimality.build_next_round(plan, round_plan, result)
    assert round_plan.document["active_groups"] == []
    assert round_plan.document["queries"]["leave_one_group_out"] == []
    assert round_plan.document["queries"]["baseline"]["assumptions"] == [-2, -3]
    result = _solve_round(plan, round_plan)
    assert result.document["status"] == minimality.INCLUSION_MINIMAL
    assert result.document["active_statement_ids"] == []
    assert (
        result.document["claims"]["inclusion_minimal_relative_to_supplied_bank"] is True
    )


def test_claim_boundary_is_exact_for_plans_nonfinal_and_final_results() -> None:
    plan = _plan()
    first_round = minimality.build_initial_round(plan)
    first = _solve_round(plan, first_round)
    second_round = minimality.build_next_round(plan, first_round, first)
    final = _solve_round(plan, second_round)

    expected_false = {
        "cardinality_minimum": False,
        "daemon_attestation": False,
        "global_minimum": False,
        "inclusion_minimal_relative_to_supplied_bank": False,
        "solver_attestation": False,
        "source_entitlement": False,
        "theorem_closure": False,
    }
    assert first_round.document["claims"] == expected_false
    assert second_round.document["claims"] == expected_false
    assert first.document["claims"] == expected_false
    assert final.document["claims"] == {
        **expected_false,
        "inclusion_minimal_relative_to_supplied_bank": True,
    }
    assert "minimum" not in final.document["status"].lower().replace(
        "inclusion_minimal", ""
    )


def test_next_round_binds_both_predecessor_hashes_and_ordinal() -> None:
    plan = _plan()
    first_round = minimality.build_initial_round(plan)
    first = _solve_round(plan, first_round)
    second_round = minimality.build_next_round(plan, first_round, first)

    assert second_round.document["round_ordinal"] == 1
    assert second_round.document["previous_round_sha256"] == first_round.round_sha256
    assert second_round.document["previous_result_sha256"] == first.result_sha256
    minimality.validate_round_plan(plan, second_round)


def test_later_round_cannot_detach_or_rehash_tampered_predecessor_binding() -> None:
    plan = _plan()
    first_round = minimality.build_initial_round(plan)
    first = _solve_round(plan, first_round)
    second_round = minimality.build_next_round(plan, first_round, first)

    detached = minimality.MinimalityRoundPlan(
        document=copy.deepcopy(second_round.document)
    )
    with pytest.raises(minimality.StatementBankMinimalityError, match="carry"):
        minimality.validate_round_plan(plan, detached)

    document = copy.deepcopy(second_round.document)
    document["previous_result_sha256"] = "0" * 64
    body = {key: value for key, value in document.items() if key != "round_sha256"}
    document["round_sha256"] = bank.sha256_json(body)
    rehashed = replace(second_round, document=document)
    with pytest.raises(minimality.StatementBankMinimalityError, match="carried"):
        minimality.validate_round_plan(plan, rehashed)


@pytest.mark.parametrize(
    "mutation",
    [
        lambda doc: doc.pop("queries"),
        lambda doc: doc.update(extra=True),
        lambda doc: doc["active_groups"].reverse(),
        lambda doc: doc["queries"]["baseline"]["assumptions"].reverse(),
        lambda doc: doc["queries"]["baseline"].update(query_sha256="0" * 64),
        lambda doc: doc.update(plan_sha256="0" * 64),
        lambda doc: doc.update(previous_result_sha256="0" * 64),
    ],
)
def test_round_document_missing_extra_order_hash_and_tampering_fail_closed(
    mutation,
) -> None:
    plan = _plan()
    original = minimality.build_initial_round(plan)
    document = copy.deepcopy(original.document)
    mutation(document)

    with pytest.raises(minimality.StatementBankMinimalityError):
        minimality.validate_round_plan(
            plan, minimality.MinimalityRoundPlan(document=document)
        )


def test_boolean_is_not_accepted_as_round_ordinal_or_selector_integer() -> None:
    plan = _plan()
    round_plan = minimality.build_initial_round(plan)
    for field in ("round_ordinal",):
        document = copy.deepcopy(round_plan.document)
        document[field] = True
        body = {key: value for key, value in document.items() if key != "round_sha256"}
        document["round_sha256"] = bank.sha256_json(body)
        with pytest.raises(minimality.StatementBankMinimalityError, match="integer"):
            minimality.validate_round_plan(
                plan, minimality.MinimalityRoundPlan(document=document)
            )

    document = copy.deepcopy(round_plan.document)
    document["active_groups"][0]["selector_var"] = True
    body = {key: value for key, value in document.items() if key != "round_sha256"}
    document["round_sha256"] = bank.sha256_json(body)
    with pytest.raises(minimality.StatementBankMinimalityError, match="integer"):
        minimality.validate_round_plan(
            plan, minimality.MinimalityRoundPlan(document=document)
        )


def test_authenticated_verdict_order_query_hash_assumptions_and_types_are_exact() -> (
    None
):
    plan = _plan()
    round_plan = minimality.build_initial_round(plan)
    good = _authenticated(
        plan,
        round_plan,
        baseline=bank.SolverVerdict.UNSAT,
        omissions=(bank.SolverVerdict.UNSAT, bank.SolverVerdict.UNSAT),
    )

    bad_values = [
        replace(good, complete=False),
        replace(good, round_ordinal=True),
        replace(good, plan_sha256="0" * 64),
        replace(good, round_sha256="0" * 64),
        replace(good, leave_one_group_out=tuple(reversed(good.leave_one_group_out))),
        replace(
            good,
            baseline=replace(good.baseline, query_sha256="0" * 64),
        ),
        replace(
            good,
            baseline=replace(good.baseline, assumptions=(3, 2)),
        ),
        replace(
            good,
            baseline=replace(good.baseline, assumptions=(True, 3)),  # type: ignore[arg-type]
        ),
    ]
    for value in bad_values:
        with pytest.raises(minimality.StatementBankMinimalityError):
            minimality.interpret_complete_round(plan, round_plan, value)


def test_result_hash_order_and_decision_tampering_fail_closed() -> None:
    plan = _plan()
    round_plan = minimality.build_initial_round(plan)
    result = _solve_round(plan, round_plan)

    for mutation in (
        lambda doc: doc.pop("claims"),
        lambda doc: doc["active_statement_ids"].reverse(),
        lambda doc: doc.update(deleted_statement_id="B"),
        lambda doc: doc.update(status=minimality.INCLUSION_MINIMAL),
        lambda doc: doc["verdicts"]["leave_one_group_out"].reverse(),
        lambda doc: doc.update(result_sha256="0" * 64),
    ):
        document = copy.deepcopy(result.document)
        mutation(document)
        with pytest.raises(minimality.StatementBankMinimalityError):
            minimality.validate_round_result(
                plan,
                round_plan,
                minimality.MinimalityRoundResult(document=document),
            )


def test_rehashed_result_cannot_replace_its_authenticated_verdict_evidence() -> None:
    plan = _plan()
    round_plan = minimality.build_initial_round(plan)
    result = _solve_round(plan, round_plan)
    assert result.authenticated_verdicts is not None

    document = copy.deepcopy(result.document)
    document["verdicts"]["leave_one_group_out"][0]["verdict"] = "SAT"
    document["deleted_statement_id"] = "B"
    document["next_active_statement_ids"] = ["A"]
    body = {key: value for key, value in document.items() if key != "result_sha256"}
    document["result_sha256"] = bank.sha256_json(body)

    forged = replace(result, document=document)
    with pytest.raises(minimality.StatementBankMinimalityError, match="interpretation"):
        minimality.validate_round_result(plan, round_plan, forged)

    detached = minimality.MinimalityRoundResult(document=result.document)
    with pytest.raises(minimality.StatementBankMinimalityError, match="verdicts"):
        minimality.validate_round_result(plan, round_plan, detached)


def test_no_successor_is_allowed_after_inconclusive_or_final_result() -> None:
    plan = _plan()
    round_plan = minimality.build_initial_round(plan)
    inconclusive = minimality.interpret_complete_round(
        plan,
        round_plan,
        _authenticated(
            plan,
            round_plan,
            baseline=bank.SolverVerdict.SAT,
            omissions=(bank.SolverVerdict.SAT, bank.SolverVerdict.SAT),
        ),
    )
    with pytest.raises(minimality.StatementBankMinimalityError, match="next round"):
        minimality.build_next_round(plan, round_plan, inconclusive)

    first = _solve_round(plan, round_plan)
    second_round = minimality.build_next_round(plan, round_plan, first)
    final = _solve_round(plan, second_round)
    with pytest.raises(minimality.StatementBankMinimalityError, match="next round"):
        minimality.build_next_round(plan, second_round, final)

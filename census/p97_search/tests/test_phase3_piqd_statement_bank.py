from __future__ import annotations

import copy
import itertools
import json
from pathlib import Path

import pytest

from census.p97_search import phase3_piqd_statement_bank as bank


def _manifest_value() -> dict:
    return {
        "schema": bank.MANIFEST_SCHEMA,
        "source_num_vars": 4,
        "base_clauses": [[1], [1, -3], [2, 4]],
        "statement_groups": [
            {"statement_id": "S.01", "clauses": [[1], [1, -3]]},
            {"statement_id": "S.02", "clauses": [[], [2, 4]]},
            {"statement_id": "S.03", "clauses": [[-1, 2]]},
        ],
    }


def _load(value: dict | None = None) -> bank.StatementBank:
    value = _manifest_value() if value is None else value
    return bank.load_manifest_bytes(bank.canonical_json_bytes(value))


def _brute_verdict(
    num_vars: int, clauses: list[list[int]], assumptions: list[int]
) -> bank.SolverVerdict:
    augmented = [*clauses, *[[literal] for literal in assumptions]]
    for values in itertools.product((False, True), repeat=num_vars):
        if all(
            any(values[abs(literal) - 1] == (literal > 0) for literal in clause)
            for clause in augmented
        ):
            return bank.SolverVerdict.SAT
    return bank.SolverVerdict.UNSAT


def test_selector_plan_gates_every_clause_and_emits_exact_assumptions() -> None:
    parsed = _load()
    first = bank.build_selector_plan(parsed)
    second = bank.build_selector_plan(parsed)

    assert first.document == second.document
    assert first.dimacs_bytes == second.dimacs_bytes
    assert first.plan_sha256 == bank.sha256_json(
        {key: value for key, value in first.document.items() if key != "plan_sha256"}
    )
    assert [item["selector_var"] for item in first.document["selector_allocation"]] == [
        5,
        6,
        7,
    ]
    assert first.document["gated_cnf"]["clauses"] == [
        [1],
        [1, -3],
        [2, 4],
        [-5, 1],
        [-5, 1, -3],
        [-6],
        [-6, 2, 4],
        [-7, -1, 2],
    ]
    queries = first.document["queries"]
    assert queries["baseline"]["assumptions"] == [5, 6, 7]
    assert (
        queries["baseline"]["gated_cnf_sha256"]
        == first.document["gated_cnf"]["dimacs_sha256"]
    )
    assert [item["assumptions"] for item in queries["leave_one_group_out"]] == [
        [-5, 6, 7],
        [5, -6, 7],
        [5, 6, -7],
    ]
    assert first.dimacs_bytes.startswith(b"p cnf 7 8\n")
    assert first.document["gated_cnf"]["dimacs_sha256"] == bank.sha256_bytes(
        first.dimacs_bytes
    )
    assert all(
        first.document["claims"][name] is False for name in first.document["claims"]
    )


def test_build_rejects_direct_bank_with_unsorted_statement_ids() -> None:
    parsed = _load()
    manifest = _manifest_value()
    manifest["statement_groups"].reverse()
    direct = bank.StatementBank(
        source_num_vars=parsed.source_num_vars,
        base_clauses=parsed.base_clauses,
        statement_groups=tuple(reversed(parsed.statement_groups)),
        manifest_sha256=bank.sha256_json(manifest),
    )

    with pytest.raises(bank.StatementBankError, match="ordered by statement_id"):
        bank.build_selector_plan(direct)


def test_build_rejects_direct_bank_with_bogus_manifest_hash() -> None:
    parsed = _load()
    direct = bank.StatementBank(
        source_num_vars=parsed.source_num_vars,
        base_clauses=parsed.base_clauses,
        statement_groups=parsed.statement_groups,
        manifest_sha256="0" * 64,
    )

    with pytest.raises(bank.StatementBankError, match="manifest_sha256"):
        bank.build_selector_plan(direct)


@pytest.mark.parametrize(
    ("make_bank", "match"),
    [
        (
            lambda parsed: bank.StatementBank(  # type: ignore[arg-type]
                True,
                parsed.base_clauses,
                parsed.statement_groups,
                parsed.manifest_sha256,
            ),
            "source_num_vars",
        ),
        (
            lambda parsed: bank.StatementBank(  # type: ignore[arg-type]
                parsed.source_num_vars,
                ((1.0,), *parsed.base_clauses[1:]),
                parsed.statement_groups,
                parsed.manifest_sha256,
            ),
            "must be an exact int",
        ),
        (
            lambda parsed: bank.StatementBank(
                parsed.source_num_vars,
                (),
                parsed.statement_groups,
                parsed.manifest_sha256,
            ),
            "base_clauses must be nonempty",
        ),
        (
            lambda parsed: bank.StatementBank(  # type: ignore[arg-type]
                parsed.source_num_vars,
                list(parsed.base_clauses),
                parsed.statement_groups,
                parsed.manifest_sha256,
            ),
            "base_clauses must be a tuple",
        ),
    ],
)
def test_build_rejects_direct_bank_with_invalid_types_or_shape(
    make_bank, match: str
) -> None:
    with pytest.raises(bank.StatementBankError, match=match):
        bank.build_selector_plan(make_bank(_load()))


def test_build_rejects_scalar_subclasses_erased_by_json_normalization() -> None:
    class IntSubclass(int):
        pass

    class StrSubclass(str):
        pass

    parsed = _load()
    bad_source_num_vars = bank.StatementBank(
        IntSubclass(parsed.source_num_vars),
        parsed.base_clauses,
        parsed.statement_groups,
        parsed.manifest_sha256,
    )
    bad_literal = bank.StatementBank(
        parsed.source_num_vars,
        ((IntSubclass(1),), *parsed.base_clauses[1:]),
        parsed.statement_groups,
        parsed.manifest_sha256,
    )
    first_group = parsed.statement_groups[0]
    bad_statement_id = bank.StatementBank(
        parsed.source_num_vars,
        parsed.base_clauses,
        (
            bank.StatementGroup(
                StrSubclass(first_group.statement_id), first_group.clauses
            ),
            *parsed.statement_groups[1:],
        ),
        parsed.manifest_sha256,
    )

    for direct in (bad_source_num_vars, bad_literal, bad_statement_id):
        with pytest.raises(bank.StatementBankError, match="must be an exact"):
            bank.build_selector_plan(direct)


def test_known_small_cnf_smoke_validates_selector_semantics() -> None:
    manifest = {
        "schema": bank.MANIFEST_SCHEMA,
        "source_num_vars": 2,
        "base_clauses": [[1]],
        "statement_groups": [
            {"statement_id": "S.essential", "clauses": [[-1]]},
            {"statement_id": "S.redundant", "clauses": [[2]]},
        ],
    }
    plan = bank.build_selector_plan(_load(manifest))
    cnf = plan.document["gated_cnf"]
    queries = plan.document["queries"]
    baseline = _brute_verdict(
        cnf["num_vars"], cnf["clauses"], queries["baseline"]["assumptions"]
    )
    omitted = {
        query["statement_id"]: _brute_verdict(
            cnf["num_vars"], cnf["clauses"], query["assumptions"]
        )
        for query in queries["leave_one_group_out"]
    }
    assert baseline is bank.SolverVerdict.UNSAT
    assert omitted == {
        "S.essential": bank.SolverVerdict.SAT,
        "S.redundant": bank.SolverVerdict.UNSAT,
    }
    result = bank.interpret_authenticated_verdicts(
        plan, bank.AuthenticatedVerdictInputs(plan.plan_sha256, baseline, omitted)
    )
    assert [item["label"] for item in result["groups"]] == [
        bank.ESSENTIAL,
        bank.REDUNDANT,
    ]


def test_diagnostics_retain_history_and_make_no_semantic_claim() -> None:
    plan = bank.build_selector_plan(_load())
    diagnostics = plan.document["diagnostics"]

    assert plan.document["gated_cnf"]["num_clauses"] == 8
    assert diagnostics["semantic_redundancy_claimed"] is False
    duplicates = diagnostics["exact_duplicate_single_clauses"]
    assert duplicates["status"] == "COMPLETE"
    assert duplicates["duplicate_clause_count"] == 3
    assert [item["clause"] for item in duplicates["groups"]] == [
        [1],
        [1, -3],
        [2, 4],
    ]
    strict = diagnostics["strict_single_clause_subsumptions"]
    assert strict["status"] == "COMPLETE"
    assert strict["complete"] is True
    assert strict["performed_pair_checks"] == strict["required_pair_checks"] == 10
    assert any(
        item["subsuming_clause"] == [] and item["subsumed_clause"] == [1]
        for item in strict["pairs"]
    )
    assert any(
        item["subsuming_clause"] == [1] and item["subsumed_clause"] == [1, -3]
        for item in strict["pairs"]
    )


def test_subsumption_scan_skips_without_partial_results_when_over_budget() -> None:
    plan = bank.build_selector_plan(_load(), subsumption_pair_check_budget=9)
    diagnostics = plan.document["diagnostics"]

    duplicates = diagnostics["exact_duplicate_single_clauses"]
    assert duplicates["status"] == "COMPLETE"
    assert duplicates["duplicate_clause_count"] == 3
    strict = diagnostics["strict_single_clause_subsumptions"]
    assert strict == {
        "complete": False,
        "pair_check_budget": 9,
        "pairs": [],
        "performed_pair_checks": 0,
        "required_pair_checks": 10,
        "status": "SKIPPED_RESOURCE_BOUND",
    }
    assert diagnostics["semantic_redundancy_claimed"] is False
    assert all(
        plan.document["claims"][name] is False for name in plan.document["claims"]
    )
    bank.validate_selector_plan(plan)


@pytest.mark.parametrize(
    "budget", [-1, True, bank.MAX_SUBSUMPTION_PAIR_CHECK_BUDGET + 1]
)
def test_subsumption_budget_fails_closed(budget: object) -> None:
    with pytest.raises(bank.StatementBankError, match="pair_check_budget"):
        bank.build_selector_plan(  # type: ignore[arg-type]
            _load(), subsumption_pair_check_budget=budget
        )


@pytest.mark.parametrize(
    ("mutate", "match"),
    [
        (lambda value: value.update(source_num_vars=True), "source_num_vars"),
        (lambda value: value.update(base_clauses=[]), "base_clauses must be nonempty"),
        (lambda value: value.update(statement_groups=[]), "statement_groups"),
        (
            lambda value: value["statement_groups"][0].update(clauses=[]),
            "clauses must be nonempty",
        ),
        (
            lambda value: value["statement_groups"][1].update(statement_id="S.01"),
            "duplicate statement_id",
        ),
        (
            lambda value: value["statement_groups"].reverse(),
            "ordered by statement_id",
        ),
        (lambda value: value.update(extra=True), "manifest keys"),
    ],
)
def test_manifest_structure_fails_closed(mutate, match: str) -> None:
    value = _manifest_value()
    mutate(value)
    with pytest.raises(bank.StatementBankError, match=match):
        _load(value)


@pytest.mark.parametrize(
    ("clause", "match"),
    [
        ([0], "must not be zero"),
        ([5], "outside"),
        ([True], "must be an integer"),
        ([1, 1], "repeats literal"),
        ([1, -1], "tautological"),
        ([-3, 1], "not canonical"),
    ],
)
def test_adversarial_literals_fail_closed(clause: list, match: str) -> None:
    value = _manifest_value()
    value["statement_groups"][0]["clauses"] = [clause]
    with pytest.raises(bank.StatementBankError, match=match):
        _load(value)


def test_noncanonical_clause_collection_order_fails_closed() -> None:
    value = _manifest_value()
    value["base_clauses"] = [[2, 4], [1]]
    with pytest.raises(bank.StatementBankError, match="canonical clause order"):
        _load(value)


def test_manifest_requires_exact_canonical_json_bytes() -> None:
    value = _manifest_value()
    pretty = json.dumps(value, indent=2).encode()
    with pytest.raises(bank.StatementBankError, match="not canonical JSON"):
        bank.load_manifest_bytes(pretty)

    duplicate_key = (
        b'{"base_clauses":[],"base_clauses":[],"schema":"x",'
        b'"source_num_vars":0,"statement_groups":[]}'
    )
    with pytest.raises(bank.StatementBankError, match="duplicate JSON key"):
        bank.load_manifest_bytes(duplicate_key)


def test_interpretation_is_guarded_by_baseline_unsat() -> None:
    plan = bank.build_selector_plan(_load())
    omitted = {
        "S.01": bank.SolverVerdict.SAT,
        "S.02": bank.SolverVerdict.UNSAT,
        "S.03": bank.SolverVerdict.UNKNOWN,
    }
    interpreted = bank.interpret_authenticated_verdicts(
        plan,
        bank.AuthenticatedVerdictInputs(
            plan.plan_sha256, bank.SolverVerdict.UNSAT, omitted
        ),
    )
    assert [item["label"] for item in interpreted["groups"]] == [
        bank.ESSENTIAL,
        bank.REDUNDANT,
        bank.INCONCLUSIVE,
    ]
    assert interpreted["claims"] == {
        "global_minimum": False,
        "source_entitlement": False,
        "theorem_closure": False,
    }

    for baseline in (bank.SolverVerdict.SAT, bank.SolverVerdict.UNKNOWN):
        guarded = bank.interpret_authenticated_verdicts(
            plan, bank.AuthenticatedVerdictInputs(plan.plan_sha256, baseline, omitted)
        )
        assert {item["label"] for item in guarded["groups"]} == {bank.INCONCLUSIVE}


def test_interpretation_rejects_unbound_or_incomplete_verdicts() -> None:
    plan = bank.build_selector_plan(_load())
    verdicts = {
        "S.01": bank.SolverVerdict.SAT,
        "S.02": bank.SolverVerdict.UNSAT,
        "S.03": bank.SolverVerdict.UNKNOWN,
    }
    with pytest.raises(bank.StatementBankError, match="different plan"):
        bank.interpret_authenticated_verdicts(
            plan,
            bank.AuthenticatedVerdictInputs(
                "0" * 64, bank.SolverVerdict.UNSAT, verdicts
            ),
        )

    tampered_document = copy.deepcopy(plan.document)
    tampered_document["selector_allocation"][0]["selector_var"] = 999
    tampered_plan = bank.SelectorPlan(tampered_document, plan.dimacs_bytes)
    with pytest.raises(bank.StatementBankError, match="selector plan"):
        bank.interpret_authenticated_verdicts(
            tampered_plan,
            bank.AuthenticatedVerdictInputs(
                plan.plan_sha256, bank.SolverVerdict.UNSAT, verdicts
            ),
        )

    self_consistent_document = copy.deepcopy(plan.document)
    self_consistent_document["claims"]["global_minimum"] = True
    self_consistent_document["plan_sha256"] = bank.sha256_json(
        {
            key: value
            for key, value in self_consistent_document.items()
            if key != "plan_sha256"
        }
    )
    assert self_consistent_document["plan_sha256"] != plan.plan_sha256
    self_consistent_tamper = bank.SelectorPlan(
        self_consistent_document, plan.dimacs_bytes
    )
    with pytest.raises(bank.StatementBankError, match="exact generated plan"):
        bank.interpret_authenticated_verdicts(
            self_consistent_tamper,
            bank.AuthenticatedVerdictInputs(
                self_consistent_tamper.plan_sha256,
                bank.SolverVerdict.UNSAT,
                verdicts,
            ),
        )

    loosely_equal_document = copy.deepcopy(plan.document)
    loosely_equal_document["gated_cnf"]["num_vars"] = 7.0
    assert loosely_equal_document == plan.document
    with pytest.raises(bank.StatementBankError, match="exact canonical JSON types"):
        bank.interpret_authenticated_verdicts(
            bank.SelectorPlan(loosely_equal_document, plan.dimacs_bytes),
            bank.AuthenticatedVerdictInputs(
                plan.plan_sha256, bank.SolverVerdict.UNSAT, verdicts
            ),
        )
    incomplete = copy.copy(verdicts)
    del incomplete["S.03"]
    with pytest.raises(bank.StatementBankError, match="exactly match"):
        bank.interpret_authenticated_verdicts(
            plan,
            bank.AuthenticatedVerdictInputs(
                plan.plan_sha256, bank.SolverVerdict.UNSAT, incomplete
            ),
        )
    stringly = {**verdicts, "S.03": "UNKNOWN"}
    with pytest.raises(bank.StatementBankError, match="must be a SolverVerdict"):
        bank.interpret_authenticated_verdicts(
            plan,
            bank.AuthenticatedVerdictInputs(  # type: ignore[arg-type]
                plan.plan_sha256, bank.SolverVerdict.UNSAT, stringly
            ),
        )


def test_cli_writes_immutable_deterministic_artifacts(
    tmp_path: Path, capsysbinary: pytest.CaptureFixture[bytes]
) -> None:
    manifest = tmp_path / "bank.json"
    manifest.write_bytes(bank.canonical_json_bytes(_manifest_value()))
    plan_path = tmp_path / "plan.json"
    cnf_path = tmp_path / "plan.cnf"

    assert (
        bank.main(
            [
                str(manifest),
                "--plan-output",
                str(plan_path),
                "--cnf-output",
                str(cnf_path),
            ]
        )
        == 0
    )
    expected = bank.build_selector_plan(bank.load_manifest(manifest))
    assert plan_path.read_bytes() == bank.canonical_json_bytes(expected.document)
    assert cnf_path.read_bytes() == expected.dimacs_bytes
    assert bank.main([str(manifest), "--plan-output", str(plan_path)]) == 0

    plan_path.write_bytes(b"different")
    with pytest.raises(SystemExit) as exc:
        bank.main([str(manifest), "--plan-output", str(plan_path)])
    assert exc.value.code == 2
    assert b"refusing to overwrite" in capsysbinary.readouterr().err

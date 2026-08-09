"""Plan and interpret strict inclusion-minimality rounds for a P97 bank.

The module consumes one validated selector plan.  It neither invokes a solver
nor authenticates receipts.  Callers cross the authentication boundary only by
constructing the exact typed verdict objects below.
"""

from __future__ import annotations

import re
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from typing import Any

from census.p97_search import phase3_piqd_statement_bank as statement_bank

ROUND_SCHEMA = "p97-piqd-statement-bank-minimality-round/v1"
RESULT_SCHEMA = "p97-piqd-statement-bank-minimality-result/v1"

ROUND_PLAN_ONLY = "ROUND_PLAN_ONLY"
DELETE_AND_CONTINUE = "DELETE_FIRST_REDUNDANT_AND_CONTINUE"
INCONCLUSIVE = "INCONCLUSIVE"
INCLUSION_MINIMAL = "INCLUSION_MINIMAL_RELATIVE_TO_SUPPLIED_BANK"

_HEX_SHA256 = re.compile(r"[0-9a-f]{64}\Z")
_ROUND_KEYS = frozenset(
    {
        "active_groups",
        "claims",
        "gated_cnf_sha256",
        "plan_sha256",
        "previous_result_sha256",
        "previous_round_sha256",
        "queries",
        "round_ordinal",
        "round_sha256",
        "schema",
        "status",
    }
)
_ACTIVE_GROUP_KEYS = frozenset({"selector_var", "statement_id"})
_QUERIES_KEYS = frozenset({"baseline", "leave_one_group_out"})
_BASELINE_QUERY_KEYS = frozenset(
    {"assumptions", "gated_cnf_sha256", "kind", "query_sha256"}
)
_OMISSION_QUERY_KEYS = frozenset(
    {
        "assumptions",
        "gated_cnf_sha256",
        "kind",
        "query_sha256",
        "selector_var",
        "statement_id",
    }
)
_ROUND_CLAIM_KEYS = frozenset(
    {
        "cardinality_minimum",
        "daemon_attestation",
        "global_minimum",
        "inclusion_minimal_relative_to_supplied_bank",
        "solver_attestation",
        "source_entitlement",
        "theorem_closure",
    }
)
_RESULT_KEYS = frozenset(
    {
        "active_statement_ids",
        "claims",
        "deleted_statement_id",
        "next_active_statement_ids",
        "plan_sha256",
        "previous_result_sha256",
        "previous_round_sha256",
        "result_sha256",
        "round_ordinal",
        "round_sha256",
        "schema",
        "status",
        "verdicts",
    }
)
_VERDICTS_KEYS = frozenset({"baseline", "leave_one_group_out"})
_BASELINE_RESULT_KEYS = frozenset({"assumptions", "query_sha256", "verdict"})
_OMISSION_RESULT_KEYS = frozenset(
    {"assumptions", "query_sha256", "statement_id", "verdict"}
)


class StatementBankMinimalityError(statement_bank.StatementBankError):
    """A round, result, or authenticated verdict set failed closed."""


@dataclass(frozen=True)
class MinimalityRoundPlan:
    """One deterministic static batch over the current active groups."""

    document: Mapping[str, Any]
    previous_round: MinimalityRoundPlan | None = None
    previous_result: MinimalityRoundResult | None = None

    @property
    def round_sha256(self) -> str:
        return str(self.document["round_sha256"])


@dataclass(frozen=True)
class MinimalityRoundResult:
    """The deterministic interpretation of one complete round."""

    document: Mapping[str, Any]
    authenticated_verdicts: AuthenticatedCompleteRoundVerdicts | None = None

    @property
    def result_sha256(self) -> str:
        return str(self.document["result_sha256"])


@dataclass(frozen=True)
class AuthenticatedQueryVerdict:
    """Externally authenticated identity and verdict for one exact query."""

    query_sha256: str
    assumptions: tuple[int, ...]
    verdict: statement_bank.SolverVerdict


@dataclass(frozen=True)
class AuthenticatedOmissionVerdict:
    """An authenticated omission verdict with its canonical group identity."""

    statement_id: str
    query_sha256: str
    assumptions: tuple[int, ...]
    verdict: statement_bank.SolverVerdict


@dataclass(frozen=True)
class AuthenticatedCompleteRoundVerdicts:
    """Typed authentication seam for a complete, exact round batch.

    Construction asserts external authentication; this module revalidates all
    identities, ordering, assumptions, and types but does not attest their
    external origin.
    """

    plan_sha256: str
    round_sha256: str
    round_ordinal: int
    complete: bool
    baseline: AuthenticatedQueryVerdict
    leave_one_group_out: tuple[AuthenticatedOmissionVerdict, ...]


def _fail(message: str) -> None:
    raise StatementBankMinimalityError(message)


def _exact_dict(value: object, keys: frozenset[str], *, where: str) -> dict[str, Any]:
    if type(value) is not dict or set(value) != keys:
        _fail(f"{where} has missing, extra, or non-object structure")
    return value


def _validate_json_tree(value: object, *, where: str) -> None:
    if value is None or type(value) in (bool, int, str):
        return
    if type(value) is list:
        for index, item in enumerate(value):
            _validate_json_tree(item, where=f"{where}[{index}]")
        return
    if type(value) is dict:
        for key, item in value.items():
            if type(key) is not str:
                _fail(f"{where} has a non-string key")
            _validate_json_tree(item, where=f"{where}.{key}")
        return
    _fail(f"{where} must use exact canonical JSON types")


def _sha256(value: object, *, where: str) -> str:
    if type(value) is not str or _HEX_SHA256.fullmatch(value) is None:
        _fail(f"{where} must be a lowercase 64-hex SHA-256")
    return value


def _exact_int(value: object, *, where: str, minimum: int = 0) -> int:
    if type(value) is not int or value < minimum:
        _fail(f"{where} must be an integer >= {minimum}")
    return value


def _claims(*, inclusion_minimal: bool) -> dict[str, bool]:
    return {
        "cardinality_minimum": False,
        "daemon_attestation": False,
        "global_minimum": False,
        "inclusion_minimal_relative_to_supplied_bank": inclusion_minimal,
        "solver_attestation": False,
        "source_entitlement": False,
        "theorem_closure": False,
    }


def _allocations(plan: statement_bank.SelectorPlan) -> list[dict[str, Any]]:
    if type(plan) is not statement_bank.SelectorPlan:
        _fail("plan must be an exact SelectorPlan")
    statement_bank.validate_selector_plan(plan)
    allocations = plan.document["selector_allocation"]
    # The upstream validator establishes this exact list-of-dicts shape.
    return allocations


def _query(
    *,
    kind: str,
    assumptions: list[int],
    gated_cnf_sha256: str,
    statement_id: str | None = None,
    selector_var: int | None = None,
) -> dict[str, Any]:
    binding: dict[str, Any] = {
        "assumptions": assumptions,
        "gated_cnf_sha256": gated_cnf_sha256,
        "kind": kind,
    }
    if statement_id is not None:
        binding["selector_var"] = selector_var
        binding["statement_id"] = statement_id
    return {**binding, "query_sha256": statement_bank.sha256_json(binding)}


def _build_round_document(
    plan: statement_bank.SelectorPlan,
    *,
    active_statement_ids: Sequence[str],
    round_ordinal: int,
    previous_round_sha256: str | None,
    previous_result_sha256: str | None,
) -> dict[str, Any]:
    allocations = _allocations(plan)
    ordinal = _exact_int(round_ordinal, where="round_ordinal")
    if type(active_statement_ids) not in (list, tuple):
        _fail("active_statement_ids must be a list or tuple")
    if any(type(item) is not str for item in active_statement_ids):
        _fail("active_statement_ids must contain exact strings")
    canonical_ids = [item["statement_id"] for item in allocations]
    active_ids = list(active_statement_ids)
    active_set = set(active_ids)
    if len(active_ids) != len(set(active_ids)):
        _fail("active_statement_ids contains duplicates")
    if active_ids != [item for item in canonical_ids if item in active_set]:
        _fail("active_statement_ids is not a canonical selector-plan subsequence")

    if ordinal == 0:
        if previous_round_sha256 is not None or previous_result_sha256 is not None:
            _fail("initial round must have null predecessor hashes")
        if active_ids != canonical_ids:
            _fail("initial round must activate every selector-plan group")
    else:
        _sha256(previous_round_sha256, where="previous_round_sha256")
        _sha256(previous_result_sha256, where="previous_result_sha256")

    gated_cnf_sha256 = plan.document["gated_cnf"]["dimacs_sha256"]
    selector_assumptions = [
        allocation["selector_var"]
        if allocation["statement_id"] in active_set
        else -allocation["selector_var"]
        for allocation in allocations
    ]
    baseline = _query(
        kind="CURRENT_ACTIVE_BASELINE",
        assumptions=selector_assumptions,
        gated_cnf_sha256=gated_cnf_sha256,
    )
    omissions = []
    for allocation in allocations:
        statement_id = allocation["statement_id"]
        if statement_id not in active_set:
            continue
        selector_var = allocation["selector_var"]
        assumptions = [
            -literal if abs(literal) == selector_var else literal
            for literal in selector_assumptions
        ]
        omissions.append(
            _query(
                kind="LEAVE_ONE_ACTIVE_GROUP_OUT",
                assumptions=assumptions,
                gated_cnf_sha256=gated_cnf_sha256,
                statement_id=statement_id,
                selector_var=selector_var,
            )
        )

    body: dict[str, Any] = {
        "active_groups": [
            {
                "selector_var": allocation["selector_var"],
                "statement_id": allocation["statement_id"],
            }
            for allocation in allocations
            if allocation["statement_id"] in active_set
        ],
        "claims": _claims(inclusion_minimal=False),
        "gated_cnf_sha256": gated_cnf_sha256,
        "plan_sha256": plan.document["plan_sha256"],
        "previous_result_sha256": previous_result_sha256,
        "previous_round_sha256": previous_round_sha256,
        "queries": {"baseline": baseline, "leave_one_group_out": omissions},
        "round_ordinal": ordinal,
        "schema": ROUND_SCHEMA,
        "status": ROUND_PLAN_ONLY,
    }
    return {**body, "round_sha256": statement_bank.sha256_json(body)}


def build_initial_round(
    plan: statement_bank.SelectorPlan,
) -> MinimalityRoundPlan:
    """Build round zero with every statement group active."""

    allocations = _allocations(plan)
    document = _build_round_document(
        plan,
        active_statement_ids=[item["statement_id"] for item in allocations],
        round_ordinal=0,
        previous_round_sha256=None,
        previous_result_sha256=None,
    )
    return MinimalityRoundPlan(document=document)


def validate_round_plan(
    plan: statement_bank.SelectorPlan, round_plan: MinimalityRoundPlan
) -> None:
    """Strictly validate and deterministically reconstruct a round document."""

    _allocations(plan)
    if type(round_plan) is not MinimalityRoundPlan:
        _fail("round_plan must be an exact MinimalityRoundPlan")
    document = _exact_dict(round_plan.document, _ROUND_KEYS, where="round plan")
    _validate_json_tree(document, where="round plan")
    if document["schema"] != ROUND_SCHEMA or document["status"] != ROUND_PLAN_ONLY:
        _fail("round plan schema or status is invalid")
    _sha256(document["round_sha256"], where="round_sha256")
    active_groups = document["active_groups"]
    if type(active_groups) is not list:
        _fail("active_groups must be an array")
    checked_groups = [
        _exact_dict(item, _ACTIVE_GROUP_KEYS, where=f"active_groups[{index}]")
        for index, item in enumerate(active_groups)
    ]
    active_ids: list[str] = []
    for index, item in enumerate(checked_groups):
        if type(item["statement_id"]) is not str:
            _fail(f"active_groups[{index}].statement_id must be an exact string")
        _exact_int(item["selector_var"], where=f"active_groups[{index}].selector_var")
        active_ids.append(item["statement_id"])
    expected = _build_round_document(
        plan,
        active_statement_ids=active_ids,
        round_ordinal=document["round_ordinal"],
        previous_round_sha256=document["previous_round_sha256"],
        previous_result_sha256=document["previous_result_sha256"],
    )
    if statement_bank.canonical_json_bytes(
        document
    ) != statement_bank.canonical_json_bytes(expected):
        _fail("round plan is not the exact deterministic reconstruction")

    ordinal = document["round_ordinal"]
    if ordinal == 0:
        if (
            round_plan.previous_round is not None
            or round_plan.previous_result is not None
        ):
            _fail("initial round must not carry predecessor objects")
        return
    if type(round_plan.previous_round) is not MinimalityRoundPlan:
        _fail("noninitial round must carry its exact previous round")
    if type(round_plan.previous_result) is not MinimalityRoundResult:
        _fail("noninitial round must carry its exact previous result")
    validate_round_result(plan, round_plan.previous_round, round_plan.previous_result)
    predecessor_result = round_plan.previous_result.document
    if predecessor_result["status"] != DELETE_AND_CONTINUE:
        _fail("noninitial round predecessor did not authorize a deletion")
    if ordinal != round_plan.previous_round.document["round_ordinal"] + 1:
        _fail("round ordinal is not the exact predecessor successor")
    if document["previous_round_sha256"] != round_plan.previous_round.round_sha256:
        _fail("previous_round_sha256 does not match the carried predecessor")
    if document["previous_result_sha256"] != round_plan.previous_result.result_sha256:
        _fail("previous_result_sha256 does not match the carried predecessor result")
    if active_ids != predecessor_result["next_active_statement_ids"]:
        _fail("active groups do not match the predecessor deletion decision")


def _query_verdict(
    value: object,
    expected: dict[str, Any],
    *,
    where: str,
) -> statement_bank.SolverVerdict:
    if type(value) is not AuthenticatedQueryVerdict:
        _fail(f"{where} must be an exact AuthenticatedQueryVerdict")
    if (
        type(value.query_sha256) is not str
        or value.query_sha256 != expected["query_sha256"]
    ):
        _fail(f"{where}.query_sha256 does not match the round query")
    if type(value.assumptions) is not tuple or any(
        type(literal) is not int for literal in value.assumptions
    ):
        _fail(f"{where}.assumptions must be a tuple of exact integers")
    if list(value.assumptions) != expected["assumptions"]:
        _fail(f"{where}.assumptions do not match the round query")
    if not isinstance(value.verdict, statement_bank.SolverVerdict):
        _fail(f"{where}.verdict must be a SolverVerdict")
    return value.verdict


def _omission_verdict(
    value: object,
    expected: dict[str, Any],
    *,
    where: str,
) -> statement_bank.SolverVerdict:
    if type(value) is not AuthenticatedOmissionVerdict:
        _fail(f"{where} must be an exact AuthenticatedOmissionVerdict")
    if (
        type(value.statement_id) is not str
        or value.statement_id != expected["statement_id"]
    ):
        _fail(f"{where}.statement_id does not match canonical query order")
    equivalent = AuthenticatedQueryVerdict(
        query_sha256=value.query_sha256,
        assumptions=value.assumptions,
        verdict=value.verdict,
    )
    return _query_verdict(equivalent, expected, where=where)


def _result_document(
    round_plan: MinimalityRoundPlan,
    *,
    baseline: statement_bank.SolverVerdict,
    omissions: Sequence[statement_bank.SolverVerdict],
) -> dict[str, Any]:
    round_document = round_plan.document
    active_ids = [item["statement_id"] for item in round_document["active_groups"]]
    omission_queries = round_document["queries"]["leave_one_group_out"]
    if len(omissions) != len(omission_queries):
        _fail("result verdicts must exactly exhaust the round omission queries")
    deleted_id: str | None = None
    status = INCONCLUSIVE
    inclusion_minimal = False
    if baseline is statement_bank.SolverVerdict.UNSAT:
        for query, verdict in zip(omission_queries, omissions, strict=True):
            if verdict is statement_bank.SolverVerdict.UNSAT:
                deleted_id = query["statement_id"]
                status = DELETE_AND_CONTINUE
                break
        else:
            if all(
                verdict is statement_bank.SolverVerdict.SAT for verdict in omissions
            ):
                status = INCLUSION_MINIMAL
                inclusion_minimal = True

    next_active_ids = [item for item in active_ids if item != deleted_id]
    baseline_query = round_document["queries"]["baseline"]
    body: dict[str, Any] = {
        "active_statement_ids": active_ids,
        "claims": _claims(inclusion_minimal=inclusion_minimal),
        "deleted_statement_id": deleted_id,
        "next_active_statement_ids": next_active_ids,
        "plan_sha256": round_document["plan_sha256"],
        "previous_result_sha256": round_document["previous_result_sha256"],
        "previous_round_sha256": round_document["previous_round_sha256"],
        "round_ordinal": round_document["round_ordinal"],
        "round_sha256": round_document["round_sha256"],
        "schema": RESULT_SCHEMA,
        "status": status,
        "verdicts": {
            "baseline": {
                "assumptions": baseline_query["assumptions"],
                "query_sha256": baseline_query["query_sha256"],
                "verdict": baseline.value,
            },
            "leave_one_group_out": [
                {
                    "assumptions": query["assumptions"],
                    "query_sha256": query["query_sha256"],
                    "statement_id": query["statement_id"],
                    "verdict": verdict.value,
                }
                for query, verdict in zip(omission_queries, omissions, strict=True)
            ],
        },
    }
    return {**body, "result_sha256": statement_bank.sha256_json(body)}


def _validate_authenticated_verdicts(
    plan: statement_bank.SelectorPlan,
    round_plan: MinimalityRoundPlan,
    verdicts: AuthenticatedCompleteRoundVerdicts,
) -> tuple[statement_bank.SolverVerdict, tuple[statement_bank.SolverVerdict, ...]]:
    if type(verdicts) is not AuthenticatedCompleteRoundVerdicts:
        _fail("verdicts must be an exact AuthenticatedCompleteRoundVerdicts")
    if type(verdicts.complete) is not bool or verdicts.complete is not True:
        _fail("only a COMPLETE authenticated round may be interpreted")
    if (
        type(verdicts.plan_sha256) is not str
        or verdicts.plan_sha256 != plan.document["plan_sha256"]
    ):
        _fail("authenticated verdicts target a different selector plan")
    if (
        type(verdicts.round_sha256) is not str
        or verdicts.round_sha256 != round_plan.round_sha256
    ):
        _fail("authenticated verdicts target a different round")
    expected_ordinal = round_plan.document["round_ordinal"]
    if (
        type(verdicts.round_ordinal) is not int
        or verdicts.round_ordinal != expected_ordinal
    ):
        _fail("authenticated verdicts have the wrong round ordinal")
    if type(verdicts.leave_one_group_out) is not tuple:
        _fail("leave_one_group_out must be a tuple in canonical query order")

    queries = round_plan.document["queries"]
    baseline = _query_verdict(verdicts.baseline, queries["baseline"], where="baseline")
    expected_omissions = queries["leave_one_group_out"]
    if len(verdicts.leave_one_group_out) != len(expected_omissions):
        _fail("leave_one_group_out must exactly exhaust the round queries")
    omissions = tuple(
        _omission_verdict(item, query, where=f"leave_one_group_out[{index}]")
        for index, (item, query) in enumerate(
            zip(verdicts.leave_one_group_out, expected_omissions, strict=True)
        )
    )
    return baseline, omissions


def interpret_complete_round(
    plan: statement_bank.SelectorPlan,
    round_plan: MinimalityRoundPlan,
    verdicts: AuthenticatedCompleteRoundVerdicts,
) -> MinimalityRoundResult:
    """Interpret a complete authenticated round under the vacuous-SAT guard."""

    validate_round_plan(plan, round_plan)
    baseline, omissions = _validate_authenticated_verdicts(plan, round_plan, verdicts)
    return MinimalityRoundResult(
        document=_result_document(
            round_plan,
            baseline=baseline,
            omissions=omissions,
        ),
        authenticated_verdicts=verdicts,
    )


def validate_round_result(
    plan: statement_bank.SelectorPlan,
    round_plan: MinimalityRoundPlan,
    result: MinimalityRoundResult,
) -> None:
    """Reject result tampering by parsing and recomputing the full decision."""

    validate_round_plan(plan, round_plan)
    if type(result) is not MinimalityRoundResult:
        _fail("result must be an exact MinimalityRoundResult")
    document = _exact_dict(result.document, _RESULT_KEYS, where="round result")
    _validate_json_tree(document, where="round result")
    if document["schema"] != RESULT_SCHEMA:
        _fail("round result schema is invalid")
    _sha256(document["result_sha256"], where="result_sha256")
    verdicts = _exact_dict(document["verdicts"], _VERDICTS_KEYS, where="verdicts")
    _exact_dict(verdicts["baseline"], _BASELINE_RESULT_KEYS, where="verdicts.baseline")
    omissions_raw = verdicts["leave_one_group_out"]
    if type(omissions_raw) is not list:
        _fail("verdicts.leave_one_group_out must be an array")
    for index, item in enumerate(omissions_raw):
        _exact_dict(item, _OMISSION_RESULT_KEYS, where=f"verdicts.omissions[{index}]")
    baseline, omissions = _validate_authenticated_verdicts(
        plan, round_plan, result.authenticated_verdicts
    )
    expected = _result_document(round_plan, baseline=baseline, omissions=omissions)
    if statement_bank.canonical_json_bytes(
        document
    ) != statement_bank.canonical_json_bytes(expected):
        _fail("round result is not the exact deterministic interpretation")


def build_next_round(
    plan: statement_bank.SelectorPlan,
    previous_round: MinimalityRoundPlan,
    previous_result: MinimalityRoundResult,
) -> MinimalityRoundPlan:
    """Build the sole permitted successor after deleting one redundant group."""

    validate_round_result(plan, previous_round, previous_result)
    result = previous_result.document
    if result["status"] != DELETE_AND_CONTINUE:
        _fail("a next round requires DELETE_FIRST_REDUNDANT_AND_CONTINUE")
    document = _build_round_document(
        plan,
        active_statement_ids=result["next_active_statement_ids"],
        round_ordinal=previous_round.document["round_ordinal"] + 1,
        previous_round_sha256=previous_round.round_sha256,
        previous_result_sha256=previous_result.result_sha256,
    )
    return MinimalityRoundPlan(
        document=document,
        previous_round=previous_round,
        previous_result=previous_result,
    )

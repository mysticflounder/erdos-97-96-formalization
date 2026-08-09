"""Build and interpret auditable selector plans for finite P97 clause banks.

This module deliberately stops at supplied-bank evidence.  It does not parse a
PIQD solve receipt and it never promotes syntactic clause diagnostics to a
semantic redundancy claim.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from enum import StrEnum
from pathlib import Path
from typing import Any

MANIFEST_SCHEMA = "p97-piqd-statement-bank/v1"
PLAN_SCHEMA = "p97-piqd-statement-selector-plan/v1"
INTERPRETATION_SCHEMA = "p97-piqd-statement-bank-interpretation/v1"
DEFAULT_SUBSUMPTION_PAIR_CHECK_BUDGET = 1_000_000
MAX_SUBSUMPTION_PAIR_CHECK_BUDGET = 1_000_000

ESSENTIAL = "ESSENTIAL_RELATIVE_TO_SUPPLIED_BANK"
REDUNDANT = "REDUNDANT_RELATIVE_TO_SUPPLIED_BANK"
INCONCLUSIVE = "INCONCLUSIVE"

_MANIFEST_KEYS = frozenset(
    {"schema", "source_num_vars", "base_clauses", "statement_groups"}
)
_GROUP_KEYS = frozenset({"statement_id", "clauses"})
_PLAN_KEYS = frozenset(
    {
        "claims",
        "diagnostics",
        "gated_cnf",
        "plan_sha256",
        "queries",
        "schema",
        "selector_allocation",
        "source",
        "status",
    }
)
_ALLOCATION_KEYS = frozenset(
    {
        "gated_clause_count",
        "gated_clause_start",
        "source_clauses_sha256",
        "statement_id",
        "selector_var",
    }
)
_GATED_CNF_KEYS = frozenset(
    {"clauses", "clauses_sha256", "dimacs_sha256", "num_clauses", "num_vars"}
)
_SOURCE_KEYS = frozenset(
    {
        "base_cnf_sha256",
        "manifest_sha256",
        "source_bank_sha256",
        "source_num_vars",
        "statement_groups_sha256",
    }
)
_STRICT_SUBSUMPTION_KEYS = frozenset(
    {
        "complete",
        "pair_check_budget",
        "pairs",
        "performed_pair_checks",
        "required_pair_checks",
        "status",
    }
)
_STATEMENT_ID = re.compile(r"[A-Za-z0-9][A-Za-z0-9._:-]{0,127}\Z")


class StatementBankError(ValueError):
    """The supplied bank or verdict set violates the fail-closed contract."""


class SolverVerdict(StrEnum):
    """Terminal values understood by the interpretation seam."""

    SAT = "SAT"
    UNSAT = "UNSAT"
    UNKNOWN = "UNKNOWN"


@dataclass(frozen=True)
class StatementGroup:
    """One immutable, nonempty statement group from the supplied bank."""

    statement_id: str
    clauses: tuple[tuple[int, ...], ...]


@dataclass(frozen=True)
class StatementBank:
    """A strictly parsed canonical statement-bank manifest."""

    source_num_vars: int
    base_clauses: tuple[tuple[int, ...], ...]
    statement_groups: tuple[StatementGroup, ...]
    manifest_sha256: str


@dataclass(frozen=True)
class SelectorPlan:
    """A selector-gated CNF and its canonical audit document."""

    document: Mapping[str, Any]
    dimacs_bytes: bytes

    @property
    def plan_sha256(self) -> str:
        return str(self.document["plan_sha256"])


@dataclass(frozen=True)
class AuthenticatedVerdictInputs:
    """Narrow in-memory seam for a future authenticated receipt adapter.

    This type is intentionally not an on-disk solve-receipt schema.  A caller
    must authenticate external receipts and bind them to ``plan_sha256`` before
    constructing this value.
    """

    plan_sha256: str
    baseline: SolverVerdict
    leave_one_out: Mapping[str, SolverVerdict]


def canonical_json_bytes(value: Any) -> bytes:
    """Return the sole accepted JSON serialization for bank artifacts."""

    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), allow_nan=False
    ).encode("utf-8")


def sha256_bytes(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def sha256_json(value: Any) -> str:
    return sha256_bytes(canonical_json_bytes(value))


def _reject_constant(value: str) -> Any:
    raise ValueError(f"non-finite JSON constant: {value}")


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _literal_key(literal: int) -> tuple[int, int]:
    return (abs(literal), 0 if literal < 0 else 1)


def _clause_key(clause: Sequence[int]) -> tuple[tuple[int, int], ...]:
    return tuple(_literal_key(literal) for literal in clause)


def _validate_clause(value: Any, *, where: str, num_vars: int) -> tuple[int, ...]:
    if not isinstance(value, list):
        raise StatementBankError(f"{where} must be a JSON array")
    clause: list[int] = []
    seen: set[int] = set()
    for index, literal in enumerate(value):
        if type(literal) is not int:
            raise StatementBankError(f"{where}[{index}] must be an integer")
        if literal == 0:
            raise StatementBankError(f"{where}[{index}] must not be zero")
        if abs(literal) > num_vars:
            raise StatementBankError(
                f"{where}[{index}] literal {literal} is outside 1..={num_vars}"
            )
        if literal in seen:
            raise StatementBankError(f"{where} repeats literal {literal}")
        if -literal in seen:
            raise StatementBankError(
                f"{where} is tautological at variable {abs(literal)}"
            )
        seen.add(literal)
        clause.append(literal)
    canonical = sorted(clause, key=_literal_key)
    if clause != canonical:
        raise StatementBankError(
            f"{where} is not canonical (literals must increase by variable index)"
        )
    return tuple(clause)


def _validate_clause_sequence(
    value: Any, *, where: str, num_vars: int, nonempty: bool
) -> tuple[tuple[int, ...], ...]:
    if not isinstance(value, list):
        raise StatementBankError(f"{where} must be a JSON array")
    if nonempty and not value:
        raise StatementBankError(f"{where} must be nonempty")
    clauses = tuple(
        _validate_clause(clause, where=f"{where}[{index}]", num_vars=num_vars)
        for index, clause in enumerate(value)
    )
    if list(clauses) != sorted(clauses, key=_clause_key):
        raise StatementBankError(f"{where} must be in canonical clause order")
    return clauses


def load_manifest_bytes(raw: bytes, *, source: str = "<bytes>") -> StatementBank:
    """Parse a canonical manifest, rejecting all normalization opportunities."""

    try:
        text = raw.decode("utf-8")
        value = json.loads(
            text,
            parse_constant=_reject_constant,
            object_pairs_hook=_reject_duplicate_keys,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise StatementBankError(f"{source}: invalid strict JSON: {exc}") from exc
    if not isinstance(value, dict) or set(value) != _MANIFEST_KEYS:
        raise StatementBankError(
            f"{source}: manifest keys must be {sorted(_MANIFEST_KEYS)}"
        )
    if raw != canonical_json_bytes(value):
        raise StatementBankError(f"{source}: manifest is not canonical JSON")
    if value["schema"] != MANIFEST_SCHEMA:
        raise StatementBankError(f"{source}: unsupported schema")

    num_vars = value["source_num_vars"]
    if type(num_vars) is not int or num_vars < 0:
        raise StatementBankError(
            f"{source}: source_num_vars must be a non-negative integer"
        )
    base_clauses = _validate_clause_sequence(
        value["base_clauses"],
        where="base_clauses",
        num_vars=num_vars,
        nonempty=True,
    )

    groups_value = value["statement_groups"]
    if not isinstance(groups_value, list) or not groups_value:
        raise StatementBankError(f"{source}: statement_groups must be a nonempty array")
    groups: list[StatementGroup] = []
    seen_ids: set[str] = set()
    for index, group in enumerate(groups_value):
        where = f"statement_groups[{index}]"
        if not isinstance(group, dict) or set(group) != _GROUP_KEYS:
            raise StatementBankError(f"{where} keys must be {sorted(_GROUP_KEYS)}")
        statement_id = group["statement_id"]
        if not isinstance(statement_id, str) or not _STATEMENT_ID.fullmatch(
            statement_id
        ):
            raise StatementBankError(f"{where}.statement_id is not canonical")
        if statement_id in seen_ids:
            raise StatementBankError(f"duplicate statement_id: {statement_id}")
        seen_ids.add(statement_id)
        clauses = _validate_clause_sequence(
            group["clauses"],
            where=f"{where}.clauses",
            num_vars=num_vars,
            nonempty=True,
        )
        groups.append(StatementGroup(statement_id, clauses))
    statement_ids = [group.statement_id for group in groups]
    if statement_ids != sorted(statement_ids):
        raise StatementBankError("statement_groups must be ordered by statement_id")

    return StatementBank(
        source_num_vars=num_vars,
        base_clauses=base_clauses,
        statement_groups=tuple(groups),
        manifest_sha256=sha256_bytes(raw),
    )


def load_manifest(path: Path) -> StatementBank:
    return load_manifest_bytes(path.read_bytes(), source=str(path))


def _revalidate_statement_bank(bank: StatementBank) -> StatementBank:
    """Reconstruct the canonical manifest and return its strictly parsed bank."""

    if type(bank) is not StatementBank:
        raise StatementBankError("bank must be an exact StatementBank")
    if type(bank.source_num_vars) is not int:
        raise StatementBankError("StatementBank.source_num_vars must be an exact int")
    if type(bank.base_clauses) is not tuple:
        raise StatementBankError("StatementBank.base_clauses must be a tuple")
    if type(bank.statement_groups) is not tuple:
        raise StatementBankError("StatementBank.statement_groups must be a tuple")
    for index, clause in enumerate(bank.base_clauses):
        if type(clause) is not tuple:
            raise StatementBankError(
                f"StatementBank.base_clauses[{index}] must be a tuple"
            )
        for literal_index, literal in enumerate(clause):
            if type(literal) is not int:
                raise StatementBankError(
                    f"StatementBank.base_clauses[{index}][{literal_index}] "
                    "must be an exact int"
                )
    for group_index, group in enumerate(bank.statement_groups):
        if type(group) is not StatementGroup:
            raise StatementBankError(
                f"StatementBank.statement_groups[{group_index}] "
                "must be an exact StatementGroup"
            )
        if type(group.statement_id) is not str:
            raise StatementBankError(
                f"StatementGroup[{group_index}].statement_id must be an exact str"
            )
        if type(group.clauses) is not tuple:
            raise StatementBankError(
                f"StatementGroup[{group_index}].clauses must be a tuple"
            )
        for clause_index, clause in enumerate(group.clauses):
            if type(clause) is not tuple:
                raise StatementBankError(
                    f"StatementGroup[{group_index}].clauses[{clause_index}] "
                    "must be a tuple"
                )
            for literal_index, literal in enumerate(clause):
                if type(literal) is not int:
                    raise StatementBankError(
                        f"StatementGroup[{group_index}].clauses[{clause_index}]"
                        f"[{literal_index}] must be an exact int"
                    )

    manifest = {
        "base_clauses": [list(clause) for clause in bank.base_clauses],
        "schema": MANIFEST_SCHEMA,
        "source_num_vars": bank.source_num_vars,
        "statement_groups": [
            {
                "clauses": [list(clause) for clause in group.clauses],
                "statement_id": group.statement_id,
            }
            for group in bank.statement_groups
        ],
    }
    try:
        raw = canonical_json_bytes(manifest)
    except (TypeError, ValueError) as exc:
        raise StatementBankError(
            f"StatementBank cannot form a canonical manifest: {exc}"
        ) from exc
    validated = load_manifest_bytes(raw, source="<StatementBank round-trip>")
    if (
        type(bank.manifest_sha256) is not str
        or bank.manifest_sha256 != validated.manifest_sha256
    ):
        raise StatementBankError(
            "StatementBank.manifest_sha256 does not match its canonical manifest"
        )
    return validated


def _source_bank_value(bank: StatementBank) -> dict[str, Any]:
    return {
        "base_clauses": [list(clause) for clause in bank.base_clauses],
        "source_num_vars": bank.source_num_vars,
        "statement_groups": [
            {
                "clauses": [list(clause) for clause in group.clauses],
                "statement_id": group.statement_id,
            }
            for group in bank.statement_groups
        ],
    }


def _occurrence(
    kind: str, index: int, statement_id: str | None = None
) -> dict[str, Any]:
    result: dict[str, Any] = {"clause_index": index, "kind": kind}
    if statement_id is not None:
        result["statement_id"] = statement_id
    return result


def _syntactic_diagnostics(
    bank: StatementBank, *, subsumption_pair_check_budget: int
) -> dict[str, Any]:
    if (
        type(subsumption_pair_check_budget) is not int
        or subsumption_pair_check_budget < 0
        or subsumption_pair_check_budget > MAX_SUBSUMPTION_PAIR_CHECK_BUDGET
    ):
        raise StatementBankError(
            "subsumption_pair_check_budget must be an integer in "
            f"0..={MAX_SUBSUMPTION_PAIR_CHECK_BUDGET}"
        )
    occurrences: dict[tuple[int, ...], list[dict[str, Any]]] = {}
    for index, clause in enumerate(bank.base_clauses):
        occurrences.setdefault(clause, []).append(_occurrence("base", index))
    for group in bank.statement_groups:
        for index, clause in enumerate(group.clauses):
            occurrences.setdefault(clause, []).append(
                _occurrence("statement", index, group.statement_id)
            )

    duplicates = [
        {"clause": list(clause), "occurrences": locations}
        for clause, locations in sorted(
            occurrences.items(), key=lambda item: _clause_key(item[0])
        )
        if len(locations) > 1
    ]
    unique_clauses = sorted(occurrences, key=_clause_key)
    required_pair_checks = len(unique_clauses) * (len(unique_clauses) - 1) // 2
    subsumptions: list[dict[str, Any]] = []
    performed_pair_checks = 0
    complete = required_pair_checks <= subsumption_pair_check_budget
    if complete:
        clause_sets = {clause: frozenset(clause) for clause in unique_clauses}
        for left_index, left in enumerate(unique_clauses):
            for right in unique_clauses[left_index + 1 :]:
                performed_pair_checks += 1
                if clause_sets[left] < clause_sets[right]:
                    smaller, larger = left, right
                elif clause_sets[right] < clause_sets[left]:
                    smaller, larger = right, left
                else:
                    continue
                subsumptions.append(
                    {
                        "subsumed_clause": list(larger),
                        "subsumed_occurrences": occurrences[larger],
                        "subsuming_clause": list(smaller),
                        "subsuming_occurrences": occurrences[smaller],
                    }
                )
    return {
        "diagnostic_only": True,
        "exact_duplicate_single_clauses": {
            "duplicate_clause_count": len(duplicates),
            "groups": duplicates,
            "status": "COMPLETE",
        },
        "semantic_redundancy_claimed": False,
        "strict_single_clause_subsumptions": {
            "complete": complete,
            "pair_check_budget": subsumption_pair_check_budget,
            "pairs": subsumptions,
            "performed_pair_checks": performed_pair_checks,
            "required_pair_checks": required_pair_checks,
            "status": "COMPLETE" if complete else "SKIPPED_RESOURCE_BOUND",
        },
    }


def _dimacs_bytes(num_vars: int, clauses: Sequence[Sequence[int]]) -> bytes:
    lines = [f"p cnf {num_vars} {len(clauses)}\n"]
    for clause in clauses:
        body = " ".join(str(literal) for literal in clause)
        lines.append(f"{body} 0\n" if body else "0\n")
    return "".join(lines).encode("ascii")


def _query(
    *,
    kind: str,
    assumptions: list[int],
    gated_cnf_sha256: str,
    statement_id: str | None = None,
) -> dict[str, Any]:
    binding: dict[str, Any] = {
        "assumptions": assumptions,
        "gated_cnf_sha256": gated_cnf_sha256,
        "kind": kind,
    }
    if statement_id is not None:
        binding["statement_id"] = statement_id
    return {**binding, "query_sha256": sha256_json(binding)}


def build_selector_plan(
    bank: StatementBank,
    *,
    subsumption_pair_check_budget: int = DEFAULT_SUBSUMPTION_PAIR_CHECK_BUDGET,
) -> SelectorPlan:
    """Gate every group clause and emit deterministic baseline/omission queries."""

    bank = _revalidate_statement_bank(bank)
    source_bank = _source_bank_value(bank)
    selectors = [
        bank.source_num_vars + index + 1 for index in range(len(bank.statement_groups))
    ]
    gated_clauses: list[list[int]] = [list(clause) for clause in bank.base_clauses]
    allocations: list[dict[str, Any]] = []
    for group, selector in zip(bank.statement_groups, selectors, strict=True):
        start = len(gated_clauses)
        emitted = [[-selector, *clause] for clause in group.clauses]
        gated_clauses.extend(emitted)
        allocations.append(
            {
                "gated_clause_count": len(emitted),
                "gated_clause_start": start,
                "source_clauses_sha256": sha256_json(
                    [list(clause) for clause in group.clauses]
                ),
                "statement_id": group.statement_id,
                "selector_var": selector,
            }
        )

    num_vars = bank.source_num_vars + len(selectors)
    dimacs = _dimacs_bytes(num_vars, gated_clauses)
    gated_cnf_sha256 = sha256_bytes(dimacs)
    baseline = _query(
        kind="BASELINE_ALL_TRUE",
        assumptions=selectors.copy(),
        gated_cnf_sha256=gated_cnf_sha256,
    )
    omissions = []
    for omitted_index, group in enumerate(bank.statement_groups):
        assumptions = [
            -selector if index == omitted_index else selector
            for index, selector in enumerate(selectors)
        ]
        omissions.append(
            _query(
                kind="LEAVE_ONE_GROUP_OUT",
                assumptions=assumptions,
                gated_cnf_sha256=gated_cnf_sha256,
                statement_id=group.statement_id,
            )
        )

    body: dict[str, Any] = {
        "claims": {
            "global_minimum": False,
            "semantic_redundancy_from_diagnostics": False,
            "source_entitlement": False,
            "theorem_closure": False,
        },
        "diagnostics": _syntactic_diagnostics(
            bank,
            subsumption_pair_check_budget=subsumption_pair_check_budget,
        ),
        "gated_cnf": {
            "clauses": gated_clauses,
            "clauses_sha256": sha256_json(gated_clauses),
            "dimacs_sha256": gated_cnf_sha256,
            "num_clauses": len(gated_clauses),
            "num_vars": num_vars,
        },
        "queries": {"baseline": baseline, "leave_one_group_out": omissions},
        "schema": PLAN_SCHEMA,
        "selector_allocation": allocations,
        "source": {
            "base_cnf_sha256": sha256_json(
                {
                    "clauses": source_bank["base_clauses"],
                    "num_vars": bank.source_num_vars,
                }
            ),
            "manifest_sha256": bank.manifest_sha256,
            "source_bank_sha256": sha256_json(source_bank),
            "source_num_vars": bank.source_num_vars,
            "statement_groups_sha256": sha256_json(source_bank["statement_groups"]),
        },
        "status": "SELECTOR_PLAN_ONLY",
    }
    document = {**body, "plan_sha256": sha256_json(body)}
    return SelectorPlan(document=document, dimacs_bytes=dimacs)


def _coerce_verdict(value: object, *, where: str) -> SolverVerdict:
    if isinstance(value, SolverVerdict):
        return value
    raise StatementBankError(f"{where} must be a SolverVerdict")


def _exact_dict(value: Any, keys: frozenset[str], *, where: str) -> dict[str, Any]:
    if not isinstance(value, dict) or set(value) != keys:
        raise StatementBankError(f"{where} is not a canonical plan object")
    return value


def _validate_canonical_json_tree(value: Any, *, where: str) -> None:
    """Reject Python values whose loose equality could conceal plan tampering."""

    if value is None or type(value) in (bool, int, str):
        return
    if type(value) is list:
        for index, item in enumerate(value):
            _validate_canonical_json_tree(item, where=f"{where}[{index}]")
        return
    if type(value) is dict:
        for key, item in value.items():
            if type(key) is not str:
                raise StatementBankError(f"{where} has a non-string key")
            _validate_canonical_json_tree(item, where=f"{where}.{key}")
        return
    raise StatementBankError(f"{where} must use exact canonical JSON types")


def validate_selector_plan(plan: SelectorPlan) -> None:
    """Require that ``plan`` is exactly reproducible by ``build_selector_plan``."""

    if not isinstance(plan, SelectorPlan) or not isinstance(plan.dimacs_bytes, bytes):
        raise StatementBankError("selector plan has the wrong in-memory type")
    document = _exact_dict(plan.document, _PLAN_KEYS, where="selector plan")
    _validate_canonical_json_tree(document, where="selector plan")
    plan_sha256 = document["plan_sha256"]
    if type(plan_sha256) is not str or plan_sha256 != sha256_json(
        {key: value for key, value in document.items() if key != "plan_sha256"}
    ):
        raise StatementBankError(
            "selector plan plan_sha256 does not match its document"
        )
    if document["schema"] != PLAN_SCHEMA or document["status"] != "SELECTOR_PLAN_ONLY":
        raise StatementBankError("selector plan schema or status is invalid")
    source = _exact_dict(document["source"], _SOURCE_KEYS, where="selector plan source")
    source_num_vars = source["source_num_vars"]
    if type(source_num_vars) is not int or source_num_vars < 0:
        raise StatementBankError("selector plan source_num_vars is invalid")
    gated_cnf = _exact_dict(
        document["gated_cnf"], _GATED_CNF_KEYS, where="selector plan gated_cnf"
    )
    clauses = gated_cnf["clauses"]
    if not isinstance(clauses, list):
        raise StatementBankError("selector plan gated clauses are invalid")
    allocations = document["selector_allocation"]
    if not isinstance(allocations, list) or not allocations:
        raise StatementBankError("selector plan allocations must be nonempty")

    checked_allocations = [
        _exact_dict(item, _ALLOCATION_KEYS, where=f"selector allocation {index}")
        for index, item in enumerate(allocations)
    ]
    base_clause_count = checked_allocations[0]["gated_clause_start"]
    if type(base_clause_count) is not int or base_clause_count <= 0:
        raise StatementBankError("selector plan base clause count is invalid")
    if base_clause_count > len(clauses):
        raise StatementBankError("selector plan base clause boundary is invalid")

    statement_groups: list[dict[str, Any]] = []
    cursor = base_clause_count
    for index, allocation in enumerate(checked_allocations):
        statement_id = allocation["statement_id"]
        selector = allocation["selector_var"]
        start = allocation["gated_clause_start"]
        count = allocation["gated_clause_count"]
        if not isinstance(statement_id, str):
            raise StatementBankError("selector plan statement_id is invalid")
        if selector != source_num_vars + index + 1:
            raise StatementBankError("selector plan allocation is not contiguous")
        if start != cursor or type(count) is not int or count <= 0:
            raise StatementBankError("selector plan clause ranges are not contiguous")
        end = cursor + count
        if end > len(clauses):
            raise StatementBankError("selector plan clause range is out of bounds")
        source_clauses: list[list[int]] = []
        for clause in clauses[cursor:end]:
            if (
                not isinstance(clause, list)
                or not clause
                or type(clause[0]) is not int
                or clause[0] != -selector
            ):
                raise StatementBankError(
                    "selector plan contains a malformed gated clause"
                )
            source_clauses.append(clause[1:])
        statement_groups.append(
            {"clauses": source_clauses, "statement_id": statement_id}
        )
        cursor = end
    if cursor != len(clauses):
        raise StatementBankError("selector plan has unallocated gated clauses")

    diagnostics = document["diagnostics"]
    if not isinstance(diagnostics, dict):
        raise StatementBankError("selector plan diagnostics are invalid")
    strict_diagnostics = _exact_dict(
        diagnostics.get("strict_single_clause_subsumptions"),
        _STRICT_SUBSUMPTION_KEYS,
        where="strict subsumption diagnostics",
    )
    budget = strict_diagnostics["pair_check_budget"]
    if (
        type(budget) is not int
        or budget < 0
        or budget > MAX_SUBSUMPTION_PAIR_CHECK_BUDGET
    ):
        raise StatementBankError("selector plan diagnostic budget is invalid")

    reconstructed_manifest = {
        "base_clauses": clauses[:base_clause_count],
        "schema": MANIFEST_SCHEMA,
        "source_num_vars": source_num_vars,
        "statement_groups": statement_groups,
    }
    bank = load_manifest_bytes(
        canonical_json_bytes(reconstructed_manifest),
        source="<selector plan reconstruction>",
    )
    expected = build_selector_plan(bank, subsumption_pair_check_budget=budget)
    if (
        canonical_json_bytes(document) != canonical_json_bytes(expected.document)
        or plan.dimacs_bytes != expected.dimacs_bytes
    ):
        raise StatementBankError("selector plan is not an exact generated plan")


def interpret_authenticated_verdicts(
    plan: SelectorPlan, verdicts: AuthenticatedVerdictInputs
) -> dict[str, Any]:
    """Interpret already-authenticated verdicts with the baseline guard."""

    validate_selector_plan(plan)
    if verdicts.plan_sha256 != plan.plan_sha256:
        raise StatementBankError("authenticated verdicts target a different plan")
    baseline = _coerce_verdict(verdicts.baseline, where="baseline")
    allocations = plan.document["selector_allocation"]
    statement_ids = [item["statement_id"] for item in allocations]
    if set(verdicts.leave_one_out) != set(statement_ids):
        raise StatementBankError(
            "leave_one_out verdict IDs must exactly match the selector plan"
        )

    groups: list[dict[str, str]] = []
    for statement_id in statement_ids:
        omitted = _coerce_verdict(
            verdicts.leave_one_out[statement_id],
            where=f"leave_one_out[{statement_id}]",
        )
        label = INCONCLUSIVE
        if baseline is SolverVerdict.UNSAT:
            if omitted is SolverVerdict.SAT:
                label = ESSENTIAL
            elif omitted is SolverVerdict.UNSAT:
                label = REDUNDANT
        groups.append(
            {
                "label": label,
                "omitted_verdict": omitted.value,
                "statement_id": statement_id,
            }
        )

    body: dict[str, Any] = {
        "baseline_verdict": baseline.value,
        "claims": {
            "global_minimum": False,
            "source_entitlement": False,
            "theorem_closure": False,
        },
        "groups": groups,
        "plan_sha256": plan.plan_sha256,
        "schema": INTERPRETATION_SCHEMA,
        "status": "RELATIVE_TO_SUPPLIED_BANK_ONLY",
    }
    return {**body, "interpretation_sha256": sha256_json(body)}


def _write_new_or_matching(path: Path, payload: bytes) -> None:
    try:
        with path.open("xb") as handle:
            handle.write(payload)
    except FileExistsError:
        if path.read_bytes() != payload:
            raise StatementBankError(
                f"refusing to overwrite different artifact: {path}"
            )


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Build a fail-closed P97 PIQD statement-bank selector plan."
    )
    parser.add_argument("manifest", type=Path)
    parser.add_argument("--plan-output", type=Path)
    parser.add_argument("--cnf-output", type=Path)
    parser.add_argument(
        "--subsumption-pair-check-budget",
        type=int,
        default=DEFAULT_SUBSUMPTION_PAIR_CHECK_BUDGET,
    )
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    parser = _parser()
    args = parser.parse_args(argv)
    try:
        plan = build_selector_plan(
            load_manifest(args.manifest),
            subsumption_pair_check_budget=args.subsumption_pair_check_budget,
        )
        plan_bytes = canonical_json_bytes(plan.document)
        if args.plan_output is None:
            sys.stdout.buffer.write(plan_bytes + b"\n")
        else:
            _write_new_or_matching(args.plan_output, plan_bytes)
        if args.cnf_output is not None:
            _write_new_or_matching(args.cnf_output, plan.dimacs_bytes)
    except (OSError, StatementBankError) as exc:
        parser.error(str(exc))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

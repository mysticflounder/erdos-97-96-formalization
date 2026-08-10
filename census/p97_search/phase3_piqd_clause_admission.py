"""Fail-closed clause novelty checks for PIQD CEGAR admission.

PIQD deliberately knows nothing about the mathematical provenance of a clause.
This module checks the formula-facing part of that boundary: proposed clauses
must be distinct, non-tautological, falsified by the captured model, and not
already implied by one existing root or receipt-chain clause.
"""

from __future__ import annotations

from collections import defaultdict
from collections.abc import Iterable, Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path


class ClauseAdmissionError(ValueError):
    """A proposed PIQD clause batch failed the admission contract."""


@dataclass(frozen=True)
class ClauseAdmissionAudit:
    candidate_clauses: int
    root_clauses_checked: int
    prior_clauses_checked: int
    model_violated_clauses: int
    root_or_prior_subsumptions: int = 0


def _candidate_clause(raw: Sequence[int], *, max_var: int) -> frozenset[int]:
    if not raw:
        raise ClauseAdmissionError("candidate clause is empty")
    if any(type(literal) is not int or literal == 0 for literal in raw):
        raise ClauseAdmissionError("candidate clause has a non-integer or zero literal")
    if any(abs(literal) > max_var for literal in raw):
        raise ClauseAdmissionError("candidate clause exceeds the variable domain")
    clause = frozenset(raw)
    if len(clause) != len(raw):
        raise ClauseAdmissionError("candidate clause repeats a literal")
    if any(-literal in clause for literal in clause):
        raise ClauseAdmissionError("candidate clause is tautological")
    return clause


def _candidate_index(
    candidates: tuple[frozenset[int], ...],
) -> dict[int, frozenset[int]]:
    postings: dict[int, set[int]] = defaultdict(set)
    for index, clause in enumerate(candidates):
        for literal in clause:
            postings[literal].add(index)
    return {literal: frozenset(indices) for literal, indices in postings.items()}


def _subsumed_candidate(
    existing: frozenset[int],
    candidates: tuple[frozenset[int], ...],
    postings: Mapping[int, frozenset[int]],
) -> int | None:
    if not existing or any(-literal in existing for literal in existing):
        return None
    buckets = [postings.get(literal, frozenset()) for literal in existing]
    if not buckets or any(not bucket for bucket in buckets):
        return None
    for index in min(buckets, key=len):
        if existing <= candidates[index]:
            return index
    return None


def _iter_dimacs_clauses(
    path: Path, *, expected_max_var: int, expected_clauses: int
) -> Iterable[frozenset[int]]:
    header_seen = False
    clause: list[int] = []
    count = 0
    with path.open("r", encoding="ascii") as stream:
        for line_number, line in enumerate(stream, start=1):
            stripped = line.strip()
            if not stripped or stripped.startswith("c"):
                continue
            if stripped.startswith("p"):
                if header_seen or clause or count:
                    raise ClauseAdmissionError("misplaced or repeated DIMACS header")
                fields = stripped.split()
                if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
                    raise ClauseAdmissionError("malformed DIMACS header")
                try:
                    max_var, clauses = int(fields[2]), int(fields[3])
                except ValueError as exc:
                    raise ClauseAdmissionError("non-integer DIMACS dimensions") from exc
                if (max_var, clauses) != (expected_max_var, expected_clauses):
                    raise ClauseAdmissionError(
                        "DIMACS dimensions disagree with custody data"
                    )
                header_seen = True
                continue
            if not header_seen:
                raise ClauseAdmissionError("DIMACS clause precedes the header")
            for token in stripped.split():
                try:
                    literal = int(token)
                except ValueError as exc:
                    raise ClauseAdmissionError(
                        f"non-integer DIMACS token at line {line_number}"
                    ) from exc
                if literal == 0:
                    count += 1
                    yield frozenset(clause)
                    clause.clear()
                else:
                    if abs(literal) > expected_max_var:
                        raise ClauseAdmissionError("DIMACS literal exceeds max_var")
                    clause.append(literal)
    if not header_seen:
        raise ClauseAdmissionError("DIMACS header is missing")
    if clause:
        raise ClauseAdmissionError("unterminated DIMACS clause")
    if count != expected_clauses:
        raise ClauseAdmissionError("DIMACS clause count disagrees with the header")


def audit_clause_admission(
    *,
    root_cnf: Path,
    root_clauses: int,
    max_var: int,
    candidates: Sequence[Sequence[int]],
    assignment: Mapping[int, bool],
    prior_batches: Iterable[Iterable[Sequence[int]]] = (),
) -> ClauseAdmissionAudit:
    """Validate that ``candidates`` are genuine model-blocking refinements.

    The test is intentionally stronger than exact deduplication: an existing
    clause that is a subset of a candidate already implies that candidate.
    """

    if max_var < 1 or root_clauses < 1:
        raise ClauseAdmissionError("formula dimensions must be positive")
    normalized = tuple(
        _candidate_clause(clause, max_var=max_var) for clause in candidates
    )
    if not normalized:
        raise ClauseAdmissionError("candidate batch is empty")
    if len(set(normalized)) != len(normalized):
        raise ClauseAdmissionError("candidate batch contains duplicate clauses")
    for left, first in enumerate(normalized):
        for right, second in enumerate(normalized):
            if left != right and first < second:
                raise ClauseAdmissionError("one candidate clause subsumes another")
    for clause in normalized:
        try:
            satisfied = any(
                assignment[abs(literal)] == (literal > 0) for literal in clause
            )
        except KeyError as exc:
            raise ClauseAdmissionError(
                "captured model is incomplete for a candidate"
            ) from exc
        if satisfied:
            raise ClauseAdmissionError(
                "candidate clause is not violated by the captured model"
            )

    postings = _candidate_index(normalized)
    root_checked = 0
    for existing in _iter_dimacs_clauses(
        root_cnf, expected_max_var=max_var, expected_clauses=root_clauses
    ):
        root_checked += 1
        matched = _subsumed_candidate(existing, normalized, postings)
        if matched is not None:
            raise ClauseAdmissionError(
                f"root clause {root_checked} already subsumes candidate {matched + 1}"
            )

    prior_checked = 0
    for batch in prior_batches:
        for raw in batch:
            prior_checked += 1
            existing = frozenset(raw)
            matched = _subsumed_candidate(existing, normalized, postings)
            if matched is not None:
                raise ClauseAdmissionError(
                    f"prior clause {prior_checked} already subsumes candidate {matched + 1}"
                )

    return ClauseAdmissionAudit(
        candidate_clauses=len(normalized),
        root_clauses_checked=root_checked,
        prior_clauses_checked=prior_checked,
        model_violated_clauses=len(normalized),
    )

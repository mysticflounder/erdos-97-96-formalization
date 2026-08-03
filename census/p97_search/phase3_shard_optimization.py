"""Exact, deterministic local transformations for Phase-3 SAT shards.

The transformation in this module is deliberately small and auditable.  A
fixed shard is represented by a consistent tuple of unit literals.  Each
source clause is simplified under those literals, duplicate clauses are
removed, and strict supersets are subsumed.  The shard literals are retained
as unit clauses in the residual formula, so the result can be handed to a
plain DIMACS solver without relying on solver-side assumptions.

This is an optimization contract, not a new source of mathematical cuts.  A
caller must retain the authenticated source clauses and use the hashes and
metadata returned here to replay the transformation independently.
"""

from __future__ import annotations

import hashlib
import json
from collections.abc import Sequence
from dataclasses import dataclass

SCHEMA = "p97-phase3-shard-local-simplification-v1"


class SimplificationError(ValueError):
    """Raised when a shard simplification input is not a valid CNF contract."""


def _canonical_bytes(value: object) -> bytes:
    return json.dumps(
        value,
        ensure_ascii=True,
        sort_keys=True,
        separators=(",", ":"),
    ).encode("ascii")


def _clause_sequence_hash(clauses: Sequence[Sequence[int]]) -> str:
    normalized = [[int(literal) for literal in clause] for clause in clauses]
    return hashlib.sha256(_canonical_bytes(normalized)).hexdigest()


def _validate_literal(literal: int, *, where: str) -> int:
    if type(literal) is not int or literal == 0:
        raise SimplificationError(f"{where}: literal must be a nonzero int")
    return literal


def _normalize_assumptions(assumptions: Sequence[int]) -> tuple[int, ...]:
    result: list[int] = []
    seen: set[int] = set()
    for index, raw_literal in enumerate(assumptions):
        literal = _validate_literal(raw_literal, where=f"assumption {index}")
        if -literal in seen:
            raise SimplificationError(
                "shard assumptions contain both signs of a variable"
            )
        if literal not in seen:
            seen.add(literal)
            result.append(literal)
    return tuple(result)


@dataclass(frozen=True)
class ClauseSimplification:
    """Authenticated result of simplifying one shard-local CNF snapshot."""

    assumptions: tuple[int, ...]
    original_clause_count: int
    original_clause_sha256: str
    residual_clauses: tuple[tuple[int, ...], ...]
    residual_clause_sha256: str
    retained_source_indices: tuple[int, ...]
    satisfied_clause_count: int
    falsified_literal_count: int
    tautological_clause_count: int
    duplicate_clause_count: int
    subsumed_clause_count: int
    empty_clause: bool
    transform_sha256: str

    def as_dict(self) -> dict[str, object]:
        """Return the compact JSON metadata used in solver logs/manifests."""

        retained_index_sha256 = hashlib.sha256(
            _canonical_bytes(list(self.retained_source_indices))
        ).hexdigest()
        return {
            "schema": SCHEMA,
            "assumptions": list(self.assumptions),
            "original_clause_count": self.original_clause_count,
            "original_clause_sha256": self.original_clause_sha256,
            "residual_clause_count": len(self.residual_clauses),
            "residual_clause_sha256": self.residual_clause_sha256,
            "retained_source_count": len(self.retained_source_indices),
            "retained_source_indices_sha256": retained_index_sha256,
            "satisfied_clause_count": self.satisfied_clause_count,
            "falsified_literal_count": self.falsified_literal_count,
            "tautological_clause_count": self.tautological_clause_count,
            "duplicate_clause_count": self.duplicate_clause_count,
            "subsumed_clause_count": self.subsumed_clause_count,
            "empty_clause": self.empty_clause,
            "transform_sha256": self.transform_sha256,
        }


def simplify_clauses(
    clauses: Sequence[Sequence[int]],
    assumptions: Sequence[int],
) -> ClauseSimplification:
    """Simplify ``clauses`` under a fixed, consistent shard assignment.

    The returned residual contains the assumptions as unit clauses followed by
    the retained source clauses.  Consequently

    ``AND(clauses) AND AND(unit assumptions)``

    and ``AND(residual_clauses)`` have the same satisfying assignments.  The
    source order of retained clauses is preserved; only redundant clauses are
    removed.  Literal order inside a retained clause is also preserved after
    falsified literals and duplicate literals are removed.
    """

    normalized_assumptions = _normalize_assumptions(assumptions)
    assumption_set = set(normalized_assumptions)
    original: list[tuple[int, ...]] = []
    for index, raw_clause in enumerate(clauses):
        if not isinstance(raw_clause, Sequence):
            raise SimplificationError(f"clause {index}: expected a sequence")
        clause = tuple(
            _validate_literal(literal, where=f"clause {index}")
            for literal in raw_clause
        )
        original.append(clause)

    source_records: list[tuple[int, tuple[int, ...]]] = []
    seen_keys: set[tuple[int, ...]] = set()
    satisfied_count = 0
    falsified_literal_count = 0
    tautological_count = 0
    duplicate_count = 0

    for index, clause in enumerate(original):
        if any(literal in assumption_set for literal in clause):
            satisfied_count += 1
            continue

        reduced: list[int] = []
        reduced_set: set[int] = set()
        tautological = False
        for literal in clause:
            if -literal in assumption_set:
                falsified_literal_count += 1
                continue
            if literal in reduced_set:
                continue
            if -literal in reduced_set:
                tautological = True
            reduced.append(literal)
            reduced_set.add(literal)
        if tautological:
            tautological_count += 1
            continue

        reduced_clause = tuple(reduced)
        key = tuple(sorted(reduced_clause))
        if key in seen_keys:
            duplicate_count += 1
            continue
        seen_keys.add(key)
        source_records.append((index, reduced_clause))

    # Find a deterministic inclusion-minimal subfamily.  Length and sorted
    # literal tuple make the result independent of incidental hash ordering;
    # source index resolves the remaining tie.
    ordered = sorted(
        source_records,
        key=lambda item: (len(item[1]), tuple(sorted(item[1])), item[0]),
    )
    retained: list[tuple[int, tuple[int, ...]]] = []
    subsumed_count = 0
    retained_sets: list[set[int]] = []
    for index, clause in ordered:
        clause_set = set(clause)
        if any(previous <= clause_set for previous in retained_sets):
            subsumed_count += 1
            continue
        retained.append((index, clause))
        retained_sets.append(clause_set)

    retained.sort(key=lambda item: item[0])
    retained_clauses = tuple(clause for _, clause in retained)
    residual = tuple(
        (literal,) for literal in normalized_assumptions
    ) + retained_clauses
    retained_indices = tuple(index for index, _ in retained)
    empty_clause = any(not clause for clause in residual)

    original_hash = _clause_sequence_hash(original)
    residual_hash = _clause_sequence_hash(residual)
    transform_unsigned = {
        "schema": SCHEMA,
        "assumptions": list(normalized_assumptions),
        "original_clause_sha256": original_hash,
        "residual_clauses": [list(clause) for clause in residual],
        "retained_source_indices": list(retained_indices),
        "satisfied_clause_count": satisfied_count,
        "falsified_literal_count": falsified_literal_count,
        "tautological_clause_count": tautological_count,
        "duplicate_clause_count": duplicate_count,
        "subsumed_clause_count": subsumed_count,
    }
    transform_hash = hashlib.sha256(
        _canonical_bytes(transform_unsigned)
    ).hexdigest()
    return ClauseSimplification(
        assumptions=normalized_assumptions,
        original_clause_count=len(original),
        original_clause_sha256=original_hash,
        residual_clauses=residual,
        residual_clause_sha256=residual_hash,
        retained_source_indices=retained_indices,
        satisfied_clause_count=satisfied_count,
        falsified_literal_count=falsified_literal_count,
        tautological_clause_count=tautological_count,
        duplicate_clause_count=duplicate_count,
        subsumed_clause_count=subsumed_count,
        empty_clause=empty_clause,
        transform_sha256=transform_hash,
    )


__all__ = [
    "SCHEMA",
    "ClauseSimplification",
    "SimplificationError",
    "simplify_clauses",
]

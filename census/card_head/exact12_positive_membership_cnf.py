"""Deterministic CNF compiler for proof-backed positive row memberships.

An exact-12 row is selected by a one-hot choice variable.  A Lean
``SourceOrderPositiveNogood`` may need only a subset of that four-point row.
For each required subset ``S`` at center ``c`` this compiler allocates a
pattern variable ``p(c,S)`` and installs

    selected(c, K) -> p(c,S)

for every candidate row ``K`` containing ``S``.  A complete proof-backed
membership pattern is then excluded by one clause negating its pattern
variables.  Reverse implications are unnecessary: after projection over the
auxiliary variables, the block excludes exactly the selected rows containing
all required subsets.

This module only compiles the Boolean delta.  Source authentication and Lean
declaration binding belong to the caller.
"""

from __future__ import annotations

import hashlib
import json
from collections.abc import Collection, Mapping, Sequence
from dataclasses import dataclass
from typing import Any

from .sat_encoding import CoverInstance

SCHEMA = "p97_exact12_positive_membership_cnf.v1"


class PositiveMembershipCnfError(ValueError):
    """Raised when a membership pattern or compiled delta is malformed."""


MembershipKey = tuple[tuple[int, tuple[int, ...]], ...]


def _sha256_json(value: object) -> str:
    payload = json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("ascii")
    return hashlib.sha256(payload).hexdigest()


def normalize_memberships(
    cardinality: int, choices: Sequence[Mapping[str, Any]]
) -> MembershipKey:
    """Validate choices and merge repeated centers by support union."""

    if type(cardinality) is not int or cardinality <= 0:
        raise PositiveMembershipCnfError("cardinality must be positive")
    if isinstance(choices, (str, bytes)) or not isinstance(choices, Sequence):
        raise PositiveMembershipCnfError("choices must be a sequence")
    merged: dict[int, set[int]] = {}
    for index, choice in enumerate(choices):
        if not isinstance(choice, Mapping) or set(choice) != {"center", "support"}:
            raise PositiveMembershipCnfError(f"choice {index} is malformed")
        center = choice["center"]
        support = choice["support"]
        if type(center) is not int or not 0 <= center < cardinality:
            raise PositiveMembershipCnfError(f"choice {index} has invalid center")
        if isinstance(support, (str, bytes)) or not isinstance(support, Collection):
            raise PositiveMembershipCnfError(f"choice {index} has invalid support")
        points = list(support)
        if (
            not points
            or len(points) > 4
            or any(type(point) is not int for point in points)
            or any(not 0 <= point < cardinality for point in points)
            or center in points
            or len(points) != len(set(points))
        ):
            raise PositiveMembershipCnfError(f"choice {index} has invalid support")
        merged.setdefault(center, set()).update(points)

    if not merged:
        raise PositiveMembershipCnfError("an empty pattern would exclude every cube")
    for center, required in merged.items():
        if len(required) > 4:
            raise PositiveMembershipCnfError(
                f"merged support at center {center} exceeds row cardinality"
            )
    return tuple(
        (center, tuple(sorted(required))) for center, required in sorted(merged.items())
    )


@dataclass(frozen=True)
class CompiledPositiveMembershipBank:
    """Authenticated-data payload for one deterministic membership delta."""

    pattern_keys: tuple[MembershipKey, ...]
    pattern_definitions: tuple[dict[str, Any], ...]
    entries: tuple[dict[str, Any], ...]
    initial_n_variables: int
    initial_n_clauses: int
    final_n_variables: int
    final_n_clauses: int
    delta_clauses: tuple[tuple[int, ...], ...]
    delta_sha256: str

    def as_dict(self) -> dict[str, Any]:
        return {
            "schema": SCHEMA,
            "pattern_keys": [
                [
                    {"center": center, "required": list(required)}
                    for center, required in key
                ]
                for key in self.pattern_keys
            ],
            "pattern_definitions": list(self.pattern_definitions),
            "entries": list(self.entries),
            "initial_n_variables": self.initial_n_variables,
            "initial_n_clauses": self.initial_n_clauses,
            "final_n_variables": self.final_n_variables,
            "final_n_clauses": self.final_n_clauses,
            "delta_clauses": [list(clause) for clause in self.delta_clauses],
            "delta_sha256": self.delta_sha256,
        }


def compile_positive_membership_bank(
    instance: CoverInstance,
    patterns: Sequence[Sequence[Mapping[str, Any]]],
) -> CompiledPositiveMembershipBank:
    """Install and return the canonical auxiliary CNF for ``patterns``.

    The instance must not already contain pattern variables.  This makes the
    variable allocation and complete clause delta independent of caller state
    beyond the authenticated parent CNF.
    """

    if instance.model.cardinality != 12:
        raise PositiveMembershipCnfError("membership bank requires cardinality 12")
    if instance.pattern_variables:
        raise PositiveMembershipCnfError("pattern variables are already installed")
    normalized = tuple(
        normalize_memberships(instance.model.cardinality, choices)
        for choices in patterns
    )
    if not normalized:
        raise PositiveMembershipCnfError("membership bank is empty")
    if len(normalized) != len(set(normalized)):
        raise PositiveMembershipCnfError("membership bank contains a duplicate pattern")

    initial_n_variables = instance.cnf.n_variables
    initial_n_clauses = len(instance.cnf.clauses)
    unique_requirements = sorted({item for pattern in normalized for item in pattern})
    definitions: list[dict[str, Any]] = []
    variables: dict[tuple[int, tuple[int, ...]], int] = {}

    for center, required in unique_requirements:
        hits = [
            index
            for index, candidate in enumerate(instance.candidates[center])
            if set(required) <= set(candidate)
        ]
        if not hits:
            raise PositiveMembershipCnfError(
                f"membership ({center}, {required}) has no candidate realization"
            )
        before = len(instance.cnf.clauses)
        variable = instance.pattern_variable(center, required)
        implications = tuple(instance.cnf.clauses[before:])
        candidate_variables = tuple(
            instance.choice_variables[(center, index)] for index in hits
        )
        expected = tuple((-choice_variable, variable) for choice_variable in candidate_variables)
        if implications != expected:
            raise PositiveMembershipCnfError("pattern implication compiler drifted")
        variables[(center, required)] = variable
        definitions.append(
            {
                "center": center,
                "required": list(required),
                "pattern_variable": variable,
                "candidate_indices": hits,
                "candidate_variables": list(candidate_variables),
                "implication_clauses": [list(clause) for clause in implications],
                "implication_clauses_sha256": _sha256_json(implications),
            }
        )

    entries: list[dict[str, Any]] = []
    seen_blocks: set[tuple[int, ...]] = set()
    for index, pattern in enumerate(normalized):
        block = tuple(-variables[item] for item in pattern)
        if block in seen_blocks:
            raise PositiveMembershipCnfError("membership block is duplicated")
        instance.cnf.add_clause(block)
        seen_blocks.add(block)
        requirements = [
            {"center": center, "required": list(required)}
            for center, required in pattern
        ]
        entries.append(
            {
                "index": index,
                "requirements": requirements,
                "requirements_sha256": _sha256_json(requirements),
                "blocking_clause": list(block),
                "blocking_clause_sha256": _sha256_json(block),
            }
        )

    delta = tuple(instance.cnf.clauses[initial_n_clauses:])
    return CompiledPositiveMembershipBank(
        pattern_keys=normalized,
        pattern_definitions=tuple(definitions),
        entries=tuple(entries),
        initial_n_variables=initial_n_variables,
        initial_n_clauses=initial_n_clauses,
        final_n_variables=instance.cnf.n_variables,
        final_n_clauses=len(instance.cnf.clauses),
        delta_clauses=delta,
        delta_sha256=_sha256_json(delta),
    )


__all__ = [
    "SCHEMA",
    "CompiledPositiveMembershipBank",
    "PositiveMembershipCnfError",
    "compile_positive_membership_bank",
    "normalize_memberships",
]

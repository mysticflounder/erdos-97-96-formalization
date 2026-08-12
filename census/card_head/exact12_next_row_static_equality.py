"""Static equality-closure extension for the exact-12 next-row lane.

This module promotes only the duplicate-center layer of the earlier scratch
benchmark.  It introduces one Boolean variable for equality of each pair of
the 66 undirected metric edges, forces selected four-point rows into that
relation, closes the relation transitively, and forbids two distinct centers
from sharing one three-point radius class.

The compiler is deterministic finite infrastructure.  Its clauses do not by
themselves prove terminal UNSAT or close a Lean theorem; promotion additionally
requires the source valuation bridge and checked terminal certificate ingress.
"""

from __future__ import annotations

import hashlib
import json
from collections.abc import Collection, Mapping
from dataclasses import dataclass
from itertools import combinations
from types import MappingProxyType

from .sat_encoding import CoverInstance
from .source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)

STATIC_EQUALITY_SCHEMA = "p97_rigid221_exact12_next_row_static_equality.v1"
SEMANTIC_STATUS = "FINITE_AUXILIARY_EXTENSION_REQUIRES_LEAN_VALUATION_BRIDGE"
LEAN_GEOMETRY_KERNEL = (
    "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
    "DuplicateCenterNogood.not_realizes_of_positiveCheck"
)

N = 12
EXPECTED_EDGE_COUNT = 66
EXPECTED_RELATION_VARIABLES = 2_145
EXPECTED_ROW_IMPLICATION_CLAUSES = 18_240
EXPECTED_TRANSITIVITY_CLAUSES = 137_280
EXPECTED_DUPLICATE_CENTER_CLAUSES = 7_920


class Exact12NextRowStaticEqualityError(ValueError):
    """The finite instance or auxiliary valuation violates the frozen contract."""


@dataclass(frozen=True)
class StaticEqualityLayout:
    """Frozen variable layout and clause delta for one installed extension."""

    edges: tuple[tuple[int, int], ...]
    relation_variables: Mapping[tuple[int, int], int]
    initial_n_variables: int
    initial_n_clauses: int
    final_n_variables: int
    final_n_clauses: int
    row_implication_clauses: int
    transitivity_clauses: int
    duplicate_center_clauses: int
    clause_delta: tuple[tuple[int, ...], ...]
    initial_cnf_sha256: str
    final_cnf_sha256: str
    clause_delta_sha256: str
    relation_variable_map_sha256: str

    @property
    def added_variables(self) -> int:
        return self.final_n_variables - self.initial_n_variables

    @property
    def added_clauses(self) -> int:
        return self.final_n_clauses - self.initial_n_clauses

    def manifest(self) -> dict[str, object]:
        return {
            "schema": STATIC_EQUALITY_SCHEMA,
            "semantic_status": SEMANTIC_STATUS,
            "lean_geometry_kernel": LEAN_GEOMETRY_KERNEL,
            "scope": (
                "exact-12 next-row finite duplicate-center equality extension; "
                "not terminal UNSAT, aggregate coverage, or Lean closure"
            ),
            "counts": {
                "edges": len(self.edges),
                "relation_variables": len(self.relation_variables),
                "row_implication_clauses": self.row_implication_clauses,
                "transitivity_clauses": self.transitivity_clauses,
                "duplicate_center_clauses": self.duplicate_center_clauses,
                "added_variables": self.added_variables,
                "added_clauses": self.added_clauses,
            },
            "hashes": {
                "initial_cnf_sha256": self.initial_cnf_sha256,
                "final_cnf_sha256": self.final_cnf_sha256,
                "clause_delta_sha256": self.clause_delta_sha256,
                "relation_variable_map_sha256": self.relation_variable_map_sha256,
            },
        }


class _UnionFind:
    def __init__(self, size: int) -> None:
        self.parent = list(range(size))

    def find(self, value: int) -> int:
        while self.parent[value] != value:
            self.parent[value] = self.parent[self.parent[value]]
            value = self.parent[value]
        return value

    def union(self, left: int, right: int) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[right_root] = left_root


def _validate_instance(instance: CoverInstance) -> None:
    if type(instance) is not SourceFaithfulCoverInstance:
        raise Exact12NextRowStaticEqualityError(
            "instance must be the exact source-faithful candidate class"
        )
    if getattr(instance, "schema", None) != SOURCE_FAITHFUL_CANDIDATE_SCHEMA:
        raise Exact12NextRowStaticEqualityError(
            "instance is not the frozen source-faithful candidate surface"
        )
    if instance.model.cardinality != N:
        raise Exact12NextRowStaticEqualityError("instance must have cardinality 12")
    if tuple(instance.model.profile) != SOURCE_FAITHFUL_PYTHON_PROFILE:
        raise Exact12NextRowStaticEqualityError(
            "instance has the wrong exact-12 profile"
        )
    if instance.pattern_variables or instance.exclusion_clauses:
        raise Exact12NextRowStaticEqualityError(
            "install the static extension before any learned pattern bank"
        )
    if hasattr(instance, "_exact12_next_row_static_equality_layout"):
        raise Exact12NextRowStaticEqualityError(
            "static equality extension is already installed"
        )


def _canonical_json_sha256(value: object) -> str:
    payload = json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("ascii")
    return hashlib.sha256(payload).hexdigest()


def install_static_duplicate_center_extension(
    instance: SourceFaithfulCoverInstance,
) -> StaticEqualityLayout:
    """Install the deterministic duplicate-center equality extension once."""

    _validate_instance(instance)
    labels = tuple(range(N))
    edges = tuple(combinations(labels, 2))
    edge_index = {edge: index for index, edge in enumerate(edges)}
    relation: dict[tuple[int, int], int] = {}
    initial_n_variables = instance.cnf.n_variables
    initial_n_clauses = len(instance.cnf.clauses)
    initial_cnf_sha256 = hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest()

    for left, right in combinations(range(len(edges)), 2):
        relation[(left, right)] = instance.cnf.new_variable()

    def edge(left: int, right: int) -> int:
        return edge_index[tuple(sorted((left, right)))]

    def equal_variable(left: int, right: int) -> int:
        if left == right:
            raise Exact12NextRowStaticEqualityError(
                "an obstruction requested equality of one edge with itself"
            )
        return relation[tuple(sorted((left, right)))]

    row_implication_clauses = 0
    for center in labels:
        for candidate_index, support in enumerate(instance.candidates[center]):
            choice = instance.choice_variables[(center, candidate_index)]
            incident = tuple(edge(center, point) for point in support)
            for left, right in combinations(incident, 2):
                instance.cnf.add_clause((-choice, equal_variable(left, right)))
                row_implication_clauses += 1

    transitivity_clauses = 0
    for first, second, third in combinations(range(len(edges)), 3):
        first_second = relation[(first, second)]
        first_third = relation[(first, third)]
        second_third = relation[(second, third)]
        instance.cnf.add_clause((-first_second, -second_third, first_third))
        instance.cnf.add_clause((-first_second, -first_third, second_third))
        instance.cnf.add_clause((-first_third, -second_third, first_second))
        transitivity_clauses += 3

    duplicate_center_clauses = 0
    for first_center, second_center in combinations(labels, 2):
        remaining = tuple(
            label for label in labels if label not in (first_center, second_center)
        )
        for first, second, third in combinations(remaining, 3):
            instance.cnf.add_clause(
                tuple(
                    -variable
                    for variable in (
                        equal_variable(
                            edge(first_center, first), edge(first_center, second)
                        ),
                        equal_variable(
                            edge(first_center, first), edge(first_center, third)
                        ),
                        equal_variable(
                            edge(second_center, first), edge(second_center, second)
                        ),
                        equal_variable(
                            edge(second_center, first), edge(second_center, third)
                        ),
                    )
                )
            )
            duplicate_center_clauses += 1

    clause_delta = tuple(instance.cnf.clauses[initial_n_clauses:])
    relation_payload = [
        [left, right, variable] for (left, right), variable in sorted(relation.items())
    ]
    layout = StaticEqualityLayout(
        edges=edges,
        relation_variables=MappingProxyType(relation.copy()),
        initial_n_variables=initial_n_variables,
        initial_n_clauses=initial_n_clauses,
        final_n_variables=instance.cnf.n_variables,
        final_n_clauses=len(instance.cnf.clauses),
        row_implication_clauses=row_implication_clauses,
        transitivity_clauses=transitivity_clauses,
        duplicate_center_clauses=duplicate_center_clauses,
        clause_delta=clause_delta,
        initial_cnf_sha256=initial_cnf_sha256,
        final_cnf_sha256=hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest(),
        clause_delta_sha256=_canonical_json_sha256(clause_delta),
        relation_variable_map_sha256=_canonical_json_sha256(relation_payload),
    )
    expected = (
        EXPECTED_EDGE_COUNT,
        EXPECTED_RELATION_VARIABLES,
        EXPECTED_ROW_IMPLICATION_CLAUSES,
        EXPECTED_TRANSITIVITY_CLAUSES,
        EXPECTED_DUPLICATE_CENTER_CLAUSES,
    )
    observed = (
        len(layout.edges),
        len(layout.relation_variables),
        layout.row_implication_clauses,
        layout.transitivity_clauses,
        layout.duplicate_center_clauses,
    )
    if observed != expected:
        raise Exact12NextRowStaticEqualityError(
            f"static equality count drift: expected {expected}, observed {observed}"
        )
    # Keep only a copy-safe installation marker on the mutable SAT instance.
    # The immutable layout is returned to the caller and contains a
    # ``MappingProxyType`` that intentionally rejects mutation but cannot be
    # deep-copied by the transactional journal replayer.
    instance._exact12_next_row_static_equality_layout = True
    return layout


def canonical_relation_assignment(
    instance: SourceFaithfulCoverInstance,
    layout: StaticEqualityLayout,
    cube: Mapping[int, Collection[int]],
) -> frozenset[int]:
    """Return the minimal row-generated equality closure for a decoded cube."""

    if tuple(layout.edges) != tuple(combinations(range(N), 2)):
        raise Exact12NextRowStaticEqualityError("layout edge order is not canonical")
    edge_index = {edge: index for index, edge in enumerate(layout.edges)}
    closure = _UnionFind(len(layout.edges))
    if set(cube) != set(range(N)):
        raise Exact12NextRowStaticEqualityError(
            "cube must contain exactly the twelve centers"
        )
    for center in range(N):
        support = tuple(sorted(cube[center]))
        try:
            instance.candidate_index(center, support)
        except Exception as exc:
            raise Exact12NextRowStaticEqualityError(
                f"cube row at center {center} is outside the candidate surface"
            ) from exc
        incident = [edge_index[tuple(sorted((center, point)))] for point in support]
        reference = incident[0]
        for other in incident[1:]:
            closure.union(reference, other)
    return frozenset(
        variable
        for (left, right), variable in layout.relation_variables.items()
        if closure.find(left) == closure.find(right)
    )


def clause_satisfied(clause: Collection[int], true_variables: Collection[int]) -> bool:
    """Evaluate one CNF clause under a complete set-of-positive assignment."""

    positive = set(true_variables)
    return any(
        (literal > 0 and literal in positive)
        or (literal < 0 and -literal not in positive)
        for literal in clause
    )


def canonical_extension_satisfies_delta(
    instance: SourceFaithfulCoverInstance,
    layout: StaticEqualityLayout,
    cube: Mapping[int, Collection[int]],
) -> bool:
    """Check the canonical selected-row/equality valuation on the new clauses."""

    selected = {
        instance.choice_variables[(center, instance.candidate_index(center, row))]
        for center, row in cube.items()
    }
    true_variables = selected | set(
        canonical_relation_assignment(instance, layout, cube)
    )
    return all(
        clause_satisfied(clause, true_variables) for clause in layout.clause_delta
    )

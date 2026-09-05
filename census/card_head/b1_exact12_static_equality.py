# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Diagnostic static metric-equality extension for exact-12 B1 cells.

The extension gives each pair of the 66 undirected metric edges a Boolean
equality variable.  Selected rows force their six incident-edge equalities,
the relation is closed transitively, and a generic duplicate-three-point-
center obstruction is imposed.  One additional unit records that ``q`` and
``r`` lie on the physical circle centered at ``A2``.

This is finite discovery infrastructure only.  In particular, it does not
provide the generic labeled metric valuation, its Lean ingress, exact-12
coverage, or a lift to other cardinalities.
"""

from __future__ import annotations

import hashlib
import json
from collections.abc import Callable, Collection, Mapping
from dataclasses import dataclass
from itertools import combinations
from types import MappingProxyType
from typing import Any

from .b1_exact12_structural import (
    A2,
    B1SourceSafeCoverInstance,
    CompiledB1Exact12Cell,
)
from .b1_exact12_structural import SCHEMA as B1_STRUCTURAL_SCHEMA

STATIC_EQUALITY_SCHEMA = "p97_b1_exact12_static_equality.v1"
SEMANTIC_STATUS = "diagnostic_exact12_metric_equality_only"
PROMOTION_ELIGIBLE = False
SCOPE = (
    "Exact-12 B1 static equality discovery over one compiled structural cell; "
    "not a metric valuation ingress, coverage theorem, certificate, "
    "cardinality lift, or Lean closure"
)
N = 12
EXPECTED_EDGE_COUNT = 66
EXPECTED_RELATION_VARIABLES = 2_145
ROW_IMPLICATIONS_PER_CANDIDATE = 6
EXPECTED_TRANSITIVITY_CLAUSES = 137_280
EXPECTED_DUPLICATE_CENTER_CLAUSES = 7_920
EXPECTED_PHYSICAL_APEX_UNIT_CLAUSES = 1

INCLUDED_RULES = (
    "selected_row_six_incident_edge_equalities",
    "edge_equality_transitivity",
    "generic_duplicate_three_point_center_obstruction",
    "physical_apex_q_r_radius_equality",
)
OMITTED_RULES = (
    "dedicated_common_blocker_q_r_positive_equality_unit",
    "dedicated_u_blocker_live_slice_positive_equality_units",
    "dedicated_v_blocker_live_slice_positive_equality_units",
    "generic_labeled_metric_valuation_ingress",
    "metric_realizability_and_convex_boundary_order",
    "exact12_coverage_and_all_other_cardinality_lifts",
    "checked_certificate_and_named_Lean_consumer",
)
FINITE_INGRESS_GAPS = (
    "generic_selected_row_to_labeled_radius_equalities",
    "generic_labeled_edge_relation_to_source_squared_distances",
    "generic_duplicate_center_obstruction_for_the_labeled_cube",
    "B1_physical_apex_circle_membership_to_the_q_r_unit_clause",
)
SOURCE_CLAUSE_LEDGER: tuple[Mapping[str, Any], ...] = (
    {
        "rule": "selected_row_six_incident_edge_equalities",
        "source": "each selected four-class is a common-radius row",
        "status": "source_semantics_missing_generic_labeled_metric_ingress",
    },
    {
        "rule": "edge_equality_transitivity",
        "source": "transitivity of equality of squared-distance values",
        "status": "definitional_metric_semantics_missing_labeled_valuation",
    },
    {
        "rule": "generic_duplicate_three_point_center_obstruction",
        "source": (
            "distinct Euclidean centers cannot both be equidistant from the same "
            "three noncollinear points"
        ),
        "status": "geometry_kernel_missing_generic_labeled_valuation_ingress",
    },
    {
        "rule": "physical_apex_q_r_radius_equality",
        "source": (
            "ExactFourMutualOmissionJointDeletion.deleted_mem_class for q and "
            "r, followed by mem_selectedClass at the physical apex"
        ),
        "status": "B1_source_fact_missing_generic_labeled_metric_ingress",
    },
)


class B1Exact12StaticEqualityError(ValueError):
    """The B1 finite instance, compiler state, or replay is malformed."""


@dataclass(frozen=True)
class B1StaticEqualityLayout:
    """Frozen variable layout and authenticated clause delta."""

    edges: tuple[tuple[int, int], ...]
    relation_variables: Mapping[tuple[int, int], int]
    initial_n_variables: int
    initial_n_clauses: int
    final_n_variables: int
    final_n_clauses: int
    row_implication_clauses: int
    transitivity_clauses: int
    duplicate_center_clauses: int
    physical_apex_unit_clauses: int
    physical_apex_q: int
    physical_apex_r: int
    physical_apex_relation_variable: int
    clause_delta: tuple[tuple[int, ...], ...]
    structural_manifest_sha256: str
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

    def _manifest_payload(self) -> dict[str, Any]:
        return {
            "schema": STATIC_EQUALITY_SCHEMA,
            "semantic_status": SEMANTIC_STATUS,
            "promotion_eligible": PROMOTION_ELIGIBLE,
            "scope": SCOPE,
            "counts": {
                "edges": len(self.edges),
                "relation_variables": len(self.relation_variables),
                "initial_variables": self.initial_n_variables,
                "initial_clauses": self.initial_n_clauses,
                "final_variables": self.final_n_variables,
                "final_clauses": self.final_n_clauses,
                "row_implication_clauses": self.row_implication_clauses,
                "transitivity_clauses": self.transitivity_clauses,
                "duplicate_center_clauses": self.duplicate_center_clauses,
                "physical_apex_unit_clauses": self.physical_apex_unit_clauses,
                "added_variables": self.added_variables,
                "added_clauses": self.added_clauses,
            },
            "physical_apex_equality": {
                "apex": A2,
                "q": self.physical_apex_q,
                "r": self.physical_apex_r,
                "variable": self.physical_apex_relation_variable,
            },
            "hashes": {
                "structural_manifest_sha256": self.structural_manifest_sha256,
                "initial_cnf_sha256": self.initial_cnf_sha256,
                "final_cnf_sha256": self.final_cnf_sha256,
                "clause_delta_sha256": self.clause_delta_sha256,
                "relation_variable_map_sha256": (
                    self.relation_variable_map_sha256
                ),
            },
            "included_rules": list(INCLUDED_RULES),
            "omitted_rules": list(OMITTED_RULES),
            "finite_ingress_gaps": list(FINITE_INGRESS_GAPS),
            "source_clause_ledger": [dict(entry) for entry in SOURCE_CLAUSE_LEDGER],
        }

    def manifest(self) -> dict[str, Any]:
        payload = self._manifest_payload()
        return {**payload, "manifest_sha256": _canonical_json_sha256(payload)}


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


def _canonical_json_sha256(value: object) -> str:
    payload = json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("ascii")
    return hashlib.sha256(payload).hexdigest()


def _cnf_sha256(instance: B1SourceSafeCoverInstance) -> str:
    return hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest()


def _structural_manifest_sha256(compiled: CompiledB1Exact12Cell) -> str:
    return _canonical_json_sha256(compiled.manifest())


def _relation_payload(
    relation: Mapping[tuple[int, int], int],
) -> list[list[int]]:
    return [
        [left, right, variable]
        for (left, right), variable in sorted(relation.items())
    ]


def _validate_structural_state(
    instance: B1SourceSafeCoverInstance,
    compiled: CompiledB1Exact12Cell,
    *,
    require_uninstalled: bool,
) -> None:
    if type(instance) is not B1SourceSafeCoverInstance:
        raise B1Exact12StaticEqualityError(
            "instance must be an exact B1 source-safe cover instance"
        )
    if type(compiled) is not CompiledB1Exact12Cell:
        raise B1Exact12StaticEqualityError("compiled cell has the wrong type")
    if (
        getattr(instance, "schema", None) != B1_STRUCTURAL_SCHEMA
        or instance.model.cardinality != N
    ):
        raise B1Exact12StaticEqualityError("instance is not an exact-12 B1 instance")
    if instance.model.profile != compiled.cell.profile:
        raise B1Exact12StaticEqualityError(
            "instance profile does not match the compiled cell"
        )
    if instance.pattern_variables or instance.exclusion_clauses:
        raise B1Exact12StaticEqualityError(
            "static equality requires an instance without learned pattern clauses"
        )
    if (
        compiled.base_n_variables != instance.base_n_variables
        or compiled.base_n_clauses != instance.base_n_clauses
        or compiled.final_n_variables != compiled.base_n_variables
        or compiled.final_n_clauses
        != compiled.base_n_clauses + len(compiled.clause_delta)
        or compiled.clause_delta_sha256
        != _canonical_json_sha256(compiled.clause_delta)
    ):
        raise B1Exact12StaticEqualityError("compiled structural metadata is malformed")
    if compiled.clause_delta != tuple(
        instance.cnf.clauses[
            compiled.base_n_clauses : compiled.final_n_clauses
        ]
    ):
        raise B1Exact12StaticEqualityError(
            "compiled structural clause delta does not match the instance"
        )
    installed = getattr(instance, "_b1_exact12_static_equality_layout", None)
    if require_uninstalled:
        if installed is not None:
            raise B1Exact12StaticEqualityError(
                "static equality extension is already installed"
            )
        if (
            instance.cnf.n_variables != compiled.final_n_variables
            or len(instance.cnf.clauses) != compiled.final_n_clauses
        ):
            raise B1Exact12StaticEqualityError(
                "instance has changed since structural compilation"
            )


def _edge_helpers(
    edges: tuple[tuple[int, int], ...],
    relation: Mapping[tuple[int, int], int],
) -> tuple[Callable[[int, int], int], Callable[[int, int], int]]:
    edge_index = {edge: index for index, edge in enumerate(edges)}

    def edge(left: int, right: int) -> int:
        if left == right:
            raise B1Exact12StaticEqualityError("a metric edge needs two endpoints")
        try:
            return edge_index[tuple(sorted((left, right)))]
        except KeyError as exc:
            raise B1Exact12StaticEqualityError(
                "a metric edge endpoint is outside the exact-12 model"
            ) from exc

    def equal_variable(left: int, right: int) -> int:
        if left == right:
            raise B1Exact12StaticEqualityError(
                "equality of one metric edge with itself has no relation variable"
            )
        try:
            return relation[tuple(sorted((left, right)))]
        except KeyError as exc:
            raise B1Exact12StaticEqualityError(
                "metric equality relation variable is absent"
            ) from exc

    return edge, equal_variable


def install_static_equality_extension(
    instance: B1SourceSafeCoverInstance,
    compiled: CompiledB1Exact12Cell,
) -> B1StaticEqualityLayout:
    """Install the deterministic B1 metric-equality extension exactly once."""

    _validate_structural_state(instance, compiled, require_uninstalled=True)
    labels = tuple(range(N))
    edges = tuple(combinations(labels, 2))
    relation: dict[tuple[int, int], int] = {}
    initial_n_variables = instance.cnf.n_variables
    initial_n_clauses = len(instance.cnf.clauses)
    initial_cnf_sha256 = _cnf_sha256(instance)

    for left, right in combinations(range(len(edges)), 2):
        relation[(left, right)] = instance.cnf.new_variable()
    edge, equal_variable = _edge_helpers(edges, relation)

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

    apex_q = edge(A2, compiled.cell.q)
    apex_r = edge(A2, compiled.cell.r)
    physical_apex_relation_variable = equal_variable(apex_q, apex_r)
    instance.cnf.add_clause((physical_apex_relation_variable,))

    clause_delta = tuple(instance.cnf.clauses[initial_n_clauses:])
    layout = B1StaticEqualityLayout(
        edges=edges,
        relation_variables=MappingProxyType(relation.copy()),
        initial_n_variables=initial_n_variables,
        initial_n_clauses=initial_n_clauses,
        final_n_variables=instance.cnf.n_variables,
        final_n_clauses=len(instance.cnf.clauses),
        row_implication_clauses=row_implication_clauses,
        transitivity_clauses=transitivity_clauses,
        duplicate_center_clauses=duplicate_center_clauses,
        physical_apex_unit_clauses=EXPECTED_PHYSICAL_APEX_UNIT_CLAUSES,
        physical_apex_q=compiled.cell.q,
        physical_apex_r=compiled.cell.r,
        physical_apex_relation_variable=physical_apex_relation_variable,
        clause_delta=clause_delta,
        structural_manifest_sha256=_structural_manifest_sha256(compiled),
        initial_cnf_sha256=initial_cnf_sha256,
        final_cnf_sha256=_cnf_sha256(instance),
        clause_delta_sha256=_canonical_json_sha256(clause_delta),
        relation_variable_map_sha256=_canonical_json_sha256(
            _relation_payload(relation)
        ),
    )
    expected = (
        EXPECTED_EDGE_COUNT,
        EXPECTED_RELATION_VARIABLES,
        ROW_IMPLICATIONS_PER_CANDIDATE
        * sum(len(rows) for rows in instance.candidates.values()),
        EXPECTED_TRANSITIVITY_CLAUSES,
        EXPECTED_DUPLICATE_CENTER_CLAUSES,
        EXPECTED_PHYSICAL_APEX_UNIT_CLAUSES,
    )
    observed = (
        len(layout.edges),
        len(layout.relation_variables),
        layout.row_implication_clauses,
        layout.transitivity_clauses,
        layout.duplicate_center_clauses,
        layout.physical_apex_unit_clauses,
    )
    if observed != expected:
        raise B1Exact12StaticEqualityError(
            f"static equality count drift: expected {expected}, observed {observed}"
        )
    instance._b1_exact12_static_equality_layout = layout.manifest()[
        "manifest_sha256"
    ]
    return layout


def _validate_layout(
    instance: B1SourceSafeCoverInstance,
    compiled: CompiledB1Exact12Cell,
    layout: B1StaticEqualityLayout,
    *,
    allow_appended_clauses: bool = False,
) -> None:
    _validate_structural_state(instance, compiled, require_uninstalled=False)
    if type(layout) is not B1StaticEqualityLayout:
        raise B1Exact12StaticEqualityError("layout has the wrong type")
    canonical_edges = tuple(combinations(range(N), 2))
    canonical_relation_keys = tuple(combinations(range(EXPECTED_EDGE_COUNT), 2))
    if layout.edges != canonical_edges:
        raise B1Exact12StaticEqualityError("layout edge order is not canonical")
    if tuple(sorted(layout.relation_variables)) != canonical_relation_keys:
        raise B1Exact12StaticEqualityError("relation-variable keys are malformed")
    expected_variables = tuple(
        range(layout.initial_n_variables + 1, layout.final_n_variables + 1)
    )
    if tuple(layout.relation_variables[key] for key in canonical_relation_keys) != (
        expected_variables
    ):
        raise B1Exact12StaticEqualityError("relation-variable values are malformed")
    expected_row_clauses = ROW_IMPLICATIONS_PER_CANDIDATE * sum(
        len(rows) for rows in instance.candidates.values()
    )
    expected_added_clauses = (
        expected_row_clauses
        + EXPECTED_TRANSITIVITY_CLAUSES
        + EXPECTED_DUPLICATE_CENTER_CLAUSES
        + EXPECTED_PHYSICAL_APEX_UNIT_CLAUSES
    )
    clause_count_ok = (
        len(instance.cnf.clauses) >= layout.final_n_clauses
        if allow_appended_clauses
        else len(instance.cnf.clauses) == layout.final_n_clauses
    )
    if (
        layout.initial_n_variables != compiled.final_n_variables
        or layout.initial_n_clauses != compiled.final_n_clauses
        or layout.final_n_variables != instance.cnf.n_variables
        or not clause_count_ok
        or layout.added_variables != EXPECTED_RELATION_VARIABLES
        or layout.row_implication_clauses != expected_row_clauses
        or layout.transitivity_clauses != EXPECTED_TRANSITIVITY_CLAUSES
        or layout.duplicate_center_clauses != EXPECTED_DUPLICATE_CENTER_CLAUSES
        or layout.physical_apex_unit_clauses
        != EXPECTED_PHYSICAL_APEX_UNIT_CLAUSES
        or layout.added_clauses != expected_added_clauses
    ):
        raise B1Exact12StaticEqualityError("layout counts do not match the instance")
    if layout.clause_delta != tuple(
        instance.cnf.clauses[
            layout.initial_n_clauses : layout.final_n_clauses
        ]
    ):
        raise B1Exact12StaticEqualityError("layout clause delta does not match CNF")
    edge, equal_variable = _edge_helpers(
        layout.edges, layout.relation_variables
    )
    expected_physical_variable = equal_variable(
        edge(A2, compiled.cell.q), edge(A2, compiled.cell.r)
    )
    if (
        layout.physical_apex_q != compiled.cell.q
        or layout.physical_apex_r != compiled.cell.r
        or layout.physical_apex_relation_variable != expected_physical_variable
        or layout.clause_delta[-1] != (expected_physical_variable,)
    ):
        raise B1Exact12StaticEqualityError(
            "physical-apex equality unit does not match the compiled cell"
        )
    if (
        layout.structural_manifest_sha256 != _structural_manifest_sha256(compiled)
        or layout.initial_cnf_sha256
        != hashlib.sha256(
            _dimacs_prefix(
                instance,
                layout.initial_n_variables,
                layout.initial_n_clauses,
            ).encode("ascii")
        ).hexdigest()
        or layout.final_cnf_sha256
        != hashlib.sha256(
            _dimacs_prefix(
                instance,
                layout.final_n_variables,
                layout.final_n_clauses,
            ).encode("ascii")
        ).hexdigest()
        or layout.clause_delta_sha256
        != _canonical_json_sha256(layout.clause_delta)
        or layout.relation_variable_map_sha256
        != _canonical_json_sha256(_relation_payload(layout.relation_variables))
    ):
        raise B1Exact12StaticEqualityError("layout hashes do not match the instance")
    if getattr(instance, "_b1_exact12_static_equality_layout", None) != (
        layout.manifest()["manifest_sha256"]
    ):
        raise B1Exact12StaticEqualityError("installation marker does not match layout")


def _dimacs_prefix(
    instance: B1SourceSafeCoverInstance,
    n_variables: int,
    n_clauses: int,
) -> str:
    clauses = instance.cnf.clauses[:n_clauses]
    lines = [f"p cnf {n_variables} {n_clauses}"]
    lines.extend(" ".join(map(str, clause)) + " 0" for clause in clauses)
    return "\n".join(lines) + "\n"


def _normalized_cube(
    instance: B1SourceSafeCoverInstance,
    cube: Mapping[int, Collection[int]],
) -> dict[int, tuple[int, ...]]:
    if not isinstance(cube, Mapping):
        raise B1Exact12StaticEqualityError("cube must be a center-to-row mapping")
    if any(type(center) is not int for center in cube) or set(cube) != set(range(N)):
        raise B1Exact12StaticEqualityError(
            "cube must contain exactly the twelve integer centers"
        )
    normalized: dict[int, tuple[int, ...]] = {}
    for center in range(N):
        try:
            raw_support = tuple(cube[center])
        except TypeError as exc:
            raise B1Exact12StaticEqualityError(
                f"cube row at center {center} is not a collection"
            ) from exc
        if (
            len(raw_support) != 4
            or any(type(point) is not int for point in raw_support)
            or len(set(raw_support)) != 4
        ):
            raise B1Exact12StaticEqualityError(
                f"cube row at center {center} is not four distinct integer labels"
            )
        support = tuple(sorted(raw_support))
        try:
            instance.candidate_index(center, support)
        except Exception as exc:
            raise B1Exact12StaticEqualityError(
                f"cube row at center {center} is outside the candidate surface"
            ) from exc
        normalized[center] = support
    return normalized


def canonical_extension_assignment(
    instance: B1SourceSafeCoverInstance,
    compiled: CompiledB1Exact12Cell,
    layout: B1StaticEqualityLayout,
    cube: Mapping[int, Collection[int]],
    *,
    allow_appended_clauses: bool = False,
) -> frozenset[int]:
    """Return selected choices plus the minimal B1 equality closure."""

    _validate_layout(
        instance,
        compiled,
        layout,
        allow_appended_clauses=allow_appended_clauses,
    )
    normalized = _normalized_cube(instance, cube)
    if not instance.cube_validator(instance.model, normalized):
        raise B1Exact12StaticEqualityError(
            "cube violates the source-safe base constraints"
        )
    edge, _ = _edge_helpers(layout.edges, layout.relation_variables)
    closure = _UnionFind(len(layout.edges))
    selected: set[int] = set()
    for center, support in normalized.items():
        candidate_index = instance.candidate_index(center, support)
        selected.add(instance.choice_variables[(center, candidate_index)])
        incident = tuple(edge(center, point) for point in support)
        reference = incident[0]
        for other in incident[1:]:
            closure.union(reference, other)
    closure.union(edge(A2, compiled.cell.q), edge(A2, compiled.cell.r))
    selected.update(
        variable
        for (left, right), variable in layout.relation_variables.items()
        if closure.find(left) == closure.find(right)
    )
    return frozenset(selected)


def _clause_satisfied(clause: Collection[int], positive: Collection[int]) -> bool:
    true_variables = frozenset(positive)
    return any(
        literal in true_variables if literal > 0 else -literal not in true_variables
        for literal in clause
    )


def canonical_extension_satisfies_delta(
    instance: B1SourceSafeCoverInstance,
    compiled: CompiledB1Exact12Cell,
    layout: B1StaticEqualityLayout,
    cube: Mapping[int, Collection[int]],
    *,
    allow_appended_clauses: bool = False,
) -> bool:
    """Replay the canonical selected-row/equality valuation on every new clause."""

    positive = canonical_extension_assignment(
        instance,
        compiled,
        layout,
        cube,
        allow_appended_clauses=allow_appended_clauses,
    )
    return all(
        _clause_satisfied(clause, positive) for clause in layout.clause_delta
    )

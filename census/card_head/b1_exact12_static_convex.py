# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""The convex perpendicular-bisector static layer for exact-12 B1 cells.

For every unordered focus pair and every unordered triple of other labels,
this module forbids all three labels from being equidistant from the focuses.
The suffix uses only relation variables authenticated by the B1 static equality
layer and therefore introduces no variables.

This finite compiler is diagnostic.  Promotion still needs generic labeled
metric and convex ingress, plus whole-formula Lean ingress.
"""

from __future__ import annotations

import hashlib
import json
from collections.abc import Collection, Mapping
from dataclasses import dataclass
from itertools import combinations
from typing import Any

from .b1_exact12_static_equality import (
    B1Exact12StaticEqualityError,
    B1StaticEqualityLayout,
    canonical_extension_assignment,
)
from .b1_exact12_static_equality import (
    _validate_layout as _validate_equality_layout,
)
from .b1_exact12_static_geometry import (
    EXPECTED_EQUILATERAL_BISECTOR_CLAUSES,
    EXPECTED_GEOMETRY_CLAUSES,
    EXPECTED_QCRITICAL_AUX_CENTER_CLAUSES,
    EXPECTED_SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_CLAUSES,
    EXPECTED_SEVEN_POINT_SEVEN_ROW_INTERLOCK_CLAUSES,
    EXPECTED_SEVEN_POINT_SIX_ROW_ANCHOR_CLAUSES,
    EXPECTED_SEVEN_POINT_SIX_ROW_INTERLOCK_CLAUSES,
    EXPECTED_SIX_POINT_FIVE_ROW_INTERLOCK_CLAUSES,
    EXPECTED_SIX_POINT_SIX_ROW_INTERLOCK_CLAUSES,
    STATIC_GEOMETRY_SCHEMA,
    B1StaticGeometryLayout,
)
from .b1_exact12_static_geometry import (
    _geometry_clause_delta as _canonical_geometry_delta,
)
from .b1_exact12_structural import (
    B1SourceSafeCoverInstance,
    CompiledB1Exact12Cell,
)

STATIC_CONVEX_SCHEMA = "p97_b1_exact12_static_convex.v8"
SEMANTIC_STATUS = "diagnostic_exact12_static_convex_only"
PROMOTION_ELIGIBLE = False
SCOPE = (
    "Exact-12 B1 perpendicular-bisector discovery over one authenticated "
    "static-geometry parent; not generic labeled metric or convex ingress, "
    "whole-formula Lean ingress, coverage, certificate replay, a cardinality "
    "lift, or Lean closure"
)
N = 12
EXPECTED_PERPENDICULAR_BISECTOR_CLAUSES = 7_920
LEAN_GEOMETRY_KERNEL = (
    "Problem97.Census554.EqualityCore."
    "false_of_convexIndep_of_perpBisectorCore"
)
LEAN_POSITIVE_CHECKER = "nonempty_perpBisectorCore_of_positiveCheck"
LEAN_CERTIFICATE_CONSUMER = (
    "SourceOrderPositiveNogood.ofPerpBisectorCertificate"
)
INCLUDED_RULES = ("convex_perpendicular_bisector_three_point_nogood",)
OMITTED_RULES = (
    "generic_labeled_metric_ingress",
    "generic_labeled_convex_ingress",
    "whole_formula_Lean_ingress",
    "exact12_B1_coverage",
    "checked_terminal_certificate_replay",
    "other_cardinality_lifts",
)
SOURCE_CLAUSE_LEDGER: tuple[Mapping[str, Any], ...] = (
    {
        "rule": "convex_perpendicular_bisector_three_point_nogood",
        "source_theorem": LEAN_GEOMETRY_KERNEL,
        "positive_checker": LEAN_POSITIVE_CHECKER,
        "certificate_consumer": LEAN_CERTIFICATE_CONSUMER,
        "status": (
            "theorem_backed_schema_missing_generic_labeled_metric_and_convex_"
            "ingress_and_whole_formula_Lean_ingress"
        ),
        "promotion_eligible": False,
    },
)


class B1Exact12StaticConvexError(ValueError):
    """The B1 geometry parent, convex compiler, or replay is malformed."""


def _canonical_json_sha256(value: object) -> str:
    payload = json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("ascii")
    return hashlib.sha256(payload).hexdigest()


def _cnf_sha256(instance: B1SourceSafeCoverInstance) -> str:
    return hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest()


def _dimacs_prefix(
    instance: B1SourceSafeCoverInstance,
    n_variables: int,
    n_clauses: int,
) -> str:
    clauses = instance.cnf.clauses[:n_clauses]
    lines = [f"p cnf {n_variables} {n_clauses}"]
    lines.extend(" ".join(map(str, clause)) + " 0" for clause in clauses)
    return "\n".join(lines) + "\n"


def _manifest_sha256(layout: B1StaticGeometryLayout) -> str:
    value = layout.manifest().get("manifest_sha256")
    if not isinstance(value, str) or len(value) != 64:
        raise B1Exact12StaticConvexError(
            "static-geometry parent manifest hash is malformed"
        )
    return value


def _convex_clause_delta(
    equality_layout: B1StaticEqualityLayout,
) -> tuple[tuple[int, ...], ...]:
    edge_index = {edge: index for index, edge in enumerate(equality_layout.edges)}

    def edge(left: int, right: int) -> int:
        if left == right:
            raise B1Exact12StaticConvexError(
                "a perpendicular-bisector edge needs two endpoints"
            )
        try:
            return edge_index[tuple(sorted((left, right)))]
        except KeyError as exc:
            raise B1Exact12StaticConvexError(
                "a perpendicular-bisector endpoint is outside exact-12"
            ) from exc

    def equal_variable(first_edge: int, second_edge: int) -> int:
        if first_edge == second_edge:
            raise B1Exact12StaticConvexError(
                "perpendicular-bisector schema compared one edge with itself"
            )
        try:
            return equality_layout.relation_variables[
                tuple(sorted((first_edge, second_edge)))
            ]
        except KeyError as exc:
            raise B1Exact12StaticConvexError(
                "static-equality relation-variable map is incomplete"
            ) from exc

    clauses: list[tuple[int, ...]] = []
    labels = tuple(range(N))
    for a, b in combinations(labels, 2):
        nonfocus = tuple(label for label in labels if label not in (a, b))
        for p, q, r in combinations(nonfocus, 3):
            clause = tuple(
                -equal_variable(edge(point, a), edge(point, b))
                for point in (p, q, r)
            )
            if len(set(clause)) != 3:
                raise B1Exact12StaticConvexError(
                    "perpendicular-bisector clause collapsed relation literals"
                )
            clauses.append(clause)

    delta = tuple(clauses)
    if len(delta) != EXPECTED_PERPENDICULAR_BISECTOR_CLAUSES:
        raise B1Exact12StaticConvexError(
            "perpendicular-bisector clause count drifted: "
            f"expected {EXPECTED_PERPENDICULAR_BISECTOR_CLAUSES}, got {len(delta)}"
        )
    if len({tuple(sorted(clause)) for clause in delta}) != len(delta):
        raise B1Exact12StaticConvexError(
            "perpendicular-bisector compiler emitted duplicate CNF clauses"
        )
    return delta


@dataclass(frozen=True)
class B1StaticConvexLayout:
    """Authenticated geometry-parent identity and deterministic convex suffix."""

    parent_manifest_sha256: str
    initial_n_variables: int
    initial_n_clauses: int
    final_n_variables: int
    final_n_clauses: int
    perpendicular_bisector_clauses: int
    convex_clause_delta: tuple[tuple[int, ...], ...]
    initial_cnf_sha256: str
    final_cnf_sha256: str
    convex_clause_delta_sha256: str

    @property
    def added_variables(self) -> int:
        return self.final_n_variables - self.initial_n_variables

    @property
    def added_clauses(self) -> int:
        return self.final_n_clauses - self.initial_n_clauses

    def _manifest_payload(self) -> dict[str, Any]:
        return {
            "schema": STATIC_CONVEX_SCHEMA,
            "semantic_status": SEMANTIC_STATUS,
            "promotion_eligible": PROMOTION_ELIGIBLE,
            "scope": SCOPE,
            "parent": {
                "schema": STATIC_GEOMETRY_SCHEMA,
                "manifest_sha256": self.parent_manifest_sha256,
            },
            "counts": {
                "initial_variables": self.initial_n_variables,
                "initial_clauses": self.initial_n_clauses,
                "final_variables": self.final_n_variables,
                "final_clauses": self.final_n_clauses,
                "perpendicular_bisector_clauses": (
                    self.perpendicular_bisector_clauses
                ),
                "added_variables": self.added_variables,
                "added_clauses": self.added_clauses,
            },
            "hashes": {
                "parent_manifest_sha256": self.parent_manifest_sha256,
                "initial_cnf_sha256": self.initial_cnf_sha256,
                "convex_clause_delta_sha256": self.convex_clause_delta_sha256,
                "final_cnf_sha256": self.final_cnf_sha256,
            },
            "included_rules": list(INCLUDED_RULES),
            "omitted_rules": list(OMITTED_RULES),
            "source_clause_ledger": [dict(entry) for entry in SOURCE_CLAUSE_LEDGER],
        }

    def manifest(self) -> dict[str, Any]:
        payload = self._manifest_payload()
        return {**payload, "manifest_sha256": _canonical_json_sha256(payload)}


def _validate_geometry_parent(
    instance: B1SourceSafeCoverInstance,
    compiled: CompiledB1Exact12Cell,
    equality_layout: B1StaticEqualityLayout,
    geometry_layout: B1StaticGeometryLayout,
    *,
    allow_appended_clauses: bool,
) -> None:
    try:
        _validate_equality_layout(
            instance,
            compiled,
            equality_layout,
            allow_appended_clauses=True,
        )
    except B1Exact12StaticEqualityError as exc:
        raise B1Exact12StaticConvexError(str(exc)) from exc
    if type(geometry_layout) is not B1StaticGeometryLayout:
        raise B1Exact12StaticConvexError("geometry layout has the wrong type")
    geometry_manifest = geometry_layout.manifest()
    canonical_geometry_delta = _canonical_geometry_delta(equality_layout)
    clause_count_ok = (
        len(instance.cnf.clauses) >= geometry_layout.final_n_clauses
        if allow_appended_clauses
        else len(instance.cnf.clauses) == geometry_layout.final_n_clauses
    )
    if (
        geometry_manifest.get("schema") != STATIC_GEOMETRY_SCHEMA
        or geometry_layout.parent_manifest_sha256
        != equality_layout.manifest()["manifest_sha256"]
        or geometry_layout.initial_n_variables != equality_layout.final_n_variables
        or geometry_layout.initial_n_clauses != equality_layout.final_n_clauses
        or geometry_layout.final_n_variables != instance.cnf.n_variables
        or not clause_count_ok
        or geometry_layout.added_variables != 0
        or geometry_layout.equilateral_bisector_clauses
        != EXPECTED_EQUILATERAL_BISECTOR_CLAUSES
        or geometry_layout.qcritical_aux_center_clauses
        != EXPECTED_QCRITICAL_AUX_CENTER_CLAUSES
        or geometry_layout.seven_point_six_row_anchor_clauses
        != EXPECTED_SEVEN_POINT_SIX_ROW_ANCHOR_CLAUSES
        or geometry_layout.seven_point_six_row_interlock_clauses
        != EXPECTED_SEVEN_POINT_SIX_ROW_INTERLOCK_CLAUSES
        or geometry_layout.six_point_five_row_interlock_clauses
        != EXPECTED_SIX_POINT_FIVE_ROW_INTERLOCK_CLAUSES
        or geometry_layout.seven_point_seven_row_interlock_clauses
        != EXPECTED_SEVEN_POINT_SEVEN_ROW_INTERLOCK_CLAUSES
        or geometry_layout.six_point_six_row_interlock_clauses
        != EXPECTED_SIX_POINT_SIX_ROW_INTERLOCK_CLAUSES
        or geometry_layout.seven_point_equilateral_median_interlock_clauses
        != EXPECTED_SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_CLAUSES
        or geometry_layout.added_clauses != EXPECTED_GEOMETRY_CLAUSES
        or geometry_layout.geometry_clause_delta != canonical_geometry_delta
    ):
        raise B1Exact12StaticConvexError(
            "geometry parent counts, manifest, or canonical delta drifted"
        )
    if geometry_layout.geometry_clause_delta != tuple(
        instance.cnf.clauses[
            geometry_layout.initial_n_clauses : geometry_layout.final_n_clauses
        ]
    ):
        raise B1Exact12StaticConvexError(
            "geometry parent suffix does not match the instance"
        )
    parent_prefix_sha256 = hashlib.sha256(
        _dimacs_prefix(
            instance,
            geometry_layout.final_n_variables,
            geometry_layout.final_n_clauses,
        ).encode("ascii")
    ).hexdigest()
    if (
        geometry_layout.initial_cnf_sha256 != equality_layout.final_cnf_sha256
        or geometry_layout.final_cnf_sha256 != parent_prefix_sha256
        or geometry_layout.geometry_clause_delta_sha256
        != _canonical_json_sha256(geometry_layout.geometry_clause_delta)
        or getattr(instance, "_b1_exact12_static_geometry_layout", None)
        != _manifest_sha256(geometry_layout)
    ):
        raise B1Exact12StaticConvexError(
            "geometry parent hashes or installation marker drifted"
        )


def _validate_convex_layout(
    instance: B1SourceSafeCoverInstance,
    compiled: CompiledB1Exact12Cell,
    equality_layout: B1StaticEqualityLayout,
    geometry_layout: B1StaticGeometryLayout,
    convex_layout: B1StaticConvexLayout,
) -> None:
    _validate_geometry_parent(
        instance,
        compiled,
        equality_layout,
        geometry_layout,
        allow_appended_clauses=True,
    )
    if type(convex_layout) is not B1StaticConvexLayout:
        raise B1Exact12StaticConvexError("convex layout has the wrong type")
    parent_hash = _manifest_sha256(geometry_layout)
    expected_delta = _convex_clause_delta(equality_layout)
    if (
        convex_layout.parent_manifest_sha256 != parent_hash
        or convex_layout.initial_n_variables != geometry_layout.final_n_variables
        or convex_layout.initial_n_clauses != geometry_layout.final_n_clauses
        or convex_layout.final_n_variables != instance.cnf.n_variables
        or convex_layout.final_n_clauses != len(instance.cnf.clauses)
        or convex_layout.added_variables != 0
        or convex_layout.perpendicular_bisector_clauses
        != EXPECTED_PERPENDICULAR_BISECTOR_CLAUSES
        or convex_layout.added_clauses
        != EXPECTED_PERPENDICULAR_BISECTOR_CLAUSES
        or convex_layout.convex_clause_delta != expected_delta
    ):
        raise B1Exact12StaticConvexError(
            "convex layout counts, parent, or canonical clause delta drifted"
        )
    if convex_layout.convex_clause_delta != tuple(
        instance.cnf.clauses[
            convex_layout.initial_n_clauses : convex_layout.final_n_clauses
        ]
    ):
        raise B1Exact12StaticConvexError(
            "convex clause suffix does not match the instance"
        )
    if (
        convex_layout.initial_cnf_sha256 != geometry_layout.final_cnf_sha256
        or convex_layout.final_cnf_sha256 != _cnf_sha256(instance)
        or convex_layout.convex_clause_delta_sha256
        != _canonical_json_sha256(convex_layout.convex_clause_delta)
        or getattr(instance, "_b1_exact12_static_convex_layout", None)
        != convex_layout.manifest()["manifest_sha256"]
    ):
        raise B1Exact12StaticConvexError(
            "convex layout hashes or installation marker drifted"
        )


def install_static_convex_extension(
    instance: B1SourceSafeCoverInstance,
    compiled: CompiledB1Exact12Cell,
    equality_layout: B1StaticEqualityLayout,
    geometry_layout: B1StaticGeometryLayout,
) -> B1StaticConvexLayout:
    """Append the deterministic convex suffix to one installed geometry layer."""

    if getattr(instance, "_b1_exact12_static_convex_layout", None) is not None:
        raise B1Exact12StaticConvexError(
            "static convex extension is already installed"
        )
    _validate_geometry_parent(
        instance,
        compiled,
        equality_layout,
        geometry_layout,
        allow_appended_clauses=False,
    )
    initial_n_variables = instance.cnf.n_variables
    initial_n_clauses = len(instance.cnf.clauses)
    initial_cnf_sha256 = _cnf_sha256(instance)
    parent_manifest_sha256 = _manifest_sha256(geometry_layout)
    delta = _convex_clause_delta(equality_layout)
    for clause in delta:
        instance.cnf.add_clause(clause)
    if instance.cnf.n_variables != initial_n_variables:
        raise B1Exact12StaticConvexError(
            "static convex extension unexpectedly introduced variables"
        )

    layout = B1StaticConvexLayout(
        parent_manifest_sha256=parent_manifest_sha256,
        initial_n_variables=initial_n_variables,
        initial_n_clauses=initial_n_clauses,
        final_n_variables=instance.cnf.n_variables,
        final_n_clauses=len(instance.cnf.clauses),
        perpendicular_bisector_clauses=len(delta),
        convex_clause_delta=delta,
        initial_cnf_sha256=initial_cnf_sha256,
        final_cnf_sha256=_cnf_sha256(instance),
        convex_clause_delta_sha256=_canonical_json_sha256(delta),
    )
    instance._b1_exact12_static_convex_layout = layout.manifest()[
        "manifest_sha256"
    ]
    _validate_convex_layout(
        instance,
        compiled,
        equality_layout,
        geometry_layout,
        layout,
    )
    return layout


def canonical_convex_satisfies_delta(
    instance: B1SourceSafeCoverInstance,
    compiled: CompiledB1Exact12Cell,
    equality_layout: B1StaticEqualityLayout,
    geometry_layout: B1StaticGeometryLayout,
    convex_layout: B1StaticConvexLayout,
    cube: Mapping[int, Collection[int]],
) -> bool:
    """Replay one canonical valuation on all three authenticated static layers."""

    _validate_convex_layout(
        instance,
        compiled,
        equality_layout,
        geometry_layout,
        convex_layout,
    )
    try:
        positive = canonical_extension_assignment(
            instance,
            compiled,
            equality_layout,
            cube,
            allow_appended_clauses=True,
        )
    except B1Exact12StaticEqualityError as exc:
        raise B1Exact12StaticConvexError(str(exc)) from exc
    return all(
        _clause_satisfied(clause, positive)
        for clause in (
            equality_layout.clause_delta
            + geometry_layout.geometry_clause_delta
            + convex_layout.convex_clause_delta
        )
    )


def _clause_satisfied(clause: Collection[int], positive: Collection[int]) -> bool:
    true_variables = frozenset(positive)
    return any(
        literal in true_variables if literal > 0 else -literal not in true_variables
        for literal in clause
    )


canonical_extension_satisfies_delta = canonical_convex_satisfies_delta

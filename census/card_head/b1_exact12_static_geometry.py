# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""The theorem-backed static geometry layer for exact-12 B1 cells.

This module appends every ordered five-label instance of the generic
equilateral-bisector collision nogood, every injective six-label instance of
the q-critical auxiliary-center incompatibility, and the finite six- and
seven-label collision certificates mined by the B1 CEGAR waves to an already
installed static equality layout.  The clauses use only the equality relation
variables from the parent layer, so the extension adds no variables.

This is finite discovery infrastructure.  It does not supply the generic
labeled ingress or the whole-formula Lean ingress needed to promote a formula
verdict to the live theorem.
"""

from __future__ import annotations

import hashlib
import json
from collections.abc import Collection, Mapping
from dataclasses import dataclass
from functools import lru_cache
from itertools import permutations
from typing import Any

from .b1_exact12_static_equality import (
    B1Exact12StaticEqualityError,
    B1StaticEqualityLayout,
    canonical_extension_assignment,
)
from .b1_exact12_static_equality import (
    _validate_layout as _validate_equality_layout,
)
from .b1_exact12_structural import (
    B1SourceSafeCoverInstance,
    CompiledB1Exact12Cell,
)

STATIC_GEOMETRY_SCHEMA = "p97_b1_exact12_static_geometry.v8"
SEMANTIC_STATUS = "diagnostic_exact12_static_geometry_only"
PROMOTION_ELIGIBLE = False
SCOPE = (
    "Exact-12 B1 equilateral-bisector, q-critical auxiliary-center, and "
    "finite anchor/interlock-collision discovery over one compiled structural cell and its authenticated "
    "static-equality parent; missing generic labeled ingress from finite "
    "relation literals to Lean edge closures, whole-formula Lean ingress, "
    "coverage theorem, certificate replay, cardinality lift, or Lean closure"
)
N = 12
EXPECTED_EQUILATERAL_BISECTOR_CLAUSES = 95_040
EXPECTED_QCRITICAL_AUX_CENTER_CLAUSES = 665_280
EXPECTED_SEVEN_POINT_SIX_ROW_ANCHOR_CLAUSES = 1
EXPECTED_SEVEN_POINT_SIX_ROW_INTERLOCK_CLAUSES = 1
EXPECTED_SIX_POINT_FIVE_ROW_INTERLOCK_CLAUSES = 1
EXPECTED_SEVEN_POINT_SEVEN_ROW_INTERLOCK_CLAUSES = 1
EXPECTED_SIX_POINT_SIX_ROW_INTERLOCK_CLAUSES = 1
EXPECTED_SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_CLAUSES = 1
EXPECTED_GEOMETRY_CLAUSES = 760_326
SEVEN_POINT_SIX_ROW_ANCHOR_INSTANCES = ((0, 1, 2, 3, 4, 6, 7),)
SEVEN_POINT_SIX_ROW_INTERLOCK_INSTANCES = ((0, 1, 2, 3, 4, 5, 7),)
SIX_POINT_FIVE_ROW_INTERLOCK_INSTANCES = ((0, 1, 2, 8, 9, 10),)
SEVEN_POINT_SEVEN_ROW_INTERLOCK_INSTANCES = ((0, 1, 2, 4, 7, 8, 9),)
SIX_POINT_SIX_ROW_INTERLOCK_INSTANCES = ((1, 0, 4, 2, 3, 5),)
SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_INSTANCES = (
    (0, 2, 1, 8, 9, 10, 11),
)
LEAN_GEOMETRY_KERNEL = (
    "Problem97.Census554.EqualityCore.not_realizes_of_equilateralBisectorCollisionCore"
)
LEAN_CERTIFICATE = "GenericEquilateralBisectorNogoodCertificate"
LEAN_QCRITICAL_AUX_CENTER_SOURCE_THEOREM = (
    "Problem97.Census554.EqualityCore.not_realizes_of_equilateralChainBisectorCore"
)
LEAN_QCRITICAL_AUX_CENTER_CERTIFICATE_INTERFACE = (
    "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
    "nonempty_equilateralChainBisectorCore_of_positiveCheck"
)
LEAN_QCRITICAL_AUX_CENTER_METRIC_KERNEL = (
    "Problem97.u5_qcritical_aux_center_metric_incompatibility"
)
LEAN_SEVEN_POINT_SIX_ROW_ANCHOR_SOURCE_THEOREM = (
    "Problem97.Census554.EqualityCore."
    "not_realizes_of_sevenPointSixRowAnchorCollisionCore"
)
LEAN_SEVEN_POINT_SIX_ROW_INTERLOCK_SOURCE_THEOREM = (
    "Problem97.Census554.EqualityCore."
    "not_realizes_of_sevenPointSixRowInterlockCollisionCore"
)
LEAN_SIX_POINT_FIVE_ROW_INTERLOCK_SOURCE_THEOREM = (
    "Problem97.Census554.EqualityCore."
    "not_realizes_of_sixPointFiveRowInterlockCollisionCore"
)
LEAN_SEVEN_POINT_SEVEN_ROW_INTERLOCK_SOURCE_THEOREM = (
    "Problem97.Census554.EqualityCore."
    "not_realizes_of_sevenPointSevenRowInterlockCollisionCore"
)
LEAN_SIX_POINT_SIX_ROW_INTERLOCK_SOURCE_THEOREM = (
    "Problem97.Census554.EqualityCore."
    "not_realizes_of_sixPointSixRowInterlockCollisionCore"
)
LEAN_SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_SOURCE_THEOREM = (
    "Problem97.Census554.EqualityCore."
    "not_realizes_of_sevenPointEquilateralMedianInterlockCollisionCore"
)
INCLUDED_RULES = (
    "generic_equilateral_bisector_collision_nogood",
    "generic_equilateral_chain_bisector_core_nogood",
    "finite_seven_point_six_row_anchor_collision_nogood",
    "finite_seven_point_six_row_interlock_collision_nogood",
    "finite_six_point_five_row_interlock_collision_nogood",
    "finite_seven_point_seven_row_interlock_collision_nogood",
    "finite_six_point_six_row_interlock_collision_nogood",
    "finite_seven_point_equilateral_median_interlock_collision_nogood",
)
OMITTED_RULES = (
    "generic_labeled_edge_closure_ingress",
    "generic_labeled_metric_valuation",
    "whole_formula_Lean_ingress",
    "exact12_B1_coverage",
    "whole_formula_certificate_replay",
    "all_injective_seven_point_six_row_anchor_instances",
    "all_injective_seven_point_six_row_interlock_instances",
    "all_injective_six_point_five_row_interlock_instances",
    "all_injective_seven_point_seven_row_interlock_instances",
    "all_injective_six_point_six_row_interlock_instances",
    "all_injective_seven_point_equilateral_median_interlock_instances",
    "other_cardinality_lifts",
)
FINITE_INGRESS_GAPS = (
    "generic_labeled_relation_literals_to_EdgeClosure",
    "whole_formula_Lean_ingress",
)
SOURCE_CLAUSE_LEDGER: tuple[Mapping[str, Any], ...] = (
    {
        "rule": "generic_equilateral_bisector_collision_nogood",
        "source_theorem": LEAN_GEOMETRY_KERNEL,
        "certificate_interface": LEAN_CERTIFICATE,
        "status": (
            "theorem_backed_schema_missing_generic_labeled_metric_valuation_"
            "and_whole_formula_Lean_ingress"
        ),
        "promotion_eligible": False,
    },
    {
        "rule": "generic_equilateral_chain_bisector_core_nogood",
        "source_theorem": LEAN_QCRITICAL_AUX_CENTER_SOURCE_THEOREM,
        "certificate_interface": (LEAN_QCRITICAL_AUX_CENTER_CERTIFICATE_INTERFACE),
        "underlying_metric_kernel": LEAN_QCRITICAL_AUX_CENTER_METRIC_KERNEL,
        "underlying_metric_kernel_source": (
            "lean/Erdos9796Proof/P97/U5GlobalIncidenceKernels.lean:770"
        ),
        "relation_equalities": (
            "pt1=pt3",
            "pt1=pq",
            "t1p=t1t2",
            "t1p=t1q",
            "t2p=t2t1",
            "t3p=t3t2",
            "t3p=t3a",
            "ap=aq",
        ),
        "status": (
            "theorem_backed_schema_missing_generic_labeled_ingress_and_"
            "whole_formula_Lean_ingress"
        ),
        "promotion_eligible": False,
    },
    {
        "rule": "finite_seven_point_six_row_anchor_collision_nogood",
        "source_theorem": LEAN_SEVEN_POINT_SIX_ROW_ANCHOR_SOURCE_THEOREM,
        "finite_label_instances": SEVEN_POINT_SIX_ROW_ANCHOR_INSTANCES,
        "relation_equalities": (
            "pu=pq",
            "pv=pq",
            "pa=pq",
            "qt=qp",
            "qa=qp",
            "qb=qp",
            "tq=tp",
            "ut=up",
            "uv=up",
            "vb=vq",
            "ba=bp",
        ),
        "status": (
            "theorem_backed_finite_cegar_instance_missing_positive_source_"
            "checker_and_whole_formula_Lean_ingress"
        ),
        "promotion_eligible": False,
    },
    {
        "rule": "finite_seven_point_six_row_interlock_collision_nogood",
        "source_theorem": LEAN_SEVEN_POINT_SIX_ROW_INTERLOCK_SOURCE_THEOREM,
        "finite_label_instances": SEVEN_POINT_SIX_ROW_INTERLOCK_INSTANCES,
        "relation_equalities": (
            "pq=pu",
            "qp=qt",
            "qp=qb",
            "tp=tq",
            "up=ut",
            "up=uv",
            "up=ua",
            "vq=va",
            "vq=vb",
            "ap=av",
            "ap=ab",
        ),
        "status": (
            "theorem_backed_finite_cegar_instance_missing_positive_source_"
            "checker_and_whole_formula_Lean_ingress"
        ),
        "promotion_eligible": False,
    },
    {
        "rule": "finite_six_point_five_row_interlock_collision_nogood",
        "source_theorem": LEAN_SIX_POINT_FIVE_ROW_INTERLOCK_SOURCE_THEOREM,
        "finite_label_instances": SIX_POINT_FIVE_ROW_INTERLOCK_INSTANCES,
        "relation_equalities": (
            "qp=qt",
            "tp=tq",
            "tp=tv",
            "tp=ta",
            "uq=ut",
            "uq=uv",
            "vq=vu",
            "vq=va",
            "at=au",
        ),
        "status": (
            "theorem_backed_finite_cegar_instance_missing_positive_source_"
            "checker_and_whole_formula_Lean_ingress"
        ),
        "promotion_eligible": False,
    },
    {
        "rule": "finite_seven_point_seven_row_interlock_collision_nogood",
        "source_theorem": LEAN_SEVEN_POINT_SEVEN_ROW_INTERLOCK_SOURCE_THEOREM,
        "finite_label_instances": SEVEN_POINT_SEVEN_ROW_INTERLOCK_INSTANCES,
        "relation_equalities": (
            "pq=pu",
            "qp=qt",
            "qp=qv",
            "tp=tb",
            "uq=uv",
            "uq=ua",
            "vp=va",
            "aq=at",
            "aq=ab",
            "bq=bu",
            "bq=ba",
        ),
        "status": (
            "theorem_backed_finite_cegar_instance_missing_positive_source_"
            "checker_and_whole_formula_Lean_ingress"
        ),
        "promotion_eligible": False,
    },
    {
        "rule": "finite_six_point_six_row_interlock_collision_nogood",
        "source_theorem": LEAN_SIX_POINT_SIX_ROW_INTERLOCK_SOURCE_THEOREM,
        "finite_label_instances": SIX_POINT_SIX_ROW_INTERLOCK_INSTANCES,
        "relation_equalities": (
            "qp=qa",
            "qp=qt",
            "pq=pu",
            "uq=up",
            "aq=au",
            "aq=at",
            "aq=ab",
            "tp=tb",
            "bq=bt",
        ),
        "status": (
            "theorem_backed_finite_cegar_instance_missing_positive_source_"
            "checker_and_whole_formula_Lean_ingress"
        ),
        "promotion_eligible": False,
    },
    {
        "rule": "finite_seven_point_equilateral_median_interlock_collision_nogood",
        "source_theorem": (
            LEAN_SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_SOURCE_THEOREM
        ),
        "finite_label_instances": (
            SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_INSTANCES
        ),
        "relation_equalities": (
            "tp=tq",
            "qp=qt",
            "qp=qv",
            "qp=qb",
            "at=aq",
            "vt=vb",
            "vt=vu",
            "bq=ba",
            "bq=bu",
            "uq=ua",
            "uq=uv",
        ),
        "status": (
            "theorem_backed_finite_cegar_instance_missing_positive_source_"
            "checker_and_whole_formula_Lean_ingress"
        ),
        "promotion_eligible": False,
    },
)


class B1Exact12StaticGeometryError(ValueError):
    """The B1 equality parent, geometry compiler, or replay is malformed."""


def _canonical_json_sha256(value: object) -> str:
    payload = json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("ascii")
    return hashlib.sha256(payload).hexdigest()


def _cnf_sha256(instance: B1SourceSafeCoverInstance) -> str:
    return hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest()


def _parent_manifest_sha256(layout: B1StaticEqualityLayout) -> str:
    value = layout.manifest().get("manifest_sha256")
    if not isinstance(value, str) or len(value) != 64:
        raise B1Exact12StaticGeometryError(
            "static-equality parent manifest hash is malformed"
        )
    return value


@lru_cache(maxsize=1)
def _cached_geometry_clause_delta(
    edges: tuple[tuple[int, int], ...],
    relation_variable_items: tuple[tuple[tuple[int, int], int], ...],
) -> tuple[tuple[int, ...], ...]:
    edge_index = {edge: index for index, edge in enumerate(edges)}
    relation_variables = dict(relation_variable_items)

    def edge(left: int, right: int) -> int:
        if left == right:
            raise B1Exact12StaticGeometryError(
                "a static-geometry edge needs two endpoints"
            )
        try:
            return edge_index[tuple(sorted((left, right)))]
        except KeyError as exc:
            raise B1Exact12StaticGeometryError(
                "a static-geometry edge endpoint is outside exact-12"
            ) from exc

    def equal_variable(first_edge: int, second_edge: int) -> int:
        if first_edge == second_edge:
            raise B1Exact12StaticGeometryError(
                "a static-geometry schema compared one edge with itself"
            )
        try:
            return relation_variables[tuple(sorted((first_edge, second_edge)))]
        except KeyError as exc:
            raise B1Exact12StaticGeometryError(
                "static-equality relation-variable map is incomplete"
            ) from exc

    clauses: list[tuple[int, ...]] = []
    canonical_clauses: set[tuple[int, ...]] = set()

    def append_clause(clause: tuple[int, ...], *, width: int, rule: str) -> None:
        if len(clause) != width or len(set(clause)) != width:
            raise B1Exact12StaticGeometryError(
                f"{rule} clause collapsed relation literals"
            )
        if any(literal >= 0 for literal in clause):
            raise B1Exact12StaticGeometryError(f"{rule} clause is not all-negative")
        canonical_clause = tuple(sorted(clause))
        if canonical_clause in canonical_clauses:
            raise B1Exact12StaticGeometryError(
                f"{rule} compiler emitted a duplicate CNF clause"
            )
        canonical_clauses.add(canonical_clause)
        clauses.append(clause)

    for p, a, b, c, x in permutations(range(N), 5):
        pa = edge(p, a)
        clause = tuple(
            -equal_variable(left, right)
            for left, right in (
                (pa, edge(p, b)),
                (pa, edge(p, c)),
                (pa, edge(a, b)),
                (pa, edge(a, x)),
                (pa, edge(b, x)),
                (edge(c, x), edge(c, a)),
            )
        )
        append_clause(clause, width=6, rule="equilateral-bisector")

    if len(clauses) != EXPECTED_EQUILATERAL_BISECTOR_CLAUSES:
        raise B1Exact12StaticGeometryError(
            "equilateral-bisector clause count drifted: "
            f"expected {EXPECTED_EQUILATERAL_BISECTOR_CLAUSES}, "
            f"got {len(clauses)}"
        )

    qcritical_start = len(clauses)
    for p, q, t1, t2, t3, a in permutations(range(N), 6):
        pt1 = edge(p, t1)
        pt3 = edge(p, t3)
        clause = tuple(
            -equal_variable(left, right)
            for left, right in (
                (pt1, pt3),
                (pt1, edge(p, q)),
                (pt1, edge(t1, t2)),
                (pt1, edge(t1, q)),
                (edge(t2, p), edge(t2, t1)),
                (pt3, edge(t3, t2)),
                (pt3, edge(t3, a)),
                (edge(a, p), edge(a, q)),
            )
        )
        append_clause(
            clause,
            width=8,
            rule="q-critical auxiliary-center",
        )

    qcritical_count = len(clauses) - qcritical_start
    if qcritical_count != EXPECTED_QCRITICAL_AUX_CENTER_CLAUSES:
        raise B1Exact12StaticGeometryError(
            "q-critical auxiliary-center clause count drifted: "
            f"expected {EXPECTED_QCRITICAL_AUX_CENTER_CLAUSES}, "
            f"got {qcritical_count}"
        )

    anchor_start = len(clauses)
    for p, q, t, u, v, a, b in SEVEN_POINT_SIX_ROW_ANCHOR_INSTANCES:
        pq = edge(p, q)
        up = edge(u, p)
        clause = tuple(
            -equal_variable(left, right)
            for left, right in (
                (edge(p, u), pq),
                (edge(p, v), pq),
                (edge(p, a), pq),
                (edge(q, t), pq),
                (edge(q, a), pq),
                (edge(q, b), pq),
                (edge(t, q), edge(t, p)),
                (edge(u, t), up),
                (edge(u, v), up),
                (edge(v, b), edge(v, q)),
                (edge(b, a), edge(b, p)),
            )
        )
        append_clause(
            clause,
            width=11,
            rule="seven-point six-row anchor collision",
        )

    anchor_count = len(clauses) - anchor_start
    if anchor_count != EXPECTED_SEVEN_POINT_SIX_ROW_ANCHOR_CLAUSES:
        raise B1Exact12StaticGeometryError(
            "seven-point six-row anchor clause count drifted: "
            f"expected {EXPECTED_SEVEN_POINT_SIX_ROW_ANCHOR_CLAUSES}, "
            f"got {anchor_count}"
        )

    interlock_start = len(clauses)
    for p, q, t, u, v, a, b in SEVEN_POINT_SIX_ROW_INTERLOCK_INSTANCES:
        pq = edge(p, q)
        up = edge(u, p)
        vq = edge(v, q)
        ap = edge(a, p)
        clause = tuple(
            -equal_variable(left, right)
            for left, right in (
                (pq, edge(p, u)),
                (pq, edge(q, t)),
                (pq, edge(q, b)),
                (edge(t, p), edge(t, q)),
                (up, edge(u, t)),
                (up, edge(u, v)),
                (up, edge(u, a)),
                (vq, edge(v, a)),
                (vq, edge(v, b)),
                (ap, edge(a, v)),
                (ap, edge(a, b)),
            )
        )
        append_clause(
            clause,
            width=11,
            rule="seven-point six-row interlock collision",
        )

    interlock_count = len(clauses) - interlock_start
    if interlock_count != EXPECTED_SEVEN_POINT_SIX_ROW_INTERLOCK_CLAUSES:
        raise B1Exact12StaticGeometryError(
            "seven-point six-row interlock clause count drifted: "
            f"expected {EXPECTED_SEVEN_POINT_SIX_ROW_INTERLOCK_CLAUSES}, "
            f"got {interlock_count}"
        )

    five_row_interlock_start = len(clauses)
    for p, q, t, u, v, a in SIX_POINT_FIVE_ROW_INTERLOCK_INSTANCES:
        tp = edge(t, p)
        uq = edge(u, q)
        vq = edge(v, q)
        clause = tuple(
            -equal_variable(left, right)
            for left, right in (
                (edge(q, p), edge(q, t)),
                (tp, edge(t, q)),
                (tp, edge(t, v)),
                (tp, edge(t, a)),
                (uq, edge(u, t)),
                (uq, edge(u, v)),
                (vq, edge(v, u)),
                (vq, edge(v, a)),
                (edge(a, t), edge(a, u)),
            )
        )
        append_clause(
            clause,
            width=9,
            rule="six-point five-row interlock collision",
        )

    five_row_interlock_count = len(clauses) - five_row_interlock_start
    if (
        five_row_interlock_count
        != EXPECTED_SIX_POINT_FIVE_ROW_INTERLOCK_CLAUSES
    ):
        raise B1Exact12StaticGeometryError(
            "six-point five-row interlock clause count drifted: "
            f"expected {EXPECTED_SIX_POINT_FIVE_ROW_INTERLOCK_CLAUSES}, "
            f"got {five_row_interlock_count}"
        )

    seven_row_interlock_start = len(clauses)
    for p, q, t, u, v, a, b in SEVEN_POINT_SEVEN_ROW_INTERLOCK_INSTANCES:
        pq = edge(p, q)
        uq = edge(u, q)
        aq = edge(a, q)
        bq = edge(b, q)
        clause = tuple(
            -equal_variable(left, right)
            for left, right in (
                (pq, edge(p, u)),
                (pq, edge(q, t)),
                (pq, edge(q, v)),
                (edge(t, p), edge(t, b)),
                (uq, edge(u, v)),
                (uq, edge(u, a)),
                (edge(v, p), edge(v, a)),
                (aq, edge(a, t)),
                (aq, edge(a, b)),
                (bq, edge(b, u)),
                (bq, edge(b, a)),
            )
        )
        append_clause(
            clause,
            width=11,
            rule="seven-point seven-row interlock collision",
        )

    seven_row_interlock_count = len(clauses) - seven_row_interlock_start
    if (
        seven_row_interlock_count
        != EXPECTED_SEVEN_POINT_SEVEN_ROW_INTERLOCK_CLAUSES
    ):
        raise B1Exact12StaticGeometryError(
            "seven-point seven-row interlock clause count drifted: "
            f"expected {EXPECTED_SEVEN_POINT_SEVEN_ROW_INTERLOCK_CLAUSES}, "
            f"got {seven_row_interlock_count}"
        )

    six_row_interlock_start = len(clauses)
    for p, q, t, u, a, b in SIX_POINT_SIX_ROW_INTERLOCK_INSTANCES:
        qp = edge(q, p)
        aq = edge(a, q)
        clause = tuple(
            -equal_variable(left, right)
            for left, right in (
                (qp, edge(q, a)),
                (qp, edge(q, t)),
                (edge(p, q), edge(p, u)),
                (edge(u, q), edge(u, p)),
                (aq, edge(a, u)),
                (aq, edge(a, t)),
                (aq, edge(a, b)),
                (edge(t, p), edge(t, b)),
                (edge(b, q), edge(b, t)),
            )
        )
        append_clause(
            clause,
            width=9,
            rule="six-point six-row interlock collision",
        )

    six_row_interlock_count = len(clauses) - six_row_interlock_start
    if (
        six_row_interlock_count
        != EXPECTED_SIX_POINT_SIX_ROW_INTERLOCK_CLAUSES
    ):
        raise B1Exact12StaticGeometryError(
            "six-point six-row interlock clause count drifted: "
            f"expected {EXPECTED_SIX_POINT_SIX_ROW_INTERLOCK_CLAUSES}, "
            f"got {six_row_interlock_count}"
        )

    equilateral_median_interlock_start = len(clauses)
    for (
        p,
        q,
        t,
        a,
        v,
        b,
        u,
    ) in SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_INSTANCES:
        tp = edge(t, p)
        qp = edge(q, p)
        vt = edge(v, t)
        bq = edge(b, q)
        uq = edge(u, q)
        clause = tuple(
            -equal_variable(left, right)
            for left, right in (
                (tp, edge(t, q)),
                (qp, edge(q, t)),
                (qp, edge(q, v)),
                (qp, edge(q, b)),
                (edge(a, t), edge(a, q)),
                (vt, edge(v, b)),
                (vt, edge(v, u)),
                (bq, edge(b, a)),
                (bq, edge(b, u)),
                (uq, edge(u, a)),
                (uq, edge(u, v)),
            )
        )
        append_clause(
            clause,
            width=11,
            rule="seven-point equilateral-median interlock collision",
        )

    equilateral_median_interlock_count = (
        len(clauses) - equilateral_median_interlock_start
    )
    if (
        equilateral_median_interlock_count
        != EXPECTED_SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_CLAUSES
    ):
        raise B1Exact12StaticGeometryError(
            "seven-point equilateral-median interlock clause count drifted: "
            "expected "
            f"{EXPECTED_SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_CLAUSES}, "
            f"got {equilateral_median_interlock_count}"
        )
    if len(clauses) != EXPECTED_GEOMETRY_CLAUSES:
        raise B1Exact12StaticGeometryError(
            "total static-geometry clause count drifted: "
            f"expected {EXPECTED_GEOMETRY_CLAUSES}, got {len(clauses)}"
        )
    canonical_clauses.clear()
    return tuple(clauses)


def _geometry_clause_delta(
    equality_layout: B1StaticEqualityLayout,
) -> tuple[tuple[int, ...], ...]:
    relation_variable_items = tuple(sorted(equality_layout.relation_variables.items()))
    return _cached_geometry_clause_delta(
        equality_layout.edges,
        relation_variable_items,
    )


@dataclass(frozen=True)
class B1StaticGeometryLayout:
    """Authenticated parent identity and deterministic geometry clause suffix."""

    parent_manifest_sha256: str
    initial_n_variables: int
    initial_n_clauses: int
    final_n_variables: int
    final_n_clauses: int
    equilateral_bisector_clauses: int
    qcritical_aux_center_clauses: int
    seven_point_six_row_anchor_clauses: int
    seven_point_six_row_interlock_clauses: int
    six_point_five_row_interlock_clauses: int
    seven_point_seven_row_interlock_clauses: int
    six_point_six_row_interlock_clauses: int
    seven_point_equilateral_median_interlock_clauses: int
    geometry_clause_delta: tuple[tuple[int, ...], ...]
    initial_cnf_sha256: str
    final_cnf_sha256: str
    geometry_clause_delta_sha256: str

    @property
    def added_variables(self) -> int:
        return self.final_n_variables - self.initial_n_variables

    @property
    def added_clauses(self) -> int:
        return self.final_n_clauses - self.initial_n_clauses

    def _manifest_payload(self) -> dict[str, Any]:
        return {
            "schema": STATIC_GEOMETRY_SCHEMA,
            "semantic_status": SEMANTIC_STATUS,
            "promotion_eligible": PROMOTION_ELIGIBLE,
            "scope": SCOPE,
            "parent": {
                "schema": "p97_b1_exact12_static_equality.v1",
                "manifest_sha256": self.parent_manifest_sha256,
            },
            "counts": {
                "initial_variables": self.initial_n_variables,
                "initial_clauses": self.initial_n_clauses,
                "final_variables": self.final_n_variables,
                "final_clauses": self.final_n_clauses,
                "equilateral_bisector_clauses": (self.equilateral_bisector_clauses),
                "qcritical_aux_center_clauses": (self.qcritical_aux_center_clauses),
                "seven_point_six_row_anchor_clauses": (
                    self.seven_point_six_row_anchor_clauses
                ),
                "seven_point_six_row_interlock_clauses": (
                    self.seven_point_six_row_interlock_clauses
                ),
                "six_point_five_row_interlock_clauses": (
                    self.six_point_five_row_interlock_clauses
                ),
                "seven_point_seven_row_interlock_clauses": (
                    self.seven_point_seven_row_interlock_clauses
                ),
                "six_point_six_row_interlock_clauses": (
                    self.six_point_six_row_interlock_clauses
                ),
                "seven_point_equilateral_median_interlock_clauses": (
                    self.seven_point_equilateral_median_interlock_clauses
                ),
                "total_geometry_clauses": self.added_clauses,
                "added_variables": self.added_variables,
                "added_clauses": self.added_clauses,
            },
            "hashes": {
                "parent_manifest_sha256": self.parent_manifest_sha256,
                "initial_cnf_sha256": self.initial_cnf_sha256,
                "geometry_clause_delta_sha256": (self.geometry_clause_delta_sha256),
                "final_cnf_sha256": self.final_cnf_sha256,
            },
            "included_rules": list(INCLUDED_RULES),
            "omitted_rules": list(OMITTED_RULES),
            "finite_ingress_gaps": list(FINITE_INGRESS_GAPS),
            "source_clause_ledger": [dict(entry) for entry in SOURCE_CLAUSE_LEDGER],
        }

    def manifest(self) -> dict[str, Any]:
        payload = self._manifest_payload()
        return {**payload, "manifest_sha256": _canonical_json_sha256(payload)}


def _validate_geometry_layout(
    instance: B1SourceSafeCoverInstance,
    compiled: CompiledB1Exact12Cell,
    equality_layout: B1StaticEqualityLayout,
    geometry_layout: B1StaticGeometryLayout,
) -> None:
    try:
        _validate_equality_layout(
            instance,
            compiled,
            equality_layout,
            allow_appended_clauses=True,
        )
    except B1Exact12StaticEqualityError as exc:
        raise B1Exact12StaticGeometryError(str(exc)) from exc
    if type(geometry_layout) is not B1StaticGeometryLayout:
        raise B1Exact12StaticGeometryError("geometry layout has the wrong type")
    parent_hash = _parent_manifest_sha256(equality_layout)
    expected_delta = _geometry_clause_delta(equality_layout)
    if (
        geometry_layout.parent_manifest_sha256 != parent_hash
        or geometry_layout.initial_n_variables != equality_layout.final_n_variables
        or geometry_layout.initial_n_clauses != equality_layout.final_n_clauses
        or geometry_layout.final_n_variables != instance.cnf.n_variables
        or geometry_layout.final_n_clauses != len(instance.cnf.clauses)
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
        or geometry_layout.geometry_clause_delta != expected_delta
    ):
        raise B1Exact12StaticGeometryError(
            "geometry layout counts, parent, or canonical clause delta drifted"
        )
    if geometry_layout.geometry_clause_delta != tuple(
        instance.cnf.clauses[
            geometry_layout.initial_n_clauses : geometry_layout.final_n_clauses
        ]
    ):
        raise B1Exact12StaticGeometryError(
            "geometry clause suffix does not match the instance"
        )
    if (
        geometry_layout.initial_cnf_sha256 != equality_layout.final_cnf_sha256
        or geometry_layout.final_cnf_sha256 != _cnf_sha256(instance)
        or geometry_layout.geometry_clause_delta_sha256
        != _canonical_json_sha256(geometry_layout.geometry_clause_delta)
    ):
        raise B1Exact12StaticGeometryError(
            "geometry layout hashes do not match the instance"
        )
    if (
        getattr(instance, "_b1_exact12_static_geometry_layout", None)
        != (geometry_layout.manifest()["manifest_sha256"])
    ):
        raise B1Exact12StaticGeometryError(
            "geometry installation marker does not match the layout"
        )


def install_static_geometry_extension(
    instance: B1SourceSafeCoverInstance,
    compiled: CompiledB1Exact12Cell,
    equality_layout: B1StaticEqualityLayout,
) -> B1StaticGeometryLayout:
    """Append the deterministic geometry suffix to one installed equality layer."""

    if getattr(instance, "_b1_exact12_static_geometry_layout", None) is not None:
        raise B1Exact12StaticGeometryError(
            "static geometry extension is already installed"
        )
    try:
        _validate_equality_layout(instance, compiled, equality_layout)
    except B1Exact12StaticEqualityError as exc:
        raise B1Exact12StaticGeometryError(str(exc)) from exc

    initial_n_variables = instance.cnf.n_variables
    initial_n_clauses = len(instance.cnf.clauses)
    initial_cnf_sha256 = _cnf_sha256(instance)
    parent_manifest_sha256 = _parent_manifest_sha256(equality_layout)
    delta = _geometry_clause_delta(equality_layout)
    for clause in delta:
        instance.cnf.add_clause(clause)
    if instance.cnf.n_variables != initial_n_variables:
        raise B1Exact12StaticGeometryError(
            "static geometry unexpectedly introduced variables"
        )

    layout = B1StaticGeometryLayout(
        parent_manifest_sha256=parent_manifest_sha256,
        initial_n_variables=initial_n_variables,
        initial_n_clauses=initial_n_clauses,
        final_n_variables=instance.cnf.n_variables,
        final_n_clauses=len(instance.cnf.clauses),
        equilateral_bisector_clauses=(EXPECTED_EQUILATERAL_BISECTOR_CLAUSES),
        qcritical_aux_center_clauses=EXPECTED_QCRITICAL_AUX_CENTER_CLAUSES,
        seven_point_six_row_anchor_clauses=(
            EXPECTED_SEVEN_POINT_SIX_ROW_ANCHOR_CLAUSES
        ),
        seven_point_six_row_interlock_clauses=(
            EXPECTED_SEVEN_POINT_SIX_ROW_INTERLOCK_CLAUSES
        ),
        six_point_five_row_interlock_clauses=(
            EXPECTED_SIX_POINT_FIVE_ROW_INTERLOCK_CLAUSES
        ),
        seven_point_seven_row_interlock_clauses=(
            EXPECTED_SEVEN_POINT_SEVEN_ROW_INTERLOCK_CLAUSES
        ),
        six_point_six_row_interlock_clauses=(
            EXPECTED_SIX_POINT_SIX_ROW_INTERLOCK_CLAUSES
        ),
        seven_point_equilateral_median_interlock_clauses=(
            EXPECTED_SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_CLAUSES
        ),
        geometry_clause_delta=delta,
        initial_cnf_sha256=initial_cnf_sha256,
        final_cnf_sha256=_cnf_sha256(instance),
        geometry_clause_delta_sha256=_canonical_json_sha256(delta),
    )
    instance._b1_exact12_static_geometry_layout = layout.manifest()["manifest_sha256"]
    _validate_geometry_layout(instance, compiled, equality_layout, layout)
    return layout


def canonical_geometry_satisfies_delta(
    instance: B1SourceSafeCoverInstance,
    compiled: CompiledB1Exact12Cell,
    equality_layout: B1StaticEqualityLayout,
    geometry_layout: B1StaticGeometryLayout,
    cube: Mapping[int, Collection[int]],
) -> bool:
    """Replay one canonical equality valuation on the parent and geometry suffix."""

    _validate_geometry_layout(instance, compiled, equality_layout, geometry_layout)
    try:
        positive = canonical_extension_assignment(
            instance,
            compiled,
            equality_layout,
            cube,
            allow_appended_clauses=True,
        )
    except B1Exact12StaticEqualityError as exc:
        raise B1Exact12StaticGeometryError(str(exc)) from exc
    return all(
        _clause_satisfied(clause, positive)
        for clause in (
            equality_layout.clause_delta + geometry_layout.geometry_clause_delta
        )
    )


def _clause_satisfied(clause: Collection[int], positive: Collection[int]) -> bool:
    true_variables = frozenset(positive)
    return any(
        literal in true_variables if literal > 0 else -literal not in true_variables
        for literal in clause
    )


# Keep the established static-layer replay name available to callers.
canonical_extension_satisfies_delta = canonical_geometry_satisfies_delta

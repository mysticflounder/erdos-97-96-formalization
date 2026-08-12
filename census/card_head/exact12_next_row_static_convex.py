"""Third static geometry layer for the exact-12 next-row lane.

Version 2 compiles every distinct-label equilateral-bisector obstruction over
the row-generated equality relation.  Its first authenticated canary exposed
three distinct non-focus labels on the perpendicular bisector of one distinct
focus pair.  Convexity bounds that fibre by two, so this module appends the
complete detector-scope family over the same relation variables.

The extension is finite infrastructure, not a Lean proof.  Terminal promotion
still requires a geometry-aware Lean valuation proving every static clause,
including this layer's use of convex independence.
"""

from __future__ import annotations

import hashlib
import json
from dataclasses import dataclass
from itertools import combinations

from .exact12_next_row_static_equality import (
    Exact12NextRowStaticEqualityError,
    canonical_relation_assignment,
    clause_satisfied,
)
from .exact12_next_row_static_geometry import (
    Exact12NextRowStaticGeometryError,
    StaticGeometryLayout,
    install_static_geometry_extension,
)
from .exact12_next_row_static_geometry import (
    canonical_extension_satisfies_delta as geometry_extension_satisfies_delta,
)
from .exact12_next_row_valuation import (
    CompiledExact12NextRowArmCell,
    CompiledExact12NextRowCell,
)
from .source_faithful_candidate_surface import SourceFaithfulCoverInstance

STATIC_CONVEX_SCHEMA = "p97_rigid221_exact12_next_row_static_convex.v3"
SEMANTIC_STATUS = "FINITE_CONVEX_EXTENSION_REQUIRES_LEAN_VALUATION_BRIDGE"
LEAN_GEOMETRY_KERNEL = (
    "Problem97.Census554.EqualityCore."
    "false_of_convexIndep_of_perpBisectorCore"
)
LEAN_POSITIVE_CERTIFICATE = (
    "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
    "nonempty_perpBisectorCore_of_positiveCheck"
)
LEAN_SOURCE_ORDER_CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "SourceOrderTerminalBankConsumer.SourceOrderPositiveNogood."
    "ofPerpBisectorCertificate"
)
LABEL_SCOPE = "five_pairwise_distinct_labels"

N = 12
EXPECTED_PERP_BISECTOR_CLAUSES = 7_920


class Exact12NextRowStaticConvexError(ValueError):
    """The v3 extension or one of its frozen parents violated its contract."""


def _canonical_json_sha256(value: object) -> str:
    payload = json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("ascii")
    return hashlib.sha256(payload).hexdigest()


@dataclass(frozen=True)
class StaticConvexLayout:
    """The immutable v2 layout plus the perpendicular-bisector clause delta."""

    geometry: StaticGeometryLayout
    perpendicular_bisector_clauses: int
    convex_clause_delta: tuple[tuple[int, ...], ...]
    final_n_variables: int
    final_n_clauses: int
    final_cnf_sha256: str
    convex_clause_delta_sha256: str

    def manifest(self) -> dict[str, object]:
        return {
            "schema": STATIC_CONVEX_SCHEMA,
            "semantic_status": SEMANTIC_STATUS,
            "lean_geometry_kernel": LEAN_GEOMETRY_KERNEL,
            "lean_positive_certificate": LEAN_POSITIVE_CERTIFICATE,
            "lean_source_order_consumer": LEAN_SOURCE_ORDER_CONSUMER,
            "label_scope": LABEL_SCOPE,
            "scope": (
                "exact-12 next-row static equality, equilateral-bisector, and "
                "convex perpendicular-bisector extension; not terminal UNSAT, "
                "aggregate coverage, or Lean closure"
            ),
            "parent": self.geometry.manifest(),
            "counts": {
                "perpendicular_bisector_clauses": (
                    self.perpendicular_bisector_clauses
                ),
                "added_variables": 0,
                "added_clauses": len(self.convex_clause_delta),
                "final_variables": self.final_n_variables,
                "final_clauses": self.final_n_clauses,
            },
            "hashes": {
                "parent_final_cnf_sha256": self.geometry.final_cnf_sha256,
                "convex_clause_delta_sha256": self.convex_clause_delta_sha256,
                "final_cnf_sha256": self.final_cnf_sha256,
            },
        }


def _validate_compiled_suffix(
    instance: SourceFaithfulCoverInstance,
    *,
    base_n_variables: int,
    base_n_clauses: int,
    final_n_variables: int,
    final_n_clauses: int,
    clause_delta: tuple[tuple[int, ...], ...],
    clause_delta_sha256: str,
    contract_name: str,
) -> None:
    """Fail closed unless one compiled source suffix is still exact."""

    current_n_variables = instance.cnf.n_variables
    current_n_clauses = len(instance.cnf.clauses)
    if (
        base_n_variables != instance.base_n_variables
        or base_n_clauses != instance.base_n_clauses
        or final_n_variables != current_n_variables
        or final_n_clauses != current_n_clauses
        or base_n_clauses > current_n_clauses
    ):
        raise Exact12NextRowStaticConvexError(
            f"instance does not match the compiled {contract_name} contract"
        )
    actual_clause_delta = tuple(instance.cnf.clauses[base_n_clauses:])
    if (
        actual_clause_delta != clause_delta
        or _canonical_json_sha256(actual_clause_delta)
        != clause_delta_sha256
    ):
        raise Exact12NextRowStaticConvexError(
            f"compiled {contract_name} constraint suffix changed before "
            "v3 installation"
        )


def install_static_convex_extension(
    instance: SourceFaithfulCoverInstance,
    compiled: CompiledExact12NextRowCell | None = None,
) -> StaticConvexLayout:
    """Install v2 and v3 after the source next-row cell is compiled."""

    if type(compiled) is not CompiledExact12NextRowCell:
        raise Exact12NextRowStaticConvexError(
            "compile_cell must run before static convex installation"
        )
    _validate_compiled_suffix(
        instance,
        base_n_variables=compiled.base_n_variables,
        base_n_clauses=compiled.base_n_clauses,
        final_n_variables=compiled.final_n_variables,
        final_n_clauses=compiled.final_n_clauses,
        clause_delta=compiled.clause_delta,
        clause_delta_sha256=compiled.clause_delta_sha256,
        contract_name="next-row",
    )
    return _install_static_convex_layers(instance)


def install_static_convex_arm_extension(
    instance: SourceFaithfulCoverInstance,
    compiled: CompiledExact12NextRowArmCell | None = None,
) -> StaticConvexLayout:
    """Install v2 and v3 after the complete fixed-arm suffix is compiled."""

    if type(compiled) is not CompiledExact12NextRowArmCell:
        raise Exact12NextRowStaticConvexError(
            "compile_arm_cell must run before static convex installation"
        )
    _validate_compiled_suffix(
        instance,
        base_n_variables=compiled.base.base_n_variables,
        base_n_clauses=compiled.base.base_n_clauses,
        final_n_variables=compiled.final_n_variables,
        final_n_clauses=compiled.final_n_clauses,
        clause_delta=compiled.clause_delta,
        clause_delta_sha256=compiled.clause_delta_sha256,
        contract_name="next-row fixed-arm",
    )
    return _install_static_convex_layers(instance)


def _install_static_convex_layers(
    instance: SourceFaithfulCoverInstance,
) -> StaticConvexLayout:
    """Install the deterministic equality, geometry, and convex layers."""

    geometry = install_static_geometry_extension(instance)
    if hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest() != (
        geometry.final_cnf_sha256
    ):
        raise Exact12NextRowStaticConvexError(
            "v2 geometry formula changed before v3 installation"
        )

    equality = geometry.equality
    edge_index = {edge: index for index, edge in enumerate(equality.edges)}

    def edge(left: int, right: int) -> int:
        return edge_index[tuple(sorted((left, right)))]

    def equal_variable(first_edge: int, second_edge: int) -> int:
        if first_edge == second_edge:
            raise Exact12NextRowStaticConvexError(
                "perpendicular-bisector schema compared one edge with itself"
            )
        key = tuple(sorted((first_edge, second_edge)))
        try:
            return equality.relation_variables[key]
        except KeyError as exc:
            raise Exact12NextRowStaticConvexError(
                "v1 relation-variable map is incomplete"
            ) from exc

    initial_clause_count = len(instance.cnf.clauses)
    labels = tuple(range(N))
    for a, b in combinations(labels, 2):
        nonfocus = tuple(label for label in labels if label not in (a, b))
        for p, q, r in combinations(nonfocus, 3):
            clause = tuple(
                -equal_variable(edge(point, a), edge(point, b))
                for point in (p, q, r)
            )
            if len(set(clause)) != 3:
                raise Exact12NextRowStaticConvexError(
                    "perpendicular-bisector clause collapsed relation literals"
                )
            instance.cnf.add_clause(clause)

    delta = tuple(instance.cnf.clauses[initial_clause_count:])
    if len(delta) != EXPECTED_PERP_BISECTOR_CLAUSES:
        raise Exact12NextRowStaticConvexError(
            "perpendicular-bisector clause count drifted: "
            f"expected {EXPECTED_PERP_BISECTOR_CLAUSES}, got {len(delta)}"
        )
    if len({tuple(sorted(clause)) for clause in delta}) != len(delta):
        raise Exact12NextRowStaticConvexError(
            "perpendicular-bisector compiler emitted duplicate CNF clauses"
        )

    layout = StaticConvexLayout(
        geometry=geometry,
        perpendicular_bisector_clauses=len(delta),
        convex_clause_delta=delta,
        final_n_variables=instance.cnf.n_variables,
        final_n_clauses=len(instance.cnf.clauses),
        final_cnf_sha256=hashlib.sha256(
            instance.dimacs().encode("ascii")
        ).hexdigest(),
        convex_clause_delta_sha256=_canonical_json_sha256(delta),
    )
    instance._exact12_next_row_static_convex_layout = True
    return layout


def canonical_extension_satisfies_delta(
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    cube: dict[int, list[int]],
) -> bool:
    """Check the canonical row-generated relation on all three static layers."""

    try:
        geometry_ok = geometry_extension_satisfies_delta(
            instance, layout.geometry, cube
        )
        selected = {
            instance.choice_variables[(
                center,
                instance.candidate_index(center, support),
            )]
            for center, support in cube.items()
        }
        true_variables = selected | set(
            canonical_relation_assignment(instance, layout.geometry.equality, cube)
        )
    except (
        Exact12NextRowStaticEqualityError,
        Exact12NextRowStaticGeometryError,
    ) as exc:
        raise Exact12NextRowStaticConvexError(str(exc)) from exc
    return geometry_ok and all(
        clause_satisfied(clause, true_variables)
        for clause in layout.convex_clause_delta
    )

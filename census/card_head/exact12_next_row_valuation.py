"""Finite compiler for the exact-12 next-row-only-hit successor schema.

The schema is additive and intentionally separate from normalized v14.  Its
distinguished row contains frozen labels 7 and 9, while v14 requires label 9
to be absent.  This module compiles only the source-proved successor predicate
and independently replays it on decoded finite rows.

The compiler is an untrusted finite producer.  It proves no case coverage,
terminal UNSAT result, certificate replay, or Lean theorem.
"""

from __future__ import annotations

from collections.abc import Collection, Mapping
from dataclasses import dataclass
from typing import Any

from .exact12_v14_schedule import (
    NAMED_DELETION_ARMS,
    PLACEMENT_REPRESENTATIVES,
    json_sha256,
)
from .sat_encoding import CoverInstance, EncodingError
from .source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)

COMPILER_SCHEMA = "p97_rigid221_exact12_next_row_only_hit_compiler.v2"
ARM_COMPILER_SCHEMA = (
    "p97_rigid221_exact12_next_row_named_deletion_arm_compiler.v1"
)
SEMANTIC_STATUS = "FINITE_SOURCE_PREDICATE_COMPILER"
LEAN_INGRESS_THEOREM = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "exists_source_normalized_nextRowOnlyHitJob"
)
ARM_LEAN_INGRESS_THEOREM = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "exists_source_normalized_nextRowNamedDeletionJob"
)
FROZEN_CANDIDATE_TABLE_SHA256 = (
    "46b88900a6373390c13de522913df992c91edb717c5c7fe058b8230f825ddbae"
)
FROZEN_BASE_CNF_SHA256 = (
    "c899dee2ce06c0448f5c05b14c1eeb758b0603e3b20ee983a3f963e7be9b72d6"
)

N = 12
O = 1
U = 6
C = 7
XV = 8
XU = 9
Q = 10
W = 11

ARM_SPEC: Mapping[str, tuple[int, int]] = {
    "u_q": (U, Q),
    "u_w": (U, W),
    "xv_q": (XV, Q),
    "xv_w": (XV, W),
    "xu_q": (XU, Q),
    "xu_w": (XU, W),
}


class Exact12NextRowValuationError(ValueError):
    """The finite instance or placement violates the successor contract."""


@dataclass(frozen=True)
class Exact12NextRowCell:
    """One of the twelve normalized separated placement representatives."""

    placement_index: int
    joint_deletion: int
    v: int


@dataclass(frozen=True)
class Exact12NextRowArmCell:
    """One placement together with one source-proved named-deletion arm."""

    placement_index: int
    joint_deletion: int
    v: int
    arm: str

    def base_cell(self) -> Exact12NextRowCell:
        """Forget the named-deletion arm."""

        return Exact12NextRowCell(
            self.placement_index,
            self.joint_deletion,
            self.v,
        )


@dataclass(frozen=True)
class CompiledExact12NextRowCell:
    """Deterministic metadata and variable maps for one successor cell."""

    cell: Exact12NextRowCell
    physical: tuple[int, ...]
    row_at_o: tuple[int, ...]
    edges: Mapping[int, tuple[int, ...]]
    blocker_variables: Mapping[tuple[int, int], int]
    distinguished_d_variables: Mapping[int, int]
    base_n_variables: int
    base_n_clauses: int
    final_n_variables: int
    final_n_clauses: int
    clause_delta: tuple[tuple[int, ...], ...]
    clause_delta_sha256: str
    blocker_variable_map_sha256: str
    distinguished_d_variable_map_sha256: str

    def manifest(self) -> dict[str, Any]:
        """Return canonical metadata with an explicit non-closure status."""

        return {
            "schema": COMPILER_SCHEMA,
            "semantic_status": SEMANTIC_STATUS,
            "lean_ingress_theorem": LEAN_INGRESS_THEOREM,
            "scope": (
                "one finite next-row-only-hit successor cell relative to the "
                "frozen source-safe candidate CNF; no terminal, replay, "
                "aggregate coverage, or Lean-closure claim"
            ),
            "cell": {
                "placement_index": self.cell.placement_index,
                "joint_deletion": self.cell.joint_deletion,
                "v": self.cell.v,
            },
            "physical": list(self.physical),
            "row_at_o": list(self.row_at_o),
            "edges": [
                {"source": source, "edge": list(edge)}
                for source, edge in self.edges.items()
            ],
            "blocker_variables": [
                {"source": source, "center": center, "variable": variable}
                for (source, center), variable in sorted(
                    self.blocker_variables.items()
                )
            ],
            "distinguished_d_variables": [
                {"center": center, "variable": variable}
                for center, variable in sorted(
                    self.distinguished_d_variables.items()
                )
            ],
            "counts": {
                "base_variables": self.base_n_variables,
                "base_clauses": self.base_n_clauses,
                "final_variables": self.final_n_variables,
                "final_clauses": self.final_n_clauses,
                "added_variables": self.final_n_variables - self.base_n_variables,
                "added_clauses": self.final_n_clauses - self.base_n_clauses,
            },
            "hashes": {
                "clause_delta_sha256": self.clause_delta_sha256,
                "blocker_variable_map_sha256": self.blocker_variable_map_sha256,
                "distinguished_d_variable_map_sha256": (
                    self.distinguished_d_variable_map_sha256
                ),
            },
        }


@dataclass(frozen=True)
class CompiledExact12NextRowArmCell:
    """One additive fixed-arm refinement of a compiled successor cell."""

    cell: Exact12NextRowArmCell
    base: CompiledExact12NextRowCell
    final_n_variables: int
    final_n_clauses: int
    clause_delta: tuple[tuple[int, ...], ...]
    named_deletion_clause_delta: tuple[tuple[int, ...], ...]
    clause_delta_sha256: str
    named_deletion_clause_delta_sha256: str

    def manifest(self) -> dict[str, Any]:
        """Return deterministic metadata without making a closure claim."""

        return {
            "schema": ARM_COMPILER_SCHEMA,
            "semantic_status": SEMANTIC_STATUS,
            "lean_ingress_theorem": ARM_LEAN_INGRESS_THEOREM,
            "scope": (
                "one finite placement by named-deletion-arm refinement of the "
                "next-row-only-hit successor schema; no terminal, aggregate "
                "coverage, universal lift, or Lean-closure claim"
            ),
            "cell": {
                "placement_index": self.cell.placement_index,
                "joint_deletion": self.cell.joint_deletion,
                "v": self.cell.v,
                "arm": self.cell.arm,
            },
            "base_compiler_manifest": self.base.manifest(),
            "counts": {
                "base_variables": self.base.base_n_variables,
                "base_clauses": self.base.base_n_clauses,
                "final_variables": self.final_n_variables,
                "final_clauses": self.final_n_clauses,
                "added_clauses": self.final_n_clauses
                - self.base.base_n_clauses,
                "named_deletion_added_clauses": len(
                    self.named_deletion_clause_delta
                ),
            },
            "hashes": {
                "clause_delta_sha256": self.clause_delta_sha256,
                "named_deletion_clause_delta_sha256": (
                    self.named_deletion_clause_delta_sha256
                ),
            },
        }


def cells() -> tuple[Exact12NextRowCell, ...]:
    """Return the complete frozen twelve-cell placement schedule."""

    return tuple(
        Exact12NextRowCell(index, joint_deletion, v)
        for index, (joint_deletion, v) in enumerate(PLACEMENT_REPRESENTATIVES)
    )


def arm_cells() -> tuple[Exact12NextRowArmCell, ...]:
    """Return the complete deterministic 12 by 6 refinement schedule."""

    return tuple(
        Exact12NextRowArmCell(
            cell.placement_index,
            cell.joint_deletion,
            cell.v,
            arm,
        )
        for cell in cells()
        for arm in NAMED_DELETION_ARMS
    )


def _validate_cell(cell: Exact12NextRowCell) -> None:
    if not isinstance(cell, Exact12NextRowCell):
        raise Exact12NextRowValuationError("cell has the wrong type")
    if any(
        isinstance(value, bool) or not isinstance(value, int)
        for value in (cell.placement_index, cell.joint_deletion, cell.v)
    ):
        raise Exact12NextRowValuationError("cell fields must be plain integers")
    if not 0 <= cell.placement_index < len(PLACEMENT_REPRESENTATIVES):
        raise Exact12NextRowValuationError("placement index is outside the schedule")
    if PLACEMENT_REPRESENTATIVES[cell.placement_index] != (
        cell.joint_deletion,
        cell.v,
    ):
        raise Exact12NextRowValuationError(
            "placement coordinates do not match their index"
        )


def _validate_arm_cell(cell: Exact12NextRowArmCell) -> None:
    if not isinstance(cell, Exact12NextRowArmCell):
        raise Exact12NextRowValuationError("arm cell has the wrong type")
    _validate_cell(cell.base_cell())
    if cell.arm not in NAMED_DELETION_ARMS or cell.arm not in ARM_SPEC:
        raise Exact12NextRowValuationError(
            "named-deletion arm is outside the schedule"
        )


def _validate_pristine_instance(instance: CoverInstance) -> None:
    """Fail closed unless the exact frozen source-safe base CNF is supplied."""

    if type(instance) is not SourceFaithfulCoverInstance:
        raise Exact12NextRowValuationError(
            "instance must be the exact source-faithful candidate class"
        )
    if getattr(instance, "schema", None) != SOURCE_FAITHFUL_CANDIDATE_SCHEMA:
        raise Exact12NextRowValuationError(
            "instance is not the frozen source-faithful candidate surface"
        )
    model = getattr(instance, "model", None)
    if model is None or model.cardinality != N:
        raise Exact12NextRowValuationError("instance must have cardinality 12")
    if tuple(model.profile) != SOURCE_FAITHFUL_PYTHON_PROFILE:
        raise Exact12NextRowValuationError(
            "instance has the wrong exact-12 profile"
        )
    if (
        instance.cnf.n_variables != instance.base_n_variables
        or len(instance.cnf.clauses) != instance.base_n_clauses
    ):
        raise Exact12NextRowValuationError(
            "cell compiler requires a pristine source-faithful base instance"
        )
    candidate_payload = [
        [center, list(row)]
        for center in range(N)
        for row in instance.candidates[center]
    ]
    if json_sha256(candidate_payload) != FROZEN_CANDIDATE_TABLE_SHA256:
        raise Exact12NextRowValuationError(
            "source-faithful candidate table differs from the frozen contract"
        )
    if json_sha256(instance.cnf.clauses) != FROZEN_BASE_CNF_SHA256:
        raise Exact12NextRowValuationError(
            "source-faithful base CNF differs from the frozen contract"
        )


def _vars_matching(instance: CoverInstance, center: int, predicate: Any) -> list[int]:
    return [
        instance.choice_variables[(center, index)]
        for index, row in enumerate(instance.candidates[center])
        if predicate(frozenset(row))
    ]


def _require_any(
    instance: CoverInstance, variables: Collection[int], description: str
) -> None:
    choices = tuple(variables)
    if not choices:
        raise Exact12NextRowValuationError(
            f"source-faithful choice set is empty: {description}"
        )
    instance.cnf.add_clause(choices)


def _require_exact_row(
    instance: CoverInstance, center: int, row: Collection[int]
) -> None:
    try:
        index = instance.candidate_index(center, row)
    except EncodingError as exc:
        raise Exact12NextRowValuationError(
            f"required row at center {center} is absent from the candidate surface"
        ) from exc
    instance.cnf.add_clause((instance.choice_variables[(center, index)],))


def _add_physical_cycle(
    instance: CoverInstance,
    physical: frozenset[int],
    joint_deletion: int,
    v: int,
) -> tuple[dict[tuple[int, int], int], dict[int, tuple[int, ...]]]:
    """Encode the exact physical-cycle facts in the Lean job contract."""

    edges: dict[int, tuple[int, ...]] = {
        U: tuple(sorted((U, XU))),
        XU: tuple(sorted((XU, joint_deletion))),
        joint_deletion: tuple(sorted((joint_deletion, v))),
        v: tuple(sorted((v, XV))),
        XV: tuple(sorted((XV, U))),
    }
    blocker: dict[tuple[int, int], int] = {}
    for source, edge_tuple in edges.items():
        edge = frozenset(edge_tuple)
        choices: list[int] = []
        for center in range(N):
            if center in (source, O):
                continue
            variable = instance.cnf.new_variable()
            blocker[(source, center)] = variable
            choices.append(variable)
            allowed_rows = _vars_matching(
                instance,
                center,
                lambda row, source=source, edge=edge: (
                    source in row and row & physical == edge
                ),
            )
            if allowed_rows:
                instance.cnf.add_clause((-variable, *allowed_rows))
            else:
                instance.cnf.add_clause((-variable,))
        _require_any(instance, choices, f"actual blocker of source {source}")
        instance.cnf.at_most_sinz(choices, 1)

    instance.cnf.add_clause((blocker[(U, XV)],))
    instance.cnf.add_clause((blocker[(XV, C)],))

    for center in range(N):
        variables = [
            blocker[(source, center)]
            for source in edges
            if (source, center) in blocker
        ]
        instance.cnf.at_most_sinz(variables, 1)
    return blocker, edges


def _add_named_deletion_arm(
    instance: CoverInstance,
    blocker: Mapping[tuple[int, int], int],
    arm: str,
) -> None:
    """Compile one arm of ``FrozenNamedDeletionSixArm`` exactly."""

    if arm not in NAMED_DELETION_ARMS or arm not in ARM_SPEC:
        raise Exact12NextRowValuationError(
            "named-deletion arm is outside the schedule"
        )
    source, deletion = ARM_SPEC[arm]
    generated = 0
    for (candidate_source, center), blocker_variable in sorted(blocker.items()):
        if candidate_source != source:
            continue
        if center == 2:
            instance.cnf.add_clause((-blocker_variable,))
            generated += 1
        for index, row in enumerate(instance.candidates[center]):
            if deletion in row:
                choice = instance.choice_variables[(center, index)]
                instance.cnf.add_clause((-blocker_variable, -choice))
                generated += 1
    if generated == 0:
        raise Exact12NextRowValuationError(
            f"named-deletion arm {arm} generated no clauses"
        )


def _add_distinguished_d_disjunction(
    instance: CoverInstance,
    blocker: Mapping[tuple[int, int], int],
    joint_deletion: int,
    v: int,
) -> dict[int, int]:
    """Encode the existential ``d`` and the source-proved center disjunction.

    Physical-cycle injectivity already makes blocker indices 1, 2, and 3
    pairwise distinct and different from label 1.  Therefore

      card {blocker 1, blocker 2, 1, blocker 3, d} = 5
        or d = blocker 1

    is equivalent to ``d`` differing from blockers 2 and 3.  The row signs
    include ``7 in row d``, so the collision arm's reciprocal incidence is
    retained as well.
    """

    selectors: dict[int, int] = {}
    for d in range(N):
        if d in (O, C):
            continue
        selector = instance.cnf.new_variable()
        selectors[d] = selector
        eligible_rows = _vars_matching(
            instance,
            d,
            lambda row: C in row and XU in row and U not in row and XV not in row,
        )
        if eligible_rows:
            instance.cnf.add_clause((-selector, *eligible_rows))
        else:
            instance.cnf.add_clause((-selector,))

        blocker_two_at_d = blocker.get((joint_deletion, d))
        if blocker_two_at_d is not None:
            instance.cnf.add_clause((-selector, -blocker_two_at_d))
        blocker_three_at_d = blocker.get((v, d))
        if blocker_three_at_d is not None:
            instance.cnf.add_clause((-selector, -blocker_three_at_d))

    _require_any(instance, selectors.values(), "next-row distinguished d")
    instance.cnf.at_most_sinz(tuple(selectors.values()), 1)
    return selectors


def compile_cell(
    instance: CoverInstance, cell: Exact12NextRowCell
) -> CompiledExact12NextRowCell:
    """Compile one normalized placement and the exact successor predicate."""

    _validate_cell(cell)
    try:
        _validate_pristine_instance(instance)
    except ValueError as exc:
        raise Exact12NextRowValuationError(str(exc)) from exc

    base_n_variables = instance.cnf.n_variables
    base_n_clauses = len(instance.cnf.clauses)
    row_at_o = frozenset((U, cell.joint_deletion, cell.v, XV))
    physical = frozenset((U, XU, cell.joint_deletion, cell.v, XV))
    _require_exact_row(instance, O, row_at_o)
    _require_any(
        instance,
        _vars_matching(
            instance,
            C,
            lambda row: row & physical == frozenset((U, XV)),
        ),
        "row[7] physical intersection {6,8}",
    )
    blocker, edges = _add_physical_cycle(
        instance, physical, cell.joint_deletion, cell.v
    )
    d_variables = _add_distinguished_d_disjunction(
        instance, blocker, cell.joint_deletion, cell.v
    )

    clause_delta = tuple(instance.cnf.clauses[base_n_clauses:])
    blocker_payload = [
        [source, center, variable]
        for (source, center), variable in sorted(blocker.items())
    ]
    d_payload = [[center, variable] for center, variable in sorted(d_variables.items())]
    return CompiledExact12NextRowCell(
        cell=cell,
        physical=tuple(sorted(physical)),
        row_at_o=tuple(sorted(row_at_o)),
        edges=edges,
        blocker_variables=blocker,
        distinguished_d_variables=d_variables,
        base_n_variables=base_n_variables,
        base_n_clauses=base_n_clauses,
        final_n_variables=instance.cnf.n_variables,
        final_n_clauses=len(instance.cnf.clauses),
        clause_delta=clause_delta,
        clause_delta_sha256=json_sha256(clause_delta),
        blocker_variable_map_sha256=json_sha256(blocker_payload),
        distinguished_d_variable_map_sha256=json_sha256(d_payload),
    )


def compile_arm_cell(
    instance: CoverInstance,
    cell: Exact12NextRowArmCell,
) -> CompiledExact12NextRowArmCell:
    """Compile one fixed arm without changing the existing 12-cell contract."""

    _validate_arm_cell(cell)
    base = compile_cell(instance, cell.base_cell())
    arm_clause_start = len(instance.cnf.clauses)
    _add_named_deletion_arm(instance, base.blocker_variables, cell.arm)
    named_deletion_clause_delta = tuple(instance.cnf.clauses[arm_clause_start:])
    clause_delta = tuple(instance.cnf.clauses[base.base_n_clauses:])
    return CompiledExact12NextRowArmCell(
        cell=cell,
        base=base,
        final_n_variables=instance.cnf.n_variables,
        final_n_clauses=len(instance.cnf.clauses),
        clause_delta=clause_delta,
        named_deletion_clause_delta=named_deletion_clause_delta,
        clause_delta_sha256=json_sha256(clause_delta),
        named_deletion_clause_delta_sha256=json_sha256(
            named_deletion_clause_delta
        ),
    )


def frozen_next_row_only_hit_dichotomy_holds(
    cell: Exact12NextRowCell,
    cube: Mapping[int, Collection[int]],
    blockers: Mapping[int, int],
    d: int,
) -> bool:
    """Replay exactly ``FrozenNextRowOnlyHitDichotomy`` on finite labels."""

    try:
        _validate_cell(cell)
    except Exact12NextRowValuationError:
        return False
    if isinstance(d, bool) or not isinstance(d, int) or not 0 <= d < N:
        return False
    if d in (O, C) or d not in cube:
        return False
    row_d = frozenset(cube[d])
    if not ({C, XU} <= row_d and U not in row_d and XV not in row_d):
        return False
    required_sources = {XU, cell.joint_deletion, cell.v}
    if not required_sources <= set(blockers):
        return False
    five_centers = {
        blockers[XU],
        blockers[cell.joint_deletion],
        O,
        blockers[cell.v],
        d,
    }
    five_distinct = len(five_centers) == 5
    reciprocal_collision = d == blockers[XU] and C in frozenset(cube[blockers[XU]])
    return five_distinct or reciprocal_collision


def added_constraints_hold(
    cell: Exact12NextRowCell,
    cube: Mapping[int, Collection[int]],
    blockers: Mapping[int, int],
    d: int,
) -> bool:
    """Independently replay every finite constraint added by ``compile_cell``."""

    try:
        _validate_cell(cell)
    except Exact12NextRowValuationError:
        return False
    if set(cube) != set(range(N)) or set(blockers) != {
        U,
        XU,
        cell.joint_deletion,
        cell.v,
        XV,
    }:
        return False
    if any(isinstance(center, bool) or not isinstance(center, int) for center in cube):
        return False
    if any(
        isinstance(source, bool) or not isinstance(source, int) for source in blockers
    ):
        return False
    rows: dict[int, frozenset[int]] = {}
    for center in range(N):
        row = frozenset(cube[center])
        if any(
            isinstance(point, bool)
            or not isinstance(point, int)
            or not 0 <= point < N
            for point in row
        ):
            return False
        rows[center] = row
    if any(
        isinstance(center, bool)
        or not isinstance(center, int)
        or not 0 <= center < N
        for center in blockers.values()
    ):
        return False

    row_at_o = frozenset((U, cell.joint_deletion, cell.v, XV))
    physical = frozenset((U, XU, cell.joint_deletion, cell.v, XV))
    edges = {
        U: frozenset((U, XU)),
        XU: frozenset((XU, cell.joint_deletion)),
        cell.joint_deletion: frozenset((cell.joint_deletion, cell.v)),
        cell.v: frozenset((cell.v, XV)),
        XV: frozenset((XV, U)),
    }
    if rows[O] != row_at_o or rows[C] & physical != frozenset((U, XV)):
        return False
    if blockers[U] != XV or blockers[XV] != C:
        return False
    if len(set(blockers.values())) != len(blockers):
        return False
    for source, center in blockers.items():
        if center in (source, O):
            return False
        if source not in rows[center] or rows[center] & physical != edges[source]:
            return False
    return frozen_next_row_only_hit_dichotomy_holds(cell, rows, blockers, d)


def named_deletion_arm_holds(
    arm: str,
    cube: Mapping[int, Collection[int]],
    blockers: Mapping[int, int],
) -> bool:
    """Replay one fixed arm of ``FrozenNamedDeletionSixArm``."""

    if arm not in NAMED_DELETION_ARMS or arm not in ARM_SPEC:
        return False
    source, deletion = ARM_SPEC[arm]
    if source not in blockers:
        return False
    center = blockers[source]
    if (
        isinstance(center, bool)
        or not isinstance(center, int)
        or not 0 <= center < N
        or center not in cube
    ):
        return False
    row = frozenset(cube[center])
    if any(
        isinstance(point, bool)
        or not isinstance(point, int)
        or not 0 <= point < N
        for point in row
    ):
        return False
    return center != 2 and deletion not in row


def named_deletion_added_constraints_hold(
    cell: Exact12NextRowArmCell,
    cube: Mapping[int, Collection[int]],
    blockers: Mapping[int, int],
    d: int,
) -> bool:
    """Replay the complete next-row contract and one named-deletion arm."""

    try:
        _validate_arm_cell(cell)
    except Exact12NextRowValuationError:
        return False
    return added_constraints_hold(cell.base_cell(), cube, blockers, d) and (
        named_deletion_arm_holds(cell.arm, cube, blockers)
    )


def decode_distinguished_d(
    positive_variables: Collection[int],
    distinguished_d_variables: Mapping[int, int],
) -> int:
    """Decode the unique selected distinguished center."""

    positive = frozenset(positive_variables)
    selected = [
        center
        for center, variable in distinguished_d_variables.items()
        if variable in positive
    ]
    if len(selected) != 1:
        raise Exact12NextRowValuationError(
            f"distinguished d selects {len(selected)} centers"
        )
    return selected[0]


def decode_blockers(
    positive_variables: Collection[int],
    blocker_variables: Mapping[tuple[int, int], int],
) -> dict[int, int]:
    """Decode the unique selected blocker center for every physical source."""

    positive = frozenset(positive_variables)
    sources = sorted({source for source, _center in blocker_variables})
    decoded: dict[int, int] = {}
    for source in sources:
        selected = [
            center
            for (candidate_source, center), variable in blocker_variables.items()
            if candidate_source == source and variable in positive
        ]
        if len(selected) != 1:
            raise Exact12NextRowValuationError(
                f"blocker source {source} selects {len(selected)} centers"
            )
        decoded[source] = selected[0]
    return decoded

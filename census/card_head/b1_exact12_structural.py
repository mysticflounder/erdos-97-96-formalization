"""Exact-12 structural discovery cells for the open B1 leaf.

The base candidate cube uses source-proved incidence rules.  The four added
row clauses are the intended finite images of B1 facts, but their generic
exact-12 Lean ingress has not yet been constructed.  Consequently this module
is discovery-only even when a SAT witness passes its independent replay.  It
also omits metric equations, convex-boundary order, and every cardinality lift.
"""

from __future__ import annotations

import hashlib
import json
from collections.abc import Collection, Iterator, Mapping, Sequence
from dataclasses import dataclass
from itertools import combinations, permutations
from typing import Any

from .candidate_surface import (
    MOSER,
    CandidateSurfaceError,
    CapHeadModel,
    build_model,
    full_one_hit_ok,
)
from .candidate_surface import (
    V as A2,
)
from .profiles import labeled_cap_profiles
from .sat_encoding import CoverInstance, EncodingError

SCHEMA = "p97_b1_exact12_structural.v1"
SEMANTIC_STATUS = "diagnostic_exact12_structural_only"
PROMOTION_ELIGIBLE = False
SCOPE = (
    "Exact-12 structural discovery over a source-safe base and an explicitly "
    "unbridged B1 target cell; not a metric obstruction, cardinality lift, or "
    "Lean closure theorem"
)
SOURCE_CAP_ROLE_ORDER = (
    "surplus",
    "theorem_second_opposite",
    "theorem_first_opposite",
)
INCLUDED_RULES = (
    "row_cardinality_eq_4",
    "center_omission",
    "full_one_hit_at_moser_centers",
    "non_moser_moser_count_le_2",
    "non_moser_own_cap_same_count_le_2",
    "C2_pairwise_row_intersection_le_2",
    "C4_pair_multiplicity_le_2",
    "b1_apex_row_subset_physical_class",
    "b1_common_blocker_physical_intersection",
    "b1_u_blocker_physical_intersection",
    "b1_v_blocker_physical_intersection",
    "b1_physical_trace_cover",
    "b1_physical_cap_interior_lower_bound",
    "b1_distinguished_centers_pairwise_distinct",
)
OMITTED_RULES = (
    "metric_row_radius_and_distance_equalities",
    "convex_boundary_order_and_between_relations",
    "physical_circle_realizability",
    "ambient_R_and_minimal_counterexample_semantics",
    "exact13_and_cardinality_at_least_14_lifts",
    "universal_coverage_of_B1_normal_forms",
)
FINITE_INGRESS_GAPS = (
    "generic_apex_row_subset_physical_class",
    "generic_common_and_live_trace_rows_in_the_labeled_cube",
    "generic_B1_cover_to_exact12_labels",
    "generic_cap_interior_bound_to_exact12_labels",
    "generic_blocker_role_map_to_exact12_labels",
)
SOURCE_CLAUSE_LEDGER: tuple[Mapping[str, Any], ...] = (
    {
        "rule": "one_selected_four_row_per_center",
        "lean_sources": (
            "SelectedFourClass",
            "Census554.GeneralCarrierBridge.rowPattern_card",
            "ExactTwelveCarrierIngress.labeledRowPattern_card",
        ),
        "finite_status": "source_proved_base",
    },
    {
        "rule": "pairwise_row_intersection_le_two",
        "lean_sources": (
            "SelectedFourClass.inter_card_le_two",
            "ExactTwelveCarrierIngress.labeledRowPattern_inter_card_le_two",
        ),
        "finite_status": "source_proved_base",
    },
    {
        "rule": "source_pair_row_multiplicity_le_two",
        "lean_sources": (
            "ExactTwelveCarrierIngress.labeledRowPattern_pair_center_count_le_two",
            "Census554.CapSelectedCarrierBridge.pairCenterCount_patternCode",
        ),
        "finite_status": "source_proved_base",
    },
    {
        "rule": "common_blocker_physical_intersection",
        "lean_sources": ("ATailFrontierLiveClosure.b1_live_normalForm",),
        "finite_status": "B1_source_fact_missing_generic_labeled_ingress",
    },
    {
        "rule": "physical_trace_cover",
        "lean_sources": (
            "ATailFrontierLiveClosure.B1PhysicalClassFiveSixNormalForm",
        ),
        "finite_status": "B1_source_fact_missing_generic_labeled_ingress",
    },
    {
        "rule": "physical_cap_interior_lower_bound",
        "lean_sources": (
            "SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_card_sub_two",
            "ATailFrontierLiveClosure.b1_physicalClass_secondCapInterior_card_ge_three",
        ),
        "finite_status": "source_proved_missing_generic_labeled_ingress",
    },
    {
        "rule": "apex_and_blocker_row_roles",
        "lean_sources": (
            "ExactFourMutualOmissionJointDeletion",
            "CommonDeletionTwoCenterPacket",
        ),
        "finite_status": "target_encoding_missing_generic_labeled_ingress",
    },
)


class B1Exact12StructuralError(ValueError):
    """The finite instance, cell, or decoded assignment breaks its contract."""


@dataclass(frozen=True)
class B1TraceArm:
    """One normalized split of the two deletion traces inside the class."""

    name: str
    class_card: int
    u_slice: tuple[str, ...]
    v_slice: tuple[str, ...]

    def __post_init__(self) -> None:
        if self.class_card not in (5, 6):
            raise B1Exact12StructuralError("trace-arm class size must be 5 or 6")
        allowed = {"u", "v", "m0", "m1"}
        if not self.name or not self.u_slice or not self.v_slice:
            raise B1Exact12StructuralError("trace-arm fields must be nonempty")
        if not set(self.u_slice + self.v_slice) <= allowed:
            raise B1Exact12StructuralError("trace arm uses an unknown role")
        if len(set(self.u_slice)) != len(self.u_slice):
            raise B1Exact12StructuralError("u trace slice repeats a role")
        if len(set(self.v_slice)) != len(self.v_slice):
            raise B1Exact12StructuralError("v trace slice repeats a role")


FIVE_U_SINGLE_V_PAIR = B1TraceArm(
    "five_u_single_v_pair", 5, ("u",), ("v", "m0")
)
FIVE_U_PAIR_V_SINGLE = B1TraceArm(
    "five_u_pair_v_single", 5, ("u", "m0"), ("v",)
)
FIVE_SHARED_MATE = B1TraceArm(
    "five_shared_mate", 5, ("u", "m0"), ("v", "m0")
)
SIX_DISJOINT_PAIRS = B1TraceArm(
    "six_disjoint_pairs", 6, ("u", "m0"), ("v", "m1")
)
TRACE_ARMS_BY_CARD: Mapping[int, tuple[B1TraceArm, ...]] = {
    5: (FIVE_U_SINGLE_V_PAIR, FIVE_U_PAIR_V_SINGLE, FIVE_SHARED_MATE),
    6: (SIX_DISJOINT_PAIRS,),
}


def trace_arms(class_card: int) -> tuple[B1TraceArm, ...]:
    """Return the source-normalized trace branches in stable order."""

    try:
        return TRACE_ARMS_BY_CARD[class_card]
    except KeyError as exc:
        raise B1Exact12StructuralError("class size must be 5 or 6") from exc


def _is_point(value: object, cardinality: int = 12) -> bool:
    return type(value) is int and 0 <= value < cardinality


@dataclass(frozen=True)
class B1Exact12Cell:
    """One fully named exact-12 B1 structural branch."""

    profile: tuple[int, int, int]
    physical: tuple[int, ...]
    q: int
    r: int
    u: int
    v: int
    mates: tuple[int, ...]
    common_blocker: int
    u_blocker: int
    v_blocker: int
    arm: B1TraceArm

    def __post_init__(self) -> None:
        try:
            model = build_model(12, self.profile)
        except (CandidateSurfaceError, ValueError) as exc:
            raise B1Exact12StructuralError("cell profile is not authorized") from exc
        if len(self.physical) not in (5, 6):
            raise B1Exact12StructuralError("physical class must have size 5 or 6")
        if self.physical != tuple(sorted(set(self.physical))):
            raise B1Exact12StructuralError("physical class must be sorted and unique")
        if not all(_is_point(point) for point in self.physical):
            raise B1Exact12StructuralError("physical class contains an invalid label")
        if A2 in self.physical:
            raise B1Exact12StructuralError("the apex center must be omitted")

        named = (self.q, self.r, self.u, self.v)
        if not all(_is_point(point) for point in named) or len(set(named)) != 4:
            raise B1Exact12StructuralError("q, r, u, and v must be distinct labels")
        if not set(named) <= set(self.physical):
            raise B1Exact12StructuralError("named trace points must lie in the class")
        residual = set(self.physical) - set(named)
        if len(self.mates) != len(self.physical) - 4:
            raise B1Exact12StructuralError("mate count does not match the class size")
        if len(set(self.mates)) != len(self.mates) or set(self.mates) != residual:
            raise B1Exact12StructuralError("mates must enumerate the residual points")
        if self.arm not in trace_arms(len(self.physical)):
            raise B1Exact12StructuralError("trace arm does not match the class size")

        blockers = self.blockers
        if not all(_is_point(point) for point in blockers):
            raise B1Exact12StructuralError("blocker is outside the exact-12 model")
        if A2 in blockers or len(set(blockers)) != 3:
            raise B1Exact12StructuralError(
                "the apex and three blocker centers must be pairwise distinct"
            )
        if self.common_blocker in {self.q, self.r}:
            raise B1Exact12StructuralError("common blocker lies in its own trace")
        if self.u_blocker in set(self.u_slice):
            raise B1Exact12StructuralError("u blocker lies in its own trace")
        if self.v_blocker in set(self.v_slice):
            raise B1Exact12StructuralError("v blocker lies in its own trace")
        covered = {self.q, self.r, *self.u_slice, *self.v_slice}
        if covered != set(self.physical):
            raise B1Exact12StructuralError("trace pieces do not cover the class")
        if len(set(self.physical) & set(model.interiors[1])) < len(self.physical) - 2:
            raise B1Exact12StructuralError(
                "physical class misses the second-cap interior lower bound"
            )

    @property
    def blockers(self) -> tuple[int, int, int]:
        return (self.common_blocker, self.u_blocker, self.v_blocker)

    def _resolve(self, roles: Sequence[str]) -> tuple[int, ...]:
        role_points = {
            "u": self.u,
            "v": self.v,
            **{f"m{index}": point for index, point in enumerate(self.mates)},
        }
        try:
            return tuple(role_points[role] for role in roles)
        except KeyError as exc:
            raise B1Exact12StructuralError("trace arm references an absent mate") from exc

    @property
    def u_slice(self) -> tuple[int, ...]:
        return self._resolve(self.arm.u_slice)

    @property
    def v_slice(self) -> tuple[int, ...]:
        return self._resolve(self.arm.v_slice)

    def payload(self) -> dict[str, Any]:
        return {
            "profile": list(self.profile),
            "physical": list(self.physical),
            "q": self.q,
            "r": self.r,
            "u": self.u,
            "v": self.v,
            "mates": list(self.mates),
            "common_blocker": self.common_blocker,
            "u_blocker": self.u_blocker,
            "v_blocker": self.v_blocker,
            "arm": self.arm.name,
            "u_slice": list(self.u_slice),
            "v_slice": list(self.v_slice),
        }


def source_safe_candidate_class_ok(
    model: CapHeadModel, center: int, candidate: Collection[int]
) -> bool:
    """Check only the per-center rules used by this B1 exact-12 lane."""

    if model.cardinality != 12 or model.profile not in labeled_cap_profiles(12):
        return False
    if type(center) is not int:
        return False
    chosen = frozenset(candidate)
    if not 0 <= center < 12 or len(chosen) != 4 or center in chosen:
        return False
    if not chosen <= set(range(12)) or not full_one_hit_ok(model, center, chosen):
        return False
    if center in MOSER:
        return True
    return (
        len(chosen & MOSER) <= 2
        and len(chosen & model.own_cap_interior(center)) <= 2
    )


def source_safe_candidate_classes(
    model: CapHeadModel, center: int
) -> tuple[tuple[int, int, int, int], ...]:
    """Enumerate the exact-12 source-safe rows in lexicographic order."""

    if not 0 <= center < model.cardinality:
        raise CandidateSurfaceError("center is outside the model")
    others = (point for point in range(model.cardinality) if point != center)
    return tuple(
        candidate
        for candidate in combinations(others, 4)
        if source_safe_candidate_class_ok(model, center, candidate)
    )


def source_safe_cube_ok(
    model: CapHeadModel, cube: Mapping[int, Collection[int]]
) -> bool:
    """Replay source-safe admission, pair intersections, and pair multiplicity."""

    if set(cube) != set(range(model.cardinality)):
        return False
    normalized: dict[int, frozenset[int]] = {}
    pair_counts: dict[tuple[int, int], int] = {}
    for center in range(model.cardinality):
        row = frozenset(cube[center])
        if not source_safe_candidate_class_ok(model, center, row):
            return False
        normalized[center] = row
        for pair in combinations(sorted(row), 2):
            pair_counts[pair] = pair_counts.get(pair, 0) + 1
            if pair_counts[pair] > 2:
                return False
    return all(
        len(normalized[first] & normalized[second]) <= 2
        for first, second in combinations(range(model.cardinality), 2)
    )


class B1SourceSafeCoverInstance(CoverInstance):
    """C1/C2/C4 exact-12 CNF for any authorized labeled cap profile."""

    schema = SCHEMA

    def __init__(self, model: CapHeadModel) -> None:
        if model.cardinality != 12 or model.profile not in labeled_cap_profiles(12):
            raise CandidateSurfaceError(
                "B1 source-safe instances require an authorized exact-12 profile"
            )
        super().__init__(
            model,
            candidate_provider=source_safe_candidate_classes,
            cube_validator=source_safe_cube_ok,
        )


def cells(
    *,
    profiles: Collection[Sequence[int]] | None = None,
    class_cards: Collection[int] = (5, 6),
    limit: int | None = None,
) -> Iterator[B1Exact12Cell]:
    """Lazily enumerate named B1 cells without a hidden symmetry quotient."""

    normalized_profiles = (
        labeled_cap_profiles(12)
        if profiles is None
        else tuple(tuple(profile) for profile in profiles)
    )
    normalized_cards = tuple(class_cards)
    if any(card not in (5, 6) for card in normalized_cards):
        raise B1Exact12StructuralError("class sizes must be drawn from 5 and 6")
    if len(set(normalized_cards)) != len(normalized_cards):
        raise B1Exact12StructuralError("class sizes must not repeat")
    if limit is not None and (type(limit) is not int or limit < 0):
        raise B1Exact12StructuralError("limit must be a nonnegative integer")

    emitted = 0
    labels_without_apex = tuple(point for point in range(12) if point != A2)
    for profile in normalized_profiles:
        try:
            model = build_model(12, profile)
        except (CandidateSurfaceError, ValueError) as exc:
            raise B1Exact12StructuralError("requested profile is unauthorized") from exc
        for class_card in normalized_cards:
            for physical in combinations(labels_without_apex, class_card):
                if len(set(physical) & set(model.interiors[1])) < class_card - 2:
                    continue
                for q, r, u, v in permutations(physical, 4):
                    residual = tuple(
                        point for point in physical if point not in {q, r, u, v}
                    )
                    mate_orders = (
                        (residual,) if class_card == 5 else tuple(permutations(residual))
                    )
                    for mates in mate_orders:
                        for arm in trace_arms(class_card):
                            for common_blocker, u_blocker, v_blocker in permutations(
                                labels_without_apex, 3
                            ):
                                try:
                                    cell = B1Exact12Cell(
                                        profile=tuple(profile),
                                        physical=physical,
                                        q=q,
                                        r=r,
                                        u=u,
                                        v=v,
                                        mates=tuple(mates),
                                        common_blocker=common_blocker,
                                        u_blocker=u_blocker,
                                        v_blocker=v_blocker,
                                        arm=arm,
                                    )
                                except B1Exact12StructuralError:
                                    continue
                                if limit is not None and emitted >= limit:
                                    return
                                yield cell
                                emitted += 1


def _json_sha256(value: Any) -> str:
    payload = json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("ascii")
    return hashlib.sha256(payload).hexdigest()


def _matching_variables(
    instance: B1SourceSafeCoverInstance,
    center: int,
    predicate: Any,
) -> tuple[int, ...]:
    return tuple(
        instance.choice_variables[(center, index)]
        for index, row in enumerate(instance.candidates[center])
        if predicate(frozenset(row))
    )


@dataclass(frozen=True)
class CompiledB1Exact12Cell:
    """Deterministic clause delta and semantic map for one structural cell."""

    cell: B1Exact12Cell
    required_variable_groups: tuple[tuple[str, tuple[int, ...]], ...]
    base_n_variables: int
    base_n_clauses: int
    final_n_variables: int
    final_n_clauses: int
    clause_delta: tuple[tuple[int, ...], ...]
    clause_delta_sha256: str

    def manifest(self) -> dict[str, Any]:
        return {
            "schema": SCHEMA,
            "semantic_status": SEMANTIC_STATUS,
            "promotion_eligible": PROMOTION_ELIGIBLE,
            "scope": SCOPE,
            "source_cap_role_order": list(SOURCE_CAP_ROLE_ORDER),
            "cell": self.cell.payload(),
            "required_variable_groups": [
                {"name": name, "variables": list(variables)}
                for name, variables in self.required_variable_groups
            ],
            "empty_required_groups": [
                name
                for name, variables in self.required_variable_groups
                if not variables
            ],
            "counts": {
                "base_variables": self.base_n_variables,
                "base_clauses": self.base_n_clauses,
                "final_variables": self.final_n_variables,
                "final_clauses": self.final_n_clauses,
                "added_variables": self.final_n_variables - self.base_n_variables,
                "added_clauses": self.final_n_clauses - self.base_n_clauses,
            },
            "clause_delta_sha256": self.clause_delta_sha256,
            "included_rules": list(INCLUDED_RULES),
            "omitted_rules": list(OMITTED_RULES),
            "finite_ingress_gaps": list(FINITE_INGRESS_GAPS),
            "source_clause_ledger": [dict(entry) for entry in SOURCE_CLAUSE_LEDGER],
        }


def compile_cell(
    instance: B1SourceSafeCoverInstance, cell: B1Exact12Cell
) -> CompiledB1Exact12Cell:
    """Add four row-choice clauses, retaining an empty local obstruction."""

    if not isinstance(instance, B1SourceSafeCoverInstance):
        raise B1Exact12StructuralError("compiler requires a B1 source-safe instance")
    if instance.model.profile != cell.profile:
        raise B1Exact12StructuralError("instance profile does not match the cell")
    if (
        instance.cnf.n_variables != instance.base_n_variables
        or len(instance.cnf.clauses) != instance.base_n_clauses
        or instance.pattern_variables
        or instance.exclusion_clauses
    ):
        raise B1Exact12StructuralError("compiler requires a pristine instance")

    physical = frozenset(cell.physical)
    specifications = (
        ("apex_row_subset_physical", A2, lambda row: row <= physical),
        (
            "common_blocker_intersection_qr",
            cell.common_blocker,
            lambda row: row & physical == {cell.q, cell.r},
        ),
        (
            "u_blocker_trace_intersection",
            cell.u_blocker,
            lambda row: row & physical == set(cell.u_slice),
        ),
        (
            "v_blocker_trace_intersection",
            cell.v_blocker,
            lambda row: row & physical == set(cell.v_slice),
        ),
    )
    groups: list[tuple[str, tuple[int, ...]]] = []
    for name, center, predicate in specifications:
        variables = _matching_variables(instance, center, predicate)
        instance.cnf.add_clause(variables)
        groups.append((name, variables))

    clause_delta = tuple(instance.cnf.clauses[instance.base_n_clauses :])
    return CompiledB1Exact12Cell(
        cell=cell,
        required_variable_groups=tuple(groups),
        base_n_variables=instance.base_n_variables,
        base_n_clauses=instance.base_n_clauses,
        final_n_variables=instance.cnf.n_variables,
        final_n_clauses=len(instance.cnf.clauses),
        clause_delta=clause_delta,
        clause_delta_sha256=_json_sha256(clause_delta),
    )


def _literal_true(literal: int, positive: frozenset[int]) -> bool:
    return literal in positive if literal > 0 else -literal not in positive


def replay_structural_cube(
    instance: B1SourceSafeCoverInstance,
    cell: B1Exact12Cell,
    cube: Mapping[int, Collection[int]],
) -> dict[str, bool]:
    """Replay the base cube and B1 target predicates without CNF auxiliaries."""

    if not isinstance(instance, B1SourceSafeCoverInstance):
        raise B1Exact12StructuralError("replay requires a B1 source-safe instance")
    if instance.model.profile != cell.profile:
        raise B1Exact12StructuralError("replay cell profile does not match instance")
    if not source_safe_cube_ok(instance.model, cube):
        raise B1Exact12StructuralError("cube violates the source-safe base")

    physical = set(cell.physical)
    checks = {
        "source_safe_cube": True,
        "apex_row_subset_physical": set(cube[A2]) <= physical,
        "common_blocker_intersection_qr": set(cube[cell.common_blocker])
        & physical
        == {cell.q, cell.r},
        "u_blocker_trace_intersection": set(cube[cell.u_blocker]) & physical
        == set(cell.u_slice),
        "v_blocker_trace_intersection": set(cube[cell.v_blocker]) & physical
        == set(cell.v_slice),
        "trace_cover": {cell.q, cell.r, *cell.u_slice, *cell.v_slice}
        == physical,
        "cap_interior_lower_bound": len(
            physical & set(instance.model.interiors[1])
        )
        >= len(physical) - 2,
        "distinguished_centers_pairwise_distinct": len(
            {A2, *cell.blockers}
        )
        == 4,
    }
    if not all(checks.values()):
        failed = ", ".join(name for name, ok in checks.items() if not ok)
        raise B1Exact12StructuralError(f"structural cube replay failed: {failed}")
    return checks


def decode_and_replay(
    instance: B1SourceSafeCoverInstance,
    compiled: CompiledB1Exact12Cell,
    positive_variables: Collection[int],
) -> dict[str, Any]:
    """Decode a SAT assignment and replay every structural constraint."""

    if not isinstance(instance, B1SourceSafeCoverInstance):
        raise B1Exact12StructuralError("replay requires a B1 source-safe instance")
    raw_positive = tuple(positive_variables)
    if any(
        type(variable) is not int
        or variable <= 0
        or variable > compiled.final_n_variables
        for variable in raw_positive
    ):
        raise B1Exact12StructuralError("positive assignment contains an invalid variable")
    positive = frozenset(raw_positive)
    if (
        instance.model.profile != compiled.cell.profile
        or instance.cnf.n_variables != compiled.final_n_variables
        or len(instance.cnf.clauses) != compiled.final_n_clauses
        or tuple(instance.cnf.clauses[compiled.base_n_clauses :])
        != compiled.clause_delta
        or _json_sha256(compiled.clause_delta) != compiled.clause_delta_sha256
    ):
        raise B1Exact12StructuralError("compiled instance metadata no longer matches")
    if not all(
        any(_literal_true(literal, positive) for literal in clause)
        for clause in instance.cnf.clauses
    ):
        raise B1Exact12StructuralError("assignment does not satisfy the compiled CNF")
    try:
        cube = instance.decode_model(positive)
    except EncodingError as exc:
        raise B1Exact12StructuralError("assignment does not decode safely") from exc

    checks = {
        **replay_structural_cube(instance, compiled.cell, cube),
        "compiled_clause_delta": all(
            any(_literal_true(literal, positive) for literal in clause)
            for clause in compiled.clause_delta
        ),
    }
    if not all(checks.values()):
        failed = ", ".join(name for name, ok in checks.items() if not ok)
        raise B1Exact12StructuralError(f"independent replay failed: {failed}")
    return {
        "schema": SCHEMA,
        "semantic_status": SEMANTIC_STATUS,
        "promotion_eligible": PROMOTION_ELIGIBLE,
        "valid": True,
        "cell": compiled.cell.payload(),
        "cube": {str(center): cube[center] for center in sorted(cube)},
        "checks": checks,
        "positive_variable_count": len(positive),
        "clause_delta_sha256": compiled.clause_delta_sha256,
    }

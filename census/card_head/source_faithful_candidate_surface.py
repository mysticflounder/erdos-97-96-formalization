"""Source-faithful exact-12 Rigid221 candidate surface and CNF adapter.

This contract mirrors the rules proved by
``ExactTwelveRigid221SafeCandidate.lean``.  It deliberately excludes both the
historical mixed Moser/same-cap cut and the physical-circle constraints used by
the diagnostic exact-12 probe.  A finite SAT result over this surface remains
empirical until the candidate-index and concrete-CNF valuation bridge is
kernel checked.
"""

from __future__ import annotations

from collections.abc import Collection, Mapping
from itertools import combinations

from .candidate_surface import (
    MOSER,
    CandidateSurfaceError,
    CapHeadModel,
    full_one_hit_ok,
)
from .sat_encoding import CoverInstance

SOURCE_FAITHFUL_CANDIDATE_SCHEMA = (
    "p97_rigid221_exact12_source_safe_candidate.v1"
)
# ``CapHeadModel`` orders its last two caps oppositely to the theorem-facing
# ingress.  Thus Python profile (5,6,4) represents theorem profile (5,4,6).
SOURCE_FAITHFUL_PYTHON_PROFILE = (5, 6, 4)
SOURCE_THEOREM_PROFILE = (5, 4, 6)
SOURCE_CAP_ROLE_ORDER = (
    "surplus",
    "theorem_second_opposite",
    "theorem_first_opposite",
)
SOURCE_FAITHFUL_SCOPE = (
    "Source-faithful finite candidate/C1/C2/C4 abstraction for the exact-12 "
    "Rigid221 ingress; not a Lean proof or a geometric closure theorem"
)
SOURCE_FAITHFUL_INCLUDED_RULES = (
    "row_cardinality_eq_4",
    "center_omission",
    "six_moser_one_hit_inequalities",
    "non_moser_moser_count_le_2",
    "non_moser_own_cap_same_count_le_2",
    "C2_pairwise_row_intersection_le_2",
    "C4_pair_multiplicity_le_2",
)
SOURCE_FAITHFUL_EXCLUDED_RULES = (
    "mixed_moser_ge_2_same_cap_ge_1",
    "probe_physical_apex_membership",
    "probe_physical_circle_C2",
    "probe_physical_pair_at_most_one",
    "probe_physical_blocker_injectivity",
)


def source_faithful_candidate_class_ok(
    model: CapHeadModel, center: int, candidate: Collection[int]
) -> bool:
    """Check exactly the source-proved per-center safe candidate rules."""

    if (
        model.cardinality != 12
        or model.profile != SOURCE_FAITHFUL_PYTHON_PROFILE
    ):
        return False
    chosen = frozenset(candidate)
    if not 0 <= center < model.cardinality:
        return False
    if len(chosen) != 4 or center in chosen:
        return False
    if not chosen <= set(range(model.cardinality)):
        return False
    if not full_one_hit_ok(model, center, chosen):
        return False
    if center in MOSER:
        return True

    return (
        len(chosen & MOSER) <= 2
        and len(chosen & model.own_cap_interior(center)) <= 2
    )


def source_faithful_candidate_classes(
    model: CapHeadModel, center: int
) -> tuple[tuple[int, int, int, int], ...]:
    """Enumerate safe candidates in the encoder's lexicographic order."""

    if not 0 <= center < model.cardinality:
        raise CandidateSurfaceError("center is outside the model")
    others = (point for point in range(model.cardinality) if point != center)
    return tuple(
        candidate
        for candidate in combinations(others, 4)
        if source_faithful_candidate_class_ok(model, center, candidate)
    )


def source_faithful_cube_ok(
    model: CapHeadModel, cube: Mapping[int, Collection[int]]
) -> bool:
    """Independently replay safe candidate admission plus C2 and C4."""

    if set(cube) != set(range(model.cardinality)):
        return False
    normalized: dict[int, frozenset[int]] = {}
    pair_counts: dict[tuple[int, int], int] = {}
    for center in range(model.cardinality):
        candidate = frozenset(cube[center])
        if not source_faithful_candidate_class_ok(model, center, candidate):
            return False
        normalized[center] = candidate
        for pair in combinations(sorted(candidate), 2):
            pair_counts[pair] = pair_counts.get(pair, 0) + 1
            if pair_counts[pair] > 2:
                return False
    return all(
        len(normalized[first] & normalized[second]) <= 2
        for first, second in combinations(range(model.cardinality), 2)
    )


class SourceFaithfulCoverInstance(CoverInstance):
    """C1/C2/C4 CNF over the exact-12 Rigid221 source-safe candidates."""

    schema = SOURCE_FAITHFUL_CANDIDATE_SCHEMA

    def __init__(self, model: CapHeadModel) -> None:
        if (
            model.cardinality != 12
            or model.profile != SOURCE_FAITHFUL_PYTHON_PROFILE
        ):
            raise CandidateSurfaceError(
                "the Rigid221 source-faithful contract requires the exact-12 "
                "frozen profile"
            )
        super().__init__(
            model,
            candidate_provider=source_faithful_candidate_classes,
            cube_validator=source_faithful_cube_ok,
        )

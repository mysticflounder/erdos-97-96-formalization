#!/usr/bin/env python3
"""Enumerate the source-facing layers of the period-three identity quotient.

This is a combinatorial schema census, not a metric decision and not a Lean
proof.  It deliberately stops before boundary-order enumeration.  The layers
are kept separate so that a future source-to-cell theorem can justify each
quotient instead of inheriting one fixed labelled configuration.

The cap-role alphabet is the one used by the audited
``FirstApexShellRolePacket`` surface:

* ``I`` -- strict first-opposite-cap point;
* ``S`` -- surplus-cap hit; and
* ``O`` -- physical/second-opposite-cap hit.

The script retains labelled row slots for the source-coverage counts.  It also
reports the smaller count obtained by forgetting permutations of genuinely
unnamed support-completion slots, but does not use that smaller count as a
proved quotient.
"""

from __future__ import annotations

from collections import Counter
from dataclasses import asdict, dataclass
from itertools import combinations, combinations_with_replacement, product
import json
from math import comb, factorial
from typing import Iterator


ROLES = ("I", "S", "O")
FRONTIER_ROLE_WORDS = ("II", "IO", "OI")
TARGET_SLOTS = tuple(f"{side}{row}" for row in range(3) for side in "xy")
TARGET_PAIRS = tuple((f"x{row}", f"y{row}") for row in range(3))


def cap_hits_are_legal(roles: tuple[str, ...], minimum_interior: int = 2) -> bool:
    """The audited one-hit and strict-first lower bounds for one radius."""

    return (
        roles.count("I") >= minimum_interior
        and roles.count("S") <= 1
        and roles.count("O") <= 1
    )


@dataclass(frozen=True)
class EqualRadiusCell:
    frontier_roles: str
    t1_roles: tuple[str, str, str, str]
    overlap_t1_slots: tuple[int, ...]
    fresh_t0_roles: tuple[str, ...]

    @property
    def overlap(self) -> int:
        return len(self.overlap_t1_slots)

    @property
    def actual_roles(self) -> tuple[str, ...]:
        return (
            *self.frontier_roles,
            *self.t1_roles,
            *self.fresh_t0_roles,
        )

    @property
    def t0_roles(self) -> tuple[str, ...]:
        return (
            *self.frontier_roles,
            *(self.t1_roles[index] for index in self.overlap_t1_slots),
            *self.fresh_t0_roles,
        )

    @property
    def ambient_named_lower_bound(self) -> int:
        # q,w and T1 are six distinct points.  Every fresh completion is a
        # further point.  No upper bound or exactness is asserted.
        return 6 + len(self.fresh_t0_roles)


@dataclass(frozen=True)
class UnequalRadiusCell:
    frontier_roles: str
    t0_completion_roles: tuple[str, str]
    t1_roles: tuple[str, str, str, str]

    @property
    def actual_roles(self) -> tuple[str, ...]:
        # The two rows are disjoint in the unequal-radius arm.
        return (
            *self.frontier_roles,
            *self.t0_completion_roles,
            *self.t1_roles,
        )


def named_six_assignments() -> list[tuple[str, tuple[str, str, str, str]]]:
    """The exact 31 labelled q,w,T1 role assignments from the source audit."""

    result = []
    for frontier in FRONTIER_ROLE_WORDS:
        for t1 in product(ROLES, repeat=4):
            roles = (*frontier, *t1)
            if cap_hits_are_legal(roles, minimum_interior=4):
                result.append((frontier, t1))
    assert len(result) == 31
    return result


def equal_radius_cells() -> list[EqualRadiusCell]:
    """All labelled T0/T1 overlap 0/1/2 completions in the equal arm."""

    result = []
    for frontier, t1 in named_six_assignments():
        for overlap in range(3):
            for overlap_slots in combinations(range(4), overlap):
                fresh_count = 2 - overlap
                for fresh_roles in product(ROLES, repeat=fresh_count):
                    cell = EqualRadiusCell(
                        frontier_roles=frontier,
                        t1_roles=t1,
                        overlap_t1_slots=overlap_slots,
                        fresh_t0_roles=fresh_roles,
                    )
                    # T0 is a four-point selected row and the whole displayed
                    # union belongs to one ambient radius class.
                    if len(cell.t0_roles) != 4:
                        continue
                    if cell.t0_roles.count("I") < 2:
                        continue
                    if not cap_hits_are_legal(cell.actual_roles, minimum_interior=4):
                        continue
                    result.append(cell)
    return result


def unequal_radius_cells() -> list[UnequalRadiusCell]:
    """All labelled completion-role profiles in the unequal-radius arm."""

    result = []
    for frontier in FRONTIER_ROLE_WORDS:
        for t0_completion in product(ROLES, repeat=2):
            if not cap_hits_are_legal((*frontier, *t0_completion)):
                continue
            for t1 in product(ROLES, repeat=4):
                if not cap_hits_are_legal(t1):
                    continue
                result.append(UnequalRadiusCell(frontier, t0_completion, t1))
    return result


def canonical_equal_key(cell: EqualRadiusCell) -> tuple[object, ...]:
    """Candidate quotient only: swap the unnamed fresh T0 completions."""

    return (
        cell.frontier_roles,
        cell.t1_roles,
        cell.overlap_t1_slots,
        tuple(sorted(cell.fresh_t0_roles)),
    )


def canonical_unequal_key(cell: UnequalRadiusCell) -> tuple[object, ...]:
    """Candidate quotient only: permute unnamed slots inside T0 and T1."""

    return (
        cell.frontier_roles,
        tuple(sorted(cell.t0_completion_roles)),
        tuple(sorted(cell.t1_roles)),
    )


@dataclass(frozen=True)
class PhysicalFiveCell:
    noncycle_roles: tuple[str, str]

    @property
    def actual_roles(self) -> dict[str, str]:
        return {
            "c0": "O",
            "c1": "O",
            "c2": "O",
            "n0": self.noncycle_roles[0],
            "n1": self.noncycle_roles[1],
        }

    @property
    def strict_count(self) -> int:
        return Counter(self.actual_roles.values())["O"]


def physical_five_cells() -> list[PhysicalFiveCell]:
    """The labelled 3/4/5-strict exact-five profiles."""

    result = []
    for noncycle in product(ROLES, repeat=2):
        cell = PhysicalFiveCell(noncycle)
        counts = Counter(cell.actual_roles.values())
        if counts["O"] < 3:
            continue
        if counts["I"] > 1 or counts["S"] > 1:
            continue
        result.append(cell)
    assert len(result) == 7
    return result


@dataclass(frozen=True)
class BlockerMatching:
    # Entry i is None (fresh physical-cap blocker) or the exact-five point
    # identified with blocker b_i.
    images: tuple[str | None, str | None, str | None]


def blocker_matchings(physical: PhysicalFiveCell) -> list[BlockerMatching]:
    """All legal blocker/nonincident-source and noncycle identities.

    The audited source proves b_i differs from its two incident cycle
    sources, but does not exclude b_i = c_(i+2).  A blocker can also equal a
    strict-physical noncycle exact-five point.  Blocker injectivity makes the
    chosen images injective.
    """

    physical_roles = physical.actual_roles
    strict_noncycle = tuple(
        name for name in ("n0", "n1") if physical_roles[name] == "O"
    )
    choices = tuple(
        (None, f"c{(index + 2) % 3}", *strict_noncycle)
        for index in range(3)
    )
    result = []
    for images in product(*choices):
        used = [image for image in images if image is not None]
        if len(used) != len(set(used)):
            continue
        result.append(BlockerMatching(images))
    return result


def physical_blocker_actual_roles(
    physical: PhysicalFiveCell,
    matching: BlockerMatching,
) -> tuple[str, ...]:
    """Roles of the distinct actual points after blocker identifications."""

    roles = dict(physical.actual_roles)
    for index, image in enumerate(matching.images):
        if image is None:
            roles[f"b{index}"] = "O"
    return tuple(roles.values())


def partial_injection_count(left: int, right: int) -> int:
    """Number of partial injective matchings between two distinct families."""

    return sum(
        comb(left, size) * comb(right, size) * factorial(size)
        for size in range(min(left, right) + 1)
    )


def cross_surface_identity_count(
    first_roles: tuple[str, ...],
    physical_blocker_roles: tuple[str, ...],
) -> int:
    """Role-preserving equality partitions across the two independent fronts.

    Each side is already a set of distinct actual points.  Consequently every
    legal cross-identification is precisely a partial injective matching in
    each cap role.
    """

    left = Counter(first_roles)
    right = Counter(physical_blocker_roles)
    answer = 1
    for role in ROLES:
        answer *= partial_injection_count(left[role], right[role])
    return answer


def set_partitions(items: tuple[str, ...]) -> Iterator[tuple[frozenset[str], ...]]:
    blocks: list[list[str]] = []

    def visit(index: int) -> Iterator[tuple[frozenset[str], ...]]:
        if index == len(items):
            yield tuple(frozenset(block) for block in blocks)
            return
        item = items[index]
        for block in blocks:
            block.append(item)
            yield from visit(index + 1)
            block.pop()
        blocks.append([item])
        yield from visit(index + 1)
        blocks.pop()

    yield from visit(0)


def reverse_target_partitions() -> list[tuple[frozenset[str], ...]]:
    """The full 53-partition quotient of the three unordered outside pairs."""

    result = []
    for partition in set_partitions(TARGET_SLOTS):
        block = {
            role: index for index, members in enumerate(partition)
            for role in members
        }
        pairs = tuple(
            frozenset((block[first], block[second]))
            for first, second in TARGET_PAIRS
        )
        if not all(len(pair) == 2 for pair in pairs):
            continue
        if len(set(pairs)) != 3:
            continue
        result.append(partition)
    counts = Counter(len(partition) for partition in result)
    assert counts == {3: 8, 4: 32, 5: 12, 6: 1}
    return result


def summarize() -> dict[str, object]:
    equal = equal_radius_cells()
    unequal = unequal_radius_cells()
    physical = physical_five_cells()
    targets = reverse_target_partitions()

    equal_by_overlap = Counter(cell.overlap for cell in equal)
    equal_canonical = {canonical_equal_key(cell) for cell in equal}
    equal_canonical_by_overlap = Counter(key[2].__len__() for key in equal_canonical)
    unequal_canonical = {canonical_unequal_key(cell) for cell in unequal}

    blocker_counts_by_strict = Counter()
    blocker_total = 0
    for cell in physical:
        count = len(blocker_matchings(cell))
        blocker_counts_by_strict[cell.strict_count] += count
        blocker_total += count

    # Exact size of the role-preserving equality skeleton before reverse
    # outside targets and boundary orders are attached.  This intentionally
    # uses all labelled row cells: no slot-permutation theorem is assumed.
    equal_identity_skeletons = 0
    unequal_identity_skeletons = 0
    for pcell in physical:
        for matching in blocker_matchings(pcell):
            right_roles = physical_blocker_actual_roles(pcell, matching)
            equal_identity_skeletons += sum(
                cross_surface_identity_count(cell.actual_roles, right_roles)
                for cell in equal
            )
            unequal_identity_skeletons += sum(
                cross_surface_identity_count(cell.actual_roles, right_roles)
                for cell in unequal
            )

    return {
        "schema": "period-three-full-role-identity-quotient-v1",
        "epistemic_status": (
            "EXACT_COMBINATORIAL_LAYER_COUNTS_NOT_SOURCE_COVERAGE_"
            "NOT_METRIC_NOT_EUCLIDEAN_NOT_LEAN"
        ),
        "first_apex": {
            "same_radius_named_six_labelled_assignments": len(named_six_assignments()),
            "equal_radius_labelled_completion_cells": len(equal),
            "equal_radius_labelled_by_t0_t1_overlap": dict(sorted(equal_by_overlap.items())),
            "equal_radius_candidate_unnamed_slot_quotient": len(equal_canonical),
            "equal_radius_candidate_quotient_by_overlap": dict(
                sorted(equal_canonical_by_overlap.items())
            ),
            "equal_radius_ambient_class_semantics": (
                "lower-bound-only; 8-overlap named points; arbitrary additional points"
            ),
            "unequal_radius_labelled_completion_cells": len(unequal),
            "unequal_radius_candidate_unnamed_slot_quotient": len(unequal_canonical),
        },
        "physical_exact_five": {
            "labelled_role_profiles": len(physical),
            "by_strict_physical_count": dict(
                sorted(Counter(cell.strict_count for cell in physical).items())
            ),
            "candidate_noncycle_swap_quotient": len({
                tuple(sorted(cell.noncycle_roles)) for cell in physical
            }),
        },
        "blocker_exact_five_identities": {
            "labelled_matchings_summed_over_physical_profiles": blocker_total,
            "by_physical_strict_count": dict(sorted(blocker_counts_by_strict.items())),
            "semantics": (
                "b_i may equal only nonincident c_(i+2), a strict noncycle point, "
                "or a fresh strict physical point; images are injective"
            ),
        },
        "cross_front_identity_skeleton": {
            "equal_radius_labelled_skeletons": equal_identity_skeletons,
            "unequal_radius_labelled_skeletons": unequal_identity_skeletons,
            "both_boundary_orientations_before_order_enumeration": 2 * (
                equal_identity_skeletons + unequal_identity_skeletons
            ),
            "quotient_used": "none; exact role-preserving partial injections",
        },
        "reverse_outside_targets": {
            "valid_pair_identity_partitions": len(targets),
            "by_actual_target_count": dict(
                sorted(Counter(len(partition) for partition in targets).items())
            ),
            "fresh_targets": "allowed by leaving every target block unmatched",
            "cross_surface_matching": (
                "staged after a source-exact outside-cap location classifier"
            ),
        },
        "boundary_order": {
            "orientations": 2,
            "unnamed_carrier_points": (
                "arbitrary gaps between named vertices; never fixed to a carrier size"
            ),
            "materialization_status": (
                "staged after identity quotient and common-order producer"
            ),
        },
    }


def smoke_tests() -> None:
    assert len(named_six_assignments()) == 31
    assert len(physical_five_cells()) == 7
    assert len(reverse_target_partitions()) == 53
    assert partial_injection_count(2, 2) == 7

    equal = equal_radius_cells()
    assert set(cell.overlap for cell in equal) == {0, 1, 2}
    assert min(cell.ambient_named_lower_bound for cell in equal) == 6
    assert max(cell.ambient_named_lower_bound for cell in equal) == 8
    assert all(cap_hits_are_legal(cell.actual_roles, 4) for cell in equal)

    unequal = unequal_radius_cells()
    assert unequal
    assert all(
        cap_hits_are_legal((*cell.frontier_roles, *cell.t0_completion_roles))
        and cap_hits_are_legal(cell.t1_roles)
        for cell in unequal
    )


def main() -> None:
    smoke_tests()
    print(json.dumps(summarize(), indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

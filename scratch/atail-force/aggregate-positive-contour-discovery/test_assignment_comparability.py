#!/usr/bin/env python3
"""Exact small regressions for the assignment-comparability proof route.

This is theorem-discovery support only.  It uses integer cut counts and no
metric or floating-point solver.
"""

from __future__ import annotations

import itertools
from collections import defaultdict
from collections.abc import Mapping, Sequence


Assignment = Mapping[int, int]
Profile = tuple[int, ...]


def circular_intervals(n: int) -> tuple[frozenset[int], ...]:
    """The nontrivial intervals modulo complement used by the local basis."""

    return tuple(
        frozenset(range(left + 1, right + 1))
        for left in range(n)
        for right in range(left + 2, n)
        if not (left == 0 and right == n - 1)
    )


def outward_profile(n: int, assignment: Assignment) -> Profile:
    return tuple(
        sum(center in interval and target not in interval
            for center, target in assignment.items())
        for interval in circular_intervals(n)
    )


def difference(left: Profile, right: Profile) -> Profile:
    return tuple(a - b for a, b in zip(left, right, strict=True))


def target_multiplicities(n: int, assignment: Assignment) -> tuple[int, ...]:
    return tuple(sum(target == point for target in assignment.values())
                 for point in range(n))


def is_nonzero_one_signed(profile: Profile) -> bool:
    return profile != (0,) * len(profile) and (
        all(value <= 0 for value in profile)
        or all(value >= 0 for value in profile)
    )


def has_comparable_pair(n: int, rows: Mapping[int, Sequence[int]]) -> bool:
    """Search every assignment in the displayed finite product exactly."""

    centers = tuple(sorted(rows))
    groups: dict[tuple[int, ...], list[Profile]] = defaultdict(list)
    for targets in itertools.product(*(rows[center] for center in centers)):
        assignment = dict(zip(centers, targets, strict=True))
        multiplicities = target_multiplicities(n, assignment)
        profile = outward_profile(n, assignment)
        for previous in groups[multiplicities]:
            if is_nonzero_one_signed(difference(profile, previous)):
                return True
        groups[multiplicities].append(profile)
    return False


def strongly_connected(rows: Mapping[int, Sequence[int]]) -> bool:
    vertices = set(rows)

    def reachable(reverse: bool) -> set[int]:
        seen = {min(vertices)}
        pending = list(seen)
        while pending:
            vertex = pending.pop()
            following = (
                [center for center, targets in rows.items() if vertex in targets]
                if reverse
                else rows[vertex]
            )
            for target in following:
                if target not in seen:
                    seen.add(target)
                    pending.append(target)
        return seen

    return reachable(False) == vertices and reachable(True) == vertices


def pair_alternating(rows: Mapping[int, Sequence[int]]) -> bool:
    for left, right in itertools.combinations(sorted(rows), 2):
        common = set(rows[left]) & set(rows[right])
        for first, second in itertools.combinations(common, 2):
            if (left < first < right) == (left < second < right):
                return False
    return True


def split_distance(
    n: int,
    left: int,
    right: int,
    exceptional_weights: Mapping[frozenset[int], int] | None = None,
) -> int:
    exceptional_weights = exceptional_weights or {}
    return sum(
        exceptional_weights.get(interval, 1)
        for interval in circular_intervals(n)
        if (left in interval) != (right in interval)
    )


def main() -> None:
    # The two individually mixed swaps in minimized schema 4.
    first_left = {0: 6, 7: 8}
    first_right = {0: 8, 7: 6}
    second_left = {6: 1, 8: 7}
    second_right = {6: 7, 8: 1}
    first_flux = difference(
        outward_profile(9, first_left), outward_profile(9, first_right)
    )
    second_flux = difference(
        outward_profile(9, second_left), outward_profile(9, second_right)
    )
    assert min(first_flux) == min(second_flux) == -1
    assert max(first_flux) == max(second_flux) == 1

    # Reversing the second swap and coupling the two gives the contour.
    schema4_left = first_left | second_right
    schema4_right = first_right | second_left
    assert target_multiplicities(9, schema4_left) == target_multiplicities(
        9, schema4_right
    )
    schema4_flux = difference(
        outward_profile(9, schema4_left), outward_profile(9, schema4_right)
    )
    assert min(schema4_flux) == 0
    assert max(schema4_flux) == 1

    # W(3,3) seed 1 is already one comparable four-row assignment pair.
    w33_left = {3: 34, 4: 25, 7: 12, 8: 37}
    w33_right = {3: 37, 4: 34, 7: 25, 8: 12}
    assert target_multiplicities(40, w33_left) == target_multiplicities(
        40, w33_right
    )
    w33_flux = difference(
        outward_profile(40, w33_left), outward_profile(40, w33_right)
    )
    assert min(w33_flux) == 0
    assert max(w33_flux) == 1
    assert sum(value != 0 for value in w33_flux) == 64

    # Uniform positive split weights make the alternating Fin-8 four-cycle an
    # additive tight graph; its flux orientation is nevertheless mixed.
    assert all(
        split_distance(8, center, target) == 10
        for center in (0, 4)
        for target in (2, 6)
    )
    alternating_flux = difference(
        outward_profile(8, {0: 2, 4: 6}),
        outward_profile(8, {0: 6, 4: 2}),
    )
    assert min(alternating_flux) == -1
    assert max(alternating_flux) == 1

    # Positive circular-split weights do not make each row radially monotone.
    heavy_split = {frozenset((1, 2)): 10}
    assert tuple(
        split_distance(7, 0, target, heavy_split) for target in range(1, 7)
    ) == (13, 17, 10, 10, 8, 4)

    # Exact obstruction to a deletion induction through degree-three rows.
    degree3_rows = {
        0: (1, 2, 4),
        1: (3, 4, 6),
        2: (0, 1, 4),
        3: (1, 5, 6),
        4: (0, 2, 5),
        5: (2, 3, 6),
        6: (1, 3, 5),
    }
    assert strongly_connected(degree3_rows)
    assert pair_alternating(degree3_rows)
    assert not has_comparable_pair(7, degree3_rows)
    degree3_weights = {
        frozenset((1, 2)): 4,
        frozenset((1, 2, 3)): 2,
        frozenset((2, 3, 4, 5)): 4,
        frozenset((4, 5)): 3,
    }
    degree3_alpha = (16, 20, 15, 22, 15, 17, 20)
    degree3_beta = (0, -8, -1, -6, -1, -11, -8)
    assert all(
        split_distance(7, center, target, degree3_weights)
        == degree3_alpha[center] + degree3_beta[target]
        for center, targets in degree3_rows.items()
        for target in targets
    )

    # A maximum-size n=7 tight graph refutes the tempting planarity claim.
    nonplanar_tight_rows = {
        0: (1, 6),
        1: (0, 3, 5, 6),
        2: (4, 6),
        3: (1, 4, 5),
        4: (2, 3, 5),
        5: (1, 3, 4, 6),
        6: (0, 1, 2, 5),
    }
    assert sum(map(len, nonplanar_tight_rows.values())) == 22 == 4 * 7 - 6
    nonplanar_weights = {
        frozenset((1, 2, 3, 4, 5)): 4,
        frozenset((2, 3, 4)): 2,
        frozenset((3, 4, 5)): 3,
    }
    nonplanar_potential = (0, 7, 10, 4, 0, 5, 4)
    assert all(
        split_distance(7, center, target, nonplanar_weights)
        == nonplanar_potential[center] + nonplanar_potential[target]
        for center, targets in nonplanar_tight_rows.items()
        for target in targets
    )

    # Internally vertex-disjoint paths exhibiting a K_3,3 subdivision.
    tight_edges = {
        (f"L{center}", f"R{target}")
        for center, targets in nonplanar_tight_rows.items()
        for target in targets
    }
    branch_left = ("L5", "L1", "L4")
    branch_right = ("L6", "R3", "R5")
    subdivision_paths = (
        ("L5", "R1", "L6"),
        ("L5", "R3"),
        ("L5", "R4", "L3", "R5"),
        ("L1", "R0", "L6"),
        ("L1", "R3"),
        ("L1", "R5"),
        ("L4", "R2", "L6"),
        ("L4", "R3"),
        ("L4", "R5"),
    )
    assert {(path[0], path[-1]) for path in subdivision_paths} == {
        (left, right) for left in branch_left for right in branch_right
    }
    internal_vertices = [vertex for path in subdivision_paths for vertex in path[1:-1]]
    assert len(internal_vertices) == len(set(internal_vertices))
    assert not (set(internal_vertices) & set(branch_left + branch_right))
    assert all(
        (left, right) in tight_edges or (right, left) in tight_edges
        for path in subdivision_paths
        for left, right in zip(path, path[1:])
    )

    # Even one upper-triangular half need not be a forest: this is a tight C6.
    upper_cycle_rows = {0: (4, 5), 1: (3, 5), 2: (3, 4)}
    upper_cycle_weights = {frozenset((1, 2, 3)): 4}
    upper_cycle_alpha = (0, 6, 3, 0, 0, 0)
    upper_cycle_beta = (0, 0, 0, 0, 6, 3)
    assert all(center < target for center, targets in upper_cycle_rows.items()
               for target in targets)
    assert all(
        split_distance(6, center, target, upper_cycle_weights)
        == upper_cycle_alpha[center] + upper_cycle_beta[target]
        for center, targets in upper_cycle_rows.items()
        for target in targets
    )

    # Exact n=8 saturation refutes the stronger 4*n-6 edge conjecture.
    tight28_rows = {
        0: (2, 4, 6),
        1: (2, 5, 7),
        2: (0, 3, 4, 7),
        3: (1, 2, 4, 5),
        4: (0, 2, 3, 6),
        5: (1, 4, 6, 7),
        6: (0, 4),
        7: (0, 1, 5, 6),
    }
    tight28_weight_values = (
        3, 1, 1, 1, 3,
        5, 2, 1, 1, 1,
        2, 1, 1, 2,
        1, 1, 1,
        3, 1,
        5,
    )
    tight28_weights = dict(zip(
        circular_intervals(8), tight28_weight_values, strict=True
    ))
    tight28_alpha = (0, -9, -1, -10, -1, -10, -1, -10)
    tight28_beta = (20, 29, 19, 10, 19, 28, 19, 28)
    assert sum(map(len, tight28_rows.values())) == 28 == 4 * 8 - 4
    assert all(
        split_distance(8, center, target, tight28_weights)
        == tight28_alpha[center] + tight28_beta[target]
        for center, targets in tight28_rows.items()
        for target in targets
    )

    # A 39-edge n=10 graph refutes every universal bound through 4*n-4.
    tight39_rows = {
        0: (2, 5, 7, 8),
        1: (0, 3, 5, 9),
        2: (0, 4, 6, 8),
        3: (1, 2, 4, 5),
        4: (2, 6, 7, 9),
        5: (1, 3, 4, 6),
        6: (2, 4, 8),
        7: (1, 5, 6, 8, 9),
        8: (0, 2, 3, 6),
        9: (0, 1, 8),
    }
    tight39_weight_values = (
        1, 5, 1, 1, 5, 5, 14, 10,
        1, 1, 1, 1, 1, 10, 14,
        9, 1, 1, 1, 5, 2, 5,
        1, 1, 1, 6, 1, 1,
        1, 10, 1, 1,
        6, 1,
        6,
    )
    tight39_weights = dict(zip(
        circular_intervals(10), tight39_weight_values, strict=True
    ))
    tight39_alpha = (0, -18, 7, -25, 0, -25, 0, -25, 0, -25)
    tight39_beta = (50, 82, 57, 75, 50, 75, 50, 63, 50, 75)
    tight39_degrees = tuple(map(len, tight39_rows.values()))
    assert tight39_degrees == (4, 4, 4, 4, 4, 4, 3, 5, 4, 3)
    assert sum(tight39_degrees) == 39 == 4 * 10 - 1
    assert pair_alternating(tight39_rows)
    assert all(
        split_distance(10, center, target, tight39_weights)
        == tight39_alpha[center] + tight39_beta[target]
        for center, targets in tight39_rows.items()
        for target in targets
    )

    # The equality support of minimized core 79 has 48 assignments and no
    # comparable equal-multiplicity pair.  Its saved exact positive contour
    # has row-positive mass two at center 4.  Thus an assignment-pair theorem
    # is strictly stronger than the circulation theorem, even inside the bank.
    core79_rows = {
        2: (1, 4, 8),
        4: (3, 5, 8, 11),
        5: (4, 11),
        7: (3, 5),
    }
    assert 3 * 4 * 2 * 2 == 48
    assert not has_comparable_pair(12, core79_rows)

    print("schema-4 simple swaps: MIXED")
    print("schema-4 coupled assignment pair: ONE_SIGNED")
    print("W33 seed-1 assignment pair: ONE_SIGNED (64 strict intervals)")
    print("Fin-8 alternating tight pair: MIXED WITH POSITIVE SPLIT SEPARATOR")
    print("Fin-7 radial split monotonicity: REFUTED")
    print("Fin-7 full degree-3 deletion induction: EXACT COUNTEREXAMPLE")
    print("Fin-7 additive-tight graph planarity: REFUTED BY K_3,3 SUBDIVISION")
    print("Fin-6 upper-half tight forest: REFUTED BY C6")
    print("Fin-8 additive-tight 4*n-6 bound: REFUTED BY 28-EDGE MODEL")
    print("Fin-10 additive-tight 4*n-4 bound: REFUTED BY 39-EDGE MODEL")
    print("core-79 displayed equality support: NO_COMPARABLE_PAIR (48/48)")


if __name__ == "__main__":
    main()

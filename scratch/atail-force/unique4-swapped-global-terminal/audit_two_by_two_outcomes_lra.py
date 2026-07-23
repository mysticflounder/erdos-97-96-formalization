#!/usr/bin/env python3
"""Exact QF_LRA audit of the four swapped exact-four continuation outcomes.

The eleven roles have cyclic cap order

    O1=0, surplus-strict=1,2,3, O2=4,
    oppCap1-strict=5,6, P=7, oppCap2-strict=8,9,10.

Unlike the older coupled-surface script, this checker enforces endpoint
one-hit cap monotonicity on both exact apex classes.  In particular, an
O1-class contains at most one point of the surplus chain and at most one
point of the second-opposite-cap chain; symmetrically for O2.

For each of the four outputs of `biApex_two_by_two_survival_normal_form`, the
checker searches for source-compatible rows at centers 8 and 9:

* a common deletion of 5, strengthened to unique exact displayed rows;
* a common deletion of 6, strengthened likewise;
* the crossed critical orientation (8 contains 6 and omits 5, while 9
  contains 5 and omits 6); or
* its reversal.

All triangle inequalities and both strict Kalmanson inequalities for every
cyclic quadruple are imposed.  Every displayed continuation row is modeled
as a unique exact four-class.  Its first row is required to leave

    B = {O1,O2} union firstClass union secondClass.

Thus the witness also realizes, at that center, the stronger universal-row
escape conclusion obtained by applying global minimality to `B`.

A SAT result is exact only in this rational linear-distance abstraction.  It
is not a Euclidean coordinate realization, a `CounterexampleData`, a global
critical-shell system, a minimal carrier, or a no-M44 model.
"""

from __future__ import annotations

from itertools import combinations

from z3 import And, Or, Real, Solver, sat


N = 11
FIRST_STRICT_PAIR = (5, 6)
SURPLUS = {0, 1, 2, 3, 4}
OPP_CAP1 = {4, 5, 6, 7}
OPP_CAP2 = {0, 7, 8, 9, 10}


def main() -> None:
    outcomes = {
        "common_delete_5": ("common", 5),
        "common_delete_6": ("common", 6),
        "cross_5_at_9_6_at_8": ("cross", 6, 5),
        "cross_6_at_9_5_at_8": ("cross", 5, 6),
    }
    witnesses: dict[str, tuple[tuple[int, ...], tuple[int, ...]]] = {}
    for name, specification in outcomes.items():
        witness = solve_outcome(specification)
        if witness is None:
            print(name, "UNSAT in the corrected full-linear abstraction")
            continue
        witnesses[name] = witness
        print(name, "SAT", witness)
    if len(witnesses) != len(outcomes):
        raise AssertionError(
            f"expected {len(outcomes)} SAT outcomes, found {len(witnesses)}"
        )
    print("PASS_EXACT_QF_LRA_ALL_FOUR_TWO_BY_TWO_OUTCOMES_WITH_ESCAPE")


def solve_outcome(
    specification: tuple[str, int] | tuple[str, int, int],
    *,
    require_unused_second_strict_k4: bool = False,
    require_B_k4: bool = False,
) -> tuple[tuple[int, ...], ...] | None:
    first_candidates = [
        tuple(sorted({5, 6, surplus_point, second_cap_point}))
        for surplus_point in SURPLUS - {0}
        for second_cap_point in OPP_CAP2 - {0}
    ]
    second_candidates = [
        support
        for support in combinations([point for point in range(N) if point != 4], 4)
        if 2 <= len(set(support) & {8, 9, 10})
        and len(set(support) & (SURPLUS - {4})) <= 1
        and len(set(support) & (OPP_CAP1 - {4})) <= 1
    ]

    for first_support in first_candidates:
        for second_support in second_candidates:
            if len(set(first_support) & set(second_support)) > 2:
                continue
            original_pair_pool = (
                set(first_support) - set(second_support) - SURPLUS
            )
            swapped_pair_pool = (
                set(second_support) - set(first_support) - SURPLUS
            )
            if len(original_pair_pool) < 2 or len(swapped_pair_pool) < 2:
                continue
            strict_second = sorted(set(second_support) & {8, 9, 10})
            for z1, z2 in combinations(strict_second, 2):
                solver, d = base_solver()
                add_unique_exact_four(solver, d, 0, first_support)
                add_unique_exact_four(solver, d, 4, second_support)
                if require_unused_second_strict_k4:
                    for center in {8, 9, 10} - {z1, z2}:
                        add_selected_k4_at_center(solver, d, center)
                if require_B_k4:
                    for center in {0, 4} | set(first_support) | set(second_support):
                        add_selected_k4_at_center(solver, d, center)
                if solver.check() != sat:
                    continue
                result = extend_outcome(
                    solver,
                    d,
                    specification,
                    first_support,
                    second_support,
                    z1,
                    z2,
                    original_pair_pool,
                )
                if result is not None:
                    return (
                        first_support,
                        second_support,
                        (z1, z2),
                        *result,
                    )
    return None


def extend_outcome(
    solver: Solver,
    d,
    specification: tuple[str, int] | tuple[str, int, int],
    first_support: tuple[int, ...],
    second_support: tuple[int, ...],
    z1: int,
    z2: int,
    original_pair_pool: set[int],
) -> tuple[tuple[int, ...], ...] | None:
    if specification[0] == "common":
        deleted = specification[1]
        candidates1 = selected_supports(z1, forbidden={deleted}, cap=OPP_CAP2)
        candidates2 = selected_supports(z2, forbidden={deleted}, cap=OPP_CAP2)
        # Stronger than the common-deletion packet: make both displayed rows
        # unique exact classes.  Each accepted witness must also make the
        # first row leave B below, so this one center realizes the universal
        # minimality escape conclusion for B.
        exact = True
    else:
        row1_source, row2_source = specification[1], specification[2]
        candidates1 = selected_supports(
            z1,
            required={row1_source},
            forbidden=set(FIRST_STRICT_PAIR) - {row1_source},
            cap=OPP_CAP2,
        )
        candidates2 = selected_supports(
            z2,
            required={row2_source},
            forbidden=set(FIRST_STRICT_PAIR) - {row2_source},
            cap=OPP_CAP2,
        )
        exact = True

    for support1 in candidates1:
        protected = {0, 4} | set(first_support) | set(second_support)
        if set(support1) <= protected:
            continue
        solver.push()
        (add_unique_exact_four if exact else add_selected_four)(
            solver, d, z1, support1
        )
        if solver.check() != sat:
            solver.pop()
            continue
        for support2 in candidates2:
            if len(set(support1) & set(support2)) > 2:
                continue
            solver.push()
            (add_unique_exact_four if exact else add_selected_four)(
                solver, d, z2, support2
            )
            if solver.check() == sat:
                ingress = find_ingress(
                    solver,
                    d,
                    first_support,
                    second_support,
                    original_pair_pool,
                )
                if ingress is not None:
                    return support1, support2, *ingress
            solver.pop()
        solver.pop()
    return None


def find_ingress(
    solver: Solver,
    d,
    first_support: tuple[int, ...],
    second_support: tuple[int, ...],
    original_pair_pool: set[int],
) -> tuple[tuple[int, ...], ...] | None:
    for deleted in original_pair_pool:
        for center in range(N):
            if center in {0, 4, deleted}:
                continue
            for support in selected_supports(
                center,
                forbidden={deleted},
                all_cap_bounds=True,
            ):
                if len(set(support) & set(second_support)) > 2:
                    continue
                if set(support) <= set(first_support):
                    continue
                solver.push()
                add_selected_four(solver, d, center, support)
                if solver.check() == sat:
                    return (deleted,), (center,), support
                solver.pop()
    return None


def base_solver():
    solver = Solver()
    distance = {
        (i, j): Real(f"d_{i}_{j}")
        for i in range(N)
        for j in range(i + 1, N)
    }

    def d(i: int, j: int):
        if i == j:
            return 0
        return distance[tuple(sorted((i, j)))]

    for value in distance.values():
        solver.add(value >= 1)
    for i, j, k in combinations(range(N), 3):
        solver.add(d(i, j) <= d(i, k) + d(k, j))
        solver.add(d(i, k) <= d(i, j) + d(j, k))
        solver.add(d(j, k) <= d(j, i) + d(i, k))
    for a, b, c, e in combinations(range(N), 4):
        solver.add(d(a, b) + d(c, e) + 1 <= d(a, c) + d(b, e))
        solver.add(d(b, c) + d(a, e) + 1 <= d(a, c) + d(b, e))
    return solver, d


def selected_supports(
    center: int,
    *,
    required: set[int] | None = None,
    forbidden: set[int] | None = None,
    cap: set[int] | None = None,
    all_cap_bounds: bool = False,
) -> list[tuple[int, ...]]:
    required = required or set()
    forbidden = forbidden or set()
    carrier = [
        point
        for point in range(N)
        if point != center and point not in forbidden
    ]
    return [
        support
        for support in combinations(carrier, 4)
        if required <= set(support)
        and (cap is None or len(set(support) & cap) <= 2)
        and (
            not all_cap_bounds
            or all(
                len(set(support) & containing_cap) <= 2
                for containing_cap in caps_containing(center)
            )
        )
    ]


def caps_containing(center: int) -> list[set[int]]:
    return [
        cap
        for cap in (SURPLUS, OPP_CAP1, OPP_CAP2)
        if center in cap
    ]


def add_global_selected_k4(solver: Solver, d) -> None:
    """Require one source-valid selected four-row at every carrier center."""
    for center in range(N):
        add_selected_k4_at_center(solver, d, center)


def add_selected_k4_at_center(solver: Solver, d, center: int) -> None:
    candidates = [
        support
        for support in combinations(
            [point for point in range(N) if point != center],
            4,
        )
        if all(
            len(set(support) & cap) <= 2
            for cap in caps_containing(center)
        )
    ]
    solver.add(
        Or(
            *[
                And(
                    *[
                        d(center, point) == d(center, support[0])
                        for point in support[1:]
                    ]
                )
                for support in candidates
            ]
        )
    )


def add_selected_four(solver: Solver, d, center: int, support: tuple[int, ...]) -> None:
    radius = d(center, support[0])
    for point in support[1:]:
        solver.add(d(center, point) == radius)


def add_unique_exact_four(
    solver: Solver,
    d,
    center: int,
    support: tuple[int, ...],
) -> None:
    add_selected_four(solver, d, center, support)
    radius = d(center, support[0])
    outside = [
        point
        for point in range(N)
        if point != center and point not in support
    ]
    for point in outside:
        solver.add(d(center, point) != radius)
    for four in combinations(outside, 4):
        solver.add(
            Or(
                *[
                    d(center, point) != d(center, four[0])
                    for point in four[1:]
                ]
            )
        )


if __name__ == "__main__":
    main()

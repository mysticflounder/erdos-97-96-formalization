#!/usr/bin/env python3
"""Exact QF_LRA regression for the coupled swapped exact-four surface.

This is deliberately a local/full-linear audit, not a CounterexampleData
model.  It imposes:

* one eleven-point cyclic boundary;
* every strict Kalmanson inequality and every triangle inequality;
* exact unique four-point classes at the two physical apex roles;
* the 2+1+1 cap distribution for both apex classes;
* the endpoint one-hit bound on both caps incident to each physical apex;
* cross-disjoint retained pairs;
* a third unique exact-four ingress row whose overlap with the second class
  is at most two and which survives deletion of an original-class point.

A SAT result shows that a source-shaped finite incidence fixture is not
contradicted by full linear cap-order geometry alone.  It says nothing about
nonlinear Euclidean realizability, a globally coherent critical system,
global K4 at every center, minimality, or the global no-M44 hypothesis.
"""

from __future__ import annotations

from itertools import combinations

from z3 import Or, Real, Solver, sat, unknown


N = 11
CAP_CHAINS = (
    (0, 1, 2, 3, 4),
    (4, 5, 6, 7),
    (7, 8, 9, 10, 0),
)


def respects_cap_one_hit(center: int, support: tuple[int, ...]) -> bool:
    """At most one equal-radius hit on each side in every incident cap."""
    support_set = set(support)
    for chain in CAP_CHAINS:
        if center not in chain:
            continue
        index = chain.index(center)
        if len(support_set & set(chain[:index])) > 1:
            return False
        if len(support_set & set(chain[index + 1:])) > 1:
            return False
    return True


def main() -> None:
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

    # Nonzero distances and all triangle inequalities.
    for value in distance.values():
        solver.add(value >= 1)
    for i, j, k in combinations(range(N), 3):
        solver.add(d(i, j) <= d(i, k) + d(k, j))
        solver.add(d(i, k) <= d(i, j) + d(j, k))
        solver.add(d(j, k) <= d(j, i) + d(i, k))

    # Both strict Kalmanson inequalities for every cyclic quadruple, with
    # homogeneous strict slack normalized to one.
    for a, b, c, e in combinations(range(N), 4):
        solver.add(d(a, b) + d(c, e) + 1 <= d(a, c) + d(b, e))
        solver.add(d(b, c) + d(a, e) + 1 <= d(a, c) + d(b, e))
    base_result = solver.check()
    print("base full-linear boundary:", base_result)
    if base_result == unknown:
        raise RuntimeError(f"base solver result unknown: {solver.reason_unknown()}")
    if base_result != sat:
        raise AssertionError(f"invalid audit base: {base_result}")

    # Boundary roles:
    #   O1=0, surplus strict=1,2,3, O2=4,
    #   strict oppCap1=5,6, P=7, strict oppCap2=8,9,10.
    #
    # Enumerate rather than guess the two complete exact-four supports.  The
    # first must contain 5,6; the second must contain at least two of 8,9,10;
    # and intersection at most two is exactly what permits two disjoint
    # retained pairs, one in each class and outside the other.
    first_strict = {5, 6}
    second_strict = {8, 9, 10}
    first_candidates = [
        support
        for support in (
            tuple(sorted(first_strict | set(extra)))
            for extra in combinations(
                [point for point in range(1, N) if point not in first_strict], 2
            )
        )
        if respects_cap_one_hit(0, support)
    ]
    second_candidates = [
        support
        for support in combinations([point for point in range(N) if point != 4], 4)
        if len(set(support) & second_strict) >= 2
        and respects_cap_one_hit(4, support)
    ]

    def add_unique_exact_four(center: int, support: tuple[int, ...]) -> None:
        radius = d(center, support[0])
        for point in support[1:]:
            solver.add(d(center, point) == radius)
        outside = [
            point for point in range(N)
            if point != center and point not in support
        ]
        for point in outside:
            solver.add(d(center, point) != radius)
        # No second radius class has four points.  This is the literal finite
        # form of uniqueness; it does not impose pairwise-distinct outside
        # distances.
        for four in combinations(outside, 4):
            solver.add(Or(*[
                d(center, point) != d(center, four[0])
                for point in four[1:]
            ]))

    tested = 0
    for first_support in first_candidates:
        solver.push()
        add_unique_exact_four(0, first_support)
        first_result = solver.check()
        if first_result == unknown:
            raise RuntimeError(
                f"first-class solver result unknown: {solver.reason_unknown()}"
            )
        if first_result != sat:
            solver.pop()
            continue
        for second_support in second_candidates:
            if len(set(first_support) & set(second_support)) > 2:
                continue
            tested += 1
            solver.push()
            add_unique_exact_four(4, second_support)
            second_result = solver.check()
            if second_result == unknown:
                raise RuntimeError(
                    "second-class solver result unknown: "
                    f"{solver.reason_unknown()}"
                )
            if second_result == sat:
                # Extend the two-class surface by the ingress first row:
                # delete one original retained-pair point q outside the second
                # class, use a third center distinct from both apices, and
                # choose its complete exact-four row in A.erase q with
                # overlap at most two with the second row.  Requiring some row
                # member outside the first class leaves a possible source for
                # the good-outside-source provenance.
                for deleted in set(first_support) - set(second_support):
                    for third_center in range(N):
                        if third_center in {0, 4, deleted}:
                            continue
                        row_carrier = [
                            point for point in range(N)
                            if point not in {third_center, deleted}
                        ]
                        for third_support in combinations(row_carrier, 4):
                            if len(set(third_support) & set(second_support)) > 2:
                                continue
                            if set(third_support) <= set(first_support):
                                continue
                            if not respects_cap_one_hit(
                                third_center, third_support
                            ):
                                continue
                            solver.push()
                            add_unique_exact_four(third_center, third_support)
                            third_result = solver.check()
                            if third_result == unknown:
                                raise RuntimeError(
                                    "third-class solver result unknown: "
                                    f"{solver.reason_unknown()}"
                                )
                            if third_result == sat:
                                model = solver.model()
                                print(
                                    "SAT: exact within the displayed "
                                    "full-linear coupled surface"
                                )
                                print("support-pairs tested", tested)
                                print("first_support", first_support)
                                print("second_support", second_support)
                                print("deleted", deleted)
                                print(
                                    "third_center/support",
                                    third_center,
                                    third_support,
                                )
                                print(
                                    "first_radius",
                                    model.eval(d(0, first_support[0])),
                                )
                                print(
                                    "second_radius",
                                    model.eval(d(4, second_support[0])),
                                )
                                print(
                                    "third_radius",
                                    model.eval(d(third_center, third_support[0])),
                                )
                                return
                            solver.pop()
            solver.pop()
        solver.pop()

    raise AssertionError(
        f"UNSAT: no coupled support pair after {tested} candidates"
    )


if __name__ == "__main__":
    main()

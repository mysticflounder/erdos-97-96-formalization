#!/usr/bin/env python3
"""Test one exact-seven finite fixture against the linear distance shadow.

The constraints include complete source radius partitions, strict triangle
inequalities, and both strict Kalmanson inequalities for every cyclic
quadruple.  The fixture's support choices are not an exhaustive parent
classifier, so UNSAT here is a regression result rather than coverage.
"""

from __future__ import annotations

from fractions import Fraction
from itertools import combinations

import z3

import verify_global_marginal_countermodel as fixture


BOUNDARY = [0, 5, 6, 7, 1, 3, 8, 9, 10, 2, 11, 14, 12, 4, 13]


def pair(a: int, b: int) -> tuple[int, int]:
    return (a, b) if a < b else (b, a)


def rational(value: z3.RatNumRef) -> Fraction:
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def main() -> None:
    fixture.check()
    assert set(BOUNDARY) == fixture.A

    distances = {
        (a, b): z3.Real(f"d_{a}_{b}")
        for a, b in combinations(sorted(fixture.A), 2)
    }

    def dist(a: int, b: int) -> z3.ArithRef:
        if a == b:
            return z3.RealVal(0)
        return distances[pair(a, b)]

    solver = z3.Solver()
    solver.set(timeout=60_000)

    # Homogeneous strict systems can use a common unit slack after scaling.
    for value in distances.values():
        solver.add(value >= 1)

    for a, b, c in combinations(sorted(fixture.A), 3):
        solver.add(dist(a, b) + dist(b, c) - dist(a, c) >= 1)
        solver.add(dist(a, b) + dist(a, c) - dist(b, c) >= 1)
        solver.add(dist(a, c) + dist(b, c) - dist(a, b) >= 1)

    # Source-forced exact radius classes.  At blocker centers the critical
    # support is the complete positive K4 class.  The two robust apices retain
    # their named classes.  Centers 11 and 13 are not blocker values and are
    # left existential rather than assigned arbitrary rows.
    exact_classes: dict[int, list[frozenset[int]]] = {
        fixture.SECOND_APEX: [fixture.SECOND_APEX_EXACT_FIVE],
    }
    for center, support in fixture.CRITICAL_SUPPORT.items():
        exact_classes[center] = [support]

    for center, classes in exact_classes.items():
        for radius_class in classes:
            members = sorted(radius_class)
            radius = dist(center, members[0])
            for point in members[1:]:
                solver.add(dist(center, point) == radius)
            for point in fixture.A - {center} - set(radius_class):
                solver.add(dist(center, point) != radius)

    # The retained and double-deletion first-apex rows are selected four
    # subrows, not necessarily complete radius classes.  This fixture chooses
    # the production distinct-radius arm, so their displayed radii differ.
    first_rows = list(fixture.FIRST_APEX_RADIUS_FIBERS)
    for row in first_rows:
        members = sorted(row)
        for point in members[1:]:
            solver.add(
                dist(fixture.FIRST_APEX, point) ==
                dist(fixture.FIRST_APEX, members[0])
            )
    solver.add(
        dist(fixture.FIRST_APEX, min(first_rows[0])) !=
        dist(fixture.FIRST_APEX, min(first_rows[1]))
    )

    # Global K4 remains necessary at the only two centers not covered above.
    unlocked_centers = fixture.A - set(exact_classes) - {fixture.FIRST_APEX}
    assert unlocked_centers == {11, 13}
    for center in unlocked_centers:
        witnesses = []
        for support in combinations(sorted(fixture.A - {center}), 4):
            radius = dist(center, support[0])
            witnesses.append(z3.And(*[
                dist(center, point) == radius for point in support[1:]
            ]))
        solver.add(z3.Or(*witnesses))

    # Strict Kalmanson inequalities in the shared convex boundary order.
    for i, j, k, ell in combinations(range(len(BOUNDARY)), 4):
        a, b, c, d = BOUNDARY[i], BOUNDARY[j], BOUNDARY[k], BOUNDARY[ell]
        diagonal_sum = dist(a, c) + dist(b, d)
        solver.add(diagonal_sum - dist(a, b) - dist(c, d) >= 1)
        solver.add(diagonal_sum - dist(a, d) - dist(b, c) >= 1)

    result = solver.check()
    if result == z3.unsat:
        print("PASS: fixed exact-seven fixture is exact-QF_LRA UNSAT")
        print("status=EXACT_QF_LRA_UNSAT_FIXED_FIXTURE_NOT_COVERAGE")
        print(f"boundary={BOUNDARY}")
        print(f"distance_variables={len(distances)}")
        print(f"assertions={len(solver.assertions())}")
        print("next=enumerate_source_faithful_role_choices_before_certificate")
        return
    if result != z3.sat:
        print(f"status=UNKNOWN_{result}")
        raise SystemExit(1)

    model = solver.model()
    witness = {
        edge: rational(model.eval(value, model_completion=True))
        for edge, value in distances.items()
    }

    def value(a: int, b: int) -> Fraction:
        return Fraction(0) if a == b else witness[pair(a, b)]

    assert min(witness.values()) >= 1

    triangle_slacks: list[Fraction] = []
    for a, b, c in combinations(sorted(fixture.A), 3):
        triangle_slacks.extend([
            value(a, b) + value(b, c) - value(a, c),
            value(a, b) + value(a, c) - value(b, c),
            value(a, c) + value(b, c) - value(a, b),
        ])
    assert min(triangle_slacks) >= 1

    realized_partitions: dict[int, tuple[frozenset[int], ...]] = {}
    for center in fixture.A:
        by_radius: dict[Fraction, set[int]] = {}
        for point in fixture.A - {center}:
            by_radius.setdefault(value(center, point), set()).add(point)
        realized_partitions[center] = tuple(
            frozenset(points) for points in by_radius.values()
        )
        assert any(len(radius_class) >= 4
                   for radius_class in realized_partitions[center])

    for center, classes in exact_classes.items():
        realized = set(realized_partitions[center])
        assert all(radius_class in realized for radius_class in classes)

    kalmanson_slacks: list[Fraction] = []
    for i, j, k, ell in combinations(range(len(BOUNDARY)), 4):
        a, b, c, d = BOUNDARY[i], BOUNDARY[j], BOUNDARY[k], BOUNDARY[ell]
        diagonal_sum = value(a, c) + value(b, d)
        kalmanson_slacks.extend([
            diagonal_sum - value(a, b) - value(c, d),
            diagonal_sum - value(a, d) - value(b, c),
        ])
    assert min(kalmanson_slacks) >= 1

    occurrence_pair = fixture.reverse_outside_pair(2)
    a, b = tuple(occurrence_pair)
    assert value(fixture.FIRST_APEX, a) != value(fixture.FIRST_APEX, b)

    points = sorted(fixture.A)
    proper_k4_subsets = 0
    for mask in range(1, (1 << len(points)) - 1):
        subset = {points[i] for i in range(len(points)) if mask & (1 << i)}
        if all(
            any(len(radius_class & subset) >= 4
                for radius_class in realized_partitions[center])
            for center in subset
        ):
            proper_k4_subsets += 1

    print("PASS: exact rational exact-seven linear-distance shadow")
    print("status=EXACT_QF_LRA_SAT_FRACTION_REPLAYED_NOT_PLANAR_NOT_MEC")
    print(f"boundary={BOUNDARY}")
    print(f"distance_variables={len(witness)}")
    print(f"triangle_constraints={len(triangle_slacks)}")
    print(f"kalmanson_constraints={len(kalmanson_slacks)}")
    print(f"min_triangle_slack={min(triangle_slacks)}")
    print(f"min_kalmanson_slack={min(kalmanson_slacks)}")
    print(f"unlocked_centers={sorted(unlocked_centers)}")
    print(f"proper_abstract_k4_subsets={proper_k4_subsets}")
    print(f"occurrence_outside_pair={sorted(occurrence_pair)}")
    print("occurrence_pair_first_apex_distances="
          f"{value(fixture.FIRST_APEX, a)},{value(fixture.FIRST_APEX, b)}")


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""SAT-first probe of one fully disjoint source-facing identity cell.

The probe asks only whether the named row equalities, strict metric, and full
strict Kalmanson inequalities are compatible for one legal common boundary
word.  It is a projected abstract-distance test: SAT is not a Euclidean,
MEC, CSS, or minimal-counterexample realization.  Conversely, SAT is enough
to show that the proposed direct ``False`` cannot follow from these linear
constraints alone.
"""

from __future__ import annotations

from fractions import Fraction
from itertools import combinations

import z3


# Three distinguished vertices.
FIRST = "first"
SECOND = "second"
SURPLUS = "surplus"

# First-apex rows, deliberately disjoint from every physical/reverse role.
T0 = ("q", "w", "t0i", "t0s")       # 3 I + 1 S
T1 = ("t1i0", "t1i1", "t1i2", "t1o")  # 3 I + 1 O

# Physical exact-five profile: 3 strict physical + one hit in each adjacent
# cap.  The three reverse blockers are fresh and differ from every source.
CYCLE = ("c0", "c1", "c2")
PHYSICAL_FIVE = (*CYCLE, "nS", "nI")
BLOCKERS = ("b0", "b1", "b2")

# Six fresh reverse targets: the three unordered outside pairs are disjoint,
# hence realize the six-block member of the exact 53-partition quotient.
TARGET_PAIRS = (("x0", "y0"), ("x1", "y1"), ("x2", "y2"))

# One source-compatible order.  Every private point is named only to expose
# the finite projection; extra carrier vertices may occupy arbitrary gaps.
SURPLUS_PRIVATE = ("t0s", "nS")
FIRST_PRIVATE = (
    "q", "w", "t0i", "t1i0", "t1i1", "t1i2", "nI",
    "x0", "y0", "x1", "y1", "x2", "y2",
)
PHYSICAL_PRIVATE = (
    # Lemma 223/230 forces each reverse blocker between its two physical
    # source targets, because the physical apex is the other owner of that
    # pair.  In particular b2 must use the c0--c2 interval inside this block,
    # not the complementary boundary interval through SECOND.
    "c0", "b0", "b2", "c1", "b1", "c2", "t1o",
)
BOUNDARY = (
    FIRST,
    *SURPLUS_PRIVATE,
    SECOND,
    *FIRST_PRIVATE,
    SURPLUS,
    *PHYSICAL_PRIVATE,
)
POINTS = BOUNDARY


def edge(a: str, b: str) -> tuple[str, str]:
    assert a != b
    return tuple(sorted((a, b)))


def rational(value: z3.RatNumRef) -> Fraction:
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def solve() -> dict[str, object]:
    assert len(POINTS) == len(set(POINTS)) == 25
    assert set(T0).isdisjoint(T1)
    assert set((*T0, *T1)).isdisjoint((*PHYSICAL_FIVE, *BLOCKERS))
    assert set().union(*map(set, TARGET_PAIRS)).isdisjoint(
        (*T0, *T1, *PHYSICAL_FIVE, *BLOCKERS)
    )

    solver = z3.SolverFor("QF_LRA")
    distance = {
        edge(a, b): z3.Real("d__" + "__".join(edge(a, b)))
        for a, b in combinations(POINTS, 2)
    }
    dv = lambda a, b: distance[edge(a, b)]
    different = lambda u, v: z3.Or(u >= v + 1, v >= u + 1)

    # Homogeneous unit slack for positive distances and every strict
    # inequality.  Any finite strict solution can be scaled to this form.
    solver.add(*(value >= 1 for value in distance.values()))
    for a, b, c in combinations(POINTS, 3):
        solver.add(dv(a, b) + dv(b, c) >= dv(a, c) + 1)
        solver.add(dv(a, b) + dv(a, c) >= dv(b, c) + 1)
        solver.add(dv(a, c) + dv(b, c) >= dv(a, b) + 1)
    for ia, ib, ic, id_ in combinations(range(len(BOUNDARY)), 4):
        a, b, c, d = (BOUNDARY[index] for index in (ia, ib, ic, id_))
        diagonal = dv(a, c) + dv(b, d)
        solver.add(diagonal >= dv(a, b) + dv(c, d) + 1)
        solver.add(diagonal >= dv(a, d) + dv(b, c) + 1)

    r0, r1, rp = z3.Reals("r0 r1 rp")
    reverse_radii = z3.Reals("rr0 rr1 rr2")
    solver.add(r0 >= 1, r1 >= 1, rp >= 1)
    solver.add(*(radius >= 1 for radius in reverse_radii))
    group_names = ("T0", "T1", "physical", "reverse0", "reverse1", "reverse2")
    groups = {name: z3.Bool("use__" + name) for name in group_names}
    solver.add(*(
        z3.Implies(groups["T0"], dv(FIRST, point) == r0)
        for point in T0
    ))
    solver.add(*(
        z3.Implies(groups["T1"], dv(FIRST, point) == r1)
        for point in T1
    ))
    solver.add(z3.Implies(groups["T0"], different(r0, r1)))
    solver.add(*(
        z3.Implies(groups["physical"], dv(SECOND, point) == rp)
        for point in PHYSICAL_FIVE
    ))
    solver.add(*(
        z3.Implies(groups["physical"], different(dv(SECOND, point), rp))
        for point in POINTS
        if point not in {*PHYSICAL_FIVE, SECOND}
    ))
    solver.add(z3.Implies(
        groups["physical"],
        different(dv(SECOND, "q"), dv(SECOND, "w")),
    ))

    for row in range(3):
        support = (
            CYCLE[row],
            CYCLE[(row + 1) % 3],
            *TARGET_PAIRS[row],
        )
        solver.add(*(
            z3.Implies(
                groups[f"reverse{row}"],
                dv(BLOCKERS[row], point) == reverse_radii[row],
            )
            for point in support
        ))
        solver.add(*(
            z3.Implies(
                groups[f"reverse{row}"],
                different(dv(BLOCKERS[row], point), reverse_radii[row]),
            )
            for point in POINTS
            if point not in {*support, BLOCKERS[row]}
        ))

    result = solver.check(*groups.values())
    if result != z3.sat:
        return {
            "status": str(result),
            "reason": solver.reason_unknown(),
            "row_group_core": [str(item) for item in solver.unsat_core()],
        }

    model = solver.model()
    def value(a: str, b: str) -> Fraction:
        return rational(model.eval(dv(a, b)))

    # Independent substitution checks in Python/Fraction for every encoded
    # strict-metric and Kalmanson inequality, not merely the row equalities.
    assert min(value(a, b) for a, b in combinations(POINTS, 2)) >= 1
    triangle_margins = []
    for a, b, c in combinations(POINTS, 3):
        triangle_margins.extend((
            value(a, b) + value(b, c) - value(a, c),
            value(a, b) + value(a, c) - value(b, c),
            value(a, c) + value(b, c) - value(a, b),
        ))
    assert min(triangle_margins) >= 1

    kalmanson_margins = []
    for ia, ib, ic, id_ in combinations(range(len(BOUNDARY)), 4):
        a, b, c, d = (BOUNDARY[index] for index in (ia, ib, ic, id_))
        diagonal = value(a, c) + value(b, d)
        kalmanson_margins.extend((
            diagonal - value(a, b) - value(c, d),
            diagonal - value(a, d) - value(b, c),
        ))
    assert min(kalmanson_margins) >= 1

    # Row-equality and two-apex frontier checks.
    assert len({value(FIRST, point) for point in T0}) == 1
    assert len({value(FIRST, point) for point in T1}) == 1
    assert value(FIRST, T0[0]) != value(FIRST, T1[0])
    assert len({value(SECOND, point) for point in PHYSICAL_FIVE}) == 1
    assert all(
        value(SECOND, point) != value(SECOND, PHYSICAL_FIVE[0])
        for point in POINTS
        if point not in {*PHYSICAL_FIVE, SECOND}
    )
    assert value(SECOND, "q") != value(SECOND, "w")
    for row in range(3):
        support = (
            CYCLE[row],
            CYCLE[(row + 1) % 3],
            *TARGET_PAIRS[row],
        )
        assert len({value(BLOCKERS[row], point) for point in support}) == 1
        assert all(
            value(BLOCKERS[row], point) != value(BLOCKERS[row], support[0])
            for point in POINTS
            if point not in {*support, BLOCKERS[row]}
        )

    ledger = {
        "r0": str(rational(model.eval(r0))),
        "r1": str(rational(model.eval(r1))),
        "physical_radius": str(rational(model.eval(rp))),
        "reverse_radii": [
            str(rational(model.eval(radius))) for radius in reverse_radii
        ],
        "second_q": str(rational(model.eval(dv(SECOND, "q")))),
        "second_w": str(rational(model.eval(dv(SECOND, "w")))),
        "minimum_triangle_margin": str(min(triangle_margins)),
        "minimum_kalmanson_margin": str(min(kalmanson_margins)),
    }

    return {
        "status": "sat",
        "epistemic_status": (
            "VERIFIED_RATIONAL_QF_LRA_LEDGER_NOT_EUCLIDEAN_NOT_MEC_"
            "NOT_CSS_NOT_LEAN"
        ),
        "point_count": len(POINTS),
        "boundary": list(BOUNDARY),
        "t0": list(T0),
        "t1": list(T1),
        "physical_five": list(PHYSICAL_FIVE),
        "blockers": list(BLOCKERS),
        "reverse_target_pairs": [list(pair) for pair in TARGET_PAIRS],
        "ledger": ledger,
    }


def smoke_tests() -> None:
    # Hand-checkable strict-Kalmanson four-point metric.
    a, b, c, d = "a", "b", "c", "d"
    ledger = {
        edge(a, b): Fraction(1),
        edge(b, c): Fraction(1),
        edge(c, d): Fraction(1),
        edge(a, d): Fraction(1),
        edge(a, c): Fraction(2),
        edge(b, d): Fraction(2),
    }
    diagonal = ledger[edge(a, c)] + ledger[edge(b, d)]
    assert diagonal > ledger[edge(a, b)] + ledger[edge(c, d)]
    assert diagonal > ledger[edge(a, d)] + ledger[edge(b, c)]


def main() -> None:
    smoke_tests()
    result = solve()
    print(result)
    if result["status"] == "sat":
        print("DECISION: EXACT_PROJECTED_SAT_STOP")
        print("NOT CLAIMED: Euclidean/MEC/CSS/minimality realization or source theorem")
    else:
        print("DECISION: ONE_FIXED_DISJOINT_WORD_UNSAT_NOT_COVERAGE")


if __name__ == "__main__":
    main()

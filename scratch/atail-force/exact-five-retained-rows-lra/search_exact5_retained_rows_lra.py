from __future__ import annotations

from fractions import Fraction
from itertools import combinations

import z3


N = 16
LABELS = [
    "O2", "f1", "c1a", "u", "c1b", "V", "s", "h", "t", "O1",
    "v", "f2", "b1a", "b1b", "b1c", "z",
]


def pair(i: int, j: int) -> tuple[int, int]:
    assert i != j
    return (i, j) if i < j else (j, i)


def qval(value: z3.RatNumRef) -> Fraction:
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def build(*, with_b1: bool = True, with_frontier: bool = True,
          with_terminal_negation: bool = True) -> tuple[
              z3.Solver, dict[tuple[int, int], z3.ArithRef]]:
    solver = z3.SolverFor("QF_LRA")
    solver.set("timeout", 60_000)
    d = {
        (i, j): z3.Real(f"d_{i}_{j}")
        for i in range(N)
        for j in range(i + 1, N)
    }

    def D(i: int, j: int) -> z3.ArithRef:
        return d[pair(i, j)]

    # Homogeneous strict inequalities are normalized to unit slack.
    for value in d.values():
        solver.add(value >= 1, value <= 10_000)

    # Strict triangle inequalities for every carrier triple.
    for i, j, k in combinations(range(N), 3):
        solver.add(D(i, j) + D(j, k) >= D(i, k) + 1)
        solver.add(D(i, j) + D(i, k) >= D(j, k) + 1)
        solver.add(D(i, k) + D(j, k) >= D(i, j) + 1)

    # Both strict convex-quadrilateral (Kalmanson) crossing inequalities.
    for i, j, k, l in combinations(range(N), 4):
        solver.add(D(i, k) + D(j, l) >= D(i, j) + D(k, l) + 1)
        solver.add(D(i, k) + D(j, l) >= D(i, l) + D(j, k) + 1)

    O2, f1, c1a, u, c1b, V, s, h, t, O1, v, f2, b1a, b1b, b1c, z = range(N)

    # The exact-five O2-class E = {V,s,h,t,O1}; the retained q-deleted
    # row B2 may be any four of E because q=f1 lies on the other cap.
    for x in (s, h, t, O1):
        solver.add(D(O2, V) == D(O2, x))
    # Keep all other named carrier points strictly off that radius.
    for x in (f1, c1a, u, c1b, v, f2, b1a, b1b, b1c, z):
        solver.add(z3.Abs(D(O2, x) - D(O2, V)) >= 1)

    # Asymmetric exact critical row at h: {s,t,u,v}.
    for x in (t, u, v):
        solver.add(D(h, s) == D(h, x))
    # A rational strengthening of the production strict-obtuse conclusion:
    # d(s,t) > sqrt(2) d(h,s), encoded linearly via 2 d(s,t) > 3 d(h,s).
    solver.add(2 * D(s, t) >= 3 * D(h, s) + 1)

    if with_b1:
        # Retained first-apex q-deleted row B1 = {s,c1a,c1b,f2}.
        # It has the source-valid 2+1+1 cap distribution about endpoint O1.
        for x in (c1a, c1b, f2):
            solver.add(D(O1, s) == D(O1, x))

    # Retained frontier pair q=f1,w=t, plus an independent four-row at O1
    # surviving deletion of both. The displayed B1 already avoids V and t.
    if with_frontier:
        for x in (t, u, z):
            solver.add(D(O1, f1) == D(O1, x))
        solver.add(z3.Abs(D(O1, f1) - D(O1, s)) >= 1)

    # Negate both desired terminal occurrences.  h is the known cap center
    # through u,v; every other vertex of the physical cap distinguishes them.
    if with_terminal_negation:
        solver.add(D(O1, v) + 1 <= D(O1, u))
        for center in (V, s, t):
            solver.add(z3.Abs(D(center, u) - D(center, v)) >= 1)

    return solver, d


def verify(values: dict[tuple[int, int], Fraction]) -> None:
    def D(i: int, j: int) -> Fraction:
        return values[pair(i, j)]

    def exact_class(center: int, support: set[int]) -> None:
        radii = {D(center, x) for x in support}
        assert len(radii) == 1
        radius = next(iter(radii))
        assert all(D(center, x) != radius
                   for x in range(N) if x != center and x not in support)

    assert all(Fraction(1) <= x <= Fraction(10_000) for x in values.values())
    for i, j, k in combinations(range(N), 3):
        assert D(i, j) + D(j, k) >= D(i, k) + 1
        assert D(i, j) + D(i, k) >= D(j, k) + 1
        assert D(i, k) + D(j, k) >= D(i, j) + 1
    for i, j, k, l in combinations(range(N), 4):
        diagonal_sum = D(i, k) + D(j, l)
        assert diagonal_sum >= D(i, j) + D(k, l) + 1
        assert diagonal_sum >= D(i, l) + D(j, k) + 1

    O2, f1, c1a, u, c1b, V, s, h, t, O1, v, f2, b1a, b1b, b1c, z = range(N)
    assert len({D(O2, x) for x in (V, s, h, t, O1)}) == 1
    assert all(abs(D(O2, x) - D(O2, V)) >= 1
               for x in (f1, c1a, u, c1b, v, f2, b1a, b1b, b1c, z))
    assert len({D(h, x) for x in (s, t, u, v)}) == 1
    assert 2 * D(s, t) >= 3 * D(h, s) + 1
    assert len({D(O1, x) for x in (s, c1a, c1b, f2)}) == 1
    assert len({D(O1, x) for x in (f1, t, u, z)}) == 1
    assert abs(D(O1, f1) - D(O1, s)) >= 1
    assert D(O1, v) + 1 <= D(O1, u)
    assert all(abs(D(center, u) - D(center, v)) >= 1 for center in (V, s, t, O1))
    exact_class(O2, {V, s, h, t, O1})
    exact_class(h, {s, t, u, v})
    exact_class(O1, {s, c1a, c1b, f2})
    exact_class(O1, {f1, t, u, z})


def smoke() -> None:
    # Exact square-distance smoke: its two diagonal sums strictly dominate
    # both opposite-side sums, and all triangles are strict.
    side = Fraction(2)
    diagonal = Fraction(3)
    assert diagonal + diagonal >= side + side + 1
    assert side + side >= diagonal + 1
    # Deliberately bad "diagonal" assignment must fail the same check.
    bad_diagonal = Fraction(2)
    assert not (bad_diagonal + bad_diagonal >= side + side + 1)


def main() -> None:
    smoke()
    for config in (
        {"with_b1": False, "with_frontier": False, "with_terminal_negation": False},
        {"with_b1": False, "with_frontier": False, "with_terminal_negation": True},
        {"with_b1": True, "with_frontier": False, "with_terminal_negation": False},
        {"with_b1": True, "with_frontier": False, "with_terminal_negation": True},
        {"with_b1": True, "with_frontier": True, "with_terminal_negation": False},
        {"with_b1": True, "with_frontier": True, "with_terminal_negation": True},
    ):
        probe, _ = build(**config)
        print(config, probe.check())
    solver, distances = build()
    O2, f1, c1a, u, c1b, V, s, h, t, O1, v, f2, b1a, b1b, b1c, z = range(N)

    # Search for a source-faithful one-physical-hit actual row for the hub,
    # as required by the global-cover-star asymmetric orientation.
    physical = {s, h, t}
    found_hub_row: tuple[int, tuple[int, int, int]] | None = None
    for center in range(N):
        if center in (O2, O1, h):
            continue
        available = [x for x in range(N)
                     if x not in physical and x != center]
        for triple in combinations(available, 3):
            solver.push()
            for x in triple:
                solver.add(distances[pair(center, h)] == distances[pair(center, x)])
            support = {h, *triple}
            for x in range(N):
                if x != center and x not in support:
                    solver.add(z3.Abs(distances[pair(center, h)] -
                                      distances[pair(center, x)]) >= 1)
            if solver.check() == z3.sat:
                found_hub_row = (center, triple)
                solver.pop()
                for x in triple:
                    solver.add(distances[pair(center, h)] == distances[pair(center, x)])
                for x in range(N):
                    if x != center and x not in support:
                        solver.add(z3.Abs(distances[pair(center, h)] -
                                          distances[pair(center, x)]) >= 1)
                break
            solver.pop()
        if found_hub_row is not None:
            break
    assert found_hub_row is not None
    print("hub critical row:", LABELS[found_hub_row[0]],
          [LABELS[x] for x in (h, *found_hub_row[1])])

    # Also realize the parent packet's required actual blocker for q=f1,
    # distinct from both apices, with a complete exact four-point class.
    found_q_row: tuple[int, tuple[int, int, int]] | None = None
    for center in range(N):
        if center in (O2, O1, f1):
            continue
        available = [x for x in range(N) if x not in (f1, center)]
        for triple in combinations(available, 3):
            solver.push()
            for x in triple:
                solver.add(distances[pair(center, f1)] == distances[pair(center, x)])
            support = {f1, *triple}
            for x in range(N):
                if x != center and x not in support:
                    solver.add(z3.Abs(distances[pair(center, f1)] -
                                      distances[pair(center, x)]) >= 1)
            if solver.check() == z3.sat:
                found_q_row = (center, triple)
                solver.pop()
                for x in triple:
                    solver.add(distances[pair(center, f1)] == distances[pair(center, x)])
                for x in range(N):
                    if x != center and x not in support:
                        solver.add(z3.Abs(distances[pair(center, f1)] -
                                          distances[pair(center, x)]) >= 1)
                break
            solver.pop()
        if found_q_row is not None:
            break
    assert found_q_row is not None
    print("q critical row:", LABELS[found_q_row[0]],
          [LABELS[x] for x in (f1, *found_q_row[1])])
    result = solver.check()
    print(result)
    if result != z3.sat:
        if result == z3.unknown:
            print(solver.reason_unknown())
        raise SystemExit(1)
    model = solver.model()
    values = {key: qval(model.eval(value, model_completion=True))
              for key, value in distances.items()}
    verify(values)
    center, triple = found_hub_row
    assert len({values[pair(center, x)] for x in (h, *triple)}) == 1
    assert [x for x in range(N) if x != center and
            values[pair(center, x)] == values[pair(center, h)]] == sorted([h, *triple])
    center, triple = found_q_row
    assert len({values[pair(center, x)] for x in (f1, *triple)}) == 1
    assert [x for x in range(N) if x != center and
            values[pair(center, x)] == values[pair(center, f1)]] == sorted([f1, *triple])
    print("order:", ", ".join(LABELS))
    for i, label in enumerate(LABELS):
        row = []
        for j in range(N):
            row.append("0" if i == j else str(values[pair(i, j)]))
        print(label + ": " + " ".join(row))
    print("PASS: exact rational model independently replayed")

if __name__ == "__main__":
    main()

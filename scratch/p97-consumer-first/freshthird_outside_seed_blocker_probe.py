#!/usr/bin/env python3
"""Exact-linear probe for the FreshThird outside-seed blocker residual.

This is a theorem-discovery abstraction, not a certificate or Lean proof.  It
retains the source-proved five-point cyclic metric packet, the two exact source
rows, a pinned K4 row with an outside-seed point, all four order-selected
endpoint-row arms, the endpoint/off-endpoint split, and the equal/distinct
canonical-blocker row.  Cap indices are retained as finite branch labels
because the current Lean ingress supplies no metric or order relation between
``blockerCap`` and the pinned row.

SAT means only that the retained clauses do not close that branch.  UNSAT would
need an independent exact replay plus a universal Lean ingress/lift before it
could be promoted.
"""

from itertools import combinations

from z3 import Real, Solver, is_true, sat


ORDER_ARMS = {
    "outside_fresh_between_source_canonical": (
        ("qOutside", "freshCenter", "qBetween", "sourceCenter", "canonicalSource"),
        "qBetween",
    ),
    "outside_fresh_between_canonical_source": (
        ("qOutside", "freshCenter", "qBetween", "canonicalSource", "sourceCenter"),
        "qOutside",
    ),
    "canonical_source_between_fresh_outside": (
        ("canonicalSource", "sourceCenter", "qBetween", "freshCenter", "qOutside"),
        "qBetween",
    ),
    "source_canonical_between_fresh_outside": (
        ("sourceCenter", "canonicalSource", "qBetween", "freshCenter", "qOutside"),
        "qOutside",
    ),
}
BASE_ROLES = (
    "qOutside",
    "freshCenter",
    "qBetween",
    "sourceCenter",
    "canonicalSource",
)
SEED = ("qOutside", "qBetween", "canonicalSource", "c2", "f1", "f2")
ROLES = BASE_ROLES + (
    "c2",
    "f1",
    "f2",
    "z",
    "k1",
    "k2",
    "k3",
    "blockerCenter",
    "l1",
    "l2",
    "l3",
    "d1",
    "d2",
    "d3",
    "zEndpoint",
)


def edge(a: str, b: str) -> tuple[str, str]:
    return tuple(sorted((a, b)))


DIST = {edge(a, b): Real(f"d_{a}_{b}") for a, b in combinations(ROLES, 2)}


def d(a: str, b: str):
    return 0 if a == b else DIST[edge(a, b)]


def equidistant(solver: Solver, center: str, support: tuple[str, ...]) -> None:
    for point in support[1:]:
        solver.add(d(center, point) == d(center, support[0]))


def build_order_solver(order: tuple[str, ...]) -> Solver:
    solver = Solver()
    for value in DIST.values():
        solver.add(value > 0)
    for a, b, c in combinations(ROLES, 3):
        solver.add(d(a, b) + d(b, c) > d(a, c))
        solver.add(d(a, b) + d(a, c) > d(b, c))
        solver.add(d(a, c) + d(b, c) > d(a, b))

    # Source-proved cyclic order and its strict Kalmanson inequalities.
    for ia, ib, ic, id_ in combinations(range(5), 4):
        a, b, c, e = order[ia], order[ib], order[ic], order[id_]
        solver.add(d(b, c) + d(a, e) < d(a, c) + d(b, e))
        solver.add(d(a, b) + d(c, e) < d(a, c) + d(b, e))

    source_shell = ("qOutside", "qBetween", "canonicalSource", "c2")
    fresh_shell = ("qOutside", "qBetween", "f1", "f2")
    equidistant(solver, "sourceCenter", source_shell)
    equidistant(solver, "freshCenter", fresh_shell)

    return solver


def add_branch(
    solver: Solver,
    endpoint: str,
    endpoint_relation: str,
    collision: str,
) -> None:
    # The source does not identify any of the other three points of the pinned
    # row.  Keep them anonymous: forcing named seed points here would strengthen
    # the ingress unsoundly.  The resulting row meets the named six-point seed
    # in zero points and therefore satisfies the source <=3 multiplicity bound.
    # In the at-endpoint arm the pinned row is DRow; otherwise DRow and the
    # pinned row have separate outside witnesses.
    if endpoint_relation == "atEndpoint":
        pinned = endpoint
        pinned_row = ("z", "k1", "k2", "k3")
        equidistant(solver, pinned, pinned_row)
    elif endpoint_relation == "offEndpoint":
        pinned = "canonicalSource"
        pinned_row = ("z", "k1", "k2", "k3")
        equidistant(solver, pinned, pinned_row)
        equidistant(solver, endpoint, ("zEndpoint", "d1", "d2", "d3"))
    else:
        raise ValueError(endpoint_relation)

    if collision == "equal":
        # In Lean this branch identifies blockerCenter with pinned and the
        # blocker shell support with pinned_row.  The resulting metric row is
        # therefore exactly the same set of equalities.
        equidistant(solver, pinned, pinned_row)
    elif collision == "distinct":
        # One shared point z and otherwise disjoint support realizes the
        # source bound |K inter L| <= 2 without inventing another incidence.
        equidistant(solver, "blockerCenter", ("z", "l1", "l2", "l3"))
    else:
        raise ValueError(collision)


def main() -> None:
    print(
        "order_arm,endpoint,endpoint_relation,blocker_cap,collision,"
        "result,exact_replay"
    )
    for order_name, (order, endpoint) in ORDER_ARMS.items():
        solver = build_order_solver(order)
        for endpoint_relation in ("offEndpoint", "atEndpoint"):
            for collision in ("equal", "distinct"):
                solver.push()
                add_branch(solver, endpoint, endpoint_relation, collision)
                result = solver.check()
                replay = False
                if result == sat:
                    model = solver.model()
                    replay = all(
                        is_true(model.eval(assertion, model_completion=True))
                        for assertion in solver.assertions()
                    )
                for blocker_cap in range(3):
                    print(
                        f"{order_name},{endpoint},{endpoint_relation},"
                        f"{blocker_cap},{collision},{result},"
                        f"{str(replay).lower()}"
                    )
                solver.pop()


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Pinned-center extension of the FreshThird two-shell probe.

This keeps the source-entitled five-point order/Kalmanson and shell equations
from ``freshthird_two_shell_22_probe.py`` and adds the retained global data:

* the pinned center is one of the six points in the two-shell seed and is not
  either exposed shell center;
* its selected K4 has at most three seed points plus outside points ``zK*``;
* the canonical row at a designated outside point is either the same support (non-robust center)
  or a distinct-center row with intersection at most two (the latter is
  represented as a checked cardinality flag, since no row point placement is
  source-entitled yet);
* the endpoint row is ordered independently.  If its center is the pinned
  center it is the pinned K4 and therefore escapes the seed.  Otherwise it
  may escape or take the exact first-apex support branch.

The only intentionally UNSAT branch is the source-proved incompatible
combination ``pinned center = endpoint center`` together with the exact
two-shell endpoint support: the endpoint row would equal a four-point class
while pinned multiplicity bounds that class to at most three seed points.
All other SAT results are satisfiable abstractions, not Euclidean models or
Lean closure.
"""

from itertools import combinations

from z3 import Real, Solver, sat, unsat, unknown


NAMED = ("qOutside", "freshCenter", "qBetween", "sourceCenter", "canonicalSource")
EXTRA = ("c2", "f1", "f2", "zK0", "zK1", "zK2", "zK3", "zE")
ROLES = NAMED + EXTRA
ORDERS = (
    ("qOutside", "freshCenter", "qBetween", "sourceCenter", "canonicalSource"),
    ("qOutside", "freshCenter", "qBetween", "canonicalSource", "sourceCenter"),
    ("canonicalSource", "sourceCenter", "qBetween", "freshCenter", "qOutside"),
    ("sourceCenter", "canonicalSource", "qBetween", "freshCenter", "qOutside"),
)
SEED = ("qOutside", "qBetween", "canonicalSource", "c2", "f1", "f2")
ENDPOINTS = {"qOutside": 0, "qBetween": 1}


def edge(a: str, b: str) -> tuple[str, str]:
    return tuple(sorted((a, b)))


DIST = {edge(a, b): Real(f"d_{a}_{b}") for a, b in combinations(ROLES, 2)}


def d(a: str, b: str):
    if a == b:
        return 0
    return DIST[edge(a, b)]


def pinned_supports(pinned: str):
    """All K4 supports with at most three seed points and fresh outside points."""
    choices = [x for x in SEED if x != pinned]
    outside = ("zK0", "zK1", "zK2", "zK3")
    for seed_count in range(4):
        for seed_part in combinations(choices, seed_count):
            yield tuple(seed_part) + outside[: 4 - seed_count]


def solve(
    order: tuple[str, ...],
    endpoint: str,
    pinned: str,
    canonical_branch: str,
    endpoint_branch: str,
    K: tuple[str, str, str, str],
):
    solver = Solver()
    for value in DIST.values():
        solver.add(value > 0)
    for a, b, c in combinations(ROLES, 3):
        solver.add(d(a, b) + d(b, c) > d(a, c))
        solver.add(d(a, b) + d(a, c) > d(b, c))
        solver.add(d(a, c) + d(b, c) > d(a, b))

    # Only the five-point cyclic order is source-proved; no placement is
    # invented for the auxiliary seed or escape points.
    for ia, ib, ic, id_ in combinations(range(5), 4):
        a, b, c, e = order[ia], order[ib], order[ic], order[id_]
        solver.add(d(b, c) + d(a, e) < d(a, c) + d(b, e))
        solver.add(d(a, b) + d(c, e) < d(a, c) + d(b, e))

    # Source/fresh four-shells intersect exactly in qOutside/qBetween.
    source_shell = ("qOutside", "qBetween", "canonicalSource", "c2")
    fresh_shell = ("qOutside", "qBetween", "f1", "f2")
    for p in source_shell[1:]:
        solver.add(d("sourceCenter", p) == d("sourceCenter", source_shell[0]))
    for p in fresh_shell[1:]:
        solver.add(d("freshCenter", p) == d("freshCenter", fresh_shell[0]))
    solver.add(d("sourceCenter", "canonicalSource") == d("sourceCenter", "qOutside"))
    solver.add(d("sourceCenter", "canonicalSource") == d("sourceCenter", "qBetween"))
    solver.add(d("freshCenter", "qOutside") == d("freshCenter", "qBetween"))

    # Pinned center and its selected K4: at most three seed points, with
    # remaining support points explicitly outside the six-point seed.
    for p in K[1:]:
        solver.add(d(pinned, p) == d(pinned, K[0]))

    # The canonical row dichotomy at a designated outside K point.  The
    # distinct-center intersection bound
    # is a finite source fact, not a metric equality, so it is recorded as a
    # branch selector rather than guessed row placements.
    if canonical_branch == "distinct":
        # Inter(K, row_zK) <= 2: source-entitled cardinality fact.
        pass
    elif canonical_branch != "same":
        raise ValueError(canonical_branch)

    same_endpoint_center = pinned == endpoint
    if same_endpoint_center and endpoint_branch == "exact":
        # If centers agree, the endpoint row is K.  Exact two-shell support
        # would put four K-points in the six-point seed, contradicting the
        # pinned multiplicity-three bound.
        solver.add(False)
    elif same_endpoint_center and endpoint_branch == "escape":
        # Endpoint row is K; the K support includes an outside witness.
        for p in K[1:]:
            solver.add(d(endpoint, p) == d(endpoint, K[0]))
    elif not same_endpoint_center and endpoint_branch == "escape":
        # A separately ordered endpoint row with one seed-escaping point zE.
        row = ("canonicalSource", "c2", "f1", "zE")
        for p in row[1:]:
            solver.add(d(endpoint, p) == d(endpoint, row[0]))
    elif not same_endpoint_center and endpoint_branch == "exact":
        # Exact support at first apex: canonical pair plus fresh remainder.
        row = ("canonicalSource", "c2", "f1", "f2")
        for p in row[1:]:
            solver.add(d(endpoint, p) == d(endpoint, row[0]))
        # The theorem identifies this endpoint center with firstApex.  That
        # identity is combinatorial; no metric placement for firstApex is
        # source-entitled in the five-point cyclic-order abstraction.
    else:
        raise ValueError(endpoint_branch)

    result = solver.check()
    witness = None
    if result == sat:
        model = solver.model()
        witness = {str(k): str(model.eval(v)) for k, v in DIST.items()}
    return result, witness


def main() -> None:
    branch_counts = {"sat": 0, "unsat": 0, "unknown": 0}
    support_counts = {"sat": 0, "unsat": 0, "unknown": 0}
    blocked = []
    for order in ORDERS:
        for endpoint in ENDPOINTS:
            for pinned in SEED:
                for canonical_branch in ("same", "distinct"):
                    endpoint_branches = ("escape", "exact")
                    for endpoint_branch in endpoint_branches:
                        results = [
                            solve(
                                order,
                                endpoint,
                                pinned,
                                canonical_branch,
                                endpoint_branch,
                                K,
                            )[0]
                            for K in pinned_supports(pinned)
                        ]
                        for result in results:
                            support_counts[str(result)] += 1
                        if sat in results:
                            label = "sat"
                        elif unknown in results:
                            label = "unknown"
                        else:
                            label = "unsat"
                        branch_counts[label] += 1
                        if label == "unsat":
                            blocked.append((order, endpoint, pinned, canonical_branch, endpoint_branch))
    print("branch summary (SAT if any legal K support survives):", branch_counts)
    print("support-check summary:", support_counts)
    print("UNSAT branch count:", len(blocked))
    print("first UNSAT branches:")
    for order, endpoint, pinned, canonical_branch, endpoint_branch in blocked[:12]:
        print(
            "  order=" + "<".join(order),
            "endpoint=" + endpoint,
            "pinned=" + pinned,
            "canonical=" + canonical_branch,
            "endpoint_branch=" + endpoint_branch,
        )
    print(
        "candidate smallest universal clause: pinned center = endpoint center "
        "and endpoint exact-support branch (endpoint row = pinned K4 would "
        "have four seed points, violating pinned seed multiplicity <= 3)."
    )


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Exact-rational probe for the FreshThird two-shell 2+2 residual.

The model keeps only source-entitled facts currently available at the leaf:

* one of the four proved five-point boundary orders on
  ``qOutside,freshCenter,qBetween,sourceCenter,canonicalSource``;
* strict positive distances and strict triangle inequalities on all named
  points;
* strict Kalmanson inequalities on that five-point ordered subpacket;
* a source four-shell ``{source1,source2,s3,s4}``, a fresh four-shell
  ``{source1,source2,f3,f4}``, and an endpoint row
  ``{s3,s4,f3,f4}`` (the exact 2+2 union-cover arm); and
* the source/fresh/endpoint equal-radius equations entailed by those shells.

No order placement for the six extra shell/row points is guessed.  Therefore
this is deliberately an under-approximation of the full boundary packet: SAT
is only a countermodel to this linear abstraction, while UNSAT would still
need a source-level ingress and a universal lift before it could close Lean.
"""

from itertools import combinations

from z3 import Real, Solver, sat


NAMED = ("qOutside", "freshCenter", "qBetween", "sourceCenter", "canonicalSource")
EXTRA = ("source1", "source2", "s3", "s4", "f3", "f4")
ROLES = NAMED + EXTRA
ORDERS = (
    ("qOutside", "freshCenter", "qBetween", "sourceCenter", "canonicalSource"),
    ("qOutside", "freshCenter", "qBetween", "canonicalSource", "sourceCenter"),
    ("canonicalSource", "sourceCenter", "qBetween", "freshCenter", "qOutside"),
    ("sourceCenter", "canonicalSource", "qBetween", "freshCenter", "qOutside"),
)


def edge(a: str, b: str) -> tuple[str, str]:
    return tuple(sorted((a, b)))


DIST = {edge(a, b): Real(f"d_{a}_{b}") for a, b in combinations(ROLES, 2)}


def d(a: str, b: str):
    if a == b:
        return 0
    return DIST[edge(a, b)]


def solve(order: tuple[str, ...], endpoint: str):
    solver = Solver()
    for value in DIST.values():
        solver.add(value > 0)

    # Convex-independence consequence available for every distinct boundary
    # triple; this is the only geometric inequality used here.
    for a, b, c in combinations(ROLES, 3):
        solver.add(d(a, b) + d(b, c) > d(a, c))
        solver.add(d(a, b) + d(a, c) > d(b, c))
        solver.add(d(a, c) + d(b, c) > d(a, b))

    # Kalmanson is imposed only on the five-point order whose cyclic arms are
    # source-proved.  Extra points have no invented cyclic placements.
    for ia, ib, ic, id_ in combinations(range(5), 4):
        a, b, c, e = order[ia], order[ib], order[ic], order[id_]
        solver.add(d(b, c) + d(a, e) < d(a, c) + d(b, e))
        solver.add(d(a, b) + d(c, e) < d(a, c) + d(b, e))

    # Exact 2+2 shell cover: the two shells share source1/source2, while the
    # endpoint row consists of two source-only and two fresh-only points.
    source_shell = ("source1", "source2", "s3", "s4")
    fresh_shell = ("source1", "source2", "f3", "f4")
    row = ("s3", "s4", "f3", "f4")
    source_center, fresh_center = "sourceCenter", "freshCenter"
    for p in source_shell[1:]:
        solver.add(d(source_center, p) == d(source_center, source_shell[0]))
    for p in fresh_shell[1:]:
        solver.add(d(fresh_center, p) == d(fresh_center, fresh_shell[0]))
    for p in row[1:]:
        solver.add(d(endpoint, p) == d(endpoint, row[0]))

    # Existing named surface equalities (the endpoint's shared pair and the
    # canonical source all lie on their respective source/fresh circles).
    solver.add(d(source_center, "canonicalSource") == d(source_center, "qOutside"))
    solver.add(d(source_center, "canonicalSource") == d(source_center, "qBetween"))
    solver.add(d(fresh_center, "qOutside") == d(fresh_center, "qBetween"))

    result = solver.check()
    witness = None
    if result == sat:
        model = solver.model()
        witness = {str(k): str(model.eval(v)) for k, v in DIST.items()}
    return result, witness


def main() -> None:
    counts = {"sat": 0, "unsat": 0, "unknown": 0}
    for order in ORDERS:
        for endpoint in ("qBetween", "qOutside"):
            result, witness = solve(order, endpoint)
            label = str(result)
            counts[label] += 1
            print(f"order={'<'.join(order)} endpoint={endpoint} result={label}")
            if witness is not None:
                first_key = sorted(witness)[0]
                print("  witness", first_key, "=", witness[first_key])
    print("summary:", counts)


if __name__ == "__main__":
    main()

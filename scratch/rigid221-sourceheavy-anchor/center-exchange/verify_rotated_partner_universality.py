"""Independent check of the rotated-partner coverage claim.

The orbit measurement reports that EVERY five-label assignment passing the
side conditions of both a core and its rotated partner is pair-admissible:
the four orientations

    (a, x, b, c, y), (a, y, b, c, x), (x, c, b, a, y), (x, y, b, a, c)

cover all forty-eight canonical boundary orders.  A universal answer is
exactly the shape a bug in the shared mask helper would produce, so this
script re-derives the claim twice with code that shares nothing with the
measurement helpers.

Check 1 (abstract, decisive).  ``CommonFiveOrientationAt`` unfolds to an
equality of two cyclic-triple orientations, and a cyclic triple depends only
on the cyclic order the position map induces on the five labels.  So the
claim reduces to a statement about the twenty-four cyclic orders of five
distinct points, enumerated here directly from list positions.

Check 2 (concrete, cross-oracle).  The same four orientations are evaluated
against the forty-eight live canonical boundary orders for a deterministic
sample of assignments, using an orientation test written from the list order
rather than from a cached position tuple.
"""

from __future__ import annotations

import itertools
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[3]
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

from census.card_head.exact12_v14_ordered_coverage import (  # noqa: E402
    source_boundary_orders,
)


def cyclic(order: tuple[int, ...], i: int, j: int, k: int) -> bool:
    """True when i, j, k appear in this cyclic order in the sequence."""

    pi, pj, pk = order.index(i), order.index(j), order.index(k)
    return (pi < pj < pk) or (pj < pk < pi) or (pk < pi < pj)


def oriented(order: tuple[int, ...], a: int, x: int, b: int, c: int, y: int) -> bool:
    """CommonFiveOrientationAt, spelled out as written in the Lean source."""

    return (cyclic(order, a, x, b) and cyclic(order, b, c, y)) or (
        cyclic(order, a, b, x) and cyclic(order, b, y, c)
    )


def four_orientations(
    order: tuple[int, ...], a: int, b: int, c: int, x: int, y: int
) -> tuple[bool, bool, bool, bool]:
    """The core, its center exchange, the rotated partner, and its exchange."""

    return (
        oriented(order, a, x, b, c, y),
        oriented(order, a, y, b, c, x),
        oriented(order, x, c, b, a, y),
        oriented(order, x, y, b, a, c),
    )


def side_conditions(a: int, b: int, c: int, x: int, y: int) -> bool:
    if a == b or x == y:
        return False
    if x in (a, b) or y in (a, b):
        return False
    if c in (b, x, y):
        return False
    # The rotated partner's own side conditions add a != c; every other
    # partner condition is implied by the ones above.
    return a != c


def check_abstract() -> int:
    """All cyclic orders of five distinct points; returns the failure count."""

    labels = ("A", "B", "C", "X", "Y")
    failures = 0
    checked = 0
    # Fix the first point: the remaining 4! sequences give every cyclic order.
    for tail in itertools.permutations(labels[1:]):
        order = (labels[0],) + tail
        # Every assignment of the five roles to the five distinct points.
        for a, b, c, x, y in itertools.permutations(labels):
            checked += 1
            if not any(four_orientations(order, a, b, c, x, y)):
                failures += 1
                print(f"ABSTRACT FAILURE order={order} roles={(a, b, c, x, y)}")
    print(f"abstract: {checked} (cyclic order, role assignment) cases, "
          f"{failures} uncovered")
    return failures


def check_concrete(step: int) -> int:
    orders = tuple(order for _orientation, order in source_boundary_orders())
    if len(orders) != 48:
        raise SystemExit(f"expected 48 canonical orders, got {len(orders)}")
    assignments = [
        (a, b, c, x, y)
        for a, b, c, x, y in itertools.product(range(12), repeat=5)
        if side_conditions(a, b, c, x, y)
    ]
    print(f"concrete: {len(assignments)} side-condition assignments; "
          f"sampling every {step}")
    failures = 0
    sampled = 0
    for index, (a, b, c, x, y) in enumerate(assignments):
        if index % step:
            continue
        sampled += 1
        for order in orders:
            if not any(four_orientations(tuple(order), a, b, c, x, y)):
                failures += 1
                print(
                    f"CONCRETE FAILURE roles={(a, b, c, x, y)} order={tuple(order)}"
                )
    print(f"concrete: {sampled} assignments x 48 orders, {failures} uncovered")
    return failures


def main() -> int:
    failures = check_abstract()
    # The v25 witness assignment is index-independent, so check it explicitly.
    orders = tuple(order for _orientation, order in source_boundary_orders())
    witness = (10, 8, 5, 7, 11)
    uncovered = [
        tuple(order)
        for order in orders
        if not any(four_orientations(tuple(order), *witness))
    ]
    print(f"v25 witness {witness}: {len(uncovered)} of 48 orders uncovered")
    failures += len(uncovered)
    failures += check_concrete(step=97)
    print("RESULT: " + ("universality holds on every case checked"
                        if failures == 0 else f"{failures} FAILURES"))
    return 0 if failures == 0 else 1


if __name__ == "__main__":
    raise SystemExit(main())

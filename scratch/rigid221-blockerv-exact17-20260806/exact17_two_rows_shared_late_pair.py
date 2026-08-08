"""Static exact-17 clauses from the checked shared-late-pair theorem.

Lean consumer:
``CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair``.
For every increasing quadruple ``a < b < c < d`` in the frozen boundary
order, the selected rows centered at ``a`` and ``b`` cannot both contain
``c`` and ``d``.  Cyclically shifted copies require a separate checked
boundary-recut adapter and are deliberately not emitted here.
"""

from __future__ import annotations

import random
from itertools import combinations

Atom = tuple[int, int]
Core = tuple[Atom, Atom, Atom, Atom]

LEAN_CONSUMER = (
    "Problem97.CapCrossingKalmansonBridge."
    "false_of_two_selected_rows_shared_late_pair"
)


def increasing_cores(order: tuple[int, ...]) -> tuple[Core, ...]:
    """Enumerate exactly the increasing instances of the Lean consumer."""

    return tuple(
        tuple(sorted(((a, c), (a, d), (b, c), (b, d))))
        for a, b, c, d in combinations(order, 4)
    )


def violated_cores(
    order: tuple[int, ...],
    supports: dict[int, frozenset[int]],
) -> tuple[Core, ...]:
    """Return checked cores present in one selected-row assignment."""

    position = {point: index for index, point in enumerate(order)}
    hits = []
    for a_pos, a in enumerate(order):
        for b_pos in range(a_pos + 1, len(order)):
            b = order[b_pos]
            common_late = sorted(
                (
                    point
                    for point in supports.get(a, frozenset())
                    & supports.get(b, frozenset())
                    if position[point] > b_pos
                ),
                key=position.__getitem__,
            )
            hits.extend(
                tuple(sorted(((a, c), (a, d), (b, c), (b, d))))
                for c, d in combinations(common_late, 2)
            )
    return tuple(hits)


def _violated_cores_bruteforce(
    order: tuple[int, ...],
    supports: dict[int, frozenset[int]],
) -> tuple[Core, ...]:
    return tuple(
        core
        for core in increasing_cores(order)
        if all(point in supports.get(center, frozenset()) for center, point in core)
    )


def smoke() -> dict[str, int | str]:
    order = tuple(range(17))
    cores = increasing_cores(order)
    expected = len(tuple(combinations(order, 4)))
    if len(cores) != expected:
        raise AssertionError(f"expected {expected} cores, got {len(cores)}")

    first = cores[0]
    supports = {vertex: frozenset() for vertex in order}
    for center, point in first:
        supports[center] = supports[center] | {point}
    if violated_cores(order, supports) != (first,):
        raise AssertionError("the complete four-incidence motif was not rejected")
    for omitted_center, omitted_point in first:
        weakened = {
            center: support - ({omitted_point} if center == omitted_center else set())
            for center, support in supports.items()
        }
        if violated_cores(order, weakened):
            raise AssertionError("a weakened three-incidence motif was rejected")

    rng = random.Random("exact17-shared-late-pair")
    test_order = tuple(range(8))
    for _ in range(200):
        test_supports = {
            center: frozenset(
                point
                for point in test_order
                if point != center and rng.randrange(4) == 0
            )
            for center in test_order
        }
        fast = violated_cores(test_order, test_supports)
        slow = _violated_cores_bruteforce(test_order, test_supports)
        if fast != slow:
            raise AssertionError("optimized matcher disagrees with the definition")
    return {"cores": len(cores), "lean_consumer": LEAN_CONSUMER}


if __name__ == "__main__":
    import json

    print(json.dumps(smoke(), sort_keys=True))

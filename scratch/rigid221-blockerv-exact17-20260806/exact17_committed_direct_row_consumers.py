"""Exact-17 instances of three checked selected-row consumers.

Only instances in the frozen increasing boundary order are emitted.  Cyclic
recuts require their own checked Lean adapters and are intentionally absent.
"""

from __future__ import annotations

import json
import math
import random
from collections.abc import Callable
from itertools import combinations

Atom = tuple[int, int]
Core = tuple[Atom, ...]
Witness = tuple[int, ...]
Instance = tuple[Witness, Core]
InstanceGenerator = Callable[[tuple[int, ...]], tuple[Instance, ...]]

LEAN_CONSUMERS = {
    "shared_middle_endpoint_pair": (
        "Problem97.CapCrossingKalmansonBridge."
        "false_of_two_selected_middle_rows_shared_endpoint_pair"
    ),
    "five_ccw_three_rows": (
        "Problem97.CapCrossingKalmansonBridge."
        "false_of_selected_rows_in_five_ccw_order"
    ),
    "six_ccw_two_k2_three_rows": (
        "Problem97.CapCrossingKalmansonBridge."
        "false_of_six_ccw_two_k2_three_selected_rows"
    ),
}


def _core(*atoms: Atom) -> Core:
    return tuple(sorted(atoms))


def shared_middle_endpoint_pair_instances(order: tuple[int, ...]) -> tuple[Instance, ...]:
    """Rows at ``b,c`` cannot share endpoints ``a,d`` for ``a<b<c<d``."""

    return tuple(
        ((a, b, c, d), _core((b, a), (b, d), (c, a), (c, d)))
        for a, b, c, d in combinations(order, 4)
    )


def five_ccw_three_row_instances(order: tuple[int, ...]) -> tuple[Instance, ...]:
    """Instantiate the ``O < A < Y < E < C`` three-row consumer."""

    return tuple(
        (
            (o, a, y, e, c),
            _core((y, o), (y, e), (o, e), (o, c), (a, c), (a, o)),
        )
        for o, a, y, e, c in combinations(order, 5)
    )


def six_ccw_two_k2_three_row_instances(
    order: tuple[int, ...],
) -> tuple[Instance, ...]:
    """Instantiate the six-point pairwise-support-triangle consumer."""

    return tuple(
        (
            (i0, i1, i2, i3, i4, i5),
            _core(
                (i0, i3),
                (i0, i5),
                (i1, i4),
                (i1, i5),
                (i2, i3),
                (i2, i4),
            ),
        )
        for i0, i1, i2, i3, i4, i5 in combinations(order, 6)
    )


INSTANCE_GENERATORS: dict[str, InstanceGenerator] = {
    "shared_middle_endpoint_pair": shared_middle_endpoint_pair_instances,
    "five_ccw_three_rows": five_ccw_three_row_instances,
    "six_ccw_two_k2_three_rows": six_ccw_two_k2_three_row_instances,
}


def _shared_middle_endpoint_pair_witnesses(
    order: tuple[int, ...],
    supports: dict[int, frozenset[int]],
) -> tuple[Witness, ...]:
    position = {point: index for index, point in enumerate(order)}
    hits = set()
    for b_pos, b in enumerate(order):
        for c_pos in range(b_pos + 1, len(order)):
            c = order[c_pos]
            common = supports.get(b, frozenset()) & supports.get(c, frozenset())
            left = (point for point in common if position[point] < b_pos)
            right = tuple(point for point in common if position[point] > c_pos)
            hits.update((a, b, c, d) for a in left for d in right)
    return tuple(sorted(hits))


def _five_ccw_three_row_witnesses(
    order: tuple[int, ...],
    supports: dict[int, frozenset[int]],
) -> tuple[Witness, ...]:
    position = {point: index for index, point in enumerate(order)}
    hits = set()
    for o_pos, o in enumerate(order):
        for a_pos in range(o_pos + 1, len(order)):
            a = order[a_pos]
            if o not in supports.get(a, frozenset()):
                continue
            for y_pos in range(a_pos + 1, len(order)):
                y = order[y_pos]
                if o not in supports.get(y, frozenset()):
                    continue
                e_points = supports.get(y, frozenset()) & supports.get(o, frozenset())
                c_points = supports.get(o, frozenset()) & supports.get(a, frozenset())
                for e in e_points:
                    if position[e] <= y_pos:
                        continue
                    hits.update(
                        (o, a, y, e, c)
                        for c in c_points
                        if position[c] > position[e]
                    )
    return tuple(sorted(hits))


def _six_ccw_two_k2_three_row_witnesses(
    order: tuple[int, ...],
    supports: dict[int, frozenset[int]],
) -> tuple[Witness, ...]:
    position = {point: index for index, point in enumerate(order)}
    hits = set()
    for i0_pos, i0 in enumerate(order):
        for i1_pos in range(i0_pos + 1, len(order)):
            i1 = order[i1_pos]
            for i2_pos in range(i1_pos + 1, len(order)):
                i2 = order[i2_pos]
                support0 = supports.get(i0, frozenset())
                support1 = supports.get(i1, frozenset())
                support2 = supports.get(i2, frozenset())
                i3_points = support0 & support2
                i4_points = support1 & support2
                i5_points = support0 & support1
                for i3 in i3_points:
                    if position[i3] <= i2_pos:
                        continue
                    for i4 in i4_points:
                        if position[i4] <= position[i3]:
                            continue
                        hits.update(
                            (i0, i1, i2, i3, i4, i5)
                            for i5 in i5_points
                            if position[i5] > position[i4]
                        )
    return tuple(sorted(hits))


MATCHERS = {
    "shared_middle_endpoint_pair": _shared_middle_endpoint_pair_witnesses,
    "five_ccw_three_rows": _five_ccw_three_row_witnesses,
    "six_ccw_two_k2_three_rows": _six_ccw_two_k2_three_row_witnesses,
}


def violated_witnesses(
    family: str,
    order: tuple[int, ...],
    supports: dict[int, frozenset[int]],
) -> tuple[Witness, ...]:
    """Return exactly the increasing instances present in ``supports``."""

    return MATCHERS[family](order, supports)


def _violated_witnesses_bruteforce(
    family: str,
    order: tuple[int, ...],
    supports: dict[int, frozenset[int]],
) -> tuple[Witness, ...]:
    return tuple(
        witness
        for witness, core in INSTANCE_GENERATORS[family](order)
        if all(point in supports.get(center, frozenset()) for center, point in core)
    )


def _smoke_family(family: str, arity: int) -> int:
    order = tuple(range(17))
    instances = INSTANCE_GENERATORS[family](order)
    expected = math.comb(len(order), arity)
    if len(instances) != expected or len(set(instances)) != expected:
        raise AssertionError(
            f"{family}: expected {expected} distinct instances, got {len(instances)}"
        )

    witness, core = instances[0]
    supports = {vertex: frozenset() for vertex in order}
    for center, point in core:
        supports[center] = supports[center] | {point}
    if violated_witnesses(family, order, supports) != (witness,):
        raise AssertionError(f"{family}: complete canonical motif was not unique")

    for omitted_center, omitted_point in core:
        weakened = dict(supports)
        weakened[omitted_center] = weakened[omitted_center] - {omitted_point}
        if violated_witnesses(family, order, weakened):
            raise AssertionError(f"{family}: accepted a motif with one missing incidence")

    rng = random.Random(f"exact17-{family}")
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
        fast = violated_witnesses(family, test_order, test_supports)
        slow = _violated_witnesses_bruteforce(family, test_order, test_supports)
        if fast != slow:
            raise AssertionError(f"{family}: optimized matcher disagrees with definition")
    return len(instances)


def smoke() -> dict[str, object]:
    arities = {
        "shared_middle_endpoint_pair": 4,
        "five_ccw_three_rows": 5,
        "six_ccw_two_k2_three_rows": 6,
    }
    return {
        "families": {
            family: {
                "instances": _smoke_family(family, arities[family]),
                "lean_consumer": LEAN_CONSUMERS[family],
            }
            for family in INSTANCE_GENERATORS
        }
    }


if __name__ == "__main__":
    print(json.dumps(smoke(), indent=2, sort_keys=True))

#!/usr/bin/env python3
"""Generate and independently replay a uniform degree-four tight graph.

For every even ``n >= 12``, give a circular split weight ``n - 8`` to every
split whose smaller side has cardinality two, and weight one to every other
proper circular split.  The resulting translation-invariant split metric has
four additive-tight nonself targets in every row for the parity potentials
constructed below.

This is an exact integer counterexample to both the proposed
``off_diagonal_tight_count <= 4*n - 1`` bound and the proposed existence of a
left row of tight degree at most three.  It is theorem-discovery support, not
a Lean certificate.
"""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path
from typing import Any


Arc = tuple[int, int]


def circular_intervals(n: int) -> tuple[frozenset[int], ...]:
    """Proper circular intervals modulo complement in the local-basis order."""

    return tuple(
        frozenset(range(left + 1, right + 1))
        for left in range(n)
        for right in range(left + 2, n)
        if not (left == 0 and right == n - 1)
    )


def separated(interval: frozenset[int], left: int, right: int) -> bool:
    return (left in interval) != (right in interval)


def reachable(n: int, edges: tuple[Arc, ...], *, reverse: bool) -> set[int]:
    seen = {0}
    pending = [0]
    while pending:
        vertex = pending.pop()
        following = (
            (center for center, target in edges if target == vertex)
            if reverse
            else (target for center, target in edges if center == vertex)
        )
        for target in following:
            if target not in seen:
                seen.add(target)
                pending.append(target)
    return seen


def pair_alternating(n: int, edges: tuple[Arc, ...]) -> bool:
    rows = {
        center: {target for left, target in edges if left == center}
        for center in range(n)
    }
    for left, right in itertools.combinations(range(n), 2):
        for first, second in itertools.combinations(rows[left] & rows[right], 2):
            if (left < first < right) == (left < second < right):
                return False
    return True


def build_and_replay(n: int) -> dict[str, Any]:
    if n < 12 or n % 2 != 0:
        raise ValueError("n must be even and at least twelve")

    intervals = circular_intervals(n)
    weights = tuple(
        n - 8 if min(len(interval), n - len(interval)) == 2 else 1
        for interval in intervals
    )
    assert all(weight > 0 for weight in weights)

    def distance(left: int, right: int) -> int:
        return sum(
            weight
            for interval, weight in zip(intervals, weights, strict=True)
            if separated(interval, left, right)
        )

    offsets = tuple(distance(0, target) for target in range(n))
    half = n // 2
    assert all(offsets[index] < offsets[index + 1] for index in range(half))
    assert all(offsets[index] == offsets[n - index] for index in range(1, half))

    scale = 3 * n - 21
    assert offsets[1] == scale
    assert offsets[2] == 2 * scale
    assert offsets[5] == 3 * scale
    assert 2 * offsets[2] == offsets[1] + offsets[5]

    alpha = tuple(0 if vertex % 2 == 0 else scale for vertex in range(n))
    beta = tuple(2 * scale if vertex % 2 == 0 else scale for vertex in range(n))
    edges = tuple(
        (center, target)
        for center in range(n)
        for target in range(n)
        if center != target
        and distance(center, target) == alpha[center] + beta[target]
    )
    diagonal = tuple(
        vertex for vertex in range(n) if alpha[vertex] + beta[vertex] == 0
    )
    row_degrees = tuple(
        sum(center == left for left, _right in edges) for center in range(n)
    )
    target_degrees = tuple(
        sum(target == right for _left, right in edges) for target in range(n)
    )
    rows = tuple(
        tuple(target for left, target in edges if left == center)
        for center in range(n)
    )

    assert len(edges) == 4 * n
    assert row_degrees == (4,) * n
    assert target_degrees == (4,) * n
    assert diagonal == ()
    assert rows == tuple(
        tuple(sorted({
            (center - (2 if center % 2 == 0 else 5)) % n,
            (center + (2 if center % 2 == 0 else 5)) % n,
            (center - (1 if center % 2 == 0 else 2)) % n,
            (center + (1 if center % 2 == 0 else 2)) % n,
        }))
        for center in range(n)
    )

    k1_slacks: list[int] = []
    k2_slacks: list[int] = []
    for a, b, c, d in itertools.combinations(range(n), 4):
        diagonal_sum = distance(a, c) + distance(b, d)
        k1_slacks.append(diagonal_sum - distance(a, b) - distance(c, d))
        k2_slacks.append(diagonal_sum - distance(a, d) - distance(b, c))
    assert min(k1_slacks) > 0
    assert min(k2_slacks) > 0

    strongly_connected = (
        reachable(n, edges, reverse=False) == set(range(n))
        and reachable(n, edges, reverse=True) == set(range(n))
    )
    alternating = pair_alternating(n, edges)
    assert strongly_connected
    assert alternating

    return {
        "schema": "p97-uniform-positive-circular-split-degree-four-tight-graph-v1",
        "epistemic_status": "EXACT_INTEGER_COUNTEREXAMPLE",
        "n": n,
        "interval_count": len(intervals),
        "weight_rule": {
            "smaller_side_cardinality_2": n - 8,
            "every_other_proper_split": 1,
        },
        "intervals": [sorted(interval) for interval in intervals],
        "weights": list(weights),
        "distance_offsets_from_zero": list(offsets),
        "scale": scale,
        "alpha": list(alpha),
        "beta": list(beta),
        "edges": [list(edge) for edge in edges],
        "rows": [list(row) for row in rows],
        "edge_count": len(edges),
        "four_n": 4 * n,
        "violates_four_n_minus_one": len(edges) > 4 * n - 1,
        "row_degrees": list(row_degrees),
        "target_degrees": list(target_degrees),
        "tight_diagonal": list(diagonal),
        "minimum_kalmanson_slack_1": min(k1_slacks),
        "minimum_kalmanson_slack_2": min(k2_slacks),
        "strongly_connected": strongly_connected,
        "pair_alternating": alternating,
        "replay": "EXACT_INTEGER_PASS",
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, default=12)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    payload = build_and_replay(args.n)
    rendered = json.dumps(payload, indent=2, sort_keys=True)
    if args.output is not None:
        args.output.write_text(rendered + "\n", encoding="utf-8")
    print(rendered)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

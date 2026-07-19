#!/usr/bin/env python3
"""Independent exact replay for the uniform tight-graph counterexample JSON."""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path
from typing import Any


def canonical_intervals(n: int) -> tuple[frozenset[int], ...]:
    return tuple(
        frozenset(range(left + 1, right + 1))
        for left in range(n)
        for right in range(left + 2, n)
        if not (left == 0 and right == n - 1)
    )


def replay(source: dict[str, Any]) -> dict[str, Any]:
    assert source["schema"] == (
        "p97-uniform-positive-circular-split-degree-four-tight-graph-v1"
    )
    n = int(source["n"])
    assert n >= 12 and n % 2 == 0
    intervals = tuple(frozenset(map(int, interval)) for interval in source["intervals"])
    assert intervals == canonical_intervals(n)
    weights = tuple(map(int, source["weights"]))
    assert len(weights) == len(intervals)
    assert all(weight > 0 for weight in weights)
    assert weights == tuple(
        n - 8 if min(len(interval), n - len(interval)) == 2 else 1
        for interval in intervals
    )
    alpha = tuple(map(int, source["alpha"]))
    beta = tuple(map(int, source["beta"]))
    assert len(alpha) == n and len(beta) == n

    def distance(left: int, right: int) -> int:
        return sum(
            weight
            for interval, weight in zip(intervals, weights, strict=True)
            if (left in interval) != (right in interval)
        )

    offsets = tuple(distance(0, target) for target in range(n))
    assert offsets == tuple(map(int, source["distance_offsets_from_zero"]))
    scale = 3 * n - 21
    assert offsets[1] == scale
    assert offsets[2] == 2 * scale
    assert offsets[5] == 3 * scale

    full_edges = tuple(
        (center, target)
        for center in range(n)
        for target in range(n)
        if center != target
        and distance(center, target) == alpha[center] + beta[target]
    )
    claimed_edges = tuple(tuple(map(int, edge)) for edge in source["edges"])
    assert claimed_edges == full_edges
    assert len(set(full_edges)) == len(full_edges) == 4 * n
    rows = tuple(
        tuple(target for left, target in full_edges if left == center)
        for center in range(n)
    )
    assert rows == tuple(tuple(map(int, row)) for row in source["rows"])
    row_degrees = tuple(map(len, rows))
    target_degrees = tuple(
        sum(target == right for _left, right in full_edges) for target in range(n)
    )
    tight_diagonal = tuple(
        vertex for vertex in range(n) if alpha[vertex] + beta[vertex] == 0
    )
    assert row_degrees == (4,) * n
    assert target_degrees == (4,) * n
    assert tight_diagonal == ()

    slack_1: list[int] = []
    slack_2: list[int] = []
    for a, b, c, d in itertools.combinations(range(n), 4):
        diagonals = distance(a, c) + distance(b, d)
        slack_1.append(diagonals - distance(a, b) - distance(c, d))
        slack_2.append(diagonals - distance(a, d) - distance(b, c))
    assert min(slack_1) > 0 and min(slack_2) > 0

    def reach(reverse: bool) -> set[int]:
        seen = {0}
        stack = [0]
        while stack:
            vertex = stack.pop()
            successors = (
                (left for left, right in full_edges if right == vertex)
                if reverse
                else (right for left, right in full_edges if left == vertex)
            )
            for successor in successors:
                if successor not in seen:
                    seen.add(successor)
                    stack.append(successor)
        return seen

    alternating = True
    for left, right in itertools.combinations(range(n), 2):
        common = set(rows[left]) & set(rows[right])
        for first, second in itertools.combinations(common, 2):
            if (left < first < right) == (left < second < right):
                alternating = False
    strongly_connected = (
        reach(False) == set(range(n)) and reach(True) == set(range(n))
    )
    assert alternating and strongly_connected

    return {
        "schema": "p97-uniform-tight-graph-independent-replay-v1",
        "status": "EXACT_INTEGER_PASS",
        "n": n,
        "edge_count": len(full_edges),
        "four_n": 4 * n,
        "violates_four_n_minus_one": len(full_edges) > 4 * n - 1,
        "row_degrees": list(row_degrees),
        "target_degrees": list(target_degrees),
        "tight_diagonal": list(tight_diagonal),
        "minimum_kalmanson_slack_1": min(slack_1),
        "minimum_kalmanson_slack_2": min(slack_2),
        "strongly_connected": strongly_connected,
        "pair_alternating": alternating,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("certificate", type=Path)
    args = parser.parse_args()
    source = json.loads(args.certificate.read_text(encoding="utf-8"))
    print(json.dumps(replay(source), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

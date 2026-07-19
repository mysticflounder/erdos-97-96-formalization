#!/usr/bin/env python3
"""Independent exact replay of the two stored Kalmanson distance ledgers."""

from __future__ import annotations

from fractions import Fraction
import itertools
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent


def edge(a: str, b: str) -> str:
    assert a != b
    return "~".join(sorted((a, b)))


def replay(case: str, payload: dict[str, object]) -> tuple[int, int, Fraction]:
    order = tuple(payload["order"])
    raw = payload["distances"]
    distance = {name: Fraction(value) for name, value in raw.items()}
    expected = {edge(a, b) for a, b in itertools.combinations(order, 2)}
    assert set(distance) == expected
    assert all(value >= 1 for value in distance.values())

    triangle_count = 0
    for a, b, c in itertools.combinations(order, 3):
        ab, ac, bc = distance[edge(a, b)], distance[edge(a, c)], distance[edge(b, c)]
        assert ab <= ac + bc
        assert ac <= ab + bc
        assert bc <= ab + ac
        triangle_count += 3

    physical_radius = distance[edge("o", "left")]
    for z in ("q0", "q1", "q2", "right"):
        assert distance[edge("o", z)] == physical_radius
    for z in ("c0", "c1", "c2", "x", "y"):
        assert abs(distance[edge("o", z)] - physical_radius) >= 1

    row_radius = distance[edge("c0", "q0")]
    for z in ("q1", "x", "y"):
        assert distance[edge("c0", z)] == row_radius
    for z in ("o", "left", "c1", "c2", "q2", "right"):
        assert abs(distance[edge("c0", z)] - row_radius) >= 1
    assert distance[edge("c1", "q1")] == distance[edge("c1", "q2")]
    assert distance[edge("c2", "q2")] == distance[edge("c2", "q0")]

    kalmanson_count = 0
    slacks: list[Fraction] = []
    for ia, ib, ic, id_ in itertools.combinations(range(len(order)), 4):
        a, b, c, d = order[ia], order[ib], order[ic], order[id_]
        diagonal_sum = distance[edge(a, c)] + distance[edge(b, d)]
        first_other = distance[edge(b, c)] + distance[edge(a, d)]
        second_other = distance[edge(a, b)] + distance[edge(c, d)]
        assert diagonal_sum - first_other >= 1
        assert diagonal_sum - second_other >= 1
        slacks.extend((diagonal_sum - first_other, diagonal_sum - second_other))
        kalmanson_count += 2

    print(
        f"{case}: PASS variables={len(distance)} triangles={triangle_count} "
        f"strict_kalmanson={kalmanson_count} min_slack={min(slacks)}"
    )
    return triangle_count, kalmanson_count, min(slacks)


def main() -> None:
    payload = json.loads((HERE / "ledgers.json").read_text(encoding="utf-8"))
    assert payload["schema"] == "period3-cycle-one-complete-row-kalmanson-lra-v1"
    replay("same_side", payload["same_side"])
    replay("split_side", payload["split_side"])
    print("PASS: exact rational Kalmanson ledgers; no Euclidean realization claimed")


if __name__ == "__main__":
    main()

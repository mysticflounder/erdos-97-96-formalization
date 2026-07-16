#!/usr/bin/env python3
"""Enumerate generic planar rigidity circuits in the 15-row colored graph."""

from __future__ import annotations

import itertools


EDGES = [
    ("O", "A", "u"),
    ("A", "G", "u"),
    ("A", "K", "u"),
    ("O", "E", "u"),
    ("K", "O", "r"),
    ("K", "G", "r"),
    ("G", "X", "r"),
    ("G", "E", "r"),
    ("X", "Z", "r"),
    ("X", "F", "r"),
    ("K", "Y", "r"),
    ("Y", "O", "s"),
    ("Y", "X", "s"),
    ("Y", "Z", "s"),
    ("Z", "A", "s"),
    ("Z", "G", "s"),
    ("F", "A", "t"),
    ("F", "Z", "t"),
    ("F", "K", "t"),
]


def is_circuit(edges: list[tuple[str, str, str]]) -> bool:
    vertices = {vertex for edge in edges for vertex in edge[:2]}
    if len(edges) != 2 * len(vertices) - 2:
        return False
    for size in range(2, len(vertices)):
        for subset in map(set, itertools.combinations(vertices, size)):
            inside = sum(a in subset and b in subset for a, b, _ in edges)
            if inside > 2 * size - 3:
                return False
    return True


def main() -> None:
    circuits = []
    for mask in range(1, 1 << len(EDGES)):
        edges = [edge for index, edge in enumerate(EDGES) if mask >> index & 1]
        if is_circuit(edges):
            circuits.append(edges)
    print("circuits", len(circuits))
    for edges in circuits:
        vertices = sorted({vertex for edge in edges for vertex in edge[:2]})
        print(
            len(edges),
            "".join(vertices),
            "".join(color for _, _, color in edges),
            [(a + b, color) for a, b, color in edges],
        )


if __name__ == "__main__":
    main()

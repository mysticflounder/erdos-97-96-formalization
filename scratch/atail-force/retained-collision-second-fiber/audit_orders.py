#!/usr/bin/env python3
"""Enumerate ordinal closure for a chained pair of two-center fibers."""

from __future__ import annotations

import importlib.util
import itertools
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
ORDINAL_AUDIT = ROOT / "scratch/atail-force/robust-second-apex-bank-audit/audit.py"


def load_ordinal():
    spec = importlib.util.spec_from_file_location("second_fiber_ordinal", ORDINAL_AUDIT)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {ORDINAL_AUDIT}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def alternates(order: tuple[str, ...], a: str, b: str, x: str, y: str) -> bool:
    positions = {point: index for index, point in enumerate(order)}
    n = len(order)

    def between(start: int, end: int, point: int) -> bool:
        return 0 < (point - start) % n < (end - start) % n

    return between(positions[a], positions[b], positions[x]) != between(
        positions[a], positions[b], positions[y]
    )


def main() -> int:
    ordinal = load_ordinal()
    points = ("O", "A", "B", "q", "w", "x", "y")
    rows = (
        ("O", frozenset(("q", "w"))),
        ("A", frozenset(("q", "w", "x", "y"))),
        ("B", frozenset(("x", "y"))),
    )
    admissible = []
    cyclic = []
    for tail in itertools.permutations(point for point in points if point != "O"):
        order = ("O", *tail)
        if order[1] > order[-1]:
            continue
        if not alternates(order, "O", "A", "q", "w"):
            continue
        if not alternates(order, "A", "B", "x", "y"):
            continue
        admissible.append(order)
        cycle = ordinal.shortest_cycle_length(order, rows)
        if cycle is not None:
            cyclic.append((order, cycle))
    assert len(admissible) == 40
    assert len(cyclic) == 4
    print(f"admissible={len(admissible)} cyclic={len(cyclic)}")
    print(f"first_acyclic={next(order for order in admissible if ordinal.shortest_cycle_length(order, rows) is None)}")
    if cyclic:
        print(f"first_cyclic={cyclic[0]}")

    cross_points = ("O", "A", "X", "J", "C", "K")
    cross_rows = (
        ("O", frozenset(("J", "C", "K"))),
        ("A", frozenset(("C", "K"))),
        ("X", frozenset(("J", "K"))),
    )
    cross_admissible = []
    cross_cyclic = []
    for tail in itertools.permutations(point for point in cross_points if point != "O"):
        order = ("O", *tail)
        if order[1] > order[-1]:
            continue
        if not alternates(order, "O", "A", "C", "K"):
            continue
        if not alternates(order, "O", "X", "J", "K"):
            continue
        cross_admissible.append(order)
        cycle = ordinal.shortest_cycle_length(order, cross_rows)
        if cycle is not None:
            cross_cyclic.append((order, cycle))
    cross_acyclic = tuple(
        order
        for order in cross_admissible
        if ordinal.shortest_cycle_length(order, cross_rows) is None
    )
    assert len(cross_admissible) == 7
    assert len(cross_cyclic) == 2
    assert cross_acyclic == (
        ("O", "J", "X", "C", "A", "K"),
        ("O", "J", "C", "X", "A", "K"),
        ("O", "C", "A", "J", "X", "K"),
        ("O", "C", "A", "K", "X", "J"),
        ("O", "C", "J", "A", "X", "K"),
    )
    print(
        f"cross_admissible={len(cross_admissible)} "
        f"cross_cyclic={len(cross_cyclic)}"
    )
    print(
        "cross_first_acyclic="
        f"{next(order for order in cross_admissible if ordinal.shortest_cycle_length(order, cross_rows) is None)}"
    )
    if cross_cyclic:
        print(f"cross_first_cyclic={cross_cyclic[0]}")
    print("cross_acyclic_orders=")
    for order in cross_acyclic:
        print("  " + ",".join(order))
    target = ("O", "J", "C", "A", "X", "K")
    print("target_comparisons=")
    for comparison in ordinal_comparisons(target, cross_rows):
        print("  " + comparison)
    return 0


def ordinal_comparisons(
    order: tuple[str, ...], rows: tuple[tuple[str, frozenset[str]], ...]
) -> list[str]:
    edges = tuple(itertools.combinations(order, 2))
    edge_index = {frozenset(edge): index for index, edge in enumerate(edges)}

    def edge_id(left: str, right: str) -> int:
        return edge_index[frozenset((left, right))]

    parent = list(range(len(edges)))

    def find(value: int) -> int:
        if parent[value] != value:
            parent[value] = find(parent[value])
        return parent[value]

    def union(left: int, right: int) -> None:
        left = find(left)
        right = find(right)
        if left != right:
            parent[right] = left

    for center, support in rows:
        selected = [edge_id(center, point) for point in support]
        for edge in selected[1:]:
            union(selected[0], edge)
    classes: dict[int, list[str]] = {}
    for index, edge in enumerate(edges):
        classes.setdefault(find(index), []).append("".join(edge))

    output = []
    for indices in itertools.combinations(range(len(order)), 4):
        a, b, c, d = (order[index] for index in indices)
        for inequality_number, terms in enumerate(
            (
                ((a, c), (b, d), (a, b), (c, d)),
                ((a, c), (b, d), (a, d), (b, c)),
            ),
            start=1,
        ):
            roots = [find(edge_id(*edge)) for edge in terms]
            for left_index in (0, 1):
                for right_index in (0, 1):
                    if roots[left_index] != roots[2 + right_index]:
                        continue
                    smaller = roots[2 + (1 - right_index)]
                    larger = roots[1 - left_index]
                    output.append(
                        f"{classes[smaller][0]} < {classes[larger][0]} "
                        f"from {a}{b}{c}{d}/K{inequality_number} "
                        f"cancel {classes[roots[left_index]][0]}"
                    )
    return output


if __name__ == "__main__":
    raise SystemExit(main())

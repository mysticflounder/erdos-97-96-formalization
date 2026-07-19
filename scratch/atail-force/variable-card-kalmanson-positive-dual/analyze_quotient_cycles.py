#!/usr/bin/env python3
"""Audit exact Kalmanson cores for a quotient-induced strict cycle.

The input core banks store selected-row equalities as ``row_c_x_y``.  These
equalities generate an equivalence relation on unordered distance terms.  For
every increasing quadruple, either strict Kalmanson inequality becomes a
strict comparison after one term on the diagonal side is identified with one
term on the other side.  This script closes those comparisons transitively and
looks for a directed cycle.

This is a theorem-discovery audit.  It does not claim that the stored banks
cover the live parent, nor that the Python replay is a Lean proof.
"""

from __future__ import annotations

import argparse
import itertools
import json
from collections import Counter
from pathlib import Path
from typing import Iterable


Edge = tuple[int, int]


def edge(left: int, right: int) -> Edge:
    if left == right:
        raise ValueError("distance edge must have distinct endpoints")
    return (left, right) if left < right else (right, left)


class UnionFind:
    def __init__(self, values: Iterable[Edge]) -> None:
        self.parent = {value: value for value in values}

    def find(self, value: Edge) -> Edge:
        parent = self.parent[value]
        if parent != value:
            self.parent[value] = self.find(parent)
        return self.parent[value]

    def union(self, left: Edge, right: Edge) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[right_root] = left_root


def parse_row_equality(name: str) -> tuple[Edge, Edge] | None:
    if not name.startswith("row_"):
        return None
    parts = name.split("_")
    if len(parts) != 4:
        raise ValueError(f"unexpected row equality name: {name}")
    center, left, right = map(int, parts[1:])
    return edge(center, left), edge(center, right)


def quotient_cycle(
    vertex_count: int, row_equalities: Iterable[tuple[Edge, Edge]]
) -> dict[str, object]:
    all_edges = [edge(left, right) for left in range(vertex_count) for right in range(left + 1, vertex_count)]
    quotient = UnionFind(all_edges)
    equality_count = 0
    for left, right in row_equalities:
        quotient.union(left, right)
        equality_count += 1

    adjacency: dict[Edge, set[Edge]] = {
        quotient.find(term): set() for term in all_edges
    }
    witnesses: dict[tuple[Edge, Edge], dict[str, object]] = {}

    def add_cancellations(
        kind: str,
        quadruple: tuple[int, int, int, int],
        diagonal_first: Edge,
        diagonal_second: Edge,
        side_first: Edge,
        side_second: Edge,
    ) -> None:
        # diagonal_first + diagonal_second > side_first + side_second.
        cancellations = (
            (diagonal_first, side_first, side_second, diagonal_second),
            (diagonal_first, side_second, side_first, diagonal_second),
            (diagonal_second, side_first, side_second, diagonal_first),
            (diagonal_second, side_second, side_first, diagonal_first),
        )
        for cancelled_left, cancelled_right, smaller, larger in cancellations:
            if quotient.find(cancelled_left) != quotient.find(cancelled_right):
                continue
            smaller_class = quotient.find(smaller)
            larger_class = quotient.find(larger)
            adjacency[smaller_class].add(larger_class)
            witnesses.setdefault(
                (smaller_class, larger_class),
                {
                    "kind": kind,
                    "quadruple": list(quadruple),
                    "cancelled": [list(cancelled_left), list(cancelled_right)],
                    "comparison": [list(smaller), list(larger)],
                },
            )

    for a, b, c, d in itertools.combinations(range(vertex_count), 4):
        diagonal_first = edge(a, c)
        diagonal_second = edge(b, d)
        add_cancellations(
            "K1",
            (a, b, c, d),
            diagonal_first,
            diagonal_second,
            edge(a, b),
            edge(c, d),
        )
        add_cancellations(
            "K2",
            (a, b, c, d),
            diagonal_first,
            diagonal_second,
            edge(a, d),
            edge(b, c),
        )

    color = {vertex: 0 for vertex in adjacency}
    parent: dict[Edge, Edge] = {}
    cycle: list[Edge] | None = None

    def visit(vertex: Edge) -> None:
        nonlocal cycle
        color[vertex] = 1
        for successor in sorted(adjacency[vertex]):
            if color[successor] == 0:
                parent[successor] = vertex
                visit(successor)
            elif color[successor] == 1 and cycle is None:
                reversed_path = [vertex]
                while reversed_path[-1] != successor:
                    reversed_path.append(parent[reversed_path[-1]])
                cycle = list(reversed(reversed_path)) + [successor]
            if cycle is not None:
                return
        color[vertex] = 2

    for vertex in sorted(adjacency):
        if color[vertex] == 0:
            visit(vertex)
        if cycle is not None:
            break

    result: dict[str, object] = {
        "vertex_count": vertex_count,
        "row_equality_count": equality_count,
        "quotient_class_count": len({quotient.find(term) for term in all_edges}),
        "strict_comparison_count": sum(len(targets) for targets in adjacency.values()),
        "has_cycle": cycle is not None,
    }
    if cycle is not None:
        result["cycle_length"] = len(cycle) - 1
        result["cycle_classes"] = [list(term) for term in cycle]
        result["steps"] = [
            witnesses[(left, right)] for left, right in zip(cycle, cycle[1:])
        ]
    return result


def analyze_minimized_bank(path: Path) -> dict[str, object]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    analyses = []
    for schema_index, schema in enumerate(payload["schemas"]):
        provenance = schema["provenance"][0]
        core = provenance["minimal_core"]
        normalized_memberships: dict[int, list[int]] = {}
        for center, point in schema["order_schema"]:
            normalized_memberships.setdefault(center, []).append(point)
        row_equalities = []
        for center, points in normalized_memberships.items():
            first = points[0]
            row_equalities.extend(
                (edge(center, first), edge(center, point)) for point in points[1:]
            )
        analysis = quotient_cycle(schema["core_vertex_count"], row_equalities)
        analysis["schema_index"] = schema_index
        analysis["minimal_core_size"] = len(core)
        analyses.append(analysis)

    cycle_histogram = Counter(
        analysis.get("cycle_length", "none") for analysis in analyses
    )
    return {
        "source": str(path),
        "schema_count": len(analyses),
        "cycle_count": sum(analysis["has_cycle"] for analysis in analyses),
        "cycle_length_histogram": {
            str(key): count for key, count in sorted(cycle_histogram.items(), key=lambda item: str(item[0]))
        },
        "residual_schema_indices": [
            analysis["schema_index"] for analysis in analyses if not analysis["has_cycle"]
        ],
        "analyses": analyses,
    }


def analyze_row_table(path: Path) -> dict[str, object]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    rows = {int(center): tuple(points) for center, points in payload["rows"].items()}
    row_equalities = []
    for center, points in rows.items():
        first = points[0]
        row_equalities.extend(
            (edge(center, first), edge(center, point)) for point in points[1:]
        )
    analysis = quotient_cycle(payload["n"], row_equalities)
    analysis["source"] = str(path)
    return analysis


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--minimized-bank", type=Path, action="append", default=[])
    parser.add_argument("--row-table", type=Path, action="append", default=[])
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    result = {
        "schema": "p97-variable-card-kalmanson-quotient-cycle-audit-v1",
        "epistemic_status": "EXACT_COMBINATORIAL_REPLAY_NOT_LEAN_COVERAGE_PROOF",
        "minimized_banks": [analyze_minimized_bank(path) for path in args.minimized_bank],
        "row_tables": [analyze_row_table(path) for path in args.row_table],
    }
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

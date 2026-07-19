#!/usr/bin/env python3
"""Audit simple selected-row equality cycles inside FULL_LRA schemas.

Each chosen row contributes one equality edge between two support members.
The chosen edges must form a simple cycle on equally many terminal vertices,
with distinct row centers.  The cycle alone is replayed against the complete
normalized strict Kalmanson LRA system.

This is exact for the bounded ordered schemas in the input bank.  It is not a
Lean proof and does not establish arbitrary-cardinality coverage.
"""

from __future__ import annotations

import argparse
import collections
import importlib.util
import itertools
import json
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
TRIANGLE_PATH = HERE / "check_triangle_subcores.py"
SPEC = importlib.util.spec_from_file_location("triangle_subcore_check", TRIANGLE_PATH)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError(f"cannot load {TRIANGLE_PATH}")
TRIANGLE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(TRIANGLE)


def distance_edge(left: int, right: int) -> tuple[int, int]:
    return tuple(sorted((left, right)))


def has_ordinal_cycle(
    n: int, centers: tuple[int, ...], pairs: tuple[tuple[int, int], ...]
) -> bool:
    """Replay the eight one-row cancellation orientations from search.py."""
    selected = {
        center: frozenset(pair)
        for center, pair in zip(centers, pairs, strict=True)
    }
    comparison: dict[tuple[int, int], set[tuple[int, int]]] = collections.defaultdict(set)

    def add(
        center: int,
        first: int,
        second: int,
        smaller: tuple[int, int],
        larger: tuple[int, int],
    ) -> None:
        if selected.get(center) == frozenset((first, second)):
            comparison[smaller].add(larger)

    for a, b, c, d in itertools.combinations(range(n), 4):
        add(a, b, c, distance_edge(c, d), distance_edge(b, d))
        add(d, b, c, distance_edge(a, b), distance_edge(a, c))
        add(b, a, d, distance_edge(c, d), distance_edge(a, c))
        add(c, a, d, distance_edge(a, b), distance_edge(b, d))
        add(a, c, d, distance_edge(b, c), distance_edge(b, d))
        add(b, c, d, distance_edge(a, d), distance_edge(a, c))
        add(c, a, b, distance_edge(a, d), distance_edge(b, d))
        add(d, a, b, distance_edge(b, c), distance_edge(a, c))

    vertices = set(comparison)
    for targets in comparison.values():
        vertices.update(targets)
    color = {vertex: 0 for vertex in vertices}

    def visit(vertex: tuple[int, int]) -> bool:
        color[vertex] = 1
        for following in comparison[vertex]:
            if color[following] == 1:
                return True
            if color[following] == 0 and visit(following):
                return True
        color[vertex] = 2
        return False

    return any(color[vertex] == 0 and visit(vertex) for vertex in vertices)


def check_kalmanson_only(
    n: int,
    centers: tuple[int, ...],
    pairs: tuple[tuple[int, int], ...],
    timeout_ms: int,
) -> str:
    """Check strict Kalmanson inequalities plus row equalities, nothing else."""
    z3 = TRIANGLE.z3
    solver = z3.Solver()
    solver.set(timeout=timeout_ms)
    table = TRIANGLE.CEGAR.distance_table(n)
    dist = lambda left, right: TRIANGLE.CEGAR.dist(table, left, right)
    for a, b, c, d in itertools.combinations(range(n), 4):
        diagonals = dist(a, c) + dist(b, d)
        solver.add(diagonals >= dist(a, b) + dist(c, d) + 1)
        solver.add(diagonals >= dist(a, d) + dist(b, c) + 1)
    for center, (first, second) in zip(centers, pairs, strict=True):
        solver.add(dist(center, first) == dist(center, second))
    return str(solver.check()).upper()


def is_simple_cycle(pairs: tuple[tuple[int, int], ...]) -> bool:
    size = len(pairs)
    degree = collections.Counter(point for pair in pairs for point in pair)
    if len(degree) != size or set(degree.values()) != {2}:
        return False
    if len({frozenset(pair) for pair in pairs}) != size:
        return False
    adjacency: dict[int, set[int]] = collections.defaultdict(set)
    for left, right in pairs:
        adjacency[left].add(right)
        adjacency[right].add(left)
    seen = set()
    stack = [next(iter(degree))]
    while stack:
        vertex = stack.pop()
        if vertex in seen:
            continue
        seen.add(vertex)
        stack.extend(adjacency[vertex] - seen)
    return len(seen) == size


def cycle_orders(pairs: tuple[tuple[int, int], ...]):
    adjacency: dict[int, set[int]] = collections.defaultdict(set)
    for left, right in pairs:
        adjacency[left].add(right)
        adjacency[right].add(left)
    for start in adjacency:
        for following in adjacency[start]:
            answer = [start, following]
            previous, current = start, following
            while len(answer) < len(adjacency):
                choices = adjacency[current] - {previous}
                next_vertex = next(iter(choices))
                answer.append(next_vertex)
                previous, current = current, next_vertex
            yield tuple(answer)


def canonical_order_type(
    n: int, centers: tuple[int, ...], pairs: tuple[tuple[int, int], ...]
) -> str:
    center_of_edge = {
        frozenset(pair): center
        for center, pair in zip(centers, pairs, strict=True)
    }
    words = []
    for terminals in cycle_orders(pairs):
        edge_centers = [
            center_of_edge[frozenset((terminals[index], terminals[(index + 1) % len(terminals)]))]
            for index in range(len(terminals))
        ]
        tokens = []
        for vertex in range(n):
            token = []
            for index, center in enumerate(edge_centers):
                if vertex == center:
                    token.append(f"C{index}")
            for index, point in enumerate(terminals):
                if vertex == point:
                    token.append(f"X{index}")
            if token:
                tokens.append("".join(sorted(token)))
        words.append("|".join(tokens))
        words.append("|".join(reversed(tokens)))
    return min(words)


def cycle_witnesses(schema: dict[str, Any], size: int):
    by_center: dict[int, set[int]] = collections.defaultdict(set)
    for center, point in schema["order_schema"]:
        by_center[center].add(point)
    for centers in itertools.combinations(by_center, size):
        choices = (
            tuple(itertools.combinations(sorted(by_center[center]), 2))
            for center in centers
        )
        for pairs in itertools.product(*choices):
            if is_simple_cycle(pairs):
                yield centers, pairs


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("bank", type=Path)
    parser.add_argument("--min-size", type=int, default=3)
    parser.add_argument("--max-size", type=int, default=7)
    parser.add_argument("--timeout-ms", type=int, default=10_000)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    bank = json.loads(args.bank.read_text(encoding="utf-8"))
    results = []
    full_indices = []
    for schema_index, schema in enumerate(bank["schemas"]):
        if not any(item["kind"] == "FULL_LRA" for item in schema["provenance"]):
            continue
        full_indices.append(schema_index)
        center_count = len({center for center, _point in schema["order_schema"]})
        for size in range(args.min_size, min(args.max_size, center_count) + 1):
            for centers, pairs in cycle_witnesses(schema, size):
                results.append(
                    {
                        "schema_index": schema_index,
                        "core_vertex_count": schema["core_vertex_count"],
                        "cycle_size": size,
                        "centers": list(centers),
                        "pairs": [list(pair) for pair in pairs],
                        "canonical_order_type": canonical_order_type(
                            schema["core_vertex_count"], centers, pairs
                        ),
                        "full_lra_status": TRIANGLE.check_subcore(
                            schema["core_vertex_count"], centers, pairs, args.timeout_ms
                        ),
                        "kalmanson_only_status": check_kalmanson_only(
                            schema["core_vertex_count"], centers, pairs, args.timeout_ms
                        ),
                        "has_ordinal_cycle": has_ordinal_cycle(
                            schema["core_vertex_count"], centers, pairs
                        ),
                    }
                )

    killed_indices = sorted(
        {
            result["schema_index"]
            for result in results
            if result["kalmanson_only_status"] == "UNSAT"
        }
    )
    minimum_unsat_cycle = {}
    for schema_index in killed_indices:
        minimum_unsat_cycle[str(schema_index)] = min(
            result["cycle_size"]
            for result in results
            if result["schema_index"] == schema_index
            and result["kalmanson_only_status"] == "UNSAT"
        )
    order_types: dict[tuple[int, str], set[int]] = collections.defaultdict(set)
    for result in results:
        if result["kalmanson_only_status"] == "UNSAT":
            order_types[
                result["cycle_size"], result["canonical_order_type"]
            ].add(result["schema_index"])
    payload = {
        "schema": "p97-full-lra-equality-cycle-subcore-audit-v1",
        "epistemic_status": "EXACT_BOUNDED_LRA_NOT_UNIFORM_LEAN_COVERAGE",
        "source": str(args.bank),
        "full_lra_schema_count": len(full_indices),
        "cycle_witness_count": len(results),
        "full_lra_status_histogram": dict(
            sorted(
                collections.Counter(result["full_lra_status"] for result in results).items()
            )
        ),
        "kalmanson_only_status_histogram": dict(
            sorted(
                collections.Counter(
                    result["kalmanson_only_status"] for result in results
                ).items()
            )
        ),
        "unsat_ordinal_cycle_witness_count": sum(
            result["kalmanson_only_status"] == "UNSAT"
            and result["has_ordinal_cycle"]
            for result in results
        ),
        "unsat_nonordinal_farkas_witness_count": sum(
            result["kalmanson_only_status"] == "UNSAT"
            and not result["has_ordinal_cycle"]
            for result in results
        ),
        "ordinal_cycle_schema_indices": sorted(
            {
                result["schema_index"]
                for result in results
                if result["kalmanson_only_status"] == "UNSAT"
                and result["has_ordinal_cycle"]
            }
        ),
        "unsat_cycle_schema_count": len(killed_indices),
        "unsat_cycle_schema_indices": killed_indices,
        "not_killed_schema_indices": sorted(set(full_indices) - set(killed_indices)),
        "minimum_unsat_cycle_size": minimum_unsat_cycle,
        "minimum_unsat_cycle_size_histogram": dict(
            sorted(collections.Counter(minimum_unsat_cycle.values()).items())
        ),
        "unsat_order_types": [
            {
                "cycle_size": size,
                "canonical_order_type": order_type,
                "schema_count": len(indices),
                "schema_indices": sorted(indices),
            }
            for (size, order_type), indices in sorted(order_types.items())
        ],
        "results": results,
    }
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(rendered, end="")
    else:
        args.output.write_text(rendered, encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

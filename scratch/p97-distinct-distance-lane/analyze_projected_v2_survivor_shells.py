"""Summarize directed-shell structure in projected-static-v2 survivors."""

from __future__ import annotations

import argparse
import collections
import json
from pathlib import Path

import networkx as nx


def shell_graph(record: dict[str, object]) -> nx.DiGraph:
    graph = nx.DiGraph()
    graph.add_nodes_from(range(10))
    for row in record["metric_rows"]:
        center = int(row["center"])
        graph.add_edges_from((center, int(target)) for target in row["support"])
    return graph


def invariant(graph: nx.DiGraph) -> tuple[object, ...]:
    supports = [set(graph.successors(center)) for center in range(10)]
    pair_codegrees = collections.Counter(
        sum(a in support and b in support for support in supports)
        for a in range(10)
        for b in range(a + 1, 10)
    )
    row_intersections = collections.Counter(
        len(supports[a] & supports[b])
        for a in range(10)
        for b in range(a + 1, 10)
    )
    mutual_pairs = sum(
        graph.has_edge(a, b) and graph.has_edge(b, a)
        for a in range(10)
        for b in range(a + 1, 10)
    )
    directed_triangles = sum(
        graph.has_edge(a, b)
        and graph.has_edge(b, c)
        and graph.has_edge(c, a)
        for a in range(10)
        for b in range(10)
        for c in range(10)
        if len({a, b, c}) == 3
    ) // 3
    return (
        tuple(sorted(dict(collections.Counter(dict(graph.in_degree()).values())).items())),
        tuple(sorted(dict(collections.Counter(dict(graph.out_degree()).values())).items())),
        mutual_pairs,
        directed_triangles,
        tuple(sorted(pair_codegrees.items())),
        tuple(sorted(row_intersections.items())),
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("survivors", type=Path)
    args = parser.parse_args()

    records = [
        json.loads(line)
        for line in args.survivors.read_text().splitlines()
        if line.strip()
    ]
    representatives: list[tuple[nx.DiGraph, int]] = []
    class_counts: list[int] = []
    invariant_counts: collections.Counter[tuple[object, ...]] = collections.Counter()
    for record in records:
        graph = shell_graph(record)
        key = invariant(graph)
        invariant_counts[key] += 1
        for class_index, (representative, _) in enumerate(representatives):
            if key == invariant(representative) and nx.is_isomorphic(
                graph, representative
            ):
                class_counts[class_index] += 1
                break
        else:
            representatives.append((graph, int(record["index"])))
            class_counts.append(1)

    classes = []
    for (graph, record_index), count in zip(
        representatives, class_counts, strict=True
    ):
        classes.append(
            {
                "count": count,
                "record_index": record_index,
                "invariant": invariant(graph),
                "edges": sorted([list(edge) for edge in graph.edges()]),
            }
        )
    print(
        json.dumps(
            {
                "record_count": len(records),
                "invariant_class_count": len(invariant_counts),
                "directed_isomorphism_class_count": len(representatives),
                "classes": classes,
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

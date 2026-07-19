#!/usr/bin/env python3
"""Summarize ordered incidence and metric-core shapes in a schema bank.

This is a descriptive audit.  The schema bank is a bounded discovery artifact,
so none of the summaries below are a coverage proof.
"""

from __future__ import annotations

import argparse
import collections
import json
import re
from pathlib import Path
from typing import Any, Iterable


KAL_RE = re.compile(r"^(kal[12])_(\d+)_(\d+)_(\d+)_(\d+)$")
ROW_RE = re.compile(r"^row_(\d+)_(\d+)_(\d+)$")


def histogram(values: Iterable[Any]) -> dict[str, int]:
    return {
        str(key): count
        for key, count in sorted(collections.Counter(values).items())
    }


def weak_component_sizes(n: int, edges: tuple[tuple[int, int], ...]) -> tuple[int, ...]:
    adjacency = {vertex: set() for vertex in range(n)}
    for left, right in edges:
        adjacency[left].add(right)
        adjacency[right].add(left)
    unseen = set(range(n))
    sizes: list[int] = []
    while unseen:
        start = unseen.pop()
        stack = [start]
        size = 0
        while stack:
            vertex = stack.pop()
            size += 1
            fresh = adjacency[vertex] & unseen
            unseen.difference_update(fresh)
            stack.extend(fresh)
        sizes.append(size)
    return tuple(sorted(sizes, reverse=True))


def max_simple_center_path(edges: tuple[tuple[int, int], ...]) -> int:
    centers = {center for center, _point in edges}
    adjacency = {
        center: {point for c, point in edges if c == center and point in centers}
        for center in centers
    }

    def visit(vertex: int, seen: frozenset[int]) -> int:
        return max(
            [1]
            + [
                1 + visit(following, seen | {following})
                for following in adjacency[vertex]
                if following not in seen
            ]
        )

    return max((visit(center, frozenset({center})) for center in centers), default=0)


def has_center_cycle(edges: tuple[tuple[int, int], ...]) -> bool:
    centers = {center for center, _point in edges}
    adjacency = {
        center: {point for c, point in edges if c == center and point in centers}
        for center in centers
    }
    color = {center: 0 for center in centers}

    def visit(vertex: int) -> bool:
        color[vertex] = 1
        for following in adjacency[vertex]:
            if color[following] == 1:
                return True
            if color[following] == 0 and visit(following):
                return True
        color[vertex] = 2
        return False

    return any(color[center] == 0 and visit(center) for center in centers)


def incidence_signature(n: int, edges: tuple[tuple[int, int], ...]) -> tuple[Any, ...]:
    """A conservative abstract-motif signature, not an isomorphism certificate."""
    outdegree = collections.Counter(center for center, _point in edges)
    indegree = collections.Counter(point for _center, point in edges)
    centers = set(outdegree)
    reciprocal = sum(1 for left, right in edges if (right, left) in edges) // 2
    center_edges = sum(1 for _center, point in edges if point in centers)
    return (
        n,
        tuple(sorted(outdegree.values())),
        tuple(sorted(indegree.values())),
        reciprocal,
        center_edges,
        max_simple_center_path(edges),
        has_center_cycle(edges),
        weak_component_sizes(n, edges),
    )


def load_refinement(provenance: dict[str, Any], cache: dict[Path, Any]) -> dict[str, Any]:
    source = Path(provenance["source"])
    if source not in cache:
        cache[source] = json.loads(source.read_text(encoding="utf-8"))
    payload = cache[source]
    return payload["refinements"][int(provenance["refinement_index"])]


def metric_shape(metric_core: list[str]) -> dict[str, Any]:
    kinds = collections.Counter()
    row_centers = collections.Counter()
    kal_quads: list[tuple[str, tuple[int, int, int, int]]] = []
    for name in metric_core:
        if match := KAL_RE.match(name):
            kind = match.group(1)
            quad = tuple(map(int, match.groups()[1:]))
            kinds[kind] += 1
            kal_quads.append((kind, quad))
        elif match := ROW_RE.match(name):
            center, _anchor, _point = map(int, match.groups())
            kinds["row"] += 1
            row_centers[center] += 1
        elif name.startswith("tri"):
            kinds["triangle"] += 1
        elif name.startswith("pos"):
            kinds["positivity"] += 1
        else:
            kinds["other"] += 1

    # A ladder cell has two adjacent boundary pairs (a,a+1) and (c,c+1).
    # Consecutive cells with the same first pair are the simplest finite
    # shadow of the variable-cardinality Delta-staircase argument.
    ladders: dict[tuple[str, int, int], set[tuple[int, int]]] = collections.defaultdict(set)
    for kind, (a, b, c, d) in kal_quads:
        if b == a + 1 and d == c + 1:
            ladders[kind, a, b].add((c, d))
    max_ladder_width = max((len(cells) for cells in ladders.values()), default=0)
    return {
        "constraint_counts": dict(sorted(kinds.items())),
        "row_center_count": len(row_centers),
        "row_equalities_per_center": tuple(sorted(row_centers.values())),
        "max_adjacent_pair_ladder_width": max_ladder_width,
        "has_only_kalmanson_and_rows": set(kinds) <= {"kal1", "kal2", "row"},
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("bank", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    bank = json.loads(args.bank.read_text(encoding="utf-8"))
    schemas = bank["schemas"]
    source_cache: dict[Path, Any] = {}
    records: list[dict[str, Any]] = []
    provenance_records: list[dict[str, Any]] = []

    for index, schema in enumerate(schemas):
        n = int(schema["core_vertex_count"])
        edges = tuple(tuple(edge) for edge in schema["order_schema"])
        centers = {center for center, _point in edges}
        kinds = tuple(sorted({item["kind"] for item in schema["provenance"]}))
        signature = incidence_signature(n, edges)
        records.append(
            {
                "index": index,
                "core_vertex_count": n,
                "membership_count": len(edges),
                "center_count": len(centers),
                "active_center_edge_count": signature[4],
                "max_simple_center_path": signature[5],
                "has_center_cycle": signature[6],
                "weak_component_sizes": signature[7],
                "kinds": kinds,
                "incidence_signature": repr(signature),
            }
        )
        for provenance in schema["provenance"]:
            item = {
                "schema_index": index,
                "kind": provenance["kind"],
                "core_vertex_count": n,
                "membership_count": len(edges),
                "center_count": len(centers),
            }
            refinement = load_refinement(provenance, source_cache)
            if provenance["kind"] in {"K1", "K2"}:
                lengths = tuple(sorted(len(path) for path in refinement["equality_paths"]))
                item["equality_path_lengths"] = lengths
                item["total_equality_path_length"] = sum(lengths)
            elif provenance["kind"] == "FULL_LRA":
                item.update(metric_shape(refinement["metric_core"]))
            provenance_records.append(item)

    by_kind: dict[str, Any] = {}
    for kind in ("K1", "K2", "FULL_LRA"):
        unique = [record for record in records if kind in record["kinds"]]
        provenance = [item for item in provenance_records if item["kind"] == kind]
        section: dict[str, Any] = {
            "unique_schema_count": len(unique),
            "provenance_count": len(provenance),
            "core_vertex_count": histogram(item["core_vertex_count"] for item in unique),
            "center_count": histogram(item["center_count"] for item in unique),
            "membership_count": histogram(item["membership_count"] for item in unique),
            "max_simple_center_path": histogram(item["max_simple_center_path"] for item in unique),
            "center_cycle": histogram(item["has_center_cycle"] for item in unique),
            "abstract_incidence_signature_count": len(
                {item["incidence_signature"] for item in unique}
            ),
        }
        if kind in {"K1", "K2"}:
            section["equality_path_lengths"] = histogram(
                item["equality_path_lengths"] for item in provenance
            )
            section["total_equality_path_length"] = histogram(
                item["total_equality_path_length"] for item in provenance
            )
        else:
            section["row_center_count"] = histogram(
                item["row_center_count"] for item in provenance
            )
            section["row_equalities_per_center"] = histogram(
                item["row_equalities_per_center"] for item in provenance
            )
            section["kalmanson_count"] = histogram(
                item["constraint_counts"].get("kal1", 0)
                + item["constraint_counts"].get("kal2", 0)
                for item in provenance
            )
            section["kal1_count"] = histogram(
                item["constraint_counts"].get("kal1", 0) for item in provenance
            )
            section["kal2_count"] = histogram(
                item["constraint_counts"].get("kal2", 0) for item in provenance
            )
            section["max_adjacent_pair_ladder_width"] = histogram(
                item["max_adjacent_pair_ladder_width"] for item in provenance
            )
            section["only_kalmanson_and_rows"] = histogram(
                item["has_only_kalmanson_and_rows"] for item in provenance
            )
        by_kind[kind] = section

    outputs = []
    for source in bank["sources"]:
        path = Path(source["path"])
        if not path.name.endswith(".json") or "portfolio_round" not in str(path):
            continue
        payload = json.loads(path.read_text(encoding="utf-8"))
        outputs.append(
            {
                "n": payload["n"],
                "second_apex": payload["omitted_apices"][1],
                "seed": payload["random_seed"],
                "status": payload["status"],
                "reason": payload.get("reason"),
                "attempt_count": payload["attempt_count"],
                "new_refinement_count": payload["refinement_count"],
                "full_linear_core_count": payload["full_linear_core_count"],
            }
        )

    result = {
        "bank_schema": bank["schema"],
        "schema_count": len(schemas),
        "provenance_count": len(provenance_records),
        "core_vertex_count": histogram(item["core_vertex_count"] for item in records),
        "kind_overlap_count": sum(1 for item in records if len(item["kinds"]) > 1),
        "abstract_incidence_signature_count": len(
            {item["incidence_signature"] for item in records}
        ),
        "by_kind": by_kind,
        "bounded_outputs": outputs,
        "bounded_status": histogram(item["status"] for item in outputs),
        "bounded_reason": histogram(item["reason"] for item in outputs),
    }
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    else:
        print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

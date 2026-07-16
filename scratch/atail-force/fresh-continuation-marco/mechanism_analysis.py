#!/usr/bin/env python3
"""Compare confirmed UNIT frontiers for common abstract mechanisms."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import Counter, defaultdict, deque
from pathlib import Path
from typing import Any, Iterable, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SOURCE = HERE / "frontier_checkpoint.json"
OUTPUT = HERE / "mechanism_checkpoint.json"

Row = tuple[int, frozenset[int]]


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def decode_rows(records: Sequence[dict[str, Any]]) -> tuple[Row, ...]:
    return tuple(
        sorted(
            (
                int(record["center"]),
                frozenset(int(point) for point in record["support"]),
            )
            for record in records
        )
    )


def components(vertices: Iterable[int], edges: Iterable[tuple[int, int]]) -> list[set[int]]:
    adjacency: dict[int, set[int]] = {vertex: set() for vertex in vertices}
    for left, right in edges:
        adjacency.setdefault(left, set()).add(right)
        adjacency.setdefault(right, set()).add(left)
    unseen = set(adjacency)
    output = []
    while unseen:
        start = min(unseen)
        reached = {start}
        queue = deque([start])
        unseen.remove(start)
        while queue:
            vertex = queue.popleft()
            for target in adjacency[vertex]:
                if target in unseen:
                    unseen.remove(target)
                    reached.add(target)
                    queue.append(target)
        output.append(reached)
    return output


def directed_scc_sizes(vertices: Iterable[int], edges: Iterable[tuple[int, int]]) -> list[int]:
    vertices = tuple(sorted(set(vertices)))
    adjacency = {vertex: set() for vertex in vertices}
    reverse = {vertex: set() for vertex in vertices}
    for left, right in edges:
        if left in adjacency and right in adjacency:
            adjacency[left].add(right)
            reverse[right].add(left)

    seen: set[int] = set()
    order: list[int] = []

    def visit(vertex: int) -> None:
        if vertex in seen:
            return
        seen.add(vertex)
        for target in adjacency[vertex]:
            visit(target)
        order.append(vertex)

    for vertex in vertices:
        visit(vertex)
    seen.clear()
    sizes = []

    def collect(vertex: int) -> int:
        if vertex in seen:
            return 0
        seen.add(vertex)
        return 1 + sum(collect(target) for target in reverse[vertex])

    for vertex in reversed(order):
        if vertex not in seen:
            sizes.append(collect(vertex))
    return sorted(sizes, reverse=True)


def establishes_equilateral_anchor(rows: Sequence[Row]) -> bool:
    apex_rows = {center: support for center, support in rows if center in {0, 1, 2}}
    if len(apex_rows) != 2:
        return False
    for center, support in apex_rows.items():
        if not ({0, 1, 2} - {center}) <= support:
            return False
    return True


def subset_density(rows: Sequence[Row]) -> dict[str, Any]:
    records = []
    for size in range(1, len(rows) + 1):
        for indices in itertools.combinations(range(len(rows)), size):
            selected = [rows[index] for index in indices]
            used = {
                point
                for center, support in selected
                for point in (center, *support)
            }
            # Equal-distance constraints are invariant under the four-dimensional
            # planar similarity group (two translations, rotation, scaling).
            excess = 3 * size - (2 * len(used) - 4)
            records.append((excess, size, len(used), indices))
    maximum = max(records)
    positive = [record for record in records if record[0] > 0]
    minimal_positive_size = min((record[1] for record in positive), default=None)
    return {
        "whole_packet_similarity_count_excess": (
            3 * len(rows)
            - (2 * len({p for c, s in rows for p in (c, *s)}) - 4)
        ),
        "maximum_subset_similarity_count_excess": maximum[0],
        "minimal_positive_excess_subset_row_count": minimal_positive_size,
        "counting_is_only_generic_dimension_heuristic": True,
    }


def analyze_frontier(record: dict[str, Any]) -> dict[str, Any]:
    rows = decode_rows(record["rows"])
    centers = {center for center, _support in rows}
    used = {point for center, support in rows for point in (center, *support)}
    directed_edges = {
        (center, point)
        for center, support in rows
        for point in support
        if point in centers
    }
    mutual_edges = {
        tuple(sorted((left, right)))
        for left, right in directed_edges
        if (right, left) in directed_edges and left != right
    }
    row_intersection_edges = []
    intersection_histogram: Counter[int] = Counter()
    for (left, left_support), (right, right_support) in itertools.combinations(rows, 2):
        overlap = len(left_support & right_support)
        intersection_histogram[overlap] += 1
        if overlap >= 2:
            row_intersection_edges.append((left, right))
    row_components = components(centers, row_intersection_edges)
    pair_centers: dict[tuple[int, int], list[int]] = defaultdict(list)
    for center, support in rows:
        for pair in itertools.combinations(sorted(support), 2):
            pair_centers[pair].append(center)
    repeated_pairs = {
        pair: centers_for_pair
        for pair, centers_for_pair in pair_centers.items()
        if len(centers_for_pair) >= 2
    }
    return {
        "shard_index": int(record["shard_index"]),
        "row_count": len(rows),
        "used_point_count": len(used),
        "center_count": len(centers),
        "apex_row_centers": sorted(centers & {0, 1, 2}),
        "exactly_two_apex_rows": len(centers & {0, 1, 2}) == 2,
        "two_apex_rows_establish_equilateral_anchor": establishes_equilateral_anchor(rows),
        "active_center_directed_incidence_edge_count": len(directed_edges),
        "active_center_mutual_incidence_pair_count": len(mutual_edges),
        "active_center_scc_sizes": directed_scc_sizes(centers, directed_edges),
        "row_support_intersection_histogram": {
            str(key): value for key, value in sorted(intersection_histogram.items())
        },
        "row_shared_pair_graph_component_sizes": sorted(
            (len(component) for component in row_components), reverse=True
        ),
        "row_shared_pair_graph_cycle_rank": (
            len(row_intersection_edges) - len(centers) + len(row_components)
        ),
        "support_pairs_repeated_at_two_or_more_centers": len(repeated_pairs),
        "maximum_support_pair_center_multiplicity": max(
            (len(value) for value in pair_centers.values()), default=0
        ),
        "density": subset_density(rows),
    }


def build_document() -> dict[str, Any]:
    source = json.loads(SOURCE.read_text(encoding="utf-8"))
    by_shard: dict[int, dict[str, Any]] = {}
    for record in source["frontiers"]:
        shard = int(record["shard_index"])
        current = by_shard.get(shard)
        if current is None or (record["row_count"], record["row_keys"]) < (
            current["row_count"], current["row_keys"]
        ):
            by_shard[shard] = record
    cases = [analyze_frontier(by_shard[shard]) for shard in sorted(by_shard)]
    return {
        "schema": "p97-atail-fresh-continuation-mechanism-audit-v1",
        "source": {
            "path": str(SOURCE.relative_to(ROOT)),
            "sha256": file_sha256(SOURCE),
            "smallest_frontier_count": len(cases),
        },
        "summary": {
            "all_use_all_twelve_points": all(
                case["used_point_count"] == 12 for case in cases
            ),
            "all_contain_exactly_two_apex_rows": all(
                case["exactly_two_apex_rows"] for case in cases
            ),
            "all_two_apex_pairs_establish_equilateral_anchor": all(
                case["two_apex_rows_establish_equilateral_anchor"] for case in cases
            ),
            "all_are_similarity_count_overdetermined": all(
                case["density"]["whole_packet_similarity_count_excess"] > 0
                for case in cases
            ),
            "whole_packet_similarity_count_excesses": [
                case["density"]["whole_packet_similarity_count_excess"]
                for case in cases
            ],
            "all_row_shared_pair_graphs_connected": all(
                case["row_shared_pair_graph_component_sizes"] == [case["row_count"]]
                for case in cases
            ),
            "all_active_center_incidence_graphs_strongly_connected": all(
                case["active_center_scc_sizes"] == [case["center_count"]]
                for case in cases
            ),
            "all_have_repeated_support_pairs": all(
                case["support_pairs_repeated_at_two_or_more_centers"] > 0
                for case in cases
            ),
            "all_pair_center_multiplicities_at_most_two": all(
                case["maximum_support_pair_center_multiplicity"] <= 2
                for case in cases
            ),
        },
        "cases": cases,
        "theorem_shape_assessment": {
            "common_exact_input_shape": (
                "two selected four-rows on two vertices of an equilateral anchor "
                "triangle, plus five to seven further selected four-rows on the "
                "same twelve-point carrier"
            ),
            "common_counting_shape": (
                "each selected four-row contributes three equal-distance equations; "
                "the 7--9 row packets have 21--27 equations against 20 planar "
                "similarity-normalized coordinate degrees of freedom"
            ),
            "status": "HEURISTIC_PARAMETERIZED_FAMILY_NOT_A_THEOREM",
            "why_not_immediate": (
                "generic dimension excess neither proves emptiness nor supplies the "
                "specific anonymous support memberships from the live K-A packet; "
                "the ten confirmed frontiers are pairwise nonisomorphic and no "
                "current formalized bank matcher recognizes them"
            ),
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    document = build_document()
    if args.check:
        saved = json.loads(OUTPUT.read_text(encoding="utf-8"))
        if document != saved:
            raise AssertionError("mechanism analysis drift")
    else:
        OUTPUT.write_text(
            json.dumps(document, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
    print(json.dumps(document["summary"], sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

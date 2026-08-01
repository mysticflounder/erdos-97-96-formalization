#!/usr/bin/env python3
"""Verify the finite obstruction to a K-A -> Fishburn-Reeds bridge.

This checks an edge-coloured incidence abstraction.  It is deliberately not
a Euclidean realization and does not claim to satisfy CounterexampleData.
"""

from __future__ import annotations

import json
from collections import defaultdict
from pathlib import Path


MODEL_PATH = Path(__file__).with_name("model.json")


def cyclically_contiguous(order: list[int], subset: set[int]) -> bool:
    if not subset or len(subset) == len(order):
        return True
    entries = sum(
        order[i] not in subset and order[(i + 1) % len(order)] in subset
        for i in range(len(order))
    )
    return entries == 1


def k_core_vertices(
    vertices: set[int], edges: set[tuple[int, int]], k: int
) -> set[int]:
    live = set(vertices)
    changed = True
    while changed:
        changed = False
        degree = {v: 0 for v in live}
        for u, v in edges:
            if u in live and v in live:
                degree[u] += 1
                degree[v] += 1
        remove = {v for v, d in degree.items() if d < k}
        if remove:
            live -= remove
            changed = True
    return live


def has_min_degree_k_vertex_subset(
    vertices: set[int], edges: set[tuple[int, int]], k: int
) -> bool:
    """Directly enumerate induced vertex subsets as a check on the k-core."""
    ordered = sorted(vertices)
    for mask in range(1, 1 << len(ordered)):
        chosen = {
            ordered[i]
            for i in range(len(ordered))
            if mask & (1 << i)
        }
        if len(chosen) <= k:
            continue
        degree = {v: 0 for v in chosen}
        for u, v in edges:
            if u in chosen and v in chosen:
                degree[u] += 1
                degree[v] += 1
        if all(value >= k for value in degree.values()):
            return True
    return False


def main() -> None:
    data = json.loads(MODEL_PATH.read_text())
    n = data["vertices"]
    vertices = set(range(n))
    order = data["cyclic_order"]
    apices = set(data["apices"])
    assert set(order) == vertices and len(order) == n

    caps = [set(cap) for cap in data["caps"]]
    assert all(len(cap) == 6 for cap in caps)
    assert all(cyclically_contiguous(order, cap) for cap in caps)
    assert set().union(*caps) == vertices
    cap_multiplicity = {
        v: sum(v in cap for cap in caps)
        for v in vertices
    }
    assert all(cap_multiplicity[v] == 2 for v in apices)
    assert all(cap_multiplicity[v] == 1 for v in vertices - apices)

    rows = {row["name"]: row for row in data["rows"]}
    assert len(rows) == len(data["rows"])
    edge_to_radius: dict[tuple[int, int], str] = {}
    for row in rows.values():
        center = row["center"]
        neighbors = set(row["neighbors"])
        assert center in vertices
        assert len(neighbors) == 4
        assert neighbors <= vertices
        assert center not in neighbors
        for neighbor in neighbors:
            edge = tuple(sorted((center, neighbor)))
            old = edge_to_radius.setdefault(edge, row["radius"])
            assert old == row["radius"], (
                f"edge {edge} receives incompatible radii {old} and "
                f"{row['radius']}"
            )

    # Every otherwise unconstrained distance is made unique.  Hence the rows
    # above are exactly the only distance classes of cardinality at least four.
    for u in range(n):
        for v in range(u + 1, n):
            edge_to_radius.setdefault((u, v), f"singleton_{u}_{v}")

    classes: dict[tuple[int, str], set[int]] = defaultdict(set)
    radius_edges: dict[str, set[tuple[int, int]]] = defaultdict(set)
    for (u, v), radius in edge_to_radius.items():
        classes[(u, radius)].add(v)
        classes[(v, radius)].add(u)
        radius_edges[radius].add((u, v))

    for row in rows.values():
        assert classes[(row["center"], row["radius"])] == set(row["neighbors"])

    rich_by_apex: dict[int, list[dict]] = defaultdict(list)
    critical_by_center: dict[int, dict] = {}
    for row in rows.values():
        if row["kind"] == "rich":
            rich_by_apex[row["center"]].append(row)
        elif row["kind"] == "critical":
            assert row["center"] not in critical_by_center
            critical_by_center[row["center"]] = row
        else:
            raise AssertionError(f"unknown row kind {row['kind']}")

    assert set(rich_by_apex) == apices
    for apex, rich_rows in rich_by_apex.items():
        assert len(rich_rows) == 2
        assert rich_rows[0]["radius"] != rich_rows[1]["radius"]
        assert set(rich_rows[0]["neighbors"]).isdisjoint(
            rich_rows[1]["neighbors"]
        )

    not_robust = set(data["not_robust_centers"])
    assert set(critical_by_center) == not_robust
    critical_cover = set().union(
        *(set(row["neighbors"]) for row in critical_by_center.values())
    )
    assert critical_cover == vertices
    assert n <= 4 * len(not_robust)

    blocker_of = {int(q): b for q, b in data["blocker_of"].items()}
    assert set(blocker_of) == vertices
    for q, blocker in blocker_of.items():
        row = critical_by_center[blocker]
        assert blocker != q
        assert q in row["neighbors"]
        # Deleting q destroys every four-neighbour class at its blocker.
        assert all(
            len(neighbors - {q}) < 4
            for (center, _), neighbors in classes.items()
            if center == blocker
        )

    # Distinct-circle intersection bound at the retained row abstraction.
    row_values = list(rows.values())
    max_overlap = 0
    for i, left in enumerate(row_values):
        for right in row_values[i + 1 :]:
            if left["center"] == right["center"]:
                continue
            overlap = len(set(left["neighbors"]) & set(right["neighbors"]))
            max_overlap = max(max_overlap, overlap)
            assert overlap <= 2

    for packet in data["common_deletion_packets"]:
        q = packet["deleted"]
        left, right = (rows[name] for name in packet["rows"])
        assert [left["center"], right["center"]] == packet["centers"]
        assert left["center"] != right["center"]
        assert blocker_of[q] not in packet["centers"]
        assert q not in left["neighbors"]
        assert q not in right["neighbors"]
        assert len(set(left["neighbors"]) & set(right["neighbors"])) <= 2

    # No retained radius at any center contains all three Moser apices.
    assert all(
        not apices <= neighbors
        for (_, _), neighbors in classes.items()
    )

    # A graph has a subgraph of minimum degree >= 3 iff its 3-core is
    # nonempty.  Every global distance colour here has empty 3-core, so no
    # bipartite subcut can satisfy the Fishburn-Reeds degree antecedent,
    # regardless of cyclic placement.
    nonempty_three_cores = {
        radius: sorted(k_core_vertices(vertices, edges, 3))
        for radius, edges in radius_edges.items()
        if k_core_vertices(vertices, edges, 3)
    }
    assert not nonempty_three_cores

    nontrivial_radii = {
        radius: edges
        for radius, edges in radius_edges.items()
        if len(edges) > 1
    }
    dense_subset_radii = {
        radius
        for radius, edges in nontrivial_radii.items()
        if has_min_degree_k_vertex_subset(vertices, edges, 3)
    }
    assert not dense_subset_radii

    print(
        json.dumps(
            {
                "status": "VERIFIED-ABSTRACT-COUNTERMODEL",
                "vertices": n,
                "cap_sizes": [len(cap) for cap in caps],
                "critical_cover_size": len(critical_cover),
                "rich_rows": sum(len(value) for value in rich_by_apex.values()),
                "critical_rows": len(critical_by_center),
                "common_deletion_packets": len(data["common_deletion_packets"]),
                "max_distinct_center_row_overlap": max_overlap,
                "nontrivial_global_radii": len(nontrivial_radii),
                "nonempty_fixed_radius_3_cores": 0,
                "dense_fixed_radius_vertex_subsets": 0,
                "exhaustive_vertex_subsets_checked":
                    len(nontrivial_radii) * ((1 << n) - 1),
            },
            indent=2,
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()

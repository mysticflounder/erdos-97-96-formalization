#!/usr/bin/env python3
"""Find extension-stable planar obstruction cores in a whole-carrier row table.

The input is one solver checkpoint with a ``rows`` map.  A selected row at
center ``c`` says that all unordered distance terms ``{c,s}``, for ``s`` in
the support, are equal.  Equality is closed across rows before matching the
six-role auxiliary base-collision graph.

This is deliberately a theorem-bank oracle, not an NLSAT verdict.  A match is
source-faithful because every equality in the emitted certificate is replayed
as a path of actual selected-row equalities.  The matched graph is impossible
for six injectively labelled points in the Euclidean plane by
``Problem97.u5_qcritical_aux_base_collision_metric_incompatibility``.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import defaultdict, deque
from pathlib import Path


Edge = tuple[int, int]


def edge(left: int, right: int) -> Edge:
    if left == right:
        raise ValueError("distance edge must have distinct endpoints")
    return tuple(sorted((left, right)))


def stable_digest(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


class UnionFind:
    def __init__(self) -> None:
        self.parent: dict[Edge, Edge] = {}

    def add(self, item: Edge) -> None:
        self.parent.setdefault(item, item)

    def find(self, item: Edge) -> Edge:
        self.add(item)
        root = item
        while self.parent[root] != root:
            root = self.parent[root]
        while self.parent[item] != item:
            parent = self.parent[item]
            self.parent[item] = root
            item = parent
        return root

    def union(self, left: Edge, right: Edge) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[right_root] = left_root


def row_edges(center: int, support: list[int]) -> list[Edge]:
    return [edge(center, point) for point in support]


def equality_graph(
    rows: dict[int, list[int]], enabled_centers: set[int] | None = None
) -> tuple[UnionFind, dict[Edge, list[tuple[Edge, int]]]]:
    uf = UnionFind()
    graph: dict[Edge, list[tuple[Edge, int]]] = defaultdict(list)
    for center, support in rows.items():
        if enabled_centers is not None and center not in enabled_centers:
            continue
        terms = row_edges(center, support)
        for term in terms:
            uf.add(term)
        if not terms:
            continue
        anchor = terms[0]
        for term in terms[1:]:
            uf.union(anchor, term)
            graph[anchor].append((term, center))
            graph[term].append((anchor, center))
    return uf, graph


PATTERN_EDGES: dict[str, tuple[str, str]] = {
    "p_q": ("p", "q"),
    "p_t1": ("p", "t1"),
    "p_t2": ("p", "t2"),
    "p_t3": ("p", "t3"),
    "t1_q": ("t1", "q"),
    "t1_t2": ("t1", "t2"),
    "t2_t3": ("t2", "t3"),
    "t3_x": ("t3", "x"),
    "x_q": ("x", "q"),
}


def role_edges(roles: dict[str, int]) -> dict[str, Edge]:
    return {
        name: edge(roles[left], roles[right])
        for name, (left, right) in PATTERN_EDGES.items()
    }


def match_roles(n: int, uf: UnionFind) -> list[dict[str, int]]:
    names = ("p", "q", "t1", "t2", "t3", "x")
    matches: list[dict[str, int]] = []
    for values in itertools.permutations(range(n), len(names)):
        roles = dict(zip(names, values, strict=True))
        terms = list(role_edges(roles).values())
        if all(uf.find(term) == uf.find(terms[0]) for term in terms[1:]):
            matches.append(roles)
    return matches


def shortest_path(
    graph: dict[Edge, list[tuple[Edge, int]]], start: Edge, target: Edge
) -> list[dict[str, object]]:
    queue = deque([start])
    previous: dict[Edge, tuple[Edge, int] | None] = {start: None}
    while queue:
        current = queue.popleft()
        if current == target:
            break
        for neighbor, center in graph[current]:
            if neighbor not in previous:
                previous[neighbor] = (current, center)
                queue.append(neighbor)
    if target not in previous:
        raise RuntimeError(f"no equality path from {start} to {target}")
    steps: list[dict[str, object]] = []
    current = target
    while current != start:
        predecessor = previous[current]
        if predecessor is None:
            raise AssertionError("non-start vertex has no predecessor")
        prior, center = predecessor
        steps.append({"from": list(prior), "to": list(current), "row_center": center})
        current = prior
    steps.reverse()
    return steps


def minimum_row_core(rows: dict[int, list[int]], required: list[Edge]) -> list[int]:
    centers = sorted(rows)
    for size in range(1, len(centers) + 1):
        for subset in itertools.combinations(centers, size):
            uf, _ = equality_graph(rows, set(subset))
            if all(uf.find(term) == uf.find(required[0]) for term in required[1:]):
                return list(subset)
    raise RuntimeError("full row set matched but no row core was found")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()

    payload = json.loads(args.input.read_text(encoding="utf-8"))
    n = int(payload["n"])
    rows = {int(center): list(map(int, support)) for center, support in payload["rows"].items()}
    if set(rows) != set(range(n)):
        raise ValueError("oracle requires one selected row at every carrier label")
    if any(len(support) != 4 for support in rows.values()):
        raise ValueError("every selected row must have exactly four support labels")
    for center, support in rows.items():
        if center in support or len(set(support)) != 4:
            raise ValueError(f"malformed selected row at center {center}")

    uf, graph = equality_graph(rows)
    matches = match_roles(n, uf)
    if not matches:
        result = {
            "schema": "p97-whole-carrier-planar-bank-oracle-v1",
            "status": "NO_BANK_MATCH",
            "source": str(args.input),
            "source_digest": stable_digest(payload),
            "n": n,
            "match_count": 0,
            "claim_scope": "No auxiliary base-collision match; planar realizability is unresolved.",
        }
    else:
        chosen = min(matches, key=lambda item: tuple(item[name] for name in sorted(item)))
        required_by_name = role_edges(chosen)
        required = list(required_by_name.values())
        row_core = minimum_row_core(rows, required)
        _, core_graph = equality_graph(rows, set(row_core))
        radius_term = required_by_name["p_q"]
        paths = {
            name: shortest_path(core_graph, radius_term, term)
            for name, term in required_by_name.items()
        }
        result = {
            "schema": "p97-whole-carrier-planar-bank-oracle-v1",
            "status": "UNSAT_BY_KERNEL_CHECKED_PLANAR_BANK_CONSUMER",
            "epistemic_status": "EXACT_ROW_REPLAY_PLUS_KERNEL_CHECKED_CONSUMER",
            "source": str(args.input),
            "source_digest": stable_digest(payload),
            "n": n,
            "match_count": len(matches),
            "roles": chosen,
            "active_roles": sorted(chosen.values()),
            "required_distance_terms": {
                name: list(term) for name, term in required_by_name.items()
            },
            "minimum_row_core": row_core,
            "minimum_row_core_size": len(row_core),
            "equality_paths_from_p_q": paths,
            "consumer": "Problem97.u5_qcritical_aux_base_collision_metric_incompatibility",
            "consumer_source": (
                "scratch/atail-force/aux-base-collision-port/AuxBaseCollisionPort.lean"
            ),
            "extension_stable": True,
            "kalmanson_used": False,
            "exported_distances_used": False,
            "claim_scope": (
                "The fixed selected-row equality cell has no injective planar realization. "
                "This is one-table closure, not arbitrary-cardinality source coverage."
            ),
        }

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

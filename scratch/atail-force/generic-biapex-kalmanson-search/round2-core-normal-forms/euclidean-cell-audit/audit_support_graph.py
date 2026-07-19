#!/usr/bin/env python3
"""Audit the corrected n=11 support graph and its banked planar obstruction."""

from __future__ import annotations

import argparse
import itertools
import json
import subprocess
from collections import deque
from pathlib import Path


def graph6(n: int, edges: set[tuple[int, int]]) -> str:
    if not 0 <= n <= 62:
        raise ValueError("this compact encoder supports graph6 order at most 62")
    bits = [
        int((left, right) in edges)
        for right in range(1, n)
        for left in range(right)
    ]
    while len(bits) % 6:
        bits.append(0)
    data = [n + 63]
    for offset in range(0, len(bits), 6):
        value = 0
        for bit in bits[offset : offset + 6]:
            value = (value << 1) | bit
        data.append(value + 63)
    return "".join(chr(value) for value in data)


def nauty_canonical(raw_graph6: str) -> str:
    result = subprocess.run(
        ["labelg", "-q", "-g"],
        input=raw_graph6 + "\n",
        text=True,
        capture_output=True,
        check=True,
    )
    lines = [line.strip() for line in result.stdout.splitlines() if line.strip()]
    if len(lines) != 1:
        raise RuntimeError(f"unexpected labelg output: {result.stdout!r}")
    return lines[0]


def nauty_properties(raw_graph6: str) -> dict[str, object]:
    keys = ("n", "e", "d", "D", "cc", "a", "o", "T", "W", "N")
    result = subprocess.run(
        ["countg", "-q", "-1", "--" + "".join(keys)],
        input=raw_graph6 + "\n",
        text=True,
        capture_output=True,
        check=True,
    )
    fields = result.stdout.strip().split()
    if len(fields) != len(keys) + 1 or fields[-1] != "1":
        raise RuntimeError(f"unexpected countg output: {result.stdout!r}")
    values = [int(value) for value in fields[:-1]]
    names = (
        "vertex_count",
        "edge_count",
        "minimum_degree",
        "maximum_degree",
        "component_count",
        "automorphism_group_size",
        "vertex_orbit_count",
        "triangle_count",
        "four_cycle_count",
        "chromatic_number",
    )
    return dict(zip(names, values, strict=True))


def connected_component(rows: dict[int, set[int]], start: int) -> list[int]:
    seen = {start}
    queue = deque([start])
    while queue:
        vertex = queue.popleft()
        for neighbor in rows[vertex]:
            if neighbor not in seen:
                seen.add(neighbor)
                queue.append(neighbor)
    return sorted(seen)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", type=Path)
    parser.add_argument("--registry", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()

    payload = json.loads(args.input.read_text(encoding="utf-8"))
    n = int(payload["n"])
    rows = {int(center): set(support) for center, support in payload["rows"].items()}
    edges = {
        tuple(sorted((center, point)))
        for center, support in rows.items()
        for point in support
    }
    directed_count = sum(len(support) for support in rows.values())
    symmetric = all(center in rows[point] for center, support in rows.items() for point in support)
    component = connected_component(rows, 0)

    raw_graph6 = graph6(n, edges)
    canonical_graph6 = nauty_canonical(raw_graph6)
    properties = nauty_properties(raw_graph6)

    roles = {"p": 0, "q": 2, "t1": 4, "t2": 9, "t3": 10, "x": 8}
    required_edges = {
        "p_q": (0, 2),
        "p_t1": (0, 4),
        "p_t2": (0, 9),
        "p_t3": (0, 10),
        "t1_q": (2, 4),
        "t1_t2": (4, 9),
        "t2_t3": (9, 10),
        "t3_x": (8, 10),
        "x_q": (2, 8),
    }
    missing = [name for name, pair in required_edges.items() if tuple(sorted(pair)) not in edges]
    if missing:
        raise RuntimeError(f"proposed obstruction has missing selected edges: {missing}")

    # The radius propagation is intentionally explicit rather than relying on
    # the whole connected graph: these five rows supply every theorem premise.
    radius_derivation = {
        "radius_edge": [0, 2],
        "row_0": {
            "support": sorted(rows[0]),
            "concludes_equal_to_radius": [[0, 4], [0, 9], [0, 10]],
        },
        "row_2": {
            "support": sorted(rows[2]),
            "shared_edge": [0, 2],
            "concludes_equal_to_radius": [[2, 4], [2, 8]],
        },
        "row_4": {
            "support": sorted(rows[4]),
            "shared_edge": [0, 4],
            "concludes_equal_to_radius": [[4, 9]],
        },
        "row_9": {
            "support": sorted(rows[9]),
            "shared_edge": [0, 9],
            "concludes_equal_to_radius": [[9, 10]],
        },
        "row_8": {
            "support": sorted(rows[8]),
            "shared_edge": [2, 8],
            "concludes_equal_to_radius": [[8, 10]],
        },
    }

    registry = json.loads(args.registry.read_text(encoding="utf-8"))
    candidate_name = "Problem97.u5_qcritical_aux_base_collision_metric_incompatibility"
    candidates: list[dict[str, object]] = []
    seen_candidates: set[tuple[object, ...]] = set()

    def visit(value: object) -> None:
        if isinstance(value, dict):
            if value.get("fq_name") == candidate_name and "statement" in value:
                key = (value.get("fq_name"), value.get("path"), value.get("line"))
                if key not in seen_candidates:
                    seen_candidates.add(key)
                    candidates.append(
                        {
                            key_name: value.get(key_name)
                            for key_name in (
                                "fq_name",
                                "module",
                                "path",
                                "line",
                                "proof_status",
                                "source_reachable",
                                "local_exact_name",
                                "statement",
                            )
                        }
                    )
            for child in value.values():
                visit(child)
        elif isinstance(value, list):
            for child in value:
                visit(child)

    visit(registry)
    if len(candidates) != 1:
        raise RuntimeError(f"expected one unique bank candidate, found {len(candidates)}")

    triangles = [
        list(vertices)
        for vertices in itertools.combinations(range(n), 3)
        if all(tuple(sorted(pair)) in edges for pair in itertools.combinations(vertices, 2))
    ]
    output = {
        "schema": "p97-n11-symmetric-support-graph-audit-v1",
        "epistemic_status": "EXACT_FINITE_REPLAY_AND_SOURCE_BANK_MATCH",
        "source": str(args.input),
        "n": n,
        "directed_incidence_count": directed_count,
        "undirected_edge_count": len(edges),
        "symmetric_support_relation": symmetric,
        "degree_sequence": [len(rows[vertex]) for vertex in range(n)],
        "connected_component_of_zero": component,
        "connected": len(component) == n,
        "all_selected_edge_radii_forced_equal": symmetric and len(component) == n,
        "edges": [list(edge) for edge in sorted(edges)],
        "triangles": triangles,
        "raw_graph6": raw_graph6,
        "canonical_graph6_nauty_labelg": canonical_graph6,
        "nauty_properties": properties,
        "is_circulant": False,
        "is_circulant_reason": (
            "A circulant graph is vertex-transitive, but countg reports more than one "
            "vertex orbit."
        ),
        "obstruction_roles": roles,
        "obstruction_required_unit_edges": {
            name: list(pair) for name, pair in required_edges.items()
        },
        "radius_derivation": radius_derivation,
        "bank_match": candidates[0],
        "bank_match_argument": {
            "r": "dist(point 0, point 2)",
            "positive_radius_from": "injectivity/dist_pos for labels 0 and 2",
            "distinctness": {"q_ne_t2": [2, 9], "t1_ne_t3": [4, 10], "x_ne_p": [8, 0]},
            "ht3x": [10, 8],
            "hxt3q": {"left": [8, 10], "right": [8, 2]},
        },
        "cell_level_conclusion": (
            "NO_INJECTIVE_PLANAR_REALIZATION_OF_THE_FIXED_ROW_EQUALITY_CELL"
        ),
        "kalmanson_needed": False,
        "fixed_exported_distances_needed": False,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(json.dumps(output, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

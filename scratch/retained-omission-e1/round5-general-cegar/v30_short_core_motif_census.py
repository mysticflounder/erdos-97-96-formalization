# /// script
# dependencies = ["networkx==3.5"]
# ///
"""Group short v30 projected cores by order-preserving incidence isomorphism.

The input must be a hash-validated report from
``v30_projected_core_census.py``.  This script forgets carrier labels while
retaining the full cyclic carrier order (up to its dihedral symmetries), the
apex/interior distinction, literal families, truth values, directed endpoint
roles, rich-shell centers, and critical-row centers.  A group is a
theorem-mining hint only: the originating case formulas differ, so isomorphic
cores are not themselves transportable learned clauses.
"""

from __future__ import annotations

import argparse
import json
import re
from collections import Counter
from pathlib import Path
from typing import Any

import networkx as nx
from networkx.algorithms import isomorphism

K4_RE = re.compile(r"k4_(\d+)_(\d+)\Z")
BLOCK_RE = re.compile(r"block_(\d+)_(\d+)\Z")
ROW_RE = re.compile(r"critical_row_(\d+)_(\d+)\Z")
RICH_RE = re.compile(r"rich_(\d+)_(\d+)_(\d+)\Z")
PACKET_RE = re.compile(r"(fresh|oriented)_B1_(\d+)\Z")
CYCLIC_ORDER = (13, 0, 1, 2, 3, 14, 4, 5, 6, 7, 12, 8, 9, 10, 11)
APICES = frozenset({12, 13, 14})


def add_node(graph: nx.Graph, node: str, color: str) -> str:
    graph.add_node(node, color=color)
    return node


def point(graph: nx.Graph, label: int) -> str:
    role = "apex" if label in APICES else "interior"
    return add_node(graph, f"point:{label}", f"point:{role}")


def add_carrier_order(graph: nx.Graph) -> None:
    """Add the exact-15 carrier cycle, allowing rotations and reversal only."""
    nodes = [point(graph, label) for label in CYCLIC_ORDER]
    for left, right in zip(nodes, nodes[1:] + nodes[:1], strict=True):
        graph.add_edge(left, right)


def shell(graph: nx.Graph, family: str, identity: str) -> str:
    return add_node(graph, f"shell:{family}:{identity}", f"shell:{family}")


def attach_center(graph: nx.Graph, shell_node: str, center_node: str) -> None:
    link = add_node(graph, f"center-link:{shell_node}", "center-link")
    graph.add_edge(link, shell_node)
    graph.add_edge(link, center_node)


def add_literal(
    graph: nx.Graph,
    index: int,
    family: str,
    value: bool,
    endpoints: list[tuple[str, str]],
) -> None:
    literal = add_node(
        graph,
        f"literal:{index}",
        f"literal:{family}:{str(value).lower()}",
    )
    for role, endpoint in endpoints:
        role_node = add_node(graph, f"role:{index}:{role}", f"role:{role}")
        graph.add_edge(literal, role_node)
        graph.add_edge(role_node, endpoint)


def graph_for_core(core: list[dict[str, Any]]) -> nx.Graph:
    graph = nx.Graph()
    add_carrier_order(graph)
    centered_shells: set[str] = set()
    for index, item in enumerate(core):
        name = item.get("bool")
        value = item.get("value")
        if not isinstance(name, str) or not isinstance(value, bool):
            raise TypeError("core literal must have string bool and Boolean value")
        if match := K4_RE.fullmatch(name):
            source, target = map(int, match.groups())
            add_literal(
                graph,
                index,
                "k4",
                value,
                [("source", point(graph, source)), ("target", point(graph, target))],
            )
        elif match := BLOCK_RE.fullmatch(name):
            source, center = map(int, match.groups())
            add_literal(
                graph,
                index,
                "block",
                value,
                [("source", point(graph, source)), ("center", point(graph, center))],
            )
        elif match := ROW_RE.fullmatch(name):
            center, target = map(int, match.groups())
            row_shell = shell(graph, "critical-row", str(center))
            if row_shell not in centered_shells:
                attach_center(graph, row_shell, point(graph, center))
                centered_shells.add(row_shell)
            add_literal(
                graph,
                index,
                "critical-row",
                value,
                [("shell", row_shell), ("target", point(graph, target))],
            )
        elif match := RICH_RE.fullmatch(name):
            apex_index, class_index, target = map(int, match.groups())
            rich_shell = shell(graph, "rich", f"{apex_index}:{class_index}")
            if rich_shell not in centered_shells:
                attach_center(graph, rich_shell, point(graph, 12 + apex_index))
                centered_shells.add(rich_shell)
            add_literal(
                graph,
                index,
                "rich",
                value,
                [("shell", rich_shell), ("target", point(graph, target))],
            )
        elif match := PACKET_RE.fullmatch(name):
            packet, target_text = match.groups()
            packet_shell = shell(graph, f"{packet}-B1", "B1")
            add_literal(
                graph,
                index,
                f"{packet}-B1",
                value,
                [("shell", packet_shell), ("target", point(graph, int(target_text)))],
            )
        else:
            raise ValueError(f"unsupported short-core literal: {name}")
    return graph


def exact_groups(records: list[dict[str, Any]]) -> list[dict[str, Any]]:
    node_match = isomorphism.categorical_node_match("color", "")
    buckets: dict[str, list[tuple[nx.Graph, list[dict[str, Any]]]]] = {}
    for record in records:
        core = record.get("core")
        if not isinstance(core, list):
            raise TypeError("short-core record has no core list")
        graph = graph_for_core(core)
        fingerprint = nx.weisfeiler_lehman_graph_hash(graph, node_attr="color")
        groups = buckets.setdefault(fingerprint, [])
        for representative_graph, members in groups:
            if nx.is_isomorphic(graph, representative_graph, node_match=node_match):
                members.append(record)
                break
        else:
            groups.append((graph, [record]))

    flattened = [members for groups in buckets.values() for _, members in groups]
    flattened.sort(
        key=lambda members: (
            -len(members),
            int(members[0]["size"]),
            str(members[0]["projected_core_sha256"]),
        )
    )
    result = []
    for index, members in enumerate(flattened):
        result.append(
            {
                "motif_id": f"M{index:04d}",
                "occurrences": len(members),
                "cases": sorted({str(member["case_id"]) for member in members}),
                "case_count": len({str(member["case_id"]) for member in members}),
                "size": members[0]["size"],
                "signatures": dict(
                    Counter(str(member["signature"]) for member in members).most_common()
                ),
                "projected_core_sha256s": sorted(
                    str(member["projected_core_sha256"]) for member in members
                ),
                "representative": members[0],
            }
        )
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("census", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    source = json.loads(args.census.read_text())
    if source.get("kind") != "v30_projected_core_census":
        raise ValueError("input is not a v30 projected-core census")
    records = source.get("short_cores")
    if not isinstance(records, list):
        raise TypeError("input census has no short_cores list")
    motifs = exact_groups(records)
    report = {
        "kind": "v30_short_core_ordered_motif_census",
        "claim_scope": (
            "exact graph-isomorphism grouping preserving the carrier cycle up "
            "to dihedral symmetry and apex/interior roles; discovery only, not "
            "clause transport, case closure, or P97 closure"
        ),
        "source_census": str(args.census.resolve()),
        "source_unsat_count": source.get("completed_unsat_count"),
        "short_core_count": len(records),
        "motif_count": len(motifs),
        "cross_case_motif_count": sum(motif["case_count"] > 1 for motif in motifs),
        "motif_size_distribution": dict(
            Counter(motif["occurrences"] for motif in motifs).most_common()
        ),
        "motifs": motifs,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "short_cores": report["short_core_count"],
                "motifs": report["motif_count"],
                "cross_case_motifs": report["cross_case_motif_count"],
                "output": str(args.output),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

#!/usr/bin/env python3
"""Independently replay a whole-carrier planar theorem-bank cut."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from pathlib import Path


Edge = tuple[int, int]


def edge(values: list[int] | tuple[int, int]) -> Edge:
    left, right = map(int, values)
    if left == right:
        raise ValueError("loop is not a distance term")
    return tuple(sorted((left, right)))


def digest(value: object) -> str:
    raw = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(raw).hexdigest()


def components(rows: dict[int, list[int]], enabled: set[int]) -> dict[Edge, Edge]:
    parent: dict[Edge, Edge] = {}

    def find(item: Edge) -> Edge:
        parent.setdefault(item, item)
        if parent[item] != item:
            parent[item] = find(parent[item])
        return parent[item]

    def union(left: Edge, right: Edge) -> None:
        left_root = find(left)
        right_root = find(right)
        if left_root != right_root:
            parent[right_root] = left_root

    for center in enabled:
        terms = [edge((center, point)) for point in rows[center]]
        for term in terms[1:]:
            union(terms[0], term)
    for term in list(parent):
        find(term)
    return parent


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("certificate", type=Path)
    parser.add_argument("--registry", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()

    source = json.loads(args.source.read_text(encoding="utf-8"))
    cert = json.loads(args.certificate.read_text(encoding="utf-8"))
    if cert["source_digest"] != digest(source):
        raise RuntimeError("source digest mismatch")
    if cert["status"] != "UNSAT_BY_KERNEL_CHECKED_PLANAR_BANK_CONSUMER":
        raise RuntimeError("certificate is not a positive planar bank cut")

    n = int(source["n"])
    rows = {int(center): list(map(int, support)) for center, support in source["rows"].items()}
    if sorted(rows) != list(range(n)):
        raise RuntimeError("source does not contain a whole-carrier row table")
    roles = {name: int(value) for name, value in cert["roles"].items()}
    expected_names = {"p", "q", "t1", "t2", "t3", "x"}
    if set(roles) != expected_names or len(set(roles.values())) != 6:
        raise RuntimeError("the six role labels are not injective")

    expected_terms = {
        "p_q": edge((roles["p"], roles["q"])),
        "p_t1": edge((roles["p"], roles["t1"])),
        "p_t2": edge((roles["p"], roles["t2"])),
        "p_t3": edge((roles["p"], roles["t3"])),
        "t1_q": edge((roles["t1"], roles["q"])),
        "t1_t2": edge((roles["t1"], roles["t2"])),
        "t2_t3": edge((roles["t2"], roles["t3"])),
        "t3_x": edge((roles["t3"], roles["x"])),
        "x_q": edge((roles["x"], roles["q"])),
    }
    stored_terms = {
        name: edge(value) for name, value in cert["required_distance_terms"].items()
    }
    if stored_terms != expected_terms:
        raise RuntimeError("stored distance terms do not match the theorem roles")

    core = list(map(int, cert["minimum_row_core"]))
    if len(core) != len(set(core)) or any(center not in rows for center in core):
        raise RuntimeError("malformed row core")
    radius = expected_terms["p_q"]
    for name, target in expected_terms.items():
        current = radius
        for step in cert["equality_paths_from_p_q"][name]:
            start = edge(step["from"])
            finish = edge(step["to"])
            center = int(step["row_center"])
            if start != current or center not in core:
                raise RuntimeError(f"broken equality path for {name}")
            legal = {edge((center, point)) for point in rows[center]}
            if start not in legal or finish not in legal:
                raise RuntimeError(f"path step for {name} is not one selected-row equality")
            current = finish
        if current != target:
            raise RuntimeError(f"equality path for {name} ends at the wrong distance term")

    required = list(expected_terms.values())
    closure = components(rows, set(core))

    def root(term: Edge) -> Edge:
        while closure.get(term, term) != term:
            term = closure[term]
        return term

    if not all(root(term) == root(required[0]) for term in required[1:]):
        raise RuntimeError("row core does not close all required distance equalities")
    for size in range(len(core)):
        for subset in itertools.combinations(sorted(rows), size):
            partial = components(rows, set(subset))

            def partial_root(term: Edge) -> Edge:
                while partial.get(term, term) != term:
                    term = partial[term]
                return term

            if all(partial_root(term) == partial_root(required[0]) for term in required[1:]):
                raise RuntimeError(f"a globally smaller row core exists: {subset}")

    registry = json.loads(args.registry.read_text(encoding="utf-8"))
    theorem_name = "Problem97.u5_qcritical_aux_base_collision_metric_incompatibility"
    matches: list[dict[str, object]] = []

    def visit(value: object) -> None:
        if isinstance(value, dict):
            if value.get("fq_name") == theorem_name and "statement" in value:
                matches.append(value)
            for child in value.values():
                visit(child)
        elif isinstance(value, list):
            for child in value:
                visit(child)

    visit(registry)
    unique_statements = {str(item["statement"]) for item in matches}
    if len(unique_statements) != 1:
        raise RuntimeError("the theorem registry did not yield one normalized statement")
    statement = next(iter(unique_statements))
    required_fragments = (
        "(hr : 0 < r)",
        "(hq_ne_t₂ : q ≠ t₂)",
        "(ht₁_ne_t₃ : t₁ ≠ t₃)",
        "(hx_ne_p : x ≠ p)",
        "(hxt₃q : dist x t₃ = dist x q)",
        ": False",
    )
    if any(fragment not in statement for fragment in required_fragments):
        raise RuntimeError("registered theorem statement has drifted")

    output = {
        "schema": "p97-whole-carrier-planar-bank-cut-replay-v1",
        "status": "VERIFIED_EXACT_PLANAR_BANK_CUT",
        "source_digest": cert["source_digest"],
        "active_roles": sorted(roles.values()),
        "minimum_row_core": core,
        "minimum_row_core_size": len(core),
        "all_equality_paths_replayed": True,
        "row_core_globally_minimum_for_roles": True,
        "role_map_injective": True,
        "consumer": theorem_name,
        "consumer_statement_registry_match": True,
        "extension_stable": True,
        "claim_scope": cert["claim_scope"],
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(output, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

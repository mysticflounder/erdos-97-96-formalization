#!/usr/bin/env python3
"""Find banked metric kernels missing one atomic distance equality.

This is a syntactic theorem-discovery matcher, not a proof.  It selects the
smallest crosschecked-UNIT frontier from each clean shard, computes the exact
equivalence closure of the row equalities, and searches role-aliasing maps for
each supported metric-point-uniform ``: False`` declaration.  A deficit-one
hit satisfies every parsed inequality/positivity side condition and all but
exactly one atomic distance-equality requirement.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import re
from pathlib import Path
from typing import Any, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
FRONTIERS = HERE / "frontier_checkpoint.json"
OUTPUT = HERE / "deficit_one_checkpoint.json"
REGISTRIES = (
    ROOT / "certificates/p97_rvol_general_n_mining.json",
    ROOT / "certificates/erdos97_legacy_general_n_mining.json",
    ROOT / "certificates/erdos_general_theorem_p97_mining.json",
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def edge(left: int, right: int) -> tuple[int, int]:
    return tuple(sorted((left, right)))


class UnionFind:
    def __init__(self) -> None:
        self.parent: dict[tuple[int, int], tuple[int, int]] = {}

    def find(self, item: tuple[int, int]) -> tuple[int, int]:
        self.parent.setdefault(item, item)
        if self.parent[item] != item:
            self.parent[item] = self.find(self.parent[item])
        return self.parent[item]

    def union(self, left: tuple[int, int], right: tuple[int, int]) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[right_root] = left_root


TOKEN = r"[^\s(){}:]+"
DIST_EQ_DIST = re.compile(
    rf"dist\s+({TOKEN})\s+({TOKEN})\s*=\s*dist\s+({TOKEN})\s+({TOKEN})"
)
DIST_EQ_RADIUS = re.compile(
    rf"dist\s+({TOKEN})\s+({TOKEN})\s*=\s*(?!dist\b)([A-Za-z][A-Za-z0-9_]*)"
)
POINT_BINDER = re.compile(r"\{([^{}]+?)\s*:\s*ℝ²\}")
POINT_BINDER_PAREN = re.compile(r"\(([^()]+?)\s*:\s*ℝ²\)")
POINT_NE = re.compile(rf":\s*({TOKEN})\s*≠\s*({TOKEN})\s*\)")
POS_DIST = re.compile(rf"0\s*<\s*dist\s+({TOKEN})\s+({TOKEN})")
POS_RADIUS = re.compile(r"0\s*<\s*([A-Za-z][A-Za-z0-9_]*)")


def parse(statement: str) -> dict[str, Any] | None:
    if ": False" not in statement:
        return None
    variables: list[str] = []
    for binder in [
        *POINT_BINDER.findall(statement),
        *POINT_BINDER_PAREN.findall(statement),
    ]:
        variables.extend(item for item in binder.split() if item)
    variables = list(dict.fromkeys(variables))
    if not variables:
        return None
    variable_set = set(variables)

    equality_atoms: list[dict[str, Any]] = []
    for index, match in enumerate(DIST_EQ_DIST.finditer(statement)):
        names = match.groups()
        if not set(names) <= variable_set:
            return None
        equality_atoms.append(
            {
                "kind": "explicit",
                "source_index": index,
                "left": (names[0], names[1]),
                "right": (names[2], names[3]),
                "text": match.group(0),
            }
        )

    radius_edges: dict[str, list[tuple[str, str]]] = {}
    for match in DIST_EQ_RADIUS.finditer(statement):
        left, right, radius = match.groups()
        if left not in variable_set or right not in variable_set:
            return None
        radius_edges.setdefault(radius, []).append((left, right))
    for radius, edges in radius_edges.items():
        for index, item in enumerate(edges[1:], start=1):
            equality_atoms.append(
                {
                    "kind": "shared-radius",
                    "radius": radius,
                    "source_index": index,
                    "left": edges[0],
                    "right": item,
                    "text": (
                        f"dist {edges[0][0]} {edges[0][1]} = "
                        f"dist {item[0]} {item[1]} (via {radius})"
                    ),
                }
            )

    inequalities = []
    for left, right in POINT_NE.findall(statement):
        if left in variable_set and right in variable_set:
            inequalities.append((left, right))
    positive_edges = []
    for left, right in POS_DIST.findall(statement):
        if left not in variable_set or right not in variable_set:
            return None
        positive_edges.append((left, right))
    positive_radii = {
        radius for radius in POS_RADIUS.findall(statement) if radius in radius_edges
    }

    parsed_dist_count = (
        2 * len([atom for atom in equality_atoms if atom["kind"] == "explicit"])
        + sum(len(items) for items in radius_edges.values())
        + len(positive_edges)
    )
    if parsed_dist_count == 0 or statement.count("dist ") != parsed_dist_count:
        return None
    return {
        "variables": variables,
        "equality_atoms": equality_atoms,
        "radius_edges": radius_edges,
        "inequalities": inequalities,
        "positive_edges": positive_edges,
        "positive_radii": positive_radii,
    }


def frontier_model(frontier: Mapping[str, Any]) -> tuple[tuple[int, ...], UnionFind]:
    labels = sorted(
        {
            value
            for row in frontier["rows"]
            for value in (int(row["center"]), *(int(v) for v in row["support"]))
        }
    )
    uf = UnionFind()
    for row in frontier["rows"]:
        center = int(row["center"])
        support = [int(value) for value in row["support"]]
        first = edge(center, support[0])
        for point in support[1:]:
            uf.union(first, edge(center, point))
    return tuple(labels), uf


def mapped_equality_key(left: Sequence[int], right: Sequence[int]) -> str:
    """Canonicalize symmetry within distances and across an equality."""
    sides = sorted((edge(*left), edge(*right)))
    return f"d{sides[0][0]},{sides[0][1]}=d{sides[1][0]},{sides[1][1]}"


def find_deficit_one(
    parsed: Mapping[str, Any], labels: Sequence[int], uf: UnionFind
) -> dict[str, Any] | None:
    variables = list(parsed["variables"])
    atoms = list(parsed["equality_atoms"])
    inequalities = list(parsed["inequalities"])
    positive_edges = list(parsed["positive_edges"])
    positive_radii = set(parsed["positive_radii"])
    radius_edges = dict(parsed["radius_edges"])

    def entailed(left: tuple[int, int], right: tuple[int, int]) -> bool:
        left_edge = edge(*left)
        right_edge = edge(*right)
        if left_edge == right_edge:
            return True
        left_zero = left[0] == left[1]
        right_zero = right[0] == right[1]
        if left_zero or right_zero:
            return left_zero and right_zero
        return uf.find(left_edge) == uf.find(right_edge)

    frequency = {variable: 0 for variable in variables}
    for atom in atoms:
        for name in {*atom["left"], *atom["right"]}:
            frequency[name] += 2
    for left, right in itertools.chain(inequalities, positive_edges):
        frequency[left] += 1
        frequency[right] += 1
    for radius, edges in radius_edges.items():
        if radius in positive_radii:
            for left, right in edges:
                frequency[left] += 1
                frequency[right] += 1
    order = sorted(variables, key=lambda name: (-frequency[name], name))
    def side_conditions_hold(assignment: Mapping[str, int]) -> bool:
        for left, right in itertools.chain(inequalities, positive_edges):
            if left in assignment and right in assignment:
                if assignment[left] == assignment[right]:
                    return False
        for radius, edges in radius_edges.items():
            if radius not in positive_radii:
                continue
            for left, right in edges:
                if left in assignment and right in assignment:
                    if assignment[left] == assignment[right]:
                        return False
        return True

    # Enumerating the identity of the sole missing atom gives much stronger
    # propagation than merely counting failures: every other resolved atom
    # must already hold.  This is equivalent to deficit-one search and avoids
    # spending time in role-alias branches whose eventual deficit is unknown.
    for missing_index, missing_atom in enumerate(atoms):
        assignment: dict[str, int] = {}

        def resolved_atoms_hold() -> bool:
            for atom_index, atom in enumerate(atoms):
                names = {*atom["left"], *atom["right"]}
                if not names <= assignment.keys():
                    continue
                left = tuple(assignment[value] for value in atom["left"])
                right = tuple(assignment[value] for value in atom["right"])
                holds = entailed(left, right)
                if atom_index != missing_index:
                    if not holds:
                        return False
                    continue
                # The designated deficit must remain a nontrivial equality
                # between two genuine distances.
                if holds or left[0] == left[1] or right[0] == right[1]:
                    return False
            return True

        def search(index: int) -> dict[str, Any] | None:
            if not side_conditions_hold(assignment) or not resolved_atoms_hold():
                return None
            if index == len(order):
                left = tuple(assignment[value] for value in missing_atom["left"])
                right = tuple(assignment[value] for value in missing_atom["right"])
                atom_output = dict(missing_atom)
                atom_output["left"] = list(atom_output["left"])
                atom_output["right"] = list(atom_output["right"])
                return {
                    "assignment": dict(sorted(assignment.items())),
                    "missing_atom": {
                        **atom_output,
                        "left_mapped": list(left),
                        "right_mapped": list(right),
                    },
                    "atomic_equality_requirement_count": len(atoms),
                }
            variable = order[index]
            for label in labels:
                assignment[variable] = label
                result = search(index + 1)
                if result is not None:
                    return result
            assignment.pop(variable, None)
            return None

        result = search(0)
        if result is not None:
            return result
    return None


def build_document() -> dict[str, Any]:
    bank = json.loads(FRONTIERS.read_text(encoding="utf-8"))
    if bank["schema"] != "p97-atail-fresh-continuation-unit-frontier-bank-v1":
        raise RuntimeError("unexpected frontier schema")
    smallest: dict[int, Mapping[str, Any]] = {}
    for frontier in bank["frontiers"]:
        shard = int(frontier["shard_index"])
        current = smallest.get(shard)
        if current is None or (frontier["row_count"], frontier["row_keys"]) < (
            current["row_count"], current["row_keys"]
        ):
            smallest[shard] = frontier

    declarations = []
    registry_stats = []
    for registry in REGISTRIES:
        document = json.loads(registry.read_text(encoding="utf-8"))
        stats = {
            "path": str(registry.relative_to(ROOT)),
            "sha256": sha256(registry),
            "metric_point_uniform": 0,
            "false_statements": 0,
            "parsed_false_statements": 0,
            "skipped_false_statements": 0,
        }
        for declaration in document["candidate_declarations"]:
            if declaration.get("category") != "metric-point-uniform":
                continue
            stats["metric_point_uniform"] += 1
            statement = declaration["statement"]
            if ": False" not in statement:
                continue
            stats["false_statements"] += 1
            parsed = parse(statement)
            if parsed is None:
                stats["skipped_false_statements"] += 1
                continue
            stats["parsed_false_statements"] += 1
            declarations.append((registry, declaration, parsed))
        registry_stats.append(stats)

    cases = []
    for shard, frontier in sorted(smallest.items()):
        labels, uf = frontier_model(frontier)
        matches = []
        for registry, declaration, parsed in declarations:
            match = find_deficit_one(parsed, labels, uf)
            if match is None:
                continue
            matches.append(
                {
                    "registry": str(registry.relative_to(ROOT)),
                    "fq_name": declaration["fq_name"],
                    "path": declaration["path"],
                    "line": declaration["line"],
                    **match,
                    "missing_mapped_equality_key": mapped_equality_key(
                        match["missing_atom"]["left_mapped"],
                        match["missing_atom"]["right_mapped"],
                    ),
                }
            )
        cases.append(
            {
                "shard_index": shard,
                "frontier_row_count": frontier["row_count"],
                "frontier_row_keys": frontier["row_keys"],
                "labels": list(labels),
                "deficit_one_match_count": len(matches),
                "matches": matches,
            }
        )

    theorem_names = sorted(
        {match["fq_name"] for case in cases for match in case["matches"]}
    )
    missing_keys = sorted(
        {
            match["missing_mapped_equality_key"]
            for case in cases
            for match in case["matches"]
        }
    )
    return {
        "schema": "p97-atail-fresh-continuation-deficit-one-bank-scan-v1",
        "inputs": {
            "frontier_checkpoint": str(FRONTIERS.relative_to(ROOT)),
            "frontier_checkpoint_sha256": sha256(FRONTIERS),
            "fresh_shadow_sha256": bank["sources"]["fresh_shadow_sha256"],
            "registries": registry_stats,
        },
        "summary": {
            "shard_count": len(cases),
            "deficit_one_match_count": sum(
                case["deficit_one_match_count"] for case in cases
            ),
            "match_count_by_shard": {
                str(case["shard_index"]): case["deficit_one_match_count"]
                for case in cases
            },
            "match_count_by_theorem": {
                name: sum(
                    match["fq_name"] == name
                    for case in cases
                    for match in case["matches"]
                )
                for name in theorem_names
            },
            "shards_by_theorem": {
                name: [
                    case["shard_index"]
                    for case in cases
                    if any(match["fq_name"] == name for match in case["matches"])
                ]
                for name in theorem_names
            },
            "match_count_by_missing_mapped_equality": {
                key: sum(
                    match["missing_mapped_equality_key"] == key
                    for case in cases
                    for match in case["matches"]
                )
                for key in missing_keys
            },
            "shards_by_missing_mapped_equality": {
                key: [
                    case["shard_index"]
                    for case in cases
                    if any(
                        match["missing_mapped_equality_key"] == key
                        for match in case["matches"]
                    )
                ]
                for key in missing_keys
            },
        },
        "cases": cases,
        "scope": {
            "status": "EXACT_SYNTACTIC_MATCH_WITHIN_SUPPORTED_GRAMMAR",
            "role_aliasing_allowed": True,
            "one_assignment_returned_per_declaration_and_frontier": True,
            "missing_equality_requires_two_nondegenerate_distances": True,
            "unsupported_metric_statements_skipped": True,
            "missing_equality_producer_proved": False,
            "lean_theorem_proved": False,
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    document = build_document()
    if args.check:
        saved = json.loads(OUTPUT.read_text(encoding="utf-8"))
        if saved != document:
            raise AssertionError("deficit-one checkpoint drift")
    else:
        OUTPUT.write_text(
            json.dumps(document, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
    print(json.dumps(document["summary"], sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

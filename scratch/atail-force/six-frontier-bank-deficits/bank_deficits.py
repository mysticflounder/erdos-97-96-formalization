#!/usr/bin/env python3
"""Exact theorem-bank matching for the six smallest UNIT row frontiers.

This is a syntactic/metric-closure analysis.  It permits point-role aliases
unless a theorem hypothesis rules them out, uses positivity of distances
between distinct finite-shadow labels, and uses ``MetricRow.exact`` only for
the corresponding off-radius inequalities.  A deficit-one match means that
one additional equality between two existing distance classes makes every
parsed theorem hypothesis derivable.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import re
from collections import defaultdict
from pathlib import Path
from typing import Iterable


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
ANALYSIS = ROOT / "scratch/atail-force/fresh-continuation-marco/analysis_checkpoint.json"
SOURCE = ROOT / "scratch/atail-force/fresh-continuation-marco/checkpoint.json"
REGISTRIES = (
    ROOT / "certificates/p97_rvol_general_n_mining.json",
    ROOT / "certificates/erdos97_legacy_general_n_mining.json",
    ROOT / "certificates/erdos_general_theorem_p97_mining.json",
)
OUTPUT = HERE / "checkpoint.json"
ROW_CORE_MATCHER = ROOT / "scratch/atail-force/row-core-bank-match/bank_match.py"
FRONTIER_BANK = ROOT / "scratch/atail-force/fresh-continuation-marco/frontier_checkpoint.json"
SOURCE_ORDER_STAR_SCAN = ROOT / "scratch/atail-force/fresh-continuation-marco/deficit_one_scan.py"
SOURCE_ORDER_STAR_CHECKPOINT = ROOT / "scratch/atail-force/fresh-continuation-marco/deficit_one_checkpoint.json"

PINNED_SHA256: dict[str, str] = {
    "scratch/atail-force/fresh-continuation-marco/analysis_checkpoint.json": "82abce28293e6e7a1f10f6414831b86d1e6218574561ace7a315f5ddac9c0ef6",
    "scratch/atail-force/fresh-continuation-marco/checkpoint.json": "f3234fb83d4097393b96bcfd091d59f2431e089d2d933fd9a188847bb2a5ba70",
    "scratch/atail-force/fresh-continuation-marco/frontier_checkpoint.json": "60cdb851ae94d0afef0188cc4a2ee7ac0cfc9a67dc998a87082e1ab96cf3bc68",
    "scratch/atail-force/fresh-continuation-marco/deficit_one_scan.py": "fd1f0acef041d2cf8ab99d101279518b82ed77fc74c6df78d831f52742e8f021",
    "scratch/atail-force/fresh-continuation-marco/deficit_one_checkpoint.json": "1ff0a1a5f24e1a39e0a4047e48c6c213b04887213db1b05b2418b5de2ecda862",
    "scratch/atail-force/row-core-bank-match/bank_match.py": "248ea70f8cd9710be33a90b84ef0eff51e046cbb541c1322c7553d567a44f5c6",
    "certificates/p97_rvol_general_n_mining.json": "818c955558ef3e80e218baf9ba8c94c342d87115d5d91d9ff130d2778f9b01d8",
    "certificates/erdos97_legacy_general_n_mining.json": "54d8a255afd4ec1395b8aa724136f0f425056647442ce935ae2e3504b9e90444",
    "certificates/erdos_general_theorem_p97_mining.json": "18a215eb4787d415d86173140b2a2cb0b6919d4e8250bf92719f06123235510e",
}


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def edge(left: int, right: int) -> tuple[int, int]:
    return (left, right) if left <= right else (right, left)


def role_edge(left: str, right: str) -> tuple[str, str]:
    return (left, right) if left <= right else (right, left)


class UnionFind:
    def __init__(self) -> None:
        self.parent: dict[object, object] = {}

    def find(self, item: object) -> object:
        self.parent.setdefault(item, item)
        if self.parent[item] != item:
            self.parent[item] = self.find(self.parent[item])
        return self.parent[item]

    def union(self, left: object, right: object) -> None:
        a = self.find(left)
        b = self.find(right)
        if a != b:
            self.parent[b] = a


TOKEN = r"[^\s(){}:]+"
POINT_BINDER = re.compile(r"\{([^{}]+?)\s*:\s*ℝ²\}")
POINT_BINDER_PAREN = re.compile(r"\(([^()]+?)\s*:\s*ℝ²\)")
SCALAR_BINDER = re.compile(r"\{([^{}]+?)\s*:\s*ℝ\}")
HYPOTHESIS = re.compile(r"\(([^\s():{}]+)\s*:\s*([^()]*)\)")
DIST_EQ_DIST = re.compile(
    rf"^dist\s+({TOKEN})\s+({TOKEN})\s*=\s*dist\s+({TOKEN})\s+({TOKEN})$"
)
DIST_EQ_RADIUS = re.compile(
    rf"^dist\s+({TOKEN})\s+({TOKEN})\s*=\s*([A-Za-z][A-Za-z0-9_]*)$"
)
RADIUS_EQ_DIST = re.compile(
    rf"^([A-Za-z][A-Za-z0-9_]*)\s*=\s*dist\s+({TOKEN})\s+({TOKEN})$"
)
POINT_NE = re.compile(rf"^({TOKEN})\s*≠\s*({TOKEN})$")
POS_DIST = re.compile(rf"^0\s*<\s*dist\s+({TOKEN})\s+({TOKEN})$")
POS_RADIUS = re.compile(r"^0\s*<\s*([A-Za-z][A-Za-z0-9_]*)$")
DIST_NE_DIST = re.compile(
    rf"^dist\s+({TOKEN})\s+({TOKEN})\s*≠\s*dist\s+({TOKEN})\s+({TOKEN})$"
)
DIST_NE_RADIUS = re.compile(
    rf"^dist\s+({TOKEN})\s+({TOKEN})\s*≠\s*([A-Za-z][A-Za-z0-9_]*)$"
)
RADIUS_NE_DIST = re.compile(
    rf"^([A-Za-z][A-Za-z0-9_]*)\s*≠\s*dist\s+({TOKEN})\s+({TOKEN})$"
)


def parse(statement: str) -> tuple[dict[str, object] | None, str | None]:
    if ": False" not in statement:
        return None, "conclusion-not-False"
    variables: list[str] = []
    for binder in [*POINT_BINDER.findall(statement), *POINT_BINDER_PAREN.findall(statement)]:
        variables.extend(item for item in binder.split() if item)
    variables = list(dict.fromkeys(variables))
    radii: list[str] = []
    for binder in SCALAR_BINDER.findall(statement):
        radii.extend(item for item in binder.split() if item)
    radii = list(dict.fromkeys(radii))
    variable_set = set(variables)
    radius_set = set(radii)
    if not variables:
        return None, "no-plane-point-binders"

    equalities: list[dict[str, object]] = []
    point_ne: list[dict[str, object]] = []
    positive_edges: list[dict[str, object]] = []
    positive_radii: list[dict[str, object]] = []
    negative_edges: list[dict[str, object]] = []
    negative_radii: list[dict[str, object]] = []

    for name, raw_expression in HYPOTHESIS.findall(statement):
        expression = raw_expression.strip()
        # A single explicit point binder also has the parenthesized shape.
        if name in variable_set and expression == "ℝ²":
            continue
        match = DIST_EQ_DIST.fullmatch(expression)
        if match:
            a, b, c, d = match.groups()
            if not {a, b, c, d} <= variable_set:
                return None, f"unknown-point-in-{name}"
            equalities.append({"name": name, "kind": "dist=dist", "left": role_edge(a, b), "right": role_edge(c, d)})
            continue
        match = DIST_EQ_RADIUS.fullmatch(expression)
        if match:
            a, b, radius = match.groups()
            if not {a, b} <= variable_set or radius not in radius_set:
                return None, f"unknown-role-in-{name}"
            equalities.append({"name": name, "kind": "dist=radius", "left": role_edge(a, b), "radius": radius})
            continue
        match = RADIUS_EQ_DIST.fullmatch(expression)
        if match:
            radius, a, b = match.groups()
            if not {a, b} <= variable_set or radius not in radius_set:
                return None, f"unknown-role-in-{name}"
            equalities.append({"name": name, "kind": "dist=radius", "left": role_edge(a, b), "radius": radius})
            continue
        match = POS_DIST.fullmatch(expression)
        if match:
            a, b = match.groups()
            if not {a, b} <= variable_set:
                return None, f"unknown-point-in-{name}"
            positive_edges.append({"name": name, "edge": role_edge(a, b)})
            continue
        match = POS_RADIUS.fullmatch(expression)
        if match:
            radius = match.group(1)
            if radius not in radius_set:
                return None, f"unknown-radius-in-{name}"
            positive_radii.append({"name": name, "radius": radius})
            continue
        match = DIST_NE_DIST.fullmatch(expression)
        if match:
            a, b, c, d = match.groups()
            if not {a, b, c, d} <= variable_set:
                return None, f"unknown-point-in-{name}"
            negative_edges.append({"name": name, "left": role_edge(a, b), "right": role_edge(c, d)})
            continue
        match = DIST_NE_RADIUS.fullmatch(expression)
        if match:
            a, b, radius = match.groups()
            if not {a, b} <= variable_set or radius not in radius_set:
                return None, f"unknown-role-in-{name}"
            negative_radii.append({"name": name, "edge": role_edge(a, b), "radius": radius})
            continue
        match = RADIUS_NE_DIST.fullmatch(expression)
        if match:
            radius, a, b = match.groups()
            if not {a, b} <= variable_set or radius not in radius_set:
                return None, f"unknown-role-in-{name}"
            negative_radii.append({"name": name, "edge": role_edge(a, b), "radius": radius})
            continue
        match = POINT_NE.fullmatch(expression)
        if match:
            a, b = match.groups()
            if {a, b} <= variable_set:
                point_ne.append({"name": name, "left": a, "right": b})
                continue
        return None, f"unsupported-hypothesis-{name}:{expression}"

    if not equalities:
        return None, "no-metric-equalities"

    theorem_uf = UnionFind()
    edge_terms: set[tuple[str, str]] = set()
    radius_edges: dict[str, set[tuple[str, str]]] = defaultdict(set)
    for atom in equalities:
        left = tuple(atom["left"])
        edge_terms.add(left)
        left_node = ("edge", *left)
        if atom["kind"] == "dist=dist":
            right = tuple(atom["right"])
            edge_terms.add(right)
            theorem_uf.union(left_node, ("edge", *right))
        else:
            radius = str(atom["radius"])
            radius_edges[radius].add(left)
            theorem_uf.union(left_node, ("radius", radius))
    components: dict[object, set[tuple[str, str]]] = defaultdict(set)
    for term in edge_terms:
        components[theorem_uf.find(("edge", *term))].add(term)
    radius_components: dict[str, set[tuple[str, str]]] = {}
    for radius in radius_set:
        node = ("radius", radius)
        if node in theorem_uf.parent:
            radius_components[radius] = set(components[theorem_uf.find(node)])

    return {
        "variables": variables,
        "radii": radii,
        "equalities": equalities,
        "components": [sorted(component) for component in components.values()],
        "radius_components": {key: sorted(value) for key, value in radius_components.items()},
        "point_ne": point_ne,
        "positive_edges": positive_edges,
        "positive_radii": positive_radii,
        "negative_edges": negative_edges,
        "negative_radii": negative_radii,
    }, None


class Frontier:
    def __init__(self, shard_index: int, rows: list[dict[str, object]], grids: list[dict[str, object]], full_rows: list[dict[str, object]], n: int = 12) -> None:
        self.shard_index = shard_index
        self.rows = rows
        self.grids = grids
        self.full_rows = full_rows
        self.n = n
        self.labels = tuple(
            sorted(
                {
                    value
                    for row in rows
                    for value in (
                        int(row["center"]),
                        *(int(point) for point in row["support"]),
                    )
                }
            )
        )
        self.uf = UnionFind()
        for left in self.labels:
            for right in range(left, n):
                self.uf.find(edge(left, right))
        for row in rows:
            center = int(row["center"])
            support = [int(point) for point in row["support"]]
            anchor = edge(center, support[0])
            for point in support[1:]:
                self.uf.union(anchor, edge(center, point))
        members: dict[object, list[tuple[int, int]]] = defaultdict(list)
        for left in self.labels:
            for right in range(left, n):
                item = edge(left, right)
                members[self.uf.find(item)].append(item)
        self.class_members = {min(items): tuple(sorted(items)) for items in members.values()}
        self.class_by_edge: dict[tuple[int, int], tuple[int, int]] = {}
        for class_id, items in self.class_members.items():
            for item in items:
                self.class_by_edge[item] = class_id
        intrinsic_unequal: set[frozenset[tuple[int, int]]] = set()
        row_exact_unequal: set[frozenset[tuple[int, int]]] = set()
        zero_class = {label: self.class_id(edge(label, label)) for label in self.labels}
        for label in self.labels:
            for left in self.labels:
                for right in self.labels:
                    if left < right:
                        intrinsic_unequal.add(frozenset((zero_class[label], self.class_id(edge(left, right)))))
        for row in rows:
            center = int(row["center"])
            support = {int(point) for point in row["support"]}
            radius_class = self.class_id(edge(center, min(support)))
            for point in self.labels:
                if point != center and point not in support:
                    row_exact_unequal.add(frozenset((radius_class, self.class_id(edge(center, point)))))
        self.intrinsic_unequal = {item for item in intrinsic_unequal if len(item) == 2}
        self.row_exact_unequal = {item for item in row_exact_unequal if len(item) == 2}
        self.known_unequal = self.intrinsic_unequal | self.row_exact_unequal

    def class_id(self, item: tuple[int, int]) -> tuple[int, int]:
        root = self.uf.find(item)
        # Construction has already materialized the canonical member table by
        # the time this is called outside __init__.
        if hasattr(self, "class_by_edge"):
            return self.class_by_edge[item]
        candidates = [candidate for candidate in self.uf.parent if self.uf.find(candidate) == root]
        return min(candidates)  # type: ignore[arg-type]

    def are_known_unequal(self, left: tuple[int, int], right: tuple[int, int]) -> bool:
        return frozenset((left, right)) in self.known_unequal

    def are_intrinsically_unequal(self, left: tuple[int, int], right: tuple[int, int]) -> bool:
        return frozenset((left, right)) in self.intrinsic_unequal

    def are_row_exact_unequal(self, left: tuple[int, int], right: tuple[int, int]) -> bool:
        return frozenset((left, right)) in self.row_exact_unequal


def mapped_edge(term: Iterable[str], assignment: dict[str, int]) -> tuple[int, int]:
    left, right = term
    return edge(assignment[left], assignment[right])


def virtual_group(class_id: tuple[int, int], missing: tuple[tuple[int, int], tuple[int, int]] | None) -> frozenset[tuple[int, int]]:
    if missing is not None and class_id in missing:
        return frozenset(missing)
    return frozenset((class_id,))


def groups_known_unequal(frontier: Frontier, left: frozenset[tuple[int, int]], right: frozenset[tuple[int, int]]) -> bool:
    return any(frontier.are_known_unequal(a, b) for a in left for b in right)


def evaluate(frontier: Frontier, parsed: dict[str, object], assignment: dict[str, int]) -> dict[str, object] | None:
    for item in parsed["point_ne"]:
        if assignment[str(item["left"])] == assignment[str(item["right"])]:
            return None
    for item in parsed["positive_edges"]:
        left, right = mapped_edge(item["edge"], assignment)
        if left == right:
            return None
    radius_components = dict(parsed["radius_components"])
    for item in parsed["positive_radii"]:
        terms = radius_components.get(str(item["radius"]), [])
        if not terms or any(len(set(mapped_edge(term, assignment))) == 1 for term in terms):
            return None

    component_classes: list[tuple[set[tuple[int, int]], list[tuple[str, str]]]] = []
    required_pairs: set[tuple[tuple[int, int], tuple[int, int]]] = set()
    for component in parsed["components"]:
        terms = [tuple(term) for term in component]
        classes = {frontier.class_id(mapped_edge(term, assignment)) for term in terms}
        if len(classes) > 2:
            return None
        if len(classes) == 2:
            required_pairs.add(tuple(sorted(classes)))
        component_classes.append((classes, terms))
    if len(required_pairs) > 1:
        return None
    missing = next(iter(required_pairs), None)
    if missing is not None and frontier.are_intrinsically_unequal(*missing):
        return None
    completion_known_unequal = bool(
        missing is not None and frontier.are_row_exact_unequal(*missing)
    )

    def group_of_term(term: Iterable[str]) -> frozenset[tuple[int, int]]:
        return virtual_group(frontier.class_id(mapped_edge(term, assignment)), missing)

    for item in parsed["negative_edges"]:
        left_group = group_of_term(item["left"])
        right_group = group_of_term(item["right"])
        if left_group == right_group or not groups_known_unequal(frontier, left_group, right_group):
            return None
    for item in parsed["negative_radii"]:
        radius_terms = radius_components.get(str(item["radius"]), [])
        if not radius_terms:
            return None
        left_group = group_of_term(item["edge"])
        radius_group = frozenset().union(*(group_of_term(term) for term in radius_terms))
        if left_group == radius_group or not groups_known_unequal(frontier, left_group, radius_group):
            return None

    crossing_hypotheses: list[str] = []
    crossing_atoms: list[dict[str, object]] = []
    radius_partitions: list[dict[str, object]] = []
    canonical_radius_missing: list[str] = []
    if missing is not None:
        for atom in parsed["equalities"]:
            if atom["kind"] != "dist=dist":
                continue
            left_edge = mapped_edge(atom["left"], assignment)
            right_edge = mapped_edge(atom["right"], assignment)
            pair = tuple(sorted((frontier.class_id(left_edge), frontier.class_id(right_edge))))
            if pair == missing:
                crossing_hypotheses.append(str(atom["name"]))
                crossing_atoms.append({"hypothesis": atom["name"], "left_edge": list(left_edge), "right_edge": list(right_edge)})
        for radius, terms in radius_components.items():
            class_atoms: dict[tuple[int, int], list[dict[str, object]]] = defaultdict(list)
            for atom in parsed["equalities"]:
                if atom["kind"] == "dist=radius" and atom["radius"] == radius:
                    item = mapped_edge(atom["left"], assignment)
                    class_atoms[frontier.class_id(item)].append(
                        {"hypothesis": atom["name"], "edge": list(item)}
                    )
            if set(class_atoms) != set(missing):
                continue
            sides = [
                {
                    "class_id": list(class_id),
                    "hypotheses": sorted(str(atom["hypothesis"]) for atom in atoms),
                    "edges": sorted(atom["edge"] for atom in atoms),
                }
                for class_id, atoms in sorted(class_atoms.items())
            ]
            missing_side = min(
                sides,
                key=lambda side: (
                    len(side["hypotheses"]),
                    tuple(side["class_id"]),
                    tuple(side["hypotheses"]),
                ),
            )
            canonical_radius_missing.extend(missing_side["hypotheses"])
            radius_partitions.append(
                {
                    "radius": radius,
                    "sides": sides,
                    "canonical_missing_side_policy": "fewest hypotheses, then class id",
                    "canonical_missing_hypotheses": missing_side["hypotheses"],
                }
            )
        if crossing_atoms:
            concrete = min(
                tuple(sorted((tuple(atom["left_edge"]), tuple(atom["right_edge"]))))
                for atom in crossing_atoms
            )
        elif radius_partitions:
            partition = radius_partitions[0]
            missing_names = set(partition["canonical_missing_hypotheses"])
            missing_edges = [
                mapped_edge(atom["left"], assignment)
                for atom in parsed["equalities"]
                if atom["kind"] == "dist=radius" and atom["name"] in missing_names
            ]
            backbone_edges = [
                mapped_edge(atom["left"], assignment)
                for atom in parsed["equalities"]
                if atom["kind"] == "dist=radius" and atom["name"] not in missing_names
                and atom["radius"] == partition["radius"]
            ]
            concrete = tuple(sorted((min(missing_edges), min(backbone_edges))))
        else:
            left_edges: list[tuple[int, int]] = []
            right_edges: list[tuple[int, int]] = []
            for classes, terms in component_classes:
                if classes == set(missing):
                    for term in terms:
                        item = mapped_edge(term, assignment)
                        class_id = frontier.class_id(item)
                        (left_edges if class_id == missing[0] else right_edges).append(item)
            concrete = tuple(sorted((min(left_edges), min(right_edges))))
    else:
        concrete = None

    source_order_star_missing: list[dict[str, object]] = []
    for atom in parsed["equalities"]:
        if atom["kind"] != "dist=dist":
            continue
        left_item = mapped_edge(atom["left"], assignment)
        right_item = mapped_edge(atom["right"], assignment)
        if frontier.class_id(left_item) != frontier.class_id(right_item):
            source_order_star_missing.append(
                {
                    "kind": "explicit",
                    "hypothesis": atom["name"],
                    "left_edge": list(left_item),
                    "right_edge": list(right_item),
                }
            )
    for radius in parsed["radii"]:
        atoms = [
            atom for atom in parsed["equalities"]
            if atom["kind"] == "dist=radius" and atom["radius"] == radius
        ]
        if not atoms:
            continue
        anchor = mapped_edge(atoms[0]["left"], assignment)
        for atom in atoms[1:]:
            item = mapped_edge(atom["left"], assignment)
            if frontier.class_id(anchor) != frontier.class_id(item):
                source_order_star_missing.append(
                    {
                        "kind": "shared-radius-star",
                        "radius": radius,
                        "anchor_hypothesis": atoms[0]["name"],
                        "hypothesis": atom["name"],
                        "left_edge": list(anchor),
                        "right_edge": list(item),
                    }
                )

    return {
        "status": "exact" if missing is None else "deficit-one",
        "missing_class_pair": [list(item) for item in missing] if missing is not None else None,
        "missing_equality": [list(item) for item in concrete] if concrete is not None else None,
        "crossing_hypotheses": sorted(set(crossing_hypotheses)),
        "crossing_atoms": crossing_atoms,
        "radius_partitions": radius_partitions,
        "canonical_missing_hypotheses": sorted(
            set(crossing_hypotheses) | set(canonical_radius_missing)
        ),
        "source_order_star_atomic_deficit_count": len(source_order_star_missing),
        "source_order_star_missing_atoms": source_order_star_missing,
        "completion_known_unequal_from_complete_rows": completion_known_unequal,
    }


def partial_viable(frontier: Frontier, parsed: dict[str, object], assignment: dict[str, int]) -> bool:
    assigned = set(assignment)
    for item in parsed["point_ne"]:
        left, right = str(item["left"]), str(item["right"])
        if left in assigned and right in assigned and assignment[left] == assignment[right]:
            return False
    for item in parsed["positive_edges"]:
        left, right = item["edge"]
        if left in assigned and right in assigned and assignment[left] == assignment[right]:
            return False
    positive_radii = {str(item["radius"]) for item in parsed["positive_radii"]}
    for radius in positive_radii:
        for term in parsed["radius_components"].get(radius, []):
            left, right = term
            if left in assigned and right in assigned and assignment[left] == assignment[right]:
                return False
    required_pairs: set[tuple[tuple[int, int], tuple[int, int]]] = set()
    for component in parsed["components"]:
        classes = {
            frontier.class_id(mapped_edge(term, assignment))
            for term in component
            if set(term) <= assigned
        }
        if len(classes) > 2:
            return False
        if len(classes) == 2:
            required_pairs.add(tuple(sorted(classes)))
    if len(required_pairs) > 1:
        return False
    if required_pairs and frontier.are_intrinsically_unequal(*next(iter(required_pairs))):
        return False
    return True


def variable_order(parsed: dict[str, object]) -> list[str]:
    frequency = {str(variable): 0 for variable in parsed["variables"]}
    for component in parsed["components"]:
        for term in component:
            for variable in set(term):
                frequency[str(variable)] += 2
    for key in ("point_ne", "positive_edges", "negative_edges", "negative_radii"):
        for item in parsed[key]:
            for value in item.values():
                if isinstance(value, str) and value in frequency:
                    frequency[value] += 1
                elif isinstance(value, (list, tuple)):
                    for variable in set(value):
                        if variable in frequency:
                            frequency[variable] += 1
    return sorted(frequency, key=lambda variable: (-frequency[variable], variable))


def match_theorem(frontier: Frontier, parsed: dict[str, object]) -> dict[str, object]:
    order = variable_order(parsed)
    assignment: dict[str, int] = {}
    exact_count = 0
    exact_first: dict[str, int] | None = None
    deficit: dict[tuple[object, ...], dict[str, object]] = {}
    explored = 0

    def visit(index: int) -> None:
        nonlocal exact_count, exact_first, explored
        if index == len(order):
            explored += 1
            result = evaluate(frontier, parsed, assignment)
            if result is None:
                return
            ordered_assignment = {variable: assignment[variable] for variable in parsed["variables"]}
            if result["status"] == "exact":
                exact_count += 1
                if exact_first is None or tuple(ordered_assignment.values()) < tuple(exact_first.values()):
                    exact_first = ordered_assignment
                return
            signature = (
                tuple(tuple(item) for item in result["missing_equality"]),
                tuple(result["canonical_missing_hypotheses"]),
                tuple(
                    (item["kind"], item.get("hypothesis"), item.get("anchor_hypothesis"))
                    for item in result["source_order_star_missing_atoms"]
                ),
            )
            record = deficit.setdefault(signature, {**result, "assignment_count": 0, "first_assignment": ordered_assignment})
            record["assignment_count"] = int(record["assignment_count"]) + 1
            if tuple(ordered_assignment.values()) < tuple(record["first_assignment"].values()):
                record["first_assignment"] = ordered_assignment
                record["crossing_atoms"] = result["crossing_atoms"]
                record["radius_partitions"] = result["radius_partitions"]
                record["source_order_star_missing_atoms"] = result[
                    "source_order_star_missing_atoms"
                ]
            return
        variable = order[index]
        for label in frontier.labels:
            assignment[variable] = label
            if partial_viable(frontier, parsed, assignment):
                visit(index + 1)
        assignment.pop(variable, None)

    visit(0)
    return {
        "explored_complete_assignments": explored,
        "exact_assignment_count": exact_count,
        "exact_first_assignment": exact_first,
        "deficit_one_completion_count": len(deficit),
        "deficit_one_completions": sorted(deficit.values(), key=lambda item: (item["missing_equality"], item["canonical_missing_hypotheses"], tuple(item["first_assignment"].values()))),
    }


def load_frontiers() -> list[Frontier]:
    analysis = json.loads(ANALYSIS.read_text(encoding="utf-8"))
    source = json.loads(SOURCE.read_text(encoding="utf-8"))
    cases_by_shard = {int(case["shard_index"]): case for case in source["cases"]}
    frontiers = []
    for item in analysis["smallest_confirmed_UNIT_frontier_classes"]:
        instances = item["instances"]
        if len(instances) != 1:
            raise RuntimeError("smallest frontier class is not single-instance")
        shard = int(instances[0]["shard_index"])
        source_case = cases_by_shard[shard]
        frontiers.append(
            Frontier(
                shard,
                list(item["representative_rows"]),
                list(source_case["strict_pair_grids"]),
                list(source_case["rows"]),
            )
        )
    return sorted(frontiers, key=lambda item: item.shard_index)


def load_declarations() -> tuple[list[dict[str, object]], list[dict[str, object]], dict[str, object]]:
    grouped: dict[tuple[str, str], dict[str, object]] = {}
    counts = []
    for path in REGISTRIES:
        document = json.loads(path.read_text(encoding="utf-8"))
        metric = [item for item in document["candidate_declarations"] if item.get("category") == "metric-point-uniform"]
        false_items = [item for item in metric if ": False" in item["statement"]]
        counts.append({"path": str(path.relative_to(ROOT)), "metric_point_uniform": len(metric), "false_metric_point_uniform": len(false_items)})
        for item in false_items:
            key = (str(item["fq_name"]), str(item["statement"]))
            record = grouped.setdefault(key, {**item, "registries": []})
            record["registries"].append(str(path.relative_to(ROOT)))
    parsed_declarations = []
    skipped = []
    for item in grouped.values():
        parsed, reason = parse(str(item["statement"]))
        if parsed is None:
            skipped.append({"fq_name": item["fq_name"], "reason": reason, "statement": item["statement"], "registries": item["registries"]})
        else:
            parsed_declarations.append({"declaration": item, "parsed": parsed})
    parsed_declarations.sort(key=lambda item: (item["declaration"]["fq_name"], item["declaration"]["statement"]))
    skipped.sort(key=lambda item: (item["fq_name"], item["statement"]))
    preflight = {
        "registry_counts": counts,
        "deduplicated_false_metric_declarations": len(grouped),
        "simple_parsed_declarations": len(parsed_declarations),
        "skipped_non_simple_declarations": len(skipped),
    }
    return parsed_declarations, skipped, preflight


def apex_rows(frontier: Frontier) -> list[dict[str, object]]:
    rows = {int(row["center"]): {int(point) for point in row["support"]} for row in frontier.full_rows}
    frontier_centers = {int(row["center"]) for row in frontier.rows}
    result = []
    for index, grid in enumerate(frontier.grids):
        first_pair = {int(point) for point in grid["first_strict_pair"]}
        second_pair = {int(point) for point in grid["second_strict_pair"]}
        first = sorted(center for center, support in rows.items() if first_pair <= support)
        second = sorted(center for center, support in rows.items() if second_pair <= support)
        result.append(
            {
                "grid_index": index,
                "first_apex_row_centers": first,
                "second_apex_row_centers": second,
                "first_apex_rows_retained_in_frontier": [center for center in first if center in frontier_centers],
                "second_apex_rows_retained_in_frontier": [center for center in second if center in frontier_centers],
                "first_strict_pair": sorted(first_pair),
                "second_strict_pair": sorted(second_pair),
            }
        )
    return result


def self_check() -> None:
    positive = "theorem synthetic {A B C : ℝ²} (h : dist A B = dist A C) (hne : B ≠ C) : False"
    parsed, reason = parse(positive)
    if parsed is None:
        raise RuntimeError(f"positive parser self-check failed: {reason}")
    off = "theorem synthetic_off {A B C : ℝ²} {r : ℝ} (hr : 0 < r) (hAB : dist A B = r) (hAC : dist A C ≠ r) : False"
    parsed_off, reason = parse(off)
    if parsed_off is None or len(parsed_off["negative_radii"]) != 1:
        raise RuntimeError(f"off-radius parser self-check failed: {reason}")


def direct_replay_mapping(
    frontier: Frontier,
    parsed: dict[str, object],
    assignment: dict[str, int],
    missing_equality: list[list[int]] | None,
) -> None:
    """Replay one stored mapping with a fresh, direct equality closure."""
    closure = UnionFind()
    for left in frontier.labels:
        for right in range(left, frontier.n):
            closure.find(edge(left, right))
    for row in frontier.rows:
        center = int(row["center"])
        support = [int(point) for point in row["support"]]
        anchor = edge(center, support[0])
        for point in support[1:]:
            closure.union(anchor, edge(center, point))
    before = UnionFind()
    before.parent = dict(closure.parent)
    if missing_equality is not None:
        left, right = (tuple(item) for item in missing_equality)
        if before.find(left) == before.find(right):
            raise RuntimeError("reported deficit equality was already entailed")
        if len(set(left)) == 1 or len(set(right)) == 1:
            raise RuntimeError("reported deficit equality equates zero to a positive distance")
        closure.union(left, right)

    radius_edges: dict[str, list[tuple[int, int]]] = defaultdict(list)
    for atom in parsed["equalities"]:
        left = mapped_edge(atom["left"], assignment)
        if atom["kind"] == "dist=dist":
            right = mapped_edge(atom["right"], assignment)
            if closure.find(left) != closure.find(right):
                raise RuntimeError(f"direct replay failed equality {atom['name']}")
        else:
            radius_edges[str(atom["radius"])].append(left)
    for radius, edges in radius_edges.items():
        if any(closure.find(edges[0]) != closure.find(item) for item in edges[1:]):
            raise RuntimeError(f"direct replay failed radius class {radius}")
    for item in parsed["point_ne"]:
        if assignment[str(item["left"])] == assignment[str(item["right"])]:
            raise RuntimeError(f"direct replay failed point inequality {item['name']}")
    for item in parsed["positive_edges"]:
        if len(set(mapped_edge(item["edge"], assignment))) != 2:
            raise RuntimeError(f"direct replay failed positive distance {item['name']}")
    for item in parsed["positive_radii"]:
        edges = radius_edges.get(str(item["radius"]), [])
        if not edges or any(len(set(value)) != 2 for value in edges):
            raise RuntimeError(f"direct replay failed positive radius {item['name']}")

    # The supported negative hypotheses require a derivable inequality, not
    # merely two syntactically different closure roots.  Reuse only the
    # frontier's explicit zero/nonzero and complete-row inequality facts here.
    missing_classes = None
    if missing_equality is not None:
        left, right = (tuple(item) for item in missing_equality)
        missing_classes = tuple(sorted((frontier.class_id(left), frontier.class_id(right))))

    def group(term: Iterable[str]) -> frozenset[tuple[int, int]]:
        return virtual_group(frontier.class_id(mapped_edge(term, assignment)), missing_classes)

    for item in parsed["negative_edges"]:
        left_group = group(item["left"])
        right_group = group(item["right"])
        if left_group == right_group or not groups_known_unequal(frontier, left_group, right_group):
            raise RuntimeError(f"direct replay failed distance inequality {item['name']}")
    radius_components = dict(parsed["radius_components"])
    for item in parsed["negative_radii"]:
        left_group = group(item["edge"])
        radius_group = frozenset().union(
            *(group(term) for term in radius_components[str(item["radius"])])
        )
        if left_group == radius_group or not groups_known_unequal(frontier, left_group, radius_group):
            raise RuntimeError(f"direct replay failed off-radius inequality {item['name']}")


def replay_reported_mappings(
    cases: list[dict[str, object]],
    frontiers: list[Frontier],
    declarations: list[dict[str, object]],
) -> dict[str, object]:
    frontier_by_shard = {frontier.shard_index: frontier for frontier in frontiers}
    parsed_by_key = {
        (str(item["declaration"]["fq_name"]), str(item["declaration"]["statement"])): item["parsed"]
        for item in declarations
    }
    exact_count = 0
    deficit_count = 0
    for case in cases:
        frontier = frontier_by_shard[int(case["shard_index"])]
        for record in case["exact_matches"]:
            parsed = parsed_by_key[(str(record["fq_name"]), str(record["statement"]))]
            direct_replay_mapping(frontier, parsed, dict(record["first_assignment"]), None)
            exact_count += 1
        for record in case["deficit_one_matches"]:
            parsed = parsed_by_key[(str(record["fq_name"]), str(record["statement"]))]
            direct_replay_mapping(
                frontier,
                parsed,
                dict(record["first_assignment"]),
                list(record["missing_equality"]),
            )
            deficit_count += 1
    return {
        "status": "passed",
        "reported_exact_mappings_replayed": exact_count,
        "reported_deficit_one_mappings_replayed": deficit_count,
        "method": "fresh direct equality closure plus explicit side-condition replay",
    }


def build(only_name: str | None = None) -> dict[str, object]:
    self_check()
    declarations, skipped, preflight = load_declarations()
    if only_name is not None:
        declarations = [item for item in declarations if str(item["declaration"]["fq_name"]).endswith(only_name)]
    cases = []
    frontiers = load_frontiers()
    for frontier in frontiers:
        exact = []
        deficit = []
        for item in declarations:
            declaration = item["declaration"]
            matched = match_theorem(frontier, item["parsed"])
            common = {
                "fq_name": declaration["fq_name"],
                "path": declaration["path"],
                "line": declaration["line"],
                "registries": declaration["registries"],
                "statement": declaration["statement"],
            }
            if matched["exact_assignment_count"]:
                exact.append({**common, "assignment_count": matched["exact_assignment_count"], "first_assignment": matched["exact_first_assignment"]})
            for completion in matched["deficit_one_completions"]:
                deficit.append({**common, **completion})
        cases.append({
            "shard_index": frontier.shard_index,
            "row_count": len(frontier.rows),
            "rows": frontier.rows,
            "apex_rows": apex_rows(frontier),
            "exact_matches": exact,
            "deficit_one_matches": deficit,
            "exact_theorem_count": len(exact),
            "deficit_one_mapping_count": len(deficit),
            "deficit_one_theorem_count": len({item["fq_name"] for item in deficit}),
        })
    coverage: dict[str, set[int]] = defaultdict(set)
    star_one_coverage: dict[str, set[int]] = defaultdict(set)
    for case in cases:
        for match in case["deficit_one_matches"]:
            coverage[str(match["fq_name"])].add(int(case["shard_index"]))
            if int(match["source_order_star_atomic_deficit_count"]) == 1:
                star_one_coverage[str(match["fq_name"])].add(int(case["shard_index"]))
    common = sorted(name for name, shards in coverage.items() if len(shards) == len(cases))
    common_star = sorted(
        name for name, shards in star_one_coverage.items() if len(shards) == len(cases)
    )
    u1_name = "Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction"
    u1_cases = [
        {
            "shard_index": case["shard_index"],
            "exact": [item for item in case["exact_matches"] if item["fq_name"] == u1_name],
            "deficit_one": [item for item in case["deficit_one_matches"] if item["fq_name"] == u1_name],
        }
        for case in cases
    ]
    result = {
        "schema": "p97-six-smallest-unit-frontier-bank-deficits-v1",
        "scope": {
            "fixed_card_12_555_placement_only": True,
            "smallest_confirmed_UNIT_frontiers_not_minimal_cores": True,
            "exact_syntactic_metric_closure_only": True,
            "metric_row_exact_used_for_off_radius_inequalities": True,
            "theorem_permitted_point_aliases": True,
            "deficit_one_primary_definition": "one equality joins the two current distance classes required by a theorem equality component",
            "source_order_star_atomic_deficit_also_reported": True,
            "producer_proved": False,
            "euclidean_closure_proved": False,
        },
        "inputs": {
            "analysis": str(ANALYSIS.relative_to(ROOT)),
            "analysis_sha256": digest(ANALYSIS),
            "source": str(SOURCE.relative_to(ROOT)),
            "source_sha256": digest(SOURCE),
            "frontier_bank": str(FRONTIER_BANK.relative_to(ROOT)),
            "frontier_bank_sha256": digest(FRONTIER_BANK),
            "generalized_matcher_source": str(ROW_CORE_MATCHER.relative_to(ROOT)),
            "generalized_matcher_source_sha256": digest(ROW_CORE_MATCHER),
            "source_order_star_comparison": {
                "scan": str(SOURCE_ORDER_STAR_SCAN.relative_to(ROOT)),
                "scan_sha256": digest(SOURCE_ORDER_STAR_SCAN),
                "checkpoint": str(SOURCE_ORDER_STAR_CHECKPOINT.relative_to(ROOT)),
                "checkpoint_sha256": digest(SOURCE_ORDER_STAR_CHECKPOINT),
            },
            "registries": [{"path": str(path.relative_to(ROOT)), "sha256": digest(path)} for path in REGISTRIES],
        },
        "preflight": preflight,
        "skipped_declarations": skipped,
        "cases": cases,
        "summary": {
            "frontier_count": len(cases),
            "frontiers_with_exact_match": sum(bool(case["exact_matches"]) for case in cases),
            "frontiers_with_deficit_one_match": sum(bool(case["deficit_one_matches"]) for case in cases),
            "common_deficit_one_theorems": common,
            "common_deficit_one_theorem_count": len(common),
            "common_source_order_star_deficit_one_theorems": common_star,
            "common_source_order_star_deficit_one_theorem_count": len(common_star),
            "source_order_star_deficit_one_shards_by_theorem": {
                name: sorted(shards) for name, shards in sorted(star_one_coverage.items())
            },
            "u1_two_large_cap_frontiers_exact": sum(bool(case["exact"]) for case in u1_cases),
            "u1_two_large_cap_frontiers_deficit_one": sum(bool(case["deficit_one"]) for case in u1_cases),
        },
        "u1_two_large_cap": u1_cases,
    }
    result["independent_replay"] = replay_reported_mappings(cases, frontiers, declarations)
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=OUTPUT)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--only-name", help="debug/preflight: scan declarations whose fq_name has this suffix")
    args = parser.parse_args()
    if args.check and args.only_name:
        raise SystemExit("--check cannot be combined with --only-name")
    for relative, expected in PINNED_SHA256.items():
        path = ROOT / relative
        actual = digest(path)
        if actual != expected:
            raise SystemExit(f"source drift: {relative}: expected {expected}, found {actual}")
    rendered = json.dumps(build(args.only_name), indent=2, sort_keys=True) + "\n"
    if args.only_name:
        print(rendered)
        return 0
    if args.check:
        if not args.output.exists() or args.output.read_text(encoding="utf-8") != rendered:
            raise SystemExit(f"stale checkpoint: {args.output}")
        print(f"PASS: {args.output}")
        return 0
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(rendered, encoding="utf-8")
    temporary.replace(args.output)
    print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

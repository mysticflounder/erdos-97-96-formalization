#!/usr/bin/env python3
"""Check whether banked simple metric kernels instantiate on the fixed row core.

This is a deliberately narrow semantic matcher.  It handles theorem statements
whose metric hypotheses are built from simple point variables, ``dist x y =
dist z w``, a shared scalar radius, point inequalities, and radius positivity.
It allows theorem roles to alias, because the formalized collision theorems do.
Statements involving packet projections or non-metric side conditions are
reported as skipped instead of being treated as matches.
"""

from __future__ import annotations

import argparse
import itertools
import json
import re
from pathlib import Path


LABELS = (0, 1, 2, 4, 5, 8, 10)
EQUALITIES = (
    ((1, 8), (1, 0)),
    ((1, 10), (1, 0)),
    ((2, 4), (2, 0)),
    ((2, 5), (2, 0)),
    ((4, 10), (4, 1)),
    ((5, 1), (5, 0)),
    ((5, 4), (5, 0)),
    ((8, 4), (8, 2)),
    ((8, 10), (8, 2)),
    ((10, 2), (10, 0)),
    ((10, 5), (10, 0)),
)


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


UF = UnionFind()
for _left, _right in EQUALITIES:
    UF.union(edge(*_left), edge(*_right))


def entailed(left: tuple[int, int], right: tuple[int, int]) -> bool:
    left_edge = edge(*left)
    right_edge = edge(*right)
    if left_edge == right_edge:
        return True
    if left[0] == left[1] or right[0] == right[1]:
        return left[0] == left[1] and right[0] == right[1]
    return UF.find(left_edge) == UF.find(right_edge)


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


def parse(statement: str) -> dict[str, object] | None:
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

    dist_equalities = []
    for match in DIST_EQ_DIST.finditer(statement):
        names = match.groups()
        if not set(names) <= variable_set:
            return None
        dist_equalities.append(((names[0], names[1]), (names[2], names[3])))

    radius_edges: dict[str, list[tuple[str, str]]] = {}
    for match in DIST_EQ_RADIUS.finditer(statement):
        left, right, radius = match.groups()
        # The dist=dist regex also starts with dist=..., but its RHS does not
        # match the scalar-radius token pattern.
        if left not in variable_set or right not in variable_set:
            return None
        radius_edges.setdefault(radius, []).append((left, right))

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
        radius for radius in POS_RADIUS.findall(statement)
        if radius in radius_edges
    }

    # Refuse statements with metric-looking hypotheses outside the supported
    # grammar.  This prevents a partial parse from creating a false match.
    parsed_dist_count = 2 * len(dist_equalities) + sum(
        len(items) for items in radius_edges.values()
    ) + len(positive_edges)
    if parsed_dist_count == 0 or statement.count("dist ") != parsed_dist_count:
        return None

    return {
        "variables": variables,
        "equalities": dist_equalities,
        "radius_edges": radius_edges,
        "inequalities": inequalities,
        "positive_edges": positive_edges,
        "positive_radii": positive_radii,
    }


def find_assignment(parsed: dict[str, object]) -> dict[str, int] | None:
    variables = list(parsed["variables"])
    equalities = list(parsed["equalities"])
    radius_edges = dict(parsed["radius_edges"])
    inequalities = list(parsed["inequalities"])
    positive_edges = list(parsed["positive_edges"])
    positive_radii = set(parsed["positive_radii"])

    constraints: list[tuple[str, object]] = []
    constraints.extend(("eq", item) for item in equalities)
    constraints.extend(("ne", item) for item in inequalities)
    constraints.extend(("pos", item) for item in positive_edges)
    for radius, edges in radius_edges.items():
        constraints.append(("radius", (radius, edges)))

    frequency = {variable: 0 for variable in variables}
    for kind, data in constraints:
        names: set[str] = set()
        if kind == "eq":
            (a, b), (c, d) = data
            names.update((a, b, c, d))
        elif kind in {"ne", "pos"}:
            names.update(data)
        else:
            _radius, edges = data
            names.update(itertools.chain.from_iterable(edges))
        for name in names:
            frequency[name] += 1
    order = sorted(variables, key=lambda name: (-frequency[name], name))
    assignment: dict[str, int] = {}

    def constraint_holds(kind: str, data: object) -> bool:
        if kind == "eq":
            (a, b), (c, d) = data
            if not {a, b, c, d} <= assignment.keys():
                return True
            return entailed(
                (assignment[a], assignment[b]),
                (assignment[c], assignment[d]),
            )
        if kind == "ne":
            left, right = data
            return left not in assignment or right not in assignment or (
                assignment[left] != assignment[right]
            )
        if kind == "pos":
            left, right = data
            return left not in assignment or right not in assignment or (
                assignment[left] != assignment[right]
            )
        radius, edges = data
        resolved = [
            (assignment[left], assignment[right])
            for left, right in edges
            if left in assignment and right in assignment
        ]
        if radius in positive_radii and any(left == right for left, right in resolved):
            return False
        return not resolved or all(entailed(resolved[0], item) for item in resolved[1:])

    def search(index: int) -> bool:
        if index == len(order):
            return all(constraint_holds(*constraint) for constraint in constraints)
        variable = order[index]
        for label in LABELS:
            assignment[variable] = label
            if all(constraint_holds(*constraint) for constraint in constraints) and search(index + 1):
                return True
        assignment.pop(variable, None)
        return False

    return dict(assignment) if search(0) else None


def self_check() -> None:
    """Smoke-test both sides of the narrow matcher contract."""
    positive_statement = """theorem synthetic_positive
        {A B C : ℝ²}
        (hEq : dist A B = dist A C)
        (hNe : B ≠ C) : False"""
    positive = parse(positive_statement)
    if positive is None or find_assignment(positive) is None:
        raise RuntimeError("positive matcher self-check failed")

    negative_statement = """theorem synthetic_negative
        {A B : ℝ²}
        (hPos : 0 < dist A B)
        (hEq : dist A B = dist A A) : False"""
    negative = parse(negative_statement)
    if negative is None or find_assignment(negative) is not None:
        raise RuntimeError("negative matcher self-check failed")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("registry", nargs="+", type=Path)
    parser.add_argument(
        "--check", action="store_true",
        help="run positive and negative matcher smoke tests before scanning",
    )
    args = parser.parse_args()
    report = {
        "registries": [],
        "metric_point_uniform": 0,
        "false_statements": 0,
        "parsed_false_statements": 0,
        "skipped_false_statements": 0,
        "non_false_metric_statements": 0,
        "matches": [],
    }
    if args.check:
        self_check()
        report["self_check"] = "passed"
    for path in args.registry:
        document = json.loads(path.read_text(encoding="utf-8"))
        report["registries"].append(str(path))
        for declaration in document["candidate_declarations"]:
            if declaration.get("category") != "metric-point-uniform":
                continue
            report["metric_point_uniform"] += 1
            statement = declaration["statement"]
            if ": False" not in statement:
                report["non_false_metric_statements"] += 1
                continue
            report["false_statements"] += 1
            parsed = parse(statement)
            if parsed is None:
                report["skipped_false_statements"] += 1
                continue
            report["parsed_false_statements"] += 1
            assignment = find_assignment(parsed)
            if assignment is not None:
                report["matches"].append({
                    "fq_name": declaration["fq_name"],
                    "path": declaration["path"],
                    "line": declaration["line"],
                    "assignment": assignment,
                    "statement": declaration["statement"],
                })
    print(json.dumps(report, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

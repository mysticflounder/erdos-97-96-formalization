#!/usr/bin/env python3
"""Audit the v10 survivor for wrapping five-point Euclidean obstructions."""

from __future__ import annotations

import argparse
import itertools
import json
from collections import deque
from pathlib import Path


HERE = Path(__file__).resolve().parent
DEFAULT_INPUT = (
    HERE
    / "euclidean-survivor-probe-v10-local-critical-reuse-second.json"
)

Edge = tuple[int, int]
Equation = frozenset[Edge]


def edge(left: int, right: int) -> Edge:
    return tuple(sorted((left, right)))


def equation(left: Edge, right: Edge) -> Equation:
    return frozenset((left, right))


def shortest_path(
    adjacency: dict[Edge, set[Edge]], start: Edge, target: Edge
) -> list[Edge] | None:
    queue = deque([start])
    parent: dict[Edge, Edge | None] = {start: None}
    while queue:
        current = queue.popleft()
        if current == target:
            result = []
            while current is not None:
                result.append(current)
                current = parent[current]
            return list(reversed(result))
        for neighbor in sorted(adjacency.get(current, ())):
            if neighbor not in parent:
                parent[neighbor] = current
                queue.append(neighbor)
    return None


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("artifact", nargs="?", type=Path, default=DEFAULT_INPUT)
    args = parser.parse_args()

    payload = json.loads(args.artifact.read_text())
    target = payload["target"]
    classes = target["alias_classes_in_order"]
    raw_equations = target["positive_quotient_equations"]

    listed: set[Equation] = set()
    adjacency: dict[Edge, set[Edge]] = {}
    for raw_left, raw_right in raw_equations:
        left = edge(*raw_left)
        right = edge(*raw_right)
        listed.add(equation(left, right))
        adjacency.setdefault(left, set()).add(right)
        adjacency.setdefault(right, set()).add(left)

    closure: set[Equation] = set()
    unseen = set(adjacency)
    while unseen:
        seed = min(unseen)
        component = set()
        queue = [seed]
        while queue:
            current = queue.pop()
            if current in component:
                continue
            component.add(current)
            queue.extend(adjacency[current] - component)
        unseen -= component
        for left, right in itertools.combinations(sorted(component), 2):
            closure.add(equation(left, right))
    inferred = closure - listed

    instances = []
    c_row_triple_count = 0
    c_row_triple_all_direct_count = 0
    wrapping_c_row_triple_count = 0
    n = len(classes)
    for chosen in itertools.combinations(range(n), 5):
        for rotation in range(5):
            cyclic = chosen[rotation:] + chosen[:rotation]
            a, b, c, d, e = cyclic
            requirements = [
                ("b:a=e", edge(b, a), edge(b, e)),
                ("c:a=b", edge(c, a), edge(c, b)),
                ("c:a=d", edge(c, a), edge(c, d)),
            ]
            evidence = []
            for label, left, right in requirements:
                path = shortest_path(adjacency, left, right)
                evidence.append(
                    {
                        "row": label,
                        "left": left,
                        "right": right,
                        "direct": equation(left, right) in listed,
                        "path": path,
                    }
                )
            c_rows_hold = all(item["path"] is not None for item in evidence[1:])
            if c_rows_hold:
                c_row_triple_count += 1
                c_row_triple_all_direct_count += all(
                    item["direct"] for item in evidence[1:]
                )
                wrapping_c_row_triple_count += rotation != 0
            if all(item["path"] is not None for item in evidence):
                instances.append(
                    {
                        "ranks": cyclic,
                        "aliases": [classes[index] for index in cyclic],
                        "wrapping": rotation != 0,
                        "all_direct": all(item["direct"] for item in evidence),
                        "evidence": evidence,
                    }
                )

    direct = [item for item in instances if item["all_direct"]]
    transitive = [item for item in instances if not item["all_direct"]]
    print(
        json.dumps(
            {
                "artifact": str(args.artifact),
                "class_count": n,
                "listed_equation_count": len(listed),
                "closure_equation_count": len(closure),
                "transitive_only_equation_count": len(inferred),
                "transitive_only_equations": [
                    sorted(item) for item in sorted(inferred, key=lambda item: sorted(item))
                ],
                "candidate_count": 5 * len(list(itertools.combinations(range(n), 5))),
                "c_row_triple_candidate_count": c_row_triple_count,
                "c_row_triple_all_direct_candidate_count": (
                    c_row_triple_all_direct_count
                ),
                "wrapping_c_row_triple_candidate_count": (
                    wrapping_c_row_triple_count
                ),
                "instance_count": len(instances),
                "all_direct_count": len(direct),
                "uses_transitive_closure_count": len(transitive),
                "nonwrapping_count": sum(not item["wrapping"] for item in instances),
                "wrapping_count": sum(item["wrapping"] for item in instances),
                "instances": instances,
            },
            indent=2,
        )
    )


if __name__ == "__main__":
    main()

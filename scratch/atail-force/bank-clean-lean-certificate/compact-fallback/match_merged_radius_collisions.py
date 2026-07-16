#!/usr/bin/env python3
"""Search public Census554 collision headers after merging all four radii."""

from __future__ import annotations

import itertools
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[4]
CENSUS = ROOT / "lean/Erdos9796Proof/P97/Census554"

GRAPH_EDGES = {
    frozenset(edge)
    for edge in [
        ("O", "A"),
        ("A", "G"),
        ("A", "K"),
        ("O", "E"),
        ("K", "O"),
        ("K", "G"),
        ("G", "X"),
        ("G", "E"),
        ("X", "Z"),
        ("X", "F"),
        ("K", "Y"),
        ("Y", "O"),
        ("Y", "X"),
        ("Y", "Z"),
        ("Z", "A"),
        ("Z", "G"),
        ("F", "A"),
        ("F", "Z"),
        ("F", "K"),
    ]
}
ACTUAL = sorted({point for edge in GRAPH_EDGES for point in edge})


def embeddings(
    roles: list[str],
    edges: set[frozenset[str]],
    anchors: tuple[str, str],
    *,
    injective: bool,
):
    for actual_anchors in [("O", "A"), ("A", "O")]:
        fixed = dict(zip(anchors, actual_anchors, strict=True))
        remaining_roles = [role for role in roles if role not in fixed]
        remaining_actual = [point for point in ACTUAL if point not in fixed.values()]
        assignments = (
            itertools.permutations(remaining_actual, len(remaining_roles))
            if injective
            else itertools.product(ACTUAL, repeat=len(remaining_roles))
        )
        for values in assignments:
            mapping = fixed | dict(zip(remaining_roles, values, strict=True))
            if all(
                frozenset(mapping[point] for point in edge) in GRAPH_EDGES
                for edge in edges
            ):
                yield mapping


def main() -> None:
    for path in sorted(CENSUS.glob("*.lean")):
        text = path.read_text(encoding="utf-8")
        for match in re.finditer(
            r"\btheorem\s+(\w*collision\w*)\s+(.*?)\s*:=\s*by",
            text,
            re.DOTALL,
        ):
            name, header = match.groups()
            conclusion = re.search(r":\s*(\w+)\s*=\s*(\w+)\s*$", header)
            if conclusion is None:
                continue
            distance_equalities = re.findall(
                r"dist\s+(\w+)\s+(\w+)\s*=\s*dist\s+(\w+)\s+(\w+)",
                header,
            )
            # Do not silently ignore non-distance hypotheses.
            hypothesis_count = len(re.findall(r"\(h\w*\s*:", header))
            if not distance_equalities or hypothesis_count != len(distance_equalities):
                continue
            edges = {
                frozenset(pair)
                for equality in distance_equalities
                for pair in [equality[:2], equality[2:]]
            }
            roles = sorted({point for edge in edges for point in edge})
            anchors = conclusion.groups()
            if not set(anchors) <= set(roles) or len(roles) > len(ACTUAL):
                continue
            for injective in [True, False]:
                found = next(
                    embeddings(roles, edges, anchors, injective=injective), None
                )
                if found is not None:
                    print(
                        path.name,
                        name,
                        "injective" if injective else "aliased",
                        found,
                    )
                    break


if __name__ == "__main__":
    main()

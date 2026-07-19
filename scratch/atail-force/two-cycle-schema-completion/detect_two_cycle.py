#!/usr/bin/env python3
"""Find exactly the row-incidence witnesses accepted by ``false_of_two_cycle``.

The production consumer fixes one CCW boundary chart for both comparisons.
For each cyclic rotation of the carrier order, this detector constructs only
the two comparison constructors present in ``SelectedRowOrdinalComparison``.
It then quotients distance terms by selected-row equalities and looks for a
directed two-cycle between two quotient classes.

This is an occurrence search on one finite carrier.  It is not a uniform
coverage theorem for arbitrary carrier cardinality.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import defaultdict, deque
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable


Distance = tuple[int, int]
Membership = tuple[int, int]


def distance(left: int, right: int) -> Distance:
    if left == right:
        raise ValueError("distance terms must have distinct endpoints")
    return (left, right) if left < right else (right, left)


def rotate(items: list[int], offset: int) -> list[int]:
    return items[offset:] + items[:offset]


@dataclass(frozen=True)
class EqualityStep:
    source: Distance
    target: Distance
    center: int

    @property
    def memberships(self) -> tuple[Membership, Membership]:
        source_member = self.source[1] if self.source[0] == self.center else self.source[0]
        target_member = self.target[1] if self.target[0] == self.center else self.target[0]
        return ((self.center, source_member), (self.center, target_member))


@dataclass(frozen=True)
class Comparison:
    constructor: str
    quadruple: tuple[int, int, int, int]
    row_center: int
    row_members: tuple[int, int]
    left: Distance
    right: Distance

    @property
    def memberships(self) -> tuple[Membership, Membership]:
        return tuple((self.row_center, member) for member in self.row_members)  # type: ignore[return-value]


class UnionFind:
    def __init__(self, items: Iterable[Distance]) -> None:
        self.parent = {item: item for item in items}

    def find(self, item: Distance) -> Distance:
        root = item
        while self.parent[root] != root:
            root = self.parent[root]
        while self.parent[item] != item:
            parent = self.parent[item]
            self.parent[item] = root
            item = parent
        return root

    def union(self, left: Distance, right: Distance) -> None:
        root_left = self.find(left)
        root_right = self.find(right)
        if root_left != root_right:
            self.parent[max(root_left, root_right)] = min(root_left, root_right)


def equality_graph(
    rows: dict[int, set[int]],
) -> tuple[UnionFind, dict[Distance, list[EqualityStep]]]:
    terms = set(itertools.combinations(sorted(rows), 2))
    union_find = UnionFind(terms)
    graph: dict[Distance, list[EqualityStep]] = defaultdict(list)
    for center, members in rows.items():
        row_terms = [distance(center, member) for member in sorted(members)]
        for left, right in itertools.combinations(row_terms, 2):
            union_find.union(left, right)
            graph[left].append(EqualityStep(left, right, center))
            graph[right].append(EqualityStep(right, left, center))
    return union_find, graph


def shortest_equality_path(
    graph: dict[Distance, list[EqualityStep]], source: Distance, target: Distance
) -> list[EqualityStep]:
    if source == target:
        return []
    queue = deque([source])
    predecessor: dict[Distance, EqualityStep] = {}
    seen = {source}
    while queue:
        current = queue.popleft()
        for step in graph.get(current, []):
            if step.target in seen:
                continue
            predecessor[step.target] = step
            if step.target == target:
                queue.clear()
                break
            seen.add(step.target)
            queue.append(step.target)
    if target not in predecessor:
        raise AssertionError(f"no row-equality path from {source} to {target}")
    answer: list[EqualityStep] = []
    current = target
    while current != source:
        step = predecessor[current]
        answer.append(step)
        current = step.source
    answer.reverse()
    return answer


def comparisons_for_chart(order: list[int], rows: dict[int, set[int]]) -> list[Comparison]:
    answer: list[Comparison] = []
    for ia, ib, ic, id_ in itertools.combinations(range(len(order)), 4):
        a, b, c, d = order[ia], order[ib], order[ic], order[id_]
        if {c, d}.issubset(rows[a]):
            answer.append(
                Comparison(
                    constructor="diagonalEqSide",
                    quadruple=(a, b, c, d),
                    row_center=a,
                    row_members=(c, d),
                    left=distance(b, c),
                    right=distance(b, d),
                )
            )
        if {a, d}.issubset(rows[c]):
            answer.append(
                Comparison(
                    constructor="diagonalEqLastSide",
                    quadruple=(a, b, c, d),
                    row_center=c,
                    row_members=(a, d),
                    left=distance(a, b),
                    right=distance(b, d),
                )
            )
    return answer


def step_payload(step: EqualityStep) -> dict[str, object]:
    return {
        "source": list(step.source),
        "target": list(step.target),
        "center": step.center,
        "memberships": [list(item) for item in step.memberships],
    }


def comparison_payload(comparison: Comparison) -> dict[str, object]:
    return {
        "constructor": comparison.constructor,
        "ordered_quadruple": list(comparison.quadruple),
        "row_center": comparison.row_center,
        "row_members": list(comparison.row_members),
        "left_distance": list(comparison.left),
        "right_distance": list(comparison.right),
        "memberships": [list(item) for item in comparison.memberships],
    }


def transform_schema(
    size: int, schema: tuple[Membership, ...], rotation: int, reflected: bool
) -> tuple[Membership, ...]:
    def transform(role: int) -> int:
        rotated = (role - rotation) % size
        return (-rotated) % size if reflected else rotated

    return tuple(sorted((transform(center), transform(member)) for center, member in schema))


def dihedral_family(
    size: int, schema: tuple[Membership, ...]
) -> tuple[tuple[Membership, ...], list[tuple[Membership, ...]]]:
    family = {
        transform_schema(size, schema, rotation, reflected)
        for rotation in range(size)
        for reflected in (False, True)
    }
    return min(family), sorted(family)


def bank_rotation_records(
    size: int, schema: tuple[Membership, ...]
) -> list[tuple[Membership, ...]]:
    """All cyclic cuts, quotiented by the encoder's linear reflection."""
    records: set[tuple[Membership, ...]] = set()
    for rotation in range(size):
        rotated = transform_schema(size, schema, rotation, False)
        reflected = tuple(
            sorted((size - 1 - center, size - 1 - member) for center, member in rotated)
        )
        records.add(min(rotated, reflected))
    return sorted(records)


def witness_payload(
    cyclic_order: list[int],
    cut_offset: int,
    forward: Comparison,
    backward: Comparison,
    path_left: list[EqualityStep],
    path_right: list[EqualityStep],
) -> dict[str, object]:
    memberships = set(forward.memberships) | set(backward.memberships)
    for step in path_left + path_right:
        memberships.update(step.memberships)
    quadruple_vertices = set(forward.quadruple) | set(backward.quadruple)
    active_vertices = [
        vertex
        for vertex in cyclic_order
        if vertex in quadruple_vertices or any(vertex in edge for edge in memberships)
    ]
    label = {vertex: index for index, vertex in enumerate(active_vertices)}
    schema = tuple(sorted((label[center], label[member]) for center, member in memberships))
    canonical, family = dihedral_family(len(active_vertices), schema)
    bank_records = bank_rotation_records(len(active_vertices), schema)
    return {
        "chart_cut_offset": cut_offset,
        "chart_order": rotate(cyclic_order, cut_offset),
        "forward": comparison_payload(forward),
        "backward": comparison_payload(backward),
        "left_identification_path": [step_payload(step) for step in path_left],
        "right_identification_path": [step_payload(step) for step in path_right],
        "required_memberships": [list(item) for item in sorted(memberships)],
        "active_vertices_in_original_cyclic_order": active_vertices,
        "core_vertex_count": len(active_vertices),
        "linear_order_schema": [list(item) for item in schema],
        "dihedral_canonical_order_schema": [list(item) for item in canonical],
        "all_dihedral_linear_representatives": [
            [list(item) for item in representative] for representative in family
        ],
        "reflection_canonical_bank_rotation_records": [
            [list(item) for item in representative] for representative in bank_records
        ],
    }


def key_of_witness(record: dict[str, object]) -> tuple[object, ...]:
    return (
        int(record["core_vertex_count"]),
        tuple(tuple(edge) for edge in record["dihedral_canonical_order_schema"]),
    )


def detect(carrier: dict[str, object]) -> dict[str, object]:
    n = int(carrier["n"])
    cyclic_order = [int(item) for item in carrier.get("cyclic_order", range(n))]
    if len(cyclic_order) != n or set(cyclic_order) != set(range(n)):
        raise ValueError("cyclic_order must be a permutation of 0..n-1")
    raw_rows = carrier["rows"]
    if not isinstance(raw_rows, dict):
        raise ValueError("rows must be an object")
    rows = {int(center): {int(member) for member in members} for center, members in raw_rows.items()}
    if set(rows) != set(range(n)):
        raise ValueError("rows must contain every center 0..n-1")
    if any(center in members for center, members in rows.items()):
        raise ValueError("self membership is not allowed")

    union_find, graph = equality_graph(rows)
    raw_witnesses: list[dict[str, object]] = []
    raw_witness_keys: list[tuple[object, ...]] = []
    comparison_count = 0
    for cut_offset in range(n):
        comparisons = comparisons_for_chart(rotate(cyclic_order, cut_offset), rows)
        comparison_count += len(comparisons)
        by_classes: dict[tuple[Distance, Distance], list[Comparison]] = defaultdict(list)
        for comparison in comparisons:
            by_classes[
                (union_find.find(comparison.left), union_find.find(comparison.right))
            ].append(comparison)
        for (left_class, right_class), forwards in sorted(by_classes.items()):
            backwards = by_classes.get((right_class, left_class), [])
            if not backwards:
                continue
            for forward in forwards:
                for backward in backwards:
                    path_left = shortest_equality_path(graph, forward.left, backward.right)
                    path_right = shortest_equality_path(graph, forward.right, backward.left)
                    raw_witnesses.append(
                        witness_payload(
                            cyclic_order,
                            cut_offset,
                            forward,
                            backward,
                            path_left,
                            path_right,
                        )
                    )
                    raw_witness_keys.append(
                        (
                            cut_offset,
                            forward.constructor,
                            forward.quadruple,
                            backward.constructor,
                            backward.quadruple,
                        )
                    )

    canonical: dict[tuple[object, ...], dict[str, object]] = {}
    for witness in raw_witnesses:
        key = key_of_witness(witness)
        old = canonical.get(key)
        if old is None or (
            len(witness["required_memberships"]),
            witness["chart_cut_offset"],
            witness["linear_order_schema"],
        ) < (
            len(old["required_memberships"]),
            old["chart_cut_offset"],
            old["linear_order_schema"],
        ):
            canonical[key] = witness

    witnesses = sorted(canonical.values(), key=key_of_witness)
    serialized_raw_keys = json.dumps(sorted(raw_witness_keys), separators=(",", ":"))
    return {
        "schema": "p97-theorem-faithful-two-cycle-occurrence-search-v1",
        "status": "FOUND" if witnesses else "ABSENT",
        "epistemic_status": "EXACT_FINITE_INCIDENCE_SEARCH",
        "consumer": "Problem97.ATailOrdinalKalmansonCycle.false_of_two_cycle",
        "constructor_scope": ["diagonalEqSide", "diagonalEqLastSide"],
        "common_boundary_chart_required": True,
        "carrier_n": n,
        "cyclic_order": cyclic_order,
        "comparison_count_across_all_cuts": comparison_count,
        "raw_two_cycle_count": len(raw_witnesses),
        "raw_witness_key_sha256": hashlib.sha256(serialized_raw_keys.encode()).hexdigest(),
        "raw_witnesses": raw_witnesses,
        "canonical_schema_count": len(witnesses),
        "witnesses": witnesses,
        "scope_warning": (
            "This is exhaustive for two constructor comparisons whose endpoint distance "
            "identifications are generated by the selected-row equalities of this finite carrier. "
            "It is neither an arbitrary-n occurrence theorem nor live-source coverage."
        ),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("carrier", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    carrier = json.loads(args.carrier.read_text(encoding="utf-8"))
    result = detect(carrier)
    result["carrier"] = str(args.carrier)
    result["carrier_sha256"] = hashlib.sha256(args.carrier.read_bytes()).hexdigest()
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(
        json.dumps(
            {
                "status": result["status"],
                "raw_two_cycle_count": result["raw_two_cycle_count"],
                "canonical_schema_count": result["canonical_schema_count"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

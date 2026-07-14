#!/usr/bin/env python3
"""Cluster equality-minimized UNIT cores up to point relabeling.

Equalities sharing a center are first closed transitively, so the result is
independent of which endpoint happened to be the row pivot.  The resulting
centered unordered-pair structures are then compared by exact point
relabeling using the local color-refinement/backtracking isomorphism checker.
"""

from __future__ import annotations

import argparse
import json
import sys
from collections import defaultdict
from pathlib import Path
from typing import Iterable, Mapping, Sequence


HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

from cluster_formalized_core_shards import (  # noqa: E402
    Row,
    encode_rows,
    isomorphic,
    points,
)


Equality = tuple[int, int, int]


def decode_equalities(records: Sequence[Mapping[str, object]]) -> tuple[Equality, ...]:
    return tuple(
        sorted(
            (
                int(record["center"]),
                min(int(record["left"]), int(record["right"])),
                max(int(record["left"]), int(record["right"])),
            )
            for record in records
        )
    )


def equality_closure(equalities: Iterable[Equality]) -> tuple[Row, ...]:
    by_center: dict[int, list[tuple[int, int]]] = defaultdict(list)
    for center, left, right in equalities:
        by_center[center].append((left, right))

    closed: list[Row] = []
    for center, pairs in by_center.items():
        parent: dict[int, int] = {}

        def find(point: int) -> int:
            parent.setdefault(point, point)
            while parent[point] != point:
                parent[point] = parent[parent[point]]
                point = parent[point]
            return point

        def union(left: int, right: int) -> None:
            left_root = find(left)
            right_root = find(right)
            if left_root != right_root:
                parent[max(left_root, right_root)] = min(left_root, right_root)

        for left, right in pairs:
            union(left, right)
        components: dict[int, list[int]] = defaultdict(list)
        for point in parent:
            components[find(point)].append(point)
        for component in components.values():
            component.sort()
            for index, left in enumerate(component):
                for right in component[index + 1:]:
                    closed.append((center, frozenset((left, right))))
    return tuple(sorted(closed))


def component_sizes(rows: Sequence[Row]) -> list[list[int]]:
    by_center: dict[int, dict[int, set[int]]] = defaultdict(dict)
    for center, support in rows:
        for point in support:
            by_center[center].setdefault(point, set()).update(support - {point})

    answer: list[list[int]] = []
    for center, adjacency in by_center.items():
        unseen = set(adjacency)
        sizes: list[int] = []
        while unseen:
            pending = [unseen.pop()]
            component: set[int] = set()
            while pending:
                point = pending.pop()
                if point in component:
                    continue
                component.add(point)
                neighbors = adjacency[point] & unseen
                unseen -= neighbors
                pending.extend(neighbors)
            sizes.append(len(component))
        answer.append([center, *sorted(sizes, reverse=True)])
    return sorted(answer)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("checkpoint", type=Path)
    parser.add_argument(
        "--output",
        type=Path,
        help="atomically write the clusters here instead of stdout",
    )
    args = parser.parse_args()

    checkpoint = json.loads(args.checkpoint.read_text(encoding="utf-8"))
    cases: list[dict[str, object]] = []
    for case in checkpoint["cases"]:
        minimization = case.get("minimization", {})
        records = minimization.get("retained_equalities")
        if not isinstance(records, list):
            continue
        equalities = decode_equalities(records)
        closure = equality_closure(equalities)
        cases.append(
            {
                "shard_index": int(case["shard_index"]),
                "status": minimization.get("status"),
                "retained_equality_count": len(equalities),
                "closure": closure,
            }
        )

    # Keep the exact checker honest on a relabeling-positive and a simple
    # center-role-negative example before using it on census data.
    sample = ((0, frozenset((1, 2))), (2, frozenset((0, 3))))
    relabeled = ((4, frozenset((5, 6))), (6, frozenset((4, 7))))
    role_changed = ((0, frozenset((1, 2))), (0, frozenset((2, 3))))
    assert isomorphic(sample, relabeled)
    assert not isomorphic(sample, role_changed)

    classes: list[dict[str, object]] = []
    for case in cases:
        for class_record in classes:
            if isomorphic(case["closure"], class_record["representative_closure"]):
                class_record["shard_indices"].append(case["shard_index"])
                break
        else:
            classes.append(
                {
                    "representative_shard": case["shard_index"],
                    "representative_closure": case["closure"],
                    "shard_indices": [case["shard_index"]],
                }
            )
    classes.sort(
        key=lambda record: (
            -len(record["shard_indices"]),
            len(record["representative_closure"]),
            record["representative_shard"],
        )
    )

    result = {
        "schema": "p97-atail-formalized-core-shard-equality-clusters-v1",
        "scope": {
            "equality_subsystems_crosschecked_unit": all(
                case["status"] == "CROSSCHECKED_UNIT_EQUALITY_SUBSYSTEM"
                for case in cases
            ),
            "closure_normalized_for_pivot_independence": True,
            "isomorphism_exact_under_point_relabeling": True,
            "target_faithful": False,
            "fixed_placement_only": True,
        },
        "case_count": len(cases),
        "isomorphism_class_count": len(classes),
        "cases": [
            {
                "shard_index": case["shard_index"],
                "retained_equality_count": case["retained_equality_count"],
                "closure_equality_count": len(case["closure"]),
                "active_point_count": len(points(case["closure"])),
                "center_component_sizes": component_sizes(case["closure"]),
            }
            for case in cases
        ],
        "classes": [
            {
                "class_size": len(record["shard_indices"]),
                "shard_indices": record["shard_indices"],
                "representative_shard": record["representative_shard"],
                "closure_equality_count": len(record["representative_closure"]),
                "active_point_count": len(points(record["representative_closure"])),
                "center_component_sizes": component_sizes(
                    record["representative_closure"]
                ),
                "representative_closure": encode_rows(
                    record["representative_closure"]
                ),
            }
            for record in classes
        ],
    }
    rendered = json.dumps(result, indent=2, sort_keys=True)
    if args.output is None:
        print(rendered)
    else:
        temporary = args.output.with_suffix(args.output.suffix + ".tmp")
        temporary.write_text(rendered + "\n")
        temporary.replace(args.output)
        print(f"wrote {args.output}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

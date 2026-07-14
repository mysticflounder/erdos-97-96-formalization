#!/usr/bin/env python3
"""Cluster retained UNIT row cores up to exact point relabeling."""

from __future__ import annotations

import argparse
import json
from collections import Counter, defaultdict
from pathlib import Path
from typing import Iterable, Mapping, Sequence


Row = tuple[int, frozenset[int]]


def decode_rows(records: Sequence[Mapping[str, object]]) -> tuple[Row, ...]:
    return tuple(
        sorted(
            (
                int(record["center"]),
                frozenset(int(point) for point in record["support"]),
            )
            for record in records
        )
    )


def points(rows: Sequence[Row]) -> tuple[int, ...]:
    return tuple(sorted({point for center, support in rows for point in (center, *support)}))


def _initial_signature(point: int, rows: Sequence[Row]) -> tuple[int, int, int]:
    return (
        sum(center == point for center, _support in rows),
        sum(point in support for _center, support in rows),
        sum(center == point and point in support for center, support in rows),
    )


def _refined_signature(
    point: int, rows: Sequence[Row], colors: Mapping[int, int]
) -> tuple[object, ...]:
    centered = sorted(
        tuple(sorted(colors[support_point] for support_point in support))
        for center, support in rows
        if center == point
    )
    supported = sorted(
        (
            colors[center],
            tuple(
                sorted(
                    colors[support_point]
                    for support_point in support
                    if support_point != point
                )
            ),
        )
        for center, support in rows
        if point in support
    )
    return colors[point], tuple(centered), tuple(supported)


def paired_colors(
    left: Sequence[Row], right: Sequence[Row]
) -> tuple[dict[int, int], dict[int, int]] | None:
    left_points = points(left)
    right_points = points(right)
    if len(left_points) != len(right_points):
        return None
    initial = [
        _initial_signature(point, rows)
        for rows, carrier in ((left, left_points), (right, right_points))
        for point in carrier
    ]
    palette = {signature: index for index, signature in enumerate(sorted(set(initial)))}
    left_colors = {
        point: palette[_initial_signature(point, left)] for point in left_points
    }
    right_colors = {
        point: palette[_initial_signature(point, right)] for point in right_points
    }
    while True:
        left_signatures = {
            point: _refined_signature(point, left, left_colors)
            for point in left_points
        }
        right_signatures = {
            point: _refined_signature(point, right, right_colors)
            for point in right_points
        }
        all_signatures = set(left_signatures.values()) | set(right_signatures.values())
        palette = {
            signature: index for index, signature in enumerate(sorted(all_signatures))
        }
        new_left = {point: palette[left_signatures[point]] for point in left_points}
        new_right = {point: palette[right_signatures[point]] for point in right_points}
        if Counter(new_left.values()) != Counter(new_right.values()):
            return None
        if new_left == left_colors and new_right == right_colors:
            return new_left, new_right
        left_colors, right_colors = new_left, new_right


def isomorphic(left: Sequence[Row], right: Sequence[Row]) -> bool:
    if len(left) != len(right):
        return False
    colored = paired_colors(left, right)
    if colored is None:
        return False
    left_colors, right_colors = colored
    right_points = points(right)
    right_rows = set(right)
    by_color: dict[int, tuple[int, ...]] = defaultdict(tuple)
    for color in set(right_colors.values()):
        by_color[color] = tuple(
            point for point in right_points if right_colors[point] == color
        )

    def partial_rows_possible(mapping: Mapping[int, int], used: set[int]) -> bool:
        for center, support in left:
            mapped_center = mapping.get(center)
            mapped_support = {mapping[point] for point in support if point in mapping}
            candidates = [
                (target_center, target_support)
                for target_center, target_support in right
                if (mapped_center is None or target_center == mapped_center)
                and mapped_support <= target_support
                and (
                    mapped_center is not None
                    or (
                        target_center not in used
                        and right_colors[target_center] == left_colors[center]
                    )
                )
            ]
            possible = False
            for _target_center, target_support in candidates:
                available = target_support - used
                needed_colors = Counter(
                    left_colors[point] for point in support if point not in mapping
                )
                available_colors = Counter(right_colors[point] for point in available)
                if all(available_colors[color] >= count for color, count in needed_colors.items()):
                    possible = True
                    break
            if not possible:
                return False
        return True

    left_points = points(left)

    def search(mapping: dict[int, int], used: set[int]) -> bool:
        if len(mapping) == len(left_points):
            mapped_rows = {
                (
                    mapping[center],
                    frozenset(mapping[point] for point in support),
                )
                for center, support in left
            }
            return mapped_rows == right_rows
        unmapped = [point for point in left_points if point not in mapping]
        point = min(
            unmapped,
            key=lambda candidate: (
                sum(
                    target not in used
                    for target in by_color[left_colors[candidate]]
                ),
                -sum(
                    center == candidate or candidate in support
                    for center, support in left
                ),
            ),
        )
        for target in by_color[left_colors[point]]:
            if target in used:
                continue
            mapping[point] = target
            used.add(target)
            if partial_rows_possible(mapping, used) and search(mapping, used):
                return True
            used.remove(target)
            del mapping[point]
        return False

    return search({}, set())


def encode_rows(rows: Iterable[Row]) -> list[dict[str, object]]:
    return [
        {"center": center, "support": sorted(support)}
        for center, support in rows
    ]


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("checkpoint", type=Path)
    args = parser.parse_args()
    checkpoint = json.loads(args.checkpoint.read_text(encoding="utf-8"))
    cases = []
    for case in checkpoint["cases"]:
        deletion = case.get("metric_oracle", {}).get("bounded_deletion", {})
        if "retained_rows" not in deletion:
            continue
        cases.append(
            {
                "shard_index": int(case["shard_index"]),
                "rows": decode_rows(deletion["retained_rows"]),
                "crosscheck": deletion["retained_core_crosscheck"]["status"],
                "complete": bool(deletion["complete"]),
                "confirmed_row_irredundant": bool(
                    deletion["confirmed_row_irredundant"]
                ),
            }
        )

    classes: list[dict[str, object]] = []
    for case in cases:
        for class_record in classes:
            if isomorphic(case["rows"], class_record["representative_rows"]):
                class_record["shard_indices"].append(case["shard_index"])
                break
        else:
            classes.append(
                {
                    "representative_shard": case["shard_index"],
                    "representative_rows": case["rows"],
                    "shard_indices": [case["shard_index"]],
                }
            )
    classes.sort(
        key=lambda record: (
            -len(record["shard_indices"]),
            len(record["representative_rows"]),
            record["representative_shard"],
        )
    )
    output_classes = [
        {
            "class_size": len(record["shard_indices"]),
            "row_count": len(record["representative_rows"]),
            "used_point_count": len(points(record["representative_rows"])),
            "shard_indices": record["shard_indices"],
            "representative_shard": record["representative_shard"],
            "representative_rows": encode_rows(record["representative_rows"]),
        }
        for record in classes
    ]
    result = {
        "schema": "p97-atail-formalized-core-shard-isomorphism-clusters-v1",
        "scope": {
            "row_deletion_complete_for_all_cases": all(case["complete"] for case in cases),
            "row_irredundence_confirmed_for_all_cases": all(
                case["confirmed_row_irredundant"] for case in cases
            ),
            "retained_cores_crosschecked_unit": all(
                case["crosscheck"] == "CROSSCHECKED_UNIT" for case in cases
            ),
        },
        "case_count": len(cases),
        "isomorphism_class_count": len(output_classes),
        "classes": output_classes,
    }
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

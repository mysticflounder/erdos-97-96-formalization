"""Reconcile Child46 producer supports against the Lean three-row cycle bank."""

from __future__ import annotations

import json
from collections import Counter
from itertools import combinations
from pathlib import Path

from census.atail_force import producer_bank
from census.global_confinement.metric_realizability_probe import MetricRow

ROOT = Path(__file__).resolve().parents[1]
REPLAY = ROOT / "scratch/exact17-child46-production-8205802e/source-semantic-replay.json"
OUT = ROOT / "scratch/exact17-child46-three-row-cycle-reconcile-20260815.json"

TEMPLATES = {
    "adjacentAdjacent": ((0, 1), (0, 2), (3, 2), (3, 5), (4, 1), (4, 5)),
    "adjacentInnerOuterLeft": ((0, 1), (0, 2), (4, 1), (4, 3), (5, 2), (5, 3)),
    "adjacentInnerOuterRight": ((0, 1), (0, 3), (4, 1), (4, 2), (5, 2), (5, 3)),
}


def edge(a: int, b: int) -> tuple[int, int]:
    return (a, b) if a < b else (b, a)


def reflected(support: tuple[tuple[int, int], ...]) -> tuple[tuple[int, int], ...]:
    return tuple(sorted((16 - left, 16 - right) for left, right in support))


def support_from_record(record: dict) -> tuple[tuple[int, int], ...]:
    hits = set()
    for path in record["core"]["paths"]:
        for step in path["steps"]:
            if step["kind"] == "row":
                center = int(step["center"])
                hits.add((center, int(step["first"])))
                hits.add((center, int(step["second"])))
    return tuple(sorted(hits))


def centers_from_record(record: dict) -> frozenset[int]:
    return frozenset(
        step["center"]
        for path in record["core"]["paths"]
        for step in path["steps"]
        if "center" in step
    )


def minimal_sets(supports: set[tuple[tuple[int, int], ...]]) -> set[tuple[tuple[int, int], ...]]:
    sets = {support: frozenset(support) for support in supports}
    return {
        support
        for support, value in sets.items()
        if not any(other < value for other in sets.values())
    }


def classify(support: tuple[tuple[int, int], ...], center_sets: set[frozenset[int]]) -> str:
    adjacency: dict[int, set[int]] = {}
    for left, right in support:
        adjacency.setdefault(left, set()).add(right)
        adjacency.setdefault(right, set()).add(left)
    if len(adjacency) != 6 or any(len(neighbors) != 2 for neighbors in adjacency.values()):
        return "one-overlap"
    color: dict[int, int] = {}
    start = next(iter(adjacency))
    color[start] = 0
    stack = [start]
    while stack:
        point = stack.pop()
        for neighbor in adjacency[point]:
            expected = 1 - color[point]
            if neighbor in color and color[neighbor] != expected:
                return "one-overlap"
            if neighbor not in color:
                color[neighbor] = expected
                stack.append(neighbor)
    partitions = {
        frozenset(point for point, value in color.items() if value == side)
        for side in (0, 1)
    }
    return "disjoint" if any(centers in partitions for centers in center_sets) else "one-overlap"


def main() -> None:
    replay = json.loads(REPLAY.read_text())
    source = replay["source_model"]
    order = tuple(source["selected_order"])
    rows = tuple(
        MetricRow(center, tuple(points), exact=True)
        for center, points in enumerate(source["rows"])
    )
    records = producer_bank.enumerate_two_kalmanson_cancellations(rows, 17, order)
    record_supports = {support_from_record(record) for record in records}
    support_centers: dict[tuple[tuple[int, int], ...], set[frozenset[int]]] = {}
    for record in records:
        support_centers.setdefault(support_from_record(record), set()).add(
            centers_from_record(record)
        )
    minimal = minimal_sets(record_supports)
    six_hit = {support for support in minimal if len(support) == 6}
    six_centers = {
        support: sorted(support_centers[support], key=lambda value: tuple(sorted(value)))
        for support in six_hit
    }
    classes = {support: classify(support, set(six_centers[support])) for support in six_hit}

    generated: dict[str, set[tuple[tuple[int, int], ...]]] = {
        name: set() for name in TEMPLATES
    }
    raw_counts = Counter()
    offsets = tuple(combinations(range(1, 17), 5))
    for direction in (1, -1):
        for cut in range(17):
            for chosen in offsets:
                labels = (order[cut],) + tuple(
                    order[(cut + direction * offset) % 17] for offset in chosen
                )
                for name, template in TEMPLATES.items():
                    support = tuple(sorted((labels[a], labels[b]) for a, b in template))
                    generated[name].add(support)
                    raw_counts[name] += 1

    hits = {
        name: sorted(support for support in six_hit if support in supports)
        for name, supports in generated.items()
    }
    reflection_hits = {
        name: sorted(
            support for support in six_hit
            if support in supports or reflected(support) in supports
        )
        for name, supports in generated.items()
    }
    covered = set().union(*map(set, hits.values()))
    reflection_covered = set().union(*map(set, reflection_hits.values()))
    overlap = {
        f"{left}∩{right}": len(generated[left] & generated[right])
        for left, right in combinations(TEMPLATES, 2)
    }
    target_overlap = {
        f"{left}∩{right}": len(set(hits[left]) & set(hits[right]))
        for left, right in combinations(TEMPLATES, 2)
    }
    reflection_target_overlap = {
        f"{left}∩{right}": len(set(reflection_hits[left]) & set(reflection_hits[right]))
        for left, right in combinations(TEMPLATES, 2)
    }
    result = {
        "replay": str(REPLAY.relative_to(ROOT)),
        "selected_order": list(order),
        "producer_records": len(records),
        "producer_distinct_supports": len(record_supports),
        "producer_minimal_supports": len(minimal),
        "producer_minimal_six_hit": len(six_hit),
        "target_counts": Counter(classes.values()),
        "raw_placements_per_template": dict(raw_counts),
        "generated_unique_per_template": {name: len(value) for name, value in generated.items()},
        "generated_template_intersections": overlap,
        "hits_per_template": {name: len(value) for name, value in hits.items()},
        "target_template_intersections": target_overlap,
        "reflection_hits_per_template": {name: len(value) for name, value in reflection_hits.items()},
        "reflection_target_template_intersections": reflection_target_overlap,
        "covered_six_hit": len(covered),
        "covered_disjoint": sum(classes[support] == "disjoint" for support in covered),
        "covered_one_overlap": sum(classes[support] == "one-overlap" for support in covered),
        "reflection_covered_six_hit": len(reflection_covered),
        "reflection_covered_disjoint": sum(classes[support] == "disjoint" for support in reflection_covered),
        "reflection_covered_one_overlap": sum(classes[support] == "one-overlap" for support in reflection_covered),
        "all_six_hit": [
            {"support": [list(pair) for pair in support], "kind": classes[support],
             "centers": [sorted(value) for value in six_centers[support]],
             "templates": [name for name in TEMPLATES if support in generated[name]],
             "reflection_templates": [name for name in TEMPLATES if support in reflection_hits[name]]}
            for support in sorted(six_hit)
        ],
    }
    OUT.write_text(json.dumps(result, sort_keys=True, indent=2) + "\n")
    print(json.dumps({key: result[key] for key in (
        "selected_order", "producer_records", "producer_distinct_supports",
        "producer_minimal_supports", "producer_minimal_six_hit", "target_counts",
        "raw_placements_per_template", "generated_unique_per_template",
        "generated_template_intersections", "hits_per_template",
        "target_template_intersections", "covered_six_hit", "covered_disjoint",
        "covered_one_overlap", "reflection_hits_per_template",
        "reflection_target_template_intersections", "reflection_covered_six_hit",
        "reflection_covered_disjoint", "reflection_covered_one_overlap")}, sort_keys=True))
    print(OUT)


if __name__ == "__main__":
    main()

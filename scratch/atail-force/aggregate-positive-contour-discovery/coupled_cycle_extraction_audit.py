#!/usr/bin/env python3
"""Search the exact-core bank for constructive coupled Kalmanson cycles.

A selected-row equality cycle alternates distinct row centers and distinct
target points.  It therefore has two perfect matchings, one using the target
before each row edge and one using the target after it.  The row equalities
make the total lengths of these matchings equal.

For four cyclically ordered points, a strict K1/K2 inequality says that the
crossing pairing is longer than either noncrossing pairing.  This script asks
for more than LRA infeasibility: it searches for a directed sequence of these
crossing-improving two-switches from one alternating matching to the other.
The sequence telescopes to a positive Kalmanson contour whose boundary is
exactly the selected-row equality cycle.

This is an exact bounded audit of the stored finite bank.  It is theorem-
discovery tooling, not a uniform extraction proof and not a Lean proof.
"""

from __future__ import annotations

import argparse
import collections
import itertools
import json
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterator


HERE = Path(__file__).resolve().parent
DEFAULT_BANK = (
    HERE.parent
    / "exact6-allcenter-capaware-gate"
    / "combined_round1_round2_minimized_schema_bank.json"
)
DEFAULT_OUTPUT = HERE / "coupled_cycle_extraction_audit.json"
SCHEMA = "p97-atail-coupled-cycle-extraction-audit-v1"

Edge = tuple[int, int]
State = tuple[int, ...]


def edge(left: int, right: int) -> Edge:
    if left == right:
        raise ValueError("distance loop")
    return (left, right) if left < right else (right, left)


def pairing(*pairs: tuple[int, int]) -> frozenset[Edge]:
    return frozenset(edge(left, right) for left, right in pairs)


def crossing_pairing(labels: tuple[int, int, int, int]) -> frozenset[Edge]:
    a, b, c, d = sorted(labels)
    return pairing((a, c), (b, d))


def improving_switch(
    state: State, first: int, second: int, centers: tuple[int, ...]
) -> tuple[State, dict[str, Any]] | None:
    c1, c2 = centers[first], centers[second]
    t1, t2 = state[first], state[second]
    labels = (c1, c2, t1, t2)
    if len(set(labels)) != 4:
        return None
    current = pairing((c1, t1), (c2, t2))
    following = pairing((c1, t2), (c2, t1))
    crossing = crossing_pairing(labels)
    if following != crossing or current == crossing:
        return None
    ordered = tuple(sorted(labels))
    a, b, c, d = ordered
    kind = 1 if current == pairing((a, b), (c, d)) else 2
    expected = pairing((a, b), (c, d)) if kind == 1 else pairing((a, d), (b, c))
    if current != expected:
        raise AssertionError("noncrossing assignment is not K1 or K2 boundary")
    answer = list(state)
    answer[first], answer[second] = answer[second], answer[first]
    if centers[first] == answer[first] or centers[second] == answer[second]:
        return None
    return tuple(answer), {
        "center_positions": [first, second],
        "centers": [c1, c2],
        "targets_before": [t1, t2],
        "targets_after": [t2, t1],
        "kalmanson_kind": kind,
        "cyclic_quadruple": list(ordered),
    }


def switch_path(
    centers: tuple[int, ...], start: State, goal: State
) -> list[dict[str, Any]] | None:
    if start == goal:
        return []
    queue = collections.deque([start])
    previous: dict[State, tuple[State, dict[str, Any]] | None] = {start: None}
    while queue:
        state = queue.popleft()
        for first, second in itertools.combinations(range(len(centers)), 2):
            result = improving_switch(state, first, second, centers)
            if result is None:
                continue
            following, move = result
            if following in previous:
                continue
            previous[following] = state, move
            if following == goal:
                path = []
                cursor = following
                while cursor != start:
                    predecessor, step = previous[cursor]  # type: ignore[misc]
                    path.append(step)
                    cursor = predecessor
                path.reverse()
                return path
            queue.append(following)
    return None


def vector_add(
    total: dict[Edge, int], terms: dict[Edge, int], multiplier: int = 1
) -> None:
    for item, coefficient in terms.items():
        total[item] = total.get(item, 0) + multiplier * coefficient
        if not total[item]:
            del total[item]


def matching_vector(centers: tuple[int, ...], targets: State) -> dict[Edge, int]:
    answer: dict[Edge, int] = collections.defaultdict(int)
    for center, target in zip(centers, targets, strict=True):
        answer[edge(center, target)] += 1
    return dict(answer)


def kalmanson_vector(kind: int, labels: list[int]) -> dict[Edge, int]:
    a, b, c, d = labels
    answer: dict[Edge, int] = collections.defaultdict(int)
    answer[edge(a, c)] += 1
    answer[edge(b, d)] += 1
    negative = ((a, b), (c, d)) if kind == 1 else ((a, d), (b, c))
    for left, right in negative:
        answer[edge(left, right)] -= 1
    return {item: value for item, value in answer.items() if value}


def replay_path(
    centers: tuple[int, ...], start: State, goal: State, path: list[dict[str, Any]]
) -> None:
    cursor = start
    strict_sum: dict[Edge, int] = {}
    for move in path:
        first, second = move["center_positions"]
        result = improving_switch(cursor, first, second, centers)
        if result is None:
            raise AssertionError("stored switch is not improving")
        following, replayed = result
        if replayed != move:
            raise AssertionError("stored switch metadata drift")
        vector_add(
            strict_sum,
            kalmanson_vector(move["kalmanson_kind"], move["cyclic_quadruple"]),
        )
        cursor = following
    if cursor != goal:
        raise AssertionError("switch path misses goal matching")
    boundary = matching_vector(centers, goal)
    vector_add(boundary, matching_vector(centers, start), -1)
    if strict_sum != boundary:
        raise AssertionError(
            f"switch contour does not telescope: {strict_sum=} {boundary=}"
        )


@dataclass(frozen=True)
class EqualityCycle:
    """Rows[i] equates distances to targets[i] and targets[i+1]."""

    centers: tuple[int, ...]
    targets: tuple[int, ...]

    @property
    def size(self) -> int:
        return len(self.centers)


def cycle_key(cycle: EqualityCycle) -> tuple[tuple[int, int, int], ...]:
    triples = tuple(
        (
            cycle.centers[index],
            cycle.targets[index],
            cycle.targets[(index + 1) % cycle.size],
        )
        for index in range(cycle.size)
    )
    rotations = []
    for oriented in (triples, tuple((c, right, left) for c, left, right in reversed(triples))):
        for offset in range(cycle.size):
            rotations.append(oriented[offset:] + oriented[:offset])
    return min(rotations)


def equality_cycles(
    schema: dict[str, Any], minimum_size: int, maximum_size: int
) -> Iterator[EqualityCycle]:
    supports: dict[int, set[int]] = collections.defaultdict(set)
    for center, target in schema["order_schema"]:
        supports[center].add(target)
    adjacency: dict[int, list[tuple[int, int]]] = collections.defaultdict(list)
    for center, targets in supports.items():
        for left, right in itertools.combinations(sorted(targets), 2):
            adjacency[left].append((center, right))
            adjacency[right].append((center, left))
    seen: set[tuple[tuple[int, int, int], ...]] = set()
    for start in sorted(adjacency):
        # Requiring start to be the smallest target gives one starting point
        # for each target-simple cycle; cycle_key removes the two orientations.
        stack: list[tuple[int, tuple[int, ...], tuple[int, ...], tuple[int, ...]]] = [
            (start, (start,), (), ())
        ]
        while stack:
            current, targets, centers, used_centers = stack.pop()
            for center, following in adjacency[current]:
                if center in used_centers:
                    continue
                if following == start:
                    if len(centers) + 1 < minimum_size:
                        continue
                    cycle = EqualityCycle(centers + (center,), targets)
                    key = cycle_key(cycle)
                    if key not in seen:
                        seen.add(key)
                        yield cycle
                    continue
                if len(centers) + 1 >= maximum_size:
                    continue
                if following in targets or following < start:
                    continue
                stack.append(
                    (
                        following,
                        targets + (following,),
                        centers + (center,),
                        used_centers + (center,),
                    )
                )


def favorable_witness(cycle: EqualityCycle) -> dict[str, Any] | None:
    left = cycle.targets
    right = cycle.targets[1:] + cycle.targets[:1]
    for start_name, start, goal_name, goal in (
        ("left", left, "right", right),
        ("right", right, "left", left),
    ):
        path = switch_path(cycle.centers, start, goal)
        if path is None:
            continue
        replay_path(cycle.centers, start, goal, path)
        return {
            "cycle_size": cycle.size,
            "centers": list(cycle.centers),
            "targets": list(cycle.targets),
            "start_matching": start_name,
            "goal_matching": goal_name,
            "switch_count": len(path),
            "switches": path,
            "exact_telescoping_replay": True,
        }
    return None


def audit_schema(
    schema_index: int,
    schema: dict[str, Any],
    minimum_size: int,
    maximum_size: int,
) -> dict[str, Any]:
    cycle_count = 0
    size_histogram: collections.Counter[int] = collections.Counter()
    for cycle in equality_cycles(schema, minimum_size, maximum_size):
        cycle_count += 1
        size_histogram[cycle.size] += 1
        witness = favorable_witness(cycle)
        if witness is not None:
            return {
                "schema_index": schema_index,
                "core_vertex_count": schema["core_vertex_count"],
                "search_status": "FAVORABLE_COUPLED_CYCLE",
                "cycles_tested": cycle_count,
                "tested_size_histogram": dict(sorted(size_histogram.items())),
                "witness": witness,
            }
    return {
        "schema_index": schema_index,
        "core_vertex_count": schema["core_vertex_count"],
        "search_status": "NO_FAVORABLE_CYCLE_WITHIN_BOUND",
        "cycles_tested": cycle_count,
        "tested_size_histogram": dict(sorted(size_histogram.items())),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--bank", type=Path, default=DEFAULT_BANK)
    parser.add_argument("--min-size", type=int, default=3)
    parser.add_argument("--max-size", type=int, default=8)
    parser.add_argument("--start-index", type=int, default=0)
    parser.add_argument("--stop-index", type=int)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()
    if args.min_size < 3 or args.max_size < args.min_size:
        raise SystemExit("invalid cycle-size bounds")

    bank = json.loads(args.bank.read_text(encoding="utf-8"))
    schemas = bank["schemas"]
    stop = len(schemas) if args.stop_index is None else args.stop_index
    if not (0 <= args.start_index <= stop <= len(schemas)):
        raise SystemExit("invalid schema-index range")
    records = [
        audit_schema(index, schemas[index], args.min_size, args.max_size)
        for index in range(args.start_index, stop)
    ]
    status_histogram = collections.Counter(record["search_status"] for record in records)
    witnesses = [record["witness"] for record in records if "witness" in record]
    payload = {
        "schema": SCHEMA,
        "epistemic_status": "EXACT_BOUNDED_COMBINATORIAL_AUDIT_NOT_UNIFORM_LEAN_COVERAGE",
        "source_bank": str(args.bank),
        "source_schema_count": len(schemas),
        "start_index": args.start_index,
        "stop_index": stop,
        "minimum_cycle_size": args.min_size,
        "maximum_cycle_size": args.max_size,
        "status_histogram": dict(sorted(status_histogram.items())),
        "favorable_cycle_size_histogram": dict(
            sorted(collections.Counter(w["cycle_size"] for w in witnesses).items())
        ),
        "switch_count_histogram": dict(
            sorted(collections.Counter(w["switch_count"] for w in witnesses).items())
        ),
        "records": records,
    }
    args.output.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

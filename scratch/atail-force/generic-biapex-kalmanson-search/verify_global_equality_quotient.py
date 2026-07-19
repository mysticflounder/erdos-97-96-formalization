#!/usr/bin/env python3
"""Independent combinatorial verifier for global-equality CEGAR payloads."""

from __future__ import annotations

import argparse
import itertools
import json
from collections import deque
from pathlib import Path

import global_equality_quotient_cegar as probe


def verify_refinement(refinement: dict[str, object], n: int) -> None:
    required = tuple(tuple(item) for item in refinement["required_memberships"])
    partial_rows: dict[int, list[int]] = {}
    for center, point in required:
        if center == point:
            raise AssertionError("self membership in refinement")
        partial_rows.setdefault(center, []).append(point)
    rows = {
        center: tuple(sorted(set(support)))
        for center, support in partial_rows.items()
    }
    closure, _adjacency = probe.equality_closure(rows, n)
    a, b, c, d = (int(item) for item in refinement["quadruple"])
    if not a < b < c < d:
        raise AssertionError("Kalmanson quadruple is not increasing")
    diagonals = (probe.distance_term(a, c), probe.distance_term(b, d))
    if refinement["kind"] == "K1":
        sides = (probe.distance_term(a, b), probe.distance_term(c, d))
    elif refinement["kind"] == "K2":
        sides = (probe.distance_term(a, d), probe.distance_term(b, c))
    else:
        raise AssertionError("unknown Kalmanson kind")
    if sorted(closure.find(term) for term in diagonals) != sorted(
        closure.find(term) for term in sides
    ):
        raise AssertionError("required memberships do not force the collision")

    complete = tuple(
        sorted(
            {a, b, c, d}
            | {vertex for membership in required for vertex in membership}
        )
    )
    if complete != tuple(refinement["complete_core_vertices"]):
        raise AssertionError("incomplete or padded core vertex set")
    role = {vertex: index for index, vertex in enumerate(complete)}
    schema = tuple(sorted((role[center], role[point]) for center, point in required))
    reflected = tuple(
        sorted(
            (len(complete) - 1 - center, len(complete) - 1 - point)
            for center, point in schema
        )
    )
    if tuple(tuple(item) for item in refinement["order_schema"]) != min(
        schema, reflected
    ):
        raise AssertionError("stored canonical order schema mismatch")


def strongly_connected(rows: dict[int, tuple[int, ...]], n: int) -> bool:
    def reached(start: int, reverse: bool) -> set[int]:
        seen = {start}
        queue = deque([start])
        while queue:
            current = queue.popleft()
            following = (
                (center for center in range(n) if current in rows[center])
                if reverse
                else iter(rows[current])
            )
            for point in following:
                if point not in seen:
                    seen.add(point)
                    queue.append(point)
        return seen

    return all(
        len(reached(start, reverse)) == n
        for start in range(n)
        for reverse in (False, True)
    )


def verify_sat(result: dict[str, object]) -> None:
    n = int(result["n"])
    rows = {
        int(center): tuple(int(point) for point in support)
        for center, support in result["rows"].items()
    }
    if set(rows) != set(range(n)):
        raise AssertionError("row table is not total")
    for center, support in rows.items():
        if len(support) != 4 or len(set(support)) != 4 or center in support:
            raise AssertionError("invalid selected row")
    for left, right in itertools.combinations(range(n), 2):
        if len(set(rows[left]) & set(rows[right])) > 2:
            raise AssertionError("row intersection bound failed")
    for first, second in itertools.combinations(range(n), 2):
        if sum(first in rows[center] and second in rows[center] for center in range(n)) > 2:
            raise AssertionError("pair-center bound failed")
    for center_left, center_right in itertools.combinations(range(n), 2):
        common = set(rows[center_left]) & set(rows[center_right])
        for point_left, point_right in itertools.combinations(common, 2):
            if point_left in {center_left, center_right} or point_right in {
                center_left,
                center_right,
            }:
                continue
            alternates = (center_left < point_left < center_right) != (
                center_left < point_right < center_right
            )
            if not alternates:
                raise AssertionError("shared-pair alternation failed")
    if not strongly_connected(rows, n):
        raise AssertionError("selected-row graph is not strongly connected")

    first_apex, second_apex = (int(item) for item in result["omitted_apices"])
    blockers = {int(source): int(center) for source, center in result["blockers"].items()}
    if set(blockers) != set(range(n)):
        raise AssertionError("blocker map is not total")
    for source, center in blockers.items():
        if center in {source, first_apex, second_apex}:
            raise AssertionError("invalid blocker value")
        if source not in rows[center]:
            raise AssertionError("source absent from blocker row")
    if probe.all_collisions(rows, n):
        raise AssertionError("SAT payload still has a quotient collision")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("payload", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = json.loads(args.payload.read_text(encoding="utf-8"))
    if result.get("schema") != "p97-global-equality-quotient-kalmanson-cegar-v1":
        raise AssertionError("unexpected payload schema")
    n = int(result["n"])
    for refinement in result["refinements"]:
        verify_refinement(refinement, n)
    if result["status"] == "SAT_GLOBAL_EQUALITY_QUOTIENT_SURVIVOR":
        verify_sat(result)
    rendered = json.dumps(
        {
            "status": "VERIFIED",
            "source_status": result["status"],
            "n": n,
            "refinement_count": len(result["refinements"]),
            "all_refinement_cores_force_recorded_collision": True,
            "sat_payload_checked": result["status"]
            == "SAT_GLOBAL_EQUALITY_QUOTIENT_SURVIVOR",
        },
        indent=2,
        sort_keys=True,
    ) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

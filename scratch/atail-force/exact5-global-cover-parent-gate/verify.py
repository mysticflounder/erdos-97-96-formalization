#!/usr/bin/env python3
"""Solver-independent verifier for card-13 exact-five B0 assignments."""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path
from typing import Iterable


N = 13
VERTICES = tuple(range(N))
VSET = set(VERTICES)
THIRD_VERTEX = 0
FIRST_APEX = 4
SECOND_APEX = 8
SURPLUS_CAP = frozenset((4, 5, 6, 7, 8))
OPP_CAP1 = frozenset((8, 9, 10, 11, 12, 0))
PHYSICAL_CAP = frozenset((0, 1, 2, 3, 4))
PHYSICAL_INTERIOR = frozenset((1, 2, 3))
CAPS = (SURPLUS_CAP, OPP_CAP1, PHYSICAL_CAP)
CAP_ENDPOINTS = ((4, 8), (8, 0), (0, 4))

ORBIT_ROLES = {
    "asymmetricSourceLeft": {"hub": 2, "spoke1": 1, "spoke2": 3,
                              "source": 1, "third": 3},
    "asymmetricSourceRight": {"hub": 2, "spoke1": 1, "spoke2": 3,
                               "source": 3, "third": 1},
    "allOneHitHubLeft": {"hub": 1, "spoke1": 2, "spoke2": 3},
    "allOneHitHubMiddle": {"hub": 2, "spoke1": 1, "spoke2": 3},
    "allOneHitHubRight": {"hub": 3, "spoke1": 1, "spoke2": 2},
}


def strongly_connected(rows: dict[int, set[int]]) -> bool:
    def reachable(start: int, reverse: bool) -> set[int]:
        seen = {start}
        todo = [start]
        while todo:
            current = todo.pop()
            if reverse:
                nxt = {c for c, support in rows.items() if current in support}
            else:
                nxt = rows[current]
            for point in nxt - seen:
                seen.add(point)
                todo.append(point)
        return seen

    return reachable(0, False) == VSET and reachable(0, True) == VSET


def sink_sccs(rows: dict[int, set[int]]) -> list[set[int]]:
    """Small deterministic SCC routine used only to produce lazy cuts."""
    index = 0
    stack: list[int] = []
    on_stack: set[int] = set()
    indices: dict[int, int] = {}
    low: dict[int, int] = {}
    components: list[set[int]] = []

    def visit(vertex: int) -> None:
        nonlocal index
        indices[vertex] = index
        low[vertex] = index
        index += 1
        stack.append(vertex)
        on_stack.add(vertex)
        for nxt in rows[vertex]:
            if nxt not in indices:
                visit(nxt)
                low[vertex] = min(low[vertex], low[nxt])
            elif nxt in on_stack:
                low[vertex] = min(low[vertex], indices[nxt])
        if low[vertex] == indices[vertex]:
            component: set[int] = set()
            while True:
                point = stack.pop()
                on_stack.remove(point)
                component.add(point)
                if point == vertex:
                    break
            components.append(component)

    for vertex in VERTICES:
        if vertex not in indices:
            visit(vertex)
    sinks = []
    for component in components:
        if not any(
            target not in component
            for center in component
            for target in rows[center]
        ):
            sinks.append(component)
    return sinks


def _rows(raw: dict[str, list[int]]) -> dict[int, set[int]]:
    return {int(center): set(support) for center, support in raw.items()}


def _check_row_family(rows: dict[int, set[int]], name: str,
                      errors: list[str]) -> None:
    if set(rows) != VSET:
        errors.append(f"{name}: center domain mismatch")
        return
    for center, support in rows.items():
        if len(support) != 4 or center in support or not support <= VSET:
            errors.append(f"{name}: invalid row {center}->{sorted(support)}")
    for left, right in itertools.combinations(VERTICES, 2):
        if len(rows[left] & rows[right]) > 2:
            errors.append(f"{name}: rows {left},{right} overlap above two")
    for first, second in itertools.combinations(VERTICES, 2):
        centers = sum(
            first in rows[center] and second in rows[center]
            for center in VERTICES
        )
        if centers > 2:
            errors.append(f"{name}: pair {first},{second} has {centers} centers")
    for left, right in itertools.combinations(VERTICES, 2):
        shared = rows[left] & rows[right]
        for a, b in itertools.combinations(sorted(shared), 2):
            if a in {left, right} or b in {left, right}:
                continue
            a_inside = left < a < right
            b_inside = left < b < right
            if a_inside == b_inside:
                errors.append(
                    f"{name}: nonalternating centers {left},{right} pair {a},{b}"
                )
    for cap, endpoints in zip(CAPS, CAP_ENDPOINTS, strict=True):
        for center in cap:
            if len(rows[center] & cap) > 2:
                errors.append(f"{name}: cap row {center} has above two cap hits")
        for center in endpoints:
            if len(rows[center] & cap) > 1:
                errors.append(f"{name}: endpoint {center} has above one cap hit")
        outside = VSET - set(cap)
        for left, right in itertools.combinations(sorted(cap), 2):
            if len(rows[left] & rows[right] & outside) > 1:
                errors.append(
                    f"{name}: cap centers {left},{right} share outside pair"
                )


def _check_cross_family(row_families: list[dict[int, set[int]]],
                        b1: set[int], errors: list[str]) -> None:
    instances = {
        center: [family[center] for family in row_families]
        for center in VERTICES
    }
    instances[FIRST_APEX].append(b1)
    for left, right in itertools.combinations(VERTICES, 2):
        for left_row in instances[left]:
            for right_row in instances[right]:
                shared = left_row & right_row
                if len(shared) > 2:
                    errors.append(
                        f"cross-family rows {left},{right} overlap above two"
                    )
                for a, b in itertools.combinations(sorted(shared), 2):
                    if a in {left, right} or b in {left, right}:
                        continue
                    if (left < a < right) == (left < b < right):
                        errors.append(
                            f"cross-family nonalternating {left},{right};{a},{b}"
                        )
    for a, b in itertools.combinations(VERTICES, 2):
        center_count = sum(
            any({a, b} <= row for row in instances[center])
            for center in VERTICES
        )
        if center_count > 2:
            errors.append(
                f"cross-family pair {a},{b} has {center_count} centers"
            )
    for cap in CAPS:
        outside = VSET - set(cap)
        for left, right in itertools.combinations(sorted(cap), 2):
            for left_row in instances[left]:
                for right_row in instances[right]:
                    if len(left_row & right_row & outside) > 1:
                        errors.append(
                            f"cross-family cap centers {left},{right} share outside pair"
                        )


def verify_decoded(data: dict[str, object]) -> list[str]:
    errors: list[str] = []
    orbit = str(data.get("orbit"))
    if orbit not in ORBIT_ROLES:
        return [f"unknown orbit {orbit}"]
    roles = ORBIT_ROLES[orbit]
    if data.get("roles") != roles:
        errors.append("decoded roles disagree with orbit")

    rows = _rows(data["rows"])  # type: ignore[arg-type]
    cover_raw = data["cover_rows"]  # type: ignore[assignment]
    cover_rows = [_rows(raw) for raw in cover_raw]  # type: ignore[arg-type]
    if len(cover_rows) != 2:
        errors.append("cover row table count is not two")
        return errors
    _check_row_family(rows, "m", errors)
    for edge_index, family in enumerate(cover_rows):
        _check_row_family(family, f"g{edge_index}", errors)

    blockers = list(map(int, data["blockers"]))  # type: ignore[arg-type]
    if len(blockers) != N:
        errors.append("blocker vector length mismatch")
        return errors
    for source, center in enumerate(blockers):
        if center not in VSET or center in {source, FIRST_APEX, SECOND_APEX}:
            errors.append(f"invalid blocker {source}->{center}")
        elif source not in rows[center]:
            errors.append(f"source absent from blocker row {source}->{center}")

    shell = set(map(int, data["shell"]))  # type: ignore[arg-type]
    if len(shell) != 5 or SECOND_APEX in shell or not PHYSICAL_INTERIOR <= shell:
        errors.append("invalid exact-five shell base")
    if len(shell & (SURPLUS_CAP - {SECOND_APEX})) != 1:
        errors.append("shell does not have one surplus-adjacent hit")
    if len(shell & (OPP_CAP1 - {SECOND_APEX})) != 1:
        errors.append("shell does not have one first-opposite hit")
    if not rows[SECOND_APEX] <= shell:
        errors.append("selected second-apex row is not a shell subset")

    blocker_image = set(blockers)
    for center in blocker_image:
        for edge_index, family in enumerate(cover_rows):
            if family[center] != rows[center]:
                errors.append(
                    f"g{edge_index} is not synchronized with m at "
                    f"blocker-image center {center}"
                )
    for edge_index, family in enumerate(cover_rows):
        if not family[SECOND_APEX] <= shell:
            errors.append(
                f"g{edge_index} second-apex row is not a shell subset"
            )

    q = int(data["q"])
    w = int(data["w"])
    off_surplus = VSET - set(SURPLUS_CAP)
    if q == w or q not in off_surplus or w not in off_surplus:
        errors.append("invalid frontier pair")
    if q not in rows[FIRST_APEX] or w not in rows[FIRST_APEX]:
        errors.append("frontier pair absent from first-apex row")
    if q in rows[SECOND_APEX] or w in rows[SECOND_APEX]:
        errors.append("second double-deletion row contains frontier source")

    b1 = set(map(int, data["b1"]))  # type: ignore[arg-type]
    if len(b1) != 4 or FIRST_APEX in b1 or q in b1 or w in b1:
        errors.append("invalid first-apex double-deletion row")
    if len(b1 & rows[SECOND_APEX]) > 2:
        errors.append("retained apex rows overlap above two")
    for cap, endpoints in zip(CAPS, CAP_ENDPOINTS, strict=True):
        if FIRST_APEX in cap and len(b1 & cap) > 2:
            errors.append("b1 exceeds cap two-hit bound")
        if FIRST_APEX in endpoints and len(b1 & cap) > 1:
            errors.append("b1 exceeds endpoint one-hit bound")
    _check_cross_family([rows, *cover_rows], b1, errors)

    hub = roles["hub"]
    spokes = (roles["spoke1"], roles["spoke2"])
    for edge_index, spoke in enumerate(spokes):
        for center in VERTICES:
            if {hub, spoke} <= cover_rows[edge_index][center]:
                errors.append(
                    f"cover edge {edge_index} fails at center {center}"
                )
    for source, center in enumerate(blockers):
        for spoke in spokes:
            if {hub, spoke} <= rows[center]:
                errors.append(
                    f"actual row {source}->{center} violates global cover projection"
                )

    if orbit.startswith("asymmetric"):
        source = roles["source"]
        third = roles["third"]
        if blockers[source] != hub:
            errors.append("asymmetric source blocker is not the hub")
        if rows[hub] & PHYSICAL_CAP != {source, third}:
            errors.append("asymmetric hub row has wrong physical-cap pair")
        if len(rows[hub] - PHYSICAL_CAP) != 2:
            errors.append("asymmetric row does not have an outside pair")
        if rows[blockers[hub]] & PHYSICAL_INTERIOR != {hub}:
            errors.append("asymmetric hub actual row is not one-hit")
    else:
        physical_blockers = set()
        for source in PHYSICAL_INTERIOR:
            center = blockers[source]
            physical_blockers.add(center)
            if rows[center] & PHYSICAL_INTERIOR != {source}:
                errors.append(f"physical source {source} is not one-hit")
        if len(physical_blockers) != 3:
            errors.append("all-one-hit physical blockers are not distinct")

    for name, family in (("m", rows), ("g0", cover_rows[0]),
                         ("g1", cover_rows[1])):
        if not strongly_connected(family):
            errors.append(f"{name} selected-row graph is not strongly connected")
    return errors


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("result", type=Path)
    args = parser.parse_args()
    data = json.loads(args.result.read_text())
    if data.get("status") != "SAT":
        raise SystemExit(f"not a SAT result: {data.get('status')}")
    errors = verify_decoded(data["decoded"])
    if errors:
        for error in errors:
            print(error)
        raise SystemExit(1)
    print("VERIFIED card-13 exact-five B0 assignment")


if __name__ == "__main__":
    main()

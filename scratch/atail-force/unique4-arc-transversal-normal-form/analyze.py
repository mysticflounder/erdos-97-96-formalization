#!/usr/bin/env python3
"""Reproduce the bounded turn-arc checks used by REPORT.md.

This script audits only the stored n=11 selected-row projections.  Its output
is empirical/exact within those finite payloads; it is not a source-level Lean
coverage theorem.
"""

from __future__ import annotations

import itertools
import json
from pathlib import Path
from typing import Iterable


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
CENSUS = (
    ROOT / "scratch/atail-force/unique4-curvature-occurrence-census/census.json"
)
GLOBAL = ROOT / "scratch/atail-force/unique4-global-k4-curvature-packing"


def arc_supports(center: int, support: Iterable[int], n: int) -> tuple[set[int], set[int]]:
    offsets = sorted((center - point) % n for point in support)
    if len(offsets) != 4 or offsets[0] == 0:
        raise ValueError((center, sorted(support), offsets))
    start = (-center) % n
    left = {turn % n for turn in range(start, start + offsets[1] - 1)}
    right = {turn % n for turn in range(start + offsets[2], start + n - 1)}
    if left & right:
        raise AssertionError((center, left, right))
    return left, right


def rows_from_payload(payload: dict) -> dict[int, set[int]]:
    rows = payload["rows"]
    if isinstance(rows, dict):
        return {int(center): set(map(int, support)) for center, support in rows.items()}
    return {
        int(row["center"]): set(map(int, row["support"]))
        for row in rows
    }


def outer_unions(payload: dict) -> dict[int, set[int]]:
    n = int(payload["n"])
    return {
        center: set().union(*arc_supports(center, support, n))
        for center, support in rows_from_payload(payload).items()
    }


def two_row_witnesses(payload: dict) -> list[tuple[int, int]]:
    unions = outer_unions(payload)
    return [
        (i, j)
        for i, j in itertools.combinations(sorted(unions), 2)
        if unions[i].isdisjoint(unions[j])
    ]


def minimum_transversal(family: Iterable[set[int]], n: int) -> list[int]:
    sets = list(family)
    for size in range(n + 1):
        for choice in itertools.combinations(range(n), size):
            if all(set(choice) & member for member in sets):
                return list(choice)
    raise AssertionError("finite family has no transversal")


def selected_row_circle_intersection_violations(payload: dict) -> int:
    rows = rows_from_payload(payload)
    return sum(
        len(rows[i] & rows[j]) > 2
        for i, j in itertools.combinations(sorted(rows), 2)
    )


def main() -> None:
    census = json.loads(CENSUS.read_text())
    census_rows = []
    for record in census["records"]:
        path = ROOT / record["source"]
        payload = json.loads(path.read_text())
        witnesses = two_row_witnesses(payload)
        unions = outer_unions(payload)
        census_rows.append(
            {
                "source": record["source"],
                "two_row_witness_count": len(witnesses),
                "first_two_row_witness": list(witnesses[0]) if witnesses else None,
                "outer_union_transversal": minimum_transversal(
                    unions.values(), int(payload["n"])
                ),
            }
        )

    global_rows = []
    for path in sorted(GLOBAL.glob("exacttwo-opp1-*-strong.json")):
        payload = json.loads(path.read_text())
        unions = outer_unions(payload)
        arcs = [
            set(arc["turn_support"])
            for row in payload["rows"]
            for arc in row["arcs"]
        ]
        global_rows.append(
            {
                "source": str(path.relative_to(ROOT)),
                "two_row_witness_count": len(two_row_witnesses(payload)),
                "individual_arc_transversal": minimum_transversal(
                    arcs, int(payload["n"])
                ),
                "outer_union_transversal": minimum_transversal(
                    unions.values(), int(payload["n"])
                ),
                "selected_row_circle_intersection_violations":
                    selected_row_circle_intersection_violations(payload),
                "scope": payload["scope"],
            }
        )

    print(json.dumps({"census": census_rows, "global": global_rows}, indent=2))


if __name__ == "__main__":
    main()

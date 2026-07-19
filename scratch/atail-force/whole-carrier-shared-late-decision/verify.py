#!/usr/bin/env python3
"""Independent standard-library verifier for a whole-carrier SAT witness."""

from __future__ import annotations

import argparse
import itertools
import json
from collections import deque
from pathlib import Path
from typing import Mapping, Sequence


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def strongly_connected(rows: Mapping[int, frozenset[int]], n: int) -> bool:
    def reachable(start: int, reverse: bool) -> set[int]:
        seen = {start}
        pending = deque([start])
        while pending:
            vertex = pending.popleft()
            if reverse:
                neighbors = (
                    center for center in range(n) if vertex in rows[center]
                )
            else:
                neighbors = iter(rows[vertex])
            for neighbor in neighbors:
                if neighbor not in seen:
                    seen.add(neighbor)
                    pending.append(neighbor)
        return seen

    return len(reachable(0, False)) == n and len(reachable(0, True)) == n


def shared_late_pair(
    rows: Mapping[int, frozenset[int]], n: int, terminal_mode: str
) -> tuple[tuple[int, int], tuple[int, int]] | None:
    for a, b, c, d in itertools.combinations(range(n), 4):
        blocks = [((a, b), (c, d))]
        if terminal_mode == "cyclic":
            blocks.extend(
                [
                    ((b, c), (d, a)),
                    ((c, d), (a, b)),
                    ((d, a), (b, c)),
                ]
            )
        for centers, supports in blocks:
            if set(supports) <= rows[centers[0]] and set(supports) <= rows[centers[1]]:
                return centers, supports
    return None


def verify(payload: Mapping[str, object]) -> dict[str, object]:
    require(payload.get("status") == "SAT", "payload is not a SAT result")
    n = int(payload["n"])
    omitted_values = tuple(int(x) for x in payload["omitted_values"])
    terminal_mode = str(payload.get("terminal_mode", "linear"))
    require(terminal_mode in {"linear", "cyclic"}, "bad terminal mode")
    require(len(omitted_values) == 2, "expected two omitted values")
    raw_rows = payload["rows"]
    raw_blockers = payload["blockers"]
    require(isinstance(raw_rows, dict), "rows are not an object")
    require(isinstance(raw_blockers, dict), "blockers are not an object")
    rows = {
        int(center): frozenset(int(point) for point in support)
        for center, support in raw_rows.items()
    }
    blockers = {
        int(source): int(center) for source, center in raw_blockers.items()
    }
    carrier = set(range(n))
    require(set(rows) == carrier, "row centers are not the whole carrier")
    require(set(blockers) == carrier, "blocker map is not total")

    for center, support in rows.items():
        require(len(support) == 4, f"row {center} does not have size four")
        require(support <= carrier, f"row {center} leaves the carrier")
        require(center not in support, f"row {center} contains its center")

    maximum_row_intersection = max(
        len(rows[left] & rows[right])
        for left, right in itertools.combinations(range(n), 2)
    )
    require(maximum_row_intersection <= 2, "row-intersection bound fails")

    maximum_pair_center_count = 0
    for first, second in itertools.combinations(range(n), 2):
        count = sum(
            {first, second} <= rows[center] for center in range(n)
        )
        maximum_pair_center_count = max(maximum_pair_center_count, count)
        require(count <= 2, f"pair-center bound fails at {first},{second}")

    require(strongly_connected(rows, n), "selected-row digraph is not strong")
    for source, center in blockers.items():
        require(center in carrier, f"blocker({source}) leaves the carrier")
        require(center != source, f"blocker({source}) is fixed")
        require(center not in omitted_values, f"blocker image hits {center}")
        require(source in rows[center], f"blocker row omits source {source}")

    terminal = shared_late_pair(rows, n, terminal_mode)
    require(terminal is None, f"shared-late-pair terminal exists: {terminal}")
    return {
        "schema": "p97-whole-carrier-shared-late-verification-v1",
        "source_schema": payload.get("schema"),
        "n": n,
        "omitted_values": list(omitted_values),
        "terminal_mode": terminal_mode,
        "maximum_row_intersection": maximum_row_intersection,
        "maximum_pair_center_count": maximum_pair_center_count,
        "strongly_connected": True,
        "total_blocker_map": True,
        "shared_late_pair": None,
        "status": "PASS",
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    payload = json.loads(args.input.read_text(encoding="utf-8"))
    result = verify(payload)
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

#!/usr/bin/env python3
"""Independent standard-library verifier for an ordinal-coverage SAT model."""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path


def edge(left: int, right: int) -> tuple[int, int]:
    return tuple(sorted((left, right)))


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("model", type=Path)
    args = parser.parse_args()

    payload = json.loads(args.model.read_text(encoding="utf-8"))
    if payload["status"] != "SAT":
        raise SystemExit("input is not a SAT model")
    n = int(payload["n"])
    rows = {int(center): set(points) for center, points in payload["rows"].items()}
    ranks = {
        tuple(map(int, name.split(","))): int(value)
        for name, value in payload["ranks"].items()
    }

    assert set(rows) == set(range(n))
    for center, support in rows.items():
        assert len(support) == 4
        assert center not in support

    # Verify strong connectivity directly by forward reachability.
    for source in range(n):
        seen = {source}
        frontier = [source]
        while frontier:
            center = frontier.pop()
            for point in rows[center]:
                if point not in seen:
                    seen.add(point)
                    frontier.append(point)
        assert len(seen) == n, (source, sorted(seen))

    faithful = bool(payload.get("faithful_structural", False))
    if faithful:
        omitted = set(payload["omitted_apices"])
        blockers = {int(source): int(center) for source, center in payload["blockers"].items()}
        assert set(blockers) == set(range(n))
        for left, right in itertools.combinations(range(n), 2):
            assert len(rows[left] & rows[right]) <= 2
        for first, second in itertools.combinations(range(n), 2):
            assert sum(first in rows[c] and second in rows[c] for c in range(n)) <= 2
        for center_left, center_right in itertools.combinations(range(n), 2):
            shared = rows[center_left] & rows[center_right]
            for point_left, point_right in itertools.combinations(shared, 2):
                assert (center_left < point_left < center_right) != (
                    center_left < point_right < center_right
                )
        for source, center in blockers.items():
            assert center not in omitted
            assert center != source
            assert source in rows[center]

    checked = 0

    def check(
        center: int,
        first: int,
        second: int,
        smaller: tuple[int, int],
        larger: tuple[int, int],
    ) -> None:
        nonlocal checked
        if first in rows[center] and second in rows[center]:
            assert ranks[smaller] < ranks[larger], (
                center,
                first,
                second,
                smaller,
                larger,
                ranks[smaller],
                ranks[larger],
            )
            checked += 1

    for a, b, c, d in itertools.combinations(range(n), 4):
        check(a, b, c, edge(c, d), edge(b, d))
        check(d, b, c, edge(a, b), edge(a, c))
        check(b, a, d, edge(c, d), edge(a, c))
        check(c, a, d, edge(a, b), edge(b, d))
        check(a, c, d, edge(b, c), edge(b, d))
        check(b, c, d, edge(a, d), edge(a, c))
        check(c, a, b, edge(a, d), edge(b, d))
        check(d, a, b, edge(b, c), edge(a, c))

    print(
        json.dumps(
            {
                "status": "VERIFIED",
                "n": n,
                "rows": len(rows),
                "active_ordinal_implications": checked,
                "strongly_connected": True,
                "faithful_structural": faithful,
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

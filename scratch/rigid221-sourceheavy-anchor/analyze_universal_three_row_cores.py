#!/usr/bin/env python3
"""Mine direct three-row cores valid in every frozen boundary block order.

The output proposes cardinality-independent Lean consumers.  It only measures
the selected ordered-v4 artifacts; it is neither source coverage nor closure.
"""

from __future__ import annotations

from collections import defaultdict
import itertools
import json
from pathlib import Path


CUTS = Path(__file__).with_name("ordered-v4-cuts.jsonl")
TARGETS = {
    6302, 6303, 6956, 7536, 7808, 7952, 8077,
    8515, 8556, 8674, 8713, 9306, 10182,
}


def orders(*, forced_second: bool) -> tuple[tuple[int, ...], ...]:
    first_orders = itertools.permutations((10, 11))
    surplus_orders = tuple(itertools.permutations((3, 4, 5)))
    second_orders = (
        ((6, 7, 8, 9), (9, 8, 7, 6))
        if forced_second
        else tuple(itertools.permutations((6, 7, 8, 9)))
    )
    result = set()
    for first in first_orders:
        for surplus in surplus_orders:
            for second in second_orders:
                result.add((0, *second, 2, *surplus, 1, *first))
                result.add((0, *first, 1, *surplus, 2, *second))
    return tuple(sorted(result))


def cyclic(order: tuple[int, ...], triple: tuple[int, int, int]) -> bool:
    position = {label: index for index, label in enumerate(order)}
    a, b, c = (position[label] for label in triple)
    return (a < b < c) or (b < c < a) or (c < a < b)


def common(order: tuple[int, ...], core: tuple[int, int, int, int, int]) -> bool:
    a, x, b, c, y = core
    return (
        cyclic(order, (a, x, b)) and cyclic(order, (b, c, y))
    ) or (
        cyclic(order, (a, b, x)) and cyclic(order, (b, y, c))
    )


def direct_cores(rows: dict[int, set[int]]) -> set[tuple[int, int, int, int, int]]:
    result = set()
    labels = range(12)
    for a, x, b, c, y in itertools.permutations(labels, 5):
        if (
            {a, b} <= rows.get(x, set())
            and {a, b} <= rows.get(y, set())
            and {b, x, y} <= rows.get(c, set())
        ):
            result.add((a, x, b, c, y))
    return result


def requirements(core: tuple[int, int, int, int, int]) -> dict[int, list[int]]:
    a, x, b, c, y = core
    return {x: sorted((a, b)), y: sorted((a, b)), c: sorted((b, x, y))}


def main() -> None:
    forced_universe = orders(forced_second=True)
    unrestricted_universe = orders(forced_second=False)
    by_core: dict[tuple[int, int, int, int, int], list[int]] = defaultdict(list)
    counts: dict[int, int] = {}
    unrestricted_counts: dict[int, int] = {}
    found: set[int] = set()

    with CUTS.open(encoding="utf-8") as stream:
        for line in stream:
            record = json.loads(line)
            iteration = record.get("iteration")
            if iteration not in TARGETS:
                continue
            found.add(iteration)
            rows = {
                entry["center"]: set(entry["support"])
                for entry in record["rows"]
            }
            forced_universal = sorted(
                core for core in direct_cores(rows)
                if all(common(order, core) for order in forced_universe)
            )
            unrestricted_universal = [
                core for core in forced_universal
                if all(common(order, core) for order in unrestricted_universe)
            ]
            counts[iteration] = len(forced_universal)
            unrestricted_counts[iteration] = len(unrestricted_universal)
            for core in forced_universal:
                by_core[core].append(iteration)

    proposals = [
        {
            "core": core,
            "requirements": requirements(core),
            "iterations": iterations,
            "needs_forced_second_order": not all(
                common(order, core) for order in unrestricted_universe
            ),
        }
        for core, iterations in sorted(
            by_core.items(), key=lambda item: (-len(item[1]), item[0])
        )
    ]
    report = {
        "scope": "13 selected ordered-v4 artifacts; not source coverage",
        "forced_order_count": len(forced_universe),
        "unrestricted_order_count": len(unrestricted_universe),
        "forced_universal_core_counts": dict(sorted(counts.items())),
        "unrestricted_universal_core_counts": dict(sorted(unrestricted_counts.items())),
        "iterations_with_universal_core": sorted(
            iteration for iteration, count in counts.items() if count
        ),
        "missing_iterations": sorted(TARGETS - found),
        "proposals": proposals[:30],
    }
    print(json.dumps(report, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

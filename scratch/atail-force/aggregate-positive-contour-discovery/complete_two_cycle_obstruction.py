#!/usr/bin/env python3
"""Complete the smallest mixed two-cycle core to a full row system.

The partial exact core in ``INTERVAL_FLUX_NORMAL_FORM.md`` has two simple
incidence cycles, neither of which has one-signed circular-interval flux,
although their sum is positive.  A partial-row core does not by itself refute
single-cycle extraction from the live surface, where every center has four
targets and the selected digraph is strongly connected.

This exact finite CEGAR search asks whether the partial core can be completed
on its nine cyclic labels so that:

* every center has four distinct nonself targets;
* the selected digraph is strongly connected;
* every target pair shared by two rows alternates with its centers; and
* no simple selected-incidence cycle has one-signed nonzero interval flux.

A replayed SAT completion is a regression counterexample only to the
*single-cycle extraction* proposal.  It is not a Kalmanson metric model and
does not refute the aggregate coupled-cycle theorem.
"""

from __future__ import annotations

import argparse
import collections
import functools
import itertools
import json
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Iterator

import z3


HERE = Path(__file__).resolve().parent
DEFAULT_OUTPUT = HERE / "two_cycle_full_completion.json"
SCHEMA = "p97-atail-favorable-simple-cycle-completion-audit-v1"


@dataclass(frozen=True)
class EqualityCycle:
    """Center i contains targets i and i+1, cyclically."""

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
    reverse = tuple((center, right, left) for center, left, right in reversed(triples))
    rotations = []
    for oriented in (triples, reverse):
        for offset in range(cycle.size):
            rotations.append(oriented[offset:] + oriented[:offset])
    return min(rotations)


def equality_cycles(rows: dict[int, tuple[int, ...]]) -> Iterator[EqualityCycle]:
    adjacency: dict[int, list[tuple[int, int]]] = collections.defaultdict(list)
    for center, targets in rows.items():
        for left, right in itertools.combinations(targets, 2):
            adjacency[left].append((center, right))
            adjacency[right].append((center, left))
    seen: set[tuple[tuple[int, int, int], ...]] = set()
    for start in sorted(adjacency):
        stack: list[tuple[int, tuple[int, ...], tuple[int, ...]]] = [
            (start, (start,), ())
        ]
        while stack:
            current, targets, centers = stack.pop()
            for center, following in adjacency[current]:
                if center in centers:
                    continue
                if following == start:
                    if len(centers) < 2:
                        continue
                    cycle = EqualityCycle(centers + (center,), targets)
                    key = cycle_key(cycle)
                    if key not in seen:
                        seen.add(key)
                        yield cycle
                    continue
                if following in targets or following < start:
                    continue
                stack.append((following, targets + (following,), centers + (center,)))


@functools.cache
def interval_masks(n: int) -> tuple[int, ...]:
    return tuple(
        sum(1 << ((start + offset) % n) for offset in range(length))
        for length in range(2, n - 1)
        for start in range(n)
    )


@functools.cache
def incidence_flux_vector(n: int, center: int, target: int) -> tuple[int, ...]:
    return tuple(
        int(bool(mask & (1 << center)) and not bool(mask & (1 << target)))
        for mask in interval_masks(n)
    )


def interval_fluxes(n: int, cycle: EqualityCycle) -> tuple[int, ...]:
    circulation: dict[tuple[int, int], int] = collections.defaultdict(int)
    for index, center in enumerate(cycle.centers):
        circulation[center, cycle.targets[index]] += 1
        circulation[center, cycle.targets[(index + 1) % cycle.size]] -= 1
    answer = [0] * len(interval_masks(n))
    for (center, target), coefficient in circulation.items():
        for index, value in enumerate(incidence_flux_vector(n, center, target)):
            answer[index] += coefficient * value
    return tuple(answer)


def is_one_signed(n: int, cycle: EqualityCycle) -> bool:
    fluxes = interval_fluxes(n, cycle)
    return (min(fluxes) >= 0 and max(fluxes) > 0) or (
        max(fluxes) <= 0 and min(fluxes) < 0
    )


def strongly_connected(rows: dict[int, tuple[int, ...]]) -> bool:
    n = len(rows)

    def reachable(reverse: bool) -> set[int]:
        seen = {0}
        stack = [0]
        while stack:
            vertex = stack.pop()
            successors = (
                [center for center, targets in rows.items() if vertex in targets]
                if reverse
                else rows[vertex]
            )
            for following in successors:
                if following not in seen:
                    seen.add(following)
                    stack.append(following)
        return seen

    return reachable(False) == set(range(n)) and reachable(True) == set(range(n))


def pair_alternating(rows: dict[int, tuple[int, ...]]) -> bool:
    for left, right in itertools.combinations(rows, 2):
        common = set(rows[left]) & set(rows[right])
        for first, second in itertools.combinations(common, 2):
            first_inside = left < first < right
            second_inside = left < second < right
            if first_inside == second_inside:
                return False
    return True


def replay(
    rows: dict[int, tuple[int, ...]], *, require_fixed_core: bool
) -> dict[str, object]:
    n = len(rows)
    failures = []
    if set(rows) != set(range(n)):
        failures.append("row map is not total")
    for center, targets in rows.items():
        if len(targets) != 4 or len(set(targets)) != 4:
            failures.append(f"row {center} is not a four-set")
        if center in targets:
            failures.append(f"row {center} contains its center")
    if require_fixed_core:
        fixed = {0: {6, 8}, 6: {1, 7}, 7: {6, 8}, 8: {1, 7}}
        for center, targets in fixed.items():
            if not targets <= set(rows[center]):
                failures.append(f"row {center} omits fixed targets {sorted(targets)}")
    if not strongly_connected(rows):
        failures.append("selected digraph is not strongly connected")
    if not pair_alternating(rows):
        failures.append("a shared target pair does not alternate")
    favorable = [cycle for cycle in equality_cycles(rows) if is_one_signed(n, cycle)]
    if favorable:
        failures.append(f"found {len(favorable)} favorable simple cycles")
    return {
        "status": "VERIFIED" if not failures else "FAILED",
        "failures": failures,
        "simple_cycle_count": sum(1 for _ in equality_cycles(rows)),
        "favorable_simple_cycle_count": len(favorable),
    }


class CompletionSearch:
    def __init__(self, n: int, timeout_ms: int, *, require_fixed_core: bool) -> None:
        self.n = n
        self.solver = z3.Solver()
        self.solver.set(timeout=timeout_ms)
        self.member = {
            (center, target): z3.Bool(f"member_{center}_{target}")
            for center in range(n)
            for target in range(n)
            if center != target
        }
        for center in range(n):
            self.solver.add(
                z3.PbEq(
                    [(self.member[center, target], 1) for target in range(n) if target != center],
                    4,
                )
            )
        if require_fixed_core:
            fixed = {0: {6, 8}, 6: {1, 7}, 7: {6, 8}, 8: {1, 7}}
            for center, targets in fixed.items():
                for target in targets:
                    self.solver.add(self.member[center, target])
        self._add_pair_alternation()
        self._add_strong_connectivity()

    def _add_pair_alternation(self) -> None:
        for left, right in itertools.combinations(range(self.n), 2):
            other = [point for point in range(self.n) if point not in {left, right}]
            for first, second in itertools.combinations(other, 2):
                if (left < first < right) != (left < second < right):
                    continue
                self.solver.add(
                    z3.Or(
                        z3.Not(self.member[left, first]),
                        z3.Not(self.member[left, second]),
                        z3.Not(self.member[right, first]),
                        z3.Not(self.member[right, second]),
                    )
                )

    def _add_strong_connectivity(self) -> None:
        previous = {
            (source, target): (
                z3.BoolVal(True)
                if source == target
                else self.member[source, target]
            )
            for source in range(self.n)
            for target in range(self.n)
        }
        for via in range(self.n):
            current = {}
            for source in range(self.n):
                for target in range(self.n):
                    reachable = z3.Bool(f"reach_{via}_{source}_{target}")
                    self.solver.add(
                        reachable
                        == z3.Or(
                            previous[source, target],
                            z3.And(previous[source, via], previous[via, target]),
                        )
                    )
                    current[source, target] = reachable
            previous = current
        self.solver.add(*previous.values())

    def rows(self, model: z3.ModelRef) -> dict[int, tuple[int, ...]]:
        return {
            center: tuple(
                target
                for target in range(self.n)
                if target != center
                and z3.is_true(model.eval(self.member[center, target]))
            )
            for center in range(self.n)
        }

    def forbid_cycle(self, cycle: EqualityCycle) -> None:
        self.solver.add(
            z3.Or(
                *(
                    z3.Not(self.member[center, target])
                    for index, center in enumerate(cycle.centers)
                    for target in (
                        cycle.targets[index],
                        cycle.targets[(index + 1) % cycle.size],
                    )
                )
            )
        )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, default=9)
    parser.add_argument("--timeout-ms", type=int, default=600_000)
    parser.add_argument("--max-iterations", type=int, default=100_000)
    parser.add_argument("--cycle-batch", type=int, default=500)
    parser.add_argument("--no-fixed-core", action="store_true")
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()
    if args.n < 5:
        raise SystemExit("four distinct nonself targets require n >= 5")
    if args.n < 9 and not args.no_fixed_core:
        raise SystemExit("the fixed partial core uses labels through 8")

    started = time.monotonic()
    require_fixed_core = not args.no_fixed_core
    search = CompletionSearch(
        args.n, args.timeout_ms, require_fixed_core=require_fixed_core
    )
    blocked: set[tuple[tuple[int, int, int], ...]] = set()
    status = "ITERATION_LIMIT"
    rows: dict[int, tuple[int, ...]] | None = None
    for iteration in range(args.max_iterations):
        result = search.solver.check()
        if result != z3.sat:
            status = str(result).upper()
            break
        candidate = search.rows(search.solver.model())
        favorable = []
        for cycle in equality_cycles(candidate):
            key = cycle_key(cycle)
            if key not in blocked and is_one_signed(args.n, cycle):
                favorable.append(cycle)
                if len(favorable) >= args.cycle_batch:
                    break
        if not favorable:
            status = "SAT"
            rows = candidate
            break
        for cycle in favorable:
            blocked.add(cycle_key(cycle))
            search.forbid_cycle(cycle)
        if (iteration + 1) % 10 == 0:
            print(
                f"iterations={iteration + 1} forbidden_favorable_cycles={len(blocked)}",
                flush=True,
            )

    payload: dict[str, object] = {
        "schema": SCHEMA,
        "epistemic_status": (
            "EXACT_REPLAYED_FINITE_BOOLEAN_COUNTERMODEL"
            if status == "SAT"
            else "EXTERNAL_EXACT_Z3_RESULT_NOT_INDEPENDENTLY_CERTIFIED"
        ),
        "n": args.n,
        "search_mode": (
            "PINNED_TWO_CYCLE_COMPLETION"
            if require_fixed_core
            else "UNPINNED_FULL_ROW_TABLE"
        ),
        "fixed_partial_rows": {
            "0": [6, 8],
            "6": [1, 7],
            "7": [6, 8],
            "8": [1, 7],
        }
        if require_fixed_core
        else None,
        "search_status": status,
        "forbidden_favorable_cycle_count": len(blocked),
        "wall_seconds": time.monotonic() - started,
    }
    if rows is not None:
        payload["rows"] = {str(center): list(targets) for center, targets in rows.items()}
        payload["replay"] = replay(rows, require_fixed_core=require_fixed_core)
        if payload["replay"]["status"] != "VERIFIED":  # type: ignore[index]
            raise AssertionError(payload["replay"])
    args.output.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({key: value for key, value in payload.items() if key != "rows"}, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

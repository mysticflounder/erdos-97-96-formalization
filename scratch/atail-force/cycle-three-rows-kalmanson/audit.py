#!/usr/bin/env python3
"""Exact abstract-distance audit for all three period-three reverse rows.

This is deliberately not a Euclidean realizability test.  It enumerates the
possible identifications and complementary-chain orders of the six outside
row roles, subject to the checked pair-cardinality and pair-injectivity facts,
then tests ordinal Kalmanson closure.  The exact QF_LRA phase is added below
once the finite order census has been independently sanity checked.
"""

from __future__ import annotations

import argparse
from concurrent.futures import ProcessPoolExecutor
from collections.abc import Iterable, Iterator
from dataclasses import dataclass
from fractions import Fraction
import itertools
import json
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
ROLE_NAMES = tuple(f"{side}{row}" for row in range(3) for side in "xy")
ROW_ROLES = tuple((f"x{row}", f"y{row}") for row in range(3))
CAP_CORE = ("left", "q0", "c0", "c2", "q1", "c1", "q2", "right")
ROW_SOURCES = (("q0", "q1"), ("q1", "q2"), ("q2", "q0"))


def edge(a: str, b: str) -> tuple[str, str]:
    assert a != b
    return tuple(sorted((a, b)))


class UnionFind:
    def __init__(self, items: Iterable[tuple[str, str]]) -> None:
        self.parent = {item: item for item in items}

    def find(self, item: tuple[str, str]) -> tuple[str, str]:
        parent = self.parent[item]
        if parent != item:
            self.parent[item] = self.find(parent)
        return self.parent[item]

    def union(self, a: tuple[str, str], b: tuple[str, str]) -> None:
        ra, rb = self.find(a), self.find(b)
        if ra != rb:
            self.parent[max(ra, rb)] = min(ra, rb)


def set_partitions(items: tuple[str, ...]) -> Iterator[tuple[frozenset[str], ...]]:
    """Enumerate every set partition once, in restricted-growth order."""

    blocks: list[list[str]] = []

    def visit(index: int) -> Iterator[tuple[frozenset[str], ...]]:
        if index == len(items):
            yield tuple(frozenset(block) for block in blocks)
            return
        item = items[index]
        for block in blocks:
            block.append(item)
            yield from visit(index + 1)
            block.pop()
        blocks.append([item])
        yield from visit(index + 1)
        blocks.pop()

    yield from visit(0)


def partition_is_live(partition: tuple[frozenset[str], ...]) -> bool:
    role_block = {role: index for index, block in enumerate(partition) for role in block}
    outside_pairs = tuple(
        frozenset((role_block[first], role_block[second]))
        for first, second in ROW_ROLES
    )
    return (
        all(len(pair) == 2 for pair in outside_pairs)
        and len(set(outside_pairs)) == 3
    )


def swap_role(role: str, swaps: tuple[bool, bool, bool]) -> str:
    side, row = role[0], int(role[1])
    if swaps[row]:
        side = "y" if side == "x" else "x"
    return f"{side}{row}"


def canonical_order_key(
    left_side: tuple[frozenset[str], ...],
    right_side: tuple[frozenset[str], ...],
) -> tuple[tuple[tuple[str, ...], ...], tuple[tuple[str, ...], ...]]:
    """Quotient only the three independently unordered row pairs.

    The directed cap core is chiral: reversing its six internal labels does
    not preserve the source/blocker incidence pattern.  Hence reflection is
    intentionally *not* included here.
    """

    images = []
    for swaps in itertools.product((False, True), repeat=3):
        images.append((
            tuple(tuple(sorted(swap_role(role, swaps) for role in block)) for block in left_side),
            tuple(tuple(sorted(swap_role(role, swaps) for role in block)) for block in right_side),
        ))
    return min(images)


@dataclass(frozen=True)
class Case:
    key: str
    left_blocks: tuple[tuple[str, ...], ...]
    right_blocks: tuple[tuple[str, ...], ...]

    @property
    def blocks(self) -> tuple[tuple[str, ...], ...]:
        return self.left_blocks + self.right_blocks

    @property
    def target_count(self) -> int:
        return len(self.blocks)

    @property
    def target_for_role(self) -> dict[str, str]:
        return {
            role: "t_" + "_".join(block)
            for block in self.blocks
            for role in block
        }

    @property
    def order(self) -> tuple[str, ...]:
        left_targets = tuple("t_" + "_".join(block) for block in self.left_blocks)
        right_targets = tuple("t_" + "_".join(block) for block in self.right_blocks)
        return ("o",) + left_targets + CAP_CORE + right_targets


def enumerate_cases() -> list[Case]:
    seen: set[tuple[tuple[tuple[str, ...], ...], tuple[tuple[str, ...], ...]]] = set()
    result = []
    for partition in set_partitions(ROLE_NAMES):
        if not partition_is_live(partition):
            continue
        for ordered_blocks in itertools.permutations(partition):
            for split in range(len(partition) + 1):
                key = canonical_order_key(ordered_blocks[:split], ordered_blocks[split:])
                if key in seen:
                    continue
                seen.add(key)
                left, right = key
                result.append(Case(
                    key=f"k{len(partition)}_{len(result):04d}",
                    left_blocks=left,
                    right_blocks=right,
                ))
    return result


def equality_groups(case: Case) -> tuple[tuple[tuple[str, str], ...], ...]:
    target = case.target_for_role
    groups: list[tuple[tuple[str, str], ...]] = [
        tuple(edge("o", point) for point in ("left", "q0", "q1", "q2", "right")),
    ]
    for row, (source_a, source_b) in enumerate(ROW_SOURCES):
        groups.append(tuple(edge(f"c{row}", point) for point in (
            source_a, source_b, target[f"x{row}"], target[f"y{row}"],
        )))
    return tuple(groups)


def kalmanson_terms(
    order: tuple[str, ...],
) -> Iterator[
    tuple[
        str,
        tuple[tuple[str, str], tuple[str, str]],
        tuple[tuple[str, str], tuple[str, str]],
    ]
]:
    for a, b, c, d in itertools.combinations(order, 4):
        yield (
            f"K1({a},{b},{c},{d})",
            (edge(b, c), edge(a, d)),
            (edge(a, c), edge(b, d)),
        )
        yield (
            f"K2({a},{b},{c},{d})",
            (edge(a, b), edge(c, d)),
            (edge(a, c), edge(b, d)),
        )


def row_excluded_points(case: Case, row: int) -> tuple[str, ...]:
    target = case.target_for_role
    in_row = {
        *ROW_SOURCES[row],
        target[f"x{row}"],
        target[f"y{row}"],
    }
    return tuple(point for point in case.order if point != f"c{row}" and point not in in_row)


def ordinal_closure(case: Case) -> dict[str, object]:
    pairs = {edge(a, b) for a, b in itertools.combinations(case.order, 2)}
    uf = UnionFind(pairs)
    for group in equality_groups(case):
        for term in group[1:]:
            uf.union(group[0], term)

    named_class_conflicts = []
    physical = uf.find(edge("o", "left"))
    physical_class = {"left", "q0", "q1", "q2", "right"}
    for point in case.order:
        if point != "o" and point not in physical_class and uf.find(edge("o", point)) == physical:
            named_class_conflicts.append(f"physical:{point}")
    for row in range(3):
        radius = uf.find(edge(f"c{row}", ROW_SOURCES[row][0]))
        for point in row_excluded_points(case, row):
            if uf.find(edge(f"c{row}", point)) == radius:
                named_class_conflicts.append(f"row{row}:{point}")

    edges: set[tuple[tuple[str, str], tuple[str, str]]] = set()
    witnesses: dict[tuple[tuple[str, str], tuple[str, str]], str] = {}
    equal_sum_conflicts = []
    for label, lhs, rhs in kalmanson_terms(case.order):
        left = (uf.find(lhs[0]), uf.find(lhs[1]))
        right = (uf.find(rhs[0]), uf.find(rhs[1]))
        if sorted(left) == sorted(right):
            equal_sum_conflicts.append(label)
            continue
        for li in range(2):
            for ri in range(2):
                if left[li] == right[ri]:
                    comparison = (left[1 - li], right[1 - ri])
                    edges.add(comparison)
                    witnesses.setdefault(comparison, label)

    vertices = {uf.find(term) for term in pairs}
    adjacency: dict[tuple[str, str], set[tuple[str, str]]] = {vertex: set() for vertex in vertices}
    for source, sink in edges:
        adjacency[source].add(sink)

    # Reachability by one DFS per equivalence class is faster and less memory
    # hungry than repeated relational squaring for the 2,214-case census.
    cycles = []
    transitive_count = 0
    for start in vertices:
        reached = set()
        stack = list(adjacency[start])
        while stack:
            current = stack.pop()
            if current in reached:
                continue
            reached.add(current)
            stack.extend(adjacency[current] - reached)
        transitive_count += len(reached)
        if start in reached:
            cycles.append(start)

    status = (
        "UNSAT_ORDINAL"
        if named_class_conflicts or equal_sum_conflicts or cycles
        else "SAT_NOT_REFUTED_ORDINAL"
    )
    return {
        "status": status,
        "actual_outside_target_count": case.target_count,
        "distance_class_count": len(vertices),
        "direct_comparison_count": len(edges),
        "transitive_comparison_count": transitive_count,
        "named_class_conflicts": named_class_conflicts,
        "equal_sum_conflicts": equal_sum_conflicts,
        "strict_cycle_classes": [list(term) for term in sorted(cycles)],
        "sample_direct_comparisons": [
            {"less": list(source), "greater": list(sink), "from": witnesses[(source, sink)]}
            for source, sink in sorted(edges)[:20]
        ],
    }


def z3_fraction(value: z3.ArithRef) -> Fraction:
    value = z3.simplify(value)
    if not z3.is_rational_value(value):
        raise AssertionError(f"non-rational model value: {value}")
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def build_full_lra(case: Case, *, timeout_ms: int) -> tuple[
    z3.Solver,
    dict[tuple[str, str], z3.ArithRef],
    dict[str, int],
]:
    order = case.order
    pairs = sorted(edge(a, b) for a, b in itertools.combinations(order, 2))
    distance = {
        term: z3.Real(f"d__{case.key}__" + "__".join(term))
        for term in pairs
    }
    solver = z3.SolverFor("QF_LRA")
    solver.set(timeout=timeout_ms)

    for term in pairs:
        solver.add(distance[term] >= 1)

    triangle_count = 0
    for a, b, c in itertools.combinations(order, 3):
        solver.add(distance[edge(a, b)] <= distance[edge(a, c)] + distance[edge(b, c)])
        solver.add(distance[edge(a, c)] <= distance[edge(a, b)] + distance[edge(b, c)])
        solver.add(distance[edge(b, c)] <= distance[edge(a, b)] + distance[edge(a, c)])
        triangle_count += 3

    equality_count = 0
    for group in equality_groups(case):
        for term in group[1:]:
            solver.add(distance[term] == distance[group[0]])
            equality_count += 1

    exclusion_count = 0
    physical_radius = distance[edge("o", "left")]
    physical_class = {"left", "q0", "q1", "q2", "right"}
    for point in order:
        if point == "o" or point in physical_class:
            continue
        value = distance[edge("o", point)]
        solver.add(z3.Or(value + 1 <= physical_radius, physical_radius + 1 <= value))
        exclusion_count += 1
    for row in range(3):
        radius = distance[edge(f"c{row}", ROW_SOURCES[row][0])]
        for point in row_excluded_points(case, row):
            value = distance[edge(f"c{row}", point)]
            solver.add(z3.Or(value + 1 <= radius, radius + 1 <= value))
            exclusion_count += 1

    kalmanson_count = 0
    for _label, lhs, rhs in kalmanson_terms(order):
        solver.add(
            distance[lhs[0]] + distance[lhs[1]] + 1
            <= distance[rhs[0]] + distance[rhs[1]]
        )
        kalmanson_count += 1

    return solver, distance, {
        "point_count": len(order),
        "distance_variable_count": len(pairs),
        "positivity_count": len(pairs),
        "triangle_inequality_count": triangle_count,
        "row_equality_count": equality_count,
        "exact_named_class_exclusion_count": exclusion_count,
        "strict_kalmanson_count": kalmanson_count,
    }


def verify_sat_ledger(case: Case, ledger: dict[tuple[str, str], Fraction]) -> dict[str, str]:
    order = case.order
    expected = {edge(a, b) for a, b in itertools.combinations(order, 2)}
    assert set(ledger) == expected
    assert all(value >= 1 for value in ledger.values())

    minimum_triangle_slack: Fraction | None = None
    for a, b, c in itertools.combinations(order, 3):
        for lhs, rhs in (
            (ledger[edge(a, b)], ledger[edge(a, c)] + ledger[edge(b, c)]),
            (ledger[edge(a, c)], ledger[edge(a, b)] + ledger[edge(b, c)]),
            (ledger[edge(b, c)], ledger[edge(a, b)] + ledger[edge(a, c)]),
        ):
            slack = rhs - lhs
            assert slack >= 0
            minimum_triangle_slack = (
                slack
                if minimum_triangle_slack is None
                else min(minimum_triangle_slack, slack)
            )

    for group in equality_groups(case):
        assert all(ledger[term] == ledger[group[0]] for term in group)

    minimum_exclusion_gap: Fraction | None = None
    physical_radius = ledger[edge("o", "left")]
    physical_class = {"left", "q0", "q1", "q2", "right"}
    for point in order:
        if point == "o" or point in physical_class:
            continue
        gap = abs(ledger[edge("o", point)] - physical_radius)
        assert gap >= 1
        minimum_exclusion_gap = (
            gap
            if minimum_exclusion_gap is None
            else min(minimum_exclusion_gap, gap)
        )
    for row in range(3):
        radius = ledger[edge(f"c{row}", ROW_SOURCES[row][0])]
        for point in row_excluded_points(case, row):
            gap = abs(ledger[edge(f"c{row}", point)] - radius)
            assert gap >= 1
            minimum_exclusion_gap = (
                gap
                if minimum_exclusion_gap is None
                else min(minimum_exclusion_gap, gap)
            )

    minimum_kalmanson_slack = min(
        ledger[rhs[0]] + ledger[rhs[1]] - ledger[lhs[0]] - ledger[lhs[1]]
        for _label, lhs, rhs in kalmanson_terms(order)
    )
    assert minimum_kalmanson_slack >= 1
    assert minimum_triangle_slack is not None
    assert minimum_exclusion_gap is not None
    return {
        "minimum_distance": str(min(ledger.values())),
        "minimum_triangle_slack": str(minimum_triangle_slack),
        "minimum_exact_class_exclusion_gap": str(minimum_exclusion_gap),
        "minimum_strict_kalmanson_slack": str(minimum_kalmanson_slack),
    }


def solve_full_lra(payload: tuple[Case, int]) -> tuple[str, dict[str, object], dict[str, str]]:
    case, timeout_ms = payload
    solver, distance, counts = build_full_lra(case, timeout_ms=timeout_ms)
    status = solver.check()
    if status == z3.unknown:
        return case.key, {
            **counts,
            "status": "UNKNOWN",
            "reason_unknown": solver.reason_unknown(),
        }, {}
    if status == z3.unsat:
        return case.key, {
            **counts,
            "status": "UNSAT_Z3_CORE_NOT_YET_EXPORTED",
        }, {}

    model = solver.model()
    ledger = {
        term: z3_fraction(model.eval(variable, model_completion=True))
        for term, variable in distance.items()
    }
    margins = verify_sat_ledger(case, ledger)
    return case.key, {
        **counts,
        **margins,
        "status": "SAT_VERIFIED_RATIONAL_LRA_LEDGER",
    }, {"~".join(term): str(value) for term, value in sorted(ledger.items())}


def smoke_tests() -> None:
    partitions = [
        partition
        for partition in set_partitions(ROLE_NAMES)
        if partition_is_live(partition)
    ]
    counts = {size: sum(len(partition) == size for partition in partitions) for size in range(3, 7)}
    assert counts == {3: 8, 4: 32, 5: 12, 6: 1}
    assert len(enumerate_cases()) == 2214

    # Hand-checkable strict-Kalmanson four-point ledger.
    order = ("a", "b", "c", "d")
    ledger = {
        edge("a", "b"): Fraction(1),
        edge("b", "c"): Fraction(1),
        edge("c", "d"): Fraction(1),
        edge("a", "d"): Fraction(1),
        edge("a", "c"): Fraction(2),
        edge("b", "d"): Fraction(2),
    }
    for _label, lhs, rhs in kalmanson_terms(order):
        assert ledger[rhs[0]] + ledger[rhs[1]] > ledger[lhs[0]] + ledger[lhs[1]]

    # The same strict inequality is impossible when its two sums are equal.
    solver = z3.SolverFor("QF_LRA")
    variables = [z3.Real(f"smoke_{index}") for index in range(6)]
    solver.add(*(value == variables[0] for value in variables[1:]))
    solver.add(variables[0] + variables[1] + 1 <= variables[2] + variables[3])
    assert solver.check() == z3.unsat


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, default=HERE / "results.json")
    parser.add_argument("--ledgers", type=Path, default=HERE / "ledgers.json")
    parser.add_argument("--jobs", type=int, default=8)
    parser.add_argument("--timeout-ms", type=int, default=20_000)
    parser.add_argument("--ordinal-only", action="store_true")
    args = parser.parse_args()
    smoke_tests()
    cases = enumerate_cases()
    records: list[dict[str, object]] = []
    status_counts: dict[str, int] = {}
    target_counts: dict[str, dict[str, int]] = {}
    for index, case in enumerate(cases, start=1):
        ordinal = ordinal_closure(case)
        status = str(ordinal["status"])
        status_counts[status] = status_counts.get(status, 0) + 1
        by_status = target_counts.setdefault(str(case.target_count), {})
        by_status[status] = by_status.get(status, 0) + 1
        records.append({
            "case": case.key,
            "left_blocks": case.left_blocks,
            "right_blocks": case.right_blocks,
            "cyclic_order": case.order,
            "ordinal": {
                "status": ordinal["status"],
                "actual_outside_target_count": ordinal["actual_outside_target_count"],
                "distance_class_count": ordinal["distance_class_count"],
                "direct_comparison_count": ordinal["direct_comparison_count"],
                "transitive_comparison_count": ordinal["transitive_comparison_count"],
                "minimal_equal_sum_core": (
                    ordinal["equal_sum_conflicts"][0]
                    if ordinal["equal_sum_conflicts"] else None
                ),
            },
        })
        if index % 250 == 0:
            print(f"ordinal {index}/{len(cases)}")
    ledgers: dict[str, dict[str, str]] = {}
    if not args.ordinal_only:
        live_cases = [
            case for case, record in zip(cases, records, strict=True)
            if record["ordinal"]["status"] != "UNSAT_ORDINAL"
        ]
        print(f"full QF_LRA: {len(live_cases)} cases on {args.jobs} workers")
        solved: dict[str, tuple[dict[str, object], dict[str, str]]] = {}
        work = ((case, args.timeout_ms) for case in live_cases)
        if args.jobs == 1:
            solved_iterator = map(solve_full_lra, work)
            for index, (key, full_lra, ledger) in enumerate(solved_iterator, start=1):
                solved[key] = (full_lra, ledger)
                if index % 100 == 0:
                    print(f"full QF_LRA {index}/{len(live_cases)}", flush=True)
        else:
            with ProcessPoolExecutor(max_workers=args.jobs) as executor:
                for index, (key, full_lra, ledger) in enumerate(
                    executor.map(solve_full_lra, work), start=1,
                ):
                    solved[key] = (full_lra, ledger)
                    if index % 100 == 0:
                        print(f"full QF_LRA {index}/{len(live_cases)}", flush=True)
        for record in records:
            if record["case"] in solved:
                full_lra, ledger = solved[str(record["case"])]
                record["full_lra"] = full_lra
                ledgers[str(record["case"])] = ledger

    full_status_counts: dict[str, int] = {}
    for record in records:
        if "full_lra" in record:
            status = str(record["full_lra"]["status"])
            full_status_counts[status] = full_status_counts.get(status, 0) + 1

    payload = {
        "schema": "period3-three-complete-rows-kalmanson-v1",
        "epistemic_status": "EXACT_FINITE_ORDINAL_ABSTRACT_DISTANCE_NOT_EUCLIDEAN_NOT_LEAN",
        "quotient": "independent swap of the two unnamed targets in each row; no reflection",
        "valid_role_identification_partitions": {"3": 8, "4": 32, "5": 12, "6": 1},
        "raw_order_split_cases": 17712,
        "quotient_case_count": len(cases),
        "status_counts": status_counts,
        "full_lra_status_counts": full_status_counts,
        "by_actual_target_count": target_counts,
        "cases": records,
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    if not args.ordinal_only:
        args.ledgers.write_text(json.dumps({
            "schema": "period3-three-complete-rows-kalmanson-rational-ledgers-v1",
            "epistemic_status": "EXACT_RATIONAL_LRA_NOT_EUCLIDEAN_NOT_LEAN",
            "cases": ledgers,
        }, indent=2, sort_keys=True) + "\n")
    print(json.dumps({key: payload[key] for key in (
        "raw_order_split_cases", "quotient_case_count", "status_counts",
        "full_lra_status_counts", "by_actual_target_count"
    )}, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Independent Fraction replay for the three-row Kalmanson census.

This verifier never imports Z3 or the generating audit module.  It
independently regenerates the finite quotient, checks each ordinal one-line
core, and substitutes every stored rational SAT ledger into the original
abstract-distance constraints.
"""

from __future__ import annotations

from fractions import Fraction
import itertools
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROLE_NAMES = tuple(f"{side}{row}" for row in range(3) for side in "xy")
ROW_ROLES = tuple((f"x{row}", f"y{row}") for row in range(3))
CAP_CORE = ("left", "q0", "c0", "c2", "q1", "c1", "q2", "right")
ROW_SOURCES = (("q0", "q1"), ("q1", "q2"), ("q2", "q0"))


def edge(a: str, b: str) -> tuple[str, str]:
    assert a != b
    return tuple(sorted((a, b)))


class UnionFind:
    def __init__(self, items: set[tuple[str, str]]) -> None:
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


def set_partitions(items: tuple[str, ...]):
    blocks: list[list[str]] = []

    def visit(index: int):
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
    pairs = tuple(
        frozenset((role_block[first], role_block[second]))
        for first, second in ROW_ROLES
    )
    return all(len(pair) == 2 for pair in pairs) and len(set(pairs)) == 3


def swap_role(role: str, swaps: tuple[bool, bool, bool]) -> str:
    side, row = role[0], int(role[1])
    if swaps[row]:
        side = "y" if side == "x" else "x"
    return f"{side}{row}"


def canonical_key(left, right):
    return min(
        (
            tuple(tuple(sorted(swap_role(role, swaps) for role in block)) for block in left),
            tuple(tuple(sorted(swap_role(role, swaps) for role in block)) for block in right),
        )
        for swaps in itertools.product((False, True), repeat=3)
    )


def regenerate_quotient() -> set[tuple[tuple[tuple[str, ...], ...], tuple[tuple[str, ...], ...]]]:
    result = set()
    for partition in set_partitions(ROLE_NAMES):
        if not partition_is_live(partition):
            continue
        for ordered in itertools.permutations(partition):
            for split in range(len(partition) + 1):
                result.add(canonical_key(ordered[:split], ordered[split:]))
    return result


def target_for_role(blocks: tuple[tuple[str, ...], ...]) -> dict[str, str]:
    return {
        role: "t_" + "_".join(block)
        for block in blocks
        for role in block
    }


def equality_groups(blocks: tuple[tuple[str, ...], ...]):
    target = target_for_role(blocks)
    groups = [tuple(edge("o", point) for point in ("left", "q0", "q1", "q2", "right"))]
    for row, (source_a, source_b) in enumerate(ROW_SOURCES):
        groups.append(tuple(edge(f"c{row}", point) for point in (
            source_a, source_b, target[f"x{row}"], target[f"y{row}"],
        )))
    return tuple(groups)


def kalmanson_terms(order: tuple[str, ...]):
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


def row_excluded_points(order, blocks, row):
    target = target_for_role(blocks)
    in_row = {*ROW_SOURCES[row], target[f"x{row}"], target[f"y{row}"]}
    return tuple(point for point in order if point != f"c{row}" and point not in in_row)


def verify_ordinal_core(record: dict[str, object]) -> None:
    left = tuple(tuple(block) for block in record["left_blocks"])
    right = tuple(tuple(block) for block in record["right_blocks"])
    blocks = left + right
    order = tuple(record["cyclic_order"])
    core_label = record["ordinal"]["minimal_equal_sum_core"]
    assert core_label is not None
    pairs = {edge(a, b) for a, b in itertools.combinations(order, 2)}
    uf = UnionFind(pairs)
    for group in equality_groups(blocks):
        for term in group[1:]:
            uf.union(group[0], term)
    candidates = []
    for label, lhs, rhs in kalmanson_terms(order):
        if label != core_label:
            continue
        left_classes = sorted((uf.find(lhs[0]), uf.find(lhs[1])))
        right_classes = sorted((uf.find(rhs[0]), uf.find(rhs[1])))
        assert left_classes == right_classes
        candidates.append(label)
    assert candidates == [core_label]


def verify_sat(record: dict[str, object], raw_ledger: dict[str, str]) -> tuple[Fraction, Fraction]:
    left = tuple(tuple(block) for block in record["left_blocks"])
    right = tuple(tuple(block) for block in record["right_blocks"])
    blocks = left + right
    order = tuple(record["cyclic_order"])
    ledger = {tuple(name.split("~")): Fraction(value) for name, value in raw_ledger.items()}
    expected = {edge(a, b) for a, b in itertools.combinations(order, 2)}
    assert set(ledger) == expected
    assert all(value >= 1 for value in ledger.values())

    for a, b, c in itertools.combinations(order, 3):
        assert ledger[edge(a, b)] <= ledger[edge(a, c)] + ledger[edge(b, c)]
        assert ledger[edge(a, c)] <= ledger[edge(a, b)] + ledger[edge(b, c)]
        assert ledger[edge(b, c)] <= ledger[edge(a, b)] + ledger[edge(a, c)]
    for group in equality_groups(blocks):
        assert all(ledger[term] == ledger[group[0]] for term in group)

    gaps = []
    physical_radius = ledger[edge("o", "left")]
    physical_class = {"left", "q0", "q1", "q2", "right"}
    for point in order:
        if point != "o" and point not in physical_class:
            gaps.append(abs(ledger[edge("o", point)] - physical_radius))
    for row in range(3):
        radius = ledger[edge(f"c{row}", ROW_SOURCES[row][0])]
        for point in row_excluded_points(order, blocks, row):
            gaps.append(abs(ledger[edge(f"c{row}", point)] - radius))
    assert min(gaps) >= 1

    kalmanson_slacks = [
        ledger[rhs[0]] + ledger[rhs[1]] - ledger[lhs[0]] - ledger[lhs[1]]
        for _label, lhs, rhs in kalmanson_terms(order)
    ]
    assert min(kalmanson_slacks) >= 1
    return min(gaps), min(kalmanson_slacks)


def main() -> None:
    results = json.loads((HERE / "results.json").read_text())
    ledger_payload = json.loads((HERE / "ledgers.json").read_text())
    records = results["cases"]
    ledgers = ledger_payload["cases"]

    regenerated = regenerate_quotient()
    recorded = {
        (
            tuple(tuple(block) for block in record["left_blocks"]),
            tuple(tuple(block) for block in record["right_blocks"]),
        )
        for record in records
    }
    assert recorded == regenerated
    assert len(recorded) == 2214

    ordinal_unsat = 0
    sat = 0
    minimum_gap: Fraction | None = None
    minimum_kalmanson: Fraction | None = None
    for record in records:
        status = record["ordinal"]["status"]
        if status == "UNSAT_ORDINAL":
            verify_ordinal_core(record)
            ordinal_unsat += 1
            assert record["case"] not in ledgers
        else:
            assert record["full_lra"]["status"] == "SAT_VERIFIED_RATIONAL_LRA_LEDGER"
            gap, kalmanson = verify_sat(record, ledgers[record["case"]])
            minimum_gap = gap if minimum_gap is None else min(minimum_gap, gap)
            minimum_kalmanson = (
                kalmanson
                if minimum_kalmanson is None
                else min(minimum_kalmanson, kalmanson)
            )
            sat += 1

    assert ordinal_unsat == 1224
    assert sat == 990
    assert minimum_gap is not None and minimum_kalmanson is not None
    print(
        "PASS: quotient=2214 ordinal_unsat=1224 exact_lra_sat=990 "
        f"min_named_exclusion_gap={minimum_gap} min_kalmanson_slack={minimum_kalmanson}"
    )
    print("PASS: abstract distance ledgers only; no Euclidean realization claimed")


if __name__ == "__main__":
    main()

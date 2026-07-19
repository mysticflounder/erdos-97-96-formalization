#!/usr/bin/env python3
"""Summarize the exact one-inequality cores in the three-row census.

This is a report helper, not a proof checker.  It reads the independently
verified finite audit and records how much of the prospective Lean certificate
surface is K1 versus K2 and which row-radius equality classes cancel.
"""

from __future__ import annotations

from collections import Counter
import itertools
import json
from pathlib import Path
import re


HERE = Path(__file__).resolve().parent
SOURCE = HERE.parent / "cycle-three-rows-kalmanson" / "results.json"
ROW_SOURCES = (("q0", "q1"), ("q1", "q2"), ("q2", "q0"))
CORE_RE = re.compile(r"^(K[12])\(([^,]+),([^,]+),([^,]+),([^,]+)\)$")


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


def target_for_role(record: dict[str, object]) -> dict[str, str]:
    blocks = tuple(record["left_blocks"]) + tuple(record["right_blocks"])
    return {
        role: "t_" + "_".join(block)
        for block in blocks
        for role in block
    }


def equality_groups(record: dict[str, object]):
    target = target_for_role(record)
    groups = [
        ("P", tuple(edge("o", point) for point in ("left", "q0", "q1", "q2", "right")))
    ]
    for row, (source_a, source_b) in enumerate(ROW_SOURCES):
        groups.append((
            f"R{row}",
            tuple(edge(f"c{row}", point) for point in (
                source_a, source_b, target[f"x{row}"], target[f"y{row}"],
            )),
        ))
    return tuple(groups)


def main() -> None:
    payload = json.loads(SOURCE.read_text())
    unsat = [
        record for record in payload["cases"]
        if record["ordinal"]["status"] == "UNSAT_ORDINAL"
    ]
    kind_count: Counter[str] = Counter()
    card_kind_count: Counter[tuple[int, str]] = Counter()
    cancellation_count: Counter[tuple[str, ...]] = Counter()
    raw_shape_count: Counter[tuple[str, tuple[str, ...]]] = Counter()

    for record in unsat:
        label = record["ordinal"]["minimal_equal_sum_core"]
        match = CORE_RE.match(label)
        assert match is not None, label
        kind, a, b, c, d = match.groups()
        order = tuple(record["cyclic_order"])
        pairs = {edge(x, y) for x, y in itertools.combinations(order, 2)}
        uf = UnionFind(pairs)
        tags: dict[tuple[str, str], str] = {}
        for tag, group in equality_groups(record):
            for term in group[1:]:
                uf.union(group[0], term)
            for term in group:
                tags[term] = tag

        if kind == "K1":
            lhs = (edge(b, c), edge(a, d))
            rhs = (edge(a, c), edge(b, d))
        else:
            lhs = (edge(a, b), edge(c, d))
            rhs = (edge(a, c), edge(b, d))
        assert sorted(uf.find(term) for term in lhs) == sorted(uf.find(term) for term in rhs)

        class_tags = []
        for representative in sorted({uf.find(term) for term in lhs}):
            members = [term for term in pairs if uf.find(term) == representative]
            named = sorted({tags[term] for term in members if term in tags})
            class_tags.append("+".join(named) if named else "edge")

        card = record["ordinal"]["actual_outside_target_count"]
        kind_count[kind] += 1
        card_kind_count[(card, kind)] += 1
        cancellation_count[tuple(class_tags)] += 1
        point_roles = tuple(
            "target" if point.startswith("t_") else point
            for point in (a, b, c, d)
        )
        raw_shape_count[(kind, point_roles)] += 1

    output = {
        "source": str(SOURCE.relative_to(HERE.parents[3])),
        "unsat_cases": len(unsat),
        "by_inequality": dict(sorted(kind_count.items())),
        "by_target_count_and_inequality": {
            f"k{card}_{kind}": count
            for (card, kind), count in sorted(card_kind_count.items())
        },
        "by_named_cancellation_classes": {
            "+".join(tags): count
            for tags, count in sorted(cancellation_count.items())
        },
        "raw_quadruple_role_shapes": [
            {"kind": kind, "roles": list(roles), "count": count}
            for (kind, roles), count in raw_shape_count.most_common()
        ],
    }
    print(json.dumps(output, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Classify exact-17 linear cores not covered by two-Kalmanson cancellation.

This is theorem-discovery code.  It quotients distance edges by the mined row
equalities and asks whether the remaining strict metric inequalities cancel
with unit coefficients or with arbitrary positive rational coefficients.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter, defaultdict
from fractions import Fraction
from functools import reduce
from math import gcd, lcm
from pathlib import Path

import z3


ROOT = Path(__file__).resolve().parent


class DisjointSet:
    def __init__(self) -> None:
        self.parent: dict[tuple[int, int], tuple[int, int]] = {}

    def find(self, item: tuple[int, int]) -> tuple[int, int]:
        self.parent.setdefault(item, item)
        if self.parent[item] != item:
            self.parent[item] = self.find(self.parent[item])
        return self.parent[item]

    def union(self, first: tuple[int, int], second: tuple[int, int]) -> None:
        first_root = self.find(first)
        second_root = self.find(second)
        if first_root != second_root:
            self.parent[max(first_root, second_root)] = min(first_root, second_root)


def edge(value: list[int]) -> tuple[int, int]:
    return tuple(sorted(value))


def equality_edge(side: list[list[int]]) -> tuple[int, int]:
    if len(side) != 1:
        raise ValueError(f"expected singleton equality side, got {side!r}")
    return edge(side[0])


def signed_inequality_vector(atom: list, classes: DisjointSet) -> dict:
    kind = atom[0]
    vector: dict[tuple[int, int], int] = defaultdict(int)
    if kind == "pos":
        vector[classes.find(edge(atom[1]))] -= 1
    else:
        for item in atom[1]:
            vector[classes.find(edge(item))] += 1
        for item in atom[2]:
            vector[classes.find(edge(item))] -= 1
    return {key: value for key, value in vector.items() if value}


def positive_cancellation(vectors: list[dict]) -> tuple[bool, list[int] | None]:
    if not vectors:
        return False, None
    coordinates = sorted({coordinate for vector in vectors for coordinate in vector})
    weights = [z3.Real(f"w_{index}") for index in range(len(vectors))]
    solver = z3.Solver()
    solver.add(*(weight > 0 for weight in weights))
    solver.add(sum(weights) == 1)
    for coordinate in coordinates:
        solver.add(
            sum(weight * vector.get(coordinate, 0) for weight, vector in zip(weights, vectors))
            == 0
        )
    if solver.check() != z3.sat:
        return False, None
    model = solver.model()
    rationals = []
    for weight in weights:
        value = model.eval(weight)
        rationals.append(Fraction(value.numerator_as_long(), value.denominator_as_long()))
    common_denominator = lcm(*(weight.denominator for weight in rationals))
    integers = [
        weight.numerator * (common_denominator // weight.denominator)
        for weight in rationals
    ]
    common_factor = reduce(gcd, integers)
    integers = [weight // common_factor for weight in integers]
    assert all(weight > 0 for weight in integers)
    assert all(
        sum(weight * vector.get(coordinate, 0) for weight, vector in zip(integers, vectors))
        == 0
        for coordinate in {coordinate for vector in vectors for coordinate in vector}
    )
    return True, integers


def classify(result: dict) -> dict:
    equalities = [atom for atom in result["atoms"] if atom[0] == "eq"]
    inequalities = [atom for atom in result["atoms"] if atom[0] != "eq"]
    classes = DisjointSet()
    for atom in equalities:
        classes.union(equality_edge(atom[1]), equality_edge(atom[2]))
    vectors = [signed_inequality_vector(atom, classes) for atom in inequalities]
    total: dict[tuple[int, int], int] = defaultdict(int)
    for vector in vectors:
        for coordinate, coefficient in vector.items():
            total[coordinate] += coefficient
    unit_cancellation = all(coefficient == 0 for coefficient in total.values())
    positive, weights = positive_cancellation(vectors)
    kinds = Counter(atom[0] for atom in inequalities)
    return {
        "journal": result["journal"],
        "iteration": result["iteration"],
        "point_count": len(result["used_points"]),
        "equality_count": len(equalities),
        "inequality_count": len(inequalities),
        "inequality_kinds": dict(sorted(kinds.items())),
        "pure_kalmanson": set(kinds) <= {"k1", "k2"},
        "unit_cancellation": unit_cancellation,
        "positive_rational_cancellation": positive,
        "weights": weights,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--supports", type=Path, default=ROOT / "tracked-supports-minboth-all.json"
    )
    parser.add_argument(
        "--replay", type=Path, default=ROOT / "two-kalmanson-consumer-replay.json"
    )
    parser.add_argument(
        "--output", type=Path, default=ROOT / "unmatched-linear-classification.json"
    )
    args = parser.parse_args()

    supports = json.loads(args.supports.read_text())
    replay = json.loads(args.replay.read_text())
    matched = {
        (item["journal"], item["iteration"])
        for item in replay["results"]
        if item["matched"]
    }
    unmatched = [
        classify(item)
        for item in supports["results"]
        if (item["journal"], item["iteration"]) not in matched
    ]
    signature_counts = Counter(
        (
            tuple(item["inequality_kinds"].items()),
            item["inequality_count"],
            item["unit_cancellation"],
            item["positive_rational_cancellation"],
        )
        for item in unmatched
    )
    payload = {
        "records": len(unmatched),
        "pure_kalmanson": sum(item["pure_kalmanson"] for item in unmatched),
        "unit_cancellation": sum(item["unit_cancellation"] for item in unmatched),
        "positive_rational_cancellation": sum(
            item["positive_rational_cancellation"] for item in unmatched
        ),
        "signature_counts": [
            {
                "inequality_kinds": dict(kinds),
                "inequality_count": inequality_count,
                "unit_cancellation": unit,
                "positive_rational_cancellation": positive,
                "count": count,
            }
            for (kinds, inequality_count, unit, positive), count in signature_counts.most_common()
        ],
        "results": unmatched,
        "evidence_scope": "exact QF_LRA theorem discovery; not Lean proof or exact-17 coverage",
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {key: payload[key] for key in (
                "records",
                "pure_kalmanson",
                "unit_cancellation",
                "positive_rational_cancellation",
            )},
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()

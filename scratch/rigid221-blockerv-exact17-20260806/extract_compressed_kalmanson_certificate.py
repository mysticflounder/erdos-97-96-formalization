#!/usr/bin/env python3
# ruff: noqa: I001
"""Extract an exact weighted Kalmanson proof on row-named vertices only."""

from __future__ import annotations

import argparse
import json
import math
import sys
from fractions import Fraction
from itertools import combinations
from pathlib import Path

import z3


REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO))

from census.atail_force import producer_bank
from census.global_confinement.metric_realizability_probe import (
    MetricRow,
)


def edge(a: int, b: int) -> tuple[int, int]:
    return tuple(sorted((a, b)))


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--certificate", type=Path, required=True)
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    source_payload = json.loads(args.certificate.read_text())
    inherited_order = tuple(int(point) for point in source_payload["order"])
    source_rows = source_payload["rows"]
    used = {
        int(point)
        for row in source_rows
        for point in (int(row["center"]), *map(int, row["support"]))
    }
    original_labels = tuple(point for point in inherited_order if point in used)
    remap = {point: index for index, point in enumerate(original_labels)}
    n = len(original_labels)
    points = tuple(range(n))
    rows = tuple(
        MetricRow(
            remap[int(row["center"])],
            tuple(remap[int(point)] for point in row["support"]),
            False,
        )
        for row in source_rows
    )

    ds = {
        pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
        for pair in combinations(points, 2)
    }

    def dist(a: int, b: int):
        return ds[edge(a, b)]

    solver = z3.Solver()
    solver.set(timeout=args.timeout_ms)
    assumptions: list[z3.BoolRef] = []
    records: dict[str, dict] = {}

    def track(kind: str, payload: dict, constraint) -> None:
        name = f"a{len(assumptions)}"
        tag = z3.Bool(name)
        solver.add(z3.Implies(tag, constraint))
        assumptions.append(tag)
        records[name] = {"kind": kind, **payload}

    for a, b in combinations(points, 2):
        track("positive", {"edge": [a, b]}, dist(a, b) > 0)
    track("normalization", {"edge": [0, 1], "value": 1}, dist(0, 1) == 1)
    for a, b, c in combinations(points, 3):
        track(
            "triangle",
            {"left": [[a, c]], "right": [[a, b], [b, c]]},
            dist(a, c) < dist(a, b) + dist(b, c),
        )
        track(
            "triangle",
            {"left": [[a, b]], "right": [[a, c], [b, c]]},
            dist(a, b) < dist(a, c) + dist(b, c),
        )
        track(
            "triangle",
            {"left": [[b, c]], "right": [[a, b], [a, c]]},
            dist(b, c) < dist(a, b) + dist(a, c),
        )
    for a, b, c, d in combinations(points, 4):
        diagonal = dist(a, c) + dist(b, d)
        quad = [a, b, c, d]
        track(
            "kalmanson",
            {"quad": quad, "form": "adjacentSides"},
            dist(a, b) + dist(c, d) < diagonal,
        )
        track(
            "kalmanson",
            {"quad": quad, "form": "innerOuter"},
            dist(a, d) + dist(b, c) < diagonal,
        )
    for row_index, row in enumerate(rows):
        anchor = row.support[0]
        for point in row.support[1:]:
            track(
                "row-equality",
                {
                    "row_index": row_index,
                    "center": row.center,
                    "anchor": anchor,
                    "point": point,
                },
                dist(row.center, point) == dist(row.center, anchor),
            )

    verdict = solver.check(*assumptions)
    if verdict != z3.unsat:
        raise RuntimeError(f"compressed tracked system returned {verdict}")
    core = list(solver.unsat_core())
    index = 0
    while index < len(core):
        trial = core[:index] + core[index + 1 :]
        if solver.check(*trial) == z3.unsat:
            core = trial
        else:
            index += 1
    core_records = [records[tag.decl().name()] for tag in core]
    unexpected = [
        record for record in core_records
        if record["kind"] not in {"kalmanson", "row-equality"}
    ]
    if unexpected:
        raise RuntimeError(
            f"compressed proof is not pure Kalmanson/equality: {unexpected}"
        )

    equality_by_row: dict[int, list[dict]] = {}
    for record in core_records:
        if record["kind"] == "row-equality":
            equality_by_row.setdefault(record["row_index"], []).append(record)
    core_rows = []
    for row_index in sorted(equality_by_row):
        row_equalities = equality_by_row[row_index]
        anchor = row_equalities[0]["anchor"]
        support = [anchor]
        support.extend(sorted({record["point"] for record in row_equalities}))
        core_rows.append(MetricRow(rows[row_index].center, tuple(support), False))
    core_rows = tuple(core_rows)

    parent = {pair: pair for pair in combinations(points, 2)}

    def find(value: tuple[int, int]) -> tuple[int, int]:
        while parent[value] != value:
            parent[value] = parent[parent[value]]
            value = parent[value]
        return value

    def union(left: tuple[int, int], right: tuple[int, int]) -> None:
        left_root = find(left)
        right_root = find(right)
        if left_root != right_root:
            parent[right_root] = left_root

    for row in core_rows:
        anchor = row.support[0]
        for point in row.support[1:]:
            union(edge(row.center, anchor), edge(row.center, point))

    kalmanson = [
        record for record in core_records if record["kind"] == "kalmanson"
    ]
    weights = [z3.Real(f"w_{index}") for index in range(len(kalmanson))]
    weight_solver = z3.Solver()
    weight_solver.add(*(weight > 0 for weight in weights))
    weight_solver.add(z3.Sum(weights) == 1)
    balances: dict[tuple[int, int], list] = {}
    for weight, record in zip(weights, kalmanson, strict=True):
        left, right = producer_bank._kalmanson_edges(
            tuple(record["quad"]), record["form"]
        )
        for a, b in left:
            balances.setdefault(find(edge(a, b)), []).append(-weight)
        for a, b in right:
            balances.setdefault(find(edge(a, b)), []).append(weight)
    weight_solver.add(*(z3.Sum(terms) == 0 for terms in balances.values()))
    if weight_solver.check() != z3.sat:
        raise RuntimeError("exact compressed Farkas-weight recovery failed")
    model = weight_solver.model()
    rationals = [
        Fraction(model.evaluate(weight).as_fraction()) for weight in weights
    ]
    denominator_lcm = math.lcm(*(weight.denominator for weight in rationals))
    integers = [
        weight.numerator * (denominator_lcm // weight.denominator)
        for weight in rationals
    ]
    common_gcd = math.gcd(*integers)
    integers = [weight // common_gcd for weight in integers]
    terms = [
        {
            "quad": record["quad"],
            "form": record["form"],
            "weight": weight,
        }
        for record, weight in zip(kalmanson, integers, strict=True)
    ]
    checked = producer_bank.certify_weighted_kalmanson_cancellation(
        core_rows, n, tuple(range(n)), terms
    )

    output = {
        "schema": "p97-compressed-weighted-kalmanson-certificate-v1",
        "source_certificate": str(args.certificate.resolve()),
        "original_labels_in_order": original_labels,
        "order": list(range(n)),
        "rows": [row.as_dict() for row in core_rows],
        "minimal_assumption_count": len(core_records),
        "core": core_records,
        "weighted_terms": terms,
        "weighted_certificate": checked,
        "verdict": "unsat",
    }
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "kalmanson_terms": len(terms),
        "minimal_assumptions": len(core_records),
        "rows": len(core_rows),
        "status": "UNSAT",
        "vertices": n,
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

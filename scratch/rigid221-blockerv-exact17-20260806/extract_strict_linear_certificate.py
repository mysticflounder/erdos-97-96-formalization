#!/usr/bin/env python3
"""Extract a small exact strict-LRA certificate from a learned row core."""

from __future__ import annotations

import argparse
import importlib.util
import json
import math
from fractions import Fraction
from itertools import combinations
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


source = load_module(
    "exact17_source_faithful_linear_certificate",
    HERE / "exact17_source_faithful_cegar.py",
)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--order", type=int, choices=(0, 1), required=True)
    parser.add_argument("--positions", type=source.parse_positions, required=True)
    parser.add_argument("--cegar-report", type=Path, required=True)
    parser.add_argument("--learned-index", type=int, default=0)
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    report = json.loads(args.cegar_report.read_text())
    if "learned" in report:
        learned = report["learned"][args.learned_index]
        if learned["kind"] != "strict-linear-core":
            raise ValueError("selected learned record is not a strict-linear-core")
        row_payload = learned["rows"]
    else:
        if report.get("linear_status") != "unsat":
            raise ValueError("model analysis does not contain an UNSAT linear replay")
        row_payload = report.get("linear_core_rows")
        if not isinstance(row_payload, list) or not row_payload:
            raise ValueError("model analysis has no strict-linear core rows")
    rows = source.legacy.rows_from_payload(row_payload)
    order = source.normalized_order(args.order, args.positions)
    recorded_order = report.get("order")
    if recorded_order is not None and tuple(recorded_order) != order:
        raise ValueError("report cyclic order does not match the requested case")
    points = tuple(range(17))
    ds = {
        pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
        for pair in combinations(points, 2)
    }

    def dist(a: int, b: int):
        return ds[tuple(sorted((a, b)))]

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

    for i, j, k, ell in combinations(range(17), 4):
        a, b, c, d = order[i], order[j], order[k], order[ell]
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
        raise RuntimeError(f"tracked strict system returned {verdict}")
    core = list(solver.unsat_core())
    index = 0
    while index < len(core):
        trial = core[:index] + core[index + 1 :]
        if solver.check(*trial) == z3.unsat:
            core = trial
        else:
            index += 1

    core_records = [records[tag.decl().name()] for tag in core]
    kalmanson_records = [
        record for record in core_records if record["kind"] == "kalmanson"
    ]

    parent = {
        tuple(pair): tuple(pair)
        for pair in combinations(points, 2)
    }

    def edge(a: int, b: int) -> tuple[int, int]:
        return tuple(sorted((a, b)))

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

    for row in rows:
        anchor = row.support[0]
        for point in row.support[1:]:
            union(edge(row.center, anchor), edge(row.center, point))

    weights = [z3.Real(f"w_{index}") for index in range(len(kalmanson_records))]
    weight_solver = z3.Solver()
    weight_solver.add(*(weight > 0 for weight in weights))
    weight_solver.add(z3.Sum(weights) == 1)
    balances: dict[tuple[int, int], list] = {}
    for weight, record in zip(weights, kalmanson_records, strict=True):
        quad = tuple(record["quad"])
        left, right = source.legacy.producer_bank._kalmanson_edges(
            quad, record["form"]
        )
        for a, b in left:
            balances.setdefault(find(edge(a, b)), []).append(-weight)
        for a, b in right:
            balances.setdefault(find(edge(a, b)), []).append(weight)
    weight_solver.add(*(z3.Sum(terms) == 0 for terms in balances.values()))
    weight_verdict = weight_solver.check()
    if weight_verdict != z3.sat:
        raise RuntimeError(f"exact Farkas-weight recovery returned {weight_verdict}")
    weight_model = weight_solver.model()
    rational_weights = [
        Fraction(weight_model.evaluate(weight).as_fraction())
        for weight in weights
    ]
    denominator_lcm = math.lcm(*(weight.denominator for weight in rational_weights))
    integer_weights = [
        weight.numerator * (denominator_lcm // weight.denominator)
        for weight in rational_weights
    ]
    common_gcd = math.gcd(*integer_weights)
    integer_weights = [weight // common_gcd for weight in integer_weights]
    terms = [
        {
            "quad": record["quad"],
            "form": record["form"],
            "weight": weight,
        }
        for record, weight in zip(
            kalmanson_records, integer_weights, strict=True
        )
    ]
    weighted_record = (
        source.legacy.producer_bank.certify_weighted_kalmanson_cancellation(
            rows, 17, order, terms
        )
    )
    output = {
        "schema": "p97-exact17-strict-linear-certificate-v1",
        "source_report": str(args.cegar_report),
        "order": list(order),
        "rows": source.row_payload(rows),
        "verdict": "unsat",
        "minimal_assumption_count": len(core_records),
        "core": core_records,
        "weighted_terms": terms,
        "weighted_certificate": weighted_record,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    counts: dict[str, int] = {}
    for record in core_records:
        counts[record["kind"]] = counts.get(record["kind"], 0) + 1
    print(json.dumps({
        "core_counts": counts,
        "minimal_assumption_count": len(core_records),
        "output": str(args.output),
        "status": "UNSAT",
        "weight_max": max(integer_weights),
        "weight_sum": sum(integer_weights),
        "weighted_terms": len(integer_weights),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

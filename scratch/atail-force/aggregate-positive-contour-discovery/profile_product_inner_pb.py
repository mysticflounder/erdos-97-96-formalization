#!/usr/bin/env python3
"""Benchmark the current arithmetic inner query against an exact PB rewrite."""

from __future__ import annotations

import argparse
import importlib.util
import json
import time
from pathlib import Path

import z3


def load_search_module(path: Path):
    spec = importlib.util.spec_from_file_location("product_search", path)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def decode_rows(n: int, assignment: list[int]) -> dict[int, tuple[int, ...]]:
    values = {abs(literal): literal > 0 for literal in assignment if literal}
    arcs = [
        (center, target)
        for center in range(n)
        for target in range(n)
        if center != target
    ]
    assert set(values) == set(range(1, len(arcs) + 1))
    return {
        center: tuple(
            target
            for index, (source, target) in enumerate(arcs, start=1)
            if source == center and values[index]
        )
        for center in range(n)
    }


def find_pair_batch_pb(module, n, rows, *, limit: int, timeout_ms: int):
    intervals = module.circular_intervals(n)
    solver = z3.Solver()
    solver.set(timeout=timeout_ms, random_seed=0)
    left = {
        (center, target): z3.Bool(f"pb_left_{center}_{target}")
        for center in range(n)
        for target in rows[center]
    }
    right = {
        (center, target): z3.Bool(f"pb_right_{center}_{target}")
        for center in range(n)
        for target in rows[center]
    }
    for center in range(n):
        solver.add(
            z3.PbEq([(left[center, target], 1) for target in rows[center]], 1),
            z3.PbEq([(right[center, target], 1) for target in rows[center]], 1),
        )
    for target in range(n):
        terms = [
            (left[center, target], 1)
            for center in range(n)
            if target in rows[center]
        ] + [
            (right[center, target], -1)
            for center in range(n)
            if target in rows[center]
        ]
        solver.add(z3.PbEq(terms, 0))

    total_weights = {(side, center, target): 0 for side in (0, 1) for center in range(n) for target in rows[center]}
    for interval in intervals:
        terms = []
        for center in interval:
            for target in rows[center]:
                if target not in interval:
                    terms.append((left[center, target], 1))
                    terms.append((right[center, target], -1))
                    total_weights[0, center, target] += 1
                    total_weights[1, center, target] -= 1
        solver.add(z3.PbGe(terms, 0))
    solver.add(
        z3.PbGe(
            [
                ((left if side == 0 else right)[center, target], weight)
                for (side, center, target), weight in total_weights.items()
                if weight
            ],
            1,
        )
    )

    supports = set()
    checks = 0
    while len(supports) < limit:
        status = solver.check()
        checks += 1
        if status != z3.sat:
            return str(status).upper(), supports, checks, solver.reason_unknown()
        model = solver.model()
        left_assignment = tuple(
            next(target for target in rows[center] if z3.is_true(model.eval(left[center, target], model_completion=True)))
            for center in range(n)
        )
        right_assignment = tuple(
            next(target for target in rows[center] if z3.is_true(model.eval(right[center, target], model_completion=True)))
            for center in range(n)
        )
        module.verify_pair(n, rows, intervals, left_assignment, right_assignment)
        support = module.changed_support(left_assignment, right_assignment)
        supports.add(support)
        conditions = []
        for center in range(n):
            left_target = left_assignment[center]
            right_target = right_assignment[center]
            if left_target == right_target:
                conditions.append(
                    z3.Or(
                        [
                            z3.And(left[center, target], right[center, target])
                            for target in rows[center]
                        ]
                    )
                )
            else:
                conditions.append(
                    z3.Or(
                        z3.And(left[center, left_target], right[center, right_target]),
                        z3.And(left[center, right_target], right[center, left_target]),
                    )
                )
        solver.add(z3.Not(z3.And(conditions)))
    return "BATCH_LIMIT", supports, checks, None


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--search-script", type=Path, required=True)
    parser.add_argument("--model", type=Path, required=True)
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument("--limit", type=int, default=1024)
    parser.add_argument("--timeout-ms", type=int, default=600_000)
    parser.add_argument("--mode", choices=("arithmetic", "pb", "both"), default="both")
    args = parser.parse_args()
    module = load_search_module(args.search_script)
    model = json.loads(args.model.read_text(encoding="utf-8"))
    rows = decode_rows(args.n, model["assignment"])
    module.verify_rows(args.n, rows)
    result = {"n": args.n, "limit": args.limit, "rows": rows}

    if args.mode in {"arithmetic", "both"}:
        search = module.ProductAntichainSearch(args.n, 0)
        started = time.monotonic()
        status, records, reason = search.find_pair_batch(
            rows, limit=args.limit, timeout_ms=args.timeout_ms
        )
        result["arithmetic"] = {
            "status": status,
            "supports": len(records),
            "elapsed_seconds": time.monotonic() - started,
            "reason": reason,
        }
    if args.mode in {"pb", "both"}:
        started = time.monotonic()
        status, supports, checks, reason = find_pair_batch_pb(
            module,
            args.n,
            rows,
            limit=args.limit,
            timeout_ms=args.timeout_ms,
        )
        result["pb"] = {
            "status": status,
            "supports": len(supports),
            "solver_checks": checks,
            "elapsed_seconds": time.monotonic() - started,
            "reason": reason,
        }
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

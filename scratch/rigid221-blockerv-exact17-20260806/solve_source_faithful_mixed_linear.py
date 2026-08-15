"""Solve one source-faithful exact-17 case with its full linear metric layer.

Unlike the model-by-model CEGAR runner, this canary puts the Boolean selected
rows, triangle inequalities, strict Kalmanson inequalities, and all selected
row distance equalities in one Z3 instance.  An UNSAT result would concern only
the requested normalized case and would still require an exact certificate and
Lean coverage/lift before promotion.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
import time
from itertools import combinations
from pathlib import Path

import z3

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]


def load_source():
    path = HERE / "exact17_source_faithful_cegar.py"
    spec = importlib.util.spec_from_file_location(
        "exact17_source_faithful_mixed_source", path
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--order", type=int, choices=(0, 1), default=0)
    parser.add_argument("--positions", default="0,1")
    parser.add_argument("--timeout-ms", type=int, default=600_000)
    parser.add_argument("--seed", type=int, default=1)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    positions = tuple(int(value) for value in args.positions.split(","))
    if len(positions) != 2 or positions[0] >= positions[1]:
        raise ValueError("--positions must be an increasing pair")

    source = load_source()
    order = source.normalized_order(args.order, positions)
    started = time.monotonic()
    solver, selected, fifth_choice, cut_counts = source.build_case(
        order,
        all_static_cuts=True,
        transitive_two_circle=True,
    )
    boolean_seconds = time.monotonic() - started

    metric_started = time.monotonic()
    metric_solver, distances, _squared_distances = source.order_base.build_solver(order)
    solver.add(*metric_solver.assertions())
    implication_count = 0
    for center in source.POINTS:
        endpoints = tuple(point for point in source.POINTS if point != center)
        for left, right in combinations(endpoints, 2):
            solver.add(z3.Implies(
                z3.And(selected[center, left], selected[center, right]),
                source.order_base.dist(distances, center, left)
                == source.order_base.dist(distances, center, right),
            ))
            implication_count += 1
    metric_seconds = time.monotonic() - metric_started

    solver.set(timeout=args.timeout_ms, random_seed=args.seed)
    solve_started = time.monotonic()
    verdict = solver.check()
    solve_seconds = time.monotonic() - solve_started

    report = {
        "schema": "p97-rigid221-exact17-source-faithful-mixed-linear-v1",
        "scope": (
            "one normalized exact-17 cap-nine case; not exact-17 coverage, "
            "not a Lean theorem, and not a full P97 closure"
        ),
        "order_index": args.order,
        "anonymous_positions": list(positions),
        "order": list(order),
        "verdict": str(verdict),
        "reason_unknown": solver.reason_unknown() if verdict == z3.unknown else None,
        "timeout_ms": args.timeout_ms,
        "seed": args.seed,
        "selected_equality_implications": implication_count,
        "cut_counts": list(cut_counts),
        "timing_seconds": {
            "boolean_build": boolean_seconds,
            "metric_build": metric_seconds,
            "solve": solve_seconds,
            "total": time.monotonic() - started,
        },
        "source_hashes": {
            "runner": sha256(Path(__file__)),
            "source": sha256(HERE / "exact17_source_faithful_cegar.py"),
            "fullcover": sha256(HERE / "exact17_fullcover_cegar.py"),
            "order_base": sha256(HERE / "exact17_kalmanson.py"),
            "producer_bank": sha256(REPO / "census/atail_force/producer_bank.py"),
        },
    }
    if verdict == z3.sat:
        model = solver.model()
        supports = source.supports_from_model(model, selected)
        fifth_center = source.fifth_center_from_model(model, fifth_choice)
        source.verify_model(supports, fifth_center)
        rows = source.metric_rows(supports, fifth_center)
        bank_hits = source.legacy.producer_bank.scan_all_formalized_cores(
            rows, 17, order
        )
        report["sat_summary"] = {
            "fifth_center": fifth_center,
            "source_verified": True,
            "formalized_bank_hit_count": len(bank_hits),
            "first_bank_stage": bank_hits[0].get("stage") if bank_hits else None,
        }

    output = args.output.resolve()
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "artifact": str(output.relative_to(REPO)),
        "verdict": report["verdict"],
        "solve_seconds": round(solve_seconds, 3),
        "total_seconds": round(report["timing_seconds"]["total"], 3),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

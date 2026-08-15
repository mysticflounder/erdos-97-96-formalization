"""Incremental SAT-to-Kalmanson CEGAR for one exact-15 cyclic order."""

from __future__ import annotations

import argparse
import json
import time
from pathlib import Path

import alternation_cegar
import alternation_static_probe
import first_fiber_probe
import kalmanson_core
import kalmanson_probe
import probe
import z3
from pysat.solvers import Cadical195


def selected_literal(instance, center: int, row: list[int]) -> int:
    index = instance.candidate_index(center, row)
    return instance.choice_variables[(center, index)]


def minimize_core(solver, tags, core: set[int]) -> set[int]:
    active = set(core)
    changed = True
    while changed:
        changed = False
        for center in sorted(active):
            candidate = active - {center}
            if kalmanson_core.verdict(solver, tags, candidate)[0] == z3.unsat:
                active = candidate
                changed = True
    return active


def write_state(path: Path, state: dict[str, object]) -> None:
    path.write_text(json.dumps(state, indent=2, sort_keys=True) + "\n")


def solve_case(
    long_order_index: int,
    order_variant: int,
    max_rounds: int,
    wall_seconds: int,
) -> int:
    long_order = probe.ORDERS[long_order_index]
    complete_order = list(kalmanson_probe.compatible_orders(long_order))[order_variant]
    _model, instance, _blocker, _cap_order = first_fiber_probe.build(long_order)
    alternation_static_probe.add_full_alternation(instance, complete_order)
    stem = Path(__file__).with_name(
        f"metric-cegar-o{long_order_index}-v{order_variant}"
    )
    state_path = stem.with_suffix(".json")
    learned: list[dict[str, object]] = []
    started = time.monotonic()
    status = "ROUND_LIMIT"
    survivor_rows: dict[int, list[int]] | None = None

    with Cadical195(bootstrap_with=instance.cnf.clauses) as sat:
        for round_index in range(max_rounds):
            if time.monotonic() - started >= wall_seconds:
                status = "WALL_LIMIT"
                break
            if not sat.solve():
                status = "UNSAT"
                break
            assignment = sat.get_model()
            if assignment is None:
                raise RuntimeError("CaDiCaL reported SAT without a model")
            positive = {literal for literal in assignment if literal > 0}
            rows = instance.decode_model(positive)
            bad_pairs = alternation_cegar.violations(rows, complete_order)
            if bad_pairs:
                raise RuntimeError(
                    f"static alternation encoding admitted {bad_pairs[:3]}"
                )

            metric_solver, tags = kalmanson_core.tagged_solver(
                rows, tuple(complete_order)
            )
            metric_result, first_core = kalmanson_core.verdict(
                metric_solver, tags, set(rows)
            )
            if metric_result == z3.sat:
                status = "SAT_KALMANSON"
                survivor_rows = rows
                break
            if metric_result != z3.unsat:
                status = f"METRIC_{str(metric_result).upper()}"
                break
            core = minimize_core(metric_solver, tags, first_core)
            if not core:
                raise RuntimeError("empty Kalmanson core")
            clause = [-selected_literal(instance, center, rows[center]) for center in sorted(core)]
            sat.add_clause(clause)
            learned.append(
                {
                    "round": round_index,
                    "centers": sorted(core),
                    "rows": {str(center): rows[center] for center in sorted(core)},
                    "clause": clause,
                }
            )
            if (round_index + 1) % 25 == 0:
                state = {
                    "status": "RUNNING",
                    "long_order_index": long_order_index,
                    "order_variant": order_variant,
                    "complete_order": complete_order,
                    "rounds": round_index + 1,
                    "learned": learned,
                    "elapsed_seconds": time.monotonic() - started,
                }
                write_state(state_path, state)
    result: dict[str, object] = {
        "status": status,
        "long_order_index": long_order_index,
        "order_variant": order_variant,
        "complete_order": complete_order,
        "rounds": len(learned),
        "learned": learned,
        "elapsed_seconds": time.monotonic() - started,
        "variables": instance.cnf.n_variables,
        "base_clauses": len(instance.cnf.clauses),
    }
    if survivor_rows is not None:
        result["rows"] = {
            str(center): row for center, row in survivor_rows.items()
        }
    write_state(state_path, result)
    print(
        json.dumps(
            {key: value for key, value in result.items() if key not in ("learned", "rows")},
            sort_keys=True,
        )
    )
    return 0 if status in ("UNSAT", "SAT_KALMANSON") else 1


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("long_order_index", type=int, choices=range(2))
    parser.add_argument("order_variant", type=int, choices=range(12))
    parser.add_argument("--max-rounds", type=int, default=10_000)
    parser.add_argument("--wall-seconds", type=int, default=600)
    args = parser.parse_args()
    return solve_case(
        args.long_order_index,
        args.order_variant,
        args.max_rounds,
        args.wall_seconds,
    )


if __name__ == "__main__":
    raise SystemExit(main())

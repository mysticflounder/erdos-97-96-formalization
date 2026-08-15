"""Exact-15 probe with all selected-row two-center alternation constraints."""

from __future__ import annotations

import argparse
import json
import subprocess
from itertools import combinations
from pathlib import Path

import first_fiber_probe
import kalmanson_probe
import probe


def arc_sides(order: tuple[int, ...], p: int, q: int) -> tuple[set[int], set[int]]:
    pos = {point: index for index, point in enumerate(order)}
    span = (pos[q] - pos[p]) % len(order)
    first = {
        point
        for point in order
        if 0 < (pos[point] - pos[p]) % len(order) < span
    }
    return first, set(order) - first - {p, q}


def add_full_alternation(instance, order: tuple[int, ...]) -> None:
    for p, q in combinations(range(probe.N), 2):
        required = {p, q}
        for side in arc_sides(order, p, q):
            variables = [
                instance.choice_variables[(center, index)]
                for center in side
                for index, row in enumerate(instance.candidates[center])
                if required <= set(row)
            ]
            instance.cnf.at_most_sinz(variables, 1)


def solve_case(long_order_index: int, order_variant: int, timeout: int):
    long_order = probe.ORDERS[long_order_index]
    complete_order = list(kalmanson_probe.compatible_orders(long_order))[order_variant]
    _model, instance, blocker, cap_order = first_fiber_probe.build(long_order)
    before = (instance.cnf.n_variables, len(instance.cnf.clauses))
    add_full_alternation(instance, complete_order)
    after = (instance.cnf.n_variables, len(instance.cnf.clauses))

    stem = Path(__file__).with_name(
        f"alternation-static-o{long_order_index}-v{order_variant}"
    )
    cnf_path = stem.with_suffix(".cnf")
    clauses = instance.cnf.clauses
    cnf_path.write_text(
        f"p cnf {instance.cnf.n_variables} {len(clauses)}\n"
        + "\n".join(" ".join(map(str, clause)) + " 0" for clause in clauses)
        + "\n",
        encoding="utf-8",
    )
    run = subprocess.run(
        ["cadical", "-q", "-t", str(timeout), str(cnf_path)],
        capture_output=True,
        text=True,
        timeout=timeout + 30,
        check=False,
    )
    status = (
        "SAT"
        if run.returncode == 10
        else "UNSAT"
        if run.returncode == 20
        else f"ERR{run.returncode}"
    )
    result = {
        "long_order_index": long_order_index,
        "order_variant": order_variant,
        "complete_order": list(complete_order),
        "status": status,
        "variables_before": before[0],
        "clauses_before": before[1],
        "variables_after": after[0],
        "clauses_after": after[1],
    }
    if status == "SAT":
        rows, decoded = probe.validate_sat(instance, blocker, cap_order, run.stdout)
        result["rows"] = {str(center): row for center, row in rows.items()}
        result["blockers"] = {str(source): center for source, center in decoded.items()}
        metric_verdict, metric_reason = kalmanson_probe.check_order(
            rows, complete_order
        )
        result["kalmanson_verdict"] = metric_verdict
        result["kalmanson_reason"] = metric_reason
    stem.with_suffix(".json").write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n"
    )
    stem.with_suffix(".solver.log").write_text(run.stdout + run.stderr)
    print(
        json.dumps(
            {
                key: value
                for key, value in result.items()
                if key not in ("rows", "blockers")
            },
            sort_keys=True,
        )
    )
    return 0 if status in ("SAT", "UNSAT") else 1


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("long_order_index", type=int, choices=range(2))
    parser.add_argument("order_variant", type=int, choices=range(12))
    parser.add_argument("--timeout", type=int, default=300)
    args = parser.parse_args()
    return solve_case(args.long_order_index, args.order_variant, args.timeout)


if __name__ == "__main__":
    raise SystemExit(main())

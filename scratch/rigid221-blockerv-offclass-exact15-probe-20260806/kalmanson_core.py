"""Minimize selected-row equality cores across every compatible cyclic order."""

from __future__ import annotations

import json
from itertools import combinations
from pathlib import Path

import kalmanson_probe
import probe
import z3


def tagged_solver(rows: dict[int, list[int]], order: tuple[int, ...]):
    ds = kalmanson_probe.distance_variables()
    solver = z3.Solver()
    tags = {center: z3.Bool(f"row_{center}") for center in rows}
    solver.add(*(value > 0 for value in ds.values()))
    solver.add(kalmanson_probe.dist(ds, 0, 1) == 1)

    for center, row in rows.items():
        base = kalmanson_probe.dist(ds, center, row[0])
        equalities = [
            kalmanson_probe.dist(ds, center, point) == base
            for point in row[1:]
        ]
        solver.add(z3.Implies(tags[center], z3.And(*equalities)))

    for a, b, c in combinations(range(probe.N), 3):
        solver.add(
            kalmanson_probe.dist(ds, a, c)
            < kalmanson_probe.dist(ds, a, b) + kalmanson_probe.dist(ds, b, c)
        )
        solver.add(
            kalmanson_probe.dist(ds, a, b)
            < kalmanson_probe.dist(ds, a, c) + kalmanson_probe.dist(ds, b, c)
        )
        solver.add(
            kalmanson_probe.dist(ds, b, c)
            < kalmanson_probe.dist(ds, a, b) + kalmanson_probe.dist(ds, a, c)
        )

    for i, j, k, ell in combinations(range(probe.N), 4):
        a, b, c, d = order[i], order[j], order[k], order[ell]
        diagonal_sum = kalmanson_probe.dist(ds, a, c) + kalmanson_probe.dist(
            ds, b, d
        )
        solver.add(
            kalmanson_probe.dist(ds, a, b) + kalmanson_probe.dist(ds, c, d)
            < diagonal_sum
        )
        solver.add(
            kalmanson_probe.dist(ds, a, d) + kalmanson_probe.dist(ds, b, c)
            < diagonal_sum
        )
    return solver, tags


def verdict(solver, tags: dict[int, z3.BoolRef], centers: set[int]):
    result = solver.check(*(tags[center] for center in sorted(centers)))
    core = {
        center
        for center, tag in tags.items()
        if tag in solver.unsat_core()
    } if result == z3.unsat else set()
    return result, core


def minimize_all_orders(
    solvers: list[tuple[z3.Solver, dict[int, z3.BoolRef]]], centers: set[int]
) -> set[int]:
    active = set(centers)
    changed = True
    while changed:
        changed = False
        for center in sorted(active):
            candidate = active - {center}
            if all(verdict(solver, tags, candidate)[0] == z3.unsat for solver, tags in solvers):
                active = candidate
                changed = True
    return active


def main() -> int:
    cubes = json.loads(Path(__file__).with_name("first_fiber_probe.json").read_text())
    output = []
    for cube in cubes:
        rows = {int(center): row for center, row in cube["rows"].items()}
        orders = list(
            kalmanson_probe.compatible_orders(tuple(cube["strict_interior_order"]))
        )
        solvers = [tagged_solver(rows, order) for order in orders]
        order_cores = []
        for order, (solver, tags) in zip(orders, solvers, strict=True):
            result, core = verdict(solver, tags, set(rows))
            if result != z3.unsat:
                raise RuntimeError(f"expected UNSAT, got {result} for {order}")
            order_cores.append({"order": list(order), "core": sorted(core)})
        union = set().union(*(set(item["core"]) for item in order_cores))
        minimized = minimize_all_orders(solvers, union)
        output.append(
            {
                "order_index": cube["order_index"],
                "per_order_cores": order_cores,
                "core_union": sorted(union),
                "all_orders_irredundant_core": sorted(minimized),
                "core_rows": {str(center): rows[center] for center in sorted(minimized)},
            }
        )
    target = Path(__file__).with_suffix(".json")
    target.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            [
                {
                    "order_index": item["order_index"],
                    "core_union": item["core_union"],
                    "all_orders_irredundant_core": item[
                        "all_orders_irredundant_core"
                    ],
                    "core_rows": item["core_rows"],
                }
                for item in output
            ],
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

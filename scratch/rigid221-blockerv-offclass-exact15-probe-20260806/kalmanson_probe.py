"""Check decoded exact-15 cubes against the full strict Kalmanson system.

The SAT rows provide simultaneous equal-distance equations.  For every cyclic
order compatible with the three cap blocks and the proved order of the long
physical cap, this script asks Z3 for positive distances satisfying all strict
triangle and Kalmanson inequalities.  This is a necessary metric filter only.
"""

from __future__ import annotations

import json
from itertools import combinations, permutations
from pathlib import Path

import probe
import z3


def compatible_orders(long_order: tuple[int, ...]):
    # Traverse U -> physical-cap interior -> W -> surplus interior -> V ->
    # short-first-cap interior -> U.  The two unproved block orders are fully
    # enumerated, so the arbitrary stored label order carries no semantics.
    for surplus in permutations((3, 4, 5)):
        for short in permutations((13, 14)):
            yield (0, *long_order, 2, *surplus, 1, *short)


def distance_variables():
    return {
        pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
        for pair in combinations(range(probe.N), 2)
    }


def dist(ds, a: int, b: int):
    return ds[tuple(sorted((a, b)))]


def check_order(rows: dict[int, list[int]], order: tuple[int, ...]):
    ds = distance_variables()
    solver = z3.Solver()
    solver.set(timeout=30_000)
    solver.add(*(value > 0 for value in ds.values()))
    solver.add(dist(ds, 0, 1) == 1)

    for center, row in rows.items():
        base = dist(ds, center, row[0])
        solver.add(*(dist(ds, center, point) == base for point in row[1:]))

    for a, b, c in combinations(range(probe.N), 3):
        solver.add(dist(ds, a, c) < dist(ds, a, b) + dist(ds, b, c))
        solver.add(dist(ds, a, b) < dist(ds, a, c) + dist(ds, b, c))
        solver.add(dist(ds, b, c) < dist(ds, a, b) + dist(ds, a, c))

    for i, j, k, ell in combinations(range(probe.N), 4):
        a, b, c, d = order[i], order[j], order[k], order[ell]
        diagonal_sum = dist(ds, a, c) + dist(ds, b, d)
        solver.add(dist(ds, a, b) + dist(ds, c, d) < diagonal_sum)
        solver.add(dist(ds, a, d) + dist(ds, b, c) < diagonal_sum)

    verdict = solver.check()
    return str(verdict), solver.reason_unknown()


def main() -> int:
    source = Path(__file__).with_name("first_fiber_probe.json")
    cubes = json.loads(source.read_text(encoding="utf-8"))
    results = []
    for cube in cubes:
        rows = {int(center): row for center, row in cube["rows"].items()}
        order_results = []
        for order in compatible_orders(tuple(cube["strict_interior_order"])):
            verdict, reason = check_order(rows, order)
            order_results.append(
                {"order": list(order), "verdict": verdict, "reason": reason}
            )
        results.append(
            {
                "sat_order_index": cube["order_index"],
                "kalmanson_sat": sum(r["verdict"] == "sat" for r in order_results),
                "kalmanson_unsat": sum(
                    r["verdict"] == "unsat" for r in order_results
                ),
                "kalmanson_unknown": sum(
                    r["verdict"] == "unknown" for r in order_results
                ),
                "orders": order_results,
            }
        )
    output = Path(__file__).with_suffix(".json")
    output.write_text(
        json.dumps(results, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(
        json.dumps(
            [
                {key: value for key, value in result.items() if key != "orders"}
                for result in results
            ],
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

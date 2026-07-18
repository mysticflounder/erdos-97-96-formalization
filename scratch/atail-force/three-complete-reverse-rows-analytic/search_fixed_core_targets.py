#!/usr/bin/env python3
"""Complete the chord-reach core with two targets on each exact row circle.

This is a bounded numerical discovery search.  It fixes a high-margin L/R/L
triangle-edge escape core and varies only the six circle angles.  Any hit is
rechecked by the predecessor's full local Euclidean/MEC ledger.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
import sys

import numpy as np
from scipy.optimize import differential_evolution, minimize


PREDECESSOR = Path(__file__).resolve().parents[1] / "cycle-three-rows-euclidean"
sys.path.insert(0, str(PREDECESSOR))
import search_cycle_three_rows as base  # noqa: E402


CORE = np.array([
    1.5673564940810407,
    0.02045481824628835,
    0.804611988371201,
    1.545352382277155,
    0.5043100005704171,
    0.502136075443182,
    0.6913404038626824,
])
ESCAPES = "LRL"


def wrap(angle: float) -> float:
    return (angle + math.pi) % (2.0 * math.pi) - math.pi


def angle_bounds() -> list[tuple[float, float]]:
    core_points = base.construct(np.concatenate((CORE, np.zeros(6))))
    result: list[tuple[float, float]] = []
    for row, (source, _) in enumerate(base.ROW_PAIRS):
        radius_vector = core_points[f"q{source}"] - core_points[f"c{row}"]
        radius_angle = math.atan2(radius_vector[1], radius_vector[0])
        outward = -math.pi / 2.0 if ESCAPES[row] == "L" else CORE[0] + math.pi / 2.0
        center = wrap(outward - radius_angle)
        for _ in range(2):
            result.append((center - 0.65, center + 0.65))
    return result


def candidate(target_angles: np.ndarray) -> base.Candidate:
    return base.evaluate(np.concatenate((CORE, target_angles)))


def objective(target_angles: np.ndarray) -> float:
    return candidate(target_angles).penalty


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--maxiter", type=int, default=1000)
    parser.add_argument("--popsize", type=int, default=36)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--seed", type=int, default=20260718)
    args = parser.parse_args()
    limits = angle_bounds()
    result = differential_evolution(
        objective,
        limits,
        seed=args.seed,
        maxiter=args.maxiter,
        popsize=args.popsize,
        workers=args.workers,
        updating="deferred" if args.workers != 1 else "immediate",
        polish=False,
        tol=1e-10,
    )
    polished = minimize(
        objective,
        result.x,
        method="Powell",
        bounds=limits,
        options={"maxiter": 20_000, "xtol": 1e-12, "ftol": 1e-14},
    )
    best = polished.x if objective(polished.x) < objective(result.x) else result.x
    found = candidate(best)
    payload = base.render(found)
    payload.update({
        "schema": "period3-fixed-core-complete-target-search-v1",
        "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_EXACT",
        "fixed_core": CORE.tolist(),
        "escape_pattern": ESCAPES,
        "angle_bounds": limits,
    })
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

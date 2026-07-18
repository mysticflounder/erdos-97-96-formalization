#!/usr/bin/env python3
"""Search one exact-circle target per row on a fixed period-three core.

This is a witness finder, not a decision procedure.  The seven core
parameters come from the positive triangle-edge-reach audit.  Only one angle
on each blocker circle varies.  The complete parameter vector and every
margin group are printed so a hit can be reconstructed and audited exactly.
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
ACTIVE = ("x00", "x10", "x20")


def wrap(angle: float) -> float:
    return (angle + math.pi) % (2.0 * math.pi) - math.pi


def angle_bounds() -> list[tuple[float, float]]:
    seed = np.concatenate((CORE, np.zeros(6)))
    points = base.construct(seed)
    result: list[tuple[float, float]] = []
    for row, (source, _) in enumerate(base.ROW_PAIRS):
        radius_vector = points[f"q{source}"] - points[f"c{row}"]
        radius_angle = math.atan2(radius_vector[1], radius_vector[0])
        outward = -math.pi / 2.0 if ESCAPES[row] == "L" else CORE[0] + math.pi / 2.0
        center = wrap(outward - radius_angle)
        result.append((center - 1.0, center + 1.0))
    return result


def full_parameters(angles: np.ndarray) -> np.ndarray:
    targets = np.zeros(6)
    targets[0] = angles[0]
    targets[2] = angles[1]
    targets[4] = angles[2]
    return np.concatenate((CORE, targets))


def candidate(angles: np.ndarray) -> base.Candidate:
    return base.evaluate(full_parameters(angles), active_targets=ACTIVE)


def objective(angles: np.ndarray) -> float:
    return candidate(angles).penalty


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--maxiter", type=int, default=1200)
    parser.add_argument("--popsize", type=int, default=48)
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
        tol=1e-11,
        atol=1e-13,
    )
    polished = minimize(
        objective,
        result.x,
        method="Powell",
        bounds=limits,
        options={"maxiter": 20_000, "xtol": 1e-13, "ftol": 1e-15},
    )
    best = polished.x if objective(polished.x) < objective(result.x) else result.x
    found = candidate(best)
    payload = base.render(found)
    payload.update({
        "schema": "period3-fixed-core-one-target-per-row-v1",
        "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_EXACT",
        "fixed_core": CORE.tolist(),
        "escape_pattern": ESCAPES,
        "angle_bounds": limits,
        "target_angles": best.tolist(),
        "maxiter": args.maxiter,
        "popsize": args.popsize,
        "workers": args.workers,
        "random_seed": args.seed,
    })
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

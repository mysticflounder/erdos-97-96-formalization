#!/usr/bin/env python3
"""Feasibility search for the equal-radius first-apex role skeleton.

The six co-radial points have roles `S, I, I, I, I, O` around the support
triangle and support the retained/double rows by overlap.  This isolates the
nonlinear MEC geometry before adjoining the physical and reverse rows.
"""

from __future__ import annotations

import argparse
import json
import math

import numpy as np
from scipy.optimize import differential_evolution, minimize


ORDER = ("second", "i0", "i1", "i2", "i3", "surplus", "out", "first", "side")


def unit(theta: float) -> np.ndarray:
    return np.array([math.cos(theta), math.sin(theta)])


def cross(a: np.ndarray, b: np.ndarray, c: np.ndarray) -> float:
    u, v = b - a, c - a
    return float(u[0] * v[1] - u[1] * v[0])


def sqdist(a: np.ndarray, b: np.ndarray) -> float:
    d = a - b
    return float(d @ d)


def construct(p: np.ndarray) -> dict[str, np.ndarray]:
    apex, radius, aS, a0, a1, a2, a3, aO = map(float, p)
    second = np.zeros(2)
    surplus = np.array([1.0, 0.0])
    first = unit(apex)
    result = {"second": second, "surplus": surplus, "first": first}
    for name, angle in zip(("side", "i0", "i1", "i2", "i3", "out"),
                           (aS, a0, a1, a2, a3, aO), strict=True):
        result[name] = first + radius * unit(angle)
    return result


def groups(p: np.ndarray) -> dict[str, list[float]]:
    points = construct(p)
    apex = float(p[0])
    first = points["first"]
    center = np.array([0.5, (1 - first[0]) / (2 * first[1])])
    radius_sq = sqdist(center, points["second"])
    return {
        "angle_order": [
            p[3] - p[2] - 1e-4,
            p[4] - p[3] - 1e-4,
            p[5] - p[4] - 1e-4,
            p[6] - p[5] - 1e-4,
            p[7] - p[6] - 1e-4,
        ],
        "strict_hull": [
            cross(points[ORDER[i]], points[ORDER[(i + 1) % len(ORDER)]], points[name]) - 1e-7
            for i in range(len(ORDER))
            for name in ORDER
            if name not in (ORDER[i], ORDER[(i + 1) % len(ORDER)])
        ],
        "mec": [
            radius_sq - sqdist(center, point) + 1e-10
            for name, point in points.items()
            if name not in ("second", "surplus", "first")
        ],
        "nonobtuse": [math.pi / 2 - apex - 1e-4],
    }


def score(p: np.ndarray) -> float:
    return min(value for values in groups(p).values() for value in values)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--maxiter", type=int, default=1000)
    parser.add_argument("--popsize", type=int, default=36)
    parser.add_argument("--seed", type=int, default=20260718)
    args = parser.parse_args()
    bounds = [
        (0.65, 1.45), (0.25, 1.6),
        (-3.10, -1.60), (-2.80, -1.30), (-2.60, -1.10),
        (-2.40, -0.90), (-2.20, -0.70), (-1.80, -0.20),
    ]
    result = differential_evolution(
        lambda p: -score(p), bounds, seed=args.seed, maxiter=args.maxiter,
        popsize=args.popsize, workers=1, polish=False, tol=1e-11,
    )
    polished = minimize(lambda p: -score(p), result.x, method="Powell",
                        bounds=bounds,
                        options={"maxiter": 20000, "xtol": 1e-13, "ftol": 1e-15})
    best = polished.x if score(polished.x) > score(result.x) else result.x
    ledger = groups(best)
    print(json.dumps({
        "status": "NUMERIC_SAT_CANDIDATE" if score(best) > 0 else "UNKNOWN_NO_HIT",
        "parameters": best.tolist(),
        "points": {name: point.tolist() for name, point in construct(best).items()},
        "boundary": list(ORDER),
        "minimum_margin": score(best),
        "minimum_by_group": {name: min(values) for name, values in ledger.items()},
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

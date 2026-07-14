#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Numerically maximize the strict-convex margin of the `(4,5,6)` residual.

The parametrization satisfies the four saved same-radius rows by construction.
This is a discovery script only; its floating-point output is not a proof.
"""

from __future__ import annotations

import argparse
import json
import math
from typing import Any

import numpy as np
from scipy.optimize import minimize


ORDER = (0, 8, 9, 10, 11, 1, 3, 4, 2, 5, 6, 7)
ROWS = {
    0: (1, 3, 4, 5),
    1: (0, 2, 5, 6),
    2: (1, 7, 8, 9),
    3: (0, 7, 10, 11),
}


def unit(angle: float) -> np.ndarray:
    return np.array((math.cos(angle), math.sin(angle)))


def points_of(values: np.ndarray) -> dict[int, np.ndarray]:
    a3, a4, a2, a6, b8, b9, c10, c11 = values[:8]
    points = {
        0: np.array((0.0, 0.0)),
        1: np.array((1.0, 0.0)),
        3: unit(a3),
        4: unit(a4),
        2: np.array((1.0, 0.0)) + unit(a2),
        5: np.array((0.5, math.sqrt(3.0) / 2.0)),
        6: np.array((1.0, 0.0)) + unit(a6),
    }
    delta = points[3] - points[2]
    length = float(np.linalg.norm(delta))
    midpoint = (points[2] + points[3]) / 2.0
    height = math.sqrt(max(0.0, 1.0 - length * length / 4.0))
    perpendicular = np.array((-delta[1], delta[0])) / length
    candidates = (midpoint + height * perpendicular, midpoint - height * perpendicular)
    points[7] = min(candidates, key=lambda point: point[0] + point[1])
    points[8] = points[2] + unit(b8)
    points[9] = points[2] + unit(b9)
    points[10] = points[3] + unit(c10)
    points[11] = points[3] + unit(c11)
    return points


def convex_margins(values: np.ndarray) -> np.ndarray:
    points = points_of(values)
    margins = []
    for index, left in enumerate(ORDER):
        right = ORDER[(index + 1) % len(ORDER)]
        edge = points[right] - points[left]
        for label in ORDER:
            if label not in (left, right):
                delta = points[label] - points[left]
                margins.append(edge[0] * delta[1] - edge[1] * delta[0])
    return np.asarray(margins)


def pairwise_squared_distances(values: np.ndarray) -> np.ndarray:
    points = points_of(values)
    return np.asarray(
        [
            float((points[a] - points[b]) @ (points[a] - points[b]))
            for a in range(12)
            for b in range(a + 1, 12)
        ]
    )


def diagnostics(values: np.ndarray) -> dict[str, Any]:
    points = points_of(values)
    equalities = []
    exact_gaps = []
    for center, support in ROWS.items():
        radius = float(
            (points[center] - points[support[0]])
            @ (points[center] - points[support[0]])
        )
        for label in support[1:]:
            distance = float(
                (points[center] - points[label])
                @ (points[center] - points[label])
            )
            equalities.append(distance - radius)
        for label in range(12):
            if label != center and label not in support:
                distance = float(
                    (points[center] - points[label])
                    @ (points[center] - points[label])
                )
                exact_gaps.append(abs(distance - radius))
    return {
        "minimum_convex_margin": float(np.min(convex_margins(values))),
        "minimum_pairwise_squared_distance": float(
            np.min(pairwise_squared_distances(values))
        ),
        "minimum_exact_squared_distance_gap": float(min(exact_gaps)),
        "maximum_abs_row_equality_residual": float(max(map(abs, equalities))),
        "angles": [float(value) for value in values[:8]],
        "coordinates": {
            str(label): [float(value) for value in points[label]]
            for label in range(12)
        },
    }


def solve(starts: int) -> dict[str, Any]:
    initial_angles = np.array(
        (0.688, 0.697, 2.084, 2.618, -2.017, -1.873, -1.437, -1.427)
    )
    initial = np.concatenate((initial_angles, np.array((1.0e-4,))))
    bounds = (
        (0.45, 0.95),
        (0.45, 0.95),
        (1.75, 2.35),
        (2.30, 2.95),
        (-2.40, -1.70),
        (-2.20, -1.45),
        (-1.75, -1.10),
        (-1.75, -1.05),
        (1.0e-8, 0.25),
    )
    rng = np.random.default_rng(4569796)
    attempts = []
    for start in range(starts):
        seed = initial.copy()
        if start:
            seed[:8] += rng.normal(0.0, 0.03, 8)
        result = minimize(
            lambda values: -float(values[8]),
            seed,
            method="SLSQP",
            bounds=bounds,
            constraints=(
                {
                    "type": "ineq",
                    "fun": lambda values: convex_margins(values) - values[8],
                },
                {
                    "type": "ineq",
                    "fun": lambda values: pairwise_squared_distances(values)
                    - 1.0e-5,
                },
            ),
            options={"ftol": 1.0e-13, "maxiter": 5000, "disp": False},
        )
        record = {
            "start": start,
            "success": bool(result.success),
            "message": str(result.message),
            "iterations": int(result.nit),
            "claimed_margin": float(result.x[8]),
            "diagnostics": diagnostics(result.x),
        }
        attempts.append(record)
    best = max(attempts, key=lambda item: item["diagnostics"]["minimum_convex_margin"])
    return {
        "epistemic_status": "NUMERICAL_DISCOVERY_ONLY_NOT_A_PROOF",
        "profile": [4, 5, 6],
        "cyclic_order": list(ORDER),
        "metric_rows": [f"{c}:{','.join(map(str, s))}" for c, s in ROWS.items()],
        "starts": starts,
        "best": best,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--starts", type=int, default=16)
    args = parser.parse_args()
    if args.starts < 1:
        parser.error("--starts must be positive")
    print(json.dumps(solve(args.starts), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

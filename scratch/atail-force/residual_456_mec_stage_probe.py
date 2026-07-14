#!/usr/bin/env python3
"""Stage the equality-parametrized `(4,5,6)` MEC feasibility search.

Numerical discovery only.  The stages identify which circle leaves turn the
five-label unit-edge core from robustly feasible into a boundary-only limit.
"""

from __future__ import annotations

import math

import numpy as np
from scipy.optimize import differential_evolution

import residual_456_mec_parametric_optimizer as base


STAGES = {
    "five_label_core": (0, 1, 3, 2, 7),
    "plus_equilateral_5": (0, 1, 3, 2, 5, 7),
    "mec_center3_leaf_no_5_no_7": (0, 10, 1, 3, 2),
    "mec_center3_leaf_plus_5": (0, 10, 1, 3, 2, 5),
    "mec_center3_leaf_plus_7": (0, 10, 1, 3, 2, 7),
    "one_center3_lower_leaf": (0, 10, 1, 3, 2, 5, 7),
    "two_center3_lower_leaves": (0, 10, 11, 1, 3, 2, 5, 7),
    "upper_chain": (0, 1, 3, 4, 2, 5, 6, 7),
    "center2_lower_chain": (0, 8, 9, 1, 3, 4, 2, 5, 6, 7),
    "center3_lower_chain": (0, 10, 11, 1, 3, 4, 2, 5, 6, 7),
    "full": base.ORDER,
}


def score(values: np.ndarray, branch: int, labels: tuple[int, ...]) -> float:
    points = base.points_of(values, branch)
    if points is None:
        return -1e6
    convex = [
        base.cross(points[labels[index]], points[labels[(index + 1) % len(labels)]], points[label])
        for index in range(len(labels))
        for label in labels
        if label not in (labels[index], labels[(index + 1) % len(labels)])
    ]
    x2, y2 = points[2]
    if y2 <= 0:
        return -1e6
    center = np.array([0.5, (x2 * x2 + y2 * y2 - x2) / (2.0 * y2)])
    radius_squared = float(center @ center)
    disk = [
        radius_squared - float((points[label] - center) @ (points[label] - center))
        for label in labels
        if label not in (0, 1, 2)
    ]
    pairwise = [
        float((points[left] - points[right]) @ (points[left] - points[right]))
        for index, left in enumerate(labels)
        for right in labels[index + 1 :]
    ]
    p0, p1, p2 = points[0], points[1], points[2]
    nonobtuse = [
        float((p1 - p0) @ (p2 - p0)),
        float((p2 - p1) @ (p0 - p1)),
        float((p0 - p2) @ (p1 - p2)),
    ]
    return min(min(convex), min(disk), min(pairwise), min(nonobtuse))


def main() -> int:
    bounds = [
        (1e-4, math.pi / 3.0 - 1e-4),
        (1e-4, math.pi / 3.0 - 1e-4),
        (math.pi / 2.0, 2.0 * math.pi / 3.0),
        (2.0 * math.pi / 3.0, math.pi - 1e-4),
        (math.pi, 2.0 * math.pi),
        (math.pi, 2.0 * math.pi),
        (math.pi, 2.0 * math.pi),
        (math.pi, 2.0 * math.pi),
    ]
    for stage_index, (name, labels) in enumerate(STAGES.items()):
        best = (-1e6, 0, None)
        for branch in (-1, 1):
            result = differential_evolution(
                lambda values: -score(values, branch, labels),
                bounds,
                seed=456_000 + stage_index * 10 + branch,
                maxiter=350,
                popsize=12,
                tol=1e-9,
                polish=True,
                workers=1,
            )
            candidate = -float(result.fun)
            if candidate > best[0]:
                best = (candidate, branch, result.x)
        print(f"{name}: score={best[0]:.12g}, branch={best[1]}, angles={best[2].tolist()}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

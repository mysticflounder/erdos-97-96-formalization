#!/usr/bin/env python3
"""Sample the normalized one-row extension surface.

This is theorem-discovery only.  Equalities are imposed by parameterization;
random sampling does not prove coverage or unsatisfiability.
"""

from __future__ import annotations

import argparse
import json
import math

import numpy as np
from scipy.spatial import ConvexHull, QhullError


Point = np.ndarray


def point(theta: float) -> Point:
    return np.array([math.cos(theta), math.sin(theta)])


def cross(a: Point, b: Point, c: Point) -> float:
    u = b - a
    v = c - a
    return float(u[0] * v[1] - u[1] * v[0])


def sqdist(a: Point, b: Point) -> float:
    d = a - b
    return float(d @ d)


def strict_hull_margin(points: list[Point]) -> float:
    try:
        hull = ConvexHull(np.array(points))
    except QhullError:
        return -math.inf
    if len(hull.vertices) != len(points):
        return -math.inf
    margin = math.inf
    order = list(hull.vertices)
    for k, i in enumerate(order):
        j = order[(k + 1) % len(order)]
        for ell in range(len(points)):
            if ell not in (i, j):
                margin = min(margin, cross(points[i], points[j], points[ell]))
    return margin


def run(samples: int, seed: int) -> dict[str, object]:
    rng = np.random.default_rng(seed)
    eligible = 0
    strict_core = 0
    best_margin = -math.inf
    best: dict[str, object] | None = None
    o = np.zeros(2)
    left = point(0.0)

    for _ in range(samples):
        theta = float(rng.uniform(0.45, math.pi / 2 - 0.001))
        a = float(rng.uniform(0.005, theta - 0.08))
        b = float(rng.uniform(a + 0.04, theta - 0.005))
        right = point(theta)
        q = point(a)
        q_prime = point(b)
        mid = (a + b) / 2
        ray = point(mid)

        mec_center = point(theta / 2) / (2 * math.cos(theta / 2))
        mec_radius_sq = sqdist(mec_center, o)
        cap_floor = math.cos(theta / 2) / math.cos(mid - theta / 2)
        disk_ceiling = 2 * float(mec_center @ ray)
        if cap_floor + 1e-4 >= disk_ceiling - 1e-4:
            continue
        radial = float(rng.uniform(cap_floor + 1e-4, disk_ceiling - 1e-4))
        center = radial * ray
        core = [o, left, q, center, q_prime, right]
        core_margin = strict_hull_margin(core)
        if core_margin <= 1e-9:
            continue
        strict_core += 1

        row_radius = math.sqrt(sqdist(center, q))
        phi = float(rng.uniform(0.0, 2 * math.pi))
        target = center + row_radius * point(phi)
        if cross(left, right, target) <= 1e-8:
            continue
        if sqdist(mec_center, target) > mec_radius_sq + 1e-10:
            continue
        eligible += 1
        margin = strict_hull_margin([*core, target])
        best_margin = max(best_margin, margin)
        if margin > 1e-9:
            equality_error = max(
                abs(sqdist(o, q) - sqdist(o, q_prime)),
                abs(sqdist(center, q) - sqdist(center, q_prime)),
                abs(sqdist(center, q) - sqdist(center, target)),
            )
            best = {
                "theta": theta,
                "source_angles": [a, b],
                "center_radial": radial,
                "target_angle_about_center": phi,
                "points": {
                    "o": o.tolist(),
                    "left": left.tolist(),
                    "q": q.tolist(),
                    "center": center.tolist(),
                    "q_prime": q_prime.tolist(),
                    "right": right.tolist(),
                    "target": target.tolist(),
                },
                "strict_hull_margin": margin,
                "disk_margin": mec_radius_sq - sqdist(mec_center, target),
                "outside_cap_margin": cross(left, right, target),
                "equality_error": equality_error,
            }
            break

    return {
        "status": "SAT_SAMPLE" if best is not None else "UNKNOWN_NO_HIT",
        "coverage_complete": False,
        "samples_requested": samples,
        "strict_convex_cores": strict_core,
        "eligible_targets": eligible,
        "best_hull_margin": best_margin if math.isfinite(best_margin) else None,
        "witness": best,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--samples", type=int, default=200_000)
    parser.add_argument("--seed", type=int, default=20260717)
    args = parser.parse_args()
    print(json.dumps(run(args.samples, args.seed), indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

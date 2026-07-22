#!/usr/bin/env python3
"""Scan the rank-two eight-role core of the distinct cross-color packet.

After a similarity put the second apex at the origin and its exact-five
circle at radius one.  Rotate so the physical hub is ``(1,0)``.  The two
physical row points are then the symmetric unit-circle points at angles
``-alpha`` and ``alpha``.  The retained outside point is the second
intersection of the hub circle and the retained first-apex circle.  The
double outside point is an intersection of the hub circle with the other
first-apex circle, which contains the hub itself.

Every eight-point subset of a strictly convex carrier must remain strictly
convex in inherited cyclic order.  This script searches the complete
three-angle parameter space for such an eight-role core.  It is numerical
falsification only, not a coverage proof.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path

import numpy as np


def cross(a: np.ndarray, b: np.ndarray, c: np.ndarray) -> float:
    left = b - a
    right = c - a
    return float(left[0] * right[1] - left[1] * right[0])


def other_intersection(
    first: np.ndarray,
    center0: np.ndarray,
    center1: np.ndarray,
) -> np.ndarray:
    """Reflect one circle intersection across the center line."""

    direction = center1 - center0
    direction /= np.linalg.norm(direction)
    projection = center0 + direction * ((first - center0) @ direction)
    return 2.0 * projection - first


def circle_intersections(
    center0: np.ndarray,
    radius0: float,
    center1: np.ndarray,
    radius1: float,
) -> tuple[np.ndarray, np.ndarray] | None:
    delta = center1 - center0
    distance = float(np.linalg.norm(delta))
    if distance <= 1.0e-12:
        return None
    x = (radius0**2 - radius1**2 + distance**2) / (2.0 * distance)
    height_squared = radius0**2 - x**2
    if height_squared <= 1.0e-12:
        return None
    unit = delta / distance
    base = center0 + x * unit
    normal = np.array([-unit[1], unit[0]])
    height = math.sqrt(height_squared)
    return base + height * normal, base - height * normal


def evaluate(alpha: float, beta: float, gamma: float, branch: int) -> dict[str, object] | None:
    second_apex = np.array([0.0, 0.0])
    hub = np.array([1.0, 0.0])
    p1 = np.array([math.cos(alpha), -math.sin(alpha)])
    p3 = np.array([math.cos(alpha), math.sin(alpha)])
    first_apex = np.array([math.cos(beta), math.sin(beta)])
    vertex = np.array([math.cos(gamma), -math.sin(gamma)])

    retained_outside = other_intersection(
        p3, first_apex, hub
    )
    hub_radius = float(np.linalg.norm(hub - p1))
    double_radius = float(np.linalg.norm(first_apex - hub))
    intersections = circle_intersections(
        hub, hub_radius, first_apex, double_radius
    )
    if intersections is None:
        return None
    double_outside = intersections[branch]

    names = ("V", "p1", "hub", "p3", "O1", "O2", "r", "d")
    points = (
        vertex,
        p1,
        hub,
        p3,
        first_apex,
        second_apex,
        retained_outside,
        double_outside,
    )
    areas = [
        cross(points[left], points[(left + 1) % len(points)], points[point])
        for left in range(len(points))
        for point in range(len(points))
        if point not in {left, (left + 1) % len(points)}
    ]
    return {
        "alpha": alpha,
        "beta": beta,
        "gamma": gamma,
        "branch": branch,
        "minimum_halfplane_area": min(areas),
        "coordinates": {
            name: [float(value) for value in point]
            for name, point in zip(names, points, strict=True)
        },
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--samples", type=int, default=2_000_000)
    parser.add_argument("--seed", type=int, default=20260721)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    rng = np.random.default_rng(args.seed)
    best: dict[str, object] | None = None
    admissible = 0
    for _ in range(args.samples):
        # beta + gamma <= pi/2 is exactly the nonobtuse condition at O2 for
        # the isosceles support triangle O2-O1-V.  The other angles are then
        # automatically acute.
        beta = rng.uniform(0.08, 1.45)
        gamma = rng.uniform(0.08, 1.45)
        if beta + gamma >= math.pi / 2.0 - 1.0e-4:
            continue
        maximum_alpha = min(beta, gamma) - 1.0e-3
        if maximum_alpha <= 0.02:
            continue
        alpha = rng.uniform(0.01, maximum_alpha)
        for branch in (0, 1):
            candidate = evaluate(alpha, beta, gamma, branch)
            if candidate is None:
                continue
            admissible += 1
            if best is None or float(candidate["minimum_halfplane_area"]) > float(
                best["minimum_halfplane_area"]
            ):
                best = candidate
            if float(candidate["minimum_halfplane_area"]) > 1.0e-7:
                payload = {
                    "status": "NUMERICAL_CONVEX_CORE_WITNESS",
                    "epistemic_scope": (
                        "floating-point eight-role rank-two core only; not a "
                        "full cap packet or Problem 97 counterexample"
                    ),
                    "samples": args.samples,
                    "admissible": admissible,
                    **candidate,
                }
                text = json.dumps(payload, indent=2, sort_keys=True)
                if args.output is not None:
                    args.output.write_text(text + "\n")
                print(text)
                return
    payload = {
        "status": "NO_CONVEX_CORE_FOUND",
        "samples": args.samples,
        "admissible": admissible,
        "best": best,
    }
    text = json.dumps(payload, indent=2, sort_keys=True)
    if args.output is not None:
        args.output.write_text(text + "\n")
    print(text)


if __name__ == "__main__":
    main()

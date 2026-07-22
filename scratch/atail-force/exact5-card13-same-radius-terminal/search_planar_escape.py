#!/usr/bin/env python3
"""Search for a planar/MEC realization of the same-radius escape pattern.

This is a falsification aid, not a proof.  Vertices 0, 4, and 8 are fixed on
the unit MEC in cyclic order.  The remaining ten carrier points lie on fixed
intermediate rays with optimized radii.  The equations encode the two complete
apex classes and one asymmetric two-hit row whose outside pair consists of one
surplus-interior point and one strict first-opposite-cap point.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path

import numpy as np
from scipy.optimize import least_squares


N = 13
SUPPORT = {0, 4, 8}
VARIABLE = tuple(point for point in range(N) if point not in SUPPORT)
ANGLES = np.array([2.0 * math.pi * point / N for point in range(N)])

# Exact-five O2 class: physical strict points 1,2,3 and one point from each
# adjacent cap.  Exact-six O1 class: all strict C1 points 9,10,11,12 plus one
# point from each adjacent cap.
O2_CLASS = (1, 2, 3, 7, 9)
O1_CLASS = (2, 6, 9, 10, 11, 12)

# Asymmetric source row centered at physical point 2.  Its physical hits are
# 1 and 3; point 5 is the intended strict-surplus escape and point 9 is the
# strict-C1 outside point.
ASYM_ROW = (1, 3, 5, 9)


def coordinates(parameters: np.ndarray) -> np.ndarray:
    radii = np.ones(N)
    radii[list(VARIABLE)] = parameters
    return np.column_stack((radii * np.cos(ANGLES), radii * np.sin(ANGLES)))


def squared_distance(points: np.ndarray, left: int, right: int) -> float:
    delta = points[left] - points[right]
    return float(delta @ delta)


def oriented_area(a: np.ndarray, b: np.ndarray, c: np.ndarray) -> float:
    left = b - a
    right = c - a
    return float(left[0] * right[1] - left[1] * right[0])


def equality_residuals(points: np.ndarray) -> list[float]:
    equations: list[float] = []
    for center, support in ((8, O2_CLASS), (4, O1_CLASS), (2, ASYM_ROW)):
        reference = squared_distance(points, center, support[0])
        equations.extend(
            squared_distance(points, center, point) - reference
            for point in support[1:]
        )
    return equations


def residuals(parameters: np.ndarray, margin: float) -> np.ndarray:
    points = coordinates(parameters)
    output = equality_residuals(points)
    # Strict convexity in the advertised cyclic order: every other point is
    # strictly left of each oriented polygon edge.
    for left in range(N):
        right = (left + 1) % N
        for point in range(N):
            if point in {left, right}:
                continue
            area = oriented_area(points[left], points[right], points[point])
            output.append(20.0 * max(0.0, margin - area))
    return np.array(output)


def audit(parameters: np.ndarray) -> dict[str, object]:
    points = coordinates(parameters)
    equalities = equality_residuals(points)
    areas = [
        oriented_area(points[left], points[(left + 1) % N], points[point])
        for left in range(N)
        for point in range(N)
        if point not in {left, (left + 1) % N}
    ]
    radius_classes: dict[str, list[int]] = {}
    for center in (4, 8):
        support = O1_CLASS if center == 4 else O2_CLASS
        radius = squared_distance(points, center, support[0])
        radius_classes[str(center)] = [
            point for point in range(N)
            if point != center
            and abs(squared_distance(points, center, point) - radius) < 1.0e-7
        ]
    return {
        "max_squared_distance_equality_error": max(map(abs, equalities)),
        "min_edge_halfplane_area": min(areas),
        "max_norm_squared": max(float(point @ point) for point in points),
        "radius_classes": radius_classes,
        "coordinates": {
            str(index): [float(value) for value in point]
            for index, point in enumerate(points)
        },
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--seeds", type=int, default=200)
    parser.add_argument("--margin", type=float, default=1.0e-4)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    rng = np.random.default_rng(20260721)
    best = None
    for _ in range(args.seeds):
        start = rng.uniform(0.72, 0.995, size=len(VARIABLE))
        result = least_squares(
            residuals,
            start,
            args=(args.margin,),
            bounds=(np.full(len(VARIABLE), 0.2), np.full(len(VARIABLE), 0.9999)),
            max_nfev=20_000,
            ftol=1.0e-13,
            xtol=1.0e-13,
            gtol=1.0e-13,
        )
        candidate = audit(result.x)
        score = max(
            float(candidate["max_squared_distance_equality_error"]),
            max(0.0, args.margin - float(candidate["min_edge_halfplane_area"])),
        )
        if best is None or score < best[0]:
            best = (score, result.x, candidate)
        if (
            candidate["max_squared_distance_equality_error"] < 1.0e-9
            and candidate["min_edge_halfplane_area"] > 0.5 * args.margin
            and candidate["radius_classes"]["4"] == list(O1_CLASS)
            and candidate["radius_classes"]["8"] == list(O2_CLASS)
        ):
            payload = {
                "status": "NUMERICAL_PLANAR_MEC_WITNESS",
                "epistemic_scope": (
                    "floating-point realization of the local cap/class/row geometry; "
                    "not a full critical-system or Problem 97 counterexample"
                ),
                **candidate,
            }
            text = json.dumps(payload, indent=2, sort_keys=True)
            if args.output is not None:
                args.output.write_text(text + "\n")
            print(text)
            return
    assert best is not None
    payload = {
        "status": "NO_WITNESS_FOUND",
        "best_score": best[0],
        **best[2],
    }
    text = json.dumps(payload, indent=2, sort_keys=True)
    if args.output is not None:
        args.output.write_text(text + "\n")
    print(text)


if __name__ == "__main__":
    main()

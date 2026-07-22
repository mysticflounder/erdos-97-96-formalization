#!/usr/bin/env python3
"""Search for a convex/MEC realization of the distinct cross-color residue.

This is a falsification aid, not a proof.  The support vertices 0, 4, and 8
are fixed on the unit circle.  The other ten points have independently
optimized polar angles and radii, subject to their advertised cyclic order
and strict unit-disk containment.

The encoded incidences are the complete local exact-five card-13 packet:

* the unique five-point second-apex class;
* the two disjoint exact-four first-apex classes from the distinct-radius arm;
* the asymmetric two-hit row whose outside pair uses one point from each
  first-apex class; and
* the retained parent rows and their two-point overlap.

It deliberately does not encode carrier-wide K4, a total critical-shell
system, or minimality.  A numerical hit therefore demonstrates only that the
strengthened local geometric residue is compatible with convex/MEC geometry.
"""

from __future__ import annotations

import argparse
import json
import math
import multiprocessing as mp
from pathlib import Path

import numpy as np
from scipy.optimize import least_squares


N = 13
SUPPORT = (0, 4, 8)
VARIABLE = tuple(point for point in range(N) if point not in SUPPORT)

# Physical exact-five cap C2 = {0,1,2,3,4}; first opposite cap
# C1 = {8,9,10,11,12,0}; surplus C0 = {4,5,6,7,8}.
PHYSICAL_STRICT = frozenset({1, 2, 3})
FIRST_STRICT = frozenset({9, 10, 11, 12})

# Complete radius classes.  At O1=4, RETAINED contains q=9 and w=3 while
# DOUBLE avoids both; their strict-C1 parts partition FIRST_STRICT.
SECOND_CLASS = (0, 1, 2, 3, 4)
RETAINED_CLASS = (3, 5, 9, 10)
DOUBLE_CLASS = (2, 6, 11, 12)

# The two-hit row is centered at the middle physical point 2.  Its outside
# pair 9,11 crosses RETAINED_CLASS and DOUBLE_CLASS.
TWO_HIT_ROW = (1, 3, 9, 11)

# Retained q-deleted parent rows: B1 is the double class, and B2 can select
# four points from the complete second class.  Their overlap is {1,7}.
PARENT_FIRST = DOUBLE_CLASS
PARENT_SECOND = (0, 1, 2, 3)


FRACTION_LOWER = np.array([
    0.05, 0.36, 0.69,
    0.05, 0.36, 0.69,
    0.03, 0.27, 0.51, 0.75,
])
FRACTION_UPPER = np.array([
    0.31, 0.64, 0.95,
    0.31, 0.64, 0.95,
    0.23, 0.47, 0.71, 0.97,
])


def coordinates(parameters: np.ndarray) -> np.ndarray:
    first_support_angle = parameters[0]
    second_support_angle = parameters[1]
    fractions = parameters[2:2 + len(VARIABLE)]
    angles = np.empty(N)
    angles[0] = 0.0
    angles[4] = first_support_angle
    angles[8] = second_support_angle
    for offset, point in enumerate((1, 2, 3)):
        angles[point] = fractions[offset] * first_support_angle
    for offset, point in enumerate((5, 6, 7), start=3):
        angles[point] = first_support_angle + fractions[offset] * (
            second_support_angle - first_support_angle
        )
    for offset, point in enumerate((9, 10, 11, 12), start=6):
        angles[point] = second_support_angle + fractions[offset] * (
            2.0 * math.pi - second_support_angle
        )
    radii = np.ones(N)
    radii[list(VARIABLE)] = parameters[2 + len(VARIABLE):]
    return np.column_stack((radii * np.cos(angles), radii * np.sin(angles)))


def squared_distance(points: np.ndarray, left: int, right: int) -> float:
    delta = points[left] - points[right]
    return float(delta @ delta)


def oriented_area(a: np.ndarray, b: np.ndarray, c: np.ndarray) -> float:
    left = b - a
    right = c - a
    return float(left[0] * right[1] - left[1] * right[0])


def equality_residuals(points: np.ndarray) -> list[float]:
    equations: list[float] = []
    for center, support in (
        (8, SECOND_CLASS),
        (4, RETAINED_CLASS),
        (4, DOUBLE_CLASS),
        (2, TWO_HIT_ROW),
    ):
        reference = squared_distance(points, center, support[0])
        equations.extend(
            squared_distance(points, center, point) - reference
            for point in support[1:]
        )
    return equations


def residuals(parameters: np.ndarray, margin: float) -> np.ndarray:
    points = coordinates(parameters)
    output = equality_residuals(points)

    # Strict convexity: each non-edge point must lie to the left of every
    # counterclockwise oriented polygon edge.
    for left in range(N):
        right = (left + 1) % N
        for point in range(N):
            if point in {left, right}:
                continue
            area = oriented_area(points[left], points[right], points[point])
            output.append(50.0 * max(0.0, margin - area))

    # Keep all non-support points visibly inside the MEC rather than allowing
    # the optimizer to sit on the radial upper bound.
    # The support triangle remains in the nonobtuse circumscribed branch:
    # each of its three central arcs is at most pi.
    first_support_angle = parameters[0]
    second_support_angle = parameters[1]
    output.append(20.0 * max(0.0, second_support_angle - first_support_angle - math.pi))
    output.append(20.0 * max(0.0, 2.0 * math.pi - second_support_angle - math.pi))

    radii = parameters[2 + len(VARIABLE):]
    output.extend(2.0 * max(0.0, radius - 0.998) for radius in radii)
    return np.array(output)


def complete_class(
    points: np.ndarray, center: int, support: tuple[int, ...], tolerance: float
) -> list[int]:
    radius = squared_distance(points, center, support[0])
    return [
        point
        for point in range(N)
        if point != center
        and abs(squared_distance(points, center, point) - radius) < tolerance
    ]


def audit(parameters: np.ndarray) -> dict[str, object]:
    points = coordinates(parameters)
    equalities = equality_residuals(points)
    areas = [
        oriented_area(points[left], points[(left + 1) % N], points[point])
        for left in range(N)
        for point in range(N)
        if point not in {left, (left + 1) % N}
    ]
    retained_radius = squared_distance(points, 4, RETAINED_CLASS[0])
    double_radius = squared_distance(points, 4, DOUBLE_CLASS[0])
    hub_vectors = (points[1] - points[2], points[3] - points[2])
    return {
        "max_squared_distance_equality_error": max(map(abs, equalities)),
        "min_edge_halfplane_area": min(areas),
        "max_non_support_norm_squared": max(
            float(points[point] @ points[point]) for point in VARIABLE
        ),
        "first_apex_squared_radius_gap": abs(retained_radius - double_radius),
        "hub_obtuse_dot_product": float(hub_vectors[0] @ hub_vectors[1]),
        "radius_classes": {
            "second": complete_class(points, 8, SECOND_CLASS, 1.0e-7),
            "retained": complete_class(points, 4, RETAINED_CLASS, 1.0e-7),
            "double": complete_class(points, 4, DOUBLE_CLASS, 1.0e-7),
            "two_hit": complete_class(points, 2, TWO_HIT_ROW, 1.0e-7),
        },
        "coordinates": {
            str(index): [float(value) for value in point]
            for index, point in enumerate(points)
        },
    }


def score(candidate: dict[str, object], margin: float) -> float:
    return max(
        float(candidate["max_squared_distance_equality_error"]),
        max(0.0, margin - float(candidate["min_edge_halfplane_area"])),
        max(0.0, float(candidate["max_non_support_norm_squared"]) - 0.998**2),
    )


def valid(candidate: dict[str, object], margin: float) -> bool:
    classes = candidate["radius_classes"]
    assert isinstance(classes, dict)
    return (
        float(candidate["max_squared_distance_equality_error"]) < 1.0e-9
        and float(candidate["min_edge_halfplane_area"]) > 0.5 * margin
        and float(candidate["max_non_support_norm_squared"]) < 0.9985**2
        and float(candidate["first_apex_squared_radius_gap"]) > 1.0e-5
        and float(candidate["hub_obtuse_dot_product"]) < -1.0e-5
        and classes["second"] == list(SECOND_CLASS)
        and classes["retained"] == list(RETAINED_CLASS)
        and classes["double"] == list(DOUBLE_CLASS)
        and classes["two_hit"] == list(TWO_HIT_ROW)
    )


def one_seed(task: tuple[int, float]) -> tuple[float, dict[str, object]]:
    seed, margin = task
    rng = np.random.default_rng(seed)
    support_angles = np.array([
        rng.uniform(0.85, 3.05),
        rng.uniform(3.23, 5.43),
    ])
    fractions = rng.uniform(FRACTION_LOWER, FRACTION_UPPER)
    radii = rng.uniform(0.68, 0.995, size=len(VARIABLE))
    start = np.concatenate((support_angles, fractions, radii))
    lower = np.concatenate((
        np.array([0.75, math.pi]),
        FRACTION_LOWER,
        np.full(len(VARIABLE), 0.25),
    ))
    upper = np.concatenate((
        np.array([math.pi, 2.0 * math.pi - 0.75]),
        FRACTION_UPPER,
        np.full(len(VARIABLE), 0.9995),
    ))
    result = least_squares(
        residuals,
        start,
        args=(margin,),
        bounds=(lower, upper),
        max_nfev=5_000,
        ftol=1.0e-13,
        xtol=1.0e-13,
        gtol=1.0e-13,
    )
    candidate = audit(result.x)
    candidate["seed"] = seed
    candidate["optimizer_cost"] = float(result.cost)
    candidate["optimizer_optimality"] = float(result.optimality)
    return score(candidate, margin), candidate


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--seeds", type=int, default=240)
    parser.add_argument("--jobs", type=int, default=24)
    parser.add_argument("--margin", type=float, default=2.0e-5)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    tasks = [(2026072100 + seed, args.margin) for seed in range(args.seeds)]
    best: tuple[float, dict[str, object]] | None = None
    with mp.Pool(processes=args.jobs) as pool:
        for trial in pool.imap_unordered(one_seed, tasks):
            if best is None or trial[0] < best[0]:
                best = trial
            if valid(trial[1], args.margin):
                payload = {
                    "status": "NUMERICAL_PLANAR_MEC_WITNESS",
                    "epistemic_scope": (
                        "floating-point realization of the strengthened local "
                        "distinct-cross cap/class/row geometry; not a total "
                        "critical system or Problem 97 counterexample"
                    ),
                    "support_vertices": list(SUPPORT),
                    "caps": {
                        "physical_exact5": [0, 1, 2, 3, 4],
                        "surplus_exact5": [4, 5, 6, 7, 8],
                        "first_opposite_exact6": [8, 9, 10, 11, 12, 0],
                    },
                    "classes": {
                        "second_apex_exact5": list(SECOND_CLASS),
                        "first_apex_retained_exact4": list(RETAINED_CLASS),
                        "first_apex_double_exact4": list(DOUBLE_CLASS),
                        "two_hit_row_exact4": list(TWO_HIT_ROW),
                        "parent_first": list(PARENT_FIRST),
                        "parent_second": list(PARENT_SECOND),
                    },
                    **trial[1],
                }
                text = json.dumps(payload, indent=2, sort_keys=True)
                if args.output is not None:
                    args.output.write_text(text + "\n")
                print(text)
                pool.terminate()
                return
    assert best is not None
    payload = {
        "status": "NO_WITNESS_FOUND",
        "trials": args.seeds,
        "best_score": best[0],
        **best[1],
    }
    text = json.dumps(payload, indent=2, sort_keys=True)
    if args.output is not None:
        args.output.write_text(text + "\n")
    print(text)


if __name__ == "__main__":
    main()

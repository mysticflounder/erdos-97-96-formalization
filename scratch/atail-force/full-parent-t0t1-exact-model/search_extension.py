#!/usr/bin/env python3
"""Extend the exact 15-point three-row model by source-faithful T0/T1 rows.

The fixed cell is the unequal-radius, fully disjoint `2I+2O` profile.  The
retained frontier pair is the two T0 points in the strict first-opposite cap;
T1 is a four-point row surviving their deletion.  Circle equalities are
imposed by parameterization.  This is a witness search, never an UNSAT tool.
"""

from __future__ import annotations

import argparse
from fractions import Fraction as F
import json
import math
from pathlib import Path
import sys

import numpy as np
from scipy.optimize import differential_evolution, minimize


PREDECESSOR = Path(__file__).resolve().parents[1] / "three-complete-reverse-rows-analytic"
sys.path.insert(0, str(PREDECESSOR))
import verify_exact_countermodel as exact  # noqa: E402


Point = np.ndarray
T0 = ("t0i0", "t0i1", "t0o0", "t0o1")
T1 = ("t1i0", "t1i1", "t1o0", "t1o1")
WORD = (
    "o", "x20", "t0i0", "t0i1", "x00", "x01", "x21",
    "t1i0", "t1i1", "left", "q0", "t1o0", "t1o1",
    "t0o0", "t0o1", "b0", "b2", "q1", "b1", "q2",
    "right", "zR", "x10", "x11", "zO",
)


def as_float(point: tuple[object, object]) -> Point:
    return np.array([float(point[0]), float(point[1])], dtype=float)


def bulge(a: tuple[F, F], b: tuple[F, F], t: F) -> tuple[F, F]:
    """One exact outward vertex replacing the directed edge `a -> b`."""
    direction = (b[0] - a[0], b[1] - a[1])
    outward = (direction[1], -direction[0])
    weight = F(1, 1000)
    return (
        (1 - t) * a[0] + t * b[0] + weight * outward[0],
        (1 - t) * a[1] + t * b[1] + weight * outward[1],
    )


SEED_EXACT = exact.construct()
SEED_EXACT["zR"] = bulge(SEED_EXACT["right"], SEED_EXACT["x10"], F(1, 10))
SEED_EXACT["zO"] = bulge(SEED_EXACT["x11"], SEED_EXACT["o"], F(1, 5))
SEED = {name: as_float(point) for name, point in SEED_EXACT.items()}


def unit(theta: float) -> Point:
    return np.array([math.cos(theta), math.sin(theta)], dtype=float)


def cross(a: Point, b: Point, c: Point) -> float:
    u, v = b - a, c - a
    return float(u[0] * v[1] - u[1] * v[0])


def sqdist(a: Point, b: Point) -> float:
    delta = a - b
    return float(delta @ delta)


def construct(parameters: np.ndarray) -> dict[str, Point]:
    r0, r1, *angles = map(float, parameters)
    points = {name: point.copy() for name, point in SEED.items()}
    center = points["right"]
    for name, angle in zip((*T0[:2], *T1[:2], *T1[2:], *T0[2:]), angles, strict=True):
        radius = r0 if name.startswith("t0") else r1
        points[name] = center + radius * unit(angle)
    return points


def all_margins(parameters: np.ndarray) -> dict[str, list[float]]:
    points = construct(parameters)
    right = points["right"]
    mec_center = np.array([0.5, float(exact.T_APEX) / 2.0])
    mec_radius_sq = float((1 + exact.T_APEX * exact.T_APEX) / 4)
    area_floor = 1e-7
    metric_floor = 1e-7
    margins: dict[str, list[float]] = {
        "strict_hull": [],
        "pairwise": [],
        "mec": [],
        "radius_split": [abs(parameters[0] - parameters[1]) - 1e-3],
        "physical_exact_exclusions": [],
        "reverse_exact_exclusions": [],
        "first_rows_exact_gate": [],
        "reverse_nonreturn": [],
    }
    for index, first in enumerate(WORD):
        second = WORD[(index + 1) % len(WORD)]
        for name in WORD:
            if name not in (first, second):
                margins["strict_hull"].append(
                    cross(points[first], points[second], points[name]) - area_floor
                )
    for i, first in enumerate(WORD):
        for second in WORD[:i]:
            margins["pairwise"].append(
                sqdist(points[first], points[second]) - metric_floor
            )
    for name in WORD:
        margins["mec"].append(
            mec_radius_sq - sqdist(mec_center, points[name]) + 1e-10
        )

    physical_support = {"left", "q0", "q1", "q2", "right"}
    for name in WORD:
        if name not in physical_support and name != "o":
            margins["physical_exact_exclusions"].append(
                abs(sqdist(points["o"], points[name]) - 1.0) - metric_floor
            )

    row_pairs = (("b0", ("q0", "q1", "x00", "x01")),
                 ("b1", ("q1", "q2", "x10", "x11")),
                 ("b2", ("q2", "q0", "x20", "x21")))
    for center_name, support_names in row_pairs:
        radius_sq = sqdist(points[center_name], points[support_names[0]])
        support = set(support_names)
        for name in WORD:
            if name not in support and name != center_name:
                margins["reverse_exact_exclusions"].append(
                    abs(sqdist(points[center_name], points[name]) - radius_sq)
                    - metric_floor
                )

    for radius, support in ((parameters[0], T0), (parameters[1], T1)):
        radius_sq = float(radius * radius)
        for name in support:
            margins["first_rows_exact_gate"].append(
                1e-9 - abs(sqdist(right, points[name]) - radius_sq)
            )

    for first, second in (("x00", "x01"), ("x10", "x11"), ("x20", "x21")):
        margins["reverse_nonreturn"].append(
            abs(sqdist(right, points[first]) - sqdist(right, points[second]))
            - metric_floor
        )
    return margins


def score(parameters: np.ndarray) -> float:
    margins = all_margins(parameters)
    # Exact-equality and named-exclusion groups are audit gates.  The search
    # objective is the geometric open surface plus radius separation.
    groups = ("strict_hull", "pairwise", "mec", "radius_split")
    return min(value for group in groups for value in margins[group])


def objective(parameters: np.ndarray) -> float:
    return -score(parameters)


def initial() -> np.ndarray:
    # Two radii in the common range of the strict-first and physical cap
    # chains.  Each angle cluster lies just beyond the corresponding radial
    # crossing of the old hull.
    return np.array([
        math.sqrt(1.30), math.sqrt(1.90),
        -1.112, -1.100,
        -0.820, -0.812,
        -0.760, -0.748,
        -0.690, -0.675,
    ])


def bounds() -> list[tuple[float, float]]:
    return [
        (1.05, 1.28), (1.30, 1.405),
        (-1.16, -1.02), (-1.15, -1.00),
        (-0.84, -0.79), (-0.835, -0.785),
        (-0.78, -0.70), (-0.775, -0.69),
        (-0.74, -0.62), (-0.73, -0.60),
    ]


def render(parameters: np.ndarray) -> dict[str, object]:
    points = construct(parameters)
    margins = all_margins(parameters)
    minima = {name: min(values) for name, values in margins.items()}
    passed = score(parameters) > 0 and all(value > 0 for value in minima.values())
    return {
        "status": "NUMERIC_SAT_CANDIDATE" if passed else "UNKNOWN_NO_HIT",
        "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_EXACT",
        "cell": "unequal-radius-disjoint-T0=2I+2O-T1=2I+2O-frontier=II",
        "cap_profile": {
            "physical_oppCap2": ["left", "q0", "b0", "b2", "q1", "b1", "q2", "right"],
            "first_oppCap1": ["o", "x20", "x00", "x01", "x21", "left"],
            "surplusCap": ["right", "zR", "x10", "x11", "zO", "o"],
        },
        "boundary": list(WORD),
        "parameters": parameters.tolist(),
        "points": {name: points[name].tolist() for name in WORD},
        "minimum_search_margin": score(parameters),
        "minimum_by_group": minima,
        "retained_frontier_pair": ["t0i0", "t0i1"],
        "T0": list(T0),
        "T1": list(T1),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--maxiter", type=int, default=1500)
    parser.add_argument("--popsize", type=int, default=48)
    parser.add_argument("--seed", type=int, default=20260718)
    args = parser.parse_args()
    seed = initial()
    starts = [seed]
    result = differential_evolution(
        objective,
        bounds(),
        x0=seed,
        seed=args.seed,
        maxiter=args.maxiter,
        popsize=args.popsize,
        workers=1,
        polish=False,
        tol=1e-11,
        atol=1e-13,
    )
    starts.append(result.x)
    for start in tuple(starts):
        polished = minimize(
            objective,
            start,
            method="Powell",
            bounds=bounds(),
            options={"maxiter": 30_000, "xtol": 1e-13, "ftol": 1e-15},
        )
        starts.append(polished.x)
    best = max(starts, key=score)
    payload = render(best)
    payload.update({
        "maxiter": args.maxiter,
        "popsize": args.popsize,
        "random_seed": args.seed,
        "search_bounds": bounds(),
    })
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

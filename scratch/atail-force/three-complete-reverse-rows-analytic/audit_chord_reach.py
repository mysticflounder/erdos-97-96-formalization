#!/usr/bin/env python3
"""Search the seven-parameter period-three core for simultaneous chord reach.

This is a diagnostic, not a proof.  Each complete 2+2 row needs its blocker
circle to cross the physical endpoint chord.  The squared reach margin is

    row_radius^2 - signed_distance(blocker, endpoint_chord)^2.

The search asks whether all three margins can be positive while the exact
source/blocker core is strictly convex and contained in the support-triangle
circumdisk.
"""

from __future__ import annotations

import argparse
import json
import math

import numpy as np
from scipy.optimize import differential_evolution, minimize


ORDER = ("o", "left", "q0", "b0", "b2", "q1", "b1", "q2", "right")
PAIRS = ((0, 1), (1, 2), (2, 0))


def unit(theta: float) -> np.ndarray:
    return np.array([math.cos(theta), math.sin(theta)], dtype=float)


def cross(a: np.ndarray, b: np.ndarray, c: np.ndarray) -> float:
    u, v = b - a, c - a
    return float(u[0] * v[1] - u[1] * v[0])


def sqdist(a: np.ndarray, b: np.ndarray) -> float:
    d = a - b
    return float(d @ d)


def construct(parameters: np.ndarray) -> dict[str, np.ndarray]:
    apex, a0, a1, a2, l0, l1, l2 = map(float, parameters)
    sources = [unit(a0), unit(a1), unit(a2)]
    blockers = [
        l0 * (sources[0] + sources[1]),
        l1 * (sources[1] + sources[2]),
        l2 * (sources[2] + sources[0]),
    ]
    return {
        "o": np.zeros(2),
        "left": unit(0.0),
        "q0": sources[0],
        "b0": blockers[0],
        "b2": blockers[2],
        "q1": sources[1],
        "b1": blockers[1],
        "q2": sources[2],
        "right": unit(apex),
    }


def groups(
    parameters: np.ndarray,
    escape_pattern: str | None = None,
) -> dict[str, list[float]]:
    apex, a0, a1, a2 = map(float, parameters[:4])
    points = construct(parameters)
    right = points["right"]
    mec_center = np.array([0.5, (1.0 - right[0]) / (2.0 * right[1])])
    mec_radius_sq = sqdist(mec_center, points["o"])
    chord_normal = unit(apex / 2.0)
    chord_level = math.cos(apex / 2.0)

    result: dict[str, list[float]] = {
        "angle_order": [
            a0,
            a1 - a0,
            a2 - a1,
            apex - a2,
            math.pi / 2.0 - apex,
        ],
        "strict_core_hull": [],
        "physical_side": [],
        "mec_containment": [],
        "row_chord_reach_sq": [],
    }
    if escape_pattern is not None:
        result["row_triangle_edge_escape_sq"] = []
    for i, first in enumerate(ORDER):
        second = ORDER[(i + 1) % len(ORDER)]
        for name in ORDER:
            if name not in (first, second):
                result["strict_core_hull"].append(
                    cross(points[first], points[second], points[name])
                )
    for name in ("q0", "b0", "b2", "q1", "b1", "q2"):
        result["physical_side"].append(
            float(chord_normal @ points[name]) - chord_level
        )
        result["mec_containment"].append(
            mec_radius_sq - sqdist(mec_center, points[name])
        )
    for row, (i, _) in enumerate(PAIRS):
        blocker = points[f"b{row}"]
        radius_sq = sqdist(blocker, points[f"q{i}"])
        height = float(chord_normal @ blocker) - chord_level
        result["row_chord_reach_sq"].append(radius_sq - height * height)
        if escape_pattern is not None:
            # `L` is the support-triangle edge from `o` to `left`; `R` is
            # the edge from `o` to `right`.  A target that is a convex-hull
            # vertex on the complementary chain must cross at least one of
            # these two edge lines, rather than merely entering the triangle.
            if escape_pattern[row] == "L":
                edge_distance_sq = blocker[1] * blocker[1]
            else:
                edge_normal = np.array([-right[1], right[0]])
                signed = float(edge_normal @ blocker)
                edge_distance_sq = signed * signed
            result["row_triangle_edge_escape_sq"].append(
                radius_sq - edge_distance_sq
            )
    return result


def objective(parameters: np.ndarray, escape_pattern: str | None = None) -> float:
    return -min(
        value
        for values in groups(parameters, escape_pattern).values()
        for value in values
    )


def mec_boundary_intersections(
    parameters: np.ndarray,
) -> dict[str, list[list[float]]]:
    points = construct(parameters)
    apex = float(parameters[0])
    right = points["right"]
    mec_center = np.array([0.5, (1.0 - right[0]) / (2.0 * right[1])])
    mec_radius = math.sqrt(sqdist(mec_center, points["o"]))
    result: dict[str, list[list[float]]] = {}
    for row, (source, _) in enumerate(PAIRS):
        center = points[f"b{row}"]
        radius = math.sqrt(sqdist(center, points[f"q{source}"]))
        delta = center - mec_center
        distance = float(np.linalg.norm(delta))
        if not abs(mec_radius - radius) <= distance <= mec_radius + radius:
            continue
        direction = delta / distance
        along = (
            mec_radius * mec_radius - radius * radius + distance * distance
        ) / (2.0 * distance)
        half_chord = math.sqrt(max(0.0, mec_radius * mec_radius - along * along))
        foot = mec_center + along * direction
        perpendicular = np.array([-direction[1], direction[0]])
        result[f"row{row}"] = [
            (foot + half_chord * perpendicular).tolist(),
            (foot - half_chord * perpendicular).tolist(),
        ]
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--maxiter", type=int, default=500)
    parser.add_argument("--popsize", type=int, default=32)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--seed", type=int, default=20260718)
    parser.add_argument(
        "--escape-pattern",
        choices=("LLL", "LLR", "LRL", "LRR", "RLL", "RLR", "RRL", "RRR"),
        help="Require row i's circle to cross the chosen o-left/o-right edge.",
    )
    args = parser.parse_args()
    bounds = [
        (0.35, math.pi / 2.0 - 1e-5),
        (1e-4, 1.45),
        (2e-4, 1.50),
        (3e-4, 1.55),
        (0.01, 1.5),
        (0.01, 1.5),
        (0.01, 1.5),
    ]
    result = differential_evolution(
        lambda x: objective(x, args.escape_pattern),
        bounds,
        seed=args.seed,
        maxiter=args.maxiter,
        popsize=args.popsize,
        workers=args.workers,
        updating="deferred" if args.workers != 1 else "immediate",
        polish=False,
        tol=1e-10,
    )
    polished = minimize(
        lambda x: objective(x, args.escape_pattern),
        result.x,
        method="Powell",
        bounds=bounds,
        options={"maxiter": 20_000, "xtol": 1e-12, "ftol": 1e-14},
    )
    best = (
        polished.x
        if objective(polished.x, args.escape_pattern)
          < objective(result.x, args.escape_pattern)
        else result.x
    )
    ledger = groups(best, args.escape_pattern)
    print(json.dumps({
        "status": (
            "NUMERIC_CORE_CHORD_REACH_HIT"
            if objective(best, args.escape_pattern) < 0
            else "NO_HIT"
        ),
        "escape_pattern": args.escape_pattern,
        "minimum_margin": -objective(best, args.escape_pattern),
        "parameters": best.tolist(),
        "minimum_by_group": {name: min(values) for name, values in ledger.items()},
        "row_chord_reach_sq": ledger["row_chord_reach_sq"],
        "mec_boundary_intersections": mec_boundary_intersections(best),
        "points": {name: point.tolist() for name, point in construct(best).items()},
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

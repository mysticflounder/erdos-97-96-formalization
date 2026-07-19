#!/usr/bin/env python3
"""Bounded exact-equality search for the four-target star overlap schema.

One outside target ``z`` belongs to all three blocker rows.  For each source
pair, its blocker is computed as the intersection of the source-pair bisector
with the bisector of ``(source,z)``.  The three shared-target row equalities
therefore hold by construction.  One additional target per row is then placed
on that exact blocker circle.  No-hit is bounded UNKNOWN, never UNSAT.
"""

from __future__ import annotations

import argparse
from functools import partial
import json
import math
import os
import sys

import numpy as np
from scipy.optimize import differential_evolution, minimize

sys.path.insert(0, os.path.dirname(__file__))
import search_three_target_cycle as common  # noqa: E402


Point = np.ndarray
ROW_PAIRS = ((0, 1), (1, 2), (2, 0))


def rotate(point: Point, theta: float) -> Point:
    cosine, sine = math.cos(theta), math.sin(theta)
    return np.array(
        [cosine * point[0] - sine * point[1], sine * point[0] + cosine * point[1]],
        dtype=float,
    )


def blocker_through_shared_target(first: Point, second: Point, target: Point) -> Point:
    direction = first + second
    denominator = 2 * float(direction @ (target - first))
    if abs(denominator) < 1e-15:
        return np.array([1e6, 1e6])
    multiplier = (float(target @ target) - 1.0) / denominator
    return multiplier * direction


def construct(parameters: np.ndarray) -> tuple[dict[str, Point], list[float]]:
    apex, a0, a1, a2, zx, zy, phi0, phi1, phi2 = map(float, parameters)
    sources = [common.unit(a0), common.unit(a1), common.unit(a2)]
    z = np.array([zx, zy])
    blockers = [
        blocker_through_shared_target(sources[i], sources[j], z)
        for i, j in ROW_PAIRS
    ]
    points = {
        "o": np.zeros(2),
        "left": common.unit(0.0),
        "q0": sources[0],
        "c0": blockers[0],
        "c2": blockers[2],
        "q1": sources[1],
        "c1": blockers[1],
        "q2": sources[2],
        "right": common.unit(apex),
        "z": z,
    }
    for row, phi in enumerate((phi0, phi1, phi2)):
        source = sources[ROW_PAIRS[row][0]]
        points[f"u{row}"] = blockers[row] + rotate(source - blockers[row], phi)
    multipliers = [
        float(blockers[row] @ (sources[i] + sources[j]))
        / float((sources[i] + sources[j]) @ (sources[i] + sources[j]))
        for row, (i, j) in enumerate(ROW_PAIRS)
    ]
    return points, multipliers


def evaluate(parameters: np.ndarray) -> common.Result:
    points, multipliers = construct(parameters)
    order = common.cyclic_order(points)
    apex, a0, a1, a2 = map(float, parameters[:4])
    left, right, o = points["left"], points["right"], points["o"]
    mec_center = np.array([0.5, (1 - right[0]) / (2 * right[1])])
    mec_radius_sq = common.sqdist(mec_center, o)
    target_names = ("z", "u0", "u1", "u2")
    cap_names = ("q0", "c0", "c2", "q1", "c1", "q2")
    area_floor, metric_floor = 1e-7, 1e-7
    search_groups = {
        "source_order": [
            a0 - 1e-4,
            a1 - a0 - 1e-4,
            a2 - a1 - 1e-4,
            apex - a2 - 1e-4,
            math.pi / 2 - apex - 1e-4,
        ],
        "blocker_multiplier_box": [
            multiplier - 0.44 for multiplier in multipliers
        ] + [0.64 - multiplier for multiplier in multipliers],
        "strict_hull": [
            value - area_floor for value in common.hull_margins(points, order)
        ],
        "outside_cap_side": [
            common.cross(left, right, points[name]) - area_floor
            for name in ("o", *target_names)
        ],
        "physical_cap_side": [
            -common.cross(left, right, points[name]) - area_floor for name in cap_names
        ],
        "mec_containment": [
            mec_radius_sq - common.sqdist(mec_center, point) + 1e-10
            for name, point in points.items()
            if name not in ("o", "left", "right")
        ],
    }
    names = tuple(points)
    search_groups["pairwise_distinct"] = [
        common.sqdist(points[names[i]], points[names[j]]) - metric_floor
        for i in range(len(names)) for j in range(i)
    ]

    physical_support = {"left", "q0", "q1", "q2", "right"}
    physical_exclusions = [
        abs(common.sqdist(o, point) - 1) - metric_floor
        for name, point in points.items()
        if name not in physical_support and name != "o"
    ]
    supports = (
        {"q0", "q1", "z", "u0"},
        {"q1", "q2", "z", "u1"},
        {"q2", "q0", "z", "u2"},
    )
    row_exclusions: list[float] = []
    equality_errors: list[float] = []
    for row, support in enumerate(supports):
        center = points[f"c{row}"]
        radius_sq = common.sqdist(center, points[f"q{ROW_PAIRS[row][0]}"])
        for name, point in points.items():
            if name in support:
                equality_errors.append(abs(common.sqdist(center, point) - radius_sq))
            elif name != f"c{row}":
                row_exclusions.append(
                    abs(common.sqdist(center, point) - radius_sq) - metric_floor
                )
    audit_groups = {
        "physical_exact_class": physical_exclusions,
        "row_exact_class_exclusions": row_exclusions,
        "parameterized_equality_gate": [1e-9 - max(equality_errors)],
    }
    return common.Result(
        np.array(parameters), points, order, search_groups, audit_groups
    )


def objective(parameters: np.ndarray) -> float:
    return evaluate(parameters).penalty


def limits() -> list[tuple[float, float]]:
    return [
        (1.40, math.pi / 2 - 2e-4),
        (0.01, 0.18),
        (0.55, 1.18),
        (1.22, 1.35),
        (0.02, 0.98),
        (-0.35, 0.85),
        (-math.pi, math.pi),
        (-math.pi, math.pi),
        (-math.pi, math.pi),
    ]


def run(maxiter: int, popsize: int, workers: int, seed: int) -> common.Result:
    bounds = limits()
    initial = np.array([
        2 * math.atan(163 / 192),
        2 * math.atan(4 / 231),
        2 * math.atan(123 / 184),
        2 * math.atan(3 / 4),
        0.65,
        -0.05,
        -0.6,
        -1.0,
        2.3,
    ])
    result = differential_evolution(
        objective,
        bounds,
        x0=initial,
        maxiter=maxiter,
        popsize=popsize,
        seed=seed,
        polish=False,
        updating="deferred" if workers != 1 else "immediate",
        workers=workers,
        tol=1e-10,
        atol=1e-12,
    )
    polished = minimize(
        objective,
        result.x,
        method="Powell",
        bounds=bounds,
        options={"maxiter": 10_000, "xtol": 1e-12, "ftol": 1e-14},
    )
    best = polished.x if objective(polished.x) < objective(result.x) else result.x
    return evaluate(best)


def self_test() -> None:
    sample = np.array([1.45, 0.08, 0.85, 1.28, 0.6, -0.1, -0.5, -1.0, 2.2])
    points, _ = construct(sample)
    for row, (i, j) in enumerate(ROW_PAIRS):
        center = points[f"c{row}"]
        values = [
            common.sqdist(center, points[f"q{i}"]),
            common.sqdist(center, points[f"q{j}"]),
            common.sqdist(center, points["z"]),
            common.sqdist(center, points[f"u{row}"]),
        ]
        assert max(values) - min(values) < 1e-10


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--maxiter", type=int, default=500)
    parser.add_argument("--popsize", type=int, default=24)
    parser.add_argument("--workers", type=int, default=12)
    parser.add_argument("--seed", type=int, default=20260717)
    args = parser.parse_args()
    self_test()
    result = run(args.maxiter, args.popsize, args.workers, args.seed)
    audit_minimum = min(
        value for values in result.audit_groups.values() for value in values
    )
    status = (
        "NUMERIC_SAT_CANDIDATE"
        if result.minimum_margin > 0 and audit_minimum > 0
        else "UNKNOWN_NO_HIT"
    )
    print(json.dumps({
        "schema": "four-target-star-overlap-v1",
        "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_COVERAGE",
        "search": {
            "maxiter": args.maxiter,
            "popsize": args.popsize,
            "workers": args.workers,
            "seed": args.seed,
            "box": limits(),
        },
        "result": {
            "status": status,
            "minimum_margin": result.minimum_margin,
            "audit_minimum": audit_minimum,
            "cyclic_order": list(result.order),
            "parameters": result.parameters.tolist(),
            "points": {name: point.tolist() for name, point in result.points.items()},
            "minimum_by_group": {
                **{name: min(values) for name, values in result.search_groups.items()},
                **{name: min(values) for name, values in result.audit_groups.items()},
            },
        },
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

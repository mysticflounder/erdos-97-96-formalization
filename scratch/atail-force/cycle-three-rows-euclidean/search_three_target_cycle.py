#!/usr/bin/env python3
"""Bounded SAT search for the three-target overlap schema.

Each adjacent pair of blocker circles already shares its common cap source.
Its only possible second intersection is obtained by reflecting that source
across the line through the two blocker centers.  Consequently all six row
equalities in the three-target schema are imposed by the seven-parameter core;
there are no free target coordinates and no approximate equality penalties.

This is a bounded witness search, not a decision procedure.  A no-hit result is
``UNKNOWN_NO_HIT``, never UNSAT.
"""

from __future__ import annotations

import argparse
from functools import partial
import json
import math
from dataclasses import dataclass

import numpy as np
from scipy.optimize import differential_evolution, minimize


Point = np.ndarray
ROW_PAIRS = ((0, 1), (1, 2), (2, 0))


def unit(theta: float) -> Point:
    return np.array([math.cos(theta), math.sin(theta)], dtype=float)


def cross(a: Point, b: Point, c: Point) -> float:
    u, v = b - a, c - a
    return float(u[0] * v[1] - u[1] * v[0])


def sqdist(a: Point, b: Point) -> float:
    delta = a - b
    return float(delta @ delta)


def reflect_across_center_line(point: Point, first: Point, second: Point) -> Point:
    direction = second - first
    denominator = float(direction @ direction)
    if denominator < 1e-20:
        return np.array([1e6, 1e6])
    projection = first + direction * float((point - first) @ direction) / denominator
    return 2 * projection - point


def construct(parameters: np.ndarray) -> dict[str, Point]:
    apex, a0, a1, a2, l0, l1, l2 = map(float, parameters)
    sources = [unit(a0), unit(a1), unit(a2)]
    blockers = [
        l0 * (sources[0] + sources[1]),
        l1 * (sources[1] + sources[2]),
        l2 * (sources[2] + sources[0]),
    ]
    # z01 is shared by row 0 and row 1, etc.  The reflected common source is
    # the other intersection of the two exact source-radius circles.
    z01 = reflect_across_center_line(sources[1], blockers[0], blockers[1])
    z12 = reflect_across_center_line(sources[2], blockers[1], blockers[2])
    z20 = reflect_across_center_line(sources[0], blockers[2], blockers[0])
    return {
        "o": np.zeros(2),
        "left": unit(0.0),
        "q0": sources[0],
        "c0": blockers[0],
        "c2": blockers[2],
        "q1": sources[1],
        "c1": blockers[1],
        "q2": sources[2],
        "right": unit(apex),
        "z01": z01,
        "z12": z12,
        "z20": z20,
    }


def cyclic_order(points: dict[str, Point]) -> tuple[str, ...]:
    centroid = sum(points.values()) / len(points)
    return tuple(
        sorted(
            points,
            key=lambda name: math.atan2(
                points[name][1] - centroid[1], points[name][0] - centroid[0]
            ),
        )
    )


def hull_margins(points: dict[str, Point], order: tuple[str, ...]) -> list[float]:
    result: list[float] = []
    for index, first_name in enumerate(order):
        second_name = order[(index + 1) % len(order)]
        for name, point in points.items():
            if name not in (first_name, second_name):
                result.append(cross(points[first_name], points[second_name], point))
    return result


@dataclass
class Result:
    parameters: np.ndarray
    points: dict[str, Point]
    order: tuple[str, ...]
    search_groups: dict[str, list[float]]
    audit_groups: dict[str, list[float]]

    @property
    def minimum_margin(self) -> float:
        return min(value for values in self.search_groups.values() for value in values)

    @property
    def penalty(self) -> float:
        return -self.minimum_margin


def evaluate(parameters: np.ndarray) -> Result:
    points = construct(parameters)
    order = cyclic_order(points)
    apex, a0, a1, a2 = map(float, parameters[:4])
    left, right, o = points["left"], points["right"], points["o"]
    center = np.array([0.5, (1 - right[0]) / (2 * right[1])])
    radius_sq = sqdist(center, o)
    target_names = ("z01", "z12", "z20")
    cap_names = ("q0", "c0", "c2", "q1", "c1", "q2")
    area_floor, metric_floor = 1e-7, 1e-7
    search = {
        "source_order": [
            a0 - 1e-4,
            a1 - a0 - 1e-4,
            a2 - a1 - 1e-4,
            apex - a2 - 1e-4,
            math.pi / 2 - apex - 1e-4,
        ],
        "strict_hull": [value - area_floor for value in hull_margins(points, order)],
        "outside_cap_side": [
            cross(left, right, points[name]) - area_floor
            for name in ("o", *target_names)
        ],
        "physical_cap_side": [
            -cross(left, right, points[name]) - area_floor for name in cap_names
        ],
        "mec_containment": [
            radius_sq - sqdist(center, point) + 1e-10
            for name, point in points.items()
            if name not in ("o", "left", "right")
        ],
    }
    names = tuple(points)
    pairwise = [
        sqdist(points[names[i]], points[names[j]]) - metric_floor
        for i in range(len(names)) for j in range(i)
    ]
    search["pairwise_distinct"] = pairwise
    physical_support = {"left", "q0", "q1", "q2", "right"}
    physical_exclusions = [
        abs(sqdist(o, point) - 1) - metric_floor
        for name, point in points.items()
        if name not in physical_support and name != "o"
    ]
    row_supports = (
        {"q0", "q1", "z01", "z20"},
        {"q1", "q2", "z01", "z12"},
        {"q2", "q0", "z12", "z20"},
    )
    row_exclusions: list[float] = []
    equality_errors: list[float] = []
    for row, support in enumerate(row_supports):
        row_center = points[f"c{row}"]
        row_radius_sq = sqdist(row_center, points[f"q{ROW_PAIRS[row][0]}"])
        for name, point in points.items():
            if name in support:
                equality_errors.append(abs(sqdist(row_center, point) - row_radius_sq))
            elif name != f"c{row}":
                row_exclusions.append(
                    abs(sqdist(row_center, point) - row_radius_sq) - metric_floor
                )
    audit = {
        "physical_exact_class": physical_exclusions,
        "row_exact_class_exclusions": row_exclusions,
        "parameterized_equality_gate": [1e-9 - max(equality_errors)],
    }
    return Result(np.array(parameters), points, order, search, audit)


def objective(parameters: np.ndarray) -> float:
    return evaluate(parameters).penalty


def search(maxiter: int, popsize: int, workers: int, seed: int) -> Result:
    limits = [
        (1.40, math.pi / 2 - 2e-4),
        (0.01, 0.18),
        (0.55, 1.18),
        (1.22, 1.35),
        (0.44, 0.64),
        (0.44, 0.64),
        (0.44, 0.64),
    ]
    exact_seed = np.array([
        2 * math.atan(163 / 192),
        2 * math.atan(4 / 231),
        2 * math.atan(123 / 184),
        2 * math.atan(3 / 4),
        45 / 86,
        251 / 500,
        271 / 500,
    ])
    result = differential_evolution(
        objective,
        limits,
        x0=exact_seed,
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
        bounds=limits,
        options={"maxiter": 10_000, "xtol": 1e-12, "ftol": 1e-14},
    )
    best = polished.x if objective(polished.x) < objective(result.x) else result.x
    return evaluate(best)


def self_test() -> None:
    points = construct(np.array([1.45, 0.08, 0.85, 1.28, 0.52, 0.53, 0.54]))
    # Every reflected target is equidistant from both adjacent centers by
    # exact floating-point construction up to roundoff.
    for target, first_row, second_row, common_source in (
        ("z01", 0, 1, "q1"),
        ("z12", 1, 2, "q2"),
        ("z20", 2, 0, "q0"),
    ):
        for row in (first_row, second_row):
            assert abs(
                sqdist(points[f"c{row}"], points[target])
                - sqdist(points[f"c{row}"], points[common_source])
            ) < 1e-12


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--maxiter", type=int, default=500)
    parser.add_argument("--popsize", type=int, default=24)
    parser.add_argument("--workers", type=int, default=12)
    parser.add_argument("--seed", type=int, default=20260717)
    args = parser.parse_args()
    self_test()
    result = search(args.maxiter, args.popsize, args.workers, args.seed)
    audit_minimum = min(
        value for values in result.audit_groups.values() for value in values
    )
    status = (
        "NUMERIC_SAT_CANDIDATE"
        if result.minimum_margin > 0 and audit_minimum > 0
        else "UNKNOWN_NO_HIT"
    )
    print(json.dumps({
        "schema": "period3-three-target-overlap-cycle-v1",
        "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_COVERAGE",
        "search": {
            "maxiter": args.maxiter,
            "popsize": args.popsize,
            "workers": args.workers,
            "seed": args.seed,
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

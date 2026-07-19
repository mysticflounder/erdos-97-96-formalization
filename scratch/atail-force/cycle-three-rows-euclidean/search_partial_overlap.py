#!/usr/bin/env python3
"""Bounded Euclidean SAT search for four- and five-target overlap schemas.

Every shared target is the forced second intersection of its two blocker
circles.  Every unshared target is parameterized on its own blocker circle.
Thus all named row equalities hold by construction.  A no-hit verdict is only
``UNKNOWN_NO_HIT`` inside the stated parameter box and budget.
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


def base_core(parameters: np.ndarray) -> tuple[dict[str, Point], list[Point], list[Point]]:
    apex, a0, a1, a2, l0, l1, l2 = map(float, parameters[:7])
    sources = [common.unit(a0), common.unit(a1), common.unit(a2)]
    blockers = [
        l0 * (sources[0] + sources[1]),
        l1 * (sources[1] + sources[2]),
        l2 * (sources[2] + sources[0]),
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
    }
    return points, sources, blockers


def common_source(first_row: int, second_row: int) -> int:
    common_indices = set(ROW_PAIRS[first_row]) & set(ROW_PAIRS[second_row])
    assert len(common_indices) == 1
    return next(iter(common_indices))


def shared_target(
    first_row: int,
    second_row: int,
    sources: list[Point],
    blockers: list[Point],
) -> Point:
    source = sources[common_source(first_row, second_row)]
    return common.reflect_across_center_line(
        source, blockers[first_row], blockers[second_row]
    )


def unique_target(row: int, angle: float, sources: list[Point], blockers: list[Point]) -> Point:
    source = sources[ROW_PAIRS[row][0]]
    return blockers[row] + rotate(source - blockers[row], angle)


def construct(
    parameters: np.ndarray, schema: str, pivot: int
) -> tuple[dict[str, Point], tuple[set[str], set[str], set[str]]]:
    points, sources, blockers = base_core(parameters)
    angles = list(map(float, parameters[7:]))
    supports = [set((f"q{i}", f"q{j}")) for i, j in ROW_PAIRS]

    if schema == "four-path":
        # The pivot row is the middle edge of a path on four target vertices.
        outer_rows = [row for row in range(3) if row != pivot]
        first, second = outer_rows
        for row, name in ((first, "s0"), (second, "s1")):
            points[name] = shared_target(row, pivot, sources, blockers)
            supports[row].add(name)
            supports[pivot].add(name)
        for angle, row, name in ((angles[0], first, "u0"), (angles[1], second, "u1")):
            points[name] = unique_target(row, angle, sources, blockers)
            supports[row].add(name)
    elif schema == "five-one-overlap":
        # Pivot names the row not participating in the single shared target.
        shared_rows = [row for row in range(3) if row != pivot]
        first, second = shared_rows
        points["s0"] = shared_target(first, second, sources, blockers)
        supports[first].add("s0")
        supports[second].add("s0")
        specifications = (
            (angles[0], first, "u0"),
            (angles[1], second, "u1"),
            (angles[2], pivot, "u2"),
            (angles[3], pivot, "u3"),
        )
        for angle, row, name in specifications:
            points[name] = unique_target(row, angle, sources, blockers)
            supports[row].add(name)
    else:
        raise ValueError(schema)
    assert all(len(support) == 4 for support in supports)
    return points, (supports[0], supports[1], supports[2])


def evaluate(parameters: np.ndarray, schema: str, pivot: int) -> common.Result:
    points, supports = construct(parameters, schema, pivot)
    order = common.cyclic_order(points)
    apex, a0, a1, a2 = map(float, parameters[:4])
    left, right, o = points["left"], points["right"], points["o"]
    mec_center = np.array([0.5, (1 - right[0]) / (2 * right[1])])
    mec_radius_sq = common.sqdist(mec_center, o)
    target_names = tuple(name for name in points if name[0] in ("s", "u"))
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
    pairwise = [
        common.sqdist(points[names[i]], points[names[j]]) - metric_floor
        for i in range(len(names)) for j in range(i)
    ]
    search_groups["pairwise_distinct"] = pairwise
    physical_support = {"left", "q0", "q1", "q2", "right"}
    physical_exclusions = [
        abs(common.sqdist(o, point) - 1) - metric_floor
        for name, point in points.items()
        if name not in physical_support and name != "o"
    ]
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


def objective(parameters: np.ndarray, schema: str, pivot: int) -> float:
    return evaluate(parameters, schema, pivot).penalty


def limits(schema: str) -> list[tuple[float, float]]:
    core = [
        (1.40, math.pi / 2 - 2e-4),
        (0.01, 0.18),
        (0.55, 1.18),
        (1.22, 1.35),
        (0.44, 0.64),
        (0.44, 0.64),
        (0.44, 0.64),
    ]
    count = 2 if schema == "four-path" else 4
    return [*core, *((-math.pi, math.pi) for _ in range(count))]


def seed_parameters(schema: str) -> np.ndarray:
    core = [
        2 * math.atan(163 / 192),
        2 * math.atan(4 / 231),
        2 * math.atan(123 / 184),
        2 * math.atan(3 / 4),
        45 / 86,
        251 / 500,
        271 / 500,
    ]
    angles = [-0.6, 2.3] if schema == "four-path" else [-0.6, -1.0, 2.0, 2.5]
    return np.array([*core, *angles])


def run(schema: str, pivot: int, maxiter: int, popsize: int, workers: int, seed: int) -> common.Result:
    bounds = limits(schema)
    function = partial(objective, schema=schema, pivot=pivot)
    result = differential_evolution(
        function,
        bounds,
        x0=seed_parameters(schema),
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
        function,
        result.x,
        method="Powell",
        bounds=bounds,
        options={"maxiter": 10_000, "xtol": 1e-12, "ftol": 1e-14},
    )
    best = polished.x if function(polished.x) < function(result.x) else result.x
    return evaluate(best, schema, pivot)


def self_test() -> None:
    for schema in ("four-path", "five-one-overlap"):
        for pivot in range(3):
            _, supports = construct(seed_parameters(schema), schema, pivot)
            assert all(len(support) == 4 for support in supports)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--schema", choices=("four-path", "five-one-overlap"), required=True)
    parser.add_argument("--pivot", type=int, choices=range(3), required=True)
    parser.add_argument("--maxiter", type=int, default=400)
    parser.add_argument("--popsize", type=int, default=24)
    parser.add_argument("--workers", type=int, default=12)
    parser.add_argument("--seed", type=int, default=20260717)
    args = parser.parse_args()
    self_test()
    result = run(
        args.schema, args.pivot, args.maxiter, args.popsize, args.workers, args.seed
    )
    audit_minimum = min(
        value for values in result.audit_groups.values() for value in values
    )
    status = (
        "NUMERIC_SAT_CANDIDATE"
        if result.minimum_margin > 0 and audit_minimum > 0
        else "UNKNOWN_NO_HIT"
    )
    print(json.dumps({
        "schema": args.schema,
        "pivot": args.pivot,
        "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_COVERAGE",
        "search": {
            "maxiter": args.maxiter,
            "popsize": args.popsize,
            "workers": args.workers,
            "seed": args.seed,
            "box": limits(args.schema),
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

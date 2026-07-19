#!/usr/bin/env python3
"""Bounded SAT search for the complete period-three all-reverse local cycle.

The equal-radius equations are imposed by parameterization.  This program is
only a witness search: ``UNKNOWN_NO_HIT`` means that the bounded search found
no candidate, never that the semialgebraic system is infeasible.
"""

from __future__ import annotations

import argparse
from functools import partial
import json
import math
from dataclasses import dataclass
from typing import Iterable

import numpy as np
from scipy.optimize import differential_evolution, minimize


Point = np.ndarray
ROW_PAIRS = ((0, 1), (1, 2), (2, 0))
CORE_NAMES = ("o", "left", "q0", "c0", "c2", "q1", "c1", "q2", "right")


def unit(theta: float) -> Point:
    return np.array([math.cos(theta), math.sin(theta)], dtype=float)


def rotate(point: Point, theta: float) -> Point:
    cosine, sine = math.cos(theta), math.sin(theta)
    return np.array(
        [cosine * point[0] - sine * point[1], sine * point[0] + cosine * point[1]],
        dtype=float,
    )


def cross(a: Point, b: Point, c: Point) -> float:
    u, v = b - a, c - a
    return float(u[0] * v[1] - u[1] * v[0])


def sqdist(a: Point, b: Point) -> float:
    delta = a - b
    return float(delta @ delta)


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


def strict_hull_margins(
    points: dict[str, Point], order: tuple[str, ...]
) -> list[float]:
    result: list[float] = []
    for index, first_name in enumerate(order):
        second_name = order[(index + 1) % len(order)]
        first, second = points[first_name], points[second_name]
        for name, point in points.items():
            if name not in (first_name, second_name):
                result.append(cross(first, second, point))
    return result


@dataclass
class Candidate:
    parameters: np.ndarray
    points: dict[str, Point]
    order: tuple[str, ...]
    groups: dict[str, list[float]]

    @property
    def optimization_values(self) -> list[float]:
        return [
            value
            for name, values in self.groups.items()
            if not name.endswith("_audit")
            for value in values
        ]

    @property
    def minimum_margin(self) -> float:
        return min(self.optimization_values)

    @property
    def violated_count(self) -> int:
        return sum(value <= 0 for value in self.optimization_values)

    @property
    def penalty(self) -> float:
        # Direct max-min feasibility objective.  Audit-only exact-class gates
        # are excluded, so no tiny roundoff gate can mask a geometric defect.
        return -self.minimum_margin


def construct(parameters: np.ndarray) -> dict[str, Point]:
    (
        apex,
        q0_angle,
        q1_angle,
        q2_angle,
        lambda0,
        lambda1,
        lambda2,
        *target_angles,
    ) = map(float, parameters)
    o = np.zeros(2)
    left, right = unit(0.0), unit(apex)
    sources = [unit(q0_angle), unit(q1_angle), unit(q2_angle)]
    blockers = [
        lambda0 * (sources[0] + sources[1]),
        lambda1 * (sources[1] + sources[2]),
        lambda2 * (sources[2] + sources[0]),
    ]
    points: dict[str, Point] = {
        "o": o,
        "left": left,
        "q0": sources[0],
        "c0": blockers[0],
        "c2": blockers[2],
        "q1": sources[1],
        "c1": blockers[1],
        "q2": sources[2],
        "right": right,
    }
    for row, (source_index, _) in enumerate(ROW_PAIRS):
        radius_vector = sources[source_index] - blockers[row]
        for slot in range(2):
            angle = target_angles[2 * row + slot]
            points[f"x{row}{slot}"] = blockers[row] + rotate(radius_vector, angle)
    return points


def evaluate(
    parameters: np.ndarray,
    fixed_order: tuple[str, ...] | None = None,
    active_targets: tuple[str, ...] = ("x00", "x01", "x10", "x11", "x20", "x21"),
) -> Candidate:
    all_points = construct(parameters)
    points = {
        name: point
        for name, point in all_points.items()
        if not name.startswith("x") or name in active_targets
    }
    order = fixed_order or cyclic_order(points)
    apex, q0_angle, q1_angle, q2_angle = map(float, parameters[:4])

    right = points["right"]
    mec_center = np.array([0.5, (1.0 - right[0]) / (2.0 * right[1])])
    mec_radius_sq = sqdist(mec_center, points["o"])
    cap_chord = (points["left"], points["right"])
    target_names = active_targets
    physical_cap_names = ("q0", "c0", "c2", "q1", "c1", "q2")

    # A small positive scale is built into every strict condition.  It keeps a
    # degenerate boundary point from being reported as a numerical hit.
    area_floor = 1e-7
    metric_floor = 1e-7
    groups: dict[str, list[float]] = {
        "source_angle_order": [
            q0_angle - 1e-4,
            q1_angle - q0_angle - 1e-4,
            q2_angle - q1_angle - 1e-4,
            apex - q2_angle - 1e-4,
            math.pi / 2 - apex - 1e-4,
        ],
        "strict_hull": [
            value - area_floor for value in strict_hull_margins(points, order)
        ],
        "outside_cap_side": [
            cross(cap_chord[0], cap_chord[1], points[name]) - area_floor
            for name in ("o", *target_names)
        ],
        "physical_cap_side": [
            -cross(cap_chord[0], cap_chord[1], points[name]) - area_floor
            for name in physical_cap_names
        ],
        "mec_containment": [
            mec_radius_sq - sqdist(mec_center, point) + 1e-10
            for name, point in points.items()
            if name not in ("o", "left", "right")
        ],
    }

    names = tuple(points)
    groups["pairwise_distinct"] = [
        sqdist(points[names[first]], points[names[second]]) - metric_floor
        for first in range(len(names))
        for second in range(first)
    ]

    physical_support = {"left", "q0", "q1", "q2", "right"}
    groups["physical_exact_class_audit"] = [
        abs(sqdist(points["o"], point) - 1.0) - metric_floor
        for name, point in points.items()
        if name not in physical_support and name != "o"
    ]

    row_exclusions: list[float] = []
    equality_gates: list[float] = []
    for row, (first_source, second_source) in enumerate(ROW_PAIRS):
        center_name = f"c{row}"
        center = points[center_name]
        support = {
            f"q{first_source}",
            f"q{second_source}",
            f"x{row}0",
            f"x{row}1",
        }
        radius_sq = sqdist(center, points[f"q{first_source}"])
        for name, point in points.items():
            if name in support:
                if name.startswith("x") and name in active_targets:
                    equality_gates.append(
                        1e-9 - abs(sqdist(center, point) - radius_sq)
                    )
            elif name != center_name:
                row_exclusions.append(
                    abs(sqdist(center, point) - radius_sq) - metric_floor
                )
    groups["row_exact_class_exclusions_audit"] = row_exclusions
    groups["parameterized_equalities_audit"] = equality_gates or [1e-9]
    return Candidate(np.array(parameters), points, order, groups)


def objective_for(
    parameters: np.ndarray,
    fixed_order: tuple[str, ...] | None,
    active_targets: tuple[str, ...],
) -> float:
    """Pickleable objective for SciPy's multiprocessing map."""
    return evaluate(parameters, fixed_order, active_targets).penalty


def exact_complete_row_seed() -> np.ndarray:
    # Exact rational predecessor core, with the checked c0 row rotations.
    return np.array(
        [
            2 * math.atan(163 / 192),
            2 * math.atan(4 / 231),
            2 * math.atan(123 / 184),
            2 * math.atan(3 / 4),
            45 / 86,
            251 / 500,
            271 / 500,
            2 * math.atan(-47 / 149),
            2 * math.atan(-28 / 95),
            -1.0,
            -0.8,
            -1.0,
            -0.8,
        ],
        dtype=float,
    )


def bounds(profile: str = "focused") -> list[tuple[float, float]]:
    if profile == "focused":
        core = [
            (1.40, math.pi / 2 - 2e-4),
            (0.01, 0.18),
            (0.55, 1.18),
            (1.22, 1.35),
            (0.44, 0.64),
            (0.44, 0.64),
            (0.44, 0.64),
        ]
    elif profile == "broad":
        core = [
            (1.05, math.pi / 2 - 2e-4),
            (0.005, 1.25),
            (0.01, 1.42),
            (0.02, 1.56),
            (0.15, 1.10),
            (0.15, 1.10),
            (0.15, 1.10),
        ]
    else:
        raise ValueError(profile)
    return [*core, *[(-math.pi, math.pi) for _ in range(6)]]


def optimize(
    seed: np.ndarray,
    *,
    random_seed: int,
    maxiter: int,
    popsize: int,
    workers: int,
    fixed_order: tuple[str, ...] | None,
    active_targets: tuple[str, ...],
    box_profile: str,
) -> Candidate:
    limits = bounds(box_profile)

    objective = partial(
        objective_for, fixed_order=fixed_order, active_targets=active_targets
    )

    result = differential_evolution(
        objective,
        limits,
        x0=seed,
        maxiter=maxiter,
        popsize=popsize,
        seed=random_seed,
        polish=False,
        updating="deferred" if workers != 1 else "immediate",
        workers=workers,
        tol=1e-9,
        atol=1e-11,
    )
    polished = minimize(
        objective,
        result.x,
        method="Powell",
        bounds=limits,
        options={"maxiter": 10_000, "xtol": 1e-11, "ftol": 1e-13},
    )
    best = polished.x if objective(polished.x) < objective(result.x) else result.x
    return evaluate(best, fixed_order, active_targets)


def render(candidate: Candidate) -> dict[str, object]:
    audit_minima = {
        name: min(values)
        for name, values in candidate.groups.items()
        if name.endswith("_audit")
    }
    return {
        "status": (
            "NUMERIC_SAT_CANDIDATE"
            if candidate.minimum_margin > 0 and min(audit_minima.values()) > 0
            else "UNKNOWN_NO_HIT"
        ),
        "minimum_margin": candidate.minimum_margin,
        "violated_count": candidate.violated_count,
        "cyclic_order": list(candidate.order),
        "parameters": candidate.parameters.tolist(),
        "points": {name: point.tolist() for name, point in candidate.points.items()},
        "minimum_by_group": {
            name: min(values) for name, values in candidate.groups.items()
        },
    }


def smoke_test() -> None:
    seed = exact_complete_row_seed()
    points = construct(seed)
    predecessor_names = (*CORE_NAMES, "x00", "x01")
    predecessor = {name: points[name] for name in predecessor_names}
    expected_order = ("o", "x00", "x01", "left", "q0", "c0", "c2", "q1", "c1", "q2", "right")
    margins = strict_hull_margins(predecessor, expected_order)
    assert min(margins) > 0, min(margins)
    for name in ("q1", "x00", "x01"):
        assert abs(sqdist(points["c0"], points[name]) - sqdist(points["c0"], points["q0"])) < 1e-12


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--maxiter", type=int, default=500)
    parser.add_argument("--popsize", type=int, default=24)
    parser.add_argument("--workers", type=int, default=12)
    parser.add_argument("--seed", type=int, default=20260717)
    parser.add_argument("--fixed-order", action="store_true")
    parser.add_argument(
        "--stage", choices=("one-per-row", "full"), default="full",
        help="Use one target per row as a staged feasibility search, or all six.",
    )
    parser.add_argument("--box-profile", choices=("focused", "broad"), default="focused")
    args = parser.parse_args()
    smoke_test()

    initial = exact_complete_row_seed()
    active_targets = (
        ("x00", "x10", "x20")
        if args.stage == "one-per-row"
        else ("x00", "x01", "x10", "x11", "x20", "x21")
    )
    fixed_order: tuple[str, ...] | None = None
    if args.fixed_order:
        # One plausible order: all six outside targets lie on the same
        # complementary component.  Dynamic-order mode explores other splits.
        fixed_order = (
            "o", "x00", "x01", "x10", "x11", "x20", "x21",
            "left", "q0", "c0", "c2", "q1", "c1", "q2", "right",
        )
    candidate = optimize(
        initial,
        random_seed=args.seed,
        maxiter=args.maxiter,
        popsize=args.popsize,
        workers=args.workers,
        fixed_order=fixed_order,
        active_targets=active_targets,
        box_profile=args.box_profile,
    )
    payload = {
        "schema": "period3-complete-three-row-euclidean-search-v1",
        "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_COVERAGE",
        "search_box": bounds(args.box_profile),
        "maxiter": args.maxiter,
        "popsize": args.popsize,
        "workers": args.workers,
        "random_seed": args.seed,
        "fixed_order": args.fixed_order,
        "stage": args.stage,
        "box_profile": args.box_profile,
        "result": render(candidate),
    }
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

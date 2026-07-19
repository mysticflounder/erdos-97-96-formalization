#!/usr/bin/env python3
"""Bounded Euclidean search for the period-three core plus one complete row.

All circle equalities are true by parameterization.  This is a SAT-witness
search, not a coverage procedure: a no-hit result is UNKNOWN, never UNSAT.
"""

from __future__ import annotations

import argparse
import json
import math
from dataclasses import dataclass

import numpy as np
from scipy.optimize import differential_evolution


Point = np.ndarray
CAP_NAMES = ("left", "q0", "c0", "c2", "q1", "c1", "q2", "right")


def unit(theta: float) -> Point:
    return np.array([math.cos(theta), math.sin(theta)], dtype=float)


def rotate(point: Point, theta: float) -> Point:
    c, s = math.cos(theta), math.sin(theta)
    return np.array([c * point[0] - s * point[1], s * point[0] + c * point[1]])


def cross(a: Point, b: Point, c: Point) -> float:
    u, v = b - a, c - a
    return float(u[0] * v[1] - u[1] * v[0])


def sqdist(a: Point, b: Point) -> float:
    d = a - b
    return float(d @ d)


@dataclass
class Candidate:
    params: np.ndarray
    points: dict[str, Point]
    order_type: str
    boundary: tuple[str, ...]
    margins: dict[str, float]

    @property
    def score(self) -> float:
        return min(value for name, value in self.margins.items() if name != "parameterized_equality_gate")


def construct(params: np.ndarray) -> dict[str, Point]:
    apex, a0, a1, a2, l0, l1, l2, phi_x, phi_y = map(float, params)
    o = np.zeros(2)
    left, right = unit(0.0), unit(apex)
    q0, q1, q2 = unit(a0), unit(a1), unit(a2)
    c0 = l0 * (q0 + q1)
    c1 = l1 * (q1 + q2)
    c2 = l2 * (q2 + q0)
    x = c0 + rotate(q0 - c0, phi_x)
    y = c0 + rotate(q0 - c0, phi_y)
    return {
        "o": o, "left": left, "q0": q0, "c0": c0, "c2": c2,
        "q1": q1, "c1": c1, "q2": q2, "right": right, "x": x, "y": y,
    }


def boundary_margin(points: dict[str, Point], boundary: tuple[str, ...]) -> float:
    result = math.inf
    for i, name_a in enumerate(boundary):
        name_b = boundary[(i + 1) % len(boundary)]
        a, b = points[name_a], points[name_b]
        for name, p in points.items():
            if name in (name_a, name_b):
                continue
            result = min(result, cross(a, b, p))
    return result


def evaluate(params: np.ndarray, order_type: str) -> Candidate:
    points = construct(params)
    if order_type == "same_side":
        boundary = ("o", "x", "y", *CAP_NAMES)
    elif order_type == "split_side":
        boundary = ("o", "x", *CAP_NAMES, "y")
    else:
        raise ValueError(order_type)

    apex, a0, a1, a2 = map(float, params[:4])
    # Angle-order/nonobtuse margins are scaled to the same rough range as the
    # geometric area margins.
    angle_margin = min(a0, a1 - a0, a2 - a1, apex - a2, math.pi / 2 - apex)

    # Exact circumdisk of o,left,right.
    right = points["right"]
    mec_center = np.array([0.5, (1.0 - right[0]) / (2.0 * right[1])])
    mec_radius_sq = sqdist(mec_center, points["o"])
    nontriangle = tuple(name for name in points if name not in ("o", "left", "right"))
    disk_margin = min(mec_radius_sq - sqdist(mec_center, points[name]) for name in nontriangle)

    cap_side_margin = min(
        cross(points["left"], points["right"], points[name])
        for name in ("o", "x", "y")
    )
    cap_inside_margin = min(
        -cross(points["left"], points["right"], points[name])
        for name in CAP_NAMES[1:-1]
    )

    names = tuple(points)
    distinct_margin = min(
        sqdist(points[names[i]], points[names[j]])
        for i in range(len(names)) for j in range(i)
    )

    physical_exclusion = min(
        abs(sqdist(points["o"], points[name]) - 1.0)
        for name in ("c0", "c1", "c2", "x", "y")
    )
    r0 = sqdist(points["c0"], points["q0"])
    row0_exclusion = min(
        abs(sqdist(points["c0"], points[name]) - r0)
        for name in ("o", "left", "c1", "c2", "q2", "right")
    )
    # Retain the predecessor's exact cap-intersection exclusions for all
    # three blocker rows.  Equalities to each named source pair are by
    # parameterization.
    cap_row_exclusions = []
    for center, sources in (("c0", {"q0", "q1"}), ("c1", {"q1", "q2"}), ("c2", {"q2", "q0"})):
        radius = sqdist(points[center], points[next(iter(sources))])
        for name in CAP_NAMES:
            if name == center or name in sources:
                continue
            cap_row_exclusions.append(abs(sqdist(points[center], points[name]) - radius))

    # The complete c0 row equalities are also substituted numerically.  Their
    # error is reported separately and must stay at roundoff scale.
    equality_error = max(
        abs(sqdist(points["c0"], points[name]) - r0)
        for name in ("q1", "x", "y")
    )

    margins = {
        "angle_order": angle_margin,
        "strict_hull": boundary_margin(points, boundary),
        "outside_cap_side": cap_side_margin,
        "physical_cap_side": cap_inside_margin,
        "mec_disk": disk_margin,
        "pairwise_distinct_sq": distinct_margin,
        "physical_class_exclusion": physical_exclusion,
        "row0_class_exclusion": row0_exclusion,
        "cap_row_exclusion": min(cap_row_exclusions),
        # Convert equality error into a generous positive gate.  Construction
        # should make it below 1e-12; it is not part of the optimization force.
        "parameterized_equality_gate": 1e-10 - equality_error,
    }
    return Candidate(np.array(params), points, order_type, boundary, margins)


def exact_seed() -> np.ndarray:
    return np.array([
        2 * math.atan(163 / 192),
        2 * math.atan(4 / 231),
        2 * math.atan(123 / 184),
        2 * math.atan(3 / 4),
        45 / 86,
        251 / 500,
        271 / 500,
        2 * math.atan(-47 / 149),
        2 * math.atan(-47 / 149),
    ])


def fixed_core_scan(samples: int) -> Candidate:
    seed = exact_seed()
    best: Candidate | None = None
    # Keep the exact first target and scan the second target circle.
    for k in range(samples):
        seed[8] = -math.pi + 2 * math.pi * (k + 0.5) / samples
        for order_type in ("same_side", "split_side"):
            candidate = evaluate(seed, order_type)
            if best is None or candidate.score > best.score:
                best = candidate
    assert best is not None
    return best


def deformable_search(order_type: str, maxiter: int, popsize: int, seed_value: int) -> Candidate:
    seed = exact_seed()
    bounds = [
        (1.20, math.pi / 2 - 1e-4),  # apex angle
        (0.005, 0.30),               # q0 angle
        (0.35, 1.30),                # q1 angle
        (0.85, 1.50),                # q2 angle
        (0.42, 0.70), (0.42, 0.70), (0.42, 0.70),
        (-math.pi, math.pi), (-math.pi, math.pi),
    ]

    def objective(params: np.ndarray) -> float:
        return -evaluate(params, order_type).score

    initial = np.tile(seed, (popsize * len(bounds), 1))
    rng = np.random.default_rng(seed_value)
    widths = np.array([hi - lo for lo, hi in bounds])
    initial += rng.normal(0.0, 0.04, size=initial.shape) * widths
    for col, (lo, hi) in enumerate(bounds):
        initial[:, col] = np.clip(initial[:, col], lo, hi)
    # Spread the second target around the full circle; otherwise the repeated
    # seed starts on the forbidden diagonal x=y.
    initial[:, 8] = rng.uniform(-math.pi, math.pi, size=len(initial))

    result = differential_evolution(
        objective,
        bounds,
        x0=seed,
        init=initial,
        maxiter=maxiter,
        popsize=popsize,
        seed=seed_value,
        polish=True,
        updating="immediate",
        workers=1,
        tol=1e-10,
        atol=1e-12,
    )
    return evaluate(result.x, order_type)


def render(candidate: Candidate) -> dict[str, object]:
    feasible = (
        candidate.score > 1e-8
        and candidate.margins["parameterized_equality_gate"] > 0
    )
    return {
        "order_type": candidate.order_type,
        "boundary": list(candidate.boundary),
        "score": candidate.score,
        "parameters": {
            key: float(value)
            for key, value in zip(
                ("apex", "q0", "q1", "q2", "lambda0", "lambda1", "lambda2", "phi_x", "phi_y"),
                candidate.params,
            )
        },
        "points": {name: [float(p[0]), float(p[1])] for name, p in candidate.points.items()},
        "margins": candidate.margins,
        "status": "NUMERIC_SAT_CANDIDATE" if feasible else "UNKNOWN_NO_HIT",
    }


def self_test() -> None:
    seed = exact_seed()
    one_target_boundary = ("o", "x", *CAP_NAMES)
    points = construct(seed)
    one_target_points = {name: point for name, point in points.items() if name != "y"}
    assert boundary_margin(one_target_points, one_target_boundary) > 1e-8
    assert abs(sqdist(points["c0"], points["q0"]) - sqdist(points["c0"], points["x"])) < 1e-12


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--fixed-samples", type=int, default=100_000)
    parser.add_argument("--maxiter", type=int, default=600)
    parser.add_argument("--popsize", type=int, default=24)
    parser.add_argument("--seed", type=int, default=20260717)
    args = parser.parse_args()
    self_test()

    fixed = fixed_core_scan(args.fixed_samples)
    same = deformable_search("same_side", args.maxiter, args.popsize, args.seed)
    split = deformable_search("split_side", args.maxiter, args.popsize, args.seed + 1)
    payload = {
        "schema": "period3-cycle-one-complete-row-euclidean-search-v1",
        "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_COVERAGE",
        "fixed_core": render(fixed),
        "deformable": {"same_side": render(same), "split_side": render(split)},
    }
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

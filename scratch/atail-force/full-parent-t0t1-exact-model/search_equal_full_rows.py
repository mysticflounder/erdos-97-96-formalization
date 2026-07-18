#!/usr/bin/env python3
"""Search the equal-radius T0/T1 skeleton plus three complete reverse rows."""

from __future__ import annotations

import argparse
import json
import math

import numpy as np
from scipy.optimize import differential_evolution, minimize


APEX = 1.0471977625398625
FIRST_RADIUS = 0.978448844538536
FIRST_ANGLES = {
    "side": -2.120400361862427,
    "i0": -1.865074360319684,
    "i1": -1.650459382595376,
    "i2": -1.4911335325950144,
    "i3": -1.2765183341144404,
    "out": -1.021192599137804,
}
ROW_PAIRS = ((0, 1), (1, 2), (2, 0))
LANDMARKS = ("second", "i0", "i1", "i2", "i3", "surplus", "out", "first", "side")


def unit(theta: float) -> np.ndarray:
    return np.array([math.cos(theta), math.sin(theta)])


def rotate(point: np.ndarray, theta: float) -> np.ndarray:
    c, s = math.cos(theta), math.sin(theta)
    return np.array([c * point[0] - s * point[1], s * point[0] + c * point[1]])


def cross(a: np.ndarray, b: np.ndarray, c: np.ndarray) -> float:
    u, v = b - a, c - a
    return float(u[0] * v[1] - u[1] * v[0])


def sqdist(a: np.ndarray, b: np.ndarray) -> float:
    d = a - b
    return float(d @ d)


def construct(p: np.ndarray) -> dict[str, np.ndarray]:
    a0, a1, a2, l0, l1, l2, *target_angles = map(float, p)
    second = np.zeros(2)
    surplus = unit(0.0)
    first = unit(APEX)
    sources = [unit(a0), unit(a1), unit(a2)]
    blockers = [
        l0 * (sources[0] + sources[1]),
        l1 * (sources[1] + sources[2]),
        l2 * (sources[2] + sources[0]),
    ]
    points = {"second": second, "surplus": surplus, "first": first}
    for name, angle in FIRST_ANGLES.items():
        points[name] = first + FIRST_RADIUS * unit(angle)
    for row in range(3):
        points[f"q{row}"] = sources[row]
        points[f"b{row}"] = blockers[row]
    for row, (source, _) in enumerate(ROW_PAIRS):
        vector = sources[source] - blockers[row]
        for slot in range(2):
            points[f"x{row}{slot}"] = blockers[row] + rotate(vector, target_angles[2 * row + slot])
    return points


def cyclic_order(points: dict[str, np.ndarray]) -> tuple[str, ...]:
    centroid = sum(points.values()) / len(points)
    return tuple(sorted(points, key=lambda name: math.atan2(
        points[name][1] - centroid[1], points[name][0] - centroid[0])))


def rotate_order(order: tuple[str, ...], start: str) -> tuple[str, ...]:
    index = order.index(start)
    return order[index:] + order[:index]


def groups(p: np.ndarray) -> dict[str, list[float]]:
    points = construct(p)
    order = cyclic_order(points)
    rooted = rotate_order(order, "second")
    positions = {name: rooted.index(name) for name in LANDMARKS}
    first = points["first"]
    mec_center = np.array([0.5, (1 - first[0]) / (2 * first[1])])
    mec_radius_sq = sqdist(mec_center, points["second"])
    result = {
        "source_order": [p[0] - 1e-4, p[1] - p[0] - 1e-4,
                         p[2] - p[1] - 1e-4, APEX - p[2] - 1e-4],
        "landmark_order": [positions[b] - positions[a] - 0.5
                           for a, b in zip(LANDMARKS, LANDMARKS[1:])],
        "strict_hull": [],
        "mec": [],
        "physical_side": [],
        "outside_side": [],
        "pairwise": [],
        "physical_exact_exclusions": [],
        "reverse_exact_exclusions": [],
        "row_equalities_audit": [],
        "first_equalities_audit": [],
        "nonreturn": [],
    }
    for index, a in enumerate(order):
        b = order[(index + 1) % len(order)]
        for name in order:
            if name not in (a, b):
                result["strict_hull"].append(cross(points[a], points[b], points[name]) - 1e-7)
    for name, point in points.items():
        result["mec"].append(mec_radius_sq - sqdist(mec_center, point) + 1e-10)
    for name in ("q0", "b0", "b2", "q1", "b1", "q2"):
        result["physical_side"].append(-cross(points["surplus"], first, points[name]) - 1e-7)
    for name in ("second", "x00", "x01", "x10", "x11", "x20", "x21"):
        result["outside_side"].append(cross(points["surplus"], first, points[name]) - 1e-7)
    names = tuple(points)
    for i, name in enumerate(names):
        for other in names[:i]:
            result["pairwise"].append(sqdist(points[name], points[other]) - 1e-7)

    physical = {"surplus", "q0", "q1", "q2", "first"}
    for name in points:
        if name not in physical and name != "second":
            result["physical_exact_exclusions"].append(
                abs(sqdist(points["second"], points[name]) - 1.0) - 1e-7)
    for row, (source, successor) in enumerate(ROW_PAIRS):
        center = points[f"b{row}"]
        support = {f"q{source}", f"q{successor}", f"x{row}0", f"x{row}1"}
        radius_sq = sqdist(center, points[f"q{source}"])
        for name in points:
            if name in support:
                result["row_equalities_audit"].append(
                    1e-9 - abs(sqdist(center, points[name]) - radius_sq))
            elif name != f"b{row}":
                result["reverse_exact_exclusions"].append(
                    abs(sqdist(center, points[name]) - radius_sq) - 1e-7)
        result["nonreturn"].append(
            abs(sqdist(first, points[f"x{row}0"]) - sqdist(first, points[f"x{row}1"])) - 1e-7)
    first_radius_sq = FIRST_RADIUS * FIRST_RADIUS
    for name in FIRST_ANGLES:
        result["first_equalities_audit"].append(
            1e-9 - abs(sqdist(first, points[name]) - first_radius_sq))
    return result


def score(p: np.ndarray) -> float:
    active = ("source_order", "landmark_order", "strict_hull", "mec",
              "physical_side", "outside_side", "pairwise")
    g = groups(p)
    return min(value for name in active for value in g[name])


def bounds() -> list[tuple[float, float]]:
    return [
        (0.01, 0.25), (0.30, 0.75), (0.80, APEX - 0.01),
        (0.25, 1.1), (0.25, 1.1), (0.25, 1.1),
        *[(-math.pi, math.pi) for _ in range(6)],
    ]


def initial() -> np.ndarray:
    old_apex = 1.5673564940810407
    old_sources = np.array([0.02045481824628835, 0.804611988371201, 1.545352382277155])
    source_angles = old_sources * (APEX / old_apex)
    rotations = np.array([
        2 * math.atan(-12151 / 50741), 2 * math.atan(-11188 / 69765),
        2 * math.atan(-364045 / 54493), 2 * math.atan(-58655 / 15086),
        2 * math.atan(42572 / 38447), 2 * math.atan(88847 / 40943),
    ])
    return np.concatenate((source_angles, np.array([0.50431, 0.502136, 0.69134]), rotations))


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--maxiter", type=int, default=1000)
    parser.add_argument("--popsize", type=int, default=36)
    parser.add_argument("--seed", type=int, default=20260718)
    args = parser.parse_args()
    seed = initial()
    result = differential_evolution(lambda p: -score(p), bounds(), x0=seed,
        seed=args.seed, maxiter=args.maxiter, popsize=args.popsize, workers=1,
        polish=False, tol=1e-10)
    candidates = [seed, result.x]
    for start in tuple(candidates):
        polished = minimize(lambda p: -score(p), start, method="Powell", bounds=bounds(),
            options={"maxiter": 30000, "xtol": 1e-12, "ftol": 1e-14})
        candidates.append(polished.x)
    best = max(candidates, key=score)
    points = construct(best)
    ledger = groups(best)
    minima = {name: min(values) for name, values in ledger.items()}
    status = "NUMERIC_SAT_CANDIDATE" if score(best) > 0 and all(v > 0 for v in minima.values()) else "UNKNOWN_NO_HIT"
    print(json.dumps({
        "status": status, "parameters": best.tolist(), "minimum_search_margin": score(best),
        "minimum_by_group": minima, "cyclic_order": list(cyclic_order(points)),
        "points": {name: point.tolist() for name, point in points.items()},
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

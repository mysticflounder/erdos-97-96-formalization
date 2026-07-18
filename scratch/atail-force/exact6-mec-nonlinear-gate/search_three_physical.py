#!/usr/bin/env python3
"""Bounded nonlinear search for the exact-six, three-physical-role gate.

The equal-radius equations are true by construction.  The only represented
critical rows are the unused-source row and the two mutual-source rows from
``ExactSixMutualCompleteRowManifest``.  No anonymous row is added.

This is a witness search, not a decision procedure.  ``UNKNOWN_NO_HIT`` means
only that the bounded run found no point in the requested semialgebraic cell.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
import json
import math

import numpy as np
from scipy.optimize import differential_evolution, minimize


Point = np.ndarray
PHYSICAL_NAMES = ("a", "b", "c")
ROW_SOURCES = {"unused": "u", "source": "a", "target": "b"}


def unit(theta: float) -> Point:
    return np.array([math.cos(theta), math.sin(theta)], dtype=float)


def rotate(vector: Point, theta: float) -> Point:
    cosine, sine = math.cos(theta), math.sin(theta)
    return np.array(
        [cosine * vector[0] - sine * vector[1], sine * vector[0] + cosine * vector[1]],
        dtype=float,
    )


def cross(a: Point, b: Point, c: Point) -> float:
    u, v = b - a, c - a
    return float(u[0] * v[1] - u[1] * v[0])


def sqdist(a: Point, b: Point) -> float:
    delta = a - b
    return float(delta @ delta)


def outward_bulge(a: Point, b: Point, t: float, epsilon: float) -> Point:
    point_on_edge = (1.0 - t) * a + t * b
    right_normal = np.array([b[1] - a[1], a[0] - b[0]], dtype=float)
    return point_on_edge + epsilon * right_normal


def bisector_point(a: Point, b: Point, scale: float) -> Point:
    midpoint = (a + b) / 2.0
    delta = b - a
    perpendicular = np.array([-delta[1], delta[0]], dtype=float)
    return midpoint + scale * perpendicular


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


def strict_hull_margins(points: dict[str, Point], order: tuple[str, ...]) -> list[float]:
    margins: list[float] = []
    for index, first_name in enumerate(order):
        second_name = order[(index + 1) % len(order)]
        for name, point in points.items():
            if name not in (first_name, second_name):
                margins.append(cross(points[first_name], points[second_name], point))
    return margins


def construct(parameters: np.ndarray, unused_hit: str) -> tuple[dict[str, Point], dict[str, set[str]]]:
    (
        apex,
        angle_a,
        angle_b,
        angle_c,
        unused_fraction,
        unused_bulge,
        blocker_source_scale,
        blocker_target_scale,
        blocker_unused_scale,
        *target_angles,
    ) = map(float, parameters)
    o = np.zeros(2)
    left, right = unit(0.0), unit(apex)
    physical = {"a": unit(angle_a), "b": unit(angle_b), "c": unit(angle_c)}
    u = outward_bulge(
        physical["a"], physical["b"], unused_fraction, unused_bulge
    )

    # Each mutual row contains its own source and the third physical point,
    # and therefore omits the other mutual source.  The unused row contains
    # exactly the physical point not used by the continuation pair in the
    # corresponding role orbit.
    blocker_source = blocker_source_scale * (physical["a"] + physical["c"])
    blocker_target = blocker_target_scale * (physical["b"] + physical["c"])
    blocker_unused = bisector_point(u, physical[unused_hit], blocker_unused_scale)
    blockers = {
        "source": blocker_source,
        "target": blocker_target,
        "unused": blocker_unused,
    }
    row_base = {
        "source": (physical["a"], physical["c"]),
        "target": (physical["b"], physical["c"]),
        "unused": (u, physical[unused_hit]),
    }

    points: dict[str, Point] = {
        "o": o,
        "left": left,
        "right": right,
        "u": u,
        **physical,
        **{f"blocker_{name}": value for name, value in blockers.items()},
    }
    supports: dict[str, set[str]] = {}
    for row_index, row_name in enumerate(("source", "target", "unused")):
        source_point, second_point = row_base[row_name]
        source_name = ROW_SOURCES[row_name]
        second_name = "c" if row_name != "unused" else unused_hit
        center = blockers[row_name]
        radius_vector = source_point - center
        target_names = []
        for slot in range(2):
            target_name = f"{row_name}_x{slot}"
            target_names.append(target_name)
            points[target_name] = center + rotate(
                radius_vector, target_angles[2 * row_index + slot]
            )
        supports[row_name] = {source_name, second_name, *target_names}
        # The second named point is exactly co-radial by the blocker formulas.
        assert abs(sqdist(center, source_point) - sqdist(center, second_point)) < 1e-9
    return points, supports


@dataclass
class Candidate:
    parameters: np.ndarray
    unused_hit: str
    points: dict[str, Point]
    supports: dict[str, set[str]]
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
    def penalty(self) -> float:
        return -self.minimum_margin


def evaluate(parameters: np.ndarray, unused_hit: str) -> Candidate:
    points, supports = construct(parameters, unused_hit)
    order = cyclic_order(points)
    apex, angle_a, angle_b, angle_c = map(float, parameters[:4])
    area_floor = 1e-7
    metric_floor = 1e-7

    right = points["right"]
    mec_center = np.array([0.5, (1.0 - right[0]) / (2.0 * right[1])])
    mec_radius_sq = sqdist(mec_center, points["o"])
    physical_chord = (points["left"], points["right"])
    physical_cap = {"left", "a", "u", "b", "c", "right"}

    groups: dict[str, list[float]] = {
        "source_angle_order": [
            angle_a - 1e-4,
            angle_b - angle_a - 1e-4,
            angle_c - angle_b - 1e-4,
            apex - angle_c - 1e-4,
            math.pi / 2.0 - apex - 1e-4,
        ],
        "strict_hull": [
            value - area_floor for value in strict_hull_margins(points, order)
        ],
        "physical_cap_side": [
            -cross(*physical_chord, points[name]) - area_floor
            for name in ("a", "u", "b", "c")
        ],
        "outside_physical_cap_side": [
            cross(*physical_chord, point) - area_floor
            for name, point in points.items()
            if name not in physical_cap
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

    physical_radius_support = {"left", "a", "b", "c", "right"}
    groups["physical_exact_five_filter_audit"] = [
        abs(sqdist(points["o"], point) - 1.0) - metric_floor
        for name, point in points.items()
        if name not in physical_radius_support and name != "o"
    ]

    row_filter_gaps: list[float] = []
    equality_gates: list[float] = []
    source_deletion_gates: list[float] = []
    for row_name, support in supports.items():
        center_name = f"blocker_{row_name}"
        center = points[center_name]
        source_name = ROW_SOURCES[row_name]
        radius_sq = sqdist(center, points[source_name])
        for name, point in points.items():
            if name in support:
                equality_gates.append(1e-9 - abs(sqdist(center, point) - radius_sq))
            elif name != center_name:
                row_filter_gaps.append(abs(sqdist(center, point) - radius_sq) - metric_floor)
        # With a complete exact four-point filter, deleting its source leaves
        # only three points at that radius.  This audit also rejects any other
        # represented radius class of cardinality four at the blocker.
        distances: dict[int, list[str]] = {}
        for name, point in points.items():
            if name in (center_name, source_name):
                continue
            key = round(sqdist(center, point) / metric_floor)
            distances.setdefault(key, []).append(name)
        source_deletion_gates.append(
            0.5 if max(map(len, distances.values()), default=0) < 4 else -0.5
        )
    groups["row_parameterized_equalities_audit"] = equality_gates
    groups["row_exact_filter_exclusions_audit"] = row_filter_gaps
    groups["source_deletion_no_k4_numeric_audit"] = source_deletion_gates
    return Candidate(np.array(parameters), unused_hit, points, supports, order, groups)


def bounds() -> list[tuple[float, float]]:
    return [
        (1.20, math.pi / 2.0 - 2e-4),
        (0.02, 0.42),
        (0.43, 1.02),
        (1.03, 1.42),
        (0.15, 0.85),
        (0.0005, 0.16),
        (-2.0, 2.0),
        (-2.0, 2.0),
        (-2.0, 2.0),
        *[(-math.pi, math.pi) for _ in range(6)],
    ]


def render(candidate: Candidate) -> dict[str, object]:
    minima = {name: min(values) for name, values in candidate.groups.items()}
    audit_minimum = min(
        value for name, value in minima.items() if name.endswith("_audit")
    )
    status = (
        "NUMERIC_STRICT_CONVEX_MEC_CANDIDATE"
        if candidate.minimum_margin > 0 and audit_minimum > 0
        else "UNKNOWN_NO_HIT"
    )
    return {
        "schema": "p97-exact6-three-physical-four-actual-rows-nonlinear-search-v1",
        "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_COVERAGE",
        "status": status,
        "unused_row_physical_hit": candidate.unused_hit,
        "minimum_margin": candidate.minimum_margin,
        "minimum_by_group": minima,
        "cyclic_order": list(candidate.order),
        "parameters": candidate.parameters.tolist(),
        "supports": {name: sorted(support) for name, support in candidate.supports.items()},
        "points": {name: point.tolist() for name, point in candidate.points.items()},
        "encoded": [
            "exact six-point physical cap",
            "exact five-point physical-apex radius filter",
            "three actual source-indexed complete critical rows",
            "mutual omission and continuation-pair omissions",
            "strict convex cyclic order",
            "nonobtuse support triangle and MEC containment",
            "source-deletion criticality for represented blocker rows",
        ],
        "omitted": [
            "global K4 at unrepresented centers",
            "total CriticalShellSystem outside the three displayed sources",
            "original first-apex frontier and bi-apex robustness",
            "global minimality and quantified noM44",
        ],
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--unused-hit", choices=PHYSICAL_NAMES, required=True)
    parser.add_argument("--maxiter", type=int, default=700)
    parser.add_argument("--popsize", type=int, default=32)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--seed", type=int, default=20260718)
    parser.add_argument("--output")
    args = parser.parse_args()

    objective = lambda parameters: evaluate(parameters, args.unused_hit).penalty
    result = differential_evolution(
        objective,
        bounds(),
        seed=args.seed,
        maxiter=args.maxiter,
        popsize=args.popsize,
        workers=args.workers,
        updating="deferred" if args.workers != 1 else "immediate",
        polish=False,
        tol=1e-10,
    )
    polished = minimize(
        objective,
        result.x,
        method="Powell",
        bounds=bounds(),
        options={"maxiter": 20_000, "xtol": 1e-12, "ftol": 1e-14},
    )
    best = polished.x if objective(polished.x) < objective(result.x) else result.x
    payload = render(evaluate(best, args.unused_hit))
    text = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output:
        from pathlib import Path

        Path(args.output).write_text(text)
    print(text, end="")


if __name__ == "__main__":
    main()

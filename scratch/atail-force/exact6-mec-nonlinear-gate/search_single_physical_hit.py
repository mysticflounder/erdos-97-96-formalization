#!/usr/bin/env python3
"""Search the exact-six mutual MEC gate with one physical hit per critical row.

The physical-apex filter is the exact card-three distribution: three strict
physical-cap sources plus one hit in each adjacent closed cap.  The physical
cap's fourth interior point is the unused source.  Each represented actual
critical row contains only its own source among these physical roles; its
three remaining support points are split across the two adjacent caps.

All row equalities are imposed by rotation around the row's named blocker.
The search is bounded numerical discovery only; it is not coverage.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
from functools import partial
import json
import math
from pathlib import Path

import numpy as np
from scipy.optimize import differential_evolution, minimize


Point = np.ndarray
ROWS = ("source", "target", "unused")
ROW_SOURCE = {"source": "a", "target": "b", "unused": "u"}
CAP = {
    "blocker_source": "lower",
    "blocker_target": "upper",
    "blocker_unused": "lower",
    "source_x0": "lower",
    "source_x1": "upper",
    "source_x2": "upper",
    "target_x0": "lower",
    "target_x1": "lower",
    "target_x2": "upper",
    "unused_x0": "lower",
    "unused_x1": "upper",
    "unused_x2": "upper",
}


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


def construct(parameters: np.ndarray) -> tuple[dict[str, Point], dict[str, set[str]]]:
    (
        apex,
        angle_a,
        angle_b,
        angle_c,
        unused_fraction,
        unused_bulge,
        source_blocker_x,
        source_blocker_y,
        target_blocker_x,
        target_blocker_y,
        unused_blocker_x,
        unused_blocker_y,
        *target_angles,
    ) = map(float, parameters)
    points: dict[str, Point] = {
        "o": np.zeros(2),
        "left": unit(0.0),
        "right": unit(apex),
        "a": unit(angle_a),
        "b": unit(angle_b),
        "c": unit(angle_c),
    }
    points["u"] = outward_bulge(
        points["a"], points["b"], unused_fraction, unused_bulge
    )
    points.update(
        {
            "blocker_source": np.array([source_blocker_x, source_blocker_y]),
            "blocker_target": np.array([target_blocker_x, target_blocker_y]),
            "blocker_unused": np.array([unused_blocker_x, unused_blocker_y]),
        }
    )
    supports: dict[str, set[str]] = {}
    for row_index, row_name in enumerate(ROWS):
        source_name = ROW_SOURCE[row_name]
        center = points[f"blocker_{row_name}"]
        radius_vector = points[source_name] - center
        support = {source_name}
        for slot in range(3):
            target_name = f"{row_name}_x{slot}"
            support.add(target_name)
            points[target_name] = center + rotate(
                radius_vector, target_angles[3 * row_index + slot]
            )
        supports[row_name] = support
    return points, supports


def cap_side_margin(points: dict[str, Point], name: str, cap: str) -> float:
    if cap == "physical":
        apex, first, second = "o", "left", "right"
    elif cap == "lower":
        apex, first, second = "right", "o", "left"
    elif cap == "upper":
        apex, first, second = "left", "right", "o"
    else:
        raise ValueError(cap)
    return -cross(points[name], points[first], points[second]) * cross(
        points[apex], points[first], points[second]
    )


@dataclass
class Candidate:
    parameters: np.ndarray
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


def evaluate(parameters: np.ndarray) -> Candidate:
    points, supports = construct(parameters)
    order = cyclic_order(points)
    apex, angle_a, angle_b, angle_c = map(float, parameters[:4])
    area_floor = 1e-7
    metric_floor = 1e-7
    right = points["right"]
    mec_center = np.array([0.5, (1.0 - right[0]) / (2.0 * right[1])])
    mec_radius_sq = sqdist(mec_center, points["o"])

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
        "physical_cap_membership": [
            cap_side_margin(points, name, "physical") - area_floor
            for name in ("a", "u", "b", "c")
        ],
        "assigned_adjacent_cap_membership": [
            cap_side_margin(points, name, cap) - area_floor for name, cap in CAP.items()
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

    exact_five = {"left", "a", "b", "c", "right"}
    groups["physical_exact_five_filter_audit"] = [
        abs(sqdist(points["o"], point) - 1.0) - metric_floor
        for name, point in points.items()
        if name not in exact_five and name != "o"
    ]
    equality_gates: list[float] = []
    filter_gaps: list[float] = []
    source_deletion_gates: list[float] = []
    for row_name, support in supports.items():
        center_name = f"blocker_{row_name}"
        source_name = ROW_SOURCE[row_name]
        center = points[center_name]
        radius_sq = sqdist(center, points[source_name])
        for name, point in points.items():
            if name in support:
                equality_gates.append(1e-9 - abs(sqdist(center, point) - radius_sq))
            elif name != center_name:
                filter_gaps.append(abs(sqdist(center, point) - radius_sq) - metric_floor)
        remaining_distances = [
            sqdist(center, point)
            for name, point in points.items()
            if name not in (center_name, source_name)
        ]
        maximum_multiplicity = 0
        used = [False] * len(remaining_distances)
        for index, value in enumerate(remaining_distances):
            if used[index]:
                continue
            cluster = [
                other
                for other, other_value in enumerate(remaining_distances)
                if abs(other_value - value) < metric_floor
            ]
            for other in cluster:
                used[other] = True
            maximum_multiplicity = max(maximum_multiplicity, len(cluster))
        source_deletion_gates.append(0.5 if maximum_multiplicity < 4 else -0.5)
    groups["row_parameterized_equalities_audit"] = equality_gates
    groups["row_exact_filter_exclusions_audit"] = filter_gaps
    groups["source_deletion_no_k4_numeric_audit"] = source_deletion_gates
    return Candidate(np.array(parameters), points, supports, order, groups)


def objective(parameters: np.ndarray) -> float:
    return evaluate(parameters).penalty


def bounds() -> list[tuple[float, float]]:
    return [
        (1.20, math.pi / 2.0 - 2e-4),
        (0.02, 0.42),
        (0.43, 1.02),
        (1.03, 1.42),
        (0.15, 0.85),
        (0.0005, 0.16),
        *[(-0.35, 1.35), (-0.45, 1.15)] * 3,
        *[(-math.pi, math.pi) for _ in range(9)],
    ]


def represented_row_cap_hits(candidate: Candidate) -> dict[str, dict[str, int]]:
    caps = {
        "physical": {"left", "a", "u", "b", "c", "right"},
        "lower": {"o", "left", *(name for name, cap in CAP.items() if cap == "lower")},
        "upper": {"right", "o", *(name for name, cap in CAP.items() if cap == "upper")},
    }
    return {
        row_name: {
            cap_name: len(support & cap_members)
            for cap_name, cap_members in caps.items()
        }
        for row_name, support in candidate.supports.items()
    }


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
        "schema": "p97-exact6-card3-four-actual-rows-mec-search-v1",
        "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_COVERAGE",
        "status": status,
        "minimum_margin": candidate.minimum_margin,
        "minimum_by_group": minima,
        "cyclic_order": list(candidate.order),
        "parameters": candidate.parameters.tolist(),
        "supports": {name: sorted(value) for name, value in candidate.supports.items()},
        "represented_row_cap_hits": represented_row_cap_hits(candidate),
        "points": {name: point.tolist() for name, point in candidate.points.items()},
        "encoded": [
            "kernel-derived card-three physical-apex distribution with one adjacent hit per side",
            "exact six-point physical cap and exact five-point physical-apex filter",
            "three named source-indexed complete critical rows and their blockers",
            "mutual omission and unused-row continuation omissions",
            "strict convex cyclic order",
            "nonobtuse support triangle and MEC containment",
            "represented-row cap hit bounds",
            "represented-source deletion criticality",
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
    parser.add_argument("--maxiter", type=int, default=1200)
    parser.add_argument("--popsize", type=int, default=28)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--seed", type=int, default=20260718)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
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
        options={"maxiter": 30_000, "xtol": 1e-12, "ftol": 1e-14},
    )
    best = polished.x if objective(polished.x) < objective(result.x) else result.x
    payload = render(evaluate(best))
    text = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(text)
    print(text, end="")


if __name__ == "__main__":
    main()

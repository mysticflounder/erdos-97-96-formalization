#!/usr/bin/env python3
"""Search the card-four/four-distinct exact-six nonlinear MEC gate.

The physical exact-five class is ``{left,q0,q1,q2,q3}``, where ``q0,q1``
are the ordered continuation sources and ``q2,q3`` the ordered mutual pair.
The off-class unused sixth cap point is ``right``.  The mutual rows use the
allowed pairs ``q2,q0`` and ``q3,q1``; the unused row uses ``right,q2`` and
therefore omits both continuation sources.  Physical-support hit counts are
the manifest-sharp ``2,2,1``.  No anonymous row is introduced.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path

import numpy as np
from scipy.optimize import differential_evolution, minimize

from search_card3_role_orbit_pairs import perpendicular_bisector_point
from search_single_physical_hit import (
    Candidate,
    cap_side_margin,
    cyclic_order,
    rotate,
    sqdist,
    strict_hull_margins,
    unit,
)


Point = np.ndarray
ROWS = ("source", "target", "unused")


def construct(parameters: np.ndarray) -> tuple[dict[str, Point], dict[str, set[str]]]:
    (
        apex,
        right_radius,
        angle_q0,
        angle_q1,
        angle_q2,
        angle_q3,
        source_bisector_scale,
        target_bisector_scale,
        unused_bisector_scale,
        *target_angles,
    ) = map(float, parameters)
    points: dict[str, Point] = {
        "o": np.zeros(2),
        "left": unit(0.0),
        "right": right_radius * unit(apex),
        "q0": unit(angle_q0),
        "q1": unit(angle_q1),
        "q2": unit(angle_q2),
        "q3": unit(angle_q3),
    }
    row_pairs = {
        "source": ("q2", "q0"),
        "target": ("q3", "q1"),
        "unused": ("right", "q2"),
    }
    scales = {"unused": unused_bisector_scale}
    supports: dict[str, set[str]] = {}
    for row_index, row_name in enumerate(ROWS):
        first_name, second_name = row_pairs[row_name]
        center_name = f"blocker_{row_name}"
        if row_name == "source":
            center = source_bisector_scale * (
                points[first_name] + points[second_name]
            )
        elif row_name == "target":
            center = target_bisector_scale * (
                points[first_name] + points[second_name]
            )
        else:
            center = perpendicular_bisector_point(
                points[first_name], points[second_name], scales[row_name]
            )
        points[center_name] = center
        support = {first_name, second_name}
        radius_vector = points[first_name] - center
        for slot in range(2):
            target_name = f"{row_name}_x{slot}"
            support.add(target_name)
            points[target_name] = center + rotate(
                radius_vector, target_angles[2 * row_index + slot]
            )
        supports[row_name] = support
    return points, supports


def evaluate(parameters: np.ndarray) -> Candidate:
    points, supports = construct(parameters)
    order = cyclic_order(points)
    (
        apex,
        right_radius,
        angle_q0,
        angle_q1,
        angle_q2,
        angle_q3,
    ) = map(float, parameters[:6])
    area_floor = 1e-7
    metric_floor = 1e-7
    mec_center = np.array(
        [0.5, (right_radius - math.cos(apex)) / (2.0 * math.sin(apex))]
    )
    mec_radius_sq = sqdist(mec_center, points["o"])
    assigned_caps = {
        "blocker_source": "lower",
        "blocker_target": "lower",
        "blocker_unused": "lower",
        "source_x0": "lower",
        "source_x1": "upper",
        "target_x0": "upper",
        "target_x1": "upper",
        "unused_x0": "upper",
        "unused_x1": "upper",
    }
    groups: dict[str, list[float]] = {
        "source_angle_order": [
            angle_q0 - 1e-4,
            angle_q1 - angle_q0 - 1e-4,
            angle_q2 - angle_q1 - 1e-4,
            angle_q3 - angle_q2 - 1e-4,
            apex - angle_q3 - 1e-4,
        ],
        "support_triangle_nonobtuse": [
            right_radius * math.cos(apex),
            1.0 - right_radius * math.cos(apex),
            right_radius * right_radius - right_radius * math.cos(apex),
        ],
        "strict_hull": [
            value - area_floor for value in strict_hull_margins(points, order)
        ],
        "physical_cap_membership": [
            cap_side_margin(points, name, "physical") - area_floor
            for name in ("q0", "q1", "q2", "q3")
        ],
        "assigned_adjacent_cap_membership": [
            cap_side_margin(points, name, cap) - area_floor
            for name, cap in assigned_caps.items()
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

    exact_five = {"left", "q0", "q1", "q2", "q3"}
    groups["physical_exact_five_filter_audit"] = [
        abs(sqdist(points["o"], point) - 1.0) - metric_floor
        for name, point in points.items()
        if name not in exact_five and name != "o"
    ]
    equality_gates: list[float] = []
    filter_gaps: list[float] = []
    source_deletion_gates: list[float] = []
    row_sources = {"source": "q2", "target": "q3", "unused": "right"}
    for row_name, support in supports.items():
        center_name = f"blocker_{row_name}"
        source_name = row_sources[row_name]
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
        (1.16, math.pi / 2.0 - 2e-4),
        (0.72, 0.97),
        (0.02, 0.30),
        (0.31, 0.60),
        (0.61, 0.94),
        (0.95, 1.42),
        (-0.45, -0.002),
        (-0.45, -0.002),
        (-12.0, 12.0),
        *[(-math.pi, math.pi) for _ in range(6)],
    ]


def represented_row_ledgers(candidate: Candidate) -> tuple[dict[str, dict[str, int]], dict[str, int]]:
    caps = {
        "physical": {"left", "q0", "q1", "q2", "q3", "right"},
        "lower": {
            "o", "left", "blocker_source", "blocker_target", "blocker_unused",
            "source_x0",
        },
        "upper": {
            "right", "o", "source_x1", "target_x0", "target_x1",
            "unused_x0", "unused_x1",
        },
    }
    cap_hits = {
        row_name: {
            cap_name: len(support & members) for cap_name, members in caps.items()
        }
        for row_name, support in candidate.supports.items()
    }
    physical_vertices = {"q0", "q1", "q2", "q3"}
    physical_hits = {
        row_name: len(support & physical_vertices)
        for row_name, support in candidate.supports.items()
    }
    return cap_hits, physical_hits


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
    cap_hits, physical_hits = represented_row_ledgers(candidate)
    return {
        "schema": "p97-exact6-card4-four-distinct-paired-rows-mec-search-v1",
        "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_COVERAGE",
        "status": status,
        "orbit": "fourDistinct",
        "role_assignment": {
            "continuation_first": "q0",
            "continuation_second": "q1",
            "mutual_source": "q2",
            "mutual_target": "q3",
            "unused_physical_hit": "q2",
        },
        "minimum_margin": candidate.minimum_margin,
        "minimum_by_group": minima,
        "cyclic_order": list(candidate.order),
        "parameters": candidate.parameters.tolist(),
        "supports": {name: sorted(value) for name, value in candidate.supports.items()},
        "represented_row_cap_hits": cap_hits,
        "represented_row_physical_vertex_hits": physical_hits,
        "represented_blocker_cap": {
            "source": "lower strict interior",
            "target": "lower strict interior",
            "unused": "lower strict interior",
        },
        "represented_same_blocker_cap_support_bounds": {
            "source": 1,
            "target": 0,
            "unused": 0,
        },
        "points": {name: point.tolist() for name, point in candidate.points.items()},
        "encoded": [
            "kernel-derived card-four physical-apex distribution with one adjacent-union hit",
            "exact six-point physical cap and exact five-point physical-apex filter",
            "four distinct source roles equal the physical vertex set",
            "three named source-indexed complete critical rows and their blockers",
            "manifest-sharp physical support hit bounds 2,2,1",
            "mutual omission and unused-row continuation omissions",
            "strict convex cyclic order",
            "nonobtuse support triangle and MEC containment",
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

#!/usr/bin/env python3
"""Search one of the six card-three exact-six source-role orbits.

Unlike ``search_single_physical_hit.py``, this encoding uses every positive
physical-support incidence permitted by the checked manifest without adding
anonymous rows.  The two mutual rows share the third physical vertex, and
the unused-source row contains the unique physical vertex outside its two
continuation roles.  Consequently the physical-class hit counts are exactly
``2,2,1``, matching the manifest bounds.

Every represented blocker is a named carrier point on the perpendicular
bisector of its row's two fixed support vertices.  Each row then receives two
fresh targets by exact rotation around that blocker.  The run is bounded
numerical discovery, not coverage or a proof.
"""

from __future__ import annotations

import argparse
from functools import partial
import json
import math
from pathlib import Path

import numpy as np
from scipy.optimize import differential_evolution, minimize

from search_single_physical_hit import (
    Candidate,
    cap_side_margin,
    cyclic_order,
    outward_bulge,
    rotate,
    sqdist,
    strict_hull_margins,
    unit,
)


Point = np.ndarray
ROWS = ("source", "target", "unused")
ORBIT_ROLE_ASSIGNMENTS = {
    "continuationOrder": {
        "continuation_first": "q0",
        "continuation_second": "q2",
        "mutual_source": "q0",
        "mutual_target": "q2",
        "unused_physical_hit": "q1",
    },
    "reverseContinuationOrder": {
        "continuation_first": "q2",
        "continuation_second": "q0",
        "mutual_source": "q0",
        "mutual_target": "q2",
        "unused_physical_hit": "q1",
    },
    "sharesFirstAtSource": {
        "continuation_first": "q0",
        "continuation_second": "q1",
        "mutual_source": "q0",
        "mutual_target": "q2",
        "unused_physical_hit": "q2",
    },
    "sharesFirstAtTarget": {
        "continuation_first": "q2",
        "continuation_second": "q1",
        "mutual_source": "q0",
        "mutual_target": "q2",
        "unused_physical_hit": "q0",
    },
    "sharesSecondAtSource": {
        "continuation_first": "q1",
        "continuation_second": "q0",
        "mutual_source": "q0",
        "mutual_target": "q2",
        "unused_physical_hit": "q2",
    },
    "sharesSecondAtTarget": {
        "continuation_first": "q1",
        "continuation_second": "q2",
        "mutual_source": "q0",
        "mutual_target": "q2",
        "unused_physical_hit": "q0",
    },
}


def perpendicular_bisector_point(first: Point, second: Point, scale: float) -> Point:
    midpoint = 0.5 * (first + second)
    delta = second - first
    return midpoint + scale * np.array([-delta[1], delta[0]], dtype=float)


def construct(
    parameters: np.ndarray, orbit: str
) -> tuple[dict[str, Point], dict[str, set[str]]]:
    (
        apex,
        angle_q0,
        angle_q1,
        angle_q2,
        unused_fraction,
        unused_bulge,
        source_bisector_scale,
        target_bisector_scale,
        unused_bisector_scale,
        *target_angles,
    ) = map(float, parameters)
    role = ORBIT_ROLE_ASSIGNMENTS[orbit]
    points: dict[str, Point] = {
        "o": np.zeros(2),
        "left": unit(0.0),
        "right": unit(apex),
        "q0": unit(angle_q0),
        "q1": unit(angle_q1),
        "q2": unit(angle_q2),
    }
    points["u"] = outward_bulge(
        points["q0"], points["q1"], unused_fraction, unused_bulge
    )
    row_pairs = {
        "source": ("q0", "q1"),
        "target": ("q2", "q1"),
        "unused": ("u", role["unused_physical_hit"]),
    }
    scales = {"unused": unused_bisector_scale}
    supports: dict[str, set[str]] = {}
    for row_index, row_name in enumerate(ROWS):
        first_name, second_name = row_pairs[row_name]
        center_name = f"blocker_{row_name}"
        if row_name == "source":
            # Both fixed points are on the unit circle about o, so every
            # scalar multiple of their sum is on their perpendicular
            # bisector.  A negative scalar places the blocker on the
            # complementary boundary chain rather than in the exact-six cap.
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


def evaluate(parameters: np.ndarray, orbit: str) -> Candidate:
    points, supports = construct(parameters, orbit)
    order = cyclic_order(points)
    apex, angle_q0, angle_q1, angle_q2 = map(float, parameters[:4])
    area_floor = 1e-7
    metric_floor = 1e-7
    right = points["right"]
    mec_center = np.array([0.5, (1.0 - right[0]) / (2.0 * right[1])])
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
            apex - angle_q2 - 1e-4,
            math.pi / 2.0 - apex - 1e-4,
        ],
        "strict_hull": [
            value - area_floor for value in strict_hull_margins(points, order)
        ],
        "physical_cap_membership": [
            cap_side_margin(points, name, "physical") - area_floor
            for name in ("q0", "u", "q1", "q2")
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

    exact_five = {"left", "q0", "q1", "q2", "right"}
    groups["physical_exact_five_filter_audit"] = [
        abs(sqdist(points["o"], point) - 1.0) - metric_floor
        for name, point in points.items()
        if name not in exact_five and name != "o"
    ]
    equality_gates: list[float] = []
    filter_gaps: list[float] = []
    source_deletion_gates: list[float] = []
    row_sources = {"source": "q0", "target": "q2", "unused": "u"}
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


def objective(parameters: np.ndarray, orbit: str) -> float:
    return evaluate(parameters, orbit).penalty


def bounds() -> list[tuple[float, float]]:
    return [
        (1.20, math.pi / 2.0 - 2e-4),
        (0.02, 0.38),
        (0.39, 0.86),
        (0.87, 1.42),
        (0.15, 0.85),
        (0.0005, 0.16),
        (-0.45, -0.002),
        (-0.45, -0.002),
        (-12.0, 12.0),
        *[(-math.pi, math.pi) for _ in range(6)],
    ]


def represented_row_ledgers(candidate: Candidate) -> tuple[dict[str, dict[str, int]], dict[str, int]]:
    physical_cap = {"left", "q0", "u", "q1", "q2", "right"}
    lower_cap = {
        "o",
        "left",
        "blocker_source",
        "blocker_target",
        "blocker_unused",
        "source_x0",
    }
    upper_cap = {
        "right",
        "o",
        "source_x1",
        "target_x0",
        "target_x1",
        "unused_x0",
        "unused_x1",
    }
    caps = {"physical": physical_cap, "lower": lower_cap, "upper": upper_cap}
    cap_hits = {
        row_name: {
            cap_name: len(support & members) for cap_name, members in caps.items()
        }
        for row_name, support in candidate.supports.items()
    }
    physical_vertices = {"q0", "q1", "q2"}
    physical_hits = {
        row_name: len(support & physical_vertices)
        for row_name, support in candidate.supports.items()
    }
    return cap_hits, physical_hits


def render(candidate: Candidate, orbit: str) -> dict[str, object]:
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
        "schema": "p97-exact6-card3-source-role-orbit-paired-rows-mec-search-v1",
        "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_COVERAGE",
        "status": status,
        "orbit": orbit,
        "role_assignment": ORBIT_ROLE_ASSIGNMENTS[orbit],
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
            "kernel-derived card-three physical-apex distribution with one adjacent hit per side",
            "exact six-point physical cap and exact five-point physical-apex filter",
            "one of the first six checked source-identity orbits",
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
    parser.add_argument("--orbit", choices=tuple(ORBIT_ROLE_ASSIGNMENTS), required=True)
    parser.add_argument("--maxiter", type=int, default=1200)
    parser.add_argument("--popsize", type=int, default=28)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--seed", type=int, default=20260718)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    orbit_objective = partial(objective, orbit=args.orbit)
    result = differential_evolution(
        orbit_objective,
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
        orbit_objective,
        result.x,
        method="Powell",
        bounds=bounds(),
        options={"maxiter": 30_000, "xtol": 1e-12, "ftol": 1e-14},
    )
    best = (
        polished.x
        if orbit_objective(polished.x) < orbit_objective(result.x)
        else result.x
    )
    payload = render(evaluate(best, args.orbit), args.orbit)
    text = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(text)
    print(text, end="")


if __name__ == "__main__":
    main()

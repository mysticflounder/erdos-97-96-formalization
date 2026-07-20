#!/usr/bin/env python3
"""Source-faithful card-three one-hit MEC probe for ``continuationOrder``.

This is the first nonlinear cell that retains an actual exact-six role orbit:
``q0,q2`` are respectively the ordered mutual source and target, ``q1`` is
the one physical hit in the unused row, and ``u`` is its off-class source.
Thus the represented complete rows have physical-vertex hit counts ``1,1,1``
and enforce both mutual omissions and the two unused-row continuation
omissions.  The cap cell also enforces the cap-local bound of at most two
same-cap support points for every displayed strict-interior blocker.

This remains bounded numerical discovery only.  Its purpose is to give the
later fixed-word QF_NRA encoder a source-faithful equality and cap contract;
neither a SAT witness nor a no-hit optimization result closes a Lean branch.
"""

from __future__ import annotations

import argparse
import json
import math
from dataclasses import dataclass
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
ROW_SOURCE = {"source": "q0", "target": "q2", "unused": "u"}
PHYSICAL = {"q0", "q1", "q2"}
OUTSIDE_NAMES = (
    "blocker_source",
    "blocker_target",
    "blocker_unused",
    "source_x0",
    "source_x1",
    "source_x2",
    "target_x0",
    "target_x1",
    "target_x2",
    "unused_x0",
    "unused_x1",
)

# The strict-cap membership is a fixed legal cell.  The source and target
# blockers each see exactly two support points in their own cap; the unused
# blocker sees none.  Together the named roles give both adjacent caps at
# least four strict interior points.
CAP_CELL = {
    "blocker_source": "lower",
    "blocker_target": "upper",
    "blocker_unused": "lower",
    "source_x0": "lower",
    "source_x1": "lower",
    "source_x2": "upper",
    "target_x0": "lower",
    "target_x1": "upper",
    "target_x2": "upper",
    "unused_x0": "upper",
    "unused_x1": "upper",
}


def perpendicular_bisector_point(first: Point, second: Point, scale: float) -> Point:
    midpoint = 0.5 * (first + second)
    delta = second - first
    return midpoint + scale * np.array([-delta[1], delta[0]], dtype=float)


def construct(parameters: np.ndarray) -> tuple[dict[str, Point], dict[str, set[str]]]:
    (
        apex,
        angle_q0,
        angle_q1,
        angle_q2,
        unused_fraction,
        unused_bulge,
        source_blocker_x,
        source_blocker_y,
        target_blocker_x,
        target_blocker_y,
        unused_bisector_scale,
        *target_angles,
    ) = map(float, parameters)
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
    points["blocker_source"] = np.array([source_blocker_x, source_blocker_y])
    points["blocker_target"] = np.array([target_blocker_x, target_blocker_y])
    points["blocker_unused"] = perpendicular_bisector_point(
        points["u"], points["q1"], unused_bisector_scale
    )

    supports: dict[str, set[str]] = {
        "source": {"q0"},
        "target": {"q2"},
        "unused": {"u", "q1"},
    }
    slot_counts = {"source": 3, "target": 3, "unused": 2}
    offsets = {"source": 0, "target": 3, "unused": 6}
    for row_name in ROWS:
        center = points[f"blocker_{row_name}"]
        radius_vector = points[ROW_SOURCE[row_name]] - center
        for slot in range(slot_counts[row_name]):
            target_name = f"{row_name}_x{slot}"
            supports[row_name].add(target_name)
            points[target_name] = center + rotate(
                radius_vector, target_angles[offsets[row_name] + slot]
            )
    return points, supports


def evaluate(parameters: np.ndarray) -> Candidate:
    points, supports = construct(parameters)
    order = cyclic_order(points)
    apex, angle_q0, angle_q1, angle_q2 = map(float, parameters[:4])
    area_floor = 1e-7
    metric_floor = 1e-7
    right = points["right"]
    mec_center = np.array([0.5, (1.0 - right[0]) / (2.0 * right[1])])
    mec_radius_sq = sqdist(mec_center, points["o"])
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
            for name, cap in CAP_CELL.items()
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
    for row_name, support in supports.items():
        center_name = f"blocker_{row_name}"
        center = points[center_name]
        radius_sq = sqdist(center, points[ROW_SOURCE[row_name]])
        for name, point in points.items():
            if name in support:
                equality_gates.append(1e-9 - abs(sqdist(center, point) - radius_sq))
            elif name != center_name:
                filter_gaps.append(abs(sqdist(center, point) - radius_sq) - metric_floor)
        remaining_distances = [
            sqdist(center, point)
            for name, point in points.items()
            if name not in (center_name, ROW_SOURCE[row_name])
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


def bounds() -> list[tuple[float, float]]:
    return [
        (1.20, math.pi / 2.0 - 2e-4),
        (0.02, 0.42),
        (0.43, 1.02),
        (1.03, 1.42),
        (0.15, 0.85),
        (0.0005, 0.16),
        *[(-0.35, 1.35), (-0.45, 1.15)] * 2,
        (-12.0, 12.0),
        *[(-math.pi, math.pi) for _ in range(8)],
    ]


def objective(parameters: np.ndarray) -> float:
    return evaluate(parameters).penalty


def minimum_witnesses(candidate: Candidate) -> dict[str, dict[str, object]]:
    """Name the binding inequality in every numerical group for run triage."""
    points, order = candidate.points, candidate.order
    names = tuple(points)
    labels: dict[str, list[str]] = {
        "source_angle_order": [
            "q0-after-left", "q1-after-q0", "q2-after-q1",
            "right-after-q2", "nonobtuse-apex",
        ],
        "strict_hull": [
            f"edge:{order[index]}->{order[(index + 1) % len(order)]}:point:{name}"
            for index in range(len(order))
            for name in points
            if name not in (order[index], order[(index + 1) % len(order)])
        ],
        "physical_cap_membership": [f"physical:{name}" for name in ("q0", "u", "q1", "q2")],
        "assigned_adjacent_cap_membership": [
            f"{cap}:{name}" for name, cap in CAP_CELL.items()
        ],
        "mec_containment": [
            f"mec:{name}" for name in points if name not in ("o", "left", "right")
        ],
        "pairwise_distinct": [
            f"distinct:{names[first]}:{names[second]}"
            for first in range(len(names))
            for second in range(first)
        ],
    }
    result: dict[str, dict[str, object]] = {}
    for group, values in candidate.groups.items():
        index = min(range(len(values)), key=values.__getitem__)
        result[group] = {
            "value": values[index],
            "constraint": labels.get(group, [f"index:{i}" for i in range(len(values))])[index],
        }
    return result


def role_contract(candidate: Candidate) -> dict[str, object]:
    supports = candidate.supports
    physical_hits = {
        row: sorted(PHYSICAL & support) for row, support in supports.items()
    }
    own_cap_hits = {
        row: sum(
            name in support and CAP_CELL.get(name) == CAP_CELL[f"blocker_{row}"]
            for name in OUTSIDE_NAMES
        )
        for row, support in supports.items()
    }
    return {
        "orbit": "continuationOrder",
        "mutual_source": "q0",
        "mutual_target": "q2",
        "unused_source": "u",
        "unused_physical_hit": "q1",
        "physical_hits": physical_hits,
        "mutual_omissions": {
            "q2_not_in_source_support": "q2" not in supports["source"],
            "q0_not_in_target_support": "q0" not in supports["target"],
        },
        "unused_continuation_omissions": {
            "q0_not_in_unused_support": "q0" not in supports["unused"],
            "q2_not_in_unused_support": "q2" not in supports["unused"],
        },
        "same_blocker_cap_support_hits": own_cap_hits,
        "same_blocker_cap_bound": 2,
        "represented_closed_cap_cards": {
            "physical": 6,
            "lower": 2 + sum(cap == "lower" for cap in CAP_CELL.values()),
            "upper": 2 + sum(cap == "upper" for cap in CAP_CELL.values()),
        },
    }


def render(candidate: Candidate) -> dict[str, object]:
    minima = {name: min(values) for name, values in candidate.groups.items()}
    audit_minimum = min(value for name, value in minima.items() if name.endswith("_audit"))
    status = (
        "NUMERIC_STRICT_CONVEX_MEC_CANDIDATE"
        if candidate.minimum_margin > 0 and audit_minimum > 0
        else "UNKNOWN_NO_HIT"
    )
    return {
        "schema": "p97-exact6-card3-continuation-order-one-hit-mec-search-v1",
        "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_COVERAGE",
        "status": status,
        "minimum_margin": candidate.minimum_margin,
        "minimum_by_group": minima,
        "minimum_witness_by_group": minimum_witnesses(candidate),
        "cap_cell": CAP_CELL,
        "role_contract": role_contract(candidate),
        "cyclic_order": list(candidate.order),
        "parameters": candidate.parameters.tolist(),
        "supports": {name: sorted(value) for name, value in candidate.supports.items()},
        "points": {name: point.tolist() for name, point in candidate.points.items()},
        "encoded": [
            "exact-six card-three continuationOrder role orbit",
            "three actual source-indexed complete critical rows",
            "mutual omission and unused-row continuation omissions",
            "one physical hit in every displayed actual row",
            "strict convex cyclic order, nonobtuse support triangle, and MEC containment",
            "exact physical and row radius filters",
            "fixed legal adjacent-cap cell with same-cap support bound two",
        ],
        "omitted": [
            "other six source-role orbits and the unused-zero-hit subcase",
            "fixed cyclic-word enumeration",
            "global K4 at unrepresented centers and total CriticalShellSystem",
            "retained first-apex frontier, bi-apex robustness, global minimality, and noM44",
        ],
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--maxiter", type=int, default=400)
    parser.add_argument("--popsize", type=int, default=12)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--seed", type=int, default=20260720)
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
    best = polished.x if evaluate(polished.x).penalty < evaluate(result.x).penalty else result.x
    text = json.dumps(render(evaluate(best)), indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(text)
    print(text, end="")


if __name__ == "__main__":
    main()

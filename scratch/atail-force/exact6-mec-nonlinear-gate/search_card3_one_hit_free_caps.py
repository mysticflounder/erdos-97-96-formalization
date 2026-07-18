#!/usr/bin/env python3
"""Free-cap nonlinear MEC search for the six card-three source-role orbits.

The three actual critical rows contain respectively only ``q0``, ``q2``, and
the off-shell unused point ``u`` among their distinguished row sources.  The
blockers and private completions are not preassigned to either complementary
cap.  Instead strict convexity, support-triangle MEC containment, and the
requirement that every such point lie in one of the two complementary caps
determine the cap cell.  Both adjacent caps are required to have at least four
strict interior points, hence closed cardinality at least six.

This is the source-faithful one-physical-hit branch left open by the checked
two-hit blocker-localization theorem.  Numerical SAT would be discovery only;
no-hit is bounded UNKNOWN, never an infeasibility result.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path

import numpy as np
from scipy.optimize import differential_evolution, minimize

from search_card3_role_orbit_pairs import ORBIT_ROLE_ASSIGNMENTS
from search_single_physical_hit import (
    Candidate,
    bounds as search_bounds,
    cap_side_margin,
    construct,
    cyclic_order,
    sqdist,
    strict_hull_margins,
)


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
    "unused_x2",
)
ROW_SOURCES = {"source": "a", "target": "b", "unused": "u"}


def evaluate(parameters: np.ndarray) -> Candidate:
    points, supports = construct(parameters)
    order = cyclic_order(points)
    apex, angle_a, angle_b, angle_c = map(float, parameters[:4])
    area_floor = 1e-7
    metric_floor = 1e-7
    right = points["right"]
    mec_center = np.array([0.5, (1.0 - right[0]) / (2.0 * right[1])])
    mec_radius_sq = sqdist(mec_center, points["o"])

    lower_margins = {
        name: cap_side_margin(points, name, "lower") - area_floor
        for name in OUTSIDE_NAMES
    }
    upper_margins = {
        name: cap_side_margin(points, name, "upper") - area_floor
        for name in OUTSIDE_NAMES
    }
    # Fourth-largest positive membership on each side gives at least four
    # strict interior vertices and therefore a closed cap of cardinality six.
    lower_fourth = sorted(lower_margins.values(), reverse=True)[3]
    upper_fourth = sorted(upper_margins.values(), reverse=True)[3]
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
        "complementary_cap_membership": [
            max(lower_margins[name], upper_margins[name]) for name in OUTSIDE_NAMES
        ],
        "adjacent_cap_cardinality": [lower_fourth, upper_fourth],
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
        source_name = ROW_SOURCES[row_name]
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


def cap_ledger(candidate: Candidate) -> tuple[
    dict[str, str], dict[str, dict[str, int]], dict[str, int], dict[str, int]
]:
    point_caps: dict[str, str] = {}
    for name in OUTSIDE_NAMES:
        lower = cap_side_margin(candidate.points, name, "lower")
        upper = cap_side_margin(candidate.points, name, "upper")
        point_caps[name] = "lower" if lower > upper else "upper"
    caps = {
        "physical": {"left", "a", "u", "b", "c", "right"},
        "lower": {"o", "left", *(name for name, cap in point_caps.items() if cap == "lower")},
        "upper": {"right", "o", *(name for name, cap in point_caps.items() if cap == "upper")},
    }
    row_hits = {
        row_name: {
            cap_name: len(support & members) for cap_name, members in caps.items()
        }
        for row_name, support in candidate.supports.items()
    }
    cap_cards = {name: len(members) for name, members in caps.items()}
    same_blocker_cap_hits = {
        row_name: row_hits[row_name][point_caps[f"blocker_{row_name}"]]
        for row_name in ("source", "target", "unused")
    }
    return point_caps, row_hits, cap_cards, same_blocker_cap_hits


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
    point_caps, row_hits, cap_cards, same_blocker_cap_hits = cap_ledger(candidate)
    role_name = {"q0": "a", "q1": "c", "q2": "b"}
    source_roles = {
        key: role_name.get(value, value)
        for key, value in ORBIT_ROLE_ASSIGNMENTS[orbit].items()
        if key != "unused_physical_hit"
    }
    return {
        "schema": "p97-exact6-card3-one-hit-free-cap-mec-search-v1",
        "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_COVERAGE",
        "status": status,
        "orbit": orbit,
        "role_assignment": source_roles,
        "minimum_margin": candidate.minimum_margin,
        "minimum_by_group": minima,
        "cyclic_order": list(candidate.order),
        "parameters": candidate.parameters.tolist(),
        "supports": {name: sorted(value) for name, value in candidate.supports.items()},
        "outside_point_cap_assignment": point_caps,
        "represented_row_cap_hits": row_hits,
        "represented_closed_cap_cards": cap_cards,
        "represented_blocker_cap": {
            row_name: point_caps[f"blocker_{row_name}"] + " strict interior"
            for row_name in ("source", "target", "unused")
        },
        "represented_same_blocker_cap_support_hits": same_blocker_cap_hits,
        "represented_same_blocker_cap_bound": 2,
        "endpoint_sharpening": "not applicable: all three represented blockers are strict cap-interior points",
        "represented_row_physical_vertex_hits": {
            "source": 1,
            "target": 1,
            "unused": 0,
        },
        "points": {name: point.tolist() for name, point in candidate.points.items()},
        "encoded": [
            "kernel-derived card-three physical-apex distribution with one adjacent hit per side",
            "exact six-point physical cap and exact five-point physical-apex filter",
            "one of the first six checked source-identity orbits",
            "three named source-indexed complete critical rows and their blockers",
            "mutual omission and unused-row continuation omissions",
            "strict convex cyclic order",
            "nonobtuse support triangle and MEC containment",
            "both adjacent closed caps have cardinality at least six",
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
    parser.add_argument("--maxiter", type=int, default=1600)
    parser.add_argument("--popsize", type=int, default=28)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--seed", type=int, default=20260718)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = differential_evolution(
        objective,
        # Same parameterization as the original one-hit search.
        search_bounds(),
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
        bounds=search_bounds(),
        options={"maxiter": 30_000, "xtol": 1e-12, "ftol": 1e-14},
    )
    best = polished.x if objective(polished.x) < objective(result.x) else result.x
    payload = render(evaluate(best), args.orbit)
    text = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(text)
    print(text, end="")


if __name__ == "__main__":
    main()

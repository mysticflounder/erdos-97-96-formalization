#!/usr/bin/env python3
"""Bounded MEC/nonobtuse probe for the post-arc `(5,5,5)` round-19 residual.

This is a numerical discovery tool, not a proof.  It is deliberately bound to
the saved residual assignment and cyclic order.  The five row-equality classes
are realized by construction, while the optimizer searches the remaining five
continuous parameters and all sixteen circle-intersection branches for strict
convexity, pairwise distinctness, exact-row exclusions, containment in the
Moser circumdisk, and nonobtuseness of the fixed Moser triangle.

The exact parametrization is useful here because a failed Cartesian SLSQP run
can conflate equality residuals with an actual MEC/order obstruction.  Every
reported candidate is nevertheless rechecked directly from its coordinates.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import math
from pathlib import Path
from typing import Any, Sequence

import numpy as np
from scipy.optimize import minimize

import common_system_residual_optimizer as base


ROOT = Path(__file__).resolve().parents[2]
INPUT = ROOT / "scratch/atail-force/common_system_metric_probe.json"
OUTPUT = ROOT / "scratch/atail-force/residual_555_round19_mec_optimizer.json"

PROFILE = (5, 5, 5)
ROUND = 19
ASSIGNMENT_SHA256 = "ef90d3234ee6a42eaebe1728d27a771812e33262b8b098c457f295ef5314d96d"
ORDER = (0, 9, 10, 11, 1, 3, 4, 5, 2, 6, 7, 8)
ROWS = (
    (0, (1, 2, 3, 4)),
    (1, (0, 2, 6, 7)),
    (2, (3, 8, 9, 10)),
    (3, (1, 5, 6, 8)),
    (4, (0, 5, 9, 11)),
)
ENCODED_ROWS = tuple(
    f"{center}:{','.join(str(label) for label in support)}"
    for center, support in ROWS
)
MOSER_LABELS = (0, 1, 2)

CONVEX_MARGIN = 1e-3
DISTINCT_SQUARED_MARGIN = 1e-3
EXACT_ROW_GAP_MARGIN = 1e-7
MEC_TOLERANCE = 1e-8
ROW_EQUALITY_TOLERANCE = 1e-10
RNG_SEED = 555_019_9796


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def unit(angle: float) -> np.ndarray:
    return np.asarray([math.cos(angle), math.sin(angle)])


def squared_distance(left: np.ndarray, right: np.ndarray) -> float:
    delta = left - right
    return float(delta @ delta)


def cross(left: np.ndarray, right: np.ndarray) -> float:
    return float(left[0] * right[1] - left[1] * right[0])


def circle_intersection(
    center1: np.ndarray,
    radius1: float,
    center2: np.ndarray,
    radius2: float,
    branch: int,
) -> np.ndarray | None:
    """One of the two intersections, selected by oriented branch `-1`/`1`."""

    delta = center2 - center1
    distance = float(np.linalg.norm(delta))
    if distance < 1e-12:
        return None
    along = (radius1 * radius1 - radius2 * radius2 + distance * distance) / (
        2.0 * distance
    )
    height_squared = radius1 * radius1 - along * along
    if height_squared < -1e-10:
        return None
    foot = center1 + (along / distance) * delta
    normal = np.asarray([-delta[1], delta[0]]) / distance
    return foot + branch * math.sqrt(max(0.0, height_squared)) * normal


def points_of(
    values: Sequence[float], branches: tuple[int, int, int, int]
) -> dict[int, np.ndarray] | None:
    """Realize all five saved row classes exactly.

    Rows 0 and 1, together with the normalization `p0=(0,0)`, `p1=(1,0)`,
    force `p2` to be the upper equilateral point.  Points 3 and 4 lie on the
    unit circle about 0.  Points 5, 6, 8, and 9 are the four coupled circle
    intersections.  Points 7, 10, and 11 retain one angular parameter each.
    """

    angle3, angle4, angle7, angle10, angle11 = values
    points: dict[int, np.ndarray] = {
        0: np.asarray([0.0, 0.0]),
        1: np.asarray([1.0, 0.0]),
        2: np.asarray([0.5, math.sqrt(3.0) / 2.0]),
    }
    points[3] = unit(angle3)
    points[4] = unit(angle4)

    radius2 = float(np.linalg.norm(points[2] - points[3]))
    radius3 = float(np.linalg.norm(points[3] - points[1]))
    branch5, branch6, branch8, branch9 = branches

    point5 = circle_intersection(points[3], radius3, points[4], 1.0, branch5)
    point6 = circle_intersection(points[1], 1.0, points[3], radius3, branch6)
    point8 = circle_intersection(points[2], radius2, points[3], radius3, branch8)
    point9 = circle_intersection(points[2], radius2, points[4], 1.0, branch9)
    if any(point is None for point in (point5, point6, point8, point9)):
        return None

    assert point5 is not None
    assert point6 is not None
    assert point8 is not None
    assert point9 is not None
    points[5] = point5
    points[6] = point6
    points[8] = point8
    points[9] = point9
    points[7] = points[1] + unit(angle7)
    points[10] = points[2] + radius2 * unit(angle10)
    points[11] = points[4] + unit(angle11)
    return points


def circumcircle() -> tuple[np.ndarray, float]:
    center = np.asarray([0.5, math.sqrt(3.0) / 6.0])
    return center, 1.0 / 3.0


def row_equality_records(points: dict[int, np.ndarray]) -> list[dict[str, Any]]:
    records: list[dict[str, Any]] = []
    for center, support in ROWS:
        reference = squared_distance(points[center], points[support[0]])
        for label in support[1:]:
            residual = squared_distance(points[center], points[label]) - reference
            records.append(
                {
                    "center": center,
                    "reference_label": support[0],
                    "label": label,
                    "residual": residual,
                    "absolute_residual": abs(residual),
                }
            )
    return records


def convex_records(points: dict[int, np.ndarray]) -> list[dict[str, Any]]:
    records: list[dict[str, Any]] = []
    for index, left in enumerate(ORDER):
        right = ORDER[(index + 1) % len(ORDER)]
        edge = points[right] - points[left]
        for label in ORDER:
            if label in (left, right):
                continue
            raw_margin = cross(edge, points[label] - points[left])
            records.append(
                {
                    "edge": [left, right],
                    "label": label,
                    "raw_margin": raw_margin,
                    "required_margin": CONVEX_MARGIN,
                    "slack": raw_margin - CONVEX_MARGIN,
                }
            )
    return records


def disk_records(points: dict[int, np.ndarray]) -> list[dict[str, Any]]:
    center, radius_squared = circumcircle()
    return [
        {
            "label": label,
            "margin": radius_squared - squared_distance(points[label], center),
        }
        for label in ORDER
        if label not in MOSER_LABELS
    ]


def pairwise_records(points: dict[int, np.ndarray]) -> list[dict[str, Any]]:
    return [
        {
            "pair": [left, right],
            "squared_distance": squared_distance(points[left], points[right]),
        }
        for left in range(len(ORDER))
        for right in range(left + 1, len(ORDER))
    ]


def exact_gap_records(points: dict[int, np.ndarray]) -> list[dict[str, Any]]:
    records: list[dict[str, Any]] = []
    for center, support in ROWS:
        support_set = set(support)
        radius_squared = squared_distance(points[center], points[support[0]])
        for label in range(len(ORDER)):
            if label == center or label in support_set:
                continue
            gap = abs(squared_distance(points[center], points[label]) - radius_squared)
            records.append({"center": center, "label": label, "absolute_gap": gap})
    return records


def nonobtuse_records(points: dict[int, np.ndarray]) -> list[dict[str, Any]]:
    out: list[dict[str, Any]] = []
    for vertex, left, right in ((0, 1, 2), (1, 2, 0), (2, 0, 1)):
        inner_product = float(
            (points[left] - points[vertex]) @ (points[right] - points[vertex])
        )
        out.append({"vertex": vertex, "inner_product": inner_product})
    return out


def diagnostics(
    values: Sequence[float], branches: tuple[int, int, int, int]
) -> dict[str, Any]:
    points = points_of(values, branches)
    if points is None:
        return {
            "parameterization_valid": False,
            "optimization_slack": -10.0,
        }

    equalities = row_equality_records(points)
    convexity = convex_records(points)
    disk = disk_records(points)
    pairwise = pairwise_records(points)
    exact_gaps = exact_gap_records(points)
    nonobtuse = nonobtuse_records(points)

    worst_equality = max(equalities, key=lambda record: record["absolute_residual"])
    worst_convex = min(convexity, key=lambda record: record["slack"])
    worst_disk = min(disk, key=lambda record: record["margin"])
    worst_pairwise = min(pairwise, key=lambda record: record["squared_distance"])
    worst_exact_gap = min(exact_gaps, key=lambda record: record["absolute_gap"])
    worst_nonobtuse = min(nonobtuse, key=lambda record: record["inner_product"])

    optimization_slacks = [record["slack"] for record in convexity]
    optimization_slacks.extend(record["margin"] for record in disk)
    optimization_slacks.extend(
        record["squared_distance"] - DISTINCT_SQUARED_MARGIN
        for record in pairwise
    )
    optimization_slacks.extend(record["inner_product"] for record in nonobtuse)

    return {
        "parameterization_valid": True,
        "optimization_slack": min(optimization_slacks),
        "max_abs_row_equality_residual": worst_equality["absolute_residual"],
        "worst_row_equality": worst_equality,
        "min_convex_margin": worst_convex["raw_margin"],
        "worst_convex_constraint": worst_convex,
        "min_mec_disk_margin": worst_disk["margin"],
        "worst_mec_disk_constraint": worst_disk,
        "min_pairwise_squared_distance": worst_pairwise["squared_distance"],
        "worst_pairwise_constraint": worst_pairwise,
        "min_exact_squared_distance_gap": worst_exact_gap["absolute_gap"],
        "worst_exact_row_exclusion": worst_exact_gap,
        "min_nonobtuse_inner_product": worst_nonobtuse["inner_product"],
        "worst_nonobtuse_constraint": worst_nonobtuse,
        "circumcenter": circumcircle()[0].tolist(),
        "circumradius_squared": circumcircle()[1],
        "coordinates": {
            str(label): [float(coordinate) for coordinate in points[label]]
            for label in ORDER
        },
        "parameters": [float(value) for value in values],
        "branches": list(branches),
    }


def critical_slacks(
    values: Sequence[float], branches: tuple[int, int, int, int]
) -> np.ndarray:
    points = points_of(values, branches)
    if points is None:
        return np.asarray([-10.0])
    convexity = convex_records(points)
    disk = disk_records(points)
    pairwise = pairwise_records(points)
    nonobtuse = nonobtuse_records(points)
    return np.asarray(
        [record["slack"] for record in convexity]
        + [record["margin"] for record in disk]
        + [
            record["squared_distance"] - DISTINCT_SQUARED_MARGIN
            for record in pairwise
        ]
        + [record["inner_product"] for record in nonobtuse]
    )


def accepted(report: dict[str, Any]) -> bool:
    return bool(
        report["parameterization_valid"]
        and report["max_abs_row_equality_residual"] < ROW_EQUALITY_TOLERANCE
        and report["min_convex_margin"] > 0.9 * CONVEX_MARGIN
        and report["min_mec_disk_margin"] > -MEC_TOLERANCE
        and report["min_pairwise_squared_distance"]
        > 0.9 * DISTINCT_SQUARED_MARGIN
        and report["min_exact_squared_distance_gap"] > EXACT_ROW_GAP_MARGIN
        and report["min_nonobtuse_inner_product"] > -MEC_TOLERANCE
    )


def initial_parameters(
    rng: np.random.Generator,
    branches: tuple[int, int, int, int],
    start: int,
) -> np.ndarray:
    """Return a deterministic seed on the exact equality variety.

    There is no simultaneous four-intersection seed with both points 3 and 4
    on the order-compatible minor arc in increasing angular order.  Restricting
    the search to that arc would therefore bake the likely obstruction into the
    parametrization.  Instead we seed the unrestricted equality variety and
    ask the MEC/order margins to move it toward the required placement.
    """

    if start == 0:
        candidate = np.asarray([0.64, 0.077, 2.62, -1.57, -1.52])
        if points_of(candidate, branches) is not None:
            return candidate
    for _ in range(100_000):
        candidate = rng.uniform(-math.pi, math.pi, size=5)
        if points_of(candidate, branches) is not None:
            return candidate
    raise RuntimeError("could not sample a valid exact-row parameter seed")


def solve_full_exact_variety(starts: int) -> dict[str, Any]:
    if starts < 16:
        raise ValueError("at least 16 starts are required to cover all branches")

    branch_patterns = tuple(itertools.product((-1, 1), repeat=4))
    rng = np.random.default_rng(RNG_SEED)
    attempts: list[dict[str, Any]] = []
    best: dict[str, Any] | None = None

    for start in range(starts):
        branches = branch_patterns[start % len(branch_patterns)]
        initial = initial_parameters(rng, branches, start)
        initial_tau = -0.25
        augmented_initial = np.concatenate([initial, [initial_tau]])

        result = minimize(
            lambda augmented: -float(augmented[-1]),
            augmented_initial,
            method="SLSQP",
            bounds=(
                (-math.pi, math.pi),
                (-math.pi, math.pi),
                (-math.pi, math.pi),
                (-math.pi, math.pi),
                (-math.pi, math.pi),
                (-4.0, 1.0),
            ),
            constraints=(
                {
                    "type": "ineq",
                    "fun": lambda augmented, branch=branches: critical_slacks(
                        augmented[:-1], branch
                    )
                    - augmented[-1],
                },
            ),
            options={"ftol": 1e-12, "maxiter": 5000, "disp": False},
        )
        report = diagnostics(result.x[:-1], branches)
        is_accepted = accepted(report)
        attempt = {
            "start": start,
            "branches": list(branches),
            "optimizer_success": bool(result.success),
            "optimizer_status": int(result.status),
            "optimizer_message": str(result.message),
            "iterations": int(result.nit),
            "optimized_auxiliary_slack": float(result.x[-1]),
            "accepted": is_accepted,
            "diagnostics": report,
        }
        attempts.append(attempt)
        if best is None or report["optimization_slack"] > best["diagnostics"][
            "optimization_slack"
        ]:
            best = attempt
        if is_accepted:
            return {
                "status": "NUMERICAL_CANDIDATE_PASSES_ROUND19_MEC_AND_ORDER_CHECKS",
                "attempts_run": start + 1,
                "witness": attempt,
            }

    assert best is not None
    best_diagnostics = best["diagnostics"]
    candidate_obstructions = [
        {
            "family": "mec_disk",
            **best_diagnostics["worst_mec_disk_constraint"],
        },
        {
            "family": "strict_convex_order",
            **best_diagnostics["worst_convex_constraint"],
        },
    ]
    candidate_obstructions.sort(
        key=lambda item: item.get("margin", item.get("slack", 0.0))
    )
    return {
        "status": "NO_NUMERICAL_WITNESS_WITHIN_DETERMINISTIC_MULTISTART_BUDGET",
        "attempts_run": starts,
        "best_attempt": best,
        "proof_guidance": {
            "epistemic_status": "NUMERICAL_HEURISTIC_NOT_AN_INFEASIBILITY_PROOF",
            "smallest_mec_or_order_constraint": candidate_obstructions[0],
            "mec_and_order_bottlenecks": candidate_obstructions,
            "interpretation": (
                "Use the named negative margin only as a theorem-discovery hint; "
                "the bounded local search does not certify global infeasibility."
            ),
        },
        "attempt_summaries": [
            {
                "start": attempt["start"],
                "branches": attempt["branches"],
                "optimizer_success": attempt["optimizer_success"],
                "optimizer_status": attempt["optimizer_status"],
                "optimizer_message": attempt["optimizer_message"],
                "iterations": attempt["iterations"],
                "optimized_auxiliary_slack": attempt[
                    "optimized_auxiliary_slack"
                ],
                "accepted": attempt["accepted"],
                "optimization_slack": attempt["diagnostics"]["optimization_slack"],
                "min_mec_disk_margin": attempt["diagnostics"].get(
                    "min_mec_disk_margin"
                ),
                "min_convex_margin": attempt["diagnostics"].get(
                    "min_convex_margin"
                ),
            }
            for attempt in attempts
        ],
    }


def necessary_gate_records(angle3: float, angle4: float) -> list[dict[str, Any]]:
    """Necessary order/MEC and circle-intersection margins.

    If all carrier points lie in the circumdisk and have the saved order, the
    row-0 points 3 and 4 lie on the minor unit-circle arc from 1 to 2, with
    `0 < angle3 < angle4 < pi/3`.  The coupled points 5, 6, 8, and 9 can exist
    only if the corresponding two circles satisfy both triangle inequalities.
    These conditions use no unencoded all-center K4 information.
    """

    radius3 = 2.0 * math.sin(angle3 / 2.0)
    radius23 = 2.0 * math.sin((math.pi / 3.0 - angle3) / 2.0)
    distance34 = 2.0 * math.sin((angle4 - angle3) / 2.0)
    distance24 = 2.0 * math.sin((math.pi / 3.0 - angle4) / 2.0)
    return [
        {
            "name": "order_point3_after_point1",
            "family": "strict_convex_order_and_mec",
            "margin": angle3,
        },
        {
            "name": "order_point3_before_point4",
            "family": "strict_convex_order_and_mec",
            "margin": angle4 - angle3,
        },
        {
            "name": "order_point4_before_point2",
            "family": "strict_convex_order_and_mec",
            "margin": math.pi / 3.0 - angle4,
        },
        {
            "name": "point5_intersection_lower_triangle_inequality",
            "family": "rows_3_and_4",
            "margin": distance34 - abs(1.0 - radius3),
        },
        {
            "name": "point5_intersection_upper_triangle_inequality",
            "family": "rows_3_and_4",
            "margin": 1.0 + radius3 - distance34,
        },
        {
            "name": "point6_intersection_lower_triangle_inequality",
            "family": "rows_1_and_3",
            "margin": radius3 - abs(1.0 - radius3),
        },
        {
            "name": "point6_intersection_upper_triangle_inequality",
            "family": "rows_1_and_3",
            "margin": 1.0,
        },
        {
            "name": "point8_intersection_lower_triangle_inequality",
            "family": "rows_2_and_3",
            "margin": radius23 - abs(radius23 - radius3),
        },
        {
            "name": "point8_intersection_upper_triangle_inequality",
            "family": "rows_2_and_3",
            "margin": radius3,
        },
        {
            "name": "point9_intersection_lower_triangle_inequality",
            "family": "rows_2_and_4",
            "margin": distance24 - abs(1.0 - radius23),
        },
        {
            "name": "point9_intersection_upper_triangle_inequality",
            "family": "rows_2_and_4",
            "margin": 1.0 + radius23 - distance24,
        },
    ]


def necessary_gate_margins(values: Sequence[float]) -> np.ndarray:
    angle3, angle4 = values
    return np.asarray(
        [record["margin"] for record in necessary_gate_records(angle3, angle4)]
    )


def solve_necessary_gate(starts: int) -> dict[str, Any]:
    rng = np.random.default_rng(RNG_SEED + 1)
    attempts: list[dict[str, Any]] = []
    best: dict[str, Any] | None = None

    for start in range(starts):
        raw = sorted(rng.uniform(1e-4, math.pi / 3.0 - 1e-4, size=2))
        initial = np.asarray([raw[0], raw[1], -0.25])
        result = minimize(
            lambda augmented: -float(augmented[-1]),
            initial,
            method="SLSQP",
            bounds=(
                (1e-8, math.pi / 3.0 - 1e-8),
                (1e-8, math.pi / 3.0 - 1e-8),
                (-1.0, 1.0),
            ),
            constraints=(
                {
                    "type": "ineq",
                    "fun": lambda augmented: necessary_gate_margins(augmented[:2])
                    - augmented[-1],
                },
            ),
            options={"ftol": 1e-14, "maxiter": 2000, "disp": False},
        )
        records = necessary_gate_records(float(result.x[0]), float(result.x[1]))
        records.sort(key=lambda record: record["margin"])
        attempt = {
            "start": start,
            "optimizer_success": bool(result.success),
            "optimizer_status": int(result.status),
            "optimizer_message": str(result.message),
            "iterations": int(result.nit),
            "angle3_radians": float(result.x[0]),
            "angle4_radians": float(result.x[1]),
            "angle3_degrees": math.degrees(float(result.x[0])),
            "angle4_degrees": math.degrees(float(result.x[1])),
            "optimized_auxiliary_slack": float(result.x[-1]),
            "recomputed_minimum_margin": records[0]["margin"],
            "active_or_near_active_constraints": [
                record
                for record in records
                if record["margin"] <= records[0]["margin"] + 1e-7
            ],
            "all_constraint_margins": records,
        }
        attempts.append(attempt)
        if best is None or attempt["recomputed_minimum_margin"] > best[
            "recomputed_minimum_margin"
        ]:
            best = attempt

    assert best is not None

    # A dense deterministic scan is a second numerical implementation of the
    # same two-parameter max-min gate.  It is a crosscheck, not an exhaustive
    # proof over the continuum.
    grid_size = 401
    grid_best: dict[str, Any] | None = None
    for angle3 in np.linspace(1e-8, math.pi / 3.0 - 1e-8, grid_size):
        for angle4 in np.linspace(angle3, math.pi / 3.0 - 1e-8, grid_size):
            margin = float(np.min(necessary_gate_margins((angle3, angle4))))
            if grid_best is None or margin > grid_best["minimum_margin"]:
                grid_best = {
                    "angle3_radians": float(angle3),
                    "angle4_radians": float(angle4),
                    "minimum_margin": margin,
                }
    assert grid_best is not None
    return {
        "status": (
            "NECESSARY_MEC_ORDER_CIRCLE_GATE_NUMERICALLY_INFEASIBLE"
            if best["recomputed_minimum_margin"] < 0.0
            else "NECESSARY_GATE_NOT_EXCLUDED_NUMERICALLY"
        ),
        "attempts_run": starts,
        "best_attempt": best,
        "dense_grid_crosscheck": {
            "grid_size_per_axis": grid_size,
            **grid_best,
        },
        "attempt_summaries": [
            {
                key: attempt[key]
                for key in (
                    "start",
                    "optimizer_success",
                    "optimizer_status",
                    "optimizer_message",
                    "iterations",
                    "angle3_radians",
                    "angle4_radians",
                    "optimized_auxiliary_slack",
                    "recomputed_minimum_margin",
                )
            }
            for attempt in attempts
        ],
    }


def solve(starts: int) -> dict[str, Any]:
    gate = solve_necessary_gate(starts)
    if gate["best_attempt"]["recomputed_minimum_margin"] < 0.0:
        active = gate["best_attempt"]["active_or_near_active_constraints"]
        return {
            "status": "NO_NUMERICAL_WITNESS_NECESSARY_MEC_ORDER_GATE_FAILED",
            "attempts_run": starts,
            "necessary_gate": gate,
            "full_exact_variety_search_run": False,
            "proof_guidance": {
                "epistemic_status": "NUMERICAL_HEURISTIC_NOT_AN_INFEASIBILITY_PROOF",
                "smallest_badly_violated_constraints": active,
                "candidate_scalar_theorem": (
                    "For 0 < a < b < pi/3, the lower circle-intersection "
                    "triangle inequalities forced at labels 5, 6, and 9 cannot "
                    "all hold.  Here a and b are the row-0 angles of labels 3 "
                    "and 4 in the fixed equilateral Moser frame."
                ),
                "why_this_precedes_the_full_optimizer": (
                    "Every full MEC/nonobtuse/order witness must pass this "
                    "two-parameter necessary gate, so the remaining free "
                    "angles at labels 7, 10, and 11 cannot repair its failure."
                ),
            },
        }
    full = solve_full_exact_variety(starts)
    return {
        "status": full["status"],
        "attempts_run": starts,
        "necessary_gate": gate,
        "full_exact_variety_search_run": True,
        "full_search": full,
    }


def load_residual() -> dict[str, Any]:
    source = json.loads(INPUT.read_text(encoding="utf-8"))
    case = next(case for case in source["cases"] if tuple(case["profile"]) == PROFILE)
    residual = case["rounds"][-1]
    if residual["round"] != ROUND:
        raise AssertionError(f"expected residual round {ROUND}, got {residual['round']}")
    if residual["assignment_sha256"] != ASSIGNMENT_SHA256:
        raise AssertionError("round-19 assignment digest drifted")
    if tuple(residual["metric_rows"]) != ENCODED_ROWS:
        raise AssertionError("round-19 metric rows drifted")
    return residual


def build(starts: int) -> dict[str, Any]:
    residual = load_residual()
    return {
        "schema": "p97-atail-residual-555-round19-mec-parametric-probe-v1",
        "epistemic_status": "NUMERICAL_DISCOVERY_ONLY_NOT_A_PROOF",
        "input": str(INPUT.relative_to(ROOT)),
        "input_sha256": sha256(INPUT),
        "residual_binding": {
            "profile": list(PROFILE),
            "round": residual["round"],
            "assignment_sha256": residual["assignment_sha256"],
            "metric_rows": residual["metric_rows"],
            "saved_hull_order": list(ORDER),
            "moser_labels": list(MOSER_LABELS),
        },
        "scope": {
            "all_five_row_equalities_used_in_necessary_circle_gate": True,
            "full_coordinate_witness_constructed": False,
            "exact_row_exclusions_reached": False,
            "strict_convexity": True,
            "all_carrier_points_in_moser_circumdisk": True,
            "nonobtuse_moser_triangle": True,
            "pairwise_distinctness": True,
            "all_center_K4": False,
            "target_faithful": False,
            "producer_proved": False,
        },
        "algorithm": {
            "deterministic_seed": RNG_SEED,
            "multistart_budget": starts,
            "necessary_gate_continuous_parameter_count": 2,
            "necessary_gate_optimizer": "SciPy SLSQP max-min slack",
            "necessary_gate_dense_grid_size_per_axis": 401,
            "downstream_exact_variety_circle_intersection_branch_count": 16,
            "downstream_exact_variety_continuous_parameter_count": 5,
        },
        "thresholds": {
            "row_equality_tolerance": ROW_EQUALITY_TOLERANCE,
            "convex_margin": CONVEX_MARGIN,
            "pairwise_squared_distance_margin": DISTINCT_SQUARED_MARGIN,
            "exact_row_gap_margin": EXACT_ROW_GAP_MARGIN,
            "mec_acceptance_tolerance": MEC_TOLERANCE,
        },
        "result": solve(starts),
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--starts", type=int, default=32)
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    if args.starts < 16:
        parser.error("--starts must be at least 16")
    if args.write and args.check:
        parser.error("--write and --check are mutually exclusive")

    report = build(args.starts)
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.write:
        OUTPUT.write_text(rendered, encoding="utf-8")
    elif args.check:
        if not OUTPUT.exists() or OUTPUT.read_text(encoding="utf-8") != rendered:
            raise AssertionError("saved round-19 MEC report is stale")
    else:
        print(rendered, end="")

    if args.write or args.check:
        print(
            json.dumps(
                {
                    "output": str(OUTPUT.relative_to(ROOT)),
                    "status": report["result"]["status"],
                    "attempts_run": report["result"]["attempts_run"],
                },
                indent=2,
                sort_keys=True,
            )
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

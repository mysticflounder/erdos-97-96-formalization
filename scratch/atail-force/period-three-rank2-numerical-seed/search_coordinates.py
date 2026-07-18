#!/usr/bin/env python3
"""Numerical rank-two probe for the fully disjoint period-three cell.

This is theorem discovery only.  A successful run supplies planar coordinates
and then independently substitutes them into every encoded constraint.  A
failed multi-start run is *not* an infeasibility certificate.

The role names and common boundary word intentionally match
``period-three-full-role-identity-quotient/probe_fully_disjoint.py``.  Unlike
that QF_LRA probe, all distances here are squared Euclidean distances between
one common family of points in R^2.
"""

from __future__ import annotations

import argparse
from dataclasses import asdict, dataclass
import json
from itertools import combinations
from math import cos, pi, sin
from multiprocessing import get_context
from pathlib import Path
from typing import Iterable

import numpy as np
from scipy.optimize import least_squares


FIRST = "first"
SECOND = "second"
SURPLUS = "surplus"

T0 = ("q", "w", "t0i", "t0s")
T1 = ("t1i0", "t1i1", "t1i2", "t1o")
CYCLE = ("c0", "c1", "c2")
PHYSICAL_FIVE = (*CYCLE, "nS", "nI")
BLOCKERS = ("b0", "b1", "b2")
TARGET_PAIRS = (("x0", "y0"), ("x1", "y1"), ("x2", "y2"))

SURPLUS_PRIVATE = ("t0s", "nS")
FIRST_PRIVATE = (
    "q", "w", "t0i", "t1i0", "t1i1", "t1i2", "nI",
    "x0", "y0", "x1", "y1", "x2", "y2",
)
PHYSICAL_PRIVATE = ("c0", "b0", "b2", "c1", "b1", "c2", "t1o")
BOUNDARY = (
    FIRST,
    *SURPLUS_PRIVATE,
    SECOND,
    *FIRST_PRIVATE,
    SURPLUS,
    *PHYSICAL_PRIVATE,
)
POINTS = BOUNDARY
INDEX = {name: index for index, name in enumerate(POINTS)}
FREE = tuple(name for name in POINTS if name not in {FIRST, SECOND})


@dataclass(frozen=True)
class Margins:
    # Strictness is scale-free mathematically, but FIRST--SECOND is normalized
    # to length one.  These small positive margins avoid excluding legitimate
    # 25-vertex configurations merely because several vertices occupy a short
    # boundary arc.
    pair_sq: float = 1.0e-8
    orientation: float = 1.0e-10
    support_gap_sq: float = 1.0e-8
    radius_gap_sq: float = 1.0e-8


@dataclass
class Diagnostics:
    maximum_row_equality_residual: float
    minimum_pair_squared_distance: float
    minimum_edge_orientation: float
    minimum_exact_support_squared_gap: float
    second_apex_qw_squared_gap: float
    first_apex_radius_squared_gap: float
    objective_norm: float
    equality_count: int
    inequality_count: int
    mec_triangle_nondegenerate: bool
    mec_all_points_inside_slack: float | None
    support_triangle_min_nonobtuse_slack: float | None


def squared_distance(coords: np.ndarray, a: str, b: str) -> float:
    delta = coords[INDEX[a]] - coords[INDEX[b]]
    return float(delta @ delta)


def cross(a: np.ndarray, b: np.ndarray) -> float:
    return float(a[0] * b[1] - a[1] * b[0])


def unpack(vector: np.ndarray) -> np.ndarray:
    coords = np.empty((len(POINTS), 2), dtype=float)
    coords[INDEX[FIRST]] = (-0.5, 0.0)
    coords[INDEX[SECOND]] = (0.5, 0.0)
    free_coords = vector.reshape((len(FREE), 2))
    for name, point in zip(FREE, free_coords, strict=True):
        coords[INDEX[name]] = point
    return coords


def pack(coords: np.ndarray) -> np.ndarray:
    return np.asarray([coords[INDEX[name]] for name in FREE]).reshape(-1)


def regular_seed(noise: float, seed: int) -> np.ndarray:
    """A strictly convex seed normalized at FIRST=(-.5,0), SECOND=(.5,0)."""

    n = len(POINTS)
    raw = np.asarray([
        (cos(2.0 * pi * index / n), sin(2.0 * pi * index / n))
        for index in range(n)
    ])
    z0 = complex(*raw[INDEX[FIRST]])
    z1 = complex(*raw[INDEX[SECOND]])
    multiplier = 1.0 / (z1 - z0)
    normalized = np.asarray([
        (complex(*(point)) - z0) * multiplier - 0.5
        for point in raw
    ])
    coords = np.column_stack((normalized.real, normalized.imag))
    rng = np.random.default_rng(seed)
    for name in FREE:
        coords[INDEX[name]] += rng.normal(scale=noise, size=2)
    return coords


def row_equalities(coords: np.ndarray) -> list[float]:
    residuals: list[float] = []

    def same_radius(center: str, support: tuple[str, ...]) -> None:
        base = squared_distance(coords, center, support[0])
        residuals.extend(
            squared_distance(coords, center, point) - base
            for point in support[1:]
        )

    same_radius(FIRST, T0)
    same_radius(FIRST, T1)
    same_radius(SECOND, PHYSICAL_FIVE)
    for row in range(3):
        support = (CYCLE[row], CYCLE[(row + 1) % 3], *TARGET_PAIRS[row])
        same_radius(BLOCKERS[row], support)
    assert len(residuals) == 19
    return residuals


def exact_support_gaps(coords: np.ndarray) -> list[float]:
    """Absolute squared-distance gaps for the four exact shell surfaces.

    T0 and T1 are selected four-point rows, not exact support classes, so no
    non-support disequality is asserted for them.
    """

    gaps: list[float] = []

    def add(center: str, support: tuple[str, ...]) -> None:
        radius_sq = squared_distance(coords, center, support[0])
        excluded = set(support) | {center}
        gaps.extend(
            abs(squared_distance(coords, center, point) - radius_sq)
            for point in POINTS
            if point not in excluded
        )

    add(SECOND, PHYSICAL_FIVE)
    for row in range(3):
        add(
            BLOCKERS[row],
            (CYCLE[row], CYCLE[(row + 1) % 3], *TARGET_PAIRS[row]),
        )
    return gaps


def edge_orientations(coords: np.ndarray) -> list[float]:
    """All named vertices lie strictly left of every directed boundary edge."""

    values: list[float] = []
    n = len(POINTS)
    for index, a in enumerate(POINTS):
        b = POINTS[(index + 1) % n]
        pa, pb = coords[INDEX[a]], coords[INDEX[b]]
        edge = pb - pa
        for point in POINTS:
            if point in {a, b}:
                continue
            values.append(cross(edge, coords[INDEX[point]] - pa))
    return values


def pair_squared_distances(coords: np.ndarray) -> list[float]:
    return [
        squared_distance(coords, a, b)
        for a, b in combinations(POINTS, 2)
    ]


def radius_gaps(coords: np.ndarray) -> tuple[float, float]:
    first_gap = abs(
        squared_distance(coords, FIRST, T0[0])
        - squared_distance(coords, FIRST, T1[0])
    )
    second_gap = abs(
        squared_distance(coords, SECOND, "q")
        - squared_distance(coords, SECOND, "w")
    )
    return first_gap, second_gap


def hinge(values: Iterable[float], lower: float) -> list[float]:
    # Unitless relative violations keep a tiny geometric margin from becoming
    # numerically invisible next to the squared-distance equalities.
    return [max(0.0, (lower - value) / lower) for value in values]


def objective(
    vector: np.ndarray,
    margins: Margins,
    anchor: np.ndarray,
    anchor_weight: float,
    equality_scale: float = 1.0e-4,
    inequality_weight: float = 1.0,
) -> np.ndarray:
    coords = unpack(vector)
    equalities = row_equalities(coords)
    first_gap, second_gap = radius_gaps(coords)
    residuals = [value / equality_scale for value in equalities]
    inequalities: list[float] = []
    inequalities.extend(hinge(pair_squared_distances(coords), margins.pair_sq))
    inequalities.extend(hinge(edge_orientations(coords), margins.orientation))
    inequalities.extend(hinge(exact_support_gaps(coords), margins.support_gap_sq))
    inequalities.extend(hinge((first_gap, second_gap), margins.radius_gap_sq))
    residuals.extend(inequality_weight * value for value in inequalities)
    if anchor_weight:
        residuals.extend(anchor_weight * (vector - anchor))
    return np.asarray(residuals)


def circumcircle_diagnostics(coords: np.ndarray) -> tuple[bool, float | None, float | None]:
    a = coords[INDEX[FIRST]]
    b = coords[INDEX[SECOND]]
    c = coords[INDEX[SURPLUS]]
    matrix = 2.0 * np.asarray((b - a, c - a))
    rhs = np.asarray((b @ b - a @ a, c @ c - a @ a))
    determinant = float(np.linalg.det(matrix))
    if abs(determinant) < 1.0e-12:
        return False, None, None
    center = np.linalg.solve(matrix, rhs)
    radius_sq = float((a - center) @ (a - center))
    inside_slack = min(
        radius_sq - float((point - center) @ (point - center))
        for point in coords
    )
    side_sq = (
        squared_distance(coords, FIRST, SECOND),
        squared_distance(coords, SECOND, SURPLUS),
        squared_distance(coords, SURPLUS, FIRST),
    )
    nonobtuse_slack = min(
        side_sq[(index + 1) % 3] + side_sq[(index + 2) % 3] - side_sq[index]
        for index in range(3)
    )
    return True, inside_slack, nonobtuse_slack


def diagnostics(coords: np.ndarray, margins: Margins, norm: float) -> Diagnostics:
    equalities = row_equalities(coords)
    pair_sq = pair_squared_distances(coords)
    orientations = edge_orientations(coords)
    support_gaps = exact_support_gaps(coords)
    first_gap, second_gap = radius_gaps(coords)
    nondegenerate, mec_slack, nonobtuse_slack = circumcircle_diagnostics(coords)
    return Diagnostics(
        maximum_row_equality_residual=max(map(abs, equalities)),
        minimum_pair_squared_distance=min(pair_sq),
        minimum_edge_orientation=min(orientations),
        minimum_exact_support_squared_gap=min(support_gaps),
        second_apex_qw_squared_gap=second_gap,
        first_apex_radius_squared_gap=first_gap,
        objective_norm=norm,
        equality_count=len(equalities),
        inequality_count=len(pair_sq) + len(orientations) + len(support_gaps) + 2,
        mec_triangle_nondegenerate=nondegenerate,
        mec_all_points_inside_slack=mec_slack,
        support_triangle_min_nonobtuse_slack=nonobtuse_slack,
    )


def is_verified(diag: Diagnostics, margins: Margins) -> bool:
    return (
        diag.maximum_row_equality_residual <= 1.0e-9
        and diag.minimum_pair_squared_distance >= 0.9 * margins.pair_sq
        and diag.minimum_edge_orientation >= 0.9 * margins.orientation
        and diag.minimum_exact_support_squared_gap >= 0.9 * margins.support_gap_sq
        and diag.second_apex_qw_squared_gap >= 0.9 * margins.radius_gap_sq
        and diag.first_apex_radius_squared_gap >= 0.9 * margins.radius_gap_sq
    )


def run_attempt(payload: tuple[int, int]) -> dict[str, object]:
    attempt, max_nfev = payload
    noise = 0.015 + 0.005 * (attempt % 5)
    coords = regular_seed(noise=noise, seed=attempt)
    vector = pack(coords)
    anchor = vector.copy()
    phases = (
        # Lexicographic continuation: keep the initially strict convex
        # polygon away from collapse while the large row residuals decrease.
        (Margins(1e-10, 1e-12, 1e-10, 1e-10), 1.0e-3, 1.0, 1.0e3),
        (Margins(1e-9, 1e-11, 1e-9, 1e-9), 1.0e-5, 1.0e-2, 1.0e3),
        (Margins(), 0.0, 1.0e-4, 1.0e3),
    )
    evaluations = 0
    message = ""
    status = 0
    for phase_margins, anchor_weight, equality_scale, inequality_weight in phases:
        result = least_squares(
            objective,
            vector,
            args=(
                phase_margins, anchor, anchor_weight,
                equality_scale, inequality_weight,
            ),
            method="trf",
            jac="2-point",
            x_scale="jac",
            ftol=1.0e-13,
            xtol=1.0e-13,
            gtol=1.0e-13,
            max_nfev=max_nfev,
            verbose=0,
        )
        vector = result.x
        evaluations += result.nfev
        message = result.message
        status = result.status
    coords = unpack(vector)
    residual = objective(vector, Margins(), anchor, 0.0, 1.0e-4, 1.0)
    diag = diagnostics(coords, Margins(), float(np.linalg.norm(residual)))
    return {
        "attempt": attempt,
        "noise": noise,
        "optimizer_status": status,
        "optimizer_message": message,
        "function_evaluations": evaluations,
        "verified_coordinate_hit": is_verified(diag, Margins()),
        "diagnostics": asdict(diag),
        "coordinates": {
            name: [float(value) for value in coords[INDEX[name]]]
            for name in POINTS
        },
    }


def quality(result: dict[str, object]) -> tuple[float, float]:
    diag = result["diagnostics"]
    assert isinstance(diag, dict)
    return (
        0.0 if result["verified_coordinate_hit"] else 1.0,
        float(diag["objective_norm"]),
    )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--attempts", type=int, default=24)
    parser.add_argument("--jobs", type=int, default=1)
    parser.add_argument("--max-nfev", type=int, default=2500)
    parser.add_argument(
        "--output",
        type=Path,
        default=Path(__file__).with_name("RESULT.json"),
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    payloads = [(attempt, args.max_nfev) for attempt in range(args.attempts)]
    if args.jobs == 1:
        results = [run_attempt(payload) for payload in payloads]
    else:
        with get_context("spawn").Pool(processes=args.jobs) as pool:
            results = list(pool.imap_unordered(run_attempt, payloads))
    results.sort(key=quality)
    best = results[0]
    verified = [result for result in results if result["verified_coordinate_hit"]]
    output = {
        "epistemic_status": (
            "NUMERICAL_COORDINATE_HIT_NOT_PROOF_NOT_MEC_NOT_CSS_NOT_LEAN"
            if verified
            else "NO_NUMERICAL_HIT_WITHIN_RECORDED_BUDGET_NOT_UNSAT"
        ),
        "cell": "fully_disjoint_25_role_unequal_radius",
        "normalization": {FIRST: [-0.5, 0.0], SECOND: [0.5, 0.0]},
        "margins": asdict(Margins()),
        "attempt_count": args.attempts,
        "jobs": args.jobs,
        "max_nfev_per_phase": args.max_nfev,
        "verified_hit_count": len(verified),
        "best": best,
        "attempt_summaries": [
            {
                key: result[key]
                for key in (
                    "attempt", "noise", "optimizer_status",
                    "function_evaluations", "verified_coordinate_hit", "diagnostics",
                )
            }
            for result in results
        ],
    }
    args.output.write_text(json.dumps(output, indent=2) + "\n")
    print(json.dumps({key: value for key, value in output.items() if key != "attempt_summaries"}, indent=2))
    print(f"wrote {args.output}")


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""SLSQP feasibility cross-check for the planar fully-disjoint cell.

Unlike the penalty searches, this keeps convexity/separation as explicit
nonlinear constraints while solving the 19 squared-distance equalities.
Exact-support and radius disequalities are generic open conditions, so they
are checked independently on every candidate instead of prematurely fixing
one of their many sign branches.  Failure remains only a bounded numerical
result.
"""

from __future__ import annotations

import argparse
from dataclasses import asdict
import json
from math import pi, sin
from multiprocessing import get_context
from pathlib import Path

import numpy as np
from scipy.optimize import minimize

from search_coordinates import (
    BLOCKERS,
    CYCLE,
    FIRST,
    INDEX,
    Margins,
    PHYSICAL_FIVE,
    POINTS,
    SECOND,
    T0,
    T1,
    TARGET_PAIRS,
    diagnostics,
    edge_orientations,
    exact_support_gaps,
    is_verified,
    pack,
    pair_squared_distances,
    radius_gaps,
    regular_seed,
    row_equalities,
    squared_distance,
    unpack,
)


# The first recorded run used affine-diversified exact-core starts.  The
# complete-row companion switches this off so its eleven exact equalities are
# retained at the warm start.
AFFINE_EXACT_SEEDS = True


def signed_gap_values(coords: np.ndarray) -> list[float]:
    values: list[float] = []

    def add(center: str, support: tuple[str, ...]) -> None:
        radius_sq = squared_distance(coords, center, support[0])
        excluded = set(support) | {center}
        values.extend(
            squared_distance(coords, center, point) - radius_sq
            for point in POINTS if point not in excluded
        )

    add(SECOND, PHYSICAL_FIVE)
    for row in range(3):
        add(
            BLOCKERS[row],
            (CYCLE[row], CYCLE[(row + 1) % 3], *TARGET_PAIRS[row]),
        )
    return values


def exact_cycle_core_seed(attempt: int) -> np.ndarray:
    """Embed the exact rational cycle/blocker/physical-five core.

    The mapping is

      SECOND=o, nI=left, (c0,c1,c2)=(q0,q1,q2),
      (b0,b1,b2)=(blocker0,blocker1,blocker2), nS=right.

    This matches the fixed word after deleting the still-unknown private
    T0/T1/reverse targets.  Missing vertices are inserted on small outward
    bulges of the exact convex boundary edges.
    """

    def unit(t: float) -> np.ndarray:
        return np.asarray(((1.0 - t * t) / (1.0 + t * t), 2.0 * t / (1.0 + t * t)))

    o = np.asarray((0.0, 0.0))
    left = unit(0.0)
    right = unit(163.0 / 192.0)
    source0 = unit(4.0 / 231.0)
    source1 = unit(123.0 / 184.0)
    source2 = unit(3.0 / 4.0)
    blocker0 = (45.0 / 86.0) * (source0 + source1)
    blocker1 = (251.0 / 500.0) * (source1 + source2)
    blocker2 = (271.0 / 500.0) * (source2 + source0)
    delta = source0 - blocker0
    angle_t = -47.0 / 149.0
    cosine = (1.0 - angle_t * angle_t) / (1.0 + angle_t * angle_t)
    sine = 2.0 * angle_t / (1.0 + angle_t * angle_t)
    rotation = np.asarray(((cosine, -sine), (sine, cosine)))
    known_target = blocker0 + rotation @ delta

    coords = np.full((len(POINTS), 2), np.nan)
    keys = {
        2: right,
        3: o,
        4: known_target,
        10: left,
        18: source0,
        19: blocker0,
        20: blocker2,
        21: source1,
        22: blocker1,
        23: source2,
    }
    for index, point in keys.items():
        coords[index] = point

    rng = np.random.default_rng(20_000 + attempt)
    known = sorted(keys)
    for start_pos, start in enumerate(known):
        end = known[(start_pos + 1) % len(known)]
        gap = (end - start - 1) % len(POINTS)
        if gap == 0:
            continue
        a = coords[start]
        b = coords[end]
        chord = b - a
        length = float(np.linalg.norm(chord))
        left_normal = np.asarray((-chord[1], chord[0])) / length
        bulge = (0.003 + 0.001 * (attempt % 5)) * length
        for offset in range(1, gap + 1):
            index = (start + offset) % len(POINTS)
            t = offset / (gap + 1)
            jitter = rng.normal(scale=0.015 / (gap + 1))
            t = min(0.98, max(0.02, t + jitter))
            coords[index] = (1.0 - t) * a + t * b - bulge * sin(pi * t) * left_normal

    assert not np.isnan(coords).any()
    # Normalize at the actual FIRST role, preserving orientation.
    z_first = complex(*coords[INDEX[FIRST]])
    z_second = complex(*coords[INDEX[SECOND]])
    normalized = np.asarray([
        (complex(*point) - z_first) / (z_second - z_first) - 0.5
        for point in coords
    ])
    result = np.column_stack((normalized.real, normalized.imag))
    assert min(edge_orientations(result)) > Margins().orientation
    return result


def run_attempt(payload: tuple[int, int]) -> dict[str, object]:
    attempt, maxiter = payload
    margins = Margins()
    use_exact_seed = attempt % 2 == 0
    coords0 = (
        exact_cycle_core_seed(attempt)
        if use_exact_seed
        else regular_seed(noise=0.002 + 0.0005 * (attempt % 5), seed=attempt)
    )
    rng = np.random.default_rng(10_000 + attempt)
    if use_exact_seed and not AFFINE_EXACT_SEEDS:
        shear = 0.0
        vertical_scale = 1.0
    else:
        shear = float(rng.uniform(-1.25, 1.25))
        vertical_scale = float(np.exp(rng.uniform(np.log(0.45), np.log(2.25))))
    old_y = coords0[:, 1].copy()
    coords0[:, 0] += shear * old_y
    coords0[:, 1] = vertical_scale * old_y
    assert min(edge_orientations(coords0)) > margins.orientation
    vector0 = pack(coords0)
    def equality(vector: np.ndarray) -> np.ndarray:
        return np.asarray(row_equalities(unpack(vector)))

    def inequality(vector: np.ndarray) -> np.ndarray:
        coords = unpack(vector)
        return np.concatenate((
            np.asarray(pair_squared_distances(coords)) - margins.pair_sq,
            np.asarray(edge_orientations(coords)) - margins.orientation,
        ))

    # A tiny anchor objective selects one point from the positive-dimensional
    # equality variety; feasibility is entirely in the constraints.
    result = minimize(
        lambda vector: 1e-6 * float((vector - vector0) @ (vector - vector0)),
        vector0,
        method="SLSQP",
        bounds=[(-10.0, 10.0)] * len(vector0),
        constraints=(
            {"type": "eq", "fun": equality},
            {"type": "ineq", "fun": inequality},
        ),
        options={"maxiter": maxiter, "ftol": 1e-12, "disp": False},
    )
    coords = unpack(result.x)
    ineq = inequality(result.x)
    equal = equality(result.x)
    residual_norm = float(np.linalg.norm(np.minimum(ineq, 0.0))) + float(np.linalg.norm(equal))
    diag = diagnostics(coords, margins, residual_norm)
    verified = is_verified(diag, margins)
    return {
        "attempt": attempt,
        "initial_seed": "exact_cycle_core" if use_exact_seed else "affine_regular",
        "initial_shear": shear,
        "initial_vertical_scale": vertical_scale,
        "optimizer_success": bool(result.success),
        "optimizer_status": int(result.status),
        "optimizer_message": str(result.message),
        "iterations": int(result.nit),
        "function_evaluations": int(result.nfev),
        "minimum_signed_constraint": float(np.min(ineq)),
        "maximum_equality_residual": float(np.max(np.abs(equal))),
        "verified_coordinate_hit": verified,
        "diagnostics": asdict(diag),
        "coordinates": {
            name: [float(value) for value in coords[INDEX[name]]]
            for name in POINTS
        },
    }


def radius_gaps_signed(coords: np.ndarray) -> tuple[float, float]:
    return (
        squared_distance(coords, FIRST, T0[0])
        - squared_distance(coords, FIRST, T1[0]),
        squared_distance(coords, SECOND, "q")
        - squared_distance(coords, SECOND, "w"),
    )


def quality(result: dict[str, object]) -> tuple[float, float]:
    return (
        0.0 if result["verified_coordinate_hit"] else 1.0,
        max(0.0, -float(result["minimum_signed_constraint"]))
        + float(result["maximum_equality_residual"]),
    )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--attempts", type=int, default=12)
    parser.add_argument("--jobs", type=int, default=1)
    parser.add_argument("--maxiter", type=int, default=1000)
    parser.add_argument(
        "--output", type=Path,
        default=Path(__file__).with_name("CONSTRAINED_RESULT.json"),
    )
    args = parser.parse_args()
    payloads = [(attempt, args.maxiter) for attempt in range(args.attempts)]
    if args.jobs == 1:
        results = []
        for payload in payloads:
            result = run_attempt(payload)
            results.append(result)
            if result["verified_coordinate_hit"]:
                break
    else:
        with get_context("spawn").Pool(processes=args.jobs) as pool:
            results = []
            for result in pool.imap_unordered(run_attempt, payloads):
                results.append(result)
                if result["verified_coordinate_hit"]:
                    pool.terminate()
                    break
    results.sort(key=quality)
    verified = [result for result in results if result["verified_coordinate_hit"]]
    output = {
        "epistemic_status": (
            "NUMERICAL_COORDINATE_HIT_NOT_PROOF_NOT_MEC_NOT_CSS_NOT_LEAN"
            if verified else "NO_NUMERICAL_HIT_WITHIN_RECORDED_BUDGET_NOT_UNSAT"
        ),
        "method": "SLSQP_hard_row_equalities_convex_order_and_separation",
        "scheduled_attempt_count": args.attempts,
        "completed_attempt_count": len(results),
        "remaining_attempt_seeds": sorted(
            set(range(args.attempts)) - {int(result["attempt"]) for result in results}
        ),
        "jobs": args.jobs,
        "max_iterations": args.maxiter,
        "verified_hit_count": len(verified),
        "margins": asdict(Margins()),
        "best": results[0],
        "attempt_summaries": [
            {key: result[key] for key in (
                "attempt", "optimizer_success", "optimizer_status", "iterations",
                "function_evaluations", "minimum_signed_constraint",
                "maximum_equality_residual", "verified_coordinate_hit", "diagnostics",
            )}
            for result in results
        ],
    }
    args.output.write_text(json.dumps(output, indent=2) + "\n")
    print(json.dumps({key: value for key, value in output.items() if key != "attempt_summaries"}, indent=2))
    print(f"wrote {args.output}")


if __name__ == "__main__":
    main()

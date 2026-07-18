#!/usr/bin/env python3
"""Interior-point search in a 27-parameter exact-row chart.

All nineteen same-radius equations hold by construction:

* each first-apex selected row is four polar points on one circle;
* the physical exact five are five polar points on one second-apex circle;
* each blocker is on the perpendicular bisector of its incident source pair;
* each reverse target is polar about its blocker at the incident-source radius.

Thus the optimizer cannot trade row accuracy against polygon collapse.  It
uses SciPy ``trust-constr`` for the 575 strict convex-order inequalities, 300
pair separations, and one fixed-sign branch of each required radius gap.
Exact-support gaps are independently postchecked.  A bounded no-hit is not an
infeasibility result.
"""

from __future__ import annotations

import argparse
from dataclasses import asdict
import importlib.util
import json
from math import atan2, cos, log, pi, sin
from multiprocessing import get_context, TimeoutError as MultiprocessingTimeoutError
import os
from pathlib import Path
import signal
import sys
import time

import numpy as np
from scipy.optimize import Bounds, NonlinearConstraint, minimize


HERE = Path(__file__).resolve().parent
ATAIL = HERE.parent
NUMERICAL = ATAIL / "period-three-rank2-numerical-seed"
sys.path.insert(0, str(NUMERICAL))
import search_coordinates as model  # noqa: E402


def load_complete_module():
    path = NUMERICAL / "search_complete_row_word.py"
    spec = importlib.util.spec_from_file_location("complete_row_word_parametric", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    module.configure()
    return module


complete = load_complete_module()
BOUNDARY = tuple(complete.BOUNDARY)
POINTS = BOUNDARY
INDEX = {name: index for index, name in enumerate(POINTS)}
MARGINS = model.Margins()
RADIUS_SIGN_BRANCHES = ((-1.0, -1.0), (-1.0, 1.0), (1.0, -1.0), (1.0, 1.0))

PARAMETER_COUNT = 27
T0_LOG_RADIUS = 0
T0_ANGLES = slice(1, 5)
T1_LOG_RADIUS = 5
T1_ANGLES = slice(6, 10)
PHYSICAL_LOG_RADIUS = 10
PHYSICAL_ANGLES = slice(11, 16)
BLOCKER_PARAMETERS = slice(16, 19)
TARGET_ANGLES = slice(19, 25)
SURPLUS_COORDINATES = slice(25, 27)

EXACT_SUBSEQUENCE = (
    model.SECOND,
    "x0",
    "y0",
    "nI",
    "c0",
    "b0",
    "b2",
    "c1",
    "b1",
    "c2",
    "nS",
)


def unit(angle: float) -> np.ndarray:
    return np.asarray((cos(angle), sin(angle)))


def angle_of(delta: np.ndarray) -> float:
    return atan2(float(delta[1]), float(delta[0]))


def parameters_from_coordinates(coords: np.ndarray) -> np.ndarray:
    vector = np.zeros(PARAMETER_COUNT)

    def fit_circle(center: str, support: tuple[str, ...], log_index: int, angle_slice: slice) -> None:
        center_point = coords[INDEX[center]]
        deltas = np.asarray([coords[INDEX[name]] - center_point for name in support])
        radii = np.linalg.norm(deltas, axis=1)
        # Project an arbitrary seed row to its closest common radius.  For the
        # physical row this is already exact at the complete-row seed.
        radius = float(np.exp(np.mean(np.log(radii))))
        vector[log_index] = log(radius)
        vector[angle_slice] = [angle_of(delta) for delta in deltas]

    fit_circle(model.FIRST, model.T0, T0_LOG_RADIUS, T0_ANGLES)
    fit_circle(model.FIRST, model.T1, T1_LOG_RADIUS, T1_ANGLES)
    fit_circle(
        model.SECOND,
        model.PHYSICAL_FIVE,
        PHYSICAL_LOG_RADIUS,
        PHYSICAL_ANGLES,
    )

    for row in range(3):
        source_a = coords[INDEX[model.CYCLE[row]]]
        source_b = coords[INDEX[model.CYCLE[(row + 1) % 3]]]
        blocker = coords[INDEX[model.BLOCKERS[row]]]
        chord = source_b - source_a
        perpendicular = np.asarray((-chord[1], chord[0]))
        midpoint = 0.5 * (source_a + source_b)
        vector[BLOCKER_PARAMETERS.start + row] = float(
            (blocker - midpoint) @ perpendicular / (perpendicular @ perpendicular)
        )
        for target_index, target in enumerate(model.TARGET_PAIRS[row]):
            vector[TARGET_ANGLES.start + 2 * row + target_index] = angle_of(
                coords[INDEX[target]] - blocker
            )

    vector[SURPLUS_COORDINATES] = coords[INDEX[model.SURPLUS]]
    return vector


def coordinates_from_parameters(vector: np.ndarray) -> np.ndarray:
    coords = np.full((len(POINTS), 2), np.nan)
    coords[INDEX[model.FIRST]] = (-0.5, 0.0)
    coords[INDEX[model.SECOND]] = (0.5, 0.0)

    def place_circle(center: str, support: tuple[str, ...], log_index: int, angle_slice: slice) -> None:
        center_point = coords[INDEX[center]]
        radius = float(np.exp(vector[log_index]))
        for name, angle in zip(support, vector[angle_slice], strict=True):
            coords[INDEX[name]] = center_point + radius * unit(float(angle))

    place_circle(model.FIRST, model.T0, T0_LOG_RADIUS, T0_ANGLES)
    place_circle(model.FIRST, model.T1, T1_LOG_RADIUS, T1_ANGLES)
    place_circle(
        model.SECOND,
        model.PHYSICAL_FIVE,
        PHYSICAL_LOG_RADIUS,
        PHYSICAL_ANGLES,
    )

    for row in range(3):
        source_a = coords[INDEX[model.CYCLE[row]]]
        source_b = coords[INDEX[model.CYCLE[(row + 1) % 3]]]
        chord = source_b - source_a
        perpendicular = np.asarray((-chord[1], chord[0]))
        blocker = 0.5 * (source_a + source_b) + float(
            vector[BLOCKER_PARAMETERS.start + row]
        ) * perpendicular
        coords[INDEX[model.BLOCKERS[row]]] = blocker
        radius = float(np.linalg.norm(blocker - source_a))
        for target_index, target in enumerate(model.TARGET_PAIRS[row]):
            angle = float(vector[TARGET_ANGLES.start + 2 * row + target_index])
            coords[INDEX[target]] = blocker + radius * unit(angle)

    coords[INDEX[model.SURPLUS]] = vector[SURPLUS_COORDINATES]
    if np.isnan(coords).any():
        raise AssertionError("parametric chart left an unassigned role")
    return coords


def signed_radius_gaps(coords: np.ndarray) -> tuple[float, float]:
    return (
        model.squared_distance(coords, model.FIRST, model.T0[0])
        - model.squared_distance(coords, model.FIRST, model.T1[0]),
        model.squared_distance(coords, model.SECOND, "q")
        - model.squared_distance(coords, model.SECOND, "w"),
    )


def hard_values(vector: np.ndarray, radius_signs: tuple[float, float]) -> np.ndarray:
    coords = coordinates_from_parameters(vector)
    gaps = signed_radius_gaps(coords)
    return np.concatenate((
        np.asarray(model.edge_orientations(coords)),
        np.asarray(model.pair_squared_distances(coords)),
        np.asarray((radius_signs[0] * gaps[0], radius_signs[1] * gaps[1])),
    ))


def hard_lower_bounds() -> np.ndarray:
    return np.concatenate((
        np.full(575, MARGINS.orientation),
        np.full(300, MARGINS.pair_sq),
        np.full(2, MARGINS.radius_gap_sq),
    ))


def substitution(vector: np.ndarray) -> tuple[dict[str, object], bool]:
    coords = coordinates_from_parameters(vector)
    orientations = model.edge_orientations(coords)
    equalities = model.row_equalities(coords)
    violation_norm = float(np.linalg.norm(equalities)) + float(
        np.linalg.norm(
            np.minimum(np.asarray(orientations) - MARGINS.orientation, 0.0)
        )
    )
    diagnostics = model.diagnostics(coords, MARGINS, violation_norm)
    return asdict(diagnostics), model.is_verified(diagnostics, MARGINS)


def exact_complete_seed(attempt: int) -> tuple[np.ndarray, dict[str, object]]:
    source_coords = complete.exact_complete_row_seed(attempt)
    vector = parameters_from_coordinates(source_coords)
    chart_coords = coordinates_from_parameters(vector)
    errors = {
        name: float(np.linalg.norm(chart_coords[INDEX[name]] - source_coords[INDEX[name]]))
        for name in EXACT_SUBSEQUENCE
    }
    equality_error = max(map(abs, model.row_equalities(chart_coords)))
    smoke = {
        "maximum_exact_eleven_point_coordinate_error": max(errors.values()),
        "maximum_row_equality_residual": equality_error,
        "initial_minimum_edge_orientation": min(model.edge_orientations(chart_coords)),
        "exact_subsequence_coordinate_errors": errors,
    }
    # Physical five, all three blockers, and the complete reverse-0 row are
    # all retained by the fitted chart.  The only projected roles are the
    # previously unassigned first-apex supports and reverse-1/2 targets.
    if smoke["maximum_exact_eleven_point_coordinate_error"] > 2.0e-12:
        raise AssertionError("parametric chart failed to retain exact complete-row seed")
    if equality_error > 2.0e-12:
        raise AssertionError("parametric chart does not enforce all row equalities")
    return vector, smoke


def initial_parameters(attempt: int) -> tuple[np.ndarray, str]:
    if attempt % 2 == 0:
        vector, _ = exact_complete_seed(attempt)
        seed_kind = "exact_complete_b0_row_parametric"
    else:
        coords = model.regular_seed(
            noise=0.001 + 0.0002 * (attempt % 5),
            seed=90_000 + attempt,
        )
        rng = np.random.default_rng(91_000 + attempt)
        shear = float(rng.uniform(-1.25, 1.25))
        vertical_scale = float(np.exp(rng.uniform(np.log(0.4), np.log(2.5))))
        old_y = coords[:, 1].copy()
        coords[:, 0] += shear * old_y
        coords[:, 1] = vertical_scale * old_y
        vector = parameters_from_coordinates(coords)
        seed_kind = "projected_affine_regular_parametric"

    rng = np.random.default_rng(92_000 + attempt)
    # Retain exact warm starts on the first even attempt.  Later starts explore
    # nearby angle/blocker branches while remaining on the exact row variety.
    if attempt >= 2:
        vector[T0_ANGLES] += rng.normal(scale=0.04, size=4)
        vector[T1_ANGLES] += rng.normal(scale=0.04, size=4)
        vector[PHYSICAL_ANGLES] += rng.normal(scale=0.015, size=5)
        vector[BLOCKER_PARAMETERS] += rng.normal(scale=0.03, size=3)
        vector[TARGET_ANGLES] += rng.normal(scale=0.05, size=6)
        vector[SURPLUS_COORDINATES] += rng.normal(scale=0.02, size=2)
    return vector, seed_kind


class AttemptTimeout(Exception):
    pass


def _alarm_handler(_signum, _frame):
    raise AttemptTimeout


def parameter_bounds(anchor: np.ndarray) -> Bounds:
    lower = np.full(PARAMETER_COUNT, -np.inf)
    upper = np.full(PARAMETER_COUNT, np.inf)
    for index in (T0_LOG_RADIUS, T1_LOG_RADIUS, PHYSICAL_LOG_RADIUS):
        lower[index] = -6.0
        upper[index] = 4.0
    for angle_slice in (T0_ANGLES, T1_ANGLES, PHYSICAL_ANGLES, TARGET_ANGLES):
        lower[angle_slice] = anchor[angle_slice] - 2.0 * pi
        upper[angle_slice] = anchor[angle_slice] + 2.0 * pi
    lower[BLOCKER_PARAMETERS] = -50.0
    upper[BLOCKER_PARAMETERS] = 50.0
    lower[SURPLUS_COORDINATES] = -12.0
    upper[SURPLUS_COORDINATES] = 12.0
    return Bounds(lower, upper, keep_feasible=False)


def run_attempt(payload: tuple[int, int, float]) -> dict[str, object]:
    attempt, maxiter, timeout_seconds = payload
    anchor, seed_kind = initial_parameters(attempt)
    # These are genuine disequalities, so a source-complete numerical audit
    # must search all four sign components rather than inherit whichever signs
    # happen to occur at the warm start.
    radius_signs = RADIUS_SIGN_BRANCHES[attempt % len(RADIUS_SIGN_BRANCHES)]
    start = time.monotonic()
    last_vector = anchor.copy()
    callback_hit: np.ndarray | None = None
    objective_weight = 1.0e-8
    stop_reason = "optimizer_return"

    def objective(vector: np.ndarray) -> float:
        delta = vector - anchor
        return 0.5 * objective_weight * float(delta @ delta)

    def gradient(vector: np.ndarray) -> np.ndarray:
        return objective_weight * (vector - anchor)

    def callback(vector: np.ndarray, _state=None) -> bool:
        nonlocal last_vector, callback_hit
        last_vector = vector.copy()
        values = hard_values(vector, radius_signs)
        lower = hard_lower_bounds()
        if float(np.min(values - 0.9 * lower)) >= 0.0:
            _, verified = substitution(vector)
            if verified:
                callback_hit = vector.copy()
                return True
        return False

    constraint = NonlinearConstraint(
        lambda vector: hard_values(vector, radius_signs),
        hard_lower_bounds(),
        np.full(877, np.inf),
        jac="2-point",
        # Most projected parametric seeds are not convex, so the first phase
        # must approach the hard feasible set from outside.  Once feasible,
        # accepted convergence is always checked against the hard surface.
        keep_feasible=False,
    )

    previous_handler = signal.signal(signal.SIGALRM, _alarm_handler)
    signal.setitimer(signal.ITIMER_REAL, timeout_seconds)
    try:
        result = minimize(
            objective,
            anchor,
            method="trust-constr",
            jac=gradient,
            hess=lambda _vector: objective_weight * np.eye(PARAMETER_COUNT),
            bounds=parameter_bounds(anchor),
            constraints=(constraint,),
            callback=callback,
            options={
                "maxiter": maxiter,
                "gtol": 1.0e-10,
                "xtol": 1.0e-11,
                "barrier_tol": 1.0e-11,
                "initial_constr_penalty": 1000.0,
                "initial_barrier_parameter": 0.05,
                "initial_barrier_tolerance": 0.05,
                "factorization_method": "SVDFactorization",
                "verbose": 0,
            },
        )
        vector = callback_hit if callback_hit is not None else result.x
        status = int(result.status)
        success = bool(result.success)
        message = str(result.message)
        iterations = int(result.nit)
        evaluations = int(result.nfev)
        if callback_hit is not None:
            stop_reason = "substitution_verified_hit"
    except AttemptTimeout:
        vector = last_vector
        status = -2
        success = False
        message = f"per-start wall timeout after {timeout_seconds:g} seconds"
        iterations = -1
        evaluations = -1
        stop_reason = "wall_timeout_last_callback_iterate"
    except Exception as error:
        vector = last_vector
        status = -3
        success = False
        message = f"{type(error).__name__}: {error}"
        iterations = -1
        evaluations = -1
        stop_reason = "optimizer_exception_last_callback_iterate"
    finally:
        signal.setitimer(signal.ITIMER_REAL, 0.0)
        signal.signal(signal.SIGALRM, previous_handler)

    diagnostics, verified = substitution(vector)
    coords = coordinates_from_parameters(vector)
    hard = hard_values(vector, radius_signs)
    lower = hard_lower_bounds()
    return {
        "attempt": attempt,
        "initial_seed": seed_kind,
        "optimizer_success": success,
        "optimizer_status": status,
        "optimizer_message": message,
        "stop_reason": stop_reason,
        "iterations": iterations,
        "function_evaluations": evaluations,
        "wall_seconds": time.monotonic() - start,
        "radius_gap_sign_branch": [int(sign) for sign in radius_signs],
        "minimum_hard_constraint_slack": float(np.min(hard - lower)),
        "minimum_hard_orientation_slack": float(np.min(hard[:575] - lower[:575])),
        "minimum_hard_pair_separation_slack": float(
            np.min(hard[575:875] - lower[575:875])
        ),
        "minimum_hard_radius_gap_slack": float(np.min(hard[875:] - lower[875:])),
        "maximum_constructed_row_equality_residual": float(
            np.max(np.abs(model.row_equalities(coords)))
        ),
        "verified_coordinate_hit": verified,
        "diagnostics": diagnostics,
        "parameters": [float(value) for value in vector],
        "coordinates": {
            name: [float(value) for value in coords[INDEX[name]]]
            for name in POINTS
        },
    }


def quality(result: dict[str, object]) -> tuple[float, float, float]:
    return (
        0.0 if result["verified_coordinate_hit"] else 1.0,
        max(0.0, -float(result["minimum_hard_constraint_slack"])),
        float(result["wall_seconds"]),
    )


def emit_progress(
    path: Path,
    event: str,
    started: float,
    total: int,
    completed_attempts: set[int],
    **details: object,
) -> None:
    record = {
        "event": event,
        "wall_unix_seconds": time.time(),
        "elapsed_seconds": time.monotonic() - started,
        "completed": len(completed_attempts),
        "total": total,
        "remaining_attempt_seeds": sorted(set(range(total)) - completed_attempts),
        **details,
    }
    encoded = json.dumps(record, separators=(",", ":"))
    with path.open("a") as handle:
        handle.write(encoded + "\n")
        handle.flush()
        os.fsync(handle.fileno())
    print(encoded, flush=True)


def attempt_progress_fields(result: dict[str, object]) -> dict[str, object]:
    diagnostics = result["diagnostics"]
    return {
        "attempt": result["attempt"],
        "initial_seed": result["initial_seed"],
        "stop_reason": result["stop_reason"],
        "worker_wall_seconds": result["wall_seconds"],
        "minimum_hard_constraint_slack": result["minimum_hard_constraint_slack"],
        "minimum_hard_orientation_slack": result["minimum_hard_orientation_slack"],
        "minimum_hard_pair_separation_slack": result[
            "minimum_hard_pair_separation_slack"
        ],
        "minimum_hard_radius_gap_slack": result["minimum_hard_radius_gap_slack"],
        "minimum_exact_support_squared_gap": diagnostics[
            "minimum_exact_support_squared_gap"
        ],
        "maximum_constructed_row_equality_residual": result[
            "maximum_constructed_row_equality_residual"
        ],
        "verified_coordinate_hit": result["verified_coordinate_hit"],
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--attempts", type=int, default=48)
    parser.add_argument("--jobs", type=int, default=24)
    parser.add_argument("--maxiter", type=int, default=500)
    parser.add_argument("--timeout-seconds", type=float, default=300.0)
    parser.add_argument("--output", type=Path, default=HERE / "PARAMETRIC_RESULT.json")
    parser.add_argument("--progress", type=Path, default=HERE / "PROGRESS.jsonl")
    args = parser.parse_args()

    _, exact_smoke = exact_complete_seed(0)
    payloads = [
        (attempt, args.maxiter, args.timeout_seconds)
        for attempt in range(args.attempts)
    ]
    results: list[dict[str, object]] = []
    completed_attempts: set[int] = set()
    run_started = time.monotonic()
    args.progress.write_text("")
    emit_progress(
        args.progress,
        "run_start",
        run_started,
        args.attempts,
        completed_attempts,
        jobs=args.jobs,
        maximum_iterations_per_start=args.maxiter,
        wall_timeout_seconds_per_start=args.timeout_seconds,
    )
    if args.jobs == 1:
        for payload in payloads:
            result = run_attempt(payload)
            results.append(result)
            completed_attempts.add(int(result["attempt"]))
            emit_progress(
                args.progress,
                "attempt_complete",
                run_started,
                args.attempts,
                completed_attempts,
                **attempt_progress_fields(result),
            )
            if result["verified_coordinate_hit"]:
                emit_progress(
                    args.progress,
                    "early_hit",
                    run_started,
                    args.attempts,
                    completed_attempts,
                    attempt=result["attempt"],
                )
                break
    else:
        with get_context("spawn").Pool(processes=args.jobs) as pool:
            iterator = pool.imap_unordered(run_attempt, payloads)
            while len(results) < args.attempts:
                try:
                    result = iterator.next(timeout=15.0)
                except MultiprocessingTimeoutError:
                    emit_progress(
                        args.progress,
                        "heartbeat",
                        run_started,
                        args.attempts,
                        completed_attempts,
                        jobs=args.jobs,
                    )
                    continue
                results.append(result)
                completed_attempts.add(int(result["attempt"]))
                emit_progress(
                    args.progress,
                    "attempt_complete",
                    run_started,
                    args.attempts,
                    completed_attempts,
                    **attempt_progress_fields(result),
                )
                if result["verified_coordinate_hit"]:
                    emit_progress(
                        args.progress,
                        "early_hit",
                        run_started,
                        args.attempts,
                        completed_attempts,
                        attempt=result["attempt"],
                    )
                    pool.terminate()
                    break

    emit_progress(
        args.progress,
        "run_complete",
        run_started,
        args.attempts,
        completed_attempts,
        verified_hit_count=sum(
            1 for result in results if result["verified_coordinate_hit"]
        ),
    )

    results.sort(key=quality)
    verified = [result for result in results if result["verified_coordinate_hit"]]
    output = {
        "epistemic_status": (
            "NUMERICAL_COORDINATE_HIT_NOT_PROOF_NOT_MEC_NOT_CSS_NOT_LEAN"
            if verified else "NO_NUMERICAL_HIT_WITHIN_RECORDED_BUDGET_NOT_UNSAT"
        ),
        "method": "27_parameter_exact_row_chart_plus_trust_constr_interior_point_convexity",
        "boundary": list(BOUNDARY),
        "parameter_count": PARAMETER_COUNT,
        "constructed_row_equality_count": 19,
        "hard_convex_order_constraint_count": 575,
        "hard_pair_separation_constraint_count": 300,
        "hard_fixed_sign_radius_gap_constraint_count": 2,
        "exact_complete_seed_smoke": exact_smoke,
        "scheduled_attempt_count": args.attempts,
        "completed_attempt_count": len(results),
        "remaining_attempt_seeds": sorted(
            set(range(args.attempts))
            - {int(result["attempt"]) for result in results}
        ),
        "jobs": args.jobs,
        "maximum_iterations_per_start": args.maxiter,
        "wall_timeout_seconds_per_start": args.timeout_seconds,
        "postchecked_constraint_counts": {
            "exact_support_gaps": 79,
        },
        "margins": asdict(MARGINS),
        "verified_hit_count": len(verified),
        "best": results[0] if results else None,
        "attempt_summaries": [
            {
                key: result[key]
                for key in (
                    "attempt",
                    "initial_seed",
                    "optimizer_success",
                    "optimizer_status",
                    "optimizer_message",
                    "stop_reason",
                    "iterations",
                    "function_evaluations",
                    "wall_seconds",
                    "radius_gap_sign_branch",
                    "minimum_hard_constraint_slack",
                    "minimum_hard_orientation_slack",
                    "minimum_hard_pair_separation_slack",
                    "minimum_hard_radius_gap_slack",
                    "maximum_constructed_row_equality_residual",
                    "verified_coordinate_hit",
                    "diagnostics",
                )
            }
            for result in results
        ],
    }
    args.output.write_text(json.dumps(output, indent=2) + "\n")
    print(
        json.dumps(
            {key: value for key, value in output.items() if key != "attempt_summaries"},
            indent=2,
        )
    )
    print(f"wrote {args.output}", flush=True)


if __name__ == "__main__":
    main()

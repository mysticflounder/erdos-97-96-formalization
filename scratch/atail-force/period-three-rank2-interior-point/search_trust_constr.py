#!/usr/bin/env python3
"""Interior-point coordinate probe for the complete-row-compatible cell.

This is a theorem-discovery experiment, not an infeasibility procedure.  It
uses SciPy's ``trust-constr`` interior-point method with the nineteen row
equalities and all strict convex-order inequalities as hard nonlinear
constraints.  This is deliberately independent of the earlier SLSQP and
least-squares penalty searches.

Every candidate is rechecked by direct substitution into the shared complete
coordinate ledger.  A bounded no-hit is only empirical.
"""

from __future__ import annotations

import argparse
from dataclasses import asdict
from fractions import Fraction
import importlib.util
import json
from multiprocessing import get_context
from pathlib import Path
import signal
import sys
import time

import numpy as np
from scipy.optimize import Bounds, NonlinearConstraint, minimize
from scipy.sparse import csr_matrix, eye


HERE = Path(__file__).resolve().parent
ATAIL = HERE.parent
NUMERICAL = ATAIL / "period-three-rank2-numerical-seed"
SEED_CELL = ATAIL / "period-three-seed-compatible-cell"

# The existing scripts use ordinary sibling imports.  Put their directory at
# the front, then load the cell-specific wrapper by path.
sys.path.insert(0, str(NUMERICAL))
import search_coordinates as model  # noqa: E402


def load_complete_module():
    path = NUMERICAL / "search_complete_row_word.py"
    spec = importlib.util.spec_from_file_location("complete_row_word", path)
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
FREE = tuple(name for name in POINTS if name not in {model.FIRST, model.SECOND})
FREE_INDEX = {name: index for index, name in enumerate(FREE)}
VARIABLE_COUNT = 2 * len(FREE)
MARGINS = model.Margins()


def variable_slice(name: str) -> slice | None:
    index = FREE_INDEX.get(name)
    return None if index is None else slice(2 * index, 2 * index + 2)


def add_gradient(row: np.ndarray, name: str, value: np.ndarray) -> None:
    target = variable_slice(name)
    if target is not None:
        row[target] += value


ROW_SPECS: tuple[tuple[str, str, str], ...] = tuple(
    (center, point, support[0])
    for center, support in (
        (model.FIRST, model.T0),
        (model.FIRST, model.T1),
        (model.SECOND, model.PHYSICAL_FIVE),
        *(
            (
                model.BLOCKERS[row],
                (
                    model.CYCLE[row],
                    model.CYCLE[(row + 1) % 3],
                    *model.TARGET_PAIRS[row],
                ),
            )
            for row in range(3)
        ),
    )
    for point in support[1:]
)
assert len(ROW_SPECS) == 19


ORIENTATION_SPECS: tuple[tuple[str, str, str], ...] = tuple(
    (a, POINTS[(index + 1) % len(POINTS)], point)
    for index, a in enumerate(POINTS)
    for point in POINTS
    if point not in {a, POINTS[(index + 1) % len(POINTS)]}
)
assert len(ORIENTATION_SPECS) == 575


def equality_values(vector: np.ndarray) -> np.ndarray:
    coords = model.unpack(vector)
    values = []
    for center, point, base in ROW_SPECS:
        values.append(
            model.squared_distance(coords, center, point)
            - model.squared_distance(coords, center, base)
        )
    return np.asarray(values)


def equality_jacobian(vector: np.ndarray) -> csr_matrix:
    coords = model.unpack(vector)
    result = np.zeros((len(ROW_SPECS), VARIABLE_COUNT))
    for row_index, (center, point, base) in enumerate(ROW_SPECS):
        c = coords[INDEX[center]]
        p = coords[INDEX[point]]
        b = coords[INDEX[base]]
        # grad (|c-p|^2 - |c-b|^2)
        add_gradient(result[row_index], center, 2.0 * (b - p))
        add_gradient(result[row_index], point, 2.0 * (p - c))
        add_gradient(result[row_index], base, 2.0 * (c - b))
    return csr_matrix(result)


def orientation_values(vector: np.ndarray) -> np.ndarray:
    coords = model.unpack(vector)
    values = []
    for a, b, point in ORIENTATION_SPECS:
        pa = coords[INDEX[a]]
        pb = coords[INDEX[b]]
        pp = coords[INDEX[point]]
        values.append(model.cross(pb - pa, pp - pa))
    return np.asarray(values)


def orientation_jacobian(vector: np.ndarray) -> csr_matrix:
    coords = model.unpack(vector)
    result = np.zeros((len(ORIENTATION_SPECS), VARIABLE_COUNT))
    for row_index, (a, b, point) in enumerate(ORIENTATION_SPECS):
        pa = coords[INDEX[a]]
        pb = coords[INDEX[b]]
        pp = coords[INDEX[point]]
        add_gradient(
            result[row_index], a,
            np.asarray((pb[1] - pp[1], pp[0] - pb[0])),
        )
        add_gradient(
            result[row_index], b,
            np.asarray((pp[1] - pa[1], pa[0] - pp[0])),
        )
        add_gradient(
            result[row_index], point,
            np.asarray((pa[1] - pb[1], pb[0] - pa[0])),
        )
    return csr_matrix(result)


def exact_seed_smoke() -> dict[str, object]:
    """Exact-Fraction audit of the eleven-point cell mapping."""

    data = json.loads((SEED_CELL / "SEED.json").read_text())
    subsequence = tuple(data["exact_seed_subsequence"])
    boundary_positions = {name: index for index, name in enumerate(BOUNDARY)}
    start = boundary_positions[subsequence[0]]
    offsets = tuple(
        (boundary_positions[name] - start) % len(BOUNDARY)
        for name in subsequence
    )
    order_preserved = list(offsets) == sorted(offsets) and len(set(offsets)) == len(offsets)

    coordinates = {
        name: tuple(Fraction(value) for value in pair)
        for name, pair in data["exact_seed_coordinates"].items()
    }

    def squared_distance(a: str, b: str) -> Fraction:
        return sum(
            (coordinates[a][axis] - coordinates[b][axis]) ** 2
            for axis in range(2)
        )

    def cross(a: tuple[Fraction, Fraction], b: tuple[Fraction, Fraction]) -> Fraction:
        return a[0] * b[1] - a[1] * b[0]

    orientations: list[Fraction] = []
    for index, a in enumerate(subsequence):
        b = subsequence[(index + 1) % len(subsequence)]
        edge = tuple(coordinates[b][axis] - coordinates[a][axis] for axis in range(2))
        for point in subsequence:
            if point in {a, b}:
                continue
            offset = tuple(
                coordinates[point][axis] - coordinates[a][axis]
                for axis in range(2)
            )
            orientations.append(cross(edge, offset))

    physical = tuple(data["exact_seed_equalities"]["physical_support"])
    physical_distances = tuple(squared_distance(model.SECOND, p) for p in physical)
    reverse0 = tuple(data["exact_seed_equalities"]["complete_reverse0_support"])
    reverse0_distances = tuple(squared_distance("b0", p) for p in reverse0)
    source_pair_errors = tuple(
        squared_distance(model.BLOCKERS[row], model.CYCLE[row])
        - squared_distance(
            model.BLOCKERS[row], model.CYCLE[(row + 1) % 3]
        )
        for row in range(3)
    )

    passed = (
        order_preserved
        and min(orientations) > 0
        and len(set(physical_distances)) == 1
        and len(set(reverse0_distances)) == 1
        and all(error == 0 for error in source_pair_errors)
    )
    if not passed:
        raise AssertionError("exact complete-row seed/cell smoke test failed")
    return {
        "passed": True,
        "boundary_offsets": list(offsets),
        "minimum_exact_subsequence_orientation": str(min(orientations)),
        "physical_five_equal": True,
        "complete_reverse0_equal": True,
        "all_three_source_pairs_equal": True,
    }


def initial_coordinates(attempt: int) -> tuple[np.ndarray, str]:
    if attempt % 2 == 0:
        return complete.exact_complete_row_seed(attempt), "exact_complete_b0_row"

    # A strictly convex, normalized regular polygon with a small accepted
    # perturbation.  Random affine shear/scale then creates diverse strict
    # convex starts while keeping FIRST and SECOND fixed.
    noise = 0.001 + 0.00025 * (attempt % 5)
    coords = model.regular_seed(noise=noise, seed=70_000 + attempt)
    rng = np.random.default_rng(80_000 + attempt)
    shear = float(rng.uniform(-1.5, 1.5))
    vertical_scale = float(np.exp(rng.uniform(np.log(0.35), np.log(2.8))))
    old_y = coords[:, 1].copy()
    coords[:, 0] += shear * old_y
    coords[:, 1] = vertical_scale * old_y
    if min(model.edge_orientations(coords)) <= MARGINS.orientation:
        # The affine image of an unperturbed regular polygon is always safe.
        coords = model.regular_seed(noise=0.0, seed=70_000 + attempt)
        old_y = coords[:, 1].copy()
        coords[:, 0] += shear * old_y
        coords[:, 1] = vertical_scale * old_y
    assert min(model.edge_orientations(coords)) > MARGINS.orientation
    return coords, "strict_affine_regular"


class AttemptTimeout(Exception):
    pass


def _alarm_handler(_signum, _frame):
    raise AttemptTimeout


def substitute(vector: np.ndarray, objective_norm: float) -> tuple[dict[str, object], bool]:
    coords = model.unpack(vector)
    diag = model.diagnostics(coords, MARGINS, objective_norm)
    return asdict(diag), model.is_verified(diag, MARGINS)


def run_attempt(payload: tuple[int, int, float]) -> dict[str, object]:
    attempt, maxiter, timeout_seconds = payload
    coordinates0, seed_kind = initial_coordinates(attempt)
    vector0 = model.pack(coordinates0)
    start = time.monotonic()
    stop_reason = "optimizer_return"
    callback_hit: np.ndarray | None = None

    objective_weight = 1.0e-6

    def objective(vector: np.ndarray) -> float:
        delta = vector - vector0
        return 0.5 * objective_weight * float(delta @ delta)

    def gradient(vector: np.ndarray) -> np.ndarray:
        return objective_weight * (vector - vector0)

    def callback(vector: np.ndarray, _state=None) -> bool:
        nonlocal callback_hit
        eq_max = float(np.max(np.abs(equality_values(vector))))
        orient_min = float(np.min(orientation_values(vector)))
        if eq_max <= 1.0e-9 and orient_min >= 0.9 * MARGINS.orientation:
            _, verified = substitute(vector, float(np.linalg.norm(vector - vector0)))
            if verified:
                callback_hit = vector.copy()
                return True
        return False

    equality_constraint = NonlinearConstraint(
        equality_values, 0.0, 0.0, jac=equality_jacobian,
    )
    orientation_constraint = NonlinearConstraint(
        orientation_values,
        np.full(len(ORIENTATION_SPECS), MARGINS.orientation),
        np.full(len(ORIENTATION_SPECS), np.inf),
        jac=orientation_jacobian,
        # Every seed is already strictly convex.  This asks trust-constr to
        # keep every accepted iterate on that side of the boundary rather
        # than approaching the row variety through collapsed polygons.
        keep_feasible=True,
    )

    previous_handler = signal.signal(signal.SIGALRM, _alarm_handler)
    signal.setitimer(signal.ITIMER_REAL, timeout_seconds)
    try:
        result = minimize(
            objective,
            vector0,
            method="trust-constr",
            jac=gradient,
            hess=lambda _vector: objective_weight * eye(VARIABLE_COUNT, format="csr"),
            bounds=Bounds(-12.0, 12.0, keep_feasible=True),
            constraints=(equality_constraint, orientation_constraint),
            callback=callback,
            options={
                "maxiter": maxiter,
                "gtol": 1.0e-10,
                "xtol": 1.0e-11,
                "barrier_tol": 1.0e-11,
                "initial_constr_penalty": 100.0,
                "initial_barrier_parameter": 0.05,
                "initial_barrier_tolerance": 0.05,
                "sparse_jacobian": True,
                "factorization_method": "AugmentedSystem",
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
        # SciPy does not expose its current iterate after an asynchronous
        # timeout.  The initial point is retained explicitly and labeled; it
        # cannot be mistaken for an optimizer result.
        vector = vector0
        status = -2
        success = False
        message = f"per-start wall timeout after {timeout_seconds:g} seconds"
        iterations = -1
        evaluations = -1
        stop_reason = "wall_timeout_no_iterate_recovered"
    except Exception as error:  # preserve a bounded campaign on one bad cell
        vector = vector0
        status = -3
        success = False
        message = f"{type(error).__name__}: {error}"
        iterations = -1
        evaluations = -1
        stop_reason = "optimizer_exception_no_iterate_recovered"
    finally:
        signal.setitimer(signal.ITIMER_REAL, 0.0)
        signal.signal(signal.SIGALRM, previous_handler)

    equality = equality_values(vector)
    orientation = orientation_values(vector)
    objective_norm = float(np.linalg.norm(equality)) + float(
        np.linalg.norm(np.minimum(orientation - MARGINS.orientation, 0.0))
    )
    diagnostics, verified = substitute(vector, objective_norm)
    coords = model.unpack(vector)
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
        "minimum_hard_orientation_slack": float(np.min(orientation) - MARGINS.orientation),
        "maximum_hard_equality_residual": float(np.max(np.abs(equality))),
        "verified_coordinate_hit": verified,
        "diagnostics": diagnostics,
        "coordinates": {
            name: [float(value) for value in coords[INDEX[name]]]
            for name in POINTS
        },
    }


def quality(result: dict[str, object]) -> tuple[float, float, float]:
    return (
        0.0 if result["verified_coordinate_hit"] else 1.0,
        max(0.0, -float(result["minimum_hard_orientation_slack"]))
        + float(result["maximum_hard_equality_residual"]),
        float(result["wall_seconds"]),
    )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--attempts", type=int, default=48)
    parser.add_argument("--jobs", type=int, default=24)
    parser.add_argument("--maxiter", type=int, default=400)
    parser.add_argument("--timeout-seconds", type=float, default=300.0)
    parser.add_argument("--output", type=Path, default=HERE / "RESULT.json")
    args = parser.parse_args()

    smoke = exact_seed_smoke()
    payloads = [
        (attempt, args.maxiter, args.timeout_seconds)
        for attempt in range(args.attempts)
    ]
    results: list[dict[str, object]] = []
    if args.jobs == 1:
        for payload in payloads:
            result = run_attempt(payload)
            results.append(result)
            if result["verified_coordinate_hit"]:
                break
    else:
        with get_context("spawn").Pool(processes=args.jobs) as pool:
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
        "method": "scipy_trust_constr_interior_point_hard_19_rows_hard_convex_order",
        "boundary": list(BOUNDARY),
        "exact_seed_smoke": smoke,
        "scheduled_attempt_count": args.attempts,
        "completed_attempt_count": len(results),
        "remaining_attempt_seeds": sorted(
            set(range(args.attempts))
            - {int(result["attempt"]) for result in results}
        ),
        "jobs": args.jobs,
        "maximum_iterations_per_start": args.maxiter,
        "wall_timeout_seconds_per_start": args.timeout_seconds,
        "hard_constraint_counts": {
            "row_equalities": len(ROW_SPECS),
            "strict_convex_order": len(ORIENTATION_SPECS),
        },
        "postchecked_constraint_counts": {
            "pair_separations": 300,
            "exact_support_gaps": 79,
            "radius_gaps": 2,
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
                    "minimum_hard_orientation_slack",
                    "maximum_hard_equality_residual",
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
    print(f"wrote {args.output}")


if __name__ == "__main__":
    main()

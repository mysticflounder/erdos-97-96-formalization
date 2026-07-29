#!/usr/bin/env python3
"""Deterministic numerical diagnostic for an exact survivor probe.

This script deliberately does not decide the QF_NRA formula.  It imports the
exact replay/parser code from ``euclidean_survivor_probe.py``, replays the
pinned outer survivor, checks that the recorded SMT formula and quotient data
still match, and then searches numerically for coordinates satisfying the same
positive squared-distance equalities and strict-convex support inequalities.

A successful fit is only a plausible floating-point realization.  Failure to
find one is ``UNKNOWN_NO_FIT_FOUND``, never an infeasibility certificate.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import math
import platform
import sys
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import numpy as np
import scipy
import z3
from scipy.optimize import least_squares, minimize


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[2]
EXACT_PROBE_SCRIPT = HERE / "euclidean_survivor_probe.py"
DEFAULT_RESULT = HERE / "cegar-v9-local-robust-new.json"
DEFAULT_CHECKPOINT = HERE / "cegar-v9-local-robust-new.checkpoint.json"
DEFAULT_PROBE_RESULT = (
    HERE / "euclidean-survivor-probe-v9-local-robust-new.json"
)
DEFAULT_OUTPUT = (
    HERE / "numerical-euclidean-fit-v9-local-robust-new.json"
)
DEFAULT_REPORT = (
    HERE / "numerical-euclidean-fit-v9-local-robust-new-report.md"
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def import_exact_probe() -> Any:
    spec = importlib.util.spec_from_file_location(
        "atail_exact_euclidean_survivor_probe_for_numerics",
        EXACT_PROBE_SCRIPT,
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {EXACT_PROBE_SCRIPT}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


class DeadlineExpired(RuntimeError):
    pass


@dataclass
class WallBudget:
    deadline: float

    @classmethod
    def start(cls, seconds: float) -> "WallBudget":
        if seconds <= 0 or seconds > 540:
            raise ValueError("--timeout-seconds must be in (0, 540]")
        return cls(time.monotonic() + seconds)

    def check(self) -> None:
        if time.monotonic() >= self.deadline:
            raise DeadlineExpired("numerical search wall-clock budget expired")

    def remaining(self) -> float:
        return max(0.0, self.deadline - time.monotonic())


@dataclass(frozen=True)
class Thresholds:
    equality_max_abs: float
    equality_rms: float
    raw_support_margin: float
    normalized_support_margin: float
    minimum_pair_distance: float


class NumericalProblem:
    def __init__(
        self,
        quotient_count: int,
        equations: list[list[list[int]]],
        budget: WallBudget,
    ) -> None:
        if quotient_count < 3:
            raise ValueError("need at least three quotient points")
        self.n = quotient_count
        self.equations = equations
        self.budget = budget
        self.left_a = np.asarray([row[0][0] for row in equations], dtype=int)
        self.left_b = np.asarray([row[0][1] for row in equations], dtype=int)
        self.right_a = np.asarray([row[1][0] for row in equations], dtype=int)
        self.right_b = np.asarray([row[1][1] for row in equations], dtype=int)
        triples = []
        for a in range(quotient_count):
            b = (a + 1) % quotient_count
            for c in range(quotient_count):
                if c not in (a, b):
                    triples.append((a, b, c))
        self.support_triples = np.asarray(triples, dtype=int)

    @property
    def variable_count(self) -> int:
        return 2 * (self.n - 2)

    def coordinates(self, vector: np.ndarray) -> np.ndarray:
        if vector.shape != (self.variable_count,):
            raise ValueError(
                f"expected vector shape {(self.variable_count,)}, got {vector.shape}"
            )
        coordinates = np.empty((self.n, 2), dtype=float)
        coordinates[0] = (0.0, 0.0)
        coordinates[1] = (1.0, 0.0)
        coordinates[2:] = vector.reshape(self.n - 2, 2)
        return coordinates

    def equation_residuals(
        self, vector: np.ndarray, *, check_budget: bool = True
    ) -> np.ndarray:
        if check_budget:
            self.budget.check()
        c = self.coordinates(vector)
        left = c[self.left_a] - c[self.left_b]
        right = c[self.right_a] - c[self.right_b]
        return np.einsum("ij,ij->i", left, left) - np.einsum(
            "ij,ij->i", right, right
        )

    def supports(
        self, vector: np.ndarray, *, check_budget: bool = True
    ) -> np.ndarray:
        if check_budget:
            self.budget.check()
        c = self.coordinates(vector)
        a = self.support_triples[:, 0]
        b = self.support_triples[:, 1]
        point = self.support_triples[:, 2]
        edge = c[b] - c[a]
        ray = c[point] - c[a]
        return edge[:, 0] * ray[:, 1] - edge[:, 1] * ray[:, 0]

    def normalized_supports(self, vector: np.ndarray) -> np.ndarray:
        c = self.coordinates(vector)
        a = self.support_triples[:, 0]
        b = self.support_triples[:, 1]
        point = self.support_triples[:, 2]
        edge = c[b] - c[a]
        ray = c[point] - c[a]
        denominator = np.linalg.norm(edge, axis=1) * np.linalg.norm(
            ray, axis=1
        )
        raw = edge[:, 0] * ray[:, 1] - edge[:, 1] * ray[:, 0]
        return np.divide(
            raw,
            denominator,
            out=np.full_like(raw, np.nan),
            where=denominator > 0,
        )

    def metrics(self, vector: np.ndarray) -> dict[str, Any]:
        c = self.coordinates(vector)
        equations = self.equation_residuals(vector, check_budget=False)
        supports = self.supports(vector, check_budget=False)
        normalized = self.normalized_supports(vector)
        finite_normalized = normalized[np.isfinite(normalized)]
        pair_distances = np.linalg.norm(
            c[:, np.newaxis, :] - c[np.newaxis, :, :], axis=2
        )
        np.fill_diagonal(pair_distances, math.inf)
        area = 0.5 * float(
            np.sum(
                c[:, 0] * np.roll(c[:, 1], -1)
                - c[:, 1] * np.roll(c[:, 0], -1)
            )
        )
        worst_equation_index = int(np.argmax(np.abs(equations)))
        worst_support_index = int(np.argmin(supports))
        return {
            "equation_l2": float(np.linalg.norm(equations)),
            "equation_rms": float(np.sqrt(np.mean(equations**2))),
            "equation_max_abs": float(np.max(np.abs(equations))),
            "raw_support_min": float(np.min(supports)),
            "raw_support_quantiles": {
                key: float(value)
                for key, value in zip(
                    ("q00", "q01", "q05", "q50", "q95", "q100"),
                    np.quantile(supports, (0.0, 0.01, 0.05, 0.5, 0.95, 1.0)),
                    strict=True,
                )
            },
            "normalized_support_min": (
                float(np.min(finite_normalized))
                if finite_normalized.size
                else None
            ),
            "degenerate_support_denominator_count": int(
                np.count_nonzero(~np.isfinite(normalized))
            ),
            "nonpositive_support_count": int(np.count_nonzero(supports <= 0)),
            "minimum_pair_distance": float(np.min(pair_distances)),
            "signed_polygon_area": area,
            "maximum_absolute_coordinate": float(np.max(np.abs(c))),
            "worst_equation": {
                "index": worst_equation_index,
                "equation": self.equations[worst_equation_index],
                "residual": float(equations[worst_equation_index]),
            },
            "worst_support": {
                "index": worst_support_index,
                "triple": self.support_triples[worst_support_index].tolist(),
                "raw": float(supports[worst_support_index]),
                "normalized": (
                    float(normalized[worst_support_index])
                    if np.isfinite(normalized[worst_support_index])
                    else None
                ),
            },
        }

    def detail(
        self,
        vector: np.ndarray,
        classes: list[list[str]],
        metrics: dict[str, Any],
    ) -> dict[str, Any]:
        c = self.coordinates(vector)
        equation_values = self.equation_residuals(
            vector, check_budget=False
        )
        supports = self.supports(vector, check_budget=False)
        normalized = self.normalized_supports(vector)
        worst_indices = np.argsort(supports)[:20]
        return {
            "metrics": metrics,
            "coordinates": [
                {
                    "quotient_index": index,
                    "aliases": classes[index],
                    "x": float(point[0]),
                    "y": float(point[1]),
                }
                for index, point in enumerate(c)
            ],
            "equation_residuals": [
                {
                    "index": index,
                    "equation": equation,
                    "residual": float(equation_values[index]),
                }
                for index, equation in enumerate(self.equations)
            ],
            "twenty_smallest_supports": [
                {
                    "index": int(index),
                    "triple": self.support_triples[index].tolist(),
                    "raw": float(supports[index]),
                    "normalized": (
                        float(normalized[index])
                        if np.isfinite(normalized[index])
                        else None
                    ),
                }
                for index in worst_indices
            ],
        }


def normalize_seed(raw: np.ndarray) -> np.ndarray:
    translated = raw - raw[0]
    edge = translated[1]
    edge_length = float(np.linalg.norm(edge))
    if edge_length <= 1e-12:
        raise ValueError("degenerate seed edge")
    angle = math.atan2(float(edge[1]), float(edge[0]))
    rotation = np.asarray(
        [
            [math.cos(-angle), -math.sin(-angle)],
            [math.sin(-angle), math.cos(-angle)],
        ]
    )
    normalized = translated @ rotation.T / edge_length
    normalized[0] = (0.0, 0.0)
    normalized[1] = (1.0, 0.0)
    return normalized


def regular_seed(n: int) -> np.ndarray:
    theta = np.arange(n, dtype=float) * (2.0 * math.pi / n)
    raw = np.column_stack((np.cos(theta), np.sin(theta)))
    return normalize_seed(raw)[2:].ravel()


def cyclic_seed(n: int, rng: np.random.Generator, index: int) -> np.ndarray:
    concentration = (4.0, 12.0, 30.0)[index % 3]
    increments = rng.dirichlet(np.full(n, concentration)) * 2.0 * math.pi
    theta = np.concatenate(([0.0], np.cumsum(increments[:-1])))
    raw = np.column_stack((np.cos(theta), np.sin(theta)))
    sx = math.exp(float(rng.uniform(-0.35, 0.35)))
    sy = math.exp(float(rng.uniform(-0.35, 0.35)))
    shear = float(rng.uniform(-0.4, 0.4))
    positive_affine = np.asarray([[sx, shear], [0.0, sy]])
    raw = raw @ positive_affine.T
    return normalize_seed(raw)[2:].ravel()


def perturbed_regular_seed(
    n: int, rng: np.random.Generator, scale: float
) -> np.ndarray:
    seed = regular_seed(n)
    return seed + rng.normal(0.0, scale, size=seed.shape)


def is_plausible(metrics: dict[str, Any], thresholds: Thresholds) -> bool:
    return bool(
        metrics["equation_max_abs"] <= thresholds.equality_max_abs
        and metrics["equation_rms"] <= thresholds.equality_rms
        and metrics["raw_support_min"] >= thresholds.raw_support_margin
        and metrics["degenerate_support_denominator_count"] == 0
        and metrics["normalized_support_min"]
        is not None
        and metrics["normalized_support_min"]
        >= thresholds.normalized_support_margin
        and metrics["minimum_pair_distance"]
        >= thresholds.minimum_pair_distance
    )


@dataclass
class Candidate:
    stage: str
    attempt: int
    seed: int
    scipy_success: bool
    scipy_status: int
    scipy_message: str
    evaluations_or_iterations: int
    elapsed_seconds: float
    vector: np.ndarray
    metrics: dict[str, Any]

    def summary(self, thresholds: Thresholds) -> dict[str, Any]:
        return {
            "stage": self.stage,
            "attempt": self.attempt,
            "seed": self.seed,
            "scipy_success": self.scipy_success,
            "scipy_status": self.scipy_status,
            "scipy_message": self.scipy_message,
            "evaluations_or_iterations": self.evaluations_or_iterations,
            "elapsed_seconds": self.elapsed_seconds,
            "plausible_fit": is_plausible(self.metrics, thresholds),
            "metrics": self.metrics,
        }


def run_least_squares(
    problem: NumericalProblem,
    initial: np.ndarray,
    *,
    stage: str,
    attempt: int,
    seed: int,
    coordinate_bound: float,
    max_nfev: int,
    support_margin: float | None,
    support_weight: float,
) -> Candidate:
    started = time.monotonic()

    def residual(vector: np.ndarray) -> np.ndarray:
        equations = problem.equation_residuals(vector)
        if support_margin is None:
            return equations
        supports = problem.supports(vector)
        hinge = np.minimum(0.0, supports - support_margin)
        return np.concatenate((equations, support_weight * hinge))

    result = least_squares(
        residual,
        initial,
        bounds=(-coordinate_bound, coordinate_bound),
        method="trf",
        x_scale="jac",
        loss="linear",
        max_nfev=max_nfev,
        ftol=1e-13,
        xtol=1e-13,
        gtol=1e-13,
    )
    return Candidate(
        stage=stage,
        attempt=attempt,
        seed=seed,
        scipy_success=bool(result.success),
        scipy_status=int(result.status),
        scipy_message=str(result.message),
        evaluations_or_iterations=int(result.nfev),
        elapsed_seconds=time.monotonic() - started,
        vector=np.asarray(result.x),
        metrics=problem.metrics(np.asarray(result.x)),
    )


def run_slsqp(
    problem: NumericalProblem,
    initial: np.ndarray,
    *,
    attempt: int,
    seed: int,
    coordinate_bound: float,
    max_iterations: int,
    support_margin: float,
) -> Candidate:
    started = time.monotonic()

    def objective(vector: np.ndarray) -> float:
        equations = problem.equation_residuals(vector)
        return 0.5 * float(equations @ equations)

    def constraints(vector: np.ndarray) -> np.ndarray:
        return problem.supports(vector) - support_margin

    result = minimize(
        objective,
        initial,
        method="SLSQP",
        bounds=[
            (-coordinate_bound, coordinate_bound)
            for _ in range(problem.variable_count)
        ],
        constraints={"type": "ineq", "fun": constraints},
        options={
            "maxiter": max_iterations,
            "ftol": 1e-14,
            "disp": False,
        },
    )
    return Candidate(
        stage="strict_constrained_slsqp",
        attempt=attempt,
        seed=seed,
        scipy_success=bool(result.success),
        scipy_status=int(result.status),
        scipy_message=str(result.message),
        evaluations_or_iterations=int(result.nit),
        elapsed_seconds=time.monotonic() - started,
        vector=np.asarray(result.x),
        metrics=problem.metrics(np.asarray(result.x)),
    )


def run_self_test() -> dict[str, Any]:
    budget = WallBudget.start(20.0)
    equations = [
        [[0, 1], [1, 2]],
        [[0, 1], [2, 3]],
        [[0, 1], [0, 3]],
        [[0, 2], [1, 3]],
    ]
    problem = NumericalProblem(4, equations, budget)
    square = np.asarray([1.0, 1.0, 0.0, 1.0])
    square_metrics = problem.metrics(square)
    crossed = np.asarray([1.0, 1.0, 1.0, 0.0])
    crossed_support_min = float(
        np.min(problem.supports(crossed, check_budget=False))
    )
    rng = np.random.default_rng(1729)
    fitted = run_least_squares(
        problem,
        square + rng.normal(0.0, 0.03, size=square.shape),
        stage="self_test",
        attempt=0,
        seed=1729,
        coordinate_bound=5.0,
        max_nfev=2000,
        support_margin=0.05,
        support_weight=20.0,
    )
    passed = bool(
        square_metrics["equation_max_abs"] == 0.0
        and square_metrics["raw_support_min"] > 0.9
        and crossed_support_min < 0.0
        and fitted.metrics["equation_max_abs"] < 1e-9
        and fitted.metrics["raw_support_min"] > 0.04
    )
    if not passed:
        raise RuntimeError("small numerical convex-square self-test failed")
    return {
        "status": "PASS",
        "description": (
            "a perturbed unit square refits its four distance equalities "
            "with positive support; a crossed vertex order has negative support"
        ),
        "exact_square_metrics": square_metrics,
        "crossed_order_raw_support_min": crossed_support_min,
        "refit_metrics": fitted.metrics,
    }


def resolve_recorded_path(raw_path: str) -> Path:
    path = Path(raw_path)
    return path if path.is_absolute() else REPO / path


def validate_exact_source(
    exact: Any,
    result_path: Path,
    checkpoint_path: Path,
    probe_result_path: Path,
    budget: WallBudget,
) -> tuple[dict[str, Any], dict[str, Any]]:
    result_payload = exact.load_json(result_path)
    checkpoint = exact.load_json(checkpoint_path)
    probe_result = exact.load_json(probe_result_path)
    if result_payload.get("status") != "ALIVE":
        raise ValueError("CEGAR result has no ALIVE survivor")
    metadata = result_payload.get("metadata")
    survivor = result_payload.get("survivor")
    if not isinstance(metadata, dict) or not isinstance(survivor, dict):
        raise ValueError("CEGAR result lacks metadata or survivor")
    if checkpoint.get("metadata") != metadata:
        raise ValueError("checkpoint and result metadata differ")
    names = metadata.get("names")
    if not isinstance(names, list) or not all(
        isinstance(name, str) for name in names
    ):
        raise ValueError("result metadata has no valid name ledger")
    recorded_classes = exact.normalize_classes(
        survivor.get("alias_classes_in_order"), tuple(names)
    )

    target = probe_result.get("target")
    if not isinstance(target, dict):
        raise ValueError("exact probe result has no target")
    if target.get("alias_classes_in_order") != recorded_classes:
        raise ValueError("exact probe quotient classes differ from CEGAR survivor")
    if target.get("alias_class_count") != len(recorded_classes):
        raise ValueError("exact probe quotient count differs from CEGAR survivor")
    recorded_equations = target.get("positive_quotient_equations")
    if not isinstance(recorded_equations, list) or not recorded_equations:
        raise ValueError("exact probe target has no positive equations")
    probe_inputs = probe_result.get("inputs")
    if not isinstance(probe_inputs, dict):
        raise ValueError("exact probe result has no input ledger")
    recorded_cegar_sha = probe_inputs.get("cegar_sha256")
    expected_probe_hashes = {
        "result_sha256": sha256(result_path),
        "checkpoint_sha256": sha256(checkpoint_path),
    }
    for key, expected in expected_probe_hashes.items():
        if probe_inputs.get(key) != expected:
            raise ValueError(
                f"exact probe input ledger has stale or inconsistent {key}"
            )
    if (
        not isinstance(recorded_cegar_sha, str)
        or result_payload.get("implementation_sha256") != recorded_cegar_sha
        or metadata.get("implementation_sha256") != recorded_cegar_sha
    ):
        raise ValueError(
            "CEGAR result metadata and exact-probe input hash are inconsistent"
        )

    current_cegar_sha = sha256(exact.CEGAR)
    fresh_replay: dict[str, Any] | None = None
    if current_cegar_sha == recorded_cegar_sha:
        fresh_replay = exact.replay_survivor(
            result_path,
            checkpoint_path,
            exact.Budget(budget.deadline),
        )
        if fresh_replay["classes"] != recorded_classes:
            raise ValueError("fresh replay changed the recorded quotient classes")

    formula = probe_result.get("formulas", {}).get("positive_rows")
    if not isinstance(formula, dict):
        raise ValueError("exact probe result has no positive_rows formula")
    smt2_path = resolve_recorded_path(formula["smt2"])
    if not smt2_path.is_file():
        raise ValueError(f"recorded exact SMT file is missing: {smt2_path}")
    if sha256(smt2_path) != formula.get("smt2_sha256"):
        raise ValueError("recorded exact SMT hash does not match current file")

    (
        live_solver,
        _x,
        _y,
        live_trackers,
        live_assertion_counts,
    ) = exact.build_formula(
        len(recorded_classes),
        recorded_equations,
        [],
        timeout_ms=max(1, int(budget.remaining() * 1000)),
    )
    if formula.get("assertion_counts") != live_assertion_counts:
        raise ValueError("exact formula assertion counts differ from live builder")
    substitutions = tuple(
        (token, z3.BoolVal(True)) for token in live_trackers
    )
    rebuilt_direct = z3.SolverFor("QF_NRA")
    rebuilt_direct.add(
        *(
            z3.simplify(z3.substitute(assertion, *substitutions))
            for assertion in live_solver.assertions()
        )
    )
    rebuilt_smt2 = (
        "(set-logic QF_NRA)\n"
        + rebuilt_direct.sexpr()
        + "\n(check-sat)\n"
    ).encode()
    rebuilt_smt2_sha = hashlib.sha256(rebuilt_smt2).hexdigest()
    if rebuilt_smt2_sha != formula.get("smt2_sha256"):
        raise ValueError(
            "live build_formula/write_smt2 reconstruction differs from the "
            "recorded exact SMT formula"
        )
    expected_supports = len(recorded_classes) * (len(recorded_classes) - 2)
    if live_assertion_counts["strict_convex_support"] != expected_supports:
        raise ValueError("unexpected live strict-support count")
    if (
        live_assertion_counts["positive_row_equalities"]
        != len(recorded_equations)
    ):
        raise ValueError("unexpected live positive-equation count")

    recorded_set = {
        tuple(tuple(edge) for edge in equation)
        for equation in recorded_equations
    }
    fresh_set = (
        {
            tuple(tuple(edge) for edge in equation)
            for equation in fresh_replay["positive_quotient_equations"]
        }
        if fresh_replay is not None
        else None
    )
    validation = {
        "status": "PASS",
        "method": (
            "recorded CEGAR result/checkpoint consistency and exact-probe "
            "input and SMT hash checks, imported normalize_classes validation, "
            "and live build_formula reconstruction from the recorded "
            "exact-probe positive equation list"
        ),
        "fresh_outer_replay_status": (
            fresh_replay["outer_status"]
            if fresh_replay is not None
            else "SKIPPED_CURRENT_CEGAR_IMPLEMENTATION_DRIFT"
        ),
        "fresh_outer_replay_seconds": (
            fresh_replay["outer_elapsed_seconds"]
            if fresh_replay is not None
            else None
        ),
        "alias_class_count": len(recorded_classes),
        "positive_equation_count": len(recorded_equations),
        "assertion_counts": live_assertion_counts,
        "live_rebuilt_smt2_sha256": rebuilt_smt2_sha,
        "live_rebuilt_smt2_matches_recorded": True,
        "recorded_exact_formula_status": formula["evidence"]["status"],
        "recorded_exact_formula_reason_unknown": formula["evidence"].get(
            "reason_unknown"
        ),
        "cegar_implementation": {
            "recorded_sha256": recorded_cegar_sha,
            "current_sha256": current_cegar_sha,
            "matches_recorded": current_cegar_sha == recorded_cegar_sha,
            "fresh_replay_gate": (
                "replay_survivor intentionally requires the recorded "
                "implementation hash; the immutable result/checkpoint/probe/"
                "SMT ledgers remain the numerical target when current cegar.py "
                "has moved"
            ),
        },
        "fresh_replay_row_selection": {
            "available": fresh_set is not None,
            "matches_recorded_exact_probe": (
                fresh_set == recorded_set if fresh_set is not None else None
            ),
            "fresh_positive_equation_count": (
                len(fresh_set) if fresh_set is not None else None
            ),
            "recorded_positive_equation_count": len(recorded_set),
            "overlap_count": (
                len(fresh_set & recorded_set)
                if fresh_set is not None
                else None
            ),
            "classification": (
                "row truth values are pinned-model choices and need not be "
                "fixed by the pinned quotient/order constraints"
            ),
        },
    }
    inputs = {
        "cegar_result": str(result_path),
        "cegar_result_sha256": sha256(result_path),
        "checkpoint": str(checkpoint_path),
        "checkpoint_sha256": sha256(checkpoint_path),
        "exact_probe_result": str(probe_result_path),
        "exact_probe_result_sha256": sha256(probe_result_path),
        "exact_probe_script": str(EXACT_PROBE_SCRIPT),
        "exact_probe_script_sha256": sha256(EXACT_PROBE_SCRIPT),
        "cegar_script": str(exact.CEGAR),
        "cegar_script_current_sha256": current_cegar_sha,
        "cegar_script_recorded_sha256": recorded_cegar_sha,
        "exact_positive_rows_smt2": str(smt2_path),
        "exact_positive_rows_smt2_sha256": sha256(smt2_path),
    }
    return {
        "classes": recorded_classes,
        "source_validation": validation,
        "numerical_positive_equations": recorded_equations,
    }, inputs


def attempt_seed(
    problem: NumericalProblem,
    base_seed: int,
    attempt: int,
    *,
    equality_only: bool,
) -> tuple[int, np.ndarray]:
    seed = base_seed + attempt * 104_729
    rng = np.random.default_rng(seed)
    if attempt == 0:
        return seed, regular_seed(problem.n)
    if equality_only and attempt % 2 == 1:
        scale = (0.05, 0.2, 0.5)[attempt % 3]
        return seed, perturbed_regular_seed(problem.n, rng, scale)
    return seed, cyclic_seed(problem.n, rng, attempt)


def choose_candidates(
    candidates: list[Candidate],
    thresholds: Thresholds,
    support_margin: float,
) -> dict[str, Candidate]:
    chosen: dict[str, Candidate] = {}
    plausible = [
        candidate
        for candidate in candidates
        if is_plausible(candidate.metrics, thresholds)
    ]
    if plausible:
        chosen["plausible_fit"] = min(
            plausible,
            key=lambda candidate: candidate.metrics["equation_rms"],
        )
    strict = [
        candidate
        for candidate in candidates
        if candidate.metrics["raw_support_min"] >= 0.999 * support_margin
    ]
    if strict:
        chosen["best_strict_order_candidate"] = min(
            strict,
            key=lambda candidate: (
                candidate.metrics["equation_rms"],
                candidate.metrics["equation_max_abs"],
            ),
        )
    equation_exact = [
        candidate
        for candidate in candidates
        if candidate.metrics["equation_max_abs"]
        <= thresholds.equality_max_abs
    ]
    if equation_exact:
        chosen["best_equation_fit_candidate"] = max(
            equation_exact,
            key=lambda candidate: candidate.metrics["raw_support_min"],
        )

    def joint_score(candidate: Candidate) -> float:
        metrics = candidate.metrics
        negative_support = max(0.0, -metrics["raw_support_min"])
        return metrics["equation_rms"] + 10.0 * negative_support

    chosen["best_joint_tradeoff_candidate"] = min(
        candidates, key=joint_score
    )
    return chosen


def render_report(result: dict[str, Any]) -> str:
    selected = result["selected_candidates"]
    strict = selected.get("best_strict_order_candidate")
    equation = selected.get("best_equation_fit_candidate")
    fresh_rows = result["source_validation"]["fresh_replay_row_selection"]
    if fresh_rows["available"]:
        replay_note = (
            f"A fresh outer replay selected "
            f"`{fresh_rows['fresh_positive_equation_count']}` positive quotient "
            f"equations versus the recorded formula's "
            f"`{fresh_rows['recorded_positive_equation_count']}`; their overlap "
            f"is `{fresh_rows['overlap_count']}`. This is expected model "
            f"freedom: the numerical target remains the exact recorded SMT "
            f"formula, not the fresh replay's different row selection."
        )
    else:
        cegar = result["source_validation"]["cegar_implementation"]
        replay_note = (
            "Fresh outer replay was intentionally skipped because current "
            f"`cegar.py` has hash `{cegar['current_sha256']}`, while the "
            f"result/checkpoint/probe ledger records "
            f"`{cegar['recorded_sha256']}`. The immutable recorded SMT formula "
            "and its hash remain the numerical target."
        )

    def metric(candidate: dict[str, Any] | None, key: str) -> str:
        if candidate is None:
            return "n/a"
        value = candidate["detail"]["metrics"][key]
        if value is None:
            return "undefined"
        return f"{value:.12g}"

    source_rows = "\n".join(
        f"- `{key}`: `{value}`"
        for key, value in result["inputs"].items()
        if key.endswith("sha256")
    )
    return f"""# Numerical Euclidean fit diagnostic: v9 local robust/new

## Outcome

`{result["terminal_status"]}`

{result["reason"]}

This is a floating-point multistart diagnostic only. A fit would not be exact
SAT, and no-fit-found is not UNSAT or an infeasibility certificate.

## Exact-source validation

- Fresh pinned outer replay: `{result["source_validation"]["fresh_outer_replay_status"]}`
- Quotient classes: `{result["source_validation"]["alias_class_count"]}`
- Positive squared-distance equations: `{result["source_validation"]["positive_equation_count"]}`
- Strict support inequalities: `{result["source_validation"]["assertion_counts"]["strict_convex_support"]}`
- Prior exact QF_NRA status: `{result["source_validation"]["recorded_exact_formula_status"]}` (`{result["source_validation"]["recorded_exact_formula_reason_unknown"]}`)

The numerical problem was reconstructed by importing the exact probe's parser,
normalization, replay gate, and `build_formula` helpers, then checking the
recorded SMT hash, input hashes, class order, recorded equation list, and
assertion ledger.
{replay_note}

## Numerical frontier

| candidate | equality RMS | max absolute equality residual | raw support minimum | normalized support minimum | nonpositive supports |
|---|---:|---:|---:|---:|---:|
| best strict-order | {metric(strict, "equation_rms")} | {metric(strict, "equation_max_abs")} | {metric(strict, "raw_support_min")} | {metric(strict, "normalized_support_min")} | {metric(strict, "nonpositive_support_count")} |
| best equality-fit | {metric(equation, "equation_rms")} | {metric(equation, "equation_max_abs")} | {metric(equation, "raw_support_min")} | {metric(equation, "normalized_support_min")} | {metric(equation, "nonpositive_support_count")} |

Acceptance required max equality residual at most
`{result["configuration"]["thresholds"]["equality_max_abs"]}`, equality RMS at
most `{result["configuration"]["thresholds"]["equality_rms"]}`, raw support
margin at least
`{result["configuration"]["thresholds"]["raw_support_margin"]}`, normalized
support margin at least
`{result["configuration"]["thresholds"]["normalized_support_margin"]}`, and
minimum pair distance at least
`{result["configuration"]["thresholds"]["minimum_pair_distance"]}`.

The search used `{result["search_summary"]["completed_attempt_count"]}`
completed deterministic attempts in
`{result["elapsed_seconds"]:.3f}` seconds. See the JSON artifact for every
attempt summary, selected coordinates, all 48 equality residuals, and the 20
smallest support margins.

## Source hashes

{source_rows}

## Epistemic classification

`{result["epistemic_status"]}`. The quotient and positive-row selection are
pinned-model data, not a universal consequence established here. SciPy
floating-point convergence is heuristic evidence; the exact Z3 probe remains
`UNKNOWN`, and only an exact solver result or proof-producing bridge could
upgrade the terminal status.
"""


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--result", type=Path, default=DEFAULT_RESULT)
    parser.add_argument("--checkpoint", type=Path, default=DEFAULT_CHECKPOINT)
    parser.add_argument(
        "--probe-result", type=Path, default=DEFAULT_PROBE_RESULT
    )
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--report", type=Path, default=DEFAULT_REPORT)
    parser.add_argument("--timeout-seconds", type=float, default=420.0)
    parser.add_argument("--base-seed", type=int, default=97_096_029)
    parser.add_argument("--equality-starts", type=int, default=18)
    parser.add_argument("--penalty-starts", type=int, default=24)
    parser.add_argument("--slsqp-starts", type=int, default=18)
    parser.add_argument("--max-nfev", type=int, default=6000)
    parser.add_argument("--max-slsqp-iterations", type=int, default=2500)
    parser.add_argument("--coordinate-bound", type=float, default=30.0)
    parser.add_argument("--support-margin", type=float, default=1e-6)
    parser.add_argument("--self-test", action="store_true")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    if args.self_test:
        print(json.dumps(run_self_test(), indent=2, sort_keys=True))
        return 0
    if min(
        args.equality_starts, args.penalty_starts, args.slsqp_starts
    ) < 0:
        raise ValueError("start counts must be nonnegative")
    if (
        args.coordinate_bound <= 1
        or args.support_margin <= 0
        or args.max_nfev <= 0
        or args.max_slsqp_iterations <= 0
    ):
        raise ValueError("invalid numerical configuration")

    overall_started = time.monotonic()
    budget = WallBudget.start(args.timeout_seconds)
    self_test = run_self_test()
    exact = import_exact_probe()
    replay, inputs = validate_exact_source(
        exact,
        args.result.resolve(),
        args.checkpoint.resolve(),
        args.probe_result.resolve(),
        budget,
    )
    problem = NumericalProblem(
        len(replay["classes"]),
        replay["numerical_positive_equations"],
        budget,
    )
    thresholds = Thresholds(
        equality_max_abs=1e-8,
        equality_rms=1e-9,
        raw_support_margin=args.support_margin,
        normalized_support_margin=1e-8,
        minimum_pair_distance=1e-6,
    )

    candidates: list[Candidate] = []
    interrupted_stage: str | None = None

    try:
        for attempt in range(args.equality_starts):
            seed, initial = attempt_seed(
                problem,
                args.base_seed,
                attempt,
                equality_only=True,
            )
            candidates.append(
                run_least_squares(
                    problem,
                    initial,
                    stage="equality_only_least_squares",
                    attempt=attempt,
                    seed=seed,
                    coordinate_bound=args.coordinate_bound,
                    max_nfev=args.max_nfev,
                    support_margin=None,
                    support_weight=0.0,
                )
            )

        weights = (3.0, 10.0, 30.0, 100.0)
        for attempt in range(args.penalty_starts):
            seed, initial = attempt_seed(
                problem,
                args.base_seed + 10_000_019,
                attempt,
                equality_only=False,
            )
            candidates.append(
                run_least_squares(
                    problem,
                    initial,
                    stage=f"joint_penalty_w{weights[attempt % len(weights)]:g}",
                    attempt=attempt,
                    seed=seed,
                    coordinate_bound=args.coordinate_bound,
                    max_nfev=args.max_nfev,
                    support_margin=args.support_margin,
                    support_weight=weights[attempt % len(weights)],
                )
            )
            if is_plausible(candidates[-1].metrics, thresholds):
                break

        if not any(is_plausible(c.metrics, thresholds) for c in candidates):
            for attempt in range(args.slsqp_starts):
                seed, initial = attempt_seed(
                    problem,
                    args.base_seed + 20_000_033,
                    attempt,
                    equality_only=False,
                )
                candidates.append(
                    run_slsqp(
                        problem,
                        initial,
                        attempt=attempt,
                        seed=seed,
                        coordinate_bound=args.coordinate_bound,
                        max_iterations=args.max_slsqp_iterations,
                        support_margin=args.support_margin,
                    )
                )
                if is_plausible(candidates[-1].metrics, thresholds):
                    break
    except DeadlineExpired:
        interrupted_stage = (
            candidates[-1].stage if candidates else "source_validation"
        )

    if not candidates:
        raise RuntimeError("numerical budget expired before any completed attempt")
    selected = choose_candidates(candidates, thresholds, args.support_margin)
    plausible = selected.get("plausible_fit")
    if plausible is not None:
        terminal_status = "PLAUSIBLE_STRICT_CONVEX_NUMERICAL_FIT"
        reason = (
            "at least one floating-point coordinate candidate met every "
            "reported equality, support-margin, and separation threshold"
        )
    else:
        terminal_status = "UNKNOWN_NO_FIT_FOUND"
        reason = (
            "bounded deterministic multistart found no candidate meeting both "
            "the distance-equality tolerances and strict-convex margins; this "
            "does not certify infeasibility"
        )
        if interrupted_stage is not None:
            reason += f" (wall budget expired during {interrupted_stage})"

    selected_details = {
        label: {
            "attempt": candidate.summary(thresholds),
            "detail": problem.detail(
                candidate.vector, replay["classes"], candidate.metrics
            ),
        }
        for label, candidate in selected.items()
    }
    result: dict[str, Any] = {
        "schema": "p97-numerical-euclidean-survivor-fit-v1",
        "terminal_status": terminal_status,
        "reason": reason,
        "epistemic_status": "NUMERICAL_DIAGNOSTIC_ONLY",
        "trust_warning": (
            "Floating-point optimization is neither exact SAT nor UNSAT. "
            "No-fit-found is only UNKNOWN. The selected positive rows belong "
            "to one pinned outer SAT model and are not proved universal here."
        ),
        "inputs": inputs
        | {
            "numerical_script": str(Path(__file__).resolve()),
            "numerical_script_sha256": sha256(Path(__file__).resolve()),
        },
        "runtime": {
            "python": platform.python_version(),
            "platform": platform.platform(),
            "numpy": np.__version__,
            "scipy": scipy.__version__,
            "z3": z3.get_version_string(),
        },
        "source_validation": replay["source_validation"],
        "self_test": self_test,
        "target": {
            "alias_class_count": len(replay["classes"]),
            "alias_classes_in_order": replay["classes"],
            "positive_equation_count": len(
                replay["numerical_positive_equations"]
            ),
            "strict_support_count": len(problem.support_triples),
            "gauge": {
                "q0": [0.0, 0.0],
                "q1": [1.0, 0.0],
            },
        },
        "configuration": {
            "timeout_seconds": args.timeout_seconds,
            "base_seed": args.base_seed,
            "equality_starts": args.equality_starts,
            "penalty_starts": args.penalty_starts,
            "slsqp_starts": args.slsqp_starts,
            "max_nfev": args.max_nfev,
            "max_slsqp_iterations": args.max_slsqp_iterations,
            "coordinate_bound": args.coordinate_bound,
            "requested_support_margin": args.support_margin,
            "penalty_weights": [3.0, 10.0, 30.0, 100.0],
            "thresholds": {
                "equality_max_abs": thresholds.equality_max_abs,
                "equality_rms": thresholds.equality_rms,
                "raw_support_margin": thresholds.raw_support_margin,
                "normalized_support_margin": (
                    thresholds.normalized_support_margin
                ),
                "minimum_pair_distance": thresholds.minimum_pair_distance,
            },
        },
        "search_summary": {
            "completed_attempt_count": len(candidates),
            "completed_by_stage": {
                stage: sum(candidate.stage == stage for candidate in candidates)
                for stage in sorted({candidate.stage for candidate in candidates})
            },
            "budget_expired": interrupted_stage is not None,
            "interrupted_stage": interrupted_stage,
            "plausible_candidate_count": sum(
                is_plausible(candidate.metrics, thresholds)
                for candidate in candidates
            ),
        },
        "attempts": [
            candidate.summary(thresholds) for candidate in candidates
        ],
        "selected_candidates": selected_details,
        "elapsed_seconds": time.monotonic() - overall_started,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    args.report.write_text(render_report(result))
    print(
        json.dumps(
            {
                "terminal_status": terminal_status,
                "reason": reason,
                "output": str(args.output),
                "report": str(args.report),
                "completed_attempts": len(candidates),
                "elapsed_seconds": result["elapsed_seconds"],
                "selected_metrics": {
                    label: candidate.metrics
                    for label, candidate in selected.items()
                },
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

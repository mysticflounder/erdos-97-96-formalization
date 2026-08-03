#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.11"
# dependencies = [
#   "numpy>=2.0",
#   "scipy>=1.14",
# ]
# ///
"""Floating-point least-squares diagnostic for the crossed-arm v8 witness.

This is heuristic seed search only.  A successful seed is not an exact SAT
certificate, and failure to find one is not evidence of infeasibility.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import math
import time
from pathlib import Path
from typing import Any, Callable

import numpy as np
import scipy
from scipy.optimize import least_squares


HERE = Path(__file__).resolve().parent
DEFAULT_WITNESS = (
    HERE.parent
    / "crossed-arm-audit"
    / "source-at-common-full-metric-bank-v8-convex-five-point-import-v7-shared-fourth-600s"
    / "witness.json"
)
CLASSIFICATION = "FLOATING_POINT_HEURISTIC_ONLY"
TRUST_BOUNDARY = (
    "No result is an exact SAT/UNSAT verdict. Success is only a numerical seed; "
    "failure is no evidence of infeasibility."
)


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_and_compile(path: Path) -> tuple[dict[str, Any], dict[str, Any]]:
    path = path.resolve()
    require(path.is_file(), f"missing witness: {path}")
    result_path = path.with_name("result.json")
    require(result_path.is_file(), f"missing sibling source result: {result_path}")
    data = json.loads(path.read_text())
    source = json.loads(result_path.read_text())
    require(source.get("schema", "").endswith("-v8"), "source result is not v8")
    require(source.get("status") == "SAT", "source Boolean witness is not SAT")
    require(source.get("n") == 17, "source witness is not n=17")
    require(source.get("arm") == "source-at-common", "unexpected crossed arm")
    require(source.get("forced_shared_fourth") is True, "missing v8 shared-fourth marker")

    order = data.get("existential_cyclic_order")
    classes = data.get("radius_classes")
    require(isinstance(order, list) and len(order) == 17 and len(set(order)) == 17,
            "cyclic order is not 17 distinct names")
    require(isinstance(classes, dict) and set(classes) == set(order),
            "radius-class centers do not equal the cyclic-order carrier")
    position = {name: i for i, name in enumerate(order)}

    equality: list[tuple[int, int, int]] = []
    disequality: list[tuple[int, int, int]] = []
    per_center: dict[str, dict[str, int]] = {}
    for center in order:
        serialized = classes[center]
        require(isinstance(serialized, list), f"classes at {center} are not a list")
        class_of: dict[str, int] = {}
        for class_index, members in enumerate(serialized):
            require(isinstance(members, list) and members, f"empty/non-list class at {center}")
            require(len(members) == len(set(members)), f"duplicate in class at {center}")
            for member in members:
                require(member in position and member != center,
                        f"invalid class member {member} at {center}")
                require(member not in class_of, f"repeated class member {member} at {center}")
                class_of[member] = class_index
        targets = [name for name in order if name != center]
        require(set(class_of) == set(targets), f"incomplete radius partition at {center}")
        eq_before, ne_before = len(equality), len(disequality)
        for left, right in itertools.combinations(targets, 2):
            atom = (position[center], position[left], position[right])
            if class_of[left] == class_of[right]:
                equality.append(atom)
            else:
                disequality.append(atom)
        per_center[center] = {
            "within_class_equalities": len(equality) - eq_before,
            "cross_class_disequalities": len(disequality) - ne_before,
        }

    distinct = [(position[a], position[b]) for a, b in itertools.combinations(order, 2)]
    supporting = []
    for i, a in enumerate(order):
        b = order[(i + 1) % len(order)]
        supporting.extend((position[a], position[b], position[c]) for c in order if c not in {a, b})

    require(len(equality) == 125, f"expected 125 equalities, got {len(equality)}")
    require(len(disequality) == 1915, f"expected 1915 disequalities, got {len(disequality)}")
    require(len(distinct) == 136, f"expected 136 distinctness atoms, got {len(distinct)}")
    require(len(supporting) == 255, f"expected 255 supporting-edge atoms, got {len(supporting)}")
    compiled = {
        "order": order,
        "equality": np.asarray(equality, dtype=np.int64),
        "disequality": np.asarray(disequality, dtype=np.int64),
        "distinct": np.asarray(distinct, dtype=np.int64),
        "supporting": np.asarray(supporting, dtype=np.int64),
        "per_center": per_center,
        "source_result": source,
        "source_result_path": result_path,
    }
    return data, compiled


class Problem:
    def __init__(self, compiled: dict[str, Any], args: argparse.Namespace):
        self.order = compiled["order"]
        self.eq = compiled["equality"]
        self.ne = compiled["disequality"]
        self.pairs = compiled["distinct"]
        self.edges = compiled["supporting"]
        self.args = args
        self.free = np.arange(2, len(self.order), dtype=np.int64)

    def unpack(self, vector: np.ndarray) -> np.ndarray:
        coords = np.empty((len(self.order), 2), dtype=np.float64)
        coords[0] = (0.0, 0.0)
        coords[1] = (1.0, 0.0)
        coords[self.free] = vector.reshape((-1, 2))
        return coords

    def pack(self, coords: np.ndarray) -> np.ndarray:
        return np.asarray(coords[self.free], dtype=np.float64).reshape(-1)

    @staticmethod
    def sqdist_difference(coords: np.ndarray, atoms: np.ndarray) -> np.ndarray:
        center = coords[atoms[:, 0]]
        left = coords[atoms[:, 1]]
        right = coords[atoms[:, 2]]
        return np.sum((center - left) ** 2, axis=1) - np.sum((center - right) ** 2, axis=1)

    @staticmethod
    def orientations(coords: np.ndarray, atoms: np.ndarray) -> np.ndarray:
        a = coords[atoms[:, 0]]
        u = coords[atoms[:, 1]] - a
        v = coords[atoms[:, 2]] - a
        return u[:, 0] * v[:, 1] - u[:, 1] * v[:, 0]

    def values(self, vector: np.ndarray) -> tuple[np.ndarray, np.ndarray, np.ndarray, np.ndarray]:
        coords = self.unpack(vector)
        eq = self.sqdist_difference(coords, self.eq)
        ne = self.sqdist_difference(coords, self.ne)
        delta = coords[self.pairs[:, 0]] - coords[self.pairs[:, 1]]
        distinct = np.sum(delta * delta, axis=1)
        supporting = self.orientations(coords, self.edges)
        return eq, ne, distinct, supporting

    def diagnostics(self, vector: np.ndarray) -> dict[str, Any]:
        eq, ne, distinct, supporting = self.values(vector)
        eq_abs = np.abs(eq)
        ne_abs = np.abs(ne)
        return {
            "classification": CLASSIFICATION,
            "within_class_equalities": {
                "count": int(eq.size),
                "max_abs_squared_distance_difference": float(np.max(eq_abs)),
                "rms_squared_distance_difference": float(np.sqrt(np.mean(eq * eq))),
                "above_equality_tolerance": int(np.count_nonzero(eq_abs > self.args.equality_tolerance)),
            },
            "cross_class_disequalities": {
                "count": int(ne.size),
                "min_abs_squared_distance_difference": float(np.min(ne_abs)),
                "at_or_below_disequality_tolerance": int(
                    np.count_nonzero(ne_abs <= self.args.disequality_tolerance)
                ),
            },
            "point_distinctness": {
                "count": int(distinct.size),
                "min_pair_squared_distance": float(np.min(distinct)),
                "at_or_below_distinctness_tolerance": int(
                    np.count_nonzero(distinct <= self.args.distinctness_tolerance)
                ),
            },
            "strict_convex_cyclic_supporting_edge_order": {
                "count": int(supporting.size),
                "min_supporting_edge_orientation": float(np.min(supporting)),
                "nonpositive": int(np.count_nonzero(supporting <= 0.0)),
                "at_or_below_supporting_tolerance": int(
                    np.count_nonzero(supporting <= self.args.supporting_tolerance)
                ),
            },
        }

    def qualifies_metric(self, diag: dict[str, Any]) -> bool:
        return (
            diag["within_class_equalities"]["max_abs_squared_distance_difference"]
            <= self.args.equality_tolerance
            and diag["cross_class_disequalities"]["at_or_below_disequality_tolerance"] == 0
            and diag["point_distinctness"]["at_or_below_distinctness_tolerance"] == 0
        )

    def qualifies_strict(self, diag: dict[str, Any]) -> bool:
        return self.qualifies_metric(diag) and (
            diag["strict_convex_cyclic_supporting_edge_order"]["at_or_below_supporting_tolerance"] == 0
        )

    def equality_objective(self, vector: np.ndarray) -> np.ndarray:
        return self.values(vector)[0]

    def full_objective(self, signs: np.ndarray, *, equality_scale: float,
                       supporting_weight: float = 1.0) -> Callable[[np.ndarray], np.ndarray]:
        # The exact disequalities are disjunctions.  For each restart, select a
        # local signed branch from the equality-first seed, then diagnose the
        # original unsigned gaps independently after optimization.
        eq_norm = math.sqrt(len(self.eq))
        ne_norm = math.sqrt(len(self.ne))
        pair_norm = math.sqrt(len(self.pairs))
        edge_norm = math.sqrt(len(self.edges))

        def objective(vector: np.ndarray) -> np.ndarray:
            eq, ne, distinct, supporting = self.values(vector)
            return np.concatenate((
                eq / (equality_scale * eq_norm),
                np.maximum(0.0, self.args.objective_disequality_margin - signs * ne)
                / (self.args.objective_disequality_margin * ne_norm),
                np.maximum(0.0, self.args.objective_distinctness_margin - distinct)
                / (self.args.objective_distinctness_margin * pair_norm),
                supporting_weight
                * np.maximum(0.0, self.args.objective_supporting_margin - supporting)
                / (self.args.objective_supporting_margin * edge_norm),
            ))

        return objective

    def initial(self, seed: int) -> np.ndarray:
        rng = np.random.default_rng(seed)
        angles = 2.0 * math.pi * np.arange(len(self.order)) / len(self.order)
        regular = np.column_stack((np.cos(angles), np.sin(angles)))
        z = regular[:, 0] + 1j * regular[:, 1]
        z = (z - z[0]) / (z[1] - z[0])
        coords = np.column_stack((z.real, z.imag))
        # Alternate near-convex and broad starts while retaining the exact gauge.
        noise_scale = (0.025, 0.08, 0.20, 0.50)[seed % 4]
        coords[2:] += rng.normal(scale=noise_scale, size=(len(self.order) - 2, 2))
        if seed % 4 == 3:
            coords[2:] = rng.normal(loc=(0.5, 0.5), scale=1.25, size=(len(self.order) - 2, 2))
        return self.pack(coords)


def fit_stage(objective: Callable[[np.ndarray], np.ndarray], initial: np.ndarray,
              max_nfev: int) -> tuple[Any, float]:
    started = time.monotonic()
    fit = least_squares(
        objective,
        initial,
        method="trf",
        max_nfev=max_nfev,
        xtol=1e-12,
        ftol=1e-12,
        gtol=1e-12,
        x_scale="jac",
    )
    return fit, time.monotonic() - started


def compact_stage(problem: Problem, fit: Any, elapsed: float,
                  objective: Callable[[np.ndarray], np.ndarray]) -> dict[str, Any]:
    return {
        "classification": CLASSIFICATION,
        "nfev": int(fit.nfev),
        "njev": None if fit.njev is None else int(fit.njev),
        "elapsed_seconds": elapsed,
        "least_squares_status": int(fit.status),
        "least_squares_message": str(fit.message),
        "objective_l2": float(np.linalg.norm(objective(fit.x))),
        "diagnostics": problem.diagnostics(fit.x),
    }


def coordinates(problem: Problem, vector: np.ndarray) -> dict[str, list[float]]:
    coords = problem.unpack(vector)
    return {name: [float(x), float(y)] for name, (x, y) in zip(problem.order, coords, strict=True)}


def search(witness: Path, args: argparse.Namespace) -> dict[str, Any]:
    _data, compiled = load_and_compile(witness)
    problem = Problem(compiled, args)
    runs: list[dict[str, Any]] = []
    candidates: list[tuple[str, int, np.ndarray, dict[str, Any], float]] = []
    started = time.monotonic()

    for seed in range(args.restarts):
        initial = problem.initial(seed)
        initial_diag = problem.diagnostics(initial)
        eq_fit, eq_elapsed = fit_stage(problem.equality_objective, initial, args.equality_max_nfev)
        eq_stage = compact_stage(problem, eq_fit, eq_elapsed, problem.equality_objective)
        ne_at_seed = problem.values(eq_fit.x)[1]
        signs = np.where(ne_at_seed >= 0.0, 1.0, -1.0)
        # Break a zero-gap branch choice deterministically across restarts.
        zero = np.abs(ne_at_seed) < 1.0e-14
        signs[zero] = np.where((np.arange(len(signs))[zero] + seed) % 2 == 0, 1.0, -1.0)
        full_objective = problem.full_objective(
            signs, equality_scale=args.objective_equality_scale
        )
        strict_fit, strict_elapsed = fit_stage(full_objective, eq_fit.x, args.strict_max_nfev)
        strict_stage = compact_stage(problem, strict_fit, strict_elapsed, full_objective)

        initial_ne = problem.values(initial)[1]
        initial_signs = np.where(initial_ne >= 0.0, 1.0, -1.0)
        convex_objective = problem.full_objective(
            initial_signs,
            equality_scale=args.convex_objective_equality_scale,
            supporting_weight=args.convex_supporting_weight,
        )
        convex_fit, convex_elapsed = fit_stage(
            convex_objective, initial, args.convex_max_nfev
        )
        convex_stage = compact_stage(
            problem, convex_fit, convex_elapsed, convex_objective
        )
        runs.append({
            "classification": CLASSIFICATION,
            "seed": seed,
            "initial_family": "cyclic-order regular polygon plus jitter" if seed % 4 != 3
                              else "broad random coordinates",
            "initial_diagnostics": initial_diag,
            "equality_first": eq_stage,
            "strict_refinement": strict_stage,
            "convexity_preserving_refinement": convex_stage,
        })
        eq_diag = eq_stage["diagnostics"]
        strict_diag = strict_stage["diagnostics"]
        candidates.append(("equality_first", seed, eq_fit.x.copy(), eq_diag,
                           eq_stage["objective_l2"]))
        candidates.append(("strict_refinement", seed, strict_fit.x.copy(), strict_diag,
                           strict_stage["objective_l2"]))
        candidates.append(("initial", seed, initial.copy(), initial_diag,
                           float(np.linalg.norm(problem.equality_objective(initial)))))
        candidates.append(("convexity_preserving_refinement", seed, convex_fit.x.copy(),
                           convex_stage["diagnostics"], convex_stage["objective_l2"]))

    def equality_key(item: tuple[str, int, np.ndarray, dict[str, Any], float]) -> tuple[float, float]:
        diag = item[3]["within_class_equalities"]
        return diag["max_abs_squared_distance_difference"], diag["rms_squared_distance_difference"]

    def joint_key(item: tuple[str, int, np.ndarray, dict[str, Any], float]) -> tuple[int, int, int, float, float]:
        diag = item[3]
        return (
            diag["strict_convex_cyclic_supporting_edge_order"]["at_or_below_supporting_tolerance"],
            diag["cross_class_disequalities"]["at_or_below_disequality_tolerance"],
            diag["point_distinctness"]["at_or_below_distinctness_tolerance"],
            diag["within_class_equalities"]["max_abs_squared_distance_difference"],
            item[4],
        )

    best_eq = min(candidates, key=equality_key)
    strict_candidates = [item for item in candidates if item[0] in {
        "strict_refinement", "convexity_preserving_refinement"
    }]
    best_joint = min(strict_candidates, key=joint_key)
    metric_candidates = [item for item in candidates if problem.qualifies_metric(item[3])]
    fully_strict = [item for item in candidates if problem.qualifies_strict(item[3])]
    exact_order_candidates = [
        item for item in candidates
        if item[3]["strict_convex_cyclic_supporting_edge_order"]["at_or_below_supporting_tolerance"] == 0
        and item[3]["point_distinctness"]["at_or_below_distinctness_tolerance"] == 0
    ]
    best_exact_order = min(exact_order_candidates, key=equality_key) if exact_order_candidates else None

    def expand(item: tuple[str, int, np.ndarray, dict[str, Any], float]) -> dict[str, Any]:
        stage, seed, vector, diag, objective_l2 = item
        return {
            "classification": CLASSIFICATION,
            "stage": stage,
            "seed": seed,
            "objective_l2": objective_l2,
            "diagnostics": diag,
            "coordinates": coordinates(problem, vector),
        }

    if fully_strict:
        status = "HEURISTIC_STRICT_CONVEX_SEED_FOUND"
    elif metric_candidates:
        status = "HEURISTIC_LOW_RESIDUAL_METRIC_SEED_ONLY"
    else:
        status = "NO_QUALIFYING_NUMERICAL_SEED_FOUND"

    return {
        "schema": "crossed-arm-v8-scipy-least-squares-numerical-diagnostic-v1",
        "classification": CLASSIFICATION,
        "status": status,
        "trust_boundary": TRUST_BOUNDARY,
        "input": {
            "witness": str(witness.resolve()),
            "witness_sha256": sha256(witness.resolve()),
            "source_result": str(compiled["source_result_path"].resolve()),
            "source_result_sha256": sha256(compiled["source_result_path"].resolve()),
            "source_schema": compiled["source_result"]["schema"],
            "cyclic_order": compiled["order"],
        },
        "encoding": {
            "similarity_gauge": {
                compiled["order"][0]: [0.0, 0.0],
                compiled["order"][1]: [1.0, 0.0],
                "orientation": "preserved",
            },
            "constraint_counts": {
                "serialized_within_class_squared_distance_equalities": int(len(compiled["equality"])),
                "serialized_cross_class_squared_distance_disequalities": int(len(compiled["disequality"])),
                "all_point_pair_distinctness": int(len(compiled["distinct"])),
                "exact_cyclic_supporting_edge_order": int(len(compiled["supporting"])),
            },
            "per_center_metric_counts": compiled["per_center"],
            "supporting_edge_definition": (
                "for every directed adjacent edge in witness cyclic order, every other point "
                "has strictly positive orientation"
            ),
            "disequality_optimization": (
                "restart-local signed hinge branches; final diagnostics always replay all 1915 "
                "original unsigned cross-class gaps"
            ),
        },
        "settings": {
            "restarts": args.restarts,
            "equality_max_nfev": args.equality_max_nfev,
            "strict_max_nfev": args.strict_max_nfev,
            "convex_max_nfev": args.convex_max_nfev,
            "equality_tolerance": args.equality_tolerance,
            "disequality_tolerance": args.disequality_tolerance,
            "distinctness_tolerance": args.distinctness_tolerance,
            "supporting_tolerance": args.supporting_tolerance,
            "objective_equality_scale": args.objective_equality_scale,
            "objective_disequality_margin": args.objective_disequality_margin,
            "objective_distinctness_margin": args.objective_distinctness_margin,
            "objective_supporting_margin": args.objective_supporting_margin,
            "convex_objective_equality_scale": args.convex_objective_equality_scale,
            "convex_supporting_weight": args.convex_supporting_weight,
            "numpy_version": np.__version__,
            "scipy_version": scipy.__version__,
        },
        "elapsed_seconds": time.monotonic() - started,
        "qualifying_metric_candidate_count": len(metric_candidates),
        "qualifying_strict_convex_candidate_count": len(fully_strict),
        "best_equality_residual": expand(best_eq),
        "best_joint_refinement": expand(best_joint),
        "best_exact_cyclic_order_candidate": None if best_exact_order is None else expand(best_exact_order),
        "runs": runs,
    }


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--witness", type=Path, default=DEFAULT_WITNESS)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--restarts", type=int, default=12)
    parser.add_argument("--equality-max-nfev", type=int, default=1200)
    parser.add_argument("--strict-max-nfev", type=int, default=1600)
    parser.add_argument("--convex-max-nfev", type=int, default=1200)
    parser.add_argument("--equality-tolerance", type=float, default=1.0e-7)
    parser.add_argument("--disequality-tolerance", type=float, default=1.0e-8)
    parser.add_argument("--distinctness-tolerance", type=float, default=1.0e-8)
    parser.add_argument("--supporting-tolerance", type=float, default=1.0e-8)
    parser.add_argument("--objective-equality-scale", type=float, default=1.0e-5)
    parser.add_argument("--objective-disequality-margin", type=float, default=1.0e-4)
    parser.add_argument("--objective-distinctness-margin", type=float, default=1.0e-4)
    parser.add_argument("--objective-supporting-margin", type=float, default=1.0e-4)
    parser.add_argument("--convex-objective-equality-scale", type=float, default=1.0e-2)
    parser.add_argument("--convex-supporting-weight", type=float, default=100.0)
    args = parser.parse_args()
    require(args.restarts > 0, "restarts must be positive")
    require(args.equality_max_nfev > 0 and args.strict_max_nfev > 0 and args.convex_max_nfev > 0,
            "nfev limits must be positive")
    return args


def main() -> None:
    args = parse_args()
    result = search(args.witness, args)
    require(not args.output.exists(), f"refusing to overwrite existing output: {args.output}")
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    summary = {
        "classification": result["classification"],
        "status": result["status"],
        "elapsed_seconds": result["elapsed_seconds"],
        "constraint_counts": result["encoding"]["constraint_counts"],
        "best_equality_diagnostics": result["best_equality_residual"]["diagnostics"],
        "best_joint_diagnostics": result["best_joint_refinement"]["diagnostics"],
        "best_exact_cyclic_order_diagnostics": (
            None if result["best_exact_cyclic_order_candidate"] is None
            else result["best_exact_cyclic_order_candidate"]["diagnostics"]
        ),
        "output": str(args.output.resolve()),
        "trust_boundary": TRUST_BOUNDARY,
    }
    print(json.dumps(summary, sort_keys=True))


if __name__ == "__main__":
    main()

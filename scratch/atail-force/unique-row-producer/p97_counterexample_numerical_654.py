#!/usr/bin/env python3
"""Numerical real-feasibility scout for the hash-bound 654 row system.

This is a search heuristic, never an UNSAT oracle.  It keeps the same
``p0=(0,0), p1=(1,0)`` gauge as the exact probe, starts from strict convex
polygons in the saved cyclic order, and minimizes the 37 row equalities plus
barriers for distinctness and positive boundary-edge orientation.

A successful floating-point point is only a candidate for exact replay.  A
failed search is reported as ``NO_WITNESS_FOUND`` rather than infeasibility.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import math
from pathlib import Path
import sys
from typing import Any

import numpy as np
from scipy.optimize import least_squares


HERE = Path(__file__).resolve().parent
EXACT_PROBE = HERE / "p97_counterexample_realizability_654.py"


def load_exact_probe() -> Any:
    spec = importlib.util.spec_from_file_location("p97_654_exact_probe", EXACT_PROBE)
    if spec is None or spec.loader is None:
        raise AssertionError("exact probe import failed")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def unpack(vector: np.ndarray, n: int) -> np.ndarray:
    points = np.empty((n, 2), dtype=float)
    points[0] = (0.0, 0.0)
    points[1] = (1.0, 0.0)
    points[2:] = vector.reshape((n - 2, 2))
    return points


def regular_start(probe: Any) -> np.ndarray:
    roots = np.empty((probe.N, 2), dtype=float)
    for position, label in enumerate(probe.CYCLIC_ORDER):
        angle = 2.0 * math.pi * position / probe.N
        roots[label] = (math.cos(angle), math.sin(angle))
    z = roots[:, 0] + 1j * roots[:, 1]
    normalized = (z - z[0]) / (z[1] - z[0])
    points = np.column_stack((normalized.real, normalized.imag))
    return points[2:].reshape(-1)


def equality_residuals(points: np.ndarray, probe: Any) -> np.ndarray:
    result = []
    for center, support in probe.ROWS:
        pivot = support[0]
        pivot_d2 = float(np.sum((points[center] - points[pivot]) ** 2))
        for member in support[1:]:
            result.append(
                pivot_d2 - float(np.sum((points[center] - points[member]) ** 2))
            )
    return np.asarray(result)


def distinct_squared_distances(points: np.ndarray) -> np.ndarray:
    return np.asarray([
        float(np.sum((points[left] - points[right]) ** 2))
        for left in range(len(points))
        for right in range(left + 1, len(points))
    ])


def boundary_areas(points: np.ndarray, probe: Any) -> np.ndarray:
    result = []
    order = probe.CYCLIC_ORDER
    for index, left in enumerate(order):
        right = order[(index + 1) % len(order)]
        edge = points[right] - points[left]
        for witness in order:
            if witness in {left, right}:
                continue
            offset = points[witness] - points[left]
            result.append(float(edge[0] * offset[1] - edge[1] * offset[0]))
    return np.asarray(result)


def residual_vector(
    vector: np.ndarray,
    probe: Any,
    *,
    area_margin: float,
    distance_margin: float,
    barrier_weight: float,
) -> np.ndarray:
    points = unpack(vector, probe.N)
    equalities = equality_residuals(points, probe)
    areas = boundary_areas(points, probe)
    distances = distinct_squared_distances(points)
    area_barrier = np.maximum(0.0, area_margin - areas)
    distance_barrier = np.maximum(0.0, distance_margin - distances)
    return np.concatenate((
        equalities,
        barrier_weight * area_barrier,
        barrier_weight * distance_barrier,
    ))


def score(vector: np.ndarray, probe: Any) -> dict[str, float]:
    points = unpack(vector, probe.N)
    equalities = equality_residuals(points, probe)
    distances = distinct_squared_distances(points)
    areas = boundary_areas(points, probe)
    return {
        "equality_l2": float(np.linalg.norm(equalities)),
        "equality_max_abs": float(np.max(np.abs(equalities))),
        "minimum_squared_distance": float(np.min(distances)),
        "minimum_boundary_area": float(np.min(areas)),
        "maximum_abs_coordinate": float(np.max(np.abs(points))),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--starts", type=int, default=8)
    parser.add_argument("--max-nfev", type=int, default=3000)
    parser.add_argument("--seed", type=int, default=654)
    parser.add_argument("--area-margin", type=float, default=1e-5)
    parser.add_argument("--distance-margin", type=float, default=1e-5)
    parser.add_argument("--barrier-weight", type=float, default=30.0)
    args = parser.parse_args()
    if not 1 <= args.starts <= 64:
        raise AssertionError("starts must be in 1..64")
    if not 100 <= args.max_nfev <= 20_000:
        raise AssertionError("max-nfev must be in 100..20000")
    if min(args.area_margin, args.distance_margin, args.barrier_weight) <= 0:
        raise AssertionError("margins and weight must be positive")

    probe = load_exact_probe()
    oracle = probe.load_metric_oracle()
    digest = probe.equality_digest(oracle)
    if digest != probe.EXPECTED_EQUALITY_SHA256:
        raise AssertionError("equality-system hash drift")

    rng = np.random.default_rng(args.seed)
    base = regular_start(probe)
    starts = [base]
    starts.extend(base + rng.normal(scale=0.20, size=base.shape) for _ in range(args.starts - 1))
    records = []
    best_vector = None
    best_key = None
    for index, initial in enumerate(starts):
        result = least_squares(
            residual_vector,
            initial,
            args=(probe,),
            kwargs={
                "area_margin": args.area_margin,
                "distance_margin": args.distance_margin,
                "barrier_weight": args.barrier_weight,
            },
            method="trf",
            jac="2-point",
            x_scale="jac",
            ftol=1e-12,
            xtol=1e-12,
            gtol=1e-12,
            max_nfev=args.max_nfev,
        )
        metrics = score(result.x, probe)
        feasible_geometry = (
            metrics["minimum_squared_distance"] > 0
            and metrics["minimum_boundary_area"] > 0
        )
        key = (
            not feasible_geometry,
            metrics["equality_max_abs"],
            -metrics["minimum_boundary_area"],
            -metrics["minimum_squared_distance"],
        )
        if best_key is None or key < best_key:
            best_key = key
            best_vector = result.x.copy()
        records.append({
            "start": index,
            "success_flag": bool(result.success),
            "status": int(result.status),
            "message": result.message,
            "nfev": int(result.nfev),
            "cost": float(result.cost),
            **metrics,
        })

    assert best_vector is not None
    best = score(best_vector, probe)
    witness_threshold = 1e-9
    classification = (
        "NUMERICAL_WITNESS_REQUIRES_EXACT_REPLAY"
        if best["equality_max_abs"] < witness_threshold
        and best["minimum_squared_distance"] > 0
        and best["minimum_boundary_area"] > 0
        else "NO_WITNESS_FOUND_NOT_AN_UNSAT_RESULT"
    )
    output: dict[str, Any] = {
        "schema": "p97-654-numerical-real-feasibility-scout-v1",
        "equality_sha256": digest,
        "policy": {
            "starts": args.starts,
            "max_nfev": args.max_nfev,
            "seed": args.seed,
            "area_margin": args.area_margin,
            "distance_margin": args.distance_margin,
            "barrier_weight": args.barrier_weight,
            "witness_equality_threshold": witness_threshold,
        },
        "classification": classification,
        "best": best,
        "runs": records,
        "trust_boundary": (
            "floating-point nonlinear least squares; success needs exact model replay; "
            "failure is not evidence of infeasibility"
        ),
    }
    if classification.startswith("NUMERICAL_WITNESS"):
        output["candidate_coordinates"] = unpack(best_vector, probe.N).tolist()
    print(json.dumps(output, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

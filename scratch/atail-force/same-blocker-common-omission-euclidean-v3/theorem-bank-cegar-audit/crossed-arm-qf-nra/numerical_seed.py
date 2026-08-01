#!/usr/bin/env python3
"""Heuristic numerical seed search for the exact edge-convex QF_NRA cores.

Success is only a floating-point seed.  Failure is not infeasibility evidence.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
from itertools import combinations
from math import cos, pi, sin
from pathlib import Path
import sys

import numpy as np
from scipy.optimize import least_squares


HERE = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location("crossed_qfnra", HERE / "crossed_arm_qf_nra.py")
MODULE = importlib.util.module_from_spec(SPEC)
sys.modules["crossed_qfnra"] = MODULE
assert SPEC.loader is not None
SPEC.loader.exec_module(MODULE)


def normalize_regular(order: list[str]) -> np.ndarray:
    n = len(order)
    raw = np.asarray([(cos(2 * pi * i / n), sin(2 * pi * i / n)) for i in range(n)])
    origin_index = order.index("q1")
    unit_index = order.index("p1")
    z0 = complex(*raw[origin_index])
    z1 = complex(*raw[unit_index])
    normalized = np.asarray([(complex(*point) - z0) / (z1 - z0) for point in raw])
    return np.column_stack((normalized.real, normalized.imag))


def search(arm: str, restarts: int, max_nfev: int) -> dict:
    core = MODULE.load_core(arm)
    order = core["retained_order"]
    index = {name: i for i, name in enumerate(order)}
    fixed = {"q1", "p1"}
    free = [name for name in order if name not in fixed]

    def unpack(vector: np.ndarray) -> np.ndarray:
        coords = np.empty((len(order), 2))
        coords[index["q1"]] = (0.0, 0.0)
        coords[index["p1"]] = (1.0, 0.0)
        for name, value in zip(free, vector.reshape((-1, 2)), strict=True):
            coords[index[name]] = value
        return coords

    def pack(coords: np.ndarray) -> np.ndarray:
        return np.asarray([coords[index[name]] for name in free]).reshape(-1)

    def d2(coords: np.ndarray, a: str, b: str) -> float:
        delta = coords[index[a]] - coords[index[b]]
        return float(delta @ delta)

    def orient(coords: np.ndarray, a: str, b: str, c: str) -> float:
        u = coords[index[b]] - coords[index[a]]
        v = coords[index[c]] - coords[index[a]]
        return float(u[0] * v[1] - u[1] * v[0])

    def diagnostics(coords: np.ndarray) -> dict:
        equalities: list[float] = []
        exact_gaps: list[float] = []
        for role in ("bp", "bq", "br"):
            center = core["centers"][role]
            row = core["rows"][role]
            radius = d2(coords, center, row[0])
            equalities.extend(d2(coords, center, target) - radius for target in row[1:])
            exact_gaps.extend(abs(d2(coords, center, target) - radius)
                              for target in order if target != center and target not in row)
        edge_values = []
        for i, a in enumerate(order):
            b = order[(i + 1) % len(order)]
            edge_values.extend(orient(coords, a, b, c) for c in order if c not in {a, b})
        pair_values = [d2(coords, a, b) for a, b in combinations(order, 2)]
        return {
            "max_abs_row_equality": max(abs(x) for x in equalities),
            "min_edge_orientation": min(edge_values),
            "min_pair_squared_distance": min(pair_values),
            "min_retained_exactness_gap": min(exact_gaps),
        }

    equality_scale = 1.0e-5
    edge_margin = 1.0e-7
    pair_margin = 1.0e-7
    exactness_margin = 1.0e-7

    def hinge(value: float, margin: float) -> float:
        return max(0.0, (margin - value) / margin)

    def objective(vector: np.ndarray) -> np.ndarray:
        coords = unpack(vector)
        residuals: list[float] = []
        for role in ("bp", "bq", "br"):
            center = core["centers"][role]
            row = core["rows"][role]
            radius = d2(coords, center, row[0])
            residuals.extend((d2(coords, center, target) - radius) / equality_scale
                             for target in row[1:])
            residuals.extend(hinge(abs(d2(coords, center, target) - radius), exactness_margin)
                             for target in order if target != center and target not in row)
        for a, b in combinations(order, 2):
            residuals.append(hinge(d2(coords, a, b), pair_margin))
        for i, a in enumerate(order):
            b = order[(i + 1) % len(order)]
            residuals.extend(hinge(orient(coords, a, b, c), edge_margin)
                             for c in order if c not in {a, b})
        return np.asarray(residuals)

    base = normalize_regular(order)
    best = None
    runs = []
    for seed in range(restarts):
        rng = np.random.default_rng(seed)
        initial = base.copy()
        for name in free:
            initial[index[name]] += rng.normal(scale=0.08, size=2)
        fit = least_squares(objective, pack(initial), max_nfev=max_nfev,
                            xtol=1e-13, ftol=1e-13, gtol=1e-13)
        coords = unpack(fit.x)
        diag = diagnostics(coords)
        score = float(np.linalg.norm(objective(fit.x)))
        run = {"seed": seed, "score": score, "nfev": fit.nfev, "diagnostics": diag}
        runs.append(run)
        if best is None or score < best[0]:
            best = (score, coords, run)
        if (diag["max_abs_row_equality"] < 1e-8
                and diag["min_edge_orientation"] > 0
                and diag["min_pair_squared_distance"] > 0
                and diag["min_retained_exactness_gap"] > 0):
            break
    assert best is not None
    score, coords, run = best
    diag = diagnostics(coords)
    numerical_feasible = (
        diag["max_abs_row_equality"] < 1e-8
        and diag["min_edge_orientation"] > 0
        and diag["min_pair_squared_distance"] > 0
        and diag["min_retained_exactness_gap"] > 0
    )
    return {
        "classification": "floating-point heuristic; not SAT/UNSAT evidence",
        "arm": arm,
        "status": "NUMERICAL_FEASIBLE_SEED" if numerical_feasible else "NO_SEED_FOUND",
        "restarts_requested": restarts,
        "runs_completed": len(runs),
        "max_nfev": max_nfev,
        "best": run,
        "runs": runs,
        "coordinates": {name: coords[index[name]].tolist() for name in order},
        "trust_boundary": "all diagnostics are floating point; failure is not infeasibility",
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--arm", choices=MODULE.ARMS, required=True)
    parser.add_argument("--restarts", type=int, default=8)
    parser.add_argument("--max-nfev", type=int, default=4000)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    result = search(args.arm, args.restarts, args.max_nfev)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"arm": result["arm"], "status": result["status"],
                      "best": result["best"]}, sort_keys=True))


if __name__ == "__main__":
    main()

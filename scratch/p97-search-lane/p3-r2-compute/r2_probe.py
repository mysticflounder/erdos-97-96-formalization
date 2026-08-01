#!/usr/bin/env python3
"""Reproducible nonlinear probes for the two open P3/R2 subcases.

This is empirical only.  The distance constraints are built into unit-vector
parameterizations.  Strict convexity is tested with the full supporting-line
system: for every directed polygon edge, every nonincident vertex must lie
strictly on the same (selected) side.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import numpy as np
from scipy.optimize import differential_evolution, minimize


def u(t: float) -> np.ndarray:
    return np.array([np.cos(t), np.sin(t)])


def points_c2(x: np.ndarray) -> tuple[list[str], np.ndarray]:
    """Path b-e1-a-p-d-e2-c; polygon order a,c,b,d,e2,p,e1."""
    tb, te1, td, te2, tc = x
    a = np.array([0.0, 0.0])
    p = np.array([1.0, 0.0])
    e1 = a + u(te1)
    b = e1 + u(tb)
    d = p + u(td)
    e2 = d + u(te2)
    c = e2 + u(tc)
    return ["a", "c", "b", "d", "e2", "p", "e1"], np.array(
        [a, c, b, d, e2, p, e1]
    )


def points_c1(x: np.ndarray) -> tuple[list[str], np.ndarray]:
    """Two unit-edge fans; polygon order a,c,b,d,e2,eh,ek,e1."""
    tek, tb, tx, ty, te2, td, teh = x
    a = np.array([0.0, 0.0])
    e1 = np.array([1.0, 0.0])
    ek = a + u(tek)
    b = e1 + u(tb)
    c = np.array([tx, ty])
    e2 = c + u(te2)
    d = e2 + u(td)
    eh = d + u(teh)
    return ["a", "c", "b", "d", "e2", "eh", "ek", "e1"], np.array(
        [a, c, b, d, e2, eh, ek, e1]
    )


def supporting_crosses(points: np.ndarray, sign: float) -> np.ndarray:
    n = len(points)
    vals: list[float] = []
    for i in range(n):
        j = (i + 1) % n
        edge = points[j] - points[i]
        for k in range(n):
            if k == i or k == j:
                continue
            rel = points[k] - points[i]
            vals.append(sign * (edge[0] * rel[1] - edge[1] * rel[0]))
    return np.asarray(vals)


def result_record(case: str, sign: float, method: str, seed: int, res) -> dict:
    names, points = (points_c2 if case == "c2" else points_c1)(res.x)
    crosses = supporting_crosses(points, sign)
    return {
        "case": case,
        "orientation_sign": sign,
        "method": method,
        "seed": seed,
        "success": bool(res.success),
        "fun": float(res.fun),
        "margin": float(np.min(crosses)),
        "max_cross": float(np.max(crosses)),
        "parameters": [float(v) for v in res.x],
        "points": {name: [float(z) for z in pt] for name, pt in zip(names, points)},
        "smallest_crosses": [float(v) for v in np.sort(crosses)[:10]],
        "message": str(res.message),
        "nfev": int(res.nfev),
    }


def run(case: str, restarts: int, seed: int, use_de: bool) -> dict:
    rng = np.random.default_rng(seed)
    make = points_c2 if case == "c2" else points_c1
    dim = 5 if case == "c2" else 7
    best: dict | None = None

    for sign in (1.0, -1.0):
        def objective(x: np.ndarray) -> float:
            return -float(np.min(supporting_crosses(make(x)[1], sign)))

        if use_de:
            bounds = [(-np.pi, np.pi)] * dim
            if case == "c1":
                bounds[2:4] = [(-3.0, 3.0), (-3.0, 3.0)]
            res = differential_evolution(
                objective,
                bounds,
                seed=seed + int(sign < 0),
                maxiter=2500,
                popsize=24,
                polish=True,
                workers=1,
                updating="immediate",
                tol=1e-11,
            )
            rec = result_record(case, sign, "differential_evolution", seed, res)
            if best is None or rec["margin"] > best["margin"]:
                best = rec

        for r in range(restarts):
            x0 = rng.uniform(-np.pi, np.pi, dim)
            if case == "c1":
                x0[2:4] = rng.uniform(-2.0, 2.0, 2)
            res = minimize(
                objective,
                x0,
                method="Nelder-Mead",
                options={
                    "maxiter": 10000,
                    "xatol": 1e-12,
                    "fatol": 1e-12,
                },
            )
            rec = result_record(case, sign, "Nelder-Mead", seed + r, res)
            if best is None or rec["margin"] > best["margin"]:
                best = rec

    assert best is not None
    return best


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--case", choices=["c1", "c2"], required=True)
    parser.add_argument("--restarts", type=int, default=10)
    parser.add_argument("--seed", type=int, default=20260728)
    parser.add_argument("--de", action="store_true")
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    out = run(args.case, args.restarts, args.seed, args.de)
    args.output.write_text(json.dumps(out, indent=2) + "\n")
    print(
        json.dumps(
            {
                k: out[k]
                for k in (
                    "case",
                    "orientation_sign",
                    "method",
                    "seed",
                    "success",
                    "margin",
                    "nfev",
                )
            }
        )
    )


if __name__ == "__main__":
    main()

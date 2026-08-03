#!/usr/bin/env python3
"""Numerical realizability probe for the 15-point E1 incidence survivor.

This is theorem-discovery evidence, not a proof certificate.  It takes the
full-shell incidence shadow from ``scratch/triapex-incidence-obstruction`` and
adds the exact Euclidean consequences of its three six-point apex classes.

Those classes force the three Moser apices to form a unit equilateral
triangle.  The four strict points in each cap then lie on the corresponding
open unit-circle arc between the other two apices.  Hence the complete
convex/MEC geometry of this S6/S6/S6 shadow is parameterized by twelve angles.
The residuals are the three independent squared-distance equalities in each
of the twelve proposed full critical shells.

The probe searches all cyclic label orders implicitly: the four angle
variables in a cap are independently bounded on its open arc and may cross.
Any small-residual candidate is audited for distinctness and for exact-shell
nonmembership gaps.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import os
import runpy
from concurrent.futures import ProcessPoolExecutor
from dataclasses import asdict, dataclass
from pathlib import Path

import numpy as np
from scipy.optimize import least_squares


REPO = Path(__file__).resolve().parents[2]
SHADOW_PATH = REPO / "scratch/triapex-incidence-obstruction/check_model.py"
SHADOW = runpy.run_path(str(SHADOW_PATH))
SHELLS: tuple[frozenset[int], ...] = SHADOW["SHELLS"]
BLOCKER: tuple[int, ...] = SHADOW["BLOCKER"]

SQRT3 = math.sqrt(3.0)
APEX_COORDS = {
    12: np.array((0.0, 0.0)),
    13: np.array((1.0, 0.0)),
    14: np.array((0.5, SQRT3 / 2.0)),
}
# Each tuple is (point labels, circle center, lower angle, upper angle).
CAP_ARCS = (
    ((0, 1, 2, 3), 12, 0.0, math.pi / 3.0),
    ((4, 5, 6, 7), 13, 2.0 * math.pi / 3.0, math.pi),
    ((8, 9, 10, 11), 14, -2.0 * math.pi / 3.0, -math.pi / 3.0),
)


@dataclass(frozen=True)
class TrialResult:
    seed: int
    cost: float
    residual_l2: float
    residual_max: float
    optimality: float
    nfev: int
    status: int
    min_same_cap_angle_gap: float
    min_point_distance: float
    min_off_shell_squared_gap: float
    angles: list[float]


def coordinates(angles: np.ndarray) -> np.ndarray:
    points = np.zeros((15, 2), dtype=float)
    for apex, coord in APEX_COORDS.items():
        points[apex] = coord
    cursor = 0
    for labels, center, _lower, _upper in CAP_ARCS:
        origin = points[center]
        for label in labels:
            theta = angles[cursor]
            points[label] = origin + np.array((math.cos(theta), math.sin(theta)))
            cursor += 1
    return points


def squared_distance(points: np.ndarray, left: int, right: int) -> float:
    delta = points[left] - points[right]
    return float(delta @ delta)


def shell_residuals(angles: np.ndarray) -> np.ndarray:
    points = coordinates(angles)
    residuals: list[float] = []
    for center, support in enumerate(SHELLS):
        ordered = sorted(support)
        base = squared_distance(points, center, ordered[0])
        residuals.extend(
            squared_distance(points, center, point) - base
            for point in ordered[1:]
        )
    return np.asarray(residuals)


def audit(angles: np.ndarray) -> tuple[float, float, float]:
    points = coordinates(angles)
    angle_gap = math.inf
    cursor = 0
    for labels, _center, _lower, _upper in CAP_ARCS:
        cap_angles = sorted(float(x) for x in angles[cursor : cursor + len(labels)])
        cursor += len(labels)
        angle_gap = min(
            angle_gap,
            *(right - left for left, right in zip(cap_angles, cap_angles[1:])),
        )

    point_gap = min(
        math.sqrt(squared_distance(points, left, right))
        for left in range(15)
        for right in range(left + 1, 15)
    )

    off_shell_gap = math.inf
    for source in range(15):
        center = BLOCKER[source]
        support = SHELLS[center]
        witness = next(iter(support))
        radius_sq = squared_distance(points, center, witness)
        for point in range(15):
            if point == center or point in support:
                continue
            off_shell_gap = min(
                off_shell_gap,
                abs(squared_distance(points, center, point) - radius_sq),
            )
    return angle_gap, point_gap, off_shell_gap


def bounds(epsilon: float) -> tuple[np.ndarray, np.ndarray]:
    lowers: list[float] = []
    uppers: list[float] = []
    for labels, _center, lower, upper in CAP_ARCS:
        lowers.extend([lower + epsilon] * len(labels))
        uppers.extend([upper - epsilon] * len(labels))
    return np.asarray(lowers), np.asarray(uppers)


def run_trial(payload: tuple[int, int, float]) -> TrialResult:
    seed, max_nfev, epsilon = payload
    rng = np.random.default_rng(seed)
    lower, upper = bounds(epsilon)
    initial = rng.uniform(lower, upper)
    fit = least_squares(
        shell_residuals,
        initial,
        bounds=(lower, upper),
        method="trf",
        ftol=1e-13,
        xtol=1e-13,
        gtol=1e-13,
        max_nfev=max_nfev,
    )
    residual = shell_residuals(fit.x)
    angle_gap, point_gap, off_shell_gap = audit(fit.x)
    return TrialResult(
        seed=seed,
        cost=float(fit.cost),
        residual_l2=float(np.linalg.norm(residual)),
        residual_max=float(np.max(np.abs(residual))),
        optimality=float(fit.optimality),
        nfev=int(fit.nfev),
        status=int(fit.status),
        min_same_cap_angle_gap=float(angle_gap),
        min_point_distance=float(point_gap),
        min_off_shell_squared_gap=float(off_shell_gap),
        angles=[float(x) for x in fit.x],
    )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--restarts", type=int, default=2400)
    parser.add_argument("--workers", type=int, default=min(24, os.cpu_count() or 1))
    parser.add_argument("--max-nfev", type=int, default=4000)
    parser.add_argument("--seed", type=int, default=979615)
    parser.add_argument("--epsilon", type=float, default=1e-8)
    parser.add_argument("--top", type=int, default=24)
    parser.add_argument("--out", type=Path, required=True)
    args = parser.parse_args()

    payloads = [
        (args.seed + index, args.max_nfev, args.epsilon)
        for index in range(args.restarts)
    ]
    with ProcessPoolExecutor(max_workers=args.workers) as pool:
        results = list(pool.map(run_trial, payloads, chunksize=1))
    results.sort(key=lambda item: (item.residual_max, item.residual_l2))

    source_sha = hashlib.sha256(SHADOW_PATH.read_bytes()).hexdigest()
    output = {
        "scope": "numerical theorem-discovery probe; not a proof certificate",
        "model": "n=15 E1 pairedCommonDeletion incidence survivor, S6/S6/S6",
        "input": str(SHADOW_PATH.relative_to(REPO)),
        "input_sha256": source_sha,
        "restarts": args.restarts,
        "workers": args.workers,
        "max_nfev": args.max_nfev,
        "seed": args.seed,
        "epsilon": args.epsilon,
        "successful_exact_scale": sum(r.residual_max < 1e-10 for r in results),
        "successful_nondegenerate": sum(
            r.residual_max < 1e-10
            and r.min_same_cap_angle_gap > 1e-6
            and r.min_point_distance > 1e-6
            and r.min_off_shell_squared_gap > 1e-6
            for r in results
        ),
        "top": [asdict(result) for result in results[: args.top]],
    }
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(output, indent=2) + "\n")
    best = results[0]
    print(f"output={args.out}")
    print(f"restarts={args.restarts} workers={args.workers}")
    print(f"best_residual_max={best.residual_max:.17g}")
    print(f"best_residual_l2={best.residual_l2:.17g}")
    print(f"best_min_angle_gap={best.min_same_cap_angle_gap:.17g}")
    print(f"best_min_point_distance={best.min_point_distance:.17g}")
    print(f"best_min_off_shell_squared_gap={best.min_off_shell_squared_gap:.17g}")
    print(f"successful_nondegenerate={output['successful_nondegenerate']}")


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Equality-parametrized MEC feasibility search for the `(4,5,6)` residual.

Discovery only.  Every four-row distance equality is true by construction;
the optimizer searches only the circle parameters and scores strict convexity,
pairwise distinctness, exact-row exclusions, the nonobtuse fixed triangle,
and containment in its circumdisk.  This is independent of the Cartesian
SLSQP probe in ``common_system_mec_optimizer.py``.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
from typing import Any

import numpy as np
from scipy.optimize import differential_evolution, minimize


HERE = Path(__file__).resolve().parent
OUTPUT = HERE / "residual_456_mec_parametric_optimizer.json"
ORDER = (0, 8, 9, 10, 11, 1, 3, 4, 2, 5, 6, 7)
ROWS = {
    0: (1, 3, 4, 5),
    1: (0, 2, 5, 6),
    2: (1, 7, 8, 9),
    3: (0, 7, 10, 11),
}


def circle(center: np.ndarray, angle: float) -> np.ndarray:
    return center + np.array([math.cos(angle), math.sin(angle)])


def intersection7(point2: np.ndarray, point3: np.ndarray, branch: int) -> np.ndarray | None:
    delta = point3 - point2
    distance = float(np.linalg.norm(delta))
    if not 1e-10 < distance < 2.0:
        return None
    midpoint = (point2 + point3) / 2.0
    height = math.sqrt(max(0.0, 1.0 - distance * distance / 4.0))
    normal = np.array([-delta[1], delta[0]]) / distance
    return midpoint + branch * height * normal


def points_of(values: np.ndarray, branch: int) -> dict[int, np.ndarray] | None:
    a3, a4, b2, b6, t8, t9, t10, t11 = values
    points = {
        0: np.array([0.0, 0.0]),
        1: np.array([1.0, 0.0]),
    }
    points[3] = circle(points[0], a3)
    points[4] = circle(points[0], a4)
    points[5] = np.array([0.5, math.sqrt(3.0) / 2.0])
    points[2] = circle(points[1], b2)
    points[6] = circle(points[1], b6)
    point7 = intersection7(points[2], points[3], branch)
    if point7 is None:
        return None
    points[7] = point7
    points[8] = circle(points[2], t8)
    points[9] = circle(points[2], t9)
    points[10] = circle(points[3], t10)
    points[11] = circle(points[3], t11)
    return points


def cross(a: np.ndarray, b: np.ndarray, c: np.ndarray) -> float:
    ab = b - a
    ac = c - a
    return float(ab[0] * ac[1] - ab[1] * ac[0])


def diagnostics(values: np.ndarray, branch: int) -> dict[str, Any]:
    points = points_of(values, branch)
    if points is None:
        return {"score": -1e6}
    convex = [
        cross(points[ORDER[index]], points[ORDER[(index + 1) % len(ORDER)]], points[label])
        for index in range(len(ORDER))
        for label in ORDER
        if label not in (ORDER[index], ORDER[(index + 1) % len(ORDER)])
    ]
    x2, y2 = points[2]
    center = np.array([0.5, (x2 * x2 + y2 * y2 - x2) / (2.0 * y2)])
    radius_squared = float(center @ center)
    disk = [
        radius_squared - float((points[label] - center) @ (points[label] - center))
        for label in ORDER
        if label not in (0, 1, 2)
    ]
    pairwise = [
        float((points[left] - points[right]) @ (points[left] - points[right]))
        for left in ORDER
        for right in ORDER
        if left < right
    ]
    exact_gaps = []
    for center_label, support in ROWS.items():
        support_set = set(support)
        for label in ORDER:
            if label != center_label and label not in support_set:
                distance_squared = float(
                    (points[center_label] - points[label]) @ (points[center_label] - points[label])
                )
                exact_gaps.append(abs(distance_squared - 1.0))
    p0, p1, p2 = points[0], points[1], points[2]
    nonobtuse = [
        float((p1 - p0) @ (p2 - p0)),
        float((p2 - p1) @ (p0 - p1)),
        float((p0 - p2) @ (p1 - p2)),
    ]
    # Equalities are parametrically exact to floating roundoff.  Search for a
    # robust positive margin; exact-row disequalities are audited but not part
    # of the smooth objective because abs/min creates many shallow kinks.
    score = min(min(convex), min(disk), min(pairwise), min(nonobtuse))
    return {
        "score": score,
        "min_convex_cross": min(convex),
        "min_disk_margin": min(disk),
        "min_pairwise_squared_distance": min(pairwise),
        "min_exact_squared_gap": min(exact_gaps),
        "min_nonobtuse_inner_product": min(nonobtuse),
        "circumcenter": center.tolist(),
        "circumradius_squared": radius_squared,
        "coordinates": {str(label): points[label].tolist() for label in ORDER},
        "angles": values.tolist(),
        "branch": branch,
    }


def solve(seed: int) -> dict[str, Any]:
    bounds = [
        (1e-4, math.pi / 3.0 - 1e-4),
        (1e-4, math.pi / 3.0 - 1e-4),
        (math.pi / 2.0, 2.0 * math.pi / 3.0),
        (2.0 * math.pi / 3.0, math.pi - 1e-4),
        (math.pi, 2.0 * math.pi),
        (math.pi, 2.0 * math.pi),
        (math.pi, 2.0 * math.pi),
        (math.pi, 2.0 * math.pi),
    ]
    best: dict[str, Any] | None = None
    for branch in (-1, 1):
        result = differential_evolution(
            lambda values: -diagnostics(values, branch)["score"],
            bounds,
            seed=seed + branch,
            maxiter=1000,
            popsize=20,
            tol=1e-10,
            polish=False,
            workers=1,
        )
        polished = minimize(
            lambda values: -diagnostics(values, branch)["score"],
            result.x,
            method="Nelder-Mead",
            options={"maxiter": 20_000, "xatol": 1e-12, "fatol": 1e-12},
        )
        report = diagnostics(polished.x, branch)
        report.update(
            {
                "optimizer_success": bool(polished.success),
                "optimizer_message": str(polished.message),
            }
        )
        if best is None or report["score"] > best["score"]:
            best = report
    assert best is not None
    return best


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--seed", type=int, default=4569796)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    result = solve(args.seed)
    report = {
        "schema": "p97-atail-residual-456-mec-parametric-search-v1",
        "epistemic_status": "NUMERICAL_DISCOVERY_ONLY_NOT_A_PROOF",
        "encoded": [
            "all four residual rows by exact circle parametrization",
            "saved strict convex cyclic order",
            "all points in the circumdisk through labels 0,1,2",
            "nonobtuse triangle 0,1,2",
            "pairwise distinctness",
            "exact-row off-support gap audit",
        ],
        "omitted": [
            "all-center K4/FaithfulCarrierPattern",
            "live dangerous/full-filter/no-M44 fields",
        ],
        "result": result,
    }
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.write:
        OUTPUT.write_text(rendered, encoding="utf-8")
        print(f"wrote {OUTPUT}")
        print(f"score={result['score']}")
    else:
        print(rendered, end="")
    return 0 if result["score"] > 1e-7 and result["min_exact_squared_gap"] > 1e-7 else 1


if __name__ == "__main__":
    raise SystemExit(main())

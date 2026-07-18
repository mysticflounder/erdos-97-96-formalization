#!/usr/bin/env python3
"""Search one source-faithful full-parent local geometry cell.

This extends a positive three-complete-row homotopy checkpoint with:

* unequal-radius, disjoint T0/T1 rows at ``right``;
* two strict first-opposite-cap hits, one physical-cap hit and one
  surplus-cap hit in each first-apex row;
* the retained frontier pair equal to the two T0 strict-cap hits; and
* an unused physical-cap source ``c1`` whose actual blocker is ``left`` and
  whose exact four-shell is ``{c1, uI, uS0, uS1}``.

The continuation sources are ``q0`` and ``q1``.  They are absent from the
unused row, while deletion of either preserves the unused row and the exact
five-point physical row at ``o``.  The unused row has zero physical exact-five
strict hits.  The script is a bounded witness search for this single identity
cell, never an UNSAT or coverage procedure.
"""

from __future__ import annotations

import argparse
from functools import partial
import json
import math
from pathlib import Path
import sys

import numpy as np
from scipy.optimize import differential_evolution, minimize


PREDECESSOR = Path(__file__).resolve().parents[1] / "cycle-three-rows-euclidean"
sys.path.insert(0, str(PREDECESSOR))
import search_cycle_three_rows as base  # noqa: E402


T0 = ("t0i0", "t0i1", "t0o", "t0s")
T1 = ("t1i0", "t1i1", "t1o", "t1s")
UNUSED_SOURCE = "c1"
UNUSED_ROW = (UNUSED_SOURCE, "uI", "uS0", "uS1")
PHYSICAL_FIVE = {"left", "q0", "q1", "q2", "right"}
REVERSE_ROWS = (
    ("c0", ("q0", "q1", "x00", "x01")),
    ("c1", ("q1", "q2", "x10", "x11")),
    ("c2", ("q2", "q0", "x20", "x21")),
)


def rotate(point: np.ndarray, theta: float) -> np.ndarray:
    cosine, sine = math.cos(theta), math.sin(theta)
    return np.array([
        cosine * point[0] - sine * point[1],
        sine * point[0] + cosine * point[1],
    ])


def sqdist(first: np.ndarray, second: np.ndarray) -> float:
    delta = first - second
    return float(delta @ delta)


def cross(first: np.ndarray, second: np.ndarray, point: np.ndarray) -> float:
    u, v = second - first, point - first
    return float(u[0] * v[1] - u[1] * v[0])


def cyclic_order(points: dict[str, np.ndarray]) -> tuple[str, ...]:
    centroid = sum(points.values()) / len(points)
    return tuple(sorted(points, key=lambda name: math.atan2(
        points[name][1] - centroid[1], points[name][0] - centroid[0])))


def load_base_parameters(path: Path) -> np.ndarray:
    payload = json.loads(path.read_text())
    records = payload.get("records", [])
    if not records:
        raise ValueError(f"checkpoint has no continuation records: {path}")
    positive = [record for record in records if record["minimum_margin"] > 0]
    if not positive:
        raise ValueError(f"checkpoint has no positive record: {path}")
    return np.array(positive[-1]["parameters"], dtype=float)


def split_parameters(parameters: np.ndarray, stage: str) -> tuple[np.ndarray, np.ndarray]:
    if stage == "t0t1":
        return parameters, np.empty(0)
    if stage == "unused":
        return np.empty(0), parameters
    return parameters[:10], parameters[10:]


def construct(
    parameters: np.ndarray,
    base_parameters: tuple[float, ...],
    stage: str,
) -> dict[str, np.ndarray]:
    points = base.construct(np.array(base_parameters, dtype=float))
    t_parameters, unused_parameters = split_parameters(parameters, stage)
    if stage in ("t0t1", "full"):
        r0, r1, *angles = map(float, t_parameters)
        right = points["right"]
        for name, angle in zip((*T0, *T1), angles, strict=True):
            radius = r0 if name.startswith("t0") else r1
            points[name] = right + radius * base.unit(angle)
    if stage in ("unused", "full"):
        left = points["left"]
        radius_vector = points[UNUSED_SOURCE] - left
        for name, angle in zip(("uI", "uS0", "uS1"), unused_parameters, strict=True):
            points[name] = left + rotate(radius_vector, float(angle))
    return points


def opposite_cap_margin(
    points: dict[str, np.ndarray],
    endpoint0: str,
    endpoint1: str,
    opposite: str,
    point: str,
) -> float:
    reference = cross(points[endpoint0], points[endpoint1], points[opposite])
    value = cross(points[endpoint0], points[endpoint1], points[point])
    return -reference * value - 1e-7


def exact_class_exclusions(
    points: dict[str, np.ndarray],
    center_name: str,
    support: set[str],
) -> list[float]:
    center = points[center_name]
    reference_name = next(iter(support))
    radius_sq = sqdist(center, points[reference_name])
    return [
        abs(sqdist(center, point) - radius_sq) - 1e-7
        for name, point in points.items()
        if name != center_name and name not in support
    ]


def equality_gates(
    points: dict[str, np.ndarray],
    center_name: str,
    support: tuple[str, ...],
) -> list[float]:
    center = points[center_name]
    radius_sq = sqdist(center, points[support[0]])
    return [
        1e-8 - abs(sqdist(center, points[name]) - radius_sq)
        for name in support[1:]
    ]


def singleton_other_radii(
    points: dict[str, np.ndarray],
    center_name: str,
    excluded_support: set[str],
) -> list[float]:
    """Strong generic audit: every other named radius is a singleton."""
    names = [
        name for name in points
        if name != center_name and name not in excluded_support
    ]
    center = points[center_name]
    return [
        abs(sqdist(center, points[first]) - sqdist(center, points[second])) - 1e-7
        for index, first in enumerate(names)
        for second in names[:index]
    ] or [1.0]


def groups(
    parameters: np.ndarray,
    base_parameters: tuple[float, ...],
    stage: str,
) -> dict[str, list[float]]:
    points = construct(parameters, base_parameters, stage)
    order = cyclic_order(points)
    apex = float(base_parameters[0])
    right = points["right"]
    mec_center = np.array([0.5, (1.0 - right[0]) / (2.0 * right[1])])
    mec_radius_sq = sqdist(mec_center, points["o"])
    result: dict[str, list[float]] = {
        "strict_hull": [],
        "pairwise_distinct": [],
        "mec_containment": [],
        "cap_roles": [],
        "physical_exact_five_exclusions": [],
        "reverse_row_exclusions": [],
        "reverse_nonreturn": [],
        "parameterized_equalities_audit": [],
        "critical_no_other_K4_audit": [],
    }
    for index, first in enumerate(order):
        second = order[(index + 1) % len(order)]
        for name in order:
            if name not in (first, second):
                result["strict_hull"].append(
                    cross(points[first], points[second], points[name]) - 1e-7)
    names = tuple(points)
    for index, first in enumerate(names):
        for second in names[:index]:
            result["pairwise_distinct"].append(
                sqdist(points[first], points[second]) - 1e-7)
    for name, point in points.items():
        if name not in ("o", "left", "right"):
            result["mec_containment"].append(
                mec_radius_sq - sqdist(mec_center, point) + 1e-10)

    if stage in ("t0t1", "full"):
        for name in ("t0i0", "t0i1", "t1i0", "t1i1"):
            result["cap_roles"].append(
                opposite_cap_margin(points, "o", "left", "right", name))
        for name in ("t0o", "t1o"):
            result["cap_roles"].append(
                opposite_cap_margin(points, "left", "right", "o", name))
        for name in ("t0s", "t1s"):
            result["cap_roles"].append(
                opposite_cap_margin(points, "right", "o", "left", name))
        r0, r1 = map(float, parameters[:2])
        result["radius_split"] = [abs(r0 - r1) - 1e-3]
        result["first_row_exclusions"] = (
            exact_class_exclusions(points, "right", set(T0)) +
            exact_class_exclusions(points, "right", set(T1))
        )
        result["parameterized_equalities_audit"].extend(
            equality_gates(points, "right", T0))
        result["parameterized_equalities_audit"].extend(
            equality_gates(points, "right", T1))

    if stage in ("unused", "full"):
        result["cap_roles"].append(
            opposite_cap_margin(points, "o", "left", "right", "uI"))
        for name in ("uS0", "uS1"):
            result["cap_roles"].append(
                opposite_cap_margin(points, "right", "o", "left", name))
        result["unused_row_exclusions"] = exact_class_exclusions(
            points, "left", set(UNUSED_ROW))
        result["parameterized_equalities_audit"].extend(
            equality_gates(points, "left", UNUSED_ROW))
        result["critical_no_other_K4_audit"].extend(
            singleton_other_radii(points, "left", set(UNUSED_ROW)))

    for name, point in points.items():
        if name not in PHYSICAL_FIVE and name != "o":
            result["physical_exact_five_exclusions"].append(
                abs(sqdist(points["o"], point) - 1.0) - 1e-7)
    result["critical_no_other_K4_audit"].extend(
        singleton_other_radii(points, "o", PHYSICAL_FIVE))

    for center_name, support_tuple in REVERSE_ROWS:
        support = set(support_tuple)
        result["reverse_row_exclusions"].extend(
            exact_class_exclusions(points, center_name, support))
        result["parameterized_equalities_audit"].extend(
            equality_gates(points, center_name, support_tuple))
        result["critical_no_other_K4_audit"].extend(
            singleton_other_radii(points, center_name, support))
    for first, second in (("x00", "x01"), ("x10", "x11"), ("x20", "x21")):
        result["reverse_nonreturn"].append(
            abs(sqdist(right, points[first]) - sqdist(right, points[second])) - 1e-7)
    if not result["parameterized_equalities_audit"]:
        result["parameterized_equalities_audit"] = [1.0]
    if not result["critical_no_other_K4_audit"]:
        result["critical_no_other_K4_audit"] = [1.0]
    # The base triangle is fixed and already nonobtuse; retain an explicit gate.
    result["support_triangle_nonobtuse"] = [math.pi / 2 - apex - 1e-4]
    return result


def score(
    parameters: np.ndarray,
    base_parameters: tuple[float, ...],
    stage: str,
) -> float:
    ledger = groups(parameters, base_parameters, stage)
    return min(
        value
        for name, values in ledger.items()
        if not name.endswith("_audit")
        for value in values
    )


def objective(
    parameters: np.ndarray,
    base_parameters: tuple[float, ...],
    stage: str,
) -> float:
    return -score(parameters, base_parameters, stage)


def bounds(stage: str) -> list[tuple[float, float]]:
    t_bounds = [
        (0.20, 1.60), (0.20, 1.60),
        *[(-math.pi, math.pi) for _ in range(8)],
    ]
    unused_bounds = [(-math.pi, math.pi) for _ in range(3)]
    if stage == "t0t1":
        return t_bounds
    if stage == "unused":
        return unused_bounds
    return [*t_bounds, *unused_bounds]


def default_initial(stage: str) -> np.ndarray:
    t_initial = np.array([
        0.88, 1.08,
        -1.90, -1.68, -1.05, -2.18,
        -1.48, -1.27, -0.88, -2.35,
    ])
    unused_initial = np.array([-1.4, 1.8, 2.25])
    if stage == "t0t1":
        return t_initial
    if stage == "unused":
        return unused_initial
    return np.concatenate((t_initial, unused_initial))


def seed_from(path: Path) -> np.ndarray:
    payload = json.loads(path.read_text())
    return np.array(payload["result"]["parameters"], dtype=float)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--base-checkpoint", type=Path,
        default=Path(__file__).with_name("homotopy-progress-1p4.json"))
    parser.add_argument("--stage", choices=("t0t1", "unused", "full"), default="full")
    parser.add_argument("--t-seed", type=Path)
    parser.add_argument("--unused-seed", type=Path)
    parser.add_argument("--maxiter", type=int, default=1200)
    parser.add_argument("--popsize", type=int, default=32)
    parser.add_argument("--workers", type=int, default=24)
    parser.add_argument("--seed", type=int, default=20260718)
    parser.add_argument(
        "--output", type=Path,
        default=Path(__file__).with_name("source-faithful-full-cell-search.json"))
    args = parser.parse_args()
    base_array = load_base_parameters(args.base_checkpoint)
    base_parameters = tuple(map(float, base_array))
    initial = default_initial(args.stage)
    if args.stage == "t0t1" and args.t_seed is not None:
        initial = seed_from(args.t_seed)
    elif args.stage == "unused" and args.unused_seed is not None:
        initial = seed_from(args.unused_seed)
    elif args.stage == "full":
        pieces = []
        pieces.append(seed_from(args.t_seed) if args.t_seed else initial[:10])
        pieces.append(seed_from(args.unused_seed) if args.unused_seed else initial[10:])
        initial = np.concatenate(pieces)

    objective_bound = partial(
        objective, base_parameters=base_parameters, stage=args.stage)
    best_seen = {"generation": 0, "score": score(initial, base_parameters, args.stage)}

    def checkpoint_callback(xk: np.ndarray, _convergence: float) -> bool:
        best_seen["generation"] += 1
        current = score(xk, base_parameters, args.stage)
        if current > best_seen["score"]:
            best_seen["score"] = current
        if best_seen["generation"] % 20 == 0:
            args.output.write_text(json.dumps({
                "schema": "source-faithful-full-parent-local-cell-search-v1",
                "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_COVERAGE",
                "status": "RUNNING",
                "stage": args.stage,
                "generation": best_seen["generation"],
                "best_score": best_seen["score"],
                "parameters": xk.tolist(),
            }, indent=2) + "\n")
            print(json.dumps({
                "stage": args.stage,
                "generation": best_seen["generation"],
                "best_score": best_seen["score"],
            }), flush=True)
        return False

    result = differential_evolution(
        objective_bound,
        bounds(args.stage),
        x0=initial,
        seed=args.seed,
        maxiter=args.maxiter,
        popsize=args.popsize,
        workers=args.workers,
        updating="deferred" if args.workers != 1 else "immediate",
        polish=False,
        tol=1e-10,
        atol=1e-12,
        callback=checkpoint_callback,
    )
    candidates = [initial, result.x]
    for start in tuple(candidates):
        polished = minimize(
            objective_bound,
            start,
            method="Powell",
            bounds=bounds(args.stage),
            options={"maxiter": 30_000, "xtol": 1e-12, "ftol": 1e-14},
        )
        candidates.append(polished.x)
    best = max(candidates, key=lambda item: score(item, base_parameters, args.stage))
    ledger = groups(best, base_parameters, args.stage)
    minima = {name: min(values) for name, values in ledger.items()}
    open_minimum = score(best, base_parameters, args.stage)
    audit_minimum = min(
        value for name, value in minima.items() if name.endswith("_audit"))
    points = construct(best, base_parameters, args.stage)
    passed = open_minimum > 0 and audit_minimum > 0
    payload = {
        "schema": "source-faithful-full-parent-local-cell-search-v1",
        "epistemic_status": "BOUNDED_NUMERIC_SEARCH_NOT_COVERAGE",
        "cell": "unequal-disjoint-T0/T1; unused=c1; actualBlocker=left; continuation=q0,q1",
        "stage": args.stage,
        "base_checkpoint": str(args.base_checkpoint),
        "base_parameters": list(base_parameters),
        "result": {
            "status": "NUMERIC_SAT_CANDIDATE" if passed else "UNKNOWN_NO_HIT",
            "parameters": best.tolist(),
            "minimum_open_margin": open_minimum,
            "minimum_audit_margin": audit_minimum,
            "minimum_by_group": minima,
            "cyclic_order": list(cyclic_order(points)),
            "points": {name: point.tolist() for name, point in points.items()},
            "mapping": {
                "physicalApex": "o",
                "firstApex": "right",
                "surplusApex": "left",
                "frontier": ["t0i0", "t0i1"],
                "retainedRow": list(T0),
                "doubleDeletionRow": list(T1),
                "unused": UNUSED_SOURCE,
                "actualBlocker": "left",
                "unusedCriticalRow": list(UNUSED_ROW),
                "continuationFirst": "q0",
                "continuationSecond": "q1",
                "unusedRowPhysicalExactFiveStrictHits": [],
            },
        },
        "maxiter": args.maxiter,
        "popsize": args.popsize,
        "workers": args.workers,
        "random_seed": args.seed,
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

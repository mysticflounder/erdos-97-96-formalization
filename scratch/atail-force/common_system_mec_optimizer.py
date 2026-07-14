#!/usr/bin/env python3
"""Numerical MEC-disk feasibility probe for the `(4,5,6)` residual.

This is a discovery tool, not a proof.  It extends
``common_system_residual_optimizer.py`` by treating labels ``0, 1, 2`` as the
fixed nonobtuse Moser triangle and requiring every carrier point to lie in its
circumdisk.  The all-center K4/FaithfulCarrierPattern field and the remaining
live full-filter/no-M44 data are still omitted.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any

import numpy as np
from scipy.optimize import minimize

import common_system_residual_optimizer as base


ROOT = Path(__file__).resolve().parents[2]
INPUT = ROOT / "scratch/atail-force/common_system_metric_probe.json"
NUMERICAL_INPUT = ROOT / "scratch/atail-force/common_system_residual_optimizer.json"
OUTPUT = ROOT / "scratch/atail-force/common_system_mec_optimizer.json"
PROFILE = (4, 5, 6)
MOSER_LABELS = (0, 1, 2)
ORIENTATION_MARGIN = 1e-4
MEC_TOLERANCE = 1e-8


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def circumcircle(values: np.ndarray, n: int) -> tuple[np.ndarray, float]:
    """Circumcircle of `(0,0)`, `(1,0)`, and label 2."""

    points = base.unpack(values, n)
    x2, y2 = points[2]
    center = np.array([0.5, (x2 * x2 + y2 * y2 - x2) / (2.0 * y2)])
    radius_squared = float(center @ center)
    return center, radius_squared


def mec_disk_margins(values: np.ndarray, n: int) -> np.ndarray:
    points = base.unpack(values, n)
    center, radius_squared = circumcircle(values, n)
    return np.asarray(
        [
            radius_squared - float((points[label] - center) @ (points[label] - center))
            for label in range(n)
            if label not in MOSER_LABELS
        ]
    )


def moser_margins(values: np.ndarray, n: int) -> np.ndarray:
    points = base.unpack(values, n)
    p0, p1, p2 = (points[label] for label in MOSER_LABELS)
    return np.asarray(
        [
            p2[1] - ORIENTATION_MARGIN,
            float((p1 - p0) @ (p2 - p0)),
            float((p2 - p1) @ (p0 - p1)),
            float((p0 - p2) @ (p1 - p2)),
        ]
    )


def extended_diagnostics(
    values: np.ndarray,
    n: int,
    order: tuple[int, ...],
    rows: list[tuple[int, tuple[int, ...]]],
) -> dict[str, Any]:
    report = base.diagnostics(values, n, order, rows)
    disk = mec_disk_margins(values, n)
    moser = moser_margins(values, n)
    center, radius_squared = circumcircle(values, n)
    report.update(
        {
            "min_mec_disk_margin": float(np.min(disk)),
            "min_moser_constraint_margin": float(np.min(moser)),
            "moser_circumcenter": [float(value) for value in center],
            "moser_circumradius_squared": radius_squared,
        }
    )
    return report


def saved_candidate(n: int) -> np.ndarray:
    report = json.loads(NUMERICAL_INPUT.read_text(encoding="utf-8"))
    case = next(
        case for case in report["cases"] if tuple(case["profile"]) == PROFILE
    )
    seed = case.get("witness") or case.get("best_attempt")
    if seed is None:
        raise ValueError(
            "residual numerical input has neither a witness nor a best attempt"
        )
    coordinates = seed["diagnostics"]["coordinates"]
    points = {
        int(label): np.asarray(point, dtype=float)
        for label, point in coordinates.items()
    }
    return base.pack(points, n)


def solve(starts: int) -> dict[str, Any]:
    source = json.loads(INPUT.read_text(encoding="utf-8"))
    case = next(case for case in source["cases"] if tuple(case["profile"]) == PROFILE)
    residual = case["rounds"][-1]
    order = (0, 8, 9, 10, 11, 1, 3, 4, 2, 5, 6, 7)
    n = len(order)
    rows = base.decode_rows(residual["metric_rows"])
    regular = base.pack(base.regular_initial(order), n)
    candidate = saved_candidate(n)
    rng = np.random.default_rng(979612)
    attempts: list[dict[str, Any]] = []
    best: tuple[float, dict[str, Any]] | None = None

    for start in range(starts):
        if start == 0:
            initial = candidate
        elif start == 1:
            initial = regular
        elif start % 2 == 0:
            initial = candidate + rng.normal(0.0, 0.08, candidate.shape)
        else:
            initial = regular + rng.normal(0.0, 0.08, regular.shape)
        result = minimize(
            lambda values: 1e-6 * float(np.sum((values - candidate) ** 2)),
            initial,
            method="SLSQP",
            constraints=(
                {
                    "type": "eq",
                    "fun": lambda values: base.equality_residuals(values, n, rows),
                },
                {
                    "type": "ineq",
                    "fun": lambda values: base.convex_margins(values, order)
                    - base.CONVEX_MARGIN,
                },
                {
                    "type": "ineq",
                    "fun": lambda values: base.distinctness_margins(values, n)
                    - base.DISTINCT_SQUARED_MARGIN,
                },
                {
                    "type": "ineq",
                    "fun": lambda values: mec_disk_margins(values, n),
                },
                {
                    "type": "ineq",
                    "fun": lambda values: moser_margins(values, n),
                },
            ),
            options={"ftol": 1e-12, "maxiter": 5000, "disp": False},
        )
        diagnostics = extended_diagnostics(result.x, n, order, rows)
        accepted = (
            diagnostics["max_abs_row_equality_residual"] < 1e-7
            and diagnostics["min_convex_margin"] > 0.9 * base.CONVEX_MARGIN
            and diagnostics["min_pairwise_squared_distance"]
            > 0.9 * base.DISTINCT_SQUARED_MARGIN
            and diagnostics["min_exact_squared_distance_gap"] > 1e-7
            and diagnostics["min_mec_disk_margin"] > -MEC_TOLERANCE
            and diagnostics["min_moser_constraint_margin"] > -MEC_TOLERANCE
        )
        attempt = {
            "start": start,
            "optimizer_success": bool(result.success),
            "optimizer_status": int(result.status),
            "optimizer_message": str(result.message),
            "iterations": int(result.nit),
            "accepted": accepted,
            "diagnostics": diagnostics,
        }
        attempts.append(attempt)
        score = (
            diagnostics["max_abs_row_equality_residual"]
            + max(0.0, 0.9 * base.CONVEX_MARGIN - diagnostics["min_convex_margin"])
            + max(0.0, -diagnostics["min_mec_disk_margin"])
            + max(0.0, -diagnostics["min_moser_constraint_margin"])
        )
        if best is None or score < best[0]:
            best = (score, attempt)
        if accepted:
            return {
                "status": "NUMERICAL_CANDIDATE_PASSES_MEC_DISK_AND_ROW_CHECKS",
                "attempts_run": start + 1,
                "witness": attempt,
            }

    assert best is not None
    return {
        "status": "NO_NUMERICAL_WITNESS_WITHIN_MULTISTART_BUDGET",
        "attempts_run": starts,
        "best_attempt": best[1],
        "attempt_summaries": [
            {
                key: attempt[key]
                for key in (
                    "start",
                    "optimizer_success",
                    "optimizer_status",
                    "optimizer_message",
                    "iterations",
                    "accepted",
                )
            }
            for attempt in attempts
        ],
    }


def build(starts: int) -> dict[str, Any]:
    result = solve(starts)
    return {
        "schema": "p97-atail-common-system-mec-numerical-probe-v1",
        "epistemic_status": "NUMERICAL_DISCOVERY_ONLY_NOT_A_PROOF",
        "scope": {
            "profile": list(PROFILE),
            "moser_triangle_labels": list(MOSER_LABELS),
            "strict_convexity": True,
            "mec_circumdisk": True,
            "nonobtuse_moser_triangle": True,
            "all_center_K4": False,
            "target_faithful": False,
            "producer_proved": False,
        },
        "input": str(INPUT.relative_to(ROOT)),
        "input_sha256": sha256(INPUT),
        "numerical_input": str(NUMERICAL_INPUT.relative_to(ROOT)),
        "numerical_input_sha256": sha256(NUMERICAL_INPUT),
        "multistart_budget": starts,
        "required_convex_margin": base.CONVEX_MARGIN,
        "required_pairwise_squared_distance": base.DISTINCT_SQUARED_MARGIN,
        "required_moser_orientation_margin": ORIENTATION_MARGIN,
        "mec_acceptance_tolerance": MEC_TOLERANCE,
        "result": result,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--starts", type=int, default=16)
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    if args.starts < 1:
        parser.error("--starts must be positive")
    if args.write and args.check:
        parser.error("--write and --check are mutually exclusive")
    report = build(args.starts)
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.write:
        OUTPUT.write_text(rendered, encoding="utf-8")
    elif args.check:
        if OUTPUT.read_text(encoding="utf-8") != rendered:
            raise AssertionError("saved MEC numerical report is stale")
    else:
        print(rendered, end="")
    if args.write or args.check:
        print(
            json.dumps(
                {
                    "output": str(OUTPUT.relative_to(ROOT)),
                    "status": report["result"]["status"],
                    "attempts_run": report["result"]["attempts_run"],
                },
                indent=2,
                sort_keys=True,
            )
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

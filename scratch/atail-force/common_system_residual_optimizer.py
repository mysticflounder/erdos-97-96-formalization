#!/usr/bin/env python3
"""Numerical feasibility probe for uncovered common-system metric residuals.

This is a discovery tool, not a proof.  It fixes labels 0 and 1 at `(0,0)`
and `(1,0)`, enforces every saved row equality, and asks SLSQP for the strict
convex half-plane inequalities in the recorded cyclic order.  Any candidate
is independently re-evaluated against row equalities, exact-row exclusions,
pairwise distinctness, and all convex margins before it is reported.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
from pathlib import Path
from typing import Any, Sequence

import numpy as np
from scipy.optimize import minimize


ROOT = Path(__file__).resolve().parents[2]
INPUT = ROOT / "scratch/atail-force/common_system_metric_probe.json"
OUTPUT = ROOT / "scratch/atail-force/common_system_residual_optimizer.json"
CONVEX_MARGIN = 1e-3
DISTINCT_SQUARED_MARGIN = 1e-3


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def decode_rows(encoded: Sequence[str]) -> list[tuple[int, tuple[int, ...]]]:
    rows = []
    for item in encoded:
        center_text, support_text = item.split(":", maxsplit=1)
        rows.append(
            (
                int(center_text),
                tuple(int(label) for label in support_text.split(",")),
            )
        )
    return rows


def regular_initial(order: Sequence[int]) -> dict[int, np.ndarray]:
    n = len(order)
    raw = {
        label: np.array(
            [math.cos(2 * math.pi * index / n), math.sin(2 * math.pi * index / n)]
        )
        for index, label in enumerate(order)
    }
    origin = raw[0]
    axis = raw[1] - origin
    scale = float(np.linalg.norm(axis))
    cosine, sine = axis / scale
    rotation = np.array([[cosine, sine], [-sine, cosine]])
    return {label: rotation @ (point - origin) / scale for label, point in raw.items()}


def unpack(values: np.ndarray, n: int) -> dict[int, np.ndarray]:
    points = {0: np.array([0.0, 0.0]), 1: np.array([1.0, 0.0])}
    for offset, label in enumerate(range(2, n)):
        points[label] = values[2 * offset : 2 * offset + 2]
    return points


def pack(points: dict[int, np.ndarray], n: int) -> np.ndarray:
    return np.concatenate([points[label] for label in range(2, n)])


def d2(points: dict[int, np.ndarray], left: int, right: int) -> float:
    delta = points[left] - points[right]
    return float(delta @ delta)


def equality_residuals(
    values: np.ndarray, n: int, rows: Sequence[tuple[int, tuple[int, ...]]]
) -> np.ndarray:
    points = unpack(values, n)
    out = []
    for center, support in rows:
        reference = d2(points, center, support[0])
        out.extend(d2(points, center, label) - reference for label in support[1:])
    return np.asarray(out)


def convex_margins(values: np.ndarray, order: Sequence[int]) -> np.ndarray:
    points = unpack(values, len(order))
    margins = []
    for index, left in enumerate(order):
        right = order[(index + 1) % len(order)]
        edge = points[right] - points[left]
        for label in order:
            if label in (left, right):
                continue
            delta = points[label] - points[left]
            margins.append(edge[0] * delta[1] - edge[1] * delta[0])
    return np.asarray(margins)


def distinctness_margins(values: np.ndarray, n: int) -> np.ndarray:
    points = unpack(values, n)
    return np.asarray(
        [
            d2(points, left, right)
            for left in range(n)
            for right in range(left + 1, n)
        ]
    )


def diagnostics(
    values: np.ndarray,
    n: int,
    order: Sequence[int],
    rows: Sequence[tuple[int, tuple[int, ...]]],
) -> dict[str, Any]:
    points = unpack(values, n)
    equality = equality_residuals(values, n, rows)
    convexity = convex_margins(values, order)
    distinct = [
        d2(points, left, right)
        for left in range(n)
        for right in range(left + 1, n)
    ]
    exact_gaps = []
    for center, support in rows:
        radius = d2(points, center, support[0])
        support_set = set(support)
        exact_gaps.extend(
            abs(d2(points, center, label) - radius)
            for label in range(n)
            if label != center and label not in support_set
        )
    return {
        "max_abs_row_equality_residual": float(np.max(np.abs(equality))),
        "min_convex_margin": float(np.min(convexity)),
        "min_pairwise_squared_distance": float(np.min(distinct)),
        "min_exact_squared_distance_gap": float(np.min(exact_gaps)),
        "coordinates": {
            str(label): [float(value) for value in points[label]]
            for label in range(n)
        },
    }


def solve_case(case: dict[str, Any], starts: int) -> dict[str, Any]:
    residual = case["rounds"][-1]
    if residual.get("reported_status") != (
        "FOUND_NONUNIT_WITHOUT_FORMALIZED_CORE_REAL_FEASIBILITY_UNDECIDED"
    ):
        raise ValueError("case does not end in an uncovered NONUNIT residual")
    order = tuple(
        {
            (4, 5, 6): (0, 8, 9, 10, 11, 1, 3, 4, 2, 5, 6, 7),
            (5, 5, 5): (0, 9, 10, 11, 1, 3, 4, 5, 2, 6, 7, 8),
        }[tuple(case["profile"])]
    )
    n = len(order)
    rows = decode_rows(residual["metric_rows"])
    base = pack(regular_initial(order), n)
    rng = np.random.default_rng(9796 + sum(case["profile"]))
    attempts = []
    best = None
    for start in range(starts):
        initial = base if start == 0 else base + rng.normal(0.0, 0.08, base.shape)
        result = minimize(
            lambda values: 1e-5 * float(np.sum((values - base) ** 2)),
            initial,
            method="SLSQP",
            constraints=(
                {
                    "type": "eq",
                    "fun": lambda values: equality_residuals(values, n, rows),
                },
                {
                    "type": "ineq",
                    "fun": lambda values: convex_margins(values, order)
                    - CONVEX_MARGIN,
                },
                {
                    "type": "ineq",
                    "fun": lambda values: distinctness_margins(values, n)
                    - DISTINCT_SQUARED_MARGIN,
                },
            ),
            options={"ftol": 1e-12, "maxiter": 4000, "disp": False},
        )
        check = diagnostics(result.x, n, order, rows)
        accepted = (
            check["max_abs_row_equality_residual"] < 1e-7
            and check["min_convex_margin"] > 0
            and check["min_convex_margin"] > 0.9 * CONVEX_MARGIN
            and check["min_pairwise_squared_distance"]
            > 0.9 * DISTINCT_SQUARED_MARGIN
            and check["min_exact_squared_distance_gap"] > 1e-7
        )
        attempt = {
            "start": start,
            "optimizer_success": bool(result.success),
            "optimizer_status": int(result.status),
            "optimizer_message": str(result.message),
            "iterations": int(result.nit),
            "accepted": accepted,
            "diagnostics": check,
        }
        attempts.append(attempt)
        score = (
            max(0.0, -check["min_convex_margin"])
            + check["max_abs_row_equality_residual"]
        )
        if best is None or score < best[0]:
            best = (score, attempt)
        if accepted:
            return {
                "profile": case["profile"],
                "status": "NUMERICAL_CANDIDATE_PASSES_STRICT_CONVEX_ROW_CHECKS",
                "residual_round": residual["round"],
                "metric_rows": residual["metric_rows"],
                "attempts_run": start + 1,
                "witness": attempt,
            }
    assert best is not None
    return {
        "profile": case["profile"],
        "status": "NO_NUMERICAL_WITNESS_WITHIN_MULTISTART_BUDGET",
        "residual_round": residual["round"],
        "metric_rows": residual["metric_rows"],
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
    source = json.loads(INPUT.read_text(encoding="utf-8"))
    return {
        "schema": "p97-atail-common-system-residual-numerical-probe-v1",
        "epistemic_status": "NUMERICAL_DISCOVERY_ONLY_NOT_A_PROOF",
        "input": str(INPUT.relative_to(ROOT)),
        "input_sha256": sha256(INPUT),
        "multistart_budget_per_case": starts,
        "required_convex_margin": CONVEX_MARGIN,
        "required_pairwise_squared_distance": DISTINCT_SQUARED_MARGIN,
        "cases": [solve_case(case, starts) for case in source["cases"]],
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--starts", type=int, default=8)
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
            raise AssertionError("saved numerical residual report is stale")
    else:
        print(rendered, end="")
    if args.write or args.check:
        print(
            json.dumps(
                {
                    "output": str(OUTPUT.relative_to(ROOT)),
                    "cases": [
                        {
                            "profile": case["profile"],
                            "status": case["status"],
                            "attempts_run": case["attempts_run"],
                        }
                        for case in report["cases"]
                    ],
                },
                indent=2,
                sort_keys=True,
            )
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

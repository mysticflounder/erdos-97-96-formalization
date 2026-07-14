#!/usr/bin/env python3
"""Add one global selected-four row to the exact `(4,5,6)` residual.

For each center 4 through 11 this bounded analysis enumerates every locally
admissible four-support from the current `(4,5,6)` frame.  It first applies the
complete existing formalized metric-core scanner (including the production
`NestedEqualChordCore`).  It then searches the scanner survivors for one whose
equality ideal is reported `NONUNIT` by msolve in both variable orders, runs
the repository's full three-engine exact-oracle policy on that candidate, and
separately probes strict-convex numerical feasibility.

The numerical search is discovery evidence, not a proof.  A
`CROSSCHECKED_NONUNIT` oracle result proves only that the normalized equality
ideal is proper over the algebraic closure; it does not prove real or convex
feasibility.  Timeout/disagreement is reported fail-closed.
"""

from __future__ import annotations

import argparse
import json
import sys
from collections import Counter
from pathlib import Path
from typing import Any, Sequence

import numpy as np
from scipy.optimize import minimize


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
for path in (
    ROOT,
    HERE,
    HERE / "second_center_metric_cegar",
    HERE / "second_center_query",
    HERE / "second_center_metric_oracle",
):
    if str(path) not in sys.path:
        sys.path.insert(0, str(path))

import cegar  # noqa: E402
import common_system_metric_probe as common_probe  # noqa: E402
from census.global_confinement import metric_realizability_probe as metric  # noqa: E402
from census.multi_center import multi_center_census as mc  # noqa: E402


PROFILE = (4, 5, 6)
N = 12
ORDER = (0, 8, 9, 10, 11, 1, 3, 4, 2, 5, 6, 7)
BASE_ROW_DATA = {
    0: (1, 3, 4, 5),
    1: (0, 2, 5, 6),
    2: (1, 7, 8, 9),
    3: (0, 7, 10, 11),
}
BASE_ROWS = tuple(
    metric.MetricRow(center, support, exact=True)
    for center, support in BASE_ROW_DATA.items()
)
EXACT_WITNESS = HERE / "residual_456_exact_witness.json"
CONVEX_MARGIN = 1e-5
DISTINCT_SQUARED_MARGIN = 1e-5


def exact_witness_initial() -> np.ndarray:
    report = json.loads(EXACT_WITNESS.read_text(encoding="utf-8"))
    encoded = report["construction"]["coordinate_decimal_midpoints"]
    points = {
        label: np.asarray([float(value) for value in encoded[str(label)]])
        for label in range(N)
    }
    if not np.array_equal(points[0], np.asarray([0.0, 0.0])):
        raise AssertionError("unexpected point-0 gauge")
    if not np.array_equal(points[1], np.asarray([1.0, 0.0])):
        raise AssertionError("unexpected point-1 gauge")
    return np.concatenate([points[label] for label in range(2, N)])


def unpack(values: np.ndarray) -> dict[int, np.ndarray]:
    points = {0: np.asarray([0.0, 0.0]), 1: np.asarray([1.0, 0.0])}
    for offset, label in enumerate(range(2, N)):
        points[label] = values[2 * offset : 2 * offset + 2]
    return points


def distance_squared(
    points: dict[int, np.ndarray], left: int, right: int
) -> float:
    delta = points[left] - points[right]
    return float(delta @ delta)


def equality_residuals(
    values: np.ndarray, rows: Sequence[metric.MetricRow]
) -> np.ndarray:
    points = unpack(values)
    residuals: list[float] = []
    for row in rows:
        reference = distance_squared(points, row.center, row.support[0])
        residuals.extend(
            distance_squared(points, row.center, label) - reference
            for label in row.support[1:]
        )
    return np.asarray(residuals)


def convex_margins(values: np.ndarray) -> np.ndarray:
    points = unpack(values)
    margins: list[float] = []
    for index, left in enumerate(ORDER):
        right = ORDER[(index + 1) % N]
        edge = points[right] - points[left]
        for label in ORDER:
            if label in (left, right):
                continue
            delta = points[label] - points[left]
            margins.append(float(edge[0] * delta[1] - edge[1] * delta[0]))
    return np.asarray(margins)


def distinctness_margins(values: np.ndarray) -> np.ndarray:
    points = unpack(values)
    return np.asarray(
        [
            distance_squared(points, left, right)
            for left in range(N)
            for right in range(left + 1, N)
        ]
    )


def base_exact_gap(values: np.ndarray) -> float:
    points = unpack(values)
    gaps: list[float] = []
    for row in BASE_ROWS:
        radius = distance_squared(points, row.center, row.support[0])
        support = set(row.support)
        gaps.extend(
            abs(distance_squared(points, row.center, label) - radius)
            for label in range(N)
            if label != row.center and label not in support
        )
    return min(gaps)


def numerical_diagnostics(
    values: np.ndarray, rows: Sequence[metric.MetricRow]
) -> dict[str, Any]:
    return {
        "max_abs_row_equality_residual": float(
            np.max(np.abs(equality_residuals(values, rows)))
        ),
        "min_convex_margin": float(np.min(convex_margins(values))),
        "min_pairwise_squared_distance": float(
            np.min(distinctness_margins(values))
        ),
        "min_base_exact_squared_distance_gap": float(base_exact_gap(values)),
        "coordinates": {
            str(label): [float(value) for value in unpack(values)[label]]
            for label in range(N)
        },
    }


def numerical_probe(
    rows: Sequence[metric.MetricRow],
    *,
    starts: int,
    seed: int,
) -> dict[str, Any]:
    base = exact_witness_initial()
    rng = np.random.default_rng(seed)
    attempts: list[dict[str, Any]] = []
    for start in range(starts):
        initial = base if start == 0 else base + rng.normal(0.0, 0.04, base.shape)
        result = minimize(
            lambda values: 1e-6 * float(np.sum((values - base) ** 2)),
            initial,
            method="SLSQP",
            constraints=(
                {
                    "type": "eq",
                    "fun": lambda values: equality_residuals(values, rows),
                },
                {
                    "type": "ineq",
                    "fun": lambda values: convex_margins(values) - CONVEX_MARGIN,
                },
                {
                    "type": "ineq",
                    "fun": lambda values: distinctness_margins(values)
                    - DISTINCT_SQUARED_MARGIN,
                },
            ),
            options={"ftol": 1e-12, "maxiter": 3000, "disp": False},
        )
        diagnostics = numerical_diagnostics(result.x, rows)
        accepted = (
            diagnostics["max_abs_row_equality_residual"] < 1e-7
            and diagnostics["min_convex_margin"] > 0.9 * CONVEX_MARGIN
            and diagnostics["min_pairwise_squared_distance"]
            > 0.9 * DISTINCT_SQUARED_MARGIN
            and diagnostics["min_base_exact_squared_distance_gap"] > 1e-7
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
        if accepted:
            return {
                "status": "NUMERICAL_STRICT_CONVEX_REAL_CANDIDATE",
                "attempts_run": start + 1,
                "witness": attempt,
            }
    best = min(
        attempts,
        key=lambda attempt: (
            max(0.0, -attempt["diagnostics"]["min_convex_margin"])
            + attempt["diagnostics"]["max_abs_row_equality_residual"]
        ),
    )
    return {
        "status": "NO_NUMERICAL_WITNESS_WITHIN_START_BUDGET",
        "attempts_run": starts,
        "best_attempt": best,
    }


def formalized_core(rows: Sequence[metric.MetricRow]) -> dict[str, Any] | None:
    core = metric._formalized_metric_core(
        rows,
        N,
        ORDER,
        include_extended=True,
        include_ordered=True,
    )
    if core is not None:
        return core
    return common_probe.nested_equal_chord_core(rows, N, ORDER)


def encoded_row(row: metric.MetricRow) -> dict[str, Any]:
    return {
        "center": row.center,
        "support": list(row.support),
        "exact": row.exact,
    }


def two_order_msolve(rows: Sequence[metric.MetricRow]) -> dict[str, Any]:
    variables = tuple(
        str(variable) for variable in cegar.metric_oracle.variable_symbols(N)
    )
    polynomials = cegar.metric_oracle.serialized_system(N, rows)
    forward = cegar.metric_oracle.run_msolve(
        variables, polynomials, timeout_s=cegar.CAS_TIMEOUT_S
    )
    reverse = cegar.metric_oracle.run_msolve(
        tuple(reversed(variables)),
        polynomials,
        timeout_s=cegar.CAS_TIMEOUT_S,
    )
    return {
        "forward_variables": forward.verdict,
        "reverse_variables": reverse.verdict,
        "both_nonunit": forward.verdict == reverse.verdict == "NONUNIT",
    }


def analyze_center(
    center: int,
    candidates: Sequence[frozenset[int]],
    *,
    starts: int,
    candidate_budget: int,
) -> dict[str, Any]:
    stages: Counter[str] = Counter()
    survivors: list[metric.MetricRow] = []
    for support in candidates:
        extension = metric.MetricRow(
            center, tuple(sorted(support)), exact=False
        )
        core = formalized_core((*BASE_ROWS, extension))
        if core is None:
            survivors.append(extension)
        else:
            stages[str(core["stage"])] += 1

    selected: dict[str, Any] | None = None
    equality_attempts: list[dict[str, Any]] = []
    for index, extension in enumerate(survivors[:candidate_budget]):
        rows = (*BASE_ROWS, extension)
        two_order = two_order_msolve(rows)
        equality_attempts.append(
            {
                "survivor_index": index,
                "support": list(extension.support),
                "two_order_msolve": two_order,
            }
        )
        if not two_order["both_nonunit"]:
            continue
        numerical = numerical_probe(
            rows,
            starts=starts,
            seed=979_600 + 100 * center + index,
        )
        exact = cegar.crosscheck_summary(cegar.exact_crosscheck(N, rows))
        selected = {
            "survivor_index": index,
            "row": encoded_row(extension),
            "formalized_core_scan": None,
            "two_order_msolve": two_order,
            "exact_equality_ideal": exact,
            "numerical_real_probe": numerical,
        }
        break

    return {
        "center": center,
        "locally_admissible_candidate_count": len(candidates),
        "formalized_core_kill_counts": dict(sorted(stages.items())),
        "formalized_core_survivor_count": len(survivors),
        "candidate_budget": min(candidate_budget, len(survivors)),
        "exact_equality_attempts": equality_attempts,
        "selected_survivor": selected,
        "all_candidates_killed_by_existing_formalized_cores": not survivors,
    }


def build(*, starts: int, candidate_budget: int) -> dict[str, Any]:
    frame, candidates = mc.cached_candidate_lists(PROFILE, set(mc.PROVEN_ROWS))
    if candidates is None or frame.n != N:
        raise AssertionError("missing `(4,5,6)` candidate frame")
    cases = []
    for center in range(4, N):
        print(f"center {center}: scanning {len(candidates[center])} rows", file=sys.stderr)
        case = analyze_center(
            center,
            candidates[center],
            starts=starts,
            candidate_budget=candidate_budget,
        )
        cases.append(case)
        selected = case["selected_survivor"]
        print(
            f"center {center}: formal survivors="
            f"{case['formalized_core_survivor_count']} selected="
            f"{None if selected is None else selected['row']['support']}",
            file=sys.stderr,
        )
    return {
        "schema": "p97-atail-residual-456-one-global-row-extension-v1",
        "epistemic_status": {
            "candidate_enumeration": "EXACT_WITHIN_CURRENT_FINITE_FRAME",
            "formalized_core_scan": "REUSES_KERNEL_BACKED_CONSUMERS",
            "equality_oracle": (
                "TRUSTED_EXACT_CAS; TWO_MSOLVE_ORDERS_SELECT; FULL_POLICY_REPORTED"
            ),
            "real_feasibility": "NUMERICAL_DISCOVERY_ONLY_NOT_A_PROOF",
            "producer_proved": False,
        },
        "profile": list(PROFILE),
        "cyclic_order": list(ORDER),
        "base_rows": [encoded_row(row) for row in BASE_ROWS],
        "extension_rows_are_selected_not_exact": True,
        "starts_per_candidate": starts,
        "candidate_budget_per_center": candidate_budget,
        "cases": cases,
        "conclusion": (
            "No center is locally closed by the existing one-row formalized-core "
            "bank or the tested exact-equality candidates if every case has a "
            "two-order NONUNIT selected survivor. A proper equality ideal does "
            "not prove real, convex, target-faithful, or full-global-K4 feasibility."
        ),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--starts", type=int, default=3)
    parser.add_argument("--candidate-budget", type=int, default=24)
    args = parser.parse_args()
    if args.starts < 1 or args.candidate_budget < 1:
        parser.error("budgets must be positive")
    print(
        json.dumps(
            build(starts=args.starts, candidate_budget=args.candidate_budget),
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

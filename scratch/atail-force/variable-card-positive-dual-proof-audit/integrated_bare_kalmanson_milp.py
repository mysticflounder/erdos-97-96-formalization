#!/usr/bin/env python3
"""Normalized integrated MILP for the bare all-center Kalmanson surface.

The mixed model chooses one four-member non-self row at every cyclic vertex,
optionally enforces exact strong connectivity by directed cut constraints, and
maximizes one common homogeneous slack for positivity and both strict
Kalmanson inequalities.  Guarded row equalities use M=1 after normalizing the
sum of all distances to one.

HiGHS optimality is external floating-point evidence.  Any decoded row table
is independently sent to exact Z3 LRA: a positive optimum must replay as an
exact rational SAT countermodel, while a zero optimum's decoded table should
replay UNSAT and provides a named exact core for theorem discovery.
"""

from __future__ import annotations

import argparse
import itertools
import json
import time
from collections import Counter
from pathlib import Path
from typing import Iterable

import numpy as np
from scipy.optimize import Bounds, LinearConstraint, milp
from scipy.sparse import coo_array
import z3


def edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("distance endpoints must be distinct")
    return (left, right) if left < right else (right, left)


class ConstraintBuilder:
    def __init__(self, variable_count: int) -> None:
        self.variable_count = variable_count
        self.rows: list[int] = []
        self.columns: list[int] = []
        self.values: list[float] = []
        self.lower: list[float] = []
        self.upper: list[float] = []
        self.kinds: Counter[str] = Counter()

    def add(
        self,
        kind: str,
        coefficients: Iterable[tuple[int, float]],
        lower: float = -np.inf,
        upper: float = np.inf,
    ) -> None:
        row = len(self.lower)
        for column, value in coefficients:
            if value != 0:
                self.rows.append(row)
                self.columns.append(column)
                self.values.append(float(value))
        self.lower.append(float(lower))
        self.upper.append(float(upper))
        self.kinds[kind] += 1

    def finish(self) -> LinearConstraint:
        matrix = coo_array(
            (self.values, (self.rows, self.columns)),
            shape=(len(self.lower), self.variable_count),
            dtype=np.float64,
        ).tocsr()
        return LinearConstraint(
            matrix,
            np.asarray(self.lower, dtype=np.float64),
            np.asarray(self.upper, dtype=np.float64),
        )


class BareKalmansonMilp:
    def __init__(self, n: int, mode: str) -> None:
        self.n = n
        self.mode = mode
        next_column = 0
        centers = range(1) if mode == "single-row" else range(n)
        self.member_column: dict[tuple[int, int], int] = {}
        for center in centers:
            for point in range(n):
                if point != center:
                    self.member_column[center, point] = next_column
                    next_column += 1
        self.boolean_count = next_column
        self.distance_column: dict[tuple[int, int], int] = {}
        for pair in itertools.combinations(range(n), 2):
            self.distance_column[pair] = next_column
            next_column += 1
        self.radius_column: dict[int, int] = {}
        for center in centers:
            self.radius_column[center] = next_column
            next_column += 1
        self.epsilon_column = next_column
        self.variable_count = next_column + 1
        self.builder = ConstraintBuilder(self.variable_count)

    def member(self, center: int, point: int) -> int:
        return self.member_column[center, point]

    def dist(self, left: int, right: int) -> int:
        return self.distance_column[edge(left, right)]

    def add_rows(self) -> None:
        for center in self.radius_column:
            points = [point for point in range(self.n) if point != center]
            self.builder.add(
                "row_cardinality",
                ((self.member(center, point), 1.0) for point in points),
                lower=4.0,
                upper=4.0,
            )
            for point in points:
                member = self.member(center, point)
                distance = self.dist(center, point)
                radius = self.radius_column[center]
                self.builder.add(
                    "guarded_row_equality_pos",
                    ((distance, 1.0), (radius, -1.0), (member, 1.0)),
                    upper=1.0,
                )
                self.builder.add(
                    "guarded_row_equality_neg",
                    ((distance, -1.0), (radius, 1.0), (member, 1.0)),
                    upper=1.0,
                )

    def add_strong_connectivity(self) -> None:
        if self.mode != "all-rows":
            return
        vertices = tuple(range(self.n))
        for size in range(1, self.n):
            for tail in itertools.combinations(vertices[1:], size - 1):
                subset = frozenset((0, *tail))
                if len(subset) == self.n:
                    continue
                complement = frozenset(vertices) - subset
                self.builder.add(
                    "strong_connectivity_leaving",
                    (
                        (self.member(source, target), 1.0)
                        for source in subset
                        for target in complement
                    ),
                    lower=1.0,
                )
                self.builder.add(
                    "strong_connectivity_entering",
                    (
                        (self.member(source, target), 1.0)
                        for source in complement
                        for target in subset
                    ),
                    lower=1.0,
                )

    def add_selected_pair_alternation(self) -> None:
        if self.mode == "single-row":
            return
        # This is a redundant source-valid consequence of strict Kalmanson:
        # two boundary centers equidistant from the same distinct target pair
        # must alternate with that pair.  Adding the four forbidden
        # nonalternating orientations per cyclic quadruple removes trivial
        # locally impossible incumbents before branch-and-bound reaches LRA.
        for quadruple in itertools.combinations(range(self.n), 4):
            a, b, c, d = quadruple
            alternating = {frozenset((a, c)), frozenset((b, d))}
            vertices = frozenset(quadruple)
            for centers_tuple in itertools.combinations(quadruple, 2):
                centers = frozenset(centers_tuple)
                if centers in alternating:
                    continue
                targets = vertices - centers
                center_left, center_right = sorted(centers)
                target_left, target_right = sorted(targets)
                self.builder.add(
                    "selected_pair_alternation",
                    (
                        (self.member(center_left, target_left), 1.0),
                        (self.member(center_left, target_right), 1.0),
                        (self.member(center_right, target_left), 1.0),
                        (self.member(center_right, target_right), 1.0),
                    ),
                    upper=3.0,
                )

    def add_metric(self) -> None:
        self.builder.add(
            "distance_normalization",
            ((column, 1.0) for column in self.distance_column.values()),
            lower=1.0,
            upper=1.0,
        )
        for column in self.distance_column.values():
            self.builder.add(
                "positive_distance",
                ((column, 1.0), (self.epsilon_column, -1.0)),
                lower=0.0,
            )
        for a, b, c, d in itertools.combinations(range(self.n), 4):
            diagonal = ((self.dist(a, c), 1.0), (self.dist(b, d), 1.0))
            self.builder.add(
                "strict_kalmanson_k1",
                (
                    *diagonal,
                    (self.dist(a, b), -1.0),
                    (self.dist(c, d), -1.0),
                    (self.epsilon_column, -1.0),
                ),
                lower=0.0,
            )
            self.builder.add(
                "strict_kalmanson_k2",
                (
                    *diagonal,
                    (self.dist(a, d), -1.0),
                    (self.dist(b, c), -1.0),
                    (self.epsilon_column, -1.0),
                ),
                lower=0.0,
            )

    def arrays(self) -> tuple[np.ndarray, np.ndarray, Bounds, LinearConstraint]:
        objective = np.zeros(self.variable_count, dtype=np.float64)
        objective[self.epsilon_column] = -1.0
        integrality = np.zeros(self.variable_count, dtype=np.uint8)
        integrality[: self.boolean_count] = 1
        lower = np.zeros(self.variable_count, dtype=np.float64)
        upper = np.ones(self.variable_count, dtype=np.float64)
        return objective, integrality, Bounds(lower, upper), self.builder.finish()

    def decode_rows(self, values: np.ndarray) -> dict[int, tuple[int, ...]]:
        rounded = np.rint(values[: self.boolean_count]).astype(np.int8)
        assert np.max(np.abs(values[: self.boolean_count] - rounded)) <= 1e-6
        rows: dict[int, tuple[int, ...]] = {}
        for center in self.radius_column:
            rows[center] = tuple(
                point
                for point in range(self.n)
                if point != center and rounded[self.member(center, point)] == 1
            )
        assert all(len(row) == 4 for row in rows.values())
        return rows


def exact_replay(
    n: int, rows: dict[int, tuple[int, ...]], timeout_ms: int
) -> dict[str, object]:
    solver = z3.Solver()
    solver.set(timeout=timeout_ms, random_seed=0)
    distances = {
        pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
        for pair in itertools.combinations(range(n), 2)
    }

    def dist(left: int, right: int) -> z3.ArithRef:
        return distances[edge(left, right)]

    assumptions: list[z3.BoolRef] = []
    assumption_names: dict[str, str] = {}

    def track(name: str, formula: z3.BoolRef) -> None:
        atom = z3.Bool(name)
        assumptions.append(atom)
        assumption_names[str(atom)] = name
        solver.add(z3.Implies(atom, formula))

    for left, right in distances:
        track(f"positive_{left}_{right}", dist(left, right) >= 1)
    for a, b, c, d in itertools.combinations(range(n), 4):
        diagonal = dist(a, c) + dist(b, d)
        track(
            f"k1_{a}_{b}_{c}_{d}",
            diagonal >= dist(a, b) + dist(c, d) + 1,
        )
        track(
            f"k2_{a}_{b}_{c}_{d}",
            diagonal >= dist(a, d) + dist(b, c) + 1,
        )
    for center, support in rows.items():
        anchor = support[0]
        for point in support[1:]:
            track(
                f"row_{center}_{anchor}_{point}",
                dist(center, anchor) == dist(center, point),
            )
    status = solver.check(*assumptions)
    result: dict[str, object] = {"status": str(status).upper()}
    if status == z3.sat:
        model = solver.model()
        rational = {
            f"{left},{right}": str(model.eval(variable, model_completion=True))
            for (left, right), variable in distances.items()
        }
        for left, right in distances:
            assert z3.is_true(
                z3.simplify(model.eval(dist(left, right), model_completion=True) >= 1)
            )
        for center, support in rows.items():
            values = [model.eval(dist(center, point), model_completion=True) for point in support]
            assert all(value == values[0] for value in values)
        result["distances"] = rational
    elif status == z3.unsat:
        result["unsat_core"] = [assumption_names[str(atom)] for atom in solver.unsat_core()]
    else:
        result["reason"] = solver.reason_unknown()
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument(
        "--mode",
        choices=("all-rows", "all-rows-no-connectivity", "single-row"),
        default="all-rows",
    )
    parser.add_argument("--time-limit", type=float, default=300.0)
    parser.add_argument("--node-limit", type=int, default=1_000_000)
    parser.add_argument("--exact-timeout-ms", type=int, default=60_000)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    if args.n < 5:
        raise ValueError("n must be at least five")

    started = time.monotonic()
    model = BareKalmansonMilp(args.n, args.mode)
    model.add_rows()
    model.add_strong_connectivity()
    model.add_selected_pair_alternation()
    model.add_metric()
    objective, integrality, bounds, constraints = model.arrays()
    result = milp(
        objective,
        integrality=integrality,
        bounds=bounds,
        constraints=constraints,
        options={
            "disp": False,
            "presolve": True,
            "time_limit": args.time_limit,
            "node_limit": args.node_limit,
            "mip_rel_gap": 0.0,
        },
    )
    payload: dict[str, object] = {
        "schema": "p97-bare-all-center-normalized-milp-v1",
        "epistemic_status": "FLOATING_MILP_WITH_EXACT_FIXED_ROW_REPLAY",
        "n": args.n,
        "mode": args.mode,
        "variable_count": model.variable_count,
        "boolean_count": model.boolean_count,
        "constraint_count": len(model.builder.lower),
        "constraint_kinds": dict(sorted(model.builder.kinds.items())),
        "wall_seconds": time.monotonic() - started,
        "solver": {
            "success": bool(result.success),
            "status": int(result.status),
            "message": str(result.message),
            "mip_node_count": getattr(result, "mip_node_count", None),
            "mip_gap": getattr(result, "mip_gap", None),
            "mip_dual_bound": getattr(result, "mip_dual_bound", None),
        },
    }
    if result.x is not None:
        rows = model.decode_rows(result.x)
        epsilon = float(result.x[model.epsilon_column])
        payload["incumbent"] = {
            "epsilon": epsilon,
            "rows": {str(center): list(support) for center, support in rows.items()},
            "exact_fixed_row_replay": exact_replay(args.n, rows, args.exact_timeout_ms),
        }
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

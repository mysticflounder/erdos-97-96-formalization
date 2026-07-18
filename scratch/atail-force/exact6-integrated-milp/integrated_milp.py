#!/usr/bin/env python3
"""Integrated exact-six structural/linear MILP gate using SciPy HiGHS.

The Boolean clauses are imported from the corrected deterministic n=14
encoder, before either transported metric-cut bank is added.  This script
then independently translates those clauses to 0/1 linear constraints and
adds one normalized abstract distance table with guarded selected-row and
exact-five-shell equalities, strict triangles, and strict Kalmanson slacks.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import sys
import time
from collections import Counter
from fractions import Fraction
from pathlib import Path
from types import ModuleType
from typing import Iterable

import numpy as np
from scipy.optimize import Bounds, LinearConstraint, linprog, milp
from scipy.sparse import coo_array, vstack


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[2]
ENCODER_PATH = HERE.parent / "exact6-allcenter-coverage-certificate" / "encode.py"
OUTER_METHODS = (
    "add_row_cardinality",
    "add_finite_incidence_bounds",
    "add_perpendicular_bisector_order",
    "add_cap_bounds",
    "add_exact_five_shell",
    "add_exact_shell_selected_row_alternation",
    "add_named_roles",
    "add_blocker_map",
    "add_named_critical_rows",
    "add_strong_connectivity",
)


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


class Logger:
    def __init__(self, path: Path | None) -> None:
        self.start = time.monotonic()
        self.path = path
        if path is not None:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text("", encoding="utf-8")

    def __call__(self, stage: str, **fields: object) -> None:
        elapsed = time.monotonic() - self.start
        suffix = " ".join(f"{key}={value}" for key, value in fields.items())
        line = f"[{elapsed:9.3f}s] {stage}"
        if suffix:
            line += " " + suffix
        print(line, flush=True)
        if self.path is not None:
            with self.path.open("a", encoding="utf-8") as handle:
                handle.write(line + "\n")


def load_encoder() -> ModuleType:
    spec = importlib.util.spec_from_file_location("exact6_structural_encoder", ENCODER_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {ENCODER_PATH}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def build_structural_outer(module: ModuleType, orbit: str, log: Logger):
    encoder = module.ExactSixOuterEncoder(orbit)
    for method_name in OUTER_METHODS:
        before = len(encoder.cnf.clauses)
        log("outer_method_start", method=method_name, clauses=before)
        getattr(encoder, method_name)()
        after = len(encoder.cnf.clauses)
        log("outer_method_done", method=method_name, added=after - before, clauses=after)
    forbidden = {
        "transported_2k3_schema_cuts",
        "learned_weighted_kalmanson_schema_cuts",
    }
    present = set(encoder.cnf.kinds)
    if present & forbidden:
        raise AssertionError(f"literal metric-cut bank leaked into MILP: {present & forbidden}")
    return encoder


class ConstraintBuilder:
    def __init__(self, variable_count: int, log: Logger, log_every: int) -> None:
        self.variable_count = variable_count
        self.log = log
        self.log_every = log_every
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
            if value == 0:
                continue
            self.rows.append(row)
            self.columns.append(column)
            self.values.append(float(value))
        self.lower.append(float(lower))
        self.upper.append(float(upper))
        self.kinds[kind] += 1
        if self.log_every > 0 and len(self.lower) % self.log_every == 0:
            self.log(
                "constraint_progress",
                constraints=len(self.lower),
                nonzeros=len(self.values),
                latest=kind,
            )

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


def edge(left: int, right: int) -> tuple[int, int]:
    return (left, right) if left < right else (right, left)


class IntegratedModel:
    def __init__(self, module: ModuleType, encoder, log: Logger, log_every: int) -> None:
        self.module = module
        self.encoder = encoder
        self.n = module.N
        self.vertices = tuple(module.VERTICES)
        self.boolean_count = encoder.v.count
        self.distance_edges = tuple(itertools.combinations(self.vertices, 2))
        self.distance_column = {
            pair: self.boolean_count + index
            for index, pair in enumerate(self.distance_edges)
        }
        self.epsilon_column = self.boolean_count + len(self.distance_edges)
        self.variable_count = self.epsilon_column + 1
        self.builder = ConstraintBuilder(self.variable_count, log, log_every)
        self.log = log
        self.metric_profile = "full"

    def boolean_column(self, variable: int) -> int:
        if not 1 <= variable <= self.boolean_count:
            raise ValueError(variable)
        return variable - 1

    def distance(self, left: int, right: int) -> int:
        if left == right:
            raise ValueError("zero distance is not a MILP variable")
        return self.distance_column[edge(left, right)]

    def add_structural_clauses(self) -> None:
        for kind, clause in zip(
            self.encoder.cnf.kinds, self.encoder.cnf.clauses, strict=True
        ):
            negative_count = sum(literal < 0 for literal in clause)
            coefficients = (
                (self.boolean_column(abs(literal)), 1.0 if literal > 0 else -1.0)
                for literal in clause
            )
            self.builder.add(
                f"structural:{kind}",
                coefficients,
                lower=1 - negative_count,
            )

    def add_normalization_and_strict_metric(self, metric_profile: str) -> None:
        self.metric_profile = metric_profile
        self.builder.add(
            "distance_normalization",
            ((column, 1.0) for column in self.distance_column.values()),
            lower=1.0,
            upper=1.0,
        )
        if metric_profile == "full":
            for column in self.distance_column.values():
                self.builder.add(
                    "positive_distance",
                    ((column, 1.0), (self.epsilon_column, -1.0)),
                    lower=0.0,
                )
            for a, b, c in itertools.combinations(self.vertices, 3):
                for positive_left, positive_right, negative in (
                    ((a, b), (b, c), (a, c)),
                    ((a, b), (a, c), (b, c)),
                    ((a, c), (b, c), (a, b)),
                ):
                    self.builder.add(
                        "strict_triangle",
                        (
                            (self.distance(*positive_left), 1.0),
                            (self.distance(*positive_right), 1.0),
                            (self.distance(*negative), -1.0),
                            (self.epsilon_column, -1.0),
                        ),
                        lower=0.0,
                    )
        for a, b, c, d in itertools.combinations(self.vertices, 4):
            diagonal_terms = (
                (self.distance(a, c), 1.0),
                (self.distance(b, d), 1.0),
            )
            self.builder.add(
                "strict_kalmanson_first",
                (
                    *diagonal_terms,
                    (self.distance(a, b), -1.0),
                    (self.distance(c, d), -1.0),
                    (self.epsilon_column, -1.0),
                ),
                lower=0.0,
            )
            self.builder.add(
                "strict_kalmanson_second",
                (
                    *diagonal_terms,
                    (self.distance(a, d), -1.0),
                    (self.distance(b, c), -1.0),
                    (self.epsilon_column, -1.0),
                ),
                lower=0.0,
            )

    def add_guarded_equalities(self) -> None:
        # With nonnegative distances summing to one, every distance lies in
        # [0,1].  Thus M=1 is a rigorous inactive bound for |d1-d2|.
        for center in self.vertices:
            points = [point for point in self.vertices if point != center]
            for left, right in itertools.combinations(points, 2):
                left_member = self.boolean_column(self.encoder.m(center, left))
                right_member = self.boolean_column(self.encoder.m(center, right))
                left_distance = self.distance(center, left)
                right_distance = self.distance(center, right)
                self.builder.add(
                    "selected_row_guarded_equality_pos",
                    (
                        (left_distance, 1.0),
                        (right_distance, -1.0),
                        (left_member, 1.0),
                        (right_member, 1.0),
                    ),
                    upper=2.0,
                )
                self.builder.add(
                    "selected_row_guarded_equality_neg",
                    (
                        (left_distance, -1.0),
                        (right_distance, 1.0),
                        (left_member, 1.0),
                        (right_member, 1.0),
                    ),
                    upper=2.0,
                )

        apex = self.module.SECOND_APEX
        shell_points = [point for point in self.vertices if point != apex]
        for left, right in itertools.combinations(shell_points, 2):
            left_shell = self.boolean_column(self.encoder.shell[left])
            right_shell = self.boolean_column(self.encoder.shell[right])
            left_distance = self.distance(apex, left)
            right_distance = self.distance(apex, right)
            self.builder.add(
                "exact_five_shell_guarded_equality_pos",
                (
                    (left_distance, 1.0),
                    (right_distance, -1.0),
                    (left_shell, 1.0),
                    (right_shell, 1.0),
                ),
                upper=2.0,
            )
            self.builder.add(
                "exact_five_shell_guarded_equality_neg",
                (
                    (left_distance, -1.0),
                    (right_distance, 1.0),
                    (left_shell, 1.0),
                    (right_shell, 1.0),
                ),
                upper=2.0,
            )

    def arrays(
        self, fixed_epsilon: float | None = None
    ) -> tuple[np.ndarray, np.ndarray, Bounds, LinearConstraint]:
        objective = np.zeros(self.variable_count, dtype=np.float64)
        objective[self.epsilon_column] = -1.0
        integrality = np.zeros(self.variable_count, dtype=np.uint8)
        integrality[: self.boolean_count] = 1
        lower = np.zeros(self.variable_count, dtype=np.float64)
        upper = np.ones(self.variable_count, dtype=np.float64)
        if fixed_epsilon is not None:
            lower[self.epsilon_column] = fixed_epsilon
            upper[self.epsilon_column] = fixed_epsilon
        return objective, integrality, Bounds(lower, upper), self.builder.finish()


def solve_lp_relaxation(
    objective: np.ndarray,
    bounds: Bounds,
    constraints: LinearConstraint,
    options: dict[str, object],
):
    """Solve the continuous relaxation and retain HiGHS row/bound marginals."""
    matrix = constraints.A.tocsr()
    lower = np.asarray(constraints.lb)
    upper = np.asarray(constraints.ub)
    equality = np.isfinite(lower) & np.isfinite(upper) & (lower == upper)
    upper_only = np.isfinite(upper) & ~equality
    lower_only = np.isfinite(lower) & ~equality
    inequality_matrices = []
    inequality_rhs = []
    if np.any(upper_only):
        inequality_matrices.append(matrix[upper_only])
        inequality_rhs.append(upper[upper_only])
    if np.any(lower_only):
        inequality_matrices.append(-matrix[lower_only])
        inequality_rhs.append(-lower[lower_only])
    a_ub = vstack(inequality_matrices, format="csr") if inequality_matrices else None
    b_ub = np.concatenate(inequality_rhs) if inequality_rhs else None
    a_eq = matrix[equality] if np.any(equality) else None
    b_eq = lower[equality] if np.any(equality) else None
    lp_options = {
        "disp": options["disp"],
        "presolve": options["presolve"],
        "time_limit": options["time_limit"],
        "dual_feasibility_tolerance": 1e-9,
        "primal_feasibility_tolerance": 1e-9,
    }
    result = linprog(
        objective,
        A_ub=a_ub,
        b_ub=b_ub,
        A_eq=a_eq,
        b_eq=b_eq,
        bounds=list(zip(bounds.lb, bounds.ub, strict=True)),
        method="highs",
        options=lp_options,
    )
    result._integrated_lp_matrices = {
        "a_ub": a_ub,
        "b_ub": b_ub,
        "a_eq": a_eq,
        "b_eq": b_eq,
        "equality_mask": equality,
        "upper_mask": upper_only,
        "lower_mask": lower_only,
    }
    return result


def decode_boolean(model: IntegratedModel, values: np.ndarray) -> dict[str, object]:
    encoder = model.encoder
    rounded = np.rint(values[: model.boolean_count]).astype(np.int8)

    def truth(variable: int) -> bool:
        return bool(rounded[variable - 1])

    rows = {
        str(center): [
            point for point in model.vertices if truth(encoder.m(center, point))
        ]
        for center in model.vertices
    }
    shell = [point for point in model.vertices if truth(encoder.shell[point])]
    roles = {
        role: next(
            point for point in model.vertices if truth(encoder.r(role, point))
        )
        for role in ("first", "second", "source", "target", "unused")
    }
    blockers = {
        str(source): next(
            center for center in model.vertices if truth(encoder.b(source, center))
        )
        for source in model.vertices
    }
    return {
        "rounded": rounded,
        "rows": rows,
        "shell": shell,
        "roles": roles,
        "blockers": blockers,
    }


def replay_float(
    model: IntegratedModel,
    values: np.ndarray,
    decoded: dict[str, object],
    tolerance: float,
) -> dict[str, object]:
    rounded: np.ndarray = decoded["rounded"]  # type: ignore[assignment]
    unsatisfied = 0
    for clause in model.encoder.cnf.clauses:
        if not any(
            (rounded[abs(literal) - 1] == 1) if literal > 0
            else (rounded[abs(literal) - 1] == 0)
            for literal in clause
        ):
            unsatisfied += 1

    distances = {
        pair: float(values[column]) for pair, column in model.distance_column.items()
    }

    def distance(left: int, right: int) -> float:
        return 0.0 if left == right else distances[edge(left, right)]

    triangle_slacks: list[float] = []
    for a, b, c in itertools.combinations(model.vertices, 3):
        triangle_slacks.extend((
            distance(a, b) + distance(b, c) - distance(a, c),
            distance(a, b) + distance(a, c) - distance(b, c),
            distance(a, c) + distance(b, c) - distance(a, b),
        ))
    kalmanson_slacks: list[float] = []
    for a, b, c, d in itertools.combinations(model.vertices, 4):
        diagonals = distance(a, c) + distance(b, d)
        kalmanson_slacks.extend((
            diagonals - distance(a, b) - distance(c, d),
            diagonals - distance(a, d) - distance(b, c),
        ))

    row_errors: list[float] = []
    rows: dict[str, list[int]] = decoded["rows"]  # type: ignore[assignment]
    for center_text, support in rows.items():
        center = int(center_text)
        radii = [distance(center, point) for point in support]
        row_errors.append(max(radii) - min(radii))
    shell: list[int] = decoded["shell"]  # type: ignore[assignment]
    shell_radii = [distance(model.module.SECOND_APEX, point) for point in shell]
    shell_error = max(shell_radii) - min(shell_radii)
    epsilon = float(values[model.epsilon_column])
    integrality_error = float(np.max(np.abs(
        values[: model.boolean_count] - rounded
    )))
    minimum_distance = min(distances.values())
    valid = (
        unsatisfied == 0
        and integrality_error <= tolerance
        and abs(sum(distances.values()) - 1.0) <= tolerance
        and (
            model.metric_profile != "full"
            or minimum_distance + tolerance >= epsilon
        )
        and (
            model.metric_profile != "full"
            or min(triangle_slacks) + tolerance >= epsilon
        )
        and min(kalmanson_slacks) + tolerance >= epsilon
        and max(row_errors) <= tolerance
        and shell_error <= tolerance
    )
    return {
        "valid": valid,
        "unsatisfied_structural_clauses": unsatisfied,
        "integrality_error": integrality_error,
        "distance_sum_error": abs(sum(distances.values()) - 1.0),
        "minimum_distance": minimum_distance,
        "minimum_triangle_slack": min(triangle_slacks),
        "minimum_kalmanson_slack": min(kalmanson_slacks),
        "maximum_selected_row_equality_error": max(row_errors),
        "exact_five_shell_equality_error": shell_error,
        "epsilon": epsilon,
        "tolerance": tolerance,
    }


class UnionFind:
    def __init__(self, size: int) -> None:
        self.parent = list(range(size))

    def find(self, item: int) -> int:
        while self.parent[item] != item:
            self.parent[item] = self.parent[self.parent[item]]
            item = self.parent[item]
        return item

    def union(self, left: int, right: int) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[right_root] = left_root


def exact_rational_replay(
    model: IntegratedModel,
    values: np.ndarray,
    decoded: dict[str, object],
    max_denominator: int,
) -> dict[str, object]:
    edge_index = {pair: index for index, pair in enumerate(model.distance_edges)}
    union = UnionFind(len(model.distance_edges))

    def index(left: int, right: int) -> int:
        return edge_index[edge(left, right)]

    rows: dict[str, list[int]] = decoded["rows"]  # type: ignore[assignment]
    for center_text, support in rows.items():
        center = int(center_text)
        reference = support[0]
        for point in support[1:]:
            union.union(index(center, reference), index(center, point))
    shell: list[int] = decoded["shell"]  # type: ignore[assignment]
    shell_reference = shell[0]
    for point in shell[1:]:
        union.union(
            index(model.module.SECOND_APEX, shell_reference),
            index(model.module.SECOND_APEX, point),
        )

    components: dict[int, list[int]] = {}
    for item in range(len(model.distance_edges)):
        components.setdefault(union.find(item), []).append(item)
    component_value: dict[int, Fraction] = {}
    for root, items in components.items():
        average = sum(
            float(values[model.distance_column[model.distance_edges[item]]])
            for item in items
        ) / len(items)
        component_value[root] = Fraction(str(average)).limit_denominator(max_denominator)

    raw = {
        pair: component_value[union.find(item)]
        for item, pair in enumerate(model.distance_edges)
    }
    total = sum(raw.values(), Fraction(0))
    if total <= 0:
        return {"valid": False, "reason": "nonpositive reconstructed total"}
    distances = {pair: value / total for pair, value in raw.items()}

    def distance(left: int, right: int) -> Fraction:
        return Fraction(0) if left == right else distances[edge(left, right)]

    triangle_slacks: list[Fraction] = []
    for a, b, c in itertools.combinations(model.vertices, 3):
        triangle_slacks.extend((
            distance(a, b) + distance(b, c) - distance(a, c),
            distance(a, b) + distance(a, c) - distance(b, c),
            distance(a, c) + distance(b, c) - distance(a, b),
        ))
    kalmanson_slacks: list[Fraction] = []
    for a, b, c, d in itertools.combinations(model.vertices, 4):
        diagonals = distance(a, c) + distance(b, d)
        kalmanson_slacks.extend((
            diagonals - distance(a, b) - distance(c, d),
            diagonals - distance(a, d) - distance(b, c),
        ))

    equality_valid = True
    for center_text, support in rows.items():
        center = int(center_text)
        equality_valid &= len({distance(center, point) for point in support}) == 1
    equality_valid &= len({
        distance(model.module.SECOND_APEX, point) for point in shell
    }) == 1
    valid = (
        equality_valid
        and (model.metric_profile != "full" or min(distances.values()) > 0)
        and (model.metric_profile != "full" or min(triangle_slacks) > 0)
        and min(kalmanson_slacks) > 0
        and sum(distances.values(), Fraction(0)) == 1
    )
    return {
        "valid": valid,
        "max_denominator": max_denominator,
        "component_count": len(components),
        "minimum_distance": str(min(distances.values())),
        "minimum_triangle_slack": str(min(triangle_slacks)),
        "minimum_kalmanson_slack": str(min(kalmanson_slacks)),
        "distances": {
            f"{left},{right}": str(value)
            for (left, right), value in sorted(distances.items())
        } if valid else None,
    }


def result_payload(
    args: argparse.Namespace,
    model: IntegratedModel,
    scipy_result,
    elapsed: float,
) -> dict[str, object]:
    status_fields = {
        "scipy_status": int(scipy_result.status),
        "scipy_success": bool(scipy_result.success),
        "message": str(scipy_result.message),
        "mip_node_count": getattr(scipy_result, "mip_node_count", None),
        "mip_gap": getattr(scipy_result, "mip_gap", None),
        "mip_dual_bound": getattr(scipy_result, "mip_dual_bound", None),
        "wall_seconds": elapsed,
    }
    payload: dict[str, object] = {
        "schema": "p97-exact6-integrated-milp-v1",
        "orbit": args.orbit,
        "encoder_path": str(ENCODER_PATH.relative_to(REPO)),
        "encoder_sha256": file_sha256(ENCODER_PATH),
        "literal_metric_cut_banks": "OMITTED",
        "metric_profile": args.metric_profile,
        "outer_methods": list(OUTER_METHODS),
        "boolean_variables": model.boolean_count,
        "distance_variables": len(model.distance_edges),
        "total_variables": model.variable_count,
        "total_constraints": len(model.builder.lower),
        "constraint_counts": dict(sorted(model.builder.kinds.items())),
        "normalization": {
            "distance_bounds": "0 <= d_ij <= 1",
            "sum_distances": "sum d_ij = 1",
            "objective": "maximize common strict slack epsilon",
            "guard_big_m": 1,
            "justification": (
                "The selected metric-profile inequalities and radius-equality system "
                "are homogeneous. Any strict feasible table scales to sum one; then every "
                "distance lies in [0,1], so M=1 rigorously deactivates a guarded "
                "difference. Positive epsilon is equivalent to strict feasibility."
            ),
        },
        "solver": {
            "name": (
                "scipy.optimize.linprog/HiGHS"
                if args.relax
                else "scipy.optimize.milp/HiGHS"
            ),
            "relaxation": bool(args.relax),
            "fixed_epsilon": args.fixed_epsilon,
            "time_limit": args.time_limit,
            "node_limit": args.node_limit,
            "mip_rel_gap": args.mip_rel_gap,
            "threads_requested": args.threads,
            **status_fields,
        },
    }

    values = scipy_result.x
    if args.relax:
        if values is not None:
            epsilon = float(values[model.epsilon_column])
            boolean_values = values[: model.boolean_count]
            payload["lp_incumbent"] = {
                "epsilon": epsilon,
                "maximum_boolean_fractionality": float(np.max(np.minimum(
                    boolean_values, 1.0 - boolean_values
                ))),
                "objective": float(scipy_result.fun),
            }
            payload["lp_dual_summary"] = {
                "inequality_nonzero_marginals": int(np.count_nonzero(
                    np.abs(scipy_result.ineqlin.marginals) > 1e-10
                )),
                "equality_nonzero_marginals": int(np.count_nonzero(
                    np.abs(scipy_result.eqlin.marginals) > 1e-10
                )),
                "lower_bound_nonzero_marginals": int(np.count_nonzero(
                    np.abs(scipy_result.lower.marginals) > 1e-10
                )),
                "upper_bound_nonzero_marginals": int(np.count_nonzero(
                    np.abs(scipy_result.upper.marginals) > 1e-10
                )),
            }
            if scipy_result.status == 0 and epsilon <= args.positive_tolerance:
                payload["epistemic_status"] = (
                    "HIGHS_LP_RELAXATION_OPTIMAL_NONPOSITIVE_COMMON_SLACK_"
                    "NO_EXACT_DUAL_CERTIFICATE"
                )
            elif epsilon > args.positive_tolerance:
                payload["epistemic_status"] = "HIGHS_LP_RELAXATION_POSITIVE_SLACK"
            else:
                payload["epistemic_status"] = "HIGHS_LP_RELAXATION_LIMIT"
        elif scipy_result.status == 2:
            payload["epistemic_status"] = (
                "HIGHS_LP_RELAXATION_INFEASIBLE_NO_EXACT_CERTIFICATE"
            )
        else:
            payload["epistemic_status"] = "HIGHS_LP_RELAXATION_NO_VERDICT"
        return payload

    if values is not None:
        decoded = decode_boolean(model, values)
        float_replay = replay_float(model, values, decoded, args.replay_tolerance)
        rational_replay = exact_rational_replay(
            model, values, decoded, args.max_denominator
        )
        epsilon = float(values[model.epsilon_column])
        payload["incumbent"] = {
            "epsilon": epsilon,
            "rows": decoded["rows"],
            "shell": decoded["shell"],
            "roles": decoded["roles"],
            "blockers": decoded["blockers"],
            "float_replay": float_replay,
            "exact_rational_replay": rational_replay,
        }
        if epsilon > args.positive_tolerance and rational_replay["valid"]:
            payload["epistemic_status"] = (
                "SAT_EXACT_RATIONAL_INTEGRATED_STRUCTURAL_LINEAR_SHADOW_"
                "NOT_LIVE_LEAN_CLOSURE"
            )
            return payload
        if epsilon > args.positive_tolerance and float_replay["valid"]:
            payload["epistemic_status"] = (
                "SAT_NUMERICAL_HIGHS_REPLAYED_WITH_TOLERANCE_"
                "NOT_LIVE_LEAN_CLOSURE"
            )
            return payload
        if epsilon > args.positive_tolerance:
            payload["epistemic_status"] = "HIGHS_POSITIVE_INCUMBENT_REPLAY_FAILED"
            return payload

    if scipy_result.status == 0:
        payload["epistemic_status"] = (
            "HIGHS_OPTIMAL_NONPOSITIVE_COMMON_SLACK_NO_EXACT_CERTIFICATE"
        )
    elif scipy_result.status == 1:
        payload["epistemic_status"] = "HIGHS_LIMIT_NO_POSITIVE_REPLAYED_WITNESS"
    elif scipy_result.status == 2:
        payload["epistemic_status"] = "HIGHS_MILP_INFEASIBLE_NO_EXACT_CERTIFICATE"
    else:
        payload["epistemic_status"] = "HIGHS_FAILURE_NO_VERDICT"
    return payload


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orbit", default="continuationOrder")
    parser.add_argument("--time-limit", type=float, default=300.0)
    parser.add_argument("--node-limit", type=int, default=1_000_000)
    parser.add_argument("--mip-rel-gap", type=float, default=0.0)
    parser.add_argument("--threads", type=int, default=24)
    parser.add_argument(
        "--relax",
        action="store_true",
        help="solve the continuous LP relaxation and retain HiGHS marginals",
    )
    parser.add_argument(
        "--fixed-epsilon",
        type=float,
        help="fix the common slack exactly (for positive-slack feasibility gates)",
    )
    parser.add_argument(
        "--metric-profile",
        choices=("full", "kalmanson-only"),
        default="full",
        help="full strict metric gate, or the stronger Kalmanson-only obstruction gate",
    )
    parser.add_argument("--log-every", type=int, default=25_000)
    parser.add_argument("--positive-tolerance", type=float, default=1e-8)
    parser.add_argument("--replay-tolerance", type=float, default=1e-7)
    parser.add_argument("--max-denominator", type=int, default=1_000_000_000)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--log-file", type=Path)
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    log = Logger(args.log_file)
    log("load_encoder", path=ENCODER_PATH, sha256=file_sha256(ENCODER_PATH))
    module = load_encoder()
    if args.orbit not in module.ORBITS:
        raise ValueError(args.orbit)
    encoder = build_structural_outer(module, args.orbit, log)
    log(
        "outer_complete",
        variables=encoder.v.count,
        clauses=len(encoder.cnf.clauses),
        categories=len(set(encoder.cnf.kinds)),
    )

    model = IntegratedModel(module, encoder, log, args.log_every)
    log("translate_structural_start")
    model.add_structural_clauses()
    log("translate_structural_done", constraints=len(model.builder.lower))
    log("add_metric_start")
    model.add_normalization_and_strict_metric(args.metric_profile)
    model.add_guarded_equalities()
    log(
        "model_complete",
        variables=model.variable_count,
        constraints=len(model.builder.lower),
        nonzeros=len(model.builder.values),
    )
    objective, integrality, bounds, constraints = model.arrays(args.fixed_epsilon)
    options: dict[str, object] = {
        "disp": True,
        "presolve": True,
        "time_limit": args.time_limit,
        "node_limit": args.node_limit,
        "mip_rel_gap": args.mip_rel_gap,
        "threads": args.threads,
    }
    log(
        "highs_start",
        time_limit=args.time_limit,
        threads=args.threads,
        relaxation=args.relax,
        fixed_epsilon=args.fixed_epsilon,
    )
    solve_start = time.monotonic()
    if args.relax:
        scipy_result = solve_lp_relaxation(objective, bounds, constraints, options)
    else:
        scipy_result = milp(
            objective,
            integrality=integrality,
            bounds=bounds,
            constraints=constraints,
            options=options,
        )
    elapsed = time.monotonic() - solve_start
    log(
        "highs_done",
        status=scipy_result.status,
        success=scipy_result.success,
        elapsed=f"{elapsed:.3f}",
        message=str(scipy_result.message).replace(" ", "_"),
    )
    payload = result_payload(args, model, scipy_result, elapsed)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    log(
        "result_written",
        output=args.output,
        epistemic_status=payload["epistemic_status"],
    )


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Probe exact rational replay of one fixed-Boolean LP leaf dual."""

from __future__ import annotations

import argparse
import json
from fractions import Fraction
from pathlib import Path

import numpy as np

import integrated_milp as integrated
from verify_results import QuietLog, reconstruct_assignment


def rational(value: float, max_denominator: int) -> Fraction:
    if abs(value) < 1e-10:
        return Fraction(0)
    return Fraction(str(value)).limit_denominator(max_denominator)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--max-denominator", type=int, default=1_000_000)
    args = parser.parse_args()

    source = json.loads(args.input.read_text(encoding="utf-8"))
    module = integrated.load_encoder()
    encoder = integrated.build_structural_outer(module, source["orbit"], QuietLog())
    model = integrated.IntegratedModel(module, encoder, QuietLog(), 0)
    model.add_structural_clauses()
    model.add_normalization_and_strict_metric(source.get("metric_profile", "full"))
    model.add_guarded_equalities()
    objective, _integrality, bounds, constraints = model.arrays()

    assignment = reconstruct_assignment(module, encoder, source["incumbent"])
    lower = np.array(bounds.lb, copy=True)
    upper = np.array(bounds.ub, copy=True)
    for column, value in enumerate(assignment):
        lower[column] = float(value)
        upper[column] = float(value)
    fixed_bounds = integrated.Bounds(lower, upper)
    result = integrated.solve_lp_relaxation(
        objective,
        fixed_bounds,
        constraints,
        {"disp": False, "presolve": True, "time_limit": 300.0},
    )
    if result.status != 0:
        raise SystemExit(f"fixed leaf LP did not optimize: {result.message}")

    matrices = result._integrated_lp_matrices
    a_ub = matrices["a_ub"].tocsc()
    b_ub = matrices["b_ub"]
    a_eq = matrices["a_eq"].tocsc()
    b_eq = matrices["b_eq"]
    y_ub = [rational(float(value), args.max_denominator) for value in result.ineqlin.marginals]
    y_eq = [rational(float(value), args.max_denominator) for value in result.eqlin.marginals]
    y_lower = [rational(float(value), args.max_denominator) for value in result.lower.marginals]
    y_upper = [rational(float(value), args.max_denominator) for value in result.upper.marginals]

    stationarity: list[Fraction] = []
    for column in range(model.variable_count):
        residual = Fraction(int(objective[column]))
        for pointer in range(a_ub.indptr[column], a_ub.indptr[column + 1]):
            row = int(a_ub.indices[pointer])
            coefficient = Fraction(int(a_ub.data[pointer]))
            residual -= coefficient * y_ub[row]
        for pointer in range(a_eq.indptr[column], a_eq.indptr[column + 1]):
            row = int(a_eq.indices[pointer])
            coefficient = Fraction(int(a_eq.data[pointer]))
            residual -= coefficient * y_eq[row]
        residual -= y_lower[column]
        residual -= y_upper[column]
        stationarity.append(residual)

    dual_objective = sum(
        (Fraction(int(rhs)) * value for rhs, value in zip(b_ub, y_ub, strict=True)),
        Fraction(0),
    )
    dual_objective += sum(
        (Fraction(int(rhs)) * value for rhs, value in zip(b_eq, y_eq, strict=True)),
        Fraction(0),
    )
    dual_objective += sum(
        (Fraction(int(value)) * marginal for value, marginal in zip(lower, y_lower, strict=True)),
        Fraction(0),
    )
    dual_objective += sum(
        (Fraction(int(value)) * marginal for value, marginal in zip(upper, y_upper, strict=True)),
        Fraction(0),
    )

    exact_valid = (
        all(value <= 0 for value in y_ub)
        and all(value >= 0 for value in y_lower)
        and all(value <= 0 for value in y_upper)
        and not any(stationarity)
        and dual_objective == 0
    )
    inverse_boolean = {value - 1: name for name, value in encoder.v.by_name.items()}
    column_names = []
    inverse_distance = {column: pair for pair, column in model.distance_column.items()}
    for column in range(model.variable_count):
        if column in inverse_boolean:
            column_names.append(inverse_boolean[column])
        elif column in inverse_distance:
            left, right = inverse_distance[column]
            column_names.append(f"d_{left}_{right}")
        else:
            column_names.append("epsilon")
    upper_rows = np.flatnonzero(matrices["upper_mask"])
    lower_rows = np.flatnonzero(matrices["lower_mask"])
    inequality_support = []
    for converted_index, multiplier in enumerate(y_ub):
        if not multiplier:
            continue
        if converted_index < len(upper_rows):
            original_row = int(upper_rows[converted_index])
            sense = "upper"
        else:
            original_row = int(lower_rows[converted_index - len(upper_rows)])
            sense = "negated_lower"
        row = a_ub[converted_index].tocsr()
        inequality_support.append({
            "converted_index": converted_index,
            "original_row": original_row,
            "sense": sense,
            "rhs": int(b_ub[converted_index]),
            "multiplier": str(multiplier),
            "terms": [
                [column_names[int(column)], int(value)]
                for column, value in zip(row.indices, row.data, strict=True)
            ],
        })
    antecedent = [
        {
            "column": column,
            "name": column_names[column],
            "multiplier": str(y_lower[column]),
        }
        for column in range(model.boolean_count)
        if y_lower[column]
    ]
    antecedent_is_true_boolean_support = all(
        assignment[item["column"]] for item in antecedent
    )
    output = {
        "schema": "p97-exact6-integrated-fixed-leaf-dual-probe-v1",
        "epistemic_status": (
            "EXACT_RATIONAL_FIXED_LEAF_DUAL_REPLAY_PASS"
            if exact_valid
            else "RATIONALIZED_FIXED_LEAF_DUAL_REPLAY_FAILED"
        ),
        "orbit": source["orbit"],
        "metric_profile": source.get("metric_profile", "full"),
        "primal_objective": result.fun,
        "rational_dual_objective": str(dual_objective),
        "nonzero_inequality_marginals": sum(value != 0 for value in y_ub),
        "nonzero_equality_marginals": sum(value != 0 for value in y_eq),
        "nonzero_lower_bound_marginals": sum(value != 0 for value in y_lower),
        "nonzero_upper_bound_marginals": sum(value != 0 for value in y_upper),
        "nonzero_stationarity_residuals": sum(value != 0 for value in stationarity),
        "maximum_stationarity_residual": str(max(map(abs, stationarity))),
        "max_denominator": args.max_denominator,
        "exact_replay_valid": exact_valid,
        "decoded_dual_support": {
            "inequalities": inequality_support,
            "antecedent_true_literals": antecedent,
            "antecedent_is_true_boolean_support": antecedent_is_true_boolean_support,
            "nogood_clause": [f"not {item['name']}" for item in antecedent],
        },
        "fixed_boolean_true_columns": [
            index for index, value in enumerate(assignment) if value
        ],
        "certificate": {
            "inequality_marginals": [
                [index, str(value)]
                for index, value in enumerate(y_ub) if value
            ],
            "equality_marginals": [
                [index, str(value)]
                for index, value in enumerate(y_eq) if value
            ],
            "lower_bound_marginals": [
                [index, str(value)]
                for index, value in enumerate(y_lower) if value
            ],
            "upper_bound_marginals": [
                [index, str(value)]
                for index, value in enumerate(y_upper) if value
            ],
        },
    }
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(output["epistemic_status"])


if __name__ == "__main__":
    main()

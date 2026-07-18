#!/usr/bin/env python3
"""Independently replay an exact fixed-leaf dual artifact without a solver."""

from __future__ import annotations

import argparse
import json
from fractions import Fraction
from pathlib import Path

import numpy as np
from scipy.sparse import vstack

import integrated_milp as integrated
from verify_results import QuietLog


def sparse_vector(records: list[list[object]], size: int) -> list[Fraction]:
    result = [Fraction(0)] * size
    for index, value in records:
        result[int(index)] = Fraction(str(value))
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", required=True, type=Path)
    args = parser.parse_args()
    artifact = json.loads(args.input.read_text(encoding="utf-8"))

    module = integrated.load_encoder()
    encoder = integrated.build_structural_outer(module, artifact["orbit"], QuietLog())
    model = integrated.IntegratedModel(module, encoder, QuietLog(), 0)
    model.add_structural_clauses()
    model.add_normalization_and_strict_metric(artifact["metric_profile"])
    model.add_guarded_equalities()
    objective, _integrality, bounds, constraints = model.arrays()

    true_columns = set(artifact["fixed_boolean_true_columns"])
    lower = np.array(bounds.lb, copy=True)
    upper = np.array(bounds.ub, copy=True)
    for column in range(model.boolean_count):
        value = 1.0 if column in true_columns else 0.0
        lower[column] = value
        upper[column] = value

    matrix = constraints.A.tocsr()
    row_lower = np.asarray(constraints.lb)
    row_upper = np.asarray(constraints.ub)
    equality = np.isfinite(row_lower) & np.isfinite(row_upper) & (row_lower == row_upper)
    upper_only = np.isfinite(row_upper) & ~equality
    lower_only = np.isfinite(row_lower) & ~equality
    inequality_matrices = []
    inequality_rhs = []
    if np.any(upper_only):
        inequality_matrices.append(matrix[upper_only])
        inequality_rhs.append(row_upper[upper_only])
    if np.any(lower_only):
        inequality_matrices.append(-matrix[lower_only])
        inequality_rhs.append(-row_lower[lower_only])
    a_ub = vstack(inequality_matrices, format="csc")
    b_ub = np.concatenate(inequality_rhs)
    a_eq = matrix[equality].tocsc()
    b_eq = row_lower[equality]

    certificate = artifact["certificate"]
    y_ub = sparse_vector(certificate["inequality_marginals"], a_ub.shape[0])
    y_eq = sparse_vector(certificate["equality_marginals"], a_eq.shape[0])
    y_lower = sparse_vector(certificate["lower_bound_marginals"], model.variable_count)
    y_upper = sparse_vector(certificate["upper_bound_marginals"], model.variable_count)

    stationarity = []
    for column in range(model.variable_count):
        residual = Fraction(int(objective[column]))
        for pointer in range(a_ub.indptr[column], a_ub.indptr[column + 1]):
            residual -= Fraction(int(a_ub.data[pointer])) * y_ub[int(a_ub.indices[pointer])]
        for pointer in range(a_eq.indptr[column], a_eq.indptr[column + 1]):
            residual -= Fraction(int(a_eq.data[pointer])) * y_eq[int(a_eq.indices[pointer])]
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

    valid = (
        all(value <= 0 for value in y_ub)
        and all(value >= 0 for value in y_lower)
        and all(value <= 0 for value in y_upper)
        and not any(stationarity)
        and dual_objective == 0
    )
    if not valid:
        raise SystemExit(
            f"dual replay failed: objective={dual_objective}, "
            f"stationarity={sum(value != 0 for value in stationarity)}"
        )
    print(
        "INDEPENDENT_EXACT_FIXED_LEAF_DUAL_REPLAY_PASS "
        f"orbit={artifact['orbit']} support={sum(value != 0 for value in y_ub)}"
    )


if __name__ == "__main__":
    main()

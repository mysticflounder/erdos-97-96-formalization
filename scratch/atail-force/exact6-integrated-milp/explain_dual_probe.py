#!/usr/bin/env python3
"""Print named support rows for a fixed-leaf exact dual probe."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import numpy as np
from scipy.sparse import vstack

import integrated_milp as integrated
from verify_results import QuietLog


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
    _objective, _integrality, _bounds, constraints = model.arrays()

    inverse_boolean = {value - 1: name for name, value in encoder.v.by_name.items()}
    names = []
    for column in range(model.variable_count):
        if column in inverse_boolean:
            names.append(inverse_boolean[column])
        elif column == model.epsilon_column:
            names.append("epsilon")
        else:
            pair = next(pair for pair, candidate in model.distance_column.items() if candidate == column)
            names.append(f"d_{pair[0]}_{pair[1]}")

    matrix = constraints.A.tocsr()
    lower = np.asarray(constraints.lb)
    upper = np.asarray(constraints.ub)
    equality = np.isfinite(lower) & np.isfinite(upper) & (lower == upper)
    upper_only = np.isfinite(upper) & ~equality
    lower_only = np.isfinite(lower) & ~equality
    upper_rows = np.flatnonzero(upper_only)
    lower_rows = np.flatnonzero(lower_only)
    a_ub = vstack((matrix[upper_only], -matrix[lower_only]), format="csr")
    b_ub = np.concatenate((upper[upper_only], -lower[lower_only]))

    for converted_index, multiplier in artifact["certificate"]["inequality_marginals"]:
        converted_index = int(converted_index)
        if converted_index < len(upper_rows):
            original_row = int(upper_rows[converted_index])
            sense = "upper"
        else:
            original_row = int(lower_rows[converted_index - len(upper_rows)])
            sense = "negated_lower"
        row = a_ub[converted_index].tocsr()
        terms = [
            [names[int(column)], int(value)]
            for column, value in zip(row.indices, row.data, strict=True)
        ]
        print(json.dumps({
            "converted_index": converted_index,
            "original_row": original_row,
            "sense": sense,
            "rhs": int(b_ub[converted_index]),
            "multiplier": multiplier,
            "terms": terms,
        }, sort_keys=True))

    print("bound support")
    for index, value in artifact["certificate"]["lower_bound_marginals"]:
        print(f"{names[int(index)]}: {value}")


if __name__ == "__main__":
    main()

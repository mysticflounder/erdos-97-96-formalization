#!/usr/bin/env python3
"""Exact finite audit of an additive tight-graph edge bound.

For ``V = Fin n`` with its standard cyclic order, a positive circular-split
metric has the form

    D(c, x) = sum_{I separates c and x} w_I,    w_I > 0,

where ``I`` ranges over the proper circular intervals modulo complement.
An incidence ``(c,x)`` is additive-tight for potentials ``alpha,beta`` when

    D(c,x) = alpha[c] + beta[x].

This script asks exact QF_LRA whether at least a requested number of nonloop
incidences can be tight simultaneously.  Positivity is normalized to
``w_I >= 1``; this is equivalent over the rationals because the system is
homogeneous.  A SAT model is replayed exactly with ``fractions.Fraction``.

The audit is theorem-discovery support.  SAT gives an exact counterexample to
the requested edge bound.  UNSAT is external finite solver evidence only.
"""

from __future__ import annotations

import argparse
import json
import time
from fractions import Fraction
from pathlib import Path
from typing import Any

import numpy as np
import scipy.optimize
import scipy.sparse
import z3


Arc = tuple[int, int]


def circular_intervals(n: int) -> tuple[frozenset[int], ...]:
    """Proper circular intervals modulo complement in the local-basis order."""

    return tuple(
        frozenset(range(left + 1, right + 1))
        for left in range(n)
        for right in range(left + 2, n)
        if not (left == 0 and right == n - 1)
    )


def separated(interval: frozenset[int], left: int, right: int) -> bool:
    return (left in interval) != (right in interval)


def as_fraction(value: z3.RatNumRef) -> Fraction:
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def solve_threshold(
    n: int,
    threshold: int,
    timeout_ms: int,
    required_edges: tuple[Arc, ...] = (),
    include_diagonal: bool = False,
    forbid_tight_diagonal: bool = False,
) -> dict[str, Any]:
    if n < 4:
        raise ValueError("n must be at least four")
    arcs = tuple(
        (center, target)
        for center in range(n)
        for target in range(n)
        if include_diagonal or center != target
    )
    if not 0 <= threshold <= len(arcs):
        raise ValueError("threshold outside the nonloop edge range")

    intervals = circular_intervals(n)
    weights = tuple(z3.Real(f"w_{index}") for index in range(len(intervals)))
    alpha = tuple(z3.Real(f"alpha_{center}") for center in range(n))
    beta = tuple(z3.Real(f"beta_{target}") for target in range(n))
    chosen = {arc: z3.Bool(f"edge_{arc[0]}_{arc[1]}") for arc in arcs}

    solver = z3.Solver()
    solver.set(timeout=timeout_ms)
    solver.add(*(weight >= 1 for weight in weights))
    solver.add(alpha[0] == 0)  # remove the alpha/beta translation lineality
    if forbid_tight_diagonal:
        solver.add(*(alpha[vertex] + beta[vertex] != 0 for vertex in range(n)))
    for center, target in arcs:
        distance = z3.Sum(
            *(
                weights[index]
                for index, interval in enumerate(intervals)
                if separated(interval, center, target)
            )
        )
        solver.add(
            z3.Implies(
                chosen[center, target],
                distance == alpha[center] + beta[target],
            )
        )
    solver.add(z3.PbGe([(chosen[arc], 1) for arc in arcs], threshold))
    assert all(arc in chosen for arc in required_edges)
    solver.add(*(chosen[arc] for arc in required_edges))

    started = time.monotonic()
    status = solver.check()
    elapsed_seconds = time.monotonic() - started
    payload: dict[str, Any] = {
        "schema": "p97-positive-circular-split-additive-tight-graph-v1",
        "epistemic_status": "EXACT_QF_LRA_FINITE_AUDIT",
        "n": n,
        "interval_count": len(intervals),
        "nonloop_arc_count": n * (n - 1),
        "candidate_arc_count": len(arcs),
        "include_diagonal": include_diagonal,
        "forbid_tight_diagonal": forbid_tight_diagonal,
        "threshold": threshold,
        "timeout_ms": timeout_ms,
        "required_edge_count": len(required_edges),
        "status": str(status).upper(),
        "elapsed_seconds": elapsed_seconds,
        "solver_statistics": str(solver.statistics()),
    }
    if status == z3.unknown:
        payload["reason_unknown"] = solver.reason_unknown()
    if status != z3.sat:
        return payload

    model = solver.model()
    weight_values = tuple(
        as_fraction(model.eval(weight, model_completion=True)) for weight in weights
    )
    alpha_values = tuple(
        as_fraction(model.eval(value, model_completion=True)) for value in alpha
    )
    beta_values = tuple(
        as_fraction(model.eval(value, model_completion=True)) for value in beta
    )
    selected = tuple(
        arc for arc in arcs if z3.is_true(model.eval(chosen[arc], model_completion=True))
    )

    assert len(selected) >= threshold
    assert all(weight >= 1 for weight in weight_values)
    for center, target in selected:
        distance = sum(
            weight_values[index]
            for index, interval in enumerate(intervals)
            if separated(interval, center, target)
        )
        assert distance == alpha_values[center] + beta_values[target]

    payload.update({
        "selected_edge_count": len(selected),
        "intervals": [sorted(interval) for interval in intervals],
        "weights": [str(value) for value in weight_values],
        "alpha": [str(value) for value in alpha_values],
        "beta": [str(value) for value in beta_values],
        "edges": [list(arc) for arc in selected],
        "row_degrees": [
            sum(center == left for left, _right in selected) for center in range(n)
        ],
        "target_degrees": [
            sum(target == right for _left, right in selected) for target in range(n)
        ],
        "replay": "EXACT_RATIONAL_PASS",
    })
    return payload


def exact_reconstruct_edges(n: int, selected: tuple[Arc, ...]) -> dict[str, Any]:
    """Reconstruct and replay an exact positive separator for fixed edges."""

    intervals = circular_intervals(n)
    weights = tuple(z3.Real(f"rw_{index}") for index in range(len(intervals)))
    alpha = tuple(z3.Real(f"ralpha_{center}") for center in range(n))
    beta = tuple(z3.Real(f"rbeta_{target}") for target in range(n))
    solver = z3.Solver()
    solver.add(*(weight >= 1 for weight in weights))
    solver.add(alpha[0] == 0)
    for center, target in selected:
        solver.add(
            z3.Sum(
                *(
                    weights[index]
                    for index, interval in enumerate(intervals)
                    if separated(interval, center, target)
                )
            )
            == alpha[center] + beta[target]
        )
    status = solver.check()
    if status != z3.sat:
        return {"exact_reconstruction_status": str(status).upper()}

    model = solver.model()
    weight_values = tuple(
        as_fraction(model.eval(weight, model_completion=True)) for weight in weights
    )
    alpha_values = tuple(
        as_fraction(model.eval(value, model_completion=True)) for value in alpha
    )
    beta_values = tuple(
        as_fraction(model.eval(value, model_completion=True)) for value in beta
    )
    for center, target in selected:
        distance = sum(
            weight_values[index]
            for index, interval in enumerate(intervals)
            if separated(interval, center, target)
        )
        assert distance == alpha_values[center] + beta_values[target]
    return {
        "exact_reconstruction_status": "SAT",
        "exact_weights": [str(value) for value in weight_values],
        "exact_alpha": [str(value) for value in alpha_values],
        "exact_beta": [str(value) for value in beta_values],
        "exact_replay": "EXACT_RATIONAL_PASS",
    }


def verify_exact_certificate(source: dict[str, Any]) -> dict[str, Any]:
    """Independently replay a serialized exact tight-graph certificate."""

    n = int(source["n"])
    intervals = circular_intervals(n)
    weights = tuple(Fraction(value) for value in source["weights"])
    alpha = tuple(Fraction(value) for value in source["alpha"])
    beta = tuple(Fraction(value) for value in source["beta"])
    claimed = tuple(tuple(map(int, arc)) for arc in source["edges"])
    assert len(weights) == len(intervals)
    assert len(alpha) == n and len(beta) == n
    assert all(weight > 0 for weight in weights)
    assert len(set(claimed)) == len(claimed)
    assert all(0 <= center < n and 0 <= target < n and center != target
               for center, target in claimed)

    def distance(left: int, right: int) -> Fraction:
        return sum(
            (
                weights[index]
                for index, interval in enumerate(intervals)
                if separated(interval, left, right)
            ),
            start=Fraction(0),
        )

    full = tuple(
        (center, target)
        for center in range(n)
        for target in range(n)
        if center != target
        and distance(center, target) == alpha[center] + beta[target]
    )
    assert claimed == full
    tight_diagonal = tuple(
        vertex for vertex in range(n) if alpha[vertex] + beta[vertex] == 0
    )
    total_zero_count = len(claimed) + len(tight_diagonal)
    k1_slacks: list[Fraction] = []
    k2_slacks: list[Fraction] = []
    for a in range(n):
        for b in range(a + 1, n):
            for c in range(b + 1, n):
                for d in range(c + 1, n):
                    diagonal = distance(a, c) + distance(b, d)
                    k1_slacks.append(diagonal - distance(a, b) - distance(c, d))
                    k2_slacks.append(diagonal - distance(a, d) - distance(b, c))
    assert all(slack > 0 for slack in (*k1_slacks, *k2_slacks))

    def reachable(reverse: bool) -> set[int]:
        seen = {0}
        stack = [0]
        while stack:
            vertex = stack.pop()
            neighbors = (
                (center for center, target in claimed if target == vertex)
                if reverse
                else (target for center, target in claimed if center == vertex)
            )
            for neighbor in neighbors:
                if neighbor not in seen:
                    seen.add(neighbor)
                    stack.append(neighbor)
        return seen

    row_degrees = tuple(
        sum(center == left for left, _right in claimed) for center in range(n)
    )
    target_degrees = tuple(
        sum(target == right for _left, right in claimed) for target in range(n)
    )
    return {
        "schema": "p97-positive-circular-split-additive-tight-graph-replay-v1",
        "status": "EXACT_RATIONAL_PASS",
        "n": n,
        "edge_count": len(claimed),
        "tight_diagonal": list(tight_diagonal),
        "tight_diagonal_count": len(tight_diagonal),
        "total_zero_count": total_zero_count,
        "four_n": 4 * n,
        "violates_total_four_n": total_zero_count > 4 * n,
        "saturates_total_four_n": total_zero_count == 4 * n,
        "four_n_minus_four": 4 * n - 4,
        "four_n_minus_one": 4 * n - 1,
        "violates_four_n_minus_four": len(claimed) > 4 * n - 4,
        "saturates_four_n_minus_one": len(claimed) == 4 * n - 1,
        "row_degrees": list(row_degrees),
        "target_degrees": list(target_degrees),
        "minimum_k1_slack": str(min(k1_slacks)),
        "minimum_k2_slack": str(min(k2_slacks)),
        "strongly_connected": len(reachable(False)) == n
        and len(reachable(True)) == n,
    }


def milp_discover(
    n: int,
    time_limit_seconds: float,
    epsilon: float,
    min_row_degree: int,
    arc_half: str,
    include_diagonal: bool,
) -> dict[str, Any]:
    """Use HiGHS MILP to discover a large equality graph, then replay exactly."""

    intervals = circular_intervals(n)
    arcs = tuple(
        (center, target)
        for center in range(n)
        for target in range(n)
        if (include_diagonal or center != target)
        and (
            arc_half == "all"
            or (center != target and (arc_half == "upper") == (center < target))
        )
    )
    weight_offset = 0
    alpha_offset = len(intervals)
    beta_offset = alpha_offset + n
    chosen_offset = beta_offset + n
    variable_count = chosen_offset + len(arcs)

    objective = np.zeros(variable_count)
    objective[chosen_offset:] = -1.0
    integrality = np.zeros(variable_count, dtype=np.uint8)
    integrality[chosen_offset:] = 1
    lower = np.full(variable_count, -float(n))
    upper = np.full(variable_count, float(n))
    lower[weight_offset:alpha_offset] = epsilon
    upper[weight_offset:alpha_offset] = 1.0
    lower[chosen_offset:] = 0.0
    upper[chosen_offset:] = 1.0

    rows: list[int] = []
    columns: list[int] = []
    values: list[float] = []
    row_lower: list[float] = []
    row_upper: list[float] = []

    def add_row(terms: dict[int, float], lo: float, hi: float) -> None:
        row = len(row_lower)
        for column, value in terms.items():
            rows.append(row)
            columns.append(column)
            values.append(value)
        row_lower.append(lo)
        row_upper.append(hi)

    add_row({index: 1.0 for index in range(len(intervals))}, 1.0, 1.0)
    add_row({alpha_offset: 1.0}, 0.0, 0.0)
    big_m = 2.0 * n + 1.0
    for arc_index, (center, target) in enumerate(arcs):
        residual = {
            index: 1.0
            for index, interval in enumerate(intervals)
            if separated(interval, center, target)
        }
        residual[alpha_offset + center] = -1.0
        residual[beta_offset + target] = -1.0
        chosen_index = chosen_offset + arc_index
        add_row({**residual, chosen_index: big_m}, -np.inf, big_m)
        add_row({**residual, chosen_index: -big_m}, -big_m, np.inf)
    for center in range(n):
        add_row(
            {
                chosen_offset + index: 1.0
                for index, (left, _right) in enumerate(arcs)
                if left == center
            },
            float(min_row_degree),
            np.inf,
        )

    matrix = scipy.sparse.csc_matrix(
        (values, (rows, columns)),
        shape=(len(row_lower), variable_count),
    )
    result = scipy.optimize.milp(
        c=objective,
        integrality=integrality,
        bounds=scipy.optimize.Bounds(lower, upper),
        constraints=scipy.optimize.LinearConstraint(matrix, row_lower, row_upper),
        options={"time_limit": time_limit_seconds, "presolve": True},
    )
    payload: dict[str, Any] = {
        "schema": "p97-positive-circular-split-additive-tight-graph-milp-v1",
        "epistemic_status": "FLOAT_MILP_DISCOVERY_WITH_EXACT_RECONSTRUCTION",
        "n": n,
        "epsilon": epsilon,
        "min_row_degree": min_row_degree,
        "arc_half": arc_half,
        "include_diagonal": include_diagonal,
        "time_limit_seconds": time_limit_seconds,
        "milp_status": int(result.status),
        "milp_message": result.message,
        "milp_objective": None if result.fun is None else float(result.fun),
        "milp_gap": getattr(result, "mip_gap", None),
    }
    if result.x is None:
        return payload

    selected = tuple(
        arc for index, arc in enumerate(arcs)
        if result.x[chosen_offset + index] > 0.5
    )
    payload.update({
        "selected_edge_count": len(selected),
        "edges": [list(arc) for arc in selected],
        "row_degrees": [
            sum(center == left for left, _right in selected) for center in range(n)
        ],
        "target_degrees": [
            sum(target == right for _left, right in selected) for target in range(n)
        ],
    })
    payload.update(exact_reconstruct_edges(n, selected))
    return payload


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int)
    parser.add_argument("--verify-certificate", type=Path)
    parser.add_argument(
        "--required-edges",
        type=Path,
        help="JSON certificate whose listed edges remain tight in threshold mode",
    )
    parser.add_argument(
        "--milp-discover",
        action="store_true",
        help="maximize equality edges numerically, then reconstruct the incumbent exactly",
    )
    parser.add_argument(
        "--threshold",
        type=int,
        help="minimum tight edge count (default: 4*n-5, the first violation of 4*n-6)",
    )
    parser.add_argument("--timeout-ms", type=int, default=300_000)
    parser.add_argument("--milp-seconds", type=float, default=300.0)
    parser.add_argument("--epsilon", type=float, default=1e-4)
    parser.add_argument("--min-row-degree", type=int, default=0)
    parser.add_argument("--arc-half", choices=("all", "upper", "lower"), default="all")
    parser.add_argument(
        "--include-diagonal",
        action="store_true",
        help="count diagonal equalities D(c,c)=alpha[c]+beta[c] as tight zeros",
    )
    parser.add_argument(
        "--forbid-tight-diagonal",
        action="store_true",
        help="require alpha[c]+beta[c] != 0 at every diagonal in threshold mode",
    )
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    if args.verify_certificate is not None:
        source = json.loads(args.verify_certificate.read_text(encoding="utf-8"))
        payload = verify_exact_certificate(source)
    elif args.n is None:
        parser.error("--n is required unless --verify-certificate is supplied")
    elif args.milp_discover:
        if args.forbid_tight_diagonal:
            parser.error("--forbid-tight-diagonal is available only in threshold mode")
        payload = milp_discover(
            args.n,
            args.milp_seconds,
            args.epsilon,
            args.min_row_degree,
            args.arc_half,
            args.include_diagonal,
        )
    else:
        threshold = args.threshold if args.threshold is not None else 4 * args.n - 5
        required_edges: tuple[Arc, ...] = ()
        if args.required_edges is not None:
            required_source = json.loads(args.required_edges.read_text(encoding="utf-8"))
            required_edges = tuple(
                tuple(map(int, arc)) for arc in required_source["edges"]
            )
        payload = solve_threshold(
            args.n,
            threshold,
            args.timeout_ms,
            required_edges,
            args.include_diagonal,
            args.forbid_tight_diagonal,
        )
    rendered = json.dumps(payload, indent=2, sort_keys=True)
    if args.output is not None:
        args.output.write_text(rendered + "\n", encoding="utf-8")
    print(rendered)
    return 0 if payload.get("status") != "UNKNOWN" else 2


if __name__ == "__main__":
    raise SystemExit(main())

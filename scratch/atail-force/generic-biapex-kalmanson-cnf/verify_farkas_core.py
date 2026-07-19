#!/usr/bin/env python3
"""Independent exact replay and rational Farkas certificate for an LRA core."""

from __future__ import annotations

import argparse
import itertools
import json
from fractions import Fraction
from pathlib import Path

import z3


Variable = tuple[int, int]


def add_term(coefficients: dict[Variable, Fraction], scale: int, left: int, right: int) -> None:
    if left == right:
        return
    variable = tuple(sorted((left, right)))
    coefficients[variable] = coefficients.get(variable, Fraction(0)) + scale
    if coefficients[variable] == 0:
        del coefficients[variable]


def parsed_constraint(name: str) -> tuple[str, dict[Variable, Fraction], Fraction]:
    parts = name.split("_")
    coefficients: dict[Variable, Fraction] = {}
    tag = parts[0]
    vertices = tuple(int(item) for item in parts[1:])
    if tag == "pos" and len(vertices) == 2:
        add_term(coefficients, 1, *vertices)
        return "inequality", coefficients, Fraction(1)
    if tag in {"kal1", "kal2"} and len(vertices) == 4:
        a, b, c, d = vertices
        add_term(coefficients, 1, a, c)
        add_term(coefficients, 1, b, d)
        if tag == "kal1":
            add_term(coefficients, -1, a, b)
            add_term(coefficients, -1, c, d)
        else:
            add_term(coefficients, -1, a, d)
            add_term(coefficients, -1, b, c)
        return "inequality", coefficients, Fraction(1)
    if tag in {"tri0", "tri1", "tri2"} and len(vertices) == 3:
        a, b, c = vertices
        if tag == "tri0":
            add_term(coefficients, 1, a, b)
            add_term(coefficients, 1, b, c)
            add_term(coefficients, -1, a, c)
        elif tag == "tri1":
            add_term(coefficients, 1, a, c)
            add_term(coefficients, 1, b, c)
            add_term(coefficients, -1, a, b)
        else:
            add_term(coefficients, 1, a, b)
            add_term(coefficients, 1, a, c)
            add_term(coefficients, -1, b, c)
        return "inequality", coefficients, Fraction(0)
    if tag == "row" and len(vertices) == 3:
        center, anchor, point = vertices
        add_term(coefficients, 1, center, point)
        add_term(coefficients, -1, center, anchor)
        return "equality", coefficients, Fraction(0)
    raise ValueError(f"unknown tracked constraint name: {name}")


def z3_fraction(value: z3.RatNumRef) -> Fraction:
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def z3_linear_expression(
    coefficients: dict[Variable, Fraction], variables: dict[Variable, z3.ArithRef]
) -> z3.ArithRef:
    terms = [
        z3.Q(coefficient.numerator, coefficient.denominator) * variables[variable]
        for variable, coefficient in coefficients.items()
    ]
    return z3.Sum(*terms) if terms else z3.RealVal(0)


def solve_constraints(
    parsed: list[tuple[str, dict[Variable, Fraction], Fraction]],
    omitted: int | None = None,
) -> z3.CheckSatResult:
    variable_names = sorted({variable for _kind, coeffs, _rhs in parsed for variable in coeffs})
    variables = {variable: z3.Real(f"replay_d_{variable[0]}_{variable[1]}") for variable in variable_names}
    solver = z3.SolverFor("QF_LRA")
    for index, (kind, coefficients, rhs) in enumerate(parsed):
        if index == omitted:
            continue
        expression = z3_linear_expression(coefficients, variables)
        rational_rhs = z3.Q(rhs.numerator, rhs.denominator)
        solver.add(expression >= rational_rhs if kind == "inequality" else expression == rational_rhs)
    return solver.check()


def find_farkas_certificate(
    parsed: list[tuple[str, dict[Variable, Fraction], Fraction]],
) -> tuple[list[Fraction], list[Fraction]]:
    inequality_indices = [index for index, item in enumerate(parsed) if item[0] == "inequality"]
    equality_indices = [index for index, item in enumerate(parsed) if item[0] == "equality"]
    lambdas = [z3.Real(f"lambda_{index}") for index in inequality_indices]
    mus = [z3.Real(f"mu_{index}") for index in equality_indices]
    dual = z3.SolverFor("QF_LRA")
    dual.add(*(multiplier >= 0 for multiplier in lambdas))
    variables = sorted({variable for _kind, coefficients, _rhs in parsed for variable in coefficients})
    for variable in variables:
        terms = []
        for multiplier, index in zip(lambdas, inequality_indices, strict=True):
            coefficient = parsed[index][1].get(variable, Fraction(0))
            terms.append(multiplier * z3.Q(coefficient.numerator, coefficient.denominator))
        for multiplier, index in zip(mus, equality_indices, strict=True):
            coefficient = parsed[index][1].get(variable, Fraction(0))
            terms.append(multiplier * z3.Q(coefficient.numerator, coefficient.denominator))
        dual.add(z3.Sum(*terms) == 0)
    rhs_terms = [
        multiplier * z3.Q(parsed[index][2].numerator, parsed[index][2].denominator)
        for multiplier, index in zip(lambdas, inequality_indices, strict=True)
    ]
    dual.add(z3.Sum(*rhs_terms) == 1)
    if dual.check() != z3.sat:
        raise AssertionError("failed to find a normalized rational Farkas certificate")
    model = dual.model()
    lambda_values = [z3_fraction(model.eval(multiplier, model_completion=True)) for multiplier in lambdas]
    mu_values = [z3_fraction(model.eval(multiplier, model_completion=True)) for multiplier in mus]

    # Replay the certificate entirely with Fraction arithmetic.
    for variable in variables:
        total = Fraction(0)
        for multiplier, index in zip(lambda_values, inequality_indices, strict=True):
            total += multiplier * parsed[index][1].get(variable, Fraction(0))
        for multiplier, index in zip(mu_values, equality_indices, strict=True):
            total += multiplier * parsed[index][1].get(variable, Fraction(0))
        if total != 0:
            raise AssertionError(f"Farkas variable coefficient did not cancel: {variable} -> {total}")
    weighted_rhs = sum(
        (multiplier * parsed[index][2] for multiplier, index in zip(lambda_values, inequality_indices, strict=True)),
        Fraction(0),
    )
    if weighted_rhs != 1 or any(multiplier < 0 for multiplier in lambda_values):
        raise AssertionError("invalid normalized Farkas multipliers")
    return lambda_values, mu_values


def render_fraction(value: Fraction) -> str:
    return str(value.numerator) if value.denominator == 1 else f"{value.numerator}/{value.denominator}"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("core_payload", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    payload = json.loads(args.core_payload.read_text(encoding="utf-8"))
    if payload.get("status") != "UNSAT_FULL_LRA_FIXED_ROWS":
        raise ValueError("payload does not contain a fixed-row UNSAT core")
    core_names = tuple(str(name) for name in payload["metric_core"])
    parsed = [parsed_constraint(name) for name in core_names]
    rows = {int(center): set(support) for center, support in payload["rows"].items()}
    for name, (kind, _coefficients, _rhs) in zip(core_names, parsed, strict=True):
        if kind == "equality":
            _tag, center, anchor, point = name.split("_")
            if int(anchor) not in rows[int(center)] or int(point) not in rows[int(center)]:
                raise AssertionError(f"core row equality is not forced by the fixed rows: {name}")

    full_status = solve_constraints(parsed)
    if full_status != z3.unsat:
        raise AssertionError(f"independent core replay is not UNSAT: {full_status}")
    deletion_statuses = [str(solve_constraints(parsed, omitted=index)).upper() for index in range(len(parsed))]
    if any(status != "SAT" for status in deletion_statuses):
        raise AssertionError(f"core is not deletion-minimal: {deletion_statuses}")
    lambdas, mus = find_farkas_certificate(parsed)
    inequality_names = [name for name, item in zip(core_names, parsed, strict=True) if item[0] == "inequality"]
    equality_names = [name for name, item in zip(core_names, parsed, strict=True) if item[0] == "equality"]
    output = {
        "schema": "p97-fixed-row-farkas-core-verification-v1",
        "status": "VERIFIED_EXACT_FARKAS_CORE",
        "source": str(args.core_payload),
        "constraint_count": len(core_names),
        "independent_qf_lra_replay": "UNSAT",
        "all_single_constraint_deletions": "SAT",
        "deletion_minimal": True,
        "normalized_weighted_rhs": "1",
        "all_variable_coefficients_cancel": True,
        "inequality_multipliers": {
            name: render_fraction(value)
            for name, value in zip(inequality_names, lambdas, strict=True)
        },
        "equality_multipliers": {
            name: render_fraction(value)
            for name, value in zip(equality_names, mus, strict=True)
        },
    }
    rendered = json.dumps(output, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

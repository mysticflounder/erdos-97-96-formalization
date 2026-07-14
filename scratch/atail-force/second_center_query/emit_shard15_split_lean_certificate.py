#!/usr/bin/env python3
"""Emit shard 15's staged UNIT certificate as separately compiled Lean modules."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import sympy as sp


BASE_MODULE = "Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificate"
FINAL_THEOREM = "normalizedSevenPointSixCircleBUnitCertificate"


def header(import_name: str, title: str) -> list[str]:
    return [
        "/-",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Authors: Adam McKenna",
        "-/",
        "",
        f"import {import_name}",
        "",
        "/-!",
        f"# {title}",
        "",
        "Generated exact rational certificate shard.  The certificate is split",
        "across modules so every polynomial normalization has a fresh process.",
        "-/",
        "",
        "set_option linter.style.longLine false",
        "set_option maxRecDepth 100000",
        "-- Each bounded exact-certificate normalization needs extended heartbeats.",
        "set_option maxHeartbeats 24000000",
        "",
        "namespace Problem97",
        "namespace Census554",
        "namespace EqualityCore",
        "",
    ]


def footer() -> list[str]:
    return [
        "",
        "end EqualityCore",
        "end Census554",
        "end Problem97",
        "",
    ]


def theorem_arguments(
    variables: list[str], polynomials: list[str], used: list[int]
) -> list[str]:
    lines = [f"    ({' '.join(variables)} : ℝ)"]
    for index in used:
        lines.append(f"    (hp{index + 1} : {polynomials[index]} = 0)")
    return lines


def write_atomic(path: Path, lines: list[str]) -> None:
    rendered = "\n".join(lines)
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(rendered, encoding="utf-8")
    temporary.replace(path)


def common_denominator_text(
    expression: sp.Expr, symbols: tuple[sp.Symbol, ...]
) -> str:
    """Serialize an expanded rational polynomial with one scalar denominator."""
    polynomial = sp.Poly(sp.expand(expression), *symbols, domain=sp.QQ)
    denominator, integral = polynomial.clear_denoms(convert=True)
    numerator_text = str(integral.as_expr()).replace("**", "^")
    if denominator == 1:
        return numerator_text
    return f"({numerator_text})/{denominator}"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("certificate", type=Path)
    parser.add_argument("stage_plan", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()

    source = json.loads(args.certificate.read_text(encoding="utf-8"))
    plan = json.loads(args.stage_plan.read_text(encoding="utf-8"))
    variables = list(source["variables"])
    polynomials = list(source["polynomials"])
    order = [int(index) for index in plan["optimized_order_zero_based"]]
    symbols = sp.symbols(" ".join(variables))
    locals_map = dict(zip(variables, symbols, strict=True))
    polynomial_expressions = [
        sp.sympify(polynomial.replace("^", "**"), locals=locals_map)
        for polynomial in polynomials
    ]
    coefficient_expressions = []
    for index, raw in enumerate(source["singular"]["lift_coefficients"], start=1):
        marker = f"L[{index},1]="
        expression = sp.sympify(
            raw.removeprefix(marker).replace("^", "**"), locals=locals_map
        )
        coefficient_expressions.append(expression)
    global_denominator = sp.S.One
    for expression in coefficient_expressions:
        polynomial = sp.Poly(expression, *symbols, domain=sp.QQ)
        for coefficient in polynomial.coeffs():
            global_denominator = sp.ilcm(
                int(global_denominator), int(sp.denom(coefficient))
            )
    coefficient_expressions = [
        sp.expand(global_denominator * expression)
        for expression in coefficient_expressions
    ]
    coefficients = [
        common_denominator_text(expression, symbols)
        for expression in coefficient_expressions
    ]

    partial = sp.S.Zero
    partials = []
    for index in order:
        partial = sp.expand(
            partial + coefficient_expressions[index] * polynomial_expressions[index]
        )
        partials.append(common_denominator_text(partial, symbols))
    if sp.expand(partial - global_denominator) != 0:
        parser.error("staged certificate did not finish at the unit polynomial")

    previous_theorem = None
    for step, index in enumerate(order, start=1):
        stage_module = f"{BASE_MODULE}Stage{step:02d}"
        stage_path = args.output.with_name(f"{args.output.stem}Stage{step:02d}.lean")
        import_name = "Mathlib" if step == 1 else f"{BASE_MODULE}Stage{step - 1:02d}"
        theorem_name = (
            FINAL_THEOREM
            if step == len(order)
            else f"normalizedSevenPointSixCircleBUnitCertificateStage{step:02d}"
        )
        used = order[:step]
        lines = header(import_name, f"Shard 15 UNIT certificate stage {step}")
        if step == len(order):
            lines.extend(
                [
                    "/-- Final exact UNIT consequence of the normalized shard 15 system. -/",
                    f"theorem {theorem_name}",
                    *theorem_arguments(variables, polynomials, used),
                    "    : False := by",
                ]
            )
        else:
            lines.extend(
                [
                    f"/-- Exact partial UNIT identity after certificate stage {step}. -/",
                    f"theorem {theorem_name}",
                    *theorem_arguments(variables, polynomials, used),
                    f"    : {partials[step - 1]} = 0 := by",
                ]
            )
        if previous_theorem is None:
            lines.append(
                f"  linear_combination (norm := ring_nf)"
                f" ({coefficients[index]}) * hp{index + 1}"
            )
        else:
            previous_used = order[: step - 1]
            lines.append(
                f"  have hprevious := {previous_theorem}"
                f" {' '.join(variables)}"
                f" {' '.join(f'hp{item + 1}' for item in previous_used)}"
            )
            if step == len(order):
                lines.extend(
                    [
                        f"  have hunit : ({global_denominator} : ℝ) = 0 := by",
                        f"    linear_combination (norm := ring_nf) hprevious"
                        f" + ({coefficients[index]}) * hp{index + 1}",
                        "  norm_num at hunit",
                    ]
                )
            else:
                lines.append(
                    f"  linear_combination (norm := ring_nf) hprevious"
                    f" + ({coefficients[index]}) * hp{index + 1}"
                )
        lines.extend(footer())
        write_atomic(stage_path, lines)
        print(f"wrote {stage_path} ({stage_module})")
        previous_theorem = theorem_name

    aggregator = [
        "/-",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Authors: Adam McKenna",
        "-/",
        "",
        f"import {BASE_MODULE}Stage{len(order):02d}",
        "",
        "/-! # Exact UNIT certificate for the second seven-point six-circle core -/",
        "",
    ]
    write_atomic(args.output, aggregator)
    print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

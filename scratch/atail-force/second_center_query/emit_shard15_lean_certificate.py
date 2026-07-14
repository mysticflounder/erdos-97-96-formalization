#!/usr/bin/env python3
"""Emit the exact Lean linear-combination certificate for shard 15."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import sympy as sp


THEOREM_NAME = "normalizedSevenPointSixCircleBUnitCertificate"


def signed_terms(expression: str) -> list[str]:
    """Split a Singular polynomial at top-level signed monomials."""
    starts = [0]
    depth = 0
    for index, character in enumerate(expression):
        if character == "(":
            depth += 1
        elif character == ")":
            depth -= 1
        elif index > 0 and depth == 0 and character in "+-":
            starts.append(index)
    starts.append(len(expression))
    return [
        expression[starts[index] : starts[index + 1]]
        for index in range(len(starts) - 1)
        if starts[index] != starts[index + 1]
    ]


def render_coefficient(expression: str, hypothesis: str, first: bool) -> list[str]:
    terms = signed_terms(expression)
    prefix = "      " if first else "      + "
    lines = [f"{prefix}("]
    lines.extend(f"          {term}" for term in terms)
    lines.append(f"        ) * {hypothesis}")
    return lines


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("certificate", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--factor-coefficients", action="store_true")
    parser.add_argument("--stage-plan", type=Path)
    args = parser.parse_args()

    document = json.loads(args.certificate.read_text(encoding="utf-8"))
    polynomials = document["polynomials"]
    raw_coefficients = document["singular"]["lift_coefficients"]
    variables = document["variables"]
    if len(polynomials) != 11 or len(raw_coefficients) != 11:
        parser.error("shard 15 certificate must contain exactly eleven generators")

    coefficients = []
    for index, raw in enumerate(raw_coefficients, start=1):
        marker = f"L[{index},1]="
        if not raw.startswith(marker):
            parser.error(f"coefficient {index} omitted {marker!r}")
        coefficient = raw.removeprefix(marker)
        if args.factor_coefficients:
            coefficient = str(
                sp.factor(sp.sympify(coefficient.replace("^", "**")))
            ).replace("**", "^")
        coefficients.append(coefficient)

    lines = [
        "/-",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Authors: Adam McKenna",
        "-/",
        "",
        "import Mathlib",
        "",
        "/-!",
        "# Exact UNIT certificate for the second seven-point six-circle core",
        "",
        "This generated module replays the compact Singular ideal-membership",
        "certificate mined from exact `CARD-EQ-12` shard 15.  The certificate",
        "proves only the displayed polynomial system; the geometric wrapper is",
        "in `SevenPointSixCircleCollisionB`.",
        "-/",
        "",
        "set_option linter.style.longLine false",
        "set_option maxRecDepth 100000",
        "-- The generated 86 KB rational certificate requires extended normalization.",
        "set_option maxHeartbeats 24000000",
        "",
        "namespace Problem97",
        "namespace Census554",
        "namespace EqualityCore",
        "",
        "/-- Exact rational linear combination witnessing that the normalized",
        "second seven-point six-circle polynomial ideal contains `1`. -/",
        f"theorem {THEOREM_NAME}",
        f"    ({' '.join(variables)} : ℝ)",
    ]
    for index, polynomial in enumerate(polynomials, start=1):
        lines.append(f"    (hp{index} : {polynomial} = 0)")
    lines.append("    : False := by")
    if args.stage_plan is None:
        lines.extend(
            [
                "  have hunit : (1 : ℝ) = 0 := by",
                "    linear_combination",
            ]
        )
        for index, coefficient in enumerate(coefficients, start=1):
            lines.extend(render_coefficient(coefficient, f"hp{index}", index == 1))
        lines.append("  norm_num at hunit")
    else:
        plan = json.loads(args.stage_plan.read_text(encoding="utf-8"))
        order = [int(index) for index in plan["optimized_order_zero_based"]]
        locals_map = {
            name: symbol
            for name, symbol in zip(
                variables, sp.symbols(" ".join(variables)), strict=True
            )
        }
        polynomial_expressions = [
            sp.sympify(polynomial.replace("^", "**"), locals=locals_map)
            for polynomial in polynomials
        ]
        coefficient_expressions = [
            sp.sympify(coefficient.replace("^", "**"), locals=locals_map)
            for coefficient in coefficients
        ]
        partial = sp.S.Zero
        previous_name = None
        for step, index in enumerate(order, start=1):
            partial = sp.expand(
                partial
                + coefficient_expressions[index] * polynomial_expressions[index]
            )
            partial_text = str(sp.factor(partial)).replace("**", "^")
            stage_name = f"hstage{step}"
            lines.append(f"  have {stage_name} : {partial_text} = 0 := by")
            if previous_name is None:
                lines.append(
                    f"    linear_combination ({coefficients[index]}) * hp{index + 1}"
                )
            else:
                lines.append(
                    f"    linear_combination {previous_name}"
                    f" + ({coefficients[index]}) * hp{index + 1}"
                )
            previous_name = stage_name
        if sp.expand(partial - 1) != 0:
            parser.error("staged certificate did not finish at the unit polynomial")
        lines.append(f"  norm_num at {previous_name}")
    lines.extend(
        [
            "",
            "end EqualityCore",
            "end Census554",
            "end Problem97",
            "",
        ]
    )

    rendered = "\n".join(lines)
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(rendered, encoding="utf-8")
    temporary.replace(args.output)
    print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

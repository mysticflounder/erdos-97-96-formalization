#!/usr/bin/env python3
"""Emit shard 15's UNIT certificate as parallel Lean summand modules."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import sympy as sp


BASE_MODULE = "Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionBCertificate"
FINAL_THEOREM = "normalizedSevenPointSixCircleBUnitCertificate"
STAGE_ONE_PART_COUNT = 16


def common_denominator_text(
    expression: sp.Expr, symbols: tuple[sp.Symbol, ...]
) -> str:
    polynomial = sp.Poly(sp.expand(expression), *symbols, domain=sp.QQ)
    denominator, integral = polynomial.clear_denoms(convert=True)
    numerator_text = str(integral.as_expr()).replace("**", "^")
    if denominator == 1:
        return numerator_text
    return f"({numerator_text})/{denominator}"


def header(imports: list[str], title: str) -> list[str]:
    lines = [
        "/-",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Authors: Adam McKenna",
        "-/",
        "",
    ]
    lines.extend(f"import {import_name}" for import_name in imports)
    lines.extend(
        [
            "",
            "/-!",
            f"# {title}",
            "",
            "Generated exact rational certificate module.",
            "-/",
            "",
            "set_option linter.style.longLine false",
            "set_option maxRecDepth 100000",
            "-- Exact certificate normalization needs extended heartbeats.",
            "set_option maxHeartbeats 24000000",
            "",
            "namespace Problem97",
            "namespace Census554",
            "namespace EqualityCore",
            "",
        ]
    )
    return lines


def footer() -> list[str]:
    return [
        "",
        "end EqualityCore",
        "end Census554",
        "end Problem97",
        "",
    ]


def write_atomic(path: Path, lines: list[str]) -> bool:
    content = "\n".join(lines)
    if path.exists() and path.read_text(encoding="utf-8") == content:
        return False
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(content, encoding="utf-8")
    temporary.replace(path)
    return True


def expression_from_terms(
    terms: list[tuple[tuple[int, ...], sp.Expr]],
    symbols: tuple[sp.Symbol, ...],
) -> sp.Expr:
    return sp.Add(
        *(
            coefficient
            * sp.Mul(
                *(symbol**power for symbol, power in zip(symbols, powers, strict=True))
            )
            for powers, coefficient in terms
        )
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("certificate", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()

    source = json.loads(args.certificate.read_text(encoding="utf-8"))
    variables = list(source["variables"])
    polynomials = list(source["polynomials"])
    symbols = sp.symbols(" ".join(variables))
    locals_map = dict(zip(variables, symbols, strict=True))
    polynomial_expressions = [
        sp.sympify(polynomial.replace("^", "**"), locals=locals_map)
        for polynomial in polynomials
    ]
    coefficient_expressions = []
    for index, raw in enumerate(source["singular"]["lift_coefficients"], start=1):
        marker = f"L[{index},1]="
        coefficient_expressions.append(
            sp.sympify(
                raw.removeprefix(marker).replace("^", "**"), locals=locals_map
            )
        )

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
    coefficient_texts = [
        common_denominator_text(expression, symbols)
        for expression in coefficient_expressions
    ]
    summands = [
        sp.expand(coefficient * polynomial)
        for coefficient, polynomial in zip(
            coefficient_expressions, polynomial_expressions, strict=True
        )
    ]
    if sp.expand(sum(summands, sp.S.Zero) - global_denominator) != 0:
        parser.error("scaled certificate did not finish at the expected integer")

    theorem_names = []
    for index, (polynomial, coefficient, summand) in enumerate(
        zip(polynomials, coefficient_texts, summands, strict=True), start=1
    ):
        module_name = f"{BASE_MODULE}Stage{index:02d}"
        theorem_name = f"normalizedSevenPointSixCircleBUnitSummand{index:02d}"
        theorem_names.append(theorem_name)
        path = args.output.with_name(f"{args.output.stem}Stage{index:02d}.lean")
        if index == 1:
            coefficient_terms = list(
                sp.Poly(
                    coefficient_expressions[0], *symbols, domain=sp.ZZ
                ).terms()
            )
            part_term_lists = [list() for _ in range(STAGE_ONE_PART_COUNT)]
            for term_index, term in enumerate(coefficient_terms):
                part_term_lists[term_index % STAGE_ONE_PART_COUNT].append(term)
            part_coefficients = [
                expression_from_terms(part_terms, symbols)
                for part_terms in part_term_lists
            ]
            part_summands = [
                sp.expand(part_coefficient * polynomial_expressions[0])
                for part_coefficient in part_coefficients
            ]
            if sp.expand(sum(part_coefficients, sp.S.Zero)
                - coefficient_expressions[0]) != 0:
                parser.error("stage-one coefficient partition did not replay")
            if sp.expand(sum(part_summands, sp.S.Zero) - summand) != 0:
                parser.error("stage-one summand partition did not replay")

            part_theorem_names = []
            part_imports = []
            for part_index, (part_coefficient, part_summand) in enumerate(
                zip(part_coefficients, part_summands, strict=True), start=1
            ):
                part_module_name = f"{module_name}Part{part_index:02d}"
                part_imports.append(part_module_name)
                part_theorem_name = f"{theorem_name}Part{part_index:02d}"
                part_theorem_names.append(part_theorem_name)
                part_path = args.output.with_name(
                    f"{args.output.stem}Stage01Part{part_index:02d}.lean"
                )
                part_lines = header(
                    ["Mathlib"],
                    f"Shard 15 UNIT certificate summand 1 part {part_index}",
                )
                part_lines.extend(
                    [
                        f"/-- Exact part {part_index} of polynomial generator 1. -/",
                        f"theorem {part_theorem_name}",
                        f"    ({' '.join(variables)} : ℝ)",
                        f"    (hp1 : {polynomial} = 0)",
                        f"    : {common_denominator_text(part_summand, symbols)} = 0 := by",
                        "  linear_combination (norm := ring_nf) "
                        f"({common_denominator_text(part_coefficient, symbols)}) * hp1",
                        *footer(),
                    ]
                )
                changed = write_atomic(part_path, part_lines)
                action = "wrote" if changed else "kept"
                print(f"{action} {part_path} ({part_module_name})")

            continue

        lines = header(["Mathlib"], f"Shard 15 UNIT certificate summand {index}")
        lines.extend(
            [
                f"/-- Expanded exact consequence of polynomial generator {index}. -/",
                f"theorem {theorem_name}",
                f"    ({' '.join(variables)} : ℝ)",
                f"    (hp{index} : {polynomial} = 0)",
                f"    : {common_denominator_text(summand, symbols)} = 0 := by",
                f"  linear_combination (norm := ring_nf) ({coefficient}) * hp{index}",
                *footer(),
            ]
        )
        changed = write_atomic(path, lines)
        action = "wrote" if changed else "kept"
        print(f"{action} {path} ({module_name})")

    imports = [
        *part_imports,
        *(f"{BASE_MODULE}Stage{index:02d}" for index in range(2, 12)),
    ]
    lines = header(imports, "Exact UNIT certificate for the second seven-point six-circle core")
    lines.extend(
        [
            "/-- The normalized shard 15 polynomial system is inconsistent. -/",
            f"theorem {FINAL_THEOREM}",
            f"    ({' '.join(variables)} : ℝ)",
        ]
    )
    lines.extend(
        f"    (hp{index} : {polynomial} = 0)"
        for index, polynomial in enumerate(polynomials, start=1)
    )
    lines.append("    : False := by")
    for part_index, part_theorem_name in enumerate(part_theorem_names, start=1):
        lines.append(
            f"  have hs1p{part_index} := {part_theorem_name}"
            f" {' '.join(variables)} hp1"
        )
    for index, theorem_name in enumerate(theorem_names[1:], start=2):
        lines.append(
            f"  have hs{index} := {theorem_name}"
            f" {' '.join(variables)} hp{index}"
        )
    final_summands = [
        *(f"hs1p{part_index}" for part_index in range(1, STAGE_ONE_PART_COUNT + 1)),
        *(f"hs{index}" for index in range(2, 12)),
    ]
    lines.extend(
        [
            f"  have hunit : ({global_denominator} : ℝ) = 0 := by",
            "    linarith only ["
            + ", ".join(final_summands)
            + "]",
            "  norm_num at hunit",
            *footer(),
        ]
    )
    changed = write_atomic(args.output, lines)
    action = "wrote" if changed else "kept"
    print(f"{action} {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

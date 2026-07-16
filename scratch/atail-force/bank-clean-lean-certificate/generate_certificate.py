#!/usr/bin/env python3
"""Generate an exact Singular lift for the pinned seventeen equalities."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import subprocess
import sys
from pathlib import Path
from typing import Any

import sympy as sp


HERE = Path(__file__).resolve().parent
ANALYSIS = HERE / "analyze.py"
CHECKPOINT = HERE / "checkpoint.json"
OUTPUT = HERE / "unit_certificate.json"


def load_module(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def serialize_poly(poly: sp.Poly) -> str:
    terms = []
    for exponents, coefficient in poly.terms():
        if coefficient == 0:
            continue
        factors = [
            str(variable) if exponent == 1 else f"{variable}^{exponent}"
            for variable, exponent in zip(poly.gens, exponents, strict=True)
            if exponent
        ]
        monomial = "*".join(factors)
        magnitude = abs(coefficient)
        body = (
            (("" if magnitude == 1 else f"{magnitude}*") + monomial)
            if monomial
            else str(magnitude)
        )
        terms.append(("-" if coefficient < 0 else "+") + body)
    return "".join(terms).lstrip("+") or "0"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=OUTPUT)
    parser.add_argument("--timeout", type=float, default=900.0)
    parser.add_argument(
        "--method",
        choices=("liftstd", "direct_lift", "slimgb_then_lift"),
        default="liftstd",
    )
    parser.add_argument("--full_variables", action="store_true")
    args = parser.parse_args()

    analysis = load_module(ANALYSIS, "p97_bank_clean_lift_analysis")
    checkpoint = json.loads(CHECKPOINT.read_text(encoding="utf-8"))
    records = checkpoint["equality_core"]["generators"]
    names = [record["name"] for record in records]
    polynomials = [record["polynomial"] for record in records]
    if analysis.canonical_sha256(polynomials) != (
        analysis.EXPECTED_EQUALITY_CORE_POLYNOMIAL_SHA256
    ):
        raise RuntimeError("checkpoint polynomial stream drift")

    all_variables = tuple(analysis.oracle.variable_symbols(14))
    local = {str(variable): variable for variable in all_variables}
    expressions = [
        sp.sympify(polynomial.replace("^", "**"), locals=local)
        for polynomial in polynomials
    ]
    variables = (
        all_variables
        if args.full_variables
        else tuple(
            variable
            for variable in all_variables
            if any(variable in expression.free_symbols for expression in expressions)
        )
    )
    commands = [
        f"ring r=0,({','.join(str(variable) for variable in variables)}),dp;",
        f"ideal I={','.join(polynomials)};",
    ]
    if args.method == "liftstd":
        commands.extend(
            (
                "matrix T;",
                'ideal G=liftstd(I,T,"slimgb");',
                'print("P97_BASIS="+string(G));',
            )
        )
    elif args.method == "direct_lift":
        commands.extend(
            (
                "ideal J=1;",
                "matrix U;",
                'matrix T=lift(I,J,U,"slimgb");',
                'print("P97_BASIS=1");',
            )
        )
    else:
        commands.extend(
            (
                "ideal G=slimgb(I);",
                "matrix T=lift(I,G);",
                'print("P97_BASIS="+string(G));',
            )
        )
    commands.append('print("P97_MULTIPLIERS_BEGIN");')
    commands.extend(
        f'print("P97_M_{index}="+string(T[{index},1]));'
        for index in range(1, len(polynomials) + 1)
    )
    commands.extend(('print("P97_MULTIPLIERS_END");', "exit;"))
    singular_input = "\n".join(commands) + "\n"
    process = subprocess.run(
        ["Singular", "-q"],
        input=singular_input,
        capture_output=True,
        text=True,
        timeout=args.timeout,
        check=False,
    )
    if process.returncode != 0:
        raise RuntimeError(process.stderr or process.stdout)
    basis = process.stdout.split("P97_BASIS=", 1)[1].splitlines()[0].strip()
    basis_expr = sp.sympify(basis, locals=local)
    if basis_expr.free_symbols or not basis_expr.is_Rational or basis_expr == 0:
        raise RuntimeError(f"liftstd did not return a constant unit: {basis!r}")
    block = process.stdout.split("P97_MULTIPLIERS_BEGIN\n", 1)[1].split(
        "\nP97_MULTIPLIERS_END", 1
    )[0]
    parsed = {}
    for line in block.splitlines():
        prefix, value = line.split("=", 1)
        parsed[int(prefix.removeprefix("P97_M_"))] = value.strip()
    if set(parsed) != set(range(1, len(polynomials) + 1)):
        raise RuntimeError("incomplete Singular multiplier stream")
    multipliers = []
    for index in range(1, len(polynomials) + 1):
        expression = sp.sympify(parsed[index].replace("^", "**"), locals=local)
        multipliers.append(
            serialize_poly(
                sp.Poly(sp.expand(expression / basis_expr), *variables, domain=sp.QQ)
            )
        )
    identity_text = "+".join(
        f"({multiplier})*({polynomial})"
        for multiplier, polynomial in zip(multipliers, polynomials, strict=True)
        if multiplier != "0"
    )
    document = {
        "schema": "p97-atail-bank-clean-unit-certificate-v1",
        "target": "normalized_bank_clean_anchor_collision",
        "analysis_checkpoint_sha256": analysis.file_sha256(CHECKPOINT),
        "source_polynomial_sha256": (
            analysis.EXPECTED_EQUALITY_CORE_POLYNOMIAL_SHA256
        ),
        "generator_stream_sha256": hashlib.sha256(
            "\n".join(polynomials).encode()
        ).hexdigest(),
        "raw_identity_sha256": hashlib.sha256(identity_text.encode()).hexdigest(),
        "variables": [str(variable) for variable in variables],
        "generator_names": names,
        "generators": polynomials,
        "multipliers": multipliers,
        "nonzero_multiplier_count": sum(value != "0" for value in multipliers),
        "multiplier_term_count": sum(
            len(sp.Poly(
                sp.sympify(value.replace("^", "**"), locals=local),
                *variables,
                domain=sp.QQ,
            ).terms())
            for value in multipliers
            if value != "0"
        ),
        "producer": {
            "tool": "Singular",
            "algorithm": args.method,
            "input_sha256": hashlib.sha256(singular_input.encode()).hexdigest(),
            "stdout_sha256": hashlib.sha256(process.stdout.encode()).hexdigest(),
        },
    }
    args.output.write_text(
        json.dumps(document, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(
        json.dumps(
            {
                "output": str(args.output),
                "bytes": args.output.stat().st_size,
                "nonzero_multiplier_count": document["nonzero_multiplier_count"],
                "multiplier_term_count": document["multiplier_term_count"],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

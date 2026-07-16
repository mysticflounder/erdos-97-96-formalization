#!/usr/bin/env python3
"""Generate an exact Singular lift certificate for the pinned five-row UNIT."""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
from pathlib import Path

import sympy as sp

import system


HERE = Path(__file__).resolve().parent
DEFAULT_OUTPUT = HERE / "five_row_unit_certificate.json"


def serialize_poly(poly: sp.Poly) -> str:
    """Emit expanded QQ syntax with each rational coefficient before its monomial."""

    terms: list[str] = []
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
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--timeout", type=float, default=900.0)
    args = parser.parse_args()

    named = system.named_generators()
    polynomials = [polynomial for _, polynomial in named]
    variables = tuple(sp.symbols(" ".join(system.variable_names())))
    local = {str(variable): variable for variable in variables}
    expressions = [
        sp.sympify(polynomial.replace("^", "**"), locals=local)
        for polynomial in polynomials
    ]
    active_symbols = tuple(
        variable
        for variable in variables
        if any(variable in expression.free_symbols for expression in expressions)
    )

    commands = [
        f"ring r=0,({','.join(str(v) for v in active_symbols)}),dp;",
        f"ideal I={','.join(polynomials)};",
        "matrix T;",
        'ideal G=liftstd(I,T,"slimgb");',
        'print("P97_BASIS="+string(G));',
        'print("P97_MULTIPLIERS_BEGIN");',
    ]
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
    basis_expr = sp.sympify(basis, locals={str(v): v for v in active_symbols})
    if basis_expr.free_symbols or not basis_expr.is_Rational or basis_expr == 0:
        raise RuntimeError(
            "liftstd did not return a nonzero constant unit basis: "
            f"{basis!r}"
        )
    block = process.stdout.split("P97_MULTIPLIERS_BEGIN\n", 1)[1].split(
        "\nP97_MULTIPLIERS_END", 1
    )[0]
    parsed: dict[int, str] = {}
    for line in block.splitlines():
        prefix, value = line.split("=", 1)
        parsed[int(prefix.removeprefix("P97_M_"))] = value.strip()
    if set(parsed) != set(range(1, len(polynomials) + 1)):
        raise RuntimeError("incomplete liftstd multiplier stream")
    multipliers = []
    for index in range(1, len(polynomials) + 1):
        raw = sp.sympify(
            parsed[index].replace("^", "**"),
            locals={str(v): v for v in active_symbols},
        )
        normalized = sp.Poly(
            sp.expand(raw / basis_expr), *active_symbols, domain=sp.QQ
        )
        multipliers.append(serialize_poly(normalized))
    identity_text = "+".join(
        f"({multiplier})*({polynomial})"
        for multiplier, polynomial in zip(multipliers, polynomials, strict=True)
        if multiplier != "0"
    )
    document = {
        "schema": "p97-atail-global-k4-five-row-unit-certificate-v1",
        "target": "normalized_global_k4_extension_O_D_E_I_F",
        "coordinate_model": "p0_zero_p1_e1",
        "source": system.source_record(),
        "source_full_equality_sha256": system.EXPECTED_POLYNOMIAL_SHA256,
        "generator_stream_sha256": hashlib.sha256(
            "\n".join(polynomials).encode("utf-8")
        ).hexdigest(),
        "raw_change_identity_sha256": hashlib.sha256(
            identity_text.encode("utf-8")
        ).hexdigest(),
        "variables": [str(variable) for variable in active_symbols],
        "generator_names": [name for name, _ in named],
        "generators": polynomials,
        "multipliers": multipliers,
        "identity": "1 = sum_i multipliers[i] * generators[i]",
        "basis_count": 1,
        "raw_unit_basis": basis,
        "nonzero_multiplier_count": sum(value != "0" for value in multipliers),
        "producer": {
            "tool": "Singular",
            "algorithm": "liftstd-slimgb",
            "input_sha256": hashlib.sha256(singular_input.encode()).hexdigest(),
            "stdout_sha256": hashlib.sha256(process.stdout.encode()).hexdigest(),
        },
    }
    args.output.write_text(
        json.dumps(document, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({
        "output": str(args.output),
        "output_bytes": args.output.stat().st_size,
        "active_variables": len(active_symbols),
        "nonzero_multiplier_count": document["nonzero_multiplier_count"],
        "raw_change_identity_sha256": document["raw_change_identity_sha256"],
    }, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

#!/usr/bin/env python3
"""Profile a six-variable parameterization of the shard 15 collision core."""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import time
from pathlib import Path

import sympy as sp


def singular_text(expression: sp.Expr) -> str:
    return str(expression).replace("**", "^").replace(" ", "")


def primitive(expression: sp.Expr, variables: tuple[sp.Symbol, ...]) -> sp.Expr:
    polynomial = sp.Poly(sp.expand(expression), *variables, domain=sp.QQ)
    _, integral = polynomial.clear_denoms(convert=True)
    _, primitive_polynomial = integral.primitive()
    return primitive_polynomial.as_expr()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--timeout-seconds", type=float, default=300.0)
    parser.add_argument("--include-lift", action="store_true")
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    b, c, t, s, g, z = sp.symbols("b c t s g z")
    variables = (b, c, t, s, g, z)
    bx, by = b, c
    cx, cy = b / 2 - t * c, c / 2 + t * b
    dx, dy = b / 2 - s * c, c / 2 + s * b
    fx, fy = sp.Rational(3, 4) + z * g, g / 2 + z / 2
    gx, gy = sp.Rational(1, 2), g

    norm = bx**2 + by**2 - 1
    equations = (
        norm,
        sp.expand(cx**2 + cy**2 - 2 * cx - (t**2 + sp.Rational(1, 4)) * norm),
        sp.expand(
            2 * (cx * dx + cy * dy)
            - dx**2
            - dy**2
            - (2 * s * t - s**2 + sp.Rational(1, 4)) * norm
        ),
        sp.expand(
            -cx**2
            - cy**2
            + 2 * (cx * fx + cy * fy)
            - 2 * fx
            + 1
            + (t**2 + sp.Rational(1, 4)) * norm
        ),
        sp.expand(
            2 * (fx * dx + fy * dy)
            - 2 * fx
            - dx**2
            - dy**2
            + 1
            + (s**2 + sp.Rational(1, 4)) * norm
        ),
        2 * (gx * dx + gy * dy) - gx**2 - gy**2,
        z**2 - sp.Rational(3, 4),
    )
    polynomials = tuple(primitive(equation, variables) for equation in equations)
    serialized = tuple(singular_text(polynomial) for polynomial in polynomials)
    commands = [
        "ring r=0,(b,c,t,s,g,z),dp;",
        f"ideal I={','.join(serialized)};",
        "option(redSB);",
        "ideal G=std(I);",
        'print("P97_BASIS_BEGIN");',
        "print(G);",
        'print("P97_BASIS_END");',
        "matrix L=lift(I,ideal(1));",
        'print("P97_LIFT_BEGIN");',
        *(f'print("L[{index},1]="+string(L[{index},1]));' for index in range(1, 8)),
        'print("P97_LIFT_END");',
        "exit;",
    ]
    started = time.monotonic()
    try:
        completed = subprocess.run(
            ("Singular", "-q"),
            input="\n".join(commands) + "\n",
            capture_output=True,
            text=True,
            timeout=args.timeout_seconds,
            check=False,
        )
    except subprocess.TimeoutExpired as error:
        singular = {
            "status": "TIMEOUT",
            "elapsed_seconds": time.monotonic() - started,
            "partial_stdout_char_count": len(error.stdout or b""),
            "partial_stderr_char_count": len(error.stderr or b""),
        }
    else:
        stdout = completed.stdout
        basis = stdout.split("P97_BASIS_BEGIN\n", 1)[1].split(
            "\nP97_BASIS_END", 1
        )[0]
        lift = stdout.split("P97_LIFT_BEGIN\n", 1)[1].split(
            "\nP97_LIFT_END", 1
        )[0]
        coefficients = lift.splitlines()
        singular = {
            "status": "COMPLETED",
            "returncode": completed.returncode,
            "elapsed_seconds": time.monotonic() - started,
            "stderr": completed.stderr,
            "stdout_sha256": hashlib.sha256(stdout.encode()).hexdigest(),
            "basis": basis,
            "basis_is_unit": basis.strip() == "1",
            "lift_total_char_count": len(lift),
            "lift_max_coefficient_char_count": max(map(len, coefficients), default=0),
        }
        if args.include_lift:
            singular["lift_coefficients"] = coefficients

    document = {
        "schema": "p97-shard15-parametric-certificate-profile-v1",
        "variables": [str(variable) for variable in variables],
        "polynomials": list(serialized),
        "parameterization": {
            "B": [singular_text(bx), singular_text(by)],
            "C": [singular_text(cx), singular_text(cy)],
            "D": [singular_text(dx), singular_text(dy)],
            "F": [singular_text(fx), singular_text(fy)],
            "G": [singular_text(gx), singular_text(gy)],
        },
        "singular": singular,
    }
    rendered = json.dumps(document, indent=2, sort_keys=True)
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(rendered + "\n")
    temporary.replace(args.output)
    print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

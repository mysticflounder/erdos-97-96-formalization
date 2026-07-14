#!/usr/bin/env python3
"""Measure Singular lift certificates for the seven-point scalar split."""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess

import sympy as sp

from seven_point_unit_symbolic_diagnostic import (
    normalized_system,
    singular_polynomial,
)


BASE = (0, 1, 2, 4, 6, 9)
OTHER = (0, 2, 3, 4, 5, 6, 7, 8, 9, 10)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--block", choices=("base", "other"), required=True)
    parser.add_argument("--order", choices=("dp", "lp"), default="dp")
    parser.add_argument("--timeout", type=float, default=120.0)
    parser.add_argument("--show", action="store_true")
    args = parser.parse_args()

    variables, equalities = normalized_system()
    t = sp.Symbol("t")
    fx, fy = variables[6], variables[7]
    retained = BASE if args.block == "base" else OTHER
    target = (
        (t + 1) * (t**2 - 3 * t + 1)
        if args.block == "base"
        else 4 * t**12 + 7 * t**11 - 146 * t**10 - 20 * t**9
        + 1678 * t**8 - 3284 * t**7 + 2669 * t**6 - 1204 * t**5
        + 371 * t**4 - 88 * t**3 + 14 * t**2 - t
    )
    generators = [
        singular_polynomial(equalities[index][1]) for index in retained
    ]
    generators.append(singular_polynomial(t - ((fx - 1) ** 2 + fy**2)))
    variable_text = ",".join(str(variable) for variable in (*variables, t))
    print_entries = [
        f'print("L[{index},1]="+string(L[{index},1]));'
        for index in range(1, len(generators) + 1)
    ]
    script = "\n".join(
        (
            f"ring r=0,({variable_text}),{args.order};",
            f"ideal I={','.join(generators)};",
            f"ideal T={singular_polynomial(target)};",
            "matrix L=lift(I,T);",
            *print_entries,
            "exit;",
        )
    )
    try:
        completed = subprocess.run(
            ("Singular", "-q"),
            input=script + "\n",
            capture_output=True,
            text=True,
            timeout=args.timeout,
            check=False,
        )
        lines = completed.stdout.splitlines()
        coefficients = [line.split("=", 1)[1] for line in lines if line.startswith("L[")]
        result = {
            "returncode": completed.returncode,
            "stderr": completed.stderr,
            "coefficient_count": len(coefficients),
            "nonzero_coefficient_count": sum(coefficient != "0" for coefficient in coefficients),
            "coefficient_char_counts": [len(coefficient) for coefficient in coefficients],
            "total_coefficient_char_count": sum(len(coefficient) for coefficient in coefficients),
            "max_coefficient_char_count": max(map(len, coefficients), default=0),
            "certificate_sha256": hashlib.sha256(completed.stdout.encode()).hexdigest(),
        }
        if args.show:
            result["coefficients"] = coefficients
    except subprocess.TimeoutExpired:
        result = {"timeout": True}
    document = {
        "block": args.block,
        "retained": list(retained),
        "order": args.order,
        "target": singular_polynomial(target),
        "result": result,
    }
    print(json.dumps(document, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

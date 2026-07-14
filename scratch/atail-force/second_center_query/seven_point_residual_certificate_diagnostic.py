#!/usr/bin/env python3
"""Measure the CA=CE residual certificate in two Singular orders."""

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


OMITTED = 3


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--order", choices=("dp", "lp"), default="dp")
    parser.add_argument("--timeout", type=float, default=180.0)
    parser.add_argument("--show", action="store_true")
    args = parser.parse_args()
    variables, equalities = normalized_system()
    u = sp.Symbol("u")
    target = (
        36 * u**10 + 147 * u**9 - 26 * u**8 - 442 * u**7 + 241 * u**6
        + 550 * u**5 - 565 * u**4 - 20 * u**3 + 170 * u**2 - 125 * u + 50
    )
    generators = [
        singular_polynomial(polynomial)
        for index, (_name, polynomial) in enumerate(equalities)
        if index != OMITTED
    ]
    generators.append(singular_polynomial(u - equalities[OMITTED][1]))
    variable_text = ",".join(str(variable) for variable in (*variables, u))
    script = "\n".join(
        (
            f"ring r=0,({variable_text}),{args.order};",
            f"ideal I={','.join(generators)};",
            f"ideal T={singular_polynomial(target)};",
            "matrix L=lift(I,T);",
            *(
                f'print("L[{index},1]="+string(L[{index},1]));'
                for index in range(1, len(generators) + 1)
            ),
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
        coefficients = [
            line.split("=", 1)[1]
            for line in completed.stdout.splitlines()
            if line.startswith("L[")
        ]
        result = {
            "returncode": completed.returncode,
            "stderr": completed.stderr,
            "coefficient_count": len(coefficients),
            "nonzero_coefficient_count": sum(value != "0" for value in coefficients),
            "coefficient_char_counts": [len(value) for value in coefficients],
            "total_coefficient_char_count": sum(len(value) for value in coefficients),
            "max_coefficient_char_count": max(map(len, coefficients), default=0),
            "certificate_sha256": hashlib.sha256(completed.stdout.encode()).hexdigest(),
        }
        if args.show:
            result["coefficients"] = coefficients
    except subprocess.TimeoutExpired:
        result = {"timeout": True}
    print(
        json.dumps(
            {
                "omitted": equalities[OMITTED][0],
                "order": args.order,
                "target": singular_polynomial(target),
                "result": result,
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

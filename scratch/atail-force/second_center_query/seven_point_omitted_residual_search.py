#!/usr/bin/env python3
"""Search for a small residual terminal for the seven-point UNIT ideal.

For each equality ``f_i = 0``, retain the other ten equations, introduce
``u = f_i``, and eliminate all coordinate variables.  A univariate relation
``R_i(u)=0`` with nonzero constant term closes the full system immediately
after the omitted equality supplies ``u=0``.  We rank the eleven choices by
degree and serialized size before attempting any Lean certificate.
"""

from __future__ import annotations

import argparse
import json
import subprocess
from concurrent.futures import ThreadPoolExecutor, as_completed

import sympy as sp

from seven_point_unit_symbolic_diagnostic import (
    normalized_system,
    singular_polynomial,
)


SCHEMA = "p97-atail-seven-point-omitted-residual-search-v1"


def probe(omitted: int, timeout: float) -> dict[str, object]:
    variables, equalities = normalized_system()
    u = sp.Symbol("u")
    generators = [
        singular_polynomial(polynomial)
        for index, (_name, polynomial) in enumerate(equalities)
        if index != omitted
    ]
    generators.append(singular_polynomial(u - equalities[omitted][1]))
    variable_text = ",".join(str(variable) for variable in (*variables, u))
    eliminated_product = "*".join(str(variable) for variable in variables)
    script = "\n".join(
        (
            f"ring r=0,({variable_text}),lp;",
            f"ideal I={','.join(generators)};",
            f"ideal E=eliminate(I,{eliminated_product});",
            'print("P97_ELIM_BEGIN");',
            "print(E);",
            'print("P97_ELIM_END");',
            "exit;",
        )
    )
    try:
        completed = subprocess.run(
            ("Singular", "-q"),
            input=script + "\n",
            capture_output=True,
            text=True,
            timeout=timeout,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return {"omitted": omitted, "name": equalities[omitted][0], "status": "TIMEOUT"}
    if completed.returncode != 0:
        return {
            "omitted": omitted,
            "name": equalities[omitted][0],
            "status": "ERROR",
            "detail": (completed.stderr or completed.stdout)[-2000:],
        }
    try:
        body = completed.stdout.split("P97_ELIM_BEGIN\n", 1)[1].split(
            "\nP97_ELIM_END", 1
        )[0]
    except IndexError:
        return {
            "omitted": omitted,
            "name": equalities[omitted][0],
            "status": "ERROR",
            "detail": "missing elimination markers",
        }
    raw = [] if body in {"", "0"} else body.split(",\n")
    polynomials = [sp.Poly(poly.replace("^", "**"), u, domain=sp.QQ) for poly in raw]
    primitive = None
    for polynomial in polynomials:
        primitive = polynomial if primitive is None else sp.gcd(primitive, polynomial)
    if primitive is None:
        return {
            "omitted": omitted,
            "name": equalities[omitted][0],
            "status": "NO_CONSEQUENCE",
        }
    primitive = sp.Poly(primitive.monic(), u, domain=sp.QQ)
    factored = str(sp.factor(primitive.as_expr()))
    return {
        "omitted": omitted,
        "name": equalities[omitted][0],
        "status": "CONSEQUENCE",
        "degree": primitive.degree(),
        "constant": str(primitive.eval(0)),
        "primitive_consequence": factored,
        "serialized_char_count": len(factored),
        "elimination_generators": raw,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--workers", type=int, default=11)
    parser.add_argument("--timeout", type=float, default=180.0)
    args = parser.parse_args()
    if not 1 <= args.workers <= 23:
        parser.error("--workers must be between 1 and 23")
    results = []
    with ThreadPoolExecutor(max_workers=args.workers) as executor:
        futures = {
            executor.submit(probe, omitted, args.timeout): omitted
            for omitted in range(11)
        }
        for future in as_completed(futures):
            results.append(future.result())
    results.sort(
        key=lambda result: (
            result["status"] != "CONSEQUENCE",
            int(result.get("degree", 10**9)),
            int(result.get("serialized_char_count", 10**9)),
            int(result["omitted"]),
        )
    )
    document = {
        "schema": SCHEMA,
        "scope": {
            "trusted_singular_elimination": True,
            "certificate_replayed": False,
            "lean_theorem_proved": False,
        },
        "results": results,
    }
    print(json.dumps(document, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

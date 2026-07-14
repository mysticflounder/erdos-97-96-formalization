#!/usr/bin/env python3
"""Find a low-complexity scalar split of the seven-point UNIT ideal.

The base block on ``B,C,D,F`` implies a polynomial for

    t = dist(F, B)^2.

Every candidate second block contains the five complementary equations and a
subset of the base block.  We eliminate all coordinate variables, extract the
univariate consequence in ``t``, and look for a polynomial coprime to the base
consequence.  Such a pair can be replayed as two bounded Lean algebra lemmas
followed by a small Bezout identity.
"""

from __future__ import annotations

import argparse
import itertools
import json
import subprocess
from concurrent.futures import ThreadPoolExecutor, as_completed
from typing import Sequence

import sympy as sp

from seven_point_unit_symbolic_diagnostic import (
    normalized_system,
    singular_polynomial,
)


SCHEMA = "p97-atail-seven-point-scalar-partition-search-v1"
BASE = frozenset((0, 1, 2, 4, 6, 9))
COMPLEMENT = frozenset(range(11)) - BASE


def eliminate_t(
    retained: Sequence[int], *, timeout: float
) -> dict[str, object]:
    variables, named_equalities = normalized_system()
    t = sp.Symbol("t")
    fx, fy = variables[6], variables[7]
    polynomials = [
        singular_polynomial(named_equalities[index][1])
        for index in retained
    ]
    polynomials.append(singular_polynomial(t - ((fx - 1) ** 2 + fy**2)))
    variable_text = ",".join(str(variable) for variable in (*variables, t))
    eliminated_product = "*".join(str(variable) for variable in variables)
    script = "\n".join(
        (
            f"ring r=0,({variable_text}),lp;",
            f"ideal I={','.join(polynomials)};",
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
        return {"retained": list(retained), "status": "TIMEOUT"}
    if completed.returncode != 0:
        return {
            "retained": list(retained),
            "status": "ERROR",
            "detail": (completed.stderr or completed.stdout)[-2000:],
        }
    try:
        body = completed.stdout.split("P97_ELIM_BEGIN\n", 1)[1].split(
            "\nP97_ELIM_END", 1
        )[0]
    except IndexError:
        return {
            "retained": list(retained),
            "status": "ERROR",
            "detail": "missing elimination markers",
        }
    raw_polynomials = [] if body in {"", "0"} else body.split(",\n")
    parsed = [sp.Poly(poly.replace("^", "**"), t, domain=sp.QQ) for poly in raw_polynomials]
    primitive = None
    for polynomial in parsed:
        primitive = polynomial if primitive is None else sp.gcd(primitive, polynomial)
    if primitive is not None:
        primitive = sp.Poly(primitive.monic(), t, domain=sp.QQ)
    return {
        "retained": list(retained),
        "status": "CONSEQUENCE" if primitive is not None else "NO_UNIVARIATE_CONSEQUENCE",
        "elimination_generators": raw_polynomials,
        "primitive_consequence": (
            None if primitive is None else str(sp.factor(primitive.as_expr()))
        ),
        "degree": None if primitive is None else primitive.degree(),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--workers", type=int, default=16)
    parser.add_argument("--timeout", type=float, default=120.0)
    args = parser.parse_args()
    if not 1 <= args.workers <= 23:
        parser.error("--workers must be between 1 and 23")

    base = eliminate_t(sorted(BASE), timeout=args.timeout)
    if base["status"] != "CONSEQUENCE":
        raise RuntimeError(f"base block did not produce t consequence: {base}")
    t = sp.Symbol("t")
    base_polynomial = sp.Poly(str(base["primitive_consequence"]), t, domain=sp.QQ)

    candidates = []
    base_list = sorted(BASE)
    for overlap_size in range(len(base_list) + 1):
        for overlap in itertools.combinations(base_list, overlap_size):
            candidates.append(tuple(sorted(COMPLEMENT | set(overlap))))

    results = []
    with ThreadPoolExecutor(max_workers=args.workers) as executor:
        futures = {
            executor.submit(eliminate_t, candidate, timeout=args.timeout): candidate
            for candidate in candidates
        }
        for future in as_completed(futures):
            result = future.result()
            if result["status"] == "CONSEQUENCE":
                polynomial = sp.Poly(
                    str(result["primitive_consequence"]), t, domain=sp.QQ
                )
                gcd = sp.gcd(base_polynomial, polynomial).monic()
                result["gcd_with_base"] = str(sp.factor(gcd.as_expr()))
                result["coprime_to_base"] = gcd.degree() == 0
            else:
                result["coprime_to_base"] = False
            results.append(result)

    results.sort(
        key=lambda result: (
            not bool(result["coprime_to_base"]),
            len(result["retained"]),
            result["retained"],
        )
    )
    coprime = [result for result in results if result["coprime_to_base"]]
    document = {
        "schema": SCHEMA,
        "scalar": "t=dist(F,B)^2",
        "scope": {
            "trusted_singular_elimination": True,
            "certificate_replayed": False,
            "lean_theorem_proved": False,
        },
        "base": base,
        "complement": sorted(COMPLEMENT),
        "candidate_count": len(candidates),
        "coprime_candidate_count": len(coprime),
        "minimal_coprime_candidates": coprime[:10],
        "status_counts": {
            status: sum(result["status"] == status for result in results)
            for status in sorted({str(result["status"]) for result in results})
        },
    }
    print(json.dumps(document, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

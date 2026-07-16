#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Find a bounded-degree exact QQ Nullstellensatz certificate with Z3.

The msolve F4 trace reaches the unit basis in degree four.  Rather than carry
an entire Groebner change matrix through coefficient swell, this script asks
for the coefficients of multipliers ``q_i`` satisfying

    sum_i q_i * generator_i = 1

with every product bounded by the requested Macaulay degree.  This is only a
sparse linear system over QQ; Z3's exact rational simplex supplies a model,
which is then replayed symbolically before the certificate is written.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import defaultdict
from itertools import combinations_with_replacement
from pathlib import Path

import sympy as sp
import z3

import analyze_equalities as system


HERE = Path(__file__).resolve().parent


def monomial_exponents(variable_count: int, max_degree: int):
    """Yield exponent tuples of total degree at most ``max_degree``."""
    zero = (0,) * variable_count
    yield zero
    for degree in range(1, max_degree + 1):
        for places in combinations_with_replacement(range(variable_count), degree):
            exponents = [0] * variable_count
            for place in places:
                exponents[place] += 1
            yield tuple(exponents)


def add_exponents(left: tuple[int, ...], right: tuple[int, ...]):
    return tuple(a + b for a, b in zip(left, right))


def z3_rational(value: sp.Rational):
    return z3.Q(value.p, value.q)


def model_rational(model: z3.ModelRef, variable: z3.ArithRef) -> sp.Rational:
    value = model.eval(variable, model_completion=True)
    if not z3.is_rational_value(value):
        raise TypeError(f"expected rational model value, found {value}")
    return sp.Rational(value.numerator_as_long(), value.denominator_as_long())


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--output", type=Path, default=HERE / "seven_row_unit_certificate.json"
    )
    parser.add_argument("--degree", type=int, default=4)
    parser.add_argument("--timeout-ms", type=int, default=900_000)
    args = parser.parse_args()

    named = system.generators()
    polynomial_text = [polynomial for _, polynomial in named]
    if system.canonical_sha256(polynomial_text) != system.EXPECTED_POLYNOMIAL_SHA256:
        raise AssertionError("pinned polynomial stream drift")
    all_symbols = tuple(system.VARIABLES)
    local = {str(symbol): symbol for symbol in all_symbols}
    expressions = [
        sp.sympify(polynomial.replace("^", "**"), locals=local)
        for polynomial in polynomial_text
    ]
    active_symbols = tuple(
        symbol
        for symbol in all_symbols
        if any(symbol in expression.free_symbols for expression in expressions)
    )
    polynomials = [sp.Poly(expression, *active_symbols, domain=sp.QQ) for expression in expressions]

    # Each column is one unknown coefficient multiplying one generator by one
    # monomial.  Rows are output monomials in the asserted polynomial identity.
    columns: list[tuple[int, tuple[int, ...], z3.ArithRef]] = []
    rows: dict[tuple[int, ...], list[tuple[sp.Rational, z3.ArithRef]]] = defaultdict(list)
    for generator_index, polynomial in enumerate(polynomials):
        allowance = args.degree - polynomial.total_degree()
        if allowance < 0:
            raise ValueError("Macaulay degree is below a generator degree")
        for monomial_index, multiplier_exp in enumerate(
            monomial_exponents(len(active_symbols), allowance)
        ):
            variable = z3.Real(f"c_{generator_index}_{monomial_index}")
            columns.append((generator_index, multiplier_exp, variable))
            for generator_exp, coefficient in polynomial.terms():
                rows[add_exponents(multiplier_exp, generator_exp)].append(
                    (sp.Rational(coefficient), variable)
                )

    solver = z3.SolverFor("QF_LRA")
    solver.set(timeout=args.timeout_ms)
    zero_exp = (0,) * len(active_symbols)
    for exponent, terms in rows.items():
        lhs = z3.Sum([z3_rational(coefficient) * variable for coefficient, variable in terms])
        solver.add(lhs == (1 if exponent == zero_exp else 0))
    if zero_exp not in rows:
        raise RuntimeError("constant row missing from Macaulay system")

    result = solver.check()
    if result != z3.sat:
        raise RuntimeError(f"degree-{args.degree} Macaulay solve returned {result}")
    model = solver.model()
    multiplier_expressions = [sp.Integer(0) for _ in polynomials]
    nonzero_coefficients = 0
    for generator_index, exponent, variable in columns:
        coefficient = model_rational(model, variable)
        if coefficient == 0:
            continue
        nonzero_coefficients += 1
        monomial = sp.Integer(1)
        for symbol, power in zip(active_symbols, exponent):
            monomial *= symbol**power
        multiplier_expressions[generator_index] += coefficient * monomial

    total = sp.Poly(0, *active_symbols, domain=sp.QQ)
    multipliers = []
    for multiplier, generator in zip(multiplier_expressions, polynomials):
        multiplier_poly = sp.Poly(multiplier, *active_symbols, domain=sp.QQ)
        total += multiplier_poly * generator
        multipliers.append(system.serialize(multiplier_poly))
    if total != sp.Poly(1, *active_symbols, domain=sp.QQ):
        raise RuntimeError("Z3 model did not replay to the exact unit identity")

    identity_text = "+".join(
        f"({multiplier})*({polynomial})"
        for multiplier, polynomial in zip(multipliers, polynomial_text)
        if multiplier != "0"
    )
    document = {
        "schema": "p97-atail-qq-change-matrix-certificate-v1",
        "target": "normalized_seven_row_anchor_collision",
        "coordinate_model": "p0_zero_p1_e1",
        "source_full_equality_sha256": system.EXPECTED_POLYNOMIAL_SHA256,
        "raw_change_identity_sha256": hashlib.sha256(identity_text.encode()).hexdigest(),
        "generator_stream_sha256": hashlib.sha256(
            "\n".join(polynomial_text).encode()
        ).hexdigest(),
        "variables": [str(symbol) for symbol in active_symbols],
        "rows": [
            {"center": center, "support": list(support)}
            for center, support in system.ROWS
        ],
        "generator_names": [name for name, _ in named],
        "generators": polynomial_text,
        "multipliers": multipliers,
        "identity": "1 = sum_i multipliers[i] * generators[i]",
        "basis_count": 1,
        "nonzero_multiplier_count": sum(value != "0" for value in multipliers),
        "producer": {
            "tool": "Z3 exact rational simplex",
            "algorithm": "degree-bounded Macaulay linear solve",
            "macaulay_degree": args.degree,
            "unknown_coefficient_count": len(columns),
            "output_monomial_count": len(rows),
            "nonzero_coefficient_count": nonzero_coefficients,
        },
    }
    args.output.write_text(
        json.dumps(document, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({
        "output": str(args.output),
        "macaulay_degree": args.degree,
        "unknown_coefficient_count": len(columns),
        "output_monomial_count": len(rows),
        "nonzero_multiplier_count": document["nonzero_multiplier_count"],
        "nonzero_coefficient_count": nonzero_coefficients,
        "raw_change_identity_sha256": document["raw_change_identity_sha256"],
    }, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

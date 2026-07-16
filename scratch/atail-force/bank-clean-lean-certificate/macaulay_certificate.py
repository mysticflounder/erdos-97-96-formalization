#!/usr/bin/env python3
"""Find an exact bounded-degree QQ certificate for the audited 15-core.

This bypasses Groebner change-matrix coefficient swell.  It solves the sparse
Macaulay linear system for multipliers ``q_i`` with

    sum_i q_i * generator_i = 1

and independently expands the resulting identity over ``QQ`` before writing
anything that the Lean emitter may consume.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import time
from collections import defaultdict
from itertools import combinations_with_replacement
from pathlib import Path

import numpy as np
import scipy.sparse as sparse
import scipy.sparse.linalg as sparse_linalg
import sympy as sp
import z3


HERE = Path(__file__).resolve().parent
CORE = HERE.parent / "bank-clean-unit-independent-audit" / "confirm_15_from17.json"
OUTPUT = HERE / "unit_certificate_macaulay_15.json"
EXPECTED_POLYNOMIAL_SHA256 = (
    "b0efd512be125e72cc1847f56bac68149e0b95c002587efce23375ef72d7dbaf"
)


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(payload.encode()).hexdigest()


def monomial_exponents(variable_count: int, max_degree: int):
    zero = (0,) * variable_count
    yield zero
    for degree in range(1, max_degree + 1):
        for places in combinations_with_replacement(range(variable_count), degree):
            exponents = [0] * variable_count
            for place in places:
                exponents[place] += 1
            yield tuple(exponents)


def add_exponents(left: tuple[int, ...], right: tuple[int, ...]):
    return tuple(a + b for a, b in zip(left, right, strict=True))


def serialize(poly: sp.Poly) -> str:
    terms = []
    for exponents, coefficient in poly.terms():
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


def load_system() -> tuple[list[str], list[str], tuple[sp.Symbol, ...], list[sp.Poly]]:
    document = json.loads(CORE.read_text(encoding="utf-8"))
    if document["crosscheck"] != ["UNIT", "UNIT", "UNIT"]:
        raise RuntimeError("15-core has lost its independent CAS crosscheck")
    records = document["generators"]
    names = [str(record["name"]) for record in records]
    generators = [str(record["polynomial"]) for record in records]
    polynomial_hash = canonical_sha256(generators)
    if polynomial_hash != EXPECTED_POLYNOMIAL_SHA256:
        raise RuntimeError(f"15-core polynomial stream drift: {polynomial_hash}")
    symbol_names = sorted(
        set().union(
            *(
                set(re.findall(r"\b[A-Z][A-Za-z0-9_]*[xy]\b", text))
                for text in generators
            )
        ),
        key=lambda name: (name[:-1], name[-1]),
    )
    raw = sp.symbols(" ".join(symbol_names))
    symbols = (raw,) if isinstance(raw, sp.Symbol) else tuple(raw)
    local = {str(symbol): symbol for symbol in symbols}
    polynomials = [
        sp.Poly(
            sp.sympify(text.replace("^", "**"), locals=local),
            *symbols,
            domain=sp.QQ,
        )
        for text in generators
    ]
    return names, generators, symbols, polynomials


def build_rows(
    polynomials: list[sp.Poly], degree: int
) -> tuple[
    list[tuple[int, tuple[int, ...]]],
    dict[tuple[int, ...], list[tuple[sp.Rational, int]]],
]:
    columns: list[tuple[int, tuple[int, ...]]] = []
    rows: dict[tuple[int, ...], list[tuple[sp.Rational, int]]] = defaultdict(list)
    for generator_index, polynomial in enumerate(polynomials):
        allowance = degree - polynomial.total_degree()
        if allowance < 0:
            raise ValueError("Macaulay degree is below a generator degree")
        for multiplier_exp in monomial_exponents(len(polynomial.gens), allowance):
            column_index = len(columns)
            columns.append((generator_index, multiplier_exp))
            for generator_exp, coefficient in polynomial.terms():
                rows[add_exponents(multiplier_exp, generator_exp)].append(
                    (sp.Rational(coefficient), column_index)
                )
    return columns, rows


def diagnose(
    variable_count: int,
    columns: list[tuple[int, tuple[int, ...]]],
    rows: dict[tuple[int, ...], list[tuple[sp.Rational, int]]],
) -> int:
    row_keys = list(rows)
    row_number = {exponents: index for index, exponents in enumerate(row_keys)}
    entries = [
        (row_number[exponents], column, float(coefficient))
        for exponents, terms in rows.items()
        for coefficient, column in terms
    ]
    matrix = sparse.coo_matrix(
        (
            [value for _row, _column, value in entries],
            (
                [row for row, _column, _value in entries],
                [column for _row, column, _value in entries],
            ),
        ),
        shape=(len(rows), len(columns)),
    ).tocsr()
    target = np.zeros(len(rows))
    target[row_number[(0,) * variable_count]] = 1.0
    started = time.monotonic()
    result = sparse_linalg.lsmr(
        matrix,
        target,
        atol=1e-13,
        btol=1e-13,
        maxiter=200_000,
    )
    print(
        json.dumps(
            {
                "rows": matrix.shape[0],
                "columns": matrix.shape[1],
                "nonzeros": matrix.nnz,
                "stop_code": result[1],
                "iterations": result[2],
                "residual_norm": result[3],
                "normal_residual_norm": result[4],
                "seconds": time.monotonic() - started,
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0 if result[3] < 1e-8 else 1


def z3_rational(value: sp.Rational):
    return z3.Q(value.p, value.q)


def model_rational(model: z3.ModelRef, variable: z3.ArithRef) -> sp.Rational:
    value = model.eval(variable, model_completion=True)
    if not z3.is_rational_value(value):
        raise TypeError(f"expected rational model value, found {value}")
    return sp.Rational(value.numerator_as_long(), value.denominator_as_long())


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--degree", type=int, default=4)
    parser.add_argument("--diagnose", action="store_true")
    parser.add_argument("--write-msolve", type=Path)
    parser.add_argument("--delete", action="append", default=[])
    parser.add_argument("--timeout-ms", type=int, default=900_000)
    parser.add_argument("--output", type=Path, default=OUTPUT)
    args = parser.parse_args()

    names, generators, symbols, polynomials = load_system()
    unknown = set(args.delete) - set(names)
    if unknown:
        raise RuntimeError(f"unknown deleted generators: {sorted(unknown)}")
    keep = [index for index, name in enumerate(names) if name not in args.delete]
    names = [names[index] for index in keep]
    generators = [generators[index] for index in keep]
    polynomials = [polynomials[index] for index in keep]
    if args.write_msolve is not None:
        args.write_msolve.write_text(
            ",".join(str(symbol) for symbol in symbols)
            + "\n0\n"
            + ",\n".join(text.replace("**", "^") for text in generators)
            + "\n",
            encoding="utf-8",
        )
        print(args.write_msolve)
        return 0
    columns, rows = build_rows(polynomials, args.degree)
    if args.diagnose:
        return diagnose(len(symbols), columns, rows)

    solver = z3.SolverFor("QF_LRA")
    solver.set(timeout=args.timeout_ms)
    unknowns = [z3.Real(f"c_{index}") for index in range(len(columns))]
    zero = (0,) * len(symbols)
    for exponents, terms in rows.items():
        solver.add(
            z3.Sum(
                [
                    z3_rational(coefficient) * unknowns[column]
                    for coefficient, column in terms
                ]
            )
            == (1 if exponents == zero else 0)
        )
    started = time.monotonic()
    result = solver.check()
    if result != z3.sat:
        raise RuntimeError(
            f"degree-{args.degree} exact Macaulay solve returned {result} "
            f"after {time.monotonic() - started:.1f}s"
        )
    model = solver.model()
    multipliers = [sp.Poly(0, *symbols, domain=sp.QQ) for _ in polynomials]
    nonzero_coefficients = 0
    for column_index, (generator_index, exponents) in enumerate(columns):
        coefficient = model_rational(model, unknowns[column_index])
        if coefficient == 0:
            continue
        nonzero_coefficients += 1
        term = coefficient
        for symbol, exponent in zip(symbols, exponents, strict=True):
            term *= symbol**exponent
        multipliers[generator_index] += sp.Poly(term, *symbols, domain=sp.QQ)

    total = sp.Poly(0, *symbols, domain=sp.QQ)
    for multiplier, generator in zip(multipliers, polynomials, strict=True):
        total += multiplier * generator
    if total != sp.Poly(1, *symbols, domain=sp.QQ):
        raise RuntimeError(
            f"exact Z3 model replay failed with {len((total - 1).terms())} residual terms"
        )
    multiplier_text = [serialize(poly) for poly in multipliers]
    identity_text = "+".join(
        f"({multiplier})*({generator})"
        for multiplier, generator in zip(multiplier_text, generators, strict=True)
        if multiplier != "0"
    )
    document = {
        "schema": "p97-atail-bank-clean-15-macaulay-certificate-v1",
        "source_polynomial_sha256": EXPECTED_POLYNOMIAL_SHA256,
        "generator_names": names,
        "generators": generators,
        "variables": [str(symbol) for symbol in symbols],
        "multipliers": multiplier_text,
        "raw_identity_sha256": hashlib.sha256(identity_text.encode()).hexdigest(),
        "nonzero_multiplier_count": sum(text != "0" for text in multiplier_text),
        "multiplier_term_count": sum(
            len(poly.terms()) for poly in multipliers if not poly.is_zero
        ),
        "producer": {
            "tool": "Z3 exact rational simplex plus SymPy QQ replay",
            "algorithm": "degree-bounded sparse Macaulay linear solve",
            "macaulay_degree": args.degree,
            "unknown_coefficient_count": len(columns),
            "output_monomial_count": len(rows),
            "nonzero_coefficient_count": nonzero_coefficients,
            "solve_seconds": time.monotonic() - started,
            "exact_sympy_qq_identity_check": True,
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
                "degree": args.degree,
                "multiplier_terms": document["multiplier_term_count"],
                "solve_seconds": document["producer"]["solve_seconds"],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

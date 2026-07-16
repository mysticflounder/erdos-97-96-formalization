#!/usr/bin/env python3
"""Numerically diagnose bounded Macaulay degrees before exact QQ solving."""

from __future__ import annotations

import argparse
import sys
from collections import defaultdict

import numpy as np
import scipy.sparse as sparse
import scipy.sparse.linalg as sparse_linalg
import sympy as sp

import analyze_equalities as system
from macaulay_z3_certificate import add_exponents, monomial_exponents


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--degree", type=int, default=5)
    parser.add_argument("--iterations", type=int, default=200_000)
    args = parser.parse_args()

    local = {str(symbol): symbol for symbol in system.VARIABLES}
    expressions = [
        sp.sympify(text.replace("^", "**"), locals=local)
        for _, text in system.generators()
    ]
    symbols = tuple(
        symbol
        for symbol in system.VARIABLES
        if any(symbol in expression.free_symbols for expression in expressions)
    )
    polynomials = [sp.Poly(expression, *symbols, domain=sp.QQ) for expression in expressions]
    row_index: dict[tuple[int, ...], int] = {}
    entries: list[tuple[int, int, float]] = []
    column_count = 0
    for polynomial in polynomials:
        allowance = args.degree - polynomial.total_degree()
        for multiplier_exp in monomial_exponents(len(symbols), allowance):
            for generator_exp, coefficient in polynomial.terms():
                exponent = add_exponents(multiplier_exp, generator_exp)
                row = row_index.setdefault(exponent, len(row_index))
                entries.append((row, column_count, float(coefficient)))
            column_count += 1
    matrix = sparse.coo_matrix(
        ([value for _, _, value in entries],
         ([row for row, _, _ in entries], [column for _, column, _ in entries])),
        shape=(len(row_index), column_count),
    ).tocsr()
    target = np.zeros(len(row_index))
    target[row_index[(0,) * len(symbols)]] = 1.0
    result = sparse_linalg.lsmr(
        matrix,
        target,
        atol=1e-13,
        btol=1e-13,
        maxiter=args.iterations,
    )
    print({
        "degree": args.degree,
        "rows": matrix.shape[0],
        "columns": matrix.shape[1],
        "nonzeros": matrix.nnz,
        "stop_code": result[1],
        "iterations": result[2],
        "residual_norm": result[3],
        "normal_residual_norm": result[4],
        "solution_norm": result[7],
    })
    return 0 if result[3] < 1e-8 else 1


if __name__ == "__main__":
    sys.exit(main())

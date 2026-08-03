#!/usr/bin/env python3
"""Find exact low-degree linear combinations for the q1 branch helpers."""

from __future__ import annotations

import itertools

import sympy as sp


br, bs, bu, bv, bw = sp.symbols("br bs bu bv bw")
variables = (br, bs, bu, bv, bw)
locals_map = {str(x): x for x in variables}


def P(source: str) -> sp.Expr:
    return sp.sympify(source.replace("^", "**"), locals=locals_map)


q1 = P("bs^3-2*bs^2*bu+bs*bu^2-bs^2*bw+bs*bu*bw-bu^2*bw+bs*bw^2")
e2 = P("br^2*bs^3-br^2*bs^2*bu-br*bs^3*bu+br*bs^2*bu^2-br^2*bs^2*bv+br^2*bs*bu*bv+br*bs^2*bu*bv-br*bs*bu^2*bv-br*bs*bu^2*bw+br*bu^2*bv*bw+br*bs*bv^2*bw-br*bu*bv^2*bw+br*bs*bu*bw^2-br*bu*bv*bw^2-bs*bv^2*bw^2+bu*bv^2*bw^2")
e5 = P("br^2*bs^3-br^2*bs^2*bu-br^2*bs^2*bv+br^2*bs*bu*bv-br*bs^3+br^2*bs*bu+br*bs^2*bu-br*bs*bu^2+br*bs^2*bv-br^2*bu*bv-br*bs*bu*bv+br*bu^2*bv+bs*bu*bv^2-bu^2*bv^2-bs*bv^2+bu*bv^2")
e7 = P("bs^3*bu-bs^2*bu^2-bs^2*bu*bv+bs*bu^2*bv-bs^3+bs^2*bu+bs^2*bv+bs*bu*bv-bu^2*bv-bs*bv^2-bs*bu+bu*bv")
e8 = P("-bs^2*bv*bw+bs*bv^2*bw+bs^2*bw^2-bs*bv*bw^2-bs^2*bw+bs*bv*bw-bv^2*bw+bs^2-bs*bv+bv*bw")
e9 = P("br*bs^2*bv-br*bs*bv^2-br*bs^2+br^2*bv+br*bs*bv-br*bv^2+bv^3-br*bv")
generators = (e2, e5, e7, e8, e9, q1)
names = ("e2", "e5", "e7", "e8", "e9", "q1")


def monomials(max_degree: int) -> list[sp.Expr]:
    result: list[sp.Expr] = []
    for total in range(max_degree + 1):
        for exps in itertools.product(range(total + 1), repeat=len(variables)):
            if sum(exps) == total:
                result.append(sp.prod(v**e for v, e in zip(variables, exps)))
    return result


def solve(target: sp.Expr, label: str, bounds: tuple[int, ...]) -> None:
    unknowns: list[sp.Symbol] = []
    multiplier_templates: list[sp.Expr] = []
    for i, bound in enumerate(bounds):
        mons = monomials(bound)
        coeffs = list(sp.symbols(f"c{i}_0:{len(mons)}"))
        unknowns.extend(coeffs)
        multiplier_templates.append(sum(c * m for c, m in zip(coeffs, mons)))

    residual = sp.Poly(sum(c * g for c, g in zip(multiplier_templates, generators)) - target, *variables)
    equations = list(residual.coeffs())
    A, b = sp.linear_eq_to_matrix(equations, unknowns)
    solutions = sp.linsolve((A, b), unknowns)
    if solutions is sp.EmptySet:
        print(f"{label}: NO_SOLUTION bounds={bounds}")
        return
    solution = next(iter(solutions))
    free = set().union(*(x.free_symbols for x in solution)).intersection(unknowns)
    chosen = [sp.factor(x.subs({p: 0 for p in free})) for x in solution]
    substitution = dict(zip(unknowns, chosen))
    multipliers = [sp.factor(c.subs(substitution)) for c in multiplier_templates]
    reconstructed = sp.expand(sum(c * g for c, g in zip(multipliers, generators)))
    assert sp.expand(reconstructed - target) == 0
    term_count = sum(len(sp.Poly(c, *variables).terms()) if c != 0 else 0 for c in multipliers)
    print(f"{label}: VERIFIED bounds={bounds} multiplier_terms={term_count}")
    for name, coefficient in zip(names, multipliers):
        print(f"  {name}: {str(coefficient).replace('**', '^')}")


targets = (
    ((bu - bs) * (br - bv) * bv * bw, "gA", (2, 2, 2, 2, 2, 3)),
    (bs * bv * (br**2 - br * bv + bv**2 - br), "gF", (2, 2, 2, 2, 2, 3)),
    (br * (br - 1) * bw * (bs * bw - bu**2), "gB", (2, 2, 3, 3, 3, 4)),
)

for target, label, bounds in targets:
    solve(sp.expand(target), label, bounds)

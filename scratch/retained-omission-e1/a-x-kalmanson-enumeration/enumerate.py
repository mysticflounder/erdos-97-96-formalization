#!/usr/bin/env python3
"""Enumerate five-label Kalmanson feasibility up to dihedral symmetry.

The distance equalities are OC=OJ and AC=AJ=AK.  Strict Kalmanson
inequalities are represented as linear forms required to be positive.
All metric triangle inequalities are also imposed as non-strict constraints.
"""

from fractions import Fraction
from itertools import combinations, permutations, product

import numpy as np
from scipy.optimize import linprog


LABELS = ("O", "A", "C", "J", "K")
VARS = ("x=OC=OJ", "y=AC=AJ=AK", "p=OA", "q=OK", "r=CJ", "s=CK", "t=JK")


def pair(a, b):
    return tuple(sorted((a, b)))


PAIR_VECTOR = {
    pair("O", "C"): (1, 0, 0, 0, 0, 0, 0),
    pair("O", "J"): (1, 0, 0, 0, 0, 0, 0),
    pair("A", "C"): (0, 1, 0, 0, 0, 0, 0),
    pair("A", "J"): (0, 1, 0, 0, 0, 0, 0),
    pair("A", "K"): (0, 1, 0, 0, 0, 0, 0),
    pair("O", "A"): (0, 0, 1, 0, 0, 0, 0),
    pair("O", "K"): (0, 0, 0, 1, 0, 0, 0),
    pair("C", "J"): (0, 0, 0, 0, 1, 0, 0),
    pair("C", "K"): (0, 0, 0, 0, 0, 1, 0),
    pair("J", "K"): (0, 0, 0, 0, 0, 0, 1),
}


def add(*vs):
    return tuple(sum(x) for x in zip(*vs))


def neg(v):
    return tuple(-x for x in v)


def sub(v, w):
    return add(v, neg(w))


def d(a, b):
    return PAIR_VECTOR[pair(a, b)]


def canonical(order):
    """Dihedral representative, rotated to O first and lexicographically least."""
    seq = list(order)
    reps = []
    for oriented in (seq, list(reversed(seq))):
        i = oriented.index("O")
        reps.append(tuple(oriented[i:] + oriented[:i]))
    return min(reps)


def induced_order(order, subset):
    return [z for z in order if z in subset]


def kalmanson_forms(order):
    forms = []
    for omitted in LABELS:
        a, b, c, e = induced_order(order, set(LABELS) - {omitted})
        diagonal = add(d(a, c), d(b, e))
        forms.append((f"K[{a}{b}{c}{e}]: {a}{c}+{b}{e}>{a}{b}+{c}{e}",
                      sub(diagonal, add(d(a, b), d(c, e)))))
        forms.append((f"K'[{a}{b}{c}{e}]: {a}{c}+{b}{e}>{a}{e}+{b}{c}",
                      sub(diagonal, add(d(a, e), d(b, c)))))
    return forms


def triangle_forms():
    forms = []
    for triple in combinations(LABELS, 3):
        for a, b, c in ((triple[0], triple[1], triple[2]),
                        (triple[0], triple[2], triple[1]),
                        (triple[1], triple[2], triple[0])):
            forms.append((f"T[{a}{b}|{c}]: {a}{c}+{b}{c}-{a}{b}>=0",
                          sub(add(d(a, c), d(b, c)), d(a, b))))
    return forms


def solve(order, triangles=True):
    strict = kalmanson_forms(order)
    # Homogeneity: requiring every strict form and distance >= 1 is equivalent
    # to strict feasibility (scale by the reciprocal of the smallest value).
    aub = [neg(v) for _, v in strict]
    bub = [-1] * len(strict)
    if triangles:
        aub.extend(neg(v) for _, v in triangle_forms())
        bub.extend([0] * len(triangle_forms()))
    ans = linprog(np.ones(len(VARS)), A_ub=np.array(aub, dtype=float),
                  b_ub=np.array(bub, dtype=float), bounds=[(1, None)] * len(VARS),
                  method="highs")
    return ans


def integer_witness(x):
    # HiGHS vertices here are integral to numerical tolerance; retain a rational fallback.
    out = []
    for z in x:
        if abs(z - round(z)) < 1e-8:
            out.append(Fraction(round(z), 1))
        else:
            out.append(Fraction(float(z)).limit_denominator(10000))
    return tuple(out)


def small_positive_dependencies(forms, max_terms=6, max_coeff=4):
    """Find a small exact positive combination of strict forms equal to zero."""
    n = len(forms)
    for k in range(1, max_terms + 1):
        for inds in combinations(range(n), k):
            vecs = [forms[i][1] for i in inds]
            for cs in product(range(1, max_coeff + 1), repeat=k):
                if all(z == 0 for z in add(*(tuple(c*x for x in v) for c, v in zip(cs, vecs)))):
                    return [(cs[j], forms[inds[j]][0], forms[inds[j]][1]) for j in range(k)]
    return None


def main():
    orders = sorted({canonical(("O",) + p) for p in permutations(("A", "C", "J", "K"))})
    print(f"classes={len(orders)}")
    for order in orders:
        no_tri = solve(order, triangles=False)
        metric = solve(order, triangles=True)
        status = "FEASIBLE" if metric.success else "INFEASIBLE"
        print(" ".join(order), status,
              f"K+pos={'yes' if no_tri.success else 'no'}",
              f"K+pos+tri={'yes' if metric.success else 'no'}")
        if metric.success:
            w = integer_witness(metric.x)
            print("  witness", ", ".join(f"{name}:{z}" for name, z in zip(VARS, w)))
            # Exact verification of all stated constraints.
            assert all(sum(Fraction(a)*b for a, b in zip(v, w)) > 0
                       for _, v in kalmanson_forms(order))
            assert all(z > 0 for z in w)
            assert all(sum(Fraction(a)*b for a, b in zip(v, w)) >= 0
                       for _, v in triangle_forms())
        else:
            dep = small_positive_dependencies(kalmanson_forms(order))
            print("  strict-only certificate:")
            if dep:
                for coefficient, name, vector in dep:
                    print(f"    {coefficient} * {name}; vector={vector}")
            else:
                print("    NONE among <=6 Kalmanson forms with coefficients 1..4")


if __name__ == "__main__":
    main()

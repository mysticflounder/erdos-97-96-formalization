"""Exact local model refuting confinement even with one all-center row escape.

This is deliberately not a model of CounterexampleData or global minimality.
It proves that the conclusion of
`exists_selectedRow_escape_criticalTripleShellSeed`, added to the complete
named local circle configuration, does not itself imply confinement.
"""

import sympy as sp

x = sp.symbols("x")
A = sp.Rational(-12)
B = sp.Rational(121, 20)
C = sp.Rational(123, 20)
D = sp.Rational(-30)
source = sp.Rational(-15, 2)
escape_target = sp.Rational(-53, 5)


def level(center, t=x):
    return (t - center) ** 2 + (t**2 - center**2) ** 2


def common_pair(a, b):
    total = -1 / (a + b)
    product = (total**3 + total - 2 * a**2 * total - 2 * a) / (2 * total)
    return sp.Poly(x**2 - total * x + product, x, domain=sp.QQ)


def shell(center, radius_sq):
    return sp.Poly(level(center) - radius_sq, x, domain=sp.QQ)


def quotient(poly, divisor):
    q, r = sp.div(poly, divisor)
    assert r.is_zero
    return q.monic()


pair1 = common_pair(A, B)
pair2 = common_pair(A, C)
first_blocker_shell = shell(B, sp.rem(sp.Poly(level(B), x), pair1).nth(0))
second_blocker_shell = shell(C, sp.rem(sp.Poly(level(C), x), pair2).nth(0))
first_outside_pair = quotient(first_blocker_shell, pair1)
second_outside_pair = quotient(second_blocker_shell, pair2)
source_shell = shell(D, level(D, source))
escape_row = shell(source, level(source, escape_target))
seed = first_blocker_shell * second_blocker_shell * source_shell

# The two second-row outside points are genuinely distinct from both named
# first-row outside points, so the desired confinement fails.
assert first_outside_pair.degree() == 2
assert second_outside_pair.degree() == 2
assert sp.gcd(first_outside_pair, second_outside_pair).degree() == 0

# The second blocker does not bisect the first outside pair.
q_sum = -first_outside_pair.nth(1) / first_outside_pair.nth(2)
q_product = first_outside_pair.nth(0) / first_outside_pair.nth(2)
second_bisection_test = sp.factor(
    q_sum**3 - 2 * q_product * q_sum + q_sum
    - 2 * C**2 * q_sum - 2 * C
)
assert second_bisection_test != 0

# `source` is a member of the three-shell seed, while its selected K4 row has
# four real points and every one lies outside the seed.
assert source_shell.eval(source) == 0
assert escape_row.degree() == 4
assert len(sp.intervals(escape_row, eps=sp.Rational(1, 10**12))) == 4
assert sp.gcd(escape_row, seed).degree() == 0

print("PASS: local confinement fails")
print("PASS: exact selected K4 escape exists from a seed center")
print("second-bisection test:", second_bisection_test)
print("boundary: global every-center K4 and minimality are not modeled")

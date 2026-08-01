"""Exact-algebraic audit model for the aligned-singleton/nonbisector core.

This is deliberately not a CounterexampleData model: it does not encode the
ordered-cap packet, every-point K4, or richness at the other two apices.  It
does show that strict convexity, the named circle incidences, first-apex
alignment, the singleton source row, and second-blocker nonbisection are
jointly consistent.

Every carrier point is (t,t^2), so distinct parameters are automatically in
strict convex position.  Circle levels are roots of
  F_a(t) = (t-a)^2 + (t^2-a^2)^2.
"""
import sympy as sp

x = sp.symbols("x")
A = sp.Rational(-12)       # first apex
B = sp.Rational(121, 20)   # first blocker
C = sp.Rational(123, 20)   # second blocker
D = sp.Rational(-30)       # singleton source's blocker
f = sp.Rational(-15, 2)    # singleton source


def F(a, t=x):
    return (t - a) ** 2 + (t**2 - a**2) ** 2


def common_pair(a, b):
    """The two parameters equidistant from each of a and b."""
    s = -1 / (a + b)
    p = (s**3 + s - 2 * a**2 * s - 2 * a) / (2 * s)
    return sp.Poly(x**2 - s * x + p, x, domain=sp.QQ)


def level_on_pair(a, pair):
    rem = sp.rem(sp.Poly(F(a), x), pair)
    assert rem.degree() == 0
    return rem.nth(0)


def shell(a, radius_sq):
    return sp.Poly(F(a) - radius_sq, x, domain=sp.QQ)


def quotient(poly, divisor):
    q, r = sp.div(poly, divisor)
    assert r.is_zero
    return q.monic()


pair1 = common_pair(A, B)
pair2 = common_pair(A, C)
apex1 = shell(A, level_on_pair(A, pair1))
blocker1 = shell(B, level_on_pair(B, pair1))
apex2 = shell(A, level_on_pair(A, pair2))
blocker2 = shell(C, level_on_pair(C, pair2))
apex1_extra = quotient(apex1, pair1)
outside_Q = quotient(blocker1, pair1)
apex2_extra = quotient(apex2, pair2)
second_extra = quotient(blocker2, pair2)
source_shell = shell(D, F(D, f))
source_extra = quotient(source_shell, sp.Poly(x - f, x))

pieces = [
    sp.Poly(x - A, x), sp.Poly(x - B, x), sp.Poly(x - C, x),
    sp.Poly(x - D, x), sp.Poly(x - f, x),
    pair1, apex1_extra, outside_Q,
    pair2, apex2_extra, second_extra, source_extra,
]

# All 20 named parameters are distinct and real.
for i, p in enumerate(pieces):
    assert len(sp.intervals(p, eps=sp.Rational(1, 10**12))) == p.degree()
    for q in pieces[i + 1:]:
        assert sp.gcd(p, q).degree() == 0
assert sum(p.degree() for p in pieces) == 20

# The singleton row omits at least one endpoint of each collision pair.
assert sp.gcd(source_shell, pair1).degree() == 0
assert sp.gcd(source_shell, pair2).degree() == 0

# If u,v are the two Q roots, equality F_C(u)=F_C(v) reduces to this
# rational expression.  Its nonzero value is exact hsecondNe.
qS = -outside_Q.nth(1) / outside_Q.nth(2)
qP = outside_Q.nth(0) / outside_Q.nth(2)
second_bisection_test = sp.factor(
    qS**3 - 2 * qP * qS + qS - 2 * C**2 * qS - 2 * C
)
assert second_bisection_test != 0

# Numerical census: among the finite carrier, the only repeated A-distance
# levels are precisely the two retained four-point levels; f is a singleton.
roots = []
for p in pieces:
    roots.extend(float(r) for r in sp.nroots(p) if abs(float(sp.im(r))) < 1e-10)
assert len(roots) == 20
levels = [float(F(A, sp.Float(t))) for t in roots]
groups = []
unused = set(range(len(roots)))
while unused:
    i = unused.pop()
    group = [i]
    for j in list(unused):
        if abs(levels[i] - levels[j]) < 1e-5:
            unused.remove(j)
            group.append(j)
    groups.append(group)
assert sorted(len(g) for g in groups if len(g) > 1) == [4, 4]
f_index = min(range(len(roots)), key=lambda i: abs(roots[i] - float(f)))
assert next(len(g) for g in groups if f_index in g) == 1

print("carrier parameters:", len(roots))
print("repeated first-apex classes:", [len(g) for g in groups if len(g) > 1])
print("singleton first-apex class:", roots[f_index])
print("second-bisection test:", second_bisection_test)
print("verdict: exact local algebraic core SAT; full CounterexampleData untested")

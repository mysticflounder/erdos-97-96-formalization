"""
smoke.py -- SPEC.md Sec 4 controls: G-DYADIC, G-POS, G-NEG, G-SING.

Must ALL pass before certify.py's FR-CERT result counts. Exits
nonzero on any failure. Uses only dyadic.py / krawczyk.py (trusted
core, stdlib-only); the two-circle / singular control systems here are
small hand-built Fraction systems, independent of the FR system.
"""
from __future__ import annotations

import random
import sys
from fractions import Fraction

from dyadic import DyadicInterval, round_down, round_up
import krawczyk


# ---------------------------------------------------------------------
# G-DYADIC (SPEC.md Sec 3.1 / Sec 4): random rational triples; interval
# results contain the exact rational result regardless of association
# order (associativity-independence containment), for +, -, *, negation;
# and round_down/round_up are individually outward (never inward).
# ---------------------------------------------------------------------
def g_dyadic(P=128, trials=300, seed=12345):
    rng = random.Random(seed)

    def rand_frac():
        num = rng.randint(-10**6, 10**6)
        den = rng.randint(1, 10**6)
        return Fraction(num, den)

    failures = []
    for t in range(trials):
        a, b, c = rand_frac(), rand_frac(), rand_frac()
        A = DyadicInterval.point(a, P)
        B = DyadicInterval.point(b, P)
        C = DyadicInterval.point(c, P)

        exact_sum = a + b + c
        left_add = (A + B) + C
        right_add = A + (B + C)
        if not (left_add.lo <= exact_sum <= left_add.hi):
            failures.append(("add-left", t, str(a), str(b), str(c)))
        if not (right_add.lo <= exact_sum <= right_add.hi):
            failures.append(("add-right", t, str(a), str(b), str(c)))

        exact_prod = a * b * c
        left_mul = (A * B) * C
        right_mul = A * (B * C)
        if not (left_mul.lo <= exact_prod <= left_mul.hi):
            failures.append(("mul-left", t, str(a), str(b), str(c)))
        if not (right_mul.lo <= exact_prod <= right_mul.hi):
            failures.append(("mul-right", t, str(a), str(b), str(c)))

        exact_diff = a - b
        D = A - B
        if not (D.lo <= exact_diff <= D.hi):
            failures.append(("sub", t, str(a), str(b)))

        exact_neg = -a
        Ng = -A
        if not (Ng.lo <= exact_neg <= Ng.hi):
            failures.append(("neg", t, str(a)))

        if not (A.lo <= a <= A.hi):
            failures.append(("point-containment", t, str(a)))

    for t in range(trials):
        x = rand_frac()
        lo = round_down(x, P)
        hi = round_up(x, P)
        if not (lo <= x <= hi):
            failures.append(("round-outward", t, str(x)))
        if lo > x or hi < x:
            failures.append(("round-direction", t, str(x)))

    return {
        "passed": len(failures) == 0,
        "trials": trials,
        "P": P,
        "n_failures": len(failures),
        "failures": failures[:5],
    }


# ---------------------------------------------------------------------
# Small 2x2 exact-Fraction linear algebra helper for the controls below.
# ---------------------------------------------------------------------
def _invert2x2(J):
    a, b = J[0][0], J[0][1]
    c, d = J[1][0], J[1][1]
    det = a * d - b * c
    if det == 0:
        raise ZeroDivisionError("singular Jacobian")
    return [[d / det, -b / det], [-c / det, a / det]]


_SQRT3_OVER_2_SEED = Fraction("0.86602540378443864676372317075293618")  # decimal seed only; not claimed exact


def _two_circle_F(v):
    x, y = v
    return [x * x + y * y - 1, (x - 1) * (x - 1) + y * y - 1]


def _two_circle_J_interval(V, P):
    x, y = V
    two = Fraction(2)
    one = DyadicInterval.point(1, P)
    return [[x * two, y * two], [(x - one) * two, y * two]]


# ---------------------------------------------------------------------
# G-POS (SPEC.md Sec 4): two-circle system x^2+y^2=1, (x-1)^2+y^2=1.
# Known algebraic root (1/2, sqrt(3)/2). Certify a box around a dyadic
# approximation, then verify by EXACT RATIONAL sign evaluation that the
# box brackets the true algebraic root: x-interval contains 1/2 exactly
# (rational component of the root); y-interval brackets sqrt(3)/2 via
# y_lo^2 < 3/4 < y_hi^2 with y_lo > 0 (monotone bracketing on y > 0).
# ---------------------------------------------------------------------
def g_pos(P=128):
    x0 = Fraction(1, 2)
    y0 = _SQRT3_OVER_2_SEED
    m = [x0, y0]
    Jm = [[2 * x0, 2 * y0], [2 * (x0 - 1), 2 * y0]]
    Y = _invert2x2(Jm)
    r = Fraction(1, 10**9)

    res = krawczyk.krawczyk_step(_two_circle_F, _two_circle_J_interval, m, r, Y, P)
    out = {"krawczyk_certified": res["passed"]}
    if not res["passed"]:
        out["passed"] = False
        out["reason"] = "krawczyk did not certify"
        return out

    X = res["X"]
    x_iv, y_iv = X[0], X[1]
    contains_half = x_iv.lo <= Fraction(1, 2) <= x_iv.hi
    bracket_lo_ok = y_iv.lo > 0 and y_iv.lo * y_iv.lo < Fraction(3, 4)
    bracket_hi_ok = y_iv.hi * y_iv.hi > Fraction(3, 4)
    ok = contains_half and bracket_lo_ok and bracket_hi_ok
    out.update({
        "passed": ok,
        "contains_half_exactly": contains_half,
        "y_lo_squared_lt_3_4": bracket_lo_ok,
        "y_hi_squared_gt_3_4": bracket_hi_ok,
        "x_interval": [str(x_iv.lo), str(x_iv.hi)],
        "y_interval": [str(y_iv.lo), str(y_iv.hi)],
    })
    return out


# ---------------------------------------------------------------------
# G-NEG (SPEC.md Sec 4): same seed/Y as G-POS, but F1 shifted
# (x^2+y^2 = 11) so the two circles no longer intersect anywhere near
# the seed (indeed: the small circle, radius 1 centered at (1,0), lies
# entirely inside the big circle, radius sqrt(11) centered at origin --
# no real intersection exists at all). Krawczyk must FAIL.
# ---------------------------------------------------------------------
def g_neg(P=128):
    def F_shifted(v):
        x, y = v
        return [x * x + y * y - 11, (x - 1) * (x - 1) + y * y - 1]

    x0 = Fraction(1, 2)
    y0 = _SQRT3_OVER_2_SEED
    m = [x0, y0]
    Jm = [[2 * x0, 2 * y0], [2 * (x0 - 1), 2 * y0]]
    Y = _invert2x2(Jm)
    r = Fraction(1, 10**9)

    res = krawczyk.krawczyk_step(F_shifted, _two_circle_J_interval, m, r, Y, P)
    return {
        "passed": (not res["passed"]),
        "krawczyk_certified": res["passed"],
        "expected": "FAIL (no root near seed)",
    }


# ---------------------------------------------------------------------
# G-SING (SPEC.md Sec 4): x^2 = 0, y - x = 0. Root at (0,0); Jacobian
# there is [[0,0],[-1,1]], det = 0 -- exactly singular. No rational
# inverse Y exists at the root. Krawczyk must FAIL: no false
# certificate at a singular root, even when fed an arbitrary substitute
# Y (identity) in place of the (nonexistent) true inverse.
# ---------------------------------------------------------------------
def g_sing(P=128):
    def F(v):
        x, y = v
        return [x * x, y - x]

    def J_interval(V, P):
        x, y = V
        two = Fraction(2)
        zero = DyadicInterval.point(0, P)
        one = DyadicInterval.point(1, P)
        neg_one = DyadicInterval.point(-1, P)
        return [[x * two, zero], [neg_one, one]]

    m = [Fraction(0), Fraction(0)]
    Jm = [[Fraction(0), Fraction(0)], [Fraction(-1), Fraction(1)]]

    det_is_zero = (Jm[0][0] * Jm[1][1] - Jm[0][1] * Jm[1][0]) == 0
    try:
        _invert2x2(Jm)
        true_inverse_exists = True
    except ZeroDivisionError:
        true_inverse_exists = False

    Y_arbitrary = [[Fraction(1), Fraction(0)], [Fraction(0), Fraction(1)]]
    r = Fraction(1, 10**6)
    res = krawczyk.krawczyk_step(F, J_interval, m, r, Y_arbitrary, P)

    ok = det_is_zero and (not true_inverse_exists) and (not res["passed"])
    return {
        "passed": ok,
        "det_is_zero": det_is_zero,
        "true_inverse_exists": true_inverse_exists,
        "krawczyk_certified_with_arbitrary_Y": res["passed"],
        "expected": "FAIL (singular Jacobian at root)",
    }


def main():
    results = {}
    results["G-DYADIC"] = g_dyadic()
    results["G-POS"] = g_pos()
    results["G-NEG"] = g_neg()
    results["G-SING"] = g_sing()

    all_ok = all(v["passed"] for v in results.values())
    for name, res in results.items():
        status = "PASS" if res["passed"] else "FAIL"
        print(f"{name}: {status}  {res}")

    print()
    print("SMOKE:", "PASS" if all_ok else "FAIL")
    sys.exit(0 if all_ok else 1)


if __name__ == "__main__":
    main()

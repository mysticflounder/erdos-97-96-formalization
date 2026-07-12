#!/usr/bin/env python3
"""ATAIL-SUB2: exact verification of the SUB2-H kill certificate.

Claim (hand proof, see proof.md): with v2=(0,0), v3=(1,0),
wa=(a0,a1), wb=(b0,b1), x=(x0,x1) real, define

  E    := (x - (wa+wb)/2) . (wb - wa)        [= (|x-wa|^2 - |x-wb|^2)/2]
  T123 := sA2(v2,wa,wb)   T235 := sA2(wa,wb,v3)   T234 := sA2(wa,wb,x)
  T124 := sA2(v2,wa,x)    T134 := sA2(v2,wb,x)
  T245 := sA2(wa,x,v3)    T345 := sA2(wb,x,v3)
  S2   := T124 + T134     S3   := T245 + T345
  ga   := a0 - a0^2 - a1^2   (>=0 iff wa in closed disk with diameter [v2,v3])
  gb   := b0 - b0^2 - b1^2
  c2   := |wb - wa|^2

  IDENT := T234^2*T123*T235 + (c2^2/4)*S2*S3
           + (c2^2/4)*T234^2 + (c2/2)*T234^2*(ga+gb)

CLAIM A (polynomial identity): E divides IDENT in Q[a0,a1,b0,b1,x0,x1].

Consequence (SUB2-H left chain (v2,wa,wb,x,v3) UNSAT): the chain
constraints include T123>0, T234>0, T235>0, T124>0, T134>0, T245>0,
T345>0 (7 of the 10 convex-position triples), and wa,wb in H gives
ga>=0, gb>=0; equal radii from x gives E=0. Then IDENT=0 by CLAIM A,
but every summand is >=0 and the first is >0 (T234>0 forces c2>0).
Contradiction.

Right chain (v2,x,wa,wb,v3): its triples give T123>0, T235>0, T234>0
(cyclic invariance), and sA2(v2,x,wa)+sA2(v2,x,wb) = -S2 > 0,
sA2(x,wa,v3)+sA2(x,wb,v3) = -S3 > 0, so S2*S3 = (-S2)(-S3) > 0: the
SAME identity closes the case.

This script verifies:
  1. CLAIM A by sympy exact polynomial division (remainder must be 0).
  2. CLAIM A independently with a from-scratch Fraction-based
     multivariate polynomial implementation (no sympy in the loop).
  3. Every frame-conversion lemma used in the hand proof, by exact
     rational evaluation on random frame-generated configurations
     (E=0 by construction): T123=2*tau*p, T235=2*tau*q, T234=2*tau*h,
     S2=2*h*p', S3=2*h*q', ga+gb = -2(P.Q + tau^2), P.Q = pq+p'q'.
"""
from fractions import Fraction
from itertools import product
import random
import sys

import sympy as sp

a0, a1, b0, b1, x0, x1 = sp.symbols("a0 a1 b0 b1 x0 x1")

VARS = (a0, a1, b0, b1, x0, x1)


def sA2(v, vj, vk):
    return (vj[0] - v[0]) * (vk[1] - v[1]) - (vk[0] - v[0]) * (vj[1] - v[1])


def build_ident():
    v2 = (sp.Integer(0), sp.Integer(0))
    v3 = (sp.Integer(1), sp.Integer(0))
    wa = (a0, a1)
    wb = (b0, b1)
    x = (x0, x1)
    E = sp.expand((x[0] - (a0 + b0) / 2) * (b0 - a0)
                  + (x[1] - (a1 + b1) / 2) * (b1 - a1))
    T123 = sA2(v2, wa, wb)
    T235 = sA2(wa, wb, v3)
    T234 = sA2(wa, wb, x)
    T124 = sA2(v2, wa, x)
    T134 = sA2(v2, wb, x)
    T245 = sA2(wa, x, v3)
    T345 = sA2(wb, x, v3)
    S2 = T124 + T134
    S3 = T245 + T345
    ga = a0 - a0**2 - a1**2
    gb = b0 - b0**2 - b1**2
    c2 = (b0 - a0) ** 2 + (b1 - a1) ** 2
    IDENT = (T234**2 * T123 * T235 + (c2**2 / 4) * S2 * S3
             + (c2**2 / 4) * T234**2 + (c2 / 2) * T234**2 * (ga + gb))
    return sp.expand(IDENT), E


def check_sympy_division():
    IDENT, E = build_ident()
    q, r = sp.div(sp.Poly(IDENT, *VARS), sp.Poly(E, *VARS))
    ok = r.is_zero
    print(f"[1] sympy exact division IDENT / E: remainder zero = {ok}")
    if not ok:
        print("    REMAINDER:", r.as_expr())
    return ok, sp.expand(q.as_expr()), E


# ---------------------------------------------------------------------------
# Independent implementation: multivariate polynomials as dict
# {exponent-tuple: Fraction} over the 6 variables, written from scratch.
# ---------------------------------------------------------------------------

Z6 = (0, 0, 0, 0, 0, 0)


def pconst(c):
    c = Fraction(c)
    return {Z6: c} if c else {}


def pvar(i):
    e = [0] * 6
    e[i] = 1
    return {tuple(e): Fraction(1)}


def padd(p, q):
    r = dict(p)
    for e, c in q.items():
        nc = r.get(e, Fraction(0)) + c
        if nc:
            r[e] = nc
        else:
            r.pop(e, None)
    return r


def pneg(p):
    return {e: -c for e, c in p.items()}


def psub(p, q):
    return padd(p, pneg(q))


def pmul(p, q):
    r = {}
    for e1, c1 in p.items():
        for e2, c2 in q.items():
            e = tuple(i + j for i, j in zip(e1, e2))
            nc = r.get(e, Fraction(0)) + c1 * c2
            if nc:
                r[e] = nc
            else:
                r.pop(e, None)
    return r


def pscale(p, c):
    c = Fraction(c)
    return {e: cc * c for e, cc in p.items()} if c else {}


def check_independent():
    A0, A1, B0, B1, X0, X1 = (pvar(i) for i in range(6))
    one = pconst(1)

    def sa2(v, vj, vk):
        return psub(pmul(psub(vj[0], v[0]), psub(vk[1], v[1])),
                    pmul(psub(vk[0], v[0]), psub(vj[1], v[1])))

    v2 = (pconst(0), pconst(0))
    v3 = (one, pconst(0))
    wa = (A0, A1)
    wb = (B0, B1)
    x = (X0, X1)
    half = Fraction(1, 2)
    E = padd(pmul(psub(x[0], pscale(padd(A0, B0), half)), psub(B0, A0)),
             pmul(psub(x[1], pscale(padd(A1, B1), half)), psub(B1, A1)))
    T123 = sa2(v2, wa, wb)
    T235 = sa2(wa, wb, v3)
    T234 = sa2(wa, wb, x)
    S2 = padd(sa2(v2, wa, x), sa2(v2, wb, x))
    S3 = padd(sa2(wa, x, v3), sa2(wb, x, v3))
    ga = psub(A0, padd(pmul(A0, A0), pmul(A1, A1)))
    gb = psub(B0, padd(pmul(B0, B0), pmul(B1, B1)))
    c2 = padd(pmul(psub(B0, A0), psub(B0, A0)),
              pmul(psub(B1, A1), psub(B1, A1)))
    T234sq = pmul(T234, T234)
    c2sq = pmul(c2, c2)
    IDENT = padd(
        padd(pmul(T234sq, pmul(T123, T235)),
             pscale(pmul(c2sq, pmul(S2, S3)), Fraction(1, 4))),
        padd(pscale(pmul(c2sq, T234sq), Fraction(1, 4)),
             pscale(pmul(c2, pmul(T234sq, padd(ga, gb))), half)))

    # divide IDENT by E w.r.t. lex order on exponents (leading term of E).
    def lead(p):
        return max(p) if p else None

    # lex order comparison via tuple compare (max works: python tuple order)
    quot = {}
    rem = dict(IDENT)
    le = lead(E)
    lc = E[le]
    while rem:
        lr = lead(rem)
        if all(i >= j for i, j in zip(lr, le)):
            e = tuple(i - j for i, j in zip(lr, le))
            c = rem[lr] / lc
            quot = padd(quot, {e: c})
            rem = psub(rem, pmul({e: c}, E))
        else:
            break  # leading monomial not divisible -> true remainder nonzero
    ok = not rem
    print(f"[2] independent Fraction-poly division IDENT / E: "
          f"remainder zero = {ok}")
    if not ok:
        print(f"    remainder has {len(rem)} monomials, lead {lead(rem)}")
    return ok


# ---------------------------------------------------------------------------
# Frame-conversion lemmas on random exact-rational frame configurations.
# ---------------------------------------------------------------------------

def rot90(v):
    return (-v[1], v[0])


def check_frame_lemmas(trials=400, seed=97):
    rng = random.Random(seed)
    v2 = (Fraction(0), Fraction(0))
    v3 = (Fraction(1), Fraction(0))

    def sa2(v, vj, vk):
        return ((vj[0] - v[0]) * (vk[1] - v[1])
                - (vk[0] - v[0]) * (vj[1] - v[1]))

    bad = 0
    for _ in range(trials):
        # rational point on unit circle via tan-half-angle t
        t = Fraction(rng.randint(-1000, 1000), rng.randint(1, 1000))
        den = 1 + t * t
        mhat = ((1 - t * t) / den, 2 * t / den)   # unit vector, exact
        n = rot90(mhat)
        M = (Fraction(rng.randint(-400, 400), 100),
             Fraction(rng.randint(-400, 400), 100))
        h = Fraction(rng.randint(1, 300), 100)
        tau = Fraction(rng.randint(1, 300), 100)
        x = (M[0] - h * mhat[0], M[1] - h * mhat[1])
        wa = (M[0] - tau * n[0], M[1] - tau * n[1])
        wb = (M[0] + tau * n[0], M[1] + tau * n[1])
        # E = 0 exactly by construction:
        E = ((x[0] - (wa[0] + wb[0]) / 2) * (wb[0] - wa[0])
             + (x[1] - (wa[1] + wb[1]) / 2) * (wb[1] - wa[1]))
        P = (M[0] - v2[0], M[1] - v2[1])
        Q = (M[0] - v3[0], M[1] - v3[1])
        p = P[0] * mhat[0] + P[1] * mhat[1]
        pp = P[0] * n[0] + P[1] * n[1]
        q = Q[0] * mhat[0] + Q[1] * mhat[1]
        qp = Q[0] * n[0] + Q[1] * n[1]
        ga = wa[0] - wa[0] ** 2 - wa[1] ** 2
        gb = wb[0] - wb[0] ** 2 - wb[1] ** 2
        PQ = P[0] * Q[0] + P[1] * Q[1]
        checks = [
            E == 0,
            sa2(v2, wa, wb) == 2 * tau * p,
            sa2(wa, wb, v3) == 2 * tau * q,
            sa2(wa, wb, x) == 2 * tau * h,
            sa2(v2, wa, x) + sa2(v2, wb, x) == 2 * h * pp,
            sa2(wa, x, v3) + sa2(wb, x, v3) == 2 * h * qp,
            ga + gb == -2 * (PQ + tau * tau),
            PQ == p * q + pp * qp,
            # right-chain sums are exact negations:
            sa2(v2, x, wa) + sa2(v2, x, wb) == -2 * h * pp,
            sa2(x, wa, v3) + sa2(x, wb, v3) == -2 * h * qp,
            sa2(x, wa, wb) == 2 * tau * h,
        ]
        if not all(checks):
            bad += 1
            print("    FRAME LEMMA FAILURE:",
                  [i for i, c in enumerate(checks) if not c])
    ok = bad == 0
    print(f"[3] frame-conversion lemmas: {trials} exact random frames, "
          f"failures = {bad}")
    return ok


def main():
    ok1, quotient, E = check_sympy_division()
    ok2 = check_independent()
    ok3 = check_frame_lemmas()
    if ok1:
        qs = sp.factor(quotient)
        print("\ncofactor lambda with IDENT = lambda * E (factored):")
        print("   ", qs)
    allok = ok1 and ok2 and ok3
    print("\nRESULT:", "ALL CHECKS PASS" if allok else "FAILURE")
    return 0 if allok else 1


if __name__ == "__main__":
    sys.exit(main())

#!/usr/bin/env python3
"""Independent audit of ATAIL-SUB2 CLAIM A: E | IDENT in Q[a0,a1,b0,b1,x0,x1].

Written from scratch (not derived from scratch/atail-sub2/verify_identity.py).
Two methods:
  M1: sympy exact division IDENT = q*E + r; require r == 0 AND re-expand
      q*E - IDENT == 0 (so we do not trust sp.div's internal consistency).
  M2: division-free. E is linear in (x0,x1) with gradient d=(b0-a0, b1-a1).
      General solution of E=0 (for d != 0): x = midpoint + s*rot90(d),
      i.e. x0 = (a0+b0)/2 - s*(b1-a1), x1 = (a1+b1)/2 + s*(b0-a0).
      Substitute; IDENT must vanish IDENTICALLY in Q[a0,a1,b0,b1,s].
      (Necessary condition, independent code path from division.)
Also M3: my own positivity bookkeeping sanity check on 2000 random exact
      rational configurations satisfying E=0: confirm that whenever the
      left-chain (resp. right-chain) strict hypotheses + ga,gb>=0 hold,
      we actually have a contradiction flag (they should NEVER all hold,
      by the theorem; count how many random configs satisfy them - must be 0
      among tested, and separately confirm IDENT == 0 numerically on E=0).
"""
from fractions import Fraction
import random
import sympy as sp

a0, a1, b0, b1, x0, x1, s = sp.symbols("a0 a1 b0 b1 x0 x1 s")


def sA2(v, vj, vk):
    return (vj[0] - v[0]) * (vk[1] - v[1]) - (vk[0] - v[0]) * (vj[1] - v[1])


v2 = (sp.Integer(0), sp.Integer(0))
v3 = (sp.Integer(1), sp.Integer(0))
wa = (a0, a1)
wb = (b0, b1)
x = (x0, x1)

E = (x0 - (a0 + b0) / 2) * (b0 - a0) + (x1 - (a1 + b1) / 2) * (b1 - a1)
T123 = sA2(v2, wa, wb)
T235 = sA2(wa, wb, v3)
T234 = sA2(wa, wb, x)
S2 = sA2(v2, wa, x) + sA2(v2, wb, x)
S3 = sA2(wa, x, v3) + sA2(wb, x, v3)
ga = a0 - a0**2 - a1**2
gb = b0 - b0**2 - b1**2
c2 = (b0 - a0) ** 2 + (b1 - a1) ** 2
IDENT = (T234**2 * T123 * T235 + sp.Rational(1, 4) * c2**2 * S2 * S3
         + sp.Rational(1, 4) * c2**2 * T234**2
         + sp.Rational(1, 2) * c2 * T234**2 * (ga + gb))

# sanity: E equals (|x-wa|^2 - |x-wb|^2)/2
d2a = (x0 - a0) ** 2 + (x1 - a1) ** 2
d2b = (x0 - b0) ** 2 + (x1 - b1) ** 2
assert sp.expand(E - (d2a - d2b) / 2) == 0, "E definition mismatch"
print("[chk] E == (|x-wa|^2 - |x-wb|^2)/2 : OK")

# M1: division + re-expansion
gens = (a0, a1, b0, b1, x0, x1)
q, r = sp.div(sp.Poly(sp.expand(IDENT), *gens), sp.Poly(sp.expand(E), *gens))
r_zero = r.is_zero
recheck = sp.expand(q.as_expr() * E - IDENT) == 0
print(f"[M1] sp.div remainder zero: {r_zero}; re-expansion q*E-IDENT==0: {recheck}")

# M2: substitution
subs = {x0: (a0 + b0) / 2 - s * (b1 - a1), x1: (a1 + b1) / 2 + s * (b0 - a0)}
E_sub = sp.expand(E.subs(subs))
IDENT_sub = sp.expand(IDENT.subs(subs))
print(f"[M2] E vanishes under parameterization: {E_sub == 0}")
print(f"[M2] IDENT vanishes identically on E=0 (poly in a,b,s): {IDENT_sub == 0}")

# M3: random exact-rational configs on E=0; theorem says hypotheses can never
# jointly hold; also IDENT must evaluate to exactly 0 there.
rng = random.Random(20260712)
lam = sp.expand(q.as_expr())
viol = 0
ident_nonzero = 0
tested = 0
for _ in range(2000):
    A0 = Fraction(rng.randint(-300, 300), rng.randint(1, 50))
    A1 = Fraction(rng.randint(-300, 300), rng.randint(1, 50))
    B0 = Fraction(rng.randint(-300, 300), rng.randint(1, 50))
    B1 = Fraction(rng.randint(-300, 300), rng.randint(1, 50))
    S = Fraction(rng.randint(-300, 300), rng.randint(1, 50))
    X0 = (A0 + B0) / 2 - S * (B1 - A1)
    X1 = (A1 + B1) / 2 + S * (B0 - A0)
    vals = {a0: sp.Rational(A0), a1: sp.Rational(A1), b0: sp.Rational(B0),
            b1: sp.Rational(B1), x0: sp.Rational(X0), x1: sp.Rational(X1)}
    tested += 1
    iv = IDENT.subs(vals)
    if sp.simplify(iv) != 0:
        ident_nonzero += 1
    # hypotheses (left): T123,T235,T234,S2,S3 > 0 and ga,gb >= 0
    t123 = T123.subs(vals); t235 = T235.subs(vals); t234 = T234.subs(vals)
    s2 = S2.subs(vals); s3 = S3.subs(vals)
    gav = ga.subs(vals); gbv = gb.subs(vals)
    left = t123 > 0 and t235 > 0 and t234 > 0 and s2 > 0 and s3 > 0 \
        and gav >= 0 and gbv >= 0
    right = t123 > 0 and t235 > 0 and t234 > 0 and (-s2) > 0 and (-s3) > 0 \
        and gav >= 0 and gbv >= 0
    if left or right:
        viol += 1
print(f"[M3] {tested} exact configs on E=0: IDENT!=0 count = {ident_nonzero}, "
      f"hypothesis-satisfying (should be 0) = {viol}")

ok = r_zero and recheck and (E_sub == 0) and (IDENT_sub == 0) \
    and ident_nonzero == 0 and viol == 0
print("AUDIT IDENT RESULT:", "PASS" if ok else "FAIL")

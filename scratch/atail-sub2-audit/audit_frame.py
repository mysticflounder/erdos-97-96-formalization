#!/usr/bin/env python3
"""Symbolic verification of the Step-2 frame-conversion lemmas (proof.md).

Parameterize the unit vector mhat by tan-half-angle t (covers all directions
except (-1,0); identities are rational in t, so identity in Q(t)[M,h,tau]
extends to the excluded direction by Zariski density / continuity - and we
also check the excluded direction mhat=(-1,0) directly).
Frame: n = rot90(mhat), x = M - h*mhat, wa = M - tau*n, wb = M + tau*n.
Verify as identities in (M0, M1, h, tau, t):
  sA2(v2,wa,wb) = 2*tau*p        sA2(wa,wb,v3) = 2*tau*q
  sA2(wa,wb,x)  = 2*tau*h        sA2(x,wa,wb)  = 2*tau*h
  sA2(v2,wa,x)+sA2(v2,wb,x) = 2*h*p'
  sA2(wa,x,v3)+sA2(wb,x,v3) = 2*h*q'
  sA2(v2,x,wa)+sA2(v2,x,wb) = -2*h*p'
  sA2(x,wa,v3)+sA2(x,wb,v3) = -2*h*q'
  ga+gb = -2*(P.Q + tau^2)       P.Q = p*q + p'*q'
  E = 0
"""
import sympy as sp

M0, M1, h, tau, t = sp.symbols("M0 M1 h tau t")


def sA2(v, vj, vk):
    return (vj[0] - v[0]) * (vk[1] - v[1]) - (vk[0] - v[0]) * (vj[1] - v[1])


def run(mhat):
    n = (-mhat[1], mhat[0])
    v2 = (sp.Integer(0), sp.Integer(0))
    v3 = (sp.Integer(1), sp.Integer(0))
    M = (M0, M1)
    x = (M0 - h * mhat[0], M1 - h * mhat[1])
    wa = (M0 - tau * n[0], M1 - tau * n[1])
    wb = (M0 + tau * n[0], M1 + tau * n[1])
    P = (M0, M1)
    Q = (M0 - 1, M1)
    p = P[0] * mhat[0] + P[1] * mhat[1]
    pp = P[0] * n[0] + P[1] * n[1]
    q = Q[0] * mhat[0] + Q[1] * mhat[1]
    qp = Q[0] * n[0] + Q[1] * n[1]
    ga = wa[0] - wa[0] ** 2 - wa[1] ** 2
    gb = wb[0] - wb[0] ** 2 - wb[1] ** 2
    PQ = P[0] * Q[0] + P[1] * Q[1]
    E = ((x[0] - (wa[0] + wb[0]) / 2) * (wb[0] - wa[0])
         + (x[1] - (wa[1] + wb[1]) / 2) * (wb[1] - wa[1]))
    ids = {
        "T123=2tp": sA2(v2, wa, wb) - 2 * tau * p,
        "T235=2tq": sA2(wa, wb, v3) - 2 * tau * q,
        "T234=2th": sA2(wa, wb, x) - 2 * tau * h,
        "T234cyc=2th": sA2(x, wa, wb) - 2 * tau * h,
        "S2=2hp'": sA2(v2, wa, x) + sA2(v2, wb, x) - 2 * h * pp,
        "S3=2hq'": sA2(wa, x, v3) + sA2(wb, x, v3) - 2 * h * qp,
        "-S2": sA2(v2, x, wa) + sA2(v2, x, wb) + 2 * h * pp,
        "-S3": sA2(x, wa, v3) + sA2(x, wb, v3) + 2 * h * qp,
        "ga+gb": (ga + gb) + 2 * (PQ + tau ** 2),
        "PQ": PQ - (p * q + pp * qp),
        "E=0": E,
    }
    allok = True
    for k, expr in ids.items():
        z = sp.simplify(sp.together(sp.expand(expr)))
        good = z == 0
        allok &= good
        if not good:
            print(f"  FAIL {k}: {z}")
    return allok


den = 1 + t * t
mhat_t = ((1 - t * t) / den, 2 * t / den)
ok1 = run(mhat_t)
print(f"[F1] symbolic (tan-half-angle t, generic direction): {'PASS' if ok1 else 'FAIL'}")
ok2 = run((sp.Integer(-1), sp.Integer(0)))
print(f"[F2] excluded direction mhat=(-1,0): {'PASS' if ok2 else 'FAIL'}")
print("AUDIT FRAME RESULT:", "PASS" if ok1 and ok2 else "FAIL")

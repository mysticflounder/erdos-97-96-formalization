#!/usr/bin/env python3
"""Kill-candidate cross-checks for the anchored single-ident families.

Subsystem A (class V0o2_WV0_o2i shape): V in K(W) forces rw2 = 1; the
o2-ident point z lies in intO2 with |z-W|^2 = 1 and defines
rv2 = |z-V|^2; K(V) needs a member p in intO1 at radius rv2.
Subsystem B (class V0U_WVo1_o1i shape): U in K(V) forces rv2 = |UV|^2,
V in K(W) forces rw2 = 1; the o1-ident point z lies in intO1 on BOTH
circles; K(W) needs a member q in intO2 at radius 1 from W.
Each subsystem is leaf-implied for its class, so unsat = kill.
"""
import sys

import z3

ux, uy, oy, R2, rv2 = z3.Reals("ux uy oy R2 rv2")
zx, zy, px, py = z3.Reals("zx zy px py")

V = (0, 0)
W = (1, 0)
U = (ux, uy)
O = (z3.RealVal(1) / 2, oy)


def d2(a, b):
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def sA2(v, vj, vk):
    return ((vj[0] - v[0]) * (vk[1] - v[1])
            - (vk[0] - v[0]) * (vj[1] - v[1]))


def cap_signs(p, own):
    chords = {1: (V, W, U), 2: (W, U, V), 3: (U, V, W)}
    out = []
    for ci, (ca, cb, opp) in chords.items():
        prod = sA2(p, ca, cb) * sA2(opp, ca, cb)
        out.append(prod < 0 if ci == own else prod > 0)
    return out


def base(s):
    s.add(uy > 0)
    s.add(d2(U, O) == R2, d2(V, O) == R2)
    s.add((V[0] - ux) * (W[0] - ux) + (V[1] - uy) * (W[1] - uy) >= 0)
    s.add((ux - V[0]) * (W[0] - V[0]) + (uy - V[1]) * (W[1] - V[1]) >= 0)
    s.add((ux - W[0]) * (V[0] - W[0]) + (uy - W[1]) * (V[1] - W[1]) >= 0)
    s.add(d2((zx, zy), O) <= R2)
    s.add(d2((px, py), O) <= R2)


which = sys.argv[1] if len(sys.argv) > 1 else "A"
s = z3.SolverFor("QF_NRA")
base(s)
if which == "A":
    # z in intO2 on C(W,1); p in intO1 at rv2 = |z-V|^2
    s.add(d2((zx, zy), W) == 1)
    s.add(rv2 == d2((zx, zy), V))
    s.add(d2((px, py), V) == rv2)
    for c in cap_signs((zx, zy), 3):
        s.add(c)
    for c in cap_signs((px, py), 2):
        s.add(c)
else:
    # B: z in intO1 on C(V,|UV|^2) and C(W,1); q in intO2 with |q-W|=1
    s.add(rv2 == d2(U, V))
    s.add(d2((zx, zy), V) == rv2)
    s.add(d2((zx, zy), W) == 1)
    s.add(d2((px, py), W) == 1)
    for c in cap_signs((zx, zy), 2):
        s.add(c)
    for c in cap_signs((px, py), 3):
        s.add(c)
s.set("timeout", 300000)
r = s.check()
print(which, r)
if r == z3.sat:
    m = s.model()
    for v in (ux, uy, zx, zy, px, py):
        print(v, m[v])

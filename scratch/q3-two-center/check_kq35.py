#!/usr/bin/env python3
"""K-Q3-5 machine cross-check (z3, qfnra-nlsat).

Subsystem: z shared in intS on both circles (rv2, rw2 free), ONE p in
intO1 on C(V, rv2), ONE q in intO2 on C(W, rw2), E-MEC, I-OBT, I-DISK.
All leaf-implied for every isv='shared' class. Expected: unsat.
"""
import z3

ux, uy, oy, R2, rv2, rw2 = z3.Reals("ux uy oy R2 rv2 rw2")
zx, zy, px, py, qx, qy = z3.Reals("zx zy px py qx qy")

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


s = z3.SolverFor("QF_NRA")
s.add(uy > 0)
s.add(d2(U, O) == R2, d2(V, O) == R2)
s.add((V[0] - ux) * (W[0] - ux) + (V[1] - uy) * (W[1] - uy) >= 0)
s.add((ux - V[0]) * (W[0] - V[0]) + (uy - V[1]) * (W[1] - V[1]) >= 0)
s.add((ux - W[0]) * (V[0] - W[0]) + (uy - W[1]) * (V[1] - W[1]) >= 0)
s.add(d2((zx, zy), V) == rv2, d2((zx, zy), W) == rw2)
s.add(d2((px, py), V) == rv2)
s.add(d2((qx, qy), W) == rw2)
for pt in ((zx, zy), (px, py), (qx, qy)):
    s.add(d2(pt, O) <= R2)
for c in cap_signs((zx, zy), 1):
    s.add(c)
for c in cap_signs((px, py), 2):
    s.add(c)
for c in cap_signs((qx, qy), 3):
    s.add(c)
s.set("timeout", 300000)
print(s.check())

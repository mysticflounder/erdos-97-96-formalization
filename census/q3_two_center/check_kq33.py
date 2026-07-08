#!/usr/bin/env python3
"""K-Q3-3 machine cross-check (z3, qfnra-nlsat).

Subsystem: V=(0,0), W=(1,0), U=(ux,uy) uy>0; O=(1/2,oy), R2; z shared
s-point; p one forced intO1 member of K(V). Constraints (all leaf-implied
for class VsU_WsU_sshared):
  E-MEC: |U-O|^2 = R2, |V-O|^2 = R2
  radii: rv2 = |U-V|^2 (U in K(V)), rw2 = |U-W|^2 (U in K(W));
         |z-V|^2 = rv2, |z-W|^2 = rw2, |p-V|^2 = rv2
  I-OBT at U (and the other two corners), I-DISK for z and p
  cap signs: z in intS (strict), p in intO1 (strict)
Expected: unsat.
"""
import z3

ux, uy, oy, R2, rv2, rw2 = z3.Reals("ux uy oy R2 rv2 rw2")
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
    # strict: p strictly on the opposite vertex's side of each chord it
    # doesn't own; strictly on the own chord's far side from the opposite
    # vertex... (D-probe add_cap_signs semantics: own chord sign flipped)
    chords = {1: (V, W, U), 2: (W, U, V), 3: (U, V, W)}
    out = []
    for ci, (ca, cb, opp) in chords.items():
        prod = sA2(p, ca, cb) * sA2(opp, ca, cb)
        out.append(prod < 0 if ci == own else prod > 0)
    return out


s = z3.SolverFor("QF_NRA")
s.add(uy > 0)
s.add(d2(U, O) == R2, d2(V, O) == R2)
s.add(rv2 == d2(U, V), rw2 == d2(U, W))
s.add(d2((zx, zy), V) == rv2, d2((zx, zy), W) == rw2)
s.add(d2((px, py), V) == rv2)
# I-OBT
s.add((V[0] - ux) * (W[0] - ux) + (V[1] - uy) * (W[1] - uy) >= 0)
s.add((ux - V[0]) * (W[0] - V[0]) + (uy - V[1]) * (W[1] - V[1]) >= 0)
s.add((ux - W[0]) * (V[0] - W[0]) + (uy - W[1]) * (V[1] - W[1]) >= 0)
# I-DISK
s.add(d2((zx, zy), O) <= R2)
s.add(d2((px, py), O) <= R2)
# caps: z in intS (own 1), p in intO1 (own 2)
for c in cap_signs((zx, zy), 1):
    s.add(c)
for c in cap_signs((px, py), 2):
    s.add(c)
s.set("timeout", 120000)
print(s.check())

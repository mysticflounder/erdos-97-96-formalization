#!/usr/bin/env python3
"""K-Q3-5 lemma-level machine checks (z3, QF_NRA).

The full 3-aux-point subsystem (check_kq35.py) is z3-unknown, so we
check the three lemmas of the kill_notes.md proof separately, each as
an unsat query on the negation. All division-free.

L1 (sum bound): gauge V=(0,0), W=(1,0), O=(1/2,oy), oy>=0 (I-OBT),
    R2 = 1/4 + oy^2 (E-MEC: d(V,O)=R). z in intS: zy<0 (cap sign),
    ||z-O||^2 <= R2 (I-DISK). Claim: ||z-V||^2 + ||z-W||^2 <= 1.

L2 (nonobtuse chord-distance bound): uy>0, nonobtuse at V,W,U
    (ux in [0,1]; ux^2-ux+uy^2 >= 0). dV = uy/||WU||, dW = uy/||UV||
    are the distances from V,W to the opposite chords. Claim:
    dV^2 + dW^2 >= 1, cleared of denominators:
    uy^2*(||UV||^2 + ||WU||^2) >= ||UV||^2 * ||WU||^2.

L3 (strict cap-interior lower bound): p in intO1 lies strictly on the
    non-V side of chord WU (own-chord cap sign). Claim:
    ||p-V||^2 * ||WU||^2 > uy^2  (i.e. ||p-V|| > dV strictly).
    Mirror L3' for q in intO2 vs chord UV and W.

Chaining (pure arithmetic, no solver needed): rhoV^2 = ||p-V||^2 > dV^2
and rhoW^2 = ||q-W||^2 > dW^2 give rhoV^2+rhoW^2 > dV^2+dW^2 >= 1 (L2)
while L1 gives rhoV^2+rhoW^2 <= 1 via the shared z. Contradiction.
"""
import z3


def d2(a, b):
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def sA2(v, vj, vk):
    return ((vj[0] - v[0]) * (vk[1] - v[1])
            - (vk[0] - v[0]) * (vj[1] - v[1]))


V = (z3.RealVal(0), z3.RealVal(0))
W = (z3.RealVal(1), z3.RealVal(0))
results = {}

# --- L1: sum bound on intS ---
oy, R2, zx, zy = z3.Reals("oy R2 zx zy")
O = (z3.RealVal(1) / 2, oy)
s = z3.SolverFor("QF_NRA")
s.add(oy >= 0)
s.add(R2 == z3.RealVal(1) / 4 + oy ** 2)
s.add(zy < 0)
s.add(d2((zx, zy), O) <= R2)
s.add(d2((zx, zy), V) + d2((zx, zy), W) > 1)   # negation of claim
results["L1_sum_bound"] = s.check()

# --- L2: dV^2 + dW^2 >= 1 for nonobtuse frames ---
ux, uy = z3.Reals("ux uy")
U = (ux, uy)
a2 = d2(W, U)   # ||WU||^2
b2 = d2(V, U)   # ||UV||^2
s = z3.SolverFor("QF_NRA")
s.add(uy > 0)
s.add(ux >= 0, ux <= 1)                        # I-OBT at V, W
s.add(ux ** 2 - ux + uy ** 2 >= 0)             # I-OBT at U
s.add(uy ** 2 * (a2 + b2) < a2 * b2)           # negation of claim
results["L2_dV2_dW2_ge_1"] = s.check()

# --- L3: p in intO1 (beyond chord WU) => ||p-V||^2 * ||WU||^2 > uy^2 ---
px, py = z3.Reals("px py")
s = z3.SolverFor("QF_NRA")
s.add(uy > 0)
s.add(sA2((px, py), W, U) * sA2(V, W, U) < 0)  # own-chord cap sign
s.add(d2((px, py), V) * a2 <= uy ** 2)         # negation of claim
results["L3_intO1_strict"] = s.check()

# --- L3': q in intO2 (beyond chord UV) => ||q-W||^2 * ||UV||^2 > uy^2 ---
qx, qy = z3.Reals("qx qy")
s = z3.SolverFor("QF_NRA")
s.add(uy > 0)
s.add(sA2((qx, qy), U, V) * sA2(W, U, V) < 0)  # own-chord cap sign
s.add(d2((qx, qy), W) * b2 <= uy ** 2)         # negation of claim
results["L3p_intO2_strict"] = s.check()

ok = True
for name, res in results.items():
    print(f"{name}: {res}")
    ok = ok and (res == z3.unsat)
print("ALL UNSAT" if ok else "NOT ALL UNSAT — DO NOT claim machine-checked")

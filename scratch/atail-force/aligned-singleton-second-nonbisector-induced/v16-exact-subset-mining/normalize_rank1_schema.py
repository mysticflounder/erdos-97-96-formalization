#!/usr/bin/env python3
"""Emit a denominator-cleared normalized rank-1 six-point schema."""

from __future__ import annotations

from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
t, u, v = z3.Reals("t u v")


def pt(x: z3.ArithRef, y: z3.ArithRef, d: z3.ArithRef = z3.IntVal(1)):
    return x, y, d


den_t = 1 + t * t
den_u = 1 + u * u
den_v = 1 + v * v
points = [
    # A = E + R_u(C-E), so AE=CE.
    pt(
        -(3 * t * t * u * u - t * t - 4 * t * u - u * u - 1),
        4 * t * u * (t + u),
        den_t * den_u,
    ),
    pt(0, 0),  # B
    pt(1, 0),  # C
    pt(1, t, 2),  # D, the circumcenter of B,C,E
    pt(1 - t * t, 2 * t, den_t),  # E, on the unit circle about B
    pt(1 - v * v, 2 * v, den_v),  # F, on the unit circle about B
]


def orient_num(p, q, r):
    px, py, pd = p
    qx, qy, qd = q
    rx, ry, rd = r
    qpx = qx * pd - px * qd
    qpy = qy * pd - py * qd
    rpx = rx * pd - px * rd
    rpy = ry * pd - py * rd
    return z3.simplify(qpx * rpy - qpy * rpx)


constraints = []
names = []
for a in range(6):
    b = (a + 1) % 6
    for c in range(6):
        if c in (a, b):
            continue
        names.append(f"orient_{a}_{b}_{c}")
        constraints.append(orient_num(points[a], points[b], points[c]) > 0)

solver = z3.SolverFor("QF_NRA")
for name, constraint in zip(names, constraints, strict=True):
    solver.assert_and_track(constraint, z3.Bool(name))

out = ["(set-logic QF_NRA)"]
out.extend(f"(declare-fun {name} () Real)" for name in ("t", "u", "v"))
for name, constraint in zip(names, constraints, strict=True):
    out.append(f"(assert (! {constraint.sexpr()} :named {name}))")
out.append("(check-sat)")
(HERE / "six-rank1-normalized.smt2").write_text("\n".join(out) + "\n")

solver.set(timeout=120_000)
verdict = solver.check()
print(verdict)
if verdict == z3.unsat:
    print("core", sorted(str(item) for item in solver.unsat_core()))
elif verdict == z3.unknown:
    print("reason", solver.reason_unknown())
else:
    print(solver.model())

#!/usr/bin/env python3
"""Revisit of the p97-rvol (4,4,4) full-K4 QF_NRA known-result gate.

Original: p97-rvol/scratch/u13_global/gen_global.py smoke1 — z3/cvc5 timeout at
1200-1500s, recorded in dead-ends.md as "free-frame + full-K4 not
solver-decidable in practice". This encoder re-tests the SAME hypothesis set
with the symmetry/variable-count artifacts removed:

  1. Rotation gauge: v2 fixed at (1,0) (WLOG; unit circle already fixes
     translation+scale).
  2. Reflection gauge: global orientation signedArea2(v1,v2,v3) > 0 (replaces
     the non-collinearity disequality).
  3. Convexity: strict ccw on ALL index triples of the canonical cyclic hull
     order v1, I3, v2, I1, v3, I2 (ArcBlockContiguity: caps are contiguous
     hull blocks, so this order is a proven WLOG relabeling). Zero extra
     variables, degree 2 — replaces the separating-hyperplane encoding
     (18 extra reals, 72 strict inequalities).
  4. Cap membership sign-resolved under the fixed orientation: single
     bilinear inequality per interior point (replaces the quartic
     signedArea2-product form of onArcOpposite).
  5. Pairwise-distinctness dropped: implied by strict all-triple convexity.

Unchanged from the original (this is what the gate tests): H_MEC (unit
circumcircle, non-obtuse, non-equilateral [WLOG CASE-ASSUMPTION]), H_disk,
H_K4 as per-point rho2_i > 0 + Bool selectors s_i_j with >=4 cardinality,
and the (redundant, implied-by-non-equilateral) not-U1.3 rider.

Known correct verdict at N=9, (4,4,4): UNSAT (sibling-repo proof; at (4,4,4)
U1.3 holds, and the rider's v1/v3 endpoint pair contradicts non-equilateral).

Modes: gate (full, expect UNSAT) | sat-control (drop K4+rider, expect SAT)
| unsat-control (inject P3=v1 contradiction, expect UNSAT fast).
Real-variable count: gate = 16 coords + 9 rho2 = 25 (original: 45).
"""
import sys

N = 9
V1, V2, V3 = 0, 1, 2
I1 = [3, 4]   # cap C1 interior (opp v1, endpoints v2,v3)
I2 = [5, 6]   # cap C2 interior (opp v2, endpoints v1,v3)  = oppCap1 interior
I3 = [7, 8]   # cap C3 interior (opp v3, endpoints v1,v2)
CYC = [V1] + I3 + [V2] + I1 + [V3] + I2   # canonical ccw hull order
FIXED = {V2: ("1", "0")}                  # rotation gauge


def sq(e):
    return f"(* {e} {e})"


def X(i):
    if i in FIXED:
        return FIXED[i]
    return (f"P{i}x", f"P{i}y")


def dist2(i, j):
    (ax, ay), (bx, by) = X(i), X(j)
    return f"(+ {sq(f'(- {ax} {bx})')} {sq(f'(- {ay} {by})')})"


def norm2(i):
    x, y = X(i)
    return f"(+ {sq(x)} {sq(y)})"


def sa2(i, j, k):
    (vx, vy), (jx, jy), (kx, ky) = X(i), X(j), X(k)
    return (f"(- (* (- {jx} {vx}) (- {ky} {vy}))"
            f" (* (- {kx} {vx}) (- {jy} {vy})))")


def inner_at(i, j, k):
    (ix, iy), (jx, jy), (kx, ky) = X(i), X(j), X(k)
    return (f"(+ (* (- {jx} {ix}) (- {kx} {ix}))"
            f" (* (- {jy} {iy}) (- {ky} {iy})))")


def emit(mode, k4_at=None, branch=None):
    """k4_at: list of point indices to enforce boolean-selector K4 at (None =
    all N). branch: explicit 4-subset of indices != V2 asserted at one common
    radius from V2 (replaces boolean K4 at V2; K4 elsewhere per k4_at)."""
    L = ["(set-logic QF_NRA)"]
    for i in range(N):
        if i in FIXED:
            continue
        L.append(f"(declare-fun P{i}x () Real)")
        L.append(f"(declare-fun P{i}y () Real)")
    A = []
    # H_MEC: circumcircle + orientation (reflection gauge) + non-equilateral
    # [WLOG CASE-ASSUMPTION, as in the original] + non-obtuse.
    for v in (V1, V3):
        A.append(f"(assert (= {norm2(v)} 1))")
    A.append(f"(assert (> {sa2(V1, V2, V3)} 0))")
    A.append(f"(assert (not (= {dist2(V1, V2)} {dist2(V2, V3)})))")
    A.append(f"(assert (>= {inner_at(V1, V2, V3)} 0))")
    A.append(f"(assert (>= {inner_at(V2, V3, V1)} 0))")
    A.append(f"(assert (>= {inner_at(V3, V1, V2)} 0))")
    # H_disk
    for i in I1 + I2 + I3:
        A.append(f"(assert (<= {norm2(i)} 1))")
    # H_caps, sign-resolved under sa2(v1,v2,v3) > 0
    for p in I1:
        A.append(f"(assert (<= {sa2(p, V2, V3)} 0))")
    for p in I2:
        A.append(f"(assert (>= {sa2(p, V1, V3)} 0))")
    for p in I3:
        A.append(f"(assert (<= {sa2(p, V1, V2)} 0))")
    # H_convex: strict ccw on all triples of the canonical cyclic order
    n = len(CYC)
    for a in range(n):
        for b in range(a + 1, n):
            for c in range(b + 1, n):
                A.append(f"(assert (> {sa2(CYC[a], CYC[b], CYC[c])} 0))")
    # H_K4
    if mode != "sat-control":
        k4set = list(range(N)) if k4_at is None else list(k4_at)
        if branch is not None:
            assert len(branch) == 4 and V2 not in branch
            k4set = [i for i in k4set if i != V2]
            L.append("(declare-fun r2_v2 () Real)")
            A.append("(assert (> r2_v2 0))")
            for t in branch:
                A.append(f"(assert (= {dist2(V2, t)} r2_v2))")
        for i in k4set:
            rho2 = f"rho2_{i}"
            L.append(f"(declare-fun {rho2} () Real)")
            A.append(f"(assert (> {rho2} 0))")
            sel = []
            for j in range(N):
                if j == i:
                    continue
                s = f"s_{i}_{j}"
                L.append(f"(declare-fun {s} () Bool)")
                A.append(f"(assert (=> {s} (= {dist2(i, j)} {rho2})))")
                sel.append(f"(ite {s} 1 0)")
            A.append("(assert (>= (+ " + " ".join(sel) + ") 4))")
        # not-U1.3 rider on oppCap1 = {v1, v3} + I2 (implied by non-equilateral;
        # kept for faithfulness to the original gate)
        opp = [V1, V3] + I2
        ds = [dist2(p, V2) for p in opp]
        ne = [f"(not (= {ds[a]} {ds[b]}))"
              for a in range(len(ds)) for b in range(a + 1, len(ds))]
        A.append("(assert (or " + " ".join(ne) + "))")
    if mode == "unsat-control":
        (x3, y3), (xv, yv) = X(3), X(V1)
        A.append(f"(assert (and (= {x3} {xv}) (= {y3} {yv})))")
    L += A
    L.append("(check-sat)")
    if mode == "sat-control":
        L.append("(get-model)")
    return "\n".join(L) + "\n"


if __name__ == "__main__":
    mode = sys.argv[1] if len(sys.argv) > 1 else "gate"
    if mode.startswith("k4sweep:"):
        k = int(mode.split(":")[1])
        sys.stdout.write(emit("gate", k4_at=list(range(k))))
    elif mode.startswith("branch:"):
        T = [int(t) for t in mode.split(":")[1].split(",")]
        sys.stdout.write(emit("gate", k4_at=[], branch=T))
    else:
        assert mode in ("gate", "sat-control", "unsat-control"), mode
        sys.stdout.write(emit(mode))

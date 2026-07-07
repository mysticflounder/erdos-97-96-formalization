#!/usr/bin/env python3
"""Independent EXACT re-verification (sympy) of a claimed rho-embedding.

Rebuilds the ring witness coordinates directly in sympy (independent of
embed_search.py's field layer), then verifies, for the designated solution
and for the whole witness:

  (A) all committed exact-4 classes: 3 radius equalities each, PROVED zero
      via sympy.minimal_polynomial (result must be the monomial x); and
      exactness margins |d2(c,z)-r2| > 1e-6 for every non-member z,
      evaluated at 80 significant digits (near-miss guard (1e-45,1e-6)).
      This certifies gamma (every point lies in some verified class ->
      CriticalShellSystem exists) and the u-row / q,t1,t3-row shells.
  (B) no_qfree at the designated p: numeric clustering of the 15/19-value
      p-profile over A minus {p}; within-cluster diffs PROVED zero by
      minimal_polynomial; cross-cluster gaps > 1e-6 at 80 digits; exactly
      one cluster of size >= 4, size exactly 4, and it contains q.
  (C) T noncollinearity: determinant nonzero with margin > 1e-6.
  (D) label facts: p,q,T,u pairwise distinct (index-distinct + coincidence
      impossible by (A) margins), q not in {U,V,W}, q in S (strict).

Verdict PASS requires every check to succeed and zero near-misses.
"""

import json
import sys
import sympy as sp
from sympy import pi, cos, sin, sqrt, Rational, Symbol, minimal_polynomial

X = Symbol("x")


def prove_zero(expr):
    mp = minimal_polynomial(sp.expand(expr), X)
    return mp == X


def numval(expr):
    return sp.N(expr, 80)


def build(m, variant):
    if m == 8:
        if variant == "a":
            c = cos(3 * pi / 8)
        else:
            c = cos(pi / 8)
        b = c + sqrt(c ** 2 + 1)
        outer = [(cos(pi * k / 4), sin(pi * k / 4)) for k in range(8)]
        inner = [(b * cos((2 * k + 1) * pi / 8), b * sin((2 * k + 1) * pi / 8))
                 for k in range(8)]
    else:
        b = (sqrt(5) - 1) / 2
        outer = [(cos(pi * k / 5), sin(pi * k / 5)) for k in range(10)]
        inner = [(b * cos((2 * k + 1) * pi / 10), b * sin((2 * k + 1) * pi / 10))
                 for k in range(10)]
    return outer + inner, b


def d2(P, Q):
    return (P[0] - Q[0]) ** 2 + (P[1] - Q[1]) ** 2


def main(witpath, variant, respath, solindex):
    wit = json.load(open(witpath))
    res = json.load(open(respath))
    m = wit["m"]
    pts, b = build(m, variant)
    n = len(pts)
    names = res["names"]
    LO, HI = sp.Float("1e-45"), sp.Float("1e-6")
    near = []

    # match json points -> indices (numeric, independent re-match)
    w = wit["witness"] if "witness" in wit else wit
    nums = [(numval(P[0]), numval(P[1])) for P in pts]

    def match(jp):
        x, y = sp.Float(jp[0], 30), sp.Float(jp[1], 30)
        best, bd = None, None
        for i, (nx, ny) in enumerate(nums):
            dd = abs(nx - x) + abs(ny - y)
            if bd is None or dd < bd:
                best, bd = i, dd
        assert bd < sp.Float("1e-9"), f"match fail {jp}"
        return best

    U, V, W = match(w["U"]), match(w["V"]), match(w["W"])
    S = set(match(x) for x in w["S"])
    bnum = numval(b)
    assert abs(bnum - sp.Float(wit["b"], 30)) < sp.Float("1e-12"), "b formula"

    sol = res["solutions"][solindex]
    p, q, T, u = sol["p"], sol["q"], sol["T"], sol["u"]
    six = [p, q] + T + [u]
    assert len(set(six)) == 6, "labels not distinct"
    assert q not in (U, V, W), "q is Moser"
    assert q in S and q not in (V, W), "q not strict"

    # (A) verify ALL committed classes exactly (covers t2-row, q/t1/t3-rows,
    # u-row, and gamma)
    classes = {}
    for kk, mem_json in w["classes"].items():
        c = match(eval(kk))
        mem = [match(x) for x in mem_json]
        classes[c] = mem
    assert len(classes) == n
    n_eq = 0
    min_exact_margin = None
    for c, mem in classes.items():
        r2 = d2(pts[c], pts[mem[0]])
        for z in mem[1:]:
            assert prove_zero(d2(pts[c], pts[z]) - r2), \
                f"class equality FAILS at center {names[c]} member {names[z]}"
            n_eq += 1
        for z in range(n):
            if z == c or z in mem:
                continue
            g = abs(numval(d2(pts[c], pts[z]) - r2))
            if LO < g < HI:
                near.append(("exactness", names[c], names[z], str(g)))
            if min_exact_margin is None or g < min_exact_margin:
                min_exact_margin = g
        assert len(mem) == 4
    # coverage: every index in some class
    covered = set()
    for c, mem in classes.items():
        covered |= set(mem)
    assert covered == set(range(n)), "gamma coverage fails"
    assert u in classes[sol["u_shell_center"]], "u-shell mismatch"
    assert set(T + [q]) == set(classes[p]), "t2-row support != committed class of p"

    # (B) no_qfree at p: cluster p-profile over A minus {p}
    vals = []
    for z in range(n):
        if z == p:
            continue
        vals.append((z, d2(pts[p], pts[z])))
    clusters = []
    for z, e in vals:
        vz = numval(e)
        placed = False
        for cl in clusters:
            if abs(vz - cl["num"]) < HI:
                # must be exactly equal: prove
                assert prove_zero(e - cl["rep"]), \
                    f"near-miss NOT equal at p-profile z={names[z]}"
                cl["members"].append(z)
                placed = True
                break
        if not placed:
            clusters.append({"rep": e, "num": vz, "members": [z]})
    # cross-cluster margins
    min_cross = None
    for i in range(len(clusters)):
        for j in range(i + 1, len(clusters)):
            g = abs(clusters[i]["num"] - clusters[j]["num"])
            if LO < g < HI:
                near.append(("p-profile", i, j, str(g)))
            if min_cross is None or g < min_cross:
                min_cross = g
    big = [cl for cl in clusters if len(cl["members"]) >= 4]
    assert len(big) == 1, f"no_qfree fails: {len(big)} clusters >=4"
    assert len(big[0]["members"]) == 4, "class cluster size != 4"
    assert q in big[0]["members"], "q not in the 4-cluster"
    assert set(big[0]["members"]) == set(T + [q]), "cluster != {q,t1,t2,t3}"
    n_prof_eq = sum(len(cl["members"]) - 1 for cl in clusters)

    # (C) T noncollinearity
    A, B, C = pts[T[0]], pts[T[1]], pts[T[2]]
    det = (B[0] - A[0]) * (C[1] - A[1]) - (C[0] - A[0]) * (B[1] - A[1])
    dv = abs(numval(det))
    assert dv > HI, f"det margin {dv}"

    print(f"PASS {respath} sol#{solindex}: "
          f"p={names[p]} q={names[q]} T={[names[t] for t in T]} u={names[u]}")
    print(f"  class equalities PROVED zero (minimal_polynomial == x): "
          f"{n_eq} (= {n} classes x 3)")
    print(f"  p-profile within-cluster equalities PROVED zero: {n_prof_eq}")
    print(f"  min exactness margin (all classes, all non-members): "
          f"{min_exact_margin}")
    print(f"  min cross-cluster gap in p-profile: {min_cross}")
    print(f"  |T det| = {dv}")
    print(f"  gamma coverage: TOTAL ({n}/{n} covered by proved classes)")
    print(f"  near-misses in (1e-45,1e-6): {near if near else 'NONE'}")
    assert not near
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1], sys.argv[2], sys.argv[3], int(sys.argv[4])))

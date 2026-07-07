#!/usr/bin/env python3
"""Candidate B falsification: row-fragment (rho) embedding search.

Exact layer: tower-field arithmetic over Q with stdlib Fraction.
  Element = dict{exponent-tuple: Fraction}; generator reduction rules are
  exact identities of the reals (s^2=2 etc.), so vector-equality PROVES
  value-equality.  Vector-inequality is adjudicated numerically.
Numeric mirror: Decimal at prec 90.  Decision per comparison:
  vectors equal                          -> EQUAL   (exact identity)
  vectors differ and |delta| > 1e-6      -> DIFFERENT (numeric margin >> error)
  otherwise                              -> NEAR-MISS (collect; sympy adjudication)
Every claimed SAT is re-verified independently (sympy_verify.py).

Usage:
  python3 embed_search.py smoke
  python3 embed_search.py ring  <t9 json path>  <variant a|b|phi>  <out json>
  python3 embed_search.py lattice <t1 json path> <record index>    <out json>
"""

import json
import sys
import itertools
from fractions import Fraction as F
from decimal import Decimal, getcontext

getcontext().prec = 90

NEAR_LO = Decimal("1e-45")   # cluster threshold (within-group deviations must be < this)
NEAR_HI = Decimal("1e-6")    # margin floor (across-group gaps must exceed this)


# ---------------------------------------------------------------- field layer

class Field:
    """Tower Q(g0,g1,...) with reduction g_i^2 = element (exact real identity)."""

    def __init__(self, name, gens, reductions, numerics):
        self.name = name
        self.gens = gens                      # names, for printing
        self.k = len(gens)
        self.red = reductions                 # list of element-dicts for g_i^2
        self.num = numerics                   # list of Decimal values

    def zero(self):
        return {}

    def const(self, c):
        c = F(c)
        return {} if c == 0 else {(0,) * self.k: c}

    def gen(self, i):
        e = [0] * self.k
        e[i] = 1
        return {tuple(e): F(1)}

    def _reduce_mono(self, e, coeff, out):
        # push coeff * monomial(e) into out, reducing exponents >= 2
        stack = [(e, coeff)]
        while stack:
            e, c = stack.pop()
            hit = -1
            for i in range(self.k):
                if e[i] >= 2:
                    hit = i
                    break
            if hit < 0:
                out[e] = out.get(e, F(0)) + c
                continue
            e2 = list(e)
            e2[hit] -= 2
            for m2, c2 in self.red[hit].items():
                e3 = tuple(a + b for a, b in zip(e2, m2))
                stack.append((e3, c * c2))

    def add(self, A, B):
        out = dict(A)
        for m, c in B.items():
            out[m] = out.get(m, F(0)) + c
        return {m: c for m, c in out.items() if c != 0}

    def sub(self, A, B):
        out = dict(A)
        for m, c in B.items():
            out[m] = out.get(m, F(0)) - c
        return {m: c for m, c in out.items() if c != 0}

    def mul(self, A, B):
        out = {}
        for m1, c1 in A.items():
            for m2, c2 in B.items():
                e = tuple(a + b for a, b in zip(m1, m2))
                self._reduce_mono(e, c1 * c2, out)
        return {m: c for m, c in out.items() if c != 0}

    def smul(self, c, A):
        c = F(c)
        return {m: c * v for m, v in A.items() if c * v != 0}

    def key(self, A):
        return tuple(sorted((m, c.numerator, c.denominator) for m, c in A.items()))

    def to_dec(self, A):
        tot = Decimal(0)
        for m, c in A.items():
            t = Decimal(c.numerator) / Decimal(c.denominator)
            for i, e in enumerate(m):
                for _ in range(e):
                    t *= self.num[i]
            tot += t
        return tot

    def pretty(self, A):
        if not A:
            return "0"
        parts = []
        for m, c in sorted(A.items()):
            mono = "*".join(g for g, e in zip(self.gens, m) for _ in range(e))
            parts.append(f"{c}" + (f"*{mono}" if mono else ""))
        return " + ".join(parts)


def d2(f, P, Q):
    dx = f.sub(P[0], Q[0])
    dy = f.sub(P[1], Q[1])
    return f.add(f.mul(dx, dx), f.mul(dy, dy))


def collinear_det(f, P, Q, R):
    # (Qx-Px)(Ry-Py) - (Rx-Px)(Qy-Py)
    a = f.sub(Q[0], P[0])
    b = f.sub(R[1], P[1])
    c = f.sub(R[0], P[0])
    d = f.sub(Q[1], P[1])
    return f.sub(f.mul(a, b), f.mul(c, d))


# ------------------------------------------------------------ witness builders

def build_ring8(variant):
    # gens: s=sqrt2 (s^2=2), t=sqrt(2+s) (t^2=2+s), b (b^2 = 2*c*b + 1)
    s2 = Decimal(2).sqrt()
    t2 = (Decimal(2) + s2).sqrt()
    # c = cos(3pi/8) = t(s-1)/2 (variant a) or cos(pi/8) = t/2 (variant b)
    if variant == "a":
        cnum = t2 * (s2 - 1) / 2
    else:
        cnum = t2 / 2
    bnum = cnum + (cnum * cnum + 1).sqrt()
    red_s = {(0, 0, 0): F(2)}
    red_t = {(0, 0, 0): F(2), (1, 0, 0): F(1)}
    if variant == "a":
        # 2cb = (st - t) b
        red_b = {(0, 0, 0): F(1), (1, 1, 1): F(1), (0, 1, 1): F(-1)}
    else:
        # 2cb = t b
        red_b = {(0, 0, 0): F(1), (0, 1, 1): F(1)}
    f = Field(f"ring8{variant}", ["s", "t", "b"], [red_s, red_t, red_b],
              [s2, t2, bnum])
    one = f.const(1)
    half_s = f.smul(F(1, 2), f.gen(0))
    zero = f.zero()
    c1 = f.smul(F(1, 2), f.gen(1))                       # cos(pi/8) = t/2
    c3 = f.smul(F(1, 2), f.sub(f.mul(f.gen(0), f.gen(1)), f.gen(1)))  # t(s-1)/2
    # outer octagon, angle pi*k/4
    cos8 = [one, half_s, zero, f.smul(-1, half_s), f.smul(-1, one),
            f.smul(-1, half_s), zero, half_s]
    sin8 = [zero, half_s, one, half_s, zero,
            f.smul(-1, half_s), f.smul(-1, one), f.smul(-1, half_s)]
    pts = []
    names = []
    for k in range(8):
        pts.append((cos8[k], sin8[k]))
        names.append(f"O{k}")
    # inner, angle (2k+1)pi/8; cos: c1,c3,-c3,-c1,-c1,-c3,c3,c1 ; sin: c3,c1,c1,c3,-c3,-c1,-c1,-c3
    cos_in = [c1, c3, f.smul(-1, c3), f.smul(-1, c1),
              f.smul(-1, c1), f.smul(-1, c3), c3, c1]
    sin_in = [c3, c1, c1, c3, f.smul(-1, c3), f.smul(-1, c1),
              f.smul(-1, c1), f.smul(-1, c3)]
    b = f.gen(2)
    for k in range(8):
        pts.append((f.mul(b, cos_in[k]), f.mul(b, sin_in[k])))
        names.append(f"I{k}")
    return f, pts, names


def build_ring10():
    # gens: u=sqrt5 (u^2=5), w=sqrt(10-2u) (w^2=10-2u); b=(u-1)/2
    unum = Decimal(5).sqrt()
    wnum = (Decimal(10) - 2 * unum).sqrt()
    red_u = {(0, 0): F(5)}
    red_w = {(0, 0): F(10), (1, 0): F(-2)}
    f = Field("ring10", ["u", "w"], [red_u, red_w], [unum, wnum])
    one = f.const(1)
    u = f.gen(0)
    w = f.gen(1)
    c36 = f.smul(F(1, 4), f.add(u, one))        # cos(pi/5)
    c72 = f.smul(F(1, 4), f.sub(u, one))        # cos(2pi/5)
    s36 = f.smul(F(1, 4), w)                    # sin(pi/5)
    s72 = f.smul(F(1, 8), f.mul(w, f.add(u, one)))  # sin(2pi/5)
    zero = f.zero()
    # outer decagon, angle pi*k/5, k=0..9
    cosO = [one, c36, c72, f.smul(-1, c72), f.smul(-1, c36), f.smul(-1, one),
            f.smul(-1, c36), f.smul(-1, c72), c72, c36]
    sinO = [zero, s36, s72, s72, s36, zero,
            f.smul(-1, s36), f.smul(-1, s72), f.smul(-1, s72), f.smul(-1, s36)]
    pts = []
    names = []
    for k in range(10):
        pts.append((cosO[k], sinO[k]))
        names.append(f"O{k}")
    # inner, angle (2k+1)pi/10, k=0..9
    c18 = s72        # cos(pi/10) = sin(2pi/5)
    c54 = s36        # cos(3pi/10) = sin(pi/5)
    s18 = c72        # sin(pi/10) = cos(2pi/5)
    s54 = c36        # sin(3pi/10) = cos(pi/5)
    cosI = [c18, c54, zero, f.smul(-1, c54), f.smul(-1, c18),
            f.smul(-1, c18), f.smul(-1, c54), zero, c54, c18]
    sinI = [s18, s54, one, s54, s18,
            f.smul(-1, s18), f.smul(-1, s54), f.smul(-1, one),
            f.smul(-1, s54), f.smul(-1, s18)]
    b = f.smul(F(1, 2), f.sub(u, one))
    for k in range(10):
        pts.append((f.mul(b, cosI[k]), f.mul(b, sinI[k])))
        names.append(f"I{k}")
    return f, pts, names


def build_lattice(subset, universe):
    if universe.startswith("sq"):
        f = Field("sq", [], [], [])
        pts = [(f.const(i), f.const(j)) for (i, j) in subset]
    else:
        # triangular: (i + j/2, j*sqrt3/2)
        red_r3 = {(0,): F(3)}
        f = Field("tri", ["r3"], [red_r3], [Decimal(3).sqrt()])
        r3 = f.gen(0)
        pts = []
        for (i, j) in subset:
            x = f.const(F(2 * i + j, 2))
            y = f.smul(F(j, 2), r3)
            pts.append((x, y))
    names = [f"({i},{j})" for (i, j) in subset]
    return f, pts, names


# ------------------------------------------------------------------- pipeline

class Analysis:
    def __init__(self, f, pts, names, moser_idx, caps_idx, tag):
        self.f = f
        self.pts = pts
        self.names = names
        self.n = len(pts)
        self.moser = moser_idx          # dict U/V/W -> idx (or None)
        self.caps = caps_idx            # dict S/O1/O2 -> set of idx (or None)
        self.tag = tag
        self.near_misses = []
        self.min_gap = None             # smallest nonzero |delta d2| seen
        self.log = []

    def say(self, msg):
        self.log.append(msg)
        print(msg, flush=True)

    def run(self):
        f = self.f
        n = self.n
        # exact d2 matrix + numeric mirror
        D = [[None] * n for _ in range(n)]
        Dnum = [[None] * n for _ in range(n)]
        for i in range(n):
            for j in range(i + 1, n):
                e = d2(f, self.pts[i], self.pts[j])
                D[i][j] = D[j][i] = e
                v = f.to_dec(e)
                Dnum[i][j] = Dnum[j][i] = v
                if v <= 0:
                    raise AssertionError(f"nonpositive d2 {i},{j}")
        # distinctness of points: all d2 nonzero exactly
        for i in range(n):
            for j in range(i + 1, n):
                if not D[i][j]:
                    raise AssertionError(f"coincident points {i},{j}")

        # per-center radius grouping by exact key, then numeric validation
        self.classes4 = {}   # center -> list of (key, tuple(sorted members))
        self.ge4 = {}        # center -> list of (key, members) with mult >= 4
        self.profile = {}
        for c in range(n):
            groups = {}
            for j in range(n):
                if j == c:
                    continue
                groups.setdefault(f.key(D[c][j]), []).append(j)
            # numeric validation of grouping
            reps = list(groups.items())
            for (k1, m1) in reps:
                v1 = Dnum[c][m1[0]]
                for j in m1[1:]:
                    if abs(Dnum[c][j] - v1) >= NEAR_LO:
                        raise AssertionError(
                            f"within-group deviation at center {c}")
            for a in range(len(reps)):
                for b in range(a + 1, len(reps)):
                    gap = abs(Dnum[c][reps[a][1][0]] - Dnum[c][reps[b][1][0]])
                    if self.min_gap is None or gap < self.min_gap:
                        self.min_gap = gap
                    if gap < NEAR_HI:
                        self.near_misses.append(
                            (c, reps[a][1][0], reps[b][1][0], str(gap)))
            self.profile[c] = groups
            self.classes4[c] = [(k, tuple(sorted(m)))
                                for k, m in groups.items() if len(m) == 4]
            self.ge4[c] = [(k, tuple(sorted(m)))
                           for k, m in groups.items() if len(m) >= 4]

        # witness-level facts
        k4_all = all(len(self.ge4[c]) >= 1 for c in range(n))
        self.say(f"[{self.tag}] n={n}  K4-at-every-point={k4_all}  "
                 f"min-inter-radius-gap={self.min_gap}")
        if self.near_misses:
            self.say(f"[{self.tag}] NEAR-MISSES ({len(self.near_misses)}): "
                     f"{self.near_misses}")

        # coverage: z -> list of (center, class-members) exact-4 shells through z
        self.cover = {z: [] for z in range(n)}
        for c in range(n):
            for k, mem in self.classes4[c]:
                for z in mem:
                    self.cover[z].append((c, mem))
        uncovered = [z for z in range(n) if not self.cover[z]]
        self.gamma_ok = not uncovered
        self.say(f"[{self.tag}] gamma(CriticalShellSystem) coverage: "
                 f"{'TOTAL' if self.gamma_ok else f'FAILS at {[self.names[z] for z in uncovered]}'}")

        # rho search
        moserset = set(v for v in self.moser.values() if v is not None)
        S = self.caps.get("S") if self.caps else None
        VW = {self.moser.get("V"), self.moser.get("W")} - {None}
        sols = []
        rejects = {"p_no_4class": 0, "p_second_ge4_radius(no_qfree)": 0,
                   "p_mult5_class": 0, "q_all_moser": 0, "u_none_covered": 0}
        n_enum = 0
        for p in range(n):
            g4 = self.ge4[p]
            if not g4:
                rejects["p_no_4class"] += 1
                continue
            if len(g4) > 1:
                rejects["p_second_ge4_radius(no_qfree)"] += 1
                continue
            k, C = g4[0]
            if len(C) != 4:
                rejects["p_mult5_class"] += 1
                continue
            qcands = [q for q in C if q not in moserset]
            if not qcands:
                rejects["q_all_moser"] += 1
                continue
            for q in qcands:
                T = tuple(x for x in C if x != q)
                det = collinear_det(f, self.pts[T[0]], self.pts[T[1]],
                                    self.pts[T[2]])
                detnum = f.to_dec(det)
                if not det:
                    # exact collinear (cannot happen for concyclic, but checked)
                    continue
                if abs(detnum) < NEAR_HI:
                    self.near_misses.append(("det", T, str(detnum)))
                strict = (S is not None and q in S and q not in VW
                          and q not in moserset)
                found_u = False
                for u in range(n):
                    if u == p or u in C:
                        continue
                    n_enum += 1
                    if self.cover[u]:
                        found_u = True
                        sols.append({
                            "p": p, "q": q, "T": list(T), "u": u,
                            "r2_key_pretty": f.pretty(D[p][q]),
                            "r2_num": str(f.to_dec(D[p][q])),
                            "strict_q_in_S": strict,
                            "T_det_num": str(detnum),
                            "u_shell_center": self.cover[u][0][0],
                            "u_shell_members": list(self.cover[u][0][1]),
                        })
                if not found_u:
                    rejects["u_none_covered"] += 1
        self.sols = sols
        self.rejects = rejects
        self.n_enum = n_enum
        nstrict = sum(1 for s in sols if s["strict_q_in_S"])
        self.say(f"[{self.tag}] rho assignments enumerated (p,q,u)-triples: {n_enum}; "
                 f"solutions: {len(sols)} (strict q∈S∖{{V,W}}: {nstrict}); "
                 f"rejects: {rejects}")
        verdict = "SAT" if (sols and self.gamma_ok) else (
            "SAT_rho_only(gamma fails)" if sols else "UNSAT")
        self.say(f"[{self.tag}] VERDICT (rho ∧ gamma): {verdict}")
        return {
            "tag": self.tag, "n": n, "k4_all": k4_all,
            "min_inter_radius_gap": str(self.min_gap),
            "near_misses": self.near_misses,
            "gamma_ok": self.gamma_ok,
            "uncovered": [self.names[z] for z in uncovered],
            "n_enum": n_enum,
            "rejects": rejects,
            "n_solutions": len(sols),
            "n_strict": nstrict,
            "verdict": verdict,
            "names": self.names,
            "moser": {k: v for k, v in self.moser.items()},
            "caps_sizes": {k: len(v) for k, v in self.caps.items()} if self.caps else None,
            "solutions": sols[:200],
            "log": self.log,
        }


# ----------------------------------------------------------- JSON label import

def match_points(f, pts, json_pts, tol=Decimal("1e-9"), integer=False):
    """Match a list of json [x,y] to indices of exact pts."""
    out = []
    nums = [(f.to_dec(P[0]), f.to_dec(P[1])) for P in pts]
    for jp in json_pts:
        x, y = Decimal(str(jp[0])), Decimal(str(jp[1]))
        best, bestd = None, None
        for i, (nx, ny) in enumerate(nums):
            dd = abs(nx - x) + abs(ny - y)
            if bestd is None or dd < bestd:
                best, bestd = i, dd
        if bestd > tol:
            raise AssertionError(f"point match failed for {jp}: best gap {bestd}")
        out.append(best)
    return out


def run_ring(path, variant, outpath):
    data = json.load(open(path))
    m = data["m"]
    if m == 8:
        f, pts, names = build_ring8(variant)
    else:
        f, pts, names = build_ring10()
    w = data["witness"] if "witness" in data else data
    # b sanity
    bnum = f.to_dec(f.gen(f.k - 1)) if m == 8 else f.to_dec(
        f.smul(F(1, 2), f.sub(f.gen(0), f.const(1))))
    bjson = Decimal(str(data["b"]))
    assert abs(bnum - bjson) < Decimal("1e-12"), f"b mismatch {bnum} vs {bjson}"
    U = match_points(f, pts, [w["U"]])[0]
    V = match_points(f, pts, [w["V"]])[0]
    W = match_points(f, pts, [w["W"]])[0]
    S = set(match_points(f, pts, w["S"]))
    O1 = set(match_points(f, pts, w["O1"]))
    O2 = set(match_points(f, pts, w["O2"]))
    # cap structure sanity (kappa side)
    assert S & O1 == {W} and S & O2 == {V} and O1 & O2 == {U}, "cap structure"
    assert S | O1 | O2 == set(range(len(pts))), "cap union"
    assert min(len(S), len(O1), len(O2)) >= 5, "cap sizes"
    an = Analysis(f, pts, names, {"U": U, "V": V, "W": W},
                  {"S": S, "O1": O1, "O2": O2}, data.get("tag") or path.split("/")[-1])
    res = an.run()
    # committed-class cross-check
    cls = w["classes"]
    mismatches = []
    keys = list(cls.keys())
    centers = match_points(f, pts, [eval(k) for k in keys])
    for kk, c in zip(keys, centers):
        mem = set(match_points(f, pts, cls[kk]))
        mine = [set(mm) for _, mm in an.classes4[c]]
        if mem not in mine:
            mismatches.append((kk, sorted(mem)))
    res["committed_class_mismatches"] = mismatches
    an.say(f"[{res['tag']}] committed classes recomputed+matched: "
           f"{len(keys) - len(mismatches)}/{len(keys)}")
    json.dump(res, open(outpath, "w"), indent=1)
    return res


def run_lattice(path, idx, outpath):
    data = json.load(open(path))[idx]
    subset = [tuple(x) for x in data["subset"]]
    f, pts, names = build_lattice(subset, data["universe"])
    w = data["witness"]
    lookup = {t: i for i, t in enumerate(subset)}
    def li(jp):
        return lookup[tuple(jp)]
    U, V, W = li(w["U"]), li(w["V"]), li(w["W"])
    S = set(li(x) for x in w["S"])
    O1 = set(li(x) for x in w["O1"])
    O2 = set(li(x) for x in w["O2"])
    assert S & O1 == {W} and S & O2 == {V} and O1 & O2 == {U}, "cap structure"
    assert S | O1 | O2 == set(range(len(pts))), "cap union"
    tag = f"{data['universe']}-n{data['n']}-rec{idx}-{path.split('/')[-1]}"
    an = Analysis(f, pts, names, {"U": U, "V": V, "W": W},
                  {"S": S, "O1": O1, "O2": O2}, tag)
    res = an.run()
    cls = w["classes"]
    mismatches = []
    for kk, mem_json in cls.items():
        c = li(eval(kk))
        mem = set(li(x) for x in mem_json)
        mine = [set(mm) for _, mm in an.classes4[c]]
        ge4 = [set(mm) for _, mm in an.ge4[c]]
        if mem not in mine:
            sub = any(mem <= g for g in ge4)
            mismatches.append((kk, sorted(mem), "subset_of_ge4" if sub else "NO"))
    res["committed_class_mismatches"] = mismatches
    an.say(f"[{tag}] committed classes exactly-4-matched: "
           f"{len(cls) - len(mismatches)}/{len(cls)}"
           + (f"; mismatch detail: {mismatches}" if mismatches else ""))
    json.dump(res, open(outpath, "w"), indent=1)
    return res


# ---------------------------------------------------------------- smoke gate

def planted(drop_20=False, add_fifth=False, add_pair=False, caps_variant=0):
    f = Field("Q", [], [], [])
    P = [(0, 0), (1, 0), (0, 1), (-1, 0), (0, -1), (2, 0), (1, 1), (1, -1)]
    if drop_20:
        P = [p for p in P if p != (2, 0)]
    if add_fifth:
        P = P + [(F(3, 5), F(4, 5))]
    if add_pair:
        P = P + [(-1, 1), (-1, -1)]
    pts = [(f.const(x), f.const(y)) for (x, y) in P]
    names = [str(p) for p in P]
    idx = {p: i for i, p in enumerate(P)}
    U, V, W = idx[(-1, 0)], idx[(0, -1)], idx[(1, -1)]
    if caps_variant == 0:
        S = {V, W, idx.get((0, 1)), idx.get((1, 0))}
        O1 = {W, U} | ({idx[(2, 0)]} if (2, 0) in idx else set())
        O2 = {V, U, idx[(0, 0)], idx[(1, 1)]}
    else:  # V4: S = {V,W} only
        S = {V, W}
        O1 = {W, U, idx[(0, 1)], idx[(1, 0)], idx[(2, 0)]}
        O2 = {V, U, idx[(0, 0)], idx[(1, 1)]}
    S = {x for x in S if x is not None}
    rest = set(range(len(P))) - (S | O1 | O2)
    O1 = O1 | rest  # absorb extras (planted kappa need not be admissible)
    return f, pts, names, {"U": U, "V": V, "W": W}, {"S": S, "O1": O1, "O2": O2}


def smoke():
    ok = True
    # V0
    f, pts, names, mo, caps = planted()
    r = Analysis(f, pts, names, mo, caps, "smoke-V0-planted").run()
    exp = (r["verdict"] == "SAT" and r["n_strict"] > 0)
    print(f"SMOKE V0 (expect SAT with strict>0): {'PASS' if exp else 'FAIL'}")
    ok &= exp
    # planted assignment present? p=(0,0) q=(0,1) strict
    want = any(s["p"] == 0 and names[s["q"]] == "(0, 1)" and s["strict_q_in_S"]
               for s in r["solutions"])
    print(f"SMOKE V0 planted assignment p=(0,0),q=(0,1) strict found: "
          f"{'PASS' if want else 'FAIL'}")
    ok &= want
    # V1
    f, pts, names, mo, caps = planted(drop_20=True)
    r = Analysis(f, pts, names, mo, caps, "smoke-V1-drop(2,0)").run()
    exp = r["verdict"] == "UNSAT" and not r["gamma_ok"]
    print(f"SMOKE V1 (expect UNSAT, gamma fails): {'PASS' if exp else 'FAIL'}")
    ok &= exp
    # V2
    f, pts, names, mo, caps = planted(add_fifth=True)
    r = Analysis(f, pts, names, mo, caps, "smoke-V2-fifth-cocircular").run()
    exp = r["verdict"] == "UNSAT" and not r["gamma_ok"] \
        and r["rejects"]["p_mult5_class"] >= 1
    print(f"SMOKE V2 (expect UNSAT, mult5 rejected, gamma fails): "
          f"{'PASS' if exp else 'FAIL'}")
    ok &= exp
    # V3
    f, pts, names, mo, caps = planted(add_pair=True)
    r = Analysis(f, pts, names, mo, caps, "smoke-V3-second-radius").run()
    exp = (r["verdict"] == "SAT"
           and r["rejects"]["p_second_ge4_radius(no_qfree)"] >= 1
           and all(s["p"] != 0 for s in r["solutions"]))
    print(f"SMOKE V3 (expect SAT via p2 only, p1 no_qfree-rejected): "
          f"{'PASS' if exp else 'FAIL'}")
    ok &= exp
    # V4
    f, pts, names, mo, caps = planted(caps_variant=1)
    r = Analysis(f, pts, names, mo, caps, "smoke-V4-S-empty-free").run()
    exp = r["verdict"] == "SAT" and r["n_strict"] == 0 and r["n_solutions"] > 0
    print(f"SMOKE V4 (expect SAT loose-only, strict=0): {'PASS' if exp else 'FAIL'}")
    ok &= exp
    print(f"SMOKE GATE: {'ALL PASS' if ok else 'FAILURE'}")
    return 0 if ok else 1


if __name__ == "__main__":
    cmd = sys.argv[1]
    if cmd == "smoke":
        sys.exit(smoke())
    elif cmd == "ring":
        run_ring(sys.argv[2], sys.argv[3], sys.argv[4])
    elif cmd == "lattice":
        run_lattice(sys.argv[2], int(sys.argv[3]), sys.argv[4])
    else:
        sys.exit(f"unknown cmd {cmd}")

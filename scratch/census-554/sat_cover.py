#!/usr/bin/env python3
"""SAT coverage encoding for the (5,5,4) census pattern bank (CEGAR side).

Question encoded: does there exist a constrained cube (C1/C2/C4/one-hit at
V,W) that contains NONE of the banked dead patterns?

  UNSAT  ->  every constrained cube contains a banked pattern (coverage).
  SAT    ->  witness cube for the next CEGAR iteration.

Encoding:
  x_{c,k}   center c picks candidate class k (one-hot per center;
            cand[V]/cand[W] pre-filtered by one-hit, so one-hit is structural).
  C2        NAND clauses for candidate pairs with |kp ∩ kq| >= 3.
  C4        Sinz sequential counter <=2 over the incident (c,k) vars per pair.
  pattern   y_{c,M} indicators (x_{c,k} -> y_{c,M} for k ⊇ M); exclusion
            clause  OR_c ¬y_{c,M_c}  per banked pattern instance.

Patterns are added as full AUTOS orbits by the caller (sound without any
symmetry-breaking in the encoding).
"""

import subprocess
from itertools import combinations

import census554_lib as L


class CNF:
    def __init__(self):
        self.n = 0
        self.clauses = []

    def new_var(self):
        self.n += 1
        return self.n

    def add(self, cl):
        self.clauses.append(cl)

    def le_k_sinz(self, xs, k):
        """Sinz sequential-counter encoding of sum(xs) <= k."""
        m = len(xs)
        if m <= k:
            return
        s = [[self.new_var() for _ in range(k)] for _ in range(m)]
        self.add([-xs[0], s[0][0]])
        for j in range(1, k):
            pass  # s[0][j] unconstrained (>=2 of first 1 impossible; free)
        for i in range(1, m):
            self.add([-xs[i], s[i][0]])
            self.add([-s[i - 1][0], s[i][0]])
            for j in range(1, k):
                self.add([-xs[i], -s[i - 1][j - 1], s[i][j]])
                self.add([-s[i - 1][j], s[i][j]])
            self.add([-xs[i], -s[i - 1][k - 1]])


class CoverInstance:
    def __init__(self):
        self.cand = {p: L.candidates(p) for p in range(L.N)}
        self.cnf = CNF()
        # x vars
        self.x = {}
        for p in range(L.N):
            for idx, k in enumerate(self.cand[p]):
                self.x[(p, idx)] = self.cnf.new_var()
        self._build_onehot()
        self._build_c2()
        self._build_c4()
        self.base_nvars = self.cnf.n
        self.base_nclauses = len(self.cnf.clauses)
        # pattern machinery
        self.y = {}          # (c, frozenset M) -> var (with defining clauses)
        self.excl = []       # exclusion clauses (one per banked pattern instance)

    def _build_onehot(self):
        for p in range(L.N):
            xs = [self.x[(p, i)] for i in range(len(self.cand[p]))]
            self.cnf.add(xs)                     # at least one
            self.cnf.le_k_sinz(xs, 1)            # at most one

    def _build_c2(self):
        masks = {p: [sum(1 << b for b in k) for k in self.cand[p]]
                 for p in range(L.N)}
        cnt = 0
        for p, q in combinations(range(L.N), 2):
            mp, mq = masks[p], masks[q]
            for i, mi in enumerate(mp):
                vi = self.x[(p, i)]
                for j, mj in enumerate(mq):
                    if bin(mi & mj).count("1") > 2:
                        self.cnf.add([-vi, -self.x[(q, j)]])
                        cnt += 1
        self.n_c2_clauses = cnt

    def _build_c4(self):
        incident = {e: [] for e in L.ALL_PAIRS}
        for p in range(L.N):
            for idx, k in enumerate(self.cand[p]):
                for e in combinations(sorted(k), 2):
                    incident[e].append(self.x[(p, idx)])
        for e, xs in incident.items():
            self.cnf.le_k_sinz(xs, 2)

    def y_var(self, c, M):
        M = frozenset(M)
        key = (c, M)
        if key in self.y:
            return self.y[key]
        v = self.cnf.new_var()
        self.y[key] = v
        for idx, k in enumerate(self.cand[c]):
            if M <= k:
                self.cnf.add([-self.x[(c, idx)], v])
        return v

    def add_pattern_instance(self, pat):
        """pat: dict {center: frozenset members}.  Adds one exclusion clause."""
        cl = [-self.y_var(c, M) for c, M in sorted(pat.items())]
        self.excl.append(cl)

    def dimacs(self):
        lines = [f"p cnf {self.cnf.n} {len(self.cnf.clauses) + len(self.excl)}"]
        for cl in self.cnf.clauses:
            lines.append(" ".join(map(str, cl)) + " 0")
        for cl in self.excl:
            lines.append(" ".join(map(str, cl)) + " 0")
        return "\n".join(lines) + "\n"

    def solve(self, path, extra_clauses=None, timeout=600):
        with open(path, "w") as f:
            f.write(self.dimacs())
            if extra_clauses:
                for cl in extra_clauses:
                    f.write(" ".join(map(str, cl)) + " 0\n")
        # patch header if extra clauses present
        if extra_clauses:
            data = open(path).read().split("\n")
            head = data[0].split()
            head[3] = str(int(head[3]) + len(extra_clauses))
            data[0] = " ".join(head)
            with open(path, "w") as f:
                f.write("\n".join(data))
        try:
            pr = subprocess.run(["cadical", "-q", path], capture_output=True,
                                text=True, timeout=timeout)
        except subprocess.TimeoutExpired:
            return "TIMEOUT", None
        out = pr.stdout
        if "s UNSATISFIABLE" in out:
            return "UNSAT", None
        if "s SATISFIABLE" not in out:
            return "ERR", out[-500:]
        pos = set()
        for ln in out.splitlines():
            if ln.startswith("v "):
                for tok in ln[2:].split():
                    v = int(tok)
                    if v > 0:
                        pos.add(v)
        cube = {}
        for p in range(L.N):
            chosen = [i for i in range(len(self.cand[p]))
                      if self.x[(p, i)] in pos]
            assert len(chosen) == 1, (p, len(chosen))
            cube[p] = sorted(self.cand[p][chosen[0]])
        return "SAT", cube


SCRATCH = ("/private/tmp/claude-501/-Users-adam-projects-math-projects-"
           "erdos-97-96-formalization/fe6e52a9-1de1-4034-b676-5c7e83aecbac/"
           "scratchpad")


def smoke():
    import os
    os.makedirs(SCRATCH, exist_ok=True)
    inst = CoverInstance()
    print(f"[sat] base: {inst.cnf.n} vars, {len(inst.cnf.clauses)} clauses "
          f"(C2 nand: {inst.n_c2_clauses})")
    print(f"[sat] candidate counts: V={len(inst.cand[L.V])} (expect 43), "
          f"W={len(inst.cand[L.W])} (expect 16), U={len(inst.cand[L.U])} (210)")
    assert len(inst.cand[L.V]) == 43 and len(inst.cand[L.W]) == 16
    tmp = f"{SCRATCH}/census554_smoke.cnf"
    # 1) bank empty -> SAT, witness must satisfy full python-side constraints
    res, cube = inst.solve(tmp)
    assert res == "SAT", res
    assert L.cube_ok(cube), f"SAT witness violates constraints: {cube}"
    print("[sat] gate 1 PASS: empty-bank SAT witness satisfies C1/C2/C4/one-hit")
    # 2) exclude that exact cube as an 11-center pattern -> witness changes
    pat = {c: frozenset(cube[c]) for c in range(L.N)}
    inst.add_pattern_instance(pat)
    res2, cube2 = inst.solve(tmp)
    assert res2 == "SAT" and cube2 != cube, (res2, cube2 == cube)
    assert L.cube_ok(cube2)
    print("[sat] gate 2 PASS: full-cube pattern exclusion forces a new witness")
    # 3) force a known C2 violation via unit clauses -> must be UNSAT
    k0 = next(i for i, k in enumerate(inst.cand[3]) if k == frozenset({0, 1, 2, 6}))
    k1 = next(i for i, k in enumerate(inst.cand[4]) if k == frozenset({0, 1, 2, 7}))
    res3, _ = inst.solve(tmp, extra_clauses=[[inst.x[(3, k0)]], [inst.x[(4, k1)]]])
    assert res3 == "UNSAT", f"C2 encoding broken: {res3}"
    print("[sat] gate 3 PASS: forced |K_3 ∩ K_4| = 3 is UNSAT (C2)")
    # 4) force pair {0,1} into the classes of 3 centers -> must be UNSAT (C4)
    forced = []
    for c in (3, 4, 5):
        ks = [i for i, k in enumerate(inst.cand[c]) if {0, 1} <= k]
        # pick pairwise-C2-compatible classes containing {0,1}
        forced.append((c, ks))
    picks = {}
    import itertools
    for i3, i4, i5 in itertools.product(*[ks for _, ks in forced]):
        k3, k4, k5 = inst.cand[3][i3], inst.cand[4][i4], inst.cand[5][i5]
        if len(k3 & k4) <= 2 and len(k3 & k5) <= 2 and len(k4 & k5) <= 2:
            picks = {3: i3, 4: i4, 5: i5}
            break
    assert picks, "no C2-compatible triple found for gate 4"
    res4, _ = inst.solve(tmp, extra_clauses=[[inst.x[(c, i)]]
                                             for c, i in picks.items()])
    assert res4 == "UNSAT", f"C4 encoding broken: {res4}"
    print("[sat] gate 4 PASS: pair {0,1} in 3 classes is UNSAT (C4)")
    # 5) sub-mask pattern exclusion: ban {0,1} ⊆ K_3 (single-center pattern),
    #    then force a class at 3 containing {0,1} -> UNSAT
    inst2 = CoverInstance()
    inst2.add_pattern_instance({3: frozenset({0, 1})})
    ks = [i for i, k in enumerate(inst2.cand[3]) if {0, 1} <= k]
    res5, _ = inst2.solve(tmp, extra_clauses=[[inst2.x[(3, ks[0])]]])
    assert res5 == "UNSAT", f"pattern indicator encoding broken: {res5}"
    res5b, cube5 = inst2.solve(tmp)
    assert res5b == "SAT" and not ({0, 1} <= set(cube5[3]))
    print("[sat] gate 5 PASS: sub-mask pattern exclusion semantics correct")
    print("[sat] ALL ENCODING GATES PASS")


if __name__ == "__main__":
    smoke()

"""Layer-1 incidence encoder for the A-core rigid221-physical-apex-chain
package.

Implements ``census/frontier-packages/A-CORE-ENCODING-SPEC.md`` sections 1-4
exactly (every clause-emitting block below carries the spec's tag in a
comment).  Reuses ``census/card_head/sat_encoding.py``'s ``CNF`` class
(``new_variable``/``add_clause``/``at_most_sinz``) and ``solve_cadical`` by
import.  ``solve_cadical`` is written against a ``CoverInstance``-shaped
object; rather than repurpose that AHEAD-specific class (it hard-codes a
candidate-cube cover problem that has nothing to do with this package),
``RunInstance`` below is a small duck-typed adapter exposing exactly the two
methods ``solve_cadical`` actually calls: ``.dimacs(extra_clauses)`` and
``.decode_model(positive_variables)``.

SOUNDNESS DISCIPLINE (binding, per spec): a clause may only assert what the
package hypotheses prove.  Every clause-emitting call below is commented with
its spec tag.  Genuine spec ambiguities encountered during implementation are
called out in comments tagged AMBIGUITY and are also logged in RESULTS.md
verbatim with the offending spec line quoted.
"""

from __future__ import annotations

import sys
from itertools import combinations
from pathlib import Path
from typing import Any, Collection, Sequence

_REPO_ROOT = Path(__file__).resolve().parents[3]
if str(_REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(_REPO_ROOT))

from census.card_head.sat_encoding import (  # noqa: E402
    CNF,
    CadicalResult,
    EncodingError,
    solve_cadical,
)

__all__ = [
    "CNF",
    "CadicalResult",
    "EncodingError",
    "solve_cadical",
    "LABELS",
    "OUT",
    "EQ_PAIRS",
    "SHELL_GROUP",
    "FRONTIER_GROUP",
    "MOSER_GROUP",
    "ACoreEncoder",
    "RunInstance",
]

# ---------------------------------------------------------------------------
# Section 1: point universe (13 labels)
# ---------------------------------------------------------------------------

LABELS: tuple[str, ...] = (
    "a0", "a1", "a2", "zd", "u", "xu", "v", "xv", "oth", "qh", "wh", "f1", "f2",
)

# Sentinel blocker-map target: b(x, OUT) = "beta(x) has no witness among the
# 13 labels".  Not a label: never gets eq/moser/cap/cl1/inT/row atoms.
OUT = "OUT"

MOSER_GROUP: tuple[str, ...] = ("a0", "a1", "a2")
SHELL_GROUP: tuple[str, ...] = ("zd", "u", "xu", "v", "xv")
FRONTIER_GROUP: tuple[str, ...] = ("qh", "wh", "f1", "f2")
BAKED_GROUPS: tuple[tuple[str, ...], ...] = (MOSER_GROUP, SHELL_GROUP, FRONTIER_GROUP)

# Explicit eq-atom list, transcribed verbatim from spec section 1 ("Explicit
# list: {qh,wh}x{zd,xu,xv,v}; {f1,f2}x{zd,xu,xv,v,oth,a0,a2}; oth x
# {zd,v,xv}; {a0,a1}x{zd,xu,xv}; a0x{qh,wh}; vx{a0,a1}.").  Every unordered
# label pair NOT covered here is baked pairwise distinct (no eq atom).
_EQ_GROUPS: tuple[tuple[tuple[str, ...], tuple[str, ...]], ...] = (
    (("qh", "wh"), ("zd", "xu", "xv", "v")),
    (("f1", "f2"), ("zd", "xu", "xv", "v", "oth", "a0", "a2")),
    (("oth",), ("zd", "v", "xv")),
    (("a0", "a1"), ("zd", "xu", "xv")),
    (("a0",), ("qh", "wh")),
    (("v",), ("a0", "a1")),
)


def _build_eq_pairs() -> frozenset[frozenset[str]]:
    pairs: set[frozenset[str]] = set()
    for left_group, right_group in _EQ_GROUPS:
        for left in left_group:
            for right in right_group:
                if left == right:
                    raise EncodingError(f"eq group self-pairs label {left}")
                pairs.add(frozenset((left, right)))
    return frozenset(pairs)


EQ_PAIRS: frozenset[frozenset[str]] = _build_eq_pairs()

_ALL_LABEL_PAIRS = frozenset(frozenset(pair) for pair in combinations(LABELS, 2))
BAKED_DISTINCT_PAIRS: frozenset[frozenset[str]] = _ALL_LABEL_PAIRS - EQ_PAIRS


class ACoreEncoder:
    """Builds the shared 'base' CNF (spec section 1-2 minus (DEL2)) plus the
    stashed (DEL2), leaf-delta (section 4), and A1-extension clause lists.
    """

    MAXN = 24
    INT_VARS: tuple[str, ...] = ("nSig", "nO1", "nO2", "n")
    B_DOMAIN: tuple[str, ...] = ("u", "v", "zd", "xu", "xv", "oth", "qh", "wh")
    DEL_DOMAIN: tuple[str, ...] = ("zd", "u", "xu", "v", "xv")
    CD_DOMAIN: tuple[str, ...] = ("zd", "u", "xu", "v", "xv", "qh", "wh", "f1", "f2")

    def __init__(self) -> None:
        self.cnf = CNF()
        self.names: dict[str, int] = {}
        self.by_var: dict[int, str] = {}

        self.eq: dict[frozenset[str], int] = {}
        self.moser: dict[str, int] = {}
        self.inSig: dict[str, int] = {}
        self.inO1i: dict[str, int] = {}
        self.inO2i: dict[str, int] = {}
        self.cl1: dict[str, int] = {}
        self.inT: dict[str, int] = {}
        self.row_u: dict[str, int] = {}
        self.row_v: dict[str, int] = {}
        self.b: dict[tuple[str, str], int] = {}
        self.sv: dict[str, int] = {}
        self.del_: dict[str, int] = {}
        self.bs1: dict[str, int] = {}
        self.bs2: dict[str, int] = {}
        self.bt1: dict[str, int] = {}
        self.bt2: dict[str, int] = {}
        self.s5a = 0
        self.s5b = 0
        self.s6a = 0
        self.s6b = 0
        self.s6c = 0
        self.int_val: dict[str, dict[int, int]] = {}

        self.del2_clauses: list[tuple[int, ...]] = []
        self.a1_names: dict[str, Any] = {}

        self._build()
        # Frozen snapshot: everything added to self.cnf up to this point is
        # exactly section 1-2 minus (DEL2).  Nothing added after this line
        # (leaf deltas are returned as separate lists; the A1 extension is
        # built on demand, after every other run) mutates this prefix.
        self.base_clauses: tuple[tuple[int, ...], ...] = tuple(self.cnf.clauses)

    # -- bookkeeping ---------------------------------------------------

    def _new(self, name: str) -> int:
        if name in self.names:
            raise EncodingError(f"duplicate atom name {name}")
        var = self.cnf.new_variable()
        self.names[name] = var
        self.by_var[var] = name
        return var

    def add(self, *literals: int) -> None:
        self.cnf.add_clause(literals)

    def _eq_var(self, p: str, q: str) -> int | None:
        if p == q:
            return None
        return self.eq.get(frozenset((p, q)))

    def _eq_targets(self, p: str, targets: Sequence[str]) -> list[tuple[str, int]]:
        found: list[tuple[str, int]] = []
        for t in targets:
            v = self._eq_var(p, t)
            if v is not None:
                found.append((t, v))
        return found

    # -- top-level build order ------------------------------------------

    def _build(self) -> None:
        self._build_eq()
        self._build_moser()
        self._build_cap()
        self._build_cl1()
        self._build_inT()
        self._build_rows()
        self._build_del()
        self._build_blocker()
        self._build_sv()
        self._build_cd()
        self._build_s5()
        self._build_integers()
        self._build_eq_consistency()

    # -- eq atoms ---------------------------------------------------------

    def _build_eq(self) -> None:
        for pair in sorted(EQ_PAIRS, key=lambda fs: tuple(sorted(fs))):
            p, q = sorted(pair)
            self.eq[pair] = self._new(f"eq({p},{q})")

    # -- moser(p) definition (section 2, "Cap interiors" preamble) --------

    def _build_moser(self) -> None:
        for m in MOSER_GROUP:
            v = self._new(f"moser({m})")
            self.moser[m] = v
            self.add(v)  # moser(a0)=moser(a1)=moser(a2)=T
        for p in LABELS:
            if p in MOSER_GROUP:
                continue
            v = self._new(f"moser({p})")
            self.moser[p] = v
            targets = self._eq_targets(p, MOSER_GROUP)
            if not targets:
                self.add(-v)  # no eq atom to a Moser label -> moser(p)=F
                continue
            # moser(p) <-> OR eq(p, a_i)
            self.add(-v, *[ev for _, ev in targets])
            for _, ev in targets:
                self.add(-ev, v)

    # -- (CAP1)/(CAP2) + interior units -----------------------------------

    def _build_cap(self) -> None:
        for p in LABELS:
            sig = self._new(f"inSig({p})")
            o1 = self._new(f"inO1i({p})")
            o2 = self._new(f"inO2i({p})")
            self.inSig[p], self.inO1i[p], self.inO2i[p] = sig, o1, o2
            m = self.moser[p]
            # (CAP1) ~moser(p) -> exactly-one(inSig,inO1i,inO2i)
            self.add(m, sig, o1, o2)
            self.add(m, -sig, -o1)
            self.add(m, -sig, -o2)
            self.add(m, -o1, -o2)
            # (CAP2) moser(p) -> ~inSig(p) & ~inO1i(p) & ~inO2i(p)
            self.add(-m, -sig)
            self.add(-m, -o1)
            self.add(-m, -o2)
        # Units: inO2i(u)=T (C2)+(P3); inO2i(oth)=T (C7); inO1i(qh)=inO1i(wh)=T (E7)
        self.add(self.inO2i["u"])
        self.add(self.inO2i["oth"])
        self.add(self.inO1i["qh"])
        self.add(self.inO1i["wh"])

    # -- (CL1) frontier class cl1(p) ---------------------------------------

    def _build_cl1(self) -> None:
        for p in LABELS:
            self.cl1[p] = self._new(f"cl1({p})")
        # Units [(E4)+(E7)]
        for p in FRONTIER_GROUP:
            self.add(self.cl1[p])
        self.add(-self.cl1["a1"])  # (r>0)
        self.add(-self.cl1["u"])  # (C3)+(P3)
        # (CL1) exactness [E4]: for every other label p,
        # cl1(p) -> OR eq(p,t) over p's existing eq atoms to {qh,wh,f1,f2};
        # degenerates to a unit ~cl1(p) when no such eq atom exists.
        # (The converse direction, cl1(t)=T & eq(p,t) -> cl1(p), is supplied
        # generically by (EQ3) congruence in _build_eq_consistency, since
        # cl1 is one of the unrestricted unary families there -- no need to
        # duplicate it here.)
        for p in LABELS:
            if p in FRONTIER_GROUP:
                continue
            targets = self._eq_targets(p, FRONTIER_GROUP)
            v = self.cl1[p]
            if not targets:
                self.add(-v)
            else:
                self.add(-v, *[ev for _, ev in targets])

    # -- (T1) physical class inT(p) -----------------------------------------

    def _build_inT(self) -> None:
        for p in LABELS:
            self.inT[p] = self._new(f"inT({p})")
        # Units [(G1)+Remark]
        for p in SHELL_GROUP:
            self.add(self.inT[p])
        self.add(-self.inT["a2"])  # (B3)
        # (T1) exactness [(B9)+(G1)], same one-directional pattern as (CL1);
        # converse via (EQ3).
        for p in LABELS:
            if p in SHELL_GROUP:
                continue
            targets = self._eq_targets(p, SHELL_GROUP)
            v = self.inT[p]
            if not targets:
                self.add(-v)
            else:
                self.add(-v, *[ev for _, ev in targets])

    # -- rows: row_u, row_v --------------------------------------------------

    def _build_rows(self) -> None:
        for p in LABELS:
            self.row_u[p] = self._new(f"row_u({p})")
            self.row_v[p] = self._new(f"row_v({p})")
        # Units row_u: T on u,xu [I_u={u,xu}]; F on v (B6), zd (J3),
        # oth (C8)+(P3).
        # AMBIGUITY: spec's row_u bullet ends "...oth (C8)+(P3), a1? no --
        # see (RB2)." (RB2) is never defined anywhere in this spec document
        # (dangling tag).  Read literally, the bullet's own F-list is only
        # {v,zd,oth}; a1 is explicitly NOT in that list ("a1? no").
        # Resolution: leave row_u(a1) UNCONSTRAINED (do not add a unit),
        # matching the bullet's literal F-list and avoiding an improvised
        # constraint from an undefined tag.  Logged verbatim in RESULTS.md.
        self.add(self.row_u["u"])
        self.add(self.row_u["xu"])
        for p in ("v", "zd", "oth"):
            self.add(-self.row_u[p])
        # Units row_v: T on v,xv; F on u (B6), zd (J3).  Spec states no
        # further row_v units (unlike row_u it does not mention oth or a1);
        # left unconstrained per the same discipline.
        self.add(self.row_v["v"])
        self.add(self.row_v["xv"])
        for p in ("u", "zd"):
            self.add(-self.row_v[p])
        # (R1) at-most-4 over the pairwise-distinct shell set, for row_u and
        # row_v alike.
        self.cnf.at_most_sinz([self.row_u[p] for p in SHELL_GROUP], 4)
        self.cnf.at_most_sinz([self.row_v[p] for p in SHELL_GROUP], 4)
        # (R2): no clause -- already fixed by units (comment only, per spec).
        # (R3) cl1(v) -> (row_v(p) <-> cl1(p)) for all p.  The u-side analog
        # is moot (cl1(u)=F is already a hard unit) and is skipped per the
        # spec's own note.
        cl1v = self.cl1["v"]
        for p in LABELS:
            self.add(-cl1v, -self.row_v[p], self.cl1[p])
            self.add(-cl1v, self.row_v[p], -self.cl1[p])

    # -- deletion set del(p) -------------------------------------------------

    def _build_del(self) -> None:
        for p in self.DEL_DOMAIN:
            self.del_[p] = self._new(f"del({p})")
        # (DEL1) at-least-one [(G3)] -- base, unconditional.
        self.add(*[self.del_[p] for p in self.DEL_DOMAIN])
        # (DEL2) at-least-two -- package-only (gamma=a2 activates it);
        # stashed, NOT added to self.cnf here.  Encoded as: for each p,
        # del(p) -> OR_{q!=p} del(q), which combined with (DEL1) forces
        # |Delta|>=2.
        del2: list[tuple[int, ...]] = []
        for p in self.DEL_DOMAIN:
            others = [self.del_[q] for q in self.DEL_DOMAIN if q != p]
            del2.append((-self.del_[p], *others))
        self.del2_clauses = del2
        # |Delta|<=5 auto (5 labels total) -- no clause needed.

    # -- blocker map b(x,y) ---------------------------------------------------

    def _build_blocker(self) -> None:
        y_targets = list(LABELS) + [OUT]
        for x in self.B_DOMAIN:
            for y in y_targets:
                self.b[(x, y)] = self._new(f"b({x},{y})")
        # (BM1) exactly-one over y [beta functional]
        for x in self.B_DOMAIN:
            vs = [self.b[(x, y)] for y in y_targets]
            self.add(*vs)
            self.cnf.at_most_sinz(vs, 1)
        # (BM2) ~b(x,x); under eq: eq(p,q) -> ~b(p,q) (both orderings, when
        # the source side is in B_DOMAIN).
        for x in self.B_DOMAIN:
            self.add(-self.b[(x, x)])
        for pair in EQ_PAIRS:
            p, q = tuple(pair)
            ev = self.eq[pair]
            if p in self.B_DOMAIN:
                self.add(-ev, -self.b[(p, q)])
            if q in self.B_DOMAIN:
                self.add(-ev, -self.b[(q, p)])
        # (BM3) ~b(x,a2) for all x.  "also ~b(x,y) for y with eq(y,a2)" is
        # supplied generically by (EQ3)'s y-side beta congruence below; no
        # separate clause needed here.
        for x in self.B_DOMAIN:
            self.add(-self.b[(x, "a2")])
        # (BM4) H* pattern: b(x,a1) <-> cl1(x), for x in B_DOMAIN.  This
        # already derives b(qh,a1)=b(wh,a1)=T and ~b(x,a1) for cl1(x)=F
        # labels -- no separate units needed.
        for x in self.B_DOMAIN:
            bx = self.b[(x, "a1")]
            cx = self.cl1[x]
            self.add(-bx, cx)
            self.add(-cx, bx)
        # (BM5) center not in own row.
        for y in LABELS:
            self.add(-self.b[("u", y)], -self.row_u[y])
            self.add(-self.b[("v", y)], -self.row_v[y])
        # (BM6) (P2): beta(u) in {zd,v,xv}.
        self.add(self.b[("u", "zd")], self.b[("u", "v")], self.b[("u", "xv")])
        # (BM7) (C9): beta(source) != beta(other).
        # AMBIGUITY: spec says "for each y" without restricting the b-range,
        # which formally includes OUT (b(x,OUT) = "x has no blocker").
        # Forcing u,oth to not BOTH be unblocked is not something (C9)'s
        # prose (a distinctness of *witness points*) proves; per the
        # soundness discipline ("a clause may only assert what the
        # hypotheses prove") we resolve y to the 13 LABELS ONLY, excluding
        # OUT, for (BM7)/(BM8)/(BM9) -- the more conservative reading.
        # Logged in RESULTS.md.
        for y in LABELS:
            self.add(-self.b[("u", y)], -self.b[("oth", y)])
        # (BM8) (J4): beta(u) != beta(v). Same y-domain resolution as (BM7).
        for y in LABELS:
            self.add(-self.b[("u", y)], -self.b[("v", y)])
        # (BM9) (J5)/(J6): beta(zd) != beta(u), beta(zd) != beta(v).
        # ~b(zd,a2) already covered by (BM3). Same y-domain resolution.
        for y in LABELS:
            self.add(-self.b[("zd", y)], -self.b[("u", y)])
            self.add(-self.b[("zd", y)], -self.b[("v", y)])

    # -- survival atoms sv(p) -------------------------------------------------

    def _build_sv(self) -> None:
        for p in LABELS:
            v = self._new(f"sv({p})")
            self.sv[p] = v
            self.add(v)  # (SV1) all units True

    # -- CD witness sets bs1/bs2 (J5) and bt1/bt2 (J6) -------------------------

    def _build_cd(self) -> None:
        for family_name in ("bs1", "bs2", "bt1", "bt2"):
            table: dict[str, int] = {}
            for p in self.CD_DOMAIN:
                table[p] = self._new(f"{family_name}({p})")
            getattr(self, family_name).update(table)
        # (CD1) ~bs1(zd), ~bs2(zd); identical for bt1,bt2.
        for family_name in ("bs1", "bs2", "bt1", "bt2"):
            self.add(-getattr(self, family_name)["zd"])
        # (CD2) at-most-4 over the 5-set {zd,u,xu,v,xv} and (vacuous,
        # 4-of-4) over {qh,wh,f1,f2}, for each of bs1,bs2,bt1,bt2.
        for family_name in ("bs1", "bs2", "bt1", "bt2"):
            family = getattr(self, family_name)
            self.cnf.at_most_sinz([family[p] for p in SHELL_GROUP], 4)
            self.cnf.at_most_sinz([family[p] for p in FRONTIER_GROUP], 4)
        # (CD3) overlap <= 2 over the 5-set, via product atoms; identical
        # schema for the (J6) trio (bt1,bt2).
        for name1, name2 in (("bs1", "bs2"), ("bt1", "bt2")):
            fam1, fam2 = getattr(self, name1), getattr(self, name2)
            prods = []
            for p in SHELL_GROUP:
                and_v = self._new(f"and_{name1}_{name2}({p})")
                self.add(-and_v, fam1[p])
                self.add(-and_v, fam2[p])
                self.add(-fam1[p], -fam2[p], and_v)
                prods.append(and_v)
            self.cnf.at_most_sinz(prods, 2)

    # -- S5 radius-classification arms -----------------------------------------

    def _build_s5(self) -> None:
        self.s5a = self._new("s5a")
        self.s5b = self._new("s5b")
        self.add(self.s5a, self.s5b)  # (S5A)
        self.add(-self.s5b)  # (S5B)

    # -- integer layer ------------------------------------------------------

    def _build_int_var(self, name: str) -> dict[int, int]:
        vals: dict[int, int] = {}
        for i in range(self.MAXN + 1):
            vals[i] = self._new(f"{name}={i}")
        self.int_val[name] = vals
        vs = list(vals.values())
        self.add(*vs)  # at-least-one
        self.cnf.at_most_sinz(vs, 1)  # at-most-one -> exactly-one (unary/direct value encoding)
        return vals

    def _int_ge(self, name: str, threshold: int, trigger: int | None = None) -> None:
        """Assert name>=threshold, optionally gated by `trigger`."""
        vals = self.int_val[name]
        for i in range(min(threshold, self.MAXN + 1)):
            if trigger is None:
                self.add(-vals[i])
            else:
                self.add(-trigger, -vals[i])

    def _int_eq(self, name: str, value: int, trigger: int) -> None:
        """Assert trigger -> name==value.  Relies on name's own exactly-one
        to force every other value false -- avoids enumerating 24 bans."""
        self.add(-trigger, self.int_val[name][value])

    def _build_integers(self) -> None:
        for name in self.INT_VARS:
            self._build_int_var(name)
        sig, o1, o2, n = (self.int_val[k] for k in self.INT_VARS)
        # (N1) n = nSig + nO1 + nO2 + 3.  One-directional implication per
        # in-range combo suffices given each var's own exactly-one (see
        # module docstring / RESULTS.md for the argument).  Combos whose sum
        # would overflow MAXN are explicitly FORBIDDEN rather than left
        # unconstrained: since n itself is capped at MAXN and N1 asserts a
        # genuine equality, nSig+nO1+nO2+3 > MAXN is provably infeasible
        # (n could never equal it), not merely "out of representable range".
        # Leaving those combos open let CaDiCaL land on a degenerate
        # nSig=nO1=nO2=n=MAXN witness that does not actually satisfy N1;
        # this closes that gap without adding a new clause family (it is
        # the other half of the same N1 equality, not an improvisation).
        # Full cube i,j,k in [0,MAXN]^3 (each var's own domain) -- 15625
        # iterations, trivial in Python; avoids any partial-range bug.
        for i in range(self.MAXN + 1):
            for j in range(self.MAXN + 1):
                for k in range(self.MAXN + 1):
                    total = i + j + k + 3
                    if total > self.MAXN:
                        self.add(-sig[i], -o1[j], -o2[k])
                    else:
                        self.add(-sig[i], -o1[j], -o2[k], n[total])
        # (N2) n >= 12 (B1)
        self._int_ge("n", 12)
        # (N3) nO1 >= 2 [(S3)]
        self._int_ge("nO1", 2)
        # (N4) nO2 >= 3 [(S4)]
        self._int_ge("nO2", 3)
        # (N5) nSig >= 3 [packet S]
        self._int_ge("nSig", 3)
        # (N6) S6 arms
        self.s6a = self._new("s6a")
        self.s6b = self._new("s6b")
        self.s6c = self._new("s6c")
        self.add(self.s6a, self.s6b, self.s6c)
        self._int_ge("nSig", 4, trigger=self.s6a)
        self._int_eq("nSig", 3, self.s6b)
        self._int_ge("nO1", 3, trigger=self.s6b)
        self._int_eq("nSig", 3, self.s6c)
        self._int_eq("nO1", 2, self.s6c)
        self._int_ge("nO2", 4, trigger=self.s6c)
        # (N7) membership -> count lower link for nO2 from the five shell
        # inO2i atoms.  For each k in 1..5 and each size-k subset S: if all
        # of S true then nO2>=k, i.e. ban nO2=k-1.  (Minimal correct set:
        # only i=k-1 is banned per subset, not every i<k -- monotonicity of
        # the "ban values below k" pattern for smaller subsets is already
        # covered by their own (smaller) subset clauses.)
        # nO1>=2 from qh,wh is constant/subsumed by (N3); oth,f1,f2
        # deliberately excluded (ambiguous labels, per spec note).
        shell_o2 = [self.inO2i[p] for p in SHELL_GROUP]
        for k in range(1, len(shell_o2) + 1):
            for subset in combinations(shell_o2, k):
                clause = [-lit for lit in subset]
                clause.append(-self.int_val["nO2"][k - 1])
                self.add(*clause)

    # -- (EQ1)/(EQ2)/(EQ3) consistency schemas ---------------------------------

    def _build_eq_consistency(self) -> None:
        # (EQ1) at-most-one: for label p and baked-pairwise-distinct group G
        # (one of MOSER_GROUP/SHELL_GROUP/FRONTIER_GROUP), at most one of
        # {eq(p,l): l in G} holds.  Using the full intersection of p's
        # eq-targets with G is the strongest valid instantiation of the
        # schema ("any set L of pairwise-baked-distinct labels") and
        # subsumes weaker choices of L.
        for p in LABELS:
            for group in BAKED_GROUPS:
                targets = [
                    v for t in group if t != p and (v := self._eq_var(p, t)) is not None
                ]
                if len(targets) >= 2:
                    self.cnf.at_most_sinz(targets, 1)
        # (EQ2) exclusion: if p,q baked distinct and l has eq atoms to both,
        # ~eq(l,p) v ~eq(l,q).
        for l in LABELS:
            coincident = [p for p in LABELS if p != l and self._eq_var(l, p) is not None]
            for p, q in combinations(coincident, 2):
                if frozenset((p, q)) not in EQ_PAIRS:  # p,q baked distinct
                    self.add(-self._eq_var(l, p), -self._eq_var(l, q))
        # (EQ3) congruence: eq(p,q) -> (Phi(p) <-> Phi(q)) for every unary
        # atom family (including bs1/bs2/bt1/bt2 and del, restricted to
        # their own domains via dict membership), and for beta:
        # eq(p,q) -> (b(p,y)<->b(q,y)) [both p,q in B_DOMAIN] and
        # (b(x,p)<->b(x,q)) [always, y ranges over all labels].
        # sv is skipped: every sv(p) is already a hard unit True, so its
        # congruence clauses would be tautologically satisfied dead weight.
        unary_families: tuple[dict[str, int], ...] = (
            self.inSig, self.inO1i, self.inO2i, self.moser, self.cl1, self.inT,
            self.row_u, self.row_v, self.del_,
            self.bs1, self.bs2, self.bt1, self.bt2,
        )
        for pair in EQ_PAIRS:
            p, q = tuple(pair)
            ev = self.eq[pair]
            for fam in unary_families:
                if p in fam and q in fam:
                    fp, fq = fam[p], fam[q]
                    self.add(-ev, -fp, fq)
                    self.add(-ev, fp, -fq)
            if p in self.B_DOMAIN and q in self.B_DOMAIN:
                for y in list(LABELS) + [OUT]:
                    bp, bq = self.b[(p, y)], self.b[(q, y)]
                    self.add(-ev, -bp, bq)
                    self.add(-ev, bp, -bq)
            for x in self.B_DOMAIN:
                bp, bq = self.b[(x, p)], self.b[(x, q)]
                self.add(-ev, -bp, bq)
                self.add(-ev, bp, -bq)
        # (EQ4) transitivity (v1.1, added after this implementation report
        # showed the gap was reachable for the four `oth` triangles): for
        # every label triple p,q,r whose three pairs all carry eq atoms,
        # eq(p,q) & eq(q,r) -> eq(p,r), in all three rotations. Uniform over
        # every such triangle (the 18 a0-triangles are emergently closed by
        # (EQ3) already, per the report; the schema is harmless there).
        for p, q, r in combinations(LABELS, 3):
            e_pq = self._eq_var(p, q)
            e_qr = self._eq_var(q, r)
            e_pr = self._eq_var(p, r)
            if e_pq is not None and e_qr is not None and e_pr is not None:
                self._add_eq4_triangle(e_pq, e_qr, e_pr)

    def _add_eq4_triangle(self, e_ab: int, e_bc: int, e_ac: int) -> None:
        """(EQ4): given the three edge variables of one eq-triangle, assert
        each pair of edges implies the third (all three rotations)."""
        self.add(-e_ab, -e_bc, e_ac)
        self.add(-e_bc, -e_ac, e_ab)
        self.add(-e_ac, -e_ab, e_bc)

    # -- section 4: leaf deltas -----------------------------------------------

    def _ge_clauses(self, name: str, threshold: int) -> list[tuple[int, ...]]:
        vals = self.int_val[name]
        return [(-vals[i],) for i in range(min(threshold, self.MAXN + 1))]

    def leaf_delta_clauses(self, leaf: str) -> list[tuple[int, ...]]:
        b, o2 = self.b, self.inO2i
        if leaf == "A2":
            # (A2.a) beta(u)=zd
            return [(b[("u", "zd")],)]
        if leaf == "A3":
            # (A3.b) beta(u)=v; N_u=2 -> inO2i(xu); (A3.c) inO2i(v)
            return [(b[("u", "v")],), (o2["xu"],), (o2["v"],)]
        if leaf == "A6":
            # (A6.c) beta(u)=xv, inO2i(xu); (A6.d) inO2i(xv);
            # (A6.e) nO2>=4; (A6.g) s6 arms already global -- no new clause.
            clauses: list[tuple[int, ...]] = [
                (b[("u", "xv")],), (o2["xu"],), (o2["xv"],),
            ]
            clauses += self._ge_clauses("nO2", 4)
            return clauses
        if leaf == "A7":
            # (A7.a,b) beta(u)=xv; (A7.c) ~inO2i(xu); (A7.d) inO2i(v),inO2i(xv)
            return [(b[("u", "xv")],), (-o2["xu"],), (o2["v"],), (o2["xv"],)]
        if leaf == "A8":
            # (A8.a,b) beta(u)=xv; (A8.c) ~inO2i(xu); (A8.d) ~inO2i(v) v ~inO2i(xv)
            return [
                (b[("u", "xv")],), (-o2["xu"],), (-o2["v"], -o2["xv"]),
            ]
        raise EncodingError(f"unknown leaf delta {leaf}")

    # -- section 4: A1 run extension (fresh gamma label + MC row atoms) -------

    def build_a1_extension(self) -> list[tuple[int, ...]]:
        """A1-only atoms/clauses.  Must be called AFTER every other run so
        it is the only thing that ever mutates self.cnf past self.base_clauses.
        Returns the full list of new clauses (including any Sinz clauses
        emitted directly into self.cnf by the at-most-4 calls below)."""

        before = len(self.cnf.clauses)
        gamma_targets = ("a0", "a1", "qh", "wh", "f1", "f2")
        gamma_eq: dict[str, int] = {}
        for t in gamma_targets:
            gamma_eq[t] = self._new(f"eq(gamma,{t})")
        self.a1_names["gamma_eq"] = gamma_eq
        # gamma != a2 (A1.a); gamma baked distinct from the five T-labels
        # (G2) and from oth (C6); coincidence with Cl(a1,r) members or other
        # Moser vertices is exactly the 6 eq atoms above -- no further
        # clauses needed for gamma's own distinctness (it is definitional,
        # matching how the other 13 labels' baked distinctness needs no
        # clause).
        #
        # FIX (not in the spec's A1 leaf-delta table, added for basic
        # logical consistency): without an (EQ1)-style at-most-one, the
        # solver can set gamma coincident with BOTH a0 and a1 (or with all
        # four of qh,wh,f1,f2) at once, which is not a model of anything --
        # a0/a1 are baked pairwise distinct (MOSER_GROUP), as are
        # qh/wh/f1/f2 (FRONTIER_GROUP).  The leaf table's "coincidence... is
        # not excluded" licenses gamma landing on ONE of them, not on
        # several mutually-exclusive ones simultaneously.  Apply the same
        # (EQ1) schema used for the 13 labels, restricted to gamma's actual
        # eq-targets intersected with each baked group.
        for group in (MOSER_GROUP, FRONTIER_GROUP):
            targets = [gamma_eq[t] for t in group if t in gamma_eq]
            if len(targets) >= 2:
                self.cnf.at_most_sinz(targets, 1)

        # (EQ4) transitivity (v1.1) for gamma's triangles, per coordinator
        # instruction: for every pair t1,t2 of gamma's own eq-targets that
        # themselves carry a real eq(t1,t2) atom among the 13 labels, add
        # all three rotations of eq(gamma,t1) & eq(t1,t2) -> eq(gamma,t2).
        # Only the four {gamma,a0,X} triangles for X in {qh,wh,f1,f2}
        # qualify (a0 is the only gamma-target pair whose own eq(a0,X)
        # atom exists among gamma_targets={a0,a1,qh,wh,f1,f2}: a1-{qh,wh,
        # f1,f2} and qh/wh/f1/f2 pairwise are all baked distinct).
        for t1, t2 in combinations(gamma_targets, 2):
            e_t1t2 = self._eq_var(t1, t2)
            if e_t1t2 is not None:
                self._add_eq4_triangle(gamma_eq[t1], e_t1t2, gamma_eq[t2])

        w_families: dict[str, dict[str, int]] = {}
        for s in SHELL_GROUP:
            table = {p: self._new(f"w_{s}({p})") for p in LABELS}
            w_families[s] = table
        self.a1_names["w"] = w_families

        # del(s) -> w_s(s)  [s in W_s]
        for s in SHELL_GROUP:
            self.add(-self.del_[s], w_families[s][s])
        # pairwise disjoint: del(s) & del(t) -> ~(w_s(p) & w_t(p))
        for s, t in combinations(SHELL_GROUP, 2):
            for p in LABELS:
                self.add(
                    -self.del_[s], -self.del_[t],
                    -w_families[s][p], -w_families[t][p],
                )
        # at-most-4 per w_s over the T-set and over {qh,wh,f1,f2} [|W_s|=4]
        for s in SHELL_GROUP:
            self.cnf.at_most_sinz([w_families[s][p] for p in SHELL_GROUP], 4)
            self.cnf.at_most_sinz([w_families[s][p] for p in FRONTIER_GROUP], 4)
        # gamma not in W_s [t_s>0]: skipped -- gamma is not one of the 13
        # labels w_s ranges over, so gamma not-in W_s holds by label
        # absence with no clause needed (per spec: "skip via label absence").

        return list(self.cnf.clauses[before:])


class RunInstance:
    """Duck-typed adapter matching the (.dimacs, .decode_model) interface
    that census.card_head.sat_encoding.solve_cadical expects from a
    CoverInstance.  Decodes to the full named-atom table, not a candidate
    cube (there is no cube concept in this package)."""

    def __init__(self, encoder: ACoreEncoder, base_clauses: Sequence[tuple[int, ...]]) -> None:
        self.encoder = encoder
        self.base_clauses = tuple(tuple(c) for c in base_clauses)

    def _all_clauses(self, extra_clauses: Sequence[Collection[int]]) -> tuple[tuple[int, ...], ...]:
        return self.base_clauses + tuple(tuple(c) for c in extra_clauses)

    def dimacs(self, extra_clauses: Sequence[Collection[int]] = ()) -> str:
        clauses = self._all_clauses(extra_clauses)
        n_vars = self.encoder.cnf.n_variables
        for clause in clauses:
            for lit in clause:
                n_vars = max(n_vars, abs(lit))
        lines = [f"p cnf {n_vars} {len(clauses)}"]
        lines.extend(" ".join(map(str, clause)) + " 0" for clause in clauses)
        return "\n".join(lines) + "\n"

    def decode_model(self, positive_variables: Collection[int]) -> dict[str, bool]:
        positive = set(positive_variables)
        return {name: (var in positive) for name, var in self.encoder.names.items()}

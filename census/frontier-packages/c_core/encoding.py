"""Layer-1 incidence encoder for the C-core physical-apex-boundary package.

Implements ``census/frontier-packages/C-CORE-ENCODING-SPEC.md`` (v1.1), a
DELTA spec against ``A-CORE-ENCODING-SPEC.md`` (v1.2).  Every clause-emitting
block below carries the spec tag that justifies it (C-tags where the C spec
amends/adds, A-tags carried over verbatim where the C spec's section 4 says
so).  Copy-and-adapt of ``census/frontier-packages/a_core/encoding.py`` per
the C spec's own instruction ("do NOT import a_core or modify it"); reuses
``census/card_head/sat_encoding.py``'s ``CNF``/``solve_cadical`` exactly as
a_core does, via the same duck-typed ``RunInstance`` adapter.

SOUNDNESS DISCIPLINE (binding, per the A spec header, incorporated by
reference): a clause may only assert what the package hypotheses prove.
Genuine spec ambiguities/gaps found during implementation are called out in
comments tagged AMBIGUITY / SPEC-GAP and logged in RESULTS.md verbatim.
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
    "CCoreEncoder",
    "RunInstance",
]

# ---------------------------------------------------------------------------
# Section 3 (C spec): same 13-label universe as A, amended eq-atom set.
# ---------------------------------------------------------------------------

LABELS: tuple[str, ...] = (
    "a0", "a1", "a2", "zd", "u", "xu", "v", "xv", "oth", "qh", "wh", "f1", "f2",
)

# Sentinel blocker-map target: b(x, OUT) = "c'(x) has no witness among the 13
# labels".  Not a label: never gets eq/moser/cap/cl1/inT/row atoms.
OUT = "OUT"

MOSER_GROUP: tuple[str, ...] = ("a0", "a1", "a2")
SHELL_GROUP: tuple[str, ...] = ("zd", "u", "xu", "v", "xv")
FRONTIER_GROUP: tuple[str, ...] = ("qh", "wh", "f1", "f2")
BAKED_GROUPS: tuple[tuple[str, ...], ...] = (MOSER_GROUP, SHELL_GROUP, FRONTIER_GROUP)

# A's explicit eq-atom groups (C spec section 3: "Everything else as in A").
# PLUS three new groups (C spec section 3, "Baked-distinctness changes vs A"):
#   - u vs {a0,a1}: NOT baked (A used u in O2 unconditionally; C's u is only
#     conditionally in O2 via srcU) -- ADD eq atoms.
#   - u vs {qh,wh,f1,f2}: NOT baked, same reason -- ADD eq atoms.
#   - oth vs u: NOT baked ((C6.5) is other != source, not other != u) -- ADD
#     eq atom eq(oth,u) (conditional exclusion srcU -> ~eq(oth,u) is a
#     separate clause, built in _build_source_context, not part of the
#     baked-distinctness bookkeeping here).
# oth vs xu remains baked (unchanged from A: (C6.7) oth !in Sigma'(source)
# while xu in Sigma'(source) on BOTH selector arms) -- no group added.
_EQ_GROUPS: tuple[tuple[tuple[str, ...], tuple[str, ...]], ...] = (
    (("qh", "wh"), ("zd", "xu", "xv", "v")),
    (("f1", "f2"), ("zd", "xu", "xv", "v", "oth", "a0", "a2")),
    (("oth",), ("zd", "v", "xv")),
    (("a0", "a1"), ("zd", "xu", "xv")),
    (("a0",), ("qh", "wh")),
    (("v",), ("a0", "a1")),
    # -- C spec section 3 additions --
    (("u",), ("a0", "a1")),
    (("u",), ("qh", "wh", "f1", "f2")),
    (("oth",), ("u",)),
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


class CCoreEncoder:
    """Builds the shared abstract/common 'base' CNF (C spec section 6:
    (C0)-(C8) families, section 3-4 amendments, minus physical-branch C6.9
    and minus DEL2/DEL3 which are leaf-C1-only) plus the stashed leaf-C1
    delta (C6.9/DEL2/DEL3/srcU-unit/placement) and the leaf-C2 extension
    (C6.9, fresh label P, COL family, etc.).
    """

    # Values 0..MAXN are exact.  OVERFLOW is the abstract bucket GE25.
    # This is load-bearing for universal soundness: the live C-core leaves
    # have no upper bound on |A|, so values above 24 must be represented,
    # not forbidden by the finite abstraction.
    MAXN = 24
    OVERFLOW = MAXN + 1
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
        self.row_src: dict[str, int] = {}
        self.srcU = 0
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
        self.fbar: dict[str, int] = {}
        self.rbs1 = 0
        self.rbs2 = 0
        self.rbt1 = 0
        self.rbt2 = 0
        self.cs4_m: dict[str, int] = {}

        self.del2_clauses: list[tuple[int, ...]] = []
        # (C6.9) physical-branch projection.  This is a clause over
        # already-existing row_src atoms, but it is deliberately stashed
        # rather than emitted into the frozen base: C6.9 belongs to both
        # physical verdict leaves, not the abstract/common base stage.
        self.c69_clauses: list[tuple[int, ...]] = []
        # (DEL3, leaf-C1-only): built on demand for the same reason as
        # a_core's build_del3_clauses -- its Sinz at-most-2 encoding
        # allocates new counter variables, so it must not leak into
        # self.base_clauses / inflate the 'base' and 'base+C2' variable
        # counts (which must NOT carry (DEL3)).  See
        # build_del3_clauses()'s docstring below.
        self.del3_clauses: list[tuple[int, ...]] = []
        self.leaf_c2_names: dict[str, Any] = {}

        self._build()
        # Problem97.ATailCriticalPairFrontier.
        # cross_deletion_survives_iff_not_mem_selected_support
        # (lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean:781)
        # turns C6.9's
        #   K4(A\{qh}, c'(source)) or K4(A\{wh}, c'(source))
        # into qh ∉ Sigma'(source) or wh ∉ Sigma'(source).  Since row_src
        # is exactly Sigma'(source), the physical-branch clause is:
        self.c69_clauses = [
            (-self.row_src["qh"], -self.row_src["wh"]),
        ]
        # Frozen snapshot: everything added to self.cnf up to this point is
        # exactly the C spec's 'base' (section 6, run 1).  Nothing added
        # after this line mutates this prefix.
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
        self._build_srcU()
        self._build_moser()
        self._build_cap()
        self._build_cl1()
        self._build_inT()
        self._build_rows()
        self._build_del()
        self._build_blocker()
        self._build_source_context()
        self._build_sv()
        self._build_cd()
        self._build_s5()
        self._build_integers()
        self._build_eq_consistency()
        self._build_e8a()
        self._build_e8a_src()
        self._build_e8b()
        self._build_e8c()
        self._build_cd4()
        self._build_cd5()
        # (R1'): DROPPED (C spec section 4 -- {u,qh,wh,f1,f2} is no longer
        # pairwise baked distinct in C, u carries eq atoms to all four
        # frontier labels; no replacement set exists per spec).
        self._build_fb()

    # -- eq atoms ---------------------------------------------------------

    def _build_eq(self) -> None:
        for pair in sorted(EQ_PAIRS, key=lambda fs: tuple(sorted(fs))):
            p, q = sorted(pair)
            self.eq[pair] = self._new(f"eq({p},{q})")

    # -- srcU selector [C spec section 2] ----------------------------------

    def _build_srcU(self) -> None:
        # (C6.10)+(C8.1): source in Sigma'(u) cap Gamma2 = I_u = {u,xu}, so
        # source in {u,xu}.  srcU = "source=u"; ~srcU <=> source=xu.  No
        # unit here -- srcU is free in 'base' (both leaves constrain it
        # differently: leaf C1 asserts ~srcU as a unit; leaf C2 leaves it
        # free).
        self.srcU = self._new("srcU")

    # -- moser(p) definition (identical to A) ------------------------------

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
            # moser(p) <-> OR eq(p, a_i).  For p=u this now fires for real
            # (u carries eq(u,a0), eq(u,a1) in C -- section 3 amendment).
            self.add(-v, *[ev for _, ev in targets])
            for _, ev in targets:
                self.add(-ev, v)

    # -- (CAP1)/(CAP2) + interior units [C spec section 4: carried] --------

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
        # Units [C spec section 3 "Unit changes vs A"]:
        #   inO2i(u) is NOT a unit in C (conditional, srcU-gated -- built in
        #   _build_source_context).  inO2i(oth)=T (C6.6) still stays.
        #   inO1i(qh)=inO1i(wh)=T (C3.7) still stays.
        self.add(self.inO2i["oth"])
        self.add(self.inO1i["qh"])
        self.add(self.inO1i["wh"])

    # -- (CL1) frontier class cl1(p) [carried, cl1(u) amended] --------------

    def _build_cl1(self) -> None:
        for p in LABELS:
            self.cl1[p] = self._new(f"cl1({p})")
        # Units [(C3.4)+(C3.7)]
        for p in FRONTIER_GROUP:
            self.add(self.cl1[p])
        self.add(-self.cl1["a1"])  # (r>0, i.e. rho_0>0)
        # cl1(u)=F is NOT an unconditional unit in C (C spec section 3:
        # "cl1(u)=F becomes CONDITIONAL (srcU -> ~cl1(u)) -- do not assert
        # the unconditional unit").  The conditional pair is built in
        # _build_source_context.  cl1(u)'s exactness now fires for real
        # (u carries eq atoms into FRONTIER_GROUP -- section 3 amendment),
        # exactly like every other non-frontier label below.
        #
        # (CL1) exactness [(C3.4)+(C3.7)]: for every other label p,
        # cl1(p) -> OR eq(p,t) over p's existing eq atoms to {qh,wh,f1,f2};
        # degenerates to a unit ~cl1(p) when no such eq atom exists.
        for p in LABELS:
            if p in FRONTIER_GROUP:
                continue
            targets = self._eq_targets(p, FRONTIER_GROUP)
            v = self.cl1[p]
            if not targets:
                self.add(-v)
            else:
                self.add(-v, *[ev for _, ev in targets])

    # -- (T1) physical class inT(p) [carried, inT(oth) new unit] ------------

    def _build_inT(self) -> None:
        for p in LABELS:
            self.inT[p] = self._new(f"inT({p})")
        # Units [C7.1+C5.5+C8.1 give the shell group in Gamma2]
        for p in SHELL_GROUP:
            self.add(self.inT[p])
        self.add(-self.inT["a2"])  # (B3)-analog: a2 not in its own class
        # NEW unit vs A [C spec section 3: "inT(oth)=T (C6.6) other in
        # Gamma2" -- A-core's C6 gives the same fact but a_core's encoder
        # never asserts it (A iteration-3 backlog); C-core asserts it].
        self.add(self.inT["oth"])
        # (T1) exactness, same one-directional pattern as (CL1); converse
        # via (EQ3).  oth's eq-targets into SHELL_GROUP now include u (new
        # eq(oth,u) atom), so this generic loop forces, via the new unit
        # above: eq(oth,zd) v eq(oth,u) v eq(oth,v) v eq(oth,xv) -- matches
        # spec section 3 verbatim (xu excluded: oth vs xu stays baked).
        for p in LABELS:
            if p in SHELL_GROUP:
                continue
            targets = self._eq_targets(p, SHELL_GROUP)
            v = self.inT[p]
            if not targets:
                self.add(-v)
            else:
                self.add(-v, *[ev for _, ev in targets])

    # -- rows: row_u, row_v [carried, row_u(oth) unit REMOVED] --------------

    def _build_rows(self) -> None:
        for p in LABELS:
            self.row_u[p] = self._new(f"row_u({p})")
            self.row_v[p] = self._new(f"row_v({p})")
        # Units row_u: T on u,xu [I_u={u,xu}, unconditional structural fact
        # from (C8.1) -- does not depend on which of u/xu is 'source'];
        # F on v (C5.6), zd (C7.3).
        # AMENDED vs A: row_u(oth)=F is REMOVED.  C spec section 3: "under
        # ~srcU there is no hypothesis putting oth outside Sigma'(u) --
        # leave row_u(oth) UNCONSTRAINED; row_src(oth)=F is the sound
        # unit" (row_src is the new third row family, built below in
        # _build_source_context).
        self.add(self.row_u["u"])
        self.add(self.row_u["xu"])
        for p in ("v", "zd"):
            self.add(-self.row_u[p])
        # Units row_v: T on v,xv; F on u (C5.6), zd (C7.3).  Unchanged.
        self.add(self.row_v["v"])
        self.add(self.row_v["xv"])
        for p in ("u", "zd"):
            self.add(-self.row_v[p])
        # (R1) at-most-4 over the pairwise-distinct shell set, for row_u and
        # row_v alike.  Unchanged.
        self.cnf.at_most_sinz([self.row_u[p] for p in SHELL_GROUP], 4)
        self.cnf.at_most_sinz([self.row_v[p] for p in SHELL_GROUP], 4)
        # (R3) cl1(v) -> (row_v(p) <-> cl1(p)) for all p.  Unchanged (the
        # u-side analog is still moot: cl1(u) is no longer a hard False
        # unit in C, but it is not a hard True unit either -- (R3)'s A-side
        # note only ever applied when cl1(u)=F was a HARD unit, and the C
        # spec does not add a u-side (R3) analog; not carrying one over is
        # the conservative/sound reading, not an improvisation).
        cl1v = self.cl1["v"]
        for p in LABELS:
            self.add(-cl1v, -self.row_v[p], self.cl1[p])
            self.add(-cl1v, self.row_v[p], -self.cl1[p])

    # -- deletion set del(p) [carried DEL1; DEL2/DEL3 leaf-C1-only] ---------

    def _build_del(self) -> None:
        for p in self.DEL_DOMAIN:
            self.del_[p] = self._new(f"del({p})")
        # (DEL1) at-least-one [(C8.3): D0 != empty] -- base, unconditional.
        self.add(*[self.del_[p] for p in self.DEL_DOMAIN])
        # (DEL2) at-least-two -- leaf-C1-only [(C9.1) P=a2 + (C4.2), same
        # singleton argument as A's (DEL2)]; stashed, NOT added to
        # self.cnf here.
        del2: list[tuple[int, ...]] = []
        for p in self.DEL_DOMAIN:
            others = [self.del_[q] for q in self.DEL_DOMAIN if q != p]
            del2.append((-self.del_[p], *others))
        self.del2_clauses = del2
        # |D0|<=5 auto (5 labels total) -- no clause needed.

    # -- blocker map b(x,y) [BM1-BM5,BM8,BM9 carried; BM6 DROPPED; --------
    # -- BM7 replaced by srcU-conditional pairs in _build_source_context] --

    def _build_blocker(self) -> None:
        y_targets = list(LABELS) + [OUT]
        for x in self.B_DOMAIN:
            for y in y_targets:
                self.b[(x, y)] = self._new(f"b({x},{y})")
        # (BM1) exactly-one over y [c'(x) functional]
        for x in self.B_DOMAIN:
            vs = [self.b[(x, y)] for y in y_targets]
            self.add(*vs)
            self.cnf.at_most_sinz(vs, 1)
        # (BM2) ~b(x,x); under eq: eq(p,q) -> ~b(p,q) (both orderings, when
        # the source side is in B_DOMAIN).  Note this now also fires for
        # the new u-eq-pairs (e.g. eq(u,qh) -> ~b(u,qh) & ~b(qh,u), since
        # both u and qh are in B_DOMAIN) -- generic, unchanged code.
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
        # supplied generically by (EQ3)'s y-side beta congruence below.
        for x in self.B_DOMAIN:
            self.add(-self.b[(x, "a2")])
        # (BM4) H* pattern: b(x,a1) <-> cl1(x), for x in B_DOMAIN.  Tag map:
        # "H, H*, beta, Row | C1.1, H', c', Sigma' | identical incl.
        # b(x,a1)<->cl1(x)".  Unchanged.
        for x in self.B_DOMAIN:
            bx = self.b[(x, "a1")]
            cx = self.cl1[x]
            self.add(-bx, cx)
            self.add(-cx, bx)
        # (BM5) center not in own row.  Unchanged.
        for y in LABELS:
            self.add(-self.b[("u", y)], -self.row_u[y])
            self.add(-self.b[("v", y)], -self.row_v[y])
        # (BM6) DROPPED.  A's (BM6) was justified by A's context hypothesis
        # (P2), which lives in A's leaf-shared 𝔓 block (P1)-(P3).  The C
        # spec's tag map (section 1) sends 𝔓 (P1-P3) to "leaf C1 =
        # C9.1-C9.4" ONLY -- there is no C analogue of (P2) asserted for
        # BOTH leaves (or even for leaf C1 specifically; C9.1-C9.4 do not
        # restate anything like "beta(u) in {zd,v,xv}").  C spec section 4's
        # "Carried unchanged" list enumerates BM1-BM5, BM7, BM8, BM9
        # explicitly and omits BM6.  Per the header soundness discipline
        # ("Omitted hypotheses ... only weaken UNSAT prospects, never
        # soundness"), omitting BM6 is safe; adding it back without a C-tag
        # would be an improvised, unjustified base clause.  Flagged as a
        # spec concern in RESULTS.md.
        #
        # (BM7) (C9)-analog: replaced by the srcU-conditional pair in
        # _build_source_context (C6.8: srcU->(~b(u,y)v~b(oth,y));
        # ~srcU->(~b(xu,y)v~b(oth,y))) -- NOT built here.
        #
        # (BM8) (C7.4): c'(u) != c'(v).  Unconditional (u/v specifically,
        # not "source"/"other") -- unchanged from A.
        for y in LABELS:
            self.add(-self.b[("u", y)], -self.b[("v", y)])
        # (BM9) (C7.5)/(C7.6): c'(zd) != c'(u), c'(zd) != c'(v).
        # ~b(zd,a2) already covered by (BM3).  Unchanged.
        for y in LABELS:
            self.add(-self.b[("zd", y)], -self.b[("u", y)])
            self.add(-self.b[("zd", y)], -self.b[("v", y)])

    # -- srcU-conditional source-context pairs [C spec section 2] -----------

    def _build_source_context(self) -> None:
        srcU = self.srcU

        # (C6.2) source in Chat_2^o: srcU -> inO2i(u); ~srcU -> inO2i(xu).
        self.add(-srcU, self.inO2i["u"])
        self.add(srcU, self.inO2i["xu"])

        # (C6.3) c'(source) != a1: srcU -> ~cl1(u); ~srcU -> ~cl1(xu).
        self.add(-srcU, -self.cl1["u"])
        self.add(srcU, -self.cl1["xu"])

        # (C6.5) other != source, conditional half not already covered by
        # baked distinctness: srcU -> ~eq(oth,u).  (The ~srcU branch,
        # other != xu, is covered for free: oth vs xu stays baked distinct
        # in C, so eq(oth,xu) does not exist as an atom at all.)
        eq_oth_u = self._eq_var("oth", "u")
        assert eq_oth_u is not None
        self.add(-srcU, -eq_oth_u)

        # (C6.8) c'(source) != c'(other) -- replaces A's (BM7), now
        # srcU-conditional: srcU -> (~b(u,y) v ~b(oth,y)) per y;
        # ~srcU -> (~b(xu,y) v ~b(oth,y)) per y.  Same y-domain resolution
        # as A's (BM7)/(BM8)/(BM9): y ranges over the 13 LABELS only,
        # excluding OUT (A's AMBIGUITY resolution #2, carried over --
        # (C9)-style prose is about which *point* blocks, not the "no
        # witness" sentinel).
        for y in LABELS:
            self.add(-srcU, -self.b[("u", y)], -self.b[("oth", y)])
            self.add(srcU, -self.b[("xu", y)], -self.b[("oth", y)])

        # -- Row of source: row_src(p), a third row family [C spec
        # section 2].
        for p in LABELS:
            self.row_src[p] = self._new(f"row_src({p})")
        # srcU -> (row_src(p) <-> row_u(p)) for every p.
        for p in LABELS:
            rs, ru = self.row_src[p], self.row_u[p]
            self.add(-srcU, -rs, ru)
            self.add(-srcU, rs, -ru)
        # srcU -> row_src(u); ~srcU -> row_src(xu) [x in Sigma'(x)].
        self.add(-srcU, self.row_src["u"])
        self.add(srcU, self.row_src["xu"])
        # Units (unconditional, from source-tagged hypotheses):
        # row_src(oth)=F (C6.7); row_src(v)=F (C6.11).
        self.add(-self.row_src["oth"])
        self.add(-self.row_src["v"])
        # (C6.12) u=source v u !in Sigma'(source): ~srcU -> ~row_src(u).
        self.add(srcU, -self.row_src["u"])
        # (R1-src) at-most-4 over {zd,u,xu,v,xv} [|Sigma'(source)|=4].
        self.cnf.at_most_sinz([self.row_src[p] for p in SHELL_GROUP], 4)

        # (CS4) [(C6.4)]: product atoms m_t := row_src(t) & inO2i(t) for the
        # five pairwise-distinct T-labels t; at-most-2 of the five m_t.
        prods = []
        for p in SHELL_GROUP:
            and_v = self._new(f"cs4_m({p})")
            self.cs4_m[p] = and_v
            self.add(-and_v, self.row_src[p])
            self.add(-and_v, self.inO2i[p])
            self.add(-self.row_src[p], -self.inO2i[p], and_v)
            prods.append(and_v)
        self.cnf.at_most_sinz(prods, 2)

    # -- survival atoms sv(p) [carried, (C4.2) tag] --------------------------

    def _build_sv(self) -> None:
        for p in LABELS:
            v = self._new(f"sv({p})")
            self.sv[p] = v
            self.add(v)  # (SV1) all units True [(C4.2) full a2-robustness]

    # -- CD witness sets bs1/bs2 (C7.5) and bt1/bt2 (C7.6) [carried] ---------

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
        # schema for the (C7.6) trio (bt1,bt2).
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

    # -- S5-analog radius-classification arms [(C4.5), s5b refuted] ---------

    def _build_s5(self) -> None:
        self.s5a = self._new("s5a")
        self.s5b = self._new("s5b")
        self.add(self.s5a, self.s5b)  # (C4.5) i v ii
        self.add(-self.s5b)  # (C4.5)(ii) needs |Gamma(a2,r)|<5 for every r,
        # but (C5.3) gives |Gamma_2|=5 at r=rho>0 -- refutes arm (ii), same
        # structure as A's (S5B).

    # -- integer layer [N1,N3-N7 carried; N2 amended n>=10; N8 dropped] -----

    def _build_int_var(self, name: str) -> dict[int, int]:
        vals: dict[int, int] = {}
        for i in range(self.MAXN + 1):
            vals[i] = self._new(f"{name}={i}")
        vals[self.OVERFLOW] = self._new(f"{name}>={self.OVERFLOW}")
        self.int_val[name] = vals
        vs = list(vals.values())
        self.add(*vs)  # at-least-one
        self.cnf.at_most_sinz(vs, 1)  # at-most-one -> exactly-one
        return vals

    def _int_ge(self, name: str, threshold: int, trigger: int | None = None) -> None:
        """Assert name>=threshold, optionally gated by `trigger`.

        Thresholds at most OVERFLOW are exact in this abstraction: the
        overflow bucket denotes every concrete value at least OVERFLOW.
        """
        if threshold > self.OVERFLOW:
            raise EncodingError(
                f"threshold {threshold} exceeds sound overflow boundary {self.OVERFLOW}"
            )
        vals = self.int_val[name]
        for i in range(threshold):
            if trigger is None:
                self.add(-vals[i])
            else:
                self.add(-trigger, -vals[i])

    def _int_eq(self, name: str, value: int, trigger: int) -> None:
        """Assert trigger -> name==value."""
        if not 0 <= value <= self.MAXN:
            raise EncodingError(f"exact value {value} is outside 0..{self.MAXN}")
        self.add(-trigger, self.int_val[name][value])

    def _build_integers(self) -> None:
        for name in self.INT_VARS:
            self._build_int_var(name)
        sig, o1, o2, n = (self.int_val[k] for k in self.INT_VARS)
        # (N1) n = nSig + nO1 + nO2 + 3, abstracted exactly through MAXN
        # and conservatively above it.  OVERFLOW denotes every value >=25.
        # If all three inputs are exact, their exact sum selects either an
        # exact n bucket or OVERFLOW.  If any input is OVERFLOW, the positive
        # addends force n into OVERFLOW as well.  Thus every concrete
        # cardinality tuple has an abstract image; unlike the old bounded
        # encoding, no n>24 model is silently deleted.
        for i in range(self.OVERFLOW + 1):
            for j in range(self.OVERFLOW + 1):
                for k in range(self.OVERFLOW + 1):
                    if self.OVERFLOW in (i, j, k):
                        out = self.OVERFLOW
                    else:
                        total = i + j + k + 3
                        out = total if total <= self.MAXN else self.OVERFLOW
                    self.add(-sig[i], -o1[j], -o2[k], n[out])
        # (N2) AMENDED [(C3.3): 9 < |A|] -- n >= 10, not n >= 12.
        self._int_ge("n", 10)
        # (N8) DROPPED [C spec section 4: its A-derivation needs the
        # F-chain's exact-4 classes at a2, which (C2.6) does not guarantee
        # -- the left disjunct is discharged by (C2.5) instead].  No
        # n>=14 clause here.
        # (N3) nO1 >= 2 [(C4.3)-analog via (S3)-pattern, tag per C4]
        self._int_ge("nO1", 2)
        # (N4) nO2 >= 3 [(S4)-pattern, tag per C4]
        self._int_ge("nO2", 3)
        # (N5) nSig >= 3 [packet S, tag per C0]
        self._int_ge("nSig", 3)
        # (N6) S6-analog arms [tag per C4]
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
        # inO2i atoms.  Unchanged code: still sound even though inO2i(u)
        # is now conditional rather than a hard unit -- the clause
        # "if all of subset true then nO2>=k" does not care how a member
        # atom became true.
        shell_o2 = [self.inO2i[p] for p in SHELL_GROUP]
        for k in range(1, len(shell_o2) + 1):
            for subset in combinations(shell_o2, k):
                clause = [-lit for lit in subset]
                clause.append(-self.int_val["nO2"][k - 1])
                self.add(*clause)

    # -- (EQ1)/(EQ2)/(EQ3)/(EQ4) consistency schemas [carried, enlarged] ----

    def _build_eq_consistency(self) -> None:
        # (EQ1) at-most-one, over the enlarged EQ_PAIRS set.  u now has
        # real targets in MOSER_GROUP and FRONTIER_GROUP (section 3
        # amendment), so this generic loop emits genuine at-most-one
        # constraints for u too (2 targets in MOSER_GROUP, 4 in
        # FRONTIER_GROUP) -- same code as A, no change.
        for p in LABELS:
            for group in BAKED_GROUPS:
                targets = [
                    v for t in group if t != p and (v := self._eq_var(p, t)) is not None
                ]
                if len(targets) >= 2:
                    self.cnf.at_most_sinz(targets, 1)
        # (EQ2) exclusion: if p,q baked distinct and l has eq atoms to both,
        # ~eq(l,p) v ~eq(l,q).  Unchanged code.
        for l in LABELS:
            coincident = [p for p in LABELS if p != l and self._eq_var(l, p) is not None]
            for p, q in combinations(coincident, 2):
                if frozenset((p, q)) not in EQ_PAIRS:  # p,q baked distinct
                    self.add(-self._eq_var(l, p), -self._eq_var(l, q))
        # (EQ3) congruence: eq(p,q) -> (Phi(p) <-> Phi(q)) for every unary
        # atom family, and for beta.  row_src is a NEW unary atom family
        # (C spec section 2) -- included here per (EQ3)'s blanket "every
        # unary atom family" scope.  sv is skipped: every sv(p) is already
        # a hard unit True, so its congruence clauses would be
        # tautologically satisfied dead weight (same as A).
        unary_families: tuple[dict[str, int], ...] = (
            self.inSig, self.inO1i, self.inO2i, self.moser, self.cl1, self.inT,
            self.row_u, self.row_v, self.row_src, self.del_,
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
        # (EQ4) transitivity: for every label triple p,q,r whose three
        # pairs all carry eq atoms, eq(p,q) & eq(q,r) -> eq(p,r), all three
        # rotations.  Uniform over the enlarged triangle set (now including
        # any new triangles the 7 added u-pairs complete, e.g.
        # {u,a0,qh}? -- checked below at import time via the loop itself,
        # not hand-enumerated, exactly as A does).
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

    # -- (E8a) rows x bisector [carried, x in {u,v}] -------------------------
    def _build_e8a(self) -> None:
        # For x in {u,v}, y != a1: row_x(qh) & row_x(wh) & b(x,y) ->
        # inO1i(y) v eq(y,a1) (escape only where eq(y,a1) exists: y in
        # {zd,xu,xv,v}); no clause for y=a1 or y=OUT.  Unchanged from A.
        for x in ("u", "v"):
            row = self.row_u if x == "u" else self.row_v
            rq, rw = row["qh"], row["wh"]
            for y in LABELS:
                if y == "a1":
                    continue
                clause = [-rq, -rw, -self.b[(x, y)], self.inO1i[y]]
                eqy_a1 = self._eq_var(y, "a1")
                if eqy_a1 is not None:
                    clause.append(eqy_a1)
                self.add(*clause)

    # -- (E8a-src) rows x bisector for row_src [C spec section 2, (C3.8)] ---
    def _build_e8a_src(self) -> None:
        # row_src(qh) & row_src(wh) & srcU & b(u,y) -> inO1i(y) v eq(y,a1);
        # row_src(qh) & row_src(wh) & ~srcU & b(xu,y) -> inO1i(y) v
        # eq(y,a1).  Same y-range discipline as (E8a): skip y=a1, no OUT
        # clause.
        rq, rw = self.row_src["qh"], self.row_src["wh"]
        for y in LABELS:
            if y == "a1":
                continue
            eqy_a1 = self._eq_var(y, "a1")
            clause_u = [-rq, -rw, -self.srcU, -self.b[("u", y)], self.inO1i[y]]
            clause_xu = [-rq, -rw, self.srcU, -self.b[("xu", y)], self.inO1i[y]]
            if eqy_a1 is not None:
                clause_u.append(eqy_a1)
                clause_xu.append(eqy_a1)
            self.add(*clause_u)
            self.add(*clause_xu)

    # -- (E8b) CD B2 sets [carried] ------------------------------------------
    def _build_e8b(self) -> None:
        # a2 != a1, a2 !in O1i (Moser vertex): qh,wh cannot both lie in a B2.
        self.add(-self.bs2["qh"], -self.bs2["wh"])
        self.add(-self.bt2["qh"], -self.bt2["wh"])

    # -- (E8c) CD B1 sets [carried] ------------------------------------------
    def _build_e8c(self) -> None:
        bs1qh, bs1wh = self.bs1["qh"], self.bs1["wh"]
        bt1qh, bt1wh = self.bt1["qh"], self.bt1["wh"]
        for y in LABELS:
            if y == "a1":
                continue
            eqy_a1 = self._eq_var(y, "a1")
            clause_u = [-bs1qh, -bs1wh, -self.b[("u", y)], self.inO1i[y]]
            clause_v = [-bt1qh, -bt1wh, -self.b[("v", y)], self.inO1i[y]]
            if eqy_a1 is not None:
                clause_u.append(eqy_a1)
                clause_v.append(eqy_a1)
            self.add(*clause_u)
            self.add(*clause_v)

    # -- (CD4) center exclusion [carried] ------------------------------------
    def _build_cd4(self) -> None:
        for y in self.CD_DOMAIN:
            self.add(-self.b[("u", y)], -self.bs1[y])
            self.add(-self.b[("v", y)], -self.bt1[y])
        for p in ("f1", "f2"):
            eq_a2 = self._eq_var(p, "a2")
            self.add(-self.bs2[p], -eq_a2)
            self.add(-self.bt2[p], -eq_a2)

    # -- (CD5) B-set radius selectors [carried; rbs1 keys off row_u, -------
    # -- NOT row_src -- spec note: C7.5's B1 is coradial about c'(u)] -------
    def _build_cd5(self) -> None:
        self.rbs1 = self._new("rbs1")
        self.rbs2 = self._new("rbs2")
        self.rbt1 = self._new("rbt1")
        self.rbt2 = self._new("rbt2")
        for p in self.CD_DOMAIN:
            self.add(-self.rbs1, -self.bs1[p], self.row_u[p])
            self.add(-self.rbs1, self.bs1[p], -self.row_u[p])
            self.add(self.rbs1, -self.bs1[p], -self.row_u[p])
            self.add(-self.rbt1, -self.bt1[p], self.row_v[p])
            self.add(-self.rbt1, self.bt1[p], -self.row_v[p])
            self.add(self.rbt1, -self.bt1[p], -self.row_v[p])
            self.add(-self.rbs2, -self.bs2[p], self.inT[p])
            self.add(self.rbs2, -self.bs2[p], -self.inT[p])
            self.add(-self.rbt2, -self.bt2[p], self.inT[p])
            self.add(self.rbt2, -self.bt2[p], -self.inT[p])
        for p in ("u", "xu", "v", "xv"):
            self.add(-self.rbs2, self.bs2[p])
            self.add(-self.rbt2, self.bt2[p])

    # -- (FB) frontier-pair selector [AMENDED: drop 2 of 3 implications] ----
    def _build_fb(self) -> None:
        for p in FRONTIER_GROUP:
            self.fbar[p] = self._new(f"fbar({p})")
        fvars = [self.fbar[p] for p in FRONTIER_GROUP]
        # exactly-2: at-least-2 (DEL2-style) + Sinz at-most-2.  Unchanged.
        self.add(*fvars)
        for p in FRONTIER_GROUP:
            others = [self.fbar[q] for q in FRONTIER_GROUP if q != p]
            self.add(-self.fbar[p], *others)
        self.cnf.at_most_sinz(fvars, 2)
        # KEEP: fbar_p -> ~inSig(p) [(C2.1): qbar,wbar in Gamma_1 \ sC].
        for p in FRONTIER_GROUP:
            self.add(-self.fbar[p], -self.inSig[p])
        # DROPPED vs A [C spec section 4]: fbar_p -> ~inT(p) and (for
        # p in {f1,f2}) fbar_p -> ~eq(p,a2) both needed the exact-4
        # a2-classes that A's (N8) relied on; C has no such guarantee
        # ((C2.6)'s right disjunct, which would supply it, is not forced --
        # the left disjunct is discharged by (C2.5) instead).

    # -- (DEL3) leaf-C1-only deletion cap [(C8.4)+(C8.5)+(C5.3)+(C9.1)] -----

    def build_del3_clauses(self) -> list[tuple[int, ...]]:
        """At-most-2 (Sinz) over the five del atoms.  Unlike (DEL2) (a pure
        clause list over already-existing variables, safe to precompute
        during __init__), this literal Sinz encoding allocates new counter
        variables -- so it CANNOT be built inside _build() without leaking
        into self.base_clauses / inflating the 'base' and 'base+C2' runs'
        declared variable counts, neither of which carries (DEL3). Call
        this exactly once, after 'base' has already been run (so 'base's
        reported n_variables excludes these aux vars) and before the
        leaf-C1 run is built. Idempotency is the caller's responsibility --
        call once per encoder instance."""
        before = len(self.cnf.clauses)
        self.cnf.at_most_sinz([self.del_[p] for p in self.DEL_DOMAIN], 2)
        clauses = list(self.cnf.clauses[before:])
        self.del3_clauses = clauses
        return clauses

    # -- section 5: leaf C1 delta --------------------------------------------

    def leaf_c1_delta_clauses(self, del3_extra: Sequence[tuple[int, ...]]) -> list[tuple[int, ...]]:
        """(C6.9) projected source-row survival clause; (C9.3) unit
        ~srcU; (DEL2)+(DEL3); (C9.4)-subsumes-(C9.2) placement:
        b(xu,zd) v b(xu,u) v b(xu,v) v b(xu,xv).
        `del3_extra` must be the (already-built, see build_del3_clauses)
        (DEL3) clause list -- passed in rather than read off self.del3_clauses
        so callers control build ordering explicitly, matching a_core's
        run.py convention for (DEL3)/(DEL2) placement."""
        b = self.b
        clauses: list[tuple[int, ...]] = list(self.c69_clauses)
        clauses.append((-self.srcU,))
        clauses += list(self.del2_clauses)
        clauses += list(del3_extra)
        clauses.append(
            (b[("xu", "zd")], b[("xu", "u")], b[("xu", "v")], b[("xu", "xv")])
        )
        return clauses

    # -- section 5: leaf C2 extension (fresh label P, built last) -----------

    def build_leaf_c2_extension(self) -> list[tuple[int, ...]]:
        """Leaf-C2-only atoms/clauses: fresh label P (C8.2: P in A\\Gamma2,
        baked distinct from the five T-labels and from oth; C10.1: P!=a2,
        baked -- no eq atom needed, matching A's gamma!=a2 pattern), its eq
        atoms to {a0,a1,qh,wh,f1,f2}, gamma-style cap atoms, the (COL)
        collision family, (COL-E8), and (E5C).  NO w_s / MC-core atoms:
        (C10.2) selects the collision arm outright, and the MC core is not
        given data in this leaf (sound omission of the unexercised right
        arm of (C8.6), per C spec section 5).

        Must be called AFTER every other run so it is the only thing that
        ever mutates self.cnf past self.base_clauses -- same call-ordering
        contract as A's build_a1_extension."""

        before = len(self.cnf.clauses)
        p_targets = ("a0", "a1", "qh", "wh", "f1", "f2")
        p_eq: dict[str, int] = {}
        for t in p_targets:
            p_eq[t] = self._new(f"eq(P,{t})")
        self.leaf_c2_names["P_eq"] = p_eq
        # P baked distinct from SHELL_GROUP and oth (C8.2: P in A\Gamma2,
        # Gamma2 = {zd}+I_u+I_v = SHELL_GROUP; oth in Gamma2 by (C6.6)) and
        # from a2 (C10.1) -- no clause needed, matching how the 13 labels'
        # baked distinctness needs no clause (label absence from p_targets
        # IS the baked-distinctness assertion).

        # (EQ1)-per-baked-group for P's own targets (same fix as A's gamma:
        # without this, P could coincide with BOTH a0 and a1, or with
        # several of qh/wh/f1/f2, simultaneously -- not a model of
        # anything, since those groups are themselves baked pairwise
        # distinct).
        for group in (MOSER_GROUP, FRONTIER_GROUP):
            targets = [p_eq[t] for t in group if t in p_eq]
            if len(targets) >= 2:
                self.cnf.at_most_sinz(targets, 1)

        # (EQ4) transitivity for P's triangles: for every pair t1,t2 of P's
        # own eq-targets that themselves carry a real eq(t1,t2) atom among
        # the 13 labels, add all three rotations.  Only the four
        # {P,a0,X} triangles for X in {qh,wh,f1,f2} qualify (same reasoning
        # as A's gamma).
        for t1, t2 in combinations(p_targets, 2):
            e_t1t2 = self._eq_var(t1, t2)
            if e_t1t2 is not None:
                self._add_eq4_triangle(p_eq[t1], e_t1t2, p_eq[t2])

        # Gamma-style cap atoms inSig_P/inO1i_P/inO2i_P/moser_P (A spec
        # section 9, A1-ext v1.2 pattern, verbatim -- C spec section 5
        # explicitly re-cites this pattern).  No inT_P atom: P !in Gamma2
        # is (C8.2), definitional.  P is NOT linked into the integer layer
        # (sound omission, same reasoning as A's gamma).
        moser_p = self._new("moser(P)")
        insig_p = self._new("inSig(P)")
        ino1i_p = self._new("inO1i(P)")
        ino2i_p = self._new("inO2i(P)")
        eq_p_a0 = p_eq["a0"]
        eq_p_a1 = p_eq["a1"]
        self.add(-moser_p, eq_p_a0, eq_p_a1)
        self.add(-eq_p_a0, moser_p)
        self.add(-eq_p_a1, moser_p)
        self.add(moser_p, insig_p, ino1i_p, ino2i_p)
        self.add(moser_p, -insig_p, -ino1i_p)
        self.add(moser_p, -insig_p, -ino2i_p)
        self.add(moser_p, -ino1i_p, -ino2i_p)
        self.add(-moser_p, -insig_p)
        self.add(-moser_p, -ino1i_p)
        self.add(-moser_p, -ino2i_p)
        for t in ("qh", "wh", "f1", "f2"):
            egt = p_eq[t]
            for phi_p, phi in (
                (insig_p, self.inSig), (ino1i_p, self.inO1i), (ino2i_p, self.inO2i),
            ):
                pt = phi[t]
                self.add(-egt, -phi_p, pt)
                self.add(-egt, phi_p, -pt)
        self.leaf_c2_names["P_cap"] = {
            "moser": moser_p, "inSig": insig_p, "inO1i": ino1i_p, "inO2i": ino2i_p,
        }

        # (COL) collision family [(C10.2)]: atoms col(s,t) over the 10
        # unordered T-label (SHELL_GROUP) pairs; >=1 (at-least-one);
        # col(s,t) -> del(s) & del(t).  No distinctness clause needed
        # (SHELL_GROUP is baked pairwise distinct).
        col: dict[frozenset[str], int] = {}
        for s, t in combinations(SHELL_GROUP, 2):
            var = self._new(f"col({s},{t})")
            col[frozenset((s, t))] = var
        self.leaf_c2_names["col"] = col
        self.add(*col.values())
        for pair, var in col.items():
            s, t = tuple(pair)
            self.add(-var, self.del_[s])
            self.add(-var, self.del_[t])

        # (COL-E8) [(C3.8)]: a collision pair coincident with {q_I,w_I}
        # puts P on their bisector: col(s,t) & eq(s,qh) & eq(t,wh) ->
        # inO1i_P v eq(P,a1), instantiated for every (s,t,orientation)
        # where both eq atoms exist.  Every SHELL_GROUP label now carries
        # eq atoms to both qh and wh (u's new frontier eq atoms, section 3
        # amendment), so both orientations exist for all 10 pairs.
        for pair, var in col.items():
            s, t = tuple(pair)
            for a, b_ in ((s, t), (t, s)):
                eq_a_qh = self._eq_var(a, "qh")
                eq_b_wh = self._eq_var(b_, "wh")
                if eq_a_qh is not None and eq_b_wh is not None:
                    self.add(-var, -eq_a_qh, -eq_b_wh, ino1i_p, eq_p_a1)

        # (E5C) restoration radius capture [(C8.4)+(C8.5)+(C3.5)]: for each
        # T-label s: eq(P,a1) & del(s) -> cl1(s).
        for s in SHELL_GROUP:
            self.add(-eq_p_a1, -self.del_[s], self.cl1[s])

        # DEL1 only (already in base, unconditional) -- no DEL2/DEL3 here
        # (both need P=a2, i.e. leaf C1 only).

        # C6.9 is shared by both physical verdict leaves but absent from
        # the abstract/common base.  Prepend the stashed existing-variable
        # clause to C2's freshly allocated extension delta.
        return list(self.c69_clauses) + list(self.cnf.clauses[before:])


class RunInstance:
    """Duck-typed adapter matching the (.dimacs, .decode_model) interface
    that census.card_head.sat_encoding.solve_cadical expects from a
    CoverInstance.  Decodes to the full named-atom table."""

    def __init__(self, encoder: CCoreEncoder, base_clauses: Sequence[tuple[int, ...]]) -> None:
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

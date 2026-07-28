"""Layer-1 encoder for the E-package tri-apex directed-omission leaf.

Implements ``census/frontier-packages/E-ENCODING-SPEC.md`` (v1.0) sections
1-3 exactly (every clause-emitting block below carries the spec's tag in a
comment).  Standalone package: E does NOT share the A/C-core Gamma_2 label
skeleton (see spec header); it reuses only the CNF/Sinz/solve machinery of
``census/card_head/sat_encoding.py`` and follows the a_core code style
(``census/frontier-packages/a_core/encoding.py``), including its
``RunInstance`` duck-typed adapter pattern for ``solve_cadical``.

SOUNDNESS DISCIPLINE (binding, per spec + A spec header): a clause may only
assert what the package hypotheses prove.  Every clause-emitting call below
is commented with its spec tag.  Genuine spec ambiguities encountered during
implementation are called out in comments tagged AMBIGUITY and are also
logged in RESULTS.md verbatim with the offending spec line quoted.
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
    "MOSER_GROUP",
    "X_GROUP",
    "Q_GROUP",
    "EEncoder",
    "RunInstance",
]

# ---------------------------------------------------------------------------
# Section 1: point universe (7 labels)
# ---------------------------------------------------------------------------

LABELS: tuple[str, ...] = ("a0", "a1", "a2", "x1", "x2", "qb", "wb")

# Sentinel blocker-map target: b(x, OUT) = "beta(x) has no witness among the
# 7 labels".  Not a label: never gets eq/moser/cap/g1/row/notRob atoms.
OUT = "OUT"

MOSER_GROUP: tuple[str, ...] = ("a0", "a1", "a2")
X_GROUP: tuple[str, ...] = ("x1", "x2")
Q_GROUP: tuple[str, ...] = ("qb", "wb")
# Baked-pairwise-distinct groups used by the (EQ1) at-most-one schema (spec
# section 1: "a0,a1,a2 pairwise (Moser); x1!=x2 (E4.1); qb!=wb (E2.1)").
BAKED_GROUPS: tuple[tuple[str, ...], ...] = (MOSER_GROUP, X_GROUP, Q_GROUP)

# Explicit eq-atom list, transcribed verbatim from spec section 1 ("Eq
# atoms: {x1,x2}x{qb,wb}; {qb,wb}xa0 ... Six atoms total.").  Every
# unordered label pair NOT covered here is baked pairwise distinct (no eq
# atom): a0/a1/a2 pairwise, x1 vs {a0,a1,a2,qb,wb} (only qb/wb carry eq
# atoms to x1, not a0/a1/a2 -- spec's baked-distinctness paragraph puts
# x1,x2 !in {a0,a1,a2} under (E4.3)), likewise x2, and qb/wb vs a1/a2/x1x2-
# baked-in-reverse (already covered by the {x1,x2}x{qb,wb} group).
_EQ_GROUPS: tuple[tuple[tuple[str, ...], tuple[str, ...]], ...] = (
    (X_GROUP, Q_GROUP),  # {x1,x2} x {qb,wb}
    (Q_GROUP, ("a0",)),  # {qb,wb} x a0
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


class EEncoder:
    """Builds the E-package 'base' CNF (spec sections 1-3, THE package
    verdict run -- E has one leaf, no leaf deltas/context block unlike
    A-core).  ``base+dom1``/``base+dom2`` are unit extensions returned by
    ``dom_unit_clause``.
    """

    MAXN = 24
    INT_VARS: tuple[str, ...] = ("nSig", "nO1", "nO2", "n", "nN", "nG1", "nG1O1")
    B_DOMAIN: tuple[str, ...] = ("x1", "x2", "qb", "wb")
    QS_DOMAIN: tuple[str, ...] = ("a0", "a1", "a2", "x1", "x2", "wb")  # labels \ {qb}

    def __init__(self) -> None:
        self.cnf = CNF()
        self.names: dict[str, int] = {}
        self.by_var: dict[int, str] = {}

        self.eq: dict[frozenset[str], int] = {}
        self.moser: dict[str, int] = {}
        self.inSig: dict[str, int] = {}
        self.inO1i: dict[str, int] = {}
        self.inO2i: dict[str, int] = {}
        self.g1: dict[str, int] = {}
        self.row1: dict[str, int] = {}
        self.row2: dict[str, int] = {}
        self.b: dict[tuple[str, str], int] = {}
        self.notRob: dict[str, int] = {}
        self.qs1: dict[str, int] = {}
        self.qs2: dict[str, int] = {}
        self.dom1 = 0
        self.dom2 = 0
        self.e24a = 0
        self.e24b = 0
        self.e8_arms: dict[str, int] = {}  # keys e81_a,e81_b,e82_a,e82_b,e8s_a,e8s_b
        self.int_val: dict[str, dict[int, int]] = {}

        self._build()
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
        self._build_g1()
        self._build_rows()
        self._build_dom()
        self._build_blocker()
        self._build_notrob()
        self._build_cd()
        self._build_arms()
        self._build_integers()
        self._build_eq_consistency()

    # -- eq atoms [section 1] ----------------------------------------------

    def _build_eq(self) -> None:
        for pair in sorted(EQ_PAIRS, key=lambda fs: tuple(sorted(fs))):
            p, q = sorted(pair)
            self.eq[pair] = self._new(f"eq({p},{q})")

    # -- moser(p) definition [section 2, "Caps" preamble] -------------------

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

    # -- (CAP1)/(CAP2) + interior units [section 2 "Caps"] -------------------

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
        # Units [(E4.3)]: inO1i(x1)=inO1i(x2)=T
        self.add(self.inO1i["x1"])
        self.add(self.inO1i["x2"])
        # Units [(E2.1)]: ~inSig(qb), ~inSig(wb) (qb,wb !in sC ⊇ Sigma^o;
        # sound for the moser-coincident case too via CAP2, since
        # moser(qb)=T forces inSig(qb)=F anyway by CAP2 -- the unit is the
        # tighter of the two and subsumes CAP2 here).
        self.add(-self.inSig["qb"])
        self.add(-self.inSig["wb"])

    # -- frontier class g1(p) [section 2 "Frontier class"] --------------------

    def _build_g1(self) -> None:
        for p in LABELS:
            self.g1[p] = self._new(f"g1({p})")
        # Units: g1(x1)=g1(x2)=g1(qb)=g1(wb)=T; g1(a1)=F (rho_0>0).
        for p in ("x1", "x2", "qb", "wb"):
            self.add(self.g1[p])
        self.add(-self.g1["a1"])
        # "NO exactness -- (E3.4) is a lower bound only": unlike (CL1) in
        # the A spec, there is no clause deriving g1(p) from eq atoms and no
        # clause constraining g1(a0)/g1(a2) at all.  Left genuinely free.

    # -- rows row1, row2 [section 2 "Rows"] -----------------------------------

    def _build_rows(self) -> None:
        for p in LABELS:
            self.row1[p] = self._new(f"row1({p})")
            self.row2[p] = self._new(f"row2({p})")
        # Units [x in Sigma(x)]: row1(x1)=T, row2(x2)=T.  No other units --
        # in particular row1(x2)/row2(x1) are left UNCONSTRAINED (that is
        # exactly the coradiality the (E4.5)/dom clauses below constrain
        # conditionally).
        self.add(self.row1["x1"])
        self.add(self.row2["x2"])
        # (ER1) at-most-4 over the pairwise-distinct 5-set
        # {x1,x2,a0,a1,a2} [|Sigma|=4], for row1 and row2 alike.
        five_set = ("x1", "x2", "a0", "a1", "a2")
        self.cnf.at_most_sinz([self.row1[p] for p in five_set], 4)
        self.cnf.at_most_sinz([self.row2[p] for p in five_set], 4)
        # (ER2) [(E6.5) + row coradiality]: ~(row1(a0) & row1(a1) & row1(a2));
        # same for row2.  Congruence over eq atoms extends this
        # automatically via the generic (EQ3) pass below (row1/row2 are
        # ordinary unary families).
        self.add(-self.row1["a0"], -self.row1["a1"], -self.row1["a2"])
        self.add(-self.row2["a0"], -self.row2["a1"], -self.row2["a2"])

    # -- directed-omission arms [(E4.5)] --------------------------------------

    def _build_dom(self) -> None:
        self.dom1 = self._new("dom1")
        self.dom2 = self._new("dom2")
        self.add(self.dom1, self.dom2)  # dom1 v dom2
        self.add(-self.dom1, -self.row1["x2"])  # dom1 -> ~row1(x2)
        self.add(-self.dom2, -self.row2["x1"])  # dom2 -> ~row2(x1)
        # "(The K4-survival conjuncts have no projection at this layer --
        # sound omission, note it.)": no further clause.

    # -- blocker map b(x,y) [section 2 "Blocker map"] -------------------------

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
        # (BM2) ~b(x,x) [A spec verbatim]; eq congruence: eq(p,q) -> ~b(p,q)
        # (both orderings, when the source side is in B_DOMAIN).
        for x in self.B_DOMAIN:
            self.add(-self.b[(x, x)])
        for pair in EQ_PAIRS:
            p, q = tuple(pair)
            ev = self.eq[pair]
            if p in self.B_DOMAIN:
                self.add(-ev, -self.b[(p, q)])
            if q in self.B_DOMAIN:
                self.add(-ev, -self.b[(q, p)])
        # (EBM3) ~b(x,ai) for ALL x in B_DOMAIN and ALL THREE apices
        # [three independent justifications cited in the spec: (i)
        # unique-four-ness broken by apex richness, (ii) banked
        # e1_apices_not_mem_notRobustCenters + every blocker center
        # non-robust, (iii) a2-only via (E5.1)+blocking].  "Congruence
        # handles eq(y,a0) labels" -- supplied generically by (EQ3) below.
        for x in self.B_DOMAIN:
            for apex in MOSER_GROUP:
                self.add(-self.b[(x, apex)])
        # (EBM4) [(E4.4)]: ~b(x1,y) v ~b(x2,y) per y.
        # AMBIGUITY: spec says "per y" without restricting the range, which
        # formally includes OUT (b(x,OUT) = "x has no blocker among the 7
        # labels").  (E4.4) only proves c(x1)!=c(x2) as *witness points* in
        # A; both blockers being unlabeled (OUT) simultaneously is not
        # excluded by that fact.  Per the soundness discipline and matching
        # the A spec's own resolution of the identical ambiguity in
        # (BM7)/(BM8)/(BM9) (a_core/encoding.py, same AMBIGUITY comment):
        # resolve y to the 7 LABELS ONLY, excluding OUT.  Logged in
        # RESULTS.md.
        for y in LABELS:
            self.add(-self.b[("x1", y)], -self.b[("x2", y)])
        # (EBM5) center not in own row: b(xi,y) -> ~rowi(y), i in {1,2}.
        # (No row atoms for qb/wb -- no clause, per spec parenthetical.)
        for y in LABELS:
            self.add(-self.b[("x1", y)], -self.row1[y])
            self.add(-self.b[("x2", y)], -self.row2[y])

    # -- non-robust centers notRob(p) [section 2] ------------------------------

    def _build_notrob(self) -> None:
        for p in LABELS:
            self.notRob[p] = self._new(f"notRob({p})")
        # Units [banked e1_apices_not_mem_notRobustCenters]:
        # notRob(a0)=notRob(a1)=notRob(a2)=F.
        for apex in MOSER_GROUP:
            self.add(-self.notRob[apex])
        # (EN1) b(x,y) -> notRob(y) for tracked owners x in B_DOMAIN, label
        # y in LABELS (blocking makes every blocker center non-robust,
        # witness z=x).
        for x in self.B_DOMAIN:
            for y in LABELS:
                self.add(-self.b[(x, y)], self.notRob[y])

    # -- CD projections qs1, qs2 [(E3.6), CD_H(qb; a1, a2)] --------------------

    def _build_cd(self) -> None:
        for p in self.QS_DOMAIN:
            self.qs1[p] = self._new(f"qs1({p})")
            self.qs2[p] = self._new(f"qs2({p})")
        # ~qs1(a1) [B1 subset A\{qbar,a1}]; ~qs2(a2) [B2 subset A\{qbar,a2}].
        self.add(-self.qs1["a1"])
        self.add(-self.qs2["a2"])
        # At-most-2 of the product qs1 & qs2 over {x1,x2} [(E3.6)
        # |B1 (intersect) B2| <= 2; only provably-distinct pairs counted].
        # Thin -- tagged for honesty in the spec; with only 2 tracked
        # elements the Sinz bound-2 call is a structural no-op (CNF.
        # at_most_sinz returns immediately when count<=bound), but the
        # product ("and_") atoms are still created for fidelity to "via
        # product atoms".
        prods = []
        for p in ("x1", "x2"):
            and_v = self._new(f"and_qs1_qs2({p})")
            self.add(-and_v, self.qs1[p])
            self.add(-and_v, self.qs2[p])
            self.add(-self.qs1[p], -self.qs2[p], and_v)
            prods.append(and_v)
        self.cnf.at_most_sinz(prods, 2)

    # -- frontier-split / rich-interior arm selectors [section 2] --------------

    def _build_arms(self) -> None:
        # (ES1) [(E2.4)]: e24a v e24b; e24b -> nG1<=5 (the nG1<=5 half is
        # added inside _build_integers, once the integer var exists).
        self.e24a = self._new("e24a")
        self.e24b = self._new("e24b")
        self.add(self.e24a, self.e24b)
        # (ES2) [(E8.1)-(E8.3)]: e8i_a v e8i_b for i in {1,2,s} (six atoms,
        # three disjunctions).  Only e81_a has a further consequence at
        # this layer ((EI4)); the rest are recorded arms (CEGAR hooks).
        for i in ("1", "2", "s"):
            a = self._new(f"e8{i}_a")
            b = self._new(f"e8{i}_b")
            self.e8_arms[f"e8{i}_a"] = a
            self.e8_arms[f"e8{i}_b"] = b
            self.add(a, b)
        # (E2.6): left disjunct discharged by (E2.5) -- NO exact-4
        # a2-class data; nothing encoded (same reasoning as the C spec
        # dropping A's (N8)/(FB)).

    # -- integer layer [section 3] --------------------------------------------

    def _build_int_var(self, name: str) -> dict[int, int]:
        vals: dict[int, int] = {}
        for i in range(self.MAXN + 1):
            vals[i] = self._new(f"{name}={i}")
        self.int_val[name] = vals
        vs = list(vals.values())
        self.add(*vs)  # at-least-one
        self.cnf.at_most_sinz(vs, 1)  # exactly-one (unary/direct value encoding)
        return vals

    def _int_ge(self, name: str, threshold: int, trigger: int | None = None) -> None:
        """Assert name>=threshold, optionally gated by `trigger`."""
        vals = self.int_val[name]
        for i in range(min(threshold, self.MAXN + 1)):
            if trigger is None:
                self.add(-vals[i])
            else:
                self.add(-trigger, -vals[i])

    def _int_le_int(self, left: str, right: str) -> None:
        """Assert left <= right by forbidding every (i,j) combo with i>j."""
        left_vals, right_vals = self.int_val[left], self.int_val[right]
        for i in range(self.MAXN + 1):
            for j in range(self.MAXN + 1):
                if i > j:
                    self.add(-left_vals[i], -right_vals[j])

    def _int_lt_int(self, left: str, right: str) -> None:
        """Assert left < right (left <= right-1) by forbidding i>=j combos."""
        left_vals, right_vals = self.int_val[left], self.int_val[right]
        for i in range(self.MAXN + 1):
            for j in range(self.MAXN + 1):
                if i >= j:
                    self.add(-left_vals[i], -right_vals[j])

    def _int_le_const(self, name: str, bound: int, trigger: int | None = None) -> None:
        """Assert name<=bound, optionally gated by `trigger`."""
        vals = self.int_val[name]
        for i in range(bound + 1, self.MAXN + 1):
            if trigger is None:
                self.add(-vals[i])
            else:
                self.add(-trigger, -vals[i])

    def _build_integers(self) -> None:
        for name in self.INT_VARS:
            self._build_int_var(name)
        sig, o1, o2, n = (self.int_val[k] for k in ("nSig", "nO1", "nO2", "n"))
        # (EI1) n = nSig + nO1 + nO2 + 3 [cap partition]; full [0,MAXN]^3
        # cube, same discipline as a_core's (N1) -- see that file's
        # comment for why the "forbid overflow combos" half is needed, not
        # merely the forward implication.
        for i in range(self.MAXN + 1):
            for j in range(self.MAXN + 1):
                for k in range(self.MAXN + 1):
                    total = i + j + k + 3
                    if total > self.MAXN:
                        self.add(-sig[i], -o1[j], -o2[k])
                    else:
                        self.add(-sig[i], -o1[j], -o2[k], n[total])
        # n > 9 (E3.3) -- subsumed by the (EI2) floors below but asserted
        # anyway (cheap), per spec.
        self._int_ge("n", 10)
        # (EI2) closed-cap floors [(E5.2)-(E5.4)]: nO1>=4, nO2>=4, nSig>=4.
        # (Derived n>=15 follows by (EI1) propagation once all three floors
        # hold simultaneously -- record in RESULTS, no extra clause.)
        self._int_ge("nO1", 4)
        self._int_ge("nO2", 4)
        self._int_ge("nSig", 4)
        # (EI3) cover bound [(E6.4)]: n <= 4*nN; nN <= n.
        n_vals, nn_vals = self.int_val["n"], self.int_val["nN"]
        for i in range(self.MAXN + 1):  # i = n value
            for k in range(self.MAXN + 1):  # k = nN value
                if i > 4 * k:
                    self.add(-n_vals[i], -nn_vals[k])
        self._int_le_int("nN", "n")
        # Membership links: >=k of {notRob(x1), notRob(x2)} true -> nN>=k
        # (the only provably-distinct non-apex labels; apices are
        # notRob=F).  Same "ban nN=k-1 under the k-subset" pattern as
        # a_core's (N7).
        x_notrob = [self.notRob["x1"], self.notRob["x2"]]
        for k in range(1, len(x_notrob) + 1):
            for subset in combinations(x_notrob, k):
                clause = [-lit for lit in subset]
                clause.append(-nn_vals[k - 1])
                self.add(*clause)
        # (EI4) rich-interior capture [(E2.4)(b) + (E8.1)(a)]: e24b & e81_a
        # -> nG1O1 >= 4.  AND-helper for the conjunctive trigger.
        and_e24b_e81a = self._new("and_e24b_e81a")
        self.add(-and_e24b_e81a, self.e24b)
        self.add(-and_e24b_e81a, self.e8_arms["e81_a"])
        self.add(-self.e24b, -self.e8_arms["e81_a"], and_e24b_e81a)
        self._int_ge("nG1O1", 4, trigger=and_e24b_e81a)
        # (ES1) second half, deferred from _build_arms until nG1 exists:
        # e24b -> nG1 <= 5 (|G1| in {4,5}).
        self._int_le_const("nG1", 5, trigger=self.e24b)
        # (EI5) structural links: nG1O1<=nG1; nG1O1<=nO1; nG1>=4 (E3.4);
        # nG1<=n-1 (a1 in A\G1); nG1O1>=2 via the pairwise-distinct pair
        # {x1,x2} (both in G1 (intersect) C1^o by units -- unconditional).
        self._int_le_int("nG1O1", "nG1")
        self._int_le_int("nG1O1", "nO1")
        self._int_ge("nG1", 4)
        self._int_lt_int("nG1", "n")
        self._int_ge("nG1O1", 2)

    # -- (EQ1)/(EQ2)/(EQ3)/(EQ4) consistency schemas [A spec, "as in A"] -------

    def _build_eq_consistency(self) -> None:
        # (EQ1) at-most-one: for label p and baked-pairwise-distinct group G
        # (one of MOSER_GROUP/X_GROUP/Q_GROUP), at most one of
        # {eq(p,l): l in G} holds.
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
        # atom family (inSig,inO1i,inO2i,moser,g1,row1,row2,notRob,qs1,qs2,
        # each restricted to its own domain via dict membership), and for
        # beta: eq(p,q) -> (b(p,y)<->b(q,y)) [both p,q in B_DOMAIN] and
        # (b(x,p)<->b(x,q)) [always, y ranges over LABELS -- OUT is not an
        # eq target].
        unary_families: tuple[dict[str, int], ...] = (
            self.inSig, self.inO1i, self.inO2i, self.moser, self.g1,
            self.row1, self.row2, self.notRob, self.qs1, self.qs2,
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
                for y in list(LABELS):
                    bp, bq = self.b[(p, y)], self.b[(q, y)]
                    self.add(-ev, -bp, bq)
                    self.add(-ev, bp, -bq)
            for x in self.B_DOMAIN:
                bp, bq = self.b[(x, p)], self.b[(x, q)]
                self.add(-ev, -bp, bq)
                self.add(-ev, bp, -bq)
        # (EQ4) transitivity: for every label triple p,q,r whose three
        # pairs all carry eq atoms, eq(p,q) & eq(q,r) -> eq(p,r), all three
        # rotations.  Verified (spec section 1 EQ4 note): the E-package's
        # six eq atoms form two disjoint stars (a0-{qb,wb} and
        # {x1,x2}x{qb,wb}, a bipartite K_{2,2}) with NO triangle -- no
        # label triple has all three pairwise eq atoms.  This loop is kept
        # for structural parity with the A spec's schema and as a live
        # regression check: it emits zero clauses (see RESULTS.md).
        emitted = 0
        for p, q, r in combinations(LABELS, 3):
            e_pq = self._eq_var(p, q)
            e_qr = self._eq_var(q, r)
            e_pr = self._eq_var(p, r)
            if e_pq is not None and e_qr is not None and e_pr is not None:
                self._add_eq4_triangle(e_pq, e_qr, e_pr)
                emitted += 1
        self.eq4_triangles_found = emitted

    def _add_eq4_triangle(self, e_ab: int, e_bc: int, e_ac: int) -> None:
        """(EQ4): given the three edge variables of one eq-triangle, assert
        each pair of edges implies the third (all three rotations)."""
        self.add(-e_ab, -e_bc, e_ac)
        self.add(-e_bc, -e_ac, e_ab)
        self.add(-e_ac, -e_ab, e_bc)

    # -- section 4: run extensions ---------------------------------------------

    def ge_clauses(self, name: str, threshold: int) -> list[tuple[int, ...]]:
        """Extra-clause list (does NOT mutate self.cnf) banning name's
        values below `threshold` -- i.e. asserts name>=threshold.  Used by
        probes that need an integer-layer assumption without touching the
        frozen base clause set (mirrors a_core/encoding.py's
        ``_ge_clauses``)."""
        vals = self.int_val[name]
        return [(-vals[i],) for i in range(min(threshold, self.MAXN + 1))]

    def le_clauses(self, name: str, bound: int) -> list[tuple[int, ...]]:
        """Extra-clause list (does NOT mutate self.cnf) banning name's
        values above `bound` -- i.e. asserts name<=bound."""
        vals = self.int_val[name]
        return [(-vals[i],) for i in range(bound + 1, self.MAXN + 1)]

    def dom_unit_clause(self, arm: str) -> list[tuple[int, ...]]:
        """base+domX (X in {1,2}): unit dom1 resp. dom2 (spec section 4)."""
        if arm == "dom1":
            return [(self.dom1,)]
        if arm == "dom2":
            return [(self.dom2,)]
        raise EncodingError(f"unknown dom arm {arm}")


class RunInstance:
    """Duck-typed adapter matching the (.dimacs, .decode_model) interface
    that census.card_head.sat_encoding.solve_cadical expects from a
    CoverInstance.  Decodes to the full named-atom table, not a candidate
    cube (there is no cube concept in this package) -- identical pattern to
    a_core/encoding.py's RunInstance."""

    def __init__(self, encoder: EEncoder, base_clauses: Sequence[tuple[int, ...]]) -> None:
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

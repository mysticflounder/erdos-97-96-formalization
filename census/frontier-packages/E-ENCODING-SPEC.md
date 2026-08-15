# E-package Layer-1 encoding — specification (2026-08-04, v1.1)

Session-2 artifact of `docs/computational-closure-plan-2026-07-28.md` (§5
row 3, §8). Source of truth:
`docs/solve-prompts/2026-07-27-tri-apex-directed-omission.md` §1–§2 (tags
(E0)–(E9)); leaf E1 `false_of_retainedInteriorDirectedOmission_and_all_low_hits`.
Standalone spec (E does NOT share A/C's Γ₂ skeleton); it amortizes only the
CNF/Sinz/integer machinery of `census/card_head/sat_encoding.py` and the
a_core code style. Implementation: `census/frontier-packages/e_core/`.
The A spec's soundness discipline header is binding verbatim.

**Expectation (stated up front):** the 15-point equality shadow
(`scratch/triapex-incidence-obstruction/`) satisfies the counting core
(E6.4/E7/E8/E9) — reconfirmed independently by the E round-1 response — so
the honest expected verdict is SAT. The encoder's value: (1) an audited,
tagged, CEGAR-able platform; (2) the shadow becomes a REAL witness gate
(it was built for THIS package, unlike A/C's downgraded G-SAT); (3) UNSAT
on any future refinement iteration is a sound kill.

## 1. Point universe (7 labels)

| Label | Denotes | Why |
|---|---|---|
| a0,a1,a2 | surplus apex, first/second opposite apices | packet S |
| x1,x2 | the (E4) packet pair | (E4.1) |
| qb,wb | the frontier pair q̄,w̄ | (E2.1) |

Baked distinctness: a0,a1,a2 pairwise (Moser); x1≠x2 (E4.1); qb≠wb (E2.1);
x1,x2 ∉ {a0,a1,a2} ((E4.3): C_{i1}° excludes Moser vertices); qb,wb ≠ a1
(ρ₀>0, derived); qb,wb ≠ a2 (a₂ ∈ sC — opposite apices lie in the surplus
cap, packet S — while q̄,w̄ ∉ sC by (E2.1)).
Eq atoms: {x1,x2}×{qb,wb}; {qb,wb}×a0 (a0 = v_s ∉ C_s = sC, so a0 can lie
in the marginal M). Six atoms total; (EQ1)–(EQ4) schemas as in the A spec
(EQ4 has no full triangle here — verify and note; the schema is a no-op if
no triple has all three atoms).

All four of x1,x2,qb,wb lie in G1 := Γ(a₁,ρ₀) ((E4.2), (E2.1)).

## 2. Atom families

**Caps** inSig/inO1i/inO2i/moser over the 7 labels; (CAP1)/(CAP2) as in A.
Units: inO1i(x1)=inO1i(x2)=T (E4.3); ¬inSig(qb), ¬inSig(wb) (E2.1: ∉sC ⊇
Σ°; sound for the moser-coincident case too via CAP2); moser units for
a0,a1,a2; moser(qb) ↔ eq(qb,a0), moser(wb) ↔ eq(wb,a0).

**Frontier class** g1(p) (p ∈ G1): units g1(x1)=g1(x2)=g1(qb)=g1(wb)=T;
g1(a1)=F (ρ₀>0). NO exactness — (E3.4) is a lower bound only.

**Rows** row1(p), row2(p) (p ∈ Σ(x1), Σ(x2)) over the 7 labels:
- row1(x1)=row2(x2)=T (x ∈ Σ(x)).
- (ER1) at-most-4 over the pairwise-distinct 5-set {x1,x2,a0,a1,a2}
  [|Σ|=4].
- (ER2) [(E6.5) + row coradiality]: ¬(row1(a0) ∧ row1(a1) ∧ row1(a2));
  same for row2. (A row is a circle Γ(c(x),r) with c(x)∈A, r>0; containing
  all three Moser vertices violates (E6.5).) Congruence extends to
  eq-coincident labels automatically.

**Blocker map** b(x,y), x ∈ {x1,x2,qb,wb}, y ∈ labels ∪ {OUT}:
- (BM1) exactly-one; (BM2) ¬b(x,x) + eq congruence (A spec verbatim).
- (EBM3) ¬b(x,aᵢ) for ALL x and ALL THREE apices [three independent
  justifications, cite all: (i) (E7) every c(x) is a unique-four center,
  but (E6.1)/(E6.2)/(E6.3) apex-richness at each apex contradicts
  unique-four-ness there (a ≥6-class breaks the =4 clause; two ≥4-radii
  break uniqueness); (ii) banked `e1_apices_not_mem_notRobustCenters` +
  every blocker center is non-robust (witness z=x); (iii) for a2 only:
  (E5.1) + blocking, as A's (BM3)]. Congruence handles eq(y,a0) labels.
- (EBM4) [(E4.4)]: ¬b(x1,y) ∨ ¬b(x2,y) per y.
- (EBM5) center not in own row: b(xi,y) → ¬rowi(y), i∈{1,2} [row radius
  > 0 puts c(x) off the row]. (No row atoms for qb/wb — no clause.)

**Directed-omission arms** [(E4.5)]: atoms dom1, dom2; dom1 ∨ dom2;
dom1 → ¬row1(x2); dom2 → ¬row2(x1). (The K4-survival conjuncts have no
projection at this layer — sound omission, note it.)

**Non-robust centers** notRob(p) [𝒩 = non-robust carrier centers]:
- notRob(a0)=notRob(a1)=notRob(a2)=F [banked
  `e1_apices_not_mem_notRobustCenters`, kernel-checked over the E1
  binders — legitimate clause source for this package].
- (EN1) b(x,y) → notRob(y) for tracked owners x, label y [blocking makes
  every blocker center non-robust, witness z = x].

**Frontier-split arm selectors**:
- (ES1) [(E2.4)]: e24a ∨ e24b; e24b → nG1 ≤ 5 (|G1| ∈ {4,5}) and e24b
  carries the unique-K4-radius reading used by (EI4) below.
- (ES2) [(E8.1)–(E8.3)]: e8i_a ∨ e8i_b for i ∈ {1,2,s} (six atoms, three
  disjunctions). Only e81_a has a further consequence at this layer
  ((EI4)); the rest are recorded arms (CEGAR hooks).
- (E2.6): left disjunct discharged by (E2.5) — NO exact-4 a₂-class data;
  nothing encoded (same reasoning as the C spec dropping A's (N8)/(FB)).

**CD projections** [(E3.6), CD_H(q̄; a₁, a₂)] qs1(p), qs2(p) over
p ∈ labels∖{qb}: ¬qs1(a1) [B₁ ⊆ A∖{q̄,a₁}]; ¬qs2(a2); congruence via eq
where atoms exist (a qb-coincident label cannot be in either B). At-most-2
of the product qs1∧qs2 over {x1,x2} [(E3.6) |B₁∩B₂| ≤ 2; only provably-
distinct pairs counted]. Thin — tagged for honesty, near-zero pruning
expected.

## 3. Integer layer (unary, exact buckets 0..24 plus GE25)

Every integer variable has one-hot exact buckets `0,...,24` and an overflow
bucket `GE25`, denoting a value at least 25.  Arithmetic is threshold-safe:
an exact sum at most 24 selects its exact output bucket, while any overflow
input or sum above 24 selects `GE25`; comparisons forbid only assignments that
are definitely false.  Thus this finite abstraction is an over-approximation
of the unbounded cardinality domain and does not assume `|A| ≤ 24`.

The old exact-only 0..24 encoding was bounded and must not be used to interpret
an UNSAT result as a universal statement.  All production verdicts below are
valid only after replay under this overflow-aware encoding.

Vars nSig, nO1, nO2 (strict interiors), n, nN (=|𝒩|), nG1 (=|G1|),
nG1O1 (=|G1 ∩ C_{i1}°|).
- (EI1) n = nSig + nO1 + nO2 + 3 [cap partition]; n > 9 (E3.3) — subsumed
  by the floors below but assert anyway (cheap).
- (EI2) closed-cap floors [(E5.2)–(E5.4)]: |Ĉ₁|≥6, |Ĉ₂|≥6, |sC|≥6, each
  closed cap containing exactly 2 Moser vertices ⇒ nO1 ≥ 4, nO2 ≥ 4,
  nSig ≥ 4. (Derived n ≥ 15 follows by (EI1) propagation — record in
  RESULTS, no extra clause.)
- (EI3) cover bound [(E6.4)]: n ≤ 4·nN; nN ≤ n. Membership links: ≥k of
  {notRob(x1), notRob(x2)} true → nN ≥ k (the only provably-distinct
  non-apex labels; apices are notRob=F).
- (EI4) rich-interior capture [(E2.4)(b) + (E8.1)(a)]: e24b ∧ e81_a →
  nG1O1 ≥ 4. Sound: arm (a)'s radius r has |Γ(a₁,r)| ≥ 4, so e24b's
  uniqueness forces r = ρ₀, hence Γ(a₁,r)∩C₁° = G1∩C₁°.
- (EI5) structural links: nG1O1 ≤ nG1; nG1O1 ≤ nO1; nG1 ≥ 4 (E3.4);
  nG1 ≤ n−1 (a₁ ∈ A∖G1); nG1O1 ≥ 2 via the pairwise-distinct pair
  {x1,x2} (both in G1∩C₁° by units).

(E9) low-hit: at 7 labels every instance degenerates (each row can meet
{x1,x2} — the only distinct pair in G1∩C₁° — in ≤ 2 points trivially).
NOT encoded; this is the honest boundary of Layer 1 and the first CEGAR
target (encode class-member labels for G1 to give (E9) bite). Record in
backlog.

## 4. Runs

1. `base`: everything above. This is the package verdict run (E has one
   leaf; no deltas).
2. `base+domX` (X ∈ {1,2}): unit dom1 resp. dom2 — arm-isolation runs
   (both expected SAT; an UNSAT arm would be a real one-arm kill).

## 5. Smoke gates

- G-BASE: `base` SAT expected (see Expectation). A-spec STOP discipline
  on UNSAT applies — audit before reporting; an audited UNSAT here would
  contradict the shadow finding and most likely means an encoding bug OR
  that a tagged family exceeds what the shadow satisfies; find which.
- **G-SHADOW (the real gate)**: read
  `scratch/triapex-incidence-obstruction/check_model.py` and its
  REPORT/findings; map the 15-point shadow onto the atoms (its points →
  the 7 labels where named; its counting data → the integer layer:
  n=15, cap sizes, 𝒩; its rows → row1/row2 where the shadow names the
  packet pair). Assert as assumptions on base; expect SAT. Document the
  mapping point-by-point in RESULTS.md. If some atom family cannot be
  faithfully instantiated from the shadow, leave it free and say so — do
  NOT invent values.
- P-EBM3: base + b(x1,a1) → UNSAT (DRAT).
- P-ER2: base + row1(a0) ∧ row1(a1) ∧ row1(a2) → UNSAT (DRAT).
- P-DOM: base + ¬dom1 ∧ ¬dom2 → UNSAT (DRAT).
- P-EI34: base + e24b ∧ e81_a + (nG1O1 ≤ 3 via unary negation) → UNSAT
  (DRAT).
- P-COVER: base + (n ≥ 16 via unary) + (nN ≤ 3) → UNSAT (DRAT).

## 6. Change control & backlog

Change control identical to the A spec §8. Backlog (sound omissions):
(E9) beyond the degenerate instances (needs G1 member labels — first
CEGAR target); (E4.5)'s K4-survival conjuncts; (E3.5)/(E2.2)/(E2.5) K4
facts about unlabeled witnesses; (E3.1) minimality; (E3.2) noM44;
(E6.1)–(E6.3) beyond their use in (EBM3) (the rich-structure witnesses
are unlabeled); (E7) items 2–3 beyond (EBM3) (functional-cover structure
is Layer-2).

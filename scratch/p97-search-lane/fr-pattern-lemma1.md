# FR Lemma 1 (forbidden cut-matrix patterns) — transcription + proof state (2026-07-28)

Source: Fishburn–Reeds 1992 §3 (pp. 87–88), Fig. 4 read at 600 dpi from
the locally held PDF. Lemma 1's proof is OMITTED in the paper
("straightforward case-by-case"); admission of any P-pattern as a
census pruning rule requires OUR OWN proof, adversarially audited.
Status ledger at the bottom.

## Setting (p. 87, restated)

{A, B} is a cut of a convex n-gon's vertex set: A, B complementary
CONTIGUOUS ARCS of the cyclic vertex order, α = |A|, β = |B|,
α + β = n. Convention: vertices of a convex polygon are in strictly
convex position (no three collinear). Rows of the cut matrix = A in
convex order, columns = B in convex order.

Rule form we need (subset semantics, sufficient for pruning): a
"pattern of 1's" is FORBIDDEN if there is no strictly convex polygon
with cut {A, B} in which all the pattern's 1-cells are simultaneously
unit distances. (Whether FR's "cut matrix" records exactly the unit
distances or a subset is immaterial for this use; both readings are
closed under taking rectangular submatrices, per p. 87.)

Pattern occurrence = as a submatrix: any rows r₁ < r₂ < ... and
columns c₁ < c₂ < ... realizing the stated cell set; only 1-cells are
constrained (Fig. 4 caption: "• = 1"; blank cells unconstrained).

**Orientation convention: C2 (opposed), PINNED 2026-07-28.** The
traversal of the polygon listing rows in increasing order meets the
columns in DECREASING index order (full cycle = a₁..a_α, b_β..b₁ — the
planar "both sides bottom-to-top" layout of FR's own Table-1
indexing). Discovered by the P2 proof effort: the convention is
load-bearing — under the aligned reading (C1) P2's variant A is
REALIZABLE (exact hexagon witness, sympy + exact-interval verified,
see `fr-pattern-p2-proof-draft.md` §6). Evidence that FR's data is C2:
(a) the certified 20-gon's hull order is pinned by the C1b halfplane
certificate (`fr-certify/`, PASS) as B₁..B₁₀, A₁₀..A₁ — reversing the
traversal, A₁..A₁₀, B₁₀..B₁, i.e. rows ascending meet columns
descending = C2; (b) FR's own 20-gon cut matrix — SYMMETRIC, 30 ones:
each unordered pair {i, j} gives both A_iB_j and A_jB_i (the
mirror-symmetric ansatz makes the two distances the same expression) —
has ZERO P1/P2/P4 occurrences in its native C2 reading but SIXTEEN P2
variant-B occurrences in the C1 (column-reversed) reading
(`p2_convention_checks.py`; correction 2026-07-28: the first committed
scan used a 15-one half-matrix and reported one C1 occurrence;
symmetrization fixed same day, conclusion unchanged and strengthened)
— so FR's Lemma 1 is only true in C2. All pattern statements and
proofs below are read in C2. Valid symmetries
of the C2 cut matrix: transposition (A↔B) and simultaneous reversal of
both axes (plane reflection); single-axis reversal is NOT a symmetry.
P1 is orientation-neutral (K₂,₂ invariant under either axis reversal),
so its proof is unaffected.

## The patterns (Fig. 4)

- **P1 (rectangle, 4 cells)** — HIGH-CONFIDENCE transcription:
  rows r₁ < r₂, cols c₁ < c₂, all four cells
  (r₁,c₁), (r₁,c₂), (r₂,c₁), (r₂,c₂) are 1 (a K₂,₂).

- **P2 (5 cells, two mirror variants)** — HIGH-CONFIDENCE:
  rows r₁ < r₂ < r₃, cols c₁ < c₂ < c₃;
  variant A: {(r₁,c₁), (r₁,c₂), (r₂,c₃), (r₃,c₁), (r₃,c₃)};
  variant B: {(r₁,c₁), (r₁,c₃), (r₂,c₁), (r₃,c₂), (r₃,c₃)}.

- **P3 (6 cells, one general family + transpose)** — decoded from the
  lettered middle/right drawings (HIGH confidence) with the plain left
  drawing an instance (MY INFERENCE, flagged):
  general family (orientation 1): cells
  {(r_a,c₁), (r_a,c_k), (r_b,c₁), (r_c,c₂), (r_d,c₂), (r_d,c_h)}
  with rows r_a < r_b, r_c < r_d, r_a < r_c, r_b < r_d (r_b vs r_c
  unconstrained) and cols c₁ < c_k ≤ c_h < c₂. Orientation 2 =
  transpose (paper annotations "rows: b<d, a<c; cols: k≤h" vs
  "cols: b<d, a<c; rows: k≤h"). The plain drawing is the instance
  r_b = r_c, c_k = c_h:
  {(r₁,c₁),(r₁,c₂),(r₂,c₁),(r₂,c₃),(r₃,c₂),(r₃,c₃)} — a 6-cycle in
  the bipartite incidence graph.

- **P4 (2k cells, k ≥ 3, two mirror variants)** — HIGH confidence
  (two independent 600 dpi inspections of the original PDF, page 8 /
  printed p. 88; the printed inequality is `k ≥ 3`):
  cyclic monotone staircase: rows ρ₁ < ... < ρ_k, cols c₁ < ... < c_k;
  variant A cells: row ρᵢ has 1's at c_{k−i} and c_{k−i+1} for
  i = 1..k−1, and the wrap row ρ_k has 1's at c₁ and c_k. (As a
  bipartite graph: a 2k-cycle; rows descend while columns descend,
  closed by the wrap row.) Variant B is the simultaneous row-and-column
  reversal: wrap row ρ₁ has c₁,c_k, and for i = 2..k row ρᵢ has
  c_{k+1−i},c_{k+2−i}. Note P1 is exactly the k = 2 case of this cycle
  shape, consistent with the k ≥ 3 restriction. The column-only reversal
  previously called B is not the source diagram; its separate audited
  proof is retained as auxiliary `B_col` in the P4 draft.

## Table 2 (max 1's g(α,β) in pattern-feasible matrices, α ≤ 6)

g(β,α) = g(α,β); for α ≤ 6, g(α, β+1) = g(α, β) + 1 for β ≥ 15.

| α\β | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 |
| 2 |   | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 |
| 3 |   |   | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 |
| 4 |   |   |   | 9 | 10 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 |
| 5 |   |   |   |   | 12 | 14 | 15 | 17 | 18 | 20 | 21 | 22 | 23 | 24 | 25 |
| 6 |   |   |   |   |    | 15 | 17 | 18 | 20 | 21 | 22 | 24 | 26 | 28 | 30 |

α* (smallest β ≥ α with g(α, β+1) = g(α, β)+1 for all β ≥ α*):
1, 2, 3, 6, 10, 15 for α = 1..6 (paper suggests α* = C(α,2)).

## P1 — our proof (2026-07-28, orchestrator; audited, patches applied — see ledger)

**Claim.** In a strictly convex polygon with cut {A, B} there are no
distinct a, a′ ∈ A and distinct b, b′ ∈ B with
|ab| = |ab′| = |a′b| = |a′b′| = 1.

**Proof.** Suppose such points exist. First, distinct vertices are
distinct as points: two coincident vertices together with any third
vertex would form a collinear triple, excluded by strict convexity
(n = α + β ≥ 4 here). In particular a ≠ a′ as points, so the unit
circles C(a,1), C(a′,1) are distinct and non-concentric; and
b, b′ ∉ {a, a′} (cross-cut pairs at distance 1 are distinct points,
and A ∩ B = ∅).

Both b and b′ lie on C(a,1) ∩ C(a′,1). If |aa′| = 2 this intersection
is a single point, forcing b = b′, contradiction; |aa′| > 2 makes it
empty. So |aa′| < 2, and the intersection consists of exactly two
points, both on the perpendicular bisector of aa′ at distance
√(1 − |aa′|²/4) > 0 from the line ℓ = line(a, a′), one strictly on
each open side of ℓ. Since b ≠ b′, {b, b′} is exactly this pair; hence
b and b′ lie strictly on opposite open sides of ℓ.

The polygon boundary is a simple closed convex curve visiting the
vertices in their cyclic order (boundary order = cyclic vertex order
for a convex polygon). The chord aa′ splits the boundary into two
arcs; no vertex other than a, a′ lies on ℓ (no three collinear). Each
arc lies in one closed half-plane of ℓ: since no three vertices are
collinear, every vertex is an extreme point of the polygon P, so
ℓ ∩ P = [a, a′]. If a, a′ are non-adjacent, the open chord (a, a′)
lies in the interior of P (strict convexity), so ∂P ∩ ℓ = {a, a′};
each open boundary arc is then connected and disjoint from ℓ, hence
lies in one open half-plane, and adding the endpoints a, a′ ∈ ℓ gives
closed-half-plane containment. If a, a′ are adjacent, one arc is the
edge [a, a′] ⊆ ℓ, contained in either closed half-plane; the other
open arc meets ℓ only within ∂P ∩ ℓ = [a, a′], which it avoids (the
boundary is a simple closed curve), so it lies in one open half-plane.

Now b, b′ ∉ {a, a′}, so each lies in one of the two open boundary
arcs — equivalently, one of the two open cyclic vertex arcs between a
and a′. No single arc can contain both: each arc lies in one closed
half-plane of ℓ, while b and b′ lie strictly on opposite open sides.
Hence b and b′ lie in DIFFERENT open cyclic arcs between a and a′ (in
particular both open arcs are nonempty), i.e. a and a′ separate b and
b′ in the cyclic vertex order.

But A is a contiguous arc containing a and a′ and disjoint from
{b, b′}. Any contiguous arc containing both a and a′ contains one of
the two open cyclic arcs between them entirely, hence contains b or
b′ — contradicting A ∩ B = ∅. ∎

Remarks: uses only (i) two distinct circles meet in ≤ 2 points (the
R-CIRC2 core), (ii) strict convexity, (iii) A's contiguous-arc
structure — B's contiguity is never used (audit finding F5), so the
rule applies whenever just ONE side of the cut is a contiguous arc. No
unit-distance-specific facts: the same proof forbids the P1 pattern
for ANY single common distance across the cut (all four distances
EQUAL is what is used), so the rule is k-general in the
same-distance-cut setting.

## Status ledger

| Pattern | Transcription | Proof |
|---|---|---|
| P1 | HIGH confidence | PROVEN + AUDITED: math-skeptic audit 2026-07-28 returned NEEDS WORK with four exact patches (F2 adjacent-vertex case, F3 half-plane containment proof, F4 different-arcs derivation + two implicit clauses); patches applied verbatim same day; the audit report states the patched text survives all its attacks |
| P2 | HIGH confidence; convention pinned C2 | PROVEN + AUDITED (`fr-pattern-p2-proof-draft.md`): both variants forbidden under C2, general δ; math-skeptic audit 2026-07-28 returned NEEDS WORK with one blocking gap (F1: Lemma R's restriction-order bracket cited L2 where adjacency can fail; patch L1-for-adjacent / L2(iii)-for-non-adjacent) + clarifications F2–F5; all patches applied verbatim same day; the audit independently reverified every computation (L2–L5, Theorem 1 Steps 1–5, Corollary, Proposition 2) and supplied an exact rational-interval witness certificate (`p2_exact_witness_certificate.py`); orchestrator separately verified key steps line-by-line + exact C1 witness + FR-matrix consistency scan |
| P3 | HIGH (lettered family); instance-subsumption is my inference | PROVEN + independently CERTIFIED for the full source family (`fr-pattern-p3-proof-draft.md`, Theorem 6): R1/R3 use the four-acute-angle mechanism of Theorem 2; the first audit's sole low-severity n=4 empty-sum defect was patched. R2, in both distinct- and merged-inner-column cases, is closed by the exact angle contradictions of Proposition 4 (`p3-r2-compute/RESULTS.md` §§3–4) and independently certified in `p3-r2-compute/SKEPTIC-2026-07-28.md`. Lemma R′ supplies restriction inheritance from the ambient polygon, Proposition 5 supplies the transposed orientation, and all row and inner-column cases are covered. |
| P4 | HIGH; original PDF checked independently twice at 600 dpi; source B corrected to simultaneous row+column reversal | CERTIFIED, both source variants, all k≥3, both C1 AND C2 (`fr-pattern-p4-proof-draft.md`): A by antipodal extremality; source B by simultaneous-reversal symmetry; auxiliary column-only `B_col` also certified by Proposition C chain-induction. Math-skeptic audit 2026-07-28 returned NEEDS WORK with two citation-only findings (F1: restriction-order bracket reused on non-arc-union subsets without a stated general lemma, patched by adding Lemma R″; F2: the C1/C2 corollary's general-k algebra was asserted from a k=3..6 script only, patched by writing out the general substitution) — no mathematical error found; every core lemma independently confirmed "PROVEN, survives intact." |

No P-pattern may be ADMITTED as a census rule until its transcription
is settled AND its proof is written and adversarially audited. P1,
P2, and the full source P3 family satisfy the gate and are ADMITTED
2026-07-28 as cut-matrix-domain rules R-P1/R-P2/R-P3
(`census/p97_search/rules.py`, PHASE2-SPEC §§4.4–4.5): same-distance
C2-read cut matrices only, consumer owns the matrix semantics, no
shell-semantics (per-point radius) generalization. P4 now
satisfies both gates and is ADMITTED 2026-07-28 as R-P4
(PHASE2-SPEC §4.6), for the actual source variants only. Table 2
g-values are FR's computed claims over pattern-feasibility and are not a
verified exact bank: the independent source-pattern encoder certifies
`g_candidate(6,8)=19`, while the printed table says 18.  Do not import those
values as facts.

The direct replacement for the Table-2 argument is now
**CERTIFIED (finite combinatorial, not Lean-kernel)**.  The independent CNF
lane checked every one of the 56 transpose-normalized pairs
`3 ≤ alpha ≤ beta`, `alpha+beta ≤ 19` with all row and column degrees at least
three; all 56 were UNSAT and every DRAT replayed successfully under the
hardened fail-closed checker.  This consumes no Table-2 value or recurrence.
Because the full P1--P4 geometric family, including P3 R2, is now separately
proved, independently audited, and admitted, the result supplies the
Fishburn--Reeds Theorem-3 conclusion for P97 C2-read same-distance cut
matrices.  Exact artifacts and trust boundaries are in
`theorem3-table2/AUDIT.md` and
`theorem3-table2/LEMMA2-SKEPTIC-2026-07-28.md`.

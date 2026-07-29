# FR Lemma 1, pattern P3 — proof draft (2026-07-28)

Companion to `fr-pattern-lemma1.md` (setting, transcription, C2 convention,
P1 proof) and `fr-pattern-p2-proof-draft.md` (P2 proof, shared toolkit L1-L5,
Lemma R). Task: prove the P3 forbidden-pattern family (both orientations,
subset semantics, general common distance δ > 0), convention C2 ONLY.
Author: math-prover agent. Status: PARTIAL — R1/R3 row-cases PROVEN
(both column sub-cases, both orientations); R2 row-case OPEN
(empirically consistent with forbidden, no proof). Not yet audited.

---

## 1. What was investigated

P3 (6 cells, one general family + transpose), from Fig. 4 of
Fishburn–Reeds 1992, transcribed in `fr-pattern-lemma1.md`:
orientation 1 cells `{(r_a,c1), (r_a,ck), (r_b,c1), (rc,c2), (rd,c2),
(rd,ch)}` with rows `r_a < r_b`, `rc < rd`, `r_a < rc`, `r_b < rd`
(`r_b` vs `rc` UNCONSTRAINED, `r_b = rc` allowed) and columns
`c1 < ck ≤ ch < c2` (`ck = ch` allowed). Orientation 2 = transpose.

Claim to prove (subset semantics, convention C2, general δ > 0): no
strictly convex polygon with cut `{A,B}` has all six cells of either
orientation simultaneously equal to one common distance.

**AUDITED 2026-07-28** (math-skeptic, sonnet): verdict NEEDS WORK, one
finding (F4, Proposition 3's n=4 case used a vacuous empty-sum step;
low severity, Theorem 2 never instantiates n=4) — PATCHED same day.
All other claims in the PROVEN portion (Lemma R′, the §5.1 Claim, L6,
Lemma 4, Theorem 2, Prop 5, orientation-2 corollary) confirmed by
independent re-derivation, no gap found. R2 (§5.2) confirmed honestly
labeled OPEN/CONJECTURED, does not leak into Theorem 2's stated scope.
Theorem 2 (R1/R3 sub-family, both orientations, both column cases) is
now PROVEN + AUDITED and citable/admittable; R2 remains open.

**Result summary (see §5 for full statements and status labels).** The
row condition splits the family into three combinatorial sub-cases —
row order R1 (`r_a<r_b<rc<rd`), R2 (`r_a<rc<r_b<rd`), R3 (`r_b=rc`,
3 distinct rows) — crossed with two column sub-cases C1 (4 distinct
columns) / C2 (`ck=ch`, 3 distinct columns). R1×{C1,C2} and R3×{C1,C2}
(4 of 6 sub-cases, covering the fully-degenerate "plain drawing"
instance R3×C2) are **PROVEN** forbidden via a new general lemma (no
strictly convex `n`-gon has 4 acute interior angles) applied to a
coincidental-apex mechanism. R2×{C1,C2} are **NOT proven**: numerical
probes show the same "supremum-zero, degenerate-limit-only" signature
as the proven cases, but no hand proof was found (§8 documents the
obstruction precisely). Orientation 2 reduces to orientation 1 by an
exact transposition symmetry (§5.3), so it inherits the same
proven/open split, sub-case for sub-case.

## 2. Definitions and notation

Reused verbatim from `fr-pattern-p2-proof-draft.md` §2: strictly convex
position, cut `{A,B}`, the C1/C2 orientation conventions, convention
C2 adopted (PINNED, per `fr-pattern-lemma1.md`). Not restated.

**P3-specific point labels.** Write the six constrained points by role:
row-points `a` (= point at row `r_a`), `b` (row `r_b`), `c` (row `rc`),
`d` (row `rd`); column-points `e1` (col `c1`), `ek` (col `ck`), `eh`
(col `ch`), `e2` (col `c2`). The six required pairs (orientation 1,
subset semantics — each pair at the SAME common distance `δ`) are

  (a,e1), (a,ek), (b,e1), (c,e2), (d,e2), (d,eh).

**Row sub-cases.** Since `r_a` is forced `< r_b,rc` and `r_d` forced
`> r_b,rc` (transitivity from the four stated row inequalities), but
`r_b` vs `rc` is explicitly unconstrained, the row order is one of:

- **R1** (aligned): `r_a < r_b < rc < rd` — 4 distinct rows.
- **R2** (crossed): `r_a < rc < r_b < rd` — 4 distinct rows, `b`,`c`
  swapped in position relative to R1.
- **R3** (degenerate): `r_b = rc` — 3 distinct rows; write `m` for the
  merged point, cell set becomes `{(a,e1),(a,ek),(m,e1),(m,e2),(d,e2),
  (d,eh)}`.

**Column sub-cases.** `c1 < ck ≤ ch < c2` is a fixed order (no
analogous ambiguity): **C1** (`ck<ch`, 4 distinct columns) or **C2**
(`ck=ch=:p`, 3 distinct columns, cell set `{(a,e1),(a,p),(·,e1),
(·,e2),(d,e2),(d,p)}`).

The general family is the union over the admissible (row-case,
column-case) pairs — R1×{C1,C2}, R2×{C1,C2}, R3×{C1,C2}, six
combinatorial sub-patterns on 8, 7, 8, 7, 6, 6 points respectively (R1
and R2 give 8/7 points since both have 4 rows; R3 gives 7/6 since it
has 3 rows). Forbidding the general family means forbidding all six.
The stated "plain drawing" instance (`fr-pattern-lemma1.md`) is
exactly R3×C2 (verified by direct cell-set comparison, §3).

## 3. Reduction to a fixed-point-count statement

**Lemma R′ (P3 reduction, citing `fr-pattern-p2-proof-draft.md` §3
Lemma R).** Lemma R's proof is row/column-count-agnostic: it uses only
(i) A, B contiguous arcs, (ii) a finite subset of points in strictly
convex position has strictly convex position with the restricted
cyclic order (extremality inheritance + no-3-collinear inheritance),
(iii) the C2 traversal rule (rows ascending meet columns descending),
and the adjacent/non-adjacent restriction-order bracket (L1 for
adjacent-in-P consecutive-in-subset pairs, L2(iii) for non-adjacent —
the PATCHED form). None of this depends on there being exactly 3 rows
and 3 columns; the same argument applies verbatim to any `α`-row,
`β`-column occurrence for any `α,β ≥ 1`. Consequently: under
convention C2, orientation-1 P3 is forbidden in every strictly convex
polygon and every cut **iff**, for each of the six (row-case,
column-case) combinations enumerated in §2, the corresponding
fixed-point-count configuration (6, 7, or 8 points, in strictly convex
position with the stated cyclic order and the stated required-distance
pairs) does not exist. ∎ (Same ⇐/⇒ argument as Lemma R, applied
role-by-role instead of cell-by-cell; the six required pairs play the
role of P2's five.)

**Cyclic orders (C2: rows ascending, columns descending).** Writing
each sub-case's point sequence:

| Sub-case | Points (n) | Cyclic order |
|---|---|---|
| R1×C1 | a,b,c,d,e1,ek,eh,e2 (8) | (a,b,c,d,e2,eh,ek,e1) |
| R1×C2 | a,b,c,d,e1,p,e2 (7) | (a,b,c,d,e2,p,e1) |
| R2×C1 | a,b,c,d,e1,ek,eh,e2 (8) | (a,c,b,d,e2,eh,ek,e1) |
| R2×C2 | a,b,c,d,e1,p,e2 (7) | (a,c,b,d,e2,p,e1) |
| R3×C1 | a,m,d,e1,ek,eh,e2 (7) | (a,m,d,e2,eh,ek,e1) |
| R3×C2 | a,m,d,e1,p,e2 (6) | (a,m,d,e2,p,e1) |

**Plain-drawing check.** R3×C2 in rank coordinates (row-ranks
1,2,3 = a,m,d; col-ranks 1,2,3 = e1,p,e2) has cells
`{(1,1),(1,2),(2,1),(2,3),(3,2),(3,3)}` — identical to the stated
plain drawing `{(r1,c1),(r1,c2),(r2,c1),(r2,c3),(r3,c2),(r3,c3)}`.
Confirms the orchestrator's flagged inference.

## 4. Toolkit

L1 (edge support), L2 (chord separation), L3 (vertex wedge), L4 (angle
inside wedge), L5 (isosceles base angle), Lemma R (PATCHED restriction
bracket) cited verbatim from `fr-pattern-p2-proof-draft.md` §3-4 — not
restated. Two new lemmas, not needed by P2, are proven here.

**Lemma L6 (transferred acute angle; immediate corollary of L5).** Let
`V` be a vertex of a strictly convex polygon with polygon-neighbors
`P, Q`. If `|PV| = |PQ| = δ` for some `δ > 0` (equivalently: `P` is an
isosceles apex over base `{V, Q}`), then `V`'s interior angle
`∠(P,V,Q)` is acute.

*Proof.* `V`'s interior angle is by definition `∠(P,V,Q)` (the angle
between rays to its two polygon-neighbors). Apply L5 with apex `m=P`,
base `p=V, q=Q`: L5 gives `∠pqm = ∠qpm = (π−∠pmq)/2 ∈ (0,π/2)`, and the
base angle AT `p=V` (between rays `V→q=Q` and `V→m=P`) is exactly
`∠(P,V,Q)`, hence `∠(P,V,Q) ∈ (0,π/2)`. Non-collinearity of `P,V,Q`
holds by strict convexity (no 3 polygon vertices collinear). ∎

**Proposition 3 (at most 3 acute angles in a strictly convex
`n`-gon).** For `n ≥ 4`, a strictly convex `n`-gon does not have 4
interior angles that are all strictly acute (`< π/2`).

*Proof.* The interior angles of a simple `n`-gon sum to exactly
`(n−2)π` (standard fact; each interior angle lies in `(0,π)` for
strict convexity, by the linear-independence argument already used in
L3's proof — `d_s, d_t` non-parallel gives the angle between them in
`(0,π)`). Suppose 4 angles, WLOG `θ1,…,θ4`, are each `< π/2`; their
sum is `< 2π`.

*Case n=4.* `θ1,…,θ4` are all of the polygon's angles, so the
angle-sum identity gives `θ1+…+θ4 = (n−2)π = 2π` exactly —
contradicting `θ1+…+θ4 < 2π` directly.

*Case n≥5.* The remaining `n−4 ≥ 1` angles sum to
`(n−2)π − (θ1+…+θ4) > (n−2)π − 2π = (n−4)π`. But each of the
remaining `n−4` angles is `< π` (strict convexity), so, being a
nonempty sum of genuine angles, they sum to `< (n−4)π`. This forces
`(n−4)π < (\text{remaining sum}) < (n−4)π` — a direct contradiction. ∎

This is a general fact about convex polygons; it is not specific to
P3, uses no unit-distance or cut-matrix structure, and is stated here
because P2's toolkit had no use for it (P2's Theorem 1 argument is a
2-acute-angle coordinate bash, not a 4-acute-angle sum).

## 5. Main theorem(s)

### 5.1 The uniform mechanism (R1 and R3 at once)

Write `a, β, γ, d` for the points at rows `r_a, r_b, rc, rd` and
`e1, κ, η, e2` for the points at columns `c1, ck, ch, c2` (so `β = γ`
as points exactly when `r_b = rc`, i.e. row-case R3; `κ = η` exactly
when `ck = ch`, column-case C2). The six required pairs, in this
notation, are always `(a,e1), (a,κ), (β,e1), (γ,e2), (d,e2), (d,η)` —
**independent of which sub-case is in force**: whether `β=γ` or
`κ=η`, these are still the defining pairs (a merged point simply
carries two of them).

**Claim (structural, used twice below).** Under `rb ≤ rc` (row-cases
R1, R3) the C2 cyclic order is `(a, β, [γ], d, e2, [η], κ, e1)`
(bracketed points present only when distinct from their neighbor), so:

- `a`'s polygon-neighbors are `{e1, β}` — `e1` (wrapping) and `β`
  (`a`'s row-successor, whether `β` is `b` alone or the merged point).
- `d`'s polygon-neighbors are `{γ, e2}` — `γ` (`d`'s row-predecessor)
  and `e2`.
- `e1`'s polygon-neighbors are `{κ, a}` always (regardless of row
  case: the column side of the cycle, `d,e2,[η],κ,e1`, does not
  depend on the row order).
- `e2`'s polygon-neighbors are `{d, η}` always, same reason.

**Lemma 4 (four acute angles, `rb ≤ rc`).** Under `rb ≤ rc` (any
column sub-case), the interior angles at `a`, `d`, `e1`, `e2` are all
acute.

*Proof.* Apply L6 four times, using only the six required pairs:
- Apex `e1` (`|e1 a| = |e1 β| = δ`, i.e. pairs `(a,e1),(β,e1)`), base
  `{a, β}` = `a`'s neighbor set → `a`'s interior angle acute.
- Apex `e2` (`|e2 γ| = |e2 d| = δ`, pairs `(γ,e2),(d,e2)`), base
  `{γ, d}` = `d`'s neighbor set → `d`'s interior angle acute.
- Apex `a` (`|a e1| = |a κ| = δ`, pairs `(a,e1),(a,κ)`), base
  `{e1, κ}` = `e1`'s neighbor set → `e1`'s interior angle acute.
- Apex `d` (`|d e2| = |d η| = δ`, pairs `(d,e2),(d,η)`), base
  `{e2, η}` = `e2`'s neighbor set → `e2`'s interior angle acute. ∎

Each application is L6 verbatim (§4): the apex is one of the target
vertex's two polygon-neighbors, and the apex's OTHER required partner
is exactly the target's other polygon-neighbor — the "Claim" above is
exactly the coincidence L6 needs, verified once for all of R1×C1,
R1×C2, R3×C1, R3×C2 instead of four times.

**Theorem 2 (P3 general family, orientation 1, `rb ≤ rc`; PROVEN,
covers row-cases R1 and R3, both column cases C1/C2).** There is no
strictly convex polygon with cut `{A,B}`, rows in convex order with
`r_a<r_b`, `rc<rd`, `r_a<rc`, `r_b<rd`, **and `r_b ≤ rc`**, columns in
convex order with `c1<ck≤ch<c2`, such that all six P3 cells are
simultaneously equal to one common distance `δ>0`.

*Proof.* By Lemma R′ (§3), suffices to refute existence of the
corresponding `n`-point configuration (`n∈{6,7,8}` — R3×C2, R1×C2 or
R3×C1, R1×C1 respectively) in strictly convex position with the
stated cyclic order and the six required pairs. In any such
configuration, `a,d,e1,e2` are four pairwise-distinct points (distinct
rows / distinct columns / rows disjoint from columns — the ambient
cut has `A∩B=∅`). By Lemma 4, all four have acute interior angles.
This contradicts Proposition 3 (no strictly convex `n`-gon, `n≥4`, has
4 acute interior angles — here `n∈{6,7,8}≥4`). ∎

**Scaling.** As in P2 §3: the claim for one `δ>0` is equivalent to the
claim for `δ=1` by the similarity `p ↦ p/δ` (distances scale, convex
position and cyclic order are preserved). PROVEN (trivial); the proof
above is written for general `δ` directly (L5/L6 do not fix `δ=1`), so
this is recorded for consistency with the P1/P2 drafts rather than as
a separate reduction step.

### 5.2 Row-case R2 (`rb > rc`): NOT proven

For `rb > rc` the cyclic order is `(a, γ, β, d, e2, [η], κ, e1)` — `a`'s
row-successor is now `γ` (not `β`), and `d`'s row-predecessor is now
`β` (not `γ`). Since `e1`'s and `e2`'s neighbor sets are unchanged
(`{κ,a}`, `{d,η}` — these never depended on row order), the `e1`, `e2`
acute-angle facts of Lemma 4 STILL HOLD in R2 (verified directly, §5
below reproduces this). But the `a`, `d` facts break: apex `e1`'s base
is still `{a,β}` (fixed by the pattern's own definition — the
required pair is `(β,e1)`, always), which no longer equals `a`'s
neighbor set `{e1,γ}` unless `β=γ`; symmetrically for `d`. So Lemma 4
gives only 2 of the 4 angles needed for Proposition 3, and R2 is
**NOT covered by Theorem 2's mechanism**. No alternative proof was
found (§8 documents the specific obstructions encountered: an
asymmetric 4-vs-2 or 5-vs-1 arc split for every candidate
L2-non-adjacent required pair, blocking a direct P2-style coordinate
transplant; and the available wedge-transitivity relations (L3+L4)
give LOWER bounds on `a`'s and `d`'s interior angles in terms of the
already-acute `e1`/`e2` angles — the wrong direction for extending
the angle-sum argument).

**Proposition 4 (R2, EMPIRICALLY VERIFIED infeasible, NOT proven).**
Numerical probes (§6; both R2×C1 and R2×C2) find no strictly convex
realization: the maximum achievable convexity margin, optimized over
the full parameter space, is numerically zero (`~1e-17`,
indistinguishable from 0 at double precision) and is approached only
in a degenerate limit where required-pair points coincide (violating
strict convexity) — the same signature P2's genuinely-forbidden
configurations exhibit (`fr-pattern-p2-proof-draft.md` §7.2). This is
evidence for, but not a proof of, "R2 is also forbidden under C2."
Labeled CONJECTURED (with EMPIRICAL support), not PROVEN.

### 5.3 Orientation 2 (transpose)

**Proposition 5 (transposition is a C2 symmetry; PROVEN).** Let `{A,B}`
be a cut read under C2 (full cycle `a_1,…,a_α,b_β,…,b_1`). Reading the
SAME polygon with rows := `B` (in its own convex order `b_1,…,b_β`)
and columns := `A` is also a valid C2 reading, i.e. gives the same
undirected cyclic order.

*Proof.* Target reading's full cycle would be `b_1,…,b_β,a_α,…,a_1`
(rows-`B` ascending, columns-`A` descending). Starting from the
original cycle `(a_1,…,a_α,b_β,…,b_1)`: rotate to start at `b_β`:
`(b_β,…,b_1,a_1,…,a_α)`; reverse (valid on an undirected cyclic
order): `(a_α,…,a_1,b_1,…,b_β)`; rotate to start at `b_1`:
`(b_1,…,b_β,a_α,…,a_1)` — exactly the target. Rotation and reversal
are both automorphisms of "undirected cyclic order", so the two
readings coincide as unordered cyclic sequences. ∎

**Corollary (orientation 2, PROVEN for `rb ≤ rc`, OPEN for `rb > rc`
— inherits §5.1/§5.2 exactly).** Orientation 2 is the transpose:
general family with the `rb<rd,ra<rc` (i.e. `a<b,c<d`-shaped)
constraint on COLUMNS and `ck≤ch`-shaped constraint on ROWS. By
Proposition 5, reading such an occurrence with rows:=(old columns),
columns:=(old rows) is again a valid C2 reading, and under this
relabeling orientation 2's cell set becomes EXACTLY orientation 1's
cell set (the six pairs `(a,e1),(a,ck),(b,e1),(c,e2),(d,e2),(d,ch)`
map to themselves with rows/columns swapped as labels only — the
underlying point set and required-pair structure are unchanged, since
P3's definition is symmetric in the roles "row-quantity with 2 cells"
/ "column-quantity with 2 cells"). Hence orientation 2 is forbidden
under C2 exactly when orientation 1 is: PROVEN for the transpose of
`rb≤rc` (R1/R3), OPEN for the transpose of `rb>rc` (R2). No new
geometric argument is needed. ∎

## 6. Numerical checks performed (all EMPIRICALLY VERIFIED, scope stated)

Scripts in session scratchpad (per task instructions, not copied into the
project scratch dir): `.../scratchpad/p3-probes/r2_probe.py` (R2×C1),
`.../scratchpad/p3-probes/r2c2_probe.py` (R2×C2). Both use the FULL
supporting-line convexity predicate (every directed edge of the target
cyclic order has all other points strictly on the same side, uniform
sign) — NOT turn-signs only, avoiding the star-polygon pitfall
documented in `fr-pattern-p2-proof-draft.md` §7.1.

**R2×C1** (8 points, two required-distance components — `{a,e1,ek,b}`
and `{c,e2,d,eh}` — joined only by convexity, not by any required
distance; gauge: `a=(0,0)`, `e1=(1,0)`, 5 more angles/rigid-motion
params, 7 total). 400 random-restart Nelder–Mead local optimizations
of `−(min margin)`. Best achieved margin: `−5.7×10⁻¹⁷` (numerically
0). The optimum found has `eh = e2` to displayed precision (the base
pair of `d`'s isosceles triangle collapsing to a point) — a degenerate
limit outside strict convexity, matching the "supremum 0, attained
only in the degenerate limit" signature of P2's genuinely-forbidden
configurations (`fr-pattern-p2-proof-draft.md` §7.2). No configuration
with positive margin was found.

**R2×C2** (7 points; required-distance graph is a tree/path
`b–e1–a–p–d–e2–c`, gauge: single chain from `a=(0,0)`, `p=(1,0)`,
5 angle params). 300 random-restart Nelder–Mead runs. Best margin:
`5.6×10⁻¹⁸` (numerically 0). Optimum has `e2 ≈ p` to displayed
precision — again a degenerate collapse.

**Scope.** Both are 300–400-restart local-optimization searches over
continuous parameter spaces (5–7 dimensions), not exhaustive and not a
global-optimality certificate; the reported "best" is a lower bound on
the true supremum margin, so these results cannot rule out a positive-
margin region missed by all restarts. They are consistent with — and
only with — R2 being infeasible, matching Theorem 2's proven cases'
numerical profile, but are NOT a proof (no exact/interval arithmetic
was used here, unlike P2's adopted witness certificate).

**Not run (flagged as a gap, not a finding):** no numerical
cross-check of Theorem 2's PROVEN sub-cases (R1×C1, R1×C2, R3×C1,
R3×C2) was performed in this session — time/context-budgeted out.
The proof itself (Lemma 4 + Proposition 3) is a closed-form angle-sum
argument with no coordinate algebra, so the usual "numerics catch
algebra slips" rationale for P1/P2's checks applies with less force
here, but an independent numerical sanity check (max-margin search
should again show supremum 0 in a degenerate limit) is still a cheap,
worthwhile audit step — see §9.

## 7. Structural assumptions used

- **Strict convexity** (no 3 vertices collinear): used in Lemma R′
  (inherited from Lemma R's proof), in L5/L6 (non-collinearity for a
  well-defined acute base angle), and in Proposition 3 (interior
  angles strictly in `(0,π)`).
- **Finiteness**: none beyond the fixed point count (6–8) of each
  sub-case; the ambient polygon may have any number of vertices — this
  enters only through Lemma R′.
- **No unit-distance-specific facts**: general `δ` throughout, by the
  scaling argument (§5.1); the rule is k-general like P1 and P2.
- **Row-case enumeration is exhaustive and non-overlapping in the
  relevant sense**: `r_b ≤ rc` (R1∪R3) and `r_b > rc` (R2) partition
  all admissible row assignments (§2) — PROVEN (trichotomy of a total
  order). Column-case enumeration (C1: `ck<ch`, C2: `ck=ch`) is
  similarly exhaustive (given `ck≤ch`). So §5.1+§5.2 jointly cover
  ALL instances of the general family's row/column freedom; §5.2 is
  an honest gap, not a missing case.
- **Orientation 2's reduction (§5.3)** uses only the C2 double-reading
  symmetry (Proposition 5, proven from rotation+reversal of an
  undirected cyclic order) — no new geometric content, so it carries
  exactly the same proof-status as orientation 1 sub-case-by-sub-case.

## 8. Honest gap list

- **THE gap: row-case R2 (`rb > rc`), both column sub-cases, is NOT
  proven.** This is the single open item blocking a full P3 closure
  under C2. What was tried and why each failed (§5.2, expanded):
  1. *Direct L6 transplant* (the mechanism that closes R1/R3): fails
     structurally, not by oversight — `e1`'s and `a`'s neighbor sets
     diverge under `rb>rc` (§5.2), giving only 2 of the 4 needed
     acute angles. This is a clean NO-GO, not a gap to patch.
  2. *P2-style chord normalization*: P2's Theorem 1 normalizes on a
     required, non-adjacent pair, which happens to split the
     remaining vertices 2-2 (a symmetric split enabling a 2-variable
     trig system). For R2×C1, the four required non-adjacent pairs
     `(a,ek),(b,e1),(c,e2),(d,eh)` give arc splits of size 5-1, 4-2,
     4-2, 5-1 respectively — no candidate gives a symmetric split;
     the most balanced (4-2) was not pursued to a full coordinate
     derivation (assessed as substantially more casework than P2's
     2-2 split, budgeted out).
  3. *Adjacent-pair gauge + wedge transitivity*: normalizing on the
     adjacent required pair `(a,e1)` pins `ek` exactly (via L5 on the
     `a`-apex triangle) but leaves `b`, and all of component 2
     (`c,d,e2,eh`), gauge-free (7 parameters total, no reduction in
     configuration-space dimension vs. the numerical probe). Applying
     L3+L4 (vertex wedge) at `e1` (using its OWN proven-acute angle)
     to bound `a`'s or `d`'s interior angle produces LOWER bounds
     (`α > π − 2β₁`, `δ_d > π − 2β₂` — derived in-session, not
     included above since they were not load-bearing for a
     contradiction) — the wrong direction for extending Lemma 4's
     "angle is small" chain. No sign-reversing trick was found.
  4. No attempt was made at a from-scratch coordinate bash (fixing a
     full 7-parameter frame and running P2 Steps-3-5-style algebra to
     a contradiction) — assessed as the most likely route to succeed
     (numerics suggest a genuine, provable infeasibility, just not
     via the angle-sum shortcut) but not attempted due to session
     budget; flagged as the top "what next" item.
- **R1/R3 numerical cross-check not run** (§6) — low risk (closed-form
  proof, not coordinate algebra) but not yet independently verified.
- **Transcription caveat (inherited, not new):** the proof addresses
  the cell sets as transcribed in `fr-pattern-lemma1.md` (HIGH
  confidence for the lettered family; the plain-drawing subsumption
  is independently re-verified here, §3, as an exact cell-set match).
- **No adversarial audit yet** (unlike P1, P2): this draft has not
  been reviewed by math-skeptic. Given P1 and P2 both had audit-caught
  gaps in their first draft (F1–F6 in each), Theorem 2's proof (novel
  mechanism, not reused from P1/P2) should be treated as unaudited
  and provisional until reviewed, notwithstanding its internal
  consistency checks (the uniform Lemma 4 table was cross-verified
  against four independent hand derivations of the R1×C1, R1×C2,
  R3×C1, R3×C2 sub-cases before being collapsed into one argument,
  §5.1).

## 9. What next (ranked)

1. **Close R2** (both column sub-cases) — the sole remaining gap for
   a full P3 closure under C2. Recommended route: full coordinate
   derivation (P2 Steps-3-5 style) using the adjacent-pair gauge
   `a=(0,0), e1=(1,0)` (which already pins `ek` exactly via L5) plus
   the two-component rigid-motion parametrization from the numerical
   probe (§6) — reduce algebraically rather than search numerically.
   If that fails, revisit whether a genuinely different (non-P2,
   non-angle-sum) mechanism is needed. Numerical evidence (§6) argues
   against spending further effort on a realizability search — no
   witness was found and the degenerate-limit signature strongly
   suggests R2 is a genuine (provable) forbidden case, not a finding.
2. **Numerically cross-check Theorem 2's sub-cases** (R1×C1, R1×C2,
   R3×C1, R3×C2) as a cheap independent sanity check before audit —
   adapt `r2_probe.py`/`r2c2_probe.py`'s gauge machinery to the R1/R3
   cyclic orders of §3's table.
3. **Adversarial audit** (math-skeptic) of Lemma 4 / Proposition 3 /
   Theorem 2 / Proposition 5, once R2 is resolved or explicitly
   scoped out of the deliverable by the orchestrator.
4. **Propagate to P4**: if R2 stays open, note that P4's cyclic
   "staircase" family (`fr-pattern-lemma1.md`) may have an analogous
   row/column-order freedom worth checking early, before investing in
   a full proof attempt.

## Status

**Theorem 2** (P3 general family, both orientations, row-cases R1/R3
i.e. `rb ≤ rc`, both column sub-cases): **PROVEN + AUDITED**
(math-skeptic 2026-07-28, F4 patched same day). Citable and
admittable as a census rule for the R1/R3 sub-family.
**Row-case R2** (`rb > rc`), both orientations, both column sub-cases:
**OPEN** — CONJECTURED with EMPIRICAL support (§5.2, §6), no proof.

**END STATUS: R1/R3 sub-family CERTIFIED. R2 still needs a proof
before it can be audited or admitted; do not generalize any admitted
rule beyond R1/R3 until R2 closes.**

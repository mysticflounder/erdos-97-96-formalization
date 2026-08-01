# FR Lemma 1, pattern P3 — proof draft (2026-07-28)

Companion to `fr-pattern-lemma1.md` (setting, transcription, C2 convention,
P1 proof) and `fr-pattern-p2-proof-draft.md` (P2 proof, shared toolkit L1-L5,
Lemma R). Task: prove the P3 forbidden-pattern family (both orientations,
subset semantics, general common distance δ > 0), convention C2 ONLY.
Author: math-prover agent. Status: full source P3 family PROVEN and
independently CERTIFIED (all row cases, both inner-column cases, both
orientations).

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

**AUDITED/CERTIFIED 2026-07-28.** The first math-skeptic audit returned
NEEDS WORK only because Proposition 3's `n=4` case used a vacuous
empty-sum step; that low-severity issue was patched the same day and
the R1/R3 proof was independently rederived. A second independent
math-skeptic audit, recorded in
`scratch/p97-search-lane/p3-r2-compute/SKEPTIC-2026-07-28.md`,
returned **CERTIFIED** for both
R2 inner-column cases. It reconstructed every restricted hull/radial
order, checked every isosceles identity and strict inequality, and
confirmed that no supplementary sector or numerical premise enters
the exact angle contradictions. Lemma R′ supplies the explicitly cited
restriction-inheritance step, and Proposition 5 supplies orientation 2.
Thus the full source P3 family is PROVEN + independently CERTIFIED and
citable/admittable.

**Result summary (see §5 for full statements and status labels).** The
row condition splits the family into three combinatorial sub-cases —
row order R1 (`r_a<r_b<rc<rd`), R2 (`r_a<rc<r_b<rd`), R3 (`r_b=rc`,
3 distinct rows) — crossed with distinct inner columns (`ck<ch`, 4
columns) or merged inner columns (`ck=ch`, 3 columns). R1 and R3 are
forbidden in both inner-column cases via a general lemma (no strictly
convex `n`-gon has 4 acute interior angles) and a coincidental-apex
mechanism. R2 is forbidden in both cases by the exact radial-order
angle contradictions in §5.2. The plain drawing is R3 with merged
inner columns. Orientation 2 reduces to orientation 1 by the exact
transposition symmetry in §5.3, so all six orientation-1 cases and
their transposes are covered.

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

**Inner-column sub-cases.** `c1 < ck ≤ ch < c2` is a fixed order (no
analogous ambiguity): the **distinct-inner-column case** (`ck<ch`, 4
distinct columns) or the **merged-inner-column case** (`ck=ch=:p`, 3
distinct columns, cell set `{(a,e1),(a,p),(·,e1),(·,e2),(d,e2),(d,p)}`).
These names deliberately avoid overloading `C2`, which everywhere
else in this document means the pinned opposed traversal convention.

The general family is the union over the admissible row case and
inner-column case, giving six combinatorial sub-patterns on 8, 7, 8,
7, 7, and 6 points respectively (R1 and R2 give 8/7 points since both
have 4 rows; R3 gives 7/6 since it has 3 rows). Forbidding the general
family means forbidding all six. The stated "plain drawing" instance
(`fr-pattern-lemma1.md`) is exactly R3 with merged inner columns
(verified by direct cell-set comparison, §3).

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
| R1, distinct inner columns | a,b,c,d,e1,ek,eh,e2 (8) | (a,b,c,d,e2,eh,ek,e1) |
| R1, merged inner columns | a,b,c,d,e1,p,e2 (7) | (a,b,c,d,e2,p,e1) |
| R2, distinct inner columns | a,b,c,d,e1,ek,eh,e2 (8) | (a,c,b,d,e2,eh,ek,e1) |
| R2, merged inner columns | a,b,c,d,e1,p,e2 (7) | (a,c,b,d,e2,p,e1) |
| R3, distinct inner columns | a,m,d,e1,ek,eh,e2 (7) | (a,m,d,e2,eh,ek,e1) |
| R3, merged inner columns | a,m,d,e1,p,e2 (6) | (a,m,d,e2,p,e1) |

**Plain-drawing check.** R3 with merged inner columns in rank coordinates (row-ranks
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
when `ck = ch`, the merged-inner-column case). The six required pairs, in this
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

**Lemma 4 (four acute angles, `rb ≤ rc`).** Under `rb ≤ rc` (either
inner-column case), the interior angles at `a`, `d`, `e1`, `e2` are all
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
exactly the coincidence L6 needs, verified once for all of
R1×distinct-inner, R1×merged-inner, R3×distinct-inner, and
R3×merged-inner instead of four times.

**Theorem 2 (P3 general family, orientation 1, `rb ≤ rc`; PROVEN,
covers row-cases R1 and R3, both inner-column cases).** There is no
strictly convex polygon with cut `{A,B}`, rows in convex order with
`r_a<r_b`, `rc<rd`, `r_a<rc`, `r_b<rd`, **and `r_b ≤ rc`**, columns in
convex order with `c1<ck≤ch<c2`, such that all six P3 cells are
simultaneously equal to one common distance `δ>0`.

*Proof.* By Lemma R′ (§3), suffices to refute existence of the
corresponding `n`-point configuration (`n∈{6,7,8}` — R3×merged-inner,
R1×merged-inner or R3×distinct-inner, R1×distinct-inner respectively)
in strictly convex position with the
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

### 5.2 Row-case R2 (`rb > rc`): exact angle proof

Here `r_a<rc<r_b<r_d`. By Lemma R′ (§3), any ambient P3 occurrence
restricts to a seven- or eight-vertex strictly convex polygon whose
cyclic order is the corresponding order in §3. This explicitly
supplies both strict convexity and restriction-order inheritance used
below. By similarity (§5.1), normalize the common distance to `1`.

**Lemma 5 (radial order).** Fix a vertex `v` of a strictly convex
polygon. Inside its open interior wedge, the rays from `v` to the
other vertices occur in the same order as those vertices on the
opposite boundary arc. Hence an angle containing intermediate
vertex-rays is the sum of the intervening positive angles.

*Proof.* A ray in the interior wedge meets the opposite boundary arc
exactly once by convexity. Two distinct boundary vertices cannot lie
on one ray, because the nearer would lie in the relative interior of
the segment from `v` to the farther and therefore in the polygon
interior. Ray direction along the connected opposite arc is thus
continuous and injective into an angular interval of length `<π`, so
it is strictly monotone. No three vertices are collinear, hence every
intervening angular gap is positive. ∎

**Proposition 4 (R2, both inner-column cases; PROVEN + independently
CERTIFIED).** No orientation-1 P3 occurrence with
`r_a<rc<r_b<r_d` is realizable in a strictly convex polygon under the
pinned C2 traversal convention.

*Merged-inner-column case (`ck=ch=:p`).* By Lemma R′ the cyclic order is

`A,C,B,D,E,P,F`,

with required distances

`AF=AP=BF=CE=DE=DP=1`.

Define the positive ordinary angles

`U=∠FAP`, `V=∠APD`, `W=∠PDE`,
`X=∠FAB`, `Y=∠PAD=∠ADP`, and `Z=∠CDE`.

The isosceles triangles give

`X<π/2`, `Z<π/2`, `Y=(π−V)/2`,
`∠EPD=(π−W)/2`, and `∠APF=(π−U)/2`.                 (1)

At `A`, Lemma 5 gives radial order `F,P,E,D,B,C`, hence

`X=∠FAP+∠PAD+∠DAB>U+Y`,

so (1) yields `2U<V`. At `D`, the radial order is
`B,C,A,F,P,E`, hence

`Z=∠CDA+∠ADP+∠PDE>Y+W`,

so `2W<V`. Finally, the radial order at `P` is `E,D,B,C,A,F`.
Its polygon interior angle is `<π`, and additivity inside that
non-supplementary sector gives

`∠EPF=∠EPD+∠DPA+∠APF=(π−W)/2+V+(π−U)/2<π`,

so `2V<U+W`. But `2U<V` and `2W<V` imply `U+W<V`,
contradicting `2V<U+W` and `V>0`.

*Distinct-inner-column case (`ck<ch`).* By Lemma R′ the cyclic order is

`A,C,B,D,E,H,K,F`,

with required distances

`AF=AK=BF=CE=DE=DH=1`.

Put

`U=∠FAK`, `W=∠HDE`, `X=∠FAB`, `T=∠CDE`,
`Y=∠KAD`, and `Z=∠ADH`.

The isosceles triangles `AFB` and `CDE` give `X,T<π/2`. Lemma 5 gives
the radial orders `F,K,H,E,D,B,C` at `A` and `B,C,A,F,K,H,E` at `D`.
Consequently

`X=U+Y+∠DAB>U+Y`, `T=∠CDA+Z+W>Z+W`,

and therefore

`U+Y<π/2`, `W+Z<π/2`.                              (2)

The restriction-inheritance clause of Lemma R′ applied once more to
`{A,D,H,K}` gives the strictly convex quadrilateral order `A,D,H,K`.
With `Q=∠DHK` and `R=∠HKA`, its angle sum is

`Y+Z+Q+R=2π`.                                      (3)

Since `DH=DE`, `∠EHD=(π−W)/2`. At polygon vertex `H`,
Lemma 5 gives `∠EHK=∠EHD+∠DHK<π`, so

`Q<(π+W)/2`.                                       (4)

Similarly, `AF=AK` gives `∠AKF=(π−U)/2`, and at `K`,
`∠HKF=∠HKA+∠AKF<π`, so

`R<(π+U)/2`.                                       (5)

Equations (3)--(5) imply

`Y+Z>π−(U+W)/2`,                                   (6)

whereas (2) implies

`Y+Z<π−(U+W)`.                                     (7)

Since `U,W>0`, the upper bound in (7) is strictly smaller than the
lower bound in (6), a contradiction. Thus neither R2 inner-column
case is realizable. ∎

The certification report
`scratch/p97-search-lane/p3-r2-compute/SKEPTIC-2026-07-28.md`
independently reconstructed all
restricted hull and radial orders, isosceles identities, strictness
claims, and sector choices in this proposition. The nonlinear probes
in §6 are supporting diagnostics only and are not used above.

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

**Corollary (orientation 2, PROVEN for every row and inner-column
case).** Orientation 2 is the transpose:
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
under C2 exactly when orientation 1 is. Theorem 2 covers R1/R3 and
Proposition 4 covers R2, in each inner-column case. No new geometric
argument is needed. ∎

**Theorem 6 (full source P3 family; PROVEN + independently
CERTIFIED).** Under convention C2 and subset semantics, no strictly
convex polygon cut contains any source P3 orientation at one common
distance `δ>0`.

*Proof.* The row trichotomy gives exactly R1, R2, or R3, and
`ck≤ch` gives exactly the distinct- or merged-inner-column case.
Theorem 2 covers R1/R3, Proposition 4 covers R2, and the preceding
corollary covers the transposed orientation. Lemma R′ promotes every
ambient occurrence to the corresponding selected strictly convex
polygon, so no adjacency or restriction-order hypothesis is lost. ∎

## 6. Numerical checks performed (EMPIRICAL, non-load-bearing)

The reproducible artifacts are under
`scratch/p97-search-lane/p3-r2-compute/`: `r2_probe.py`, the saved
probe outputs, and `selfcheck.py` with its saved output. Both probes
use the full supporting-line convexity predicate, not turn signs
alone.

- For the merged-inner-column case, 300 total random starts produced
  best margin `1.015e-18`; the limiting points `E` and `P` were
  separated by at most `1.11e-16`.
- For the distinct-inner-column case, 400 total random starts produced
  best signed margin `-0.0`; the limiting points `E` and `H`
  coincided to displayed precision.
- The self-check ran 1000 random samples for each case. The largest
  formula discrepancy was at most `5.56e-16`; all 35 merged and 48
  distinct supporting-line inequalities agreed with direct
  evaluation. It also accepted a regular polygon and rejected the
  pentagram control.

These continuous optimizations are neither exhaustive nor
global-optimality certificates. They support and sanity-check the
transcription, but Proposition 4 is load-bearing solely through its
exact angle proof and independent certification.

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
  order). The distinct-inner (`ck<ch`) and merged-inner (`ck=ch`)
  cases are similarly exhaustive given `ck≤ch`. Thus §5.1+§5.2 cover
  all instances of the general family's row/column freedom.
- **Orientation 2's reduction (§5.3)** uses only the C2 double-reading
  symmetry (Proposition 5, proven from rotation+reversal of an
  undirected cyclic order) — no new geometric content, so it carries
  exactly the same proof-status as orientation 1 sub-case-by-sub-case.

## 8. Certification and trust boundary

The former R2 gap is resolved by the exact inequalities in
Proposition 4. The independent report
`scratch/p97-search-lane/p3-r2-compute/SKEPTIC-2026-07-28.md` gives
the result **CERTIFIED** after checking both inner-column cases and
the passage from the ambient polygon to each selected polygon.

The load-bearing trust boundary is:

1. the P3 cell transcription and traversal convention C2;
2. Lemma R′, especially restriction inheritance for the selected
   seven- or eight-vertex polygon;
3. the exact Euclidean angle facts and polygon angle sums used in
   Theorem 2 and Proposition 4; and
4. the transpose argument of Proposition 5.

The numerical probes are not in this boundary. This is a prose proof,
not a Lean formalization or a kernel-checked certificate.

## 9. Downstream integration

The admitted census rule may now cover the full source P3 family:
the six orientation-1 row/inner-column templates and their transpose
closure. Deduplication leaves eight distinct scanner templates. The
rule remains subset-monotone: additional equal-distance cells do not
invalidate a P3 occurrence.

## Status

**Theorem 6** (the full P3 source family, both orientations, all row
cases, and both distinct- and merged-inner-column cases):
**PROVEN + independently CERTIFIED**.

**END STATUS: full-source P3 CERTIFIED and admissible as R-P3 under
traversal convention C2 and subset semantics.**

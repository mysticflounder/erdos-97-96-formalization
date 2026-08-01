# G3 U5 semantic proof plan

Read-only design note; no production Lean was changed.  The two relevant
generator blocks are `probe.py:500-613` (Family A) and `probe.py:615-646`
(Family B).  They emit respectively 117,900 compact clauses and 39,300
clauses.  The former is the definitional factorization of 51,993,900 direct
clauses.

## What is already in the theorem bank

The indexed Lean search was run before proposing new lemmas.  The useful live
declarations are:

- `sourceChoiceAt_facts`: the decoded row is in range and its mask contains
  the source.
- `CanonicalPacket.sourceChoiceHolds`, whose second conjunct identifies the
  decoded row with `P.baseIndex`; `sourceChoiceHolds_sourceCenterHolds`,
  `sourceCenterHolds_usedCenterHolds`, and `exactAt_usedCenter`.
- `coverIndex_testBit_of_cubeOk`, `Card11SelectedCube.center_not_mem_cube`,
  `CanonicalPacket.localEqHolds_of_mem_cube`, and
  `CanonicalPacket.not_localEqHolds_of_exactAt`.
- `CanonicalPacket.fullSourceChoiceValuation_choice`,
  `fullRadiusValuation_eq_fullSourceChoice_of_lt`,
  `fullRadiusValuation_globalEquality`, and
  `fullRadiusValuation_qDeletedPair`.
- All local-four shape facts in `G3LocalFourGeometry.lean`, especially
  `encoderLocalFourRows_support_{length,nodup,center_not_mem_support,toFinset_card}`.
- `CanonicalPacket.localFourHolds_to_u5QDeletedK4Class` and the row/indexed
  `qDeletedPairHolds_to_u5QDeletedK4Class...` bridges.  These already prove
  local-class radius positivity internally.
- `exists_globalEqIndex` and `globalEqRow_globalEqIndex` in
  `OccurrenceCore.lean`.
- The terminal kernels
  `u5_nontriple_equilateral_on_p_circle_incompatibility` and
  `u5_common_bisector_triple_incompatibility`.
- `ConvexIndep.not_three_collinear`; with `D.convex`, `L.mem_carrier`, and
  `L.injective`, this supplies the geometric noncollinearity needed by Family
  B from three pairwise-distinct labels.

The corpus contains no packaged theorem decoding a source choice into its
ordered residual triple and outside labels.  That is the actual missing
bridge, not a new U5 incidence argument.

## Semantic core A

The proof-facing theorem should avoid DIMACS indices and state exactly the
three positive semantic premises of one compact Family A clause:

```lean
theorem CanonicalPacket.u5NontripleChoice_incompatible
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M} {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame} {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (source p t x : Label) (choice : SourceChoiceIndex source)
    (hp : (sourceChoiceAt source choice).1 = p)
    (hchoice : P.sourceChoiceHolds shadow source choice)
    (ht : t ∈ P.cube.cube p) (hx : x ∉ P.cube.cube p)
    (hpairT : P.qDeletedPairHolds
      { deleted := source, center := t, first := p, second := x })
    (hpairX : P.qDeletedPairHolds
      { deleted := source, center := x, first := p, second := t }) :
    False := by
  have hcenter : shadow.centerOf source = p := hchoice.1.trans hp
  have hsource : source ∈ P.cube.cube p := by
    simpa [hcenter] using shadow.source_mem_cube source
  have hused : P.usedCenterHolds shadow p := ⟨source, hcenter⟩
  have hexact := P.exactAt_usedCenter shadow p hused
  have ht_radius :
      dist (L.pointOf p) (L.pointOf t) =
        dist (L.pointOf p) (L.pointOf source) :=
    P.localEqHolds_of_mem_cube ⟨p, t, source⟩ ht hsource
  have hx_off :
      dist (L.pointOf p) (L.pointOf x) ≠
        dist (L.pointOf p) (L.pointOf source) := by
    intro h
    exact (P.not_localEqHolds_of_exactAt
      ⟨p, source, x⟩ hexact hsource hx) h.symm
  rcases P.qDeletedPairHolds_to_u5QDeletedK4Class_row
      ⟨source, t, p, x⟩ hpairT with
    ⟨Bt, ⟨Kt⟩, hpBt, hxBt⟩
  rcases P.qDeletedPairHolds_to_u5QDeletedK4Class_row
      ⟨source, x, p, t⟩ hpairX with
    ⟨Bx, ⟨Kx⟩, hpBx, htBx⟩
  exact u5_nontriple_equilateral_on_p_circle_incompatibility
    ht_radius hx_off Kt Kx hpBt hxBt hpBx htBx
```

The only adapter needed for the generator's sorted `qpair` arguments is the
small semantic symmetry lemma

```lean
theorem CanonicalPacket.qDeletedPairHolds_swap
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (q c a b : Label) :
    P.qDeletedPairHolds ⟨q, c, a, b⟩ ↔
      P.qDeletedPairHolds ⟨q, c, b, a⟩ := by
  constructor <;> rintro ⟨row, hr, hc, hq, ha, hb, hlocal⟩
  · exact ⟨row, hr, hc, hq, hb, ha, hlocal⟩
  · exact ⟨row, hr, hc, hq, hb, ha, hlocal⟩
```

Thus Family A needs no new support-cardinality, radius-positivity, or
incidence geometry theorem.

## Semantic core B

First add two source-clean normalization helpers.  They are semantic glue,
not finite decoder facts:

```lean
theorem CanonicalPacket.globalEqHolds_canonicalStar_iff
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (c a b : Label) :
    P.globalEqHolds
        (canonicalGlobalRow (canonicalEdge c a) (canonicalEdge c b)) ↔
      dist (L.pointOf c) (L.pointOf a) =
        dist (L.pointOf c) (L.pointOf b) := by
  simp only [CanonicalPacket.globalEqHolds, canonicalGlobalRow,
    canonicalEdge]
  split <;> split <;> split <;> simp [dist_comm]

theorem CanonicalPacket.localFourHolds_of_common_reference
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (row : LocalFourRow) (reference : Label)
    (hrow : row ∈ encoderLocalFourRows)
    (hcommon : ∀ z ∈ row.support,
      dist (L.pointOf row.center) (L.pointOf reference) =
        dist (L.pointOf row.center) (L.pointOf z)) :
    P.localFourHolds row := by
  have hanchor : row.support.getD 0 0 ∈ row.support := by
    cases hs : row.support with
    | nil =>
        have := encoderLocalFourRows_support_length hrow
        simp [hs] at this
    | cons a rest => simp [hs]
  intro z hz
  exact (hcommon _ hanchor).symm.trans (hcommon z hz)
```

Then use this theorem shape:

```lean
theorem CanonicalPacket.u5CommonBisectorChoice_incompatible
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M} {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame} {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (source p x t1 t2 t3 : Label) (choice : SourceChoiceIndex source)
    (hp : (sourceChoiceAt source choice).1 = p)
    (hchoice : P.sourceChoiceHolds shadow source choice)
    (ht1 : t1 ∈ P.cube.cube p) (ht2 : t2 ∈ P.cube.cube p)
    (ht3 : t3 ∈ P.cube.cube p)
    (ht12 : t1 ≠ t2) (ht13 : t1 ≠ t3) (ht23 : t2 ≠ t3)
    (row : LocalFourRow) (hrow : row ∈ encoderLocalFourRows)
    (hcenterRow : row.center = x)
    (hsourceRow : source ∉ row.support)
    (hpRow : p ∈ row.support)
    (ht1Row : t1 ∈ row.support) (ht2Row : t2 ∈ row.support)
    (ht3Row : t3 ∈ row.support)
    (hexhaust : ∀ z ∈ row.support, z = p ∨ z = t1 ∨ z = t2 ∨ z = t3)
    (heq1 : P.globalEqHolds
      (canonicalGlobalRow (canonicalEdge x p) (canonicalEdge x t1)))
    (heq2 : P.globalEqHolds
      (canonicalGlobalRow (canonicalEdge x p) (canonicalEdge x t2)))
    (heq3 : P.globalEqHolds
      (canonicalGlobalRow (canonicalEdge x p) (canonicalEdge x t3))) :
    False := by
  have hcenter : shadow.centerOf source = p := hchoice.1.trans hp
  have hsource : source ∈ P.cube.cube p := by
    simpa [hcenter] using shadow.source_mem_cube source
  have hp_ne_source : p ≠ source := by
    intro h
    subst source
    exact P.cube.center_not_mem_cube p hsource
  have hr_pos :
      0 < dist (L.pointOf p) (L.pointOf source) :=
    dist_pos.mpr (L.injective.ne hp_ne_source)
  have h1 := (P.globalEqHolds_canonicalStar_iff x p t1).mp heq1
  have h2 := (P.globalEqHolds_canonicalStar_iff x p t2).mp heq2
  have h3 := (P.globalEqHolds_canonicalStar_iff x p t3).mp heq3
  have hcommon : ∀ z ∈ row.support,
      dist (L.pointOf row.center) (L.pointOf p) =
        dist (L.pointOf row.center) (L.pointOf z) := by
    intro z hz
    rcases hexhaust z hz with rfl | rfl | rfl | rfl
    · rfl
    · simpa [hcenterRow] using h1
    · simpa [hcenterRow] using h2
    · simpa [hcenterRow] using h3
  have hlocal :=
    P.localFourHolds_of_common_reference row p hrow hcommon
  rcases P.localFourHolds_to_u5QDeletedK4Class
      row source hrow hsourceRow hlocal with
    ⟨Bx, ⟨Kx⟩, hmem⟩
  have Kx' : U5QDeletedK4Class D
      (L.pointOf source) (L.pointOf x) Bx := by
    simpa [hcenterRow] using Kx
  have ht1_radius :=
    P.localEqHolds_of_mem_cube ⟨p, t1, source⟩ ht1 hsource
  have ht2_radius :=
    P.localEqHolds_of_mem_cube ⟨p, t2, source⟩ ht2 hsource
  have ht3_radius :=
    P.localEqHolds_of_mem_cube ⟨p, t3, source⟩ ht3 hsource
  have hnoncol :
      ¬ Collinear ℝ
        ({L.pointOf t1, L.pointOf t2, L.pointOf t3} : Set ℝ²) := by
    intro hcol
    exact D.convex.not_three_collinear
      (L.mem_carrier t1) (L.mem_carrier t2) (L.mem_carrier t3)
      (L.injective.ne ht12) (L.injective.ne ht13)
      (L.injective.ne ht23) hcol
  exact u5_common_bisector_triple_incompatibility
    hr_pos hnoncol ht1_radius ht2_radius ht3_radius Kx'
    (hmem p hpRow) (hmem t1 ht1Row) (hmem t2 ht2Row) (hmem t3 ht3Row)
```

## Exact finite decoder interface still required

Define generator-ordered occurrence records/lists for the two families, then
prove one `native_decide` shape theorem for each list.  Do not create 157,200
handwritten theorem declarations.

For every Family A occurrence the decoder theorem must provide:

1. the source-choice center `p` and row index;
2. chosen-row bits `source = true`, `member = true`,
   `offCircle = false`;
3. exact decoding of both q-deleted indices, modulo the canonical swap:
   `(source, member, {p,offCircle})` and
   `(source, offCircle, {p,member})`;
4. positivity/range of all three DIMACS variables.

Items 1 and the source bit are already `sourceChoiceAt_facts`; conversion of a
true choice to the selected base row and mask bits to semantic membership is
already banked.  Items 2 for `member/offCircle`, item 3, and the occurrence
list itself are missing.  No separate support-cardinality, noncollinearity, or
radius-positive decoder fact is needed for Family A.

For every Family B occurrence the decoder theorem must provide:

1. the same chosen source row and the three residual mask bits `t1,t2,t3 =
   true`, plus `x = false`;
2. `t1,t2,t3` pairwise distinct;
3. an encoder local-four row centered at `x` whose support is exactly
   `{p,t1,t2,t3}`, supplied concretely as:
   `hrow`, `hcenterRow`, `hsourceRow`, `hpRow`, `ht1Row`, `ht2Row`,
   `ht3Row`, and `hexhaust`;
4. the three exact global-equality indices/row identities for
   `xp = xt1`, `xp = xt2`, `xp = xt3`;
5. positivity/range of the choice and equality DIMACS variables.

The local-four row shape facts are banked, but existence/identification of
this particular `{p,t1,t2,t3}` row is not.  Pairwise distinctness and source
exclusion are finite consequences of `triple = support - {source}` and are
not packaged.  `exists_globalEqIndex` is banked, but exact agreement with the
generator's three emitted equality variables still belongs in the finite
occurrence decoder.

Radius positivity is **already derivable**, not a missing decoder theorem:
the true source lies in `cube p`, while
`P.cube.center_not_mem_cube p`; hence `p ≠ source`, and `L.injective` plus
`dist_pos.mpr` gives the required positivity.  Geometric noncollinearity is
also **already banked** via `D.convex.not_three_collinear`; only the finite
pairwise label inequalities are missing.

## Clause wrappers and completion gate

After defining exact clause constructors, each wrapper should:

1. split on the choice literal; if false, the negative choice literal closes;
2. decode a true choice with
   `fullSourceChoiceValuation_choice`;
3. for A, split on the two q-pair literals and call
   `u5NontripleChoice_incompatible` only in the all-true branch;
4. for B, split on the three global-equality literals and call
   `u5CommonBisectorChoice_incompatible` only in the all-true branch;
5. use the two batch decoder theorems to prove every generated occurrence
   satisfies its clause, then fold over the occurrence lists.

Acceptance is: exact clause-list equality with the Python manifest blocks,
117,900 and 39,300 clause counts by kernel computation, both semantic
satisfaction theorems source-clean, and a transitive axiom check showing no
`sorryAx`.  Until those occurrence decoders and clause-list equalities exist,
the U5 kernels are reusable geometry but the two full G3 clause families are
not yet Lean-authenticated.

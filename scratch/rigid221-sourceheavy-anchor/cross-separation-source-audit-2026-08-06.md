# Rigid221 source-heavy anchor: shared-pair / `CrossSeparationOK` audit

## Verdict

**Missing producer.**  The current import closure contains enough source-clean
geometry to construct, for one suitable deletion, two selected rows with the
same two cap points and to conclude their cyclic alternation.  It does **not**
contain a theorem that turns the deletion fan into a non-alternating shared
pair (or any equivalent global crossed-fan contradiction).  Thus the existing
`CrossSeparationOK` result is a compatible constraint, not a closure of
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker`.

The literal finite-code route is additionally conditional on a
`CanonicalLabeling S`; the available constructor for that object assumes
`S.IsM44` and `S.surplusCap.card = 6`, while the anchor context has
`R.noM44` and `12 ≤ D.A.card`.  The arbitrary-cardinality geometric theorem
`Problem97.selectedFourClass_shared_pair_separated` is the applicable
source-level substitute and is already import-reachable.

## Search record

The audit first read the requested 2026-08-05 response and the current sibling,
legacy, and older-general theorem-bank registries (including their targeted
JSON inventories). Before attempting any derivation, the live Lean corpus was
queried with:

```text
nthdegree docs search --lean "two selected deletion rows share two cap points CrossSeparationOK"
nthdegree docs search --lean "selected four classes common support pair cap interior cyclic separated contradiction"
nthdegree docs search --lean "qDeletedK4ClassToSelectedFourClass common deletion overlap two"
```

These searches returned the carrier bridge, native classifier soundness,
shared-pair separation, deletion-row adapter, and overlap-upper-bound APIs
audited below. Targeted searches of all three registry JSON files found no
additional shared-pair or `CrossSeparationOK` producer.

## Exact anchor-local construction

Write

```lean
O    := S.oppApex2
c    := (lateFirstApexSystem R).centerAt _packet.xv hxvA
C    := SelectedClass D.A O P.rho
Kxv  := ((lateFirstApexSystem R).selectedAt _packet.xv hxvA).toCriticalFourShell
q    := _packet.xu
```

The hypotheses and packet fields place `u`, `xu`, and `xv` in the physical
five-class / strict second-cap configuration.  The `xv` row contains `u` and
`xv`; `_htraceBound` says these are its only points in `C`.  Equivalently, the
general cap-row bound available in the import closure is

```lean
Problem97.CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin S.hullCycle.length) {center : ℝ²}
    (K : SelectedFourClass A center)
    (hcenter : center ∈ S.capByIndex i) :
    (K.support ∩ S.capByIndex i).card ≤ 2
```

Taking `q = xu`, this excludes `q` from `Kxv`.  The exact survival bridge is

```lean
Problem97.ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support
    {A : Finset ℝ²} (H : CriticalShellSystem A) {q w : ℝ²}
    (hq : q ∈ A) :
    HasNEquidistantPointsAt 4 (A.erase w) (H.centerAt q hq) ↔
      w ∉ (H.selectedAt q hq).toCriticalFourShell.support
```

so the `c` row survives deletion of `xu`.  The physical row at `O` survives
the same deletion by

```lean
FullyDeletionRobustAt.survives
    (self : FullyDeletionRobustAt D center) (z : ℝ²) (hz : z ∈ D.A) :
    HasNEquidistantPointsAt 4 (D.A.erase z) center
```

applied to `P.surface.secondApex_robust`.  The common-deletion constructor is

```lean
Problem97.ATailCommonDeletionTwoCenter.nonempty_commonDeletionTwoCenterPacket
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {q center₁ center₂ : ℝ²}
    (hqA : q ∈ D.A) (hcenter₁A : center₁ ∈ D.A)
    (hcenter₂A : center₂ ∈ D.A) (hcenters_ne : center₁ ≠ center₂)
    (hsurvives₁ : HasNEquidistantPointsAt 4 (D.A.erase q) center₁)
    (hsurvives₂ : HasNEquidistantPointsAt 4 (D.A.erase q) center₂) :
    Nonempty (CommonDeletionTwoCenterPacket D H q center₁ center₂)
```

and its two ambient-row adapters are exactly

```lean
Problem97.ATailPhysicalSecondApexCommonDeletion.firstRowSelectedFourClass
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂) :
    SelectedFourClass D.A center₁

Problem97.ATailPhysicalSecondApexCommonDeletion.secondRowSelectedFourClass
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂) :
    SelectedFourClass D.A center₂
```

Important limitation: `nonempty_commonDeletionTwoCenterPacket` chooses
arbitrary surviving K4 rows and records only `overlap_le_two`; it does not
itself prove that its selected rows contain `u` and `xv`.  Under this anchor,
one can instead prescribe the `c` row as `Kxv` and the `O` row as the physical
class `C.erase xu`.  The exact-five hypotheses make the latter a four-point
row containing `u` and `xv`.  This is local Finset/adapter glue, not an existing
named producer.  No uniqueness claim about the arbitrary row returned by the
`Nonempty` constructor should be made.

## What shared-pair separation actually yields

For the prescribed rows, the source-clean consumer is

```lean
Problem97.selectedFourClass_shared_pair_separated
    {A : Finset ℝ²}
    (rowAt : (center : ↑A) → SelectedFourClass A center.1)
    {n : ℕ} (boundary : Fin n → ℝ²) (indexOf : ↑A → Fin n)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (hboundary : Function.Injective boundary)
    (hindex : Function.Injective indexOf)
    (hpoint : ∀ label, boundary (indexOf label) = label.1)
    {firstCenter secondCenter firstPoint secondPoint : ↑A}
    (hcenters : firstCenter ≠ secondCenter)
    (hpoints : firstPoint ≠ secondPoint)
    (hfirstPoint_first : firstPoint.1 ∈ (rowAt firstCenter).support)
    (hsecondPoint_first : secondPoint.1 ∈ (rowAt firstCenter).support)
    (hfirstPoint_second : firstPoint.1 ∈ (rowAt secondCenter).support)
    (hsecondPoint_second : secondPoint.1 ∈ (rowAt secondCenter).support) :
    SurplusCOMPGBank.btw (indexOf firstCenter) (indexOf secondCenter)
        (indexOf firstPoint) ↔
      ¬ SurplusCOMPGBank.btw (indexOf firstCenter) (indexOf secondCenter)
        (indexOf secondPoint)
```

With centers `c,O` and shared points `u,xv`, this proves alternation.  It does
not prove `False`; the natural order with `O` outside the second cap and
`u,c,xv` within it is alternating and therefore satisfies the conclusion.

The finite-code formulations say the same thing:

```lean
def Problem97.Census554.CapSelectedFiniteCode.CrossSeparationOK
    (P : PatternCode) : Prop :=
  ∀ c d a b, c ≠ d → a ≠ b →
    a ∈ P.row c → b ∈ P.row c →
    a ∈ P.row d → b ∈ P.row d →
    CyclicSeparated c d a b

Problem97.Census554.CapSelectedCarrierBridge.crossSeparationOK_patternCode
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A) :
    CrossSeparationOK (patternCode L F)
```

`Problem97.Census554.CapSelectedNativeClassifierSound.crossSeparationOK_rowOfPattern`
only compiles an already-proved `CrossSeparationOK P` into the corresponding
Boolean row check.  It is a consumer, not an incidence producer.

The carrier injection is also conditional:

```lean
Problem97.exists_faithfulCarrierPattern_with_two_classes
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (hK4 : ∀ center ∈ A, HasNEquidistantPointsAt 4 A center)
    (hcenter₁A : center₁ ∈ A) (hcenter₂A : center₂ ∈ A)
    (hcenters_ne : center₁ ≠ center₂)
    (K₁ : SelectedFourClass A center₁) (K₂ : SelectedFourClass A center₂) :
    ∃ F : FaithfulCarrierPattern A,
      (F.classAt center₁ hcenter₁A).support = K₁.support ∧
      (F.classAt center₂ hcenter₂A).support = K₂.support
```

It preserves two supplied rows; it does not produce their common points.

## Why the existing contradiction consumers do not close the anchor

`Problem97.ATailCapCrossingKalmanson.false_of_two_selected_rows_shared_late_pair`
and
`Problem97.ATailCapCrossingKalmanson.false_of_two_selected_middle_rows_shared_endpoint_pair`
are genuine source-clean contradiction consumers, but each assumes a
non-alternating placement of the two centers and shared endpoints.  The
`c,O,u,xv` pair forced above has the alternating placement required by
separation, so neither theorem applies.

Their exact placement-sensitive types are:

```lean
Problem97.ATailCapCrossingKalmanson.false_of_two_selected_rows_shared_late_pair
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id : Fin carrier.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (ARow : SelectedFourClass carrier (boundary ia))
    (BRow : SelectedFourClass carrier (boundary ib))
    (hic_mem_ARow : boundary ic ∈ ARow.support)
    (hid_mem_ARow : boundary id ∈ ARow.support)
    (hic_mem_BRow : boundary ic ∈ BRow.support)
    (hid_mem_BRow : boundary id ∈ BRow.support) : False

Problem97.ATailCapCrossingKalmanson.false_of_two_selected_middle_rows_shared_endpoint_pair
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id : Fin carrier.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (BRow : SelectedFourClass carrier (boundary ib))
    (CRow : SelectedFourClass carrier (boundary ic))
    (hia_mem_BRow : boundary ia ∈ BRow.support)
    (hid_mem_BRow : boundary id ∈ BRow.support)
    (hia_mem_CRow : boundary ia ∈ CRow.support)
    (hid_mem_CRow : boundary id ∈ CRow.support) : False
```

Across different deletions, all blocker rows have the same center `c`, and all
physical rows have the same center `O`; same-center comparisons fail the
`firstCenter ≠ secondCenter` premise.  Cross-comparisons between `c` and `O`
repeat the same compatible alternation.  No imported theorem combines the fan
to force a non-alternating pair, a third common bisector point, two joint
deletions, or an `IsM44` packet.

## Theorem-bank classification

- The 96 U5 class-level incompatibility families are **conditional
  consumers** of already supplied incidence patterns.  Their metric/scalar
  kernels do not create the anchor's shared pair or the missing fan
  localization.
- The 18 U1 source-unit contradictions are **conditional consumers** requiring
  a row-slot producer.
- `Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`
  is a **conditional consumer** requiring its pattern-completeness producer.
- The legacy and older general-theorem registries contain no import-reachable
  declaration that supplies the needed crossed-fan/non-alternating placement.
- The proposed response-document helpers
  `pentagonOffClass_capDeletionFan` and
  `pentagonOffClass_xvRow_secondCap_eq_pair` are specifications only; no Lean
  declarations with those names exist in the current source tree.

Therefore this anchor is neither a direct theorem-bank closure nor blocked at
the elementary two-row geometry.  Its exact remaining gap is a **new global
producer** that extracts contradictory placement/incidence from the whole
deletion fan under the anchor hypotheses.

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AnchoredProvenanceF2Lift
import F2ThreeRowMetricAudit

/-!
# Scratch: source-indexed second-apex radius transport for anchored F2

The anchored F2 packet retains one actual selected row at `S.oppApex2`:
`R.secondApexRow`.  Its appearances as `secondApexRowQDeleted`,
`X.secondRowXDeleted`, and the aligned packet's `row₂` are retypings of the
same support and radius.

All three named fixed-marginal points (`X.point`, `R.deleted`, and
`R.sourcePair.x`) are omitted from that selected support.  Omission alone
does not decide whether a point lies on the ambient radius class.

This file records the exact valid transport:

* a selected row containing a named point either has the retained radius or
  is support-disjoint from the retained row;
* a common support hit chooses the equal-radius arm;
* for the actual F2 deleted source `X.point`, that arm contradicts the
  already proved three-row metric theorem; and
* the three named fixed-marginal points have pairwise-distinct
  second-apex distances, so no second-apex selected row can contain two of
  them.

No distance conclusion is inferred from support omission.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2SecondApexRadiusTransportScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2ThreeRowMetricAuditScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailRTwoOffLiveFailureScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- Two selected rows at the same center either use the same radius or have
disjoint selected supports.  The ambient carriers may differ. -/
theorem sameCenter_radius_eq_or_support_disjoint
    {A B : Finset ℝ²} {center : ℝ²}
    (K : SelectedFourClass A center)
    (L : SelectedFourClass B center) :
    K.radius = L.radius ∨ Disjoint K.support L.support := by
  by_cases hradius : K.radius = L.radius
  · exact Or.inl hradius
  · right
    rw [Finset.disjoint_left]
    intro z hzK hzL
    apply hradius
    exact (K.support_eq_radius z hzK).symm.trans
      (L.support_eq_radius z hzL)

/-- A row containing `named` either transports that point to the retained
radius or is support-disjoint from the retained row. -/
theorem namedDistance_eq_retainedRadius_or_support_disjoint
    {A B : Finset ℝ²} {center named : ℝ²}
    (K : SelectedFourClass A center)
    (L : SelectedFourClass B center)
    (hnamed : named ∈ K.support) :
    dist center named = L.radius ∨ Disjoint K.support L.support := by
  rcases sameCenter_radius_eq_or_support_disjoint K L with
      hradius | hdisjoint
  · exact Or.inl ((K.support_eq_radius named hnamed).trans hradius)
  · exact Or.inr hdisjoint

/-- A common support point is the precise row-identity datum that transports
the radius of a row containing `named` to the retained row. -/
theorem namedDistance_eq_retainedRadius_of_common_hit
    {A B : Finset ℝ²} {center named common : ℝ²}
    (K : SelectedFourClass A center)
    (L : SelectedFourClass B center)
    (hnamed : named ∈ K.support)
    (hcommonK : common ∈ K.support)
    (hcommonL : common ∈ L.support) :
    dist center named = L.radius := by
  calc
    dist center named = K.radius :=
      K.support_eq_radius named hnamed
    _ = dist center common :=
      (K.support_eq_radius common hcommonK).symm
    _ = L.radius :=
      L.support_eq_radius common hcommonL

/-- If a selected four-support omits one additional ambient point at the
same radius, the full ambient radius class has cardinality at least five.
This is the exact structural consequence of an omitted on-radius point. -/
theorem five_le_selectedClass_of_selectedFourClass_and_extra
    {A B : Finset ℝ²} {center extra : ℝ²}
    (K : SelectedFourClass B center)
    (hKsub : K.support ⊆ A)
    (hextraA : extra ∈ A)
    (hextraNot : extra ∉ K.support)
    (hextraRadius : dist center extra = K.radius) :
    5 ≤ (SelectedClass A center K.radius).card := by
  have hinsert :
      insert extra K.support ⊆ SelectedClass A center K.radius := by
    intro z hz
    rcases Finset.mem_insert.mp hz with rfl | hzK
    · exact mem_selectedClass.mpr ⟨hextraA, hextraRadius⟩
    · exact mem_selectedClass.mpr
        ⟨hKsub hzK, K.support_eq_radius z hzK⟩
  have hcard := Finset.card_le_card hinsert
  rw [Finset.card_insert_of_notMem hextraNot, K.support_card] at hcard
  exact hcard

/-- Distinct off-surplus points on one first-apex radius have distinct
second-apex distances. -/
theorem secondApex_dist_ne_of_common_firstApex_radius
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {radius : ℝ} {x y : ℝ²}
    (hxClass : x ∈ SelectedClass D.A S.oppApex1 radius)
    (hyClass : y ∈ SelectedClass D.A S.oppApex1 radius)
    (hxOff : x ∉ S.surplusCap)
    (hyOff : y ∉ S.surplusCap)
    (hxy : x ≠ y) :
    dist S.oppApex2 x ≠ dist S.oppApex2 y := by
  intro hsecond
  exact U2NonSurplusSqueeze.oppCap2_escape_gen
    (r := radius) (ρ := dist x S.oppApex2) D S
    (mem_selectedClass.mp hxClass).1
    (mem_selectedClass.mp hyClass).1
    hxOff hyOff hxy
    (by
      rw [dist_comm]
      exact (mem_selectedClass.mp hxClass).2)
    (by
      rw [dist_comm]
      exact (mem_selectedClass.mp hyClass).2)
    (by rfl)
    (by
      calc
        dist y S.oppApex2 = dist S.oppApex2 y := dist_comm _ _
        _ = dist S.oppApex2 x := hsecond.symm
        _ = dist x S.oppApex2 := dist_comm _ _)

@[simp] theorem alignedSharedRowPacket_row₂_radius
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    {A : AnchoredSourceCriticalTransition R}
    (X : RowExternalCommonDeletionSource A)
    (hcenter : R.firstCenter = p) :
    (alignedSharedRowPacket X hcenter).row₂.radius =
      R.secondApexRow.radius := by
  rfl

/-- The actual F2 deleted source is the fresh point `X.point`, and the
three-row metric theorem places it off the retained second-apex radius. -/
theorem fresh_off_retained_secondApex_radius
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    (N : AnchoredProvenanceF2NormalForm W R A X hcenter) :
    dist S.oppApex2 X.point ≠ R.secondApexRow.radius := by
  intro hhit
  exact
    false_of_twoLiveExactCover_deleted_middle_radius_hit
      S W (alignedSharedRowPacket X hcenter) N.profile (by
        rw [alignedSharedRowPacket_row₂_radius]
        exact hhit)

/-- The three named fixed-marginal points have pairwise-distinct
second-apex distances. -/
theorem named_secondApex_distances_pairwise_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    (N : AnchoredProvenanceF2NormalForm W R A X hcenter) :
    dist S.oppApex2 X.point ≠ dist S.oppApex2 R.deleted ∧
      dist S.oppApex2 X.point ≠ dist S.oppApex2 R.sourcePair.x ∧
      dist S.oppApex2 R.deleted ≠
        dist S.oppApex2 R.sourcePair.x := by
  exact ⟨
    secondApex_dist_ne_of_common_firstApex_radius D S
      X.point_mem_fixedClass R.deleted_mem_fixedClass
      N.fresh_off_surplus R.deleted_off_surplus
      N.three_named_pairwise.1,
    secondApex_dist_ne_of_common_firstApex_radius D S
      X.point_mem_fixedClass R.source_mem_fixedClass
      N.fresh_off_surplus R.sourcePair.x_off_surplus
      N.three_named_pairwise.2.1,
    secondApex_dist_ne_of_common_firstApex_radius D S
      R.deleted_mem_fixedClass R.source_mem_fixedClass
      R.deleted_off_surplus R.sourcePair.x_off_surplus
      N.three_named_pairwise.2.2.symm⟩

/-- Any second-apex selected row containing the fresh F2 source has radius
different from the retained row. -/
theorem fresh_containingRow_radius_ne_retained
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    (N : AnchoredProvenanceF2NormalForm W R A X hcenter)
    (K : SelectedFourClass D.A S.oppApex2)
    (hX : X.point ∈ K.support) :
    K.radius ≠ R.secondApexRow.radius := by
  intro hradius
  exact fresh_off_retained_secondApex_radius N
    ((K.support_eq_radius X.point hX).trans hradius)

/-- Consequently every actual second-apex selected row containing the fresh
F2 source is support-disjoint from the retained F2 row. -/
theorem fresh_containingRow_disjoint_retained
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    (N : AnchoredProvenanceF2NormalForm W R A X hcenter)
    (K : SelectedFourClass D.A S.oppApex2)
    (hX : X.point ∈ K.support) :
    Disjoint K.support R.secondApexRow.support := by
  rcases sameCenter_radius_eq_or_support_disjoint K R.secondApexRow with
      hradius | hdisjoint
  · exact False.elim
      (fresh_containingRow_radius_ne_retained N K hX hradius)
  · exact hdisjoint

/-- The smallest row-identity producer that would force the F2 scalar
equality: a second-apex row containing `X.point` and sharing one selected
point with the retained row. -/
structure FreshRetainedRadiusTransport
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : RowExternalCommonDeletionSource A) where
  row : SelectedFourClass D.A S.oppApex2
  fresh_mem : X.point ∈ row.support
  common : ℝ²
  common_mem_row : common ∈ row.support
  common_mem_retained : common ∈ R.secondApexRow.support

/-- The exact common-hit transport is terminal for every anchored F2
profile. -/
theorem false_of_freshRetainedRadiusTransport
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    (N : AnchoredProvenanceF2NormalForm W R A X hcenter)
    (Q : FreshRetainedRadiusTransport X) :
    False :=
  fresh_off_retained_secondApex_radius N
    (namedDistance_eq_retainedRadius_of_common_hit
      Q.row R.secondApexRow Q.fresh_mem
      Q.common_mem_row Q.common_mem_retained)

/-- No selected second-apex row can contain both `X.point` and the current
coherent deletion. -/
theorem no_secondApexRow_contains_fresh_and_currentDeleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    (N : AnchoredProvenanceF2NormalForm W R A X hcenter)
    (K : SelectedFourClass D.A S.oppApex2) :
    ¬ (X.point ∈ K.support ∧ R.deleted ∈ K.support) := by
  rintro ⟨hX, hdeleted⟩
  exact (named_secondApex_distances_pairwise_ne N).1
    ((K.support_eq_radius X.point hX).trans
      (K.support_eq_radius R.deleted hdeleted).symm)

/-- No selected second-apex row can contain both `X.point` and the coherent
source. -/
theorem no_secondApexRow_contains_fresh_and_coherentSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    (N : AnchoredProvenanceF2NormalForm W R A X hcenter)
    (K : SelectedFourClass D.A S.oppApex2) :
    ¬ (X.point ∈ K.support ∧ R.sourcePair.x ∈ K.support) := by
  rintro ⟨hX, hsource⟩
  exact (named_secondApex_distances_pairwise_ne N).2.1
    ((K.support_eq_radius X.point hX).trans
      (K.support_eq_radius R.sourcePair.x hsource).symm)

/-- No selected second-apex row can contain both the current coherent
deletion and the coherent source. -/
theorem no_secondApexRow_contains_currentDeleted_and_coherentSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    (N : AnchoredProvenanceF2NormalForm W R A X hcenter)
    (K : SelectedFourClass D.A S.oppApex2) :
    ¬ (R.deleted ∈ K.support ∧ R.sourcePair.x ∈ K.support) := by
  rintro ⟨hdeleted, hsource⟩
  exact (named_secondApex_distances_pairwise_ne N).2.2
    ((K.support_eq_radius R.deleted hdeleted).trans
      (K.support_eq_radius R.sourcePair.x hsource).symm)

/-- A current-deleted containing row has exactly the advertised two-arm
transport boundary.  The anchored packet does not choose either arm. -/
theorem currentDeleted_containingRow_radius_hit_or_disjoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (K : SelectedFourClass D.A S.oppApex2)
    (hdeleted : R.deleted ∈ K.support) :
    dist S.oppApex2 R.deleted = R.secondApexRow.radius ∨
      Disjoint K.support R.secondApexRow.support :=
  namedDistance_eq_retainedRadius_or_support_disjoint
    K R.secondApexRow hdeleted

/-- The coherent-source containing row has the same exact two-arm
transport boundary. -/
theorem coherentSource_containingRow_radius_hit_or_disjoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (K : SelectedFourClass D.A S.oppApex2)
    (hsource : R.sourcePair.x ∈ K.support) :
    dist S.oppApex2 R.sourcePair.x = R.secondApexRow.radius ∨
      Disjoint K.support R.secondApexRow.support :=
  namedDistance_eq_retainedRadius_or_support_disjoint
    K R.secondApexRow hsource

/-- If the omitted current deletion nevertheless lies at the retained
radius, the full ambient class has at least five points.  There is no
contradiction in the current anchored interface from this fact alone. -/
theorem currentDeleted_on_retained_radius_forces_card_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    (N : AnchoredProvenanceF2NormalForm W R A X hcenter)
    (hhit :
      dist S.oppApex2 R.deleted = R.secondApexRow.radius) :
    5 ≤ (SelectedClass D.A S.oppApex2
      R.secondApexRow.radius).card := by
  apply five_le_selectedClass_of_selectedFourClass_and_extra
    R.secondApexRow
  · intro z hz
    have hzDouble := R.secondApexRow.support_subset_A hz
    exact (Finset.mem_erase.mp
      (Finset.mem_erase.mp hzDouble).2).2
  · exact (mem_selectedClass.mp R.deleted_mem_fixedClass).1
  · exact N.named_not_mem_middle.2.1
  · exact hhit

/-- The same card-five boundary holds for the omitted coherent source. -/
theorem coherentSource_on_retained_radius_forces_card_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    (N : AnchoredProvenanceF2NormalForm W R A X hcenter)
    (hhit :
      dist S.oppApex2 R.sourcePair.x =
        R.secondApexRow.radius) :
    5 ≤ (SelectedClass D.A S.oppApex2
      R.secondApexRow.radius).card := by
  apply five_le_selectedClass_of_selectedFourClass_and_extra
    R.secondApexRow
  · intro z hz
    have hzDouble := R.secondApexRow.support_subset_A hz
    exact (Finset.mem_erase.mp
      (Finset.mem_erase.mp hzDouble).2).2
  · exact (mem_selectedClass.mp R.source_mem_fixedClass).1
  · exact N.named_not_mem_middle.2.2
  · exact hhit

/-- At most one of the current coherent deletion and coherent source can lie
at the retained radius. -/
theorem not_both_currentDeleted_and_coherentSource_on_retained_radius
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    (N : AnchoredProvenanceF2NormalForm W R A X hcenter) :
    ¬ (dist S.oppApex2 R.deleted = R.secondApexRow.radius ∧
      dist S.oppApex2 R.sourcePair.x =
        R.secondApexRow.radius) := by
  rintro ⟨hdeleted, hsource⟩
  exact (named_secondApex_distances_pairwise_ne N).2.2
    (hdeleted.trans hsource.symm)

#print axioms sameCenter_radius_eq_or_support_disjoint
#print axioms namedDistance_eq_retainedRadius_or_support_disjoint
#print axioms namedDistance_eq_retainedRadius_of_common_hit
#print axioms five_le_selectedClass_of_selectedFourClass_and_extra
#print axioms secondApex_dist_ne_of_common_firstApex_radius
#print axioms alignedSharedRowPacket_row₂_radius
#print axioms fresh_off_retained_secondApex_radius
#print axioms named_secondApex_distances_pairwise_ne
#print axioms fresh_containingRow_radius_ne_retained
#print axioms fresh_containingRow_disjoint_retained
#print axioms false_of_freshRetainedRadiusTransport
#print axioms no_secondApexRow_contains_fresh_and_currentDeleted
#print axioms no_secondApexRow_contains_fresh_and_coherentSource
#print axioms no_secondApexRow_contains_currentDeleted_and_coherentSource
#print axioms currentDeleted_containingRow_radius_hit_or_disjoint
#print axioms coherentSource_containingRow_radius_hit_or_disjoint
#print axioms currentDeleted_on_retained_radius_forces_card_five
#print axioms coherentSource_on_retained_radius_forces_card_five
#print axioms not_both_currentDeleted_and_coherentSource_on_retained_radius

end ATailRF2SecondApexRadiusTransportScratch
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler

/-!
# Scratch: arbitrary first-apex radius capture

This file isolates the weakest radius-class form of the existing first-apex
co-radial terminal.  Unlike named-row containment, it does not prescribe the
retained frontier radius, the double-deletion radius, or either selected
four-row.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailAllReverseAlternativeCloserScratch

open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Some complete transition reverse outside pair lies in one, otherwise
unspecified, first-apex radius class. -/
abbrev FirstApexAnyRadiusTransitionReversePairCapture
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation) : Prop :=
  ∃ q : PhysicalVertex profile, ∃ radius : ℝ,
    (transitionReverseOutsidePair A.transition q ∩
      SelectedClass D.A S.oppApex1 radius).card = 2

/-- Arbitrary-radius two-hit capture is exactly the existing metric terminal
occurrence.  Thus it is strictly less prescriptive than containment in either
named first-apex selected row, but it does not add new mathematical force. -/
theorem firstApexAnyRadiusCapture_iff_coRadialOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation) :
    FirstApexAnyRadiusTransitionReversePairCapture A ↔
      FirstApexCoRadialTransitionReversePairOccurrence A := by
  let hreverse : ∀ q : PhysicalVertex profile,
      q.1 ∈
        (H.selectedAt (A.transition.successor q).1
          (PhysicalVertex.mem_A
            (A.transition.successor q))).toCriticalFourShell.support :=
    fun q ↦ A.allReverse q (A.transition.successor q)
      (A.transition.successor_not_mem_actualCriticalSupport q)
  constructor
  · rintro ⟨q, radius, hcapture⟩
    have hpairCard : (transitionReverseOutsidePair A.transition q).card = 2 :=
      transitionReverseOutsidePair_card_eq_two A.transition hreverse q
    have hinterEq :
        transitionReverseOutsidePair A.transition q ∩
            SelectedClass D.A S.oppApex1 radius =
          transitionReverseOutsidePair A.transition q := by
      apply Finset.eq_of_subset_of_card_le Finset.inter_subset_left
      rw [hpairCard, hcapture]
    rcases exists_transitionReverseOutsidePair_eq_pair A.transition hreverse q with
      ⟨a, b, hab, hpairEq⟩
    have haPair : a ∈ transitionReverseOutsidePair A.transition q := by
      rw [hpairEq]
      simp
    have hbPair : b ∈ transitionReverseOutsidePair A.transition q := by
      rw [hpairEq]
      simp
    have haClass : a ∈ SelectedClass D.A S.oppApex1 radius := by
      have haInter :
          a ∈ transitionReverseOutsidePair A.transition q ∩
            SelectedClass D.A S.oppApex1 radius := by
        rw [hinterEq]
        exact haPair
      exact (Finset.mem_inter.mp haInter).2
    have hbClass : b ∈ SelectedClass D.A S.oppApex1 radius := by
      have hbInter :
          b ∈ transitionReverseOutsidePair A.transition q ∩
            SelectedClass D.A S.oppApex1 radius := by
        rw [hinterEq]
        exact hbPair
      exact (Finset.mem_inter.mp hbInter).2
    exact ⟨q, a, b, hab, haPair, hbPair,
      (mem_selectedClass.mp haClass).2.trans
        (mem_selectedClass.mp hbClass).2.symm⟩
  · rintro ⟨q, a, b, hab, haPair, hbPair, hfirst⟩
    have hpairCard : (transitionReverseOutsidePair A.transition q).card = 2 :=
      transitionReverseOutsidePair_card_eq_two A.transition hreverse q
    have habSubset :
        ({a, b} : Finset ℝ²) ⊆ transitionReverseOutsidePair A.transition q := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl
      · exact haPair
      · exact hbPair
    have habEq :
        ({a, b} : Finset ℝ²) = transitionReverseOutsidePair A.transition q := by
      apply Finset.eq_of_subset_of_card_le habSubset
      simp [hab, hpairCard]
    have haA : a ∈ D.A :=
      (Finset.mem_sdiff.mp
        (transitionReverseOutsidePair_subset_complement A.transition q haPair)).1
    have hbA : b ∈ D.A :=
      (Finset.mem_sdiff.mp
        (transitionReverseOutsidePair_subset_complement A.transition q hbPair)).1
    have haClass :
        a ∈ SelectedClass D.A S.oppApex1 (dist S.oppApex1 a) :=
      mem_selectedClass.mpr ⟨haA, rfl⟩
    have hbClass :
        b ∈ SelectedClass D.A S.oppApex1 (dist S.oppApex1 a) :=
      mem_selectedClass.mpr ⟨hbA, hfirst.symm⟩
    refine ⟨q, dist S.oppApex1 a, ?_⟩
    rw [Finset.inter_eq_left.mpr]
    · exact hpairCard
    · intro x hx
      rw [← habEq] at hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl
      · exact haClass
      · exact hbClass

/-- The current named-row proposal factors through arbitrary-radius capture.
The converse is intentionally not asserted: a captured radius need not be
either of the two selected-row radii stored in `A.firstApexRoles`. -/
theorem firstApexAnyRadiusCapture_of_namedRowOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation)
    (hnamed : FirstApexNamedRowTransitionReversePairOccurrence A) :
    FirstApexAnyRadiusTransitionReversePairCapture A :=
  (firstApexAnyRadiusCapture_iff_coRadialOccurrence A).mpr
    (firstApexCoRadialOccurrence_of_namedRowOccurrence A hnamed)

/-- The arbitrary-radius form feeds the existing full-parent terminal without
choosing either named first-apex row. -/
theorem false_of_fullParentExactFiveAllReverseData_of_anyRadiusCapture
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation)
    (hcapture : FirstApexAnyRadiusTransitionReversePairCapture A) : False :=
  false_of_fullParentExactFiveAllReverseData_of_firstApexOccurrence A
    ((firstApexAnyRadiusCapture_iff_coRadialOccurrence A).mp hcapture)

#print axioms firstApexAnyRadiusCapture_iff_coRadialOccurrence
#print axioms firstApexAnyRadiusCapture_of_namedRowOccurrence
#print axioms false_of_fullParentExactFiveAllReverseData_of_anyRadiusCapture

end

end ATailAllReverseAlternativeCloserScratch
end Problem97

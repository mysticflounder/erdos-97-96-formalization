/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionTransitionGlobal
import Erdos9796Proof.P97.ATail.LargeOppositeCapsBiApexSurface

/-!
# Scratch: retained first-apex radius capture

This file records the smallest source-faithful producer contract found by the
full-parent audit.  The geometric statement is that one exact-two transition
reverse residual has two hits in the retained first-apex radius class.

The theorem below only checks the terminal plumbing from that contract to the
production ordered-cap contradiction.  The capture contract itself remains
open.  This file was not elaborated after the user stopped the active build.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRetainedFirstApexRadiusCaptureScratch

open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The complete full-parent occurrence target.  Keeping `L` and
`continuation` as indices prevents a future caller from silently dropping the
large-cap parent or the source-faithful exact-five continuation before proving
the geometric capture. -/
def RetainedFirstApexRadiusCapture
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile)
    (T : PhysicalActualCriticalOmissionTransition H profile) : Prop :=
  ∃ q : PhysicalVertex profile,
    (transitionReverseOutsidePair T q ∩
      SelectedClass D.A S.oppApex1 radius).card = 2

/-- Once the retained-radius capture is available, the production
transition-pair consumer closes the all-reverse leaf immediately.  This is
routine plumbing, not the missing geometric producer. -/
theorem false_of_retainedFirstApexRadiusCapture
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile)
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (hreverse : ∀ q : PhysicalVertex profile,
      q.1 ∈
        (H.selectedAt (T.successor q).1
          (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell.support)
    (hcapture : RetainedFirstApexRadiusCapture L continuation T) : False := by
  rcases hcapture with ⟨q, hcapture⟩
  have hpairCard : (transitionReverseOutsidePair T q).card = 2 :=
    transitionReverseOutsidePair_card_eq_two T hreverse q
  have hinterEq :
      transitionReverseOutsidePair T q ∩
          SelectedClass D.A S.oppApex1 radius =
        transitionReverseOutsidePair T q := by
    apply Finset.eq_of_subset_of_card_le Finset.inter_subset_left
    rw [hpairCard, hcapture]
  rcases exists_transitionReverseOutsidePair_eq_pair T hreverse q with
    ⟨a, b, hab, hpairEq⟩
  have haPair : a ∈ transitionReverseOutsidePair T q := by
    rw [hpairEq]
    simp
  have hbPair : b ∈ transitionReverseOutsidePair T q := by
    rw [hpairEq]
    simp
  have haClass : a ∈ SelectedClass D.A S.oppApex1 radius := by
    have haInter :
        a ∈ transitionReverseOutsidePair T q ∩
          SelectedClass D.A S.oppApex1 radius := by
      rw [hinterEq]
      exact haPair
    exact (Finset.mem_inter.mp haInter).2
  have hbClass : b ∈ SelectedClass D.A S.oppApex1 radius := by
    have hbInter :
        b ∈ transitionReverseOutsidePair T q ∩
          SelectedClass D.A S.oppApex1 radius := by
      rw [hinterEq]
      exact hbPair
    exact (Finset.mem_inter.mp hbInter).2
  have hfirstEq : dist S.oppApex1 a = dist S.oppApex1 b :=
    (mem_selectedClass.mp haClass).2.trans
      (mem_selectedClass.mp hbClass).2.symm
  exact false_of_transitionReverseOutsidePair_coRadial_firstApex
    T hreverse q hab haPair hbPair hfirstEq

end

end ATailRetainedFirstApexRadiusCaptureScratch
end Problem97

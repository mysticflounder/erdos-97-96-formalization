/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.

Scratch consumer for the exact-five all-reverse parent.  The producer
occurrence remains open; this file only closes the two-point named-row arm.
-/

import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler

/-!
This consumer turns two points of one transition reverse outside pair lying
in a retained first-apex row into the existing co-radial terminal.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailReversePairNamedRowConsumer

open ATailFirstApexShellRole
open ATailCriticalPairFrontier
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailLargeOppositeCapsBiApexSurface
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailPhysicalSecondApexCommonDeletion
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler

attribute [local instance] Classical.propDecidable

private theorem false_of_reversePair_twoPoints_in_row
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {firstRadius : ℝ} {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation)
    (q : PhysicalVertex profile)
    (row : SelectedFourClass D.A S.oppApex1)
    (hinter :
      2 ≤ (transitionReverseOutsidePair A.transition q ∩ row.support).card) :
    False := by
  have hreverse : ∀ x : PhysicalVertex profile,
      x.1 ∈
        (H.selectedAt (A.transition.successor x).1
          (PhysicalVertex.mem_A (A.transition.successor x))).toCriticalFourShell.support :=
    fun x ↦ A.allReverse x (A.transition.successor x)
      (A.transition.successor_not_mem_actualCriticalSupport x)
  rcases Finset.exists_subset_card_eq
      (s := transitionReverseOutsidePair A.transition q ∩ row.support) hinter with
    ⟨P, hPsub, hPcard⟩
  rw [Finset.card_eq_two] at hPcard
  rcases hPcard with ⟨a, b, hab, hPeq⟩
  have haInter : a ∈ transitionReverseOutsidePair A.transition q ∩ row.support := by
    apply hPsub
    rw [hPeq]
    simp
  have hbInter : b ∈ transitionReverseOutsidePair A.transition q ∩ row.support := by
    apply hPsub
    rw [hPeq]
    simp
  have ha := Finset.mem_inter.mp haInter
  have hb := Finset.mem_inter.mp hbInter
  have hfirstEq : dist S.oppApex1 a = dist S.oppApex1 b :=
    (row.support_eq_radius a ha.2).trans
      (row.support_eq_radius b hb.2).symm
  exact false_of_transitionReverseOutsidePair_coRadial_firstApex
    A.transition hreverse q hab ha.1 hb.1 hfirstEq

theorem false_of_reversePair_twoPoints_in_retainedRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {firstRadius : ℝ} {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation)
    (q : PhysicalVertex profile)
    (hinter :
      2 ≤
        (transitionReverseOutsidePair A.transition q ∩
          A.firstApexRoles.retainedRow.support).card) :
    False :=
  false_of_reversePair_twoPoints_in_row A q
    A.firstApexRoles.retainedRow hinter

theorem false_of_reversePair_twoPoints_in_doubleRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {firstRadius : ℝ} {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation)
    (q : PhysicalVertex profile)
    (hinter :
      2 ≤
        (transitionReverseOutsidePair A.transition q ∩
          A.firstApexRoles.doubleRow.support).card) :
    False :=
  false_of_reversePair_twoPoints_in_row A q
    A.firstApexRoles.doubleRow hinter

#print axioms false_of_reversePair_twoPoints_in_retainedRow
#print axioms false_of_reversePair_twoPoints_in_doubleRow

end ATailReversePairNamedRowConsumer
end Problem97

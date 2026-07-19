/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler

/-!
# Scratch: all-reverse continuation four-center deletion

The exact all-reverse transition makes its successor map a permutation of the
physical vertices.  A predecessor of the first continuation source therefore
supplies a second actual blocker at which deleting that source preserves K4.
The full parent supplies survival at both opposite apices, while the
continuation supplies survival at its unused-source blocker.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailAllReverseAlternativeCloserScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailDeletionRobustness
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

private theorem selectedSupport_eq_of_centerAt_eq
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {source₁ source₂ : ℝ²}
    (hsource₁ : source₁ ∈ D.A) (hsource₂ : source₂ ∈ D.A)
    (hcenter :
      H.centerAt source₁ hsource₁ = H.centerAt source₂ hsource₂) :
    (H.selectedAt source₁ hsource₁).toCriticalFourShell.support =
      (H.selectedAt source₂ hsource₂).toCriticalFourShell.support := by
  let K₁ := (H.selectedAt source₁ hsource₁).toCriticalFourShell
  let K₂ := (H.selectedAt source₂ hsource₂).toCriticalFourShell
  have hsource₁K₂ : source₁ ∈ K₂.support :=
    source_mem_critical_support_of_no_qfree
      (H.selectedAt source₂ hsource₂) (by
        intro hsurvives
        apply H.no_qfree_at source₁ hsource₁
        simpa only [hcenter] using hsurvives)
  have hradii : K₁.radius = K₂.radius := by
    calc
      K₁.radius = dist (H.centerAt source₁ hsource₁) source₁ :=
        (K₁.support_eq_radius source₁ K₁.q_mem_support).symm
      _ = dist (H.centerAt source₂ hsource₂) source₁ :=
        congrArg (fun center ↦ dist center source₁) hcenter
      _ = K₂.radius := K₂.support_eq_radius source₁ hsource₁K₂
  ext x
  constructor
  · intro hx
    apply K₂.off_row_named_label_forbidden (K₁.support_subset_A hx)
    calc
      dist (H.centerAt source₂ hsource₂) x =
          dist (H.centerAt source₁ hsource₁) x :=
        (congrArg (fun center ↦ dist center x) hcenter).symm
      _ = K₁.radius := K₁.support_eq_radius x hx
      _ = K₂.radius := hradii
  · intro hx
    apply K₁.off_row_named_label_forbidden (K₂.support_subset_A hx)
    calc
      dist (H.centerAt source₁ hsource₁) x =
          dist (H.centerAt source₂ hsource₂) x :=
        congrArg (fun center ↦ dist center x) hcenter
      _ = K₂.radius := K₂.support_eq_radius x hx
      _ = K₁.radius := hradii.symm

/-- Deleting the first continuation source leaves K4 at both opposite apices,
the unused-source actual blocker, and the actual blocker of one transition
predecessor.  The two blockers are distinct and each differs from both
apices. -/
structure FullParentAllReverseContinuationFourCenterDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation) : Type where
  predecessor : PhysicalVertex profile
  successor_eq_first : (A.transition.successor predecessor).1 = continuation.first
  blockers_ne :
    H.centerAt continuation.unusedRow.unused.point continuation.unusedRow.source_mem_A ≠
      H.centerAt predecessor.1 (PhysicalVertex.mem_A predecessor)
  firstApex_survives :
    HasNEquidistantPointsAt 4 (D.A.erase continuation.first) S.oppApex1
  secondApex_survives :
    HasNEquidistantPointsAt 4 (D.A.erase continuation.first) S.oppApex2
  continuationBlocker_survives :
    HasNEquidistantPointsAt 4 (D.A.erase continuation.first)
      (H.centerAt continuation.unusedRow.unused.point continuation.unusedRow.source_mem_A)
  predecessorBlocker_survives :
    HasNEquidistantPointsAt 4 (D.A.erase continuation.first)
      (H.centerAt predecessor.1 (PhysicalVertex.mem_A predecessor))
  continuationBlocker_ne_firstApex :
    H.centerAt continuation.unusedRow.unused.point continuation.unusedRow.source_mem_A ≠
      S.oppApex1
  continuationBlocker_ne_secondApex :
    H.centerAt continuation.unusedRow.unused.point continuation.unusedRow.source_mem_A ≠
      S.oppApex2
  predecessorBlocker_ne_firstApex :
    H.centerAt predecessor.1 (PhysicalVertex.mem_A predecessor) ≠ S.oppApex1
  predecessorBlocker_ne_secondApex :
    H.centerAt predecessor.1 (PhysicalVertex.mem_A predecessor) ≠ S.oppApex2

/-- The continuation/cycle packet unconditionally produces the four-center
deletion surface above. -/
theorem nonempty_fullParentAllReverseContinuationFourCenterDeletion
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
    Nonempty (FullParentAllReverseContinuationFourCenterDeletion A) := by
  let hreverse : ∀ q : PhysicalVertex profile,
      q.1 ∈
        (H.selectedAt (A.transition.successor q).1
          (PhysicalVertex.mem_A
            (A.transition.successor q))).toCriticalFourShell.support :=
    fun q ↦ A.allReverse q (A.transition.successor q)
      (A.transition.successor_not_mem_actualCriticalSupport q)
  have hinjective : Function.Injective A.transition.successor :=
    transition_successor_injective_of_all_reverseMembership A.transition hreverse
  have hsurjective : Function.Surjective A.transition.successor :=
    Finite.injective_iff_surjective.mp hinjective
  let firstVertex : PhysicalVertex profile :=
    ⟨continuation.first, continuation.first_mem_physicalInterior⟩
  rcases hsurjective firstVertex with ⟨predecessor, hsuccessor⟩
  rcases hsurjective predecessor with ⟨before, hbefore⟩
  subst predecessor
  have hunusedNotPredecessorSupport :
      continuation.unusedRow.unused.point ∉
        (H.selectedAt (A.transition.successor before).1
          (PhysicalVertex.mem_A
            (A.transition.successor before))).toCriticalFourShell.support := by
    intro hunusedSupport
    have hunusedPair :
        continuation.unusedRow.unused.point ∈
          ({before.1, (A.transition.successor before).1} : Finset ℝ²) := by
      rw [← transition_successor_actualCriticalSupport_inter_physicalCap_eq_pair
        A.transition hreverse before]
      exact Finset.mem_inter.mpr
        ⟨hunusedSupport,
          continuation.unusedRow.unused.point_mem_capByIndex⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hunusedPair
    rcases hunusedPair with hunusedBefore | hunusedSuccessor
    · apply continuation.unusedRow.unused.point_not_mem_radiusClass
      rw [hunusedBefore]
      exact PhysicalVertex.mem_radiusClass before
    · apply continuation.unusedRow.unused.point_not_mem_radiusClass
      rw [hunusedSuccessor]
      exact PhysicalVertex.mem_radiusClass (A.transition.successor before)
  have hblockersNe :
      H.centerAt continuation.unusedRow.unused.point
          continuation.unusedRow.source_mem_A ≠
        H.centerAt (A.transition.successor before).1
          (PhysicalVertex.mem_A (A.transition.successor before)) := by
    intro hblockers
    have hsupports := selectedSupport_eq_of_centerAt_eq H
      continuation.unusedRow.source_mem_A
      (PhysicalVertex.mem_A (A.transition.successor before)) hblockers
    apply hunusedNotPredecessorSupport
    rw [← hsupports]
    exact (H.selectedAt continuation.unusedRow.unused.point
      continuation.unusedRow.source_mem_A).toCriticalFourShell.q_mem_support
  have hsuccessorPoint :
      (A.transition.successor (A.transition.successor before)).1 =
        continuation.first := by
    simpa [firstVertex] using congrArg Subtype.val hsuccessor
  exact ⟨{
    predecessor := A.transition.successor before
    successor_eq_first := hsuccessorPoint
    blockers_ne := hblockersNe
    firstApex_survives := B.firstApex_robust.survives continuation.first
      (PhysicalVertex.mem_A firstVertex)
    secondApex_survives := B.secondApex_robust.survives continuation.first
      (PhysicalVertex.mem_A firstVertex)
    continuationBlocker_survives := continuation.first_survives_actualBlocker
    predecessorBlocker_survives := by
      simpa only [hsuccessorPoint] using
        A.transition.successor_deletion_survives_actualBlocker
          (A.transition.successor before)
    continuationBlocker_ne_firstApex :=
      B.firstApex_robust.centerAt_ne H continuation.unusedRow.unused.point
        continuation.unusedRow.source_mem_A
    continuationBlocker_ne_secondApex :=
      B.secondApex_robust.centerAt_ne H continuation.unusedRow.unused.point
        continuation.unusedRow.source_mem_A
    predecessorBlocker_ne_firstApex :=
      B.firstApex_robust.centerAt_ne H (A.transition.successor before).1
        (PhysicalVertex.mem_A (A.transition.successor before))
    predecessorBlocker_ne_secondApex :=
      B.secondApex_robust.centerAt_ne H (A.transition.successor before).1
        (PhysicalVertex.mem_A (A.transition.successor before)) }⟩

#print axioms nonempty_fullParentAllReverseContinuationFourCenterDeletion

end

end ATailAllReverseAlternativeCloserScratch
end Problem97

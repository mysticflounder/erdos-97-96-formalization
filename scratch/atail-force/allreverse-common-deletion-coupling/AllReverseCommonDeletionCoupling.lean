/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LargeCapUniqueFiveCommonDeletionNormalForm
import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler

/-!
# Scratch: exact-five all-reverse/common-deletion coupling

The origin-tagged continuation and the all-reverse transition give four
source-faithful q-deleted rows for one continuation source.  The unused-source
and physical-apex rows are put in their production canonical normal forms.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailAllReverseCommonDeletionCouplingScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveCommonDeletionNormalForm
open ATailLargeCapUniqueFiveLowHit
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

private theorem oppApex1_ne_oppApex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ≠ S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v23_ne
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v13_ne.symm
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v12_ne

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

private def criticalSupportAsQDeletedRow
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted source : ℝ²}
    (hsource : source ∈ D.A)
    (homit : deleted ∉
      (H.selectedAt source hsource).toCriticalFourShell.support) :
    U5QDeletedK4Class D deleted (H.centerAt source hsource)
      (H.selectedAt source hsource).toCriticalFourShell.support where
  subset := by
    intro z hz
    change z ∈ (D.A.erase deleted).erase (H.centerAt source hsource)
    exact Finset.mem_erase.mpr
      ⟨fun h ↦
          (H.selectedAt source hsource).toCriticalFourShell.center_not_mem_support
            (by simpa [h] using hz),
        Finset.mem_erase.mpr
          ⟨fun h ↦ homit (by simpa [h] using hz),
            (H.selectedAt source hsource).toCriticalFourShell.support_subset_A hz⟩⟩
  card_four := by
    rw [(H.selectedAt source hsource).toCriticalFourShell.support_card]
  q_not_mem := homit
  radius := (H.selectedAt source hsource).toCriticalFourShell.radius
  radius_pos := (H.selectedAt source hsource).toCriticalFourShell.radius_pos
  same_radius :=
    (H.selectedAt source hsource).toCriticalFourShell.support_eq_radius

/-- Four pairwise-distinct centers carrying source-faithful q-deleted rows
for deletion of `continuation.first`.  The continuation-blocker and physical
rows use their complete production normal forms. -/
structure FullParentAllReverseContinuationFourRowIngress
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
  successor_eq_first :
    (A.transition.successor predecessor).1 = continuation.first
  dangerousSupport : Finset ℝ²
  physicalDangerous :
    U5DangerousTriple D continuation.first S.oppApex2 dangerousSupport
  physicalRowsIntersectionCard :
    (continuation.firstPacket.B₂ ∩ continuation.secondPacket.B₂).card = 3
  thirdCommonDeletionSource : ℝ²
  third_mem_physicalClass :
    thirdCommonDeletionSource ∈
      SelectedClass D.A S.oppApex2 profile.radius
  third_ne_first : thirdCommonDeletionSource ≠ continuation.first
  third_ne_second : thirdCommonDeletionSource ≠ continuation.second
  third_not_mem_continuationBlockerSupport :
    thirdCommonDeletionSource ∉
      (H.selectedAt continuation.unusedRow.unused.point
        continuation.unusedRow.source_mem_A).toCriticalFourShell.support
  third_survives_continuationBlocker :
    HasNEquidistantPointsAt 4 (D.A.erase thirdCommonDeletionSource)
      (H.centerAt continuation.unusedRow.unused.point
        continuation.unusedRow.source_mem_A)
  third_survives_physicalApex :
    HasNEquidistantPointsAt 4 (D.A.erase thirdCommonDeletionSource)
      S.oppApex2
  firstApexSupport : Finset ℝ²
  firstApexRow :
    U5QDeletedK4Class D continuation.first S.oppApex1 firstApexSupport
  physicalApexRow :
    U5QDeletedK4Class D continuation.first S.oppApex2
      ((SelectedClass D.A S.oppApex2 profile.radius).erase continuation.first)
  continuationBlockerRow :
    U5QDeletedK4Class D continuation.first
      (H.centerAt continuation.unusedRow.unused.point
        continuation.unusedRow.source_mem_A)
      (H.selectedAt continuation.unusedRow.unused.point
        continuation.unusedRow.source_mem_A).toCriticalFourShell.support
  predecessorBlockerRow :
    U5QDeletedK4Class D continuation.first
      (H.centerAt predecessor.1 (PhysicalVertex.mem_A predecessor))
      (H.selectedAt predecessor.1
        (PhysicalVertex.mem_A predecessor)).toCriticalFourShell.support
  apices_ne : S.oppApex1 ≠ S.oppApex2
  continuationBlocker_ne_firstApex :
    H.centerAt continuation.unusedRow.unused.point
        continuation.unusedRow.source_mem_A ≠ S.oppApex1
  continuationBlocker_ne_secondApex :
    H.centerAt continuation.unusedRow.unused.point
        continuation.unusedRow.source_mem_A ≠ S.oppApex2
  predecessorBlocker_ne_firstApex :
    H.centerAt predecessor.1 (PhysicalVertex.mem_A predecessor) ≠ S.oppApex1
  predecessorBlocker_ne_secondApex :
    H.centerAt predecessor.1 (PhysicalVertex.mem_A predecessor) ≠ S.oppApex2
  blockers_ne :
    H.centerAt continuation.unusedRow.unused.point
        continuation.unusedRow.source_mem_A ≠
      H.centerAt predecessor.1 (PhysicalVertex.mem_A predecessor)

/-- Exact U5-facing reduction obtained by coupling the common-deletion normal
form to a predecessor in the all-reverse permutation. -/
theorem nonempty_fullParentAllReverseContinuationFourRowIngress
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
    Nonempty (FullParentAllReverseContinuationFourRowIngress A) := by
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
  have hfirstA : continuation.first ∈ D.A :=
    PhysicalVertex.mem_A firstVertex
  rcases exists_third_commonDeletionSource continuation with
    ⟨third, hthirdClass, hthirdNeFirst, hthirdNeSecond,
      hthirdNotBlocker, hthirdBlockerSurvives, hthirdPhysicalSurvives⟩
  let physicalClass := SelectedClass D.A S.oppApex2 profile.radius
  have hfirstClass : continuation.first ∈ physicalClass := by
    simpa [physicalClass] using
      (Finset.mem_inter.mp continuation.first_mem_physicalInterior).1
  have hphysicalEraseCard :
      (physicalClass.erase continuation.first).card = 4 := by
    rw [Finset.card_erase_of_mem hfirstClass]
    simpa [physicalClass] using profile.class_card_eq_five
  have hphysicalEraseThree : 3 ≤ (physicalClass.erase continuation.first).card := by
    omega
  rcases Finset.exists_subset_card_eq hphysicalEraseThree with
    ⟨dangerousSupport, hdangerousSub, hdangerousCard⟩
  have hphysicalDangerous :
      U5DangerousTriple D continuation.first S.oppApex2 dangerousSupport := by
    have hfirstRadius :
        dist S.oppApex2 continuation.first = profile.radius :=
      (mem_selectedClass.mp (by simpa [physicalClass] using hfirstClass)).2
    refine {
      q_mem := hfirstA
      p_mem := continuation.firstPacket.center₂_mem_A
      p_ne_q := ?_
      T_subset := ?_
      T_card := hdangerousCard
      T_noncollinear := ?_
      q_radius_pos := by simpa only [hfirstRadius] using profile.radius_pos
      T_same_radius := ?_ }
    · intro h
      have hzero : dist S.oppApex2 continuation.first = 0 := by
        rw [← h, dist_self]
      rw [hfirstRadius] at hzero
      linarith [profile.radius_pos]
    · intro z hz
      have hzErase := Finset.mem_erase.mp (hdangerousSub hz)
      have hzClass : z ∈ SelectedClass D.A S.oppApex2 profile.radius := by
        simpa [physicalClass] using hzErase.2
      have hzA : z ∈ D.A := (mem_selectedClass.mp hzClass).1
      have hzNeApex : z ≠ S.oppApex2 := by
        intro h
        have hzRadius := (mem_selectedClass.mp hzClass).2
        rw [h, dist_self] at hzRadius
        linarith [profile.radius_pos]
      change z ∈ (D.A.erase continuation.first).erase S.oppApex2
      exact Finset.mem_erase.mpr
        ⟨hzNeApex, Finset.mem_erase.mpr ⟨hzErase.1, hzA⟩⟩
    · have hsubA : dangerousSupport ⊆ D.A := by
        intro z hz
        have hzClass := (Finset.mem_erase.mp (hdangerousSub hz)).2
        exact (mem_selectedClass.mp (by
          simpa [physicalClass] using hzClass)).1
      exact (D.convex.mono hsubA).not_collinear_of_card_ge_three (by
        rw [hdangerousCard])
    · intro z hz
      have hzClass := (Finset.mem_erase.mp (hdangerousSub hz)).2
      calc
        dist S.oppApex2 z = profile.radius :=
          (mem_selectedClass.mp (by
            simpa [physicalClass] using hzClass)).2
        _ = dist S.oppApex2 continuation.first := hfirstRadius.symm
  rcases U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
      (D := D) (q := continuation.first) (center := S.oppApex1)
      (by
        simpa [CounterexampleData.skeleton] using
          B.firstApex_robust.survives continuation.first hfirstA) with
    ⟨firstApexSupport, ⟨firstApexRow⟩, _⟩
  have hphysicalRow :
      U5QDeletedK4Class D continuation.first S.oppApex2
        ((SelectedClass D.A S.oppApex2 profile.radius).erase continuation.first) := by
    rw [← firstPacket_B₂_eq_physicalClass_erase_first continuation]
    exact continuation.firstPacket.row₂
  have hcontinuationRow :
      U5QDeletedK4Class D continuation.first
        (H.centerAt continuation.unusedRow.unused.point
          continuation.unusedRow.source_mem_A)
        (H.selectedAt continuation.unusedRow.unused.point
          continuation.unusedRow.source_mem_A).toCriticalFourShell.support := by
    rw [← firstPacket_B₁_eq_actualCriticalSupport continuation]
    exact continuation.firstPacket.row₁
  have hfirstNotPredecessorSupport :
      continuation.first ∉
        (H.selectedAt (A.transition.successor before).1
          (PhysicalVertex.mem_A
            (A.transition.successor before))).toCriticalFourShell.support := by
    simpa only [hsuccessorPoint] using
      A.transition.successor_not_mem_actualCriticalSupport
        (A.transition.successor before)
  exact ⟨{
    predecessor := A.transition.successor before
    successor_eq_first := hsuccessorPoint
    dangerousSupport := dangerousSupport
    physicalDangerous := hphysicalDangerous
    physicalRowsIntersectionCard :=
      physical_support_inter_card_eq_three continuation
    thirdCommonDeletionSource := third
    third_mem_physicalClass := hthirdClass
    third_ne_first := hthirdNeFirst
    third_ne_second := hthirdNeSecond
    third_not_mem_continuationBlockerSupport := hthirdNotBlocker
    third_survives_continuationBlocker := hthirdBlockerSurvives
    third_survives_physicalApex := hthirdPhysicalSurvives
    firstApexSupport := firstApexSupport
    firstApexRow := firstApexRow
    physicalApexRow := hphysicalRow
    continuationBlockerRow := hcontinuationRow
    predecessorBlockerRow := criticalSupportAsQDeletedRow
      (PhysicalVertex.mem_A (A.transition.successor before))
      hfirstNotPredecessorSupport
    apices_ne := oppApex1_ne_oppApex2 S
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
        (PhysicalVertex.mem_A (A.transition.successor before))
    blockers_ne := hblockersNe }⟩

#print axioms nonempty_fullParentAllReverseContinuationFourRowIngress

end

end ATailAllReverseCommonDeletionCouplingScratch
end Problem97

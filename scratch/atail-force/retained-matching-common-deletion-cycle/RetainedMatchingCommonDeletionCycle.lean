/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.RetainedMatchingCommonDeletionNormalization

/-!
# Source-tagged common-deletion walk for retained blocker matching

Every constructor of the retained matching large-cap outcome contains two
consecutive source-exact common deletions.  The first edge is the original
retained omission.  The second edge is either the reverse common deletion or
one of the two cap-cardinality renewals.

This file retains those two edges instead of projecting to one anonymous
`CommonDeletionTwoCenterPacket`.  The endpoint split is exact: the walk either
returns to its first source, its endpoint has the same actual blocker as the
first source and hence gives an origin-tagged critical fiber, or the three
successive actual blockers are pairwise distinct.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRetainedMatchingCommonDeletionCycleScratch

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailCriticalFiberRetainedRadiusSelector
open ATailFirstApexCriticalFiber
open ATailFirstApexCriticalFiberRow
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingCommonDeletionNormalization
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer

attribute [local instance] Classical.propDecidable

/-- The geometric location of the second common-deletion source. -/
inductive RetainedMatchingNextLocation
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (first second next : ℝ²) : Type
  | sourceReturn
      (next_eq_first : next = first)
  | freshFirstCap
      (next_mem_capInterior :
        next ∈ S.capInteriorByIndex S.oppIndex1)
      (next_ne_first : next ≠ first)
      (next_ne_second : next ≠ second)
  | freshSecondCap
      (next_mem_capInterior :
        next ∈ S.capInteriorByIndex S.oppIndex2)
      (next_ne_first : next ≠ first)
      (next_ne_second : next ≠ second)

/-- Two consecutive source-exact common deletions produced by one matching
outcome.  The first two sources remain on the retained first-apex radius and
in the strict first opposite cap. -/
structure RetainedMatchingTwoStepCommonDeletionWalk
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FrontierCommonDeletionParentResidual F) : Type where
  first : ℝ²
  second : ℝ²
  next : ℝ²
  first_mem_A : first ∈ D.A
  second_mem_A : second ∈ D.A
  next_mem_A : next ∈ D.A
  first_ne_second : first ≠ second
  second_ne_next : second ≠ next
  first_mem_radius : first ∈ SelectedClass D.A S.oppApex1 radius
  second_mem_radius : second ∈ SelectedClass D.A S.oppApex1 radius
  first_mem_capInterior : first ∈ S.capInteriorByIndex S.oppIndex1
  second_mem_capInterior : second ∈ S.capInteriorByIndex S.oppIndex1
  firstPacket : CommonDeletionTwoCenterPacket D H second S.oppApex1
    (H.centerAt first first_mem_A)
  secondPacket : CommonDeletionTwoCenterPacket D H next S.oppApex1
    (H.centerAt second second_mem_A)
  nextLocation : RetainedMatchingNextLocation (S := S) first second next

namespace RetainedMatchingTwoStepCommonDeletionWalk

/-- The first common deletion is exactly the omission edge `first → second`. -/
theorem second_not_mem_first_shell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) :
    W.second ∉
      (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support := by
  exact (cross_deletion_survives_iff_not_mem_selected_support
    H W.first_mem_A).mp W.firstPacket.survives₂

/-- The second common deletion is exactly the omission edge `second → next`. -/
theorem next_not_mem_second_shell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) :
    W.next ∉
      (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support := by
  exact (cross_deletion_survives_iff_not_mem_selected_support
    H W.second_mem_A).mp W.secondPacket.survives₂

/-- Consecutive sources on the first edge have distinct actual blockers. -/
theorem secondBlocker_ne_firstBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) :
    H.centerAt W.second W.second_mem_A ≠
      H.centerAt W.first W.first_mem_A := by
  simpa using W.firstPacket.actual_blocker_ne_center₂

/-- Consecutive sources on the second edge have distinct actual blockers. -/
theorem nextBlocker_ne_secondBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) :
    H.centerAt W.next W.next_mem_A ≠
      H.centerAt W.second W.second_mem_A := by
  simpa using W.secondPacket.actual_blocker_ne_center₂

end RetainedMatchingTwoStepCommonDeletionWalk

private def transportSelectedFourClass
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    SelectedFourClass A center₂ :=
  Eq.mp (congrArg (SelectedFourClass A) hcenter) K

@[simp] private theorem transportSelectedFourClass_support
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    (transportSelectedFourClass K hcenter).support = K.support := by
  cases hcenter
  rfl

/-- Reconstruct the production critical-fiber packet at two prescribed
sources whose retained actual blockers coincide. -/
private def criticalFiberOfBlockerCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (source₁ source₂ : CriticalShellSystem.CarrierVertex D.A)
    (hsources : source₁ ≠ source₂)
    (hblockers : H.blockerVertex source₁ = H.blockerVertex source₂) :
    FrontierCommonDeletionCriticalFiber R := by
  have hrobust := R.firstApexFullyDeletionRobust
  have hcenters :
      H.centerAt source₁.1 source₁.2 =
        H.centerAt source₂.1 source₂.2 :=
    congrArg Subtype.val hblockers
  let K₂ : SelectedFourClass D.A (H.centerAt source₁.1 source₁.2) :=
    transportSelectedFourClass
      (H.selectedAt source₂.1 source₂.2).toSelectedFourClass
      hcenters.symm
  have hK₂Support :
      K₂.support =
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support := by
    simp [K₂, CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass]
  have hsupports :
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support =
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support := by
    calc
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support =
          K₂.support :=
        (H.selectedFourClass_support_eq_shell source₁.1 source₁.2 K₂).symm
      _ = (H.selectedAt source₂.1
          source₂.2).toCriticalFourShell.support := hK₂Support
  have hsource₁Own :
      source₁.1 ∈
        (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support :=
    (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.q_mem_support
  have hsource₂Own :
      source₂.1 ∈
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support :=
    (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.q_mem_support
  have hsource₁Common :
      source₁.1 ∈
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support := by
    rw [← hsupports]
    exact hsource₁Own
  have hsource₂Common :
      source₂.1 ∈
        (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support := by
    rw [hsupports]
    exact hsource₂Own
  have hradii :
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.radius =
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.radius := by
    calc
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.radius =
          dist (H.centerAt source₁.1 source₁.2) source₁.1 :=
        ((H.selectedAt source₁.1
            source₁.2).toCriticalFourShell.support_eq_radius
          source₁.1 hsource₁Own).symm
      _ = dist (H.centerAt source₂.1 source₂.2) source₁.1 := by
        rw [hcenters]
      _ = (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.radius :=
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support_eq_radius
          source₁.1 hsource₁Common
  exact {
    firstApex_robust := hrobust
    source₁ := source₁
    source₂ := source₂
    sources_ne := hsources
    source_points_ne := fun hpoints ↦ hsources (Subtype.ext hpoints)
    blockers_eq := hblockers
    commonBlocker_ne_firstApex :=
      hrobust.centerAt_ne H source₁.1 source₁.2
    commonBlocker_mem_A := (H.blockerVertex source₁).2
    supports_eq := hsupports
    radii_eq := hradii
    source₁_mem_commonSupport := hsource₁Common
    source₂_mem_commonSupport := hsource₂Common
    commonSupport_card_eq_four :=
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support_card
    source₁_deletion_critical := H.no_qfree_at source₁.1 source₁.2
    source₂_deletion_critical := by
      simpa only [hcenters] using H.no_qfree_at source₂.1 source₂.2 }

/-- A blocker collision at the two-step walk endpoints, with the exact
origin-tagged critical fiber and its forced first-apex row hit. -/
structure RetainedMatchingEndpointCriticalFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) : Type where
  next_ne_first : W.next ≠ W.first
  endpoint_blockers_eq :
    H.centerAt W.next W.next_mem_A = H.centerAt W.first W.first_mem_A
  fiber : FrontierCommonDeletionCriticalFiber R
  fiber_source₁_eq_first : fiber.source₁.1 = W.first
  fiber_source₂_eq_next : fiber.source₂.1 = W.next
  rowHit : RowHit fiber

/-- The noncollision endpoint has three pairwise-distinct consecutive actual
blockers. -/
structure RetainedMatchingThreeDistinctBlockerPath
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) : Prop where
  next_ne_first : W.next ≠ W.first
  firstBlocker_ne_secondBlocker :
    H.centerAt W.first W.first_mem_A ≠
      H.centerAt W.second W.second_mem_A
  firstBlocker_ne_nextBlocker :
    H.centerAt W.first W.first_mem_A ≠
      H.centerAt W.next W.next_mem_A
  secondBlocker_ne_nextBlocker :
    H.centerAt W.second W.second_mem_A ≠
      H.centerAt W.next W.next_mem_A

/-- Exact endpoint classification of the two-step walk. -/
inductive RetainedMatchingTwoStepEndpointOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) : Type
  | sourceReturn (next_eq_first : W.next = W.first)
  | endpointCriticalFiber (fiber : RetainedMatchingEndpointCriticalFiber W)
  | threeDistinctBlockers (path : RetainedMatchingThreeDistinctBlockerPath W)

private theorem nonempty_rowHit_of_first_mem_radius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : FrontierCommonDeletionCriticalFiber R)
    (hfirst : P.source₁.1 ∈ SelectedClass D.A S.oppApex1 radius) :
    Nonempty (RowHit P) := by
  rcases nonempty_outcome P with ⟨outcome⟩
  cases outcome with
  | bothOff off => exact False.elim (off.source₁_off hfirst)
  | rowHit hit => exact ⟨hit⟩

/-- The two-step endpoint is either the explicit source return, an
origin-tagged blocker-collision fiber, or a three-distinct-blocker path. -/
theorem nonempty_twoStepEndpointOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) :
    Nonempty (RetainedMatchingTwoStepEndpointOutcome W) := by
  classical
  by_cases hreturn : W.next = W.first
  · exact ⟨RetainedMatchingTwoStepEndpointOutcome.sourceReturn hreturn⟩
  · by_cases hcollision :
      H.centerAt W.next W.next_mem_A = H.centerAt W.first W.first_mem_A
    · let source₁ : CriticalShellSystem.CarrierVertex D.A :=
        ⟨W.first, W.first_mem_A⟩
      let source₂ : CriticalShellSystem.CarrierVertex D.A :=
        ⟨W.next, W.next_mem_A⟩
      have hsources : source₁ ≠ source₂ := by
        intro h
        exact hreturn (congrArg Subtype.val h).symm
      have hblockers : H.blockerVertex source₁ = H.blockerVertex source₂ := by
        apply Subtype.ext
        simpa [CriticalShellSystem.blockerVertex, source₁, source₂] using
          hcollision.symm
      let P : FrontierCommonDeletionCriticalFiber R :=
        criticalFiberOfBlockerCollision source₁ source₂ hsources hblockers
      have hPfirst : P.source₁.1 ∈ SelectedClass D.A S.oppApex1 radius := by
        simpa [P, criticalFiberOfBlockerCollision, source₁] using W.first_mem_radius
      rcases nonempty_rowHit_of_first_mem_radius P hPfirst with ⟨hit⟩
      exact ⟨RetainedMatchingTwoStepEndpointOutcome.endpointCriticalFiber {
        next_ne_first := hreturn
        endpoint_blockers_eq := hcollision
        fiber := P
        fiber_source₁_eq_first := by rfl
        fiber_source₂_eq_next := by rfl
        rowHit := hit }⟩
    · exact ⟨RetainedMatchingTwoStepEndpointOutcome.threeDistinctBlockers {
        next_ne_first := hreturn
        firstBlocker_ne_secondBlocker :=
          (W.secondBlocker_ne_firstBlocker).symm
        firstBlocker_ne_nextBlocker := fun h ↦ hcollision h.symm
        secondBlocker_ne_nextBlocker :=
          (W.nextBlocker_ne_secondBlocker).symm }⟩

private theorem secondCap_point_ne_firstCap_point
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {x y : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.oppIndex1)
    (hy : y ∈ S.capInteriorByIndex S.oppIndex2) : y ≠ x := by
  intro h
  subst y
  have hxNotSecond : x ∉ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_not_mem_capByIndex_of_ne hx
      S.oppIndex1_ne_oppIndex2
  exact hxNotSecond
    (S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hy)

/-- Every large-cap matching outcome yields the same source-tagged two-step
common-deletion walk, including the second-cap renewal. -/
theorem nonempty_twoStepCommonDeletionWalk_of_largeCapOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (L : RetainedMatchingLargeCapConsumerOutcome R) :
    Nonempty (RetainedMatchingTwoStepCommonDeletionWalk R) := by
  cases L with
  | pairedCommonDeletion P O reverse_omission reversePacket oppositeLargeCap =>
      exact ⟨{
        first := O.kept
        second := O.deleted
        next := O.kept
        first_mem_A := O.kept_mem_A
        second_mem_A := O.deleted_mem_A
        next_mem_A := O.kept_mem_A
        first_ne_second := O.sources_ne
        second_ne_next := O.sources_ne.symm
        first_mem_radius := O.kept_mem_radius
        second_mem_radius := O.deleted_mem_radius
        first_mem_capInterior := O.kept_mem_capInterior
        second_mem_capInterior := O.deleted_mem_capInterior
        firstPacket := O.packet
        secondPacket := reversePacket
        nextLocation := RetainedMatchingNextLocation.sourceReturn rfl }⟩
  | firstCapFreshCommonDeletion P O reverse_mem reverseBlocker_mem_capInterior
      reverseShell_inter_cap_eq firstCapLarge fresh fresh_mem_capInterior
      fresh_ne_kept fresh_ne_deleted fresh_not_mem_reverseShell freshPacket =>
      exact ⟨{
        first := O.kept
        second := O.deleted
        next := fresh
        first_mem_A := O.kept_mem_A
        second_mem_A := O.deleted_mem_A
        next_mem_A := freshPacket.q_mem_A
        first_ne_second := O.sources_ne
        second_ne_next := fresh_ne_deleted.symm
        first_mem_radius := O.kept_mem_radius
        second_mem_radius := O.deleted_mem_radius
        first_mem_capInterior := O.kept_mem_capInterior
        second_mem_capInterior := O.deleted_mem_capInterior
        firstPacket := O.packet
        secondPacket := freshPacket
        nextLocation := RetainedMatchingNextLocation.freshFirstCap
          fresh_mem_capInterior fresh_ne_kept fresh_ne_deleted }⟩
  | secondCapLocalizedReverseHit P O reverse_mem reverseBlocker_mem_capInterior
      reverseShell_inter_cap_eq secondCapLarge =>
      rcases exists_fresh_secondCap_commonDeletion_of_reverseHit O
          reverseShell_inter_cap_eq secondCapLarge with
        ⟨fresh, hfreshInterior, _hfreshNotShell, ⟨freshPacket⟩⟩
      have hfreshNeKept : fresh ≠ O.kept :=
        secondCap_point_ne_firstCap_point O.kept_mem_capInterior hfreshInterior
      have hfreshNeDeleted : fresh ≠ O.deleted :=
        secondCap_point_ne_firstCap_point O.deleted_mem_capInterior hfreshInterior
      exact ⟨{
        first := O.kept
        second := O.deleted
        next := fresh
        first_mem_A := O.kept_mem_A
        second_mem_A := O.deleted_mem_A
        next_mem_A := freshPacket.q_mem_A
        first_ne_second := O.sources_ne
        second_ne_next := hfreshNeDeleted.symm
        first_mem_radius := O.kept_mem_radius
        second_mem_radius := O.deleted_mem_radius
        first_mem_capInterior := O.kept_mem_capInterior
        second_mem_capInterior := O.deleted_mem_capInterior
        firstPacket := O.packet
        secondPacket := freshPacket
        nextLocation := RetainedMatchingNextLocation.freshSecondCap
          hfreshInterior hfreshNeKept hfreshNeDeleted }⟩

/-- Consolidated source-tagged normal form. -/
structure RetainedMatchingCommonDeletionCycleNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type where
  walk : RetainedMatchingTwoStepCommonDeletionWalk R
  endpoint : RetainedMatchingTwoStepEndpointOutcome walk

/-- The complete matching reduction reaches either an explicit two-source
return, an origin-tagged critical fiber with a row hit, or a two-edge path
whose three actual blockers are pairwise distinct. -/
theorem nonempty_matchingCommonDeletionCycleNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (G : RetainedMatchingGeometricReduction R) :
    Nonempty (RetainedMatchingCommonDeletionCycleNormalForm R) := by
  rcases nonempty_retainedMatchingLargeCapConsumerOutcome G with ⟨L⟩
  rcases nonempty_twoStepCommonDeletionWalk_of_largeCapOutcome L with ⟨walk⟩
  rcases nonempty_twoStepEndpointOutcome walk with ⟨endpoint⟩
  exact ⟨⟨walk, endpoint⟩⟩

#print axioms RetainedMatchingTwoStepCommonDeletionWalk.second_not_mem_first_shell
#print axioms RetainedMatchingTwoStepCommonDeletionWalk.next_not_mem_second_shell
#print axioms nonempty_twoStepEndpointOutcome
#print axioms nonempty_twoStepCommonDeletionWalk_of_largeCapOutcome
#print axioms nonempty_matchingCommonDeletionCycleNormalForm

end ATailRetainedMatchingCommonDeletionCycleScratch
end Problem97

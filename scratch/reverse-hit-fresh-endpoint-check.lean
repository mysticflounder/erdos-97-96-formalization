import Erdos9796Proof.P97.ATail.RetainedMatchingCommonDeletionCycle

/-! A small endpoint-construction check for the retained common-deletion route. -/

namespace Problem97.ATailFrontierLiveClosureCheck

open scoped EuclideanGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer
open ATailRetainedMatchingCommonDeletionCycle

attribute [local instance] Classical.propDecidable

theorem check
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (fresh : ℝ²)
    (fresh_mem_capInterior :
      fresh ∈ S.capInteriorByIndex S.oppIndex1)
    (fresh_ne_kept : fresh ≠ O.kept)
    (fresh_ne_deleted : fresh ≠ O.deleted)
    (freshPacket :
      CommonDeletionTwoCenterPacket
        D H fresh S.oppApex1
        (H.centerAt O.deleted O.deleted_mem_A)) :
    ∃ W : RetainedMatchingTwoStepCommonDeletionWalk R,
      W.first = O.kept ∧ W.second = O.deleted ∧ W.next = fresh ∧
        (Nonempty (RetainedMatchingEndpointCriticalFiber W) ∨
          Nonempty (RetainedMatchingThreeDistinctBlockerPath W)) := by
  let W : RetainedMatchingTwoStepCommonDeletionWalk R := {
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
      fresh_mem_capInterior fresh_ne_kept fresh_ne_deleted }
  refine ⟨W, rfl, rfl, rfl, ?_⟩
  rcases nonempty_twoStepEndpointOutcome W with ⟨outcome⟩
  cases outcome with
  | sourceReturn next_eq_first =>
      exact False.elim (fresh_ne_kept (by simpa [W] using next_eq_first))
  | endpointCriticalFiber fiber => exact Or.inl ⟨fiber⟩
  | threeDistinctBlockers path => exact Or.inr ⟨path⟩

end Problem97.ATailFrontierLiveClosureCheck

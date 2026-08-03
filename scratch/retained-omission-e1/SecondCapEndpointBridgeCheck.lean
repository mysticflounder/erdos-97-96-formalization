import Erdos9796Proof.P97.ATail.FrontierLiveClosure
import Erdos9796Proof.P97.ATail.RetainedMatchingCommonDeletionCycle

open scoped EuclideanGeometry

namespace Problem97

open ATailFrontierLiveClosure
open ATailCriticalPairFrontier
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer
open ATailRetainedMatchingCommonDeletionCycle

/-! Source-only prototype for a proposed load-bearing reduction. -/

example
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (G : TriApexAllLargeContext D S) :
    ∃ W : RetainedMatchingTwoStepCommonDeletionWalk R,
      W.next ∈ S.capInteriorByIndex S.oppIndex2 ∧ W.next ≠ W.first ∧
        (Nonempty (RetainedMatchingEndpointCriticalFiber W) ∨
          Nonempty (RetainedMatchingThreeDistinctBlockerPath W)) := by
  rcases nonempty_retainedInteriorCommonDeletion P with ⟨commonDeletion⟩
  let reduction : RetainedMatchingGeometricReduction R := {
    omission := P
    commonDeletion := commonDeletion
    oppositeLargeCap := Or.inr (by
      have h := G.cap_card_ge_six S.oppIndex2
      omega) }
  rcases nonempty_retainedMatchingLargeCapConsumerOutcome reduction with ⟨outcome⟩
  cases outcome with
  | secondCapLocalizedReverseHit P O reverse_mem reverseBlocker_mem_capInterior
      reverseShell_inter_cap_eq secondCapLarge =>
      rcases nonempty_twoStepCommonDeletionWalk_of_largeCapOutcome
          (RetainedMatchingLargeCapConsumerOutcome.secondCapLocalizedReverseHit
            P O reverse_mem reverseBlocker_mem_capInterior
            reverseShell_inter_cap_eq secondCapLarge) with ⟨W⟩
      cases hloc : W.nextLocation with
      | freshSecondCap next_mem_capInterior next_ne_first next_ne_second =>
          rcases nonempty_twoStepEndpointOutcome W with ⟨endpoint⟩
          cases endpoint with
          | sourceReturn next_eq_first => exact False.elim (next_ne_first next_eq_first)
          | endpointCriticalFiber fiber =>
              exact ⟨W, next_mem_capInterior, next_ne_first, Or.inl ⟨fiber⟩⟩
          | threeDistinctBlockers path =>
              exact ⟨W, next_mem_capInterior, next_ne_first, Or.inr ⟨path⟩⟩
      | sourceReturn next_eq_first =>
          exact False.elim (W.first_ne_second (next_eq_first.symm.trans W.second_ne_next))
      | freshFirstCap next_mem_capInterior next_ne_first next_ne_second =>
          exact False.elim (by simpa [hloc] using next_mem_capInterior)
  | pairedCommonDeletion P O reverse_omission reversePacket oppositeLargeCap =>
      exact False.elim (by simpa [reduction] using oppositeLargeCap)
  | firstCapFreshCommonDeletion P O reverse_mem reverseBlocker_mem_capInterior
      reverseShell_inter_cap_eq firstCapLarge fresh fresh_mem_capInterior fresh_ne_kept
      fresh_ne_deleted fresh_not_mem_reverseShell freshPacket =>
      exact False.elim (by simpa [reduction] using firstCapLarge)

end ATailFrontierLiveClosure
end Problem97

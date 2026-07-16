/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FixedSingleRadiusOrbitEntryIntegration
import FixedSingleRadiusTerminalCommonDeletion
import FixedSingleRadiusCycleCommonDeletion

/-!
# Common-deletion integration for the coherent fixed-radius orbit

Both outcomes of the source-exact actual-blocker orbit now have the same
downstream interface.  A least positive terminal hit supplies a prescribed
terminal endpoint as common deletion; a minimal cycle supplies its first
successor, which is simultaneously the deletion and the first center.

This file also lifts that common interface through the branch-complete
frontier entry split.  The only non-unique branch not reduced to an existing
`CommonDeletionTwoCenterPacket` is the explicit radius-spent-at-entry branch.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailCriticalPairFrontier
open ATailSubcarrierTerminalInvariantScratch
open ATailRActualBlockerTransitionScratch
open ATailContinuationBankMatchScratch

attribute [local instance] Classical.propDecidable

/-- Either source-exact orbit outcome for a coherent fixed-single-radius
terminal history produces a common deletion at a center distinct from the
second opposite apex. -/
theorem AmbientRobustHistoryPair.exists_commonDeletionTwoCenterPacket_of_orbit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    (T : FixedSingleRadiusTerminalHistory D S D.A radius)
    (P : AmbientRobustHistoryPair D S T.carrier rho)
    (H : CriticalShellSystem D.A)
    (horbit :
      (∃ n : ℕ,
        ((H.blockerVertex^[n])
          (actualBlockerStartVertex P)).1 ∈ T.carrier) ∨
        Nonempty (SourceExactMinimalActualBlockerCycle P H)) :
    ∃ deleted center₁ : ℝ²,
      Nonempty (CommonDeletionTwoCenterPacket
        D H deleted center₁ S.oppApex2) := by
  rcases horbit with hhit | hcycle
  · rcases
        Problem97.ATailRFullParentEntryScratch.AmbientRobustHistoryPair.exists_leastPositiveTerminalHitPredecessor
          P H T.history hhit with
      ⟨K⟩
    rcases K.exists_commonDeletionTwoCenterPacket (T := T) with
      ⟨deleted, hpacket⟩
    exact ⟨deleted,
      H.centerAt K.predecessorPair.x
        (mem_selectedClass.mp K.predecessorPair.x_mem_class).1,
      hpacket⟩
  · rcases hcycle with ⟨K⟩
    rcases
        Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.exists_commonDeletionTwoCenterPacket
          K with
      ⟨deleted, hpacket⟩
    exact ⟨deleted, deleted, hpacket⟩

/-- Branch-complete first-apex entry reduction.  The coherent fixed-radius
branch is discharged into the existing common-deletion consumer family; the
only remaining non-unique entry branch is `FrontierRadiusSpentAtEntry`. -/
theorem CriticalPairFrontier.firstApexUnique_or_commonDeletion_or_spent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hradius : 0 < radius)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card) :
    (((SelectedClass D.A S.oppApex1 radius).card = 4 ∨
        (SelectedClass D.A S.oppApex1 radius).card = 5) ∧
      ∀ rho : ℝ, 0 < rho →
        4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius) ∨
      (∃ T : FixedSingleFrontierRadiusTerminal F,
        ∃ P : AmbientRobustHistoryPair D S T.terminal.carrier radius,
          P.x = F.pair.q ∧
            ∃ deleted center₁ : ℝ²,
              Nonempty (CommonDeletionTwoCenterPacket
                D H deleted center₁ S.oppApex2)) ∨
      Nonempty (FrontierRadiusSpentAtEntry F) := by
  rcases
      Problem97.ATailRFullParentEntryScratch.CriticalPairFrontier.firstApexUnique_or_fixedSingleRadiusOrbit_or_spent
        F hradius hfour with
    hunique | hcoherent | hspent
  · exact Or.inl hunique
  · right
    left
    rcases hcoherent with ⟨T, P, hsource, horbit⟩
    exact ⟨T, P, hsource,
      Problem97.ATailRFullParentEntryScratch.AmbientRobustHistoryPair.exists_commonDeletionTwoCenterPacket_of_orbit
        (T := T.terminal) (P := P) (H := H) horbit⟩
  · exact Or.inr (Or.inr hspent)

#print axioms AmbientRobustHistoryPair.exists_commonDeletionTwoCenterPacket_of_orbit
#print axioms CriticalPairFrontier.firstApexUnique_or_commonDeletion_or_spent

end ATailRFullParentEntryScratch
end Problem97

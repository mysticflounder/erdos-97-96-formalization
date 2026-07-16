/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FixedSingleRadiusCycleConsequence

/-!
# Single-radius orbit integration at the frontier entry

This file closes the bookkeeping gap between the branch-complete
single-radius descent and the source-exact actual-blocker orbit.  In the
coherent arm it reconstructs the original frontier source at the original
radius and invokes the existing terminal-hit/minimal-cycle theorem.  The
card-four/card-five entry-spent arm remains explicit.

Unlike the older unique-terminal integration, this theorem uses
`FixedSingleFrontierRadiusTerminal`; it therefore really preserves one radius
for every erased source in the orbit.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailCriticalPairFrontier
open ATailSubcarrierTerminalInvariantScratch
open ATailRActualBlockerTransitionScratch

attribute [local instance] Classical.propDecidable

/-- The complete source-faithful entry split for the coherent single-radius
descent.  No terminal-hit or cycle consumer is asserted here. -/
theorem CriticalPairFrontier.firstApexUnique_or_fixedSingleRadiusOrbit_or_spent
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
            ((∃ n : ℕ,
                ((H.blockerVertex^[n])
                  (actualBlockerStartVertex P)).1 ∈ T.terminal.carrier) ∨
              Nonempty (SourceExactMinimalActualBlockerCycle P H))) ∨
      Nonempty (FrontierRadiusSpentAtEntry F) := by
  rcases F.firstApexSplit with hfirstDouble | hunique
  · rcases
      Problem97.ATailRFullParentEntryScratch.CriticalPairFrontier.fixedSingleRadiusTerminal_or_spentAtEntry
        F hradius hfour hfirstDouble with hfixed | hspent
    · right
      left
      rcases hfixed with ⟨T⟩
      have hqNotCarrier : F.pair.q ∉ T.terminal.carrier := by
        intro hqCarrier
        have hqPost := T.carrier_subset_postEntry hqCarrier
        exact (Finset.mem_erase.mp
          (Finset.mem_erase.mp hqPost).2).1 rfl
      have hqErased : F.pair.q ∈ D.A \ T.terminal.carrier :=
        Finset.mem_sdiff.mpr ⟨F.pair.q_mem_A, hqNotCarrier⟩
      rcases exists_ambientRobustHistoryPair_with_source_of_erased
          D S T.terminal.history hqErased with
        ⟨rho, P, hsource⟩
      have hrho : rho = radius :=
        Problem97.ATailRFullParentEntryScratch.FixedSingleRadiusTerminalHistory.pair_radius_eq_fixed
          T.terminal P
      subst rho
      refine ⟨T, P, hsource, ?_⟩
      exact
        Problem97.ATailRActualBlockerTransitionScratch.AmbientRobustHistoryPair.actualBlockerOrbit_terminalHit_or_sourceExactMinimalCycle
          P H T.terminal.history
    · exact Or.inr (Or.inr hspent)
  · exact Or.inl hunique

#print axioms CriticalPairFrontier.firstApexUnique_or_fixedSingleRadiusOrbit_or_spent

end ATailRFullParentEntryScratch
end Problem97

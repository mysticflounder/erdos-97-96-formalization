/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CoherentRPeriodTwoSourceOutside
import FixedSingleRadiusCycleReanchoring
import OppCap2CycleBoundarySourceOutside

/-!
# Uniform anchored transition for a coherent fixed-radius blocker cycle

Period two is anchored directly because each source is the other source's
actual blocker.  Every longer cycle has a source-outside successor shell by
the combined rank-descent and ordered-cap boundary theorem; arbitrary-index
reanchoring then turns that winning edge into the same provenance-bearing
anchored transition.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailRActualBlockerTransitionScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- Every coherent fixed-radius minimal actual-blocker cycle produces a
provenance-bearing anchored source-critical transition. -/
theorem SourceExactMinimalActualBlockerCycle.exists_anchoredSourceCriticalTransition
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (O : OppCap1OrderedData D S) :
    ∃ R : CoherentRCommonDeletionPacket T P H,
      Nonempty
        (CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition R) := by
  by_cases hperiod : K.period = 2
  · let i0 : Fin K.period :=
      ⟨0, lt_of_lt_of_le Nat.zero_lt_two K.two_le_period⟩
    rcases
        Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.exists_coherentRCommonDeletionPacket_at
          K i0 with
      ⟨R, hsource, hdeleted⟩
    have hsuccessor :
        orderedSuccessorIndex K i0 =
          (⟨1, K.two_le_period⟩ : Fin K.period) := by
      apply Fin.ext
      simp [orderedSuccessorIndex, i0, hperiod]
    have hdeletedOne :
        R.deleted = (K.source ⟨1, K.two_le_period⟩).1 := by
      rw [← hsuccessor]
      exact hdeleted
    refine ⟨R, ?_⟩
    exact
      Problem97.ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.nonempty_anchoredSourceCriticalTransition_of_period_two_cycle
        R K hsource hdeletedOne hperiod
  · have hthree : 3 ≤ K.period := by
      have htwo : 2 ≤ K.period := K.two_le_period
      omega
    rcases exists_sourceOutsideSuccessorShell_of_three_le_period
        K O hthree with ⟨i, houtside⟩
    rcases
        Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.exists_anchoredSourceCriticalTransition_of_sourceOutsideSuccessorShell
          K i houtside with
      ⟨R, _hsource, _hdeleted, _houtside, htransition⟩
    exact ⟨R, htransition⟩

#print axioms
  SourceExactMinimalActualBlockerCycle.exists_anchoredSourceCriticalTransition

end ATailRFullParentEntryScratch
end Problem97

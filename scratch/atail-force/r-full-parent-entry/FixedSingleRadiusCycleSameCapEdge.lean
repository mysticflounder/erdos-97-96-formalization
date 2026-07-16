/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FixedSingleRadiusCycleCapLocalization

/-!
# A strict same-cap edge in every long fixed-radius blocker cycle

The fixed first-apex circle meets `oppCap2` in at most one canonical cycle
source.  Therefore a blocker cycle of period at least four has two
consecutive sources in strict `oppCap1`.  The conclusion keeps the actual
blocker-map equality, rather than merely returning two unrelated cap points.

This reduces the coherent cycle residual to periods two/three or a genuine
strict same-cap actual-blocker edge.  It still does not produce the spent
endpoint or endpoint-radius equality required by the existing rank consumer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailSubcarrierTerminalInvariantScratch
open ATailRActualBlockerTransitionScratch

attribute [local instance] Classical.propDecidable

/-- Every coherent fixed-radius blocker cycle of period at least four has an
actual blocker edge whose source and target both lie in strict `oppCap1`. -/
theorem SourceExactMinimalActualBlockerCycle.exists_strictOppCap1_blockerEdge_of_four_le_period
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (hfour : 4 ≤ K.period) :
    ∃ i : Fin K.period,
      (K.source i).1 ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∧
      (H.blockerVertex (K.source i)).1 ∈
        S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
  let i0 : Fin K.period := ⟨0, by omega⟩
  let i1 : Fin K.period := ⟨1, by omega⟩
  let i2 : Fin K.period := ⟨2, by omega⟩
  let i3 : Fin K.period := ⟨3, by omega⟩
  have hedge01 : H.blockerVertex (K.source i0) = K.source i1 := by
    simp [i0, i1, SourceExactMinimalActualBlockerCycle.source]
  have hedge12 : H.blockerVertex (K.source i1) = K.source i2 := by
    simp [i1, i2, SourceExactMinimalActualBlockerCycle.source,
      Function.iterate_succ_apply']
  have hedge23 : H.blockerVertex (K.source i2) = K.source i3 := by
    simp [i2, i3, SourceExactMinimalActualBlockerCycle.source,
      Function.iterate_succ_apply']
  have hi01 : i0 ≠ i1 := by
    intro h
    have := congrArg Fin.val h
    simp [i0, i1] at this
  have hi12 : i1 ≠ i2 := by
    intro h
    have := congrArg Fin.val h
    simp [i1, i2] at this
  have hi13 : i1 ≠ i3 := by
    intro h
    have := congrArg Fin.val h
    simp [i1, i3] at this
  rcases
      Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_strictOppCap1_or_oppCap2
        K i0 with h0Strict | h0Opp2
  · rcases
        Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_strictOppCap1_or_oppCap2
          K i1 with h1Strict | h1Opp2
    · exact ⟨i0, h0Strict, by simpa [hedge01] using h1Strict⟩
    · have h2Strict :
          (K.source i2).1 ∈
            S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
        rcases
            Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_strictOppCap1_or_oppCap2
              K i2 with h | h2Opp2
        · exact h
        · exact False.elim
            (hi12
              (Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.eq_of_sources_mem_oppCap2
                K h1Opp2 h2Opp2))
      have h3Strict :
          (K.source i3).1 ∈
            S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
        rcases
            Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_strictOppCap1_or_oppCap2
              K i3 with h | h3Opp2
        · exact h
        · exact False.elim
            (hi13
              (Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.eq_of_sources_mem_oppCap2
                K h1Opp2 h3Opp2))
      exact ⟨i2, h2Strict, by simpa [hedge23] using h3Strict⟩
  · have h1Strict :
        (K.source i1).1 ∈
          S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
      rcases
          Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_strictOppCap1_or_oppCap2
            K i1 with h | h1Opp2
      · exact h
      · exact False.elim
          (hi01
            (Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.eq_of_sources_mem_oppCap2
              K h0Opp2 h1Opp2))
    have h2Strict :
        (K.source i2).1 ∈
          S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
      rcases
          Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_strictOppCap1_or_oppCap2
            K i2 with h | h2Opp2
      · exact h
      · have hi02 : i0 ≠ i2 := by
          intro h
          have := congrArg Fin.val h
          simp [i0, i2] at this
        exact False.elim
          (hi02
            (Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.eq_of_sources_mem_oppCap2
              K h0Opp2 h2Opp2))
    exact ⟨i1, h1Strict, by simpa [hedge12] using h2Strict⟩

/-- The same conclusion for a three-cycle.  Here the only additional point is
the wrap edge `2 -> 0`, supplied by the cycle's exact periodicity. -/
theorem SourceExactMinimalActualBlockerCycle.exists_strictOppCap1_blockerEdge_of_period_eq_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (hthree : K.period = 3) :
    ∃ i : Fin K.period,
      (K.source i).1 ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∧
      (H.blockerVertex (K.source i)).1 ∈
        S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
  let i0 : Fin K.period := ⟨0, by omega⟩
  let i1 : Fin K.period := ⟨1, by omega⟩
  let i2 : Fin K.period := ⟨2, by omega⟩
  have hedge01 : H.blockerVertex (K.source i0) = K.source i1 := by
    simp [i0, i1, SourceExactMinimalActualBlockerCycle.source]
  have hedge12 : H.blockerVertex (K.source i1) = K.source i2 := by
    simp [i1, i2, SourceExactMinimalActualBlockerCycle.source,
      Function.iterate_succ_apply']
  have hedge20 : H.blockerVertex (K.source i2) = K.source i0 := by
    have hperiodic := K.isPeriodicPt
    rw [hthree] at hperiodic
    simpa [i0, i2, SourceExactMinimalActualBlockerCycle.source,
      Function.iterate_succ_apply'] using hperiodic
  have hi01 : i0 ≠ i1 := by
    intro h
    have := congrArg Fin.val h
    simp [i0, i1] at this
  have hi12 : i1 ≠ i2 := by
    intro h
    have := congrArg Fin.val h
    simp [i1, i2] at this
  rcases
      Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_strictOppCap1_or_oppCap2
        K i0 with h0Strict | h0Opp2
  · rcases
        Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_strictOppCap1_or_oppCap2
          K i1 with h1Strict | h1Opp2
    · exact ⟨i0, h0Strict, by simpa [hedge01] using h1Strict⟩
    · have h2Strict :
          (K.source i2).1 ∈
            S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
        rcases
            Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_strictOppCap1_or_oppCap2
              K i2 with h | h2Opp2
        · exact h
        · exact False.elim
            (hi12
              (Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.eq_of_sources_mem_oppCap2
                K h1Opp2 h2Opp2))
      exact ⟨i2, h2Strict, by simpa [hedge20] using h0Strict⟩
  · have h1Strict :
        (K.source i1).1 ∈
          S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
      rcases
          Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_strictOppCap1_or_oppCap2
            K i1 with h | h1Opp2
      · exact h
      · exact False.elim
          (hi01
            (Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.eq_of_sources_mem_oppCap2
              K h0Opp2 h1Opp2))
    have h2Strict :
        (K.source i2).1 ∈
          S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
      rcases
          Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_strictOppCap1_or_oppCap2
            K i2 with h | h2Opp2
      · exact h
      · have hi02 : i0 ≠ i2 := by
          intro h
          have := congrArg Fin.val h
          simp [i0, i2] at this
        exact False.elim
          (hi02
            (Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.eq_of_sources_mem_oppCap2
              K h0Opp2 h2Opp2))
    exact ⟨i1, h1Strict, by simpa [hedge12] using h2Strict⟩

/-- Thus period two is the only coherent fixed-radius cycle that can avoid a
strict same-cap actual-blocker edge. -/
theorem SourceExactMinimalActualBlockerCycle.exists_strictOppCap1_blockerEdge_of_three_le_period
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (hthree : 3 ≤ K.period) :
    ∃ i : Fin K.period,
      (K.source i).1 ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∧
      (H.blockerVertex (K.source i)).1 ∈
        S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
  by_cases hfour : 4 ≤ K.period
  · exact
      Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.exists_strictOppCap1_blockerEdge_of_four_le_period
        K hfour
  · have hperiod : K.period = 3 := by omega
    exact
      Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.exists_strictOppCap1_blockerEdge_of_period_eq_three
        K hperiod

#print axioms SourceExactMinimalActualBlockerCycle.exists_strictOppCap1_blockerEdge_of_four_le_period
#print axioms SourceExactMinimalActualBlockerCycle.exists_strictOppCap1_blockerEdge_of_period_eq_three
#print axioms SourceExactMinimalActualBlockerCycle.exists_strictOppCap1_blockerEdge_of_three_le_period

end ATailRFullParentEntryScratch
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FixedSingleRadiusCycleConsequence
import StrictOppCapCrossClassifier

/-!
# Cap localization of a fixed-single-radius blocker cycle

On the coherent single-radius arm, every source of the source-exact blocker
cycle is an erased off-surplus point on one fixed circle about `oppApex1`.
The existing opposite-cap one-hit theorem therefore leaves at most one cycle
source in `oppCap2`; every other source lies in the strict interior part of
`oppCap1`.

This is a source-faithful narrowing theorem, not a cycle contradiction.  It
does not manufacture a spent endpoint, orient a blocker edge in the ordered
cap, or cover the separate `FrontierRadiusSpentAtEntry` arm.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailSubcarrierTerminalInvariantScratch
open ATailRActualBlockerTransitionScratch
open ATailStrictOppCapCrossClassifierScratch

attribute [local instance] Classical.propDecidable

/-- Every canonical source in the coherent fixed-radius cycle is outside the
surplus cap. -/
theorem SourceExactMinimalActualBlockerCycle.source_off_surplus_of_fixedRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) :
    (K.source i).1 ∉ S.surplusCap := by
  rcases
      Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.exists_fixedRadius_pair_at_source
        K i with
    ⟨P', hsource, _hmateFixed⟩
  simpa [hsource] using P'.x_off_surplus

/-- Hence each canonical source is either strict `oppCap1` or belongs to the
single possible `oppCap2` hit of the fixed first-apex circle. -/
theorem SourceExactMinimalActualBlockerCycle.source_mem_strictOppCap1_or_oppCap2
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) :
    (K.source i).1 ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∨
      (K.source i).1 ∈ S.oppCap2 := by
  by_cases hiOpp2 : (K.source i).1 ∈ S.oppCap2
  · exact Or.inr hiOpp2
  · left
    exact mem_strictOppCap1_of_mem_A_of_not_mem_adjacentCaps S
      (K.source i).2
      (Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_off_surplus_of_fixedRadius
        K i)
      hiOpp2

/-- The fixed-radius opposite-cap one-hit bound makes the set of canonical
cycle indices whose source lies in `oppCap2` subsingleton. -/
theorem SourceExactMinimalActualBlockerCycle.eq_of_sources_mem_oppCap2
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    {i j : Fin K.period}
    (hi : (K.source i).1 ∈ S.oppCap2)
    (hj : (K.source j).1 ∈ S.oppCap2) :
    i = j := by
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hone := U2NonSurplusSqueeze.oppApex1_otherCap_one_hit DS radius
  rw [Finset.card_le_one] at hone
  have hiClass :=
    Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_fixedClass
      K i
  have hjClass :=
    Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_fixedClass
      K j
  have hiInter :
      (K.source i).1 ∈
        (D.A.filter fun z => dist z S.oppApex1 = radius) ∩ S.oppCap2 := by
    exact Finset.mem_inter.mpr
      ⟨Finset.mem_filter.mpr
        ⟨(K.source i).2, by
          simpa [dist_comm] using (mem_selectedClass.mp hiClass).2⟩,
        hi⟩
  have hjInter :
      (K.source j).1 ∈
        (D.A.filter fun z => dist z S.oppApex1 = radius) ∩ S.oppCap2 := by
    exact Finset.mem_inter.mpr
      ⟨Finset.mem_filter.mpr
        ⟨(K.source j).2, by
          simpa [dist_comm] using (mem_selectedClass.mp hjClass).2⟩,
        hj⟩
  have hsources : (K.source i).1 = (K.source j).1 := by
    exact hone (K.source i).1 (by simpa [DS] using hiInter)
      (K.source j).1 (by simpa [DS] using hjInter)
  exact K.source_injective (Subtype.ext hsources)

/-- For any two distinct canonical indices, at least one source is already in
strict `oppCap1`.  Thus a cycle-wide closing theorem only has one possible
cross-cap exceptional source to handle. -/
theorem SourceExactMinimalActualBlockerCycle.one_of_distinct_sources_mem_strictOppCap1
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    {i j : Fin K.period} (hij : i ≠ j) :
    (K.source i).1 ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∨
      (K.source j).1 ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
  rcases
      Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_strictOppCap1_or_oppCap2
        K i with hiStrict | hiOpp2
  · exact Or.inl hiStrict
  · rcases
        Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_strictOppCap1_or_oppCap2
          K j with hjStrict | hjOpp2
    · exact Or.inr hjStrict
    · exact False.elim
        (hij
          (Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.eq_of_sources_mem_oppCap2
            K hiOpp2 hjOpp2))

#print axioms SourceExactMinimalActualBlockerCycle.source_off_surplus_of_fixedRadius
#print axioms SourceExactMinimalActualBlockerCycle.source_mem_strictOppCap1_or_oppCap2
#print axioms SourceExactMinimalActualBlockerCycle.eq_of_sources_mem_oppCap2
#print axioms SourceExactMinimalActualBlockerCycle.one_of_distinct_sources_mem_strictOppCap1

end ATailRFullParentEntryScratch
end Problem97

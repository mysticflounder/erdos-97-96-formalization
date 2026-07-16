/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AnchoredOffSurplusFrontierSuccessor

/-!
# Elimination of the anchored two-row cover residual

The rigid `2 + 2 + deleted` fallback in `AnchoredFreshSuccessor` cannot occur.
Its retained second-apex row contains two points in one off-surplus
first-apex marginal.  After lifting that row from the double-erased carrier
back to the ambient carrier, the existing two-apex joint-fiber theorem bounds
the same intersection by one.

Consequently every anchored transition has an off-surplus row-external
common-deletion successor on the two retained row supports.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRAnchoredTwoRowCoverConsumerScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- The retained second-apex row contains at most one point in the ambient
off-surplus first-apex marginal. -/
theorem secondApexRow_inter_fixedMarginal_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (_A : AnchoredSourceCriticalTransition R) :
    (((SelectedClass D.A S.oppApex1 radius) \ S.surplusCap) ∩
      R.secondApexRow.support).card ≤ 1 := by
  classical
  let M :=
    (D.A.filter fun x => dist x S.oppApex1 = radius) \
      S.surplusCap
  let C :=
    SelectedClass D.A S.oppApex2 R.secondApexRow.radius
  have hsub :
      ((SelectedClass D.A S.oppApex1 radius) \ S.surplusCap) ∩
          R.secondApexRow.support ⊆
        M.filter fun x => x ∈ C := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxMarginal, hxRow⟩
    rcases Finset.mem_sdiff.mp hxMarginal with ⟨hxClass, hxOff⟩
    rcases mem_selectedClass.mp hxClass with ⟨hxA, hxFirst⟩
    refine Finset.mem_filter.mpr ⟨Finset.mem_sdiff.mpr ⟨?_, hxOff⟩, ?_⟩
    · exact Finset.mem_filter.mpr ⟨hxA, by simpa [dist_comm] using hxFirst⟩
    · have hxDouble := R.secondApexRow.support_subset_A hxRow
      have hxAmbient :
          x ∈ D.A :=
        (Finset.mem_erase.mp (Finset.mem_erase.mp hxDouble).2).2
      exact mem_selectedClass.mpr
        ⟨hxAmbient, R.secondApexRow.support_eq_radius x hxRow⟩
  have hupper :
      (M.filter fun x => x ∈ C).card ≤ 1 := by
    simpa [M, C] using
      firstApex_marginal_inter_secondClass_card_le_one
        D S radius R.secondApexRow.radius
  exact (Finset.card_le_card hsub).trans hupper

/-- The rigid `2 + 2 + deleted` cover is incompatible with the two-apex
joint-fiber bound. -/
theorem false_of_fixedMarginalTwoRowCoverResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R)
    (C : FixedMarginalTwoRowCoverResidual A) :
    False := by
  have hone := secondApexRow_inter_fixedMarginal_card_le_one A
  have htwo := C.secondApexRow_hits_two
  omega

/-- Every anchored transition therefore has a row-external successor which
is itself off the surplus cap. -/
theorem exists_offSurplus_sharedRowSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R) :
    ∃ X : RowExternalCommonDeletionSource A,
      X.point ∉ S.surplusCap := by
  rcases A.exists_offSurplus_sharedRowSource_or_twoRowCover with hsource | hcover
  · exact hsource
  · exact False.elim (false_of_fixedMarginalTwoRowCoverResidual A hcover)

/-- Packet-facing form: the off-surplus successor preserves exactly the two
row supports of the original coherent common deletion. -/
theorem exists_offSurplus_sharedRow_commonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R) :
    ∃ X : RowExternalCommonDeletionSource A,
      X.point ∉ S.surplusCap ∧
        X.toSharedRowCommonDeletionPacket.B₁ =
          R.toCommonDeletionTwoCenterPacket.B₁ ∧
        X.toSharedRowCommonDeletionPacket.B₂ =
          R.toCommonDeletionTwoCenterPacket.B₂ := by
  rcases exists_offSurplus_sharedRowSource A with ⟨X, hXOff⟩
  exact ⟨X, hXOff, rfl, rfl⟩

/-- Combining the eliminated cover branch with the existing off-surplus
continuation sends every anchored transition back to the exact
critical-pair frontier.  This is a continuation result, not by itself a
contradiction. -/
theorem nonempty_criticalPairFrontier
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R) :
    Nonempty (CriticalPairFrontier D S radius H) := by
  rcases exists_offSurplus_sharedRowSource A with ⟨X, hXOff⟩
  exact ⟨X.deletedExternalCriticalPairFrontier hXOff⟩

#print axioms secondApexRow_inter_fixedMarginal_card_le_one
#print axioms false_of_fixedMarginalTwoRowCoverResidual
#print axioms exists_offSurplus_sharedRowSource
#print axioms exists_offSurplus_sharedRow_commonDeletion
#print axioms nonempty_criticalPairFrontier

end ATailRAnchoredTwoRowCoverConsumerScratch
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import card_five_cap_or_mutual_consumer
import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# Exact card-five distinct-blocker producer boundary

This isolated scratch module identifies the first missing live hypothesis in
the exact card-five, distinct-blocker branch of `CriticalPairFrontier`.

All carrier membership, selected-class membership, off-surplus placement, and
pair distinctness fields required by `CardFiveCapOrMutualFields` are already
present in the frontier pair.  After the branch split supplies distinct
blockers, the only remaining input is one cap-local directed cross incidence.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueRowProducerScratch

open ATAILCardFiveCapOrMutualScratch
open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier

/-- The exact extra field still absent from the live frontier on the
card-five, distinct-blocker branch: one directed cross hit, with the blocker
of the source row lying in the surplus cap. -/
def CardFiveDistinctCapLocalCrossHypothesis
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) : Prop :=
  (P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support ∧
      H.centerAt P.q P.q_mem_A ∈ S.surplusCap) ∨
    (P.q ∈ (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support ∧
      H.centerAt P.w P.w_mem_A ∈ S.surplusCap)

private theorem pair_q_mem_selectedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    P.q ∈ SelectedClass D.A S.oppApex1 r := by
  rcases Finset.mem_sdiff.mp P.q_mem_marginal with ⟨hqFilter, _hqOff⟩
  rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
  exact mem_selectedClass.mpr ⟨hqA, by simpa [dist_comm] using hqRadius⟩

private theorem pair_w_mem_selectedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    P.w ∈ SelectedClass D.A S.oppApex1 r := by
  rcases Finset.mem_sdiff.mp P.w_mem_marginal with ⟨hwFilter, _hwOff⟩
  rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwRadius⟩
  exact mem_selectedClass.mpr ⟨hwA, by simpa [dist_comm] using hwRadius⟩

/-- On the exact card-five, distinct-blocker arm, a single cap-local directed
cross incidence produces the complete packet accepted by the existing
card-five consumer.  No second cross incidence or orientation hypothesis is
needed. -/
theorem cardFiveCapOrMutualFields_of_frontier_distinct_capLocalCross
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (_hcard : (SelectedClass D.A S.oppApex1 r).card = 5)
    (hcenters :
      H.centerAt F.pair.q F.pair.q_mem_A ≠
        H.centerAt F.pair.w F.pair.w_mem_A)
    (hcross : CardFiveDistinctCapLocalCrossHypothesis F.pair) :
    Nonempty (CardFiveCapOrMutualFields S H r) := by
  let P := F.pair
  refine ⟨{
    z := P.q
    w := P.w
    z_mem_A := P.q_mem_A
    w_mem_A := P.w_mem_A
    z_mem_class := pair_q_mem_selectedClass P
    w_mem_class := pair_w_mem_selectedClass P
    ne := P.q_ne_w
    z_off_surplus := (Finset.mem_sdiff.mp P.q_mem_marginal).2
    w_off_surplus := (Finset.mem_sdiff.mp P.w_mem_marginal).2
    centers_ne := hcenters
    outcome := ?_
  }⟩
  rcases hcross with hq | hw
  · exact Or.inl hq
  · exact Or.inr (Or.inl hw)

/-- The same boundary stated as a terminal branch theorem: the existing
consumer immediately closes once the single missing cap-local cross field is
supplied. -/
theorem false_of_frontier_cardFive_distinct_capLocalCross
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5)
    (hcenters :
      H.centerAt F.pair.q F.pair.q_mem_A ≠
        H.centerAt F.pair.w F.pair.w_mem_A)
    (hcross : CardFiveDistinctCapLocalCrossHypothesis F.pair) :
    False :=
  false_of_cardFive_exists_capLocal_or_mutualIncidence S H hr hcard
    (cardFiveCapOrMutualFields_of_frontier_distinct_capLocalCross
      F hcard hcenters hcross)

#print axioms cardFiveCapOrMutualFields_of_frontier_distinct_capLocalCross
#print axioms false_of_frontier_cardFive_distinct_capLocalCross

end ATailUniqueRowProducerScratch
end Problem97

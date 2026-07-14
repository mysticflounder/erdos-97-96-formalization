/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.RemovableVertexAxiom.PinnedSurplusGeneralM

/-!
# Exact-card-five strict-interior survivor pair

This isolated scratch module retains strict-cap-interior membership when the
exact five-point first-apex class is thinned to two sources surviving deletion
at the second opposite apex.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueRowProducerScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

/-- The adjacent-cap one-hit argument strengthens from two to three strict
interior members when the selected class has exactly five points. -/
theorem selectedClass_capInteriorByIndex_card_ge_three_of_card_five
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      (SelectedClass A (S.oppositeVertexByIndex i) radius).card = 5) :
    3 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
      S.capInteriorByIndex i).card := by
  classical
  let T : Finset ℝ² :=
    SelectedClass A (S.oppositeVertexByIndex i) radius
  have hleftOne :
      (T ∩ S.leftAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i radius
  have hrightOne :
      (T ∩ S.rightAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i radius
  have hcover :
      T \ S.capInteriorByIndex i ⊆
        (T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i) := by
    simpa [T] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps i hradius
  have houtside :
      (T \ S.capInteriorByIndex i).card ≤ 2 := by
    calc
      (T \ S.capInteriorByIndex i).card
          ≤ ((T ∩ S.leftAdjacentCapByIndex i) ∪
              (T ∩ S.rightAdjacentCapByIndex i)).card :=
        Finset.card_le_card hcover
      _ ≤ (T ∩ S.leftAdjacentCapByIndex i).card +
            (T ∩ S.rightAdjacentCapByIndex i).card :=
        Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hsplit :
      (T \ S.capInteriorByIndex i).card +
          (T ∩ S.capInteriorByIndex i).card = T.card := by
    simp [T, Finset.card_sdiff_add_card_inter]
  have hcardT : T.card = 5 := by
    simpa [T] using hcard
  change 3 ≤ (T ∩ S.capInteriorByIndex i).card
  omega

private theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

/-- The exact first-apex card-five class has at least three members in the
strict interior of the first non-surplus cap. -/
theorem firstApex_cardFive_interior_card_ge_three
    (D : CounterexampleData) (S : SurplusCapPacket D.A) {r : ℝ}
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    3 ≤ (SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1).card := by
  rw [oppApex1_eq_oppositeVertexByIndex_oppIndex1 S] at hcard ⊢
  exact selectedClass_capInteriorByIndex_card_ge_three_of_card_five
    S D.convex S.oppIndex1 hr hcard

/-- A pair retained from the exact card-five class together with the stronger
fact that both sources lie in the strict interior of the first non-surplus
cap and survive deletion at the second opposite apex. -/
structure CardFiveInteriorSurvivorPair
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ) where
  q : ℝ²
  w : ℝ²
  q_mem : q ∈ SelectedClass D.A S.oppApex1 r ∩
    S.capInteriorByIndex S.oppIndex1
  w_mem : w ∈ SelectedClass D.A S.oppApex1 r ∩
    S.capInteriorByIndex S.oppIndex1
  q_ne_w : q ≠ w
  q_survives : HasNEquidistantPointsAt 4 (D.A.erase q) S.oppApex2
  w_survives : HasNEquidistantPointsAt 4 (D.A.erase w) S.oppApex2

private theorem interior_oppIndex1_not_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.oppIndex1) :
    x ∉ S.surplusCap := by
  have hnot := S.capInteriorByIndex_not_mem_capByIndex_of_ne hx
    S.surplusIdx_ne_oppIndex1.symm
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simpa [SurplusCapPacket.capByIndex,
      SurplusCapPacket.surplusCap, hi] using hnot

/-- Exact card five produces two strict-interior sources whose deletion still
leaves a K4 row at the second opposite apex. -/
theorem exists_cardFiveInteriorSurvivorPair
    (D : CounterexampleData) (S : SurplusCapPacket D.A) {r : ℝ}
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    Nonempty (CardFiveInteriorSurvivorPair D S r) := by
  classical
  let I : Finset ℝ² :=
    SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1
  let survives : ℝ² → Prop := fun q =>
    HasNEquidistantPointsAt 4 (D.A.erase q) S.oppApex2
  have hthreeI : 3 ≤ I.card := by
    simpa [I] using firstApex_cardFive_interior_card_ge_three D S hr hcard
  have hblockedSub :
      (I.filter fun q => ¬ survives q) ⊆
        (((D.A.filter fun x => dist x S.oppApex1 = r) \
          S.surplusCap).filter fun q => ¬ survives q) := by
    intro q hq
    rcases Finset.mem_filter.mp hq with ⟨hqI, hqBlocked⟩
    rcases Finset.mem_inter.mp hqI with ⟨hqClass, hqInterior⟩
    rcases mem_selectedClass.mp hqClass with ⟨hqA, hqDist⟩
    refine Finset.mem_filter.mpr ⟨Finset.mem_sdiff.mpr ⟨?_, ?_⟩,
      hqBlocked⟩
    · exact Finset.mem_filter.mpr ⟨hqA, by simpa [dist_comm] using hqDist⟩
    · exact interior_oppIndex1_not_mem_surplusCap S hqInterior
  have hblocked : (I.filter fun q => ¬ survives q).card ≤ 1 := by
    calc
      (I.filter fun q => ¬ survives q).card
          ≤ (((D.A.filter fun x => dist x S.oppApex1 = r) \
              S.surplusCap).filter fun q => ¬ survives q).card :=
        Finset.card_le_card hblockedSub
      _ ≤ 1 := by
        simpa [survives] using
          blocked_sources_in_firstApex_marginal_card_le_one D S r
  have hsplit := Finset.card_filter_add_card_filter_not
    (s := I) survives
  have htwo : 2 ≤ (I.filter survives).card := by omega
  have hone : 1 < (I.filter survives).card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨q, hq, w, hw, hqw⟩
  rcases Finset.mem_filter.mp hq with ⟨hqI, hqSurvives⟩
  rcases Finset.mem_filter.mp hw with ⟨hwI, hwSurvives⟩
  exact ⟨{
    q := q
    w := w
    q_mem := by simpa [I] using hqI
    w_mem := by simpa [I] using hwI
    q_ne_w := hqw
    q_survives := by simpa [survives] using hqSurvives
    w_survives := by simpa [survives] using hwSurvives }⟩

/-- Forgetting the retained strict-interior facts gives the production
survivor relocation packet, including the actual-blocker exclusions. -/
def CardFiveInteriorSurvivorPair.toSurvivorPairRelocationPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    (P : CardFiveInteriorSurvivorPair D S r)
    (H : CriticalShellSystem D.A) :
    SurvivorPairRelocationPacket D S r H := by
  have hqClass := (Finset.mem_inter.mp P.q_mem).1
  have hwClass := (Finset.mem_inter.mp P.w_mem).1
  have hqInterior := (Finset.mem_inter.mp P.q_mem).2
  have hwInterior := (Finset.mem_inter.mp P.w_mem).2
  have hqA := (mem_selectedClass.mp hqClass).1
  have hwA := (mem_selectedClass.mp hwClass).1
  have hqMarginal :
      P.q ∈ (D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap := by
    refine Finset.mem_sdiff.mpr ⟨Finset.mem_filter.mpr ⟨hqA, ?_⟩, ?_⟩
    · simpa [dist_comm] using (mem_selectedClass.mp hqClass).2
    · exact interior_oppIndex1_not_mem_surplusCap S hqInterior
  have hwMarginal :
      P.w ∈ (D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap := by
    refine Finset.mem_sdiff.mpr ⟨Finset.mem_filter.mpr ⟨hwA, ?_⟩, ?_⟩
    · simpa [dist_comm] using (mem_selectedClass.mp hwClass).2
    · exact interior_oppIndex1_not_mem_surplusCap S hwInterior
  exact {
    q := P.q
    w := P.w
    q_mem_A := hqA
    w_mem_A := hwA
    q_mem_marginal := hqMarginal
    w_mem_marginal := hwMarginal
    q_ne_w := P.q_ne_w
    q_survives := P.q_survives
    w_survives := P.w_survives
    q_blocker_ne_oppApex2 :=
      actual_blocker_ne_of_deletion_survives H hqA P.q_survives
    w_blocker_ne_oppApex2 :=
      actual_blocker_ne_of_deletion_survives H hwA P.w_survives }

#print axioms selectedClass_capInteriorByIndex_card_ge_three_of_card_five
#print axioms firstApex_cardFive_interior_card_ge_three
#print axioms exists_cardFiveInteriorSurvivorPair
#print axioms CardFiveInteriorSurvivorPair.toSurvivorPairRelocationPacket

end ATailUniqueRowProducerScratch
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalUniqueResidualDispatch
import card_five_interior_critical_frontier

/-!
# Exact-four first-apex class distribution across the physical caps

The exact first-apex class has at least two points in the strict first
opposite cap and at most one point in each adjacent cap.  This file records
the resulting source-faithful dichotomy:

* exactly two strict hits, hence exactly one hit in each adjacent cap; or
* at least three strict hits, in which case the retained frontier pair can be
  reselected inside the strict cap while preserving double-deletion K4 at the
  second apex.

The second arm carries a complete rebased `OriginalUniqueFourResidual`; it is
not merely an existence statement about two geometric points.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourClassCapDistributionScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueRowProducerScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem oppApex1_eq_oppositeVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem interior_not_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.oppIndex1) :
    x ∉ S.surplusCap := by
  have hnot := S.capInteriorByIndex_not_mem_capByIndex_of_ne hx
    S.surplusIdx_ne_oppIndex1.symm
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simpa [SurplusCapPacket.capByIndex,
      SurplusCapPacket.surplusCap, hi] using hnot

/-- The rigid exact-two distribution: the other two class points occupy the
two adjacent caps, one in each. -/
structure ExactTwoStrictHitDistribution
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) : Prop where
  strict_hit_eq_two :
    (SelectedClass D.A S.oppApex1 radius ∩
      S.capInteriorByIndex S.oppIndex1).card = 2
  left_adjacent_hit_eq_one :
    (SelectedClass D.A S.oppApex1 radius ∩
      S.leftAdjacentCapByIndex S.oppIndex1).card = 1
  right_adjacent_hit_eq_one :
    (SelectedClass D.A S.oppApex1 radius ∩
      S.rightAdjacentCapByIndex S.oppIndex1).card = 1

/-- The generic form of the exact-five pair selector: three strict-cap points
on the first-apex circle contain two whose simultaneous deletion preserves a
K4 witness at the second apex.  No cardinality-five assumption is used. -/
theorem exists_interiorDoubleDeletionPair_of_three_strict_hits
    (D : CounterexampleData) (S : SurplusCapPacket D.A) {radius : ℝ}
    (hthree :
      3 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card) :
    Nonempty (CardFiveInteriorDoubleDeletionPair D S radius) := by
  classical
  let I : Finset ℝ² :=
    SelectedClass D.A S.oppApex1 radius ∩
      S.capInteriorByIndex S.oppIndex1
  let T : Finset ℝ² :=
    (D.A.filter fun x => dist x S.oppApex1 = radius) \ S.surplusCap
  have hthreeI : 3 ≤ I.card := by simpa [I] using hthree
  have hIT : I ⊆ T := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxClass, hxInterior⟩
    rcases mem_selectedClass.mp hxClass with ⟨hxA, hxRadius⟩
    exact Finset.mem_sdiff.mpr ⟨
      Finset.mem_filter.mpr ⟨hxA, by simpa [dist_comm] using hxRadius⟩,
      interior_not_mem_surplusCap S hxInterior⟩
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
      (D.K4 S.oppApex2 (oppApex2_mem_A S)) with
    ⟨rho, hrho, hfour⟩
  let hit : ℝ² → Prop := fun x =>
    x ∈ SelectedClass D.A S.oppApex2 rho
  have hhitT : (T.filter hit).card ≤ 1 := by
    simpa [T, hit] using
      firstApex_marginal_inter_secondClass_card_le_one D S radius rho
  have hhitI : (I.filter hit).card ≤ 1 := by
    apply le_trans (Finset.card_le_card ?_) hhitT
    intro x hx
    rcases Finset.mem_filter.mp hx with ⟨hxI, hxHit⟩
    exact Finset.mem_filter.mpr ⟨hIT hxI, hxHit⟩
  have hsplit := Finset.card_filter_add_card_filter_not (s := I) hit
  have htwo : 2 ≤ (I.filter fun x => ¬ hit x).card := by omega
  have hone : 1 < (I.filter fun x => ¬ hit x).card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨q, hq, w, hw, hqw⟩
  rcases Finset.mem_filter.mp hq with ⟨hqI, hqNot⟩
  rcases Finset.mem_filter.mp hw with ⟨hwI, hwNot⟩
  have hqNotClass : q ∉ SelectedClass D.A S.oppApex2 rho := by
    simpa [hit] using hqNot
  have hwNotClass : w ∉ SelectedClass D.A S.oppApex2 rho := by
    simpa [hit] using hwNot
  have hqCard :
      (SelectedClass (D.A.erase q) S.oppApex2 rho).card =
        (SelectedClass D.A S.oppApex2 rho).card :=
    selectedClass_erase_card_eq_of_not_mem hqNotClass
  have hwNotErase :
      w ∉ SelectedClass (D.A.erase q) S.oppApex2 rho := by
    intro hwErase
    exact hwNotClass (mem_selectedClass.mpr
      ⟨(Finset.mem_erase.mp (mem_selectedClass.mp hwErase).1).2,
        (mem_selectedClass.mp hwErase).2⟩)
  have hwCard :
      (SelectedClass ((D.A.erase q).erase w) S.oppApex2 rho).card =
        (SelectedClass (D.A.erase q) S.oppApex2 rho).card :=
    selectedClass_erase_card_eq_of_not_mem hwNotErase
  have hfourDouble :
      4 ≤ (SelectedClass ((D.A.erase q).erase w)
        S.oppApex2 rho).card := by
    rw [hwCard, hqCard]
    exact hfour
  exact ⟨{
    q := q
    w := w
    q_mem := by simpa [I] using hqI
    w_mem := by simpa [I] using hwI
    q_ne_w := hqw
    secondApexDouble := ⟨rho, hrho, by
      simpa [SelectedClass] using hfourDouble⟩ }⟩

/-- A late-selected strict-interior frontier, together with the original
exact-four residual transported to that frontier. -/
structure AlignedInteriorFrontier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) : Type where
  interiorPair : CardFiveInteriorDoubleDeletionPair D S radius

def AlignedInteriorFrontier.frontier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : AlignedInteriorFrontier R) :
    CriticalPairFrontier D S radius H :=
  P.interiorPair.toCriticalPairFrontier H

@[simp] theorem AlignedInteriorFrontier.frontier_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : AlignedInteriorFrontier R) :
    P.frontier.pair =
      P.interiorPair.toSurvivorPairRelocationPacket H := rfl

theorem AlignedInteriorFrontier.pair_q_mem_strict
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : AlignedInteriorFrontier R) :
    P.frontier.pair.q ∈ S.capInteriorByIndex S.oppIndex1 := by
  simpa [AlignedInteriorFrontier.frontier,
    CardFiveInteriorDoubleDeletionPair.toCriticalPairFrontier,
    CardFiveInteriorDoubleDeletionPair.toSurvivorPairRelocationPacket,
    CardFiveInteriorDoubleDeletionPair.toInteriorSurvivorPair] using
    (Finset.mem_inter.mp P.interiorPair.q_mem).2

theorem AlignedInteriorFrontier.pair_w_mem_strict
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : AlignedInteriorFrontier R) :
    P.frontier.pair.w ∈ S.capInteriorByIndex S.oppIndex1 := by
  simpa [AlignedInteriorFrontier.frontier,
    CardFiveInteriorDoubleDeletionPair.toCriticalPairFrontier,
    CardFiveInteriorDoubleDeletionPair.toSurvivorPairRelocationPacket,
    CardFiveInteriorDoubleDeletionPair.toInteriorSurvivorPair] using
    (Finset.mem_inter.mp P.interiorPair.w_mem).2

/-- The aligned pair inherits the production two-apex escape inequality; in
particular it is not another forbidden double-apex co-radial pair. -/
theorem AlignedInteriorFrontier.pair_oppApex2_dist_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : AlignedInteriorFrontier R) :
    dist S.oppApex2 P.frontier.pair.q ≠
      dist S.oppApex2 P.frontier.pair.w :=
  P.frontier.pair.oppApex2_dist_ne

/-- The exact-four residual loses no global field when its frontier pair is
reselected: its strict pair is now definitionally the frontier pair. -/
def AlignedInteriorFrontier.residual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : AlignedInteriorFrontier R) :
    OriginalUniqueFourResidual P.frontier where
  minimal := R.minimal
  noM44 := R.noM44
  carrier_card_gt_nine := R.carrier_card_gt_nine
  class_card_eq_four := R.class_card_eq_four
  unique_K4_radius := R.unique_K4_radius
  every_class_member_blocks := R.every_class_member_blocks
  interior_q := P.frontier.pair.q
  interior_w := P.frontier.pair.w
  interior_q_mem := by
    simpa [AlignedInteriorFrontier.frontier,
      CardFiveInteriorDoubleDeletionPair.toCriticalPairFrontier,
      CardFiveInteriorDoubleDeletionPair.toSurvivorPairRelocationPacket,
      CardFiveInteriorDoubleDeletionPair.toInteriorSurvivorPair] using
      P.interiorPair.q_mem
  interior_w_mem := by
    simpa [AlignedInteriorFrontier.frontier,
      CardFiveInteriorDoubleDeletionPair.toCriticalPairFrontier,
      CardFiveInteriorDoubleDeletionPair.toSurvivorPairRelocationPacket,
      CardFiveInteriorDoubleDeletionPair.toInteriorSurvivorPair] using
      P.interiorPair.w_mem
  interior_q_ne_w := by
    simpa [AlignedInteriorFrontier.frontier,
      CardFiveInteriorDoubleDeletionPair.toCriticalPairFrontier,
      CardFiveInteriorDoubleDeletionPair.toSurvivorPairRelocationPacket,
      CardFiveInteriorDoubleDeletionPair.toInteriorSurvivorPair] using
      P.interiorPair.q_ne_w
  bisector_center_mem_interior := by
    intro c hcA hcApex hcEq
    exact interior_pair_bisector_center_mem_capInterior
      (by
        simpa [AlignedInteriorFrontier.frontier,
          CardFiveInteriorDoubleDeletionPair.toCriticalPairFrontier,
          CardFiveInteriorDoubleDeletionPair.toSurvivorPairRelocationPacket,
          CardFiveInteriorDoubleDeletionPair.toInteriorSurvivorPair] using
          P.interiorPair.q_mem)
      (by
        simpa [AlignedInteriorFrontier.frontier,
          CardFiveInteriorDoubleDeletionPair.toCriticalPairFrontier,
          CardFiveInteriorDoubleDeletionPair.toSurvivorPairRelocationPacket,
          CardFiveInteriorDoubleDeletionPair.toInteriorSurvivorPair] using
          P.interiorPair.w_mem)
      (by
        simpa [AlignedInteriorFrontier.frontier,
          CardFiveInteriorDoubleDeletionPair.toCriticalPairFrontier,
          CardFiveInteriorDoubleDeletionPair.toSurvivorPairRelocationPacket,
          CardFiveInteriorDoubleDeletionPair.toInteriorSurvivorPair] using
          P.interiorPair.q_ne_w)
      hcA hcApex hcEq

/-- Exhaustive source-level decomposition of the exact-four leaf. -/
theorem exactFour_twoStrict_or_alignedInteriorFrontier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    Nonempty (ExactTwoStrictHitDistribution R) ∨
      Nonempty (AlignedInteriorFrontier R) := by
  classical
  let T := SelectedClass D.A S.oppApex1 radius
  let I := S.capInteriorByIndex S.oppIndex1
  have hradius : 0 < radius := frontier_radius_pos F
  have htwo : 2 ≤ (T ∩ I).card := by
    simpa [T, I] using firstApex_cardFour_interior_card_ge_two
      D S hradius R.class_card_eq_four
  by_cases hthree : 3 ≤ (T ∩ I).card
  · right
    rcases exists_interiorDoubleDeletionPair_of_three_strict_hits
        D S (by simpa [T, I] using hthree) with ⟨P⟩
    exact ⟨⟨P⟩⟩
  · left
    have hcenter := oppApex1_eq_oppositeVertexByIndex S
    have hstrict : (T ∩ I).card = 2 := by omega
    have houtside : (T \ I).card = 2 := by
      have hsplit := Finset.card_sdiff_add_card_inter T I
      have hcardT : T.card = 4 := by simpa [T] using R.class_card_eq_four
      omega
    have hleft :
        (T ∩ S.leftAdjacentCapByIndex S.oppIndex1).card ≤ 1 := by
      simpa [T, hcenter] using
        S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
          D.convex S.oppIndex1 radius
    have hright :
        (T ∩ S.rightAdjacentCapByIndex S.oppIndex1).card ≤ 1 := by
      simpa [T, hcenter] using
        S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
          D.convex S.oppIndex1 radius
    have hcover :
        T \ I ⊆
          (T ∩ S.leftAdjacentCapByIndex S.oppIndex1) ∪
            (T ∩ S.rightAdjacentCapByIndex S.oppIndex1) := by
      simpa [T, I, hcenter] using
        S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
          S.oppIndex1 hradius
    have hunionGe :
        2 ≤ ((T ∩ S.leftAdjacentCapByIndex S.oppIndex1) ∪
          (T ∩ S.rightAdjacentCapByIndex S.oppIndex1)).card := by
      calc
        2 = (T \ I).card := houtside.symm
        _ ≤ _ := Finset.card_le_card hcover
    have hsumGe :
        2 ≤ (T ∩ S.leftAdjacentCapByIndex S.oppIndex1).card +
          (T ∩ S.rightAdjacentCapByIndex S.oppIndex1).card :=
      hunionGe.trans (Finset.card_union_le _ _)
    have hleftEq :
        (T ∩ S.leftAdjacentCapByIndex S.oppIndex1).card = 1 := by omega
    have hrightEq :
        (T ∩ S.rightAdjacentCapByIndex S.oppIndex1).card = 1 := by omega
    exact ⟨{
      strict_hit_eq_two := by simpa [T, I] using hstrict
      left_adjacent_hit_eq_one := by simpa [T] using hleftEq
      right_adjacent_hit_eq_one := by simpa [T] using hrightEq }⟩

#print axioms exists_interiorDoubleDeletionPair_of_three_strict_hits
#print axioms AlignedInteriorFrontier.residual
#print axioms AlignedInteriorFrontier.pair_oppApex2_dist_ne
#print axioms exactFour_twoStrict_or_alignedInteriorFrontier

end ATailUniqueFourClassCapDistributionScratch
end Problem97

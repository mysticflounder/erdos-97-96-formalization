/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoRadiusExactTwelveSecondCapRows
import Erdos9796Proof.P97.SurplusM44Packet.ExactFourAdjacentDistribution

/-!
# Large-interior or adjacent-grid split for two full second-apex classes

This is the cardinality-free row-local split used by the two-radius branch.
Two disjoint full four-point classes at `S.oppApex2` each contribute at least
two points to the strict second-cap interior.  If their disjoint union has at
least five points, the large-interior arm is exposed.  Otherwise both slices
are exactly two points, and the adjacent-cap distribution theorem supplies
the exact two-by-two grid.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailApexRichClassStructure

attribute [local instance] Classical.propDecidable

/-- Two disjoint full four-point classes at the second opposite apex either
have at least five strict-interior points between them or form the exact
two-by-two adjacent-cap grid.  The only fullness hypotheses are the two
fewer-than-five radius-class bounds, which are used to identify each supplied
four-point support with its full radius class. -/
theorem two_full_secondApex_classes_largeInterior_or_grid
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A)
    (K0 K1 : SelectedFourClass A S.oppApex2)
    (hdisjoint : Disjoint K0.support K1.support)
    (hradii : K0.radius ≠ K1.radius)
    (hnoFive0 :
      (SelectedClass A S.oppApex2 K0.radius).card < 5)
    (hnoFive1 :
      (SelectedClass A S.oppApex2 K1.radius).card < 5) :
    5 ≤ ((K0.support ∩ S.oppInterior2) ∪
      (K1.support ∩ S.oppInterior2)).card ∨
      S.ExactFourTwoRadiusAdjacentCapGrid S.oppIndex2
        K0.radius K1.radius := by
  classical
  have hK0full : K0.support = SelectedClass A S.oppApex2 K0.radius :=
    selectedFourClass_support_eq_selectedClass_of_card_lt_five K0 hnoFive0
  have hK1full : K1.support = SelectedClass A S.oppApex2 K1.radius :=
    selectedFourClass_support_eq_selectedClass_of_card_lt_five K1 hnoFive1
  have hK0card :
      (SelectedClass A S.oppApex2 K0.radius).card = 4 := by
    rw [← hK0full]
    exact K0.support_card
  have hK1card :
      (SelectedClass A S.oppApex2 K1.radius).card = 4 := by
    rw [← hK1full]
    exact K1.support_card
  have hK0cardIdx :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2)
        K0.radius).card := by
    simpa only [oppositeVertexByIndex_oppIndex2] using hK0card.symm.le
  have hK1cardIdx :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2)
        K1.radius).card := by
    simpa only [oppositeVertexByIndex_oppIndex2] using hK1card.symm.le
  have hK0lower : 2 ≤ (K0.support ∩ S.oppInterior2).card := by
    rw [hK0full]
    simpa only [oppositeVertexByIndex_oppIndex2,
      SurplusCapPacket.oppInterior2] using
      (S.selectedClass_capInteriorByIndex_card_ge_two hconv S.oppIndex2
        K0.radius_pos hK0cardIdx)
  have hK1lower : 2 ≤ (K1.support ∩ S.oppInterior2).card := by
    rw [hK1full]
    simpa only [oppositeVertexByIndex_oppIndex2,
      SurplusCapPacket.oppInterior2] using
      (S.selectedClass_capInteriorByIndex_card_ge_two hconv S.oppIndex2
        K1.radius_pos hK1cardIdx)
  have hsliceDisjoint :
      Disjoint (K0.support ∩ S.oppInterior2)
        (K1.support ∩ S.oppInterior2) := by
    exact hdisjoint.mono Finset.inter_subset_left Finset.inter_subset_left
  have hsum :
      (K0.support ∩ S.oppInterior2).card +
          (K1.support ∩ S.oppInterior2).card =
        ((K0.support ∩ S.oppInterior2) ∪
          (K1.support ∩ S.oppInterior2)).card := by
    symm
    exact Finset.card_union_of_disjoint hsliceDisjoint
  by_cases hlarge :
      5 ≤ ((K0.support ∩ S.oppInterior2) ∪
        (K1.support ∩ S.oppInterior2)).card
  · exact Or.inl hlarge
  · right
    have hsum_le :
        (K0.support ∩ S.oppInterior2).card +
            (K1.support ∩ S.oppInterior2).card ≤ 4 := by
      rw [hsum]
      omega
    have hK0eq : (K0.support ∩ S.oppInterior2).card = 2 := by
      omega
    have hK1eq : (K1.support ∩ S.oppInterior2).card = 2 := by
      omega
    refine S.exactFourTwoRadiusAdjacentCapGrid hconv S.oppIndex2
      K0.radius_pos K1.radius_pos hradii ?_ ?_ ?_ ?_
    · simpa only [oppositeVertexByIndex_oppIndex2] using hK0card
    · simpa only [oppositeVertexByIndex_oppIndex2] using hK1card
    · simpa only [oppositeVertexByIndex_oppIndex2,
        SurplusCapPacket.oppInterior2, hK0full] using hK0eq
    · simpa only [oppositeVertexByIndex_oppIndex2,
        SurplusCapPacket.oppInterior2, hK1full] using hK1eq

end ATailFrontierLiveClosure
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1OppositeCapLowerBounds
import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# Radius-class hits in a strict opposite-cap interior

This predecessor module isolates the cap-counting lemma needed by the A-TAIL
robust branch.  It deliberately stays below `U1LargeCapRouteBTail` in the
import graph so the minimal-deletion and large-radius producers can be used on
that spine without an import cycle.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- Every positive-radius K4 class centered at a Moser apex contains at least
two points from the strict interior of its opposite cap. The two adjacent
one-hit bounds leave room for at most two class members outside that
interior. -/
theorem SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_two
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard : 4 ≤
      (SelectedClass A (S.oppositeVertexByIndex i) radius).card) :
    2 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
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
  have hcardT : 4 ≤ T.card := by
    simpa [T] using hcard
  change 2 ≤ (T ∩ S.capInteriorByIndex i).card
  omega

end Problem97

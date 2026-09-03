/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.AdjacentCapContainment
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TriApexEndpointRetainedOmission

/-!
# Endpoint radii in the all-large exact-fifteen regime

At carrier size fifteen, an apex-centred selected class containing the strict
interior of its cap has six points.  If the class has no strict adjacent escape,
cardinality-free containment identifies it with the six-point closed cap.  The
two outer Moser vertices therefore lie in the selected class and have the class
radius from its centre.
-/

open scoped EuclideanGeometry

namespace Problem97.ATailFrontierLiveClosure

/-- In the exact-fifteen one-radius arm, excluding a strict adjacent escape
forces both outer Moser vertices to lie at the selected radius from the opposite
vertex.  This is the pointwise endpoint-radius payload used by the tri-apex
all-large card-fifteen branch. -/
theorem endpointRadius_of_not_strictAdjacentEscapeAt_of_oneRadius_card_eq_fifteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (G : TriApexAllLargeContext D S) (hcard : D.A.card = 15) (i : Fin 3)
    {r : ℝ} (hr : 0 < r)
    (hslice : S.capInteriorByIndex i ⊆
      SelectedClass D.A (S.oppositeVertexByIndex i) r)
    (hno : ¬ S.StrictAdjacentEscapeAt i r) :
    dist (S.leftOuterVertexByIndex i) (S.oppositeVertexByIndex i) = r ∧
    dist (S.rightOuterVertexByIndex i) (S.oppositeVertexByIndex i) = r := by
  have hsubset :
      SelectedClass D.A (S.oppositeVertexByIndex i) r ⊆ S.capByIndex i :=
    S.selectedClass_subset_capByIndex_of_not_strictAdjacentEscapeAt i hr hno
  have hselectedCard :
      (SelectedClass D.A (S.oppositeVertexByIndex i) r).card = 6 :=
    (selectedClass_card_eq_six_of_oneRadius_card_eq_fifteen
      G hcard i hr hslice).1
  have hcapCard : (S.capByIndex i).card = 6 :=
    ATailExactFifteenApexProfile.capByIndex_card_eq_six_of_card_eq_fifteen
      S hcard G.cap_card_ge_six i
  have hcardLe :
      (S.capByIndex i).card ≤
        (SelectedClass D.A (S.oppositeVertexByIndex i) r).card := by
    omega
  have hclass :
      SelectedClass D.A (S.oppositeVertexByIndex i) r = S.capByIndex i :=
    Finset.eq_of_subset_of_card_le hsubset hcardLe
  have hleft : S.leftOuterVertexByIndex i ∈
      SelectedClass D.A (S.oppositeVertexByIndex i) r := by
    rw [hclass]
    exact S.leftOuterVertexByIndex_mem_capByIndex i
  have hright : S.rightOuterVertexByIndex i ∈
      SelectedClass D.A (S.oppositeVertexByIndex i) r := by
    rw [hclass]
    exact S.rightOuterVertexByIndex_mem_capByIndex i
  exact ⟨dist_self_of_mem_selectedClass hleft, dist_self_of_mem_selectedClass hright⟩

end Problem97.ATailFrontierLiveClosure

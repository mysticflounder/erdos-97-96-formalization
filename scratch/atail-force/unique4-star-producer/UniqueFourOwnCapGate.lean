/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Own-cap gate for exact-four finite survivors

This file kernel-checks the exact geometric cut missing from the first static
no-four-arc projection: a selected four-class centered in an indexed Moser cap
cannot contain three points of that same closed cap.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourStarProducerScratch

/-- Three own-cap support hits contradict the ordered-cap distance
monotonicity theorem.  This is the exact terminal used to reject the first
profile-four static no-curvature survivor. -/
theorem false_of_three_le_selectedFourClass_inter_capByIndex
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (i : Fin 3)
    {center : ℝ²} (K : SelectedFourClass D.A center)
    (hcenter : center ∈ S.capByIndex i)
    (hthree : 3 ≤ (K.support ∩ S.capByIndex i).card) : False := by
  have htwo : (K.support ∩ S.capByIndex i).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex i K hcenter
  omega

/-- Two support hits in a cap whose first endpoint is the row center
contradict endpoint distance injectivity. -/
theorem false_of_two_le_selectedFourClass_inter_orderedCap_first
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    (K : SelectedFourClass A (L.points (CGN.firstIndex Packet.hm)))
    (htwo : 2 ≤ (K.support ∩ Finset.univ.image L.points).card) : False := by
  have hone : (K.support ∩ Finset.univ.image L.points).card ≤ 1 :=
    CapSelectedRowCounting.selectedFourClass_inter_orderedCap_first_card_le_one
      Packet Hside Hord K
  omega

/-- Two support hits in a cap whose last endpoint is the row center
contradict endpoint distance injectivity. -/
theorem false_of_two_le_selectedFourClass_inter_orderedCap_last
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    (K : SelectedFourClass A (L.points (CGN.lastIndex Packet.hm)))
    (htwo : 2 ≤ (K.support ∩ Finset.univ.image L.points).card) : False := by
  have hone : (K.support ∩ Finset.univ.image L.points).card ≤ 1 :=
    CapSelectedRowCounting.selectedFourClass_inter_orderedCap_last_card_le_one
      Packet Hside Hord K
  omega

#print axioms false_of_three_le_selectedFourClass_inter_capByIndex
#print axioms false_of_two_le_selectedFourClass_inter_orderedCap_first
#print axioms false_of_two_le_selectedFourClass_inter_orderedCap_last

end ATailUniqueFourStarProducerScratch
end Problem97

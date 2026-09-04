/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusM44Packet.Shard02

/-!
# Two cap interiors cannot share a pair of apex-centred radii

Fix three distinct cap indices `i`, `j`, `k`.  Suppose a carrier point `x` of
cap `j`'s strict interior and a carrier point `y` of cap `i`'s strict interior
are both at distance `ri` from the Moser vertex opposite cap `i` and both at
distance `rj` from the Moser vertex opposite cap `j`.  Then `x` and `y` are two
distinct common points of the same two circles, and both avoid cap `k`, which
`SurplusCapPacket.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex`
(`SurplusM44Packet/Shard01.lean`) refutes: the two intersection points of a
circle pair are separated by the line through the centres, while both cap
interiors lie on the far side of that line from cap `k`.

Every side condition comes from proved source.  Carrier membership is
`capInteriorByIndex_subset`; avoidance of cap `k` is
`capInteriorByIndex_not_mem_capByIndex_of_ne`; distinctness of `x` and `y` is
`capInteriorByIndex_ne_of_mem_of_mem_ne`.  No cardinality hypothesis, no
`ConvexIndep`, and no circumscribed-circle data are used.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace SurplusCapPacket

/-- Two distinct cap interiors cannot both meet the same pair of apex-centred
circles, when the two apices are the ones opposite those two caps.

Stated at the third index `k`: `x` lies in the interior of the cap opposite the
right-adjacent apex and `y` in the interior of the cap opposite the
left-adjacent apex. -/
theorem twoCircle_capInteriorPair_false_of_shared_apex_radii_of_adjacent
    {A : Finset ℝ²} (S : SurplusCapPacket A) (k : Fin 3)
    {ri rj : ℝ} {x y : ℝ²}
    (hx : x ∈ S.capInteriorByIndex (rightAdjacentIndex k))
    (hy : y ∈ S.capInteriorByIndex (leftAdjacentIndex k))
    (hxi : dist x (S.oppositeVertexByIndex (leftAdjacentIndex k)) = ri)
    (hyi : dist y (S.oppositeVertexByIndex (leftAdjacentIndex k)) = ri)
    (hxj : dist x (S.oppositeVertexByIndex (rightAdjacentIndex k)) = rj)
    (hyj : dist y (S.oppositeVertexByIndex (rightAdjacentIndex k)) = rj) :
    False := by
  have hLk : leftAdjacentIndex k ≠ k := by fin_cases k <;> decide
  have hRk : rightAdjacentIndex k ≠ k := by fin_cases k <;> decide
  have hLR : rightAdjacentIndex k ≠ leftAdjacentIndex k := by fin_cases k <;> decide
  have hv2 : (S.triangleByIndex k).v2 = S.oppositeVertexByIndex (leftAdjacentIndex k) := by
    fin_cases k <;> rfl
  have hv3 : (S.triangleByIndex k).v3 = S.oppositeVertexByIndex (rightAdjacentIndex k) := by
    fin_cases k <;> rfl
  rw [← hv2] at hxi hyi
  rw [← hv3] at hxj hyj
  exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex k
    (S.capInteriorByIndex_subset _ hx) (S.capInteriorByIndex_subset _ hy)
    (S.capInteriorByIndex_not_mem_capByIndex_of_ne hx hRk)
    (S.capInteriorByIndex_not_mem_capByIndex_of_ne hy hLk)
    (S.capInteriorByIndex_ne_of_mem_of_mem_ne hx hy hLR)
    hxi hyi hxj hyj

end SurplusCapPacket
end Problem97

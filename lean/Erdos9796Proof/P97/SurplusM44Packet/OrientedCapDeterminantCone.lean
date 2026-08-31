/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Cap.OrientedCapDeterminantCone
import Erdos9796Proof.P97.SurplusM44Packet.Shard02

/-!
# Indexed-cap ingress to the determinant cone

These wrappers specialize the oriented-cap determinant API to the indexed caps
of a `SurplusCapPacket`.  Keeping the index in every conclusion makes the
controlled support chord explicit.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97
namespace SurplusCapPacket

variable {A : Finset ℝ²}

/-- A strict interior point of indexed cap `i` lies strictly on the apex side
of every different indexed cap `j`.  Equivalently, its signed-area product for
the `j` frame is positive, not merely the negation of `OnArcOpposite`. -/
theorem signedArea2_mul_pos_of_mem_capInteriorByIndex_of_ne
    (S : SurplusCapPacket A) {i j : Fin 3} {x : ℝ²}
    (hxInterior : x ∈ S.capInteriorByIndex i) (hij : i ≠ j) :
    0 < signedArea2 x (S.triangleByIndex j).v2 (S.triangleByIndex j).v3 *
      signedArea2 (S.triangleByIndex j).v1
        (S.triangleByIndex j).v2 (S.triangleByIndex j).v3 := by
  exact S.signedArea2_mul_pos_of_not_mem_capByIndex j
    (S.capInteriorByIndex_subset i hxInterior)
    (S.capInteriorByIndex_not_mem_capByIndex_of_ne hxInterior hij)

/-- A point in the physical second-cap interior has a strictly positive
signed-area product in the neighboring first-opposite cap frame. -/
theorem signedArea2_mul_pos_at_oppIndex1_of_mem_oppIndex2Interior
    (S : SurplusCapPacket A) {x : ℝ²}
    (hxInterior : x ∈ S.capInteriorByIndex S.oppIndex2) :
    0 < signedArea2 x (S.triangleByIndex S.oppIndex1).v2
        (S.triangleByIndex S.oppIndex1).v3 *
      signedArea2 (S.triangleByIndex S.oppIndex1).v1
        (S.triangleByIndex S.oppIndex1).v2
        (S.triangleByIndex S.oppIndex1).v3 := by
  exact S.signedArea2_mul_pos_of_mem_capInteriorByIndex_of_ne hxInterior
    S.oppIndex1_ne_oppIndex2.symm

/-- Physical second-cap interior membership rules out the neighboring
first-opposite `OnArcOpposite` predicate. -/
theorem not_onArcOpposite_oppIndex1_of_mem_oppIndex2Interior
    (S : SurplusCapPacket A) {x : ℝ²}
    (hxInterior : x ∈ S.capInteriorByIndex S.oppIndex2) :
    ¬ OnArcOpposite (S.triangleByIndex S.oppIndex1).v1
      (S.triangleByIndex S.oppIndex1).v2
      (S.triangleByIndex S.oppIndex1).v3 x := by
  intro hxArc
  have hpos :=
    S.signedArea2_mul_pos_at_oppIndex1_of_mem_oppIndex2Interior hxInterior
  change signedArea2 x (S.triangleByIndex S.oppIndex1).v2
      (S.triangleByIndex S.oppIndex1).v3 *
    signedArea2 (S.triangleByIndex S.oppIndex1).v1
      (S.triangleByIndex S.oppIndex1).v2
      (S.triangleByIndex S.oppIndex1).v3 ≤ 0 at hxArc
  exact (not_lt_of_ge hxArc) hpos

/-- Membership in indexed cap `i` gives radial support for exactly the chord
between `(triangleByIndex i).v2` and `(triangleByIndex i).v3`. -/
theorem radialSupport_of_mem_capByIndex
    (S : SurplusCapPacket A) (i : Fin 3) {v : ℝ²}
    (hvCap : v ∈ S.capByIndex i) :
    dist (S.triangleByIndex i).v2 v ^ 2 ≤
      ⟪(S.triangleByIndex i).v3 - (S.triangleByIndex i).v2,
        v - (S.triangleByIndex i).v2⟫_ℝ := by
  have hvA : v ∈ A := S.capByIndex_subset i hvCap
  have hvArc :
      OnArcOpposite (S.triangleByIndex i).v1
        (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 v :=
    (S.capByIndex_arc_membership i v hvA).1 hvCap
  exact (S.circPacketByIndex i).radialSupport_of_onArcOpposite hvA hvArc

/-- An oriented indexed cap closes the equal-radius determinant cone.  The
base point, radial endpoint, and strict-turn roles are all determined by the
same `triangleByIndex i` frame.

For `surplusIdx = 0`, index `2` is the physical second cap and controls chord
`triangle.v1 triangle.v2`; it does not control chord
`triangle.v3 triangle.v1`, which belongs to index `1`. -/
theorem false_of_equalRadius_detCone_of_mem_capByIndex
    (S : SurplusCapPacket A) (i : Fin 3) {delta v : ℝ²}
    (hvCap : v ∈ S.capByIndex i)
    (hOrientation :
      0 < signedArea2 (S.triangleByIndex i).v1
        (S.triangleByIndex i).v2 (S.triangleByIndex i).v3)
    (hEqSq :
      dist (S.triangleByIndex i).v2 delta ^ 2 =
        dist (S.triangleByIndex i).v2 v ^ 2)
    (hFirst :
      signedArea2 (S.triangleByIndex i).v2 delta v < 0)
    (hSecond :
      0 < signedArea2 delta (S.triangleByIndex i).v3 v) :
    False := by
  have hvA : v ∈ A := S.capByIndex_subset i hvCap
  have hvArc :
      OnArcOpposite (S.triangleByIndex i).v1
        (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 v :=
    (S.capByIndex_arc_membership i v hvA).1 hvCap
  exact (S.circPacketByIndex i).false_of_equalRadius_detCone_of_onArcOpposite
    hvA hvArc hOrientation hEqSq hFirst hSecond

end SurplusCapPacket
end Problem97

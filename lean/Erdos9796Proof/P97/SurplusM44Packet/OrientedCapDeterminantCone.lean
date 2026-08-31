/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Cap.OrientedCapDeterminantCone
import Erdos9796Proof.P97.SurplusM44Packet.Shard01

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

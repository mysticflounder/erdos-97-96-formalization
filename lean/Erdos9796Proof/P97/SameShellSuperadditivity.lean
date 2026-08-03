/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.CircumcenterSide
import Erdos9796Proof.P97.ConvexIndepHelpers
import Erdos9796Proof.P97.Moser.NonDeg
import Erdos9796Proof.P97.CGN.CGN

/-!
# Same-shell squared-distance superadditivity

If three points `x`, `y`, and `z` lie on one circle centered at `p`, and
`y` and `p` lie on strictly opposite sides of the chord `xz`, then the
inscribed angle at `y` is obtuse.  The cosine-law identity therefore gives

`dist x z ^ 2 > dist x y ^ 2 + dist y z ^ 2`.

The first theorem below exposes the minimal metric-and-side statement.  The
second discharges its side hypothesis from the project's ordered-cap API:
for `i < j < k`, `L[j]` is on the positive side of the chord `L[i]L[k]`,
while a carrier center outside the indexed cap is strictly on the negative
side.  Convex independence supplies strictness by excluding collinearity.
-/

open scoped EuclideanGeometry InnerProductSpace
open Finset

namespace Problem97

/-- Three same-shell points satisfy strict squared-distance superadditivity
when the middle point and shell center lie on opposite open half-planes of
the chord joining the outer points. -/
theorem dist_sq_gt_add_of_same_shell_opposite_sides
    {p x y z : ℝ²} {r : ℝ}
    (hx : dist x p = r) (hy : dist y p = r) (hz : dist z p = r)
    (hopposite : signedArea2 p x z * signedArea2 y x z < 0) :
    dist x z ^ 2 > dist x y ^ 2 + dist y z ^ 2 := by
  have hinner : ⟪x - y, z - y⟫_ℝ < 0 := by
    by_contra h
    have hnonneg : 0 ≤ ⟪x - y, z - y⟫_ℝ := le_of_not_gt h
    have hsame := center_same_side_as_apex_of_nonobtuse
      (O := p) (a := x) (b := z) (c := y) (r := r)
      (by simpa [dist_eq_norm] using hx)
      (by simpa [dist_eq_norm] using hz)
      (by simpa [dist_eq_norm] using hy)
      hnonneg
    linarith
  rw [dist_eq_norm, dist_eq_norm, dist_eq_norm, norm_sub_rev y z]
  have hnorm := norm_sub_pow_two_real (x - y) (z - y)
  rw [sub_sub_sub_cancel_right] at hnorm
  linarith

namespace CGN

/-- In an ordered cap, a carrier point strictly between two indexed endpoints
and a carrier point outside the cap lie on opposite open sides of their
chord.  This is the signed-area form of the cap-order bridge, separated from
any particular same-shell metric application. -/
theorem signedArea_product_neg_of_between_and_off_cap
    {A : Finset ℝ²} {m : ℕ} {L : OrderedCap m}
    (hconv : ConvexIndep A)
    (Packet : MecCapPacket A L)
    (Hord : StrictCapOrder A L)
    {i j k : Fin m} (hij : i < j) (hjk : j < k)
    {p : ℝ²} (hpA : p ∈ A)
    (hpOff : p ∉ Finset.univ.image L.points) :
    signedArea2 p (L.points i) (L.points k) *
        signedArea2 (L.points j) (L.points i) (L.points k) < 0 := by
  have hik : i < k := lt_trans hij hjk
  have hjPos : 0 < signedArea2 (L.points i) (L.points k) (L.points j) :=
    (Hord.subchord_open_side_iff_A hik (Packet.mem_A j)).2 ⟨j, hij, hjk, rfl⟩
  have hpNonpos : signedArea2 (L.points i) (L.points k) p ≤ 0 := by
    apply le_of_not_gt
    intro hpPos
    obtain ⟨t, _, _, ht⟩ :=
      (Hord.subchord_open_side_iff_A hik hpA).1 hpPos
    exact hpOff (Finset.mem_image.mpr ⟨t, Finset.mem_univ _, ht⟩)
  have hikPoint : L.points i ≠ L.points k :=
    fun h => (ne_of_lt hik) (L.injective h)
  have hiImage : L.points i ∈ Finset.univ.image L.points :=
    Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
  have hkImage : L.points k ∈ Finset.univ.image L.points :=
    Finset.mem_image.mpr ⟨k, Finset.mem_univ _, rfl⟩
  have hpi : p ≠ L.points i := fun h => hpOff (h ▸ hiImage)
  have hpk : p ≠ L.points k := fun h => hpOff (h ▸ hkImage)
  have hpNe : signedArea2 (L.points i) (L.points k) p ≠ 0 := by
    intro hzero
    exact hconv.not_three_collinear (Packet.mem_A i) (Packet.mem_A k) hpA
      hikPoint hpi.symm hpk.symm
      (collinear_of_signedArea2_eq_zero _ _ _ hzero)
  have hpNeg : signedArea2 (L.points i) (L.points k) p < 0 :=
    lt_of_le_of_ne hpNonpos hpNe
  have hcycP :
      signedArea2 p (L.points i) (L.points k) =
        signedArea2 (L.points i) (L.points k) p := by
    unfold signedArea2
    ring
  have hcycJ :
      signedArea2 (L.points j) (L.points i) (L.points k) =
        signedArea2 (L.points i) (L.points k) (L.points j) := by
    unfold signedArea2
    ring
  rw [hcycP, hcycJ]
  exact mul_neg_of_neg_of_pos hpNeg hjPos

/-- Ordered-cap form of same-shell squared-distance superadditivity.

The shell center `p` is a carrier point outside the indexed cap.  Thus, for
`i < j < k`, strict cap order places `L[j]` and `p` on opposite open sides of
the chord `L[i]L[k]`. -/
theorem sameShell_sqDist_superadditive_of_strictCapOrder
    {A : Finset ℝ²} {m : ℕ} {L : OrderedCap m}
    (hconv : ConvexIndep A)
    (hmem : ∀ t : Fin m, L.points t ∈ A)
    (Hord : StrictCapOrder A L)
    {i j k : Fin m} (hij : i < j) (hjk : j < k)
    {p : ℝ²} {r : ℝ}
    (hpA : p ∈ A)
    (hpOff : p ∉ Finset.univ.image L.points)
    (hi : dist (L.points i) p = r)
    (hj : dist (L.points j) p = r)
    (hk : dist (L.points k) p = r) :
    dist (L.points i) (L.points k) ^ 2 >
      dist (L.points i) (L.points j) ^ 2 +
        dist (L.points j) (L.points k) ^ 2 := by
  have hik : i < k := lt_trans hij hjk
  have hjPos : 0 < signedArea2 (L.points i) (L.points k) (L.points j) :=
    (Hord.subchord_open_side_iff_A hik (hmem j)).2 ⟨j, hij, hjk, rfl⟩
  have hpNonpos : signedArea2 (L.points i) (L.points k) p ≤ 0 := by
    apply le_of_not_gt
    intro hpPos
    obtain ⟨t, _, _, ht⟩ :=
      (Hord.subchord_open_side_iff_A hik hpA).1 hpPos
    exact hpOff (Finset.mem_image.mpr ⟨t, Finset.mem_univ _, ht⟩)
  have hikPoint : L.points i ≠ L.points k :=
    fun h => (ne_of_lt hik) (L.injective h)
  have hiImage : L.points i ∈ Finset.univ.image L.points :=
    Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
  have hkImage : L.points k ∈ Finset.univ.image L.points :=
    Finset.mem_image.mpr ⟨k, Finset.mem_univ _, rfl⟩
  have hpi : p ≠ L.points i := fun h => hpOff (h ▸ hiImage)
  have hpk : p ≠ L.points k := fun h => hpOff (h ▸ hkImage)
  have hpNe : signedArea2 (L.points i) (L.points k) p ≠ 0 := by
    intro hzero
    exact hconv.not_three_collinear (hmem i) (hmem k) hpA
      hikPoint hpi.symm hpk.symm
      (collinear_of_signedArea2_eq_zero _ _ _ hzero)
  have hpNeg : signedArea2 (L.points i) (L.points k) p < 0 :=
    lt_of_le_of_ne hpNonpos hpNe
  have hcycP :
      signedArea2 p (L.points i) (L.points k) =
        signedArea2 (L.points i) (L.points k) p := by
    unfold signedArea2
    ring
  have hcycJ :
      signedArea2 (L.points j) (L.points i) (L.points k) =
        signedArea2 (L.points i) (L.points k) (L.points j) := by
    unfold signedArea2
    ring
  apply dist_sq_gt_add_of_same_shell_opposite_sides hi hj hk
  rw [hcycP, hcycJ]
  exact mul_neg_of_neg_of_pos hpNeg hjPos

end CGN
end Problem97

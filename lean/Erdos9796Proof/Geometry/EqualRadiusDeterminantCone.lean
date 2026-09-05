/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.Geometry.FivePointCircleIsosceles

/-!
# Equal-radius determinant cone

This module isolates a division-free four-point metric obstruction.  Two
points at the same squared radius about `O` cannot satisfy a negative first
turn, a nonpositive cap turn, a radial supporting inequality, and a positive
second turn.

The result is independent of finite configurations and of any fixed coordinate
normalization.
-/

open scoped InnerProductSpace

namespace Erdos9796Proof
namespace Geometry

/-- Squared Euclidean distance in `Plane` is the sum of the squared coordinate differences. -/
private theorem dist_sq_coord (p q : Plane) :
    dist p q ^ 2 = (p 0 - q 0) ^ 2 + (p 1 - q 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

/-- The real inner product in `Plane` is the sum of the products of corresponding coordinates. -/
private theorem inner_eq_coords (u w : Plane) :
    ⟪u, w⟫_ℝ = u 0 * w 0 + u 1 * w 1 := by
  rw [PiLp.inner_apply]
  simp [Fin.sum_univ_two, mul_comm (u _) (w _)]

/-- Division-free determinant identity for four translated planar vectors. -/
theorem signedArea2_detCone_identity (O m delta v : Plane) :
    dist O v ^ 2 * signedArea2 delta m v =
      (dist O v ^ 2 - ⟪delta - O, v - O⟫_ℝ) * signedArea2 O m v +
        (-signedArea2 O delta v) *
          (dist O v ^ 2 - ⟪m - O, v - O⟫_ℝ) := by
  simp only [dist_sq_coord, inner_eq_coords, signedArea2, PiLp.sub_apply]
  ring

/-- Equal squared radii make the radial projection defect nonnegative. -/
theorem distSq_sub_inner_nonneg_of_equal_distSq
    {O delta v : Plane}
    (hEqSq : dist O delta ^ 2 = dist O v ^ 2) :
    0 ≤ dist O v ^ 2 - ⟪delta - O, v - O⟫_ℝ := by
  simp only [dist_sq_coord, inner_eq_coords, PiLp.sub_apply] at hEqSq ⊢
  nlinarith only [hEqSq, sq_nonneg (delta 0 - v 0),
    sq_nonneg (delta 1 - v 1)]

/-- An equal-radius pair cannot lie in the determinant cone cut out by a
nonpositive cap turn, a radial supporting inequality, and opposite strict
turns. -/
theorem false_of_equalRadius_detCone
    {O m delta v : Plane}
    (hEqSq : dist O delta ^ 2 = dist O v ^ 2)
    (hFirst : signedArea2 O delta v < 0)
    (hCapTurn : signedArea2 O m v ≤ 0)
    (hRadialSupport : dist O v ^ 2 ≤ ⟪m - O, v - O⟫_ℝ)
    (hSecond : 0 < signedArea2 delta m v) :
    False := by
  have hOv : O ≠ v := by
    intro h
    subst v
    simp [signedArea2] at hFirst
  have hRadiusSqPos : 0 < dist O v ^ 2 :=
    sq_pos_of_pos (dist_pos.mpr hOv)
  have hProjectionDefect :
      0 ≤ dist O v ^ 2 - ⟪delta - O, v - O⟫_ℝ :=
    distSq_sub_inner_nonneg_of_equal_distSq hEqSq
  have hRadialDefect :
      dist O v ^ 2 - ⟪m - O, v - O⟫_ℝ ≤ 0 :=
    sub_nonpos.mpr hRadialSupport
  have hProjectionTerm :
      (dist O v ^ 2 - ⟪delta - O, v - O⟫_ℝ) *
          signedArea2 O m v ≤ 0 :=
    mul_nonpos_of_nonneg_of_nonpos hProjectionDefect hCapTurn
  have hFirstPos : 0 < -signedArea2 O delta v := neg_pos.mpr hFirst
  have hRadialTerm :
      (-signedArea2 O delta v) *
          (dist O v ^ 2 - ⟪m - O, v - O⟫_ℝ) ≤ 0 :=
    mul_nonpos_of_nonneg_of_nonpos hFirstPos.le hRadialDefect
  have hsum :
      (dist O v ^ 2 - ⟪delta - O, v - O⟫_ℝ) * signedArea2 O m v +
          (-signedArea2 O delta v) *
            (dist O v ^ 2 - ⟪m - O, v - O⟫_ℝ) ≤ 0 :=
    add_nonpos hProjectionTerm hRadialTerm
  have hleftNonpos :
      dist O v ^ 2 * signedArea2 delta m v ≤ 0 := by
    rw [signedArea2_detCone_identity]
    exact hsum
  have hleftPos : 0 < dist O v ^ 2 * signedArea2 delta m v :=
    mul_pos hRadiusSqPos hSecond
  exact (not_lt_of_ge hleftNonpos) hleftPos

end Geometry
end Erdos9796Proof

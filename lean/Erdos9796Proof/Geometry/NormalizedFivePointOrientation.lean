/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.Geometry.EqualRadiusDeterminantCone

/-!
# A normalized five-point orientation obstruction

This module specializes the equal-radius determinant-cone obstruction to one
normalized five-point configuration.  Its twelve hypotheses retain the fixed
coordinates, metric relations, strict orientations, and product sign of that
configuration.

The theorem is intentionally bounded.  A future geometric ingress theorem
must construct the normalization before this result can be applied to a source
configuration.
-/

open scoped InnerProductSpace

namespace Erdos9796Proof
namespace Geometry

private theorem dist_sq_coord (p q : Plane) :
    dist p q ^ 2 = (p 0 - q 0) ^ 2 + (p 1 - q 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

private theorem inner_eq_coords (u w : Plane) :
    ⟪u, w⟫_ℝ = u 0 * w 0 + u 1 * w 1 := by
  rw [PiLp.inner_apply]
  simp [Fin.sum_univ_two, mul_comm (u _) (w _)]

/-- The normalized five-point configuration formed by `O`, `m1`, `m2`,
`delta`, and `v` cannot satisfy the two strict orientations and the indicated
opposite-arc product sign while `delta` and `v` have the same squared radius
about `O`.

The twelve hypotheses are the mathematical assertions retained by the
Rigid221 S0 common-core extraction.  The theorem itself is independent of
that extraction and of the surrounding finite configuration. -/
theorem normalizedFivePoint_orientation_incompatibility
    {O m1 m2 delta v : Plane} {radiusSq : ℝ}
    (hOx : O 0 = 0)
    (hm1y : m1 1 = -(4 / 5))
    (hm2x : m2 0 = 8 / 5)
    (hm2y : m2 1 = 4 / 5)
    (hdeltaRadius : dist O delta ^ 2 = radiusSq)
    (hvRadius : dist O v ^ 2 = radiusSq)
    (hvDisk : dist (!₂[1, 0] : Plane) v ^ 2 ≤ 1)
    (hm1Boundary : dist (!₂[1, 0] : Plane) m1 ^ 2 = 1)
    (hOBoundary : dist (!₂[1, 0] : Plane) O ^ 2 = 1)
    (hdeltaVO : 0 < signedArea2 v delta O)
    (hm1DeltaV : 0 < signedArea2 delta m1 v)
    (hcapProduct :
      signedArea2 v O m1 * signedArea2 m2 O m1 ≤ 0) :
    False := by
  have hOBoundaryCoord := hOBoundary
  rw [dist_sq_coord] at hOBoundaryCoord
  simp only [Matrix.cons_val_zero, Matrix.cons_val_one, hOx] at hOBoundaryCoord
  have hOy : O 1 = 0 := by
    nlinarith only [hOBoundaryCoord, sq_nonneg (O 1)]
  have hm1BoundaryCoord := hm1Boundary
  rw [dist_sq_coord] at hm1BoundaryCoord
  simp only [Matrix.cons_val_zero, Matrix.cons_val_one, hm1y] at hm1BoundaryCoord
  have hm1xFactor : (5 * m1 0 - 8) * (5 * m1 0 - 2) = 0 := by
    nlinarith only [hm1BoundaryCoord]
  have hm1xCases : m1 0 = 8 / 5 ∨ m1 0 = 2 / 5 := by
    rcases mul_eq_zero.mp hm1xFactor with h | h
    · left
      nlinarith only [h]
    · right
      nlinarith only [h]
  have hsecondArea : 0 < signedArea2 m2 O m1 := by
    rcases hm1xCases with h | h
    · simp only [signedArea2, hm2x, hm2y, hOx, hOy, hm1y, h]
      norm_num
    · simp only [signedArea2, hm2x, hm2y, hOx, hOy, hm1y, h]
      norm_num
  have hcyclic : signedArea2 v O m1 = signedArea2 O m1 v := by
    simp only [signedArea2]
    ring
  have hcapProduct' :
      signedArea2 O m1 v * signedArea2 m2 O m1 ≤ 0 := by
    rw [← hcyclic]
    exact hcapProduct
  have hcapTurn : signedArea2 O m1 v ≤ 0 := by
    by_contra h
    have hfirstArea : 0 < signedArea2 O m1 v := lt_of_not_ge h
    have hproductPos :
        0 < signedArea2 O m1 v * signedArea2 m2 O m1 :=
      mul_pos hfirstArea hsecondArea
    exact (not_lt_of_ge hcapProduct') hproductPos
  have hvDiskCoord := hvDisk
  rw [dist_sq_coord] at hvDiskCoord
  simp only [Matrix.cons_val_zero, Matrix.cons_val_one] at hvDiskCoord
  have hvDiskNormalized : v 0 ^ 2 + v 1 ^ 2 ≤ 2 * v 0 := by
    nlinarith only [hvDiskCoord]
  have hareaCoord :
      signedArea2 O m1 v = 4 * v 0 / 5 + m1 0 * v 1 := by
    simp only [signedArea2, hOx, hOy, hm1y]
    ring
  have hcapTurnCoord : 4 * v 0 / 5 + m1 0 * v 1 ≤ 0 := by
    rw [← hareaCoord]
    exact hcapTurn
  have hradialSupportCoord :
      v 0 ^ 2 + v 1 ^ 2 ≤ m1 0 * v 0 - 4 * v 1 / 5 := by
    rcases hm1xCases with h | h
    · rw [h] at hcapTurnCoord ⊢
      nlinarith only [hvDiskNormalized, hcapTurnCoord]
    · rw [h] at hcapTurnCoord ⊢
      nlinarith only [hvDiskNormalized, hcapTurnCoord]
  have hradialSupport :
      dist O v ^ 2 ≤ ⟪m1 - O, v - O⟫_ℝ := by
    simp only [dist_sq_coord, inner_eq_coords, PiLp.sub_apply, hOx, hOy, hm1y]
    nlinarith only [hradialSupportCoord]
  have hfirstRelation :
      signedArea2 v delta O = -signedArea2 O delta v := by
    simp only [signedArea2]
    ring
  have hfirst : signedArea2 O delta v < 0 := by
    rw [hfirstRelation] at hdeltaVO
    nlinarith only [hdeltaVO]
  have hEqSq : dist O delta ^ 2 = dist O v ^ 2 :=
    hdeltaRadius.trans hvRadius.symm
  exact false_of_equalRadius_detCone hEqSq hfirst hcapTurn
    hradialSupport hm1DeltaV

end Geometry
end Erdos9796Proof

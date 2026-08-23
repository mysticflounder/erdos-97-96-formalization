/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Foundation
import Mathlib.Analysis.InnerProductSpace.PiL2

/-!
# Scaled coordinates in the Euclidean plane

This file gives a source-independent coordinate interface for a directed base
`o a` in `ℝ²`.  The longitudinal coordinate is the inner product with the base
vector, and the transverse coordinate is the signed twice-area against the
base.  Both coordinates are left scaled by the base length, so the identities
below require no division and remain valid when the base degenerates.

The determinant formulas transport signed areas through these scaled
coordinates.  The final lemmas record exactly the coordinate content supplied
by equal distances from both base endpoints and by a signed-area separation
identity; they do not introduce a geometric reflection construction.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97
namespace ATailTwoRadiusGridCoordinateGeometry

/-- The longitudinal coordinate of `p` along the directed base `o a`, scaled by
the length of the base. -/
noncomputable def scaledLongitudinalCoord (o a p : ℝ²) : ℝ :=
  ⟪a - o, p - o⟫_ℝ

/-- The transverse coordinate of `p` relative to the directed base `o a`,
scaled by the length of the base. -/
noncomputable def scaledTransverseCoord (o a p : ℝ²) : ℝ :=
  signedArea2 o a p

private lemma inner_eq_coords (u v : ℝ²) :
    ⟪u, v⟫_ℝ = u 0 * v 0 + u 1 * v 1 := by
  rw [PiLp.inner_apply]
  simp [Fin.sum_univ_two, mul_comm (u _) (v _)]

private lemma norm_sq_eq_coords (u : ℝ²) :
    ‖u‖ ^ 2 = u 0 ^ 2 + u 1 ^ 2 := by
  rw [EuclideanSpace.norm_sq_eq]
  simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs]

private lemma norm_sub_sq_pos {o a : ℝ²} (hoa : o ≠ a) :
    0 < ‖a - o‖ ^ 2 :=
  sq_pos_of_pos (norm_pos_iff.mpr (sub_ne_zero.mpr hoa.symm))

private lemma positive_right_factor_iff {c x : ℝ} (hc : 0 < c) :
    0 < c * x ↔ 0 < x := by
  constructor
  · intro hcx
    by_contra hx
    exact (not_lt_of_ge (mul_nonpos_of_nonneg_of_nonpos hc.le (le_of_not_gt hx))) hcx
  · exact mul_pos hc

/-- The squared Euclidean norm in scaled base coordinates. -/
theorem scaledCoordinate_norm_sq (o a p : ℝ²) :
    scaledLongitudinalCoord o a p ^ 2 + scaledTransverseCoord o a p ^ 2 =
      ‖a - o‖ ^ 2 * ‖p - o‖ ^ 2 := by
  rw [scaledLongitudinalCoord, scaledTransverseCoord, inner_eq_coords,
    norm_sq_eq_coords, norm_sq_eq_coords]
  simp only [signedArea2, PiLp.sub_apply]
  ring

/-- The determinant of the scaled coordinates of `p` and `q` is the signed
area of `(o, p, q)` multiplied by the squared base length. -/
theorem scaledCoordinate_det (o a p q : ℝ²) :
    scaledLongitudinalCoord o a p * scaledTransverseCoord o a q -
        scaledTransverseCoord o a p * scaledLongitudinalCoord o a q =
      ‖a - o‖ ^ 2 * signedArea2 o p q := by
  rw [scaledLongitudinalCoord, scaledLongitudinalCoord,
    scaledTransverseCoord, scaledTransverseCoord, inner_eq_coords,
    inner_eq_coords, norm_sq_eq_coords]
  simp only [signedArea2, PiLp.sub_apply]
  ring

/-- For a nondegenerate directed base, positivity of the determinant of two
scaled coordinate pairs is exactly positivity of their signed area. -/
theorem scaledCoordinate_det_pos_iff
    {o a p q : ℝ²} (hoa : o ≠ a) :
    0 < scaledLongitudinalCoord o a p * scaledTransverseCoord o a q -
        scaledTransverseCoord o a p * scaledLongitudinalCoord o a q ↔
      0 < signedArea2 o p q := by
  rw [scaledCoordinate_det]
  exact positive_right_factor_iff (norm_sub_sq_pos hoa)

/-- The coordinate determinant of any point triple transports its signed area
by the squared length of the directed base. -/
theorem scaledCoordinate_triangle_det (o a p q r : ℝ²) :
    (scaledLongitudinalCoord o a q - scaledLongitudinalCoord o a p) *
          (scaledTransverseCoord o a r - scaledTransverseCoord o a p) -
        (scaledTransverseCoord o a q - scaledTransverseCoord o a p) *
          (scaledLongitudinalCoord o a r - scaledLongitudinalCoord o a p) =
      ‖a - o‖ ^ 2 * signedArea2 p q r := by
  rw [norm_sq_eq_coords]
  simp only [scaledLongitudinalCoord, scaledTransverseCoord, inner_eq_coords,
    signedArea2, PiLp.sub_apply]
  ring

/-- For a nondegenerate directed base, positivity of a point triple's scaled
coordinate determinant is exactly positivity of the triple's signed area. -/
theorem scaledCoordinate_triangle_det_pos_iff
    {o a p q r : ℝ²} (hoa : o ≠ a) :
    0 < (scaledLongitudinalCoord o a q - scaledLongitudinalCoord o a p) *
          (scaledTransverseCoord o a r - scaledTransverseCoord o a p) -
        (scaledTransverseCoord o a q - scaledTransverseCoord o a p) *
          (scaledLongitudinalCoord o a r - scaledLongitudinalCoord o a p) ↔
      0 < signedArea2 p q r := by
  rw [scaledCoordinate_triangle_det]
  exact positive_right_factor_iff (norm_sub_sq_pos hoa)

/-- Two points equidistant from both endpoints of a base have the same scaled
longitudinal coordinate. -/
theorem scaledLongitudinalCoord_eq_of_equidistant
    {o a p q : ℝ²}
    (hop : dist o p = dist o q) (hap : dist a p = dist a q) :
    scaledLongitudinalCoord o a p = scaledLongitudinalCoord o a q := by
  have hop_sq := congrArg (fun x : ℝ ↦ x ^ 2) hop
  have hap_sq := congrArg (fun x : ℝ ↦ x ^ 2) hap
  change dist o p ^ 2 = dist o q ^ 2 at hop_sq
  change dist a p ^ 2 = dist a q ^ 2 at hap_sq
  rw [dist_sq_coord, dist_sq_coord] at hop_sq hap_sq
  simp only [scaledLongitudinalCoord, inner_eq_coords, PiLp.sub_apply]
  nlinarith

/-- Cyclically rotating the arguments of `signedArea2` gives the scaled
transverse coordinate. -/
theorem scaledTransverseCoord_eq_signedArea2_cyclic (o a p : ℝ²) :
    scaledTransverseCoord o a p = signedArea2 p o a := by
  simp only [scaledTransverseCoord, signedArea2]
  ring

/-- A signed-area separation identity in cyclic ordering says precisely that
the two scaled transverse coordinates are negatives. -/
theorem scaledTransverseCoord_eq_neg_of_signedArea2_eq_neg
    {o a p q : ℝ²}
    (harea : signedArea2 p o a = -signedArea2 q o a) :
    scaledTransverseCoord o a p = -scaledTransverseCoord o a q := by
  rw [scaledTransverseCoord_eq_signedArea2_cyclic,
    scaledTransverseCoord_eq_signedArea2_cyclic]
  exact harea

/-- Equal distances from both base endpoints, together with cyclic signed-area
separation, put a point pair at equal longitudinal and opposite transverse
scaled coordinates. -/
theorem scaledCoordinates_reflect_of_equidistant_of_signedArea2_eq_neg
    {o a p q : ℝ²}
    (hop : dist o p = dist o q) (hap : dist a p = dist a q)
    (harea : signedArea2 p o a = -signedArea2 q o a) :
    scaledLongitudinalCoord o a p = scaledLongitudinalCoord o a q ∧
      scaledTransverseCoord o a p = -scaledTransverseCoord o a q :=
  ⟨scaledLongitudinalCoord_eq_of_equidistant hop hap,
    scaledTransverseCoord_eq_neg_of_signedArea2_eq_neg harea⟩

end ATailTwoRadiusGridCoordinateGeometry
end Problem97

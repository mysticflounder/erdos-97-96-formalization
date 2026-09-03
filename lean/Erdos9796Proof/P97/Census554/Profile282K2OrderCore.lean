/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EquilateralHingeCollisions

/-!
# Lower-right circle order obstruction

This module isolates the four mathematical facts found inside the profile-282
named-assumption core.  The result is stated for an arbitrary lower-right
circle center; the profile normalization is a direct specialization.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- A point on the circle through `(1, 0)` whose center is strictly below and
to its right cannot lie strictly to the left of both oriented rays ending at
`(1, 0)`. -/
theorem normalized_lowerRightCircle_order_incompatibility
    {s r : ℝ} {v : ℝ²}
    (hs : 0 < s)
    (hr : 0 < r)
    (hcircle :
      dist (pt (1 + s) (-r)) v =
        dist (pt (1 + s) (-r)) (pt 1 0))
    (hbase : 0 < signedArea2 (pt 0 0) (pt 1 0) v)
    (hcenter : 0 < signedArea2 (pt (1 + s) (-r)) (pt 1 0) v) :
    False := by
  have hcircleSq := congrArg (fun d : ℝ ↦ d ^ 2) hcircle
  change
    dist (pt (1 + s) (-r)) v ^ 2 =
      dist (pt (1 + s) (-r)) (pt 1 0) ^ 2 at hcircleSq
  rw [dist_sq_coord, dist_sq_coord] at hcircleSq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hcircleSq
  have hbaseFormula : signedArea2 (pt 0 0) (pt 1 0) v = v 1 := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    ring
  have hcenterFormula :
      signedArea2 (pt (1 + s) (-r)) (pt 1 0) v =
        r * (1 - v 0) - s * v 1 := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    ring
  rw [hbaseFormula] at hbase
  rw [hcenterFormula] at hcenter
  have hs_y : 0 < s * v 1 := mul_pos hs hbase
  have ht : 0 < 1 - v 0 := by
    by_contra h
    have ht_nonpos : 1 - v 0 ≤ 0 := le_of_not_gt h
    have hr_t_nonpos : r * (1 - v 0) ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos hr.le ht_nonpos
    linarith
  have hs_t : 0 < s * (1 - v 0) := mul_pos hs ht
  have hr_y : 0 < r * v 1 := mul_pos hr hbase
  nlinarith [sq_nonneg (1 - v 0), sq_nonneg (v 1)]

/-- The center `(3/2, -r)` specialization appearing in the profile-282 mirror
order.  No equation fixing the magnitude of `r` is needed. -/
theorem normalized_threeHalvesLowerCircle_order_incompatibility
    {r : ℝ} {v : ℝ²}
    (hr : 0 < r)
    (hcircle :
      dist (pt (3 / 2) (-r)) v =
        dist (pt (3 / 2) (-r)) (pt 1 0))
    (hbase : 0 < signedArea2 (pt 0 0) (pt 1 0) v)
    (hcenter : 0 < signedArea2 (pt (3 / 2) (-r)) (pt 1 0) v) :
    False := by
  have hthreeHalves : (3 / 2 : ℝ) = 1 + 1 / 2 := by norm_num
  rw [hthreeHalves] at hcircle hcenter
  exact normalized_lowerRightCircle_order_incompatibility
    (by norm_num : (0 : ℝ) < 1 / 2) hr hcircle hbase hcenter

/-- Reflected form: a circle center strictly above and to the right of
`(1, 0)` is incompatible with both displayed strict clockwise turns. -/
theorem normalized_upperRightCircle_order_incompatibility
    {s r : ℝ} {v : ℝ²}
    (hs : 0 < s)
    (hr : 0 < r)
    (hcircle :
      dist (pt (1 + s) r) v =
        dist (pt (1 + s) r) (pt 1 0))
    (hbase : signedArea2 (pt 0 0) (pt 1 0) v < 0)
    (hcenter : signedArea2 (pt (1 + s) r) (pt 1 0) v < 0) :
    False := by
  have hcircleSq := congrArg (fun d : ℝ ↦ d ^ 2) hcircle
  change
    dist (pt (1 + s) r) v ^ 2 =
      dist (pt (1 + s) r) (pt 1 0) ^ 2 at hcircleSq
  rw [dist_sq_coord, dist_sq_coord] at hcircleSq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hcircleSq
  have hbaseFormula : signedArea2 (pt 0 0) (pt 1 0) v = v 1 := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    ring
  have hcenterFormula :
      signedArea2 (pt (1 + s) r) (pt 1 0) v =
        r * (v 0 - 1) - s * v 1 := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    ring
  rw [hbaseFormula] at hbase
  rw [hcenterFormula] at hcenter
  have hs_neg_y : 0 < s * (-v 1) := mul_pos hs (neg_pos.mpr hbase)
  have ht : 0 < 1 - v 0 := by
    by_contra h
    have ht_nonpos : 1 - v 0 ≤ 0 := le_of_not_gt h
    have hr_t_nonpos : r * (1 - v 0) ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos hr.le ht_nonpos
    nlinarith
  have hs_t : 0 < s * (1 - v 0) := mul_pos hs ht
  have hr_neg_y : 0 < r * (-v 1) := mul_pos hr (neg_pos.mpr hbase)
  nlinarith [sq_nonneg (1 - v 0), sq_nonneg (v 1)]

/-- The center `(3/2, r)` specialization matching the reflected source order. -/
theorem normalized_threeHalvesUpperCircle_order_incompatibility
    {r : ℝ} {v : ℝ²}
    (hr : 0 < r)
    (hcircle :
      dist (pt (3 / 2) r) v =
        dist (pt (3 / 2) r) (pt 1 0))
    (hbase : signedArea2 (pt 0 0) (pt 1 0) v < 0)
    (hcenter : signedArea2 (pt (3 / 2) r) (pt 1 0) v < 0) :
    False := by
  have hthreeHalves : (3 / 2 : ℝ) = 1 + 1 / 2 := by norm_num
  rw [hthreeHalves] at hcircle hcenter
  exact normalized_upperRightCircle_order_incompatibility
    (by norm_num : (0 : ℝ) < 1 / 2) hr hcircle hbase hcenter

end EqualityCore
end Census554
end Problem97

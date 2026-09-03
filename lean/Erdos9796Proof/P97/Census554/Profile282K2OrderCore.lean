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

/-- Two adjacent equilateral fans force the second center to `(3/2, y)`.
If a point on its circle has both displayed turns opposed to the center's
base turn, the lower-right and upper-right obstructions cover the two signs. -/
theorem normalized_twoEquilateralCircle_opposedTurns_false
    {A Q v : ℝ²}
    (hBA_BO : dist (pt 0 0) A = dist (pt 0 0) (pt 1 0))
    (hOA_OB : dist (pt 1 0) A = dist (pt 1 0) (pt 0 0))
    (hOQ_OA : dist (pt 1 0) Q = dist (pt 1 0) A)
    (hQO_QA : dist Q (pt 1 0) = dist Q A)
    (hQ_ne_B : Q ≠ pt 0 0)
    (hQv_QO : dist Q v = dist Q (pt 1 0))
    (hbaseOpposed :
      signedArea2 (pt 0 0) (pt 1 0) Q *
          signedArea2 (pt 0 0) (pt 1 0) v < 0)
    (hcenterOpposed :
      signedArea2 (pt 0 0) (pt 1 0) Q *
          signedArea2 Q (pt 1 0) v < 0) :
    False := by
  have hAcoords :=
    normalized_equilateralHinge_coordinates hBA_BO.symm hOA_OB.symm
  have hOQsq := congrArg (fun d : ℝ ↦ d ^ 2) hOQ_OA
  have hQO_QAsq := congrArg (fun d : ℝ ↦ d ^ 2) hQO_QA
  change
    dist (pt 1 0) Q ^ 2 = dist (pt 1 0) A ^ 2 at hOQsq
  change dist Q (pt 1 0) ^ 2 = dist Q A ^ 2 at hQO_QAsq
  rw [dist_sq_coord, dist_sq_coord] at hOQsq hQO_QAsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hOQsq hQO_QAsq
  rcases hAcoords with ⟨hAx, hAy⟩
  rw [hAx] at hOQsq hQO_QAsq
  have hQlinear : Q 0 = 2 * A 1 * Q 1 := by
    nlinarith only [hOQsq, hQO_QAsq, hAy]
  have hQfactor : Q 1 * (Q 1 - A 1) = 0 := by
    nlinarith only [hOQsq, hAy, hQlinear]
  have hQy_ne : Q 1 ≠ 0 := by
    intro hQy
    have hQx : Q 0 = 0 := by rw [hQy] at hQlinear; norm_num at hQlinear ⊢; exact hQlinear
    apply hQ_ne_B
    apply PiLp.ext
    intro i
    fin_cases i
    · simpa [pt] using hQx
    · simpa [pt] using hQy
  have hQy_eq : Q 1 = A 1 :=
    sub_eq_zero.mp ((mul_eq_zero.mp hQfactor).resolve_left hQy_ne)
  have hQx : Q 0 = 3 / 2 := by
    rw [hQy_eq] at hQlinear
    nlinarith only [hQlinear, hAy]
  have hQpoint : Q = pt (3 / 2) (Q 1) := by
    apply PiLp.ext
    intro i
    fin_cases i
    · simpa [pt] using hQx
    · simp [pt]
  have hbaseQ : signedArea2 (pt 0 0) (pt 1 0) Q = Q 1 := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    ring
  have hbaseV : signedArea2 (pt 0 0) (pt 1 0) v = v 1 := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    ring
  rw [hbaseQ, hbaseV] at hbaseOpposed
  rw [hbaseQ] at hcenterOpposed
  rcases lt_or_gt_of_ne hQy_ne with hQneg | hQpos
  · have hvpos : 0 < v 1 := by
      by_contra h
      have hnonneg : 0 ≤ Q 1 * v 1 :=
        mul_nonneg_of_nonpos_of_nonpos hQneg.le (le_of_not_gt h)
      exact (not_lt_of_ge hnonneg) hbaseOpposed
    have hcenterPos : 0 < signedArea2 Q (pt 1 0) v := by
      by_contra h
      have hnonneg :
          0 ≤ Q 1 * signedArea2 Q (pt 1 0) v :=
        mul_nonneg_of_nonpos_of_nonpos hQneg.le (le_of_not_gt h)
      exact (not_lt_of_ge hnonneg) hcenterOpposed
    rw [hQpoint] at hQv_QO hcenterPos
    exact normalized_threeHalvesLowerCircle_order_incompatibility
      (r := -Q 1) (v := v) (neg_pos.mpr hQneg) (by simpa using hQv_QO)
      (by simpa [hbaseV] using hvpos) (by simpa using hcenterPos)
  · have hvneg : v 1 < 0 := by
      by_contra h
      have hnonneg : 0 ≤ Q 1 * v 1 :=
        mul_nonneg hQpos.le (le_of_not_gt h)
      exact (not_lt_of_ge hnonneg) hbaseOpposed
    have hcenterNeg : signedArea2 Q (pt 1 0) v < 0 := by
      by_contra h
      have hnonneg :
          0 ≤ Q 1 * signedArea2 Q (pt 1 0) v :=
        mul_nonneg hQpos.le (le_of_not_gt h)
      exact (not_lt_of_ge hnonneg) hcenterOpposed
    rw [hQpoint] at hQv_QO hcenterNeg
    exact normalized_threeHalvesUpperCircle_order_incompatibility
      (r := Q 1) (v := v) hQpos hQv_QO
      (by simpa [hbaseV] using hvneg) hcenterNeg

/-- Coordinate-free source form of the adjacent-equilateral circle-order
obstruction. -/
theorem twoEquilateralCircle_opposedTurns_false
    {B O A Q v : ℝ²}
    (hBO_ne : B ≠ O)
    (hBA_BO : dist B A = dist B O)
    (hOA_OB : dist O A = dist O B)
    (hOQ_OA : dist O Q = dist O A)
    (hQO_QA : dist Q O = dist Q A)
    (hQ_ne_B : Q ≠ B)
    (hQv_QO : dist Q v = dist Q O)
    (hbaseOpposed : signedArea2 B O Q * signedArea2 B O v < 0)
    (hcenterOpposed : signedArea2 B O Q * signedArea2 Q O v < 0) :
    False := by
  let T : ℝ² → ℝ² := normSim B O
  have hdist (X Y : ℝ²) :
      dist (T X) (T Y) = (dist B O)⁻¹ * dist X Y := by
    simpa [T] using normSim_dist_image B O hBO_ne X Y
  have hT_B : T B = pt 0 0 := by
    simpa [T] using normSim_fst B O
  have hT_O : T O = pt 1 0 := by
    simpa [T] using normSim_snd B O hBO_ne
  have hbase_sq_pos : 0 < (O 0 - B 0) ^ 2 + (O 1 - B 1) ^ 2 := by
    rw [← dist_sq_coord O B]
    exact sq_pos_of_pos (dist_pos.mpr hBO_ne.symm)
  let k : ℝ := ((O 0 - B 0) ^ 2 + (O 1 - B 1) ^ 2)⁻¹
  have hk : 0 < k := inv_pos.mpr hbase_sq_pos
  have map_dist_eq {W X Y Z : ℝ²} (h : dist W X = dist Y Z) :
      dist (T W) (T X) = dist (T Y) (T Z) := by
    rw [hdist, hdist, h]
  have map_ne {X Y : ℝ²} (hXY : X ≠ Y) : T X ≠ T Y := by
    intro hTXY
    have hzero : (dist B O)⁻¹ * dist X Y = 0 := by
      rw [← hdist]
      exact dist_eq_zero.mpr hTXY
    have hdist_ne : (dist B O)⁻¹ ≠ 0 :=
      inv_ne_zero (ne_of_gt (dist_pos.mpr hBO_ne))
    exact hXY (dist_eq_zero.mp ((mul_eq_zero.mp hzero).resolve_left hdist_ne))
  have map_area (X Y Z : ℝ²) :
      signedArea2 (T X) (T Y) (T Z) = k * signedArea2 X Y Z := by
    dsimp only [T, k]
    exact signedArea2_normSim B O hBO_ne X Y Z
  have map_area_product_neg
      {X Y Z U V W : ℝ²}
      (h : signedArea2 X Y Z * signedArea2 U V W < 0) :
      signedArea2 (T X) (T Y) (T Z) *
          signedArea2 (T U) (T V) (T W) < 0 := by
    rw [map_area, map_area]
    calc
      (k * signedArea2 X Y Z) * (k * signedArea2 U V W) =
          k ^ 2 * (signedArea2 X Y Z * signedArea2 U V W) := by ring
      _ < 0 := mul_neg_of_pos_of_neg (sq_pos_of_pos hk) h
  apply normalized_twoEquilateralCircle_opposedTurns_false (A := T A)
  · simpa only [hT_B, hT_O] using
      map_dist_eq (W := B) (X := A) (Y := B) (Z := O) hBA_BO
  · simpa only [hT_B, hT_O] using
      map_dist_eq (W := O) (X := A) (Y := O) (Z := B) hOA_OB
  · simpa only [hT_O] using
      map_dist_eq (W := O) (X := Q) (Y := O) (Z := A) hOQ_OA
  · simpa only [hT_O] using
      map_dist_eq (W := Q) (X := O) (Y := Q) (Z := A) hQO_QA
  · simpa only [hT_B] using map_ne hQ_ne_B
  · simpa only [hT_O] using
      map_dist_eq (W := Q) (X := v) (Y := Q) (Z := O) hQv_QO
  · simpa only [hT_B, hT_O] using map_area_product_neg hbaseOpposed
  · simpa only [hT_B, hT_O] using map_area_product_neg hcenterOpposed

end EqualityCore
end Census554
end Problem97

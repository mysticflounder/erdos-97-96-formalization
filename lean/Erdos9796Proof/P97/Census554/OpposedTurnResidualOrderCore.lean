/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.Profile282K2OrderCore

/-!
# Opposed-turn residual order core

This module isolates the scalar contradiction carried by the small
family-13 core of the exact-five opposed-turn residual computation.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- A normalized `K2`-row point cannot satisfy both strict half-plane
constraints selected by the family-13 residual core. -/
theorem normalized_K2Row_above_left_incompatibility
    {r x y : ℝ}
    (hnorm : 4 * r ^ 2 = 3)
    (hr : 0 < r)
    (hrow : -2 - 2 * r * y + 3 * x - x ^ 2 - y ^ 2 = 0)
    (habove : 0 < r + y)
    (hleft : 0 < -r * x - y / 2) :
    False := by
  have hx : x < 1 / 2 := by
    by_contra hxNot
    have hxLower : 1 / 2 ≤ x := le_of_not_gt hxNot
    have hprod : 0 ≤ r * (x - 1 / 2) :=
      mul_nonneg hr.le (sub_nonneg.mpr hxLower)
    nlinarith
  have hcircle : (x - 3 / 2) ^ 2 + (y + r) ^ 2 = 1 := by
    nlinarith
  have hxSquare : 1 < (x - 3 / 2) ^ 2 := by
    nlinarith [sq_nonneg (1 / 2 - x)]
  nlinarith [sq_nonneg (y + r)]

/-- A unit-circle point strictly below the horizontal axis cannot lie beyond
the displayed positive-radius ray.  This is the scalar core selected from the
family-12 residual. -/
theorem unitCircle_below_rightRay_incompatibility
    {r x y : ℝ}
    (hr : 0 < r)
    (hcircle : 1 - x ^ 2 - y ^ 2 = 0)
    (hray : 0 < -r + r * x + y / 2)
    (hbelow : 0 < -y) :
    False := by
  have hx : 1 < x := by
    by_contra hxNot
    have hxUpper : x ≤ 1 := le_of_not_gt hxNot
    have hprod : r * (x - 1) ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos hr.le (sub_nonpos.mpr hxUpper)
    nlinarith
  nlinarith [sq_nonneg (x - 1), sq_nonneg y]

/-- Two adjacent equilateral triangles and a point on the second apex circle
cannot realize the two displayed negative turns in a positive base orientation. -/
theorem adjacentEquilateralTriangles_circlePoint_negativeTurns_false
    {B O A Q v : ℝ²}
    (hBO_ne : B ≠ O)
    (hBA_BO : dist B A = dist B O)
    (hOA_OB : dist O A = dist O B)
    (hOQ_OA : dist O Q = dist O A)
    (hQO_QA : dist Q O = dist Q A)
    (hQ_ne_B : Q ≠ B)
    (hQv_QO : dist Q v = dist Q O)
    (hBOA : 0 < signedArea2 B O A)
    (hAQv : signedArea2 A Q v < 0)
    (hABv : signedArea2 A B v < 0) :
    False := by
  let T : ℝ² → ℝ² := normSim B O
  let F : ℝ² → ℝ² := fun X ↦ reflectXAxis (T X)
  let r : ℝ := Real.sqrt 3 / 2
  have hr_sq : r ^ 2 = 3 / 4 := by
    dsimp only [r]
    rw [div_pow, Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 3)]
    norm_num
  have hr : 0 < r := by
    dsimp only [r]
    positivity
  have hdist (X Y : ℝ²) :
      dist (T X) (T Y) = (dist B O)⁻¹ * dist X Y := by
    simpa [T] using normSim_dist_image B O hBO_ne X Y
  have map_dist_eq {W X Y Z : ℝ²} (h : dist W X = dist Y Z) :
      dist (F W) (F X) = dist (F Y) (F Z) := by
    simp only [F, dist_reflectXAxis]
    rw [hdist, hdist, h]
  have map_ne {X Y : ℝ²} (hXY : X ≠ Y) : T X ≠ T Y := by
    intro hTXY
    have hzero : (dist B O)⁻¹ * dist X Y = 0 := by
      rw [← hdist]
      exact dist_eq_zero.mpr hTXY
    have hscale_ne : (dist B O)⁻¹ ≠ 0 :=
      inv_ne_zero (ne_of_gt (dist_pos.mpr hBO_ne))
    exact hXY (dist_eq_zero.mp ((mul_eq_zero.mp hzero).resolve_left hscale_ne))
  have hT_B : T B = pt 0 0 := by
    simpa [T] using normSim_fst B O
  have hT_O : T O = pt 1 0 := by
    simpa [T] using normSim_snd B O hBO_ne
  have hBO_AB : dist B O = dist A B := by
    calc
      dist B O = dist B A := hBA_BO.symm
      _ = dist A B := dist_comm _ _
  have hBO_OA : dist B O = dist O A := by
    calc
      dist B O = dist O B := dist_comm _ _
      _ = dist O A := hOA_OB.symm
  have hT_A : T A = pt (1 / 2) r := by
    simpa [T, r] using normSim_thd B O A hBO_ne hBO_AB hBO_OA hBOA
  have hOQ_OA_map : dist (T O) (T Q) = dist (T O) (T A) := by
    rw [hdist, hdist, hOQ_OA]
  have hQO_QA_map : dist (T Q) (T O) = dist (T Q) (T A) := by
    rw [hdist, hdist, hQO_QA]
  have hOQsq := congrArg (fun d : ℝ ↦ d ^ 2) hOQ_OA_map
  have hQOsq := congrArg (fun d : ℝ ↦ d ^ 2) hQO_QA_map
  simp only [hT_O, hT_A] at hOQsq hQOsq
  change
    dist (pt 1 0) (T Q) ^ 2 = dist (pt 1 0) (pt (1 / 2) r) ^ 2 at hOQsq
  change
    dist (T Q) (pt 1 0) ^ 2 = dist (T Q) (pt (1 / 2) r) ^ 2 at hQOsq
  rw [dist_sq_coord, dist_sq_coord] at hOQsq hQOsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hOQsq hQOsq
  have hQlinear : (T Q) 0 = 2 * r * (T Q) 1 := by
    nlinarith only [hOQsq, hQOsq, hr_sq]
  have hQfactor : (T Q) 1 * ((T Q) 1 - r) = 0 := by
    nlinarith only [hOQsq, hQlinear, hr_sq]
  have hQy_ne : (T Q) 1 ≠ 0 := by
    intro hQy
    have hQx : (T Q) 0 = 0 := by
      rw [hQy] at hQlinear
      norm_num at hQlinear ⊢
      exact hQlinear
    apply map_ne hQ_ne_B
    rw [hT_B]
    apply PiLp.ext
    intro i
    fin_cases i
    · simpa [pt] using hQx
    · simpa [pt] using hQy
  have hQy : (T Q) 1 = r :=
    sub_eq_zero.mp ((mul_eq_zero.mp hQfactor).resolve_left hQy_ne)
  have hQx : (T Q) 0 = 3 / 2 := by
    rw [hQy] at hQlinear
    nlinarith only [hQlinear, hr_sq]
  have hT_Q : T Q = pt (3 / 2) r := by
    apply PiLp.ext
    intro i
    fin_cases i
    · simpa [pt] using hQx
    · simpa [pt] using hQy
  have hF_B : F B = pt 0 0 := by
    simp [F, hT_B, reflectXAxis, pt]
  have hF_O : F O = pt 1 0 := by
    simp [F, hT_O, reflectXAxis, pt]
  have hF_A : F A = pt (1 / 2) (-r) := by
    simp [F, hT_A, reflectXAxis, pt]
  have hF_Q : F Q = pt (3 / 2) (-r) := by
    simp [F, hT_Q, reflectXAxis, pt]
  have hbase_sq_pos : 0 < (O 0 - B 0) ^ 2 + (O 1 - B 1) ^ 2 := by
    rw [← dist_sq_coord O B]
    exact sq_pos_of_pos (dist_pos.mpr hBO_ne.symm)
  let k : ℝ := ((O 0 - B 0) ^ 2 + (O 1 - B 1) ^ 2)⁻¹
  have hk : 0 < k := inv_pos.mpr hbase_sq_pos
  have map_area (X Y Z : ℝ²) :
      signedArea2 (F X) (F Y) (F Z) = -(k * signedArea2 X Y Z) := by
    dsimp only [F, T, k]
    rw [signedArea2_reflectXAxis, signedArea2_normSim B O hBO_ne]
  have map_negative_to_positive {X Y Z : ℝ²} (h : signedArea2 X Y Z < 0) :
      0 < signedArea2 (F X) (F Y) (F Z) := by
    rw [map_area]
    exact neg_pos.mpr (mul_neg_of_pos_of_neg hk h)
  have hAQv_map := map_negative_to_positive hAQv
  have hABv_map := map_negative_to_positive hABv
  rw [hF_A, hF_Q] at hAQv_map
  rw [hF_A, hF_B] at hABv_map
  have habove : 0 < r + (F v) 1 := by
    have hformula :
        signedArea2 (pt (1 / 2) (-r)) (pt (3 / 2) (-r)) (F v) =
          r + (F v) 1 := by
      simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
      ring
    rwa [hformula] at hAQv_map
  have hleft : 0 < -r * (F v) 0 - (F v) 1 / 2 := by
    have hformula :
        signedArea2 (pt (1 / 2) (-r)) (pt 0 0) (F v) =
          -r * (F v) 0 - (F v) 1 / 2 := by
      simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
      ring
    rwa [hformula] at hABv_map
  have hQv_map := map_dist_eq hQv_QO
  rw [hF_Q, hF_O] at hQv_map
  have hQv_sq := congrArg (fun d : ℝ ↦ d ^ 2) hQv_map
  change
    dist (pt (3 / 2) (-r)) (F v) ^ 2 =
      dist (pt (3 / 2) (-r)) (pt 1 0) ^ 2 at hQv_sq
  rw [dist_sq_coord, dist_sq_coord] at hQv_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hQv_sq
  have hnorm : 4 * r ^ 2 = 3 := by nlinarith only [hr_sq]
  have hrow :
      -2 - 2 * r * (F v) 1 + 3 * (F v) 0 - (F v) 0 ^ 2 - (F v) 1 ^ 2 = 0 := by
    nlinarith only [hQv_sq, hnorm]
  exact normalized_K2Row_above_left_incompatibility hnorm hr hrow habove hleft

end EqualityCore
end Census554
end Problem97

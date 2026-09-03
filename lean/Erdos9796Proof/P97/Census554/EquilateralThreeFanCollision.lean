/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EquilateralHingeCollisions

/-!
# Collision forced by three equilateral fans

This module isolates the normalized Euclidean calculation used by a Census-554
source cell.  Three compatible equilateral fans force the last ordered triple
onto a line.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Over the normalized base, the indicated three equilateral fans and orientation
signs force the last triple onto a line. -/
theorem normalized_threeFan_signedArea2_eq_zero
    {A S Q : ℝ²}
    (hOA_OB : dist (pt 1 0) A = dist (pt 1 0) (pt 0 0))
    (hOS_OA : dist (pt 1 0) S = dist (pt 1 0) A)
    (hOQ_OA : dist (pt 1 0) Q = dist (pt 1 0) A)
    (hBA_BO : dist (pt 0 0) A = dist (pt 0 0) (pt 1 0))
    (hBS_BO : dist (pt 0 0) S = dist (pt 0 0) (pt 1 0))
    (hQO_QA : dist Q (pt 1 0) = dist Q A)
    (hBSO : 0 < signedArea2 (pt 0 0) S (pt 1 0))
    (hBOA : 0 < signedArea2 (pt 0 0) (pt 1 0) A)
    (hBOQ : 0 < signedArea2 (pt 0 0) (pt 1 0) Q) :
    signedArea2 S (pt 1 0) Q = 0 := by
  have hAcoords := normalized_equilateralHinge_coordinates hBA_BO.symm hOA_OB.symm
  have hOS_OB : dist (pt 1 0) S = dist (pt 1 0) (pt 0 0) :=
    hOS_OA.trans hOA_OB
  have hScoords := normalized_equilateralHinge_coordinates hBS_BO.symm hOS_OB.symm
  have hOQsq := congrArg (fun r : ℝ ↦ r ^ 2) hOQ_OA
  have hQO_QAsq := congrArg (fun r : ℝ ↦ r ^ 2) hQO_QA
  change dist (pt 1 0) Q ^ 2 = dist (pt 1 0) A ^ 2 at hOQsq
  change dist Q (pt 1 0) ^ 2 = dist Q A ^ 2 at hQO_QAsq
  rw [dist_sq_coord, dist_sq_coord] at hOQsq hQO_QAsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hOQsq hQO_QAsq
  rcases hAcoords with ⟨hAx, hAy⟩
  rcases hScoords with ⟨hSx, hSy⟩
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hBSO hBOA hBOQ ⊢
  have hSy_negAy : S 1 = -A 1 := by
    nlinarith [sq_nonneg (S 1 + A 1)]
  rw [hAx] at hOQsq hQO_QAsq
  rw [hSx, hSy_negAy] at ⊢
  have hQy_mul_area :
      Q 1 * ((1 - 1 / 2) * (Q 1 + A 1) - (Q 0 - 1 / 2) * A 1) = 0 := by
    grobner
  nlinarith

/-- Adding strict positive orientation of the forced collinear triple is impossible. -/
theorem normalized_threeFan_false_of_signedArea2_pos
    {A S Q : ℝ²}
    (hOA_OB : dist (pt 1 0) A = dist (pt 1 0) (pt 0 0))
    (hOS_OA : dist (pt 1 0) S = dist (pt 1 0) A)
    (hOQ_OA : dist (pt 1 0) Q = dist (pt 1 0) A)
    (hBA_BO : dist (pt 0 0) A = dist (pt 0 0) (pt 1 0))
    (hBS_BO : dist (pt 0 0) S = dist (pt 0 0) (pt 1 0))
    (hQO_QA : dist Q (pt 1 0) = dist Q A)
    (hBSO : 0 < signedArea2 (pt 0 0) S (pt 1 0))
    (hBOA : 0 < signedArea2 (pt 0 0) (pt 1 0) A)
    (hBOQ : 0 < signedArea2 (pt 0 0) (pt 1 0) Q)
    (hSOQ : 0 < signedArea2 S (pt 1 0) Q) : False := by
  have hzero := normalized_threeFan_signedArea2_eq_zero
    hOA_OB hOS_OA hOQ_OA hBA_BO hBS_BO hQO_QA hBSO hBOA hBOQ
  linarith

/-- Over the normalized base, distinct equilateral apexes force the last triple
onto a line without choosing orientation signs. -/
theorem normalized_threeFan_signedArea2_eq_zero_of_distinct
    {A S Q : ℝ²}
    (hOA_OB : dist (pt 1 0) A = dist (pt 1 0) (pt 0 0))
    (hOS_OA : dist (pt 1 0) S = dist (pt 1 0) A)
    (hOQ_OA : dist (pt 1 0) Q = dist (pt 1 0) A)
    (hBA_BO : dist (pt 0 0) A = dist (pt 0 0) (pt 1 0))
    (hBS_BO : dist (pt 0 0) S = dist (pt 0 0) (pt 1 0))
    (hQO_QA : dist Q (pt 1 0) = dist Q A)
    (hAS_ne : A ≠ S)
    (hBQ_ne : pt 0 0 ≠ Q) :
    signedArea2 S (pt 1 0) Q = 0 := by
  have hAcoords := normalized_equilateralHinge_coordinates hBA_BO.symm hOA_OB.symm
  have hOS_OB : dist (pt 1 0) S = dist (pt 1 0) (pt 0 0) :=
    hOS_OA.trans hOA_OB
  have hScoords := normalized_equilateralHinge_coordinates hBS_BO.symm hOS_OB.symm
  have hAy_ne_Sy : A 1 ≠ S 1 := by
    intro hAy_Sy
    apply hAS_ne
    apply PiLp.ext
    intro i
    fin_cases i
    · exact hAcoords.1.trans hScoords.1.symm
    · exact hAy_Sy
  have hSy_negAy : S 1 = -A 1 := by
    have hfactor : (S 1 - A 1) * (S 1 + A 1) = 0 := by
      nlinarith [hAcoords.2, hScoords.2]
    rcases mul_eq_zero.mp hfactor with hsame | hopp
    · exact (hAy_ne_Sy (by linarith)).elim
    · linarith
  have hOQsq := congrArg (fun r : ℝ ↦ r ^ 2) hOQ_OA
  have hQO_QAsq := congrArg (fun r : ℝ ↦ r ^ 2) hQO_QA
  change dist (pt 1 0) Q ^ 2 = dist (pt 1 0) A ^ 2 at hOQsq
  change dist Q (pt 1 0) ^ 2 = dist Q A ^ 2 at hQO_QAsq
  rw [dist_sq_coord, dist_sq_coord] at hOQsq hQO_QAsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hOQsq hQO_QAsq
  rcases hAcoords with ⟨hAx, hAy⟩
  rcases hScoords with ⟨hSx, hSy⟩
  rw [hAx] at hOQsq hQO_QAsq
  have hQy_ne : Q 1 ≠ 0 := by
    intro hQy
    rw [hQy] at hQO_QAsq
    have hQx : Q 0 = 0 := by
      nlinarith [hQO_QAsq, hAy]
    apply hBQ_ne
    apply PiLp.ext
    intro i
    fin_cases i
    · simpa [pt] using hQx.symm
    · simpa [pt] using hQy.symm
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
  rw [hSx, hSy_negAy]
  have hQy_mul_area :
      Q 1 * ((1 - 1 / 2) * (Q 1 + A 1) - (Q 0 - 1 / 2) * A 1) = 0 := by
    grobner
  have harea := (mul_eq_zero.mp hQy_mul_area).resolve_left hQy_ne
  nlinarith

/-- The three-fan collision transported from an arbitrary nondegenerate base. -/
theorem threeFan_signedArea2_eq_zero
    {B O A S Q : ℝ²}
    (hBO_ne : B ≠ O)
    (hOA_OB : dist O A = dist O B)
    (hOS_OA : dist O S = dist O A)
    (hOQ_OA : dist O Q = dist O A)
    (hBA_BO : dist B A = dist B O)
    (hBS_BO : dist B S = dist B O)
    (hQO_QA : dist Q O = dist Q A)
    (hBSO : 0 < signedArea2 B S O)
    (hBOA : 0 < signedArea2 B O A)
    (hBOQ : 0 < signedArea2 B O Q) :
    signedArea2 S O Q = 0 := by
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
  have map_dist_eq {W X Y Z : ℝ²} (h : dist W X = dist Y Z) :
      dist (T W) (T X) = dist (T Y) (T Z) := by
    rw [hdist, hdist, h]
  have map_area_pos {X Y Z : ℝ²} (h : 0 < signedArea2 X Y Z) :
      0 < signedArea2 (T X) (T Y) (T Z) := by
    dsimp only [T]
    rw [signedArea2_normSim B O hBO_ne]
    exact mul_pos (inv_pos.mpr hbase_sq_pos) h
  have himage_normalized : signedArea2 (T S) (pt 1 0) (T Q) = 0 := by
    apply normalized_threeFan_signedArea2_eq_zero (A := T A)
    · simpa only [hT_B, hT_O] using
        map_dist_eq (W := O) (X := A) (Y := O) (Z := B) hOA_OB
    · simpa only [hT_O] using
        map_dist_eq (W := O) (X := S) (Y := O) (Z := A) hOS_OA
    · simpa only [hT_O] using
        map_dist_eq (W := O) (X := Q) (Y := O) (Z := A) hOQ_OA
    · simpa only [hT_B, hT_O] using
        map_dist_eq (W := B) (X := A) (Y := B) (Z := O) hBA_BO
    · simpa only [hT_B, hT_O] using
        map_dist_eq (W := B) (X := S) (Y := B) (Z := O) hBS_BO
    · simpa only [hT_O] using
        map_dist_eq (W := Q) (X := O) (Y := Q) (Z := A) hQO_QA
    · simpa only [hT_B, hT_O] using map_area_pos hBSO
    · simpa only [hT_B, hT_O] using map_area_pos hBOA
    · simpa only [hT_B, hT_O] using map_area_pos hBOQ
  have himage : signedArea2 (T S) (T O) (T Q) = 0 := by
    simpa only [hT_O] using himage_normalized
  rw [signedArea2_normSim B O hBO_ne] at himage
  exact (mul_eq_zero.mp himage).resolve_left
    (inv_ne_zero (ne_of_gt hbase_sq_pos))

/-- The transported three-fan collision contradicts a strict orientation of the
last triple. -/
theorem threeFan_false_of_signedArea2_pos
    {B O A S Q : ℝ²}
    (hBO_ne : B ≠ O)
    (hOA_OB : dist O A = dist O B)
    (hOS_OA : dist O S = dist O A)
    (hOQ_OA : dist O Q = dist O A)
    (hBA_BO : dist B A = dist B O)
    (hBS_BO : dist B S = dist B O)
    (hQO_QA : dist Q O = dist Q A)
    (hBSO : 0 < signedArea2 B S O)
    (hBOA : 0 < signedArea2 B O A)
    (hBOQ : 0 < signedArea2 B O Q)
    (hSOQ : 0 < signedArea2 S O Q) : False := by
  have hzero := threeFan_signedArea2_eq_zero hBO_ne hOA_OB hOS_OA hOQ_OA
    hBA_BO hBS_BO hQO_QA hBSO hBOA hBOQ
  linarith

/-- The three-fan collision follows from point distinctness, independently of
all orientation choices. -/
theorem threeFan_signedArea2_eq_zero_of_distinct
    {B O A S Q : ℝ²}
    (hBO_ne : B ≠ O)
    (hOA_OB : dist O A = dist O B)
    (hOS_OA : dist O S = dist O A)
    (hOQ_OA : dist O Q = dist O A)
    (hBA_BO : dist B A = dist B O)
    (hBS_BO : dist B S = dist B O)
    (hQO_QA : dist Q O = dist Q A)
    (hAS_ne : A ≠ S)
    (hBQ_ne : B ≠ Q) :
    signedArea2 S O Q = 0 := by
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
  have himage_normalized : signedArea2 (T S) (pt 1 0) (T Q) = 0 := by
    apply normalized_threeFan_signedArea2_eq_zero_of_distinct (A := T A)
    · simpa only [hT_B, hT_O] using
        map_dist_eq (W := O) (X := A) (Y := O) (Z := B) hOA_OB
    · simpa only [hT_O] using
        map_dist_eq (W := O) (X := S) (Y := O) (Z := A) hOS_OA
    · simpa only [hT_O] using
        map_dist_eq (W := O) (X := Q) (Y := O) (Z := A) hOQ_OA
    · simpa only [hT_B, hT_O] using
        map_dist_eq (W := B) (X := A) (Y := B) (Z := O) hBA_BO
    · simpa only [hT_B, hT_O] using
        map_dist_eq (W := B) (X := S) (Y := B) (Z := O) hBS_BO
    · simpa only [hT_O] using
        map_dist_eq (W := Q) (X := O) (Y := Q) (Z := A) hQO_QA
    · exact map_ne hAS_ne
    · simpa only [hT_B] using map_ne hBQ_ne
  have himage : signedArea2 (T S) (T O) (T Q) = 0 := by
    simpa only [hT_O] using himage_normalized
  rw [signedArea2_normSim B O hBO_ne] at himage
  exact (mul_eq_zero.mp himage).resolve_left
    (inv_ne_zero (ne_of_gt hbase_sq_pos))

/-- Distinctness in a three-fan configuration contradicts nonzero signed area
of the last triple. -/
theorem threeFan_false_of_signedArea2_ne_zero
    {B O A S Q : ℝ²}
    (hBO_ne : B ≠ O)
    (hOA_OB : dist O A = dist O B)
    (hOS_OA : dist O S = dist O A)
    (hOQ_OA : dist O Q = dist O A)
    (hBA_BO : dist B A = dist B O)
    (hBS_BO : dist B S = dist B O)
    (hQO_QA : dist Q O = dist Q A)
    (hAS_ne : A ≠ S)
    (hBQ_ne : B ≠ Q)
    (hSOQ_ne : signedArea2 S O Q ≠ 0) : False := by
  exact hSOQ_ne <|
    threeFan_signedArea2_eq_zero_of_distinct hBO_ne hOA_OB hOS_OA hOQ_OA
      hBA_BO hBS_BO hQO_QA hAS_ne hBQ_ne

end EqualityCore
end Census554
end Problem97

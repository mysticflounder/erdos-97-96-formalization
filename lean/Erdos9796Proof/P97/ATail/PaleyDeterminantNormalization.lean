/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FanoSevenCircleObstruction
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse

/-!
# Fixed-basis normalization for the Paley determinant obstruction

This module normalizes seven vectors by an arbitrary nonsingular four-vector basis.
Cramer's rule turns replacement-minor hypotheses into the nonzero normalized coordinates
needed by the terminal Paley determinant obstruction.
-/

namespace Problem97.PaleyDeterminantNormalization

abbrev Vec4 := Fin 4 → ℝ

/-- The matrix whose displayed arguments are its four columns. -/
def columns (x₀ x₁ x₂ x₃ : Vec4) : Matrix (Fin 4) (Fin 4) ℝ :=
  fun i j ↦ ![x₀ i, x₁ i, x₂ i, x₃ i] j

/-- Coordinates of `x` in the basis whose column matrix is `A`. -/
noncomputable def normalize (A : Matrix (Fin 4) (Fin 4) ℝ) (x : Vec4) : Vec4 :=
  Matrix.mulVec A⁻¹ x

theorem normalize_col (A : Matrix (Fin 4) (Fin 4) ℝ) (hA : A.det ≠ 0) (j : Fin 4) :
    normalize A (A.col j) = Pi.single j 1 := by
  rw [normalize, ← Matrix.mulVec_single_one, Matrix.mulVec_mulVec,
    Matrix.nonsing_inv_mul A (isUnit_iff_ne_zero.mpr hA), Matrix.one_mulVec]

theorem columns_normalize (A : Matrix (Fin 4) (Fin 4) ℝ) (x₀ x₁ x₂ x₃ : Vec4) :
    columns (normalize A x₀) (normalize A x₁) (normalize A x₂) (normalize A x₃) =
      A⁻¹ * columns x₀ x₁ x₂ x₃ := by
  ext i j
  fin_cases j <;> simp [columns, normalize, Matrix.mul_apply, Matrix.mulVec, dotProduct]

theorem det_columns_normalize_eq_zero
    (A : Matrix (Fin 4) (Fin 4) ℝ) (x₀ x₁ x₂ x₃ : Vec4)
    (h : (columns x₀ x₁ x₂ x₃).det = 0) :
    (columns (normalize A x₀) (normalize A x₁) (normalize A x₂) (normalize A x₃)).det =
      0 := by
  rw [columns_normalize, Matrix.det_mul, h, mul_zero]

theorem det_mul_normalized_coord_eq_replacement_minor
    (A : Matrix (Fin 4) (Fin 4) ℝ) (hA : A.det ≠ 0) (x : Vec4) (i : Fin 4) :
    A.det * normalize A x i = (A.updateCol i x).det := by
  have h := congrFun (A.det_smul_inv_mulVec_eq_cramer x (isUnit_iff_ne_zero.mpr hA)) i
  simpa [normalize, Matrix.cramer_apply] using h

theorem normalized_coord_ne_zero_of_replacement_minor_ne_zero
    (A : Matrix (Fin 4) (Fin 4) ℝ) (hA : A.det ≠ 0) (x : Vec4) (i : Fin 4)
    (hminor : (A.updateCol i x).det ≠ 0) :
    normalize A x i ≠ 0 := by
  intro hi
  apply hminor
  rw [← det_mul_normalized_coord_eq_replacement_minor A hA x i, hi, mul_zero]

private theorem columns_basis₀₁₂ (x : Vec4) :
    columns (Pi.single 0 1) (Pi.single 1 1) (Pi.single 2 1) x =
      !![1, 0, 0, x 0; 0, 1, 0, x 1; 0, 0, 1, x 2; 0, 0, 0, x 3] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [columns]

private theorem columns_basis₁₂₃ (x : Vec4) :
    columns (Pi.single 1 1) (Pi.single 2 1) (Pi.single 3 1) x =
      !![0, 0, 0, x 0; 1, 0, 0, x 1; 0, 1, 0, x 2; 0, 0, 1, x 3] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [columns]

private theorem columns_basis₂₃ (x y : Vec4) :
    columns (Pi.single 2 1) (Pi.single 3 1) x y =
      !![0, 0, x 0, y 0; 0, 0, x 1, y 1; 1, 0, x 2, y 2; 0, 1, x 3, y 3] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [columns]

private theorem columns_basis₃_x_y_basis₀ (x y : Vec4) :
    columns (Pi.single 3 1) x y (Pi.single 0 1) =
      !![0, x 0, y 0, 1; 0, x 1, y 1, 0; 0, x 2, y 2, 0; 1, x 3, y 3, 0] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [columns]

private theorem columns_x_y_z_basis₁ (x y z : Vec4) :
    columns x y z (Pi.single 1 1) =
      !![x 0, y 0, z 0, 0; x 1, y 1, z 1, 1; x 2, y 2, z 2, 0;
        x 3, y 3, z 3, 0] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [columns]

private theorem columns_x_y_basis₀_basis₂ (x y : Vec4) :
    columns x y (Pi.single 0 1) (Pi.single 2 1) =
      !![x 0, y 0, 1, 0; x 1, y 1, 0, 0; x 2, y 2, 0, 1; x 3, y 3, 0, 0] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [columns]

private theorem columns_basis₀₁_basis₃ (x : Vec4) :
    columns x (Pi.single 0 1) (Pi.single 1 1) (Pi.single 3 1) =
      !![x 0, 1, 0, 0; x 1, 0, 1, 0; x 2, 0, 0, 0; x 3, 0, 0, 1] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [columns]

/-- The exact fixed-basis adapter needed by the normalized Paley obstruction.

The nine replacement-minor hypotheses are precisely Cramer's-rule witnesses for the
coordinates required to be nonzero by
`FanoSevenCircleObstruction.normalized_paley_determinants_incompatible`.
-/
theorem paley_determinants_incompatible_of_basis_minors
    (v₀ v₁ v₂ v₃ v₄ v₅ v₆ : Vec4)
    (hA : (columns v₀ v₁ v₂ v₃).det ≠ 0)
    (h₄₀ : ((columns v₀ v₁ v₂ v₃).updateCol 0 v₄).det ≠ 0)
    (h₄₁ : ((columns v₀ v₁ v₂ v₃).updateCol 1 v₄).det ≠ 0)
    (h₄₂ : ((columns v₀ v₁ v₂ v₃).updateCol 2 v₄).det ≠ 0)
    (h₅₁ : ((columns v₀ v₁ v₂ v₃).updateCol 1 v₅).det ≠ 0)
    (h₅₂ : ((columns v₀ v₁ v₂ v₃).updateCol 2 v₅).det ≠ 0)
    (h₅₃ : ((columns v₀ v₁ v₂ v₃).updateCol 3 v₅).det ≠ 0)
    (h₆₀ : ((columns v₀ v₁ v₂ v₃).updateCol 0 v₆).det ≠ 0)
    (h₆₁ : ((columns v₀ v₁ v₂ v₃).updateCol 1 v₆).det ≠ 0)
    (h₆₃ : ((columns v₀ v₁ v₂ v₃).updateCol 3 v₆).det ≠ 0)
    (hB₀ : (columns v₀ v₁ v₂ v₄).det = 0)
    (hB₁ : (columns v₁ v₂ v₃ v₅).det = 0)
    (hB₂ : (columns v₂ v₃ v₄ v₆).det = 0)
    (hB₃ : (columns v₃ v₄ v₅ v₀).det = 0)
    (hB₄ : (columns v₄ v₅ v₆ v₁).det = 0)
    (hB₅ : (columns v₅ v₆ v₀ v₂).det = 0)
    (hB₆ : (columns v₆ v₀ v₁ v₃).det = 0) :
    False := by
  let A := columns v₀ v₁ v₂ v₃
  let w := normalize A
  have hw₀ : w v₀ = Pi.single 0 1 := by
    simpa [A, w, columns] using normalize_col A hA (0 : Fin 4)
  have hw₁ : w v₁ = Pi.single 1 1 := by
    simpa [A, w, columns] using normalize_col A hA (1 : Fin 4)
  have hw₂ : w v₂ = Pi.single 2 1 := by
    simpa [A, w, columns] using normalize_col A hA (2 : Fin 4)
  have hw₃ : w v₃ = Pi.single 3 1 := by
    simpa [A, w, columns] using normalize_col A hA (3 : Fin 4)
  have ha : w v₄ 0 ≠ 0 := by
    exact normalized_coord_ne_zero_of_replacement_minor_ne_zero A hA v₄ 0 h₄₀
  have hb : w v₄ 1 ≠ 0 := by
    exact normalized_coord_ne_zero_of_replacement_minor_ne_zero A hA v₄ 1 h₄₁
  have hc : w v₄ 2 ≠ 0 := by
    exact normalized_coord_ne_zero_of_replacement_minor_ne_zero A hA v₄ 2 h₄₂
  have hf : w v₅ 1 ≠ 0 := by
    exact normalized_coord_ne_zero_of_replacement_minor_ne_zero A hA v₅ 1 h₅₁
  have hg : w v₅ 2 ≠ 0 := by
    exact normalized_coord_ne_zero_of_replacement_minor_ne_zero A hA v₅ 2 h₅₂
  have hh : w v₅ 3 ≠ 0 := by
    exact normalized_coord_ne_zero_of_replacement_minor_ne_zero A hA v₅ 3 h₅₃
  have hj : w v₆ 0 ≠ 0 := by
    exact normalized_coord_ne_zero_of_replacement_minor_ne_zero A hA v₆ 0 h₆₀
  have hk : w v₆ 1 ≠ 0 := by
    exact normalized_coord_ne_zero_of_replacement_minor_ne_zero A hA v₆ 1 h₆₁
  have hm : w v₆ 3 ≠ 0 := by
    exact normalized_coord_ne_zero_of_replacement_minor_ne_zero A hA v₆ 3 h₆₃
  have hB₀' := det_columns_normalize_eq_zero A v₀ v₁ v₂ v₄ hB₀
  have hB₁' := det_columns_normalize_eq_zero A v₁ v₂ v₃ v₅ hB₁
  have hB₂' := det_columns_normalize_eq_zero A v₂ v₃ v₄ v₆ hB₂
  have hB₃' := det_columns_normalize_eq_zero A v₃ v₄ v₅ v₀ hB₃
  have hB₄' := det_columns_normalize_eq_zero A v₄ v₅ v₆ v₁ hB₄
  have hB₅' := det_columns_normalize_eq_zero A v₅ v₆ v₀ v₂ hB₅
  have hB₆' := det_columns_normalize_eq_zero A v₆ v₀ v₁ v₃ hB₆
  change (columns (w v₀) (w v₁) (w v₂) (w v₄)).det = 0 at hB₀'
  change (columns (w v₁) (w v₂) (w v₃) (w v₅)).det = 0 at hB₁'
  change (columns (w v₂) (w v₃) (w v₄) (w v₆)).det = 0 at hB₂'
  change (columns (w v₃) (w v₄) (w v₅) (w v₀)).det = 0 at hB₃'
  change (columns (w v₄) (w v₅) (w v₆) (w v₁)).det = 0 at hB₄'
  change (columns (w v₅) (w v₆) (w v₀) (w v₂)).det = 0 at hB₅'
  change (columns (w v₆) (w v₀) (w v₁) (w v₃)).det = 0 at hB₆'
  rw [hw₀, hw₁, hw₂] at hB₀'
  rw [hw₁, hw₂, hw₃] at hB₁'
  rw [hw₂, hw₃] at hB₂'
  rw [hw₃, hw₀] at hB₃'
  rw [hw₁] at hB₄'
  rw [hw₀, hw₂] at hB₅'
  rw [hw₀, hw₁, hw₃] at hB₆'
  exact FanoSevenCircleObstruction.normalized_paley_determinants_incompatible
    (w v₄ 0) (w v₄ 1) (w v₄ 2) (w v₄ 3)
    (w v₅ 0) (w v₅ 1) (w v₅ 2) (w v₅ 3)
    (w v₆ 0) (w v₆ 1) (w v₆ 2) (w v₆ 3)
    ha hb hc hf hg hh hj hk hm
    (by rw [columns_basis₀₁₂] at hB₀'; exact hB₀')
    (by rw [columns_basis₁₂₃] at hB₁'; exact hB₁')
    (by rw [columns_basis₂₃] at hB₂'; exact hB₂')
    (by rw [columns_basis₃_x_y_basis₀] at hB₃'; exact hB₃')
    (by rw [columns_x_y_z_basis₁] at hB₄'; exact hB₄')
    (by rw [columns_x_y_basis₀_basis₂] at hB₅'; exact hB₅')
    (by rw [columns_basis₀₁_basis₃] at hB₆'; exact hB₆')

end Problem97.PaleyDeterminantNormalization

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalShellLiftedDeterminant
import Erdos9796Proof.P97.ATail.PaleyDeterminantNormalization

/-!
# Physical adapter for literal Paley critical shells

This module connects exact critical-shell membership to the fixed-basis determinant
normalization obstruction. Seven exact shells with literal Paley supports force the
seven zero block determinants and ten nonzero basis or replacement minors required by
the normalized rank-four contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97.PaleyCriticalShellAdapter

open Census554.CirclePowerMatrix
open ATailCriticalShellLift
open PaleyDeterminantNormalization

private theorem columns_pointFeature_eq_liftedFour (a b c d : ℝ²) :
    columns (pointFeature a) (pointFeature b) (pointFeature c) (pointFeature d) =
      liftedFour a b c d := by
  ext i j
  fin_cases i <;> fin_cases j <;> rfl

private theorem updateCol_zero_columns (a b c d x : Vec4) :
    (columns a b c d).updateCol 0 x = columns x b c d := by
  ext i j
  fin_cases j <;> simp [columns]

private theorem updateCol_one_columns (a b c d x : Vec4) :
    (columns a b c d).updateCol 1 x = columns a x c d := by
  ext i j
  fin_cases j <;> simp [columns]

private theorem updateCol_two_columns (a b c d x : Vec4) :
    (columns a b c d).updateCol 2 x = columns a b x d := by
  ext i j
  fin_cases j <;> simp [columns]

private theorem updateCol_three_columns (a b c d x : Vec4) :
    (columns a b c d).updateCol 3 x = columns a b c x := by
  ext i j
  fin_cases j <;> simp [columns]

private theorem det_columns_swap_zero_one_ne_zero
    (a b c d : Vec4) (h : (columns a b c d).det ≠ 0) :
    (columns b a c d).det ≠ 0 := by
  have hperm := Matrix.det_permute' (Equiv.swap (0 : Fin 4) 1) (columns a b c d)
  have hmatrix :
      (columns a b c d).submatrix id (Equiv.swap (0 : Fin 4) 1) =
        columns b a c d := by
    ext i j
    fin_cases j <;> norm_num [columns, Equiv.swap_apply_def]
  rw [hmatrix] at hperm
  rw [hperm]
  simpa [Equiv.Perm.sign_swap (by decide : (0 : Fin 4) ≠ 1)] using h

private theorem det_columns_swap_one_two_ne_zero
    (a b c d : Vec4) (h : (columns a b c d).det ≠ 0) :
    (columns a c b d).det ≠ 0 := by
  have hperm := Matrix.det_permute' (Equiv.swap (1 : Fin 4) 2) (columns a b c d)
  have hswap : ∀ j : Fin 4,
      Equiv.swap (1 : Fin 4) 2 j = ![(0 : Fin 4), 2, 1, 3] j := by
    intro j
    fin_cases j <;> decide
  have hmatrix :
      (columns a b c d).submatrix id (Equiv.swap (1 : Fin 4) 2) =
        columns a c b d := by
    ext i j
    simp only [Matrix.submatrix_apply, id_eq]
    rw [hswap j]
    fin_cases j <;> rfl
  rw [hmatrix] at hperm
  rw [hperm]
  simpa [Equiv.Perm.sign_swap (by decide : (1 : Fin 4) ≠ 2)] using h

private theorem det_columns_swap_two_three_ne_zero
    (a b c d : Vec4) (h : (columns a b c d).det ≠ 0) :
    (columns a b d c).det ≠ 0 := by
  have hperm := Matrix.det_permute' (Equiv.swap (2 : Fin 4) 3) (columns a b c d)
  have hswap : ∀ j : Fin 4,
      Equiv.swap (2 : Fin 4) 3 j = ![(0 : Fin 4), 1, 3, 2] j := by
    intro j
    fin_cases j <;> decide
  have hmatrix :
      (columns a b c d).submatrix id (Equiv.swap (2 : Fin 4) 3) =
        columns a b d c := by
    ext i j
    simp only [Matrix.submatrix_apply, id_eq]
    rw [hswap j]
    fin_cases j <;> rfl
  rw [hmatrix] at hperm
  rw [hperm]
  simpa [Equiv.Perm.sign_swap (by decide : (2 : Fin 4) ≠ 3)] using h

private theorem det_columns_rotate_right_ne_zero
    (a b c d : Vec4) (h : (columns a b c d).det ≠ 0) :
    (columns d a b c).det ≠ 0 := by
  have h₁ : (columns a b d c).det ≠ 0 :=
    det_columns_swap_two_three_ne_zero a b c d h
  have h₂ : (columns a d b c).det ≠ 0 :=
    det_columns_swap_one_two_ne_zero a b d c h₁
  exact det_columns_swap_zero_one_ne_zero a d b c h₂

private theorem det_columns_reorder_0153_ne_zero
    (v₀ v₁ v₃ v₅ : Vec4) (h : (columns v₁ v₃ v₅ v₀).det ≠ 0) :
    (columns v₀ v₁ v₅ v₃).det ≠ 0 := by
  have h₁ : (columns v₀ v₁ v₃ v₅).det ≠ 0 :=
    det_columns_rotate_right_ne_zero v₁ v₃ v₅ v₀ h
  exact det_columns_swap_two_three_ne_zero v₀ v₁ v₃ v₅ h₁

/-- Seven exact critical shells with literal Paley supports contradict the
rank-four paraboloid-lift determinant relations. -/
theorem false_of_literal_paley_critical_shells
    {A : Finset ℝ²}
    (points : Fin 7 ↪ {p : ℝ² // p ∈ A})
    (centers : Fin 7 → ℝ²)
    (K : ∀ i, CriticalFourShell A (points i).1 (centers i))
    (hsupport : ∀ i j,
      (points j).1 ∈ (K i).support ↔
        j ∈ ({i, i + 1, i + 2, i + 4} : Finset (Fin 7))) :
    False := by
  let p : Fin 7 → ℝ² := fun i ↦ (points i).1
  let v : Fin 7 → Vec4 := fun i ↦ pointFeature (p i)
  have hpA (i : Fin 7) : p i ∈ A := (points i).2
  have hp_ne {i j : Fin 7} (hij : i ≠ j) : p i ≠ p j := by
    intro h
    apply hij
    apply points.injective
    exact Subtype.ext h
  have hmem (i j : Fin 7)
      (h : j ∈ ({i, i + 1, i + 2, i + 4} : Finset (Fin 7))) :
      p j ∈ (K i).support := by
    exact (hsupport i j).2 h
  have hnotmem (i j : Fin 7)
      (h : j ∉ ({i, i + 1, i + 2, i + 4} : Finset (Fin 7))) :
      p j ∉ (K i).support := by
    exact fun hj ↦ h ((hsupport i j).1 hj)
  have hminor (i a b c d : Fin 7)
      (ha : a ∈ ({i, i + 1, i + 2, i + 4} : Finset (Fin 7)))
      (hb : b ∈ ({i, i + 1, i + 2, i + 4} : Finset (Fin 7)))
      (hc : c ∈ ({i, i + 1, i + 2, i + 4} : Finset (Fin 7)))
      (hd : d ∉ ({i, i + 1, i + 2, i + 4} : Finset (Fin 7)))
      (hab : a ≠ b) (hbc : b ≠ c) (hac : a ≠ c) :
      (columns (v a) (v b) (v c) (v d)).det ≠ 0 := by
    rw [show columns (v a) (v b) (v c) (v d) = liftedFour (p a) (p b) (p c) (p d) by
      exact columns_pointFeature_eq_liftedFour (p a) (p b) (p c) (p d)]
    exact det_liftedFour_ne_zero_of_three_mem_one_not_mem
      (K i) (hmem i a ha) (hmem i b hb) (hmem i c hc)
      (hpA d) (hnotmem i d hd) (hp_ne hab) (hp_ne hbc) (hp_ne hac)
  have hblock (i a b c d : Fin 7)
      (ha : a ∈ ({i, i + 1, i + 2, i + 4} : Finset (Fin 7)))
      (hb : b ∈ ({i, i + 1, i + 2, i + 4} : Finset (Fin 7)))
      (hc : c ∈ ({i, i + 1, i + 2, i + 4} : Finset (Fin 7)))
      (hd : d ∈ ({i, i + 1, i + 2, i + 4} : Finset (Fin 7))) :
      (columns (v a) (v b) (v c) (v d)).det = 0 := by
    rw [show columns (v a) (v b) (v c) (v d) = liftedFour (p a) (p b) (p c) (p d) by
      exact columns_pointFeature_eq_liftedFour (p a) (p b) (p c) (p d)]
    exact det_liftedFour_eq_zero_of_mem_support
      (K i) (hmem i a ha) (hmem i b hb) (hmem i c hc) (hmem i d hd)
  apply paley_determinants_incompatible_of_basis_minors
    (v 0) (v 1) (v 2) (v 3) (v 4) (v 5) (v 6)
  · exact hminor 0 0 1 2 3 (by decide) (by decide) (by decide) (by decide)
      (by decide) (by decide) (by decide)
  · rw [updateCol_zero_columns]
    exact hminor 0 4 1 2 3 (by decide) (by decide) (by decide) (by decide)
      (by decide) (by decide) (by decide)
  · rw [updateCol_one_columns]
    exact hminor 0 0 4 2 3 (by decide) (by decide) (by decide) (by decide)
      (by decide) (by decide) (by decide)
  · rw [updateCol_two_columns]
    exact hminor 0 0 1 4 3 (by decide) (by decide) (by decide) (by decide)
      (by decide) (by decide) (by decide)
  · rw [updateCol_one_columns]
    exact hminor 5 0 5 2 3 (by decide) (by decide) (by decide) (by decide)
      (by decide) (by decide) (by decide)
  · rw [updateCol_two_columns]
    apply det_columns_reorder_0153_ne_zero
    exact hminor 1 1 3 5 0 (by decide) (by decide) (by decide) (by decide)
      (by decide) (by decide) (by decide)
  · rw [updateCol_three_columns]
    exact hminor 0 0 1 2 5 (by decide) (by decide) (by decide) (by decide)
      (by decide) (by decide) (by decide)
  · rw [updateCol_zero_columns]
    apply det_columns_rotate_right_ne_zero
    exact hminor 1 1 2 3 6 (by decide) (by decide) (by decide) (by decide)
      (by decide) (by decide) (by decide)
  · rw [updateCol_one_columns]
    exact hminor 5 0 6 2 3 (by decide) (by decide) (by decide) (by decide)
      (by decide) (by decide) (by decide)
  · rw [updateCol_three_columns]
    exact hminor 0 0 1 2 6 (by decide) (by decide) (by decide) (by decide)
      (by decide) (by decide) (by decide)
  · exact hblock 0 0 1 2 4 (by decide) (by decide) (by decide) (by decide)
  · exact hblock 1 1 2 3 5 (by decide) (by decide) (by decide) (by decide)
  · exact hblock 2 2 3 4 6 (by decide) (by decide) (by decide) (by decide)
  · exact hblock 3 3 4 5 0 (by decide) (by decide) (by decide) (by decide)
  · exact hblock 4 4 5 6 1 (by decide) (by decide) (by decide) (by decide)
  · exact hblock 5 5 6 0 2 (by decide) (by decide) (by decide) (by decide)
  · exact hblock 6 6 0 1 3 (by decide) (by decide) (by decide) (by decide)

end Problem97.PaleyCriticalShellAdapter

#print axioms Problem97.PaleyCriticalShellAdapter.false_of_literal_paley_critical_shells

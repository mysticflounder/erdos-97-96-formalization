import Erdos9796Proof.P97.Census554.EqualityCore
import BankCleanCompactClosure

/-!
# Geometry-facing contradiction for the normalized bank-clean core

This scratch wrapper converts the fifteen selected distance equalities to the
coordinate rows consumed by `bank_clean_15_row_incompatible`.
-/

open scoped EuclideanGeometry

namespace Problem97.ATailBankClean15DistanceClosureScratch

private theorem dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

private theorem sq_coord_eq_of_dist_eq {p q r : ℝ²}
    (h : dist p q = dist p r) :
    (p 0 - q 0) ^ 2 + (p 1 - q 1) ^ 2 =
      (p 0 - r 0) ^ 2 + (p 1 - r 1) ^ 2 := by
  have hs := congrArg (fun d : ℝ => d ^ 2) h
  simpa only [dist_sq_coord] using hs

theorem bank_clean_15_distance_rows_incompatible
    {E F G K X Y Z : ℝ²}
    (hA_O_G : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) G)
    (hA_O_K : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) K)
    (hF_A_Z : dist F (pt 1 0) = dist F Z)
    (hF_A_K : dist F (pt 1 0) = dist F K)
    (hG_X_E : dist G X = dist G E)
    (hG_X_K : dist G X = dist G K)
    (hK_O_Y : dist K (pt 0 0) = dist K Y)
    (hK_O_G : dist K (pt 0 0) = dist K G)
    (hO_A_E : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) E)
    (hX_Z_G : dist X Z = dist X G)
    (hX_Z_F : dist X Z = dist X F)
    (hY_O_X : dist Y (pt 0 0) = dist Y X)
    (hY_O_Z : dist Y (pt 0 0) = dist Y Z)
    (hZ_A_Y : dist Z (pt 1 0) = dist Z Y)
    (hZ_A_G : dist Z (pt 1 0) = dist Z G) :
    False := by
  have hAOG : -(G 0) ^ 2 + 2 * (G 0) - (G 1) ^ 2 = 0 := by
    have hs := sq_coord_eq_of_dist_eq hA_O_G
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hs
    linear_combination hs
  have hAOK : -(K 0) ^ 2 + 2 * (K 0) - (K 1) ^ 2 = 0 := by
    have hs := sq_coord_eq_of_dist_eq hA_O_K
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hs
    linear_combination hs
  have hFAZ :
      2 * (F 0) * (Z 0) - 2 * (F 0) + 2 * (F 1) * (Z 1) -
        (Z 0) ^ 2 - (Z 1) ^ 2 + 1 = 0 := by
    have hs := sq_coord_eq_of_dist_eq hF_A_Z
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hs
    linear_combination hs
  have hFAK :
      2 * (F 0) * (K 0) - 2 * (F 0) + 2 * (F 1) * (K 1) -
        (K 0) ^ 2 - (K 1) ^ 2 + 1 = 0 := by
    have hs := sq_coord_eq_of_dist_eq hF_A_K
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hs
    linear_combination hs
  have hGXE :
      -(E 0) ^ 2 + 2 * (E 0) * (G 0) - (E 1) ^ 2 +
        2 * (E 1) * (G 1) - 2 * (G 0) * (X 0) -
        2 * (G 1) * (X 1) + (X 0) ^ 2 + (X 1) ^ 2 = 0 := by
    have hs := sq_coord_eq_of_dist_eq hG_X_E
    linear_combination hs
  have hGXK :
      2 * (G 0) * (K 0) - 2 * (G 0) * (X 0) +
        2 * (G 1) * (K 1) - 2 * (G 1) * (X 1) -
        (K 0) ^ 2 - (K 1) ^ 2 + (X 0) ^ 2 + (X 1) ^ 2 = 0 := by
    have hs := sq_coord_eq_of_dist_eq hG_X_K
    linear_combination hs
  have hKOY :
      2 * (K 0) * (Y 0) + 2 * (K 1) * (Y 1) -
        (Y 0) ^ 2 - (Y 1) ^ 2 = 0 := by
    have hs := sq_coord_eq_of_dist_eq hK_O_Y
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hs
    linear_combination hs
  have hKOG :
      -(G 0) ^ 2 + 2 * (G 0) * (K 0) - (G 1) ^ 2 +
        2 * (G 1) * (K 1) = 0 := by
    have hs := sq_coord_eq_of_dist_eq hK_O_G
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hs
    linear_combination hs
  have hOAE : -(E 0) ^ 2 - (E 1) ^ 2 + 1 = 0 := by
    have hs := sq_coord_eq_of_dist_eq hO_A_E
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hs
    linear_combination hs
  have hXZG :
      -(G 0) ^ 2 + 2 * (G 0) * (X 0) - (G 1) ^ 2 +
        2 * (G 1) * (X 1) - 2 * (X 0) * (Z 0) -
        2 * (X 1) * (Z 1) + (Z 0) ^ 2 + (Z 1) ^ 2 = 0 := by
    have hs := sq_coord_eq_of_dist_eq hX_Z_G
    linear_combination hs
  have hXZF :
      -(F 0) ^ 2 + 2 * (F 0) * (X 0) - (F 1) ^ 2 +
        2 * (F 1) * (X 1) - 2 * (X 0) * (Z 0) -
        2 * (X 1) * (Z 1) + (Z 0) ^ 2 + (Z 1) ^ 2 = 0 := by
    have hs := sq_coord_eq_of_dist_eq hX_Z_F
    linear_combination hs
  have hYOX :
      -(X 0) ^ 2 + 2 * (X 0) * (Y 0) - (X 1) ^ 2 +
        2 * (X 1) * (Y 1) = 0 := by
    have hs := sq_coord_eq_of_dist_eq hY_O_X
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hs
    linear_combination hs
  have hYOZ :
      2 * (Y 0) * (Z 0) + 2 * (Y 1) * (Z 1) -
        (Z 0) ^ 2 - (Z 1) ^ 2 = 0 := by
    have hs := sq_coord_eq_of_dist_eq hY_O_Z
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hs
    linear_combination hs
  have hZAY :
      -(Y 0) ^ 2 + 2 * (Y 0) * (Z 0) - (Y 1) ^ 2 +
        2 * (Y 1) * (Z 1) - 2 * (Z 0) + 1 = 0 := by
    have hs := sq_coord_eq_of_dist_eq hZ_A_Y
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hs
    linear_combination hs
  have hZAG :
      -(G 0) ^ 2 + 2 * (G 0) * (Z 0) - (G 1) ^ 2 +
        2 * (G 1) * (Z 1) - 2 * (Z 0) + 1 = 0 := by
    have hs := sq_coord_eq_of_dist_eq hZ_A_G
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hs
    linear_combination hs
  exact
    Problem97.ATailBankCleanCompactClosureScratch.bank_clean_15_row_incompatible
      hAOG hAOK hFAZ hFAK hGXE hGXK hKOY hKOG hOAE hXZG hXZF hYOX hYOZ
      hZAY hZAG

#print axioms bank_clean_15_distance_rows_incompatible

end Problem97.ATailBankClean15DistanceClosureScratch

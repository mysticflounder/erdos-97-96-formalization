import Erdos9796Proof.P97.Census554.EqualityCore

/-! Exact smoke tests for the fifteen geometry-to-polynomial maps. -/

open scoped EuclideanGeometry

namespace Problem97.ATailBankClean15MappingSmoke

private theorem bankClean15_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

example {G : ℝ²}
    (hA_O_G : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) G) :
    -(G 0)^2 + 2*(G 0) - (G 1)^2 = 0 := by
  have hA_O_G_sq :=
    congrArg (fun r : ℝ => r ^ 2) hA_O_G
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) G ^ 2 at hA_O_G_sq
  rw [bankClean15_dist_sq_coord, bankClean15_dist_sq_coord] at hA_O_G_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hA_O_G_sq
  linear_combination hA_O_G_sq

example {K : ℝ²}
    (hA_O_K : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) K) :
    -(K 0)^2 + 2*(K 0) - (K 1)^2 = 0 := by
  have hA_O_K_sq :=
    congrArg (fun r : ℝ => r ^ 2) hA_O_K
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) K ^ 2 at hA_O_K_sq
  rw [bankClean15_dist_sq_coord, bankClean15_dist_sq_coord] at hA_O_K_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hA_O_K_sq
  linear_combination hA_O_K_sq

example {F Z : ℝ²}
    (hF_A_Z : dist F (pt 1 0) = dist F Z) :
    2*(F 0)*(Z 0) - 2*(F 0) + 2*(F 1)*(Z 1) - (Z 0)^2 - (Z 1)^2 + 1 = 0 := by
  have hF_A_Z_sq :=
    congrArg (fun r : ℝ => r ^ 2) hF_A_Z
  change dist F (pt 1 0) ^ 2 = dist F Z ^ 2 at hF_A_Z_sq
  rw [bankClean15_dist_sq_coord, bankClean15_dist_sq_coord] at hF_A_Z_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hF_A_Z_sq
  linear_combination hF_A_Z_sq

example {F K : ℝ²}
    (hF_A_K : dist F (pt 1 0) = dist F K) :
    2*(F 0)*(K 0) - 2*(F 0) + 2*(F 1)*(K 1) - (K 0)^2 - (K 1)^2 + 1 = 0 := by
  have hF_A_K_sq :=
    congrArg (fun r : ℝ => r ^ 2) hF_A_K
  change dist F (pt 1 0) ^ 2 = dist F K ^ 2 at hF_A_K_sq
  rw [bankClean15_dist_sq_coord, bankClean15_dist_sq_coord] at hF_A_K_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hF_A_K_sq
  linear_combination hF_A_K_sq

example {E G X : ℝ²}
    (hG_X_E : dist G X = dist G E) :
    -(E 0)^2 + 2*(E 0)*(G 0) - (E 1)^2 + 2*(E 1)*(G 1) - 2*(G 0)*(X 0) - 2*(G 1)*(X 1) + (X 0)^2 + (X 1)^2 = 0 := by
  have hG_X_E_sq :=
    congrArg (fun r : ℝ => r ^ 2) hG_X_E
  change dist G X ^ 2 = dist G E ^ 2 at hG_X_E_sq
  rw [bankClean15_dist_sq_coord, bankClean15_dist_sq_coord] at hG_X_E_sq
  linear_combination hG_X_E_sq

example {G K X : ℝ²}
    (hG_X_K : dist G X = dist G K) :
    2*(G 0)*(K 0) - 2*(G 0)*(X 0) + 2*(G 1)*(K 1) - 2*(G 1)*(X 1) - (K 0)^2 - (K 1)^2 + (X 0)^2 + (X 1)^2 = 0 := by
  have hG_X_K_sq :=
    congrArg (fun r : ℝ => r ^ 2) hG_X_K
  change dist G X ^ 2 = dist G K ^ 2 at hG_X_K_sq
  rw [bankClean15_dist_sq_coord, bankClean15_dist_sq_coord] at hG_X_K_sq
  linear_combination hG_X_K_sq

example {K Y : ℝ²}
    (hK_O_Y : dist K (pt 0 0) = dist K Y) :
    2*(K 0)*(Y 0) + 2*(K 1)*(Y 1) - (Y 0)^2 - (Y 1)^2 = 0 := by
  have hK_O_Y_sq :=
    congrArg (fun r : ℝ => r ^ 2) hK_O_Y
  change dist K (pt 0 0) ^ 2 = dist K Y ^ 2 at hK_O_Y_sq
  rw [bankClean15_dist_sq_coord, bankClean15_dist_sq_coord] at hK_O_Y_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hK_O_Y_sq
  linear_combination hK_O_Y_sq

example {G K : ℝ²}
    (hK_O_G : dist K (pt 0 0) = dist K G) :
    -(G 0)^2 + 2*(G 0)*(K 0) - (G 1)^2 + 2*(G 1)*(K 1) = 0 := by
  have hK_O_G_sq :=
    congrArg (fun r : ℝ => r ^ 2) hK_O_G
  change dist K (pt 0 0) ^ 2 = dist K G ^ 2 at hK_O_G_sq
  rw [bankClean15_dist_sq_coord, bankClean15_dist_sq_coord] at hK_O_G_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hK_O_G_sq
  linear_combination hK_O_G_sq

example {E : ℝ²}
    (hO_A_E : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) E) :
    -(E 0)^2 - (E 1)^2 + 1 = 0 := by
  have hO_A_E_sq :=
    congrArg (fun r : ℝ => r ^ 2) hO_A_E
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) E ^ 2 at hO_A_E_sq
  rw [bankClean15_dist_sq_coord, bankClean15_dist_sq_coord] at hO_A_E_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hO_A_E_sq
  linear_combination hO_A_E_sq

example {G X Z : ℝ²}
    (hX_Z_G : dist X Z = dist X G) :
    -(G 0)^2 + 2*(G 0)*(X 0) - (G 1)^2 + 2*(G 1)*(X 1) - 2*(X 0)*(Z 0) - 2*(X 1)*(Z 1) + (Z 0)^2 + (Z 1)^2 = 0 := by
  have hX_Z_G_sq :=
    congrArg (fun r : ℝ => r ^ 2) hX_Z_G
  change dist X Z ^ 2 = dist X G ^ 2 at hX_Z_G_sq
  rw [bankClean15_dist_sq_coord, bankClean15_dist_sq_coord] at hX_Z_G_sq
  linear_combination hX_Z_G_sq

example {F X Z : ℝ²}
    (hX_Z_F : dist X Z = dist X F) :
    -(F 0)^2 + 2*(F 0)*(X 0) - (F 1)^2 + 2*(F 1)*(X 1) - 2*(X 0)*(Z 0) - 2*(X 1)*(Z 1) + (Z 0)^2 + (Z 1)^2 = 0 := by
  have hX_Z_F_sq :=
    congrArg (fun r : ℝ => r ^ 2) hX_Z_F
  change dist X Z ^ 2 = dist X F ^ 2 at hX_Z_F_sq
  rw [bankClean15_dist_sq_coord, bankClean15_dist_sq_coord] at hX_Z_F_sq
  linear_combination hX_Z_F_sq

example {X Y : ℝ²}
    (hY_O_X : dist Y (pt 0 0) = dist Y X) :
    -(X 0)^2 + 2*(X 0)*(Y 0) - (X 1)^2 + 2*(X 1)*(Y 1) = 0 := by
  have hY_O_X_sq :=
    congrArg (fun r : ℝ => r ^ 2) hY_O_X
  change dist Y (pt 0 0) ^ 2 = dist Y X ^ 2 at hY_O_X_sq
  rw [bankClean15_dist_sq_coord, bankClean15_dist_sq_coord] at hY_O_X_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hY_O_X_sq
  linear_combination hY_O_X_sq

example {Y Z : ℝ²}
    (hY_O_Z : dist Y (pt 0 0) = dist Y Z) :
    2*(Y 0)*(Z 0) + 2*(Y 1)*(Z 1) - (Z 0)^2 - (Z 1)^2 = 0 := by
  have hY_O_Z_sq :=
    congrArg (fun r : ℝ => r ^ 2) hY_O_Z
  change dist Y (pt 0 0) ^ 2 = dist Y Z ^ 2 at hY_O_Z_sq
  rw [bankClean15_dist_sq_coord, bankClean15_dist_sq_coord] at hY_O_Z_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hY_O_Z_sq
  linear_combination hY_O_Z_sq

example {Y Z : ℝ²}
    (hZ_A_Y : dist Z (pt 1 0) = dist Z Y) :
    -(Y 0)^2 + 2*(Y 0)*(Z 0) - (Y 1)^2 + 2*(Y 1)*(Z 1) - 2*(Z 0) + 1 = 0 := by
  have hZ_A_Y_sq :=
    congrArg (fun r : ℝ => r ^ 2) hZ_A_Y
  change dist Z (pt 1 0) ^ 2 = dist Z Y ^ 2 at hZ_A_Y_sq
  rw [bankClean15_dist_sq_coord, bankClean15_dist_sq_coord] at hZ_A_Y_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hZ_A_Y_sq
  linear_combination hZ_A_Y_sq

example {G Z : ℝ²}
    (hZ_A_G : dist Z (pt 1 0) = dist Z G) :
    -(G 0)^2 + 2*(G 0)*(Z 0) - (G 1)^2 + 2*(G 1)*(Z 1) - 2*(Z 0) + 1 = 0 := by
  have hZ_A_G_sq :=
    congrArg (fun r : ℝ => r ^ 2) hZ_A_G
  change dist Z (pt 1 0) ^ 2 = dist Z G ^ 2 at hZ_A_G_sq
  rw [bankClean15_dist_sq_coord, bankClean15_dist_sq_coord] at hZ_A_G_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hZ_A_G_sq
  linear_combination hZ_A_G_sq

end Problem97.ATailBankClean15MappingSmoke

-- Core SHA256: 24f08887ccdc6c07a19b447352b40dc1ec2bf4facf50752e13708386cfdde165
/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Corrected bank-clean shadow anchor collision

This scratch theorem replays the retained exact metric core with
Lean's kernel-producing `grobner` tactic, then removes the coordinate
gauge by the standard `normSim` transport.

Analysis checkpoint SHA256: `MSOLVE_TWO_ORDER_16_EQUALITY_PROPOSAL_NOT_SINGULAR_CONFIRMED`
Retained normalized equalities: 16.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBankCleanScratch

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem bankClean_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

set_option maxHeartbeats 80000000 in
set_option maxRecDepth 100000 in
/-- The normalized retained equality system is inconsistent. -/
private theorem normalized_bankClean_incompatible
    {C E F G K X Y Z : ℝ²}
    (hO_E_A : dist (pt 0 0) E = dist (pt 0 0) (pt 1 0))
    (hA_G_C : dist (pt 1 0) G = dist (pt 1 0) C)
    (hA_K_C : dist (pt 1 0) K = dist (pt 1 0) C)
    (hA_O_C : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) C)
    (hF_K_A : dist F K = dist F (pt 1 0))
    (hF_Z_A : dist F Z = dist F (pt 1 0))
    (hG_F_E : dist G F = dist G E)
    (hG_K_E : dist G K = dist G E)
    (hG_X_E : dist G X = dist G E)
    (hK_O_G : dist K (pt 0 0) = dist K G)
    (hK_Y_G : dist K Y = dist K G)
    (hX_G_F : dist X G = dist X F)
    (hY_O_E : dist Y (pt 0 0) = dist Y E)
    (hY_X_E : dist Y X = dist Y E)
    (hY_Z_E : dist Y Z = dist Y E)
    (hZ_G_A : dist Z G = dist Z (pt 1 0))
    : False := by
  have hO_E_A_sq := congrArg (fun r : ℝ => r ^ 2) hO_E_A
  change dist (pt 0 0) E ^ 2 = dist (pt 0 0) (pt 1 0) ^ 2 at hO_E_A_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hO_E_A_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hO_E_A_sq
  have hA_G_C_sq := congrArg (fun r : ℝ => r ^ 2) hA_G_C
  change dist (pt 1 0) G ^ 2 = dist (pt 1 0) C ^ 2 at hA_G_C_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hA_G_C_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hA_G_C_sq
  have hA_K_C_sq := congrArg (fun r : ℝ => r ^ 2) hA_K_C
  change dist (pt 1 0) K ^ 2 = dist (pt 1 0) C ^ 2 at hA_K_C_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hA_K_C_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hA_K_C_sq
  have hA_O_C_sq := congrArg (fun r : ℝ => r ^ 2) hA_O_C
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) C ^ 2 at hA_O_C_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hA_O_C_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hA_O_C_sq
  have hF_K_A_sq := congrArg (fun r : ℝ => r ^ 2) hF_K_A
  change dist F K ^ 2 = dist F (pt 1 0) ^ 2 at hF_K_A_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hF_K_A_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hF_K_A_sq
  have hF_Z_A_sq := congrArg (fun r : ℝ => r ^ 2) hF_Z_A
  change dist F Z ^ 2 = dist F (pt 1 0) ^ 2 at hF_Z_A_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hF_Z_A_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hF_Z_A_sq
  have hG_F_E_sq := congrArg (fun r : ℝ => r ^ 2) hG_F_E
  change dist G F ^ 2 = dist G E ^ 2 at hG_F_E_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hG_F_E_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hG_F_E_sq
  have hG_K_E_sq := congrArg (fun r : ℝ => r ^ 2) hG_K_E
  change dist G K ^ 2 = dist G E ^ 2 at hG_K_E_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hG_K_E_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hG_K_E_sq
  have hG_X_E_sq := congrArg (fun r : ℝ => r ^ 2) hG_X_E
  change dist G X ^ 2 = dist G E ^ 2 at hG_X_E_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hG_X_E_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hG_X_E_sq
  have hK_O_G_sq := congrArg (fun r : ℝ => r ^ 2) hK_O_G
  change dist K (pt 0 0) ^ 2 = dist K G ^ 2 at hK_O_G_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hK_O_G_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hK_O_G_sq
  have hK_Y_G_sq := congrArg (fun r : ℝ => r ^ 2) hK_Y_G
  change dist K Y ^ 2 = dist K G ^ 2 at hK_Y_G_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hK_Y_G_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hK_Y_G_sq
  have hX_G_F_sq := congrArg (fun r : ℝ => r ^ 2) hX_G_F
  change dist X G ^ 2 = dist X F ^ 2 at hX_G_F_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hX_G_F_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hX_G_F_sq
  have hY_O_E_sq := congrArg (fun r : ℝ => r ^ 2) hY_O_E
  change dist Y (pt 0 0) ^ 2 = dist Y E ^ 2 at hY_O_E_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hY_O_E_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hY_O_E_sq
  have hY_X_E_sq := congrArg (fun r : ℝ => r ^ 2) hY_X_E
  change dist Y X ^ 2 = dist Y E ^ 2 at hY_X_E_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hY_X_E_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hY_X_E_sq
  have hY_Z_E_sq := congrArg (fun r : ℝ => r ^ 2) hY_Z_E
  change dist Y Z ^ 2 = dist Y E ^ 2 at hY_Z_E_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hY_Z_E_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hY_Z_E_sq
  have hZ_G_A_sq := congrArg (fun r : ℝ => r ^ 2) hZ_G_A
  change dist Z G ^ 2 = dist Z (pt 1 0) ^ 2 at hZ_G_A_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hZ_G_A_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hZ_G_A_sq
  clear hO_E_A hA_G_C hA_K_C hA_O_C hF_K_A hF_Z_A hG_F_E hG_K_E hG_X_E hK_O_G hK_Y_G hX_G_F hY_O_E hY_X_E hY_Z_E hZ_G_A
  grobner (ringSteps := 2000000)

/-- The retained corrected-shadow row equalities force its two anchors
to denote the same point. -/
theorem bank_clean_anchor_collision
    {O A C E F G K X Y Z : ℝ²}
    (hO_E_A : dist O E = dist O A)
    (hA_G_C : dist A G = dist A C)
    (hA_K_C : dist A K = dist A C)
    (hA_O_C : dist A O = dist A C)
    (hF_K_A : dist F K = dist F A)
    (hF_Z_A : dist F Z = dist F A)
    (hG_F_E : dist G F = dist G E)
    (hG_K_E : dist G K = dist G E)
    (hG_X_E : dist G X = dist G E)
    (hK_O_G : dist K O = dist K G)
    (hK_Y_G : dist K Y = dist K G)
    (hX_G_F : dist X G = dist X F)
    (hY_O_E : dist Y O = dist Y E)
    (hY_X_E : dist Y X = dist Y E)
    (hY_Z_E : dist Y Z = dist Y E)
    (hZ_G_A : dist Z G = dist Z A)
    : O = A := by
  by_contra hOA
  let T : ℝ² → ℝ² := normSim O A
  let c := T C
  let e := T E
  let f := T F
  let g := T G
  let k := T K
  let x := T X
  let y := T Y
  let z := T Z
  have hdist (P Q : ℝ²) :
      dist (T P) (T Q) = (dist O A)⁻¹ * dist P Q := by
    simpa [T] using normSim_dist_image O A hOA P Q
  have hT0 : T O = pt 0 0 := by
    simpa [T] using normSim_fst O A
  have hT1 : T A = pt 1 0 := by
    simpa [T] using normSim_snd O A hOA
  have map_dist_eq {P Q R S : ℝ²} (h : dist P Q = dist R S) :
      dist (T P) (T Q) = dist (T R) (T S) := by
    rw [hdist, hdist, h]
  apply normalized_bankClean_incompatible (C := c) (E := e) (F := f) (G := g) (K := k) (X := x) (Y := y) (Z := z)
  · simpa [c, e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hO_E_A
  · simpa [c, e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hA_G_C
  · simpa [c, e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hA_K_C
  · simpa [c, e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hA_O_C
  · simpa [c, e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hF_K_A
  · simpa [c, e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hF_Z_A
  · simpa [c, e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hG_F_E
  · simpa [c, e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hG_K_E
  · simpa [c, e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hG_X_E
  · simpa [c, e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hK_O_G
  · simpa [c, e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hK_Y_G
  · simpa [c, e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hX_G_F
  · simpa [c, e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hY_O_E
  · simpa [c, e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hY_X_E
  · simpa [c, e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hY_Z_E
  · simpa [c, e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hZ_G_A

/-- Nondegenerate contradiction form intended for a row producer. -/
theorem false_of_bank_clean_rows
    {O A C E F G K X Y Z : ℝ²}
    (hOA : O ≠ A)
    (hO_E_A : dist O E = dist O A)
    (hA_G_C : dist A G = dist A C)
    (hA_K_C : dist A K = dist A C)
    (hA_O_C : dist A O = dist A C)
    (hF_K_A : dist F K = dist F A)
    (hF_Z_A : dist F Z = dist F A)
    (hG_F_E : dist G F = dist G E)
    (hG_K_E : dist G K = dist G E)
    (hG_X_E : dist G X = dist G E)
    (hK_O_G : dist K O = dist K G)
    (hK_Y_G : dist K Y = dist K G)
    (hX_G_F : dist X G = dist X F)
    (hY_O_E : dist Y O = dist Y E)
    (hY_X_E : dist Y X = dist Y E)
    (hY_Z_E : dist Y Z = dist Y E)
    (hZ_G_A : dist Z G = dist Z A)
    : False := by
  exact hOA (bank_clean_anchor_collision hO_E_A hA_G_C hA_K_C hA_O_C hF_K_A hF_Z_A hG_F_E hG_K_E hG_X_E hK_O_G hK_Y_G hX_G_F hY_O_E hY_X_E hY_Z_E hZ_G_A)

#print axioms bank_clean_anchor_collision
#print axioms false_of_bank_clean_rows

end ATailBankCleanScratch
end Problem97

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

Analysis checkpoint SHA256: `75e7a39f3bf474c2e8dcdcd869419cdf083b5066305c5c0e4b85af575a17115a`
Retained normalized equalities: 15.
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
    {E F G K X Y Z : ℝ²}
    (hO_A_E : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) E)
    (hA_O_G : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) G)
    (hA_O_K : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) K)
    (hX_Z_G : dist X Z = dist X G)
    (hX_Z_F : dist X Z = dist X F)
    (hY_O_X : dist Y (pt 0 0) = dist Y X)
    (hY_O_Z : dist Y (pt 0 0) = dist Y Z)
    (hZ_A_Y : dist Z (pt 1 0) = dist Z Y)
    (hZ_A_G : dist Z (pt 1 0) = dist Z G)
    (hG_X_E : dist G X = dist G E)
    (hG_X_K : dist G X = dist G K)
    (hK_O_Y : dist K (pt 0 0) = dist K Y)
    (hK_O_G : dist K (pt 0 0) = dist K G)
    (hF_A_Z : dist F (pt 1 0) = dist F Z)
    (hF_A_K : dist F (pt 1 0) = dist F K)
    : False := by
  have hO_A_E_sq := congrArg (fun r : ℝ => r ^ 2) hO_A_E
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) E ^ 2 at hO_A_E_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hO_A_E_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hO_A_E_sq
  have hA_O_G_sq := congrArg (fun r : ℝ => r ^ 2) hA_O_G
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) G ^ 2 at hA_O_G_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hA_O_G_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hA_O_G_sq
  have hA_O_K_sq := congrArg (fun r : ℝ => r ^ 2) hA_O_K
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) K ^ 2 at hA_O_K_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hA_O_K_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hA_O_K_sq
  have hX_Z_G_sq := congrArg (fun r : ℝ => r ^ 2) hX_Z_G
  change dist X Z ^ 2 = dist X G ^ 2 at hX_Z_G_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hX_Z_G_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hX_Z_G_sq
  have hX_Z_F_sq := congrArg (fun r : ℝ => r ^ 2) hX_Z_F
  change dist X Z ^ 2 = dist X F ^ 2 at hX_Z_F_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hX_Z_F_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hX_Z_F_sq
  have hY_O_X_sq := congrArg (fun r : ℝ => r ^ 2) hY_O_X
  change dist Y (pt 0 0) ^ 2 = dist Y X ^ 2 at hY_O_X_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hY_O_X_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hY_O_X_sq
  have hY_O_Z_sq := congrArg (fun r : ℝ => r ^ 2) hY_O_Z
  change dist Y (pt 0 0) ^ 2 = dist Y Z ^ 2 at hY_O_Z_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hY_O_Z_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hY_O_Z_sq
  have hZ_A_Y_sq := congrArg (fun r : ℝ => r ^ 2) hZ_A_Y
  change dist Z (pt 1 0) ^ 2 = dist Z Y ^ 2 at hZ_A_Y_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hZ_A_Y_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hZ_A_Y_sq
  have hZ_A_G_sq := congrArg (fun r : ℝ => r ^ 2) hZ_A_G
  change dist Z (pt 1 0) ^ 2 = dist Z G ^ 2 at hZ_A_G_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hZ_A_G_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hZ_A_G_sq
  have hG_X_E_sq := congrArg (fun r : ℝ => r ^ 2) hG_X_E
  change dist G X ^ 2 = dist G E ^ 2 at hG_X_E_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hG_X_E_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hG_X_E_sq
  have hG_X_K_sq := congrArg (fun r : ℝ => r ^ 2) hG_X_K
  change dist G X ^ 2 = dist G K ^ 2 at hG_X_K_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hG_X_K_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hG_X_K_sq
  have hK_O_Y_sq := congrArg (fun r : ℝ => r ^ 2) hK_O_Y
  change dist K (pt 0 0) ^ 2 = dist K Y ^ 2 at hK_O_Y_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hK_O_Y_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hK_O_Y_sq
  have hK_O_G_sq := congrArg (fun r : ℝ => r ^ 2) hK_O_G
  change dist K (pt 0 0) ^ 2 = dist K G ^ 2 at hK_O_G_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hK_O_G_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hK_O_G_sq
  have hF_A_Z_sq := congrArg (fun r : ℝ => r ^ 2) hF_A_Z
  change dist F (pt 1 0) ^ 2 = dist F Z ^ 2 at hF_A_Z_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hF_A_Z_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hF_A_Z_sq
  have hF_A_K_sq := congrArg (fun r : ℝ => r ^ 2) hF_A_K
  change dist F (pt 1 0) ^ 2 = dist F K ^ 2 at hF_A_K_sq
  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at hF_A_K_sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hF_A_K_sq
  clear hO_A_E hA_O_G hA_O_K hX_Z_G hX_Z_F hY_O_X hY_O_Z hZ_A_Y hZ_A_G hG_X_E hG_X_K hK_O_Y hK_O_G hF_A_Z hF_A_K
  grobner (ringSteps := 2000000)

/-- The retained corrected-shadow row equalities force its two anchors
to denote the same point. -/
theorem bank_clean_anchor_collision
    {O A E F G K X Y Z : ℝ²}
    (hO_A_E : dist O A = dist O E)
    (hA_O_G : dist A O = dist A G)
    (hA_O_K : dist A O = dist A K)
    (hX_Z_G : dist X Z = dist X G)
    (hX_Z_F : dist X Z = dist X F)
    (hY_O_X : dist Y O = dist Y X)
    (hY_O_Z : dist Y O = dist Y Z)
    (hZ_A_Y : dist Z A = dist Z Y)
    (hZ_A_G : dist Z A = dist Z G)
    (hG_X_E : dist G X = dist G E)
    (hG_X_K : dist G X = dist G K)
    (hK_O_Y : dist K O = dist K Y)
    (hK_O_G : dist K O = dist K G)
    (hF_A_Z : dist F A = dist F Z)
    (hF_A_K : dist F A = dist F K)
    : O = A := by
  by_contra hOA
  let T : ℝ² → ℝ² := normSim O A
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
  apply normalized_bankClean_incompatible (E := e) (F := f) (G := g) (K := k) (X := x) (Y := y) (Z := z)
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hO_A_E
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hA_O_G
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hA_O_K
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hX_Z_G
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hX_Z_F
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hY_O_X
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hY_O_Z
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hZ_A_Y
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hZ_A_G
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hG_X_E
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hG_X_K
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hK_O_Y
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hK_O_G
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hF_A_Z
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hF_A_K

/-- Nondegenerate contradiction form intended for a row producer. -/
theorem false_of_bank_clean_rows
    {O A E F G K X Y Z : ℝ²}
    (hOA : O ≠ A)
    (hO_A_E : dist O A = dist O E)
    (hA_O_G : dist A O = dist A G)
    (hA_O_K : dist A O = dist A K)
    (hX_Z_G : dist X Z = dist X G)
    (hX_Z_F : dist X Z = dist X F)
    (hY_O_X : dist Y O = dist Y X)
    (hY_O_Z : dist Y O = dist Y Z)
    (hZ_A_Y : dist Z A = dist Z Y)
    (hZ_A_G : dist Z A = dist Z G)
    (hG_X_E : dist G X = dist G E)
    (hG_X_K : dist G X = dist G K)
    (hK_O_Y : dist K O = dist K Y)
    (hK_O_G : dist K O = dist K G)
    (hF_A_Z : dist F A = dist F Z)
    (hF_A_K : dist F A = dist F K)
    : False := by
  exact hOA (bank_clean_anchor_collision hO_A_E hA_O_G hA_O_K hX_Z_G hX_Z_F hY_O_X hY_O_Z hZ_A_Y hZ_A_G hG_X_E hG_X_K hK_O_Y hK_O_G hF_A_Z hF_A_K)

#print axioms bank_clean_anchor_collision
#print axioms false_of_bank_clean_rows

end ATailBankCleanScratch
end Problem97

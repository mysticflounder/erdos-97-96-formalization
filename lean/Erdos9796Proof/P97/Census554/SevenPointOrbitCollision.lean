/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Seven-point orbit collision core

This file isolates a seven-label distance-equality obstruction extracted from
the general-`m` pinned-surplus probe. The proof uses only the abstract equality
closure of seven selected rows.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem sevenPoint_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

set_option maxHeartbeats 2000000 in
-- The kernel-checked Groebner certificate spans all thirteen equations.
/-- The normalized seven-point scalar system is inconsistent. -/
private theorem normalized_sevenPoint_incompatible
    {B C U V W : ℝ²}
    (hOA_OB : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) B)
    (hOA_OC : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) C)
    (hAO_AB : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) B)
    (hAO_AV : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) V)
    (hAO_AW : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) W)
    (hBC_BU : dist B C = dist B U)
    (hBC_BV : dist B C = dist B V)
    (hCA_CV : dist C (pt 1 0) = dist C V)
    (hUC_UW : dist U C = dist U W)
    (hVA_VU : dist V (pt 1 0) = dist V U)
    (hVA_VW : dist V (pt 1 0) = dist V W)
    (hWO_WB : dist W (pt 0 0) = dist W B)
    (hWO_WU : dist W (pt 0 0) = dist W U) : False := by
  have hOABsq := congrArg (fun r : ℝ => r ^ 2) hOA_OB
  have hOACsq := congrArg (fun r : ℝ => r ^ 2) hOA_OC
  have hAOBsq := congrArg (fun r : ℝ => r ^ 2) hAO_AB
  have hAOVsq := congrArg (fun r : ℝ => r ^ 2) hAO_AV
  have hAOWsq := congrArg (fun r : ℝ => r ^ 2) hAO_AW
  have hBCUsq := congrArg (fun r : ℝ => r ^ 2) hBC_BU
  have hBCVsq := congrArg (fun r : ℝ => r ^ 2) hBC_BV
  have hCAVsq := congrArg (fun r : ℝ => r ^ 2) hCA_CV
  have hUCWsq := congrArg (fun r : ℝ => r ^ 2) hUC_UW
  have hVAUsq := congrArg (fun r : ℝ => r ^ 2) hVA_VU
  have hVAWsq := congrArg (fun r : ℝ => r ^ 2) hVA_VW
  have hWOBsq := congrArg (fun r : ℝ => r ^ 2) hWO_WB
  have hWOUsq := congrArg (fun r : ℝ => r ^ 2) hWO_WU
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) B ^ 2 at hOABsq
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) C ^ 2 at hOACsq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) B ^ 2 at hAOBsq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) V ^ 2 at hAOVsq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) W ^ 2 at hAOWsq
  change dist B C ^ 2 = dist B U ^ 2 at hBCUsq
  change dist B C ^ 2 = dist B V ^ 2 at hBCVsq
  change dist C (pt 1 0) ^ 2 = dist C V ^ 2 at hCAVsq
  change dist U C ^ 2 = dist U W ^ 2 at hUCWsq
  change dist V (pt 1 0) ^ 2 = dist V U ^ 2 at hVAUsq
  change dist V (pt 1 0) ^ 2 = dist V W ^ 2 at hVAWsq
  change dist W (pt 0 0) ^ 2 = dist W B ^ 2 at hWOBsq
  change dist W (pt 0 0) ^ 2 = dist W U ^ 2 at hWOUsq
  rw [sevenPoint_dist_sq_coord, sevenPoint_dist_sq_coord] at hOABsq hOACsq
  rw [sevenPoint_dist_sq_coord, sevenPoint_dist_sq_coord] at hAOBsq hAOVsq
  rw [sevenPoint_dist_sq_coord, sevenPoint_dist_sq_coord] at hAOWsq hBCUsq
  rw [sevenPoint_dist_sq_coord, sevenPoint_dist_sq_coord] at hBCVsq hCAVsq
  rw [sevenPoint_dist_sq_coord, sevenPoint_dist_sq_coord] at hUCWsq hVAUsq
  rw [sevenPoint_dist_sq_coord, sevenPoint_dist_sq_coord] at hVAWsq hWOBsq
  rw [sevenPoint_dist_sq_coord, sevenPoint_dist_sq_coord] at hWOUsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hOABsq hOACsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hAOBsq hAOVsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hAOWsq hBCUsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hBCVsq hCAVsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hUCWsq hVAUsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hVAWsq hWOBsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hWOUsq
  grobner

/-- The seven-point distance equalities force the two anchor labels to collide. -/
theorem seven_point_orbit_collision
    {O A B C U V W : ℝ²}
    (hOA_OB : dist O A = dist O B)
    (hOA_OC : dist O A = dist O C)
    (hAO_AB : dist A O = dist A B)
    (hAO_AV : dist A O = dist A V)
    (hAO_AW : dist A O = dist A W)
    (hBC_BU : dist B C = dist B U)
    (hBC_BV : dist B C = dist B V)
    (hCA_CV : dist C A = dist C V)
    (hUC_UW : dist U C = dist U W)
    (hVA_VU : dist V A = dist V U)
    (hVA_VW : dist V A = dist V W)
    (hWO_WB : dist W O = dist W B)
    (hWO_WU : dist W O = dist W U) : O = A := by
  by_contra hOA
  let T : ℝ² → ℝ² := normSim O A
  let b := T B
  let c := T C
  let u := T U
  let v := T V
  let w := T W
  have hdist (X Y : ℝ²) :
      dist (T X) (T Y) = (dist O A)⁻¹ * dist X Y := by
    simpa [T] using normSim_dist_image O A hOA X Y
  have hT0 : T O = pt 0 0 := by
    simpa [T] using normSim_fst O A
  have hT1 : T A = pt 1 0 := by
    simpa [T] using normSim_snd O A hOA
  have map_dist_eq {X Y Z R : ℝ²} (h : dist X Y = dist Z R) :
      dist (T X) (T Y) = dist (T Z) (T R) := by
    rw [hdist, hdist, h]
  apply normalized_sevenPoint_incompatible
      (B := b) (C := c) (U := u) (V := v) (W := w)
  · simpa [b, hT0, hT1] using map_dist_eq hOA_OB
  · simpa [c, hT0, hT1] using map_dist_eq hOA_OC
  · simpa [b, hT0, hT1] using map_dist_eq hAO_AB
  · simpa [v, hT0, hT1] using map_dist_eq hAO_AV
  · simpa [w, hT0, hT1] using map_dist_eq hAO_AW
  · simpa [b, c, u] using map_dist_eq hBC_BU
  · simpa [b, c, v] using map_dist_eq hBC_BV
  · simpa [c, v, hT1] using map_dist_eq hCA_CV
  · simpa [c, u, w] using map_dist_eq hUC_UW
  · simpa [u, v, hT1] using map_dist_eq hVA_VU
  · simpa [v, w, hT1] using map_dist_eq hVA_VW
  · simpa [b, w, hT0] using map_dist_eq hWO_WB
  · simpa [u, w, hT0] using map_dist_eq hWO_WU

/-- Equality-closure data for the seven-point orbit collision. -/
structure SevenPointOrbitCollisionCore {alpha : Type*} (P : RowPattern alpha) where
  O : alpha
  A : alpha
  B : alpha
  C : alpha
  U : alpha
  V : alpha
  W : alpha
  hOA : O ≠ A
  OA_OB : EdgeClosure P (O, A) (O, B)
  OA_OC : EdgeClosure P (O, A) (O, C)
  AO_AB : EdgeClosure P (A, O) (A, B)
  AO_AV : EdgeClosure P (A, O) (A, V)
  AO_AW : EdgeClosure P (A, O) (A, W)
  BC_BU : EdgeClosure P (B, C) (B, U)
  BC_BV : EdgeClosure P (B, C) (B, V)
  CA_CV : EdgeClosure P (C, A) (C, V)
  UC_UW : EdgeClosure P (U, C) (U, W)
  VA_VU : EdgeClosure P (V, A) (V, U)
  VA_VW : EdgeClosure P (V, A) (V, W)
  WO_WB : EdgeClosure P (W, O) (W, B)
  WO_WU : EdgeClosure P (W, O) (W, U)

/-- A seven-point orbit collision core has no injective planar realization. -/
theorem not_realizes_of_sevenPointOrbitCollisionCore
    {alpha : Type*} {P : RowPattern alpha}
    (core : SevenPointOrbitCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  have hcollision := seven_point_orbit_collision
    (by simpa [edgeDist] using sound core.OA_OB)
    (by simpa [edgeDist] using sound core.OA_OC)
    (by simpa [edgeDist] using sound core.AO_AB)
    (by simpa [edgeDist] using sound core.AO_AV)
    (by simpa [edgeDist] using sound core.AO_AW)
    (by simpa [edgeDist] using sound core.BC_BU)
    (by simpa [edgeDist] using sound core.BC_BV)
    (by simpa [edgeDist] using sound core.CA_CV)
    (by simpa [edgeDist] using sound core.UC_UW)
    (by simpa [edgeDist] using sound core.VA_VU)
    (by simpa [edgeDist] using sound core.VA_VW)
    (by simpa [edgeDist] using sound core.WO_WB)
    (by simpa [edgeDist] using sound core.WO_WU)
  exact core.hOA (hreal.injective hcollision)

end EqualityCore
end Census554
end Problem97

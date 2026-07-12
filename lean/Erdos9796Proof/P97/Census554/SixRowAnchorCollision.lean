/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Six-row anchor collision core

This file isolates a six-label distance-equality obstruction extracted from
the general-`m` pinned-surplus probe. The proof is independent of the probe and
uses only the abstract equality closure of selected rows.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem sixRow_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

set_option maxHeartbeats 2000000 in
-- The kernel-checked Groebner certificate spans all nine distance equations.
/-- The normalized six-row scalar system is inconsistent. -/
private theorem normalized_sixRow_incompatible
    {B C U V : ℝ²}
    (hOB_OC : dist (pt 0 0) B = dist (pt 0 0) C)
    (hAB_AO : dist (pt 1 0) B = dist (pt 1 0) (pt 0 0))
    (hAU_AO : dist (pt 1 0) U = dist (pt 1 0) (pt 0 0))
    (hBC_BA : dist B C = dist B (pt 1 0))
    (hUV_UO : dist U V = dist U (pt 0 0))
    (hCU_CA : dist C U = dist C (pt 1 0))
    (hCV_CA : dist C V = dist C (pt 1 0))
    (hVB_VA : dist V B = dist V (pt 1 0))
    (hVC_VA : dist V C = dist V (pt 1 0)) : False := by
  have hOBsq := congrArg (fun r : ℝ => r ^ 2) hOB_OC
  have hABsq := congrArg (fun r : ℝ => r ^ 2) hAB_AO
  have hAUsq := congrArg (fun r : ℝ => r ^ 2) hAU_AO
  have hBCsq := congrArg (fun r : ℝ => r ^ 2) hBC_BA
  have hUVsq := congrArg (fun r : ℝ => r ^ 2) hUV_UO
  have hCUsq := congrArg (fun r : ℝ => r ^ 2) hCU_CA
  have hCVsq := congrArg (fun r : ℝ => r ^ 2) hCV_CA
  have hVBsq := congrArg (fun r : ℝ => r ^ 2) hVB_VA
  have hVCsq := congrArg (fun r : ℝ => r ^ 2) hVC_VA
  change dist (pt 0 0) B ^ 2 = dist (pt 0 0) C ^ 2 at hOBsq
  change dist (pt 1 0) B ^ 2 = dist (pt 1 0) (pt 0 0) ^ 2 at hABsq
  change dist (pt 1 0) U ^ 2 = dist (pt 1 0) (pt 0 0) ^ 2 at hAUsq
  change dist B C ^ 2 = dist B (pt 1 0) ^ 2 at hBCsq
  change dist U V ^ 2 = dist U (pt 0 0) ^ 2 at hUVsq
  change dist C U ^ 2 = dist C (pt 1 0) ^ 2 at hCUsq
  change dist C V ^ 2 = dist C (pt 1 0) ^ 2 at hCVsq
  change dist V B ^ 2 = dist V (pt 1 0) ^ 2 at hVBsq
  change dist V C ^ 2 = dist V (pt 1 0) ^ 2 at hVCsq
  rw [sixRow_dist_sq_coord, sixRow_dist_sq_coord] at hOBsq hABsq hAUsq
  rw [sixRow_dist_sq_coord, sixRow_dist_sq_coord] at hBCsq hUVsq hCUsq
  rw [sixRow_dist_sq_coord, sixRow_dist_sq_coord] at hCVsq hVBsq hVCsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hOBsq hABsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hAUsq hBCsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hUVsq hCUsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hCVsq hVBsq hVCsq
  grobner

/-- The six-row distance equalities force the two anchor labels to collide. -/
theorem six_row_anchor_collision
    {O A B C U V : ℝ²}
    (hOB_OC : dist O B = dist O C)
    (hAB_AO : dist A B = dist A O)
    (hAU_AO : dist A U = dist A O)
    (hBC_BA : dist B C = dist B A)
    (hUV_UO : dist U V = dist U O)
    (hCU_CA : dist C U = dist C A)
    (hCV_CA : dist C V = dist C A)
    (hVB_VA : dist V B = dist V A)
    (hVC_VA : dist V C = dist V A) : O = A := by
  by_contra hOA
  let T : ℝ² → ℝ² := normSim O A
  let b := T B
  let c := T C
  let u := T U
  let v := T V
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
  apply normalized_sixRow_incompatible
      (B := b) (C := c) (U := u) (V := v)
  · simpa [b, c, hT0] using map_dist_eq hOB_OC
  · simpa [b, hT0, hT1] using map_dist_eq hAB_AO
  · simpa [u, hT0, hT1] using map_dist_eq hAU_AO
  · simpa [b, c, hT1] using map_dist_eq hBC_BA
  · simpa [u, v, hT0] using map_dist_eq hUV_UO
  · simpa [c, u, hT1] using map_dist_eq hCU_CA
  · simpa [c, v, hT1] using map_dist_eq hCV_CA
  · simpa [v, b, hT1] using map_dist_eq hVB_VA
  · simpa [v, c, hT1] using map_dist_eq hVC_VA

/-- Equality-closure form of the six-row anchor collision. -/
structure SixRowAnchorCollisionCore {alpha : Type*} (P : RowPattern alpha) where
  O : alpha
  A : alpha
  B : alpha
  C : alpha
  U : alpha
  V : alpha
  hOA : O ≠ A
  OB_OC : EdgeClosure P (O, B) (O, C)
  AB_AO : EdgeClosure P (A, B) (A, O)
  AU_AO : EdgeClosure P (A, U) (A, O)
  BC_BA : EdgeClosure P (B, C) (B, A)
  UV_UO : EdgeClosure P (U, V) (U, O)
  CU_CA : EdgeClosure P (C, U) (C, A)
  CV_CA : EdgeClosure P (C, V) (C, A)
  VB_VA : EdgeClosure P (V, B) (V, A)
  VC_VA : EdgeClosure P (V, C) (V, A)

/-- A six-row anchor collision core has no injective planar realization. -/
theorem not_realizes_of_sixRowAnchorCollisionCore
    {alpha : Type*} {P : RowPattern alpha}
    (core : SixRowAnchorCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  have hcollision := six_row_anchor_collision
    (by simpa [edgeDist] using sound core.OB_OC)
    (by simpa [edgeDist] using sound core.AB_AO)
    (by simpa [edgeDist] using sound core.AU_AO)
    (by simpa [edgeDist] using sound core.BC_BA)
    (by simpa [edgeDist] using sound core.UV_UO)
    (by simpa [edgeDist] using sound core.CU_CA)
    (by simpa [edgeDist] using sound core.CV_CA)
    (by simpa [edgeDist] using sound core.VB_VA)
    (by simpa [edgeDist] using sound core.VC_VA)
  exact core.hOA (hreal.injective hcollision)

end EqualityCore
end Census554
end Problem97

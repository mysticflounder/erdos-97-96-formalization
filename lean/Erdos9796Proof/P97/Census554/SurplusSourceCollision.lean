/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Surplus-source collision core

This file isolates a seven-point distance-equality obstruction extracted from
the general-`m` pinned-surplus probe. The proof uses a similarity
normalization followed by a reflection encoded directly in scalar
coordinates. It does not depend on the probe or on a generated polynomial
certificate.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem surplusSource_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

/-- The reflected scalar system left by the normalized seven-point
obstruction is inconsistent. -/
private theorem surplusSource_scalar_incompatible
    {k ux uy vx vy wx wy : ℝ}
    (hk : 4 * k ^ 2 = 3)
    (huLine : 2 * ux * (k - 1) + uy = 0)
    (huCircle : ux ^ 2 + uy ^ 2 - 2 * k * ux + 2 * k - uy - 1 = 0)
    (hvLine : 2 * k * vx + vy = 1)
    (hvCircle : vx ^ 2 + vy ^ 2 - vx - 2 * k * vy = 0)
    (hwC : wx + 2 * k * wy = 1)
    (hwU : 2 * (wx * ux + wy * uy) = ux ^ 2 + uy ^ 2)
    (hwV : 2 * (wx * vx + wy * vy) = vx ^ 2 + vy ^ 2) : False := by
  have hk_ne_one : k - 1 ≠ 0 := by
    intro h
    nlinarith only [hk, h]
  have htwo_k_ne_one : 2 * k - 1 ≠ 0 := by
    intro h
    nlinarith only [hk, h]
  have htwo_k_ne_neg_one : 2 * k + 1 ≠ 0 := by
    intro h
    nlinarith only [hk, h]
  have hfactor :
      (2 * ux - 1) * (4 * k * ux + 2 * k - 4 * ux - 1) = 0 := by
    linear_combination
      ux ^ 2 * hk - huCircle +
        (-2 * k * ux + 2 * ux + uy - 1) * huLine
  rcases mul_eq_zero.mp hfactor with huxFirst | huxSecond
  · have hux : ux = 1 / 2 := by linarith only [huxFirst]
    rw [hux] at huLine
    have huy : uy = 1 - k := by linarith only [huLine]
    rw [hux, huy] at hwU
    have hwyFactor : (2 * k - 1) * (2 * wy - 1) = 0 := by
      linear_combination -hwU + hwC - (1 / 4) * hk
    have hwy : wy = 1 / 2 := by
      have := (mul_eq_zero.mp hwyFactor).resolve_left htwo_k_ne_one
      linarith only [this]
    rw [hwy] at hwC
    have hwx : wx = 1 - k := by linarith only [hwC]
    have hvy : vy = 1 - 2 * k * vx := by linarith only [hvLine]
    rw [hvy] at hvCircle
    have hvQuad :
        -4 * k * vx - 2 * k + 4 * vx ^ 2 + 2 * vx + 1 = 0 := by
      linear_combination hvCircle - vx * (vx + 1) * hk
    rw [hwx, hwy, hvy] at hwV
    have hvFactor : vx * (2 * vx - 1) = 0 := by
      linear_combination (-1 / 2) * hwV - (vx ^ 2 / 2) * hk
    rcases mul_eq_zero.mp hvFactor with hvxZero | hvxHalf
    · rw [hvxZero] at hvQuad
      nlinarith only [hk, hvQuad]
    · have hvx : vx = 1 / 2 := by linarith only [hvxHalf]
      rw [hvx] at hvQuad
      nlinarith only [hk, hvQuad]
  · have huxProduct : (k - 1) * (ux - (k + 1 / 2)) = 0 := by
      linear_combination (1 / 4) * huxSecond - (1 / 4) * hk
    have hux : ux = k + 1 / 2 := by
      have := (mul_eq_zero.mp huxProduct).resolve_left hk_ne_one
      linarith only [this]
    have huy : uy = k - 1 / 2 := by
      rw [hux] at huLine
      nlinarith only [hk, huLine]
    rw [hux, huy] at hwU
    have hwyEq : 2 * k - 4 * wy - 1 = 0 := by
      linear_combination
        hwU + (-1 - 2 * k) * hwC + (1 / 2 + wy) * hk
    have hwy : wy = k / 2 - 1 / 4 := by linarith only [hwyEq]
    have hwx : wx = 1 / 4 + k / 2 := by
      rw [hwy] at hwC
      nlinarith only [hk, hwC]
    have hvy : vy = 1 - 2 * k * vx := by linarith only [hvLine]
    rw [hvy] at hvCircle
    have hvQuad :
        -4 * k * vx - 2 * k + 4 * vx ^ 2 + 2 * vx + 1 = 0 := by
      linear_combination hvCircle - vx * (vx + 1) * hk
    rw [hwx, hwy, hvy] at hwV
    have hvW :
        12 * k * vx + 2 * k - 8 * vx ^ 2 - 2 * vx - 3 = 0 := by
      linear_combination 2 * hwV + vx * (2 * vx + 1) * hk
    have hvFactor : (2 * k + 1) * (2 * vx - 1) = 0 := by
      nlinarith only [hvQuad, hvW]
    have hvx : vx = 1 / 2 := by
      have := (mul_eq_zero.mp hvFactor).resolve_left htwo_k_ne_neg_one
      linarith only [this]
    rw [hvx] at hvQuad
    nlinarith only [hk, hvQuad]

set_option maxHeartbeats 2000000 in
-- Expanding the eleven planar distance equalities dominates this reduction.
/-- Normalized metric form of the surplus-source obstruction. -/
private theorem normalized_surplusSource_incompatible
    {B C U V W : ℝ²}
    (hB0_B1 : dist B (pt 0 0) = dist (pt 1 0) (pt 0 0))
    (hC0_B1 : dist C (pt 0 0) = dist (pt 1 0) (pt 0 0))
    (hC1_C0 : dist C (pt 1 0) = dist C (pt 0 0))
    (hU1_UB : dist U (pt 1 0) = dist U B)
    (hBU_B1 : dist B U = dist B (pt 1 0))
    (hBC_B1 : dist B C = dist B (pt 1 0))
    (hCV_C0 : dist C V = dist C (pt 0 0))
    (hVB_V0 : dist V B = dist V (pt 0 0))
    (hWU_W0 : dist W U = dist W (pt 0 0))
    (hWC_W0 : dist W C = dist W (pt 0 0))
    (hWV_W0 : dist W V = dist W (pt 0 0)) : False := by
  have hBsq := congrArg (fun r : ℝ => r ^ 2) hB0_B1
  have hCsq := congrArg (fun r : ℝ => r ^ 2) hC0_B1
  have hCcenterSq := congrArg (fun r : ℝ => r ^ 2) hC1_C0
  have hUsq := congrArg (fun r : ℝ => r ^ 2) hU1_UB
  have hBUsq := congrArg (fun r : ℝ => r ^ 2) hBU_B1
  have hBCsq := congrArg (fun r : ℝ => r ^ 2) hBC_B1
  have hCVsq := congrArg (fun r : ℝ => r ^ 2) hCV_C0
  have hVBsq := congrArg (fun r : ℝ => r ^ 2) hVB_V0
  have hWUsq := congrArg (fun r : ℝ => r ^ 2) hWU_W0
  have hWCsq := congrArg (fun r : ℝ => r ^ 2) hWC_W0
  have hWVsq := congrArg (fun r : ℝ => r ^ 2) hWV_W0
  change dist B (pt 0 0) ^ 2 = dist (pt 1 0) (pt 0 0) ^ 2 at hBsq
  change dist C (pt 0 0) ^ 2 = dist (pt 1 0) (pt 0 0) ^ 2 at hCsq
  change dist C (pt 1 0) ^ 2 = dist C (pt 0 0) ^ 2 at hCcenterSq
  change dist U (pt 1 0) ^ 2 = dist U B ^ 2 at hUsq
  change dist B U ^ 2 = dist B (pt 1 0) ^ 2 at hBUsq
  change dist B C ^ 2 = dist B (pt 1 0) ^ 2 at hBCsq
  change dist C V ^ 2 = dist C (pt 0 0) ^ 2 at hCVsq
  change dist V B ^ 2 = dist V (pt 0 0) ^ 2 at hVBsq
  change dist W U ^ 2 = dist W (pt 0 0) ^ 2 at hWUsq
  change dist W C ^ 2 = dist W (pt 0 0) ^ 2 at hWCsq
  change dist W V ^ 2 = dist W (pt 0 0) ^ 2 at hWVsq
  rw [surplusSource_dist_sq_coord, surplusSource_dist_sq_coord] at hBsq hCsq
  rw [surplusSource_dist_sq_coord, surplusSource_dist_sq_coord] at hCcenterSq
  rw [surplusSource_dist_sq_coord, surplusSource_dist_sq_coord] at hUsq
  rw [surplusSource_dist_sq_coord, surplusSource_dist_sq_coord] at hBUsq
  rw [surplusSource_dist_sq_coord, surplusSource_dist_sq_coord] at hBCsq
  rw [surplusSource_dist_sq_coord, surplusSource_dist_sq_coord] at hCVsq
  rw [surplusSource_dist_sq_coord, surplusSource_dist_sq_coord] at hVBsq
  rw [surplusSource_dist_sq_coord, surplusSource_dist_sq_coord] at hWUsq
  rw [surplusSource_dist_sq_coord, surplusSource_dist_sq_coord] at hWCsq
  rw [surplusSource_dist_sq_coord, surplusSource_dist_sq_coord] at hWVsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hBsq hCsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hCcenterSq hUsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hBUsq hBCsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hCVsq hVBsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hWUsq hWCsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hWVsq
  have hBnorm : B 0 ^ 2 + B 1 ^ 2 = 1 := by
    nlinarith only [hBsq]
  have hCnorm : C 0 ^ 2 + C 1 ^ 2 = 1 := by
    nlinarith only [hCsq]
  have hCx : C 0 = 1 / 2 := by
    nlinarith only [hCcenterSq]
  have hCy : 4 * C 1 ^ 2 = 3 := by
    nlinarith only [hCnorm, hCx]
  have hBCrel : B 0 = 2 * B 1 * C 1 := by
    nlinarith only [hBCsq, hBnorm, hCnorm, hCx]
  have hBCrelSq := congrArg (fun r : ℝ => r ^ 2) hBCrel
  have hBxBy : B 0 ^ 2 = 3 * B 1 ^ 2 := by
    linear_combination hBCrelSq + B 1 ^ 2 * hCy
  have hBy : 4 * B 1 ^ 2 = 1 := by
    nlinarith only [hBnorm, hBxBy]
  have hBx : 4 * B 0 ^ 2 = 3 := by
    nlinarith only [hBnorm, hBy]
  have hrefSq (z : ℝ) : (2 * B 1 * z) ^ 2 = z ^ 2 := by
    calc
      (2 * B 1 * z) ^ 2 = (4 * B 1 ^ 2) * z ^ 2 := by ring
      _ = z ^ 2 := by rw [hBy]; ring
  have hrefMul (z t : ℝ) :
      (2 * B 1 * z) * (2 * B 1 * t) = z * t := by
    calc
      (2 * B 1 * z) * (2 * B 1 * t) =
          (4 * B 1 ^ 2) * (z * t) := by ring
      _ = z * t := by rw [hBy]; ring
  have hrefC (z : ℝ) :
      2 * B 0 * (2 * B 1 * z) = 2 * C 1 * z := by
    rw [hBCrel]
    calc
      2 * (2 * B 1 * C 1) * (2 * B 1 * z) =
          (4 * B 1 ^ 2) * (2 * C 1 * z) := by ring
      _ = 2 * C 1 * z := by rw [hBy]; ring
  have huLine :
      2 * U 0 * (B 0 - 1) + 2 * B 1 * U 1 = 0 := by
    nlinarith only [hUsq, hBnorm]
  have huCircle :
      U 0 ^ 2 + (2 * B 1 * U 1) ^ 2 - 2 * B 0 * U 0 +
          2 * B 0 - 2 * B 1 * U 1 - 1 = 0 := by
    nlinarith only [hBUsq, hBnorm, hrefSq (U 1)]
  have hvLine :
      2 * B 0 * V 0 + 2 * B 1 * V 1 = 1 := by
    nlinarith only [hVBsq, hBnorm]
  have hvCircle :
      V 0 ^ 2 + (2 * B 1 * V 1) ^ 2 - V 0 -
          2 * B 0 * (2 * B 1 * V 1) = 0 := by
    nlinarith only [hCVsq, hCnorm, hCx, hrefSq (V 1), hrefC (V 1)]
  have hwC :
      W 0 + 2 * B 0 * (2 * B 1 * W 1) = 1 := by
    nlinarith only [hWCsq, hCnorm, hCx, hrefC (W 1)]
  have hwU :
      2 * (W 0 * U 0 + (2 * B 1 * W 1) * (2 * B 1 * U 1)) =
        U 0 ^ 2 + (2 * B 1 * U 1) ^ 2 := by
    nlinarith only [hWUsq, hrefSq (U 1), hrefMul (W 1) (U 1)]
  have hwV :
      2 * (W 0 * V 0 + (2 * B 1 * W 1) * (2 * B 1 * V 1)) =
        V 0 ^ 2 + (2 * B 1 * V 1) ^ 2 := by
    nlinarith only [hWVsq, hrefSq (V 1), hrefMul (W 1) (V 1)]
  exact surplusSource_scalar_incompatible hBx huLine huCircle hvLine
    hvCircle hwC hwU hwV

/-- The eleven distance equalities of the surplus-source obstruction force
the two anchor labels to collide. -/
theorem surplus_source_collision
    {O A B C U V W : ℝ²}
    (hOA_OB : dist O A = dist O B)
    (hOB_OC : dist O B = dist O C)
    (hCA_CO : dist C A = dist C O)
    (hUA_UB : dist U A = dist U B)
    (hBU_BA : dist B U = dist B A)
    (hBC_BA : dist B C = dist B A)
    (hCV_CO : dist C V = dist C O)
    (hVB_VO : dist V B = dist V O)
    (hWU_WO : dist W U = dist W O)
    (hWC_WO : dist W C = dist W O)
    (hWV_WO : dist W V = dist W O) : O = A := by
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
  apply normalized_surplusSource_incompatible
      (B := b) (C := c) (U := u) (V := v) (W := w)
  · simpa [b, hT0, hT1, dist_comm] using (map_dist_eq hOA_OB).symm
  · have hOA_OC : dist O A = dist O C := hOA_OB.trans hOB_OC
    simpa [c, hT0, hT1, dist_comm] using (map_dist_eq hOA_OC).symm
  · simpa [c, hT0, hT1] using map_dist_eq hCA_CO
  · simpa [u, b, hT1] using map_dist_eq hUA_UB
  · simpa [b, u, hT1] using map_dist_eq hBU_BA
  · simpa [b, c, hT1] using map_dist_eq hBC_BA
  · simpa [c, v, hT0] using map_dist_eq hCV_CO
  · simpa [v, b, hT0] using map_dist_eq hVB_VO
  · simpa [w, u, hT0] using map_dist_eq hWU_WO
  · simpa [w, c, hT0] using map_dist_eq hWC_WO
  · simpa [w, v, hT0] using map_dist_eq hWV_WO

/-- Equality-closure form of the surplus-source collision. -/
structure SurplusSourceCollisionCore {alpha : Type*} (P : RowPattern alpha) where
  O : alpha
  A : alpha
  B : alpha
  C : alpha
  U : alpha
  V : alpha
  W : alpha
  hOA : O ≠ A
  OA_OB : EdgeClosure P (O, A) (O, B)
  OB_OC : EdgeClosure P (O, B) (O, C)
  CA_CO : EdgeClosure P (C, A) (C, O)
  UA_UB : EdgeClosure P (U, A) (U, B)
  BU_BA : EdgeClosure P (B, U) (B, A)
  BC_BA : EdgeClosure P (B, C) (B, A)
  CV_CO : EdgeClosure P (C, V) (C, O)
  VB_VO : EdgeClosure P (V, B) (V, O)
  WU_WO : EdgeClosure P (W, U) (W, O)
  WC_WO : EdgeClosure P (W, C) (W, O)
  WV_WO : EdgeClosure P (W, V) (W, O)

/-- A surplus-source collision core has no injective planar realization. -/
theorem not_realizes_of_surplusSourceCollisionCore
    {alpha : Type*} {P : RowPattern alpha}
    (core : SurplusSourceCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  have hcollision := surplus_source_collision
    (by simpa [edgeDist] using sound core.OA_OB)
    (by simpa [edgeDist] using sound core.OB_OC)
    (by simpa [edgeDist] using sound core.CA_CO)
    (by simpa [edgeDist] using sound core.UA_UB)
    (by simpa [edgeDist] using sound core.BU_BA)
    (by simpa [edgeDist] using sound core.BC_BA)
    (by simpa [edgeDist] using sound core.CV_CO)
    (by simpa [edgeDist] using sound core.VB_VO)
    (by simpa [edgeDist] using sound core.WU_WO)
    (by simpa [edgeDist] using sound core.WC_WO)
    (by simpa [edgeDist] using sound core.WV_WO)
  exact core.hOA (hreal.injective hcollision)

end EqualityCore
end Census554
end Problem97

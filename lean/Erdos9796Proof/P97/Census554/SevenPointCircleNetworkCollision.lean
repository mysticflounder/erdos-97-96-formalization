/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Seven-point circle-network collision core

This file isolates a seven-label distance-equality obstruction. The normalized
coordinate contradiction is reduced to small Gram-determinant and polynomial
identities.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem circleNetwork_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

/-- Coordinate dot product used by the normalized calculation. -/
private def circleNetwork_dot (x y : ℝ²) : ℝ :=
  x 0 * y 0 + x 1 * y 1

/-- Coordinate squared norm used by the normalized calculation. -/
private def circleNetwork_normSq (x : ℝ²) : ℝ :=
  circleNetwork_dot x x

private theorem circleNetwork_dot_comm (x y : ℝ²) :
    circleNetwork_dot x y = circleNetwork_dot y x := by
  simp only [circleNetwork_dot]
  ring

private theorem circleNetwork_dot_add_right (x y z : ℝ²) :
    circleNetwork_dot x (y + z) = circleNetwork_dot x y + circleNetwork_dot x z := by
  simp only [circleNetwork_dot, PiLp.add_apply]
  ring

private theorem circleNetwork_dot_sub_left (x y z : ℝ²) :
    circleNetwork_dot (x - y) z = circleNetwork_dot x z - circleNetwork_dot y z := by
  simp only [circleNetwork_dot, PiLp.sub_apply]
  ring

private theorem circleNetwork_dot_sub_right (x y z : ℝ²) :
    circleNetwork_dot x (y - z) = circleNetwork_dot x y - circleNetwork_dot x z := by
  simp only [circleNetwork_dot, PiLp.sub_apply]
  ring

private theorem circleNetwork_dot_smul_left (r : ℝ) (x y : ℝ²) :
    circleNetwork_dot (r • x) y = r * circleNetwork_dot x y := by
  simp only [circleNetwork_dot, PiLp.smul_apply, smul_eq_mul]
  ring

private theorem circleNetwork_dot_smul_right (r : ℝ) (x y : ℝ²) :
    circleNetwork_dot x (r • y) = r * circleNetwork_dot x y := by
  simp only [circleNetwork_dot, PiLp.smul_apply, smul_eq_mul]
  ring

private theorem circleNetwork_normSq_add (x y : ℝ²) :
    circleNetwork_normSq (x + y) =
      circleNetwork_normSq x + circleNetwork_normSq y + 2 * circleNetwork_dot x y := by
  simp only [circleNetwork_normSq, circleNetwork_dot, PiLp.add_apply]
  ring

private theorem circleNetwork_normSq_sub (x y : ℝ²) :
    circleNetwork_normSq (x - y) =
      circleNetwork_normSq x + circleNetwork_normSq y - 2 * circleNetwork_dot x y := by
  simp only [circleNetwork_normSq, circleNetwork_dot, PiLp.sub_apply]
  ring

private theorem circleNetwork_normSq_sub_comm (x y : ℝ²) :
    circleNetwork_normSq (x - y) = circleNetwork_normSq (y - x) := by
  simp only [circleNetwork_normSq, circleNetwork_dot, PiLp.sub_apply]
  ring

private theorem circleNetwork_normSq_sub_sub_smul (w u b : ℝ²) (r : ℝ) :
    circleNetwork_normSq (w - u - r • b) =
      circleNetwork_normSq w + circleNetwork_normSq u + r ^ 2 * circleNetwork_normSq b
        - 2 * circleNetwork_dot w u - 2 * r * circleNetwork_dot w b
        + 2 * r * circleNetwork_dot u b := by
  simp only [circleNetwork_normSq, circleNetwork_dot, PiLp.sub_apply,
    PiLp.smul_apply, smul_eq_mul]
  ring

private theorem circleNetwork_normSq_nonneg (x : ℝ²) :
    0 ≤ circleNetwork_normSq x := by
  simp only [circleNetwork_normSq, circleNetwork_dot]
  nlinarith only [sq_nonneg (x 0), sq_nonneg (x 1)]

private theorem circleNetwork_eq_zero_of_normSq_eq_zero {x : ℝ²}
    (h : circleNetwork_normSq x = 0) : x = 0 := by
  have h' : x 0 ^ 2 + x 1 ^ 2 = 0 := by
    simpa [circleNetwork_normSq, circleNetwork_dot, pow_two] using h
  have hx0 : x 0 = 0 := by
    nlinarith only [h', sq_nonneg (x 0), sq_nonneg (x 1)]
  have hx1 : x 1 = 0 := by
    nlinarith only [h', sq_nonneg (x 0), sq_nonneg (x 1)]
  ext i
  fin_cases i
  · simpa using hx0
  · simpa using hx1

/-- The expanded Gram determinant of three vectors in `ℝ²` vanishes. -/
private theorem circleNetwork_planar_gram_det_zero (x y z : ℝ²) :
    circleNetwork_normSq x * circleNetwork_normSq y * circleNetwork_normSq z
      + 2 * circleNetwork_dot x y * circleNetwork_dot x z * circleNetwork_dot y z
      - circleNetwork_normSq x * circleNetwork_dot y z ^ 2
      - circleNetwork_normSq y * circleNetwork_dot x z ^ 2
      - circleNetwork_normSq z * circleNetwork_dot x y ^ 2 = 0 := by
  simp only [circleNetwork_normSq, circleNetwork_dot]
  ring

/-- Low-degree scalar terminal for the nonzero-`δ` branch. -/
private theorem circleNetwork_scalar_incompatible
    {t X Y δ : ℝ}
    (hdelta : δ = t - X)
    (hdelta_ne : δ ≠ 0)
    (hP : 4 * t ^ 2 - 2 * t - 1 = 0)
    (hC0 : 4 * δ ^ 2 - 6 * (1 - Y) = 0)
    (hG : 1 + 2 * t * X * Y - X ^ 2 - Y ^ 2 - t ^ 2 = 0)
    (hR :
      (6 * t - 3 - 4 * δ ^ 2) ^ 2
        + 8 * (1 - t) * (2 * δ ^ 2 - 6 * t * δ) ^ 2
        - 96 * (1 - t) * δ ^ 2 = 0) : False := by
  let F := 2 * X ^ 2 + 2 * t * X + t - 1
  have hmaster :
      8 * δ ^ 2 * F =
        6 * (Y - 1) * (4 * t ^ 2 - 2 * t - 1)
          + (4 * t * X + 4 * X ^ 2 + 2 * t - 6 * Y - 5)
            * (4 * δ ^ 2 - 6 * (1 - Y))
          - 36 * (1 + 2 * t * X * Y - X ^ 2 - Y ^ 2 - t ^ 2) := by
    dsimp [F]
    rw [hdelta]
    ring
  rw [hP, hC0, hG] at hmaster
  have hprod : δ ^ 2 * F = 0 := by
    nlinarith only [hmaster]
  have hdelta_sq_ne : δ ^ 2 ≠ 0 := pow_ne_zero 2 hdelta_ne
  have hF : F = 0 := (mul_eq_zero.mp hprod).resolve_left hdelta_sq_ne
  have hX : X = t - δ := by
    linarith only [hdelta]
  have hF' := hF
  dsimp [F] at hF'
  rw [hX] at hF'
  have hQ : 2 * δ ^ 2 - 6 * t * δ + 3 * t = 0 := by
    linear_combination hF' - hP
  let H := 4 * t - 1 - 4 * t * δ
  have hHsq : 3 * H ^ 2 = 16 * δ ^ 2 - 12 * t - 6 * δ + 6 := by
    dsimp [H]
    linear_combination
      (12 * δ ^ 2 - 6 * δ + 3) * hP + (12 * t - 2) * hQ
  have htWeight : 8 * (1 - t) * t ^ 2 = 1 := by
    linear_combination (1 - 2 * t) * hP
  have hdeltaWeight :
      8 * (1 - t) * δ ^ 2 = 4 * δ ^ 2 - 6 * δ + 3 := by
    linear_combination (3 - 6 * δ) * hP + (2 - 4 * t) * hQ
  have hfirst : 6 * t - 3 - 4 * δ ^ 2 = 3 * H := by
    dsimp [H]
    linear_combination (-2) * hQ
  have hsecond : 2 * δ ^ 2 - 6 * t * δ = -3 * t := by
    linear_combination hQ
  have hR' := hR
  rw [hfirst, hsecond] at hR'
  have hell : 6 * δ - 4 * t - 1 = 0 := by
    nlinarith only [hR', hHsq, htWeight, hdeltaWeight]
  have h16 : 16 * t - 13 = 0 := by
    linear_combination
      14 * hP + 18 * hQ - (6 * δ - 14 * t + 1) * hell
  have hlast :
      (1 : ℝ) =
        64 * (4 * t ^ 2 - 2 * t - 1)
          - (16 * t - 13) ^ 2 - 18 * (16 * t - 13) := by
    ring
  rw [hP, h16] at hlast
  norm_num at hlast

set_option maxHeartbeats 2000000 in
-- The eleven distance-to-dot conversions share one theorem-level heartbeat budget.
/-- The normalized seven-point circle-network system is inconsistent. -/
private theorem normalized_circleNetwork_incompatible
    {B C U V W : ℝ²}
    (hOA_OB : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) B)
    (hOA_OU : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) U)
    (hAO_AV : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) V)
    (hBO_BC : dist B (pt 0 0) = dist B C)
    (hBO_BW : dist B (pt 0 0) = dist B W)
    (hCA_CU : dist C (pt 1 0) = dist C U)
    (hCA_CW : dist C (pt 1 0) = dist C W)
    (hUB_UV : dist U B = dist U V)
    (hUB_UW : dist U B = dist U W)
    (hVB_VW : dist V B = dist V W)
    (hWO_WU : dist W (pt 0 0) = dist W U) : False := by
  have hOABsq := congrArg (fun r : ℝ => r ^ 2) hOA_OB
  have hOAUsq := congrArg (fun r : ℝ => r ^ 2) hOA_OU
  have hAOVsq := congrArg (fun r : ℝ => r ^ 2) hAO_AV
  have hBOCsq := congrArg (fun r : ℝ => r ^ 2) hBO_BC
  have hBOWsq := congrArg (fun r : ℝ => r ^ 2) hBO_BW
  have hCACUsq := congrArg (fun r : ℝ => r ^ 2) hCA_CU
  have hCACWsq := congrArg (fun r : ℝ => r ^ 2) hCA_CW
  have hUBVsq := congrArg (fun r : ℝ => r ^ 2) hUB_UV
  have hUBWsq := congrArg (fun r : ℝ => r ^ 2) hUB_UW
  have hVBWsq := congrArg (fun r : ℝ => r ^ 2) hVB_VW
  have hWOWUsq := congrArg (fun r : ℝ => r ^ 2) hWO_WU
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) B ^ 2 at hOABsq
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) U ^ 2 at hOAUsq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) V ^ 2 at hAOVsq
  change dist B (pt 0 0) ^ 2 = dist B C ^ 2 at hBOCsq
  change dist B (pt 0 0) ^ 2 = dist B W ^ 2 at hBOWsq
  change dist C (pt 1 0) ^ 2 = dist C U ^ 2 at hCACUsq
  change dist C (pt 1 0) ^ 2 = dist C W ^ 2 at hCACWsq
  change dist U B ^ 2 = dist U V ^ 2 at hUBVsq
  change dist U B ^ 2 = dist U W ^ 2 at hUBWsq
  change dist V B ^ 2 = dist V W ^ 2 at hVBWsq
  change dist W (pt 0 0) ^ 2 = dist W U ^ 2 at hWOWUsq
  rw [circleNetwork_dist_sq_coord, circleNetwork_dist_sq_coord] at hOABsq hOAUsq
  rw [circleNetwork_dist_sq_coord, circleNetwork_dist_sq_coord] at hAOVsq hBOCsq
  rw [circleNetwork_dist_sq_coord, circleNetwork_dist_sq_coord] at hBOWsq hCACUsq
  rw [circleNetwork_dist_sq_coord, circleNetwork_dist_sq_coord] at hCACWsq hUBVsq
  rw [circleNetwork_dist_sq_coord, circleNetwork_dist_sq_coord] at hUBWsq hVBWsq
  rw [circleNetwork_dist_sq_coord, circleNetwork_dist_sq_coord] at hWOWUsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hOABsq hOAUsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hAOVsq hBOCsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hBOWsq hCACUsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hCACWsq hUBVsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hWOWUsq
  let a : ℝ² := pt 1 0
  let q := circleNetwork_normSq W
  let t := circleNetwork_dot B U
  let X := circleNetwork_dot a B
  let Y := circleNetwork_dot a U
  let δ := t - X
  have haa : circleNetwork_normSq a = 1 := by
    norm_num [a, circleNetwork_normSq, circleNetwork_dot, pt]
  have hbb : circleNetwork_normSq B = 1 := by
    simpa [circleNetwork_normSq, circleNetwork_dot, pow_two] using hOABsq.symm
  have huu : circleNetwork_normSq U = 1 := by
    simpa [circleNetwork_normSq, circleNetwork_dot, pow_two] using hOAUsq.symm
  have hv_a : circleNetwork_normSq (V - a) = 1 := by
    have h := hAOVsq
    dsimp [circleNetwork_normSq, circleNetwork_dot, a]
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    ring_nf at h ⊢
    linarith only [h]
  have hcc_twobc : circleNetwork_normSq C = 2 * circleNetwork_dot B C := by
    dsimp [circleNetwork_normSq, circleNetwork_dot]
    nlinarith only [hBOCsq]
  have huw : circleNetwork_dot U W = 1 / 2 := by
    have huu_coord := huu
    dsimp [circleNetwork_dot]
    dsimp [circleNetwork_normSq, circleNetwork_dot] at huu_coord
    nlinarith only [hWOWUsq, huu_coord]
  have hbw : circleNetwork_dot B W = q / 2 := by
    have hbb_coord := hbb
    dsimp [q, circleNetwork_normSq, circleNetwork_dot]
    dsimp [circleNetwork_normSq, circleNetwork_dot] at hbb_coord
    nlinarith only [hBOWsq, hbb_coord]
  have hq : q = 2 - 2 * t := by
    dsimp [q, t, circleNetwork_normSq, circleNetwork_dot]
    nlinarith only [hUBWsq, hWOWUsq, hOABsq, hOAUsq]
  have hq_nonneg : 0 ≤ q := by
    exact circleNetwork_normSq_nonneg W
  have hgram_buw := circleNetwork_planar_gram_det_zero B U W
  have hgram_buw' :
      q + 2 * t * (q / 2) * (1 / 2) - (1 / 2) ^ 2
        - (q / 2) ^ 2 - q * t ^ 2 = 0 := by
    rw [hbb, huu, huw, hbw] at hgram_buw
    simpa [q, t] using hgram_buw
  have hqfactor : (q + 1) * (q ^ 2 - 3 * q + 1) = 0 := by
    rw [hq] at hgram_buw' ⊢
    nlinarith only [hgram_buw']
  have hqpoly : q ^ 2 - 3 * q + 1 = 0 := by
    rcases mul_eq_zero.mp hqfactor with hbad | hgood
    · nlinarith only [hbad, hq_nonneg]
    · exact hgood
  have hP : 4 * t ^ 2 - 2 * t - 1 = 0 := by
    rw [hq] at hqpoly
    nlinarith only [hqpoly]
  have htq : t = 1 - q / 2 := by
    linarith only [hq]
  have hvector_norm :
      circleNetwork_normSq (W - U - (q - 1) • B) = 0 := by
    rw [circleNetwork_normSq_sub_sub_smul, hbb, huu,
      circleNetwork_dot_comm W U, huw, circleNetwork_dot_comm W B, hbw,
      circleNetwork_dot_comm U B]
    rw [show circleNetwork_normSq W = q by rfl,
      show circleNetwork_dot B U = t by rfl]
    norm_num
    rw [htq]
    nlinarith only [hqpoly]
  have hvector_zero : W - U - (q - 1) • B = 0 :=
    circleNetwork_eq_zero_of_normSq_eq_zero hvector_norm
  have hw : W = U + (q - 1) • B := by
    ext i
    have hi := congrArg (fun p : ℝ² => p i) hvector_zero
    change W i - U i - (q - 1) * B i = 0 at hi
    change W i = U i + (q - 1) * B i
    linarith only [hi]
  have hcu : circleNetwork_dot C (U - a) = 0 := by
    dsimp [circleNetwork_dot, a]
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    nlinarith only [hCACUsq, hOAUsq]
  have hcw : 2 * circleNetwork_dot C (W - a) = q - 1 := by
    dsimp [q, circleNetwork_normSq, circleNetwork_dot, a]
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    nlinarith only [hCACWsq]
  have hCfactor : (q - 1) * (2 * circleNetwork_dot B C - 1) = 0 := by
    have hcw' := hcw
    rw [hw, circleNetwork_dot_sub_right, circleNetwork_dot_add_right,
      circleNetwork_dot_smul_right, circleNetwork_dot_comm C B] at hcw'
    rw [circleNetwork_dot_sub_right] at hcu
    nlinarith only [hcw', hcu]
  have hq_ne_one : q ≠ 1 := by
    intro hq1
    rw [hq1] at hqpoly
    norm_num at hqpoly
  have hbc : circleNetwork_dot B C = 1 / 2 := by
    have h := (mul_eq_zero.mp hCfactor).resolve_left (sub_ne_zero.mpr hq_ne_one)
    nlinarith only [h]
  have hcc : circleNetwork_normSq C = 1 := by
    nlinarith only [hcc_twobc, hbc]
  have hrnorm : circleNetwork_normSq (U - a) = 2 * (1 - Y) := by
    rw [circleNetwork_normSq_sub, huu, haa, circleNetwork_dot_comm U a]
    rw [show circleNetwork_dot a U = Y by rfl]
    ring
  have hb_r : circleNetwork_dot B (U - a) = δ := by
    rw [circleNetwork_dot_sub_right, circleNetwork_dot_comm B a]
  have hgram_bcr := circleNetwork_planar_gram_det_zero B C (U - a)
  have hC0 : 4 * δ ^ 2 - 6 * (1 - Y) = 0 := by
    rw [hbb, hcc, hrnorm, hbc, hb_r, hcu] at hgram_bcr
    nlinarith only [hgram_bcr]
  have hgram_abu := circleNetwork_planar_gram_det_zero a B U
  have hG : 1 + 2 * t * X * Y - X ^ 2 - Y ^ 2 - t ^ 2 = 0 := by
    rw [haa, hbb, huu] at hgram_abu
    dsimp [t, X, Y]
    nlinarith only [hgram_abu]
  by_cases hdelta_zero : δ = 0
  · have hY : Y = 1 := by
      nlinarith only [hC0, hdelta_zero]
    have hua_norm : circleNetwork_normSq (U - a) = 0 := by
      rw [hrnorm, hY]
      norm_num
    have hua_zero : U - a = 0 :=
      circleNetwork_eq_zero_of_normSq_eq_zero hua_norm
    have hUeq : U = a := sub_eq_zero.mp hua_zero
    have hq_one : q = 1 := by
      have hUBVsq' := hUBVsq
      have hUBWsq' := hUBWsq
      have hWOWUsq' := hWOWUsq
      rw [hUeq] at hUBVsq' hUBWsq' hWOWUsq'
      dsimp [a] at hUBVsq' hUBWsq' hWOWUsq'
      simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hUBVsq'
      simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hUBWsq' hWOWUsq'
      dsimp [q, circleNetwork_normSq, circleNetwork_dot]
      nlinarith only [hAOVsq, hUBVsq', hUBWsq', hWOWUsq']
    rw [hq_one] at hqpoly
    norm_num at hqpoly
  · let z := V - U
    let e := W - B
    let r := U - a
    have hubnorm : circleNetwork_normSq (U - B) = q := by
      rw [circleNetwork_normSq_sub, huu, hbb, circleNetwork_dot_comm U B]
      change 1 + 1 - 2 * t = q
      linarith only [hq]
    have hubvnorm :
        circleNetwork_normSq (U - B) = circleNetwork_normSq (U - V) := by
      dsimp [circleNetwork_normSq, circleNetwork_dot]
      nlinarith only [hUBVsq]
    have hz_norm : circleNetwork_normSq z = q := by
      dsimp [z]
      rw [circleNetwork_normSq_sub_comm V U, ← hubvnorm, hubnorm]
    have hbow_norm :
        circleNetwork_normSq B = circleNetwork_normSq (B - W) := by
      dsimp [circleNetwork_normSq, circleNetwork_dot]
      nlinarith only [hBOWsq]
    have he_norm : circleNetwork_normSq e = 1 := by
      dsimp [e]
      rw [circleNetwork_normSq_sub_comm W B, ← hbow_norm, hbb]
    have hze : circleNetwork_dot z e = 0 := by
      dsimp [z, e, circleNetwork_dot]
      nlinarith only [hVBWsq, hUBWsq]
    have hevec : e = U - (2 * t) • B := by
      dsimp [e]
      rw [hw, hq]
      ext i
      simp only [PiLp.sub_apply, PiLp.add_apply, PiLp.smul_apply, smul_eq_mul]
      ring
    have huu_dot : circleNetwork_dot U U = 1 := by
      simpa [circleNetwork_normSq] using huu
    have hUa : circleNetwork_dot U a = Y := by
      rw [circleNetwork_dot_comm]
    have her : circleNetwork_dot e r = 1 - Y - 2 * t * δ := by
      rw [hevec, circleNetwork_dot_sub_left, circleNetwork_dot_smul_left]
      dsimp [r]
      rw [circleNetwork_dot_sub_right, huu_dot, hUa, hb_r]
    have hr_norm : circleNetwork_normSq r = 2 * (1 - Y) := by
      simpa [r] using hrnorm
    have hzr_sum : circleNetwork_normSq (z + r) = 1 := by
      have hzrvec : z + r = V - a := by
        dsimp [z, r]
        abel
      rw [hzrvec, hv_a]
    have hzr : 2 * circleNetwork_dot z r = 2 * Y - 3 + 2 * t := by
      rw [circleNetwork_normSq_add, hz_norm, hr_norm] at hzr_sum
      nlinarith only [hq, hzr_sum]
    have hzr_val : circleNetwork_dot z r = (2 * Y - 3 + 2 * t) / 2 := by
      linarith only [hzr]
    have hgram_zer := circleNetwork_planar_gram_det_zero z e r
    have hK :
        (2 * Y - 3 + 2 * t) ^ 2
          + 4 * q * (1 - Y - 2 * t * δ) ^ 2
          - 8 * q * (1 - Y) = 0 := by
      rw [hz_norm, he_norm, hr_norm, hze, her, hzr_val] at hgram_zer
      nlinarith only [hgram_zer]
    have hfirst :
        6 * t - 3 - 4 * δ ^ 2 = 3 * (2 * Y - 3 + 2 * t) := by
      linear_combination -hC0
    have hsecond :
        2 * δ ^ 2 - 6 * t * δ = 3 * (1 - Y - 2 * t * δ) := by
      linear_combination (1 / 2) * hC0
    have hhalfq : 1 - t = q / 2 := by
      linarith only [hq]
    have hdeltaSq : δ ^ 2 = (3 / 2) * (1 - Y) := by
      linarith only [hC0]
    have hR :
        (6 * t - 3 - 4 * δ ^ 2) ^ 2
          + 8 * (1 - t) * (2 * δ ^ 2 - 6 * t * δ) ^ 2
          - 96 * (1 - t) * δ ^ 2 = 0 := by
      rw [hfirst, hsecond, hhalfq, hdeltaSq]
      nlinarith only [hK]
    exact circleNetwork_scalar_incompatible rfl hdelta_zero hP hC0 hG hR

/-- The seven-point circle-network equalities force the anchor labels to collide. -/
theorem seven_point_circle_network_collision
    {O A B C U V W : ℝ²}
    (hOA_OB : dist O A = dist O B)
    (hOA_OU : dist O A = dist O U)
    (hAO_AV : dist A O = dist A V)
    (hBO_BC : dist B O = dist B C)
    (hBO_BW : dist B O = dist B W)
    (hCA_CU : dist C A = dist C U)
    (hCA_CW : dist C A = dist C W)
    (hUB_UV : dist U B = dist U V)
    (hUB_UW : dist U B = dist U W)
    (hVB_VW : dist V B = dist V W)
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
  apply normalized_circleNetwork_incompatible
      (B := b) (C := c) (U := u) (V := v) (W := w)
  · simpa [b, hT0, hT1] using map_dist_eq hOA_OB
  · simpa [u, hT0, hT1] using map_dist_eq hOA_OU
  · simpa [v, hT0, hT1] using map_dist_eq hAO_AV
  · simpa [b, c, hT0] using map_dist_eq hBO_BC
  · simpa [b, w, hT0] using map_dist_eq hBO_BW
  · simpa [c, u, hT1] using map_dist_eq hCA_CU
  · simpa [c, w, hT1] using map_dist_eq hCA_CW
  · simpa [b, u, v] using map_dist_eq hUB_UV
  · simpa [b, u, w] using map_dist_eq hUB_UW
  · simpa [b, v, w] using map_dist_eq hVB_VW
  · simpa [u, w, hT0] using map_dist_eq hWO_WU

/-- Equality-closure data for the seven-point circle-network collision. -/
structure SevenPointCircleNetworkCollisionCore {alpha : Type*} (P : RowPattern alpha) where
  O : alpha
  A : alpha
  B : alpha
  C : alpha
  U : alpha
  V : alpha
  W : alpha
  hOA : O ≠ A
  OA_OB : EdgeClosure P (O, A) (O, B)
  OA_OU : EdgeClosure P (O, A) (O, U)
  AO_AV : EdgeClosure P (A, O) (A, V)
  BO_BC : EdgeClosure P (B, O) (B, C)
  BO_BW : EdgeClosure P (B, O) (B, W)
  CA_CU : EdgeClosure P (C, A) (C, U)
  CA_CW : EdgeClosure P (C, A) (C, W)
  UB_UV : EdgeClosure P (U, B) (U, V)
  UB_UW : EdgeClosure P (U, B) (U, W)
  VB_VW : EdgeClosure P (V, B) (V, W)
  WO_WU : EdgeClosure P (W, O) (W, U)

/-- A seven-point circle-network core has no injective planar realization. -/
theorem not_realizes_of_sevenPointCircleNetworkCollisionCore
    {alpha : Type*} {P : RowPattern alpha}
    (core : SevenPointCircleNetworkCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  have hcollision := seven_point_circle_network_collision
    (by simpa [edgeDist] using sound core.OA_OB)
    (by simpa [edgeDist] using sound core.OA_OU)
    (by simpa [edgeDist] using sound core.AO_AV)
    (by simpa [edgeDist] using sound core.BO_BC)
    (by simpa [edgeDist] using sound core.BO_BW)
    (by simpa [edgeDist] using sound core.CA_CU)
    (by simpa [edgeDist] using sound core.CA_CW)
    (by simpa [edgeDist] using sound core.UB_UV)
    (by simpa [edgeDist] using sound core.UB_UW)
    (by simpa [edgeDist] using sound core.VB_VW)
    (by simpa [edgeDist] using sound core.WO_WU)
  exact core.hOA (hreal.injective hcollision)

end EqualityCore
end Census554
end Problem97

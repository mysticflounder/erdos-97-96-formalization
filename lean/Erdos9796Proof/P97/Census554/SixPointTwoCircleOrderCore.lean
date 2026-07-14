/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.Q3SharedInterior
import Erdos9796Proof.P97.SurplusCOMPGBankSep

/-!
# Six-point two-circle convex-order core

This module packages the reusable six-point obstruction isolated from a
four-row common-system residual.  For points in cyclic order
`A, P, Q, B, D, C`, the equalities

`AB = AC = AD = BC`, `CD = CP`, and `DA = DQ`

are incompatible with strict convexity.  Only these equalities and seven
signed-area inequalities forced by cyclic order are used; no exact-row
exclusion is needed.
-/

namespace Problem97
namespace Census554
namespace SixPointTwoCircleOrderCore

open scoped EuclideanGeometry
open EqualityCore

/-- A distance equal to the normalizing base has squared coordinate length one. -/
private lemma normSim_dist_sq_eq_one
    {a b x y : ℝ²} (hab : a ≠ b) (h : dist a b = dist x y) :
    (normSim a b x 0 - normSim a b y 0) ^ 2 +
        (normSim a b x 1 - normSim a b y 1) ^ 2 = 1 := by
  have hT : dist (normSim a b a) (normSim a b b) =
      dist (normSim a b x) (normSim a b y) := by
    rw [normSim_dist_image a b hab, normSim_dist_image a b hab, h]
  have hSq := congrArg (fun t : ℝ => t ^ 2) hT
  change dist (normSim a b a) (normSim a b b) ^ 2 =
    dist (normSim a b x) (normSim a b y) ^ 2 at hSq
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hSq
  rw [normSim_fst, normSim_snd a b hab] at hSq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero,
    zero_sub, one_pow, neg_sq] at hSq
  simpa using hSq.symm

/-- The normalizing similarity preserves strict positive orientation. -/
private lemma normSim_signedArea_pos
    {a b x y z : ℝ²} (hab : a ≠ b) (h : 0 < signedArea2 x y z) :
    0 < signedArea2 (normSim a b x) (normSim a b y) (normSim a b z) := by
  rw [signedArea2_normSim a b hab]
  apply mul_pos _ h
  apply inv_pos.mpr
  rw [← SurplusCOMPGBank.dist_sq_coord b a]
  exact sq_pos_of_pos (dist_pos.mpr hab.symm)

private theorem normalized_twoCircle_order_incompatible
    {h u v p q r s : ℝ}
    (hhsq : h ^ 2 = 3 / 4)
    (hhpos : 0 < h)
    (hdunit : u ^ 2 + v ^ 2 = 1)
    (hpCircle :
      (p - 1 / 2) ^ 2 + (q - h) ^ 2 =
        (u - 1 / 2) ^ 2 + (v - h) ^ 2)
    (hqCircle : (r - u) ^ 2 + (s - v) ^ 2 = 1)
    (hABD : 0 < v)
    (hBDC : 0 < (u - 1) * h + v / 2)
    (hAPB : 0 < -q)
    (hAQB : 0 < -s)
    (hQBD : 0 < (1 - r) * (v - s) + s * (u - r))
    (hAPQ : 0 < p * s - q * r) : False := by
  have huLtOne : u < 1 := by
    nlinarith only [hdunit, sq_pos_of_pos hABD]
  have honeSubU : 0 < 1 - u := sub_pos.mpr huLtOne
  have hvBound : 2 * h * (1 - u) < v := by
    nlinarith only [hBDC]
  have htwicePos : 0 < 2 * h * (1 - u) := by positivity
  have hvSqBound : (2 * h * (1 - u)) ^ 2 < v ^ 2 :=
    (sq_lt_sq₀ htwicePos.le hABD.le).2 hvBound
  have huHalf : 1 / 2 < u := by
    nlinarith only [hhsq, hdunit, hvSqBound]
  have huPos : 0 < u := lt_trans (by norm_num) huHalf
  have huSqQuarter : (1 / 2 : ℝ) ^ 2 < u ^ 2 :=
    (sq_lt_sq₀ (by norm_num) huPos.le).2 huHalf
  have hvSqH : v ^ 2 < h ^ 2 := by
    nlinarith only [hhsq, hdunit, huSqQuarter]
  have hvLtH : v < h :=
    (sq_lt_sq₀ hABD.le hhpos.le).mp hvSqH
  let K := u + 2 * h * v - 1
  have hfactorK :
      (h * (u - 1) + v / 2) * K = 2 * (1 - u) * (h - v) := by
    dsimp [K]
    linear_combination
      (2 * u * v - 2 * v) * hhsq + h * hdunit
  have hprodK : 0 < (h * (u - 1) + v / 2) * K := by
    rw [hfactorK]
    exact mul_pos (mul_pos (by norm_num) honeSubU) (sub_pos.mpr hvLtH)
  have hleftK : 0 < h * (u - 1) + v / 2 := by
    nlinarith only [hBDC]
  have hK : 0 < K := by
    rcases mul_pos_iff.mp hprodK with hgood | hbad
    · exact hgood.2
    · exact False.elim ((not_lt_of_ge hleftK.le) hbad.1)
  have hpExpanded : p ^ 2 + q ^ 2 - (p + 2 * h * q) + K = 0 := by
    dsimp [K]
    nlinarith only [hhsq, hdunit, hpCircle]
  have hpLine : 0 < p + 2 * h * q := by
    nlinarith only [hpExpanded, hK, sq_nonneg p, sq_nonneg q]
  have hqNeg : q < 0 := by linarith only [hAPB]
  have hsNeg : s < 0 := by linarith only [hAQB]
  have htwoHqNeg : 2 * h * q < 0 :=
    mul_neg_of_pos_of_neg (by positivity) hqNeg
  have hpPos : 0 < p := by linarith only [hpLine, htwoHqNeg]
  let cdSq := (u - 1 / 2) ^ 2 + (v - h) ^ 2
  have hqGapPos : 0 < q * (q - 2 * h) :=
    mul_pos_of_neg_of_neg hqNeg (by nlinarith only [hqNeg, hhpos])
  have hvertical : h ^ 2 < (q - h) ^ 2 := by
    nlinarith only [hqGapPos]
  have hcdLarge : h ^ 2 < cdSq := by
    dsimp [cdSq]
    nlinarith only [hpCircle, hvertical, sq_nonneg (p - 1 / 2)]
  let k := v / (1 + u)
  have hdenPos : 0 < 1 + u := by linarith only [huPos]
  have hdenNe : 1 + u ≠ 0 := ne_of_gt hdenPos
  have hkPos : 0 < k := by
    dsimp [k]
    positivity
  have hkRel : k * (1 + u) = v := by
    dsimp [k]
    field_simp
  have hkRelSq : k ^ 2 * (1 + u) ^ 2 = v ^ 2 := by
    nlinarith only [congrArg (fun x : ℝ => x ^ 2) hkRel]
  have hkFactor :
      (1 + u) * (k ^ 2 * (1 + u) - (1 - u)) = 0 := by
    nlinarith only [hkRelSq, hdunit]
  have hkSqRel : k ^ 2 * (1 + u) = 1 - u :=
    sub_eq_zero.mp ((mul_eq_zero.mp hkFactor).resolve_left hdenNe)
  have hparamDen : (1 + k ^ 2) * (1 + u) = 2 := by
    nlinarith only [hkSqRel]
  have huParam : u = (1 - k ^ 2) / (1 + k ^ 2) := by
    apply (eq_div_iff (by positivity : 1 + k ^ 2 ≠ 0)).2
    nlinarith only [hkSqRel]
  have hvParam : v = 2 * k / (1 + k ^ 2) := by
    apply (eq_div_iff (by positivity : 1 + k ^ 2 ≠ 0)).2
    calc
      v * (1 + k ^ 2) = (k * (1 + u)) * (1 + k ^ 2) := by rw [hkRel]
      _ = k * ((1 + k ^ 2) * (1 + u)) := by ring
      _ = 2 * k := by rw [hparamDen]; ring
  have hkSqThird : 3 * k ^ 2 < 1 := by
    have hmul := mul_lt_mul_of_pos_right huHalf
      (show 0 < 1 + k ^ 2 by positivity)
    nlinarith only [hmul, hkSqRel]
  have hcdIdentity :
      4 * (1 + k ^ 2) * (cdSq - h ^ 2) =
        9 * k ^ 2 - 16 * h * k + 1 := by
    dsimp [cdSq]
    rw [huParam, hvParam]
    field_simp
    nlinarith only [hhsq]
  have hkPolynomial : 0 < 9 * k ^ 2 - 16 * h * k + 1 := by
    have hmul := mul_pos
      (show 0 < 4 * (1 + k ^ 2) by positivity)
      (sub_pos.mpr hcdLarge)
    nlinarith only [hmul, hcdIdentity]
  let z := 2 * h * k
  have hzPos : 0 < z := by
    dsimp [z]
    positivity
  have hzSq : z ^ 2 = 3 * k ^ 2 := by
    dsimp [z]
    nlinarith only [hhsq]
  have hzLtOne : z < 1 := by
    nlinarith only [hzPos, hzSq, hkSqThird, sq_nonneg (z - 1)]
  have hzPolynomial : 0 < 3 * z ^ 2 - 8 * z + 1 := by
    dsimp [z] at hzSq ⊢
    nlinarith only [hkPolynomial, hzSq]
  have hzSeventh : z < 1 / 7 := by
    by_contra hnot
    have hza : 1 / 7 ≤ z := le_of_not_gt hnot
    have hsecond : 3 * (z + 1 / 7) - 8 < 0 := by
      linarith only [hzLtOne]
    have hproduct :
        (z - 1 / 7) * (3 * (z + 1 / 7) - 8) ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos (sub_nonneg.mpr hza) hsecond.le
    nlinarith only [hzPolynomial, hproduct]
  have hzSqSmall : z ^ 2 < z / 7 := by
    have hproduct : 0 < z * (1 / 7 - z) :=
      mul_pos hzPos (sub_pos.mpr hzSeventh)
    nlinarith only [hproduct]
  have hzCubicNonneg : 0 ≤ z ^ 3 := by positivity
  have hzTerminal : 0 < z ^ 3 / 3 - z ^ 2 - 3 * z + 1 := by
    nlinarith only [hzSqSmall, hzSeventh, hzCubicNonneg]
  have hkTerminalIdentity :
      2 * h * k ^ 3 - 3 * k ^ 2 - 6 * h * k + 1 =
        z ^ 3 / 3 - z ^ 2 - 3 * z + 1 := by
    have hkSqZ : k ^ 2 = z ^ 2 / 3 := by
      nlinarith only [hzSq]
    calc
      2 * h * k ^ 3 - 3 * k ^ 2 - 6 * h * k + 1 =
          z * k ^ 2 - 3 * k ^ 2 - 3 * z + 1 := by
        dsimp only [z]
        ring
      _ = z ^ 3 / 3 - z ^ 2 - 3 * z + 1 := by
        rw [hkSqZ]
        ring
  have hkTerminal :
      0 < 2 * h * k ^ 3 - 3 * k ^ 2 - 6 * h * k + 1 := by
    rw [hkTerminalIdentity]
    exact hzTerminal
  have hqExpanded₀ : r ^ 2 + s ^ 2 - 2 * u * r - 2 * v * s = 0 := by
    nlinarith only [hqCircle, hdunit]
  have hrPos : 0 < r := by
    by_contra hnot
    have hrNonpos : r ≤ 0 := le_of_not_gt hnot
    have hurNonpos : u * r ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos huPos.le hrNonpos
    have hvsNeg : v * s < 0 := mul_neg_of_pos_of_neg hABD hsNeg
    nlinarith only [hqExpanded₀, hurNonpos, hvsNeg,
      sq_nonneg r, sq_nonneg s]
  let n := -s / r
  have hnPos : 0 < n := by
    dsimp [n]
    positivity
  have hnr : n * r = -s := by
    dsimp [n]
    field_simp
  have hsSlope : s = -n * r := by linarith only [hnr]
  have hqExpanded := hqExpanded₀
  have hqSlopeFactor :
      r * (r * (1 + n ^ 2) - 2 * (u - v * n)) = 0 := by
    rw [hsSlope] at hqExpanded
    nlinarith only [hqExpanded]
  have hqSlope : r * (1 + n ^ 2) = 2 * (u - v * n) := by
    have := (mul_eq_zero.mp hqSlopeFactor).resolve_left (ne_of_gt hrPos)
    linarith only [this]
  have hrParam : r = 2 * (u - v * n) / (1 + n ^ 2) := by
    apply (eq_div_iff (by positivity : 1 + n ^ 2 ≠ 0)).2
    exact hqSlope
  have hg : 0 < v * (1 - r) - n * r * (u - 1) := by
    rw [hsSlope] at hQBD
    nlinarith only [hQBD]
  let F := 2 * k ^ 3 * n + 3 * k ^ 2 * n ^ 2 - 3 * k ^ 2 -
    6 * k * n - n ^ 2 + 1
  have hqFactorIdentity :
      (v * (1 - r) - n * r * (u - 1)) *
          (1 + k ^ 2) ^ 2 * (1 + n ^ 2) = -2 * k * F := by
    dsimp [F]
    rw [hrParam, huParam, hvParam]
    field_simp
    ring
  have hFneg : F < 0 := by
    have hleft :
        0 < (v * (1 - r) - n * r * (u - 1)) *
          (1 + k ^ 2) ^ 2 * (1 + n ^ 2) := by positivity
    nlinarith only [hqFactorIdentity, hleft, hkPos]
  let N := 1 / (2 * h)
  have hNPos : 0 < N := by
    dsimp [N]
    positivity
  have hFNIdentity :
      3 * (2 * k ^ 3 * N + 3 * k ^ 2 * N ^ 2 - 3 * k ^ 2 -
        6 * k * N - N ^ 2 + 1) =
      2 * (2 * h * k ^ 3 - 3 * k ^ 2 - 6 * h * k + 1) := by
    have hNExplicit : N = 2 * h / 3 := by
      dsimp [N]
      field_simp [ne_of_gt hhpos]
      nlinarith only [hhsq]
    rw [hNExplicit]
    linear_combination (4 / 3 * (3 * k ^ 2 - 1)) * hhsq
  have hFNPos :
      0 < 2 * k ^ 3 * N + 3 * k ^ 2 * N ^ 2 - 3 * k ^ 2 -
        6 * k * N - N ^ 2 + 1 := by
    nlinarith only [hFNIdentity, hkTerminal]
  have hnGt : N < n := by
    by_contra hnot
    have hnLe : n ≤ N := le_of_not_gt hnot
    have hkSqSmall : k ^ 2 < 1 / 3 := by nlinarith only [hkSqThird]
    have hkCubic : k ^ 3 - 3 * k < 0 := by
      have := mul_neg_of_pos_of_neg hkPos (show k ^ 2 - 3 < 0 by
        nlinarith only [hkSqSmall])
      nlinarith only [this]
    have hkCoeff : 3 * k ^ 2 - 1 < 0 := by
      nlinarith only [hkSqSmall]
    have hsumPos : 0 < n + N := add_pos hnPos hNPos
    have hbracket :
        2 * k ^ 3 - 6 * k + (3 * k ^ 2 - 1) * (n + N) < 0 := by
      have hterm := mul_neg_of_neg_of_pos hkCoeff hsumPos
      nlinarith only [hkCubic, hterm]
    have hproduct :
        0 ≤ (n - N) *
          (2 * k ^ 3 - 6 * k + (3 * k ^ 2 - 1) * (n + N)) :=
      mul_nonneg_of_nonpos_of_nonpos (sub_nonpos.mpr hnLe) hbracket.le
    have hdiffIdentity :
        (2 * k ^ 3 * n + 3 * k ^ 2 * n ^ 2 - 3 * k ^ 2 -
            6 * k * n - n ^ 2 + 1) -
          (2 * k ^ 3 * N + 3 * k ^ 2 * N ^ 2 - 3 * k ^ 2 -
            6 * k * N - N ^ 2 + 1) =
        (n - N) *
          (2 * k ^ 3 - 6 * k + (3 * k ^ 2 - 1) * (n + N)) := by
      ring
    dsimp [F] at hFneg
    nlinarith only [hFneg, hFNPos, hproduct, hdiffIdentity]
  have hqLine : r + 2 * h * s < 0 := by
    rw [hsSlope]
    have hscale : 1 < 2 * h * n := by
      dsimp [N] at hnGt
      have htwoHPos : 0 < 2 * h := by positivity
      have := mul_lt_mul_of_pos_left hnGt htwoHPos
      field_simp at this
      nlinarith only [this]
    nlinarith only [hrPos, hscale]
  have hps : p * s < (-2 * h * q) * s :=
    mul_lt_mul_of_neg_right (by nlinarith only [hpLine]) hsNeg
  have hqr : (-q) * r < (-q) * (-2 * h * s) :=
    mul_lt_mul_of_pos_left (by nlinarith only [hqLine]) (neg_pos.mpr hqNeg)
  nlinarith only [hAPQ, hps, hqr]

/-- Six points in cyclic order `A,P,Q,B,D,C` cannot satisfy the three inherited
row-circle equalities.  The hypotheses are deliberately a monotone subset of
the exact-row residual: no excluded-label inequality is used. -/
theorem six_point_twoCircle_order_incompatible
    {A P Q B D C : ℝ²}
    (hAB : A ≠ B)
    (hAB_AC : dist A B = dist A C)
    (hAB_AD : dist A B = dist A D)
    (hAB_BC : dist A B = dist B C)
    (hCD_CP : dist C D = dist C P)
    (hDA_DQ : dist D A = dist D Q)
    (hABC : 0 < signedArea2 A B C)
    (hABD : 0 < signedArea2 A B D)
    (hBDC : 0 < signedArea2 B D C)
    (hAPB : 0 < signedArea2 A P B)
    (hAQB : 0 < signedArea2 A Q B)
    (hQBD : 0 < signedArea2 Q B D)
    (hAPQ : 0 < signedArea2 A P Q) : False := by
  let T := normSim A B
  let H := T C 1
  let u := T D 0
  let v := T D 1
  let p := T P 0
  let q := T P 1
  let r := T Q 0
  let s := T Q 1
  have hTA : T A = pt 0 0 := by
    simpa [T] using normSim_fst A B
  have hTB : T B = pt 1 0 := by
    simpa [T] using normSim_snd A B hAB
  have map_dist_eq {X Y Z W : ℝ²} (heq : dist X Y = dist Z W) :
      dist (T X) (T Y) = dist (T Z) (T W) := by
    simp only [T, normSim_dist_image A B hAB]
    rw [heq]
  have hCfst : T C 0 = 1 / 2 := by
    apply normSim_center_fst_eq_half_of_equidistant hAB
    exact hAB_AC.symm.trans hAB_BC
  have hCunit := normSim_dist_sq_eq_one hAB hAB_AC
  change (T A 0 - T C 0) ^ 2 + (T A 1 - T C 1) ^ 2 = 1 at hCunit
  rw [hTA] at hCunit
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hCunit
  have hHsq : H ^ 2 = 3 / 4 := by
    dsimp [H]
    rw [hCfst] at hCunit
    nlinarith only [hCunit]
  have hDunit := normSim_dist_sq_eq_one hAB hAB_AD
  change (T A 0 - T D 0) ^ 2 + (T A 1 - T D 1) ^ 2 = 1 at hDunit
  rw [hTA] at hDunit
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hDunit
  have huv : u ^ 2 + v ^ 2 = 1 := by
    simpa [u, v] using hDunit
  have hCDCP := congrArg (fun x : ℝ => x ^ 2) (map_dist_eq hCD_CP)
  change dist (T C) (T D) ^ 2 = dist (T C) (T P) ^ 2 at hCDCP
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hCDCP
  have hpCircle :
      (p - 1 / 2) ^ 2 + (q - H) ^ 2 =
        (u - 1 / 2) ^ 2 + (v - H) ^ 2 := by
    dsimp [p, q, u, v, H]
    rw [hCfst] at hCDCP
    nlinarith only [hCDCP]
  have hDADQ := congrArg (fun x : ℝ => x ^ 2) (map_dist_eq hDA_DQ)
  change dist (T D) (T A) ^ 2 = dist (T D) (T Q) ^ 2 at hDADQ
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hDADQ
  rw [hTA] at hDADQ
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at hDADQ
  have hqCircle : (r - u) ^ 2 + (s - v) ^ 2 = 1 := by
    dsimp [r, s, u, v]
    dsimp [u, v] at huv
    nlinarith only [hDADQ, huv]
  have hABC' := normSim_signedArea_pos hAB hABC
  change 0 < signedArea2 (T A) (T B) (T C) at hABC'
  rw [hTA, hTB] at hABC'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero, one_mul, sub_zero] at hABC'
  have hHpos : 0 < H := by simpa [H] using hABC'
  have hABD' := normSim_signedArea_pos hAB hABD
  change 0 < signedArea2 (T A) (T B) (T D) at hABD'
  rw [hTA, hTB] at hABD'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero, one_mul, sub_zero] at hABD'
  have hvPos : 0 < v := by simpa [v] using hABD'
  have hBDC' := normSim_signedArea_pos hAB hBDC
  change 0 < signedArea2 (T B) (T D) (T C) at hBDC'
  rw [hTB] at hBDC'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero] at hBDC'
  have hBDCscalar : 0 < (u - 1) * H + v / 2 := by
    dsimp [u, v, H]
    rw [hCfst] at hBDC'
    nlinarith only [hBDC']
  have hAPB' := normSim_signedArea_pos hAB hAPB
  change 0 < signedArea2 (T A) (T P) (T B) at hAPB'
  rw [hTA, hTB] at hAPB'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero, zero_sub, mul_zero, one_mul] at hAPB'
  have hAPBscalar : 0 < -q := by simpa [q] using hAPB'
  have hAQB' := normSim_signedArea_pos hAB hAQB
  change 0 < signedArea2 (T A) (T Q) (T B) at hAQB'
  rw [hTA, hTB] at hAQB'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero, zero_sub, mul_zero, one_mul] at hAQB'
  have hAQBscalar : 0 < -s := by simpa [s] using hAQB'
  have hQBD' := normSim_signedArea_pos hAB hQBD
  change 0 < signedArea2 (T Q) (T B) (T D) at hQBD'
  rw [hTB] at hQBD'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hQBD'
  have hQBDscalar : 0 < (1 - r) * (v - s) + s * (u - r) := by
    dsimp [r, s, u, v]
    nlinarith only [hQBD']
  have hAPQ' := normSim_signedArea_pos hAB hAPQ
  change 0 < signedArea2 (T A) (T P) (T Q) at hAPQ'
  rw [hTA] at hAPQ'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero] at hAPQ'
  have hAPQscalar : 0 < p * s - q * r := by
    dsimp [p, q, r, s]
    nlinarith only [hAPQ']
  exact normalized_twoCircle_order_incompatible hHsq hHpos huv hpCircle hqCircle
    hvPos hBDCscalar hAPBscalar hAQBscalar hQBDscalar hAPQscalar

/-- Equality-closure data for the six-label two-circle obstruction. -/
structure Core {alpha : Type*} (R : RowPattern alpha) where
  A : alpha
  P : alpha
  Q : alpha
  B : alpha
  D : alpha
  C : alpha
  hAB : A ≠ B
  AB_AC : EdgeClosure R (A, B) (A, C)
  AB_AD : EdgeClosure R (A, B) (A, D)
  AB_BC : EdgeClosure R (A, B) (B, C)
  CD_CP : EdgeClosure R (C, D) (C, P)
  DA_DQ : EdgeClosure R (D, A) (D, Q)

/-- A realized closure core cannot have all positive orientations inherited
from cyclic order `A,P,Q,B,D,C`. -/
theorem false_of_core
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hABC : 0 < signedArea2 (pointOf core.A) (pointOf core.B) (pointOf core.C))
    (hABD : 0 < signedArea2 (pointOf core.A) (pointOf core.B) (pointOf core.D))
    (hBDC : 0 < signedArea2 (pointOf core.B) (pointOf core.D) (pointOf core.C))
    (hAPB : 0 < signedArea2 (pointOf core.A) (pointOf core.P) (pointOf core.B))
    (hAQB : 0 < signedArea2 (pointOf core.A) (pointOf core.Q) (pointOf core.B))
    (hQBD : 0 < signedArea2 (pointOf core.Q) (pointOf core.B) (pointOf core.D))
    (hAPQ : 0 < signedArea2 (pointOf core.A) (pointOf core.P) (pointOf core.Q)) :
    False := by
  apply six_point_twoCircle_order_incompatible
      (fun h => core.hAB (hreal.injective h))
  · simpa [edgeDist] using EdgeClosure.sound hreal core.AB_AC
  · simpa [edgeDist] using EdgeClosure.sound hreal core.AB_AD
  · simpa [edgeDist] using EdgeClosure.sound hreal core.AB_BC
  · simpa [edgeDist] using EdgeClosure.sound hreal core.CD_CP
  · simpa [edgeDist] using EdgeClosure.sound hreal core.DA_DQ
  · exact hABC
  · exact hABD
  · exact hBDC
  · exact hAPB
  · exact hAQB
  · exact hQBD
  · exact hAPQ

/-- Reversed cyclic orientation form.  Reflection preserves every closure
equality and changes all seven signed-area signs. -/
theorem false_of_core_of_neg
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hABC : signedArea2 (pointOf core.A) (pointOf core.B) (pointOf core.C) < 0)
    (hABD : signedArea2 (pointOf core.A) (pointOf core.B) (pointOf core.D) < 0)
    (hBDC : signedArea2 (pointOf core.B) (pointOf core.D) (pointOf core.C) < 0)
    (hAPB : signedArea2 (pointOf core.A) (pointOf core.P) (pointOf core.B) < 0)
    (hAQB : signedArea2 (pointOf core.A) (pointOf core.Q) (pointOf core.B) < 0)
    (hQBD : signedArea2 (pointOf core.Q) (pointOf core.B) (pointOf core.D) < 0)
    (hAPQ : signedArea2 (pointOf core.A) (pointOf core.P) (pointOf core.Q) < 0) :
    False := by
  let reflectedPointOf := fun label => reflectXAxis (pointOf label)
  have hrealReflected : Realizes R reflectedPointOf := hreal.reflectXAxis
  apply false_of_core hrealReflected core
  · change 0 < signedArea2 (reflectXAxis (pointOf core.A))
      (reflectXAxis (pointOf core.B)) (reflectXAxis (pointOf core.C))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2 (reflectXAxis (pointOf core.A))
      (reflectXAxis (pointOf core.B)) (reflectXAxis (pointOf core.D))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2 (reflectXAxis (pointOf core.B))
      (reflectXAxis (pointOf core.D)) (reflectXAxis (pointOf core.C))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2 (reflectXAxis (pointOf core.A))
      (reflectXAxis (pointOf core.P)) (reflectXAxis (pointOf core.B))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2 (reflectXAxis (pointOf core.A))
      (reflectXAxis (pointOf core.Q)) (reflectXAxis (pointOf core.B))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2 (reflectXAxis (pointOf core.Q))
      (reflectXAxis (pointOf core.B)) (reflectXAxis (pointOf core.D))
    rw [signedArea2_reflectXAxis]
    linarith
  · change 0 < signedArea2 (reflectXAxis (pointOf core.A))
      (reflectXAxis (pointOf core.P)) (reflectXAxis (pointOf core.Q))
    rw [signedArea2_reflectXAxis]
    linarith

#print axioms normalized_twoCircle_order_incompatible
#print axioms six_point_twoCircle_order_incompatible
#print axioms false_of_core
#print axioms false_of_core_of_neg

end SixPointTwoCircleOrderCore
end Census554
end Problem97

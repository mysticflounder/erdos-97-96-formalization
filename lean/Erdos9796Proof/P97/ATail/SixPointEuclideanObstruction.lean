/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.ConvexCyclicOrder.Basic
import Erdos9796Proof.P97.Q3SharedInterior
import Erdos9796Proof.P97.SurplusCOMPGBankSep
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Six-point Euclidean row obstruction

This module kernel-checks two six-point nonlinear cuts emitted by the induced
metric CEGAR checker.  The original cut uses the equalities

```text
A : {B,D,F}
D : {A,B}
C : {B,D,E}
```

The mirror-interleaving cut uses

```text
A : {B,F} and {C,E}
D : {A,C,E}
E : {B,F}
```

Each pattern is incompatible with its stated strict cyclic-order signs.  The
low-level theorems state exactly the metric and orientation data used by the
computation.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace SixPointEuclideanObstruction

open Census554.EqualityCore

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

private lemma normSim_signedArea_pos
    {a b x y z : ℝ²} (hab : a ≠ b) (h : 0 < signedArea2 x y z) :
    0 < signedArea2 (normSim a b x) (normSim a b y) (normSim a b z) := by
  rw [signedArea2_normSim a b hab]
  apply mul_pos _ h
  apply inv_pos.mpr
  rw [← SurplusCOMPGBank.dist_sq_coord b a]
  exact sq_pos_of_pos (dist_pos.mpr hab.symm)

/-- Division-free scalar form of the six-point obstruction. -/
private theorem normalized_six_point_incompatible
    (y s m n p q : ℝ)
    (hysq : y ^ 2 = 3 / 4)
    (hkpos : 0 < 2 * s - y)
    (hFcircle : p ^ 2 + q ^ 2 = 1)
    (hEcircle :
      (m - 2 * y * s) ^ 2 + (n - s) ^ 2 =
        (1 - 2 * y * s) ^ 2 + s ^ 2)
    (hFAB : 0 < q)
    (hFAC : 0 < 2 * y * q - p)
    (hFAD : 0 < q / 2 - p * y)
    (hDEB : 0 < y * (1 - m) - n / 2)
    (hEFD : 0 < (p - m) * (y - n) - (q - n) * (1 / 2 - m)) :
    False := by
  have hy4 : 4 * y ^ 2 - 3 = 0 := by
    nlinarith only [hysq]
  have hyne : y ≠ 0 := by
    intro hy
    rw [hy] at hysq
    norm_num at hysq
  have hypos : 0 < y := by
    rcases lt_or_gt_of_ne hyne with hyneg | hypos
    · have hp_lt : p < 2 * y * q := by linarith only [hFAC]
      have hmul := mul_lt_mul_of_neg_left hp_lt hyneg
      nlinarith only [hysq, hFAD, hFAB, hmul]
    · exact hypos
  let fv : ℝ := y * q - p / 2
  let fn : ℝ := y * (1 - p) - q / 2
  let a : ℝ := fv - 1 / 2
  have hFAB_id : y * (a + 1) - fn / 2 = q := by
    dsimp [a, fv, fn]
    linear_combination q / 4 * hy4
  have hFAD_id : y * a + fn / 2 = q / 2 - p * y := by
    dsimp [a, fv, fn]
    linear_combination q / 4 * hy4
  have hFAB' : 0 < y * (a + 1) - fn / 2 := by
    rw [hFAB_id]
    exact hFAB
  have hFAD' : 0 < y * a + fn / 2 := by
    rw [hFAD_id]
    exact hFAD
  have hfvpos : 0 < fv := by
    dsimp [a] at hFAB' hFAD'
    nlinarith only [hypos, hFAB', hFAD']
  have ha_gt_neg_half : -(1 / 2 : ℝ) < a := by
    dsimp [a]
    linarith only [hfvpos]
  have hFchord : a * (a + 1) + fn ^ 2 - 2 * y * fn = 0 := by
    dsimp [a, fv, fn]
    nlinarith only [hysq, hFcircle]
  have hapos : 0 < a := by
    by_contra hnot
    have hanonpos : a ≤ 0 := le_of_not_gt hnot
    have ha1pos : 0 < a + 1 := by linarith only [ha_gt_neg_half]
    have haprod : a * (a + 1) ≤ 0 :=
      mul_nonpos_of_nonpos_of_nonneg hanonpos ha1pos.le
    have hfnprod : 0 ≤ fn * (fn - 2 * y) := by
      nlinarith only [hFchord, haprod]
    have hfnpos : 0 < fn := by
      nlinarith only [hFAD', hypos, hanonpos]
    rcases (mul_nonneg_iff.mp hfnprod) with hsame | hsame
    · have hfn2y : 2 * y ≤ fn := by linarith only [hsame.2]
      nlinarith only [hFAB', hypos, hanonpos, hfn2y]
    · exact False.elim (not_le_of_gt hfnpos hsame.1)
  have hafactor : 0 < a * (a + 1) := by positivity
  have hfnprodpos : 0 < fn * (2 * y - fn) := by
    nlinarith only [hFchord, hafactor]
  have hfnpos : 0 < fn := by
    rcases (mul_pos_iff.mp hfnprodpos) with hsame | hsame
    · exact hsame.1
    · have hfnneg : fn < 0 := hsame.1
      have hyltfn : 2 * y < fn := by linarith only [hsame.2]
      linarith only [hypos, hfnneg, hyltfn]
  let ev : ℝ := y * n - m / 2
  let en : ℝ := y * (1 - m) - n / 2
  let b : ℝ := 1 / 2 - ev
  let k : ℝ := 2 * s - y
  have henpos : 0 < en := by simpa [en] using hDEB
  have hkpos' : 0 < k := by simpa [k] using hkpos
  have hEcircle' : ev ^ 2 + (en + k) ^ 2 = 1 / 4 + k ^ 2 := by
    dsimp [ev, en, k]
    linear_combination hEcircle + (m ^ 2 + n ^ 2 - 1) / 4 * hy4
  have hevSqLt : ev ^ 2 < (1 / 2 : ℝ) ^ 2 := by
    have hcross : 0 < 2 * en * k :=
      mul_pos (mul_pos (by norm_num) henpos) hkpos'
    have hensq : 0 < en ^ 2 := sq_pos_of_pos henpos
    nlinarith only [hEcircle', hcross, hensq]
  have hevlt : ev < 1 / 2 := by
    nlinarith only [hevSqLt, sq_nonneg (ev + 1 / 2)]
  have hbpos : 0 < b := by simpa [b] using sub_pos.mpr hevlt
  have hcrossIdentity :
      (p - m) * (y - n) - (q - n) * (1 / 2 - m) =
        -(a * en + b * fn) := by
    dsimp [a, fv, fn, en, b, ev]
    linear_combination (-m * q + n * p - n + q) / 4 * hy4
  have hsumpos : 0 < a * en + b * fn :=
    add_pos (mul_pos hapos henpos) (mul_pos hbpos hfnpos)
  rw [hcrossIdentity] at hEFD
  linarith

/-- Division-free scalar form of the mirror-interleaving obstruction found by
the full Euclidean v16 survivor classifier. -/
private theorem normalized_mirror_interleaving_incompatible
    {u v a b c d : ℝ}
    (hcircle : u ^ 2 + v ^ 2 = 2 * u)
    (huPos : 0 < u)
    (huLt : u < 1)
    (hvPos : 0 < v)
    (hBC : 0 < -a * v - b * u)
    (hBE : 0 < a * v - b * u)
    (hrefx :
      (u ^ 2 + v ^ 2) * (c + a) =
        2 * (a * u + b * v) * u)
    (hrefy :
      (u ^ 2 + v ^ 2) * (d + b) =
        2 * (a * u + b * v) * v)
    (hBF : 0 < a * d - b * c) :
    False := by
  have huNe : u ≠ 0 := ne_of_gt huPos
  have htwoUNe : 2 * u ≠ 0 := mul_ne_zero (by norm_num) huNe
  have hrefx' : c + a = a * u + b * v := by
    have hx :
        (2 * u) * (c + a) = (2 * u) * (a * u + b * v) := by
      rw [hcircle] at hrefx
      nlinarith only [hrefx]
    exact mul_left_cancel₀ htwoUNe hx
  have hrefy' : u * (d + b) = (a * u + b * v) * v := by
    rw [hcircle] at hrefy
    nlinarith only [hrefy]
  have hc : c = a * u + b * v - a := by
    linarith only [hrefx']
  have hud : u * d = (a * u + b * v) * v - u * b := by
    nlinarith only [hrefy']
  have hdetProd :
      u * (a * d - b * c) =
        u * (v * (a ^ 2 - b ^ 2) + 2 * a * b * (1 - u)) := by
    rw [hc]
    calc
      u * (a * d - b * (a * u + b * v - a)) =
          a * (u * d) - u * b * (a * u + b * v - a) := by ring
      _ = a * ((a * u + b * v) * v - u * b) -
            u * b * (a * u + b * v - a) := by rw [hud]
      _ = u * (v * (a ^ 2 - b ^ 2) + 2 * a * b * (1 - u)) := by
        linear_combination a * b * hcircle
  have hdet :
      a * d - b * c =
        v * (a ^ 2 - b ^ 2) + 2 * a * b * (1 - u) :=
    mul_left_cancel₀ huNe hdetProd
  have hbuNeg : b * u < 0 := by
    nlinarith only [hBC, hBE]
  have hbNeg : b < 0 := by
    by_contra hnot
    have hbNonneg : 0 ≤ b := le_of_not_gt hnot
    have : 0 ≤ b * u := mul_nonneg hbNonneg huPos.le
    linarith
  have hsumNeg : a * v + b * u < 0 := by
    linarith only [hBC]
  have huGap : u < 2 - u := by
    linarith only [huLt]
  have hweightedGap : b * (2 - u) < b * u :=
    mul_lt_mul_of_neg_left huGap hbNeg
  have hsecondNeg : a * v + b * (2 - u) < 0 := by
    linarith only [hsumNeg, hweightedGap]
  have hfactorNeg :
      (a * v - b * u) * (a * v + b * (2 - u)) < 0 :=
    mul_neg_of_pos_of_neg hBE hsecondNeg
  have hfactorIdentity :
      v * (a * d - b * c) =
        (a * v - b * u) * (a * v + b * (2 - u)) := by
    rw [hdet]
    nlinarith only [hcircle]
  have hdetNeg : v * (a * d - b * c) < 0 := by
    rw [hfactorIdentity]
    exact hfactorNeg
  exact (not_lt_of_ge (mul_nonneg hvPos.le hBF.le)) hdetNeg

set_option maxHeartbeats 800000 in
-- Coordinate normalization and the two-circle reflection elimination are nonlinear.
/-- The Euclidean mirror-interleaving cut on six points.  The first four
equalities put `C,E` on the two circles centered at `A,D`; the fifth makes
`B,F` the second intersection pair of the circles centered at `A,E`. -/
theorem mirror_interleaving_metric_orientation_incompatibility
    {A B C D E F : ℝ²}
    (hAD : A ≠ D)
    (hAB_AF : dist A B = dist A F)
    (hAC_AE : dist A C = dist A E)
    (hAD_CD : dist A D = dist C D)
    (hAD_DE : dist A D = dist D E)
    (hBE_EF : dist B E = dist E F)
    (hACD : 0 < signedArea2 A C D)
    (hADE : 0 < signedArea2 A D E)
    (hCDE : 0 < signedArea2 C D E)
    (hABC : 0 < signedArea2 A B C)
    (hABE : 0 < signedArea2 A B E)
    (hABF : 0 < signedArea2 A B F) :
    False := by
  let T := normSim A D
  let u := T C 0
  let w := T C 1
  let x := T E 0
  let v := T E 1
  let a := T B 0
  let b := T B 1
  let c := T F 0
  let d := T F 1
  have hTA : T A = pt 0 0 := by
    simpa [T] using normSim_fst A D
  have hTD : T D = pt 1 0 := by
    simpa [T] using normSim_snd A D hAD
  have map_dist_eq {P Q R S : ℝ²} (heq : dist P Q = dist R S) :
      dist (T P) (T Q) = dist (T R) (T S) := by
    simp only [T, normSim_dist_image A D hAD]
    rw [heq]
  have hCunitRaw := normSim_dist_sq_eq_one hAD hAD_CD
  change
      (T C 0 - T D 0) ^ 2 + (T C 1 - T D 1) ^ 2 = 1
    at hCunitRaw
  rw [hTD] at hCunitRaw
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero]
    at hCunitRaw
  have hCunit : (u - 1) ^ 2 + w ^ 2 = 1 := by
    simpa [u, w] using hCunitRaw
  have hEunitRaw := normSim_dist_sq_eq_one hAD hAD_DE
  change
      (T D 0 - T E 0) ^ 2 + (T D 1 - T E 1) ^ 2 = 1
    at hEunitRaw
  rw [hTD] at hEunitRaw
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub, neg_sq]
    at hEunitRaw
  have hEunit : (1 - x) ^ 2 + v ^ 2 = 1 := by
    simpa [x, v] using hEunitRaw
  have hACeqRaw := congrArg (fun r : ℝ => r ^ 2) (map_dist_eq hAC_AE)
  change dist (T A) (T C) ^ 2 = dist (T A) (T E) ^ 2 at hACeqRaw
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord,
    hTA] at hACeqRaw
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub, neg_sq]
    at hACeqRaw
  have hACeq : u ^ 2 + w ^ 2 = x ^ 2 + v ^ 2 := by
    simpa [u, w, x, v] using hACeqRaw
  have hxu : x = u := by
    nlinarith only [hCunit, hEunit, hACeq]
  have hwsq : w ^ 2 = v ^ 2 := by
    have hACeq' := hACeq
    rw [hxu] at hACeq'
    nlinarith only [hACeq']
  have hACD' := normSim_signedArea_pos hAD hACD
  change 0 < signedArea2 (T A) (T C) (T D) at hACD'
  rw [hTA, hTD] at hACD'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero] at hACD'
  have hwNeg : w < 0 := by
    dsimp [w]
    nlinarith only [hACD']
  have hADE' := normSim_signedArea_pos hAD hADE
  change 0 < signedArea2 (T A) (T D) (T E) at hADE'
  rw [hTA, hTD] at hADE'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    sub_zero] at hADE'
  have hvPos : 0 < v := by
    dsimp [v]
    nlinarith only [hADE']
  have hweq : w = -v := by
    nlinarith only [hwsq, hwNeg, hvPos]
  have hcircle : u ^ 2 + v ^ 2 = 2 * u := by
    have hCunit' := hCunit
    rw [hweq] at hCunit'
    nlinarith only [hCunit']
  have hvSqPos : 0 < v ^ 2 := sq_pos_of_pos hvPos
  have huPos : 0 < u := by
    nlinarith only [hcircle, hvSqPos, sq_nonneg u]
  have hCDE' := normSim_signedArea_pos hAD hCDE
  change 0 < signedArea2 (T C) (T D) (T E) at hCDE'
  rw [hTD] at hCDE'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    zero_sub] at hCDE'
  have hCDEscalar :
      0 < (1 - u) * (v - w) - (x - u) * (0 - w) := by
    simpa [u, w, x, v] using hCDE'
  rw [hxu, hweq] at hCDEscalar
  have huLt : u < 1 := by
    nlinarith only [hCDEscalar, hvPos]
  have hABC' := normSim_signedArea_pos hAD hABC
  change 0 < signedArea2 (T A) (T B) (T C) at hABC'
  rw [hTA] at hABC'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hABC'
  have hBCscalar : 0 < -a * v - b * u := by
    have hABCscalar : 0 < a * w - u * b := by
      simpa [a, b, u, w] using hABC'
    rw [hweq] at hABCscalar
    nlinarith only [hABCscalar]
  have hABE' := normSim_signedArea_pos hAD hABE
  change 0 < signedArea2 (T A) (T B) (T E) at hABE'
  rw [hTA] at hABE'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hABE'
  have hBEscalar : 0 < a * v - b * u := by
    have hABEscalar : 0 < a * v - x * b := by
      simpa [a, b, x, v] using hABE'
    rw [hxu] at hABEscalar
    nlinarith only [hABEscalar]
  have hABF' := normSim_signedArea_pos hAD hABF
  change 0 < signedArea2 (T A) (T B) (T F) at hABF'
  rw [hTA] at hABF'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hABF'
  have hBFscalar : 0 < a * d - b * c := by
    simpa [a, b, c, d, mul_comm] using hABF'
  have hBnormRaw := congrArg (fun r : ℝ => r ^ 2) (map_dist_eq hAB_AF)
  change dist (T A) (T B) ^ 2 = dist (T A) (T F) ^ 2 at hBnormRaw
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord,
    hTA] at hBnormRaw
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub, neg_sq]
    at hBnormRaw
  have hBnorm : a ^ 2 + b ^ 2 = c ^ 2 + d ^ 2 := by
    simpa [a, b, c, d] using hBnormRaw
  have hBEnormRaw := congrArg (fun r : ℝ => r ^ 2) (map_dist_eq hBE_EF)
  change dist (T B) (T E) ^ 2 = dist (T E) (T F) ^ 2 at hBEnormRaw
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord]
    at hBEnormRaw
  have hBEnorm :
      (a - u) ^ 2 + (b - v) ^ 2 =
        (u - c) ^ 2 + (v - d) ^ 2 := by
    have hBEnormX :
        (a - x) ^ 2 + (b - v) ^ 2 =
          (x - c) ^ 2 + (v - d) ^ 2 := by
      simpa [a, b, c, d, x, v] using hBEnormRaw
    rw [hxu] at hBEnormX
    exact hBEnormX
  have hdot : a * u + b * v = c * u + d * v := by
    nlinarith only [hBnorm, hBEnorm]
  have hdotDiff : u * (c - a) + v * (d - b) = 0 := by
    nlinarith only [hdot]
  let k := u * (d - b) - v * (c - a)
  have hRPos : 0 < u ^ 2 + v ^ 2 :=
    add_pos_of_nonneg_of_pos (sq_nonneg u) hvSqPos
  have hRNe : u ^ 2 + v ^ 2 ≠ 0 := ne_of_gt hRPos
  have hkNe : k ≠ 0 := by
    intro hk
    have hdxProd : (u ^ 2 + v ^ 2) * (c - a) = 0 := by
      calc
        (u ^ 2 + v ^ 2) * (c - a) =
            u * (u * (c - a) + v * (d - b)) - v * k := by
              dsimp [k]
              ring
        _ = 0 := by rw [hdotDiff, hk]; ring
    have hdyProd : (u ^ 2 + v ^ 2) * (d - b) = 0 := by
      calc
        (u ^ 2 + v ^ 2) * (d - b) =
            v * (u * (c - a) + v * (d - b)) + u * k := by
              dsimp [k]
              ring
        _ = 0 := by rw [hdotDiff, hk]; ring
    have hca : c = a := by
      have : c - a = 0 := (mul_eq_zero.mp hdxProd).resolve_left hRNe
      linarith
    have hdb : d = b := by
      have : d - b = 0 := (mul_eq_zero.mp hdyProd).resolve_left hRNe
      linarith
    rw [hca, hdb] at hBFscalar
    nlinarith only [hBFscalar]
  have hnormDiff :
      (c - a) * (c + a) + (d - b) * (d + b) = 0 := by
    nlinarith only [hBnorm]
  have hcrossSumProd :
      k * (u * (d + b) - v * (c + a)) = 0 := by
    calc
      k * (u * (d + b) - v * (c + a)) =
          (u ^ 2 + v ^ 2) *
              ((c - a) * (c + a) + (d - b) * (d + b)) -
            (u * (c - a) + v * (d - b)) *
              (u * (c + a) + v * (d + b)) := by
                dsimp [k]
                ring
      _ = 0 := by rw [hnormDiff, hdotDiff]; ring
  have hcrossSum : u * (d + b) - v * (c + a) = 0 :=
    (mul_eq_zero.mp hcrossSumProd).resolve_left hkNe
  have hsumDot :
      u * (c + a) + v * (d + b) = 2 * (a * u + b * v) := by
    nlinarith only [hdot]
  have hrefx :
      (u ^ 2 + v ^ 2) * (c + a) =
        2 * (a * u + b * v) * u := by
    calc
      (u ^ 2 + v ^ 2) * (c + a) =
          u * (u * (c + a) + v * (d + b)) -
            v * (u * (d + b) - v * (c + a)) := by ring
      _ = 2 * (a * u + b * v) * u := by
        rw [hsumDot, hcrossSum]
        ring
  have hrefy :
      (u ^ 2 + v ^ 2) * (d + b) =
        2 * (a * u + b * v) * v := by
    calc
      (u ^ 2 + v ^ 2) * (d + b) =
          v * (u * (c + a) + v * (d + b)) +
            u * (u * (d + b) - v * (c + a)) := by ring
      _ = 2 * (a * u + b * v) * v := by
        rw [hsumDot, hcrossSum]
        ring
  exact normalized_mirror_interleaving_incompatible
    hcircle huPos huLt hvPos hBCscalar hBEscalar hrefx hrefy hBFscalar

/-- Reversed-orientation form of
`mirror_interleaving_metric_orientation_incompatibility`. -/
theorem mirror_interleaving_metric_orientation_incompatibility_of_neg
    {A B C D E F : ℝ²}
    (hAD : A ≠ D)
    (hAB_AF : dist A B = dist A F)
    (hAC_AE : dist A C = dist A E)
    (hAD_CD : dist A D = dist C D)
    (hAD_DE : dist A D = dist D E)
    (hBE_EF : dist B E = dist E F)
    (hACD : signedArea2 A C D < 0)
    (hADE : signedArea2 A D E < 0)
    (hCDE : signedArea2 C D E < 0)
    (hABC : signedArea2 A B C < 0)
    (hABE : signedArea2 A B E < 0)
    (hABF : signedArea2 A B F < 0) :
    False := by
  open Census554.EqualityCore in
    apply mirror_interleaving_metric_orientation_incompatibility
      (A := reflectXAxis A) (B := reflectXAxis B)
      (C := reflectXAxis C) (D := reflectXAxis D)
      (E := reflectXAxis E) (F := reflectXAxis F)
  · exact fun h => hAD (reflectXAxis_injective h)
  · simpa only [dist_reflectXAxis] using hAB_AF
  · simpa only [dist_reflectXAxis] using hAC_AE
  · simpa only [dist_reflectXAxis] using hAD_CD
  · simpa only [dist_reflectXAxis] using hAD_DE
  · simpa only [dist_reflectXAxis] using hBE_EF
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith

/-- Boundary-order adapter for the mirror-interleaving Euclidean CEGAR cut. -/
theorem false_of_six_ccw_mirror_interleaving_row_equalities
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id ie iff : Fin n}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (hide : id < ie) (hief : ie < iff)
    (hAB_AF :
      dist (boundary ia) (boundary ib) =
        dist (boundary ia) (boundary iff))
    (hAC_AE :
      dist (boundary ia) (boundary ic) =
        dist (boundary ia) (boundary ie))
    (hAD_CD :
      dist (boundary ia) (boundary id) =
        dist (boundary ic) (boundary id))
    (hAD_DE :
      dist (boundary ia) (boundary id) =
        dist (boundary id) (boundary ie))
    (hBE_EF :
      dist (boundary ib) (boundary ie) =
        dist (boundary ie) (boundary iff)) :
    False := by
  have hACD :
      signedArea2 (boundary ia) (boundary ic) (boundary id) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw
      (hiab.trans hibc) hicd
  have hADE :
      signedArea2 (boundary ia) (boundary id) (boundary ie) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw
      (hiab.trans (hibc.trans hicd)) hide
  have hCDE :
      signedArea2 (boundary ic) (boundary id) (boundary ie) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw hicd hide
  have hABC :
      signedArea2 (boundary ia) (boundary ib) (boundary ic) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw hiab hibc
  have hABE :
      signedArea2 (boundary ia) (boundary ib) (boundary ie) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw hiab
      (hibc.trans (hicd.trans hide))
  have hABF :
      signedArea2 (boundary ia) (boundary ib) (boundary iff) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw hiab
      (hibc.trans (hicd.trans (hide.trans hief)))
  exact mirror_interleaving_metric_orientation_incompatibility_of_neg
    (A := boundary ia) (B := boundary ib) (C := boundary ic)
    (D := boundary id) (E := boundary ie) (F := boundary iff)
    (hboundary_injective.ne
      (hiab.trans (hibc.trans hicd)).ne)
    hAB_AF hAC_AE hAD_CD hAD_DE hBE_EF
    hACD hADE hCDE hABC hABE hABF

set_option maxHeartbeats 800000 in
-- Coordinate normalization plus the exact nonlinear elimination needs extra heartbeats.
/-- The direct six-point metric-orientation cut found by the exact Euclidean
subset miner. -/
theorem metric_orientation_incompatibility
    {A B C D E F : ℝ²}
    (hAB : A ≠ B)
    (hAB_AF : dist A B = dist A F)
    (hAD_AF : dist A D = dist A F)
    (hDA_DB : dist D A = dist D B)
    (hCB_CE : dist C B = dist C E)
    (hCD_CE : dist C D = dist C E)
    (hCDA : 0 < signedArea2 C D A)
    (hCDB : 0 < signedArea2 C D B)
    (hDEB : 0 < signedArea2 D E B)
    (hEFD : 0 < signedArea2 E F D)
    (hFAB : 0 < signedArea2 F A B)
    (hFAC : 0 < signedArea2 F A C)
    (hFAD : 0 < signedArea2 F A D) :
    False := by
  let T := normSim A B
  let x := T C 0
  let s := T C 1
  let y := T D 1
  let m := T E 0
  let n := T E 1
  let p := T F 0
  let q := T F 1
  have hTA : T A = pt 0 0 := by
    simpa [T] using normSim_fst A B
  have hTB : T B = pt 1 0 := by
    simpa [T] using normSim_snd A B hAB
  have map_dist_eq {X Y Z W : ℝ²} (heq : dist X Y = dist Z W) :
      dist (T X) (T Y) = dist (T Z) (T W) := by
    simp only [T, normSim_dist_image A B hAB]
    rw [heq]
  have hAB_AD : dist A B = dist A D := hAB_AF.trans hAD_AF.symm
  have hCB_CD : dist C B = dist C D := hCB_CE.trans hCD_CE.symm
  have hDfst : T D 0 = 1 / 2 := by
    apply normSim_center_fst_eq_half_of_equidistant hAB
    simpa [dist_comm] using hDA_DB
  have hDunit := normSim_dist_sq_eq_one hAB hAB_AD
  change (T A 0 - T D 0) ^ 2 + (T A 1 - T D 1) ^ 2 = 1 at hDunit
  rw [hTA] at hDunit
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hDunit
  have hysq : y ^ 2 = 3 / 4 := by
    dsimp [y]
    rw [hDfst] at hDunit
    nlinarith only [hDunit]
  have hCBCD := congrArg (fun r : ℝ => r ^ 2) (map_dist_eq hCB_CD)
  change dist (T C) (T B) ^ 2 = dist (T C) (T D) ^ 2 at hCBCD
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hCBCD
  rw [hTB] at hCBCD
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at hCBCD
  have hx : x = 2 * y * s := by
    dsimp [x, y, s]
    rw [hDfst] at hCBCD
    dsimp [y, s] at hysq
    nlinarith only [hCBCD, hysq]
  have hFunit := normSim_dist_sq_eq_one hAB hAB_AF
  change (T A 0 - T F 0) ^ 2 + (T A 1 - T F 1) ^ 2 = 1 at hFunit
  rw [hTA] at hFunit
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hFunit
  have hFcircle : p ^ 2 + q ^ 2 = 1 := by
    simpa [p, q] using hFunit
  have hCBCE := congrArg (fun r : ℝ => r ^ 2) (map_dist_eq hCB_CE)
  change dist (T C) (T B) ^ 2 = dist (T C) (T E) ^ 2 at hCBCE
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hCBCE
  rw [hTB] at hCBCE
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at hCBCE
  have hEcircle :
      (m - 2 * y * s) ^ 2 + (n - s) ^ 2 =
        (1 - 2 * y * s) ^ 2 + s ^ 2 := by
    dsimp [m, n, s]
    dsimp [x] at hx
    rw [← hx]
    nlinarith only [hCBCE]
  have hCDA' := normSim_signedArea_pos hAB hCDA
  change 0 < signedArea2 (T C) (T D) (T A) at hCDA'
  rw [hTA] at hCDA'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    zero_sub] at hCDA'
  rw [hDfst] at hCDA'
  change 0 < (1 / 2 - x) * (-s) - (-x) * (y - s) at hCDA'
  have hCDAidentity :
      (1 / 2 - x) * (-s) - (-x) * (y - s) = s := by
    rw [hx]
    linear_combination 2 * s * hysq
  have hspos : 0 < s := by
    rw [hCDAidentity] at hCDA'
    exact hCDA'
  have hCDB' := normSim_signedArea_pos hAB hCDB
  change 0 < signedArea2 (T C) (T D) (T B) at hCDB'
  rw [hTB] at hCDB'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hCDB'
  rw [hDfst] at hCDB'
  change 0 < (1 / 2 - x) * (0 - s) - (1 - x) * (y - s) at hCDB'
  have hCDBidentity :
      (1 / 2 - x) * (0 - s) - (1 - x) * (y - s) = 2 * s - y := by
    rw [hx]
    linear_combination 2 * s * hysq
  have hkpos : 0 < 2 * s - y := by
    rw [hCDBidentity] at hCDB'
    exact hCDB'
  have hFAB' := normSim_signedArea_pos hAB hFAB
  change 0 < signedArea2 (T F) (T A) (T B) at hFAB'
  rw [hTA, hTB] at hFAB'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    zero_sub] at hFAB'
  have hqpos : 0 < q := by
    dsimp [p, q]
    nlinarith only [hFAB']
  have hFAC' := normSim_signedArea_pos hAB hFAC
  change 0 < signedArea2 (T F) (T A) (T C) at hFAC'
  rw [hTA] at hFAC'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    zero_sub] at hFAC'
  change 0 < (-p) * (s - q) - (x - p) * (-q) at hFAC'
  have hFACidentity :
      (-p) * (s - q) - (x - p) * (-q) = s * (2 * y * q - p) := by
    rw [hx]
    ring
  have hfacScalar : 0 < 2 * y * q - p := by
    have hproduct : 0 < s * (2 * y * q - p) := by
      rw [← hFACidentity]
      exact hFAC'
    exact pos_of_mul_pos_right hproduct hspos.le
  have hFAD' := normSim_signedArea_pos hAB hFAD
  change 0 < signedArea2 (T F) (T A) (T D) at hFAD'
  rw [hTA] at hFAD'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one,
    zero_sub] at hFAD'
  have hfadScalar : 0 < q / 2 - p * y := by
    dsimp [p, q, y]
    rw [hDfst] at hFAD'
    nlinarith only [hFAD']
  have hDEB' := normSim_signedArea_pos hAB hDEB
  change 0 < signedArea2 (T D) (T E) (T B) at hDEB'
  rw [hTB] at hDEB'
  simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hDEB'
  have hdebScalar : 0 < y * (1 - m) - n / 2 := by
    dsimp [y, m, n]
    rw [hDfst] at hDEB'
    nlinarith only [hDEB']
  have hEFD' := normSim_signedArea_pos hAB hEFD
  change 0 < signedArea2 (T E) (T F) (T D) at hEFD'
  simp only [signedArea2] at hEFD'
  have hefdScalar :
      0 < (p - m) * (y - n) - (q - n) * (1 / 2 - m) := by
    dsimp [p, q, m, n, y]
    rw [hDfst] at hEFD'
    nlinarith only [hEFD']
  exact normalized_six_point_incompatible y s m n p q hysq hkpos
    hFcircle hEcircle hqpos hfacScalar hfadScalar hdebScalar hefdScalar

/-- Reversed-orientation form of `metric_orientation_incompatibility`.
Reflection preserves the five metric equalities and changes all seven
orientation signs. -/
theorem metric_orientation_incompatibility_of_neg
    {A B C D E F : ℝ²}
    (hAB : A ≠ B)
    (hAB_AF : dist A B = dist A F)
    (hAD_AF : dist A D = dist A F)
    (hDA_DB : dist D A = dist D B)
    (hCB_CE : dist C B = dist C E)
    (hCD_CE : dist C D = dist C E)
    (hCDA : signedArea2 C D A < 0)
    (hCDB : signedArea2 C D B < 0)
    (hDEB : signedArea2 D E B < 0)
    (hEFD : signedArea2 E F D < 0)
    (hFAB : signedArea2 F A B < 0)
    (hFAC : signedArea2 F A C < 0)
    (hFAD : signedArea2 F A D < 0) :
    False := by
  open Census554.EqualityCore in
    apply metric_orientation_incompatibility
      (A := reflectXAxis A) (B := reflectXAxis B)
      (C := reflectXAxis C) (D := reflectXAxis D)
      (E := reflectXAxis E) (F := reflectXAxis F)
  · exact fun h => hAB (reflectXAxis_injective h)
  · simpa only [dist_reflectXAxis] using hAB_AF
  · simpa only [dist_reflectXAxis] using hAD_AF
  · simpa only [dist_reflectXAxis] using hDA_DB
  · simpa only [dist_reflectXAxis] using hCB_CE
  · simpa only [dist_reflectXAxis] using hCD_CE
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith

/-- Boundary-order adapter for the six-point Euclidean CEGAR cut. -/
theorem false_of_six_ccw_row_equalities
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id ie iff : Fin n}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (hide : id < ie) (hief : ie < iff)
    (hAB_AF :
      dist (boundary ia) (boundary ib) =
        dist (boundary ia) (boundary iff))
    (hAD_AF :
      dist (boundary ia) (boundary id) =
        dist (boundary ia) (boundary iff))
    (hDA_DB :
      dist (boundary id) (boundary ia) =
        dist (boundary id) (boundary ib))
    (hCB_CE :
      dist (boundary ic) (boundary ib) =
        dist (boundary ic) (boundary ie))
    (hCD_CE :
      dist (boundary ic) (boundary id) =
        dist (boundary ic) (boundary ie)) :
    False := by
  have cyclic_area (X Y Z : ℝ²) :
      signedArea2 X Y Z = signedArea2 Z X Y := by
    simp only [signedArea2]
    ring
  have hACD :
      signedArea2 (boundary ia) (boundary ic) (boundary id) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw
      (hiab.trans hibc) hicd
  have hBCD :
      signedArea2 (boundary ib) (boundary ic) (boundary id) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw hibc hicd
  have hBDE :
      signedArea2 (boundary ib) (boundary id) (boundary ie) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw
      (hibc.trans hicd) hide
  have hDEF :
      signedArea2 (boundary id) (boundary ie) (boundary iff) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw hide hief
  have hABF :
      signedArea2 (boundary ia) (boundary ib) (boundary iff) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw hiab
      (hibc.trans (hicd.trans (hide.trans hief)))
  have hACF :
      signedArea2 (boundary ia) (boundary ic) (boundary iff) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw
      (hiab.trans hibc) (hicd.trans (hide.trans hief))
  have hADF :
      signedArea2 (boundary ia) (boundary id) (boundary iff) < 0 :=
    hneg_of_ccw hboundary_injective hboundary_ccw
      (hiab.trans (hibc.trans hicd)) (hide.trans hief)
  apply metric_orientation_incompatibility_of_neg
      (A := boundary ia) (B := boundary ib) (C := boundary ic)
      (D := boundary id) (E := boundary ie) (F := boundary iff)
      (hboundary_injective.ne hiab.ne)
      hAB_AF hAD_AF hDA_DB hCB_CE hCD_CE
  · rw [cyclic_area]
    exact hACD
  · rw [cyclic_area]
    exact hBCD
  · rw [cyclic_area]
    exact hBDE
  · rw [cyclic_area]
    exact hDEF
  · rw [cyclic_area, cyclic_area]
    exact hABF
  · rw [cyclic_area, cyclic_area]
    exact hACF
  · rw [cyclic_area, cyclic_area]
    exact hADF

/-- Selected-row consumer for the six-point Euclidean CEGAR cut. -/
theorem false_of_six_ccw_three_selected_rows
    {carrier : Finset ℝ²}
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id ie iff : Fin carrier.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (hide : id < ie) (hief : ie < iff)
    (ARow : SelectedFourClass carrier (boundary ia))
    (CRow : SelectedFourClass carrier (boundary ic))
    (DRow : SelectedFourClass carrier (boundary id))
    (hb_mem_ARow : boundary ib ∈ ARow.support)
    (hd_mem_ARow : boundary id ∈ ARow.support)
    (hf_mem_ARow : boundary iff ∈ ARow.support)
    (hb_mem_CRow : boundary ib ∈ CRow.support)
    (hd_mem_CRow : boundary id ∈ CRow.support)
    (he_mem_CRow : boundary ie ∈ CRow.support)
    (ha_mem_DRow : boundary ia ∈ DRow.support)
    (hb_mem_DRow : boundary ib ∈ DRow.support) :
    False := by
  apply false_of_six_ccw_row_equalities
    hboundary_injective hboundary_ccw hiab hibc hicd hide hief
  · exact
      (ARow.support_eq_radius _ hb_mem_ARow).trans
        (ARow.support_eq_radius _ hf_mem_ARow).symm
  · exact
      (ARow.support_eq_radius _ hd_mem_ARow).trans
        (ARow.support_eq_radius _ hf_mem_ARow).symm
  · exact
      (DRow.support_eq_radius _ ha_mem_DRow).trans
        (DRow.support_eq_radius _ hb_mem_DRow).symm
  · exact
      (CRow.support_eq_radius _ hb_mem_CRow).trans
        (CRow.support_eq_radius _ he_mem_CRow).symm
  · exact
      (CRow.support_eq_radius _ hd_mem_CRow).trans
        (CRow.support_eq_radius _ he_mem_CRow).symm

#print axioms normalized_six_point_incompatible
#print axioms normalized_mirror_interleaving_incompatible
#print axioms mirror_interleaving_metric_orientation_incompatibility
#print axioms mirror_interleaving_metric_orientation_incompatibility_of_neg
#print axioms false_of_six_ccw_mirror_interleaving_row_equalities
#print axioms metric_orientation_incompatibility
#print axioms metric_orientation_incompatibility_of_neg
#print axioms false_of_six_ccw_row_equalities
#print axioms false_of_six_ccw_three_selected_rows

end SixPointEuclideanObstruction
end Problem97

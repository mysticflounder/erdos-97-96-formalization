/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.SixPointEuclideanObstruction

/-!
# Sparse six-point Euclidean row obstruction

This module kernel-checks the exact shared nonlinear schema behind the
rank-14 and rank-15 UNSAT subsets from the six-priority induced-metric audit.
For six points `P0,...,P5`, it uses only the two selected rows

```text
P0 : {P1,P3,P5}
P2 : {P1,P3,P4}
```

together with six strict orientation signs.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace SixPointSparseEuclideanObstruction

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

set_option maxHeartbeats 1200000 in
-- The exact half-angle elimination expands two rational parametrizations.
/-- Half-angle elimination for the shared rank-14/rank-15 schema. -/
private theorem normalized_sparse_six_point_incompatible
    {a b c d h k x y : ℝ}
    (hP3unit : a ^ 2 + b ^ 2 = 1)
    (hP5unit : c ^ 2 + d ^ 2 = 1)
    (hP2eqP1P3 :
      (h - 1) ^ 2 + k ^ 2 = (h - a) ^ 2 + (k - b) ^ 2)
    (hP2eqP1P4 :
      (h - 1) ^ 2 + k ^ 2 = (h - x) ^ 2 + (k - y) ^ 2)
    (h013 : 0 < b)
    (h015 : 0 < d)
    (h035 : 0 < a * d - b * c)
    (h123 : 0 < (h - 1) * b - k * (a - 1))
    (h134 : 0 < (a - 1) * y - b * (x - 1))
    (h345 : 0 < (x - a) * (d - b) - (y - b) * (c - a)) :
    False := by
  have haNegOne : -1 < a := by
    nlinarith only [hP3unit, h013]
  have hcNegOne : -1 < c := by
    nlinarith only [hP5unit, h015]
  have haDenPos : 0 < 1 + a := by linarith
  have hcDenPos : 0 < 1 + c := by linarith
  let t : ℝ := b / (1 + a)
  let v : ℝ := d / (1 + c)
  have htPos : 0 < t := div_pos h013 haDenPos
  have hvPos : 0 < v := div_pos h015 hcDenPos
  have htParamDen : t * (1 + a) = b := by
    dsimp [t]
    field_simp
  have hvParamDen : v * (1 + c) = d := by
    dsimp [v]
    field_simp
  have htSqParam : t ^ 2 * (1 + a) = 1 - a := by
    apply mul_left_cancel₀ (ne_of_gt haDenPos)
    have hsq := congrArg (fun z : ℝ => z ^ 2) htParamDen
    nlinarith only [hsq, hP3unit]
  have hvSqParam : v ^ 2 * (1 + c) = 1 - c := by
    apply mul_left_cancel₀ (ne_of_gt hcDenPos)
    have hsq := congrArg (fun z : ℝ => z ^ 2) hvParamDen
    nlinarith only [hsq, hP5unit]
  have htOnePlus : (1 + t ^ 2) * (1 + a) = 2 := by
    nlinarith only [htSqParam]
  have hvOnePlus : (1 + v ^ 2) * (1 + c) = 2 := by
    nlinarith only [hvSqParam]
  have haParam : a * (1 + t ^ 2) = 1 - t ^ 2 := by
    nlinarith only [htOnePlus]
  have hcParam : c * (1 + v ^ 2) = 1 - v ^ 2 := by
    nlinarith only [hvOnePlus]
  have hbParam : b * (1 + t ^ 2) = 2 * t := by
    calc
      b * (1 + t ^ 2) = t * (1 + a) * (1 + t ^ 2) := by
        rw [htParamDen]
      _ = t * ((1 + t ^ 2) * (1 + a)) := by ring
      _ = t * 2 := by rw [htOnePlus]
      _ = 2 * t := by ring
  have hdParam : d * (1 + v ^ 2) = 2 * v := by
    calc
      d * (1 + v ^ 2) = v * (1 + c) * (1 + v ^ 2) := by
        rw [hvParamDen]
      _ = v * ((1 + v ^ 2) * (1 + c)) := by ring
      _ = v * 2 := by rw [hvOnePlus]
      _ = 2 * v := by ring
  have hCrossIdentity :
      (a * d - b * c) * (1 + t ^ 2) * (1 + v ^ 2) =
        2 * (v - t) * (1 + t * v) := by
    calc
      (a * d - b * c) * (1 + t ^ 2) * (1 + v ^ 2) =
          (a * (1 + t ^ 2)) * (d * (1 + v ^ 2)) -
            (b * (1 + t ^ 2)) * (c * (1 + v ^ 2)) := by ring
      _ = (1 - t ^ 2) * (2 * v) - (2 * t) * (1 - v ^ 2) := by
        rw [haParam, hdParam, hbParam, hcParam]
      _ = 2 * (v - t) * (1 + t * v) := by ring
  have htDenSqPos : 0 < 1 + t ^ 2 := by positivity
  have hvDenSqPos : 0 < 1 + v ^ 2 := by positivity
  have htvPos : 0 < 1 + t * v := by positivity
  have hCrossScaled : 0 <
      (a * d - b * c) * (1 + t ^ 2) * (1 + v ^ 2) :=
    mul_pos (mul_pos h035 htDenSqPos) hvDenSqPos
  have hvtPos : 0 < v - t := by
    rw [hCrossIdentity] at hCrossScaled
    nlinarith only [hCrossScaled, htvPos]
  have hP2bisector : h * (1 - a) = k * b := by
    ring_nf at hP2eqP1P3 hP3unit ⊢
    linarith only [hP2eqP1P3, hP3unit]
  have htTimesB : t * b = 1 - a := by
    calc
      t * b = t ^ 2 * (1 + a) := by rw [← htParamDen]; ring
      _ = 1 - a := htSqParam
  have hbNe : b ≠ 0 := ne_of_gt h013
  have hk : k = h * t := by
    apply (mul_left_cancel₀ hbNe)
    calc
      b * k = k * b := by ring
      _ = h * (1 - a) := hP2bisector.symm
      _ = h * (t * b) := by rw [htTimesB]
      _ = b * (h * t) := by ring
  have h123Identity :
      ((h - 1) * b - k * (a - 1)) * (1 + t ^ 2) =
        2 * t * (h * (1 + t ^ 2) - 1) := by
    rw [hk]
    calc
      ((h - 1) * b - h * t * (a - 1)) * (1 + t ^ 2) =
          (h - 1) * (b * (1 + t ^ 2)) -
            h * t * (a * (1 + t ^ 2) - (1 + t ^ 2)) := by ring
      _ = (h - 1) * (2 * t) -
          h * t * ((1 - t ^ 2) - (1 + t ^ 2)) := by
        rw [hbParam, haParam]
      _ = 2 * t * (h * (1 + t ^ 2) - 1) := by ring
  have hHeightPos : 0 < h * (1 + t ^ 2) - 1 := by
    have hScaled : 0 <
        ((h - 1) * b - k * (a - 1)) * (1 + t ^ 2) :=
      mul_pos h123 htDenSqPos
    rw [h123Identity] at hScaled
    by_contra hnot
    have hnonpos : h * (1 + t ^ 2) - 1 ≤ 0 := le_of_not_gt hnot
    have htwoT : 0 ≤ 2 * t := by positivity
    have := mul_nonpos_of_nonneg_of_nonpos htwoT hnonpos
    linarith
  let L : ℝ := 1 - x - t * y
  let A : ℝ := t * (x + 1) - y
  have h134Identity : (a - 1) * y - b * (x - 1) = b * L := by
    calc
      (a - 1) * y - b * (x - 1) =
          -(1 - a) * y + b * (1 - x) := by ring
      _ = -(t * b) * y + b * (1 - x) := by rw [htTimesB]
      _ = b * L := by dsimp [L]; ring
  have hLProduct : 0 < b * L := by
    rw [← h134Identity]
    exact h134
  have hLPos : 0 < L := by
    by_contra hnot
    have hnonpos : L ≤ 0 := le_of_not_gt hnot
    have := mul_nonpos_of_nonneg_of_nonpos h013.le hnonpos
    linarith
  have h345Identity :
      ((x - a) * (d - b) - (y - b) * (c - a)) *
          (1 + t ^ 2) * (1 + v ^ 2) =
        -2 * (v - t) * (v * A + L) := by
    dsimp [A, L]
    calc
      ((x - a) * (d - b) - (y - b) * (c - a)) *
          (1 + t ^ 2) * (1 + v ^ 2) =
          x * (1 + t ^ 2) * (d * (1 + v ^ 2)) -
            x * (1 + v ^ 2) * (b * (1 + t ^ 2)) -
            (a * (1 + t ^ 2)) * (d * (1 + v ^ 2)) -
            y * (1 + t ^ 2) * (c * (1 + v ^ 2)) +
            y * (1 + v ^ 2) * (a * (1 + t ^ 2)) +
            (b * (1 + t ^ 2)) * (c * (1 + v ^ 2)) := by ring
      _ = x * (1 + t ^ 2) * (2 * v) -
            x * (1 + v ^ 2) * (2 * t) -
            (1 - t ^ 2) * (2 * v) -
            y * (1 + t ^ 2) * (1 - v ^ 2) +
            y * (1 + v ^ 2) * (1 - t ^ 2) +
            (2 * t) * (1 - v ^ 2) := by
        rw [hdParam, hbParam, haParam, hcParam]
      _ = -2 * (v - t) *
          (v * (t * (x + 1) - y) + (1 - x - t * y)) := by ring
  have h345Scaled : 0 <
      ((x - a) * (d - b) - (y - b) * (c - a)) *
        (1 + t ^ 2) * (1 + v ^ 2) :=
    mul_pos (mul_pos h345 htDenSqPos) hvDenSqPos
  have hvALNeg : v * A + L < 0 := by
    rw [h345Identity] at h345Scaled
    nlinarith only [h345Scaled, hvtPos]
  have hANeg : A < 0 := by
    by_contra hnot
    have hAnonneg : 0 ≤ A := le_of_not_gt hnot
    have : 0 ≤ v * A := mul_nonneg hvPos.le hAnonneg
    linarith
  have hcircle : x ^ 2 + y ^ 2 - 1 + 2 * h * L = 0 := by
    dsimp [L]
    rw [hk] at hP2eqP1P4
    nlinarith only [hP2eqP1P4]
  let F : ℝ := (1 - x ^ 2 - y ^ 2) * (1 + t ^ 2) - 2 * L
  have hFPos : 0 < F := by
    dsimp [F]
    have hScaledHeight :
        (1 - x ^ 2 - y ^ 2) * (1 + t ^ 2) =
          2 * h * L * (1 + t ^ 2) := by
      nlinarith only [hcircle]
    rw [hScaledHeight]
    nlinarith only [hHeightPos, hLPos]
  have hFIdentity : F = -A ^ 2 + 2 * t * A - L ^ 2 := by
    dsimp [F, A, L]
    ring
  have hFNeg : F < 0 := by
    rw [hFIdentity]
    have hASqPos : 0 < A ^ 2 := sq_pos_of_neg hANeg
    have htANeg : t * A < 0 := mul_neg_of_pos_of_neg htPos hANeg
    nlinarith only [hASqPos, htANeg, sq_nonneg L]
  linarith

set_option maxHeartbeats 1200000 in
-- Coordinate normalization followed by the scalar elimination needs extra heartbeats.
/-- The direct metric-orientation incompatibility shared by the rank-14 and
rank-15 six-point UNSAT subsets. -/
theorem metric_orientation_incompatibility
    {P0 P1 P2 P3 P4 P5 : ℝ²}
    (hP0P1 : P0 ≠ P1)
    (h01_03 : dist P0 P1 = dist P0 P3)
    (h01_05 : dist P0 P1 = dist P0 P5)
    (h21_23 : dist P2 P1 = dist P2 P3)
    (h21_24 : dist P2 P1 = dist P2 P4)
    (h013 : 0 < signedArea2 P0 P1 P3)
    (h015 : 0 < signedArea2 P0 P1 P5)
    (h035 : 0 < signedArea2 P0 P3 P5)
    (h123 : 0 < signedArea2 P1 P2 P3)
    (h134 : 0 < signedArea2 P1 P3 P4)
    (h345 : 0 < signedArea2 P3 P4 P5) :
    False := by
  let T := normSim P0 P1
  let a := T P3 0
  let b := T P3 1
  let c := T P5 0
  let d := T P5 1
  let h := T P2 0
  let k := T P2 1
  let x := T P4 0
  let y := T P4 1
  have hTP0 : T P0 = pt 0 0 := by
    simpa [T] using normSim_fst P0 P1
  have hTP1 : T P1 = pt 1 0 := by
    simpa [T] using normSim_snd P0 P1 hP0P1
  have map_dist_eq {X Y Z W : ℝ²} (heq : dist X Y = dist Z W) :
      dist (T X) (T Y) = dist (T Z) (T W) := by
    simp only [T, normSim_dist_image P0 P1 hP0P1]
    rw [heq]
  have hP3unit : a ^ 2 + b ^ 2 = 1 := by
    have hunitP3 := normSim_dist_sq_eq_one hP0P1 h01_03
    change (T P0 0 - T P3 0) ^ 2 + (T P0 1 - T P3 1) ^ 2 = 1 at hunitP3
    rw [hTP0] at hunitP3
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
      neg_sq] at hunitP3
    simpa [a, b] using hunitP3
  have hP5unit' := normSim_dist_sq_eq_one hP0P1 h01_05
  change (T P0 0 - T P5 0) ^ 2 + (T P0 1 - T P5 1) ^ 2 = 1 at hP5unit'
  rw [hTP0] at hP5unit'
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hP5unit'
  have hP5unit : c ^ 2 + d ^ 2 = 1 := by
    simpa [c, d] using hP5unit'
  have hP2eqP1P3' :=
    congrArg (fun r : ℝ => r ^ 2) (map_dist_eq h21_23)
  change dist (T P2) (T P1) ^ 2 = dist (T P2) (T P3) ^ 2 at hP2eqP1P3'
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hP2eqP1P3'
  rw [hTP1] at hP2eqP1P3'
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at hP2eqP1P3'
  have hP2eqP1P3 :
      (h - 1) ^ 2 + k ^ 2 = (h - a) ^ 2 + (k - b) ^ 2 := by
    simpa [h, k, a, b] using hP2eqP1P3'
  have hP2eqP1P4' :=
    congrArg (fun r : ℝ => r ^ 2) (map_dist_eq h21_24)
  change dist (T P2) (T P1) ^ 2 = dist (T P2) (T P4) ^ 2 at hP2eqP1P4'
  rw [SurplusCOMPGBank.dist_sq_coord, SurplusCOMPGBank.dist_sq_coord] at hP2eqP1P4'
  rw [hTP1] at hP2eqP1P4'
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, sub_zero] at hP2eqP1P4'
  have hP2eqP1P4 :
      (h - 1) ^ 2 + k ^ 2 = (h - x) ^ 2 + (k - y) ^ 2 := by
    simpa [h, k, x, y] using hP2eqP1P4'
  have h013' := normSim_signedArea_pos hP0P1 h013
  change 0 < signedArea2 (T P0) (T P1) (T P3) at h013'
  rw [hTP0, hTP1] at h013'
  have hb : 0 < b := by
    simpa [signedArea2, pt, b] using h013'
  have h015' := normSim_signedArea_pos hP0P1 h015
  change 0 < signedArea2 (T P0) (T P1) (T P5) at h015'
  rw [hTP0, hTP1] at h015'
  have hd : 0 < d := by
    simpa [signedArea2, pt, d] using h015'
  have h035' := normSim_signedArea_pos hP0P1 h035
  change 0 < signedArea2 (T P0) (T P3) (T P5) at h035'
  rw [hTP0] at h035'
  have hacbd : 0 < a * d - b * c := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at h035'
    dsimp [a, b, c, d]
    nlinarith only [h035']
  have h123' := normSim_signedArea_pos hP0P1 h123
  change 0 < signedArea2 (T P1) (T P2) (T P3) at h123'
  rw [hTP1] at h123'
  have h123Scalar : 0 < (h - 1) * b - k * (a - 1) := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at h123'
    dsimp [h, k, a, b]
    nlinarith only [h123']
  have h134' := normSim_signedArea_pos hP0P1 h134
  change 0 < signedArea2 (T P1) (T P3) (T P4) at h134'
  rw [hTP1] at h134'
  have h134Scalar : 0 < (a - 1) * y - b * (x - 1) := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at h134'
    dsimp [a, b, x, y]
    nlinarith only [h134']
  have h345' := normSim_signedArea_pos hP0P1 h345
  change 0 < signedArea2 (T P3) (T P4) (T P5) at h345'
  have h345Scalar :
      0 < (x - a) * (d - b) - (y - b) * (c - a) := by
    simp only [signedArea2] at h345'
    dsimp [a, b, c, d, x, y]
    nlinarith only [h345']
  exact normalized_sparse_six_point_incompatible hP3unit hP5unit
    hP2eqP1P3 hP2eqP1P4 hb hd hacbd h123Scalar h134Scalar h345Scalar

/-- Reflection converts the reversed orientation convention to the positive
form without changing any metric equality. -/
theorem metric_orientation_incompatibility_of_neg
    {P0 P1 P2 P3 P4 P5 : ℝ²}
    (hP0P1 : P0 ≠ P1)
    (h01_03 : dist P0 P1 = dist P0 P3)
    (h01_05 : dist P0 P1 = dist P0 P5)
    (h21_23 : dist P2 P1 = dist P2 P3)
    (h21_24 : dist P2 P1 = dist P2 P4)
    (h013 : signedArea2 P0 P1 P3 < 0)
    (h015 : signedArea2 P0 P1 P5 < 0)
    (h035 : signedArea2 P0 P3 P5 < 0)
    (h123 : signedArea2 P1 P2 P3 < 0)
    (h134 : signedArea2 P1 P3 P4 < 0)
    (h345 : signedArea2 P3 P4 P5 < 0) :
    False := by
  open Census554.EqualityCore in
    apply metric_orientation_incompatibility
      (P0 := reflectXAxis P0) (P1 := reflectXAxis P1)
      (P2 := reflectXAxis P2) (P3 := reflectXAxis P3)
      (P4 := reflectXAxis P4) (P5 := reflectXAxis P5)
  · exact fun h => hP0P1 (reflectXAxis_injective h)
  · simpa only [dist_reflectXAxis] using h01_03
  · simpa only [dist_reflectXAxis] using h01_05
  · simpa only [dist_reflectXAxis] using h21_23
  · simpa only [dist_reflectXAxis] using h21_24
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

/-- Boundary-order adapter for the sparse six-point obstruction. -/
theorem false_of_six_ccw_row_equalities
    {n : ℕ}
    {boundary : Fin n → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 : Fin n}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h01_03 :
      dist (boundary i0) (boundary i1) =
        dist (boundary i0) (boundary i3))
    (h01_05 :
      dist (boundary i0) (boundary i1) =
        dist (boundary i0) (boundary i5))
    (h21_23 :
      dist (boundary i2) (boundary i1) =
        dist (boundary i2) (boundary i3))
    (h21_24 :
      dist (boundary i2) (boundary i1) =
        dist (boundary i2) (boundary i4)) :
    False := by
  apply metric_orientation_incompatibility_of_neg
      (P0 := boundary i0) (P1 := boundary i1) (P2 := boundary i2)
      (P3 := boundary i3) (P4 := boundary i4) (P5 := boundary i5)
      (hboundary_injective.ne h01.ne)
      h01_03 h01_05 h21_23 h21_24
  · exact hneg_of_ccw hboundary_injective hboundary_ccw h01
      (h12.trans h23)
  · exact hneg_of_ccw hboundary_injective hboundary_ccw h01
      (h12.trans (h23.trans (h34.trans h45)))
  · exact hneg_of_ccw hboundary_injective hboundary_ccw
      (h01.trans (h12.trans h23)) (h34.trans h45)
  · exact hneg_of_ccw hboundary_injective hboundary_ccw h12 h23
  · exact hneg_of_ccw hboundary_injective hboundary_ccw
      (h12.trans h23) h34
  · exact hneg_of_ccw hboundary_injective hboundary_ccw h34 h45

/-- Natural selected-row consumer for the shared rank-14/rank-15 schema. -/
theorem false_of_six_ccw_two_selected_rows
    {carrier : Finset ℝ²}
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (P0Row : SelectedFourClass carrier (boundary i0))
    (P2Row : SelectedFourClass carrier (boundary i2))
    (h1_mem_P0Row : boundary i1 ∈ P0Row.support)
    (h3_mem_P0Row : boundary i3 ∈ P0Row.support)
    (h5_mem_P0Row : boundary i5 ∈ P0Row.support)
    (h1_mem_P2Row : boundary i1 ∈ P2Row.support)
    (h3_mem_P2Row : boundary i3 ∈ P2Row.support)
    (h4_mem_P2Row : boundary i4 ∈ P2Row.support) :
    False := by
  apply false_of_six_ccw_row_equalities
    hboundary_injective hboundary_ccw h01 h12 h23 h34 h45
  · exact
      (P0Row.support_eq_radius _ h1_mem_P0Row).trans
        (P0Row.support_eq_radius _ h3_mem_P0Row).symm
  · exact
      (P0Row.support_eq_radius _ h1_mem_P0Row).trans
        (P0Row.support_eq_radius _ h5_mem_P0Row).symm
  · exact
      (P2Row.support_eq_radius _ h1_mem_P2Row).trans
        (P2Row.support_eq_radius _ h3_mem_P2Row).symm
  · exact
      (P2Row.support_eq_radius _ h1_mem_P2Row).trans
        (P2Row.support_eq_radius _ h4_mem_P2Row).symm

#print axioms normalized_sparse_six_point_incompatible
#print axioms metric_orientation_incompatibility
#print axioms metric_orientation_incompatibility_of_neg
#print axioms false_of_six_ccw_row_equalities
#print axioms false_of_six_ccw_two_selected_rows

end SixPointSparseEuclideanObstruction
end Problem97

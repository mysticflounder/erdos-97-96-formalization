/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ThreeFanOrderMetric
import Erdos9796Proof.P97.Census554.SevenPointThreeFanCanonicalExceptional

/-!
# The noncrossed three-fan order

This module treats the noncrossed cyclic order of a seven-point three-fan.  A
Euclidean similarity sends the first and last fan points to `(0, 0)` and
`(1, 0)`.  The three equal-distance pairs then identify the other three
support points as reflections.  The resulting signed-area inequalities are
the hypotheses of
`Census554.EqualityCore.false_of_threeFan_canonical_exceptional_order_scalar`.

The final theorem includes the reversal and all six permutations of the three
fan points.  Its hypotheses retain an injective CCW boundary enumeration;
`ConvexIndep` of a deduplicating `Finset` alone would not provide named-point
distinctness.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace ColoredPaleyThreeFanOrderMetric

/-- The six equal-distance relations in a three-fan with common point `A`. -/
abbrev threeFanEqualities {n : ℕ} (φ : Fin n → ℝ²)
    (a x b c y d z : Fin n) : Prop :=
  dist (φ x) (φ a) = dist (φ x) (φ b) ∧
    dist (φ x) (φ b) = dist (φ x) (φ c) ∧
    dist (φ y) (φ a) = dist (φ y) (φ b) ∧
    dist (φ y) (φ b) = dist (φ y) (φ d) ∧
    dist (φ z) (φ a) = dist (φ z) (φ c) ∧
    dist (φ z) (φ c) = dist (φ z) (φ d)

/-- The noncrossed part of `threeFanOrbit`: `Order₁`, its reversal, and the
six permutations of the three fan points. -/
abbrev threeFanOrderOneOrbit (x b c y d z : ThreeFanPos) : Prop :=
  ((threeFanOrder₁ x b c y d z ∨ threeFanReverseOrder₁ x b c y d z) ∨
    (threeFanOrder₁ x c b z d y ∨ threeFanReverseOrder₁ x c b z d y) ∨
    (threeFanOrder₁ y b d x c z ∨ threeFanReverseOrder₁ y b d x c z) ∨
    (threeFanOrder₁ y d b z c x ∨ threeFanReverseOrder₁ y d b z c x) ∨
    (threeFanOrder₁ z c d x b y ∨ threeFanReverseOrder₁ z c d x b y) ∨
    (threeFanOrder₁ z d c y b x ∨ threeFanReverseOrder₁ z d c y b x))

private theorem reflection_coordinates_at_origin
    {ax ay yx yy bx byc : ℝ}
    (hr_pos : 0 < yx ^ 2 + yy ^ 2)
    (hnorm : bx ^ 2 + byc ^ 2 = ax ^ 2 + ay ^ 2)
    (hdot : bx * yx + byc * yy = ax * yx + ay * yy)
    (hcross_ne : ax * byc - ay * bx ≠ 0) :
    (yx ^ 2 + yy ^ 2) * bx =
        2 * (ax * yx + ay * yy) * yx - (yx ^ 2 + yy ^ 2) * ax ∧
      (yx ^ 2 + yy ^ 2) * byc =
        2 * (ax * yx + ay * yy) * yy - (yx ^ 2 + yy ^ 2) * ay := by
  have hA_identity :
      (ax * yx + ay * yy) ^ 2 + (ax * yy - ay * yx) ^ 2 =
        (ax ^ 2 + ay ^ 2) * (yx ^ 2 + yy ^ 2) := by
    ring
  have hB_identity :
      (bx * yx + byc * yy) ^ 2 + (bx * yy - byc * yx) ^ 2 =
        (bx ^ 2 + byc ^ 2) * (yx ^ 2 + yy ^ 2) := by
    ring
  have hcross_sq :
      (bx * yy - byc * yx) ^ 2 = (ax * yy - ay * yx) ^ 2 := by
    calc
      (bx * yy - byc * yx) ^ 2 =
          (bx ^ 2 + byc ^ 2) * (yx ^ 2 + yy ^ 2) -
            (bx * yx + byc * yy) ^ 2 := by
        rw [← hB_identity]
        ring
      _ = (ax ^ 2 + ay ^ 2) * (yx ^ 2 + yy ^ 2) -
          (ax * yx + ay * yy) ^ 2 := by rw [hnorm, hdot]
      _ = (ax * yy - ay * yx) ^ 2 := by
        rw [← hA_identity]
        ring
  have hfactor :
      ((bx * yy - byc * yx) - (ax * yy - ay * yx)) *
          ((bx * yy - byc * yx) + (ax * yy - ay * yx)) = 0 := by
    calc
      ((bx * yy - byc * yx) - (ax * yy - ay * yx)) *
          ((bx * yy - byc * yx) + (ax * yy - ay * yx)) =
        (bx * yy - byc * yx) ^ 2 - (ax * yy - ay * yx) ^ 2 := by ring
      _ = 0 := by rw [hcross_sq]; ring
  rcases mul_eq_zero.mp hfactor with hsame | hopposite
  · have hdot_zero : (bx - ax) * yx + (byc - ay) * yy = 0 := by
      nlinarith
    have hcross_zero : (bx - ax) * yy - (byc - ay) * yx = 0 := by
      nlinarith
    have hbx_scaled : (yx ^ 2 + yy ^ 2) * (bx - ax) = 0 := by
      calc
        (yx ^ 2 + yy ^ 2) * (bx - ax) =
            yx * ((bx - ax) * yx + (byc - ay) * yy) +
              yy * ((bx - ax) * yy - (byc - ay) * yx) := by ring
        _ = 0 := by rw [hdot_zero, hcross_zero]; ring
    have hby_scaled : (yx ^ 2 + yy ^ 2) * (byc - ay) = 0 := by
      calc
        (yx ^ 2 + yy ^ 2) * (byc - ay) =
            yy * ((bx - ax) * yx + (byc - ay) * yy) -
              yx * ((bx - ax) * yy - (byc - ay) * yx) := by ring
        _ = 0 := by rw [hdot_zero, hcross_zero]; ring
    have hr_ne : yx ^ 2 + yy ^ 2 ≠ 0 := ne_of_gt hr_pos
    have hbx : bx = ax := sub_eq_zero.mp ((mul_eq_zero.mp hbx_scaled).resolve_left hr_ne)
    have hby : byc = ay :=
      sub_eq_zero.mp ((mul_eq_zero.mp hby_scaled).resolve_left hr_ne)
    exact (hcross_ne (by rw [hbx, hby]; ring)).elim
  · have hcross_opposite :
        bx * yy - byc * yx = -(ax * yy - ay * yx) := by
      linarith
    constructor
    · calc
        (yx ^ 2 + yy ^ 2) * bx =
            yx * (bx * yx + byc * yy) + yy * (bx * yy - byc * yx) := by ring
        _ = yx * (ax * yx + ay * yy) - yy * (ax * yy - ay * yx) := by
          rw [hdot, hcross_opposite]
          ring
        _ = 2 * (ax * yx + ay * yy) * yx -
            (yx ^ 2 + yy ^ 2) * ax := by ring
    · calc
        (yx ^ 2 + yy ^ 2) * byc =
            yy * (bx * yx + byc * yy) - yx * (bx * yy - byc * yx) := by ring
        _ = yy * (ax * yx + ay * yy) + yx * (ax * yy - ay * yx) := by
          rw [hdot, hcross_opposite]
          ring
        _ = 2 * (ax * yx + ay * yy) * yy -
            (yx ^ 2 + yy ^ 2) * ay := by ring

private theorem false_of_normalized_threeFan_order_one
    {A B C Y D : ℝ²}
    (hXA_XB : dist (pt 0 0) A = dist (pt 0 0) B)
    (hXB_XC : dist (pt 0 0) B = dist (pt 0 0) C)
    (hYA_YB : dist Y A = dist Y B)
    (hYB_YD : dist Y B = dist Y D)
    (hZA_ZC : dist (pt 1 0) A = dist (pt 1 0) C)
    (hZC_ZD : dist (pt 1 0) C = dist (pt 1 0) D)
    (hAXZ : signedArea2 A (pt 0 0) (pt 1 0) < 0)
    (hXYZ : signedArea2 (pt 0 0) Y (pt 1 0) < 0)
    (hXCZ : signedArea2 (pt 0 0) C (pt 1 0) < 0)
    (hAXC : signedArea2 A (pt 0 0) C < 0)
    (hACZ : signedArea2 A C (pt 1 0) < 0)
    (hACY : signedArea2 A C Y < 0)
    (hXBC : signedArea2 (pt 0 0) B C < 0)
    (hCDZ : signedArea2 C D (pt 1 0) < 0)
    (hAXB : signedArea2 A (pt 0 0) B < 0)
    (hADZ : signedArea2 A D (pt 1 0) < 0)
    (hBCY : signedArea2 B C Y < 0)
    (hCYD : signedArea2 C Y D < 0) : False := by
  let a := A 0
  let h := -A 1
  let u := Y 0
  let v := Y 1
  have hh_pos : 0 < h := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hAXZ
    dsimp only [h]
    linarith only [hAXZ]
  have hv_pos : 0 < v := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hXYZ
    dsimp only [v]
    linarith only [hXYZ]
  have hXA_XC : dist (pt 0 0) A = dist (pt 0 0) C := hXA_XB.trans hXB_XC
  have hZA_ZD : dist (pt 1 0) A = dist (pt 1 0) D := hZA_ZC.trans hZC_ZD
  have hYA_YD : dist Y A = dist Y D := hYA_YB.trans hYB_YD
  have hXCsq := congrArg (fun r : ℝ ↦ r ^ 2) hXA_XC
  have hZCsq := congrArg (fun r : ℝ ↦ r ^ 2) hZA_ZC
  change dist (pt 0 0) A ^ 2 = dist (pt 0 0) C ^ 2 at hXCsq
  change dist (pt 1 0) A ^ 2 = dist (pt 1 0) C ^ 2 at hZCsq
  rw [dist_sq_coord, dist_sq_coord] at hXCsq hZCsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hXCsq hZCsq
  have hCx : C 0 = a := by
    dsimp only [a, h] at hXCsq hZCsq ⊢
    nlinarith only [hXCsq, hZCsq]
  have hCy_pos : 0 < C 1 := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hXCZ
    linarith only [hXCZ]
  have hCy : C 1 = h := by
    dsimp only [a, h] at hXCsq ⊢
    rw [hCx] at hXCsq
    nlinarith only [hXCsq, hCy_pos, hh_pos]
  have ha_pos : 0 < a := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hAXC
    rw [hCx, hCy] at hAXC
    dsimp only [a, h] at hAXC ⊢
    nlinarith only [hAXC, hh_pos]
  have ha_lt_one : a < 1 := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hACZ
    rw [hCx, hCy] at hACZ
    dsimp only [a, h] at hACZ ⊢
    nlinarith only [hACZ, hh_pos]
  have ha_lt_u : a < u := by
    simp only [signedArea2] at hACY
    rw [hCx, hCy] at hACY
    dsimp only [a, h, u, v] at hACY ⊢
    nlinarith only [hACY, hh_pos]
  have hXBsquared := congrArg (fun r : ℝ ↦ r ^ 2) hXA_XB
  have hYBsquared := congrArg (fun r : ℝ ↦ r ^ 2) hYA_YB
  change dist (pt 0 0) A ^ 2 = dist (pt 0 0) B ^ 2 at hXBsquared
  change dist Y A ^ 2 = dist Y B ^ 2 at hYBsquared
  rw [dist_sq_coord, dist_sq_coord] at hXBsquared hYBsquared
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hXBsquared hYBsquared
  have hBnorm : B 0 ^ 2 + B 1 ^ 2 = a ^ 2 + (-h) ^ 2 := by
    dsimp only [a, h] at hXBsquared ⊢
    nlinarith only [hXBsquared]
  have hBdot : B 0 * u + B 1 * v = a * u + (-h) * v := by
    dsimp only [a, h, u, v] at hXBsquared hYBsquared ⊢
    nlinarith only [hXBsquared, hYBsquared]
  have hAXB' : -(a * B 1 + h * B 0) < 0 := by
    have hAXB' := hAXB
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hAXB'
    dsimp only [a, h] at hAXB' ⊢
    nlinarith only [hAXB']
  have hBcross_ne : a * B 1 - (-h) * B 0 ≠ 0 := by
    intro hzero
    have : a * B 1 + h * B 0 = 0 := by nlinarith only [hzero]
    linarith only [hAXB', this]
  have hBr_pos : 0 < u ^ 2 + v ^ 2 := by
    nlinarith only [sq_nonneg u, sq_nonneg v, hv_pos]
  have hBcoords :=
    reflection_coordinates_at_origin hBr_pos hBnorm hBdot hBcross_ne
  have hXBC' : B 0 * h - a * B 1 < 0 := by
    simpa [signedArea2, pt, a, h, hCx, hCy] using hXBC
  have hXBC_identity :
      (u ^ 2 + v ^ 2) * (B 0 * h - a * B 1) =
        -2 * u * v * (a ^ 2 + h ^ 2) := by
    calc
      (u ^ 2 + v ^ 2) * (B 0 * h - a * B 1) =
          h * ((u ^ 2 + v ^ 2) * B 0) -
            a * ((u ^ 2 + v ^ 2) * B 1) := by ring
      _ = h *
            (2 * (a * u + (-h) * v) * u - (u ^ 2 + v ^ 2) * a) -
          a *
            (2 * (a * u + (-h) * v) * v - (u ^ 2 + v ^ 2) * (-h)) := by
        rw [hBcoords.1, hBcoords.2]
      _ = -2 * u * v * (a ^ 2 + h ^ 2) := by ring
  have hXBC_left_neg :
      (u ^ 2 + v ^ 2) * (B 0 * h - a * B 1) < 0 :=
    mul_neg_of_pos_of_neg hBr_pos hXBC'
  have hXBC_right_neg : -2 * u * v * (a ^ 2 + h ^ 2) < 0 := by
    rw [← hXBC_identity]
    exact hXBC_left_neg
  have hA_norm_pos : 0 < a ^ 2 + h ^ 2 := by
    nlinarith only [sq_nonneg a, sq_nonneg h, hh_pos]
  have hu_pos : 0 < u := by
    by_contra hnot
    have hu_nonpos : u ≤ 0 := le_of_not_gt hnot
    have hfirst_nonneg : 0 ≤ -2 * u := by linarith
    have hrest_nonneg : 0 ≤ v * (a ^ 2 + h ^ 2) :=
      (mul_pos hv_pos hA_norm_pos).le
    have hnonneg : 0 ≤ (-2 * u) * (v * (a ^ 2 + h ^ 2)) :=
      mul_nonneg hfirst_nonneg hrest_nonneg
    nlinarith only [hXBC_right_neg, hnonneg]
  have htransverse_pos : 0 < a * v + h * u :=
    add_pos (mul_pos ha_pos hv_pos) (mul_pos hh_pos hu_pos)
  have hAXB_identity :
      (u ^ 2 + v ^ 2) * (-(a * B 1 + h * B 0)) =
        -2 * (a * u - h * v) * (a * v + h * u) := by
    calc
      (u ^ 2 + v ^ 2) * (-(a * B 1 + h * B 0)) =
          -a * ((u ^ 2 + v ^ 2) * B 1) -
            h * ((u ^ 2 + v ^ 2) * B 0) := by ring
      _ = -a *
            (2 * (a * u + (-h) * v) * v - (u ^ 2 + v ^ 2) * (-h)) -
          h *
            (2 * (a * u + (-h) * v) * u - (u ^ 2 + v ^ 2) * a) := by
        rw [hBcoords.1, hBcoords.2]
      _ = -2 * (a * u - h * v) * (a * v + h * u) := by ring
  have hAXB_left_neg :
      (u ^ 2 + v ^ 2) * (-(a * B 1 + h * B 0)) < 0 :=
    mul_neg_of_pos_of_neg hBr_pos hAXB'
  have hAXB_right_neg :
      -2 * (a * u - h * v) * (a * v + h * u) < 0 := by
    rw [← hAXB_identity]
    exact hAXB_left_neg
  have hAXY : 0 < a * u - h * v := by
    by_contra hnot
    have hs_nonpos : a * u - h * v ≤ 0 := le_of_not_gt hnot
    have hfirst_nonneg : 0 ≤ -2 * (a * u - h * v) := by linarith
    have hnonneg :
        0 ≤ (-2 * (a * u - h * v)) * (a * v + h * u) :=
      mul_nonneg hfirst_nonneg htransverse_pos.le
    nlinarith only [hAXB_right_neg, hnonneg]
  have hZDsquared := congrArg (fun r : ℝ ↦ r ^ 2) hZA_ZD
  have hYDsquared := congrArg (fun r : ℝ ↦ r ^ 2) hYA_YD
  change dist (pt 1 0) A ^ 2 = dist (pt 1 0) D ^ 2 at hZDsquared
  change dist Y A ^ 2 = dist Y D ^ 2 at hYDsquared
  rw [dist_sq_coord, dist_sq_coord] at hZDsquared hYDsquared
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hZDsquared hYDsquared
  have hDnorm : (D 0 - 1) ^ 2 + D 1 ^ 2 = (a - 1) ^ 2 + (-h) ^ 2 := by
    dsimp only [a, h] at hZDsquared ⊢
    nlinarith only [hZDsquared]
  have hDdot :
      (D 0 - 1) * (u - 1) + D 1 * v =
        (a - 1) * (u - 1) + (-h) * v := by
    dsimp only [a, h, u, v] at hZDsquared hYDsquared ⊢
    nlinarith only [hZDsquared, hYDsquared]
  have hADZ' : (a - 1) * D 1 + h * (D 0 - 1) < 0 := by
    have hADZ' := hADZ
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hADZ'
    dsimp only [a, h] at hADZ' ⊢
    nlinarith only [hADZ']
  have hDcross_ne : (a - 1) * D 1 - (-h) * (D 0 - 1) ≠ 0 := by
    intro hzero
    have : (a - 1) * D 1 + h * (D 0 - 1) = 0 := by nlinarith only [hzero]
    linarith only [hADZ', this]
  have hDr_pos : 0 < (u - 1) ^ 2 + v ^ 2 := by
    nlinarith only [sq_nonneg (u - 1), sq_nonneg v, hv_pos]
  have hDcoords :=
    reflection_coordinates_at_origin hDr_pos hDnorm hDdot hDcross_ne
  have hCDZ' :
      -h * (D 0 - a) - (1 - a) * (D 1 - h) < 0 := by
    have hCDZ' := hCDZ
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hCDZ'
    rw [hCx, hCy] at hCDZ'
    dsimp only [a, h] at hCDZ' ⊢
    nlinarith only [hCDZ']
  have hCDZ_identity :
      ((u - 1) ^ 2 + v ^ 2) *
          (-h * (D 0 - a) - (1 - a) * (D 1 - h)) =
        -2 * (1 - u) * v * ((1 - a) ^ 2 + h ^ 2) := by
    calc
      ((u - 1) ^ 2 + v ^ 2) *
            (-h * (D 0 - a) - (1 - a) * (D 1 - h)) =
          -h * (((u - 1) ^ 2 + v ^ 2) * (D 0 - 1)) -
            (1 - a) * (((u - 1) ^ 2 + v ^ 2) * D 1) := by ring
      _ = -h *
            (2 * ((a - 1) * (u - 1) + (-h) * v) * (u - 1) -
              ((u - 1) ^ 2 + v ^ 2) * (a - 1)) -
          (1 - a) *
            (2 * ((a - 1) * (u - 1) + (-h) * v) * v -
              ((u - 1) ^ 2 + v ^ 2) * (-h)) := by
        rw [hDcoords.1, hDcoords.2]
      _ = -2 * (1 - u) * v * ((1 - a) ^ 2 + h ^ 2) := by ring
  have hCDZ_left_neg :
      ((u - 1) ^ 2 + v ^ 2) *
          (-h * (D 0 - a) - (1 - a) * (D 1 - h)) < 0 :=
    mul_neg_of_pos_of_neg hDr_pos hCDZ'
  have hCDZ_right_neg :
      -2 * (1 - u) * v * ((1 - a) ^ 2 + h ^ 2) < 0 := by
    rw [← hCDZ_identity]
    exact hCDZ_left_neg
  have hAone_norm_pos : 0 < (1 - a) ^ 2 + h ^ 2 := by
    nlinarith only [sq_nonneg (1 - a), sq_nonneg h, hh_pos]
  have hu_lt_one : u < 1 := by
    by_contra hnot
    have hu_ge : 1 ≤ u := le_of_not_gt hnot
    have hfirst_nonneg : 0 ≤ -2 * (1 - u) := by linarith
    have hrest_nonneg : 0 ≤ v * ((1 - a) ^ 2 + h ^ 2) :=
      (mul_pos hv_pos hAone_norm_pos).le
    have hnonneg :
        0 ≤ (-2 * (1 - u)) * (v * ((1 - a) ^ 2 + h ^ 2)) :=
      mul_nonneg hfirst_nonneg hrest_nonneg
    nlinarith only [hCDZ_right_neg, hnonneg]
  have hsecond_transverse_neg : (a - 1) * v + h * (u - 1) < 0 := by
    have h₀ : (a - 1) * v < 0 :=
      mul_neg_of_neg_of_pos (sub_neg.mpr ha_lt_one) hv_pos
    have h₁ : h * (u - 1) < 0 :=
      mul_neg_of_pos_of_neg hh_pos (sub_neg.mpr hu_lt_one)
    linarith only [h₀, h₁]
  have hADZ_identity :
      ((u - 1) ^ 2 + v ^ 2) *
          ((a - 1) * D 1 + h * (D 0 - 1)) =
        2 * ((a - 1) * (u - 1) - h * v) *
          ((a - 1) * v + h * (u - 1)) := by
    calc
      ((u - 1) ^ 2 + v ^ 2) *
            ((a - 1) * D 1 + h * (D 0 - 1)) =
          (a - 1) * (((u - 1) ^ 2 + v ^ 2) * D 1) +
            h * (((u - 1) ^ 2 + v ^ 2) * (D 0 - 1)) := by ring
      _ = (a - 1) *
            (2 * ((a - 1) * (u - 1) + (-h) * v) * v -
              ((u - 1) ^ 2 + v ^ 2) * (-h)) +
          h *
            (2 * ((a - 1) * (u - 1) + (-h) * v) * (u - 1) -
              ((u - 1) ^ 2 + v ^ 2) * (a - 1)) := by
        rw [hDcoords.1, hDcoords.2]
      _ = 2 * ((a - 1) * (u - 1) - h * v) *
          ((a - 1) * v + h * (u - 1)) := by ring
  have hADZ_left_neg :
      ((u - 1) ^ 2 + v ^ 2) *
          ((a - 1) * D 1 + h * (D 0 - 1)) < 0 :=
    mul_neg_of_pos_of_neg hDr_pos hADZ'
  have hADZ_right_neg :
      2 * ((a - 1) * (u - 1) - h * v) *
          ((a - 1) * v + h * (u - 1)) < 0 := by
    rw [← hADZ_identity]
    exact hADZ_left_neg
  have hAYZ : 0 < (1 - a) * (1 - u) - h * v := by
    have hs_form :
        (1 - a) * (1 - u) - h * v =
          (a - 1) * (u - 1) - h * v := by ring
    rw [hs_form]
    by_contra hnot
    have hs_nonpos : (a - 1) * (u - 1) - h * v ≤ 0 := le_of_not_gt hnot
    have hproduct_nonneg :
        0 ≤ ((a - 1) * (u - 1) - h * v) *
          ((a - 1) * v + h * (u - 1)) :=
      mul_nonneg_of_nonpos_of_nonpos hs_nonpos hsecond_transverse_neg.le
    nlinarith only [hADZ_right_neg, hproduct_nonneg]
  have hBCY' :
      (a - B 0) * (v - B 1) - (u - B 0) * (h - B 1) < 0 := by
    simpa [signedArea2, a, h, u, v, hCx, hCy] using hBCY
  have hE₀_identity :
      (u ^ 2 + v ^ 2) *
          ((a - B 0) * (v - B 1) - (u - B 0) * (h - B 1)) =
        2 * v * (a * (u ^ 2 + v ^ 2) - u * (a ^ 2 + h ^ 2)) := by
    calc
      (u ^ 2 + v ^ 2) *
            ((a - B 0) * (v - B 1) - (u - B 0) * (h - B 1)) =
          (u ^ 2 + v ^ 2) * (a * v - u * h) +
            (h - v) * ((u ^ 2 + v ^ 2) * B 0) +
            (u - a) * ((u ^ 2 + v ^ 2) * B 1) := by ring
      _ = (u ^ 2 + v ^ 2) * (a * v - u * h) +
            (h - v) *
              (2 * (a * u + (-h) * v) * u - (u ^ 2 + v ^ 2) * a) +
            (u - a) *
              (2 * (a * u + (-h) * v) * v - (u ^ 2 + v ^ 2) * (-h)) := by
        rw [hBcoords.1, hBcoords.2]
      _ = 2 * v * (a * (u ^ 2 + v ^ 2) - u * (a ^ 2 + h ^ 2)) := by ring
  have hE₀_left_neg :
      (u ^ 2 + v ^ 2) *
          ((a - B 0) * (v - B 1) - (u - B 0) * (h - B 1)) < 0 :=
    mul_neg_of_pos_of_neg hBr_pos hBCY'
  have hE₀_scaled_neg :
      2 * v * (a * (u ^ 2 + v ^ 2) - u * (a ^ 2 + h ^ 2)) < 0 := by
    rw [← hE₀_identity]
    exact hE₀_left_neg
  have hE₀ : a * (u ^ 2 + v ^ 2) - u * (a ^ 2 + h ^ 2) < 0 := by
    rcases (mul_neg_iff.mp hE₀_scaled_neg) with hneg | hneg
    · exact hneg.2
    · exact (not_lt_of_ge (show 0 ≤ 2 * v by positivity) hneg.1).elim
  have hCYD' :
      (u - a) * (D 1 - h) - (D 0 - a) * (v - h) < 0 := by
    simpa [signedArea2, a, h, u, v, hCx, hCy] using hCYD
  have hE₁_identity :
      ((u - 1) ^ 2 + v ^ 2) *
          ((u - a) * (D 1 - h) - (D 0 - a) * (v - h)) =
        2 * v *
          ((1 - u) * ((1 - a) ^ 2 + h ^ 2) -
            (1 - a) * ((1 - u) ^ 2 + v ^ 2)) := by
    calc
      ((u - 1) ^ 2 + v ^ 2) *
            ((u - a) * (D 1 - h) - (D 0 - a) * (v - h)) =
          ((u - 1) ^ 2 + v ^ 2) *
              (-(u - a) * h - (1 - a) * (v - h)) +
            (u - a) * (((u - 1) ^ 2 + v ^ 2) * D 1) -
            (v - h) * (((u - 1) ^ 2 + v ^ 2) * (D 0 - 1)) := by ring
      _ = ((u - 1) ^ 2 + v ^ 2) *
              (-(u - a) * h - (1 - a) * (v - h)) +
            (u - a) *
              (2 * ((a - 1) * (u - 1) + (-h) * v) * v -
                ((u - 1) ^ 2 + v ^ 2) * (-h)) -
            (v - h) *
              (2 * ((a - 1) * (u - 1) + (-h) * v) * (u - 1) -
                ((u - 1) ^ 2 + v ^ 2) * (a - 1)) := by
        rw [hDcoords.1, hDcoords.2]
      _ = 2 * v *
          ((1 - u) * ((1 - a) ^ 2 + h ^ 2) -
            (1 - a) * ((1 - u) ^ 2 + v ^ 2)) := by ring
  have hE₁_left_neg :
      ((u - 1) ^ 2 + v ^ 2) *
          ((u - a) * (D 1 - h) - (D 0 - a) * (v - h)) < 0 :=
    mul_neg_of_pos_of_neg hDr_pos hCYD'
  have hE₁_scaled_neg :
      2 * v *
          ((1 - u) * ((1 - a) ^ 2 + h ^ 2) -
            (1 - a) * ((1 - u) ^ 2 + v ^ 2)) < 0 := by
    rw [← hE₁_identity]
    exact hE₁_left_neg
  have hE₁ :
      (1 - u) * ((1 - a) ^ 2 + h ^ 2) -
          (1 - a) * ((1 - u) ^ 2 + v ^ 2) < 0 := by
    rcases (mul_neg_iff.mp hE₁_scaled_neg) with hneg | hneg
    · exact hneg.2
    · exact (not_lt_of_ge (show 0 ≤ 2 * v by positivity) hneg.1).elim
  exact Census554.EqualityCore.false_of_threeFan_canonical_exceptional_order_scalar
    ha_pos ha_lt_one hu_pos hu_lt_one ha_lt_u hAXY hAYZ hE₀ hE₁ hh_pos hv_pos

private theorem false_of_threeFan_order_one_oriented
    {A X B C Y D Z : ℝ²}
    (hXZ_ne : X ≠ Z)
    (hXA_XB : dist X A = dist X B)
    (hXB_XC : dist X B = dist X C)
    (hYA_YB : dist Y A = dist Y B)
    (hYB_YD : dist Y B = dist Y D)
    (hZA_ZC : dist Z A = dist Z C)
    (hZC_ZD : dist Z C = dist Z D)
    (hAXZ : signedArea2 A X Z < 0)
    (hXYZ : signedArea2 X Y Z < 0)
    (hXCZ : signedArea2 X C Z < 0)
    (hAXC : signedArea2 A X C < 0)
    (hACZ : signedArea2 A C Z < 0)
    (hACY : signedArea2 A C Y < 0)
    (hXBC : signedArea2 X B C < 0)
    (hCDZ : signedArea2 C D Z < 0)
    (hAXB : signedArea2 A X B < 0)
    (hADZ : signedArea2 A D Z < 0)
    (hBCY : signedArea2 B C Y < 0)
    (hCYD : signedArea2 C Y D < 0) : False := by
  let T : ℝ² → ℝ² := normSim X Z
  have hdist (P Q : ℝ²) :
      dist (T P) (T Q) = (dist X Z)⁻¹ * dist P Q := by
    simpa [T] using normSim_dist_image X Z hXZ_ne P Q
  have hT_X : T X = pt 0 0 := by
    simpa [T] using normSim_fst X Z
  have hT_Z : T Z = pt 1 0 := by
    simpa [T] using normSim_snd X Z hXZ_ne
  have hbase_sq_pos : 0 < (Z 0 - X 0) ^ 2 + (Z 1 - X 1) ^ 2 := by
    rw [← dist_sq_coord Z X]
    exact sq_pos_of_pos (dist_pos.mpr hXZ_ne.symm)
  have map_dist_eq {P Q R S : ℝ²} (heq : dist P Q = dist R S) :
      dist (T P) (T Q) = dist (T R) (T S) := by
    rw [hdist, hdist, heq]
  have map_area_neg {P Q R : ℝ²} (hneg : signedArea2 P Q R < 0) :
      signedArea2 (T P) (T Q) (T R) < 0 := by
    dsimp only [T]
    rw [signedArea2_normSim X Z hXZ_ne]
    exact mul_neg_of_pos_of_neg (inv_pos.mpr hbase_sq_pos) hneg
  apply false_of_normalized_threeFan_order_one
      (A := T A) (B := T B) (C := T C) (Y := T Y) (D := T D)
  · simpa only [hT_X] using map_dist_eq hXA_XB
  · simpa only [hT_X] using map_dist_eq hXB_XC
  · exact map_dist_eq hYA_YB
  · exact map_dist_eq hYB_YD
  · simpa only [hT_Z] using map_dist_eq hZA_ZC
  · simpa only [hT_Z] using map_dist_eq hZC_ZD
  · simpa only [hT_X, hT_Z] using map_area_neg hAXZ
  · simpa only [hT_X, hT_Z] using map_area_neg hXYZ
  · simpa only [hT_X, hT_Z] using map_area_neg hXCZ
  · simpa only [hT_X] using map_area_neg hAXC
  · simpa only [hT_Z] using map_area_neg hACZ
  · exact map_area_neg hACY
  · simpa only [hT_X] using map_area_neg hXBC
  · simpa only [hT_Z] using map_area_neg hCDZ
  · simpa only [hT_X] using map_area_neg hAXB
  · simpa only [hT_Z] using map_area_neg hADZ
  · exact map_area_neg hBCY
  · exact map_area_neg hCYD

/-- The canonical noncrossed order `A<X<B<C<Y<D<Z` is incompatible with the
six three-fan equalities on an injectively enumerated CCW convex boundary. -/
theorem false_of_threeFan_order_one
    {φ : ThreeFanPos → ℝ²}
    (hinj : Function.Injective φ)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    {x b c y d z : ThreeFanPos}
    (horder : threeFanOrder₁ x b c y d z)
    (hequalities : threeFanEqualities φ 0 x b c y d z) : False := by
  rcases horder with ⟨hax, hxb, hbc, hcy, hyd, hdz⟩
  rcases hequalities with ⟨hXA_XB, hXB_XC, hYA_YB, hYB_YD, hZA_ZC, hZC_ZD⟩
  have hxc : x < c := hxb.trans hbc
  have hxy : x < y := hxc.trans hcy
  have hxz : x < z := hxy.trans (hyd.trans hdz)
  have hcz : c < z := hcy.trans (hyd.trans hdz)
  have hcd : c < d := hcy.trans hyd
  have hyz : y < z := hyd.trans hdz
  have had : (0 : ThreeFanPos) < d := hax.trans (hxb.trans (hbc.trans hcd))
  exact false_of_threeFan_order_one_oriented
    (fun heq ↦ (ne_of_lt hxz) (hinj heq))
    hXA_XB hXB_XC hYA_YB hYB_YD hZA_ZC hZC_ZD
    (hneg_of_ccw hinj hccw hax hxz)
    (hneg_of_ccw hinj hccw hxy hyz)
    (hneg_of_ccw hinj hccw hxc hcz)
    (hneg_of_ccw hinj hccw hax hxc)
    (hneg_of_ccw hinj hccw (hax.trans hxc) hcz)
    (hneg_of_ccw hinj hccw (hax.trans hxc) hcy)
    (hneg_of_ccw hinj hccw hxb hbc)
    (hneg_of_ccw hinj hccw hcd hdz)
    (hneg_of_ccw hinj hccw hax hxb)
    (hneg_of_ccw hinj hccw had hdz)
    (hneg_of_ccw hinj hccw hbc hcy)
    (hneg_of_ccw hinj hccw hcy hyd)

private theorem signedArea2_pos_of_ccw_swap_last
    {n : ℕ} {φ : Fin n → ℝ²}
    (hinj : Function.Injective φ)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    {i j k : Fin n} (hij : i < j) (hjk : j < k) :
    0 < signedArea2 (φ i) (φ k) (φ j) := by
  have hneg := hneg_of_ccw hinj hccw hij hjk
  have hswap :
      signedArea2 (φ i) (φ k) (φ j) =
        -signedArea2 (φ i) (φ j) (φ k) := by
    simp only [signedArea2]
    ring
  rw [hswap]
  linarith

private theorem signedArea2_pos_of_ccw_descending
    {n : ℕ} {φ : Fin n → ℝ²}
    (hinj : Function.Injective φ)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    {i j k : Fin n} (hkj : k < j) (hji : j < i) :
    0 < signedArea2 (φ i) (φ j) (φ k) := by
  have hneg := hneg_of_ccw hinj hccw hkj hji
  have hreverse :
      signedArea2 (φ i) (φ j) (φ k) =
        -signedArea2 (φ k) (φ j) (φ i) := by
    simp only [signedArea2]
    ring
  rw [hreverse]
  linarith

/-- Reversal of the canonical noncrossed order is reduced to the same scalar
obstruction by reflecting the normalized configuration across the first axis. -/
theorem false_of_threeFan_reverse_order_one
    {φ : ThreeFanPos → ℝ²}
    (hinj : Function.Injective φ)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    {x b c y d z : ThreeFanPos}
    (horder : threeFanReverseOrder₁ x b c y d z)
    (hequalities : threeFanEqualities φ 0 x b c y d z) : False := by
  rcases horder with ⟨haz, hzd, hdy, hyc, hcb, hbx⟩
  rcases hequalities with ⟨hXA_XB, hXB_XC, hYA_YB, hYB_YD, hZA_ZC, hZC_ZD⟩
  let R : ℝ² → ℝ² := Census554.EqualityCore.reflectXAxis
  have map_dist_eq {P Q S T : ℝ²} (heq : dist P Q = dist S T) :
      dist (R P) (R Q) = dist (R S) (R T) := by
    dsimp only [R]
    simpa only [Census554.EqualityCore.dist_reflectXAxis] using heq
  have reflect_area_neg {P Q S : ℝ²} (hpos : 0 < signedArea2 P Q S) :
      signedArea2 (R P) (R Q) (R S) < 0 := by
    dsimp only [R]
    rw [Census554.EqualityCore.signedArea2_reflectXAxis]
    linarith
  have hzx : z < x := hzd.trans (hdy.trans (hyc.trans (hcb.trans hbx)))
  have hyx : y < x := hyc.trans (hcb.trans hbx)
  have hcx : c < x := hcb.trans hbx
  have hzb : z < b := hzd.trans (hdy.trans (hyc.trans hcb))
  have hzy : z < y := hzd.trans hdy
  have hzc : z < c := hzy.trans hyc
  have hdc : d < c := hdy.trans hyc
  have hR_XZ_ne : R (φ x) ≠ R (φ z) := by
    intro heq
    exact (ne_of_gt hzx)
      (hinj (Census554.EqualityCore.reflectXAxis_injective heq))
  apply false_of_threeFan_order_one_oriented hR_XZ_ne
  · exact map_dist_eq hXA_XB
  · exact map_dist_eq hXB_XC
  · exact map_dist_eq hYA_YB
  · exact map_dist_eq hYB_YD
  · exact map_dist_eq hZA_ZC
  · exact map_dist_eq hZC_ZD
  · exact reflect_area_neg (signedArea2_pos_of_ccw_swap_last hinj hccw haz hzx)
  · exact reflect_area_neg (signedArea2_pos_of_ccw_descending hinj hccw hzy hyx)
  · exact reflect_area_neg (signedArea2_pos_of_ccw_descending hinj hccw hzc hcx)
  · exact reflect_area_neg (signedArea2_pos_of_ccw_swap_last hinj hccw (haz.trans hzc) hcx)
  · exact reflect_area_neg (signedArea2_pos_of_ccw_swap_last hinj hccw haz hzc)
  · exact reflect_area_neg (signedArea2_pos_of_ccw_swap_last hinj hccw (haz.trans hzy) hyc)
  · exact reflect_area_neg (signedArea2_pos_of_ccw_descending hinj hccw hcb hbx)
  · exact reflect_area_neg (signedArea2_pos_of_ccw_descending hinj hccw hzd hdc)
  · exact reflect_area_neg (signedArea2_pos_of_ccw_swap_last hinj hccw (haz.trans hzb) hbx)
  · exact reflect_area_neg (signedArea2_pos_of_ccw_swap_last hinj hccw haz hzd)
  · exact reflect_area_neg (signedArea2_pos_of_ccw_descending hinj hccw hyc hcb)
  · exact reflect_area_neg (signedArea2_pos_of_ccw_descending hinj hccw hdy hyc)

private theorem threeFanEqualities_perm₂
    {φ : ThreeFanPos → ℝ²} {x b c y d z : ThreeFanPos}
    (h : threeFanEqualities φ 0 x b c y d z) :
    threeFanEqualities φ 0 x c b z d y := by
  rcases h with ⟨h₁, h₂, h₃, h₄, h₅, h₆⟩
  exact ⟨h₁.trans h₂, h₂.symm, h₅, h₆, h₃, h₄⟩

private theorem threeFanEqualities_perm₃
    {φ : ThreeFanPos → ℝ²} {x b c y d z : ThreeFanPos}
    (h : threeFanEqualities φ 0 x b c y d z) :
    threeFanEqualities φ 0 y b d x c z := by
  rcases h with ⟨h₁, h₂, h₃, h₄, h₅, h₆⟩
  exact ⟨h₃, h₄, h₁, h₂, h₅.trans h₆, h₆.symm⟩

private theorem threeFanEqualities_perm₄
    {φ : ThreeFanPos → ℝ²} {x b c y d z : ThreeFanPos}
    (h : threeFanEqualities φ 0 x b c y d z) :
    threeFanEqualities φ 0 y d b z c x := by
  rcases h with ⟨h₁, h₂, h₃, h₄, h₅, h₆⟩
  exact ⟨h₃.trans h₄, h₄.symm, h₅.trans h₆, h₆.symm, h₁, h₂⟩

private theorem threeFanEqualities_perm₅
    {φ : ThreeFanPos → ℝ²} {x b c y d z : ThreeFanPos}
    (h : threeFanEqualities φ 0 x b c y d z) :
    threeFanEqualities φ 0 z c d x b y := by
  rcases h with ⟨h₁, h₂, h₃, h₄, h₅, h₆⟩
  exact ⟨h₅, h₆, h₁.trans h₂, h₂.symm, h₃.trans h₄, h₄.symm⟩

private theorem threeFanEqualities_perm₆
    {φ : ThreeFanPos → ℝ²} {x b c y d z : ThreeFanPos}
    (h : threeFanEqualities φ 0 x b c y d z) :
    threeFanEqualities φ 0 z d c y b x := by
  rcases h with ⟨h₁, h₂, h₃, h₄, h₅, h₆⟩
  exact ⟨h₅.trans h₆, h₆.symm, h₃.trans h₄, h₄.symm, h₁.trans h₂, h₂.symm⟩

/-- Every noncrossed three-fan order in the classifier orbit is impossible.

The disjunction contains both orientations and all six permutations of
`(X,Y,Z)`, with the paired support labels permuted simultaneously. -/
theorem false_of_threeFan_order_one_orbit
    {φ : ThreeFanPos → ℝ²}
    (hinj : Function.Injective φ)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    {x b c y d z : ThreeFanPos}
    (horbit : threeFanOrderOneOrbit x b c y d z)
    (hequalities : threeFanEqualities φ 0 x b c y d z) : False := by
  have h₂ := threeFanEqualities_perm₂ hequalities
  have h₃ := threeFanEqualities_perm₃ hequalities
  have h₄ := threeFanEqualities_perm₄ hequalities
  have h₅ := threeFanEqualities_perm₅ hequalities
  have h₆ := threeFanEqualities_perm₆ hequalities
  rcases horbit with h | h | h | h | h | h
  · rcases h with h | h
    · exact false_of_threeFan_order_one hinj hccw h hequalities
    · exact false_of_threeFan_reverse_order_one hinj hccw h hequalities
  · rcases h with h | h
    · exact false_of_threeFan_order_one hinj hccw h h₂
    · exact false_of_threeFan_reverse_order_one hinj hccw h h₂
  · rcases h with h | h
    · exact false_of_threeFan_order_one hinj hccw h h₃
    · exact false_of_threeFan_reverse_order_one hinj hccw h h₃
  · rcases h with h | h
    · exact false_of_threeFan_order_one hinj hccw h h₄
    · exact false_of_threeFan_reverse_order_one hinj hccw h h₄
  · rcases h with h | h
    · exact false_of_threeFan_order_one hinj hccw h h₅
    · exact false_of_threeFan_reverse_order_one hinj hccw h h₅
  · rcases h with h | h
    · exact false_of_threeFan_order_one hinj hccw h h₆
    · exact false_of_threeFan_reverse_order_one hinj hccw h h₆

end ColoredPaleyThreeFanOrderMetric
end Problem97

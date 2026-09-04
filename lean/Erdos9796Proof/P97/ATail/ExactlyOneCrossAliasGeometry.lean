/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ThreeFanOrderMetric
import Erdos9796Proof.P97.Census554.ExactlyOneCrossAliasScalar
import Erdos9796Proof.P97.U2.SimilarityNormalization

/-!
# Geometric wrapper for the exactly-one crossed three-fan alias

This module transports the canonical `X = D` branch of the finite
three-fan classifier to the scalar kernel in
`Census554.ExactlyOneCrossAliasScalar`.  The geometric wrapper is source-neutral:
it consumes the classifier's strict-order output, an injective CCW boundary
enumeration, and the six equal-distance relations for the three fan centers.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ColoredPaleyOneCrossAlias

open Problem97.ColoredPaleyThreeFanOrderMetric

abbrev oneCrossEqualities {φ : ThreeFanPos → ℝ²}
    (x b c y z : ThreeFanPos) : Prop :=
  dist (φ x) (φ 0) = dist (φ x) (φ b) ∧
    dist (φ x) (φ b) = dist (φ x) (φ c) ∧
    dist (φ y) (φ 0) = dist (φ y) (φ b) ∧
    dist (φ y) (φ b) = dist (φ y) (φ x) ∧
    dist (φ z) (φ 0) = dist (φ z) (φ c) ∧
    dist (φ z) (φ c) = dist (φ z) (φ x)

/-- The six equal-distance relations before choosing which of the three
alias pairs is identified. -/
abbrev oneCrossAliasEqualities {φ : ThreeFanPos → ℝ²}
    (x b c y d z : ThreeFanPos) : Prop :=
  dist (φ x) (φ 0) = dist (φ x) (φ b) ∧
    dist (φ x) (φ b) = dist (φ x) (φ c) ∧
    dist (φ y) (φ 0) = dist (φ y) (φ b) ∧
    dist (φ y) (φ b) = dist (φ y) (φ d) ∧
    dist (φ z) (φ 0) = dist (φ z) (φ c) ∧
    dist (φ z) (φ c) = dist (φ z) (φ d)

/-- The three possible sole aliases, each with both cyclic orientations.  The
order premise itself supplies distinctness of the five displayed positions,
so no additional nonalias hypotheses are hidden in this interface. -/
abbrev oneCrossAliasOrderOrbit (x b c y d z : ThreeFanPos) : Prop :=
  ((x = d ∧
      (threeFanOneCrossOrder₁ x b c y z ∨
        threeFanOneCrossOrder₂ x b c y z)) ∨
    (y = c ∧
      (threeFanOneCrossOrder₁ y b d x z ∨
        threeFanOneCrossOrder₂ y b d x z)) ∨
    (z = b ∧
      (threeFanOneCrossOrder₁ z c d x y ∨
        threeFanOneCrossOrder₂ z c d x y)))

private theorem oneCrossEqualities_of_xd
    {φ : ThreeFanPos → ℝ²} {x b c y d z : ThreeFanPos}
    (h : oneCrossAliasEqualities (φ := φ) x b c y d z)
    (hxd : x = d) : oneCrossEqualities (φ := φ) x b c y z := by
  rcases h with ⟨h₁, h₂, h₃, h₄, h₅, h₆⟩
  exact ⟨h₁, h₂, h₃, by simpa [hxd] using h₄, h₅, by simpa [hxd] using h₆⟩

private theorem oneCrossEqualities_of_yc
    {φ : ThreeFanPos → ℝ²} {x b c y d z : ThreeFanPos}
    (h : oneCrossAliasEqualities (φ := φ) x b c y d z)
    (hyc : y = c) :
    oneCrossEqualities (φ := φ) y b d x z := by
  rcases h with ⟨h₁, h₂, h₃, h₄, h₅, h₆⟩
  exact ⟨h₃, h₄, h₁, by simpa [hyc] using h₂, h₅.trans h₆,
    by simpa [hyc] using h₆.symm⟩

private theorem oneCrossEqualities_of_zb
    {φ : ThreeFanPos → ℝ²} {x b c y d z : ThreeFanPos}
    (h : oneCrossAliasEqualities (φ := φ) x b c y d z)
    (hzb : z = b) :
    oneCrossEqualities (φ := φ) z c d x y := by
  rcases h with ⟨h₁, h₂, h₃, h₄, h₅, h₆⟩
  exact ⟨h₅, h₆, h₁.trans h₂, by simpa [hzb] using h₂.symm,
    h₃.trans h₄, by simpa [hzb] using h₄.symm⟩

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
    have hbx : bx = ax :=
      sub_eq_zero.mp ((mul_eq_zero.mp hbx_scaled).resolve_left hr_ne)
    have hby : byc = ay :=
      sub_eq_zero.mp ((mul_eq_zero.mp hby_scaled).resolve_left hr_ne)
    exact (hcross_ne (by rw [hbx, hby]; ring)).elim
  · have hcross_opposite :
        bx * yy - byc * yx = -(ax * yy - ay * yx) := by
      linarith
    constructor
    · calc
        (yx ^ 2 + yy ^ 2) * bx =
            yx * (bx * yx + byc * yy) + yy * (bx * yy - byc * yx) := by
          ring
        _ = yx * (ax * yx + ay * yy) - yy * (ax * yy - ay * yx) := by
          rw [hdot, hcross_opposite]
          ring
        _ = 2 * (ax * yx + ay * yy) * yx -
            (yx ^ 2 + yy ^ 2) * ax := by ring
    · calc
        (yx ^ 2 + yy ^ 2) * byc =
            yy * (bx * yx + byc * yy) - yx * (bx * yy - byc * yx) := by
          ring
        _ = yy * (ax * yx + ay * yy) + yx * (ax * yy - ay * yx) := by
          rw [hdot, hcross_opposite]
          ring
        _ = 2 * (ax * yx + ay * yy) * yy -
            (yx ^ 2 + yy ^ 2) * ay := by ring

set_option maxHeartbeats 1000000 in
private theorem false_of_normalized_one_cross_alias
    {A B C Y : ℝ²}
    (hOA_OB : dist (pt 0 0) A = dist (pt 0 0) B)
    (hOB_OC : dist (pt 0 0) B = dist (pt 0 0) C)
    (hYA_YB : dist Y A = dist Y B)
    (hYB_YO : dist Y B = dist Y (pt 0 0))
    (hZA_ZC : dist (pt 1 0) A = dist (pt 1 0) C)
    (hZC_ZO : dist (pt 1 0) C = dist (pt 1 0) (pt 0 0))
    (hOCZ : signedArea2 (pt 0 0) C (pt 1 0) < 0)
    (hCZA : signedArea2 C (pt 1 0) A < 0)
    (hBOC : signedArea2 B (pt 0 0) C < 0)
    (hAYB : signedArea2 A Y B < 0)
    (hAOB : 0 < signedArea2 A (pt 0 0) B) :
    False := by
  let a := A 0
  let h := -A 1
  let u := Y 0
  let v := Y 1
  have hOA_OC : dist (pt 0 0) A = dist (pt 0 0) C :=
    hOA_OB.trans hOB_OC
  have hZCsq := congrArg (fun r : ℝ ↦ r ^ 2) hZA_ZC
  have hACsq := congrArg (fun r : ℝ ↦ r ^ 2) hOA_OC
  change dist (pt 1 0) A ^ 2 = dist (pt 1 0) C ^ 2 at hZCsq
  change dist (pt 0 0) A ^ 2 = dist (pt 0 0) C ^ 2 at hACsq
  rw [dist_sq_coord, dist_sq_coord] at hZCsq hACsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hZCsq hACsq
  have hCx : C 0 = a := by
    dsimp only [a, h] at hZCsq hACsq ⊢
    nlinarith only [hZCsq, hACsq]
  have hCy_pos : 0 < C 1 := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hOCZ
    linarith
  have hCy : C 1 = h := by
    have hA_Cy_ne : A 1 ≠ C 1 := by
      intro heq
      have hzero : signedArea2 C (pt 1 0) A = 0 := by
        simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one, hCx, heq]
        ring
      linarith only [hCZA, hzero]
    have hsquares : (A 1) ^ 2 = (C 1) ^ 2 := by
      rw [hCx] at hACsq
      nlinarith only [hACsq]
    have hfactor : (A 1 - C 1) * (A 1 + C 1) = 0 := by
      nlinarith only [hsquares]
    rcases mul_eq_zero.mp hfactor with hsame | hopposite
    · exact (hA_Cy_ne (by linarith)).elim
    · dsimp only [h]
      linarith
  have hh_pos : 0 < h := by
    dsimp only [h]
    linarith [hCy_pos, hCy]
  have hZA_ZO : dist (pt 1 0) A = dist (pt 1 0) (pt 0 0) :=
    hZA_ZC.trans hZC_ZO
  have hbase : h ^ 2 = a * (2 - a) := by
    have hbase_sq := congrArg (fun r : ℝ ↦ r ^ 2) hZA_ZO
    change dist (pt 1 0) A ^ 2 = dist (pt 1 0) (pt 0 0) ^ 2 at hbase_sq
    rw [dist_sq_coord, dist_sq_coord] at hbase_sq
    simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hbase_sq
    dsimp only [a, h] at hbase_sq ⊢
    nlinarith only [hbase_sq]
  have ha_pos : 0 < a := by
    nlinarith [hbase, sq_pos_of_pos hh_pos]
  have ha_lt_one : a < 1 := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hCZA
    rw [hCx, hCy] at hCZA
    dsimp only [a, h] at hCZA ⊢
    nlinarith only [hCZA, hh_pos]
  have hYA_YO : dist Y A = dist Y (pt 0 0) :=
    hYA_YB.trans hYB_YO
  have hYAsq := congrArg (fun r : ℝ ↦ r ^ 2) hYA_YO
  change dist Y A ^ 2 = dist Y (pt 0 0) ^ 2 at hYAsq
  rw [dist_sq_coord, dist_sq_coord] at hYAsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hYAsq
  have hY_eq : a * u - h * v = a := by
    dsimp only [a, h, u, v] at hYAsq hbase ⊢
    nlinarith only [hYAsq, hbase]
  have hOBsq := congrArg (fun r : ℝ ↦ r ^ 2) hOA_OB
  change dist (pt 0 0) A ^ 2 = dist (pt 0 0) B ^ 2 at hOBsq
  rw [dist_sq_coord, dist_sq_coord] at hOBsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hOBsq
  have hBnorm : B 0 ^ 2 + B 1 ^ 2 = a ^ 2 + (-h) ^ 2 := by
    dsimp only [a, h] at hOBsq ⊢
    nlinarith only [hOBsq]
  have hYBsquared := congrArg (fun r : ℝ ↦ r ^ 2) hYA_YB
  change dist Y A ^ 2 = dist Y B ^ 2 at hYBsquared
  rw [dist_sq_coord, dist_sq_coord] at hYBsquared
  have hBdot : B 0 * u + B 1 * v = a * u + (-h) * v := by
    dsimp only [a, h, u, v] at hOBsq hYBsquared ⊢
    nlinarith only [hOBsq, hYBsquared]
  have hAOB' : 0 < -(a * B 1 + h * B 0) := by
    simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hAOB
    dsimp only [a, h] at hAOB ⊢
    nlinarith only [hAOB]
  have hBcross_ne : a * B 1 - (-h) * B 0 ≠ 0 := by
    intro hzero
    have : a * B 1 + h * B 0 = 0 := by nlinarith only [hzero]
    linarith only [hAOB', this]
  have hY_ne : Y ≠ (pt 0 0) := by
    intro hzero
    have hneg : signedArea2 A (pt 0 0) B < 0 := by simpa [hzero] using hAYB
    exact (not_lt_of_ge (le_of_lt hAOB)) hneg
  have hBr_pos : 0 < u ^ 2 + v ^ 2 := by
    have hcoord : Y 0 ≠ 0 ∨ Y 1 ≠ 0 := by
      by_contra h
      push_neg at h
      apply hY_ne
      ext i
      fin_cases i
      · simpa [pt] using h.1
      · simpa [pt] using h.2
    rcases hcoord with h0 | h1
    · have : 0 < u ^ 2 := by
        dsimp only [u]
        exact sq_pos_of_ne_zero h0
      nlinarith [sq_nonneg v]
    · have : 0 < v ^ 2 := by
        dsimp only [v]
        exact sq_pos_of_ne_zero h1
      nlinarith [sq_nonneg u]
  have hBcoords :=
    reflection_coordinates_at_origin hBr_pos hBnorm hBdot hBcross_ne
  have hAOB_identity :
      (u ^ 2 + v ^ 2) * (-(a * B 1 + h * B 0)) =
        -2 * (a * u - h * v) * (a * v + h * u) := by
    calc
      (u ^ 2 + v ^ 2) * (-(a * B 1 + h * B 0)) =
          -a * ((u ^ 2 + v ^ 2) * B 1) -
            h * ((u ^ 2 + v ^ 2) * B 0) := by ring
      _ = -a *
            (2 * (a * u + (-h) * v) * v -
              (u ^ 2 + v ^ 2) * (-h)) -
          h *
            (2 * (a * u + (-h) * v) * u -
              (u ^ 2 + v ^ 2) * a) := by
        rw [hBcoords.1, hBcoords.2]
      _ = -2 * (a * u - h * v) * (a * v + h * u) := by ring
  have htransverse_neg : a * v + h * u < 0 := by
    have hleft : 0 <
        (u ^ 2 + v ^ 2) * (-(a * B 1 + h * B 0)) :=
      mul_pos hBr_pos hAOB'
    rw [hAOB_identity, hY_eq] at hleft
    nlinarith [hleft, ha_pos]
  have hrel : h * v = a * u - a := by
    linarith
  have htransverse_identity :
      h * (a * v + h * u) = a * (2 * u - a) := by
    calc
      h * (a * v + h * u) = a * (h * v) + h ^ 2 * u := by ring
      _ = a * (a * u - a) + (a * (2 - a)) * u := by rw [hrel, hbase]
      _ = a * (2 * u - a) := by ring
  have hy_before_mid : 2 * u < a := by
    have hprod : a * (2 * u - a) < 0 := by
      rw [← htransverse_identity]
      exact mul_neg_of_pos_of_neg hh_pos htransverse_neg
    rcases (mul_neg_iff.mp hprod) with hpos | hneg
    · linarith [hpos.2]
    · exact (not_lt_of_ge (le_of_lt ha_pos) hneg.1).elim
  have hBOC_identity :
      h * (u ^ 2 + v ^ 2) * signedArea2 B (pt 0 0) C =
        4 * a ^ 2 * u * (u - 1) := by
    have hBOC_coord :
        signedArea2 B (pt 0 0) C = a * B 1 - h * B 0 := by
      simp only [signedArea2, pt, Matrix.cons_val_zero, Matrix.cons_val_one]
      rw [hCx, hCy]
      dsimp only [a, h]
      ring
    calc
      h * (u ^ 2 + v ^ 2) * signedArea2 B (pt 0 0) C =
          h * (a * ((u ^ 2 + v ^ 2) * B 1) -
            h * ((u ^ 2 + v ^ 2) * B 0)) := by rw [hBOC_coord]; ring
      _ = h * (a *
            (2 * (a * u + (-h) * v) * v -
              (u ^ 2 + v ^ 2) * (-h)) -
            h * (2 * (a * u + (-h) * v) * u -
              (u ^ 2 + v ^ 2) * a)) := by
        rw [hBcoords.1, hBcoords.2]
      _ = 4 * a ^ 2 * u * (u - 1) := by
        have hdot : a * u + (-h) * v = a := by
          nlinarith only [hY_eq]
        rw [hdot]
        have hkey : h * (a * v + h * (u - 1)) = 2 * a * (u - 1) := by
          calc
            h * (a * v + h * (u - 1)) = a * (h * v) + h ^ 2 * (u - 1) := by
              ring
            _ = a * (a * u - a) + (a * (2 - a)) * (u - 1) := by
              rw [hrel, hbase]
            _ = 2 * a * (u - 1) := by ring
        have hvq : a * v + h * v ^ 2 = a * u * v := by
          calc
            a * v + h * v ^ 2 = v * (a + h * v) := by ring
            _ = a * u * v := by rw [hrel]; ring
        have hinside :
            h * (a * v - h * u + h * (u ^ 2 + v ^ 2)) =
              2 * a * u * (u - 1) := by
          calc
            h * (a * v - h * u + h * (u ^ 2 + v ^ 2)) =
                h * (a * v + h * v ^ 2 + h * u * (u - 1)) := by ring
            _ = h * (a * u * v + h * u * (u - 1)) := by rw [hvq]
            _ = u * (h * (a * v + h * (u - 1))) := by ring
            _ = u * (2 * a * (u - 1)) := by rw [hkey]
            _ = 2 * a * u * (u - 1) := by ring
        calc
          h * (a * (2 * a * v - (u ^ 2 + v ^ 2) * (-h)) -
              h * (2 * a * u - (u ^ 2 + v ^ 2) * a)) =
              2 * a * (h * (a * v - h * u + h * (u ^ 2 + v ^ 2))) := by
                ring
          _ = 4 * a ^ 2 * u * (u - 1) := by rw [hinside]; ring
  have hy_pos : 0 < u := by
    have hleft : h * (u ^ 2 + v ^ 2) * signedArea2 B (pt 0 0) C < 0 := by
      exact mul_neg_of_pos_of_neg (mul_pos hh_pos hBr_pos) hBOC
    rw [hBOC_identity] at hleft
    by_contra hnot
    have hnonpos : u ≤ 0 := le_of_not_gt hnot
    have hminus : u - 1 ≤ 0 := by linarith
    have hnonneg : 0 ≤ u * (u - 1) :=
      mul_nonneg_of_nonpos_of_nonpos hnonpos hminus
    have hcoef : 0 ≤ 4 * a ^ 2 := by positivity
    have hnonneg' : 0 ≤ 4 * a ^ 2 * u * (u - 1) := by
      simpa [mul_assoc] using mul_nonneg hcoef hnonneg
    exact (not_lt_of_ge hnonneg') hleft
  have hu_lt_one : u < 1 := by
    have hleft : h * (u ^ 2 + v ^ 2) * signedArea2 B (pt 0 0) C < 0 := by
      exact mul_neg_of_pos_of_neg (mul_pos hh_pos hBr_pos) hBOC
    rw [hBOC_identity] at hleft
    by_contra hnot
    have hminus : 0 ≤ u - 1 := by linarith
    have hnonneg : 0 ≤ u * (u - 1) :=
      mul_nonneg (le_of_lt hy_pos) hminus
    have hcoef : 0 ≤ 4 * a ^ 2 := by positivity
    have hnonneg' : 0 ≤ 4 * a ^ 2 * u * (u - 1) := by
      simpa [mul_assoc] using mul_nonneg hcoef hnonneg
    exact (not_lt_of_ge hnonneg') hleft
  have hAYB_identity :
      (u ^ 2 + v ^ 2) * signedArea2 A Y B =
        2 * (a * v + h * u) * (u ^ 2 + v ^ 2 - a) := by
    simp only [signedArea2] at hAYB ⊢
    change (u ^ 2 + v ^ 2) *
        ((u - a) * (B 1 + h) - (B 0 - a) * (v + h)) =
      2 * (a * v + h * u) * (u ^ 2 + v ^ 2 - a)
    have hdot : a * u + (-h) * v = a := by
      nlinarith only [hY_eq]
    calc
      (u ^ 2 + v ^ 2) *
          ((u - a) * (B 1 + h) - (B 0 - a) * (v + h)) =
          (u - a) * ((u ^ 2 + v ^ 2) * B 1) -
            (v + h) * ((u ^ 2 + v ^ 2) * B 0) +
            (u ^ 2 + v ^ 2) * (a * v + h * u) := by ring
      _ = (u - a) *
            (2 * (a * u + (-h) * v) * v - (u ^ 2 + v ^ 2) * (-h)) -
            (v + h) *
            (2 * (a * u + (-h) * v) * u - (u ^ 2 + v ^ 2) * a) +
            (u ^ 2 + v ^ 2) * (a * v + h * u) := by
          rw [hBcoords.1, hBcoords.2]
      _ = 2 * (a * v + h * u) * (u ^ 2 + v ^ 2 - a) := by
          rw [hdot]
          ring
  have hAYB_pos : 0 < u ^ 2 + v ^ 2 - a := by
    have hleft :
        (u ^ 2 + v ^ 2) * signedArea2 A Y B < 0 :=
      mul_neg_of_pos_of_neg hBr_pos hAYB
    rw [hAYB_identity] at hleft
    have hfactor_neg : 0 > 2 * (a * v + h * u) := by
      exact mul_neg_of_pos_of_neg (by norm_num) htransverse_neg
    rcases (mul_neg_iff.mp hleft) with hbad | hgood
    · exact False.elim ((not_lt_of_ge (le_of_lt hfactor_neg)) hbad.1)
    · exact hgood.2
  exact Census554.EqualityCore.false_of_threeFan_one_cross_alias_order_scalar
    hbase hh_pos ha_lt_one hy_pos hu_lt_one hy_before_mid hY_eq hAYB_pos

private theorem false_of_one_cross_alias_order₁_oriented
    {A B C Y O I : ℝ²}
    (hOI_ne : O ≠ I)
    (hOA_OB : dist O A = dist O B)
    (hOB_OC : dist O B = dist O C)
    (hYA_YB : dist Y A = dist Y B)
    (hYB_YO : dist Y B = dist Y O)
    (hIA_IC : dist I A = dist I C)
    (hIC_IO : dist I C = dist I O)
    (hOCI : signedArea2 O C I < 0)
    (hCIA : signedArea2 C I A < 0)
    (hBOC : signedArea2 B O C < 0)
    (hAYB : signedArea2 A Y B < 0)
    (hAOB : 0 < signedArea2 A O B) : False := by
  let T : ℝ² → ℝ² := normSim O I
  have hdist (P Q : ℝ²) :
      dist (T P) (T Q) = (dist O I)⁻¹ * dist P Q := by
    simpa [T] using normSim_dist_image O I hOI_ne P Q
  have hT_O : T O = pt 0 0 := by
    simpa [T] using normSim_fst O I
  have hT_I : T I = pt 1 0 := by
    simpa [T] using normSim_snd O I hOI_ne
  have hbase_sq_pos : 0 < (I 0 - O 0) ^ 2 + (I 1 - O 1) ^ 2 := by
    rw [← dist_sq_coord I O]
    exact sq_pos_of_pos (dist_pos.mpr hOI_ne.symm)
  have map_dist_eq {P Q R S : ℝ²} (heq : dist P Q = dist R S) :
      dist (T P) (T Q) = dist (T R) (T S) := by
    rw [hdist, hdist, heq]
  have map_area_neg {P Q R : ℝ²} (hneg : signedArea2 P Q R < 0) :
      signedArea2 (T P) (T Q) (T R) < 0 := by
    dsimp only [T]
    rw [signedArea2_normSim O I hOI_ne]
    exact mul_neg_of_pos_of_neg (inv_pos.mpr hbase_sq_pos) hneg
  have map_area_pos {P Q R : ℝ²} (hpos : 0 < signedArea2 P Q R) :
      0 < signedArea2 (T P) (T Q) (T R) := by
    dsimp only [T]
    rw [signedArea2_normSim O I hOI_ne]
    exact mul_pos (inv_pos.mpr hbase_sq_pos) hpos
  apply false_of_normalized_one_cross_alias
    (A := T A) (B := T B) (C := T C) (Y := T Y)
  · simpa only [hT_O] using map_dist_eq hOA_OB
  · simpa only [hT_O] using map_dist_eq hOB_OC
  · exact map_dist_eq hYA_YB
  · simpa only [hT_O] using map_dist_eq hYB_YO
  · simpa only [hT_I] using map_dist_eq hIA_IC
  · simpa only [hT_I, hT_O] using map_dist_eq hIC_IO
  · simpa only [hT_O, hT_I] using map_area_neg hOCI
  · simpa only [hT_I] using map_area_neg hCIA
  · simpa only [hT_O] using map_area_neg hBOC
  · exact map_area_neg hAYB
  · simpa only [hT_O] using map_area_pos hAOB

/-- The canonical `A,Y,B,X,C,Z` order is impossible for the crossed alias
`X = D`, under an injective CCW boundary enumeration. -/
theorem false_of_threeFan_one_cross_alias_order₁
    {φ : ThreeFanPos → ℝ²}
    (hinj : Function.Injective φ)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    {x b c y z : ThreeFanPos}
    (horder : threeFanOneCrossOrder₁ x b c y z)
    (hequalities : oneCrossEqualities (φ := φ) x b c y z) : False := by
  rcases horder with ⟨h0y, hyb, hbx, hxc, hcz⟩
  rcases hequalities with ⟨hOA_OB, hOB_OC, hYA_YB, hYB_YO, hIA_IC, hIC_IO⟩
  have h0b : (0 : ThreeFanPos) < b := h0y.trans hyb
  have h0x : (0 : ThreeFanPos) < x := h0b.trans hbx
  have h0c : (0 : ThreeFanPos) < c := h0x.trans hxc
  have hxz : x < z := hxc.trans hcz
  have hCIA0 : signedArea2 (φ c) (φ z) (φ 0) < 0 := by
    have hneg := hneg_of_ccw hinj hccw h0c hcz
    have hcyclic : signedArea2 (φ c) (φ z) (φ 0) =
        signedArea2 (φ 0) (φ c) (φ z) := by
      simp only [signedArea2]
      ring
    rw [hcyclic]
    exact hneg
  have hAOB0 : 0 < signedArea2 (φ 0) (φ x) (φ b) := by
    have hneg := hneg_of_ccw hinj hccw h0b hbx
    have hswap : signedArea2 (φ 0) (φ x) (φ b) =
        -signedArea2 (φ 0) (φ b) (φ x) := by
      simp only [signedArea2]
      ring
    rw [hswap]
    linarith
  apply false_of_one_cross_alias_order₁_oriented
    (A := φ 0) (B := φ b) (C := φ c) (Y := φ y)
    (O := φ x) (I := φ z)
  · intro heq
    exact (ne_of_lt hxz) (hinj heq)
  · exact hOA_OB
  · exact hOB_OC
  · exact hYA_YB
  · exact hYB_YO
  · exact hIA_IC
  · exact hIC_IO
  · exact hneg_of_ccw hinj hccw hxc hcz
  · exact hCIA0
  · exact hneg_of_ccw hinj hccw hbx hxc
  · exact hneg_of_ccw hinj hccw h0y hyb
  · exact hAOB0

private theorem signedArea2_pos_of_ccw_swap_last
    {n : ℕ} {φ : Fin n → ℝ²}
    (hinj : Function.Injective φ)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    {i j k : Fin n} (hij : i < j) (hjk : j < k) :
    0 < signedArea2 (φ i) (φ k) (φ j) := by
  have hneg := hneg_of_ccw hinj hccw hij hjk
  have hswap : signedArea2 (φ i) (φ k) (φ j) =
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
  have hreverse : signedArea2 (φ i) (φ j) (φ k) =
      -signedArea2 (φ k) (φ j) (φ i) := by
    simp only [signedArea2]
    ring
  rw [hreverse]
  linarith

/-- The reversed crossed order `A,Z,C,X,B,Y` is impossible for the crossed
alias `X = D`, by reflecting the boundary across the normalization axis. -/
theorem false_of_threeFan_one_cross_alias_order₂
    {φ : ThreeFanPos → ℝ²}
    (hinj : Function.Injective φ)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    {x b c y z : ThreeFanPos}
    (horder : threeFanOneCrossOrder₂ x b c y z)
    (hequalities : oneCrossEqualities (φ := φ) x b c y z) : False := by
  rcases horder with ⟨h0z, hzc, hcx, hxb, hby⟩
  rcases hequalities with ⟨hOA_OB, hOB_OC, hYA_YB, hYB_YO, hIA_IC, hIC_IO⟩
  have h0x : (0 : ThreeFanPos) < x := h0z.trans (hzc.trans hcx)
  have h0b : (0 : ThreeFanPos) < b := h0z.trans (hzc.trans (hcx.trans hxb))
  have hzx : z < x := hzc.trans hcx
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
  have reflect_area_pos {P Q S : ℝ²} (hneg : signedArea2 P Q S < 0) :
      0 < signedArea2 (R P) (R Q) (R S) := by
    dsimp only [R]
    rw [Census554.EqualityCore.signedArea2_reflectXAxis]
    linarith
  have hR_XZ_ne : R (φ x) ≠ R (φ z) := by
    intro heq
    exact (ne_of_gt hzx) (hinj
      (Census554.EqualityCore.reflectXAxis_injective heq))
  have hCIA_pos : 0 < signedArea2 (φ c) (φ z) (φ 0) := by
    have hpos := signedArea2_pos_of_ccw_swap_last hinj hccw h0z hzc
    have hcyclic : signedArea2 (φ c) (φ z) (φ 0) =
        signedArea2 (φ 0) (φ c) (φ z) := by
      simp only [signedArea2]
      ring
    rw [hcyclic]
    exact hpos
  have hAOB_neg : signedArea2 (φ 0) (φ x) (φ b) < 0 :=
    hneg_of_ccw hinj hccw h0x hxb
  apply false_of_one_cross_alias_order₁_oriented
    (A := R (φ 0)) (B := R (φ b)) (C := R (φ c)) (Y := R (φ y))
    (O := R (φ x)) (I := R (φ z))
  · exact hR_XZ_ne
  · exact map_dist_eq hOA_OB
  · exact map_dist_eq hOB_OC
  · exact map_dist_eq hYA_YB
  · exact map_dist_eq hYB_YO
  · exact map_dist_eq hIA_IC
  · exact map_dist_eq hIC_IO
  · exact reflect_area_neg
      (signedArea2_pos_of_ccw_descending hinj hccw hzc hcx)
  · exact reflect_area_neg hCIA_pos
  · exact reflect_area_neg
      (signedArea2_pos_of_ccw_descending hinj hccw hcx hxb)
  · exact reflect_area_neg
      (signedArea2_pos_of_ccw_swap_last hinj hccw h0b hby)
  · exact reflect_area_pos hAOB_neg

/-- All three sole-alias choices are covered, together with their two order
orientations.  The three transformed packets are the `S3` relabelings of the
same six equalities. -/
theorem false_of_threeFan_one_cross_alias_order_orbit
    {φ : ThreeFanPos → ℝ²}
    (hinj : Function.Injective φ)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    {x b c y d z : ThreeFanPos}
    (horbit : oneCrossAliasOrderOrbit x b c y d z)
    (hequalities : oneCrossAliasEqualities (φ := φ) x b c y d z) : False := by
  rcases horbit with hxd | hyc | hzb
  · rcases hxd with ⟨hxd, horder⟩
    rcases horder with horder | horder
    · exact false_of_threeFan_one_cross_alias_order₁ hinj hccw horder
        (oneCrossEqualities_of_xd hequalities hxd)
    · exact false_of_threeFan_one_cross_alias_order₂ hinj hccw horder
        (oneCrossEqualities_of_xd hequalities hxd)
  · rcases hyc with ⟨hyc, horder⟩
    rcases horder with horder | horder
    · exact false_of_threeFan_one_cross_alias_order₁ hinj hccw horder
        (oneCrossEqualities_of_yc hequalities hyc)
    · exact false_of_threeFan_one_cross_alias_order₂ hinj hccw horder
        (oneCrossEqualities_of_yc hequalities hyc)
  · rcases hzb with ⟨hzb, horder⟩
    rcases horder with horder | horder
    · exact false_of_threeFan_one_cross_alias_order₁ hinj hccw horder
        (oneCrossEqualities_of_zb hequalities hzb)
    · exact false_of_threeFan_one_cross_alias_order₂ hinj hccw horder
        (oneCrossEqualities_of_zb hequalities hzb)

end ColoredPaleyOneCrossAlias
end Problem97

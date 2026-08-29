/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ExactA2CapMetric
import Erdos9796Proof.P97.CGN.CGN4g
import Erdos9796Proof.P97.ConvexCyclicOrder.Basic

/-!
# The global circle-wedge terminal for the Rigid221 A3 branch

This module isolates the source-independent algebra and convex-boundary order
used by the A3 terminal.  The source adapter remains in
`FrontierLiveClosure.Rigid221SourceHeavy`.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97
namespace A3GlobalCircleWedge

private def det2 (a b : ℝ²) : ℝ :=
  a 0 * b 1 - a 1 * b 0

private theorem signedArea2_eq_det2_sub (a b c : ℝ²) :
    signedArea2 a b c = det2 (b - a) (c - a) := by
  unfold signedArea2 det2
  simp only [PiLp.sub_apply]
  ring

private theorem det2_cdx_of_fan
    {V X D C : ℝ²} {td T : ℝ}
    (hD : D = td • (V + X))
    (hC : C = T • (V + D)) :
    det2 (D - C) (X - C) = (td - T) * det2 V X := by
  rw [hC, hD]
  simp only [det2, PiLp.sub_apply, PiLp.add_apply, PiLp.smul_apply,
    smul_eq_mul]
  ring

/-- The two polynomial margins in the A3 circle-wedge calculation are
positive throughout the admissible scalar range. -/
theorem scalar_two_clearance_margins
    {r p T : ℝ}
    (hr : 0 < r) (hp : 0 < p) (hpr : p < r)
    (hrp : r ^ 2 < 2 * p ^ 2)
    (hT : (1 / 2 : ℝ) < T) (hTp : 2 * T * p < r) :
    0 <
        T ^ 2 * (2 * p + r) ^ 2 * (r ^ 2 - p ^ 2) -
          r ^ 3 * (r + 2 * (T ^ 2 - T) * (r + p)) ∧
      0 <
        T ^ 2 * (4 * p ^ 2 + 2 * r * p - r ^ 2) ^ 2 *
            (r ^ 2 - p ^ 2) -
          r ^ 5 * (r + 2 * (T ^ 2 - T) * (r + p)) := by
  have hz : 0 < 2 * p ^ 2 - r ^ 2 := by linarith
  have hrp' : 0 < r - p := sub_pos.mpr hpr
  have htwoT : 0 < 2 * T - 1 := by linarith
  have hlast : 0 < r - 2 * T * p := sub_pos.mpr hTp
  have hFx :
      0 < 4 * p ^ 3 + 8 * r * p ^ 2 + 5 * r ^ 2 * p - r ^ 3 := by
    rw [show
      4 * p ^ 3 + 8 * r * p ^ 2 + 5 * r ^ 2 * p - r ^ 3 =
        2 * p * (2 * p ^ 2 - r ^ 2) +
          4 * r * (2 * p ^ 2 - r ^ 2) +
          7 * r ^ 2 * p + 3 * r ^ 3 by ring]
    positivity
  have hFu :
      0 < 16 * p ^ 5 + 32 * r * p ^ 4 + 12 * r ^ 2 * p ^ 3 -
          8 * r ^ 3 * p ^ 2 - 3 * r ^ 4 * p - r ^ 5 := by
    rw [show
      16 * p ^ 5 + 32 * r * p ^ 4 + 12 * r ^ 2 * p ^ 3 -
            8 * r ^ 3 * p ^ 2 - 3 * r ^ 4 * p - r ^ 5 =
        (4 * p + 8 * r) * (2 * p ^ 2 - r ^ 2) ^ 2 +
          (14 * r ^ 2 * p + 12 * r ^ 3) * (2 * p ^ 2 - r ^ 2) +
          7 * r ^ 4 * p + 3 * r ^ 5 by ring]
    positivity
  constructor
  · rw [show
      T ^ 2 * (2 * p + r) ^ 2 * (r ^ 2 - p ^ 2) -
            r ^ 3 * (r + 2 * (T ^ 2 - T) * (r + p)) =
        T ^ 2 * (r - p) *
            (4 * p ^ 3 + 8 * r * p ^ 2 + 5 * r ^ 2 * p - r ^ 3) +
          r ^ 3 * (2 * T - 1) * (r - 2 * T * p) by ring]
    positivity
  · rw [show
      T ^ 2 * (4 * p ^ 2 + 2 * r * p - r ^ 2) ^ 2 *
              (r ^ 2 - p ^ 2) -
            r ^ 5 * (r + 2 * (T ^ 2 - T) * (r + p)) =
        T ^ 2 * (r - p) *
            (16 * p ^ 5 + 32 * r * p ^ 4 + 12 * r ^ 2 * p ^ 3 -
              8 * r ^ 3 * p ^ 2 - 3 * r ^ 4 * p - r ^ 5) +
          r ^ 5 * (2 * T - 1) * (r - 2 * T * p) by ring]
    positivity

set_option maxHeartbeats 800000 in
-- The nested fan normalization contains several coordinated polynomial steps.
/-- The coordinate-free nested-fan calculation: the circle centered at `C`
through `V` has strict clearance from both outer wedge lines. -/
theorem vector_two_clearances_of_nested_fan
    {U X V D C : ℝ²} {radius tv td T : ℝ}
    (hradius : 0 < radius)
    (hU : ‖U‖ = radius) (hX : ‖X‖ = radius)
    (hV : ‖V‖ = radius) (hD : ‖D‖ = radius)
    (htv : 0 < tv) (htd : 0 < td) (hT : (1 / 2 : ℝ) < T)
    (hVrep : V = tv • (U + X))
    (hDrep : D = td • (V + X))
    (hCrep : C = T • (V + D))
    (hVD : V ≠ D)
    (horient : 0 < det2 (D - C) (X - C) * det2 V X) :
    radius ^ 2 * ‖C - V‖ ^ 2 < det2 X C ^ 2 ∧
      radius ^ 2 * ‖C - V‖ ^ 2 < det2 U C ^ 2 := by
  let r : ℝ := radius ^ 2
  let p : ℝ := ⟪V, D⟫_ℝ
  let q : ℝ := ⟪V, X⟫_ℝ
  have hr : 0 < r := by
    dsimp [r]
    positivity
  have hUU : ⟪U, U⟫_ℝ = r := by
    rw [real_inner_self_eq_norm_sq, hU]
  have hXX : ⟪X, X⟫_ℝ = r := by
    rw [real_inner_self_eq_norm_sq, hX]
  have hVV : ⟪V, V⟫_ℝ = r := by
    rw [real_inner_self_eq_norm_sq, hV]
  have hDD : ⟪D, D⟫_ℝ = r := by
    rw [real_inner_self_eq_norm_sq, hD]
  have hp : 0 < p := by
    dsimp [p]
    exact ExactA2CapMetric.inner_pos_of_positive_equal_norm_sum_direction
      hradius hV hX hD htd hDrep
  have hq : 0 < q := by
    dsimp [q]
    have hpos :=
      ExactA2CapMetric.inner_pos_of_positive_equal_norm_sum_direction
        hradius hX hU hV htv (by simpa only [add_comm] using hVrep)
    simpa only [real_inner_comm] using hpos
  have hpEq : p = td * (r + q) := by
    dsimp [p, q]
    rw [hDrep, real_inner_smul_right, inner_add_right, hVV]
  have hDX : ⟪D, X⟫_ℝ = p := by
    calc
      ⟪D, X⟫_ℝ = td * (⟪V, X⟫_ℝ + ⟪X, X⟫_ℝ) := by
        rw [hDrep, real_inner_smul_left, inner_add_left]
      _ = td * (q + r) := by rw [hXX]
      _ = td * (r + q) := by ring
      _ = p := hpEq.symm
  have hDV : ⟪D, V⟫_ℝ = p := by
    dsimp [p]
    exact real_inner_comm V D
  have htwoTdP : 2 * td * p = r := by
    calc
      2 * td * p = td * (⟪D, V⟫_ℝ + ⟪D, X⟫_ℝ) := by
        rw [hDV, hDX]
        ring
      _ = ⟪D, td • (V + X)⟫_ℝ := by
        rw [real_inner_smul_right, inner_add_right]
      _ = ⟪D, D⟫_ℝ := by rw [← hDrep]
      _ = r := hDD
  have hVU : ⟪V, U⟫_ℝ = q := by
    calc
      ⟪V, U⟫_ℝ = tv * (⟪U, U⟫_ℝ + ⟪X, U⟫_ℝ) := by
        rw [hVrep, real_inner_smul_left, inner_add_left]
      _ = tv * (r + ⟪U, X⟫_ℝ) := by
        rw [hUU, real_inner_comm X U]
      _ = tv * (⟪U, X⟫_ℝ + r) := by ring
      _ = ⟪V, X⟫_ℝ := by
        rw [hVrep, real_inner_smul_left, inner_add_left, hXX]
      _ = q := rfl
  have htwoTvQ : 2 * tv * q = r := by
    calc
      2 * tv * q = tv * (⟪V, U⟫_ℝ + ⟪V, X⟫_ℝ) := by
        rw [hVU]
        dsimp [q]
        ring
      _ = ⟪V, tv • (U + X)⟫_ℝ := by
        rw [real_inner_smul_right, inner_add_right]
      _ = ⟪V, V⟫_ℝ := by rw [← hVrep]
      _ = r := hVV
  have hpRelation : 2 * p ^ 2 = r * (r + q) := by
    have hmul := congrArg (fun z : ℝ => 2 * p * z) hpEq
    calc
      2 * p ^ 2 = 2 * p * p := by ring
      _ = 2 * p * (td * (r + q)) := hmul
      _ = (2 * td * p) * (r + q) := by ring
      _ = r * (r + q) := by rw [htwoTdP]
  have hrp : r ^ 2 < 2 * p ^ 2 := by
    have hrq : 0 < r * q := mul_pos hr hq
    nlinarith [hpRelation]
  have hpLtR : p < r := by
    have hsub : V - D ≠ 0 := sub_ne_zero.mpr hVD
    have hnorm : 0 < ‖V - D‖ ^ 2 := by
      exact sq_pos_of_pos (norm_pos_iff.mpr hsub)
    have hnormEq : ‖V - D‖ ^ 2 = 2 * r - 2 * p := by
      rw [norm_sub_sq_real, hV, hD]
      dsimp [r, p]
      ring
    linarith
  have hCDX := det2_cdx_of_fan hDrep hCrep
  rw [hCDX] at horient
  have hTLtTd : T < td := by
    nlinarith [sq_nonneg (det2 V X)]
  have hTp : 2 * T * p < r := by
    have hmargin : 0 < (td - T) * p := mul_pos (sub_pos.mpr hTLtTd) hp
    nlinarith [htwoTdP]
  have hXscaled : r • X = (2 * p) • D - r • V := by
    have hDscaled : (2 * p) • D = r • (V + X) := by
      calc
        (2 * p) • D = ((2 * p) * td) • (V + X) := by
          rw [hDrep, smul_smul]
        _ = r • (V + X) := by
          rw [show (2 * p) * td = r by nlinarith [htwoTdP]]
    rw [hDscaled, smul_add]
    abel
  have hUscaledBase : r • U = (2 * q) • V - r • X := by
    have hVscaled : (2 * q) • V = r • (U + X) := by
      calc
        (2 * q) • V = ((2 * q) * tv) • (U + X) := by
          rw [hVrep, smul_smul]
        _ = r • (U + X) := by
          rw [show (2 * q) * tv = r by nlinarith [htwoTvQ]]
    rw [hVscaled, smul_add]
    abel
  have hcoef : 2 * r * q + r ^ 2 = 4 * p ^ 2 - r ^ 2 := by
    nlinarith [hpRelation]
  have hUscaled :
      r ^ 2 • U = (4 * p ^ 2 - r ^ 2) • V - (2 * r * p) • D := by
    calc
      r ^ 2 • U = r • (r • U) := by
        rw [smul_smul]
        congr 1
        ring
      _ = r • ((2 * q) • V - r • X) := by rw [hUscaledBase]
      _ = r • ((2 * q) • V) - r • (r • X) := by rw [smul_sub]
      _ = r • ((2 * q) • V) -
          r • ((2 * p) • D - r • V) := by rw [hXscaled]
      _ = (2 * r * q + r ^ 2) • V - (2 * r * p) • D := by
        module
      _ = (4 * p ^ 2 - r ^ 2) • V - (2 * r * p) • D := by
        rw [hcoef]
  have hCVinner : ⟪C, V⟫_ℝ = T * (r + p) := by
    rw [hCrep, real_inner_smul_left, inner_add_left, hVV, hDV]
  have hCC : ‖C‖ ^ 2 = T ^ 2 * (2 * r + 2 * p) := by
    rw [← real_inner_self_eq_norm_sq, hCrep,
      real_inner_smul_left, real_inner_smul_right,
      inner_add_left, inner_add_right, inner_add_right,
      hDV, hVV, hDD]
    dsimp [p]
    ring
  have hCV :
      ‖C - V‖ ^ 2 = r + 2 * (T ^ 2 - T) * (r + p) := by
    rw [norm_sub_sq_real, hCC, hV]
    rw [hCVinner]
    dsimp [r]
    ring
  have hlagrange : det2 V D ^ 2 = r ^ 2 - p ^ 2 := by
    have hlag := ExactA2CapMetric.signedArea2_sq_add_inner_sq
      (0 : ℝ²) V D
    have harea : signedArea2 (0 : ℝ²) V D = det2 V D := by
      simp only [signedArea2_eq_det2_sub, sub_zero]
    rw [harea] at hlag
    simp only [sub_zero, hV, hD] at hlag
    change det2 V D ^ 2 + p ^ 2 = radius ^ 2 * radius ^ 2 at hlag
    have hrr : radius ^ 2 * radius ^ 2 = r ^ 2 := by
      dsimp [r]
      ring
    rw [hrr] at hlag
    linarith
  have hXarea :
      r * det2 X C = -(T * (2 * p + r) * det2 V D) := by
    calc
      r * det2 X C = det2 (r • X) C := by
        simp only [det2, PiLp.smul_apply, smul_eq_mul]
        ring
      _ = det2 ((2 * p) • D - r • V) (T • (V + D)) := by
        rw [hXscaled, hCrep]
      _ = -(T * (2 * p + r) * det2 V D) := by
        simp only [det2, PiLp.sub_apply, PiLp.add_apply, PiLp.smul_apply,
          smul_eq_mul]
        ring
  have hUarea :
      r ^ 2 * det2 U C =
        T * (4 * p ^ 2 + 2 * r * p - r ^ 2) * det2 V D := by
    calc
      r ^ 2 * det2 U C = det2 (r ^ 2 • U) C := by
        simp only [det2, PiLp.smul_apply, smul_eq_mul]
        ring
      _ = det2
          ((4 * p ^ 2 - r ^ 2) • V - (2 * r * p) • D)
          (T • (V + D)) := by rw [hUscaled, hCrep]
      _ = T * (4 * p ^ 2 + 2 * r * p - r ^ 2) * det2 V D := by
        simp only [det2, PiLp.sub_apply, PiLp.add_apply, PiLp.smul_apply,
          smul_eq_mul]
        ring
  rcases scalar_two_clearance_margins hr hp hpLtR hrp hT hTp with
    ⟨hmarginX, hmarginU⟩
  have hXscaledEq :
      r ^ 2 * det2 X C ^ 2 =
        T ^ 2 * (2 * p + r) ^ 2 * (r ^ 2 - p ^ 2) := by
    calc
      r ^ 2 * det2 X C ^ 2 = (r * det2 X C) ^ 2 := by ring
      _ = (-(T * (2 * p + r) * det2 V D)) ^ 2 := by rw [hXarea]
      _ = T ^ 2 * (2 * p + r) ^ 2 * det2 V D ^ 2 := by ring
      _ = T ^ 2 * (2 * p + r) ^ 2 * (r ^ 2 - p ^ 2) := by
        rw [hlagrange]
  have hUscaledEq :
      r ^ 4 * det2 U C ^ 2 =
        T ^ 2 * (4 * p ^ 2 + 2 * r * p - r ^ 2) ^ 2 *
          (r ^ 2 - p ^ 2) := by
    calc
      r ^ 4 * det2 U C ^ 2 = (r ^ 2 * det2 U C) ^ 2 := by ring
      _ =
          (T * (4 * p ^ 2 + 2 * r * p - r ^ 2) * det2 V D) ^ 2 := by
        rw [hUarea]
      _ = T ^ 2 * (4 * p ^ 2 + 2 * r * p - r ^ 2) ^ 2 *
          det2 V D ^ 2 := by ring
      _ = T ^ 2 * (4 * p ^ 2 + 2 * r * p - r ^ 2) ^ 2 *
          (r ^ 2 - p ^ 2) := by rw [hlagrange]
  constructor
  · rw [hCV]
    by_contra hnot
    have hle :
        det2 X C ^ 2 ≤
          r * (r + 2 * (T ^ 2 - T) * (r + p)) := le_of_not_gt hnot
    have hscaled :=
      mul_le_mul_of_nonneg_left hle (sq_nonneg r)
    have hbad :
        r ^ 2 * det2 X C ^ 2 ≤
          r ^ 3 * (r + 2 * (T ^ 2 - T) * (r + p)) := by
      calc
        r ^ 2 * det2 X C ^ 2 ≤
            r ^ 2 * (r * (r + 2 * (T ^ 2 - T) * (r + p))) := hscaled
        _ = r ^ 3 * (r + 2 * (T ^ 2 - T) * (r + p)) := by ring
    have hgood :
        r ^ 3 * (r + 2 * (T ^ 2 - T) * (r + p)) <
          r ^ 2 * det2 X C ^ 2 := by
      calc
        r ^ 3 * (r + 2 * (T ^ 2 - T) * (r + p)) <
            T ^ 2 * (2 * p + r) ^ 2 * (r ^ 2 - p ^ 2) :=
          sub_pos.mp hmarginX
        _ = r ^ 2 * det2 X C ^ 2 := hXscaledEq.symm
    exact (not_lt_of_ge hbad) hgood
  · rw [hCV]
    by_contra hnot
    have hle :
        det2 U C ^ 2 ≤
          r * (r + 2 * (T ^ 2 - T) * (r + p)) := le_of_not_gt hnot
    have hscaled :=
      mul_le_mul_of_nonneg_left hle (show 0 ≤ r ^ 4 by positivity)
    have hbad :
        r ^ 4 * det2 U C ^ 2 ≤
          r ^ 5 * (r + 2 * (T ^ 2 - T) * (r + p)) := by
      calc
        r ^ 4 * det2 U C ^ 2 ≤
            r ^ 4 * (r * (r + 2 * (T ^ 2 - T) * (r + p))) := hscaled
        _ = r ^ 5 * (r + 2 * (T ^ 2 - T) * (r + p)) := by ring
    have hgood :
        r ^ 5 * (r + 2 * (T ^ 2 - T) * (r + p)) <
          r ^ 4 * det2 U C ^ 2 := by
      calc
        r ^ 5 * (r + 2 * (T ^ 2 - T) * (r + p)) <
            T ^ 2 * (4 * p ^ 2 + 2 * r * p - r ^ 2) ^ 2 *
              (r ^ 2 - p ^ 2) := sub_pos.mp hmarginU
        _ = r ^ 4 * det2 U C ^ 2 := hUscaledEq.symm
    exact (not_lt_of_ge hbad) hgood

/-- Point-level form of `vector_two_clearances_of_nested_fan`, stated using
the project-wide distance and signed-area interfaces. -/
theorem two_clearances_of_nested_fan
    {P u x v d c : ℝ²} {radius tv td T : ℝ}
    (hradius : 0 < radius)
    (hP_u : dist P u = radius) (hP_x : dist P x = radius)
    (hP_v : dist P v = radius) (hP_d : dist P d = radius)
    (htv : 0 < tv) (htd : 0 < td) (hT : (1 / 2 : ℝ) < T)
    (hvrep : v - P = tv • ((u - P) + (x - P)))
    (hdrep : d - P = td • ((v - P) + (x - P)))
    (hcrep : c - P = T • ((v - P) + (d - P)))
    (hvd : v ≠ d)
    (horient :
      0 < signedArea2 c d x * signedArea2 P v x) :
    dist x P ^ 2 * dist c v ^ 2 < signedArea2 x P c ^ 2 ∧
      dist P u ^ 2 * dist c v ^ 2 < signedArea2 P u c ^ 2 := by
  have huNorm : ‖u - P‖ = radius := by
    simpa only [dist_eq_norm, norm_sub_rev] using hP_u
  have hxNorm : ‖x - P‖ = radius := by
    simpa only [dist_eq_norm, norm_sub_rev] using hP_x
  have hvNorm : ‖v - P‖ = radius := by
    simpa only [dist_eq_norm, norm_sub_rev] using hP_v
  have hdNorm : ‖d - P‖ = radius := by
    simpa only [dist_eq_norm, norm_sub_rev] using hP_d
  have hvdVec : v - P ≠ d - P := by
    intro heq
    exact hvd (sub_left_inj.mp heq)
  have hcdx :
      signedArea2 c d x =
        det2 ((d - P) - (c - P)) ((x - P) - (c - P)) := by
    rw [signedArea2_eq_det2_sub]
    congr 1 <;> abel
  have hPvx :
      signedArea2 P v x = det2 (v - P) (x - P) :=
    signedArea2_eq_det2_sub P v x
  have horientVec :
      0 <
        det2 ((d - P) - (c - P)) ((x - P) - (c - P)) *
          det2 (v - P) (x - P) := by
    rw [← hcdx, ← hPvx]
    exact horient
  have hclear := vector_two_clearances_of_nested_fan
    hradius huNorm hxNorm hvNorm hdNorm htv htd hT
      hvrep hdrep hcrep hvdVec horientVec
  have hxP : dist x P = radius := by
    rw [dist_comm]
    exact hP_x
  have hcv : dist c v = ‖(c - P) - (v - P)‖ := by
    rw [dist_eq_norm]
    congr 1
    abel
  have hareaX :
      signedArea2 x P c = -det2 (x - P) (c - P) := by
    unfold signedArea2 det2
    simp only [PiLp.sub_apply]
    ring
  have hareaU :
      signedArea2 P u c = det2 (u - P) (c - P) :=
    signedArea2_eq_det2_sub P u c
  constructor
  · rw [hxP, hcv, hareaX]
    rw [show (-det2 (x - P) (c - P)) ^ 2 =
      det2 (x - P) (c - P) ^ 2 by ring]
    exact hclear.1
  · rw [hP_u, hcv, hareaU]
    exact hclear.2

/-- In a global CCW boundary order, two vertices outside the closed interval
from `u` through `x` lie on opposite sides of at least one of the two wedge
boundary lines based at the first outside vertex. -/
theorem outside_interval_opposite_wedge_side
    {n : ℕ} {phi : Fin n → ℝ²}
    (hinj : Function.Injective phi)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {iO iu ic ix iq : Fin n}
    (huc : iu < ic) (hcx : ic < ix)
    (hOout : iO < iu ∨ ix < iO)
    (hqout : iq < iu ∨ ix < iq)
    (hOq : iO ≠ iq) :
    signedArea2 (phi iO) (phi iu) (phi ic) *
          signedArea2 (phi iO) (phi iu) (phi iq) < 0 ∨
      signedArea2 (phi ix) (phi iO) (phi ic) *
          signedArea2 (phi ix) (phi iO) (phi iq) < 0 := by
  have hneg {i j k : Fin n} (hij : i < j) (hjk : j < k) :
      signedArea2 (phi i) (phi j) (phi k) < 0 :=
    hneg_of_ccw hinj hccw hij hjk
  rcases hOout with hOleft | hOright
  · have hOc : signedArea2 (phi iO) (phi iu) (phi ic) < 0 :=
      hneg hOleft huc
    have hXc : signedArea2 (phi ix) (phi iO) (phi ic) < 0 := by
      calc
        signedArea2 (phi ix) (phi iO) (phi ic) =
            signedArea2 (phi iO) (phi ic) (phi ix) :=
          ExactA2CapMetric.signedArea2_cyclic _ _ _
        _ < 0 := hneg (hOleft.trans huc) hcx
    rcases hqout with hqleft | hqright
    · rcases lt_or_gt_of_ne hOq with hOq' | hqO
      · left
        have hraw := hneg hOq' hqleft
        have hswap :=
          ExactA2CapMetric.signedArea2_swap (phi iO) (phi iq) (phi iu)
        have hqpos : 0 < signedArea2 (phi iO) (phi iu) (phi iq) := by
          linarith
        exact mul_neg_of_neg_of_pos hOc hqpos
      · right
        have hraw := hneg hqO (hOleft.trans (huc.trans hcx))
        have hcyc1 :=
          ExactA2CapMetric.signedArea2_cyclic (phi iq) (phi iO) (phi ix)
        have hcyc2 :=
          ExactA2CapMetric.signedArea2_cyclic (phi iO) (phi ix) (phi iq)
        have hswap :=
          ExactA2CapMetric.signedArea2_swap (phi ix) (phi iq) (phi iO)
        have hqpos : 0 < signedArea2 (phi ix) (phi iO) (phi iq) := by
          linarith
        exact mul_neg_of_neg_of_pos hXc hqpos
    · right
      have hraw := hneg (hOleft.trans (huc.trans hcx)) hqright
      have hcyc :=
        ExactA2CapMetric.signedArea2_cyclic (phi iO) (phi ix) (phi iq)
      have hswap :=
        ExactA2CapMetric.signedArea2_swap (phi ix) (phi iq) (phi iO)
      have hqpos : 0 < signedArea2 (phi ix) (phi iO) (phi iq) := by
        linarith
      exact mul_neg_of_neg_of_pos hXc hqpos
  · have hOc : signedArea2 (phi iO) (phi iu) (phi ic) < 0 := by
      calc
        signedArea2 (phi iO) (phi iu) (phi ic) =
            signedArea2 (phi iu) (phi ic) (phi iO) :=
          ExactA2CapMetric.signedArea2_cyclic _ _ _
        _ < 0 := hneg huc (hcx.trans hOright)
    have hXc : signedArea2 (phi ix) (phi iO) (phi ic) < 0 := by
      calc
        signedArea2 (phi ix) (phi iO) (phi ic) =
            signedArea2 (phi ic) (phi ix) (phi iO) := by
          rw [ExactA2CapMetric.signedArea2_cyclic,
            ExactA2CapMetric.signedArea2_cyclic]
        _ < 0 := hneg hcx hOright
    rcases hqout with hqleft | hqright
    · left
      have hraw := hneg hqleft (huc.trans (hcx.trans hOright))
      have hcyc1 :=
        ExactA2CapMetric.signedArea2_cyclic (phi iq) (phi iu) (phi iO)
      have hcyc2 :=
        ExactA2CapMetric.signedArea2_cyclic (phi iu) (phi iO) (phi iq)
      have hswap :=
        ExactA2CapMetric.signedArea2_swap (phi iO) (phi iq) (phi iu)
      have hqpos : 0 < signedArea2 (phi iO) (phi iu) (phi iq) := by
        linarith
      exact mul_neg_of_neg_of_pos hOc hqpos
    · rcases lt_or_gt_of_ne hOq with hOq' | hqO
      · left
        have hraw := hneg (huc.trans (hcx.trans hOright)) hOq'
        have hcyc :=
          ExactA2CapMetric.signedArea2_cyclic (phi iu) (phi iO) (phi iq)
        have hswap :=
          ExactA2CapMetric.signedArea2_swap (phi iO) (phi iq) (phi iu)
        have hqpos : 0 < signedArea2 (phi iO) (phi iu) (phi iq) := by
          linarith
        exact mul_neg_of_neg_of_pos hOc hqpos
      · right
        have hraw := hneg hqright hqO
        have hswap :=
          ExactA2CapMetric.signedArea2_swap (phi ix) (phi iq) (phi iO)
        have hqpos : 0 < signedArea2 (phi ix) (phi iO) (phi iq) := by
          linarith
        exact mul_neg_of_neg_of_pos hXc hqpos

/-- A point outside a retained cap block is opposite its interior point
across at least one of the wedge lines determined by a second outside point
and two ordered interior vertices. -/
theorem outside_cap_opposite_wedge_side
    {A cap : Finset ℝ²}
    (B : CGN.StrictCapBlockData A cap)
    {O u c x q : ℝ²}
    (hOA : O ∈ A) (hqA : q ∈ A)
    (hOnot : O ∉ cap) (hqnot : q ∉ cap) (hOq : O ≠ q)
    {iu ic ix : Fin B.m}
    (hu : B.L.points iu = u) (hc : B.L.points ic = c)
    (hx : B.L.points ix = x)
    (huc : iu < ic) (hcx : ic < ix) :
    signedArea2 O u c * signedArea2 O u q < 0 ∨
      signedArea2 x O c * signedArea2 x O q < 0 := by
  have hOimage : O ∈ Finset.univ.image B.phi := by
    rw [B.Block.phi_image]
    exact hOA
  have hqimage : q ∈ Finset.univ.image B.phi := by
    rw [B.Block.phi_image]
    exact hqA
  rcases Finset.mem_image.mp hOimage with ⟨iO, _hiO, hphiO⟩
  rcases Finset.mem_image.mp hqimage with ⟨iq, _hiq, hphiq⟩
  have hiuBounds :
      B.Block.lo ≤ B.Block.idx iu ∧ B.Block.idx iu ≤ B.Block.hi :=
    (B.Block.idx_range_exact (B.Block.idx iu)).2 ⟨iu, rfl⟩
  have hixBounds :
      B.Block.lo ≤ B.Block.idx ix ∧ B.Block.idx ix ≤ B.Block.hi :=
    (B.Block.idx_range_exact (B.Block.idx ix)).2 ⟨ix, rfl⟩
  have hOBlock :
      ¬ (B.Block.lo ≤ iO ∧ iO ≤ B.Block.hi) := by
    intro hbounds
    apply hOnot
    rw [← hphiO]
    exact (B.phi_mem_cap_iff_block iO).2 hbounds
  have hqBlock :
      ¬ (B.Block.lo ≤ iq ∧ iq ≤ B.Block.hi) := by
    intro hbounds
    apply hqnot
    rw [← hphiq]
    exact (B.phi_mem_cap_iff_block iq).2 hbounds
  have hOout :
      iO < B.Block.idx iu ∨ B.Block.idx ix < iO := by
    omega
  have hqout :
      iq < B.Block.idx iu ∨ B.Block.idx ix < iq := by
    omega
  have hiOq : iO ≠ iq := by
    intro heq
    apply hOq
    calc
      O = B.phi iO := hphiO.symm
      _ = B.phi iq := by rw [heq]
      _ = q := hphiq
  have hphiU : B.phi (B.Block.idx iu) = u :=
    (B.Block.points_eq iu).symm.trans hu
  have hphiC : B.phi (B.Block.idx ic) = c :=
    (B.Block.points_eq ic).symm.trans hc
  have hphiX : B.phi (B.Block.idx ix) = x :=
    (B.Block.points_eq ix).symm.trans hx
  have hwedge := outside_interval_opposite_wedge_side
    B.phi_injective B.phi_ccw
      (B.Block.idx_strict huc) (B.Block.idx_strict hcx)
      hOout hqout hiOq
  simpa only [hphiO, hphiU, hphiC, hphiX, hphiq] using hwedge

/-- An outside carrier vertex is on the strict negative side of every
increasing chord of a retained cap block. -/
theorem ordered_cap_chord_outside_negative
    {A cap : Finset ℝ²}
    (B : CGN.StrictCapBlockData A cap)
    {O : ℝ²} (hOA : O ∈ A) (hOnot : O ∉ cap)
    {i j : Fin B.m} (hij : i < j) :
    signedArea2 (B.L.points i) (B.L.points j) O < 0 := by
  have hOimage : O ∈ Finset.univ.image B.phi := by
    rw [B.Block.phi_image]
    exact hOA
  rcases Finset.mem_image.mp hOimage with ⟨iO, _hiO, hphiO⟩
  have hiBounds :
      B.Block.lo ≤ B.Block.idx i ∧ B.Block.idx i ≤ B.Block.hi :=
    (B.Block.idx_range_exact (B.Block.idx i)).2 ⟨i, rfl⟩
  have hjBounds :
      B.Block.lo ≤ B.Block.idx j ∧ B.Block.idx j ≤ B.Block.hi :=
    (B.Block.idx_range_exact (B.Block.idx j)).2 ⟨j, rfl⟩
  have hOBlock :
      ¬ (B.Block.lo ≤ iO ∧ iO ≤ B.Block.hi) := by
    intro hbounds
    apply hOnot
    rw [← hphiO]
    exact (B.phi_mem_cap_iff_block iO).2 hbounds
  have houtside :
      iO < B.Block.idx i ∨ B.Block.idx j < iO := by
    omega
  have hphiI :
      B.phi (B.Block.idx i) = B.L.points i :=
    (B.Block.points_eq i).symm
  have hphiJ :
      B.phi (B.Block.idx j) = B.L.points j :=
    (B.Block.points_eq j).symm
  rcases houtside with hleft | hright
  · have hraw := hneg_of_ccw B.phi_injective B.phi_ccw
      hleft (B.Block.idx_strict hij)
    have hcyc := ExactA2CapMetric.signedArea2_cyclic
      (B.phi iO) (B.phi (B.Block.idx i)) (B.phi (B.Block.idx j))
    rw [hphiO, hphiI, hphiJ] at hraw hcyc
    linarith
  · have hraw := hneg_of_ccw B.phi_injective B.phi_ccw
      (B.Block.idx_strict hij) hright
    simpa only [hphiI, hphiJ, hphiO] using hraw

end A3GlobalCircleWedge
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.A3GlobalCircleWedge
import Erdos9796Proof.P97.ATail.CocircularPentagonOrder
import Erdos9796Proof.P97.ATail.CocircularPerpendicularBisector
import Erdos9796Proof.P97.ATail.ConvexCocircularHalfPlane

/-!
# The global four-point circle-wedge terminal for the Rigid221 A4 branch

This module constructs the three positive perpendicular-bisector parameters of
the A4 four-point fan and proves its two source-independent circle clearances.
The source-specific BlockerV adapter remains in
`FrontierLiveClosure.Rigid221SourceHeavy`.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97
namespace A4GlobalCircleWedge

private def det2 (a b : ℝ²) : ℝ :=
  a 0 * b 1 - a 1 * b 0

private theorem signedArea2_eq_det2_sub (a b c : ℝ²) :
    signedArea2 a b c = det2 (b - a) (c - a) := by
  unfold signedArea2 det2
  simp only [PiLp.sub_apply]
  ring

private theorem sum_ne_zero_of_strict_halfplane
    {P p q w : ℝ²}
    (hp : 0 < ⟪w, p - P⟫_ℝ) (hq : 0 < ⟪w, q - P⟫_ℝ) :
    (p - P) + (q - P) ≠ 0 := by
  intro hzero
  have hinner := congrArg (fun z : ℝ² => ⟪w, z⟫_ℝ) hzero
  change ⟪w, (p - P) + (q - P)⟫_ℝ = ⟪w, 0⟫_ℝ at hinner
  rw [inner_add_right, inner_zero_right] at hinner
  linarith

/-- Construct the three positive perpendicular-bisector parameters of the A4
four-point fan. -/
theorem exists_four_point_fan_parameters
    {A : Finset ℝ²} {P u y x v c : ℝ²} {radius : ℝ}
    (hA : ConvexIndep A)
    (hP_mem : P ∈ A) (hu_mem : u ∈ A) (hy_mem : y ∈ A)
    (hx_mem : x ∈ A) (hv_mem : v ∈ A)
    (hu_ne_P : u ≠ P) (hy_ne_P : y ≠ P) (hx_ne_P : x ≠ P)
    (hv_ne_P : v ≠ P)
    (hu_ne_y : u ≠ y) (hu_ne_x : u ≠ x) (hv_ne_x : v ≠ x)
    (hradius : 0 < radius)
    (hP_u : dist P u = radius) (hP_y : dist P y = radius)
    (hP_x : dist P x = radius) (hP_v : dist P v = radius)
    (hx_eq : dist x u = dist x y)
    (hv_eq : dist v u = dist v x)
    (hc_eq : dist c v = dist c x)
    (hc_sides :
      (0 < signedArea2 v x c ∧ signedArea2 v x P < 0) ∨
      (0 < signedArea2 x v c ∧ signedArea2 x v P < 0)) :
    ∃ tx tv T : ℝ,
      0 < tx ∧ 0 < tv ∧ (1 / 2 : ℝ) < T ∧
      x - P = tx • ((u - P) + (y - P)) ∧
      v - P = tv • ((u - P) + (x - P)) ∧
      c - P = T • ((v - P) + (x - P)) := by
  let physical : Finset ℝ² := {u, y, x, v}
  have hphysical : physical ⊆ A.erase P := by
    intro q hq
    simp only [physical, Finset.mem_insert, Finset.mem_singleton] at hq
    rcases hq with rfl | rfl | rfl | rfl
    · exact Finset.mem_erase.mpr ⟨hu_ne_P, hu_mem⟩
    · exact Finset.mem_erase.mpr ⟨hy_ne_P, hy_mem⟩
    · exact Finset.mem_erase.mpr ⟨hx_ne_P, hx_mem⟩
    · exact Finset.mem_erase.mpr ⟨hv_ne_P, hv_mem⟩
  have hcommon : ∀ q ∈ physical, dist q P = radius := by
    intro q hq
    simp only [physical, Finset.mem_insert, Finset.mem_singleton] at hq
    rcases hq with rfl | rfl | rfl | rfl
    · simpa only [dist_comm] using hP_u
    · simpa only [dist_comm] using hP_y
    · simpa only [dist_comm] using hP_x
    · simpa only [dist_comm] using hP_v
  obtain ⟨w, hw⟩ :=
    exists_strict_separating_vector_of_convexIndep_cocircular
      hA hP_mem hphysical hradius hcommon
  have hwu : 0 < ⟪w, u - P⟫_ℝ := hw u (by simp [physical])
  have hwy : 0 < ⟪w, y - P⟫_ℝ := hw y (by simp [physical])
  have hwx : 0 < ⟪w, x - P⟫_ℝ := hw x (by simp [physical])
  have hwv : 0 < ⟪w, v - P⟫_ℝ := hw v (by simp [physical])
  have hsumUY := sum_ne_zero_of_strict_halfplane hwu hwy
  have hsumUX := sum_ne_zero_of_strict_halfplane hwu hwx
  have hsumVX := sum_ne_zero_of_strict_halfplane hwv hwx
  obtain ⟨tx, hxrep, -⟩ :=
    Erdos9796Proof.Geometry.exists_bisector_direction_ne_zero hu_ne_y
      (hP_u.trans hP_y.symm) hx_eq hsumUY hx_ne_P
  obtain ⟨tv, hvrep, -⟩ :=
    Erdos9796Proof.Geometry.exists_bisector_direction_ne_zero hu_ne_x
      (hP_u.trans hP_x.symm) hv_eq hsumUX hv_ne_P
  obtain ⟨T, hcrep⟩ :=
    Erdos9796Proof.Geometry.exists_bisector_direction hv_ne_x
      (hP_v.trans hP_x.symm) hc_eq hsumVX
  have htx : 0 < tx :=
    CocircularPentagonOrder.positive_parameter_of_strict_halfplane hwu hwy hwx hxrep
  have htv : 0 < tv :=
    CocircularPentagonOrder.positive_parameter_of_strict_halfplane hwu hwx hwv hvrep
  have hT : (1 / 2 : ℝ) < T := by
    rcases hc_sides with hforward | hreverse
    · exact Erdos9796Proof.Geometry.bisector_parameter_gt_half_of_signed_sides
        hcrep hforward.1 hforward.2
    · have hcrep' : c - P = T • ((x - P) + (v - P)) := by
        simpa only [add_comm] using hcrep
      exact Erdos9796Proof.Geometry.bisector_parameter_gt_half_of_signed_sides
        hcrep' hreverse.1 hreverse.2
  exact ⟨tx, tv, T, htx, htv, hT, hxrep, hvrep, hcrep⟩

set_option maxHeartbeats 250000 in
-- The default 200000 and a measured 225000 are exhausted by the coordinated
-- polynomial normalization; 250000 elaborates. Revisit if the identities are split.
/-- The coordinate-free four-point fan calculation: the circle centered at
`C` through `V` has strict clearance from the two outer fan lines. -/
theorem vector_two_clearances_of_four_point_fan
    {U V X Y C : ℝ²} {radius tv tx T : ℝ}
    (hradius : 0 < radius)
    (hU : ‖U‖ = radius) (hV : ‖V‖ = radius)
    (hX : ‖X‖ = radius) (hY : ‖Y‖ = radius)
    (htv : 0 < tv) (htx : 0 < tx) (hT : (1 / 2 : ℝ) < T)
    (hVrep : V = tv • (U + X))
    (hXrep : X = tx • (U + Y))
    (hCrep : C = T • (V + X))
    (hVX : V ≠ X)
    (horient : 0 < det2 (V - U) (C - U) * det2 V X) :
    radius ^ 2 * ‖C - V‖ ^ 2 < det2 U C ^ 2 ∧
      radius ^ 2 * ‖C - V‖ ^ 2 < det2 Y C ^ 2 := by
  let r : ℝ := radius ^ 2
  let p : ℝ := ⟪V, X⟫_ℝ
  let q : ℝ := ⟪X, U⟫_ℝ
  have hr : 0 < r := by
    dsimp [r]
    positivity
  have hUU : ⟪U, U⟫_ℝ = r := by
    rw [real_inner_self_eq_norm_sq, hU]
  have hVV : ⟪V, V⟫_ℝ = r := by
    rw [real_inner_self_eq_norm_sq, hV]
  have hXX : ⟪X, X⟫_ℝ = r := by
    rw [real_inner_self_eq_norm_sq, hX]
  have hYY : ⟪Y, Y⟫_ℝ = r := by
    rw [real_inner_self_eq_norm_sq, hY]
  have hp : 0 < p := by
    dsimp [p]
    have hpos :=
      ExactA2CapMetric.inner_pos_of_positive_equal_norm_sum_direction
        hradius hX hU hV htv (by simpa only [add_comm] using hVrep)
    simpa only [real_inner_comm] using hpos
  have hq : 0 < q := by
    dsimp [q]
    have hpos :=
      ExactA2CapMetric.inner_pos_of_positive_equal_norm_sum_direction
        hradius hU hY hX htx hXrep
    simpa only [real_inner_comm] using hpos
  have hpEq : p = tv * (r + q) := by
    dsimp [p, q]
    rw [hVrep, real_inner_smul_left, inner_add_left, hXX,
      real_inner_comm U X]
    ring
  have hVU : ⟪V, U⟫_ℝ = p := by
    calc
      ⟪V, U⟫_ℝ = tv * (⟪U, U⟫_ℝ + ⟪X, U⟫_ℝ) := by
        rw [hVrep, real_inner_smul_left, inner_add_left]
      _ = tv * (r + ⟪U, X⟫_ℝ) := by
        rw [hUU, real_inner_comm X U]
      _ = tv * (⟪U, X⟫_ℝ + r) := by ring
      _ = ⟪V, X⟫_ℝ := by
        rw [hVrep, real_inner_smul_left, inner_add_left, hXX]
      _ = p := rfl
  have htwoTvP : 2 * tv * p = r := by
    calc
      2 * tv * p = tv * (⟪V, U⟫_ℝ + ⟪V, X⟫_ℝ) := by
        rw [hVU]
        dsimp [p]
        ring
      _ = ⟪V, tv • (U + X)⟫_ℝ := by
        rw [real_inner_smul_right, inner_add_right]
      _ = ⟪V, V⟫_ℝ := by rw [← hVrep]
      _ = r := hVV
  have hXY : ⟪X, Y⟫_ℝ = q := by
    calc
      ⟪X, Y⟫_ℝ = tx * (⟪U, Y⟫_ℝ + ⟪Y, Y⟫_ℝ) := by
        rw [hXrep, real_inner_smul_left, inner_add_left]
      _ = tx * (⟪Y, U⟫_ℝ + r) := by
        rw [hYY, real_inner_comm U Y]
      _ = tx * (r + ⟪Y, U⟫_ℝ) := by ring
      _ = ⟪X, U⟫_ℝ := by
        rw [hXrep, real_inner_smul_left, inner_add_left, hUU]
      _ = q := rfl
  have htwoTxQ : 2 * tx * q = r := by
    calc
      2 * tx * q = tx * (⟪X, U⟫_ℝ + ⟪X, Y⟫_ℝ) := by
        rw [hXY]
        dsimp [q]
        ring
      _ = ⟪X, tx • (U + Y)⟫_ℝ := by
        rw [real_inner_smul_right, inner_add_right]
      _ = ⟪X, X⟫_ℝ := by rw [← hXrep]
      _ = r := hXX
  have hpRelation : 2 * p ^ 2 = r * (r + q) := by
    have hmul := congrArg (fun z : ℝ => 2 * p * z) hpEq
    calc
      2 * p ^ 2 = 2 * p * p := by ring
      _ = 2 * p * (tv * (r + q)) := hmul
      _ = (2 * tv * p) * (r + q) := by ring
      _ = r * (r + q) := by rw [htwoTvP]
  have hrp : r ^ 2 < 2 * p ^ 2 := by
    have hrq : 0 < r * q := mul_pos hr hq
    nlinarith [hpRelation]
  have hpLtR : p < r := by
    have hsub : V - X ≠ 0 := sub_ne_zero.mpr hVX
    have hnorm : 0 < ‖V - X‖ ^ 2 := by
      exact sq_pos_of_pos (norm_pos_iff.mpr hsub)
    have hnormEq : ‖V - X‖ ^ 2 = 2 * r - 2 * p := by
      rw [norm_sub_sq_real, hV, hX]
      dsimp [r, p]
      ring
    linarith
  have hUscaled : r • U = (2 * p) • V - r • X := by
    have hVscaled : (2 * p) • V = r • (U + X) := by
      calc
        (2 * p) • V = ((2 * p) * tv) • (U + X) := by
          rw [hVrep, smul_smul]
        _ = r • (U + X) := by
          rw [show (2 * p) * tv = r by nlinarith only [htwoTvP]]
    rw [hVscaled, smul_add]
    abel
  have hYscaledBase : r • Y = (2 * q) • X - r • U := by
    have hXscaled : (2 * q) • X = r • (U + Y) := by
      calc
        (2 * q) • X = ((2 * q) * tx) • (U + Y) := by
          rw [hXrep, smul_smul]
        _ = r • (U + Y) := by
          rw [show (2 * q) * tx = r by nlinarith only [htwoTxQ]]
    rw [hXscaled, smul_add]
    abel
  have hcoef : 2 * r * q + r ^ 2 = 4 * p ^ 2 - r ^ 2 := by
    nlinarith [hpRelation]
  have hYscaled :
      r ^ 2 • Y = (4 * p ^ 2 - r ^ 2) • X - (2 * r * p) • V := by
    calc
      r ^ 2 • Y = r • (r • Y) := by
        rw [smul_smul]
        congr 1
        ring
      _ = r • ((2 * q) • X - r • U) := by rw [hYscaledBase]
      _ = r • ((2 * q) • X) - r • (r • U) := by rw [smul_sub]
      _ = r • ((2 * q) • X) -
          r • ((2 * p) • V - r • X) := by rw [hUscaled]
      _ = (2 * r * q + r ^ 2) • X - (2 * r * p) • V := by
        module
      _ = (4 * p ^ 2 - r ^ 2) • X - (2 * r * p) • V := by
        rw [hcoef]
  have hUscaled0 := congrArg (fun z : ℝ² => z 0) hUscaled
  have hUscaled1 := congrArg (fun z : ℝ² => z 1) hUscaled
  have harea :
      r * det2 (V - U) (C - U) =
        (r - 2 * T * p) * det2 V X := by
    rw [hCrep]
    unfold det2
    simp only [PiLp.sub_apply, PiLp.add_apply, PiLp.smul_apply,
      smul_eq_mul] at hUscaled0 hUscaled1 ⊢
    linear_combination
      ((1 - T) * V 1 - T * X 1) * hUscaled0 +
        (-(1 - T) * V 0 + T * X 0) * hUscaled1
  have horientScaled :
      0 < r * (det2 (V - U) (C - U) * det2 V X) :=
    mul_pos hr horient
  rw [show
      r * (det2 (V - U) (C - U) * det2 V X) =
        (r * det2 (V - U) (C - U)) * det2 V X by ring,
    harea] at horientScaled
  have hTp : 2 * T * p < r := by
    nlinarith only [horientScaled, sq_nonneg (det2 V X)]
  have hCVinner : ⟪C, V⟫_ℝ = T * (r + p) := by
    rw [hCrep, real_inner_smul_left, inner_add_left, hVV]
    dsimp [p]
    rw [real_inner_comm X V]
  have hCC : ‖C‖ ^ 2 = T ^ 2 * (2 * r + 2 * p) := by
    rw [← real_inner_self_eq_norm_sq, hCrep,
      real_inner_smul_left, real_inner_smul_right,
      inner_add_left, inner_add_right, inner_add_right, hVV, hXX]
    dsimp [p]
    rw [real_inner_comm X V]
    ring
  have hCV :
      ‖C - V‖ ^ 2 = r + 2 * (T ^ 2 - T) * (r + p) := by
    rw [norm_sub_sq_real, hCC, hV]
    rw [hCVinner]
    dsimp [r]
    ring
  have hlagrange : det2 V X ^ 2 = r ^ 2 - p ^ 2 := by
    have hlag := ExactA2CapMetric.signedArea2_sq_add_inner_sq
      (0 : ℝ²) V X
    have hareaVX : signedArea2 (0 : ℝ²) V X = det2 V X := by
      simp only [signedArea2_eq_det2_sub, sub_zero]
    rw [hareaVX] at hlag
    simp only [sub_zero, hV, hX] at hlag
    change det2 V X ^ 2 + p ^ 2 = radius ^ 2 * radius ^ 2 at hlag
    have hrr : radius ^ 2 * radius ^ 2 = r ^ 2 := by
      dsimp [r]
      ring
    rw [hrr] at hlag
    linarith
  have hUarea :
      r * det2 U C = T * (2 * p + r) * det2 V X := by
    calc
      r * det2 U C = det2 (r • U) C := by
        simp only [det2, PiLp.smul_apply, smul_eq_mul]
        ring
      _ = det2 ((2 * p) • V - r • X) (T • (V + X)) := by
        rw [hUscaled, hCrep]
      _ = T * (2 * p + r) * det2 V X := by
        simp only [det2, PiLp.sub_apply, PiLp.add_apply, PiLp.smul_apply,
          smul_eq_mul]
        ring
  have hYarea :
      r ^ 2 * det2 Y C =
        -(T * (4 * p ^ 2 + 2 * r * p - r ^ 2) * det2 V X) := by
    calc
      r ^ 2 * det2 Y C = det2 (r ^ 2 • Y) C := by
        simp only [det2, PiLp.smul_apply, smul_eq_mul]
        ring
      _ = det2
          ((4 * p ^ 2 - r ^ 2) • X - (2 * r * p) • V)
          (T • (V + X)) := by rw [hYscaled, hCrep]
      _ = -(T * (4 * p ^ 2 + 2 * r * p - r ^ 2) * det2 V X) := by
        simp only [det2, PiLp.sub_apply, PiLp.add_apply, PiLp.smul_apply,
          smul_eq_mul]
        ring
  rcases A3GlobalCircleWedge.scalar_two_clearance_margins
      hr hp hpLtR hrp hT hTp with ⟨hmarginU, hmarginY⟩
  have hUscaledEq :
      r ^ 2 * det2 U C ^ 2 =
        T ^ 2 * (2 * p + r) ^ 2 * (r ^ 2 - p ^ 2) := by
    calc
      r ^ 2 * det2 U C ^ 2 = (r * det2 U C) ^ 2 := by ring
      _ = (T * (2 * p + r) * det2 V X) ^ 2 := by rw [hUarea]
      _ = T ^ 2 * (2 * p + r) ^ 2 * det2 V X ^ 2 := by ring
      _ = T ^ 2 * (2 * p + r) ^ 2 * (r ^ 2 - p ^ 2) := by
        rw [hlagrange]
  have hYscaledEq :
      r ^ 4 * det2 Y C ^ 2 =
        T ^ 2 * (4 * p ^ 2 + 2 * r * p - r ^ 2) ^ 2 *
          (r ^ 2 - p ^ 2) := by
    calc
      r ^ 4 * det2 Y C ^ 2 = (r ^ 2 * det2 Y C) ^ 2 := by ring
      _ =
          (-(T * (4 * p ^ 2 + 2 * r * p - r ^ 2) * det2 V X)) ^ 2 := by
        rw [hYarea]
      _ = T ^ 2 * (4 * p ^ 2 + 2 * r * p - r ^ 2) ^ 2 *
          det2 V X ^ 2 := by ring
      _ = T ^ 2 * (4 * p ^ 2 + 2 * r * p - r ^ 2) ^ 2 *
          (r ^ 2 - p ^ 2) := by rw [hlagrange]
  constructor
  · rw [hCV]
    by_contra hnot
    have hle :
        det2 U C ^ 2 ≤
          r * (r + 2 * (T ^ 2 - T) * (r + p)) := le_of_not_gt hnot
    have hscaled := mul_le_mul_of_nonneg_left hle (sq_nonneg r)
    have hbad :
        r ^ 2 * det2 U C ^ 2 ≤
          r ^ 3 * (r + 2 * (T ^ 2 - T) * (r + p)) := by
      calc
        r ^ 2 * det2 U C ^ 2 ≤
            r ^ 2 * (r * (r + 2 * (T ^ 2 - T) * (r + p))) := hscaled
        _ = r ^ 3 * (r + 2 * (T ^ 2 - T) * (r + p)) := by ring
    have hgood :
        r ^ 3 * (r + 2 * (T ^ 2 - T) * (r + p)) <
          r ^ 2 * det2 U C ^ 2 := by
      calc
        r ^ 3 * (r + 2 * (T ^ 2 - T) * (r + p)) <
            T ^ 2 * (2 * p + r) ^ 2 * (r ^ 2 - p ^ 2) :=
          sub_pos.mp hmarginU
        _ = r ^ 2 * det2 U C ^ 2 := hUscaledEq.symm
    exact (not_lt_of_ge hbad) hgood
  · rw [hCV]
    by_contra hnot
    have hle :
        det2 Y C ^ 2 ≤
          r * (r + 2 * (T ^ 2 - T) * (r + p)) := le_of_not_gt hnot
    have hscaled :=
      mul_le_mul_of_nonneg_left hle (show 0 ≤ r ^ 4 by positivity)
    have hbad :
        r ^ 4 * det2 Y C ^ 2 ≤
          r ^ 5 * (r + 2 * (T ^ 2 - T) * (r + p)) := by
      calc
        r ^ 4 * det2 Y C ^ 2 ≤
            r ^ 4 * (r * (r + 2 * (T ^ 2 - T) * (r + p))) := hscaled
        _ = r ^ 5 * (r + 2 * (T ^ 2 - T) * (r + p)) := by ring
    have hgood :
        r ^ 5 * (r + 2 * (T ^ 2 - T) * (r + p)) <
          r ^ 4 * det2 Y C ^ 2 := by
      calc
        r ^ 5 * (r + 2 * (T ^ 2 - T) * (r + p)) <
            T ^ 2 * (4 * p ^ 2 + 2 * r * p - r ^ 2) ^ 2 *
              (r ^ 2 - p ^ 2) := sub_pos.mp hmarginY
        _ = r ^ 4 * det2 Y C ^ 2 := hYscaledEq.symm
    exact (not_lt_of_ge hbad) hgood

/-- Point-level form of `vector_two_clearances_of_four_point_fan`, stated
using the project-wide distance and signed-area interfaces. -/
theorem two_clearances_of_four_point_fan
    {P u y x v c : ℝ²} {radius tv tx T : ℝ}
    (hradius : 0 < radius)
    (hP_u : dist P u = radius) (hP_y : dist P y = radius)
    (hP_x : dist P x = radius) (hP_v : dist P v = radius)
    (htv : 0 < tv) (htx : 0 < tx) (hT : (1 / 2 : ℝ) < T)
    (hvrep : v - P = tv • ((u - P) + (x - P)))
    (hxrep : x - P = tx • ((u - P) + (y - P)))
    (hcrep : c - P = T • ((v - P) + (x - P)))
    (hvx : v ≠ x)
    (horient : 0 < signedArea2 u v c * signedArea2 P v x) :
    dist P u ^ 2 * dist c v ^ 2 < signedArea2 P u c ^ 2 ∧
      dist y P ^ 2 * dist c v ^ 2 < signedArea2 y P c ^ 2 := by
  have huNorm : ‖u - P‖ = radius := by
    simpa only [dist_eq_norm, norm_sub_rev] using hP_u
  have hyNorm : ‖y - P‖ = radius := by
    simpa only [dist_eq_norm, norm_sub_rev] using hP_y
  have hxNorm : ‖x - P‖ = radius := by
    simpa only [dist_eq_norm, norm_sub_rev] using hP_x
  have hvNorm : ‖v - P‖ = radius := by
    simpa only [dist_eq_norm, norm_sub_rev] using hP_v
  have hvxVec : v - P ≠ x - P := by
    intro heq
    exact hvx (sub_left_inj.mp heq)
  have huvC :
      signedArea2 u v c =
        det2 ((v - P) - (u - P)) ((c - P) - (u - P)) := by
    rw [signedArea2_eq_det2_sub]
    congr 1 <;> abel
  have hPvx :
      signedArea2 P v x = det2 (v - P) (x - P) :=
    signedArea2_eq_det2_sub P v x
  have horientVec :
      0 <
        det2 ((v - P) - (u - P)) ((c - P) - (u - P)) *
          det2 (v - P) (x - P) := by
    rw [← huvC, ← hPvx]
    exact horient
  have hclear := vector_two_clearances_of_four_point_fan
    hradius huNorm hvNorm hxNorm hyNorm htv htx hT
      hvrep hxrep hcrep hvxVec horientVec
  have hyP : dist y P = radius := by
    rw [dist_comm]
    exact hP_y
  have hcv : dist c v = ‖(c - P) - (v - P)‖ := by
    rw [dist_eq_norm]
    congr 1
    abel
  have hareaU :
      signedArea2 P u c = det2 (u - P) (c - P) :=
    signedArea2_eq_det2_sub P u c
  have hareaY :
      signedArea2 y P c = -det2 (y - P) (c - P) := by
    unfold signedArea2 det2
    simp only [PiLp.sub_apply]
    ring
  constructor
  · rw [hP_u, hcv, hareaU]
    exact hclear.1
  · rw [hyP, hcv, hareaY]
    rw [show (-det2 (y - P) (c - P)) ^ 2 =
      det2 (y - P) (c - P) ^ 2 by ring]
    exact hclear.2

end A4GlobalCircleWedge
end Problem97

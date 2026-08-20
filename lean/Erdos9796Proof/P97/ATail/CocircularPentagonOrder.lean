/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SignedAreaOangle

/-!
# The algebraic core of the cocircular pentagon fan

This file isolates the metric calculation behind the exact-seventeen
`NamedOrder = 1` cut.  The statement is deliberately independent of the SAT
encoding.  Four equal-norm rays form three nested positive sum directions,
and an off-circle bisector witness lies on a fourth positive sum direction.
The last direction stays strictly on the prescribed side of the third ray.
-/

open scoped EuclideanGeometry InnerProductSpace RealInnerProductSpace

namespace Problem97
namespace CocircularPentagonOrder

/-- A sum-direction coefficient is positive when all three rays lie in one
strict open half-plane through the center. -/
theorem positive_parameter_of_strict_halfplane
    {P p q z w : ℝ²} {t : ℝ}
    (hp : 0 < ⟪w, p - P⟫_ℝ) (hq : 0 < ⟪w, q - P⟫_ℝ)
    (hz : 0 < ⟪w, z - P⟫_ℝ)
    (hrep : z - P = t • ((p - P) + (q - P))) :
    0 < t := by
  have hinner := congrArg (fun a : ℝ² => ⟪w, a⟫_ℝ) hrep
  change ⟪w, z - P⟫_ℝ =
    ⟪w, t • ((p - P) + (q - P))⟫_ℝ at hinner
  rw [real_inner_smul_right, inner_add_right] at hinner
  have hsum : 0 < ⟪w, p - P⟫_ℝ + ⟪w, q - P⟫_ℝ := add_pos hp hq
  nlinarith [mul_pos hz hsum]

private theorem areaForm_sub_self (P x : ℝ²) :
    stdOrientation.areaForm (x - P) (x - P) = 0 := by
  have hfirst (z : ℝ²) :
      stdOrientation.areaForm (x - P) z =
        stdOrientation.areaForm x z - stdOrientation.areaForm P z := by
    exact congrArg (fun f : ℝ² →ₗ[ℝ] ℝ => f z)
      (stdOrientation.areaForm.map_sub x P)
  rw [map_sub, hfirst x, hfirst P]
  rw [stdOrientation.areaForm_swap x P]
  simp

private theorem inner_pos_of_positive_sum_direction
    {a b x : ℝ²} {radius t : ℝ}
    (hradius : 0 < radius)
    (ha : ‖a‖ = radius) (hb : ‖b‖ = radius) (hxnorm : ‖x‖ = radius)
    (ht : 0 < t) (hx : x = t • (a + b)) :
    0 < ⟪a, x⟫_ℝ := by
  have hxne : x ≠ 0 := by
    intro hzero
    rw [hzero, norm_zero] at hxnorm
    linarith
  have habne : a + b ≠ 0 := by
    intro hzero
    rw [hzero, smul_zero] at hx
    exact hxne hx
  have habinner : 0 < ⟪a + b, a + b⟫_ℝ := by
    rw [real_inner_self_eq_norm_sq]
    positivity
  have haa : ⟪a, a⟫_ℝ = radius ^ 2 := by
    rw [real_inner_self_eq_norm_sq, ha]
  have hbb : ⟪b, b⟫_ℝ = radius ^ 2 := by
    rw [real_inner_self_eq_norm_sq, hb]
  have hidentity : 2 * ⟪a, x⟫_ℝ = t * ⟪a + b, a + b⟫_ℝ := by
    simp only [hx, real_inner_smul_right, inner_add_right, inner_add_left]
    rw [real_inner_comm b a, haa, hbb]
    ring
  nlinarith [mul_pos ht habinner]

private theorem coefficient_lt_one_of_positive_sum_direction
    {a b x : ℝ²} {radius t : ℝ}
    (ha : ‖a‖ = radius) (hb : ‖b‖ = radius) (hxnorm : ‖x‖ = radius)
    (hab : 0 < ⟪a, b⟫_ℝ)
    (ht : 0 < t) (hx : x = t • (a + b)) :
    t < 1 := by
  have hxx : ⟪x, x⟫_ℝ = radius ^ 2 := by
    rw [real_inner_self_eq_norm_sq, hxnorm]
  have haa : ⟪a, a⟫_ℝ = radius ^ 2 := by
    rw [real_inner_self_eq_norm_sq, ha]
  have hbb : ⟪b, b⟫_ℝ = radius ^ 2 := by
    rw [real_inner_self_eq_norm_sq, hb]
  have hsum : ⟪a + b, a + b⟫_ℝ = 2 * radius ^ 2 + 2 * ⟪a, b⟫_ℝ := by
    rw [inner_add_left, inner_add_right, inner_add_right, real_inner_comm b a,
      haa, hbb]
    ring
  have hsum_gt : radius ^ 2 < ⟪a + b, a + b⟫_ℝ := by
    rw [hsum]
    nlinarith [sq_nonneg radius]
  have hscale : ⟪x, x⟫_ℝ = t ^ 2 * ⟪a + b, a + b⟫_ℝ := by
    rw [hx, real_inner_smul_left, real_inner_smul_right]
    ring
  by_contra hnot
  have htOne : 1 ≤ t := le_of_not_gt hnot
  have htSq : 1 ≤ t ^ 2 := by nlinarith
  have hsumNonneg : 0 ≤ ⟪a + b, a + b⟫_ℝ :=
    real_inner_self_nonneg
  have hmul : ⟪a + b, a + b⟫_ℝ ≤
      t ^ 2 * ⟪a + b, a + b⟫_ℝ := by
    simpa only [one_mul] using mul_le_mul_of_nonneg_right htSq hsumNonneg
  rw [← hscale, hxx] at hmul
  exact (not_lt_of_ge hmul) hsum_gt

private theorem inner_pos_of_nested_positive_sum_direction
    {a b x : ℝ²} {radius t : ℝ}
    (hradius : 0 < radius)
    (hb : ‖b‖ = radius)
    (hab : 0 < ⟪a, b⟫_ℝ)
    (ht : 0 < t) (hx : x = t • (a + b)) :
    0 < ⟪x, b⟫_ℝ := by
  have hbb : 0 < ⟪b, b⟫_ℝ := by
    rw [real_inner_self_eq_norm_sq, hb]
    positivity
  rw [hx, real_inner_smul_left, inner_add_left]
  nlinarith [mul_pos ht (add_pos hab hbb)]

/-- The signed-area conclusion used by the pentagon-order consumer.

The five equal-norm vectors are `u`, `v`, `d`, `x`, and `y`, translated so
that their common center is the origin.  The equations say that `x`, then
`v`, then `d` are positive directions of successive vector sums.  The point
`e` need not have the common norm: only its positive direction along
`d + y` is used. -/
theorem signedArea2_pentagonFan_same_sign
    {P u v d e x y : ℝ²} {radius tx tv td te : ℝ}
    (hradius : 0 < radius)
    (hu : ‖u - P‖ = radius) (hvnorm : ‖v - P‖ = radius)
    (hdnorm : ‖d - P‖ = radius) (hxnorm : ‖x - P‖ = radius)
    (hynorm : ‖y - P‖ = radius)
    (htx : 0 < tx) (htv : 0 < tv) (htd : 0 < td) (hte : 0 < te)
    (hx : x - P = tx • ((u - P) + (y - P)))
    (hv : v - P = tv • ((u - P) + (x - P)))
    (hd : d - P = td • ((v - P) + (x - P)))
    (he : e - P = te • ((d - P) + (y - P))) :
    (signedArea2 P u x < 0 → signedArea2 P x e < 0) ∧
      (0 < signedArea2 P u x → 0 < signedArea2 P x e) := by
  have huxInner : 0 < ⟪u - P, x - P⟫_ℝ :=
    inner_pos_of_positive_sum_direction hradius hu hynorm hxnorm htx hx
  have htvLt : tv < 1 :=
    coefficient_lt_one_of_positive_sum_direction hu hxnorm hvnorm
      huxInner htv hv
  have hvxInner : 0 < ⟪v - P, x - P⟫_ℝ :=
    inner_pos_of_nested_positive_sum_direction hradius hxnorm huxInner htv hv
  have htdLt : td < 1 :=
    coefficient_lt_one_of_positive_sum_direction hvnorm hxnorm hdnorm
      hvxInner htd hd
  have hproduct : td * tv < 1 := by nlinarith [mul_pos htd htv]
  have hfactor : 0 < te * (1 - td * tv) :=
    mul_pos hte (sub_pos.mpr hproduct)
  have harea :
      signedArea2 P x e =
        te * (1 - td * tv) * signedArea2 P u x := by
    rw [signedArea2_eq_stdOrientation_areaForm,
      signedArea2_eq_stdOrientation_areaForm]
    have hxy :
        stdOrientation.areaForm (x - P) (y - P) =
          stdOrientation.areaForm (u - P) (x - P) := by
      have h := congrArg
        (fun z : ℝ² => stdOrientation.areaForm (x - P) z) hx
      change stdOrientation.areaForm (x - P) (x - P) =
        stdOrientation.areaForm (x - P)
          (tx • ((u - P) + (y - P))) at h
      rw [map_smul, map_add] at h
      simp only [smul_eq_mul] at h
      have hself := areaForm_sub_self P x
      rw [hself] at h
      have hsum :
          stdOrientation.areaForm (x - P) (u - P) +
              stdOrientation.areaForm (x - P) (y - P) = 0 := by
        have htxne : tx ≠ 0 := ne_of_gt htx
        exact (mul_eq_zero.mp h.symm).resolve_left htxne
      rw [stdOrientation.areaForm_swap] at hsum
      linarith
    have hxv :
        stdOrientation.areaForm (x - P) (v - P) =
          -tv * stdOrientation.areaForm (u - P) (x - P) := by
      have hswap :
          stdOrientation.areaForm (x - P) (u - P) =
            -stdOrientation.areaForm (u - P) (x - P) :=
        stdOrientation.areaForm_swap _ _
      have hself := areaForm_sub_self P x
      calc
        _ = stdOrientation.areaForm (x - P)
              (tv • ((u - P) + (x - P))) := congrArg _ hv
        _ = tv * (stdOrientation.areaForm (x - P) (u - P) +
              stdOrientation.areaForm (x - P) (x - P)) := by
                rw [map_smul, map_add]
                rfl
        _ = tv * (stdOrientation.areaForm (x - P) (u - P) + 0) := by
              rw [hself]
        _ = _ := by rw [hswap]; ring
    have hxd :
        stdOrientation.areaForm (x - P) (d - P) =
          -(td * tv) * stdOrientation.areaForm (u - P) (x - P) := by
      have hself := areaForm_sub_self P x
      calc
        _ = stdOrientation.areaForm (x - P)
              (td • ((v - P) + (x - P))) := congrArg _ hd
        _ = td * (stdOrientation.areaForm (x - P) (v - P) +
              stdOrientation.areaForm (x - P) (x - P)) := by
                rw [map_smul, map_add]
                rfl
        _ = td * (stdOrientation.areaForm (x - P) (v - P) + 0) := by
              rw [hself]
        _ = _ := by rw [hxv]; ring
    calc
      _ = stdOrientation.areaForm (x - P)
            (te • ((d - P) + (y - P))) := congrArg _ he
      _ = te * (stdOrientation.areaForm (x - P) (d - P) +
            stdOrientation.areaForm (x - P) (y - P)) := by
              rw [map_smul, map_add]
              rfl
      _ = _ := by rw [hxd, hxy]; ring
  constructor
  · intro horient
    rw [harea]
    exact mul_neg_of_pos_of_neg hfactor horient
  · intro horient
    rw [harea]
    exact mul_pos hfactor horient

end CocircularPentagonOrder
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CocircularPentagonOrder

/-!
# Co-radial pentagon distance ladder

This module records the coordinate-free part of the nested pentagon fan.  A
common strict half-plane makes the three bisector coefficients positive; equal
radius then makes the nested `tv`/`td` coefficients strictly less than one.  The result is a
strict multiplicative ladder, with no angular coordinates or wrap convention.
-/

open scoped EuclideanGeometry InnerProductSpace RealInnerProductSpace

namespace Problem97
namespace CocircularPentagonDistanceLadder

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
  have hidentity :
      2 * ⟪a, x⟫_ℝ = t * ⟪a + b, a + b⟫_ℝ := by
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
  have hsum :
      ⟪a + b, a + b⟫_ℝ = 2 * radius ^ 2 + 2 * ⟪a, b⟫_ℝ := by
    rw [inner_add_left, inner_add_right, inner_add_right, real_inner_comm b a,
      haa, hbb]
    ring
  have hsum_gt : radius ^ 2 < ⟪a + b, a + b⟫_ℝ := by
    rw [hsum]
    nlinarith [sq_nonneg radius]
  have hscale :
      ⟪x, x⟫_ℝ = t ^ 2 * ⟪a + b, a + b⟫_ℝ := by
    rw [hx, real_inner_smul_left, real_inner_smul_right]
    ring
  by_contra hnot
  have htOne : 1 ≤ t := le_of_not_gt hnot
  have htSq : 1 ≤ t ^ 2 := by nlinarith
  have hsumNonneg : 0 ≤ ⟪a + b, a + b⟫_ℝ := real_inner_self_nonneg
  have hmul :
      ⟪a + b, a + b⟫_ℝ ≤ t ^ 2 * ⟪a + b, a + b⟫_ℝ := by
    simpa only [one_mul] using mul_le_mul_of_nonneg_right htSq hsumNonneg
  rw [← hscale, hxx] at hmul
  exact (not_lt_of_ge hmul) hsum_gt

/-- The three nested positive bisector parameters form a strict ladder.

The hypotheses are the five co-radial norm equalities, a common strict
half-plane through `P`, and the three nested sum-direction representations.
The conclusion is the practical radius-free order data used by later fan
consumers: the nested coefficients `tv` and `td` are in `(0,1)`, while the
outer coefficient `tx` is positive, and `td * tv < tv < 1`.

No upper bound on `tx` is asserted: positivity in one open half-plane does not
force the angle between `u - P` and `y - P` to be acute.
-/
theorem strict_nested_parameter_ladder
    {P u v d x y w : ℝ²} {radius tx tv td : ℝ}
    (hradius : 0 < radius)
    (hu : ‖u - P‖ = radius) (hv : ‖v - P‖ = radius)
    (hd : ‖d - P‖ = radius) (hxnorm : ‖x - P‖ = radius)
    (hy : ‖y - P‖ = radius)
    (hwu : 0 < ⟪w, u - P⟫_ℝ) (hwv : 0 < ⟪w, v - P⟫_ℝ)
    (hwd : 0 < ⟪w, d - P⟫_ℝ) (hwx : 0 < ⟪w, x - P⟫_ℝ)
    (hwy : 0 < ⟪w, y - P⟫_ℝ)
    (hxrep : x - P = tx • ((u - P) + (y - P)))
    (hvrep : v - P = tv • ((u - P) + (x - P)))
    (hdrep : d - P = td • ((v - P) + (x - P))) :
    0 < tx ∧ 0 < tv ∧ tv < 1 ∧ 0 < td ∧ td < 1 ∧
      0 < td * tv ∧ td * tv < tv := by
  have htx : 0 < tx :=
    CocircularPentagonOrder.positive_parameter_of_strict_halfplane
      hwu hwy hwx hxrep
  have htv : 0 < tv :=
    CocircularPentagonOrder.positive_parameter_of_strict_halfplane
      hwu hwx hwv hvrep
  have htd : 0 < td :=
    CocircularPentagonOrder.positive_parameter_of_strict_halfplane
      hwv hwx hwd hdrep
  have hux : 0 < ⟪u - P, x - P⟫_ℝ :=
    inner_pos_of_positive_sum_direction hradius hu hy hxnorm
      htx hxrep
  have htv_lt : tv < 1 :=
    coefficient_lt_one_of_positive_sum_direction hu hxnorm hv hux htv hvrep
  have hxx_pos : 0 < ⟪x - P, x - P⟫_ℝ := by
    rw [real_inner_self_eq_norm_sq, hxnorm]
    positivity
  have hvx : 0 < ⟪v - P, x - P⟫_ℝ := by
    rw [hvrep, real_inner_smul_left, inner_add_left]
    nlinarith [mul_pos htv (add_pos hux hxx_pos)]
  have htd_lt : td < 1 :=
    coefficient_lt_one_of_positive_sum_direction hv hxnorm hd hvx htd hdrep
  have hprod_pos : 0 < td * tv := mul_pos htd htv
  have hprod_lt : td * tv < tv := by
    nlinarith [mul_pos htv (sub_pos.mpr htd_lt)]
  exact ⟨htx, htv, htv_lt, htd, htd_lt, hprod_pos, hprod_lt⟩

end CocircularPentagonDistanceLadder
end Problem97

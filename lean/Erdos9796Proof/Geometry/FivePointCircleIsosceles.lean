/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.Analysis.Convex.Segment
import Mathlib.Analysis.InnerProductSpace.PiL2

/-!
# A five-point circle/isosceles crossing obstruction

This file contains the ambient geometric core of the five-point obstruction
used elsewhere in the Problem 97 development.  It has no finite-cardinality,
row-pattern, or Problem 97 hypotheses.

If `F`, `X`, and `Z` lie on a circle centered at `W`, while `P`, `X`, and `Z`
form an isosceles triangle with equal sides at `Z`, then a proper crossing of
`F-X` and `P-Z` is incompatible with the two strict chord-side conditions
recorded by the signed areas.  The proof is an inner-product argument: the
circle order makes `⟪F-X, Z-X⟫` negative, whereas the isosceles equality and
the crossing make the same inner product positive.

The theorem is stated over `EuclideanSpace ℝ (Fin 2)` so it can be reused by
geometric developments that do not import the P97 vocabulary.
-/

open scoped InnerProductSpace

namespace Erdos9796Proof
namespace Geometry

abbrev Plane := EuclideanSpace ℝ (Fin 2)

/-- The oriented twice-area of the triangle `(v, vj, vk)`. -/
noncomputable def signedArea2 (v vj vk : Plane) : ℝ :=
  (vj 0 - v 0) * (vk 1 - v 1) - (vk 0 - v 0) * (vj 1 - v 1)

/-- On a common circle, the chord inner product is twice the midpoint
inner product. -/
theorem inner_chord_eq_two_mul_inner_midpoint
    {O c x y : Plane}
    (hxO : ‖x - O‖ = ‖c - O‖) (hyO : ‖y - O‖ = ‖c - O‖) :
    ⟪x - c, y - c⟫_ℝ =
      2 * ⟪midpoint ℝ x y - O, midpoint ℝ x y - c⟫_ℝ := by
  have hXsq : ⟪x - O, x - O⟫_ℝ = ⟪c - O, c - O⟫_ℝ := by
    rw [real_inner_self_eq_norm_sq, real_inner_self_eq_norm_sq, hxO]
  have hYsq : ⟪y - O, y - O⟫_ℝ = ⟪c - O, c - O⟫_ℝ := by
    rw [real_inner_self_eq_norm_sq, real_inner_self_eq_norm_sq, hyO]
  have hmid : midpoint ℝ x y = (1 / 2 : ℝ) • (x + y) := by
    rw [midpoint_eq_smul_add]
    congr 1
    norm_num
  rw [hmid]
  have hLHS : ⟪x - c, y - c⟫_ℝ =
      ⟪x, y⟫_ℝ - ⟪x, c⟫_ℝ - ⟪y, c⟫_ℝ + ⟪c, c⟫_ℝ := by
    rw [inner_sub_left, inner_sub_right, inner_sub_right, real_inner_comm c y]
    ring
  have hRHS : ⟪(1 / 2 : ℝ) • (x + y) - O,
        (1 / 2 : ℝ) • (x + y) - c⟫_ℝ =
      (1 / 4 : ℝ) *
          (⟪x, x⟫_ℝ + ⟪x, y⟫_ℝ + ⟪y, x⟫_ℝ + ⟪y, y⟫_ℝ)
        - (1 / 2 : ℝ) * (⟪x, c⟫_ℝ + ⟪y, c⟫_ℝ)
        - (1 / 2 : ℝ) * (⟪O, x⟫_ℝ + ⟪O, y⟫_ℝ)
        + ⟪O, c⟫_ℝ := by
    rw [inner_sub_left, inner_sub_right, inner_sub_right,
      real_inner_smul_left, real_inner_smul_left, real_inner_smul_right,
      real_inner_smul_right, inner_add_left, inner_add_left,
      inner_add_right, inner_add_right, inner_add_right]
    ring
  rw [hLHS, hRHS]
  have hXexp : ⟪x - O, x - O⟫_ℝ =
      ⟪x, x⟫_ℝ - ⟪x, O⟫_ℝ - ⟪O, x⟫_ℝ + ⟪O, O⟫_ℝ := by
    rw [inner_sub_left, inner_sub_right, inner_sub_right]
    ring
  have hYexp : ⟪y - O, y - O⟫_ℝ =
      ⟪y, y⟫_ℝ - ⟪y, O⟫_ℝ - ⟪O, y⟫_ℝ + ⟪O, O⟫_ℝ := by
    rw [inner_sub_left, inner_sub_right, inner_sub_right]
    ring
  have hCexp : ⟪c - O, c - O⟫_ℝ =
      ⟪c, c⟫_ℝ - ⟪c, O⟫_ℝ - ⟪O, c⟫_ℝ + ⟪O, O⟫_ℝ := by
    rw [inner_sub_left, inner_sub_right, inner_sub_right]
    ring
  rw [hXexp, hCexp] at hXsq
  rw [hYexp, hCexp] at hYsq
  have hyx : ⟪y, x⟫_ℝ = ⟪x, y⟫_ℝ := real_inner_comm x y
  have hxO_sym : ⟪x, O⟫_ℝ = ⟪O, x⟫_ℝ := real_inner_comm O x
  have hyO_sym : ⟪y, O⟫_ℝ = ⟪O, y⟫_ℝ := real_inner_comm O y
  have hcO_sym : ⟪c, O⟫_ℝ = ⟪O, c⟫_ℝ := real_inner_comm O c
  rw [hxO_sym, hcO_sym] at hXsq
  rw [hyO_sym, hcO_sym] at hYsq
  linarith [hyx]

/--
The circle and isosceles equalities are incompatible with the strict
chord-side condition and a proper crossing of `F-X` with `P-Z`.
-/
theorem fivePointCircleIsoscelesOrder
    {W F P X Z : Plane}
    (hFZ : F ≠ Z) (hPX : P ≠ X) (hXZ : X ≠ Z)
    (hWF_WX : dist W F = dist W X)
    (hWF_WZ : dist W F = dist W Z)
    (hPZ_XZ : dist P Z = dist X Z)
    (hside : signedArea2 W F Z * signedArea2 X F Z < 0)
    (hcross : ∃ q : Plane,
      q ∈ openSegment ℝ F X ∧ q ∈ openSegment ℝ P Z) :
    False := by
  have hFW_XW : ‖F - W‖ = ‖X - W‖ := by
    simpa only [dist_eq_norm, norm_sub_rev] using hWF_WX
  have hZW_XW : ‖Z - W‖ = ‖X - W‖ := by
    simpa only [dist_eq_norm, norm_sub_rev] using hWF_WZ.symm.trans hWF_WX
  have hFW_ZW_sq : ‖F - W‖ ^ 2 = ‖Z - W‖ ^ 2 := by
    rw [hFW_XW, hZW_XW]
  have hZF_sq_pos : 0 < ‖Z - F‖ ^ 2 := by
    exact sq_pos_of_pos (norm_pos_iff.mpr (sub_ne_zero.mpr hFZ.symm))
  have hmidpoint_neg :
      ⟪midpoint ℝ F Z - W, midpoint ℝ F Z - X⟫_ℝ < 0 := by
    have hbridge :
        ⟪midpoint ℝ F Z - X, midpoint ℝ F Z - W⟫_ℝ * ‖Z - F‖ ^ 2 =
          signedArea2 W F Z * signedArea2 X F Z := by
      have norm_sub_sq : ∀ (x y : Plane),
          ‖x - y‖ ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := fun x y => by
        rw [EuclideanSpace.norm_sq_eq]
        simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]
      have inner_eq : ∀ (a b : Plane),
          ⟪a, b⟫_ℝ = a 0 * b 0 + a 1 * b 1 := fun a b => by
        rw [PiLp.inner_apply]
        simp [Fin.sum_univ_two, mul_comm (a _) (b _)]
      have hmid : ∀ i : Fin 2,
          (midpoint ℝ F Z) i = ((F i + Z i) : ℝ) / 2 := by
        intro i
        rw [midpoint_eq_smul_add]
        simp [PiLp.smul_apply, PiLp.add_apply, invOf_eq_inv]
        ring
      rw [norm_sub_sq F W, norm_sub_sq Z W] at hFW_ZW_sq
      rw [norm_sub_sq Z F, inner_eq]
      simp only [signedArea2, PiLp.sub_apply, hmid]
      set a := F 0
      set b := F 1
      set c := Z 0
      set d := Z 1
      set p := X 0
      set q := X 1
      linear_combination (1 / 2 : ℝ) *
        (((a + c) / 2 - p) * (a - c) + ((b + d) / 2 - q) * (b - d)) *
          hFW_ZW_sq
    have hproduct_neg :
        ⟪midpoint ℝ F Z - X, midpoint ℝ F Z - W⟫_ℝ * ‖Z - F‖ ^ 2 < 0 := by
      rw [hbridge]
      exact hside
    have hinner_neg :
        ⟪midpoint ℝ F Z - X, midpoint ℝ F Z - W⟫_ℝ < 0 := by
      nlinarith
    simpa only [real_inner_comm] using hinner_neg
  have hFXZ_neg : ⟪F - X, Z - X⟫_ℝ < 0 := by
    rw [inner_chord_eq_two_mul_inner_midpoint hFW_XW hZW_XW]
    nlinarith
  have hPXZ_pos : 0 < ⟪P - X, Z - X⟫_ℝ := by
    have hdist_sq := congrArg (fun r : ℝ => r ^ 2) hPZ_XZ
    change dist P Z ^ 2 = dist X Z ^ 2 at hdist_sq
    have hrewrite_left : P - Z = (P - X) - (Z - X) := by abel
    have hrewrite_right : X - Z = -(Z - X) := by abel
    rw [dist_eq_norm, dist_eq_norm, hrewrite_left, hrewrite_right, norm_neg,
      norm_sub_pow_two_real] at hdist_sq
    have hPX_sq_pos : 0 < ‖P - X‖ ^ 2 := by
      exact sq_pos_of_pos (norm_pos_iff.mpr (sub_ne_zero.mpr hPX))
    nlinarith
  obtain ⟨q, hqFX, hqPZ⟩ := hcross
  rw [openSegment_eq_image_lineMap] at hqFX hqPZ
  rcases hqFX with ⟨t, ht, rfl⟩
  rcases hqPZ with ⟨s, hs, hline⟩
  have hqX_from_FX :
      AffineMap.lineMap F X t - X = (1 - t) • (F - X) := by
    simp [AffineMap.lineMap_apply_module']
    module
  have hinner_q_neg :
      ⟪AffineMap.lineMap F X t - X, Z - X⟫_ℝ < 0 := by
    rw [hqX_from_FX, real_inner_smul_left]
    exact mul_neg_of_pos_of_neg (sub_pos.mpr ht.2) hFXZ_neg
  have hqX_from_PZ :
      AffineMap.lineMap F X t - X =
        (1 - s) • (P - X) + s • (Z - X) := by
    rw [← hline]
    simp [AffineMap.lineMap_apply_module']
    module
  have hZX_sq_pos : 0 < ‖Z - X‖ ^ 2 := by
    exact sq_pos_of_pos (norm_pos_iff.mpr (sub_ne_zero.mpr hXZ.symm))
  rw [hqX_from_PZ, inner_add_left, real_inner_smul_left,
    real_inner_smul_left, real_inner_self_eq_norm_sq] at hinner_q_neg
  have hfirst_pos : 0 < (1 - s) * ⟪P - X, Z - X⟫_ℝ :=
    mul_pos (sub_pos.mpr hs.2) hPXZ_pos
  have hsecond_pos : 0 < s * ‖Z - X‖ ^ 2 :=
    mul_pos hs.1 hZX_sq_pos
  linarith

#print axioms fivePointCircleIsoscelesOrder

end Geometry
end Erdos9796Proof

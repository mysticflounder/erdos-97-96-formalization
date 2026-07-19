/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Cap.ArcInteriorPoints
import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Five-point circle-isosceles order core

This file packages the following arbitrary-cardinality obstruction. Suppose
`W,F,P,X,Z` are vertices in that cyclic order, `F,X,Z` lie on one circle
centered at `W`, and the triangle `P,X,Z` is isosceles with equal sides at
`Z`. The diagonals `F-X` and `P-Z` cross. The circle order makes the angle
`F-X-Z` obtuse, whereas the isosceles equality and the diagonal crossing make
the same inner product positive.

The equality-closure wrapper is independent of any finite 555/654 census.
It consumes only two rows, two strict orientation facts, and a proper diagonal
intersection. It does not assert that a live carrier produces one of the
banked finite patterns.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97
namespace Census554
namespace FivePointCircleIsoscelesOrderCore

open EqualityCore

/-- The metric equalities used by the five-point obstruction. The first row
is centered at `W` and contains `F,X,Z`; the second is centered at `Z` and
contains `P,X`. -/
structure Core {alpha : Type*} (R : RowPattern alpha) where
  W : alpha
  F : alpha
  P : alpha
  X : alpha
  Z : alpha
  hFZ : F ≠ Z
  hPX : P ≠ X
  hXZ : X ≠ Z
  WF_WX : EdgeClosure R (W, F) (W, X)
  WF_WZ : EdgeClosure R (W, F) (W, Z)
  PZ_XZ : EdgeClosure R (P, Z) (X, Z)

/-- The circle and isosceles equalities are incompatible with the strict
chord-side condition and the proper crossing of `F-X` with `P-Z`. -/
theorem metric_order_incompatibility
    {W F P X Z : ℝ²}
    (hFZ : F ≠ Z) (hPX : P ≠ X) (hXZ : X ≠ Z)
    (hWF_WX : dist W F = dist W X)
    (hWF_WZ : dist W F = dist W Z)
    (hPZ_XZ : dist P Z = dist X Z)
    (hside : signedArea2 W F Z * signedArea2 X F Z < 0)
    (hcross : ∃ q : ℝ²,
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
    have hbridge :=
      inner_midpoint_eq_signedArea_prod_of_chord_sphere F Z X W hFW_ZW_sq
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

/-- A realized equality-closure core is contradictory under the geometric
order hypotheses. -/
theorem false_of_core
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hside :
      signedArea2 (pointOf core.W) (pointOf core.F) (pointOf core.Z) *
          signedArea2 (pointOf core.X) (pointOf core.F) (pointOf core.Z) < 0)
    (hcross : ∃ q : ℝ²,
      q ∈ openSegment ℝ (pointOf core.F) (pointOf core.X) ∧
      q ∈ openSegment ℝ (pointOf core.P) (pointOf core.Z)) :
    False := by
  apply metric_order_incompatibility
    (hreal.injective.ne core.hFZ) (hreal.injective.ne core.hPX)
    (hreal.injective.ne core.hXZ)
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.WF_WX
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.WF_WZ
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.PZ_XZ
  · exact hside
  · exact hcross

/-- Negative-orientation form used by the live convex-boundary convention.
The two negative turns put `W` and `X` on opposite sides of the chord `F-Z`. -/
theorem false_of_core_of_neg
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hWFZ :
      signedArea2 (pointOf core.W) (pointOf core.F) (pointOf core.Z) < 0)
    (hFXZ :
      signedArea2 (pointOf core.F) (pointOf core.X) (pointOf core.Z) < 0)
    (hcross : ∃ q : ℝ²,
      q ∈ openSegment ℝ (pointOf core.F) (pointOf core.X) ∧
      q ∈ openSegment ℝ (pointOf core.P) (pointOf core.Z)) :
    False := by
  apply false_of_core hreal core
  · have hswap :
        signedArea2 (pointOf core.X) (pointOf core.F) (pointOf core.Z) =
          -signedArea2 (pointOf core.F) (pointOf core.X) (pointOf core.Z) := by
      simp only [signedArea2]
      ring
    rw [hswap]
    exact mul_neg_of_neg_of_pos hWFZ (neg_pos.mpr hFXZ)
  · exact hcross

#print axioms metric_order_incompatibility
#print axioms false_of_core
#print axioms false_of_core_of_neg

end FivePointCircleIsoscelesOrderCore
end Census554
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ConvexIndepHelpers
import Erdos9796Proof.P97.OangleBridge
import Erdos9796Proof.P97.SevenPointThreeRhombus
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Affine kernel for the nine-hit row pattern

This file records the source-neutral affine obstruction found in the active
five-role CEGAR lane.  The metric input is only equal-radius membership in
three selected rows; no cyclic order or finite-cardinality argument is used.
The two rhombus midpoint identities force `2 a = b + e`, so the three
distinct carrier points `a,b,e` are collinear.

The theorem is intentionally kept separate from the live frontier aggregate
until a producer supplies this exact row pattern.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open SevenPointThreeRhombus

/-- Two equal-radius circles through two distinct common points have the
parallelogram midpoint identity for their centers and common points. -/
theorem equal_radius_two_circle_opposite_sum
    {a b x y : ℝ²} {r : ℝ}
    (hab : a ≠ b) (hxy : x ≠ y)
    (hax : dist a x = r) (hay : dist a y = r)
    (hbx : dist b x = r) (hby : dist b y = r) :
    a + b = x + y := by
  apply opposite_sum_eq_of_equal_sided_four_cycle hab hxy
  · calc
      dist a x = r := hax
      _ = dist x b := hbx.symm.trans (dist_comm _ _)
  · calc
      dist x b = r := (dist_comm x b).trans hbx
      _ = dist b y := hby.symm
  · calc
      dist b y = r := hby
      _ = dist y a := hay.symm.trans (dist_comm _ _)

/-- The nine selected-row memberships

`row(a) ⊇ {b,c,d,e}`, `row(c) ⊇ {a,b,d}`, and
`row(e) ⊇ {a,d}`

are impossible on a convex-independent carrier when the named points are
distinct.  The first four points form one equal-sided quadrilateral and
`c,a,e,d` form a second one; their midpoint identities imply that `a,b,e`
are collinear. -/
theorem false_of_nine_hit_affine_pattern
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {a b c d e : ℝ²}
    (ha : a ∈ A) (hb : b ∈ A) (he : e ∈ A)
    (hab_ne : a ≠ b) (hac_ne : a ≠ c) (had_ne : a ≠ d)
    (hae_ne : a ≠ e) (hbd_ne : b ≠ d) (hce_ne : c ≠ e)
    (hbe_ne : b ≠ e)
    (hab_ac : dist a b = dist a c)
    (hac_ad : dist a c = dist a d)
    (had_ae : dist a d = dist a e)
    (hca_cb : dist c a = dist c b)
    (hcb_cd : dist c b = dist c d)
    (hea_ed : dist e a = dist e d) :
    False := by
  have h₁ : a + c = b + d := by
    apply opposite_sum_eq_of_equal_sided_four_cycle hac_ne hbd_ne
    · calc
        dist a b = dist a c := hab_ac
        _ = dist c a := dist_comm _ _
        _ = dist c b := hca_cb
        _ = dist b c := dist_comm _ _
    · calc
        dist b c = dist c b := dist_comm _ _
        _ = dist c d := hcb_cd
    · calc
        dist c d = dist c b := hcb_cd.symm
        _ = dist c a := hca_cb.symm
        _ = dist a c := dist_comm _ _
        _ = dist a d := hac_ad
        _ = dist d a := dist_comm _ _
  have h₂ : c + e = a + d := by
    apply opposite_sum_eq_of_equal_sided_four_cycle hce_ne had_ne
    · calc
        dist c a = dist a c := dist_comm _ _
        _ = dist a d := hac_ad
        _ = dist a e := had_ae
    · calc
        dist a e = dist e a := dist_comm _ _
        _ = dist e d := hea_ed
    · calc
        dist e d = dist e a := hea_ed.symm
        _ = dist a e := dist_comm _ _
        _ = dist a d := had_ae.symm
        _ = dist a c := hac_ad.symm
        _ = dist c a := dist_comm _ _
        _ = dist c b := hca_cb
        _ = dist c d := hcb_cd
        _ = dist d c := dist_comm _ _
  have h₁₀ := congrArg (fun p : ℝ² => p 0) h₁
  have h₁₁ := congrArg (fun p : ℝ² => p 1) h₁
  have h₂₀ := congrArg (fun p : ℝ² => p 0) h₂
  have h₂₁ := congrArg (fun p : ℝ² => p 1) h₂
  have he0 : e 0 = 2 * a 0 - b 0 := by
    dsimp at h₁₀ h₂₀ ⊢
    linarith
  have he1 : e 1 = 2 * a 1 - b 1 := by
    dsimp at h₁₁ h₂₁ ⊢
    linarith
  have hzero : signedArea2 a b e = 0 := by
    simp only [signedArea2]
    rw [he0, he1]
    ring
  exact hA.not_three_collinear ha hb he hab_ne hae_ne hbe_ne
    ((signedArea2_eq_zero_iff_collinear a b e).1 hzero)

/-- Selected-four-class form of `false_of_nine_hit_affine_pattern`.  This is
the direct adapter from row supports to the six equal-distance hypotheses;
the row centers need not themselves be selected witnesses. -/
theorem false_of_nine_selected_four_classes_affine_pattern
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {a b c d e : ℝ²}
    (ARow : SelectedFourClass A a)
    (CRow : SelectedFourClass A c)
    (ERow : SelectedFourClass A e)
    (ha : a ∈ A) (hb : b ∈ A) (he : e ∈ A)
    (hab_ne : a ≠ b) (hac_ne : a ≠ c) (had_ne : a ≠ d)
    (hae_ne : a ≠ e) (hbd_ne : b ≠ d) (hce_ne : c ≠ e)
    (hbe_ne : b ≠ e)
    (hbA : b ∈ ARow.support) (hcA : c ∈ ARow.support)
    (hdA : d ∈ ARow.support) (heA : e ∈ ARow.support)
    (haC : a ∈ CRow.support) (hbC : b ∈ CRow.support)
    (hdC : d ∈ CRow.support)
    (haE : a ∈ ERow.support) (hdE : d ∈ ERow.support) :
    False := by
  apply false_of_nine_hit_affine_pattern hA ha hb he hab_ne hac_ne had_ne
    hae_ne hbd_ne hce_ne hbe_ne
  · exact (ARow.support_eq_radius b hbA).trans
      (ARow.support_eq_radius c hcA).symm
  · exact (ARow.support_eq_radius c hcA).trans
      (ARow.support_eq_radius d hdA).symm
  · exact (ARow.support_eq_radius d hdA).trans
      (ARow.support_eq_radius e heA).symm
  · exact (CRow.support_eq_radius a haC).trans
      (CRow.support_eq_radius b hbC).symm
  · exact (CRow.support_eq_radius b hbC).trans
      (CRow.support_eq_radius d hdC).symm
  · exact (ERow.support_eq_radius a haE).trans
      (ERow.support_eq_radius d hdE).symm

end ATailFrontierLiveClosure
end Problem97

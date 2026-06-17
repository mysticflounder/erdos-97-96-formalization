import Erdos9796Proof.P97.Foundation
import Erdos9796Proof.P97.U2WitnessReflectionKernel

/-!
# N4d q'=E Family-B Track-B pilot support

Small exact geometry kernels for the Track-B Family-B pilot described in
`docs/n-lane/97-n4d-qeqe-familyB-trackB-pilot-2026-06-03.md`.

The first repeated free-`rb` pilot family has `Sb₂ ⊇ {v₁, v₃, a₂}` and, in the
cleanest representative `i=606`, also `Sa₂ ⊇ {v₁, a₁}` with the pinned
`|a₂v₁| = 1`. That gives two circles with common points `v₁` and `a₁`:

* `circle(a₂, 1)`,
* `circle(b₂, rb)`.

This file packages the exact consequences already available in the general
two-circle/reflection kernels:

* any third common point distinct from `v₁` is forced to be `a₁`;
* the midpoint of `v₁a₁` lies on the line through `a₂,b₂`;
* equivalently, `a₁` is the reflection of `v₁` across that line in the
  signed-area sense.

These lemmas do not close the Track-B pilot on their own. They are the exact
circle-intersection normalization that the next `i=606` disk/sign reduction
should consume.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97

/-- Squared-distance coordinates in `ℝ²`. -/
private theorem trackB_dist_sq_coords (X Y : ℝ²) :
    dist X Y ^ 2 = (X 0 - Y 0) ^ 2 + (X 1 - Y 1) ^ 2 := by
  rw [dist_eq_norm, EuclideanSpace.norm_sq_eq]
  simp [Fin.sum_univ_two, PiLp.sub_apply, Real.norm_eq_abs, sq_abs]

/-- Shared scalar extraction for the Track-B pilot:
`a₂x = 1 - s²/2`, `a₂` lies on the unit circle, and `v₃` lies on
`circle(v₂,s)`. -/
private theorem trackB_shared_scalar_pins
    (v₁ v₂ v₃ a₂ : ℝ²) (s : ℝ)
    (h1x : v₁ 0 = 0) (h1y : v₁ 1 = 0) (h2x : v₂ 0 = 1) (h2y : v₂ 1 = 0)
    (ha2v1 : dist a₂ v₁ = 1) (ha2v2 : dist a₂ v₂ = s) (hv3v2 : dist v₃ v₂ = s) :
    a₂ 0 = 1 - s ^ 2 / 2 ∧ (a₂ 0) ^ 2 + (a₂ 1) ^ 2 = 1 ∧
      (v₃ 0 - 1) ^ 2 + (v₃ 1) ^ 2 = s ^ 2 := by
  have hcirc : (a₂ 0) ^ 2 + (a₂ 1) ^ 2 = 1 := by
    have h := trackB_dist_sq_coords a₂ v₁
    rw [ha2v1, h1x, h1y] at h
    norm_num at h
    linarith [h]
  have ha2v2sq : (a₂ 0 - 1) ^ 2 + (a₂ 1) ^ 2 = s ^ 2 := by
    have h := trackB_dist_sq_coords a₂ v₂
    rw [ha2v2, h2x, h2y] at h
    linarith [h]
  have hv3v2sq : (v₃ 0 - 1) ^ 2 + (v₃ 1) ^ 2 = s ^ 2 := by
    have h := trackB_dist_sq_coords v₃ v₂
    rw [hv3v2, h2x, h2y] at h
    linarith [h]
  have hax : a₂ 0 = 1 - s ^ 2 / 2 := by
    nlinarith [hcirc, ha2v2sq]
  exact ⟨hax, hcirc, hv3v2sq⟩

/-- **Track-B shared-`v₁` second-intersection normalization.**

If `v₁` and `a₁` are two distinct common points of the circles centered at
`a₂` and `b₂`, then every other common point `w` distinct from `v₁` is forced to
equal `a₁`. This is the exact "second intersection" form the `i=606` pilot
consumes. -/
theorem qEqE_b2_familyB_sharedV1_secondIntersection_eq
    {a₂ b₂ v₁ a₁ w : ℝ²} {rb : ℝ}
    (hcirc : (⟨a₂, (1 : ℝ)⟩ : Sphere ℝ²) ≠ ⟨b₂, rb⟩)
    (hv₁a₁ : v₁ ≠ a₁)
    (hv₁a₂ : dist v₁ a₂ = 1) (ha₁a₂ : dist a₁ a₂ = 1)
    (hv₁b₂ : dist v₁ b₂ = rb) (ha₁b₂ : dist a₁ b₂ = rb)
    (hwa₂ : dist w a₂ = 1) (hwb₂ : dist w b₂ = rb)
    (hwv₁ : w ≠ v₁) :
    w = a₁ := by
  exact two_circle_third_point_eq hcirc hv₁a₁
    hv₁a₂ ha₁a₂ hv₁b₂ ha₁b₂ hwa₂ hwb₂ hwv₁

/-- **Track-B shared-`v₁` midpoint collinearity.**

If `v₁` and `a₁` are distinct common points of the circles centered at `a₂` and
`b₂`, then the midpoint of `v₁a₁` lies on the line through `a₂,b₂`. -/
theorem qEqE_b2_familyB_sharedV1_midpoint_collinear
    {a₂ b₂ v₁ a₁ : ℝ²} {rb : ℝ}
    (hv₁a₂ : dist v₁ a₂ = 1) (ha₁a₂ : dist a₁ a₂ = 1)
    (hv₁b₂ : dist v₁ b₂ = rb) (ha₁b₂ : dist a₁ b₂ = rb)
    (ha₁v₁ : a₁ ≠ v₁) :
    signedArea2 (midpoint ℝ v₁ a₁) a₂ b₂ = 0 := by
  exact twoCircle_midpoint_collinear ha₁a₂ hv₁a₂ ha₁b₂ hv₁b₂ ha₁v₁

/-- **Track-B shared-`v₁` reflection relation.**

Under the same two-circle hypotheses, `a₁` is the reflection of `v₁` across the
line through `a₂,b₂` in the signed-area sense:

`signedArea2 a₁ a₂ b₂ = - signedArea2 v₁ a₂ b₂`. -/
theorem qEqE_b2_familyB_sharedV1_signedArea_reflection
    {a₂ b₂ v₁ a₁ : ℝ²} {rb : ℝ}
    (hv₁a₂ : dist v₁ a₂ = 1) (ha₁a₂ : dist a₁ a₂ = 1)
    (hv₁b₂ : dist v₁ b₂ = rb) (ha₁b₂ : dist a₁ b₂ = rb)
    (ha₁v₁ : a₁ ≠ v₁) :
    signedArea2 a₁ a₂ b₂ = - signedArea2 v₁ a₂ b₂ := by
  exact signedArea2_reflection_neg
    (q := a₂) (v2 := b₂) (y := v₁) (u := a₁)
    (qEqE_b2_familyB_sharedV1_midpoint_collinear hv₁a₂ ha₁a₂ hv₁b₂ ha₁b₂ ha₁v₁)

private theorem trackB_lt_of_sq_lt_sq_of_nonneg
    {a b : ℝ} (hsq : a ^ 2 < b ^ 2) (hb : 0 < b) (ha : 0 ≤ a) :
    a < b := by
  nlinarith

set_option maxHeartbeats 400000 in
-- The scalar sign reduction expands two explicit polynomial identities before the
-- final sign argument; 400000 heartbeats is enough to keep that local elaboration stable.
private theorem trackB_sharedTriple_circumcenter_below_axis_scalar
    (X Y A B v s : ℝ)
    (hs0 : 0 < s) (hs1 : s < 1)
    (hqgt1 : 1 < X ^ 2 + Y ^ 2)
    (hs2 : (X - 1) ^ 2 + Y ^ 2 = s ^ 2)
    (ha2x : A = 1 - s ^ 2 / 2)
    (ha2circ : A ^ 2 + B ^ 2 = 1)
    (hBpos : 0 < B) (hYpos : 0 < Y)
    (hlin : (X * B - A * Y) * v = X / 2 - (X ^ 2 + Y ^ 2) * A / 2) :
    v < 0 := by
  have hqdif : X ^ 2 + Y ^ 2 - s ^ 2 = 2 * X - 1 := by
    nlinarith [hs2]
  have hsq1 : s ^ 2 < 1 := by
    nlinarith [sq_nonneg (1 - s), hs0, hs1]
  have hrhs_neg : X / 2 - (X ^ 2 + Y ^ 2) * A / 2 < 0 := by
    have hid :
        X / 2 - (X ^ 2 + Y ^ 2) * A / 2 =
          -((1 - s ^ 2) * ((X ^ 2 + Y ^ 2) - 1)) / 4 := by
      rw [ha2x]
      ring_nf
      nlinarith [hqdif]
    have hfacpos : 0 < (1 - s ^ 2) * ((X ^ 2 + Y ^ 2) - 1) := by
      nlinarith [hqgt1, hsq1]
    nlinarith [hid, hfacpos]
  have hcoefsq : 0 < (X * B) ^ 2 - (A * Y) ^ 2 := by
    have hid :
        (X * B) ^ 2 - (A * Y) ^ 2 =
          (((X ^ 2 + Y ^ 2) - 1) * ((X ^ 2 + Y ^ 2) - (1 - s ^ 2) ^ 2)) / 4 := by
      rw [ha2x] at ha2circ ⊢
      ring_nf at ha2circ ⊢
      nlinarith [ha2circ, hqdif]
    have hsmall : (1 - s ^ 2) ^ 2 < 1 := by
      nlinarith [hsq1]
    have hq1 : 0 < (X ^ 2 + Y ^ 2) - 1 := by
      linarith [hqgt1]
    have hq2 : 0 < (X ^ 2 + Y ^ 2) - (1 - s ^ 2) ^ 2 := by
      linarith [hqgt1, hsmall]
    have hfacpos :
        0 < ((X ^ 2 + Y ^ 2) - 1) * ((X ^ 2 + Y ^ 2) - (1 - s ^ 2) ^ 2) := by
      positivity
    rw [hid]
    positivity
  have hApos : 0 < A := by
    rw [ha2x]
    nlinarith [hs1]
  have hsum_pos : 0 < X * B + A * Y := by
    have hqmspos : 0 < X ^ 2 + Y ^ 2 - s ^ 2 := by
      linarith [hqgt1, hsq1]
    have hXpos : 0 < X := by
      have h2x : 0 < 2 * X - 1 := by
        simpa [hqdif] using hqmspos
      linarith
    positivity
  have hcoef_pos : 0 < X * B - A * Y := by
    have hXBpos : 0 < X * B := by
      have hqmspos : 0 < X ^ 2 + Y ^ 2 - s ^ 2 := by
        linarith [hqgt1, hsq1]
      have hXpos : 0 < X := by
        have h2x : 0 < 2 * X - 1 := by
          simpa [hqdif] using hqmspos
        linarith
      positivity
    have hAYnonneg : 0 ≤ A * Y := by
      positivity
    have hlt : A * Y < X * B := by
      have hsq : (A * Y) ^ 2 < (X * B) ^ 2 := by
        nlinarith [hcoefsq]
      exact trackB_lt_of_sq_lt_sq_of_nonneg hsq hXBpos hAYnonneg
    linarith
  by_contra hvnonneg
  have hvge : 0 ≤ v := le_of_not_gt hvnonneg
  have hleft_nonneg : 0 ≤ (X * B - A * Y) * v := by
    positivity
  linarith [hlin, hleft_nonneg, hrhs_neg]

set_option maxHeartbeats 400000 in
-- The public wrapper inherits the same polynomial normal form after specializing
-- coordinates, so it needs the same local heartbeat cap as the scalar kernel.
/-- **Track-B shared-triple circumcenter sign kernel.**

In the normalized `q'=E` Track-B pilot, if `a₂` is the upper point of
`circle(v₁,1) ∩ circle(v₂,s)` and `b₂` is equidistant from `v₁,v₃,a₂`, then
the circumcenter `b₂` lies strictly below the x-axis.

This is the exact reduced-system obstruction behind the `i=606` pilot:
`Sb₂ ⊇ {v₁,v₃,a₂}` already contradicts the b₂-column upper-half-plane selector
role, before using the rest of the K4 packet. -/
theorem qEqE_b2_familyB_sharedTriple_circumcenter_below_axis
    (v₁ v₂ v₃ a₂ b₂ : ℝ²) (s rb : ℝ)
    (hs0 : 0 < s) (hs1 : s < 1)
    (h1x : v₁ 0 = 0) (h1y : v₁ 1 = 0) (h2x : v₂ 0 = 1) (h2y : v₂ 1 = 0)
    (ha2v1 : dist a₂ v₁ = 1) (ha2v2 : dist a₂ v₂ = s) (hv3v2 : dist v₃ v₂ = s)
    (hv3v1 : 1 < dist v₃ v₁)
    (ha2y : 0 < a₂ 1) (hv3y : 0 < v₃ 1)
    (hb2v1 : dist b₂ v₁ = rb) (hb2v3 : dist b₂ v₃ = rb) (hb2a2 : dist b₂ a₂ = rb) :
    b₂ 1 < 0 := by
  obtain ⟨ha2x, ha2circ, hv3v2sq⟩ :=
    trackB_shared_scalar_pins v₁ v₂ v₃ a₂ s h1x h1y h2x h2y ha2v1 ha2v2 hv3v2
  set X := v₃ 0
  set Y := v₃ 1
  set A := a₂ 0
  have hqgt1 : 1 < X ^ 2 + Y ^ 2 := by
    have h := trackB_dist_sq_coords v₃ v₁
    rw [h1x, h1y] at h
    have hdistsq : dist v₃ v₁ ^ 2 = X ^ 2 + Y ^ 2 := by
      simpa [X, Y] using h
    have hdistnn : 0 ≤ dist v₃ v₁ := dist_nonneg
    nlinarith [hv3v1, hdistsq]
  have hs2 : (X - 1) ^ 2 + Y ^ 2 = s ^ 2 := by
    simpa [X, Y] using hv3v2sq
  have hqeq : X * (b₂ 0) + Y * (b₂ 1) = (X ^ 2 + Y ^ 2) / 2 := by
    have h : dist b₂ v₁ ^ 2 = dist b₂ v₃ ^ 2 := by rw [hb2v1, hb2v3]
    rw [trackB_dist_sq_coords, trackB_dist_sq_coords] at h
    rw [h1x, h1y] at h
    rw [show v₃ 0 = X by rfl, show v₃ 1 = Y by rfl] at h
    nlinarith
  have hAeq : A * (b₂ 0) + a₂ 1 * (b₂ 1) = 1 / 2 := by
    have h : dist b₂ v₁ ^ 2 = dist b₂ a₂ ^ 2 := by rw [hb2v1, hb2a2]
    rw [trackB_dist_sq_coords, trackB_dist_sq_coords] at h
    rw [h1x, h1y] at h
    have hA : a₂ 0 = A := rfl
    rw [hA] at h
    nlinarith [ha2circ]
  have hlin :
      (X * (a₂ 1) - A * Y) * (b₂ 1) =
        X / 2 - (X ^ 2 + Y ^ 2) * A / 2 := by
    linear_combination X * hAeq - A * hqeq
  simpa [A, X, Y] using
    trackB_sharedTriple_circumcenter_below_axis_scalar
      X Y A (a₂ 1) (b₂ 1) s hs0 hs1 hqgt1 hs2 ha2x ha2circ ha2y hv3y hlin

end Problem97

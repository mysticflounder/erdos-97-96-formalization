/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Moser.TriangleNonObtuse

/-!
# Non-obtuseness in squared side lengths

`Moser/TriangleNonObtuse.lean` records non-obtuseness as three inner products,
`⟪v₂ - v₁, v₃ - v₁⟫_ℝ ≥ 0` and its two cyclic images.  The cyclic-exclusion
chain in `ATail/` consumes the same fact in the side-length form
`0 ≤ b² + c² - a²`.  The passage between the two is one polarization, and it
appeared inline at three call sites without ever being exported.  This file
exports it.

The polarization is the parallelogram expansion of `‖(B - A) - (C - A)‖²`:

  `dist B C ² = dist A B ² - 2 ⟪B - A, C - A⟫_ℝ + dist A C ²`,

so a non-negative inner product at the apex `A` is the statement that the side
opposite `A` is no longer than the Pythagorean value.  No triangle hypothesis
is needed: the three points may be equal or collinear.

`nonObtuse_sides` packages the three apices of a
`MEC.NonObtuseCircumscribedMoserTriangle` in the exact binder shape that
`eq_of_cyclic_foreign_hits` takes, with `A₀ = v₁`, `A₁ = v₂`, `A₂ = v₃`.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97

/-- **Polarization at a non-obtuse apex.**  A non-negative inner product at `A`
says exactly that the squared side opposite `A` does not exceed the sum of the
two squared sides at `A`. -/
theorem sq_add_sq_sub_sq_nonneg_of_inner_nonneg {A B C : ℝ²}
    (h : 0 ≤ inner ℝ (B - A) (C - A)) :
    0 ≤ dist A B ^ 2 + dist A C ^ 2 - dist B C ^ 2 := by
  have hexp := norm_sub_sq_real (B - A) (C - A)
  have hrw : B - A - (C - A) = B - C := by abel
  rw [hrw] at hexp
  have h1 : ‖B - C‖ = dist B C := (dist_eq_norm B C).symm
  have h2 : ‖B - A‖ = dist A B := by rw [← dist_eq_norm, dist_comm]
  have h3 : ‖C - A‖ = dist A C := by rw [← dist_eq_norm, dist_comm]
  rw [h1, h2, h3] at hexp
  linarith

variable {A : Finset ℝ²} {hA : A.Nonempty} {hncol : ¬ Collinear ℝ (A : Set ℝ²)}

/-- The side-length form of non-obtuseness at `v₁`. -/
theorem MEC.NonObtuseCircumscribedMoserTriangle.sq_side_at_v1
    (T : MEC.NonObtuseCircumscribedMoserTriangle A hA hncol) :
    0 ≤ dist T.toMoserTriangle.v1 T.toMoserTriangle.v2 ^ 2
      + dist T.toMoserTriangle.v1 T.toMoserTriangle.v3 ^ 2
      - dist T.toMoserTriangle.v2 T.toMoserTriangle.v3 ^ 2 :=
  sq_add_sq_sub_sq_nonneg_of_inner_nonneg T.inner_at_v1

/-- The side-length form of non-obtuseness at `v₂`. -/
theorem MEC.NonObtuseCircumscribedMoserTriangle.sq_side_at_v2
    (T : MEC.NonObtuseCircumscribedMoserTriangle A hA hncol) :
    0 ≤ dist T.toMoserTriangle.v2 T.toMoserTriangle.v3 ^ 2
      + dist T.toMoserTriangle.v2 T.toMoserTriangle.v1 ^ 2
      - dist T.toMoserTriangle.v3 T.toMoserTriangle.v1 ^ 2 :=
  sq_add_sq_sub_sq_nonneg_of_inner_nonneg T.inner_at_v2

/-- The side-length form of non-obtuseness at `v₃`. -/
theorem MEC.NonObtuseCircumscribedMoserTriangle.sq_side_at_v3
    (T : MEC.NonObtuseCircumscribedMoserTriangle A hA hncol) :
    0 ≤ dist T.toMoserTriangle.v3 T.toMoserTriangle.v1 ^ 2
      + dist T.toMoserTriangle.v3 T.toMoserTriangle.v2 ^ 2
      - dist T.toMoserTriangle.v1 T.toMoserTriangle.v2 ^ 2 :=
  sq_add_sq_sub_sq_nonneg_of_inner_nonneg T.inner_at_v3

/-- **The three non-obtuse hypotheses of the cyclic exclusion.**  Naming the
sides `a = dist v₂ v₃`, `b = dist v₃ v₁`, `c = dist v₁ v₂`, the three apex
angles give the three inequalities that `eq_of_cyclic_foreign_hits` takes as
`hna`, `hnb`, `hnc` under `A₀ = v₁`, `A₁ = v₂`, `A₂ = v₃`. -/
theorem MEC.NonObtuseCircumscribedMoserTriangle.nonObtuse_sides
    (T : MEC.NonObtuseCircumscribedMoserTriangle A hA hncol) {a b c : ℝ}
    (ha : dist T.toMoserTriangle.v2 T.toMoserTriangle.v3 = a)
    (hb : dist T.toMoserTriangle.v3 T.toMoserTriangle.v1 = b)
    (hc : dist T.toMoserTriangle.v1 T.toMoserTriangle.v2 = c) :
    0 ≤ b ^ 2 + c ^ 2 - a ^ 2 ∧ 0 ≤ c ^ 2 + a ^ 2 - b ^ 2
      ∧ 0 ≤ a ^ 2 + b ^ 2 - c ^ 2 := by
  have h1 := T.sq_side_at_v1
  have h2 := T.sq_side_at_v2
  have h3 := T.sq_side_at_v3
  have hb' : dist T.toMoserTriangle.v1 T.toMoserTriangle.v3 = b := by
    rw [dist_comm]; exact hb
  have hc' : dist T.toMoserTriangle.v2 T.toMoserTriangle.v1 = c := by
    rw [dist_comm]; exact hc
  have ha' : dist T.toMoserTriangle.v3 T.toMoserTriangle.v2 = a := by
    rw [dist_comm]; exact ha
  rw [ha, hb', hc] at h1
  rw [ha, hb, hc'] at h2
  rw [hb, ha', hc] at h3
  exact ⟨by linarith, by linarith, by linarith⟩

end Problem97

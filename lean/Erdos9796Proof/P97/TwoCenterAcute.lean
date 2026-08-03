/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.CircumcenterSide

/-!
# Acute-base inequalities for two equidistant centres

The algebraic half of the fresh retained-omission cut.  If two centres are
equidistant from the same pair of hits and lie on opposite sides of the hits'
midpoint, then both base angles of the resulting isosceles triangle are acute.
The separate convex/cyclic-order bridge is responsible for establishing the
strictly-negative midpoint inner product in a concrete P97 packet.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97

/-- Opposite signed-area sides of a chord turn one equidistance relation into
strictly opposite midpoint offsets.  This is the metric bridge from the
cyclic-order sign information to the two-centre acute-base inequality below.

The sign assumption is essential: two distinct points on the same
perpendicular-bisector ray have the same equidistance relation but a positive
midpoint inner product. -/
theorem opposite_midpoint_inner_of_same_shell_and_signedArea_opposite
    {p q x y : ℝ²}
    (hp : dist p x = dist p y)
    (hxy : x ≠ y)
    (hprod : signedArea2 p x y * signedArea2 q x y < 0) :
    ⟪(p - midpoint ℝ x y), (q - midpoint ℝ x y)⟫_ℝ < 0 := by
  have hp_norm : ‖x - p‖ = ‖y - p‖ := by
    simpa [dist_eq_norm, norm_sub_rev] using
      hp
  have hperp : ‖x - p‖ ^ 2 = ‖y - p‖ ^ 2 :=
    congrArg (fun r : ℝ => r ^ 2) hp_norm
  have hchord_pos : 0 < ‖x - y‖ ^ 2 :=
    sq_pos_of_ne_zero (norm_ne_zero_iff.mpr (sub_ne_zero.mpr hxy))
  have harea := signedArea_prod_eq_inner_mul_dist_sq p x y q hperp
  have hmid :
      ⟪midpoint ℝ x y - p, midpoint ℝ x y - q⟫_ℝ < 0 := by
    nlinarith
  have hpneg : p - midpoint ℝ x y = -(midpoint ℝ x y - p) := by
    abel
  have hqneg : q - midpoint ℝ x y = -(midpoint ℝ x y - q) := by
    abel
  rw [hpneg, hqneg, inner_neg_left, inner_neg_right, neg_neg]
  exact hmid

/-- Two centres equidistant from the same pair of hits have acute base angles
when their midpoint offsets have negative inner product. -/
theorem two_center_two_hit_sqdist_acute_of_opposite_midpoint_inner
    {p q x y : ℝ²}
    (hp : dist p x = dist p y)
    (hq : dist q x = dist q y)
    (hopp : ⟪(p - midpoint ℝ x y), (q - midpoint ℝ x y)⟫_ℝ < 0) :
    dist p q ^ 2 + dist p x ^ 2 > dist q x ^ 2 ∧
      dist p q ^ 2 + dist q x ^ 2 > dist p x ^ 2 := by
  have hmid : ∀ i : Fin 2, (midpoint ℝ x y) i = ((x i + y i) / 2 : ℝ) := by
    intro i
    rw [midpoint_eq_smul_add]
    simp [PiLp.smul_apply, PiLp.add_apply, invOf_eq_inv]
    ring
  have hp_sq : dist p x ^ 2 = dist p y ^ 2 :=
    congrArg (fun t : ℝ => t ^ 2) hp
  have hq_sq : dist q x ^ 2 = dist q y ^ 2 :=
    congrArg (fun t : ℝ => t ^ 2) hq
  rw [dist_sq_coord, dist_sq_coord] at hp_sq hq_sq
  have hopp_coord :
      (q 0 - (x 0 + y 0) / 2) * (p 0 - (x 0 + y 0) / 2) +
        (q 1 - (x 1 + y 1) / 2) * (p 1 - (x 1 + y 1) / 2) < 0 := by
    rw [@PiLp.inner_apply] at hopp
    simpa only [Fin.sum_univ_two, RCLike.inner_apply, conj_trivial,
      PiLp.sub_apply, hmid] using hopp
  constructor <;>
    rw [dist_sq_coord, dist_sq_coord, dist_sq_coord] <;>
    nlinarith [sq_nonneg (p 0 - (x 0 + y 0) / 2),
      sq_nonneg (p 1 - (x 1 + y 1) / 2),
      sq_nonneg (q 0 - (x 0 + y 0) / 2),
      sq_nonneg (q 1 - (x 1 + y 1) / 2)]

/-- A two-centre/two-hit configuration has acute base angles when the two
centres are on opposite signed-area sides of the shared chord. -/
theorem two_center_two_hit_sqdist_acute_of_signedArea_opposite
    {p q x y : ℝ²}
    (hp : dist p x = dist p y)
    (hq : dist q x = dist q y)
    (hxy : x ≠ y)
    (hprod : signedArea2 p x y * signedArea2 q x y < 0) :
    dist p q ^ 2 + dist p x ^ 2 > dist q x ^ 2 ∧
      dist p q ^ 2 + dist q x ^ 2 > dist p x ^ 2 := by
  exact two_center_two_hit_sqdist_acute_of_opposite_midpoint_inner hp hq
    (opposite_midpoint_inner_of_same_shell_and_signedArea_opposite hp hxy hprod)

end Problem97

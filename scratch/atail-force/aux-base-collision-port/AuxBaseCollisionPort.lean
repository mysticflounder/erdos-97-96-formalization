/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U5GlobalIncidenceKernels

/-!
# U5 q-critical auxiliary base-collision metric incompatibility

This scratch module ports the metric-point theorem
`Problem97.u5_qcritical_aux_base_collision_metric_incompatibility` from sibling module
`RVOL.P97.U5GlobalIncidenceQCriticalAuxBaseCollision`.  The scalar helper is adapted to reuse
the production-local `Problem97.u5_chain_antipodal_coord`.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- If the three-link equal-radius chain makes `c` antipodal to `q`, a point equidistant from
`q` and `c` at chain radius from `c` must be the base point. -/
theorem u5_qcritical_aux_base_collision_coord_eq_base
    {q0 q1 a0 a1 b0 b1 c0 c1 x0 x1 R S : ℝ}
    (hR : 0 < R)
    (hqq : q0 ^ 2 + q1 ^ 2 = R)
    (haa : a0 ^ 2 + a1 ^ 2 = R)
    (hbb : b0 ^ 2 + b1 ^ 2 = R)
    (hcc : c0 ^ 2 + c1 ^ 2 = R)
    (hS : x0 ^ 2 + x1 ^ 2 = S)
    (hqadot : q0 * a0 + q1 * a1 = R / 2)
    (habdot : a0 * b0 + a1 * b1 = R / 2)
    (hbcdot : b0 * c0 + b1 * c1 = R / 2)
    (hQ2_ne_R : q0 * b0 + q1 * b1 ≠ R)
    (hA3_ne_R : a0 * c0 + a1 * c1 ≠ R)
    (hcx_sq : (c0 - x0) ^ 2 + (c1 - x1) ^ 2 = R)
    (hxq_eq_xc :
      (x0 - q0) ^ 2 + (x1 - q1) ^ 2 =
        (x0 - c0) ^ 2 + (x1 - c1) ^ 2) :
    x0 = 0 ∧ x1 = 0 := by
  rcases u5_chain_antipodal_coord hR hqq haa hbb hcc hqadot habdot hbcdot
      hQ2_ne_R hA3_ne_R with
    ⟨hc0, hc1⟩
  have hc0_eq : c0 = -q0 := by linear_combination hc0
  have hc1_eq : c1 = -q1 := by linear_combination hc1
  have hxqdot : x0 * q0 + x1 * q1 = 0 := by
    rw [hc0_eq, hc1_eq] at hxq_eq_xc
    linear_combination (-1 / 4) * hxq_eq_xc
  have hS_zero : S = 0 := by
    rw [hc0_eq, hc1_eq] at hcx_sq
    have hcx_sq' : (x0 + q0) ^ 2 + (x1 + q1) ^ 2 = R := by
      ring_nf at hcx_sq ⊢
      exact hcx_sq
    linear_combination hcx_sq' - hS - hqq - 2 * hxqdot
  have hx_sq_zero : x0 ^ 2 + x1 ^ 2 = 0 := by
    linarith
  constructor
  · have hx0_sq : x0 ^ 2 = 0 := by
      nlinarith [hx_sq_zero, sq_nonneg x1]
    exact sq_eq_zero_iff.mp hx0_sq
  · have hx1_sq : x1 ^ 2 = 0 := by
      nlinarith [hx_sq_zero, sq_nonneg x0]
    exact sq_eq_zero_iff.mp hx1_sq

private theorem u5_aux_base_collision_dist_sq_eq_coord_sq_add_coord_sq
    (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [dist_eq_norm, EuclideanSpace.norm_sq_eq]
  simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]

set_option maxHeartbeats 1000000 in
/-- Metric lemma behind the q-critical auxiliary base-collision incompatibility. -/
theorem u5_qcritical_aux_base_collision_metric_incompatibility
    {p q t₁ t₂ t₃ x : ℝ²} {r : ℝ} (hr : 0 < r)
    (hpq : dist p q = r) (hpt₁ : dist p t₁ = r)
    (hpt₂ : dist p t₂ = r) (hpt₃ : dist p t₃ = r)
    (ht₁q : dist t₁ q = r) (ht₁t₂ : dist t₁ t₂ = r)
    (ht₂t₃ : dist t₂ t₃ = r)
    (hq_ne_t₂ : q ≠ t₂) (ht₁_ne_t₃ : t₁ ≠ t₃)
    (hx_ne_p : x ≠ p)
    (ht₃x : dist t₃ x = r)
    (hxt₃q : dist x t₃ = dist x q) : False := by
  have hpqsq : dist p q ^ 2 = r ^ 2 := by rw [hpq]
  have hp1sq : dist p t₁ ^ 2 = r ^ 2 := by rw [hpt₁]
  have hp2sq : dist p t₂ ^ 2 = r ^ 2 := by rw [hpt₂]
  have hp3sq : dist p t₃ ^ 2 = r ^ 2 := by rw [hpt₃]
  have h1qsq : dist t₁ q ^ 2 = r ^ 2 := by rw [ht₁q]
  have h12sq : dist t₁ t₂ ^ 2 = r ^ 2 := by rw [ht₁t₂]
  have h23sq : dist t₂ t₃ ^ 2 = r ^ 2 := by rw [ht₂t₃]
  have h3xsq : dist t₃ x ^ 2 = r ^ 2 := by rw [ht₃x]
  have hxt₃qsq : dist x t₃ ^ 2 = dist x q ^ 2 := by rw [hxt₃q]
  rw [u5_aux_base_collision_dist_sq_eq_coord_sq_add_coord_sq] at hpqsq
  rw [u5_aux_base_collision_dist_sq_eq_coord_sq_add_coord_sq] at hp1sq
  rw [u5_aux_base_collision_dist_sq_eq_coord_sq_add_coord_sq] at hp2sq
  rw [u5_aux_base_collision_dist_sq_eq_coord_sq_add_coord_sq] at hp3sq
  rw [u5_aux_base_collision_dist_sq_eq_coord_sq_add_coord_sq] at h1qsq
  rw [u5_aux_base_collision_dist_sq_eq_coord_sq_add_coord_sq] at h12sq
  rw [u5_aux_base_collision_dist_sq_eq_coord_sq_add_coord_sq] at h23sq
  rw [u5_aux_base_collision_dist_sq_eq_coord_sq_add_coord_sq t₃ x] at h3xsq
  rw [u5_aux_base_collision_dist_sq_eq_coord_sq_add_coord_sq x t₃] at hxt₃qsq
  rw [u5_aux_base_collision_dist_sq_eq_coord_sq_add_coord_sq x q] at hxt₃qsq
  set q0 := p 0 - q 0
  set q1 := p 1 - q 1
  set a0 := p 0 - t₁ 0
  set a1 := p 1 - t₁ 1
  set b0 := p 0 - t₂ 0
  set b1 := p 1 - t₂ 1
  set c0 := p 0 - t₃ 0
  set c1 := p 1 - t₃ 1
  set x0 := p 0 - x 0
  set x1 := p 1 - x 1
  set R := r ^ 2
  set S := x0 ^ 2 + x1 ^ 2
  have hR : 0 < R := by positivity
  have hqq : q0 ^ 2 + q1 ^ 2 = R := by
    simpa [q0, q1, R] using hpqsq
  have haa : a0 ^ 2 + a1 ^ 2 = R := by
    simpa [a0, a1, R] using hp1sq
  have hbb : b0 ^ 2 + b1 ^ 2 = R := by
    simpa [b0, b1, R] using hp2sq
  have hcc : c0 ^ 2 + c1 ^ 2 = R := by
    simpa [c0, c1, R] using hp3sq
  have hS : x0 ^ 2 + x1 ^ 2 = S := by simp [S]
  have hqadot : q0 * a0 + q1 * a1 = R / 2 := by
    have h1qcoord : (a0 - q0) ^ 2 + (a1 - q1) ^ 2 = R := by
      dsimp [q0, q1, a0, a1, R] at h1qsq ⊢
      ring_nf at h1qsq ⊢
      exact h1qsq
    have htwo : 2 * (q0 * a0 + q1 * a1) = R := by
      linear_combination hqq + haa - h1qcoord
    linarith
  have habdot : a0 * b0 + a1 * b1 = R / 2 := by
    have h12coord : (a0 - b0) ^ 2 + (a1 - b1) ^ 2 = R := by
      dsimp [a0, a1, b0, b1, R] at h12sq ⊢
      ring_nf at h12sq ⊢
      exact h12sq
    have htwo : 2 * (a0 * b0 + a1 * b1) = R := by
      linear_combination haa + hbb - h12coord
    linarith
  have hbcdot : b0 * c0 + b1 * c1 = R / 2 := by
    have h23coord : (b0 - c0) ^ 2 + (b1 - c1) ^ 2 = R := by
      dsimp [b0, b1, c0, c1, R] at h23sq ⊢
      ring_nf at h23sq ⊢
      exact h23sq
    have htwo : 2 * (b0 * c0 + b1 * c1) = R := by
      linear_combination hbb + hcc - h23coord
    linarith
  have hQ2_ne_R : q0 * b0 + q1 * b1 ≠ R := by
    intro hQ2R
    have hqt₂sq_zero : dist q t₂ ^ 2 = 0 := by
      rw [u5_aux_base_collision_dist_sq_eq_coord_sq_add_coord_sq q t₂]
      have hsumsq : (b0 - q0) ^ 2 + (b1 - q1) ^ 2 = 0 := by
        linear_combination hbb + hqq - 2 * hQ2R
      dsimp [q0, q1, b0, b1] at hsumsq ⊢
      ring_nf at hsumsq ⊢
      exact hsumsq
    have hqt₂_zero : dist q t₂ = 0 := sq_eq_zero_iff.mp hqt₂sq_zero
    exact hq_ne_t₂ (dist_eq_zero.mp hqt₂_zero)
  have hA3_ne_R : a0 * c0 + a1 * c1 ≠ R := by
    intro hA3R
    have ht₁t₃sq_zero : dist t₁ t₃ ^ 2 = 0 := by
      rw [u5_aux_base_collision_dist_sq_eq_coord_sq_add_coord_sq t₁ t₃]
      have hsumsq : (c0 - a0) ^ 2 + (c1 - a1) ^ 2 = 0 := by
        linear_combination hcc + haa - 2 * hA3R
      dsimp [a0, a1, c0, c1] at hsumsq ⊢
      ring_nf at hsumsq ⊢
      exact hsumsq
    have ht₁t₃_zero : dist t₁ t₃ = 0 := sq_eq_zero_iff.mp ht₁t₃sq_zero
    exact ht₁_ne_t₃ (dist_eq_zero.mp ht₁t₃_zero)
  have hcx_sq : (c0 - x0) ^ 2 + (c1 - x1) ^ 2 = R := by
    dsimp [c0, c1, x0, x1, R] at h3xsq ⊢
    ring_nf at h3xsq ⊢
    exact h3xsq
  have hxq_eq_xc :
      (x0 - q0) ^ 2 + (x1 - q1) ^ 2 =
        (x0 - c0) ^ 2 + (x1 - c1) ^ 2 := by
    dsimp [x0, x1, q0, q1, c0, c1] at hxt₃qsq ⊢
    ring_nf at hxt₃qsq ⊢
    exact hxt₃qsq.symm
  rcases u5_qcritical_aux_base_collision_coord_eq_base hR hqq haa hbb hcc hS
      hqadot habdot hbcdot hQ2_ne_R hA3_ne_R hcx_sq hxq_eq_xc with
    ⟨hx0, hx1⟩
  have hpx_sq_zero : dist p x ^ 2 = 0 := by
    rw [u5_aux_base_collision_dist_sq_eq_coord_sq_add_coord_sq p x]
    rw [show p 0 - x 0 = 0 by simpa [x0] using hx0,
      show p 1 - x 1 = 0 by simpa [x1] using hx1]
    ring
  have hpx_zero : dist p x = 0 := sq_eq_zero_iff.mp hpx_sq_zero
  exact hx_ne_p (dist_eq_zero.mp hpx_zero).symm

#print axioms u5_qcritical_aux_base_collision_coord_eq_base
#print axioms u5_qcritical_aux_base_collision_metric_incompatibility

end Problem97

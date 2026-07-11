/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# A five-point collision core

Two equilateral triangles on a common edge have either the same third vertex
or opposite third vertices.  In the opposite case, an additional bisector
equality identifies a fifth point with an endpoint of the common edge.  This
gives a reusable equality-closure core for Census-554 patterns.

The theorem layer is independent of the ambient label type and does not assert
coverage of the Census-554 bank.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

namespace Internal

/-- Squared distance in the plane, expanded in the two coordinates. -/
theorem dist_sq_coords (u v : ℝ²) :
    dist u v ^ 2 = (u 0 - v 0) ^ 2 + (u 1 - v 1) ^ 2 := by
  rw [dist_eq_norm, EuclideanSpace.norm_sq_eq]
  simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]

set_option maxHeartbeats 2000000 in
-- The proof eliminates one planar Gram determinant and two sums of squares.
/-- Coordinate form of the five-point collision calculation. -/
theorem coordinate_collision
    {a₀ a₁ b₀ b₁ c₀ c₁ x₀ x₁ R S : ℝ}
    (hR : 0 < R)
    (haa : a₀ ^ 2 + a₁ ^ 2 = R)
    (hbb : b₀ ^ 2 + b₁ ^ 2 = R)
    (hcc : c₀ ^ 2 + c₁ ^ 2 = R)
    (hS : x₀ ^ 2 + x₁ ^ 2 = S)
    (hab : a₀ * b₀ + a₁ * b₁ = R / 2)
    (hax : a₀ * x₀ + a₁ * x₁ = S / 2)
    (hbx : b₀ * x₀ + b₁ * x₁ = S / 2)
    (hcxca :
      c₀ * x₀ + c₁ * x₁ - (c₀ * a₀ + c₁ * a₁) =
        (S - R) / 2) :
    (x₀ = 0 ∧ x₁ = 0) ∨ (c₀ = b₀ ∧ c₁ = b₁) := by
  have hgram :
      (a₀ ^ 2 + a₁ ^ 2) * (b₀ ^ 2 + b₁ ^ 2) * (x₀ ^ 2 + x₁ ^ 2)
        + 2 * (a₀ * b₀ + a₁ * b₁) * (a₀ * x₀ + a₁ * x₁)
          * (b₀ * x₀ + b₁ * x₁)
        - (a₀ ^ 2 + a₁ ^ 2) * (b₀ * x₀ + b₁ * x₁) ^ 2
        - (b₀ ^ 2 + b₁ ^ 2) * (a₀ * x₀ + a₁ * x₁) ^ 2
        - (x₀ ^ 2 + x₁ ^ 2) * (a₀ * b₀ + a₁ * b₁) ^ 2 = 0 := by
    ring
  rw [haa, hbb, hS, hab, hax, hbx] at hgram
  have hfactor : S * (3 * R - S) = 0 := by
    nlinarith [hgram, hR]
  rcases mul_eq_zero.mp hfactor with hS₀ | hS₃
  · left
    constructor
    · nlinarith [hS, sq_nonneg x₀, sq_nonneg x₁]
    · nlinarith [hS, sq_nonneg x₀, sq_nonneg x₁]
  · right
    have hSeq : S = 3 * R := by nlinarith
    have hxdiff :
        (x₀ - a₀ - b₀) ^ 2 + (x₁ - a₁ - b₁) ^ 2 = 0 := by
      nlinarith [haa, hbb, hS, hab, hax, hbx]
    have hx₀ : x₀ = a₀ + b₀ := by
      nlinarith [sq_nonneg (x₀ - a₀ - b₀),
        sq_nonneg (x₁ - a₁ - b₁)]
    have hx₁ : x₁ = a₁ + b₁ := by
      nlinarith [sq_nonneg (x₀ - a₀ - b₀),
        sq_nonneg (x₁ - a₁ - b₁)]
    have hcb : c₀ * b₀ + c₁ * b₁ = R := by
      rw [hx₀, hx₁, hSeq] at hcxca
      nlinarith [hcxca]
    have hcbdiff : (c₀ - b₀) ^ 2 + (c₁ - b₁) ^ 2 = 0 := by
      nlinarith [hcc, hbb, hcb]
    constructor
    · nlinarith [sq_nonneg (c₀ - b₀), sq_nonneg (c₁ - b₁)]
    · nlinarith [sq_nonneg (c₀ - b₀), sq_nonneg (c₁ - b₁)]

end Internal

set_option maxHeartbeats 5000000 in
-- Coordinate extraction from the seven distance equalities is the expensive step.
/-- If `pab` and `xab` are equilateral triangles with the same side length,
`c` lies on the `p`-circle, and `c` is equidistant from `x` and `a`, then
either the two equilateral vertices agree or `c` is the endpoint `b`. -/
theorem equilateral_bisector_collision
    {p a b c x : ℝ²} {r : ℝ} (hr : 0 < r)
    (hpa : dist p a = r) (hpb : dist p b = r) (hpc : dist p c = r)
    (hab : dist a b = r) (hax : dist a x = r) (hbx : dist b x = r)
    (hcxca : dist c x = dist c a) :
    p = x ∨ c = b := by
  have hpa_sq : dist p a ^ 2 = r ^ 2 := by rw [hpa]
  have hpb_sq : dist p b ^ 2 = r ^ 2 := by rw [hpb]
  have hpc_sq : dist p c ^ 2 = r ^ 2 := by rw [hpc]
  have hab_sq : dist a b ^ 2 = r ^ 2 := by rw [hab]
  have hax_sq : dist a x ^ 2 = r ^ 2 := by rw [hax]
  have hbx_sq : dist b x ^ 2 = r ^ 2 := by rw [hbx]
  have hcxca_sq : dist c x ^ 2 = dist c a ^ 2 := by rw [hcxca]
  rw [Internal.dist_sq_coords] at hpa_sq
  rw [Internal.dist_sq_coords] at hpb_sq
  rw [Internal.dist_sq_coords] at hpc_sq
  rw [Internal.dist_sq_coords] at hab_sq
  rw [Internal.dist_sq_coords] at hax_sq
  rw [Internal.dist_sq_coords] at hbx_sq
  rw [Internal.dist_sq_coords c x, Internal.dist_sq_coords c a] at hcxca_sq
  set a₀ := p 0 - a 0
  set a₁ := p 1 - a 1
  set b₀ := p 0 - b 0
  set b₁ := p 1 - b 1
  set c₀ := p 0 - c 0
  set c₁ := p 1 - c 1
  set x₀ := p 0 - x 0
  set x₁ := p 1 - x 1
  set R := r ^ 2
  set S := x₀ ^ 2 + x₁ ^ 2
  have hR : 0 < R := by positivity
  have haa : a₀ ^ 2 + a₁ ^ 2 = R := by
    simpa [a₀, a₁, R] using hpa_sq
  have hbb : b₀ ^ 2 + b₁ ^ 2 = R := by
    simpa [b₀, b₁, R] using hpb_sq
  have hcc : c₀ ^ 2 + c₁ ^ 2 = R := by
    simpa [c₀, c₁, R] using hpc_sq
  have hS : x₀ ^ 2 + x₁ ^ 2 = S := by simp [S]
  have habdot : a₀ * b₀ + a₁ * b₁ = R / 2 := by
    dsimp [a₀, a₁, b₀, b₁, R]
    nlinarith [hpa_sq, hpb_sq, hab_sq]
  have haxdot : a₀ * x₀ + a₁ * x₁ = S / 2 := by
    dsimp [a₀, a₁, x₀, x₁, S, R]
    nlinarith [hpa_sq, hax_sq]
  have hbxdot : b₀ * x₀ + b₁ * x₁ = S / 2 := by
    dsimp [b₀, b₁, x₀, x₁, S, R]
    nlinarith [hpb_sq, hbx_sq]
  have hcxcaDot :
      c₀ * x₀ + c₁ * x₁ - (c₀ * a₀ + c₁ * a₁) =
        (S - R) / 2 := by
    dsimp [a₀, a₁, c₀, c₁, x₀, x₁, S, R]
    nlinarith [hpa_sq, hpc_sq, hcxca_sq]
  rcases Internal.coordinate_collision hR haa hbb hcc hS habdot haxdot hbxdot hcxcaDot with
    hx | hcb
  · left
    have hx0 : p 0 = x 0 := by
      dsimp [x₀] at hx
      linarith [hx.1]
    have hx1 : p 1 = x 1 := by
      dsimp [x₁] at hx
      linarith [hx.2]
    ext i
    fin_cases i
    · exact hx0
    · exact hx1
  · right
    have hcb0 : c 0 = b 0 := by
      dsimp [c₀, b₀] at hcb
      linarith [hcb.1]
    have hcb1 : c 1 = b 1 := by
      dsimp [c₁, b₁] at hcb
      linarith [hcb.2]
    ext i
    fin_cases i
    · exact hcb0
    · exact hcb1

/-- Equality-closure data for the five-point collision theorem. -/
structure EquilateralBisectorCollisionCore {α : Type*} (P : RowPattern α) where
  p : α
  a : α
  b : α
  c : α
  x : α
  hpa : p ≠ a
  hpx : p ≠ x
  hcb : c ≠ b
  pa_pb : EdgeClosure P (p, a) (p, b)
  pa_pc : EdgeClosure P (p, a) (p, c)
  pa_ab : EdgeClosure P (p, a) (a, b)
  pa_ax : EdgeClosure P (p, a) (a, x)
  pa_bx : EdgeClosure P (p, a) (b, x)
  cx_ca : EdgeClosure P (c, x) (c, a)

/-- An equilateral-bisector collision core has no injective planar
realization. -/
theorem not_realizes_of_equilateralBisectorCollisionCore
    {α : Type*} {P : RowPattern α} (core : EquilateralBisectorCollisionCore P) :
    ¬ ∃ pointOf : α → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have hpa : pointOf core.p ≠ pointOf core.a := by
    intro h
    exact core.hpa (hreal.injective h)
  have hpa_pb :
      dist (pointOf core.p) (pointOf core.a) =
        dist (pointOf core.p) (pointOf core.b) := by
    simpa [edgeDist] using EdgeClosure.sound hreal core.pa_pb
  have hpa_pc :
      dist (pointOf core.p) (pointOf core.a) =
        dist (pointOf core.p) (pointOf core.c) := by
    simpa [edgeDist] using EdgeClosure.sound hreal core.pa_pc
  have hpa_ab :
      dist (pointOf core.p) (pointOf core.a) =
        dist (pointOf core.a) (pointOf core.b) := by
    simpa [edgeDist] using EdgeClosure.sound hreal core.pa_ab
  have hpa_ax :
      dist (pointOf core.p) (pointOf core.a) =
        dist (pointOf core.a) (pointOf core.x) := by
    simpa [edgeDist] using EdgeClosure.sound hreal core.pa_ax
  have hpa_bx :
      dist (pointOf core.p) (pointOf core.a) =
        dist (pointOf core.b) (pointOf core.x) := by
    simpa [edgeDist] using EdgeClosure.sound hreal core.pa_bx
  have hcx_ca :
      dist (pointOf core.c) (pointOf core.x) =
        dist (pointOf core.c) (pointOf core.a) := by
    simpa [edgeDist] using EdgeClosure.sound hreal core.cx_ca
  have hcollision := equilateral_bisector_collision
    (r := dist (pointOf core.p) (pointOf core.a)) (dist_pos.mpr hpa)
    rfl hpa_pb.symm hpa_pc.symm hpa_ab.symm hpa_ax.symm hpa_bx.symm hcx_ca
  rcases hcollision with hpx | hcb
  · exact core.hpx (hreal.injective hpx)
  · exact core.hcb (hreal.injective hcb)

/-- An equilateral-bisector collision core proves a Census-554 pattern dead. -/
theorem isDead_of_equilateralBisectorCollisionCore {P : Pattern}
    (core : EquilateralBisectorCollisionCore P) : IsDead P := by
  rintro ⟨pointOf, hreal⟩
  exact not_realizes_of_equilateralBisectorCollisionCore core
    ⟨pointOf, toRealizes hreal⟩

end EqualityCore
end Census554
end Problem97

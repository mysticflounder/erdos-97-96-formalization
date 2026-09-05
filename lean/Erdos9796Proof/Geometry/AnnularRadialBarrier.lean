/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.Geometry.ConvexIndepHull

/-!
# Annular radial-barrier algebra

This file records the division-free barycentric core of the annular radial
barrier.  The geometric ingress is deliberately kept outside this lemma: once
the normalized coordinates satisfy `0 < a < b` and `0 < h < k`, convex
independence rules out `b * h ≤ a * k` because that inequality puts the upper
inner point in the convex hull of the origin, the lower inner point, and the
upper outer point.
-/

open scoped EuclideanGeometry

namespace Erdos9796Proof.Geometry

/-- The normalized annular determinant has positive orientation whenever the
upper inner point is excluded from the convex hull of the other three points.

This is the algebraic `A1` core of the radial-barrier argument. -/
theorem bh_sub_ak_pos_of_convexHull_exclusion
    {a b h k : ℝ}
    (ha : 0 < a) (hab : a < b) (hh : 0 < h) (hhk : h < k)
    (hnot : !₂[a, h] ∉
      convexHull ℝ ({!₂[0, 0], !₂[a, -h], !₂[b, k]} : Set Plane)) :
    0 < b * h - a * k := by
  by_contra hpos
  have hT : b * h - a * k ≤ 0 := le_of_not_gt hpos
  have hb : 0 < b := by linarith
  have hk : 0 < k := by linarith
  have hden : 0 < a * k + b * h := by
    nlinarith [mul_pos ha hk, mul_pos hb hh]
  let α : ℝ := 2 * h * (b - a) / (a * k + b * h)
  let β : ℝ := (a * k - b * h) / (a * k + b * h)
  let γ : ℝ := 2 * a * h / (a * k + b * h)
  have hα : 0 ≤ α := by
    dsimp [α]
    have hba : 0 ≤ b - a := by linarith
    exact (div_nonneg (mul_nonneg (mul_nonneg (by positivity) hh.le) hba) hden.le)
  have hβ : 0 ≤ β := by
    dsimp [β]
    exact (div_nonneg (by nlinarith [hT]) hden.le)
  have hγ : 0 ≤ γ := by
    dsimp [γ]
    exact (div_nonneg (by positivity) hden.le)
  have hsum : α + β + γ = 1 := by
    dsimp [α, β, γ]
    field_simp [ne_of_gt hden]
    ring
  let O : Plane := !₂[0, 0]
  let Pm : Plane := !₂[a, -h]
  let U : Plane := !₂[b, k]
  let Pp : Plane := !₂[a, h]
  have hcomb : α • O + β • Pm + γ • U = Pp := by
    dsimp [O, Pm, U, Pp, α, β, γ]
    ext i
    fin_cases i
    · dsimp
      field_simp [ne_of_gt hden]
      ring
    · dsimp
      field_simp [ne_of_gt hden]
      ring
  have hmem : Pp ∈ convexHull ℝ ({O, Pm, U} : Set Plane) := by
    refine mem_convexHull_of_exists_fintype (ι := Fin 3)
      (fun i => match i with | 0 => α | 1 => β | 2 => γ)
      (fun i => match i with | 0 => O | 1 => Pm | 2 => U) ?_ ?_ ?_ ?_
    · intro i
      fin_cases i
      · exact hα
      · exact hβ
      · exact hγ
    · simpa [Fin.sum_univ_three] using hsum
    · intro i
      fin_cases i <;> simp
    · simpa [Fin.sum_univ_three] using hcomb
  exact hnot hmem

/-- Convex independence supplies the hull exclusion required by
`bh_sub_ak_pos_of_convexHull_exclusion` for the normalized four-point
configuration. -/
theorem bh_sub_ak_pos_of_convexIndep
    {a b h k : ℝ}
    (ha : 0 < a) (hab : a < b) (hh : 0 < h) (hhk : h < k)
    (hconv : EuclideanGeometry.ConvexIndep
      ({!₂[0, 0], !₂[a, -h], !₂[a, h], !₂[b, k]} : Set Plane)) :
    0 < b * h - a * k := by
  apply bh_sub_ak_pos_of_convexHull_exclusion ha hab hh hhk
  apply convexIndep_not_mem_convexHull_of_subset_diff hconv
  · simp
  · intro x hx
    rcases hx with rfl | hx
    · refine ⟨by simp, ?_⟩
      intro heq
      have heq' : (!₂[0, 0] : Plane) = !₂[a, h] := by
        simpa only [Set.mem_singleton_iff] using heq
      have hcoord := congrArg (fun p : Plane => p 0) heq'
      simp at hcoord
      nlinarith
    rcases hx with rfl | hx
    · refine ⟨by simp, ?_⟩
      intro heq
      have heq' : (!₂[a, -h] : Plane) = !₂[a, h] := by
        simpa only [Set.mem_singleton_iff] using heq
      have hcoord := congrArg (fun p : Plane => p 1) heq'
      simp at hcoord
      nlinarith
    rcases hx with rfl
    refine ⟨by simp, ?_⟩
    intro heq
    have heq' : (!₂[b, k] : Plane) = !₂[a, h] := by
      simpa only [Set.mem_singleton_iff] using heq
    have hcoord := congrArg (fun p : Plane => p 0) heq'
    simp at hcoord
    nlinarith

/-- The determinant identity used to turn the upper-wedge inequality into a
radial comparison. -/
theorem annular_wedge_identity (a b h k x y : ℝ) :
    h * ((b - a) * (y - h) - (k - h) * (x - a)) =
      (b * h - a * k) * (y - h) + (k - h) * (a * y - h * x) := by
  ring

/-- A linear functional with the same strict sign on two cone generators
cannot vanish on a nonzero nonnegative combination of them.  This is the
sign-only bridge used by the common-inner-pair argument. -/
theorem false_of_zero_linear_image_of_nonnegative_combination
    {L : Plane →ₗ[ℝ] ℝ} {p q₁ q₂ : Plane} {α β : ℝ}
    (hLq₁ : 0 < L q₁) (hLq₂ : 0 < L q₂)
    (hα : 0 ≤ α) (hβ : 0 ≤ β) (hcoeff : 0 < α + β)
    (hcomb : p = α • q₁ + β • q₂) (hp : L p = 0) : False := by
  have hLp : L p = α * L q₁ + β * L q₂ := by
    rw [hcomb, map_add, map_smul, map_smul]
    simp only [smul_eq_mul]
  have hsum : 0 < α * L q₁ + β * L q₂ := by
    by_contra hnonpos
    have hαterm : 0 ≤ α * L q₁ := mul_nonneg hα hLq₁.le
    have hβterm : 0 ≤ β * L q₂ := mul_nonneg hβ hLq₂.le
    have hsome : 0 < α ∨ 0 < β := by
      by_contra h
      push_neg at h
      nlinarith [hcoeff]
    rcases hsome with hαpos | hβpos
    · have hterm : 0 < α * L q₁ := mul_pos hαpos hLq₁
      nlinarith
    · have hterm : 0 < β * L q₂ := mul_pos hβpos hLq₂
      nlinarith
  nlinarith [hp, hLp]

/-- If a point on the zero level of a linear functional is forced into the
nonnegative cone of two strict same-sign points, it must be one of the two
cone generators. -/
theorem annular_inner_point_mem_of_barrier
    {L : Plane →ₗ[ℝ] ℝ} {p q₁ q₂ : Plane}
    (hp : L p = 0) (hLq₁ : 0 < L q₁) (hLq₂ : 0 < L q₂)
    (hbarrier : p ≠ q₁ → p ≠ q₂ →
      ∃ α β : ℝ, 0 ≤ α ∧ 0 ≤ β ∧ 0 < α + β ∧
        p = α • q₁ + β • q₂) :
    p = q₁ ∨ p = q₂ := by
  by_contra h
  push_neg at h
  rcases hbarrier h.1 h.2 with ⟨α, β, hα, hβ, hcoeff, hcomb⟩
  exact false_of_zero_linear_image_of_nonnegative_combination
    hLq₁ hLq₂ hα hβ hcoeff hcomb hp

/-- Abstract common-inner-pair conclusion.  The two linear barriers are the
source-clean interface: geometric ingress must instantiate them for the two
inner pairs, after which the unordered pairs coincide. -/
theorem annularFourRow_innerPair_eq
    {Lneg Lpos : Plane →ₗ[ℝ] ℝ}
    {pneg ppos qneg qpos : Plane}
    (hpne : pneg ≠ ppos)
    (hLposPpos : Lpos ppos = 0) (hLposQneg : 0 < Lpos qneg)
    (hLposQpos : 0 < Lpos qpos)
    (hbarrierPos : ppos ≠ qneg → ppos ≠ qpos →
      ∃ α β : ℝ, 0 ≤ α ∧ 0 ≤ β ∧ 0 < α + β ∧
        ppos = α • qneg + β • qpos)
    (hLnegPneg : Lneg pneg = 0) (hLnegQneg : 0 < Lneg qneg)
    (hLnegQpos : 0 < Lneg qpos)
    (hbarrierNeg : pneg ≠ qneg → pneg ≠ qpos →
      ∃ α β : ℝ, 0 ≤ α ∧ 0 ≤ β ∧ 0 < α + β ∧
        pneg = α • qneg + β • qpos) :
    ({pneg, ppos} : Finset Plane) = {qneg, qpos} := by
  have hppos : ppos = qneg ∨ ppos = qpos :=
    annular_inner_point_mem_of_barrier hLposPpos hLposQneg hLposQpos hbarrierPos
  have hpneg : pneg = qneg ∨ pneg = qpos :=
    annular_inner_point_mem_of_barrier hLnegPneg hLnegQneg hLnegQpos hbarrierNeg
  rcases hppos with hppos | hppos <;> rcases hpneg with hpneg | hpneg
  · exfalso
    apply hpne
    exact Eq.trans hpneg (Eq.symm hppos)
  · simp [hppos, hpneg, Finset.pair_comm]
  · simp [hppos, hpneg, Finset.pair_comm]
  · exfalso
    apply hpne
    exact Eq.trans hpneg (Eq.symm hppos)

/-- The determinant against a fixed normalized ray is a linear functional in
the second point.  In the normalized coordinates the physical center is the
origin, so no affine translation is hidden in this definition. -/
def annularDetLinear (p : Plane) : Plane →ₗ[ℝ] ℝ :=
  { toFun := fun v => p 0 * v 1 - p 1 * v 0
    map_add' := by
      intro u v
      simp [PiLp.add_apply]
      ring
    map_smul' := by
      intro c v
      simp [PiLp.smul_apply]
      ring }

@[simp]
theorem annularDetLinear_apply (p v : Plane) :
    annularDetLinear p v = p 0 * v 1 - p 1 * v 0 :=
  rfl

/-- A point strictly inside the coordinate box bounded by the two inner rays
cannot have the same radius as either inner endpoint. -/
theorem false_of_equal_radius_of_open_coordinate_box
    {a h x y : ℝ}
    (hxlo : -a < x) (hxhi : x < a)
    (hylo : -h < y) (hyhi : y < h)
    (hr : x ^ 2 + y ^ 2 = a ^ 2 + h ^ 2) : False := by
  have hax : 0 < a + x := by nlinarith [hxlo]
  have hax' : 0 < a - x := by nlinarith [hxhi]
  have hhy : 0 < h + y := by nlinarith [hylo]
  have hhy' : 0 < h - y := by nlinarith [hyhi]
  have hxsq : x ^ 2 < a ^ 2 := by
    have hprod : 0 < (a - x) * (a + x) := mul_pos hax' hax
    nlinarith
  have hysq : y ^ 2 < h ^ 2 := by
    have hprod : 0 < (h - y) * (h + y) := mul_pos hhy' hhy
    nlinarith
  nlinarith

end Erdos9796Proof.Geometry

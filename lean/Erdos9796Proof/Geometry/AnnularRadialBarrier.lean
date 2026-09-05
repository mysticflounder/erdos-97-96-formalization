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

end Erdos9796Proof.Geometry

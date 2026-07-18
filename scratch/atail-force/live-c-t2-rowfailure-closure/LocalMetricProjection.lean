/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1Depth5Prefix

/-!
# Exact local metric projection for the LIVE-C `t2` row-failure leaf

This file gives a kernel-checked exact rational Euclidean realization of the
metric information visible at the `liveData_C_center_t2_rowFailure_false`
boundary:

* six distinct base labels;
* the fixed `p`-centered radius row through `q,t1,t2,t3`;
* an original critical-row-shaped four-circle sourced at `t2`, whose first two
  slots are `f2` and `f5`;
* a second four-circle sourced at `f2` and centered at `t2`; and
* the exact `hrowFailure` disjunction used by the production leaf.

This is deliberately a projection model, not a `CounterexampleData`: it does
not claim global K4, convex minimality, cap data, MEC data, or a common
`CriticalShellSystem`.  It proves that exact local Euclidean algebra cannot
negate `hrowFailure`; a closing theorem must use one of those omitted global
inputs.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace LiveCT2RowFailureClosureScratch

noncomputable def pt (x y : ℝ) : ℝ² := !₂[x, y]

noncomputable def sqDist (x y : ℝ²) : ℝ :=
  (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2

private theorem dist_sq_eq_sqDist (x y : ℝ²) :
    dist x y ^ 2 = sqDist x y := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [sqDist, Fin.sum_univ_two, Real.dist_eq, sq_abs]

private theorem dist_eq_one_of_sqDist_eq {x y : ℝ²}
    (h : sqDist x y = 1) : dist x y = 1 := by
  apply (sq_eq_sq₀ dist_nonneg (by norm_num : (0 : ℝ) ≤ 1)).mp
  rw [dist_sq_eq_sqDist, h]
  norm_num

private theorem dist_eq_half_of_sqDist_eq {x y : ℝ²}
    (h : sqDist x y = (1 / 4 : ℝ)) : dist x y = (1 / 2 : ℝ) := by
  apply (sq_eq_sq₀ dist_nonneg (by norm_num : (0 : ℝ) ≤ (1 / 2 : ℝ))).mp
  rw [dist_sq_eq_sqDist, h]
  norm_num

noncomputable def p : ℝ² := pt 0 (-1)
noncomputable def q : ℝ² := pt 1 (-1)
noncomputable def t1 : ℝ² := pt 0 (-2)
noncomputable def t2 : ℝ² := pt 0 0
noncomputable def t3 : ℝ² := pt (-1) (-1)
noncomputable def u : ℝ² := pt 3 3

/- The original `t2` source row has center `t2Blocker`. -/

noncomputable def t2Blocker : ℝ² := pt (1 / 2) 0
noncomputable def f2 : ℝ² := pt 1 0
noncomputable def f5 : ℝ² := pt (1 / 2) (1 / 2)
noncomputable def t2Fourth : ℝ² := pt (1 / 2) (-1 / 2)

/- The extra row sourced at `f2` is centered at `t2`. -/

noncomputable def f2Left : ℝ² := pt (-1) 0
noncomputable def f2Upper : ℝ² := pt 0 1

theorem base_pairwise :
    List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u] := by
  norm_num [p, q, t1, t2, t3, u, pt]

theorem fixed_p_radius :
    dist p q = 1 ∧ dist p t1 = 1 ∧ dist p t2 = 1 ∧ dist p t3 = 1 := by
  repeat' apply And.intro
  all_goals
    apply dist_eq_one_of_sqDist_eq
    norm_num [sqDist, p, q, t1, t2, t3, pt]

theorem original_t2_source_row :
    dist t2Blocker t2 = (1 / 2 : ℝ) ∧
      dist t2Blocker f2 = (1 / 2 : ℝ) ∧
      dist t2Blocker f5 = (1 / 2 : ℝ) ∧
      dist t2Blocker t2Fourth = (1 / 2 : ℝ) := by
  repeat' apply And.intro
  all_goals
    apply dist_eq_half_of_sqDist_eq
    norm_num [sqDist, t2Blocker, t2, f2, f5, t2Fourth, pt]

theorem f2_row_centered_at_t2 :
    dist t2 f2 = 1 ∧ dist t2 f2Left = 1 ∧
      dist t2 f2Upper = 1 ∧ dist t2 p = 1 := by
  repeat' apply And.intro
  all_goals
    apply dist_eq_one_of_sqDist_eq
    norm_num [sqDist, t2, f2, f2Left, f2Upper, p, pt]

/-- The production `hrowFailure` surface is exactly realizable.  Here its
first arm fires: `f5` lies on the original `t2` source row but not on the
extra unit circle centered at `t2`. -/
theorem rowFailure :
    dist t2 f5 ≠ dist t2 f2 ∨
      dist t2 p ≠ dist t2 f2 ∨ dist t2 q ≠ dist t2 f2 := by
  left
  intro h
  have hsq := congrArg (fun r : ℝ => r ^ 2) h
  change dist t2 f5 ^ 2 = dist t2 f2 ^ 2 at hsq
  rw [dist_sq_eq_sqDist, dist_sq_eq_sqDist] at hsq
  norm_num [sqDist, t2, f5, f2, pt] at hsq

/-- One theorem packages the complete checked projection used by the audit. -/
theorem exact_local_projection :
    List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u] ∧
      (dist p q = 1 ∧ dist p t1 = 1 ∧ dist p t2 = 1 ∧ dist p t3 = 1) ∧
      (dist t2Blocker t2 = (1 / 2 : ℝ) ∧
        dist t2Blocker f2 = (1 / 2 : ℝ) ∧
        dist t2Blocker f5 = (1 / 2 : ℝ) ∧
        dist t2Blocker t2Fourth = (1 / 2 : ℝ)) ∧
      (dist t2 f2 = 1 ∧ dist t2 f2Left = 1 ∧
        dist t2 f2Upper = 1 ∧ dist t2 p = 1) ∧
      (dist t2 f5 ≠ dist t2 f2 ∨
        dist t2 p ≠ dist t2 f2 ∨ dist t2 q ≠ dist t2 f2) :=
  ⟨base_pairwise, fixed_p_radius, original_t2_source_row,
    f2_row_centered_at_t2, rowFailure⟩

#print axioms exact_local_projection

end LiveCT2RowFailureClosureScratch
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# A finite homogeneous Farkas consumer for Kalmanson cores

This scratch module separates theorem discovery from proof checking.  An
external linear solver may choose a finite family of strict homogeneous
inequalities, equality constraints, and rational multipliers.  Lean checks
coefficientwise cancellation and combines the already-proved geometric
inequalities to obtain `False`.

The smoke theorem at the end checks the four-constraint `Fin 12` core:

```text
d01 = d02
d01 = d03
d12 = d13
d03 + d12 < d02 + d13
```

The coefficient arrays are typed over `ℝ` so that they apply directly to
distance expressions.  Certificate emitters should write only rational
literals; the resulting cancellation fields are discharged by `norm_num`.
-/

open scoped BigOperators Convex EuclideanGeometry

namespace Problem97
namespace KalmansonFarkasConsumer

/-- A homogeneous linear form in `n` real variables. -/
def LinearForm (n : Nat) := Fin n → ℝ

/-- Evaluate a homogeneous linear form. -/
def LinearForm.eval {n : Nat} (f : LinearForm n) (x : Fin n → ℝ) : ℝ :=
  ∑ k, f k * x k

/-- A finite Farkas certificate.

`strictForm i` is interpreted as the constraint
`0 < (strictForm i).eval x`, while `equalityForm j` is interpreted as
`(equalityForm j).eval x = 0`.

Strict multipliers must be nonnegative and at least one must be positive.
Equality multipliers are unrestricted.  The final field is the only symbolic
certificate obligation: the weighted coefficient vector is zero. -/
structure HomogeneousFarkasCore (n strictCount equalityCount : Nat) where
  strictForm : Fin strictCount → LinearForm n
  equalityForm : Fin equalityCount → LinearForm n
  strictWeight : Fin strictCount → ℝ
  equalityWeight : Fin equalityCount → ℝ
  strictWeight_nonneg : ∀ i, 0 ≤ strictWeight i
  some_strictWeight_pos : ∃ i, 0 < strictWeight i
  coefficient_cancel :
    ∀ k, (∑ i, strictWeight i * strictForm i k) +
      ∑ j, equalityWeight j * equalityForm j k = 0

/-- Kernel-checked endpoint for a finite homogeneous Farkas certificate. -/
theorem HomogeneousFarkasCore.false_of_realization
    {n strictCount equalityCount : Nat}
    (C : HomogeneousFarkasCore n strictCount equalityCount)
    (x : Fin n → ℝ)
    (hstrict : ∀ i, 0 < (C.strictForm i).eval x)
    (hequality : ∀ j, (C.equalityForm j).eval x = 0) :
    False := by
  have hstrictSum :
      0 < ∑ i, C.strictWeight i * (C.strictForm i).eval x := by
    obtain ⟨i, hi⟩ := C.some_strictWeight_pos
    apply Finset.sum_pos'
    · intro j hj
      exact mul_nonneg (C.strictWeight_nonneg j) (le_of_lt (hstrict j))
    · exact ⟨i, Finset.mem_univ i, mul_pos hi (hstrict i)⟩
  have hequalitySum :
      (∑ j, C.equalityWeight j * (C.equalityForm j).eval x) = 0 := by
    apply Finset.sum_eq_zero
    intro j hj
    rw [hequality j, mul_zero]
  have hstrictExpand :
      (∑ i, C.strictWeight i * (C.strictForm i).eval x) =
        ∑ k, (∑ i, C.strictWeight i * C.strictForm i k) * x k := by
    simp only [LinearForm.eval, Finset.mul_sum]
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro k hk
    simp_rw [← mul_assoc]
    rw [← Finset.sum_mul]
  have hequalityExpand :
      (∑ j, C.equalityWeight j * (C.equalityForm j).eval x) =
        ∑ k, (∑ j, C.equalityWeight j * C.equalityForm j k) * x k := by
    simp only [LinearForm.eval, Finset.mul_sum]
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro k hk
    simp_rw [← mul_assoc]
    rw [← Finset.sum_mul]
  have hcombination :
      (∑ i, C.strictWeight i * (C.strictForm i).eval x) +
        ∑ j, C.equalityWeight j * (C.equalityForm j).eval x = 0 := by
    rw [hstrictExpand, hequalityExpand, ← Finset.sum_add_distrib]
    apply Finset.sum_eq_zero
    intro k hk
    rw [← add_mul, C.coefficient_cancel k, zero_mul]
  linarith

/-- The normalized four-constraint `Fin 12` certificate.

The five variables are ordered as `d01, d02, d03, d12, d13`.  The unique
strict form is `d02 + d13 - d03 - d12`; the three equality forms are
`d01 - d02`, `d01 - d03`, and `d12 - d13`.  Multipliers
`1; 1, -1, 1` cancel coefficientwise. -/
def fin12FourConstraintCore : HomogeneousFarkasCore 5 1 3 where
  strictForm := fun _ => ![0, 1, -1, -1, 1]
  equalityForm := ![
    ![1, -1, 0, 0, 0],
    ![1, 0, -1, 0, 0],
    ![0, 0, 0, 1, -1]
  ]
  strictWeight := fun _ => 1
  equalityWeight := ![1, -1, 1]
  strictWeight_nonneg := by
    intro i
    norm_num
  some_strictWeight_pos := by
    exact ⟨0, by norm_num⟩
  coefficient_cancel := by
    intro k
    fin_cases k <;> norm_num [Fin.sum_univ_succ]

/-- Smoke-check the `Fin 12` four-constraint core using the production
Kalmanson bridge for the only strict inequality. -/
theorem false_of_fin12_four_constraint_core
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (hrow0_12 : dist (boundary i0) (boundary i1) =
      dist (boundary i0) (boundary i2))
    (hrow0_13 : dist (boundary i0) (boundary i1) =
      dist (boundary i0) (boundary i3))
    (hrow1_23 : dist (boundary i1) (boundary i2) =
      dist (boundary i1) (boundary i3)) :
    False := by
  let x : Fin 5 → ℝ := ![
    dist (boundary i0) (boundary i1),
    dist (boundary i0) (boundary i2),
    dist (boundary i0) (boundary i3),
    dist (boundary i1) (boundary i2),
    dist (boundary i1) (boundary i3)
  ]
  apply fin12FourConstraintCore.false_of_realization x
  · intro i
    fin_cases i
    have hkal :=
      CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
        hcarrier hboundary_injective hboundary_image hboundary_ccw
        h01 h12 h23
    norm_num [LinearForm.eval, fin12FourConstraintCore, x, Fin.sum_univ_succ]
    linarith
  · intro j
    fin_cases j
    · norm_num [LinearForm.eval, fin12FourConstraintCore, x, Fin.sum_univ_succ]
      linarith
    · norm_num [LinearForm.eval, fin12FourConstraintCore, x, Fin.sum_univ_succ]
      linarith
    · norm_num [LinearForm.eval, fin12FourConstraintCore, x, Fin.sum_univ_succ]
      linarith

/-- End-to-end selected-row wrapper for the smoke certificate.  This is the
input shape available to a finite selected-row search before it is lowered to
distance equalities. -/
theorem false_of_fin12_selected_rows_four_constraint_core
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row1 : SelectedFourClass carrier (boundary i1))
    (hi1_mem_Row0 : boundary i1 ∈ Row0.support)
    (hi2_mem_Row0 : boundary i2 ∈ Row0.support)
    (hi3_mem_Row0 : boundary i3 ∈ Row0.support)
    (hi2_mem_Row1 : boundary i2 ∈ Row1.support)
    (hi3_mem_Row1 : boundary i3 ∈ Row1.support) :
    False := by
  have hrow0_12 :
      dist (boundary i0) (boundary i1) = dist (boundary i0) (boundary i2) :=
    (Row0.support_eq_radius _ hi1_mem_Row0).trans
      (Row0.support_eq_radius _ hi2_mem_Row0).symm
  have hrow0_13 :
      dist (boundary i0) (boundary i1) = dist (boundary i0) (boundary i3) :=
    (Row0.support_eq_radius _ hi1_mem_Row0).trans
      (Row0.support_eq_radius _ hi3_mem_Row0).symm
  have hrow1_23 :
      dist (boundary i1) (boundary i2) = dist (boundary i1) (boundary i3) :=
    (Row1.support_eq_radius _ hi2_mem_Row1).trans
      (Row1.support_eq_radius _ hi3_mem_Row1).symm
  exact false_of_fin12_four_constraint_core
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    h01 h12 h23 hrow0_12 hrow0_13 hrow1_23

#print axioms HomogeneousFarkasCore.false_of_realization
#print axioms false_of_fin12_four_constraint_core
#print axioms false_of_fin12_selected_rows_four_constraint_core

end KalmansonFarkasConsumer
end Problem97

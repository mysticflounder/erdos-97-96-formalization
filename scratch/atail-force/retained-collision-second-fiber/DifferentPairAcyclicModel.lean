/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalFiberRetainedRadiusSelector

/-!
# Exact acyclic-order model for the first different-pair continuation

This rational strictly convex six-point configuration realizes the three
local equality pairs supplied by a retained collision, a fresh first-apex
point, and one actual cross-row hit.  Its boundary order is

```text
O < J < X < C < A < K.
```

The collision pair `C,K` alternates across `O,A`, but this order is one of the
five order types left acyclic by ordinal Kalmanson closure.  The model does
not claim a global critical-shell system; it is a regression showing that the
cross incidence alone does not determine a contradictory cyclic placement.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRetainedCollisionDifferentPairAcyclicModel

set_option maxHeartbeats 2000000

noncomputable def pt (x y : ℝ) : ℝ² := !₂[x, y]

noncomputable def sqDist (x y : ℝ²) : ℝ :=
  (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2

private theorem dist_sq_eq_sqDist (x y : ℝ²) :
    dist x y ^ 2 = sqDist x y := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [sqDist, Fin.sum_univ_two, Real.dist_eq, sq_abs]

private theorem dist_eq_of_sqDist_eq {x y z w : ℝ²}
    (h : sqDist x y = sqDist z w) :
    dist x y = dist z w := by
  apply (sq_eq_sq₀ dist_nonneg dist_nonneg).mp
  rw [dist_sq_eq_sqDist, dist_sq_eq_sqDist, h]

noncomputable def O : ℝ² := pt 0 0
noncomputable def J : ℝ² := pt 1 0
noncomputable def X : ℝ² := pt (495 / 4913) (-4888 / 4913)
noncomputable def C : ℝ² := pt (-31679 / 83521) (-77280 / 83521)
noncomputable def A : ℝ² := pt (-1093425 / 1419857) (-905768 / 1419857)
noncomputable def K : ℝ² := pt (-23647519 / 24137569) (-4839120 / 24137569)

/-- Clockwise in the ordinary coordinate convention and hence CCW in the
project's descending-signed-area convention. -/
noncomputable def boundary : Fin 6 → ℝ² := ![O, J, X, C, A, K]

noncomputable def carrier : Finset ℝ² := Finset.univ.image boundary

theorem boundary_injective : Function.Injective boundary := by
  intro i j hij
  fin_cases i <;> fin_cases j
  all_goals
    first
    | rfl
    | norm_num [boundary, O, J, X, C, A, K, pt] at hij

theorem boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
  apply ccw_of_hneg boundary_injective
  intro i j k hij hjk
  fin_cases i <;> fin_cases j <;> fin_cases k
  all_goals norm_num at hij
  all_goals norm_num at hjk
  all_goals norm_num [boundary, O, J, X, C, A, K, pt, signedArea2]

noncomputable def normal : Fin 6 → ℝ² :=
  ![pt (-495 / 4913) (4888 / 4913), J, X, C, A, K]

noncomputable def dot2 (u x : ℝ²) : ℝ := u 0 * x 0 + u 1 * x 1

noncomputable def dotLinear (u : ℝ²) : ℝ² →ₗ[ℝ] ℝ where
  toFun := dot2 u
  map_add' := by
    intro x y
    simp [dot2]
    ring
  map_smul' := by
    intro a x
    simp [dot2]
    ring

@[simp] private theorem dotLinear_apply (u x : ℝ²) :
    dotLinear u x = dot2 u x := rfl

theorem normal_unique_max :
    ∀ i j : Fin 6, i ≠ j →
      dot2 (normal i) (boundary j) < dot2 (normal i) (boundary i) := by
  intro i j hij
  fin_cases i <;> fin_cases j <;>
    norm_num [normal, boundary, dot2, O, J, X, C, A, K, pt] at *

private theorem convexIndep_image_of_unique_linear_max
    {n : ℕ} (P N : Fin n → ℝ²)
    (hmax : ∀ i j : Fin n, i ≠ j →
      dot2 (N i) (P j) < dot2 (N i) (P i)) :
    ConvexIndep (Finset.univ.image P) := by
  intro a ha
  have haFin : a ∈ Finset.univ.image P := by simpa using ha
  rcases Finset.mem_image.mp haFin with ⟨i, _hi, rfl⟩
  let f := dotLinear (N i)
  let U : Set ℝ² := f ⁻¹' Set.Iio (f (P i))
  have hsub :
      ((↑(Finset.univ.image P) : Set ℝ²) \ {P i}) ⊆ U := by
    intro x hx
    have hxFin : x ∈ Finset.univ.image P := by simpa using hx.1
    rcases Finset.mem_image.mp hxFin with ⟨j, _hj, rfl⟩
    have hij : i ≠ j := by
      intro hij
      subst j
      exact hx.2 rfl
    exact hmax i j hij
  have hconv : Convex ℝ U :=
    (convex_Iio (f (P i))).linear_preimage f
  intro hmem
  have hU := convexHull_min hsub hconv hmem
  exact (lt_irrefl (f (P i))) hU

theorem carrier_convexIndep : ConvexIndep carrier := by
  exact convexIndep_image_of_unique_linear_max boundary normal normal_unique_max

/-- The local equality surface: `OJ = OC = OK`, `AC = AK`, and `XJ = XK`. -/
theorem different_pair_distance_equalities :
    dist O J = dist O C ∧
      dist O C = dist O K ∧
      dist A C = dist A K ∧
      dist X J = dist X K := by
  refine ⟨?_, ?_, ?_, ?_⟩
  all_goals
    apply dist_eq_of_sqDist_eq
    norm_num [O, J, X, C, A, K, pt, sqDist]

/-- The collision sources still have the mandatory alternating placement. -/
theorem collision_alternation :
    SurplusCOMPGBank.btw (0 : Fin 6) 4 3 ↔
      ¬ SurplusCOMPGBank.btw (0 : Fin 6) 4 5 := by
  decide

theorem distinguished_pairwise :
    O ≠ A ∧ C ≠ K ∧ J ≠ C ∧ J ≠ K ∧ X ≠ O ∧ X ≠ A := by
  norm_num [O, J, X, C, A, K, pt]

#print axioms boundary_injective
#print axioms boundary_ccw
#print axioms carrier_convexIndep
#print axioms different_pair_distance_equalities
#print axioms collision_alternation

end ATailRetainedCollisionDifferentPairAcyclicModel
end Problem97

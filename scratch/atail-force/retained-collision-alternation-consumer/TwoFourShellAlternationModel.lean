/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalFiberRetainedRadiusSelector

/-!
# Exact two-four-shell alternation model

This exact rational configuration isolates the metric and cyclic-order data
available immediately from a retained-radius blocker collision.  It has two
distinct carrier centers, two distinct common points, and an exact four-point
shell at each center.  The shells meet in exactly the two common points, which
alternate across the centers on the convex boundary.

It is not a `CounterexampleData`: no global K4 map or deletion-criticality is
claimed.  Its purpose is to rule out any direct consumer using only the two
four-shell equalities, the two-circle intersection bound, convexity, and the
mandatory alternation.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace RetainedCollisionAlternationConsumerScratch

set_option maxHeartbeats 2000000

noncomputable def pt (x y : ℝ) : ℝ² := !₂[x, y]

noncomputable def sqDist (x y : ℝ²) : ℝ :=
  (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2

private theorem dist_sq_eq_sqDist (x y : ℝ²) :
    dist x y ^ 2 = sqDist x y := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [sqDist, Fin.sum_univ_two, Real.dist_eq, sq_abs]

private theorem dist_eq_five_of_sqDist_eq {x y : ℝ²}
    (h : sqDist x y = 25) : dist x y = 5 := by
  apply (sq_eq_sq₀ dist_nonneg (by norm_num : (0 : ℝ) ≤ 5)).mp
  rw [dist_sq_eq_sqDist]
  norm_num [h]

noncomputable def firstCenter : ℝ² := pt (-3) 0
noncomputable def upperLeft : ℝ² := pt (-1) 3
noncomputable def upperCommon : ℝ² := pt 0 4
noncomputable def upperRight : ℝ² := pt 1 3
noncomputable def commonBlocker : ℝ² := pt 3 0
noncomputable def lowerRight : ℝ² := pt 1 (-3)
noncomputable def lowerCommon : ℝ² := pt 0 (-4)
noncomputable def lowerLeft : ℝ² := pt (-1) (-3)

/-- Clockwise in the usual coordinate orientation, hence CCW in the
project's descending-signed-area convention. -/
noncomputable def boundary : Fin 8 → ℝ² :=
  ![firstCenter, upperLeft, upperCommon, upperRight, commonBlocker,
    lowerRight, lowerCommon, lowerLeft]

noncomputable def carrier : Finset ℝ² := Finset.univ.image boundary

theorem boundary_injective : Function.Injective boundary := by
  intro i j hij
  fin_cases i <;> fin_cases j
  all_goals
    first
    | rfl
    | norm_num [boundary, firstCenter, upperLeft, upperCommon, upperRight,
        commonBlocker, lowerRight, lowerCommon, lowerLeft, pt] at hij

theorem boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
  apply ccw_of_hneg boundary_injective
  intro i j k hij hjk
  fin_cases i <;> fin_cases j <;> fin_cases k
  all_goals norm_num at hij
  all_goals norm_num at hjk
  all_goals
    norm_num [boundary, firstCenter, upperLeft, upperCommon, upperRight,
      commonBlocker, lowerRight, lowerCommon, lowerLeft, pt, signedArea2]

noncomputable def normal : Fin 8 → ℝ² :=
  ![pt (-1) 0, pt (-6) 5, pt 0 1, pt 6 5, pt 1 0,
    pt 6 (-5), pt 0 (-1), pt (-6) (-5)]

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
    ∀ i j : Fin 8, i ≠ j →
      dot2 (normal i) (boundary j) < dot2 (normal i) (boundary i) := by
  intro i j hij
  fin_cases i <;> fin_cases j <;>
    norm_num [normal, boundary, dot2, firstCenter, upperLeft, upperCommon,
      upperRight, commonBlocker, lowerRight, lowerCommon, lowerLeft, pt] at *

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

/-- The first center has an exact four-point squared-radius-25 shell in the
carrier. -/
theorem first_shell_exact :
    ∀ z ∈ carrier, sqDist firstCenter z = 25 ↔
      z = upperCommon ∨ z = upperRight ∨
        z = lowerRight ∨ z = lowerCommon := by
  intro z hz
  rcases Finset.mem_image.mp hz with ⟨i, _hi, rfl⟩
  fin_cases i <;>
    norm_num [boundary, firstCenter, upperLeft, upperCommon, upperRight,
      commonBlocker, lowerRight, lowerCommon, lowerLeft, pt, sqDist]

/-- The common blocker has a second exact four-point squared-radius-25 shell. -/
theorem blocker_shell_exact :
    ∀ z ∈ carrier, sqDist commonBlocker z = 25 ↔
      z = upperLeft ∨ z = upperCommon ∨
        z = lowerCommon ∨ z = lowerLeft := by
  intro z hz
  rcases Finset.mem_image.mp hz with ⟨i, _hi, rfl⟩
  fin_cases i <;>
    norm_num [boundary, firstCenter, upperLeft, upperCommon, upperRight,
      commonBlocker, lowerRight, lowerCommon, lowerLeft, pt, sqDist]

/-- Metric equalities of the two four-point shells, in the exact `dist`
language consumed by the Kalmanson and selected-row theorem banks. -/
theorem two_four_shell_distance_equalities :
    (dist firstCenter upperCommon = 5 ∧
      dist firstCenter upperRight = 5 ∧
      dist firstCenter lowerRight = 5 ∧
      dist firstCenter lowerCommon = 5) ∧
    (dist commonBlocker upperLeft = 5 ∧
      dist commonBlocker upperCommon = 5 ∧
      dist commonBlocker lowerCommon = 5 ∧
      dist commonBlocker lowerLeft = 5) := by
  refine ⟨⟨?_, ?_, ?_, ?_⟩, ⟨?_, ?_, ?_, ?_⟩⟩
  all_goals
    apply dist_eq_five_of_sqDist_eq
    norm_num [firstCenter, upperLeft, upperCommon, upperRight,
      commonBlocker, lowerRight, lowerCommon, lowerLeft, pt, sqDist]

/-- The two exact shells share precisely the two collision points. -/
theorem common_points_exact :
    ∀ z ∈ carrier,
      (sqDist firstCenter z = 25 ∧ sqDist commonBlocker z = 25) ↔
        z = upperCommon ∨ z = lowerCommon := by
  intro z hz
  rcases Finset.mem_image.mp hz with ⟨i, _hi, rfl⟩
  fin_cases i <;>
    norm_num [boundary, firstCenter, upperLeft, upperCommon, upperRight,
      commonBlocker, lowerRight, lowerCommon, lowerLeft, pt, sqDist]

/-- The two collision sources alternate across the two centers in the exact
displayed convex order. -/
theorem collision_alternation :
    SurplusCOMPGBank.btw (0 : Fin 8) 4 2 ↔
      ¬ SurplusCOMPGBank.btw (0 : Fin 8) 4 6 := by
  decide

/-- All four distinguished points are different. -/
theorem distinguished_pairwise :
    firstCenter ≠ commonBlocker ∧ upperCommon ≠ lowerCommon ∧
      firstCenter ≠ upperCommon ∧ commonBlocker ≠ upperCommon := by
  norm_num [firstCenter, commonBlocker, upperCommon, lowerCommon, pt]

#print axioms boundary_injective
#print axioms boundary_ccw
#print axioms carrier_convexIndep
#print axioms first_shell_exact
#print axioms blocker_shell_exact
#print axioms two_four_shell_distance_equalities
#print axioms common_points_exact
#print axioms collision_alternation

end RetainedCollisionAlternationConsumerScratch
end Problem97

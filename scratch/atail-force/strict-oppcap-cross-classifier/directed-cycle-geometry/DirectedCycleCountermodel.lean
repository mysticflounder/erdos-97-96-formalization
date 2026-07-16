/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ConvexCyclicOrder.Basic

/-!
# Exact cap-local directed-cycle countermodel

This exact rational configuration shows that strict convexity, a non-obtuse
circumscribed Moser triangle, an exact card-five first-apex circle, and three
distinct blocker centers in the same strict cap do not exclude a directed
three-cycle of pair bisectors.

The boundary order is

`o, left, q0, c0, c2, q1, c1, q2, right`.

The Moser triangle is `(o,left,right)`.  Its opposite cap contains the seven
points from `left` through `right`; `q0,q1,q2,c0,c1,c2` are strict interior
points of that cap.  The five points `left,q0,q1,q2,right` lie on the same
circle centered at `o`, whereas the three blocker centers do not.  Finally,
`c0` bisects `q0,q1`, `c1` bisects `q1,q2`, and `c2` bisects `q2,q0`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailDirectedCycleGeometryScratch

set_option maxHeartbeats 2000000

/-- A point of the project plane from two coordinates. -/
noncomputable def pt (x y : ℝ) : ℝ² := !₂[x, y]

/-- Coordinate squared distance. -/
noncomputable def sqDist (x y : ℝ²) : ℝ :=
  (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2

private theorem dist_sq_eq_sqDist (x y : ℝ²) :
    dist x y ^ 2 = sqDist x y := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [sqDist, Fin.sum_univ_two, Real.dist_eq, sq_abs]

private theorem dist_eq_of_sqDist_eq {c a b : ℝ²}
    (h : sqDist c a = sqDist c b) :
    dist c a = dist c b := by
  apply (sq_eq_sq₀ dist_nonneg dist_nonneg).mp
  simpa only [dist_sq_eq_sqDist] using h

noncomputable def o : ℝ² := pt 0 0
noncomputable def left : ℝ² := pt (399 / 401) (-40 / 401)
noncomputable def q0 : ℝ² := pt 1 0
noncomputable def c0 : ℝ² := pt (7007 / 7400) (3003 / 9250)
noncomputable def c2 : ℝ² := pt (1001 / 1250) (3003 / 5000)
noncomputable def q1 : ℝ² := pt (1081 / 1369) (840 / 1369)
noncomputable def c1 : ℝ² := pt (13013 / 23125) (153153 / 185000)
noncomputable def q2 : ℝ² := pt (7 / 25) (24 / 25)
noncomputable def right : ℝ² := pt (11 / 61) (60 / 61)

/-- Counter-clockwise boundary enumeration of the exact configuration. -/
noncomputable def boundary : Fin 9 → ℝ² :=
  ![o, left, q0, c0, c2, q1, c1, q2, right]

/-- The nine-point carrier. -/
noncomputable def carrier : Finset ℝ² := Finset.univ.image boundary

/-- Cyclic successor in the displayed boundary enumeration. -/
noncomputable def nextBoundary : Fin 9 → Fin 9 :=
  ![1, 2, 3, 4, 5, 6, 7, 8, 0]

/-- The point following each vertex in the displayed cyclic enumeration. -/
noncomputable def nextBoundaryPoint : Fin 9 → ℝ² :=
  ![left, q0, c0, c2, q1, c1, q2, right, o]

/-- Twice-oriented area certificate for every boundary edge.  Every other
carrier point lies strictly on the interior side of each directed edge. -/
theorem boundary_strict_edge_halfplanes :
    ∀ i j : Fin 9, j ≠ i → j ≠ nextBoundary i →
      0 < signedArea2 (boundary i) (nextBoundaryPoint i) (boundary j) := by
  intro i j hji hjnext
  fin_cases i <;> fin_cases j <;>
    norm_num [boundary, o, left, q0, c0, c2, q1, c1, q2, right,
      nextBoundary, nextBoundaryPoint, pt, signedArea2] at *
  all_goals exact hjnext rfl

/-- An explicit outward supporting normal at each boundary vertex. -/
noncomputable def normal : Fin 9 → ℝ² :=
  ![
    pt (-26500 / 24461) (-19928 / 24461),
    pt 0 (-1),
    pt (1574203 / 3709250) (142793 / 2967400),
    pt (3003 / 5000) (249 / 1250),
    pt (98889 / 342250) (43059 / 273800),
    pt (21021 / 92500) (11011 / 46250),
    pt (11856 / 34225) (17442 / 34225),
    pt (1757667 / 11285000) (539418 / 1410625),
    pt (-24 / 25) (7 / 25)]

noncomputable def dot2 (u x : ℝ²) : ℝ :=
  u 0 * x 0 + u 1 * x 1

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

/-- Each supporting normal is uniquely maximized at its named vertex. -/
theorem normal_unique_max :
    ∀ i j : Fin 9, i ≠ j →
      dot2 (normal i) (boundary j) < dot2 (normal i) (boundary i) := by
  intro i j hij
  fin_cases i <;> fin_cases j <;>
    norm_num [normal, boundary, dot2, o, left, q0, c0, c2, q1, c1,
      q2, right, pt] at *

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

/-- The carrier is convex independent in the project's exact sense. -/
theorem carrier_convexIndep : ConvexIndep carrier := by
  exact convexIndep_image_of_unique_linear_max boundary normal normal_unique_max

/-- The three source points lie on one radius-one circle about `o`. -/
theorem source_first_circle :
    sqDist o q0 = 1 ∧ sqDist o q1 = 1 ∧ sqDist o q2 = 1 := by
  norm_num [sqDist, o, q0, q1, q2, pt]

/-- The two cap endpoints are the remaining points on that circle. -/
theorem endpoint_first_circle :
    sqDist o left = 1 ∧ sqDist o right = 1 := by
  norm_num [sqDist, o, left, right, pt]

/-- All three blockers are off the first-apex circle. -/
theorem blocker_first_circle_sq :
    sqDist o c0 = 1002001 / 1000000 ∧
    sqDist o c1 = 1002001 / 1000000 ∧
    sqDist o c2 = 1002001 / 1000000 := by
  norm_num [sqDist, o, c0, c1, c2, pt]

/-- Exact directed three-cycle of pair bisectors. -/
theorem directed_cycle_bisectors :
    dist c0 q0 = dist c0 q1 ∧
    dist c1 q1 = dist c1 q2 ∧
    dist c2 q2 = dist c2 q0 := by
  constructor
  · apply dist_eq_of_sqDist_eq
    norm_num [sqDist, c0, q0, q1, pt]
  constructor
  · apply dist_eq_of_sqDist_eq
    norm_num [sqDist, c1, q1, q2, pt]
  · apply dist_eq_of_sqDist_eq
    norm_num [sqDist, c2, q2, q0, pt]

/-- The blocker centers are pairwise distinct. -/
theorem blocker_centers_pairwise : c0 ≠ c1 ∧ c1 ≠ c2 ∧ c2 ≠ c0 := by
  constructor
  · intro h
    have := congrArg (fun x : ℝ² => x 0) h
    norm_num [c0, c1, pt] at this
  constructor
  · intro h
    have := congrArg (fun x : ℝ² => x 0) h
    norm_num [c1, c2, pt] at this
  · intro h
    have := congrArg (fun x : ℝ² => x 0) h
    norm_num [c2, c0, pt] at this

noncomputable def mecCenter : ℝ² := pt (25 / 46) (47 / 115)
noncomputable def mecRadiusSq : ℝ := 24461 / 52900

/-- The three Moser vertices lie on the displayed circumscribed circle. -/
theorem moser_vertices_on_circle :
    sqDist mecCenter o = mecRadiusSq ∧
    sqDist mecCenter left = mecRadiusSq ∧
    sqDist mecCenter right = mecRadiusSq := by
  norm_num [sqDist, mecCenter, mecRadiusSq, o, left, right, pt]

/-- Every carrier point lies in the displayed circumscribed disk. -/
theorem carrier_in_mec_disk :
    ∀ x ∈ carrier, sqDist mecCenter x ≤ mecRadiusSq := by
  intro x hx
  rcases Finset.mem_image.mp hx with ⟨i, _hi, rfl⟩
  fin_cases i <;>
    norm_num [boundary, sqDist, mecCenter, mecRadiusSq, o, left, q0,
      c0, c2, q1, c1, q2, right, pt]

/-- The circumscribed Moser triangle `(o,left,right)` is non-obtuse, stated
as the three squared-side inequalities. -/
theorem moser_triangle_nonobtuse_sq :
    sqDist left right ≤ sqDist o left + sqDist o right ∧
    sqDist o right ≤ sqDist left right + sqDist left o ∧
    sqDist o left ≤ sqDist right o + sqDist right left := by
  norm_num [sqDist, o, left, right, pt]

#print axioms boundary_strict_edge_halfplanes
#print axioms normal_unique_max
#print axioms carrier_convexIndep
#print axioms source_first_circle
#print axioms endpoint_first_circle
#print axioms blocker_first_circle_sq
#print axioms directed_cycle_bisectors
#print axioms blocker_centers_pairwise
#print axioms moser_vertices_on_circle
#print axioms carrier_in_mec_disk
#print axioms moser_triangle_nonobtuse_sq

end ATailDirectedCycleGeometryScratch
end Problem97

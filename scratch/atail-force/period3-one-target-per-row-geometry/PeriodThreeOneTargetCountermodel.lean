/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ConvexCyclicOrder.Basic

/-!
# Exact period-three one-target-per-row countermodel

This exact rational configuration retains the period-three physical
source/blocker order and adds one complementary-cap point to each blocker
circle.  All twelve named points are strict vertices of one convex polygon
inside the circumdisk of a non-obtuse Moser triangle.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailPeriodThreeOneTargetScratch

set_option maxHeartbeats 10000000
set_option maxRecDepth 100000

noncomputable def pt (x y : ℝ) : ℝ² := !₂[x, y]

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
noncomputable def x2 : ℝ² :=
  pt (5709532624005750163633301442 / 10558268520692342394855812473)
    (-206886191524816033406094481 / 10558268520692342394855812473)
noncomputable def x0 : ℝ² :=
  pt (1332912016706046363785771510577 / 1546067827580494199987254113215)
    (-12991519090002951923965079044 / 1546067827580494199987254113215)
noncomputable def left : ℝ² := pt 1 0
noncomputable def q0 : ℝ² := pt (8499950751 / 8501729249) (173889200 / 8501729249)
noncomputable def c0 : ℝ² :=
  pt (55168867922060455102763 / 64608986813751476892653)
    (24144462244920032707858 / 64608986813751476892653)
noncomputable def c2 : ℝ² :=
  pt (22336989984912180324 / 31514510439806588909)
    (22225825546873300746 / 31514510439806588909)
noncomputable def q1 : ℝ² := pt (420578795 / 606553693) (437059332 / 606553693)
noncomputable def c1 : ℝ² :=
  pt (1547653556960325120 / 4287704977055535043)
    (3703691880860707200 / 4287704977055535043)
noncomputable def q2 : ℝ² := pt (1965 / 77237) (77212 / 77237)
noncomputable def right : ℝ² := pt (786084 / 228524365) (228523013 / 228524365)
noncomputable def x1 : ℝ² :=
  pt (-16622169154732111699632373 / 137840602031369842224657983875)
    (115529322458836189914672989364 / 137840602031369842224657983875)

/-- The exact counter-clockwise boundary order. -/
noncomputable def boundary : Fin 12 → ℝ² :=
  ![o, x2, x0, left, q0, c0, c2, q1, c1, q2, right, x1]

noncomputable def carrier : Finset ℝ² := Finset.univ.image boundary

noncomputable def nextBoundary : Fin 12 → Fin 12 :=
  ![1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 0]

noncomputable def nextBoundaryPoint : Fin 12 → ℝ² :=
  ![x2, x0, left, q0, c0, c2, q1, c1, q2, right, x1, o]

noncomputable def previousBoundaryPoint : Fin 12 → ℝ² :=
  ![x1, o, x2, x0, left, q0, c0, c2, q1, c1, q2, right]

/-- Every non-edge point is strictly inside every directed boundary edge. -/
theorem boundary_strict_edge_halfplanes :
    ∀ i j : Fin 12, j ≠ i → j ≠ nextBoundary i →
      0 < signedArea2 (boundary i) (nextBoundaryPoint i) (boundary j) := by
  intro i j hji hjnext
  fin_cases i <;> fin_cases j <;>
    norm_num [boundary, o, x2, x0, left, q0, c0, c2, q1, c1, q2, right, x1,
      nextBoundary, nextBoundaryPoint, pt, signedArea2] at *
  all_goals exact hjnext rfl

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

/-- The clockwise normal to the chord joining the neighboring vertices. -/
noncomputable def normal (i : Fin 12) : ℝ² :=
  pt ((nextBoundaryPoint i) 1 - (previousBoundaryPoint i) 1)
    ((previousBoundaryPoint i) 0 - (nextBoundaryPoint i) 0)

theorem normal_unique_max :
    ∀ i j : Fin 12, i ≠ j →
      dot2 (normal i) (boundary j) < dot2 (normal i) (boundary i) := by
  intro i j hij
  fin_cases i <;> fin_cases j <;>
    norm_num [normal, previousBoundaryPoint, nextBoundaryPoint, boundary, dot2,
      o, x2, x0, left, q0, c0, c2, q1, c1, q2, right, x1, pt] at *

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
  have hsub : ((↑(Finset.univ.image P) : Set ℝ²) \ {P i}) ⊆ U := by
    intro z hz
    have hzFin : z ∈ Finset.univ.image P := by simpa using hz.1
    rcases Finset.mem_image.mp hzFin with ⟨j, _hj, rfl⟩
    have hij : i ≠ j := by
      intro hij
      subst j
      exact hz.2 rfl
    exact hmax i j hij
  have hconv : Convex ℝ U := (convex_Iio (f (P i))).linear_preimage f
  intro hmem
  have hU := convexHull_min hsub hconv hmem
  exact (lt_irrefl (f (P i))) hU

/-- The twelve-point carrier is convex independent. -/
theorem carrier_convexIndep : ConvexIndep carrier := by
  exact convexIndep_image_of_unique_linear_max boundary normal normal_unique_max

/-- The physical-apex radius class on the named carrier has exactly five points. -/
theorem physical_radius_class_on_boundary :
    ∀ i : Fin 12, sqDist o (boundary i) = 1 ↔
      i = 3 ∨ i = 4 ∨ i = 7 ∨ i = 9 ∨ i = 10 := by
  intro i
  fin_cases i <;>
    norm_num [boundary, sqDist, o, x2, x0, left, q0, c0, c2, q1, c1, q2,
      right, x1, pt] <;> decide

/-- Each blocker circle contains its adjacent physical sources and one target. -/
theorem three_one_target_rows :
    dist c0 q0 = dist c0 q1 ∧ dist c0 q0 = dist c0 x0 ∧
    dist c1 q1 = dist c1 q2 ∧ dist c1 q1 = dist c1 x1 ∧
    dist c2 q2 = dist c2 q0 ∧ dist c2 q2 = dist c2 x2 := by
  repeat' apply And.intro
  all_goals apply dist_eq_of_sqDist_eq
  all_goals norm_num [sqDist, c0, c1, c2, q0, q1, q2, x0, x1, x2, pt]

/-- On the named carrier, row zero has precisely its two sources and target. -/
theorem row0_radius_class_on_boundary :
    ∀ i : Fin 12, sqDist c0 (boundary i) = sqDist c0 q0 ↔
      i = 2 ∨ i = 4 ∨ i = 7 := by
  intro i
  fin_cases i <;>
    norm_num [boundary, sqDist, o, x2, x0, left, q0, c0, c2, q1, c1, q2,
      right, x1, pt] <;> decide

/-- On the named carrier, row one has precisely its two sources and target. -/
theorem row1_radius_class_on_boundary :
    ∀ i : Fin 12, sqDist c1 (boundary i) = sqDist c1 q1 ↔
      i = 7 ∨ i = 9 ∨ i = 11 := by
  intro i
  fin_cases i <;>
    norm_num [boundary, sqDist, o, x2, x0, left, q0, c0, c2, q1, c1, q2,
      right, x1, pt] <;> decide

/-- On the named carrier, row two has precisely its two sources and target. -/
theorem row2_radius_class_on_boundary :
    ∀ i : Fin 12, sqDist c2 (boundary i) = sqDist c2 q2 ↔
      i = 1 ∨ i = 4 ∨ i = 9 := by
  intro i
  fin_cases i <;>
    norm_num [boundary, sqDist, o, x2, x0, left, q0, c0, c2, q1, c1, q2,
      right, x1, pt] <;> decide

/-- All three targets lie strictly opposite the physical cap across its endpoint chord. -/
theorem cap_side_split :
    0 < signedArea2 left right o ∧
    0 < signedArea2 left right x0 ∧
    0 < signedArea2 left right x1 ∧
    0 < signedArea2 left right x2 ∧
    signedArea2 left right q0 < 0 ∧
    signedArea2 left right c0 < 0 ∧
    signedArea2 left right c2 < 0 ∧
    signedArea2 left right q1 < 0 ∧
    signedArea2 left right c1 < 0 ∧
    signedArea2 left right q2 < 0 := by
  norm_num [signedArea2, left, right, o, x0, x1, x2, q0, c0, c2, q1, c1,
    q2, pt]

noncomputable def mecCenter : ℝ² := pt (1 / 2) (15091 / 30286)
noncomputable def mecRadiusSq : ℝ := 228524365 / 458620898

theorem moser_vertices_on_circle :
    sqDist mecCenter o = mecRadiusSq ∧
    sqDist mecCenter left = mecRadiusSq ∧
    sqDist mecCenter right = mecRadiusSq := by
  norm_num [sqDist, mecCenter, mecRadiusSq, o, left, right, pt]

/-- Every named point lies in the exact Moser circumdisk. -/
theorem boundary_in_mec_disk :
    ∀ i : Fin 12, sqDist mecCenter (boundary i) ≤ mecRadiusSq := by
  intro i
  fin_cases i <;>
    norm_num [boundary, sqDist, mecCenter, mecRadiusSq, o, x2, x0, left, q0,
      c0, c2, q1, c1, q2, right, x1, pt]

theorem moser_triangle_nonobtuse_sq :
    sqDist left right ≤ sqDist o left + sqDist o right ∧
    sqDist o right ≤ sqDist left right + sqDist left o ∧
    sqDist o left ≤ sqDist right o + sqDist right left := by
  norm_num [sqDist, o, left, right, pt]

#print axioms boundary_strict_edge_halfplanes
#print axioms normal_unique_max
#print axioms carrier_convexIndep
#print axioms physical_radius_class_on_boundary
#print axioms three_one_target_rows
#print axioms row0_radius_class_on_boundary
#print axioms row1_radius_class_on_boundary
#print axioms row2_radius_class_on_boundary
#print axioms cap_side_split
#print axioms moser_vertices_on_circle
#print axioms boundary_in_mec_disk
#print axioms moser_triangle_nonobtuse_sq

end ATailPeriodThreeOneTargetScratch
end Problem97

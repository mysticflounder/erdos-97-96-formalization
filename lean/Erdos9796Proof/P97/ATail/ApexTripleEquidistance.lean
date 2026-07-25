/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.CircumcenterSide
import Erdos9796Proof.P97.Cap.PartitionFromMEC
import Erdos9796Proof.P97.ConvexIndepHelpers
import Erdos9796Proof.P97.Moser.NonDeg

/-!
# No carrier point is equidistant from all three Moser apices

A point equidistant from the three vertices of the packet's Moser triangle is
its circumcenter, and the triangle is non-obtuse, so that circumcenter lies in
the closed triangle.  A carrier point cannot lie in the convex hull of three
other carrier points, so no carrier point carries all three apices on one
radius class.

This is metric content, not incidence content: it consumes the non-obtuse
promotion of the Moser triangle, which the cap counting layer never touches.
It is general in `n` and independent of any frontier, shell or residual data.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailApexTripleEquidistance

attribute [local instance] Classical.propDecidable

/-- The three Moser apices of a packet are never collinear in a
convex-independent carrier. -/
theorem signedArea2_triangle_ne_zero
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A) :
    signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 ≠ 0 := by
  intro hzero
  exact hconv.not_three_collinear S.triangle.v1_mem S.triangle.v2_mem
    S.triangle.v3_mem S.triangle.v12_ne S.triangle.v13_ne S.triangle.v23_ne
    (collinear_of_signedArea2_eq_zero _ _ _ hzero)

/-- **Apex-triple exclusion.**  No point of the carrier is equidistant from all
three Moser apices.  Equivalently: every selected class centered at a carrier
point contains at most two of the three apices. -/
theorem not_equidistant_from_three_apices
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    {p : ℝ²} (hp : p ∈ A) {r : ℝ} (hr : 0 < r)
    (h1 : dist p S.triangle.v1 = r)
    (h2 : dist p S.triangle.v2 = r)
    (h3 : dist p S.triangle.v3 = r) :
    False := by
  classical
  have harea := signedArea2_triangle_ne_zero S hconv
  have hab : dist p S.triangle.v1 = dist p S.triangle.v2 := by
    rw [h1, h2]
  have hac : dist p S.triangle.v1 = dist p S.triangle.v3 := by
    rw [h1, h3]
  have hhull : p ∈ convexHull ℝ
      ({S.triangle.v1, S.triangle.v2, S.triangle.v3} : Set ℝ²) :=
    mem_convexHull_three_of_equidistant_nonobtuse harea hab hac
      S.triangleNonObtuse.inner_at_v1 S.triangleNonObtuse.inner_at_v2
      S.triangleNonObtuse.inner_at_v3
  -- `p` is none of the apices, since the common radius is positive.
  have hne1 : p ≠ S.triangle.v1 := by
    intro h
    rw [h, dist_self] at h1
    exact absurd h1.symm (ne_of_gt hr)
  have hne2 : p ≠ S.triangle.v2 := by
    intro h
    rw [h, dist_self] at h2
    exact absurd h2.symm (ne_of_gt hr)
  have hne3 : p ≠ S.triangle.v3 := by
    intro h
    rw [h, dist_self] at h3
    exact absurd h3.symm (ne_of_gt hr)
  -- So the whole triangle sits in `A \ {p}`.
  have hm1 : S.triangle.v1 ∈ (A : Set ℝ²) \ {p} :=
    ⟨Finset.mem_coe.mpr S.triangle.v1_mem, fun h => hne1 h.symm⟩
  have hm2 : S.triangle.v2 ∈ (A : Set ℝ²) \ {p} :=
    ⟨Finset.mem_coe.mpr S.triangle.v2_mem, fun h => hne2 h.symm⟩
  have hm3 : S.triangle.v3 ∈ (A : Set ℝ²) \ {p} :=
    ⟨Finset.mem_coe.mpr S.triangle.v3_mem, fun h => hne3 h.symm⟩
  have hsub : ({S.triangle.v1, S.triangle.v2, S.triangle.v3} : Set ℝ²) ⊆
      (A : Set ℝ²) \ {p} := by
    simp only [Set.insert_subset_iff, Set.singleton_subset_iff]
    exact ⟨hm1, hm2, hm3⟩
  exact hconv p (Finset.mem_coe.mpr hp) (convexHull_mono hsub hhull)

end ATailApexTripleEquidistance
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.Geometry.TwoInteriorSameBoundaryRadius
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# One-boundary intersections of selected four-classes

This module exposes the generic cardinality wrapper around the checked
one-boundary equality kernel.  The center-supported enclosing disk and the
boundary-apex hypothesis remain explicit; no exact-thirteen or source-cover
assumption is introduced here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace SelectedFourClass

/-- A selected row through a boundary apex meets every selected row centered
at that apex in at most one point.  The center `O` is supported by the
boundary of the enclosing disk, and `hPC` is the necessary apex-membership
guard for the first row. -/
theorem inter_card_le_one_of_mem_boundary_apex
    {A : Finset ℝ²} {O B P : ℝ²} {Rdisk : ℝ}
    (hconv : EuclideanGeometry.ConvexIndep (A : Set ℝ²))
    (hcontain : ∀ x ∈ A, dist x O ≤ Rdisk)
    (hcenter : O ∈ convexHull ℝ
      {x : ℝ² | x ∈ A ∧ dist x O = Rdisk})
    (hB : B ∈ A)
    (hPboundary : dist P O = Rdisk)
    (C : SelectedFourClass A B)
    (F : SelectedFourClass A P)
    (hPC : P ∈ C.support) :
    (C.support ∩ F.support).card ≤ 1 := by
  classical
  apply Finset.card_le_one.mpr
  intro x hx y hy
  rcases Finset.mem_inter.mp hx with ⟨hxC, hxF⟩
  rcases Finset.mem_inter.mp hy with ⟨hyC, hyF⟩
  exact Erdos9796Proof.Geometry.eq_of_one_boundary_same_radius_pair
    hconv hcontain hcenter hB (C.support_subset_A hPC)
    (C.support_subset_A hxC) (C.support_subset_A hyC) hPboundary
    ((C.support_eq_radius P hPC).trans
      (C.support_eq_radius x hxC).symm)
    ((C.support_eq_radius P hPC).trans
      (C.support_eq_radius y hyC).symm)
    ((F.support_eq_radius x hxF).trans
      (F.support_eq_radius y hyF).symm)

end SelectedFourClass
end Problem97

#print axioms Problem97.SelectedFourClass.inter_card_le_one_of_mem_boundary_apex

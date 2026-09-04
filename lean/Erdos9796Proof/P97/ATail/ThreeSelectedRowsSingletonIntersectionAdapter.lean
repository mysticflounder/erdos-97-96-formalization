/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.KalmansonThreeEqualitySchemas
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# Three selected rows with singleton intersections

This adapter packages three pairwise singleton support intersections into the
existing six-vertex Kalmanson obstruction.  The boundary indexing is allowed
to use its cardinality-generic `Fin B.n` representation; the finite-carrier
cardinality equality is discharged before applying the schema.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace GeneralCarrierBridge

/-- Three increasing selected rows cannot have the displayed three singleton
intersections. -/
theorem false_of_three_selected_rows_singleton_intersections_increasing
    {A : Finset ℝ²} (B : BoundaryIndexing A) (hA : ConvexIndep A)
    {a b c d e f : CarrierLabel A}
    (hab : B.indexOf a < B.indexOf b)
    (hbc : B.indexOf b < B.indexOf c)
    (hcd : B.indexOf c < B.indexOf d)
    (hde : B.indexOf d < B.indexOf e)
    (hef : B.indexOf e < B.indexOf f)
    (RowA : SelectedFourClass A (pointOf a))
    (RowD : SelectedFourClass A (pointOf d))
    (RowE : SelectedFourClass A (pointOf e))
    (hAD : RowA.support ∩ RowD.support = {pointOf c})
    (hAE : RowA.support ∩ RowE.support = {pointOf b})
    (hDE : RowD.support ∩ RowE.support = {pointOf f}) :
    False := by
  have hcard : A.card = B.n := by
    have h := congrArg Finset.card B.boundary_image
    simpa [Finset.card_image_of_injective _ B.boundary_injective] using h.symm
  let phi : Fin A.card → ℝ² :=
    fun i => B.boundary (Fin.cast hcard i)
  have hphi_inj : Function.Injective phi := by
    intro i j hij
    apply Fin.cast_injective hcard
    exact B.boundary_injective hij
  have hphi_ccw : EuclideanGeometry.IsCcwConvexPolygon phi := by
    intro i j k hij hjk
    simpa [phi] using B.boundary_ccw (by simpa using hij) (by simpa using hjk)
  have hphi_image : Finset.univ.image phi = A := by
    apply Finset.Subset.antisymm
    · intro x hx
      rw [← B.boundary_image]
      rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
      exact Finset.mem_image.mpr
        ⟨Fin.cast hcard i, Finset.mem_univ _, rfl⟩
    · intro x hx
      rw [← B.boundary_image] at hx
      rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
      refine Finset.mem_image.mpr
        ⟨Fin.cast hcard.symm i, Finset.mem_univ _, ?_⟩
      simp [phi]
  have hcA : pointOf c ∈ RowA.support := by
    have h : pointOf c ∈ RowA.support ∩ RowD.support := by
      rw [hAD]
      simp
    exact (Finset.mem_inter.mp h).1
  have hbA : pointOf b ∈ RowA.support := by
    have h : pointOf b ∈ RowA.support ∩ RowE.support := by
      rw [hAE]
      simp
    exact (Finset.mem_inter.mp h).1
  have hcD : pointOf c ∈ RowD.support := by
    have h : pointOf c ∈ RowA.support ∩ RowD.support := by
      rw [hAD]
      simp
    exact (Finset.mem_inter.mp h).2
  have hfD : pointOf f ∈ RowD.support := by
    have h : pointOf f ∈ RowD.support ∩ RowE.support := by
      rw [hDE]
      simp
    exact (Finset.mem_inter.mp h).1
  have hbE : pointOf b ∈ RowE.support := by
    have h : pointOf b ∈ RowA.support ∩ RowE.support := by
      rw [hAE]
      simp
    exact (Finset.mem_inter.mp h).2
  have hfE : pointOf f ∈ RowE.support := by
    have h : pointOf f ∈ RowD.support ∩ RowE.support := by
      rw [hDE]
      simp
    exact (Finset.mem_inter.mp h).2
  have h012 :
      dist (phi (Fin.cast hcard.symm (B.indexOf a)))
          (phi (Fin.cast hcard.symm (B.indexOf b))) =
        dist (phi (Fin.cast hcard.symm (B.indexOf a)))
          (phi (Fin.cast hcard.symm (B.indexOf c))) := by
    simpa [phi, B.point_eq] using
      (RowA.support_eq_radius _ hbA).trans
      (RowA.support_eq_radius _ hcA).symm
  have h325 :
      dist (phi (Fin.cast hcard.symm (B.indexOf d)))
          (phi (Fin.cast hcard.symm (B.indexOf c))) =
        dist (phi (Fin.cast hcard.symm (B.indexOf d)))
          (phi (Fin.cast hcard.symm (B.indexOf f))) := by
    simpa [phi, B.point_eq] using
      (RowD.support_eq_radius _ hcD).trans
      (RowD.support_eq_radius _ hfD).symm
  have h415 :
      dist (phi (Fin.cast hcard.symm (B.indexOf e)))
          (phi (Fin.cast hcard.symm (B.indexOf b))) =
        dist (phi (Fin.cast hcard.symm (B.indexOf e)))
          (phi (Fin.cast hcard.symm (B.indexOf f))) := by
    simpa [phi, B.point_eq] using
      (RowE.support_eq_radius _ hbE).trans
      (RowE.support_eq_radius _ hfE).symm
  exact CapCrossingKalmansonBridge.false_of_six_ccw_three_shell_equalities_012_325_415
    (phi := phi) hA hphi_inj hphi_image hphi_ccw
    (by simpa using hab) (by simpa using hbc) (by simpa using hcd)
    (by simpa using hde) (by simpa using hef) h012 h325 h415

end GeneralCarrierBridge
end Census554
end Problem97

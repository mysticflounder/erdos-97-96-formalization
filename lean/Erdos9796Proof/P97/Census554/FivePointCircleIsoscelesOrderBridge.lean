/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson
import Erdos9796Proof.P97.Census554.FivePointCircleIsoscelesOrderCore

/-!
# Convex-boundary bridge for the five-point circle-isosceles core

This file derives the signed-side and proper-diagonal-crossing hypotheses of
`FivePointCircleIsoscelesOrderCore` from five increasing vertices of one
strictly convex CCW boundary enumeration.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace FivePointCircleIsoscelesOrderBridge

open EqualityCore

/-- Distinct vertices in strict convex cyclic order `W,F,P,X,Z` cannot realize
the two-row circle-isosceles equality core. -/
theorem false_of_core_of_ccw
    {A : Finset ℝ²} {alpha : Type*} {R : RowPattern alpha}
    {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf)
    (core : FivePointCircleIsoscelesOrderCore.Core R)
    (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {iW iF iP iX iZ : Fin A.card}
    (hW : phi iW = pointOf core.W)
    (hF : phi iF = pointOf core.F)
    (hP : phi iP = pointOf core.P)
    (hX : phi iX = pointOf core.X)
    (hZ : phi iZ = pointOf core.Z)
    (hWF : iW < iF) (hFP : iF < iP) (hPX : iP < iX) (hXZ : iX < iZ) :
    False := by
  have hFZ : iF < iZ := hFP.trans (hPX.trans hXZ)
  have hFX : iF < iX := hFP.trans hPX
  have hWFZ :
      signedArea2 (pointOf core.W) (pointOf core.F) (pointOf core.Z) < 0 := by
    have harea := hneg_of_ccw hphi_inj hccw hWF hFZ
    rwa [hW, hF, hZ] at harea
  have hFXZ :
      signedArea2 (pointOf core.F) (pointOf core.X) (pointOf core.Z) < 0 := by
    have harea := hneg_of_ccw hphi_inj hccw hFX hXZ
    rwa [hF, hX, hZ] at harea
  obtain ⟨q, hqFX, hqPZ⟩ :=
    CapCrossingKalmansonBridge.exists_mem_openSegment_diagonals_of_ccw
      hA hphi_inj hphi_image hccw hFP hPX hXZ
  apply FivePointCircleIsoscelesOrderCore.false_of_core_of_neg
    hreal core hWFZ hFXZ
  exact ⟨q, by simpa only [hF, hX] using hqFX,
    by simpa only [hP, hZ] using hqPZ⟩

/-- Direct selected-row consumer for the five-point circle-isosceles core.

For increasing boundary vertices `W < F < P < X < Z`, a selected row at `W`
cannot contain `F,X,Z` while a selected row at `Z` contains `P,X`. -/
theorem false_of_two_selected_rows_of_ccw
    {A : Finset ℝ²}
    (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {iW iF iP iX iZ : Fin A.card}
    (hWF : iW < iF) (hFP : iF < iP) (hPX : iP < iX) (hXZ : iX < iZ)
    (WRow : SelectedFourClass A (phi iW))
    (ZRow : SelectedFourClass A (phi iZ))
    (hF_mem_WRow : phi iF ∈ WRow.support)
    (hX_mem_WRow : phi iX ∈ WRow.support)
    (hZ_mem_WRow : phi iZ ∈ WRow.support)
    (hP_mem_ZRow : phi iP ∈ ZRow.support)
    (hX_mem_ZRow : phi iX ∈ ZRow.support) :
    False := by
  apply FivePointCircleIsoscelesOrderCore.metric_order_incompatibility
    (hphi_inj.ne (hFP.trans (hPX.trans hXZ)).ne)
    (hphi_inj.ne hPX.ne)
    (hphi_inj.ne hXZ.ne)
  · exact
      (WRow.support_eq_radius _ hF_mem_WRow).trans
        (WRow.support_eq_radius _ hX_mem_WRow).symm
  · exact
      (WRow.support_eq_radius _ hF_mem_WRow).trans
        (WRow.support_eq_radius _ hZ_mem_WRow).symm
  · rw [dist_comm (phi iP) (phi iZ), dist_comm (phi iX) (phi iZ)]
    exact
      (ZRow.support_eq_radius _ hP_mem_ZRow).trans
        (ZRow.support_eq_radius _ hX_mem_ZRow).symm
  · have hWFZ :
        signedArea2 (phi iW) (phi iF) (phi iZ) < 0 :=
      hneg_of_ccw hphi_inj hccw hWF (hFP.trans (hPX.trans hXZ))
    have hFXZ :
        signedArea2 (phi iF) (phi iX) (phi iZ) < 0 :=
      hneg_of_ccw hphi_inj hccw (hFP.trans hPX) hXZ
    have hswap :
        signedArea2 (phi iX) (phi iF) (phi iZ) =
          -signedArea2 (phi iF) (phi iX) (phi iZ) := by
      simp only [signedArea2]
      ring
    rw [hswap]
    exact mul_neg_of_neg_of_pos hWFZ (neg_pos.mpr hFXZ)
  · obtain ⟨q, hqFX, hqPZ⟩ :=
      CapCrossingKalmansonBridge.exists_mem_openSegment_diagonals_of_ccw
        hA hphi_inj hphi_image hccw hFP hPX hXZ
    exact ⟨q, hqFX, hqPZ⟩

#print axioms false_of_core_of_ccw
#print axioms false_of_two_selected_rows_of_ccw

end FivePointCircleIsoscelesOrderBridge
end Census554
end Problem97

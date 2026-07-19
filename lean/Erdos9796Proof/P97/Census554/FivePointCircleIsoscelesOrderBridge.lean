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

#print axioms false_of_core_of_ccw

end FivePointCircleIsoscelesOrderBridge
end Census554
end Problem97

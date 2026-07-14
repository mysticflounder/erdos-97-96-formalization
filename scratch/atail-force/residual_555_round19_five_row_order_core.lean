/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore
import residual_555_round19_mec_geometry_lift

/-!
# Equality-closure consumer for the round-19 five-row order pattern

This file packages the metric hypotheses of
`Residual555Round19MECGeometryLift.false_of_five_row_metric_data` as a
label-generic `EqualityCore.EdgeClosure` witness.  The result depends only on
five selected rows and the six orientations implied by the cyclic spine
`O,A,D,E,C`; it does not use exactness or a minimum enclosing circle.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace FiveRowCircleIntersectionOrderCore

open EqualityCore

/-- The ten equality-closure relations used by the round-19 geometry
consumer.  The auxiliary labels `X5`, `X6`, and `X9` name the three
circle-intersection witnesses from the saved row system. -/
structure Core {alpha : Type*} (R : RowPattern alpha) where
  O : alpha
  A : alpha
  C : alpha
  D : alpha
  E : alpha
  X5 : alpha
  X6 : alpha
  X9 : alpha
  hOA : O ≠ A
  OA_OC : EdgeClosure R (O, A) (O, C)
  OA_OD : EdgeClosure R (O, A) (O, D)
  OA_OE : EdgeClosure R (O, A) (O, E)
  OA_AC : EdgeClosure R (O, A) (A, C)
  DA_DX5 : EdgeClosure R (D, A) (D, X5)
  OA_EX5 : EdgeClosure R (O, A) (E, X5)
  OA_AX6 : EdgeClosure R (O, A) (A, X6)
  DA_DX6 : EdgeClosure R (D, A) (D, X6)
  CD_CX9 : EdgeClosure R (C, D) (C, X9)
  OA_EX9 : EdgeClosure R (O, A) (E, X9)

/-- A realized five-row core cannot have the six positive orientations of
the cyclic spine `O,A,D,E,C`. -/
theorem false_of_core
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hOAC : 0 < signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.C))
    (hOAD : 0 < signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.D))
    (hOAE : 0 < signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.E))
    (hODE : 0 < signedArea2 (pointOf core.O) (pointOf core.D) (pointOf core.E))
    (hODC : 0 < signedArea2 (pointOf core.O) (pointOf core.D) (pointOf core.C))
    (hOEC : 0 < signedArea2 (pointOf core.O) (pointOf core.E) (pointOf core.C)) :
    False := by
  let r := dist (pointOf core.A) (pointOf core.O)
  have hAO : pointOf core.A ≠ pointOf core.O := by
    intro h
    exact core.hOA (hreal.injective h.symm)
  have hr : 0 < r := by
    exact dist_pos.mpr hAO
  have ha : dist (pointOf core.A) (pointOf core.O) = r := rfl
  have hc : dist (pointOf core.C) (pointOf core.O) = r := by
    dsimp [r]
    simpa [edgeDist, dist_comm] using (EdgeClosure.sound hreal core.OA_OC).symm
  have hd : dist (pointOf core.D) (pointOf core.O) = r := by
    dsimp [r]
    simpa [edgeDist, dist_comm] using (EdgeClosure.sound hreal core.OA_OD).symm
  have he : dist (pointOf core.E) (pointOf core.O) = r := by
    dsimp [r]
    simpa [edgeDist, dist_comm] using (EdgeClosure.sound hreal core.OA_OE).symm
  have hac : dist (pointOf core.A) (pointOf core.C) = r := by
    dsimp [r]
    simpa [edgeDist, dist_comm] using (EdgeClosure.sound hreal core.OA_AC).symm
  have hd5 : dist (pointOf core.D) (pointOf core.X5) =
      dist (pointOf core.D) (pointOf core.A) := by
    simpa [edgeDist] using (EdgeClosure.sound hreal core.DA_DX5).symm
  have he5 : dist (pointOf core.E) (pointOf core.X5) = r := by
    dsimp [r]
    simpa [edgeDist, dist_comm] using (EdgeClosure.sound hreal core.OA_EX5).symm
  have ha6 : dist (pointOf core.A) (pointOf core.X6) = r := by
    dsimp [r]
    simpa [edgeDist, dist_comm] using (EdgeClosure.sound hreal core.OA_AX6).symm
  have hd6 : dist (pointOf core.D) (pointOf core.X6) =
      dist (pointOf core.D) (pointOf core.A) := by
    simpa [edgeDist] using (EdgeClosure.sound hreal core.DA_DX6).symm
  have hc9 : dist (pointOf core.C) (pointOf core.X9) =
      dist (pointOf core.C) (pointOf core.D) := by
    simpa [edgeDist] using (EdgeClosure.sound hreal core.CD_CX9).symm
  have he9 : dist (pointOf core.E) (pointOf core.X9) = r := by
    dsimp [r]
    simpa [edgeDist, dist_comm] using (EdgeClosure.sound hreal core.OA_EX9).symm
  exact Residual555Round19MECGeometryLift.false_of_five_row_metric_data
    hr ha hc hd he hac hd5 he5 ha6 hd6 hc9 he9
    hOAC hOAD hOAE hODE hODC hOEC

/-- Reversed cyclic orientation form, obtained by reflecting the
realization. -/
theorem false_of_core_of_neg
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hOAC : signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.C) < 0)
    (hOAD : signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.D) < 0)
    (hOAE : signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.E) < 0)
    (hODE : signedArea2 (pointOf core.O) (pointOf core.D) (pointOf core.E) < 0)
    (hODC : signedArea2 (pointOf core.O) (pointOf core.D) (pointOf core.C) < 0)
    (hOEC : signedArea2 (pointOf core.O) (pointOf core.E) (pointOf core.C) < 0) :
    False := by
  let reflectedPointOf := fun label => reflectXAxis (pointOf label)
  have hrealReflected : Realizes R reflectedPointOf := hreal.reflectXAxis
  apply false_of_core hrealReflected core
  all_goals
    change 0 < signedArea2 (reflectXAxis _) (reflectXAxis _) (reflectXAxis _)
    rw [signedArea2_reflectXAxis]
    linarith

#print axioms false_of_core
#print axioms false_of_core_of_neg

end FiveRowCircleIntersectionOrderCore
end Census554
end Problem97

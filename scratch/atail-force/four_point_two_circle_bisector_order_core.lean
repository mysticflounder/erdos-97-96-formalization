/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.U2.WitnessReflectionKernel

/-!
# Four-point two-circle same-side order core

This is a thin equality-closure wrapper around
`Problem97.twoCircle_sameSide_reflection_false`.  Two distinct labels `U,Y`
have equal distances to both centers `Q,V`, while their signed areas relative
to the oriented center chord have the same strict sign.  The existing
two-circle reflection theorem gives the contradiction directly; no new
metric geometry is derived here.

The wrapper is independent of the finite residual which exposed it and is
kept outside the production import tree until promotion.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace FourPointTwoCircleBisectorOrderCore

open EqualityCore

/-- Equality-closure data for two distinct common points of two centered
circles. -/
structure Core {alpha : Type*} (R : RowPattern alpha) where
  Q : alpha
  V : alpha
  U : alpha
  Y : alpha
  hUY : U ≠ Y
  QU_QY : EdgeClosure R (Q, U) (Q, Y)
  UV_YV : EdgeClosure R (U, V) (Y, V)

private theorem metric_false_of_core
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hUside : 0 < signedArea2 (pointOf core.U) (pointOf core.Q)
      (pointOf core.V))
    (hYside : 0 < signedArea2 (pointOf core.Y) (pointOf core.Q)
      (pointOf core.V)) :
    False := by
  have hUQ_YQ :
      dist (pointOf core.U) (pointOf core.Q) =
        dist (pointOf core.Y) (pointOf core.Q) := by
    simpa [edgeDist, dist_comm] using EdgeClosure.sound hreal core.QU_QY
  have hUV_YV :
      dist (pointOf core.U) (pointOf core.V) =
        dist (pointOf core.Y) (pointOf core.V) := by
    simpa [edgeDist] using EdgeClosure.sound hreal core.UV_YV
  have hUY : pointOf core.U ≠ pointOf core.Y := by
    intro heq
    exact core.hUY (hreal.injective heq)
  exact Problem97.twoCircle_sameSide_reflection_false
    (rq := dist (pointOf core.U) (pointOf core.Q))
    (rv := dist (pointOf core.U) (pointOf core.V))
    rfl hUQ_YQ.symm rfl hUV_YV.symm hUY
    (mul_pos hUside hUside) (mul_pos hYside hUside)

/-- A realized two-circle core cannot put `U,Y` on the same positive side of
the oriented center chord. -/
theorem false_of_core
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hUside : 0 < signedArea2 (pointOf core.U) (pointOf core.Q)
      (pointOf core.V))
    (hYside : 0 < signedArea2 (pointOf core.Y) (pointOf core.Q)
      (pointOf core.V)) :
    False :=
  metric_false_of_core hreal core hUside hYside

/-- The same-side contradiction with both strict orientations reversed. -/
theorem false_of_core_of_neg
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hUside : signedArea2 (pointOf core.U) (pointOf core.Q)
      (pointOf core.V) < 0)
    (hYside : signedArea2 (pointOf core.Y) (pointOf core.Q)
      (pointOf core.V) < 0) :
    False := by
  have hUQ_YQ :
      dist (pointOf core.U) (pointOf core.Q) =
        dist (pointOf core.Y) (pointOf core.Q) := by
    simpa [edgeDist, dist_comm] using EdgeClosure.sound hreal core.QU_QY
  have hUV_YV :
      dist (pointOf core.U) (pointOf core.V) =
        dist (pointOf core.Y) (pointOf core.V) := by
    simpa [edgeDist] using EdgeClosure.sound hreal core.UV_YV
  have hUY : pointOf core.U ≠ pointOf core.Y := by
    intro heq
    exact core.hUY (hreal.injective heq)
  exact Problem97.twoCircle_sameSide_reflection_false
    (rq := dist (pointOf core.U) (pointOf core.Q))
    (rv := dist (pointOf core.U) (pointOf core.V))
    rfl hUQ_YQ.symm rfl hUV_YV.symm hUY
    (mul_pos_of_neg_of_neg hUside hUside)
    (mul_pos_of_neg_of_neg hYside hUside)

#print axioms Problem97.twoCircle_sameSide_reflection_false
#print axioms false_of_core
#print axioms false_of_core_of_neg

end FourPointTwoCircleBisectorOrderCore
end Census554
end Problem97

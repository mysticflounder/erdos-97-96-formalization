/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.U2.WitnessReflectionKernel

/-!
# Four-point two-circle same-side order core

Two distinct labels `u,y` have equal distances to both centers `q,v`.  In an
injective plane realization, they cannot lie strictly on the same side of the
oriented center chord.  The equality hypotheses are packaged as
`EqualityCore.EdgeClosure` witnesses, so the result applies to equalities
generated transitively across several selected rows.

This theorem is independent of the finite residual in which the pattern was
first found and of the cardinality of the ambient label type.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace FourPointTwoCircleBisectorOrderCore

open EqualityCore

/-- Equality-closure data for two distinct common points of two centered
circles. -/
structure Core {α : Type*} (R : RowPattern α) where
  q : α
  v : α
  u : α
  y : α
  huy : u ≠ y
  qu_qy : EdgeClosure R (q, u) (q, y)
  uv_yv : EdgeClosure R (u, v) (y, v)

/-- A realized two-circle core cannot put `u,y` on the same strict side of
the oriented center chord, expressed without choosing its sign. -/
theorem false_of_core_of_same_side
    {α : Type*} {R : RowPattern α} {pointOf : α → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hsame :
      0 < signedArea2 (pointOf core.u) (pointOf core.q) (pointOf core.v) *
        signedArea2 (pointOf core.y) (pointOf core.q) (pointOf core.v)) :
    False := by
  have huq_yq :
      dist (pointOf core.u) (pointOf core.q) =
        dist (pointOf core.y) (pointOf core.q) := by
    simpa [edgeDist, dist_comm] using EdgeClosure.sound hreal core.qu_qy
  have huv_yv :
      dist (pointOf core.u) (pointOf core.v) =
        dist (pointOf core.y) (pointOf core.v) := by
    simpa [edgeDist] using EdgeClosure.sound hreal core.uv_yv
  have huy : pointOf core.u ≠ pointOf core.y := by
    intro heq
    exact core.huy (hreal.injective heq)
  have huAreaNe :
      signedArea2 (pointOf core.u) (pointOf core.q) (pointOf core.v) ≠ 0 := by
    intro hzero
    rw [hzero, zero_mul] at hsame
    exact (lt_irrefl 0) hsame
  exact Problem97.twoCircle_sameSide_reflection_false
    (rq := dist (pointOf core.u) (pointOf core.q))
    (rv := dist (pointOf core.u) (pointOf core.v))
    rfl huq_yq.symm rfl huv_yv.symm huy
    (mul_self_pos.mpr huAreaNe)
    (by simpa [mul_comm] using hsame)

/-- Positive-orientation convenience form of the same-side contradiction. -/
theorem false_of_core
    {α : Type*} {R : RowPattern α} {pointOf : α → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (huSide :
      0 < signedArea2 (pointOf core.u) (pointOf core.q) (pointOf core.v))
    (hySide :
      0 < signedArea2 (pointOf core.y) (pointOf core.q) (pointOf core.v)) :
    False :=
  false_of_core_of_same_side hreal core (mul_pos huSide hySide)

/-- Negative-orientation convenience form of the same-side contradiction. -/
theorem false_of_core_of_neg
    {α : Type*} {R : RowPattern α} {pointOf : α → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (huSide :
      signedArea2 (pointOf core.u) (pointOf core.q) (pointOf core.v) < 0)
    (hySide :
      signedArea2 (pointOf core.y) (pointOf core.q) (pointOf core.v) < 0) :
    False :=
  false_of_core_of_same_side hreal core (mul_pos_of_neg_of_neg huSide hySide)

#print axioms false_of_core_of_same_side
#print axioms false_of_core
#print axioms false_of_core_of_neg

end FourPointTwoCircleBisectorOrderCore
end Census554
end Problem97

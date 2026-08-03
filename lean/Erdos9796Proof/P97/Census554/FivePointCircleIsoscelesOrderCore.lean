/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Cap.ArcInteriorPoints
import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.Geometry.FivePointCircleIsosceles

/-!
# Five-point circle-isosceles order core

This file packages the following arbitrary-cardinality obstruction. Suppose
`W,F,P,X,Z` are vertices in that cyclic order, `F,X,Z` lie on one circle
centered at `W`, and the triangle `P,X,Z` is isosceles with equal sides at
`Z`. The diagonals `F-X` and `P-Z` cross. The circle order makes the angle
`F-X-Z` obtuse, whereas the isosceles equality and the diagonal crossing make
the same inner product positive.

The equality-closure wrapper is independent of any finite 555/654 census.
It consumes only two rows, two strict orientation facts, and a proper diagonal
intersection. It does not assert that a live carrier produces one of the
banked finite patterns.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97
namespace Census554
namespace FivePointCircleIsoscelesOrderCore

open EqualityCore

/-- The metric equalities used by the five-point obstruction. The first row
is centered at `W` and contains `F,X,Z`; the second is centered at `Z` and
contains `P,X`. -/
structure Core {alpha : Type*} (R : RowPattern alpha) where
  W : alpha
  F : alpha
  P : alpha
  X : alpha
  Z : alpha
  hFZ : F ≠ Z
  hPX : P ≠ X
  hXZ : X ≠ Z
  WF_WX : EdgeClosure R (W, F) (W, X)
  WF_WZ : EdgeClosure R (W, F) (W, Z)
  PZ_XZ : EdgeClosure R (P, Z) (X, Z)

/-- The circle and isosceles equalities are incompatible with the strict
chord-side condition and the proper crossing of `F-X` with `P-Z`. -/
theorem metric_order_incompatibility
    {W F P X Z : ℝ²}
    (hFZ : F ≠ Z) (hPX : P ≠ X) (hXZ : X ≠ Z)
    (hWF_WX : dist W F = dist W X)
    (hWF_WZ : dist W F = dist W Z)
    (hPZ_XZ : dist P Z = dist X Z)
    (hside : signedArea2 W F Z * signedArea2 X F Z < 0)
    (hcross : ∃ q : ℝ²,
      q ∈ openSegment ℝ F X ∧ q ∈ openSegment ℝ P Z) :
    False := by
  apply Erdos9796Proof.Geometry.fivePointCircleIsoscelesOrder
    hFZ hPX hXZ hWF_WX hWF_WZ hPZ_XZ
  · simpa only [Erdos9796Proof.Geometry.signedArea2, Problem97.signedArea2]
      using hside
  · exact hcross

/-- A realized equality-closure core is contradictory under the geometric
order hypotheses. -/
theorem false_of_core
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hside :
      signedArea2 (pointOf core.W) (pointOf core.F) (pointOf core.Z) *
          signedArea2 (pointOf core.X) (pointOf core.F) (pointOf core.Z) < 0)
    (hcross : ∃ q : ℝ²,
      q ∈ openSegment ℝ (pointOf core.F) (pointOf core.X) ∧
      q ∈ openSegment ℝ (pointOf core.P) (pointOf core.Z)) :
    False := by
  apply metric_order_incompatibility
    (hreal.injective.ne core.hFZ) (hreal.injective.ne core.hPX)
    (hreal.injective.ne core.hXZ)
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.WF_WX
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.WF_WZ
  · simpa only [edgeDist] using EdgeClosure.sound hreal core.PZ_XZ
  · exact hside
  · exact hcross

/-- Negative-orientation form used by the live convex-boundary convention.
The two negative turns put `W` and `X` on opposite sides of the chord `F-Z`. -/
theorem false_of_core_of_neg
    {alpha : Type*} {R : RowPattern alpha} {pointOf : alpha → ℝ²}
    (hreal : Realizes R pointOf) (core : Core R)
    (hWFZ :
      signedArea2 (pointOf core.W) (pointOf core.F) (pointOf core.Z) < 0)
    (hFXZ :
      signedArea2 (pointOf core.F) (pointOf core.X) (pointOf core.Z) < 0)
    (hcross : ∃ q : ℝ²,
      q ∈ openSegment ℝ (pointOf core.F) (pointOf core.X) ∧
      q ∈ openSegment ℝ (pointOf core.P) (pointOf core.Z)) :
    False := by
  apply false_of_core hreal core
  · have hswap :
        signedArea2 (pointOf core.X) (pointOf core.F) (pointOf core.Z) =
          -signedArea2 (pointOf core.F) (pointOf core.X) (pointOf core.Z) := by
      simp only [signedArea2]
      ring
    rw [hswap]
    exact mul_neg_of_neg_of_pos hWFZ (neg_pos.mpr hFXZ)
  · exact hcross

#print axioms metric_order_incompatibility
#print axioms false_of_core
#print axioms false_of_core_of_neg

end FivePointCircleIsoscelesOrderCore
end Census554
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

/-!
# Direct distance-label cuts from two strict Kalmanson inequalities

The finite exact-cardinality encoder assigns a finite label to every carrier
edge.  In a realization those labels can be chosen injectively on the actual
distance values.  Consequently, four checked label equalities matching the
four left-hand edges of two strict Kalmanson inequalities with their four
right-hand edges are impossible.

This module isolates that metric statement from the selected-row equality-path
consumer.  It is the soundness theorem for exhaustive Boolean cuts over the
distance-label layer; it makes no completeness or exact-cardinality claim.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace GenericRowNogoodCertificate

open Census554.EqualityCore
open scoped EuclideanGeometry

/-- The order, forms, and permutation needed for a direct two-Kalmanson
distance-label cancellation. -/
structure TwoKalmansonLabelCancellationData (α : Type*) where
  firstQuad : OrderedQuadData α
  firstForm : KalmansonForm
  secondQuad : OrderedQuadData α
  secondForm : KalmansonForm
  permutation : Permutation4Data
deriving DecidableEq, Repr

def TwoKalmansonLabelCancellationData.leftEdge {α : Type*}
    (data : TwoKalmansonLabelCancellationData α) : Fin 4 → Edge α :=
  ![data.firstQuad.leftEdge0 data.firstForm,
    data.firstQuad.leftEdge1 data.firstForm,
    data.secondQuad.leftEdge0 data.secondForm,
    data.secondQuad.leftEdge1 data.secondForm]

def TwoKalmansonLabelCancellationData.rightEdge {α : Type*}
    (data : TwoKalmansonLabelCancellationData α) : Fin 4 → Edge α :=
  ![data.firstQuad.rightEdge0, data.firstQuad.rightEdge1,
    data.secondQuad.rightEdge0, data.secondQuad.rightEdge1]

/-- Four actual edge-distance equalities cannot cancel the strict sides of two
Kalmanson inequalities against their diagonals.  The equalities may arrive
from selected-row paths, a finite injective distance labeling, or any other
source. -/
theorem false_of_twoKalmansonLabelCancellationData
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hinjective : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (data : TwoKalmansonLabelCancellationData (Fin n))
    (horder : data.firstQuad.a < data.firstQuad.b ∧
      data.firstQuad.b < data.firstQuad.c ∧
      data.firstQuad.c < data.firstQuad.d ∧
      data.secondQuad.a < data.secondQuad.b ∧
      data.secondQuad.b < data.secondQuad.c ∧
      data.secondQuad.c < data.secondQuad.d)
    (hperm : data.permutation.check = true)
    (heq : ∀ i, edgeDist boundary (data.leftEdge i) =
      edgeDist boundary (data.rightEdge (data.permutation.apply i))) : False := by
  rcases horder with ⟨hab1, hbc1, hcd1, hab2, hbc2, hcd2⟩
  have hlt1 := data.firstQuad.kalmanson_lt hA hinjective himage hccw
    data.firstForm hab1 hbc1 hcd1
  have hlt2 := data.secondQuad.kalmanson_lt hA hinjective himage hccw
    data.secondForm hab2 hbc2 hcd2
  let leftDist : Fin 4 → ℝ :=
    fun i => edgeDist boundary (data.leftEdge i)
  let rightDist : Fin 4 → ℝ :=
    fun i => edgeDist boundary (data.rightEdge i)
  have hsumPerm :
      (∑ i, leftDist i) = ∑ i, rightDist (data.permutation.apply i) := by
    simp only [Fin.sum_univ_four]
    dsimp [leftDist, rightDist]
    rw [heq 0, heq 1, heq 2, heq 3]
  have hsum : (∑ i, leftDist i) = ∑ i, rightDist i :=
    hsumPerm.trans
      (data.permutation.sum_comp_eq_of_check rightDist hperm)
  have hlt : (∑ i, leftDist i) < ∑ i, rightDist i := by
    simp only [Fin.sum_univ_four]
    dsimp [leftDist, rightDist,
      TwoKalmansonLabelCancellationData.leftEdge,
      TwoKalmansonLabelCancellationData.rightEdge]
    linarith
  exact (ne_of_lt hlt) hsum

end GenericRowNogoodCertificate
end ATailFrontierLiveClosure
end Problem97

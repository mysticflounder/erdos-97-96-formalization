/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenCenter9K4RowDomain

/-!
# Exact-thirteen adjacent surplus-pair terminal

The exact-thirteen surplus-pair search leaves two possible four-supports at
each of the adjacent surplus labels `3` and `4`.  This module records the
four resulting joint leaves.  Each leaf is a single strict Kalmanson
inequality whose two sides are identified by the two equal-distance rows.

The source classifier that reduces arbitrary rows to these two supports is a
separate obligation.  This file is therefore a proof-facing terminal, not a
claim that the exact-thirteen source already reaches it.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open GenericRowNogoodCertificate
open Census554.EqualityCore
open scoped EuclideanGeometry

/-- Equal distances from one labelled center to a finite support. -/
def SurplusRowDistancesEqual (boundary : Fin 13 → ℝ²) (center : Fin 13)
    (support : Finset (Fin 13)) : Prop :=
  ∀ ⦃u⦄, u ∈ support → ∀ ⦃v⦄, v ∈ support →
    dist (boundary center) (boundary u) =
      dist (boundary center) (boundary v)

/-- The two support normal forms left at either adjacent surplus label. -/
def surplusPairSupport₀ : Finset (Fin 13) := {2, 6, 10, 12}

def surplusPairSupport₁ : Finset (Fin 13) := {3, 6, 10, 12}

/-- The source-facing packet for the four-leaf surplus-pair terminal. -/
structure SurplusPairRows (boundary : Fin 13 → ℝ²) where
  support3 : Finset (Fin 13)
  support4 : Finset (Fin 13)
  support3_normal : support3 = surplusPairSupport₀ ∨
    support3 = surplusPairSupport₁
  support4_normal : support4 = surplusPairSupport₀ ∨
    support4 = surplusPairSupport₁
  row3 : SurplusRowDistancesEqual boundary 7 support3
  row4 : SurplusRowDistancesEqual boundary 8 support4

private def unitTerm (a b c d : Fin 13) (form : KalmansonForm) :
    WeightedKalmansonTerm (Fin 13) :=
  { quad := { a := a, b := b, c := c, d := d }
    form := form
    weight := 1 }

private theorem oneTerm_check (a b c d : Fin 13) (form : KalmansonForm)
    (hab : a < b) (hbc : b < c) (hcd : c < d) :
    (unitTerm a b c d form).check = true := by
  simp only [WeightedKalmansonTerm.check, unitTerm, decide_eq_true_eq]
  exact ⟨hab, hbc, hcd, by decide⟩

private theorem false_of_one_surplusTerm
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin 13 → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (term : WeightedKalmansonTerm (Fin 13))
    (hcheck : term.check = true)
    (hcancel :
      (term.leftEdges.map (edgeDist boundary)).sum =
        (term.rightEdges.map (edgeDist boundary)).sum) : False := by
  exact CardGeThirteenCenter9K4RowDomain.false_of_one_two_or_three_kalmanson_terms_of_sum_eq
    hA hinj himage hccw [term]
    (by simp) (by simpa using hcheck) (by simpa using hcancel)

private theorem false_of_surplusPair_support₀_support₀
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin 13 → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (h3 : SurplusRowDistancesEqual boundary 7 surplusPairSupport₀)
    (h4 : SurplusRowDistancesEqual boundary 8 surplusPairSupport₀) : False := by
  let term := unitTerm 2 6 7 8 .innerOuter
  apply false_of_one_surplusTerm hA hinj himage hccw term
  · exact oneTerm_check 2 6 7 8 .innerOuter (by decide) (by decide) (by decide)
  · have hcancel' : (dist (boundary 6) (boundary 7) + dist (boundary 2) (boundary 8) =
        dist (boundary 2) (boundary 7) + dist (boundary 6) (boundary 8)) := by
      have h3' := h3 (u := 2) (by simp [surplusPairSupport₀])
        (v := 6) (by simp [surplusPairSupport₀])
      have h4' := h4 (u := 2) (by simp [surplusPairSupport₀])
        (v := 6) (by simp [surplusPairSupport₀])
      have h3'' : dist (boundary 6) (boundary 7) =
          dist (boundary 2) (boundary 7) := by simpa [dist_comm] using h3'.symm
      have h4'' : dist (boundary 2) (boundary 8) =
          dist (boundary 6) (boundary 8) := by simpa [dist_comm] using h4'
      linarith
    simpa [term, unitTerm, WeightedKalmansonTerm.leftEdges,
      WeightedKalmansonTerm.rightEdges, OrderedQuadData.leftEdge0,
      OrderedQuadData.leftEdge1, OrderedQuadData.rightEdge0,
      OrderedQuadData.rightEdge1, List.map_append, List.map_replicate,
      List.sum_append, List.sum_replicate, nsmul_eq_mul, edgeDist] using hcancel'

private theorem false_of_surplusPair_support₀_support₁
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin 13 → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (h3 : SurplusRowDistancesEqual boundary 7 surplusPairSupport₀)
    (h4 : SurplusRowDistancesEqual boundary 8 surplusPairSupport₁) : False := by
  let term := unitTerm 6 7 8 10 .adjacentSides
  apply false_of_one_surplusTerm hA hinj himage hccw term
  · exact oneTerm_check 6 7 8 10 .adjacentSides (by decide) (by decide) (by decide)
  · have hcancel' : (dist (boundary 6) (boundary 7) + dist (boundary 8) (boundary 10) =
      dist (boundary 6) (boundary 8) + dist (boundary 7) (boundary 10)) := by
      have h3' := h3 (u := 6) (by simp [surplusPairSupport₀])
        (v := 10) (by simp [surplusPairSupport₀])
      have h4' := h4 (u := 10) (by simp [surplusPairSupport₁])
        (v := 6) (by simp [surplusPairSupport₁])
      have h3'' : dist (boundary 6) (boundary 7) =
          dist (boundary 7) (boundary 10) := by simpa [dist_comm] using h3'
      have h4'' : dist (boundary 8) (boundary 10) =
          dist (boundary 6) (boundary 8) := by simpa [dist_comm] using h4'
      linarith
    simpa [term, unitTerm, WeightedKalmansonTerm.leftEdges,
      WeightedKalmansonTerm.rightEdges, OrderedQuadData.leftEdge0,
      OrderedQuadData.leftEdge1, OrderedQuadData.rightEdge0,
      OrderedQuadData.rightEdge1, List.map_append, List.map_replicate,
      List.sum_append, List.sum_replicate, nsmul_eq_mul, edgeDist] using hcancel'

private theorem false_of_surplusPair_support₁_support₀
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin 13 → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (h3 : SurplusRowDistancesEqual boundary 7 surplusPairSupport₁)
    (h4 : SurplusRowDistancesEqual boundary 8 surplusPairSupport₀) : False := by
  let term := unitTerm 6 7 8 10 .adjacentSides
  apply false_of_one_surplusTerm hA hinj himage hccw term
  · exact oneTerm_check 6 7 8 10 .adjacentSides (by decide) (by decide) (by decide)
  · have hcancel' : (dist (boundary 6) (boundary 7) + dist (boundary 8) (boundary 10) =
      dist (boundary 6) (boundary 8) + dist (boundary 7) (boundary 10)) := by
      have h3' := h3 (u := 6) (by simp [surplusPairSupport₁])
        (v := 10) (by simp [surplusPairSupport₁])
      have h4' := h4 (u := 10) (by simp [surplusPairSupport₀])
        (v := 6) (by simp [surplusPairSupport₀])
      have h3'' : dist (boundary 6) (boundary 7) =
          dist (boundary 7) (boundary 10) := by simpa [dist_comm] using h3'
      have h4'' : dist (boundary 8) (boundary 10) =
          dist (boundary 6) (boundary 8) := by simpa [dist_comm] using h4'
      linarith
    simpa [term, unitTerm, WeightedKalmansonTerm.leftEdges,
      WeightedKalmansonTerm.rightEdges, OrderedQuadData.leftEdge0,
      OrderedQuadData.leftEdge1, OrderedQuadData.rightEdge0,
      OrderedQuadData.rightEdge1, List.map_append, List.map_replicate,
      List.sum_append, List.sum_replicate, nsmul_eq_mul, edgeDist] using hcancel'

private theorem false_of_surplusPair_support₁_support₁
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin 13 → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (h3 : SurplusRowDistancesEqual boundary 7 surplusPairSupport₁)
    (h4 : SurplusRowDistancesEqual boundary 8 surplusPairSupport₁) : False := by
  let term := unitTerm 3 6 7 8 .innerOuter
  apply false_of_one_surplusTerm hA hinj himage hccw term
  · exact oneTerm_check 3 6 7 8 .innerOuter (by decide) (by decide) (by decide)
  · have hcancel' : (dist (boundary 6) (boundary 7) + dist (boundary 3) (boundary 8) =
      dist (boundary 3) (boundary 7) + dist (boundary 6) (boundary 8)) := by
      have h3' := h3 (u := 3) (by simp [surplusPairSupport₁])
        (v := 6) (by simp [surplusPairSupport₁])
      have h4' := h4 (u := 3) (by simp [surplusPairSupport₁])
        (v := 6) (by simp [surplusPairSupport₁])
      have h3'' : dist (boundary 6) (boundary 7) =
          dist (boundary 3) (boundary 7) := by simpa [dist_comm] using h3'.symm
      have h4'' : dist (boundary 3) (boundary 8) =
          dist (boundary 6) (boundary 8) := by simpa [dist_comm] using h4'
      linarith
    simpa [term, unitTerm, WeightedKalmansonTerm.leftEdges,
      WeightedKalmansonTerm.rightEdges, OrderedQuadData.leftEdge0,
      OrderedQuadData.leftEdge1, OrderedQuadData.rightEdge0,
      OrderedQuadData.rightEdge1, List.map_append, List.map_replicate,
      List.sum_append, List.sum_replicate, nsmul_eq_mul, edgeDist] using hcancel'

/-- No two normalized four-support rows can coexist at adjacent surplus labels
`3` and `4`.  This is the four-leaf fixed-cell terminal consumed by a future
source occurrence/classifier theorem. -/
theorem false_of_surplusPairRows
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin 13 → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (rows : SurplusPairRows boundary) : False := by
  rcases rows with ⟨support3, support4, h3normal, h4normal, h3, h4⟩
  rcases h3normal with rfl | rfl <;> rcases h4normal with rfl | rfl
  · exact false_of_surplusPair_support₀_support₀ hA hinj himage hccw h3 h4
  · exact false_of_surplusPair_support₀_support₁ hA hinj himage hccw h3 h4
  · exact false_of_surplusPair_support₁_support₀ hA hinj himage hccw h3 h4
  · exact false_of_surplusPair_support₁_support₁ hA hinj himage hccw h3 h4

#print axioms false_of_surplusPairRows

end ATailFrontierLiveClosure
end Problem97

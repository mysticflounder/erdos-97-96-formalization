/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyFirstModelRefinements
import Erdos9796Proof.P97.Census554.FourPointTwoCircleBisectorOrderCore

/-!
# Two-circle occurrence from the exact-seventeen child-32 model

This file owns the source bridge for the canonical six-hit support
`[(15, 1), (15, 2), (1, 2), (1, 15), (9, 1), (9, 15)]`.  The two named
orders have the same projected orbit, so the bridge emits the four usual
order/orientation clauses.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtySecondTwoCircleRefinement

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenThirtyFirstModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

private abbrev priorOrientedHits :=
  ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits

private abbrev priorOccurrenceClause :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause

private abbrev priorOccurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

private theorem sourceIndexEquiv_symm_eq_of_same
    (order : NamedOrder) (actual direction : Orientation) (hsame : actual = direction)
    (index : Label) :
    (sourceIndexEquiv order actual).symm index =
      orientedLabelAtPosition order direction index := by
  subst actual
  rfl

private theorem sourceIndexEquiv_symm_eq_reflected_of_ne
    (order : NamedOrder) (actual direction : Orientation) (hne : actual ≠ direction)
    (index : Label) :
    (sourceIndexEquiv order actual).symm index =
      orientedLabelAtPosition order direction (Fin.rev index) := by
  cases actual <;> cases direction <;>
    simp_all [sourceIndexEquiv, orientedLabelAtPosition]

private theorem positiveRowsMatch_of_same {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation)
    (horder : order = source.model.order) (hsame : source.orientation = direction)
    (baseHits : List Hit) (choices : List (RowChoice Label))
    (hcover : ∀ choice ∈ choices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ baseHits)
    (hall : ∀ hit ∈ priorOrientedHits baseHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected) choices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  exact hall
    (orientedLabelAtPosition source.model.order direction choice.center,
      orientedLabelAtPosition source.model.order direction point)
    (by
      simp only [priorOrientedHits,
        ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits,
        List.mem_map]
      exact ⟨(choice.center, point), hcover choice hchoice point hpoint, rfl⟩)

private theorem positiveRowsMatch_of_ne {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation)
    (horder : order = source.model.order) (hne : source.orientation ≠ direction)
    (baseHits : List Hit) (choices : List (RowChoice Label))
    (hcover : ∀ choice ∈ choices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ baseHits)
    (hall : ∀ hit ∈ priorOrientedHits baseHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected) choices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  exact hall
    (orientedLabelAtPosition source.model.order direction (Fin.rev choice.center),
      orientedLabelAtPosition source.model.order direction (Fin.rev point))
    (by
      simp only [priorOrientedHits,
        ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits,
        List.mem_map]
      exact ⟨(Fin.rev choice.center, Fin.rev point),
        hcover choice hchoice point hpoint, rfl⟩)

private theorem signedArea2_cycle (a b c : ℝ²) :
    signedArea2 a b c = signedArea2 b c a := by
  simp only [signedArea2]
  ring

private theorem signedArea2_swap23 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 a c b := by
  simp only [signedArea2]
  ring

/- The canonical normalized support and the two orientation-specific row banks. -/

def child32TwoCircleHits : List Hit :=
  [(15, 1), (15, 2), (1, 2), (1, 15), (9, 1), (9, 15)]

def child32TwoCircleForwardChoices : List (RowChoice Label) :=
  [{ center := 15, support := {1, 2} },
    { center := 1, support := {2, 15} },
    { center := 9, support := {1, 15} }]

def child32TwoCircleReverseChoices : List (RowChoice Label) :=
  [{ center := 1, support := {14, 15} },
    { center := 15, support := {1, 14} },
    { center := 7, support := {1, 15} }]

theorem child32TwoCircleForwardCover :
    ∀ choice ∈ child32TwoCircleForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ child32TwoCircleHits := by
  native_decide

theorem child32TwoCircleReverseCover :
    ∀ choice ∈ child32TwoCircleReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ child32TwoCircleHits := by
  native_decide

private def child32TwoCircleForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P child32TwoCircleForwardChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 2
  v := 9
  u := 15
  y := 1
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(2, 15), [.flip 2 15, .row 15 2 1, .flip 15 1,
      .row 1 15 2, .flip 1 2], (2, 1)⟩ (by native_decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(15, 9), [.flip 15 9, .row 9 15 1, .flip 9 1], (1, 9)⟩ (by native_decide) }

private def child32TwoCircleReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P child32TwoCircleReverseChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 14
  v := 7
  u := 1
  y := 15
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(14, 1), [.flip 14 1, .row 1 14 15, .flip 1 15,
      .row 15 1 14, .flip 15 14], (14, 15)⟩ (by native_decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(1, 7), [.flip 1 7, .row 7 1 15, .flip 7 15], (15, 7)⟩ (by native_decide) }

private theorem false_of_child32TwoCircleForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P child32TwoCircleForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (child32TwoCircleForwardCore hrows)
  · change signedArea2 (pointOf 15) (pointOf 2) (pointOf 9) < 0
    rw [signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw (i := (2 : Label)) (j := (9 : Label))
      (k := (15 : Label)) (by decide) (by decide)
  · change signedArea2 (pointOf 1) (pointOf 2) (pointOf 9) < 0
    exact hneg_of_ccw hreal.injective hccw (i := (1 : Label)) (j := (2 : Label))
      (k := (9 : Label)) (by decide) (by decide)

private theorem false_of_child32TwoCircleReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P child32TwoCircleReverseChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (child32TwoCircleReverseCore hrows)
  · change 0 < signedArea2 (pointOf 1) (pointOf 14) (pointOf 7)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw (i := (1 : Label)) (j := (7 : Label))
      (k := (14 : Label)) (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 15) (pointOf 14) (pointOf 7)
    rw [signedArea2_cycle, signedArea2_cycle, signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw (i := (7 : Label)) (j := (14 : Label))
      (k := (15 : Label)) (by decide) (by decide)
    linarith

private theorem false_of_child32TwoCircleHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation)
    (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits child32TwoCircleHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_child32TwoCircleForwardRows hreal source.boundary_ccw
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        child32TwoCircleHits child32TwoCircleForwardChoices child32TwoCircleForwardCover hall)
  · exact false_of_child32TwoCircleReverseRows hreal source.boundary_ccw
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        child32TwoCircleHits child32TwoCircleReverseChoices child32TwoCircleReverseCover hall)

def child32TwoCircleClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom := priorOccurrenceClause child32TwoCircleHits order direction

theorem sourceAssign_child32TwoCircleClause {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (child32TwoCircleClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_child32TwoCircleHits source order direction horder.symm hall

def child32TwoCircleClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.map fun direction => child32TwoCircleClause order direction

theorem sourceAssign_child32TwoCircleClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ child32TwoCircleClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [child32TwoCircleClauses, List.mem_flatMap, List.mem_map] at hclause
  rcases hclause with ⟨order, _, direction, _, rfl⟩
  exact sourceAssign_child32TwoCircleClause source order direction

theorem child32TwoCircleClauses_length : child32TwoCircleClauses.length = 4 := by
  native_decide

#print axioms sourceAssign_child32TwoCircleClause
#print axioms sourceAssign_child32TwoCircleClauses

end ATailBlockerVExactSeventeenThirtySecondTwoCircleRefinement
end Problem97

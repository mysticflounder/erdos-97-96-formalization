/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenTwentyFourthModelRefinements
import Erdos9796Proof.P97.Census554.FourPointTwoCircleBisectorOrderCore
import Erdos9796Proof.P97.Census554.ConvexFivePointCore
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericPerpBisectorNogoodCertificate

/-!
# Source-backed refinements from the twenty-fifth exact-seventeen SAT model

The authenticated model supplies two two-circle bisector obstructions, one
convex-five obstruction, one two-Kalmanson cancellation, and one
perpendicular-bisector obstruction. Each occurrence is proved impossible for every
source realization in both orientations before its four order/orientation
clauses are appended to the successor CNF.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenTwentyFifthModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenTwentyFourthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

private abbrev priorOrientedHits :=
  ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits

private abbrev priorOccurrenceClause :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause

private abbrev priorOccurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

private theorem sourceIndexEquiv_symm_eq_of_same
    (order : NamedOrder) (actual direction : Orientation)
    (hsame : actual = direction) (index : Label) :
    (sourceIndexEquiv order actual).symm index =
      orientedLabelAtPosition order direction index := by
  subst actual
  rfl

private theorem sourceIndexEquiv_symm_eq_reflected_of_ne
    (order : NamedOrder) (actual direction : Orientation)
    (hne : actual ≠ direction) (index : Label) :
    (sourceIndexEquiv order actual).symm index =
      orientedLabelAtPosition order direction (Fin.rev index) := by
  cases actual <;> cases direction <;>
    simp_all [sourceIndexEquiv, orientedLabelAtPosition]

private theorem positiveRowsMatch_of_same {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hsame : source.orientation = direction)
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
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hne : source.orientation ≠ direction)
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

private theorem signedArea2_swap12 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 b a c := by
  simp only [signedArea2]
  ring

private theorem signedArea2_swap23 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 a c b := by
  simp only [signedArea2]
  ring

private theorem signedArea2_cycle (a b c : ℝ²) :
    signedArea2 a b c = signedArea2 b c a := by
  simp only [signedArea2]
  ring

/- ## First two-circle bisector occurrence -/

def bisectorOneForwardChoices : List (RowChoice Label) :=
  [{ center := 2, support := {6, 12} },
    { center := 6, support := {1, 11} },
    { center := 11, support := {6, 12} },
    { center := 12, support := {1, 11} }]

def bisectorOneReverseChoices : List (RowChoice Label) :=
  [{ center := 14, support := {4, 10} },
    { center := 10, support := {5, 15} },
    { center := 5, support := {4, 10} },
    { center := 4, support := {5, 15} }]

def bisectorOneHits : List Hit :=
  [(2, 6), (2, 12), (6, 1), (6, 11),
    (11, 6), (11, 12), (12, 1), (12, 11)]

theorem bisectorOneForwardCover :
    ∀ choice ∈ bisectorOneForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ bisectorOneHits := by
  native_decide

theorem bisectorOneReverseCover :
    ∀ choice ∈ bisectorOneReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ bisectorOneHits := by
  native_decide

private def bisectorOneForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorOneForwardChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 2
  v := 1
  u := 6
  y := 12
  huy := by decide
  qu_qy := EdgeClosure.row 2 6 12
    (hrows ({ center := 2, support := {6, 12} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 2, support := {6, 12} } : RowChoice Label)
      (by native_decide) (by native_decide))
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(6, 1), [.row 6 1 11, .flip 6 11, .row 11 6 12,
      .flip 11 12, .row 12 11 1], (12, 1)⟩
      (by native_decide) }

private def bisectorOneReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorOneReverseChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 14
  v := 15
  u := 10
  y := 4
  huy := by decide
  qu_qy := EdgeClosure.row 14 10 4
    (hrows ({ center := 14, support := {4, 10} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 14, support := {4, 10} } : RowChoice Label)
      (by native_decide) (by native_decide))
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(10, 15), [.row 10 15 5, .flip 10 5, .row 5 10 4,
      .flip 5 4, .row 4 5 15], (4, 15)⟩
      (by native_decide) }

private theorem false_of_bisectorOneForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorOneForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (bisectorOneForwardCore hrows)
  · change 0 < signedArea2 (pointOf 6) (pointOf 2) (pointOf 1)
    rw [signedArea2_cycle, signedArea2_cycle, signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (2 : Label)) (k := (6 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 12) (pointOf 2) (pointOf 1)
    rw [signedArea2_cycle, signedArea2_cycle, signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (2 : Label)) (k := (12 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_bisectorOneReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorOneReverseChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (bisectorOneReverseCore hrows)
  · change signedArea2 (pointOf 10) (pointOf 14) (pointOf 15) < 0
    exact hneg_of_ccw hreal.injective hccw
      (i := (10 : Label)) (j := (14 : Label)) (k := (15 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 4) (pointOf 14) (pointOf 15) < 0
    exact hneg_of_ccw hreal.injective hccw
      (i := (4 : Label)) (j := (14 : Label)) (k := (15 : Label))
      (by decide) (by decide)

private theorem false_of_bisectorOneHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits bisectorOneHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_bisectorOneForwardRows hreal source.boundary_ccw
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        bisectorOneHits bisectorOneForwardChoices bisectorOneForwardCover hall)
  · exact false_of_bisectorOneReverseRows hreal source.boundary_ccw
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        bisectorOneHits bisectorOneReverseChoices bisectorOneReverseCover hall)

theorem sourceAssign_bisectorOneClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (priorOccurrenceClause bisectorOneHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_bisectorOneHits source order direction horder.symm hall

/- ## Second two-circle bisector occurrence -/

def bisectorTwoForwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {0, 5} },
    { center := 5, support := {1, 10} },
    { center := 10, support := {3, 5} },
    { center := 3, support := {0, 10} },
    { center := 9, support := {1, 3} }]

def bisectorTwoReverseChoices : List (RowChoice Label) :=
  [{ center := 15, support := {11, 16} },
    { center := 11, support := {6, 15} },
    { center := 6, support := {11, 13} },
    { center := 13, support := {6, 16} },
    { center := 7, support := {13, 15} }]

def bisectorTwoHits : List Hit :=
  [(1, 0), (1, 5), (5, 1), (5, 10), (10, 3),
    (10, 5), (3, 0), (3, 10), (9, 1), (9, 3)]

theorem bisectorTwoForwardCover :
    ∀ choice ∈ bisectorTwoForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ bisectorTwoHits := by
  native_decide

theorem bisectorTwoReverseCover :
    ∀ choice ∈ bisectorTwoReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ bisectorTwoHits := by
  native_decide

private def bisectorTwoForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorTwoForwardChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 0
  v := 9
  u := 1
  y := 3
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(0, 1), [.flip 0 1, .row 1 0 5, .flip 1 5, .row 5 1 10,
      .flip 5 10, .row 10 5 3, .flip 10 3, .row 3 10 0,
      .flip 3 0], (0, 3)⟩ (by native_decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(1, 9), [.flip 1 9, .row 9 1 3, .flip 9 3], (3, 9)⟩
      (by native_decide) }

private def bisectorTwoReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorTwoReverseChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 16
  v := 7
  u := 15
  y := 13
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(16, 15), [.flip 16 15, .row 15 16 11, .flip 15 11,
      .row 11 15 6, .flip 11 6, .row 6 11 13, .flip 6 13,
      .row 13 6 16, .flip 13 16], (16, 13)⟩ (by native_decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(15, 7), [.flip 15 7, .row 7 15 13, .flip 7 13],
      (13, 7)⟩ (by native_decide) }

private theorem false_of_bisectorTwoForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorTwoForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (bisectorTwoForwardCore hrows)
  · change 0 < signedArea2 (pointOf 1) (pointOf 0) (pointOf 9)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (1 : Label)) (k := (9 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 3) (pointOf 0) (pointOf 9)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (3 : Label)) (k := (9 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_bisectorTwoReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorTwoReverseChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (bisectorTwoReverseCore hrows)
  · change signedArea2 (pointOf 15) (pointOf 16) (pointOf 7) < 0
    rw [signedArea2_cycle, signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (7 : Label)) (j := (15 : Label)) (k := (16 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 13) (pointOf 16) (pointOf 7) < 0
    rw [signedArea2_cycle, signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (7 : Label)) (j := (13 : Label)) (k := (16 : Label))
      (by decide) (by decide)

private theorem false_of_bisectorTwoHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits bisectorTwoHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_bisectorTwoForwardRows hreal source.boundary_ccw
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        bisectorTwoHits bisectorTwoForwardChoices bisectorTwoForwardCover hall)
  · exact false_of_bisectorTwoReverseRows hreal source.boundary_ccw
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        bisectorTwoHits bisectorTwoReverseChoices bisectorTwoReverseCover hall)

theorem sourceAssign_bisectorTwoClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (priorOccurrenceClause bisectorTwoHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_bisectorTwoHits source order direction horder.symm hall

/- ## Convex-five occurrence -/

def convexFiveForwardChoices : List (RowChoice Label) :=
  [{ center := 12, support := {1, 11} },
    { center := 6, support := {1, 11} },
    { center := 2, support := {1, 6, 12} }]

def convexFiveReverseChoices : List (RowChoice Label) :=
  [{ center := 4, support := {5, 15} },
    { center := 10, support := {5, 15} },
    { center := 14, support := {4, 10, 15} }]

def convexFiveHits : List Hit :=
  [(12, 1), (12, 11), (6, 1), (6, 11),
    (2, 1), (2, 6), (2, 12)]

theorem convexFiveForwardCover :
    ∀ choice ∈ convexFiveForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ convexFiveHits := by
  native_decide

theorem convexFiveReverseCover :
    ∀ choice ∈ convexFiveReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ convexFiveHits := by
  native_decide

private def convexFiveForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P convexFiveForwardChoices) :
    Census554.ConvexFivePointCore.Core P := {
  a := 11
  x := 12
  b := 1
  c := 2
  y := 6
  hab := by decide
  hxy := by decide
  xa_xb := EdgeClosure.row 12 11 1
    (hrows ({ center := 12, support := {1, 11} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 12, support := {1, 11} } : RowChoice Label)
      (by native_decide) (by native_decide))
  ya_yb := EdgeClosure.row 6 11 1
    (hrows ({ center := 6, support := {1, 11} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 6, support := {1, 11} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cx := EdgeClosure.row 2 1 12
    (hrows ({ center := 2, support := {1, 6, 12} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 2, support := {1, 6, 12} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cy := EdgeClosure.row 2 1 6
    (hrows ({ center := 2, support := {1, 6, 12} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 2, support := {1, 6, 12} } : RowChoice Label)
      (by native_decide) (by native_decide)) }

private def convexFiveReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P convexFiveReverseChoices) :
    Census554.ConvexFivePointCore.Core P := {
  a := 5
  x := 4
  b := 15
  c := 14
  y := 10
  hab := by decide
  hxy := by decide
  xa_xb := EdgeClosure.row 4 5 15
    (hrows ({ center := 4, support := {5, 15} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 4, support := {5, 15} } : RowChoice Label)
      (by native_decide) (by native_decide))
  ya_yb := EdgeClosure.row 10 5 15
    (hrows ({ center := 10, support := {5, 15} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 10, support := {5, 15} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cx := EdgeClosure.row 14 15 4
    (hrows ({ center := 14, support := {4, 10, 15} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 14, support := {4, 10, 15} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cy := EdgeClosure.row 14 15 10
    (hrows ({ center := 14, support := {4, 10, 15} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 14, support := {4, 10, 15} } : RowChoice Label)
      (by native_decide) (by native_decide)) }

private theorem false_of_convexFiveForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexFiveForwardChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core_of_neg hreal
    (convexFiveForwardCore hrows)
  · change signedArea2 (pointOf 11) (pointOf 12) (pointOf 1) < 0
    rw [signedArea2_cycle, signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (11 : Label)) (k := (12 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 1) (pointOf 2) (pointOf 6) < 0
    exact hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (2 : Label)) (k := (6 : Label))
      (by decide) (by decide)

private theorem false_of_convexFiveReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexFiveReverseChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core hreal
    (convexFiveReverseCore hrows)
  · change 0 < signedArea2 (pointOf 5) (pointOf 4) (pointOf 15)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (4 : Label)) (j := (5 : Label)) (k := (15 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 15) (pointOf 14) (pointOf 10)
    rw [signedArea2_cycle, signedArea2_cycle, signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (10 : Label)) (j := (14 : Label)) (k := (15 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_convexFiveHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits convexFiveHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_convexFiveForwardRows hreal source.boundary_ccw
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        convexFiveHits convexFiveForwardChoices convexFiveForwardCover hall)
  · exact false_of_convexFiveReverseRows hreal source.boundary_ccw
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        convexFiveHits convexFiveReverseChoices convexFiveReverseCover hall)

theorem sourceAssign_convexFiveClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (priorOccurrenceClause convexFiveHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_convexFiveHits source order direction horder.symm hall

/- ## Two-Kalmanson cancellation occurrence -/

def cancellationForwardChoices : List (RowChoice Label) :=
  [{ center := 2, support := {1, 12} },
    { center := 12, support := {6, 11} },
    { center := 11, support := {6, 12} },
    { center := 6, support := {1, 11} }]

def cancellationReverseChoices : List (RowChoice Label) :=
  [{ center := 14, support := {4, 15} },
    { center := 4, support := {5, 10} },
    { center := 5, support := {4, 10} },
    { center := 10, support := {5, 15} }]

def cancellationHits : List Hit :=
  [(2, 1), (2, 12), (12, 6), (12, 11),
    (11, 6), (11, 12), (6, 1), (6, 11)]

theorem cancellationForwardCover :
    ∀ choice ∈ cancellationForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ cancellationHits := by
  native_decide

theorem cancellationReverseCover :
    ∀ choice ∈ cancellationReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ cancellationHits := by
  native_decide

def cancellationForwardData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨1, 2, 3, 12⟩
  firstForm := .adjacentSides
  secondQuad := ⟨1, 3, 6, 12⟩
  secondForm := .adjacentSides
  permutation := ⟨1, 3, 0, 2⟩
  path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 12], (2, 12)⟩
  path1 := ⟨(3, 12), [], (3, 12)⟩
  path2 := ⟨(1, 3), [], (1, 3)⟩
  path3 := ⟨(6, 12), [.flip 6 12, .row 12 6 11, .flip 12 11,
    .row 11 12 6, .flip 11 6, .row 6 11 1, .flip 6 1], (1, 6)⟩ }

def cancellationReverseData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨4, 10, 11, 15⟩
  firstForm := .adjacentSides
  secondQuad := ⟨4, 11, 14, 15⟩
  secondForm := .adjacentSides
  permutation := ⟨1, 3, 0, 2⟩
  path0 := ⟨(4, 10), [.row 4 10 5, .flip 4 5, .row 5 4 10,
    .flip 5 10, .row 10 5 15], (10, 15)⟩
  path1 := ⟨(11, 15), [], (11, 15)⟩
  path2 := ⟨(4, 11), [], (4, 11)⟩
  path3 := ⟨(14, 15), [.row 14 15 4, .flip 14 4], (4, 14)⟩ }

theorem cancellationForwardData_check :
    cancellationForwardData.check cancellationForwardChoices = true := by
  native_decide

theorem cancellationReverseData_check :
    cancellationReverseData.check cancellationReverseChoices = true := by
  native_decide

private theorem false_of_cancellationHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits cancellationHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_twoKalmansonCancellationData_of_check
      source.carrier_convexIndep source.boundary_image source.boundary_ccw
      hreal cancellationForwardChoices
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        cancellationHits cancellationForwardChoices cancellationForwardCover hall)
      cancellationForwardData cancellationForwardData_check
  · exact false_of_twoKalmansonCancellationData_of_check
      source.carrier_convexIndep source.boundary_image source.boundary_ccw
      hreal cancellationReverseChoices
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        cancellationHits cancellationReverseChoices cancellationReverseCover hall)
      cancellationReverseData cancellationReverseData_check

theorem sourceAssign_cancellationClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (priorOccurrenceClause cancellationHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_cancellationHits source order direction horder.symm hall

/- ## Perpendicular-bisector obstruction -/

def perpBisectorForwardChoices : List (RowChoice Label) :=
  [{ center := 2, support := {1, 12} },
    { center := 12, support := {6, 11} },
    { center := 11, support := {6, 12} },
    { center := 6, support := {1, 11} },
    { center := 16, support := {1, 12} }]

def perpBisectorReverseChoices : List (RowChoice Label) :=
  [{ center := 14, support := {4, 15} },
    { center := 4, support := {5, 10} },
    { center := 5, support := {4, 10} },
    { center := 10, support := {5, 15} },
    { center := 0, support := {4, 15} }]

def perpBisectorHits : List Hit :=
  [(2, 1), (2, 12), (12, 6), (12, 11), (11, 6),
    (11, 12), (6, 1), (6, 11), (16, 1), (16, 12)]

theorem perpBisectorForwardCover :
    ∀ choice ∈ perpBisectorForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ perpBisectorHits := by
  native_decide

theorem perpBisectorReverseCover :
    ∀ choice ∈ perpBisectorReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ perpBisectorHits := by
  native_decide

def perpBisectorForwardData : PerpBisectorData Label := {
  a := 12
  b := 1
  p := 2
  q := 6
  r := 16
  pa_pb := ⟨(2, 12), [.row 2 12 1], (2, 1)⟩
  qa_qb := ⟨(6, 12), [.flip 6 12, .row 12 6 11, .flip 12 11,
    .row 11 12 6, .flip 11 6, .row 6 11 1], (6, 1)⟩
  ra_rb := ⟨(16, 12), [.row 16 12 1], (16, 1)⟩ }

def perpBisectorReverseData : PerpBisectorData Label := {
  a := 4
  b := 15
  p := 14
  q := 10
  r := 0
  pa_pb := ⟨(14, 4), [.row 14 4 15], (14, 15)⟩
  qa_qb := ⟨(10, 4), [.flip 10 4, .row 4 10 5, .flip 4 5,
    .row 5 4 10, .flip 5 10, .row 10 5 15], (10, 15)⟩
  ra_rb := ⟨(0, 4), [.row 0 4 15], (0, 15)⟩ }

theorem perpBisectorForwardData_check :
    perpBisectorForwardData.check perpBisectorForwardChoices = true := by
  native_decide

theorem perpBisectorReverseData_check :
    perpBisectorReverseData.check perpBisectorReverseChoices = true := by
  native_decide

private theorem false_of_perpBisectorHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits perpBisectorHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · have hrows := positiveRowsMatch_of_same source source.model.order direction rfl hsame
      perpBisectorHits perpBisectorForwardChoices perpBisectorForwardCover hall
    rcases nonempty_perpBisectorCore_of_positiveCheck hrows perpBisectorForwardData
      perpBisectorForwardData_check with ⟨core⟩
    exact Census554.EqualityCore.false_of_convexIndep_of_perpBisectorCore
      hreal source.carrier_convexIndep
      (fun label => boundaryLabel_mem source.boundary source.boundary_image id label) core
  · have hrows := positiveRowsMatch_of_ne source source.model.order direction rfl hsame
      perpBisectorHits perpBisectorReverseChoices perpBisectorReverseCover hall
    rcases nonempty_perpBisectorCore_of_positiveCheck hrows perpBisectorReverseData
      perpBisectorReverseData_check with ⟨core⟩
    exact Census554.EqualityCore.false_of_convexIndep_of_perpBisectorCore
      hreal source.carrier_convexIndep
      (fun label => boundaryLabel_mem source.boundary source.boundary_image id label) core

theorem sourceAssign_perpBisectorClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (priorOccurrenceClause perpBisectorHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_perpBisectorHits source order direction horder.symm hall

/- ## Complete five-family suffix and successor CNF -/

def twentyFifthOccurrenceHits : List (List Hit) :=
  [bisectorOneHits, bisectorTwoHits, convexFiveHits,
    cancellationHits, perpBisectorHits]

def twentyFifthModelRefinementClauses : Std.Sat.CNF Atom :=
  twentyFifthOccurrenceHits.flatMap priorOccurrenceClauses

theorem twentyFifthModelRefinementClauses_length :
    twentyFifthModelRefinementClauses.length = 20 := by
  native_decide

theorem sourceAssign_twentyFifthModelRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ twentyFifthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [twentyFifthModelRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨hits, hhits, hclause⟩
  simp only [twentyFifthOccurrenceHits, List.mem_cons, List.not_mem_nil,
    or_false] at hhits
  simp only [priorOccurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  rcases hhits with rfl | rfl | rfl | rfl | rfl
  · exact sourceAssign_bisectorOneClause source order direction
  · exact sourceAssign_bisectorTwoClause source order direction
  · exact sourceAssign_convexFiveClause source order direction
  · exact sourceAssign_cancellationClause source order direction
  · exact sourceAssign_perpBisectorClause source order direction

def extendedTwentyFifthModelRefinementsCnf : Std.Sat.CNF Atom :=
  ATailBlockerVExactSeventeenTwentyFourthModelRefinements.extendedTwentyFourthModelRefinementsCnf ++
    twentyFifthModelRefinementClauses

theorem extendedTwentyFifthModelRefinementsCnf_length :
    extendedTwentyFifthModelRefinementsCnf.length = 5846272 := by
  native_decide

theorem sourceAssign_extendedTwentyFifthModelRefinementsCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedTwentyFifthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedTwentyFifthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h :=
      ATailBlockerVExactSeventeenTwentyFourthModelRefinements.sourceAssign_extendedTwentyFourthModelRefinementsCnf
        source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_twentyFifthModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedTwentyFifthModelRefinementsCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedTwentyFifthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedTwentyFifthModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedTwentyFifthModelRefinementsCnf

end ATailBlockerVExactSeventeenTwentyFifthModelRefinements
end Problem97

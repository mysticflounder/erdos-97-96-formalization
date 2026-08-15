/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenTwentyThirdModelRefinements
import Erdos9796Proof.P97.Census554.FourPointTwoCircleBisectorOrderCore
import Erdos9796Proof.P97.Census554.ConvexFivePointCore

/-!
# Source-backed refinements from the twenty-fourth exact-seventeen SAT model

The authenticated model supplies two two-circle bisector obstructions, one
convex-five obstruction, one two-Kalmanson cancellation, and one
duplicate-center obstruction. Each occurrence is proved impossible for every
source realization in both orientations before its four order/orientation
clauses are appended to the successor CNF.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenTwentyFourthModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenTwentyThirdModelRefinements
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
  [{ center := 6, support := {13, 15} },
    { center := 13, support := {0, 1} },
    { center := 1, support := {0, 13} },
    { center := 0, support := {1, 15} }]

def bisectorOneReverseChoices : List (RowChoice Label) :=
  [{ center := 10, support := {1, 3} },
    { center := 3, support := {15, 16} },
    { center := 15, support := {3, 16} },
    { center := 16, support := {1, 15} }]

def bisectorOneHits : List Hit :=
  [(6, 15), (6, 13), (13, 1), (13, 0),
    (1, 13), (1, 0), (0, 15), (0, 1)]

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
  q := 6
  v := 0
  u := 13
  y := 15
  huy := by decide
  qu_qy := EdgeClosure.row 6 13 15
    (hrows ({ center := 6, support := {13, 15} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 6, support := {13, 15} } : RowChoice Label)
      (by native_decide) (by native_decide))
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(13, 0), [.row 13 0 1, .flip 13 1, .row 1 13 0,
      .flip 1 0, .row 0 1 15, .flip 0 15], (15, 0)⟩
      (by native_decide) }

private def bisectorOneReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorOneReverseChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 10
  v := 16
  u := 3
  y := 1
  huy := by decide
  qu_qy := EdgeClosure.row 10 3 1
    (hrows ({ center := 10, support := {1, 3} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 10, support := {1, 3} } : RowChoice Label)
      (by native_decide) (by native_decide))
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(3, 16), [.row 3 16 15, .flip 3 15, .row 15 3 16,
      .flip 15 16, .row 16 15 1, .flip 16 1], (1, 16)⟩
      (by native_decide) }

private theorem false_of_bisectorOneForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorOneForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (bisectorOneForwardCore hrows)
  · change 0 < signedArea2 (pointOf 13) (pointOf 6) (pointOf 0)
    rw [signedArea2_cycle, signedArea2_cycle, signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (6 : Label)) (k := (13 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 15) (pointOf 6) (pointOf 0)
    rw [signedArea2_cycle, signedArea2_cycle, signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (6 : Label)) (k := (15 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_bisectorOneReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorOneReverseChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (bisectorOneReverseCore hrows)
  · change signedArea2 (pointOf 3) (pointOf 10) (pointOf 16) < 0
    exact hneg_of_ccw hreal.injective hccw
      (i := (3 : Label)) (j := (10 : Label)) (k := (16 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 1) (pointOf 10) (pointOf 16) < 0
    exact hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (10 : Label)) (k := (16 : Label))
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
  [{ center := 2, support := {12, 14} },
    { center := 12, support := {0, 14} },
    { center := 14, support := {0, 12} }]

def bisectorTwoReverseChoices : List (RowChoice Label) :=
  [{ center := 14, support := {2, 4} },
    { center := 4, support := {2, 16} },
    { center := 2, support := {4, 16} }]

def bisectorTwoHits : List Hit :=
  [(2, 14), (2, 12), (12, 0), (12, 14), (14, 0), (14, 12)]

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
  q := 2
  v := 0
  u := 12
  y := 14
  huy := by decide
  qu_qy := EdgeClosure.row 2 12 14
    (hrows ({ center := 2, support := {12, 14} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 2, support := {12, 14} } : RowChoice Label)
      (by native_decide) (by native_decide))
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(12, 0), [.row 12 0 14, .flip 12 14, .row 14 12 0], (14, 0)⟩
      (by native_decide) }

private def bisectorTwoReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorTwoReverseChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 14
  v := 16
  u := 4
  y := 2
  huy := by decide
  qu_qy := EdgeClosure.row 14 4 2
    (hrows ({ center := 14, support := {2, 4} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 14, support := {2, 4} } : RowChoice Label)
      (by native_decide) (by native_decide))
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(4, 16), [.row 4 16 2, .flip 4 2, .row 2 4 16],
      (2, 16)⟩ (by native_decide) }

private theorem false_of_bisectorTwoForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorTwoForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (bisectorTwoForwardCore hrows)
  · change 0 < signedArea2 (pointOf 12) (pointOf 2) (pointOf 0)
    rw [signedArea2_cycle, signedArea2_cycle, signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (2 : Label)) (k := (12 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 14) (pointOf 2) (pointOf 0)
    rw [signedArea2_cycle, signedArea2_cycle, signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (2 : Label)) (k := (14 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_bisectorTwoReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorTwoReverseChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (bisectorTwoReverseCore hrows)
  · change signedArea2 (pointOf 4) (pointOf 14) (pointOf 16) < 0
    exact hneg_of_ccw hreal.injective hccw
      (i := (4 : Label)) (j := (14 : Label)) (k := (16 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 2) (pointOf 14) (pointOf 16) < 0
    exact hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (14 : Label)) (k := (16 : Label))
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
  [{ center := 8, support := {5, 13} },
    { center := 13, support := {0, 1} },
    { center := 1, support := {0, 5, 13} },
    { center := 0, support := {1, 8} }]

def convexFiveReverseChoices : List (RowChoice Label) :=
  [{ center := 8, support := {3, 11} },
    { center := 3, support := {15, 16} },
    { center := 15, support := {3, 11, 16} },
    { center := 16, support := {8, 15} }]

def convexFiveHits : List Hit :=
  [(8, 5), (8, 13), (13, 1), (13, 0),
    (1, 5), (1, 13), (1, 0), (0, 8), (0, 1)]

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
  a := 5
  x := 8
  b := 13
  c := 0
  y := 1
  hab := by decide
  hxy := by decide
  xa_xb := EdgeClosure.row 8 5 13
    (hrows ({ center := 8, support := {5, 13} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 8, support := {5, 13} } : RowChoice Label)
      (by native_decide) (by native_decide))
  ya_yb := EdgeClosure.row 1 5 13
    (hrows ({ center := 1, support := {0, 5, 13} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 1, support := {0, 5, 13} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cx := edgeClosure_of_checkPath_positive hrows
    ⟨(0, 13), [.flip 0 13, .row 13 0 1, .flip 13 1,
      .row 1 13 0, .flip 1 0, .row 0 1 8], (0, 8)⟩
      (by native_decide)
  cb_cy := edgeClosure_of_checkPath_positive hrows
    ⟨(0, 13), [.flip 0 13, .row 13 0 1, .flip 13 1,
      .row 1 13 0, .flip 1 0], (0, 1)⟩
      (by native_decide) }

private def convexFiveReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P convexFiveReverseChoices) :
    Census554.ConvexFivePointCore.Core P := {
  a := 11
  x := 8
  b := 3
  c := 16
  y := 15
  hab := by decide
  hxy := by decide
  xa_xb := EdgeClosure.row 8 11 3
    (hrows ({ center := 8, support := {3, 11} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 8, support := {3, 11} } : RowChoice Label)
      (by native_decide) (by native_decide))
  ya_yb := EdgeClosure.row 15 11 3
    (hrows ({ center := 15, support := {3, 11, 16} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 15, support := {3, 11, 16} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cx := edgeClosure_of_checkPath_positive hrows
    ⟨(16, 3), [.flip 16 3, .row 3 16 15, .flip 3 15,
      .row 15 3 16, .flip 15 16, .row 16 15 8], (16, 8)⟩
      (by native_decide)
  cb_cy := edgeClosure_of_checkPath_positive hrows
    ⟨(16, 3), [.flip 16 3, .row 3 16 15, .flip 3 15,
      .row 15 3 16, .flip 15 16], (16, 15)⟩
      (by native_decide) }

private theorem false_of_convexFiveForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexFiveForwardChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core_of_neg hreal
    (convexFiveForwardCore hrows)
  · change signedArea2 (pointOf 5) (pointOf 8) (pointOf 13) < 0
    exact hneg_of_ccw hreal.injective hccw
      (i := (5 : Label)) (j := (8 : Label)) (k := (13 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 13) (pointOf 0) (pointOf 1) < 0
    rw [signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (1 : Label)) (k := (13 : Label))
      (by decide) (by decide)

private theorem false_of_convexFiveReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexFiveReverseChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core hreal
    (convexFiveReverseCore hrows)
  · change 0 < signedArea2 (pointOf 11) (pointOf 8) (pointOf 3)
    rw [signedArea2_cycle, signedArea2_cycle, signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (3 : Label)) (j := (8 : Label)) (k := (11 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 3) (pointOf 16) (pointOf 15)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (3 : Label)) (j := (15 : Label)) (k := (16 : Label))
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
  [{ center := 2, support := {1, 14} },
    { center := 11, support := {0, 1} },
    { center := 12, support := {0, 14} }]

def cancellationReverseChoices : List (RowChoice Label) :=
  [{ center := 14, support := {2, 15} },
    { center := 5, support := {15, 16} },
    { center := 4, support := {2, 16} }]

def cancellationHits : List Hit :=
  [(2, 1), (2, 14), (11, 0), (11, 1), (12, 0), (12, 14)]

theorem cancellationForwardCover :
    ∀ choice ∈ cancellationForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ cancellationHits := by
  native_decide

theorem cancellationReverseCover :
    ∀ choice ∈ cancellationReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ cancellationHits := by
  native_decide

def cancellationForwardData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨0, 1, 2, 11⟩
  firstForm := .innerOuter
  secondQuad := ⟨0, 2, 12, 14⟩
  secondForm := .adjacentSides
  permutation := ⟨3, 1, 0, 2⟩
  path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 14], (2, 14)⟩
  path1 := ⟨(0, 11), [.flip 0 11, .row 11 0 1, .flip 11 1], (1, 11)⟩
  path2 := ⟨(0, 2), [], (0, 2)⟩
  path3 := ⟨(12, 14), [.row 12 14 0, .flip 12 0], (0, 12)⟩ }

def cancellationReverseData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨5, 14, 15, 16⟩
  firstForm := .innerOuter
  secondQuad := ⟨2, 4, 14, 16⟩
  secondForm := .adjacentSides
  permutation := ⟨2, 0, 3, 1⟩
  path0 := ⟨(14, 15), [.row 14 15 2, .flip 14 2], (2, 14)⟩
  path1 := ⟨(5, 16), [.row 5 16 15], (5, 15)⟩
  path2 := ⟨(2, 4), [.flip 2 4, .row 4 2 16], (4, 16)⟩
  path3 := ⟨(14, 16), [], (14, 16)⟩ }

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

/- ## Duplicate-center obstruction -/

def duplicateCenterForwardChoices : List (RowChoice Label) :=
  [{ center := 3, support := {15, 16} },
    { center := 15, support := {3, 16} },
    { center := 16, support := {1, 15} },
    { center := 10, support := {1, 3, 15} }]

def duplicateCenterReverseChoices : List (RowChoice Label) :=
  [{ center := 13, support := {0, 1} },
    { center := 1, support := {0, 13} },
    { center := 0, support := {1, 15} },
    { center := 6, support := {1, 13, 15} }]

def duplicateCenterHits : List Hit :=
  [(3, 15), (3, 16), (15, 3), (15, 16),
    (16, 1), (16, 15), (10, 1), (10, 3), (10, 15)]

theorem duplicateCenterForwardCover :
    ∀ choice ∈ duplicateCenterForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ duplicateCenterHits := by
  native_decide

theorem duplicateCenterReverseCover :
    ∀ choice ∈ duplicateCenterReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ duplicateCenterHits := by
  native_decide

def duplicateCenterForwardData : DuplicateCenterData Label := {
  p := 1
  q := 3
  r := 15
  a := 16
  b := 10
  ap_aq := ⟨(16, 1),
    [.row 16 1 15, .flip 16 15, .row 15 16 3,
      .flip 15 3, .row 3 15 16, .flip 3 16],
    (16, 3)⟩
  ap_ar := ⟨(16, 1), [.row 16 1 15], (16, 15)⟩
  bp_bq := ⟨(10, 1), [.row 10 1 3], (10, 3)⟩
  bp_br := ⟨(10, 1), [.row 10 1 15], (10, 15)⟩ }

def duplicateCenterReverseData : DuplicateCenterData Label := {
  p := 15
  q := 13
  r := 1
  a := 0
  b := 6
  ap_aq := ⟨(0, 15),
    [.row 0 15 1, .flip 0 1, .row 1 0 13,
      .flip 1 13, .row 13 1 0, .flip 13 0],
    (0, 13)⟩
  ap_ar := ⟨(0, 15), [.row 0 15 1], (0, 1)⟩
  bp_bq := ⟨(6, 15), [.row 6 15 13], (6, 13)⟩
  bp_br := ⟨(6, 15), [.row 6 15 1], (6, 1)⟩ }

theorem duplicateCenterForwardData_check :
    duplicateCenterForwardData.check duplicateCenterForwardChoices = true := by
  native_decide

theorem duplicateCenterReverseData_check :
    duplicateCenterReverseData.check duplicateCenterReverseChoices = true := by
  native_decide

private theorem false_of_duplicateCenterHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits duplicateCenterHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · have hrows := positiveRowsMatch_of_same source source.model.order direction rfl hsame
      duplicateCenterHits duplicateCenterForwardChoices duplicateCenterForwardCover hall
    rcases nonempty_duplicateCenterCore_of_positiveCheck hrows duplicateCenterForwardData
      duplicateCenterForwardData_check with ⟨core⟩
    exact Census554.EqualityCore.not_realizes_of_duplicateCenterCore core
      ⟨source.boundary, hreal⟩
  · have hrows := positiveRowsMatch_of_ne source source.model.order direction rfl hsame
      duplicateCenterHits duplicateCenterReverseChoices duplicateCenterReverseCover hall
    rcases nonempty_duplicateCenterCore_of_positiveCheck hrows duplicateCenterReverseData
      duplicateCenterReverseData_check with ⟨core⟩
    exact Census554.EqualityCore.not_realizes_of_duplicateCenterCore core
      ⟨source.boundary, hreal⟩

theorem sourceAssign_duplicateCenterClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (priorOccurrenceClause duplicateCenterHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_duplicateCenterHits source order direction horder.symm hall

/- ## Complete five-family suffix and successor CNF -/

def twentyFourthOccurrenceHits : List (List Hit) :=
  [bisectorOneHits, bisectorTwoHits, convexFiveHits,
    cancellationHits, duplicateCenterHits]

def twentyFourthModelRefinementClauses : Std.Sat.CNF Atom :=
  twentyFourthOccurrenceHits.flatMap priorOccurrenceClauses

theorem twentyFourthModelRefinementClauses_length :
    twentyFourthModelRefinementClauses.length = 20 := by
  native_decide

theorem sourceAssign_twentyFourthModelRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ twentyFourthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [twentyFourthModelRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨hits, hhits, hclause⟩
  simp only [twentyFourthOccurrenceHits, List.mem_cons, List.not_mem_nil,
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
  · exact sourceAssign_duplicateCenterClause source order direction

def extendedTwentyFourthModelRefinementsCnf : Std.Sat.CNF Atom :=
  ATailBlockerVExactSeventeenTwentyThirdModelRefinements.extendedTwentyThirdModelRefinementsCnf ++
    twentyFourthModelRefinementClauses

theorem extendedTwentyFourthModelRefinementsCnf_length :
    extendedTwentyFourthModelRefinementsCnf.length = 5846252 := by
  native_decide

theorem sourceAssign_extendedTwentyFourthModelRefinementsCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedTwentyFourthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedTwentyFourthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h :=
      ATailBlockerVExactSeventeenTwentyThirdModelRefinements.sourceAssign_extendedTwentyThirdModelRefinementsCnf
        source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_twentyFourthModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedTwentyFourthModelRefinementsCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedTwentyFourthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedTwentyFourthModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedTwentyFourthModelRefinementsCnf

end ATailBlockerVExactSeventeenTwentyFourthModelRefinements
end Problem97

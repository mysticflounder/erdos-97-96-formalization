/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenTwentyFifthModelRefinements
import Erdos9796Proof.P97.Census554.FourPointTwoCircleBisectorOrderCore
import Erdos9796Proof.P97.Census554.ConvexFivePointCore
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericPerpBisectorNogoodCertificate

/-!
# Source-backed refinements from the twenty-sixth exact-seventeen SAT model

The authenticated model supplies one two-circle bisector orbit (reported in both
orientations), one convex-five obstruction, one two-Kalmanson cancellation, and
one perpendicular-bisector obstruction.  The perpendicular-bisector occurrence
strictly contains the bisector occurrence, so it is banked by subsumption but is
not redundantly appended.  The three nonredundant occurrences are proved
impossible for every source realization in both orientations before their
twelve order/orientation clauses are appended to the successor CNF.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenTwentySixthModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenTwentyFifthModelRefinements
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


/- ## Two-circle bisector occurrence -/

def bisectorForwardChoices : List (RowChoice Label) :=
  [{ center := 15, support := {11, 16} },
    { center := 13, support := {6, 16} },
    { center := 6, support := {11, 13} },
    { center := 11, support := {6, 13} }]

def bisectorReverseChoices : List (RowChoice Label) :=
  [{ center := 1, support := {0, 5} },
    { center := 3, support := {0, 10} },
    { center := 10, support := {3, 5} },
    { center := 5, support := {3, 10} }]

def bisectorHits : List Hit :=
  [(15, 11), (15, 16), (13, 6), (13, 16),
    (6, 11), (6, 13), (11, 6), (11, 13)]

theorem bisectorForwardCover :
    ∀ choice ∈ bisectorForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ bisectorHits := by
  native_decide

theorem bisectorReverseCover :
    ∀ choice ∈ bisectorReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ bisectorHits := by
  native_decide

private def bisectorForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorForwardChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 15
  v := 13
  u := 16
  y := 11
  huy := by decide
  qu_qy := EdgeClosure.row 15 16 11
    (hrows ({ center := 15, support := {11, 16} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 15, support := {11, 16} } : RowChoice Label)
      (by native_decide) (by native_decide))
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(16, 13), [.flip 16 13, .row 13 16 6, .flip 13 6,
      .row 6 13 11, .flip 6 11, .row 11 6 13], (11, 13)⟩
      (by native_decide) }

private def bisectorReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorReverseChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 1
  v := 3
  u := 0
  y := 5
  huy := by decide
  qu_qy := EdgeClosure.row 1 0 5
    (hrows ({ center := 1, support := {0, 5} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 1, support := {0, 5} } : RowChoice Label)
      (by native_decide) (by native_decide))
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(0, 3), [.flip 0 3, .row 3 0 10, .flip 3 10,
      .row 10 3 5, .flip 10 5, .row 5 10 3], (5, 3)⟩
      (by native_decide) }

private theorem false_of_bisectorForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (bisectorForwardCore hrows)
  · change 0 < signedArea2 (pointOf 16) (pointOf 15) (pointOf 13)
    rw [signedArea2_cycle, signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (13 : Label)) (j := (15 : Label)) (k := (16 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 11) (pointOf 15) (pointOf 13)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (11 : Label)) (j := (13 : Label)) (k := (15 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_bisectorReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorReverseChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (bisectorReverseCore hrows)
  · change signedArea2 (pointOf 0) (pointOf 1) (pointOf 3) < 0
    exact hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (1 : Label)) (k := (3 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 5) (pointOf 1) (pointOf 3) < 0
    rw [signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (3 : Label)) (k := (5 : Label))
      (by decide) (by decide)

private theorem false_of_bisectorHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits bisectorHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_bisectorForwardRows hreal source.boundary_ccw
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        bisectorHits bisectorForwardChoices bisectorForwardCover hall)
  · exact false_of_bisectorReverseRows hreal source.boundary_ccw
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        bisectorHits bisectorReverseChoices bisectorReverseCover hall)

theorem sourceAssign_bisectorClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (priorOccurrenceClause bisectorHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_bisectorHits source order direction horder.symm hall

/- ## Convex-five occurrence -/

def convexFiveForwardChoices : List (RowChoice Label) :=
  [{ center := 8, support := {6, 10} },
    { center := 4, support := {6, 10} },
    { center := 1, support := {4, 8, 10} }]

def convexFiveReverseChoices : List (RowChoice Label) :=
  [{ center := 8, support := {6, 10} },
    { center := 12, support := {6, 10} },
    { center := 15, support := {6, 8, 12} }]

def convexFiveHits : List Hit :=
  [(8, 6), (8, 10), (4, 6), (4, 10),
    (1, 4), (1, 8), (1, 10)]

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
  a := 6
  x := 8
  b := 10
  c := 1
  y := 4
  hab := by decide
  hxy := by decide
  xa_xb := EdgeClosure.row 8 6 10
    (hrows ({ center := 8, support := {6, 10} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 8, support := {6, 10} } : RowChoice Label)
      (by native_decide) (by native_decide))
  ya_yb := EdgeClosure.row 4 6 10
    (hrows ({ center := 4, support := {6, 10} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 4, support := {6, 10} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cx := EdgeClosure.row 1 10 8
    (hrows ({ center := 1, support := {4, 8, 10} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 1, support := {4, 8, 10} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cy := EdgeClosure.row 1 10 4
    (hrows ({ center := 1, support := {4, 8, 10} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 1, support := {4, 8, 10} } : RowChoice Label)
      (by native_decide) (by native_decide)) }

private def convexFiveReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P convexFiveReverseChoices) :
    Census554.ConvexFivePointCore.Core P := {
  a := 10
  x := 8
  b := 6
  c := 15
  y := 12
  hab := by decide
  hxy := by decide
  xa_xb := EdgeClosure.row 8 10 6
    (hrows ({ center := 8, support := {6, 10} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 8, support := {6, 10} } : RowChoice Label)
      (by native_decide) (by native_decide))
  ya_yb := EdgeClosure.row 12 10 6
    (hrows ({ center := 12, support := {6, 10} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 12, support := {6, 10} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cx := EdgeClosure.row 15 6 8
    (hrows ({ center := 15, support := {6, 8, 12} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 15, support := {6, 8, 12} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cy := EdgeClosure.row 15 6 12
    (hrows ({ center := 15, support := {6, 8, 12} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 15, support := {6, 8, 12} } : RowChoice Label)
      (by native_decide) (by native_decide)) }

private theorem false_of_convexFiveForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexFiveForwardChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core_of_neg hreal
    (convexFiveForwardCore hrows)
  · change signedArea2 (pointOf 6) (pointOf 8) (pointOf 10) < 0
    exact hneg_of_ccw hreal.injective hccw
      (i := (6 : Label)) (j := (8 : Label)) (k := (10 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 10) (pointOf 1) (pointOf 4) < 0
    rw [signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (4 : Label)) (k := (10 : Label))
      (by decide) (by decide)

private theorem false_of_convexFiveReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexFiveReverseChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core hreal
    (convexFiveReverseCore hrows)
  · change 0 < signedArea2 (pointOf 10) (pointOf 8) (pointOf 6)
    rw [signedArea2_cycle, signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (6 : Label)) (j := (8 : Label)) (k := (10 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 6) (pointOf 15) (pointOf 12)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (6 : Label)) (j := (12 : Label)) (k := (15 : Label))
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
  [{ center := 0, support := {2, 5} },
    { center := 14, support := {2, 4} },
    { center := 13, support := {4, 5} }]

def cancellationReverseChoices : List (RowChoice Label) :=
  [{ center := 16, support := {11, 14} },
    { center := 2, support := {12, 14} },
    { center := 3, support := {11, 12} }]

def cancellationHits : List Hit :=
  [(0, 2), (0, 5), (14, 2), (14, 4), (13, 4), (13, 5)]

theorem cancellationForwardCover :
    ∀ choice ∈ cancellationForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ cancellationHits := by
  native_decide

theorem cancellationReverseCover :
    ∀ choice ∈ cancellationReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ cancellationHits := by
  native_decide

def cancellationForwardData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨0, 2, 4, 14⟩
  firstForm := .adjacentSides
  secondQuad := ⟨0, 4, 5, 13⟩
  secondForm := .adjacentSides
  permutation := ⟨2, 1, 0, 3⟩
  path0 := ⟨(0, 2), [.row 0 2 5], (0, 5)⟩
  path1 := ⟨(4, 14), [.flip 4 14, .row 14 4 2, .flip 14 2], (2, 14)⟩
  path2 := ⟨(0, 4), [], (0, 4)⟩
  path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩ }

def cancellationReverseData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨2, 3, 11, 12⟩
  firstForm := .innerOuter
  secondQuad := ⟨2, 11, 14, 16⟩
  secondForm := .adjacentSides
  permutation := ⟨1, 2, 0, 3⟩
  path0 := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩
  path1 := ⟨(2, 12), [.row 2 12 14], (2, 14)⟩
  path2 := ⟨(2, 11), [], (2, 11)⟩
  path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 11, .flip 16 11],
    (11, 16)⟩ }

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

/- ## Subsumed perpendicular-bisector occurrence -/

def perpendicularBisectorHits : List Hit :=
  bisectorHits ++ [(5, 11), (5, 16)]

theorem sourceAssign_perpendicularBisectorClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (priorOccurrenceClause perpendicularBisectorHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  apply false_of_bisectorHits source order direction horder.symm
  intro hit hhit
  apply hall hit
  simp only [priorOrientedHits,
    ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits,
    List.mem_map] at hhit ⊢
  rcases hhit with ⟨baseHit, hbase, rfl⟩
  exact ⟨baseHit, by simp [perpendicularBisectorHits, hbase], rfl⟩

/- ## Complete three-family suffix and successor CNF -/

def twentySixthOccurrenceHits : List (List Hit) :=
  [bisectorHits, convexFiveHits, cancellationHits]

def twentySixthModelRefinementClauses : Std.Sat.CNF Atom :=
  twentySixthOccurrenceHits.flatMap priorOccurrenceClauses

theorem twentySixthModelRefinementClauses_length :
    twentySixthModelRefinementClauses.length = 12 := by
  native_decide

theorem sourceAssign_twentySixthModelRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ twentySixthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [twentySixthModelRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨hits, hhits, hclause⟩
  simp only [twentySixthOccurrenceHits, List.mem_cons, List.not_mem_nil,
    or_false] at hhits
  simp only [priorOccurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  rcases hhits with rfl | rfl | rfl
  · exact sourceAssign_bisectorClause source order direction
  · exact sourceAssign_convexFiveClause source order direction
  · exact sourceAssign_cancellationClause source order direction

def extendedTwentySixthModelRefinementsCnf : Std.Sat.CNF Atom :=
  ATailBlockerVExactSeventeenTwentyFifthModelRefinements.extendedTwentyFifthModelRefinementsCnf ++
    twentySixthModelRefinementClauses

theorem extendedTwentySixthModelRefinementsCnf_length :
    extendedTwentySixthModelRefinementsCnf.length = 5846284 := by
  native_decide

theorem sourceAssign_extendedTwentySixthModelRefinementsCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedTwentySixthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedTwentySixthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h :=
      ATailBlockerVExactSeventeenTwentyFifthModelRefinements.sourceAssign_extendedTwentyFifthModelRefinementsCnf
        source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_twentySixthModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedTwentySixthModelRefinementsCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedTwentySixthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedTwentySixthModelRefinementsCnf source⟩

#print axioms sourceAssign_bisectorClause
#print axioms sourceAssign_convexFiveClause
#print axioms sourceAssign_cancellationClause
#print axioms sourceAssign_perpendicularBisectorClause
#print axioms sourceAssign_extendedTwentySixthModelRefinementsCnf

end ATailBlockerVExactSeventeenTwentySixthModelRefinements
end Problem97

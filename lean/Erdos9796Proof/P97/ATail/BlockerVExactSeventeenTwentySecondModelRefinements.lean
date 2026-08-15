/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenTwentyFirstModelRefinements

/-!
# Source-backed refinements from the twenty-second exact-seventeen SAT model

The authenticated model supplies five nonredundant positive-hit supports: a
four-point two-circle bisector, a convex-five obstruction, cyclic schema L,
a two-Kalmanson cancellation, and a duplicate-center obstruction.  Each support
is proved impossible for every source realization in both orientations before
its four order/orientation clauses are appended to the successor CNF.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenTwentySecondModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenConvexFivePointFifthRows
open ATailBlockerVExactSeventeenTwentyFirstModelRefinements
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

private theorem signedArea2_swap13 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 c b a := by
  simp only [signedArea2]
  ring

private theorem signedArea2_cycle (a b c : ℝ²) :
    signedArea2 a b c = signedArea2 b c a := by
  simp only [signedArea2]
  ring

/- ## Four-point two-circle bisector occurrence -/

def bisectorForwardChoices : List (RowChoice Label) :=
  [{ center := 16, support := {5, 14} },
    { center := 14, support := {0, 9} },
    { center := 9, support := {0, 14} },
    { center := 0, support := {5, 9} }]

def bisectorReverseChoices : List (RowChoice Label) :=
  [{ center := 0, support := {2, 11} },
    { center := 2, support := {7, 16} },
    { center := 7, support := {2, 16} },
    { center := 16, support := {7, 11} }]

def bisectorHits : List Hit :=
  [(16, 14), (16, 5), (14, 9), (14, 0),
    (9, 14), (9, 0), (0, 9), (0, 5)]

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
  q := 16
  v := 0
  u := 14
  y := 5
  huy := by decide
  qu_qy := EdgeClosure.row 16 14 5
    (hrows ({ center := 16, support := {5, 14} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 16, support := {5, 14} } : RowChoice Label)
      (by native_decide) (by native_decide))
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(14, 0), [.row 14 0 9, .flip 14 9,
      .row 9 14 0, .flip 9 0,
      .row 0 9 5, .flip 0 5], (5, 0)⟩ (by native_decide) }

private def bisectorReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorReverseChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 0
  v := 16
  u := 2
  y := 11
  huy := by decide
  qu_qy := EdgeClosure.row 0 2 11
    (hrows ({ center := 0, support := {2, 11} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 0, support := {2, 11} } : RowChoice Label)
      (by native_decide) (by native_decide))
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(2, 16), [.row 2 16 7, .flip 2 7,
      .row 7 2 16, .flip 7 16,
      .row 16 7 11, .flip 16 11], (11, 16)⟩ (by native_decide) }

private theorem false_of_bisectorForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (bisectorForwardCore hrows)
  · change signedArea2 (pointOf 14) (pointOf 16) (pointOf 0) < 0
    rw [signedArea2_cycle, signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (14 : Label)) (k := (16 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 5) (pointOf 16) (pointOf 0) < 0
    rw [signedArea2_cycle, signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (5 : Label)) (k := (16 : Label))
      (by decide) (by decide)

private theorem false_of_bisectorReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorReverseChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (bisectorReverseCore hrows)
  · change 0 < signedArea2 (pointOf 2) (pointOf 0) (pointOf 16)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (2 : Label)) (k := (16 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 11) (pointOf 0) (pointOf 16)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (11 : Label)) (k := (16 : Label))
      (by decide) (by decide)
    linarith

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
  [{ center := 10, support := {1, 6} },
    { center := 2, support := {1, 6} },
    { center := 4, support := {2, 6, 10} }]

def convexFiveReverseChoices : List (RowChoice Label) :=
  [{ center := 6, support := {10, 15} },
    { center := 14, support := {10, 15} },
    { center := 12, support := {6, 10, 14} }]

def convexFiveHits : List Hit :=
  [(10, 1), (10, 6), (2, 1), (2, 6),
    (4, 6), (4, 10), (4, 2)]

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
  a := 1
  x := 10
  b := 6
  c := 4
  y := 2
  hab := by decide
  hxy := by decide
  xa_xb := EdgeClosure.row 10 1 6
    (hrows ({ center := 10, support := {1, 6} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 10, support := {1, 6} } : RowChoice Label)
      (by native_decide) (by native_decide))
  ya_yb := EdgeClosure.row 2 1 6
    (hrows ({ center := 2, support := {1, 6} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 2, support := {1, 6} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cx := EdgeClosure.row 4 6 10
    (hrows ({ center := 4, support := {2, 6, 10} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 4, support := {2, 6, 10} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cy := EdgeClosure.row 4 6 2
    (hrows ({ center := 4, support := {2, 6, 10} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 4, support := {2, 6, 10} } : RowChoice Label)
      (by native_decide) (by native_decide)) }

private def convexFiveReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P convexFiveReverseChoices) :
    Census554.ConvexFivePointCore.Core P := {
  a := 15
  x := 6
  b := 10
  c := 12
  y := 14
  hab := by decide
  hxy := by decide
  xa_xb := EdgeClosure.row 6 15 10
    (hrows ({ center := 6, support := {10, 15} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 6, support := {10, 15} } : RowChoice Label)
      (by native_decide) (by native_decide))
  ya_yb := EdgeClosure.row 14 15 10
    (hrows ({ center := 14, support := {10, 15} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 14, support := {10, 15} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cx := EdgeClosure.row 12 10 6
    (hrows ({ center := 12, support := {6, 10, 14} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 12, support := {6, 10, 14} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cy := EdgeClosure.row 12 10 14
    (hrows ({ center := 12, support := {6, 10, 14} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 12, support := {6, 10, 14} } : RowChoice Label)
      (by native_decide) (by native_decide)) }

private theorem false_of_convexFiveForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexFiveForwardChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core hreal
    (convexFiveForwardCore hrows)
  · change 0 < signedArea2 (pointOf 1) (pointOf 10) (pointOf 6)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (6 : Label)) (k := (10 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 6) (pointOf 4) (pointOf 2)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (4 : Label)) (k := (6 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_convexFiveReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexFiveReverseChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core_of_neg hreal
    (convexFiveReverseCore hrows)
  · change signedArea2 (pointOf 15) (pointOf 6) (pointOf 10) < 0
    rw [signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (6 : Label)) (j := (10 : Label)) (k := (15 : Label))
      (by decide) (by decide)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (10 : Label)) (j := (12 : Label)) (k := (14 : Label))
      (by decide) (by decide)

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

/- ## Cyclic schema-L occurrence -/

def kalmansonLForwardChoices : List (RowChoice Label) :=
  [{ center := 13, support := {1, 14} },
    { center := 0, support := {6, 15} },
    { center := 6, support := {1, 13, 15} },
    { center := 12, support := {6, 14} }]

def kalmansonLReverseChoices : List (RowChoice Label) :=
  [{ center := 3, support := {2, 15} },
    { center := 16, support := {1, 10} },
    { center := 10, support := {1, 3, 15} },
    { center := 4, support := {2, 10} }]

def kalmansonLHits : List Hit :=
  [(13, 1), (13, 14), (0, 6), (0, 15),
    (6, 1), (6, 13), (6, 15), (12, 6), (12, 14)]

theorem kalmansonLForwardCover :
    ∀ choice ∈ kalmansonLForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ kalmansonLHits := by
  native_decide

theorem kalmansonLReverseCover :
    ∀ choice ∈ kalmansonLReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ kalmansonLHits := by
  native_decide

private theorem false_of_kalmansonLForwardRows {A : Finset ℝ²}
    (source : SourceRealization A)
    (hrows : PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected) kalmansonLForwardChoices) : False := by
  let P := reindexRowPattern
    (sourceIndexEquiv source.model.order source.orientation)
    source.model.selected
  have hreal : Realizes P source.boundary := sourceRealizesBoundaryPattern source
  let shifted : Label → ℝ² := fun i => source.boundary (i + 14)
  apply CapCrossingKalmansonBridge.false_of_seven_ccw_five_shell_equalities_L_of_increasing
    source.carrier_convexIndep
    (injective_cyclicShift hreal.injective (14 : Label))
    (by simpa [shifted, source.boundary_image] using
      image_univ_cyclicShift source.boundary (14 : Label))
    (by simpa only [shifted] using
      isCcwConvexPolygon_cyclicShift hreal.injective source.boundary_ccw (14 : Label))
    (a := 0) (b := 1) (c := 3) (d := 4) (e := 9) (f := 15) (g := 16)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  · simpa [shifted] using hreal.equidist 13 1
      (hrows ({ center := 13, support := {1, 14} } : RowChoice Label)
        (by native_decide) (by native_decide)) 14
      (hrows ({ center := 13, support := {1, 14} } : RowChoice Label)
        (by native_decide) (by native_decide))
  · simpa [shifted] using hreal.equidist 0 6
      (hrows ({ center := 0, support := {6, 15} } : RowChoice Label)
        (by native_decide) (by native_decide)) 15
      (hrows ({ center := 0, support := {6, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
  · simpa [shifted] using hreal.equidist 6 13
      (hrows ({ center := 6, support := {1, 13, 15} } : RowChoice Label)
        (by native_decide) (by native_decide)) 15
      (hrows ({ center := 6, support := {1, 13, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
  · simpa [shifted] using hreal.equidist 6 13
      (hrows ({ center := 6, support := {1, 13, 15} } : RowChoice Label)
        (by native_decide) (by native_decide)) 1
      (hrows ({ center := 6, support := {1, 13, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
  · simpa [shifted] using hreal.equidist 12 6
      (hrows ({ center := 12, support := {6, 14} } : RowChoice Label)
        (by native_decide) (by native_decide)) 14
      (hrows ({ center := 12, support := {6, 14} } : RowChoice Label)
        (by native_decide) (by native_decide))

private theorem false_of_kalmansonLReverseRows {A : Finset ℝ²}
    (source : SourceRealization A)
    (hrows : PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected) kalmansonLReverseChoices) : False := by
  let P := reindexRowPattern
    (sourceIndexEquiv source.model.order source.orientation)
    source.model.selected
  have hreal : Realizes P source.boundary := sourceRealizesBoundaryPattern source
  let shifted : Label → ℝ² := fun i => source.boundary (i + 3)
  apply CapCrossingKalmansonBridge.false_of_seven_ccw_five_shell_equalities_L_of_decreasing
    source.carrier_convexIndep
    (injective_cyclicShift hreal.injective (3 : Label))
    (by simpa [shifted, source.boundary_image] using
      image_univ_cyclicShift source.boundary (3 : Label))
    (by simpa only [shifted] using
      isCcwConvexPolygon_cyclicShift hreal.injective source.boundary_ccw (3 : Label))
    (a := 16) (b := 15) (c := 13) (d := 12) (e := 7) (f := 1) (g := 0)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  · simpa [shifted] using hreal.equidist 3 15
      (hrows ({ center := 3, support := {2, 15} } : RowChoice Label)
        (by native_decide) (by native_decide)) 2
      (hrows ({ center := 3, support := {2, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
  · simpa [shifted] using hreal.equidist 16 10
      (hrows ({ center := 16, support := {1, 10} } : RowChoice Label)
        (by native_decide) (by native_decide)) 1
      (hrows ({ center := 16, support := {1, 10} } : RowChoice Label)
        (by native_decide) (by native_decide))
  · simpa [shifted] using hreal.equidist 10 3
      (hrows ({ center := 10, support := {1, 3, 15} } : RowChoice Label)
        (by native_decide) (by native_decide)) 1
      (hrows ({ center := 10, support := {1, 3, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
  · simpa [shifted] using hreal.equidist 10 3
      (hrows ({ center := 10, support := {1, 3, 15} } : RowChoice Label)
        (by native_decide) (by native_decide)) 15
      (hrows ({ center := 10, support := {1, 3, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
  · simpa [shifted] using hreal.equidist 4 10
      (hrows ({ center := 4, support := {2, 10} } : RowChoice Label)
        (by native_decide) (by native_decide)) 2
      (hrows ({ center := 4, support := {2, 10} } : RowChoice Label)
        (by native_decide) (by native_decide))

private theorem false_of_kalmansonLHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits kalmansonLHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  by_cases hsame : source.orientation = direction
  · exact false_of_kalmansonLForwardRows source
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        kalmansonLHits kalmansonLForwardChoices kalmansonLForwardCover hall)
  · exact false_of_kalmansonLReverseRows source
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        kalmansonLHits kalmansonLReverseChoices kalmansonLReverseCover hall)

theorem sourceAssign_kalmansonLClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (priorOccurrenceClause kalmansonLHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_kalmansonLHits source order direction horder.symm hall

/- ## Two-Kalmanson cancellation occurrence -/

def cancellationForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {2, 6} },
    { center := 7, support := {2, 3} },
    { center := 15, support := {3, 6} }]

def cancellationReverseChoices : List (RowChoice Label) :=
  [{ center := 16, support := {10, 14} },
    { center := 9, support := {13, 14} },
    { center := 1, support := {10, 13} }]

def cancellationHits : List Hit :=
  [(0, 2), (0, 6), (7, 2), (7, 3), (15, 3), (15, 6)]

theorem cancellationForwardCover :
    ∀ choice ∈ cancellationForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ cancellationHits := by
  native_decide

theorem cancellationReverseCover :
    ∀ choice ∈ cancellationReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ cancellationHits := by
  native_decide

def cancellationForwardData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨0, 2, 3, 7⟩
  firstForm := .adjacentSides
  secondQuad := ⟨0, 3, 6, 15⟩
  secondForm := .adjacentSides
  permutation := ⟨2, 1, 0, 3⟩
  path0 := ⟨(0, 2), [.row 0 2 6], (0, 6)⟩
  path1 := ⟨(3, 7), [.flip 3 7, .row 7 3 2, .flip 7 2], (2, 7)⟩
  path2 := ⟨(0, 3), [], (0, 3)⟩
  path3 := ⟨(6, 15), [.flip 6 15, .row 15 6 3, .flip 15 3], (3, 15)⟩ }

def cancellationReverseData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨9, 13, 14, 16⟩
  firstForm := .adjacentSides
  secondQuad := ⟨1, 10, 13, 16⟩
  secondForm := .adjacentSides
  permutation := ⟨0, 3, 2, 1⟩
  path0 := ⟨(9, 13), [.row 9 13 14], (9, 14)⟩
  path1 := ⟨(14, 16), [.flip 14 16, .row 16 14 10, .flip 16 10], (10, 16)⟩
  path2 := ⟨(1, 10), [.row 1 10 13], (1, 13)⟩
  path3 := ⟨(13, 16), [], (13, 16)⟩ }

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

/- ## Duplicate-center occurrence -/

def duplicateCenterForwardChoices : List (RowChoice Label) :=
  [{ center := 11, support := {5, 15} },
    { center := 13, support := {4, 5, 16} },
    { center := 3, support := {4, 15, 16} },
    { center := 5, support := {3, 11} },
    { center := 15, support := {3, 11} }]

def duplicateCenterReverseChoices : List (RowChoice Label) :=
  [{ center := 5, support := {1, 11} },
    { center := 3, support := {0, 11, 12} },
    { center := 13, support := {0, 1, 12} },
    { center := 11, support := {5, 13} },
    { center := 1, support := {5, 13} }]

def duplicateCenterHits : List Hit :=
  [(11, 15), (11, 5), (13, 16), (13, 5), (13, 4),
    (3, 16), (3, 15), (3, 4), (5, 11), (5, 3),
    (15, 11), (15, 3)]

theorem duplicateCenterForwardCover :
    ∀ choice ∈ duplicateCenterForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ duplicateCenterHits := by
  native_decide

theorem duplicateCenterReverseCover :
    ∀ choice ∈ duplicateCenterReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ duplicateCenterHits := by
  native_decide

def duplicateCenterForwardData : DuplicateCenterData Label := {
  p := 16
  q := 5
  r := 4
  a := 13
  b := 3
  ap_aq := ⟨(13, 16), [.row 13 16 5], (13, 5)⟩
  ap_ar := ⟨(13, 16), [.row 13 16 4], (13, 4)⟩
  bp_bq := ⟨(3, 16),
    [.row 3 16 15, .flip 3 15, .row 15 3 11, .flip 15 11,
      .row 11 15 5, .flip 11 5, .row 5 11 3, .flip 5 3],
    (3, 5)⟩
  bp_br := ⟨(3, 16), [.row 3 16 4], (3, 4)⟩ }

def duplicateCenterReverseData : DuplicateCenterData Label := {
  p := 0
  q := 11
  r := 12
  a := 3
  b := 13
  ap_aq := ⟨(3, 0), [.row 3 0 11], (3, 11)⟩
  ap_ar := ⟨(3, 0), [.row 3 0 12], (3, 12)⟩
  bp_bq := ⟨(13, 0),
    [.row 13 0 1, .flip 13 1, .row 1 13 5, .flip 1 5,
      .row 5 1 11, .flip 5 11, .row 11 5 13, .flip 11 13],
    (13, 11)⟩
  bp_br := ⟨(13, 0), [.row 13 0 12], (13, 12)⟩ }

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

def twentySecondOccurrenceHits : List (List Hit) :=
  [bisectorHits, convexFiveHits, kalmansonLHits,
    cancellationHits, duplicateCenterHits]

def twentySecondModelRefinementClauses : Std.Sat.CNF Atom :=
  twentySecondOccurrenceHits.flatMap priorOccurrenceClauses

theorem twentySecondModelRefinementClauses_length :
    twentySecondModelRefinementClauses.length = 20 := by
  native_decide

theorem sourceAssign_twentySecondModelRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ twentySecondModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [twentySecondModelRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨hits, hhits, hclause⟩
  simp only [twentySecondOccurrenceHits, List.mem_cons, List.not_mem_nil,
    or_false] at hhits
  simp only [priorOccurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  rcases hhits with rfl | rfl | rfl | rfl | rfl
  · exact sourceAssign_bisectorClause source order direction
  · exact sourceAssign_convexFiveClause source order direction
  · exact sourceAssign_kalmansonLClause source order direction
  · exact sourceAssign_cancellationClause source order direction
  · exact sourceAssign_duplicateCenterClause source order direction

def extendedTwentySecondModelRefinementsCnf : Std.Sat.CNF Atom :=
  ATailBlockerVExactSeventeenTwentyFirstModelRefinements.extendedTwentyFirstModelRefinementsCnf ++
    twentySecondModelRefinementClauses

theorem extendedTwentySecondModelRefinementsCnf_length :
    extendedTwentySecondModelRefinementsCnf.length = 5846228 := by
  native_decide

theorem sourceAssign_extendedTwentySecondModelRefinementsCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedTwentySecondModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedTwentySecondModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h :=
      ATailBlockerVExactSeventeenTwentyFirstModelRefinements.sourceAssign_extendedTwentyFirstModelRefinementsCnf
        source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_twentySecondModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedTwentySecondModelRefinementsCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedTwentySecondModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedTwentySecondModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedTwentySecondModelRefinementsCnf

end ATailBlockerVExactSeventeenTwentySecondModelRefinements
end Problem97

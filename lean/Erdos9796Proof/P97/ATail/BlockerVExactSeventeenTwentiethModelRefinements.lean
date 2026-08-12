/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenNineteenthModelRefinements
import Erdos9796Proof.P97.Census554.FourPointTwoCircleBisectorOrderCore
import Erdos9796Proof.P97.Census554.ConvexFivePointCore

/-!
# Source-backed refinements from the twentieth exact-seventeen SAT model

This file banks the three nonredundant positive-hit occurrence families in
the authenticated twentieth child: one bisector family (with two orientation
certificates), one convex-five family, and one two-Kalmanson cancellation.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenTwentiethModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenConvexFivePointFifthRows
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

/- ## Common positive-hit bisector family -/

def bisectorForwardChoices : List (RowChoice Label) :=
  [{ center := 16, support := {12, 13} },
    { center := 12, support := {0, 16} },
    { center := 0, support := {8, 12} },
    { center := 8, support := {0, 13} },
    { center := 10, support := {8, 16} }]

def bisectorReverseChoices : List (RowChoice Label) :=
  [{ center := 6, support := {0, 8} },
    { center := 8, support := {3, 16} },
    { center := 16, support := {4, 8} },
    { center := 4, support := {0, 16} },
    { center := 0, support := {3, 4} }]

def bisectorHits : List Hit :=
  [(16, 12), (16, 13), (12, 16), (12, 0), (0, 12), (0, 8),
    (8, 0), (8, 13), (10, 8), (10, 16)]

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
  q := 13
  v := 10
  u := 16
  y := 8
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(13, 16), [.flip 13 16, .row 16 13 12, .flip 16 12,
      .row 12 16 0, .flip 12 0, .row 0 12 8, .flip 0 8,
      .row 8 0 13, .flip 8 13], (13, 8)⟩ (by native_decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(16, 10), [.flip 16 10, .row 10 16 8, .flip 10 8], (8, 10)⟩
      (by native_decide) }

private def bisectorReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorReverseChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 3
  v := 6
  u := 8
  y := 0
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(3, 8), [.flip 3 8, .row 8 3 16, .flip 8 16,
      .row 16 8 4, .flip 16 4, .row 4 16 0, .flip 4 0,
      .row 0 4 3, .flip 0 3], (3, 0)⟩ (by native_decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(8, 6), [.flip 8 6, .row 6 8 0, .flip 6 0], (0, 6)⟩
      (by native_decide) }

private theorem false_of_bisectorForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (bisectorForwardCore hrows)
  · change 0 < signedArea2 (pointOf 16) (pointOf 13) (pointOf 10)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (10 : Label)) (j := (13 : Label)) (k := (16 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 8) (pointOf 13) (pointOf 10)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (8 : Label)) (j := (10 : Label)) (k := (13 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_bisectorReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorReverseChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (bisectorReverseCore hrows)
  · change signedArea2 (pointOf 8) (pointOf 3) (pointOf 6) < 0
    rw [signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (3 : Label)) (j := (6 : Label)) (k := (8 : Label))
      (by decide) (by decide)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (3 : Label)) (k := (6 : Label))
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
  [{ center := 9, support := {1, 7} },
    { center := 5, support := {1, 7} },
    { center := 6, support := {5, 7, 9} }]

def convexFiveReverseChoices : List (RowChoice Label) :=
  [{ center := 7, support := {9, 15} },
    { center := 11, support := {9, 15} },
    { center := 10, support := {7, 9, 11} }]

def convexFiveHits : List Hit :=
  [(9, 1), (9, 7), (5, 1), (5, 7), (6, 7), (6, 5), (6, 9)]

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
  x := 9
  b := 7
  c := 6
  y := 5
  hab := by decide
  hxy := by decide
  xa_xb := EdgeClosure.row 9 1 7
    (hrows ({ center := 9, support := {1, 7} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 9, support := {1, 7} } : RowChoice Label)
      (by native_decide) (by native_decide))
  ya_yb := EdgeClosure.row 5 1 7
    (hrows ({ center := 5, support := {1, 7} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 5, support := {1, 7} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cx := EdgeClosure.row 6 7 9
    (hrows ({ center := 6, support := {5, 7, 9} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 6, support := {5, 7, 9} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cy := EdgeClosure.row 6 7 5
    (hrows ({ center := 6, support := {5, 7, 9} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 6, support := {5, 7, 9} } : RowChoice Label)
      (by native_decide) (by native_decide)) }

private def convexFiveReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P convexFiveReverseChoices) :
    Census554.ConvexFivePointCore.Core P := {
  a := 15
  x := 7
  b := 9
  c := 10
  y := 11
  hab := by decide
  hxy := by decide
  xa_xb := EdgeClosure.row 7 15 9
    (hrows ({ center := 7, support := {9, 15} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 7, support := {9, 15} } : RowChoice Label)
      (by native_decide) (by native_decide))
  ya_yb := EdgeClosure.row 11 15 9
    (hrows ({ center := 11, support := {9, 15} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 11, support := {9, 15} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cx := EdgeClosure.row 10 9 7
    (hrows ({ center := 10, support := {7, 9, 11} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 10, support := {7, 9, 11} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cy := EdgeClosure.row 10 9 11
    (hrows ({ center := 10, support := {7, 9, 11} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 10, support := {7, 9, 11} } : RowChoice Label)
      (by native_decide) (by native_decide)) }

private theorem false_of_convexFiveForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexFiveForwardChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core hreal
    (convexFiveForwardCore hrows)
  · change 0 < signedArea2 (pointOf 1) (pointOf 9) (pointOf 7)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (7 : Label)) (k := (9 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 7) (pointOf 6) (pointOf 5)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (5 : Label)) (j := (6 : Label)) (k := (7 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_convexFiveReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexFiveReverseChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core_of_neg hreal
    (convexFiveReverseCore hrows)
  · change signedArea2 (pointOf 15) (pointOf 7) (pointOf 9) < 0
    rw [signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (7 : Label)) (j := (9 : Label)) (k := (15 : Label))
      (by decide) (by decide)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (9 : Label)) (j := (10 : Label)) (k := (11 : Label))
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

/- ## Two-Kalmanson cancellation occurrence -/

def cancellationForwardChoices : List (RowChoice Label) :=
  [{ center := 2, support := {5, 11} },
    { center := 0, support := {8, 11} },
    { center := 15, support := {5, 8} }]

def cancellationReverseChoices : List (RowChoice Label) :=
  [{ center := 14, support := {5, 11} },
    { center := 16, support := {5, 8} },
    { center := 1, support := {8, 11} }]

def cancellationHits : List Hit :=
  [(2, 5), (2, 11), (0, 11), (0, 8), (15, 5), (15, 8)]

theorem cancellationForwardCover :
    ∀ choice ∈ cancellationForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ cancellationHits := by
  native_decide

theorem cancellationReverseCover :
    ∀ choice ∈ cancellationReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ cancellationHits := by
  native_decide

def cancellationForwardData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨0, 2, 5, 11⟩
  firstForm := .innerOuter
  secondQuad := ⟨0, 5, 8, 15⟩
  secondForm := .adjacentSides
  permutation := ⟨1, 2, 0, 3⟩
  path0 := ⟨(2, 5), [.row 2 5 11], (2, 11)⟩
  path1 := ⟨(0, 11), [.row 0 11 8], (0, 8)⟩
  path2 := ⟨(0, 5), [], (0, 5)⟩
  path3 := ⟨(8, 15), [.flip 8 15, .row 15 8 5, .flip 15 5], (5, 15)⟩ }

def cancellationReverseData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨5, 11, 14, 16⟩
  firstForm := .innerOuter
  secondQuad := ⟨1, 8, 11, 16⟩
  secondForm := .adjacentSides
  permutation := ⟨0, 3, 2, 1⟩
  path0 := ⟨(11, 14), [.flip 11 14, .row 14 11 5, .flip 14 5], (5, 14)⟩
  path1 := ⟨(5, 16), [.flip 5 16, .row 16 5 8, .flip 16 8], (8, 16)⟩
  path2 := ⟨(1, 8), [.row 1 8 11], (1, 11)⟩
  path3 := ⟨(11, 16), [], (11, 16)⟩ }

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

/- ## Complete suffix and successor CNF -/

def twentiethOccurrenceHits : List (List Hit) :=
  [bisectorHits, convexFiveHits, cancellationHits]

def twentiethModelRefinementClauses : Std.Sat.CNF Atom :=
  twentiethOccurrenceHits.flatMap priorOccurrenceClauses

theorem twentiethModelRefinementClauses_length :
    twentiethModelRefinementClauses.length = 12 := by
  native_decide

theorem sourceAssign_twentiethModelRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ twentiethModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [twentiethModelRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨hits, hhits, hclause⟩
  simp only [twentiethOccurrenceHits, List.mem_cons, List.not_mem_nil,
    or_false] at hhits
  simp only [priorOccurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  rcases hhits with rfl | rfl | rfl
  · exact sourceAssign_bisectorClause source order direction
  · exact sourceAssign_convexFiveClause source order direction
  · exact sourceAssign_cancellationClause source order direction

def extendedTwentiethModelRefinementsCnf : Std.Sat.CNF Atom :=
  ATailBlockerVExactSeventeenNineteenthModelRefinements.extendedNineteenthModelRefinementsCnf ++
    twentiethModelRefinementClauses

theorem extendedTwentiethModelRefinementsCnf_length :
    extendedTwentiethModelRefinementsCnf.length = 5846200 := by
  native_decide

theorem sourceAssign_extendedTwentiethModelRefinementsCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedTwentiethModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedTwentiethModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h :=
      ATailBlockerVExactSeventeenNineteenthModelRefinements.sourceAssign_extendedNineteenthModelRefinementsCnf
        source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_twentiethModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedTwentiethModelRefinementsCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedTwentiethModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedTwentiethModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedTwentiethModelRefinementsCnf

end ATailBlockerVExactSeventeenTwentiethModelRefinements
end Problem97

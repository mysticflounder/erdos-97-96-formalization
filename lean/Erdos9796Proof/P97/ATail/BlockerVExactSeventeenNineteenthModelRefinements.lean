/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenEighteenthModelRefinements
import Erdos9796Proof.P97.Census554.FiveRowCircleIntersectionOrderCore
import Erdos9796Proof.P97.Census554.FourPointTwoCircleBisectorOrderCore
import Erdos9796Proof.P97.Census554.ConvexFivePointCore

/-!
# Source-backed refinements from the nineteenth exact-seventeen SAT model

This file banks the six nonredundant theorem-bank occurrences found in the
authenticated nineteenth child: a five-row circle-order obstruction, two
two-circle bisector obstructions, a convex-five obstruction, a two-Kalmanson
cancellation, and a duplicate-center obstruction.  Each clause uses only the
positive selected-row memberships traversed by its proof certificate.

The additional perpendicular-bisector occurrence from the same model is not
emitted: its positive-hit set strictly contains the duplicate-center hit set,
so its occurrence clauses are subsumed by the duplicate-center clauses.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenNineteenthModelRefinements

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
        source.model.selected)
      choices := by
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
        source.model.selected)
      choices := by
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

/- ## Five-row circle-intersection order occurrence -/

def fiveRowForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {11, 12, 14} },
    { center := 12, support := {0, 6, 15, 16} },
    { center := 6, support := {14, 16} },
    { center := 15, support := {1, 6, 12} },
    { center := 16, support := {1, 11, 15} }]

def fiveRowReverseChoices : List (RowChoice Label) :=
  [{ center := 16, support := {2, 4, 5} },
    { center := 4, support := {0, 1, 10, 16} },
    { center := 10, support := {0, 2} },
    { center := 1, support := {4, 10, 15} },
    { center := 0, support := {1, 5, 15} }]

def fiveRowHits : List Hit :=
  [(0, 11), (0, 12), (0, 14), (12, 0), (12, 6),
    (12, 15), (12, 16), (6, 14), (6, 16), (15, 1),
    (15, 6), (15, 12), (16, 1), (16, 11), (16, 15)]

theorem fiveRowForwardCover :
    ∀ choice ∈ fiveRowForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ fiveRowHits := by
  native_decide

theorem fiveRowReverseCover :
    ∀ choice ∈ fiveRowReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ fiveRowHits := by
  native_decide

private def fiveRowForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P fiveRowForwardChoices) :
    Census554.FiveRowCircleIntersectionOrderCore.Core P := {
  O := 12
  A := 15
  C := 6
  D := 16
  E := 0
  X5 := 11
  X6 := 1
  X9 := 14
  hOA := by decide
  OA_OC := edgeClosure_of_checkPath_positive hrows
    ⟨(12, 15), [.row 12 15 6], (12, 6)⟩ (by native_decide)
  OA_OD := edgeClosure_of_checkPath_positive hrows
    ⟨(12, 15), [.row 12 15 16], (12, 16)⟩ (by native_decide)
  OA_OE := edgeClosure_of_checkPath_positive hrows
    ⟨(12, 15), [.row 12 15 0], (12, 0)⟩ (by native_decide)
  OA_AC := edgeClosure_of_checkPath_positive hrows
    ⟨(12, 15), [.flip 12 15, .row 15 12 6], (15, 6)⟩ (by native_decide)
  DA_DX5 := edgeClosure_of_checkPath_positive hrows
    ⟨(16, 15), [.row 16 15 11], (16, 11)⟩ (by native_decide)
  OA_EX5 := edgeClosure_of_checkPath_positive hrows
    ⟨(12, 15), [.row 12 15 0, .flip 12 0, .row 0 12 11], (0, 11)⟩
      (by native_decide)
  OA_AX6 := edgeClosure_of_checkPath_positive hrows
    ⟨(12, 15), [.flip 12 15, .row 15 12 1], (15, 1)⟩ (by native_decide)
  DA_DX6 := edgeClosure_of_checkPath_positive hrows
    ⟨(16, 15), [.row 16 15 1], (16, 1)⟩ (by native_decide)
  CD_CX9 := edgeClosure_of_checkPath_positive hrows
    ⟨(6, 16), [.row 6 16 14], (6, 14)⟩ (by native_decide)
  OA_EX9 := edgeClosure_of_checkPath_positive hrows
    ⟨(12, 15), [.row 12 15 0, .flip 12 0, .row 0 12 14], (0, 14)⟩
      (by native_decide) }

private def fiveRowReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P fiveRowReverseChoices) :
    Census554.FiveRowCircleIntersectionOrderCore.Core P := {
  O := 4
  A := 1
  C := 10
  D := 0
  E := 16
  X5 := 5
  X6 := 15
  X9 := 2
  hOA := by decide
  OA_OC := edgeClosure_of_checkPath_positive hrows
    ⟨(4, 1), [.row 4 1 10], (4, 10)⟩ (by native_decide)
  OA_OD := edgeClosure_of_checkPath_positive hrows
    ⟨(4, 1), [.row 4 1 0], (4, 0)⟩ (by native_decide)
  OA_OE := edgeClosure_of_checkPath_positive hrows
    ⟨(4, 1), [.row 4 1 16], (4, 16)⟩ (by native_decide)
  OA_AC := edgeClosure_of_checkPath_positive hrows
    ⟨(4, 1), [.flip 4 1, .row 1 4 10], (1, 10)⟩ (by native_decide)
  DA_DX5 := edgeClosure_of_checkPath_positive hrows
    ⟨(0, 1), [.row 0 1 5], (0, 5)⟩ (by native_decide)
  OA_EX5 := edgeClosure_of_checkPath_positive hrows
    ⟨(4, 1), [.row 4 1 16, .flip 4 16, .row 16 4 5], (16, 5)⟩
      (by native_decide)
  OA_AX6 := edgeClosure_of_checkPath_positive hrows
    ⟨(4, 1), [.flip 4 1, .row 1 4 15], (1, 15)⟩ (by native_decide)
  DA_DX6 := edgeClosure_of_checkPath_positive hrows
    ⟨(0, 1), [.row 0 1 15], (0, 15)⟩ (by native_decide)
  CD_CX9 := edgeClosure_of_checkPath_positive hrows
    ⟨(10, 0), [.row 10 0 2], (10, 2)⟩ (by native_decide)
  OA_EX9 := edgeClosure_of_checkPath_positive hrows
    ⟨(4, 1), [.row 4 1 16, .flip 4 16, .row 16 4 2], (16, 2)⟩
      (by native_decide) }

private theorem false_of_fiveRowForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P fiveRowForwardChoices) : False := by
  apply Census554.FiveRowCircleIntersectionOrderCore.false_of_core_of_neg hreal
    (fiveRowForwardCore hrows)
  · change signedArea2 (pointOf 12) (pointOf 15) (pointOf 6) < 0
    rw [signedArea2_cycle, signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (6 : Label)) (j := (12 : Label)) (k := (15 : Label))
      (by decide) (by decide)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (12 : Label)) (j := (15 : Label)) (k := (16 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 12) (pointOf 15) (pointOf 0) < 0
    rw [signedArea2_cycle, signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (12 : Label)) (k := (15 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 12) (pointOf 16) (pointOf 0) < 0
    rw [signedArea2_cycle, signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (12 : Label)) (k := (16 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 12) (pointOf 16) (pointOf 6) < 0
    rw [signedArea2_cycle, signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (6 : Label)) (j := (12 : Label)) (k := (16 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 12) (pointOf 0) (pointOf 6) < 0
    rw [signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (6 : Label)) (k := (12 : Label))
      (by decide) (by decide)

private theorem false_of_fiveRowReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P fiveRowReverseChoices) : False := by
  apply Census554.FiveRowCircleIntersectionOrderCore.false_of_core hreal
    (fiveRowReverseCore hrows)
  · change 0 < signedArea2 (pointOf 4) (pointOf 1) (pointOf 10)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (4 : Label)) (k := (10 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 4) (pointOf 1) (pointOf 0)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (1 : Label)) (k := (4 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 4) (pointOf 1) (pointOf 16)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (4 : Label)) (k := (16 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 4) (pointOf 0) (pointOf 16)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (4 : Label)) (k := (16 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 4) (pointOf 0) (pointOf 10)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (4 : Label)) (k := (10 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 4) (pointOf 16) (pointOf 10)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (4 : Label)) (j := (10 : Label)) (k := (16 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_fiveRowHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits fiveRowHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_fiveRowForwardRows hreal source.boundary_ccw
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        fiveRowHits fiveRowForwardChoices fiveRowForwardCover hall)
  · exact false_of_fiveRowReverseRows hreal source.boundary_ccw
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        fiveRowHits fiveRowReverseChoices fiveRowReverseCover hall)

theorem sourceAssign_fiveRowClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (priorOccurrenceClause fiveRowHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_fiveRowHits source order direction horder.symm hall

/- ## Two distinct four-point/two-circle bisector occurrences -/

def bisectorOneForwardChoices : List (RowChoice Label) :=
  [{ center := 7, support := {3, 10} },
    { center := 3, support := {7, 13} },
    { center := 13, support := {3, 7} },
    { center := 6, support := {10, 13} }]

def bisectorOneReverseChoices : List (RowChoice Label) :=
  [{ center := 9, support := {6, 13} },
    { center := 13, support := {3, 9} },
    { center := 3, support := {9, 13} },
    { center := 10, support := {3, 6} }]

def bisectorOneHits : List Hit :=
  [(3, 7), (3, 13), (13, 3), (13, 7),
    (7, 3), (7, 10), (6, 10), (6, 13)]

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
  q := 7
  v := 6
  u := 10
  y := 13
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(7, 10), [.row 7 10 3, .flip 7 3, .row 3 7 13, .flip 3 13,
      .row 13 3 7, .flip 13 7], (7, 13)⟩ (by native_decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(10, 6), [.flip 10 6, .row 6 10 13, .flip 6 13], (13, 6)⟩
      (by native_decide) }

private def bisectorOneReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorOneReverseChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 9
  v := 10
  u := 6
  y := 3
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(9, 6), [.row 9 6 13, .flip 9 13, .row 13 9 3, .flip 13 3,
      .row 3 13 9, .flip 3 9], (9, 3)⟩ (by native_decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(6, 10), [.flip 6 10, .row 10 6 3, .flip 10 3], (3, 10)⟩
      (by native_decide) }

private theorem false_of_bisectorOneForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorOneForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (bisectorOneForwardCore hrows)
  · change 0 < signedArea2 (pointOf 10) (pointOf 7) (pointOf 6)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (6 : Label)) (j := (7 : Label)) (k := (10 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 13) (pointOf 7) (pointOf 6)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (6 : Label)) (j := (7 : Label)) (k := (13 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_bisectorOneReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorOneReverseChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (bisectorOneReverseCore hrows)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (6 : Label)) (j := (9 : Label)) (k := (10 : Label))
      (by decide) (by decide)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (3 : Label)) (j := (9 : Label)) (k := (10 : Label))
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

def bisectorTwoForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {8, 12, 14} },
    { center := 14, support := {0, 1} },
    { center := 12, support := {0, 15} },
    { center := 1, support := {8, 15} },
    { center := 15, support := {1, 12} }]

def bisectorTwoReverseChoices : List (RowChoice Label) :=
  [{ center := 16, support := {2, 4, 8} },
    { center := 2, support := {15, 16} },
    { center := 4, support := {1, 16} },
    { center := 15, support := {1, 8} },
    { center := 1, support := {4, 15} }]

def bisectorTwoHits : List Hit :=
  [(0, 14), (0, 8), (0, 12), (14, 0), (14, 1),
    (12, 0), (12, 15), (1, 8), (1, 15), (15, 1), (15, 12)]

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
  q := 1
  v := 0
  u := 8
  y := 14
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(1, 8), [.row 1 8 15, .flip 1 15, .row 15 1 12, .flip 15 12,
      .row 12 15 0, .flip 12 0, .row 0 12 14, .flip 0 14,
      .row 14 0 1, .flip 14 1], (1, 14)⟩ (by native_decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(8, 0), [.flip 8 0, .row 0 8 14, .flip 0 14], (14, 0)⟩
      (by native_decide) }

private def bisectorTwoReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorTwoReverseChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 15
  v := 16
  u := 8
  y := 2
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(15, 8), [.row 15 8 1, .flip 15 1, .row 1 15 4, .flip 1 4,
      .row 4 1 16, .flip 4 16, .row 16 4 2, .flip 16 2,
      .row 2 16 15, .flip 2 15], (15, 2)⟩ (by native_decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(8, 16), [.flip 8 16, .row 16 8 2, .flip 16 2], (2, 16)⟩
      (by native_decide) }

private theorem false_of_bisectorTwoForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorTwoForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (bisectorTwoForwardCore hrows)
  · change 0 < signedArea2 (pointOf 8) (pointOf 1) (pointOf 0)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (1 : Label)) (k := (8 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 14) (pointOf 1) (pointOf 0)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (1 : Label)) (k := (14 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_bisectorTwoReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorTwoReverseChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (bisectorTwoReverseCore hrows)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (8 : Label)) (j := (15 : Label)) (k := (16 : Label))
      (by decide) (by decide)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (15 : Label)) (k := (16 : Label))
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
  [{ center := 16, support := {3, 11} },
    { center := 10, support := {3, 11} },
    { center := 7, support := {3, 10, 16} }]

def convexFiveReverseChoices : List (RowChoice Label) :=
  [{ center := 0, support := {5, 13} },
    { center := 6, support := {5, 13} },
    { center := 9, support := {0, 6, 13} }]

def convexFiveHits : List Hit :=
  [(7, 3), (7, 10), (7, 16), (16, 3),
    (16, 11), (10, 3), (10, 11)]

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
  x := 16
  b := 3
  c := 7
  y := 10
  hab := by decide
  hxy := by decide
  xa_xb := EdgeClosure.row 16 11 3
    (hrows ({ center := 16, support := {3, 11} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 16, support := {3, 11} } : RowChoice Label)
      (by native_decide) (by native_decide))
  ya_yb := EdgeClosure.row 10 11 3
    (hrows ({ center := 10, support := {3, 11} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 10, support := {3, 11} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cx := EdgeClosure.row 7 3 16
    (hrows ({ center := 7, support := {3, 10, 16} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 7, support := {3, 10, 16} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cy := EdgeClosure.row 7 3 10
    (hrows ({ center := 7, support := {3, 10, 16} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 7, support := {3, 10, 16} } : RowChoice Label)
      (by native_decide) (by native_decide)) }

private def convexFiveReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P convexFiveReverseChoices) :
    Census554.ConvexFivePointCore.Core P := {
  a := 5
  x := 0
  b := 13
  c := 9
  y := 6
  hab := by decide
  hxy := by decide
  xa_xb := EdgeClosure.row 0 5 13
    (hrows ({ center := 0, support := {5, 13} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 0, support := {5, 13} } : RowChoice Label)
      (by native_decide) (by native_decide))
  ya_yb := EdgeClosure.row 6 5 13
    (hrows ({ center := 6, support := {5, 13} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 6, support := {5, 13} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cx := EdgeClosure.row 9 13 0
    (hrows ({ center := 9, support := {0, 6, 13} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 9, support := {0, 6, 13} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cy := EdgeClosure.row 9 13 6
    (hrows ({ center := 9, support := {0, 6, 13} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 9, support := {0, 6, 13} } : RowChoice Label)
      (by native_decide) (by native_decide)) }

private theorem false_of_convexFiveForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexFiveForwardChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core_of_neg hreal
    (convexFiveForwardCore hrows)
  · change signedArea2 (pointOf 11) (pointOf 16) (pointOf 3) < 0
    rw [signedArea2_cycle, signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (3 : Label)) (j := (11 : Label)) (k := (16 : Label))
      (by decide) (by decide)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (3 : Label)) (j := (7 : Label)) (k := (10 : Label))
      (by decide) (by decide)

private theorem false_of_convexFiveReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexFiveReverseChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core hreal
    (convexFiveReverseCore hrows)
  · change 0 < signedArea2 (pointOf 5) (pointOf 0) (pointOf 13)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (5 : Label)) (k := (13 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 13) (pointOf 9) (pointOf 6)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (6 : Label)) (j := (9 : Label)) (k := (13 : Label))
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
  [{ center := 1, support := {8, 15} },
    { center := 15, support := {1, 12} },
    { center := 12, support := {0, 15} },
    { center := 0, support := {8, 12} },
    { center := 14, support := {0, 1} }]

def cancellationReverseChoices : List (RowChoice Label) :=
  [{ center := 15, support := {1, 8} },
    { center := 1, support := {4, 15} },
    { center := 4, support := {1, 16} },
    { center := 16, support := {4, 8} },
    { center := 2, support := {15, 16} }]

def cancellationHits : List Hit :=
  [(1, 8), (1, 15), (15, 1), (15, 12), (12, 15),
    (12, 0), (0, 12), (0, 8), (14, 0), (14, 1)]

theorem cancellationForwardCover :
    ∀ choice ∈ cancellationForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ cancellationHits := by
  native_decide

theorem cancellationReverseCover :
    ∀ choice ∈ cancellationReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ cancellationHits := by
  native_decide

def cancellationForwardData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨0, 1, 8, 9⟩
  firstForm := .innerOuter
  secondQuad := ⟨0, 1, 9, 14⟩
  secondForm := .innerOuter
  permutation := ⟨0, 2, 1, 3⟩
  path0 := ⟨(1, 8),
    [.row 1 8 15, .flip 1 15, .row 15 1 12, .flip 15 12,
      .row 12 15 0, .flip 12 0, .row 0 12 8], (0, 8)⟩
  path1 := ⟨(0, 9), [], (0, 9)⟩
  path2 := ⟨(1, 9), [], (1, 9)⟩
  path3 := ⟨(0, 14), [.flip 0 14, .row 14 0 1, .flip 14 1], (1, 14)⟩ }

def cancellationReverseData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨7, 8, 15, 16⟩
  firstForm := .innerOuter
  secondQuad := ⟨2, 7, 15, 16⟩
  secondForm := .innerOuter
  permutation := ⟨1, 3, 0, 2⟩
  path0 := ⟨(8, 15),
    [.flip 8 15, .row 15 8 1, .flip 15 1, .row 1 15 4,
      .flip 1 4, .row 4 1 16, .flip 4 16, .row 16 4 8, .flip 16 8],
    (8, 16)⟩
  path1 := ⟨(7, 16), [], (7, 16)⟩
  path2 := ⟨(7, 15), [], (7, 15)⟩
  path3 := ⟨(2, 16), [.row 2 16 15], (2, 15)⟩ }

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
  [{ center := 0, support := {8, 12} },
    { center := 14, support := {0, 1, 13} },
    { center := 8, support := {0, 13} },
    { center := 12, support := {0, 15} },
    { center := 1, support := {8, 15} },
    { center := 15, support := {1, 12} }]

def duplicateCenterReverseChoices : List (RowChoice Label) :=
  [{ center := 16, support := {4, 8} },
    { center := 2, support := {3, 15, 16} },
    { center := 8, support := {3, 16} },
    { center := 4, support := {1, 16} },
    { center := 15, support := {1, 8} },
    { center := 1, support := {4, 15} }]

def duplicateCenterHits : List Hit :=
  [(0, 8), (0, 12), (14, 0), (14, 1), (14, 13),
    (8, 0), (8, 13), (12, 0), (12, 15), (1, 8),
    (1, 15), (15, 1), (15, 12)]

theorem duplicateCenterForwardCover :
    ∀ choice ∈ duplicateCenterForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ duplicateCenterHits := by
  native_decide

theorem duplicateCenterReverseCover :
    ∀ choice ∈ duplicateCenterReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ duplicateCenterHits := by
  native_decide

def duplicateCenterForwardData : DuplicateCenterData Label := {
  p := 0
  q := 13
  r := 1
  a := 14
  b := 8
  ap_aq := ⟨(14, 0), [.row 14 0 13], (14, 13)⟩
  ap_ar := ⟨(14, 0), [.row 14 0 1], (14, 1)⟩
  bp_bq := ⟨(8, 0), [.row 8 0 13], (8, 13)⟩
  bp_br := ⟨(8, 0),
    [.flip 8 0, .row 0 8 12, .flip 0 12, .row 12 0 15,
      .flip 12 15, .row 15 12 1, .flip 15 1, .row 1 15 8, .flip 1 8],
    (8, 1)⟩ }

def duplicateCenterReverseData : DuplicateCenterData Label := {
  p := 16
  q := 3
  r := 15
  a := 2
  b := 8
  ap_aq := ⟨(2, 16), [.row 2 16 3], (2, 3)⟩
  ap_ar := ⟨(2, 16), [.row 2 16 15], (2, 15)⟩
  bp_bq := ⟨(8, 16), [.row 8 16 3], (8, 3)⟩
  bp_br := ⟨(8, 16),
    [.flip 8 16, .row 16 8 4, .flip 16 4, .row 4 16 1,
      .flip 4 1, .row 1 4 15, .flip 1 15, .row 15 1 8, .flip 15 8],
    (8, 15)⟩ }

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

/- ## Complete six-family suffix and successor CNF -/

def nineteenthOccurrenceHits : List (List Hit) :=
  [fiveRowHits, bisectorOneHits, bisectorTwoHits,
    convexFiveHits, cancellationHits, duplicateCenterHits]

def nineteenthModelRefinementClauses : Std.Sat.CNF Atom :=
  nineteenthOccurrenceHits.flatMap priorOccurrenceClauses

theorem nineteenthModelRefinementClauses_length :
    nineteenthModelRefinementClauses.length = 24 := by
  native_decide

theorem sourceAssign_nineteenthModelRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ nineteenthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [nineteenthModelRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨hits, hhits, hclause⟩
  simp only [nineteenthOccurrenceHits, List.mem_cons, List.not_mem_nil,
    or_false] at hhits
  simp only [priorOccurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  rcases hhits with rfl | rfl | rfl | rfl | rfl | rfl
  · exact sourceAssign_fiveRowClause source order direction
  · exact sourceAssign_bisectorOneClause source order direction
  · exact sourceAssign_bisectorTwoClause source order direction
  · exact sourceAssign_convexFiveClause source order direction
  · exact sourceAssign_cancellationClause source order direction
  · exact sourceAssign_duplicateCenterClause source order direction

def extendedNineteenthModelRefinementsCnf : Std.Sat.CNF Atom :=
  ATailBlockerVExactSeventeenEighteenthModelRefinements.extendedEighteenthModelRefinementsCnf ++
    nineteenthModelRefinementClauses

theorem extendedNineteenthModelRefinementsCnf_length :
    extendedNineteenthModelRefinementsCnf.length = 5846188 := by
  native_decide

theorem sourceAssign_extendedNineteenthModelRefinementsCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedNineteenthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedNineteenthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h :=
      ATailBlockerVExactSeventeenEighteenthModelRefinements.sourceAssign_extendedEighteenthModelRefinementsCnf
        source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_nineteenthModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedNineteenthModelRefinementsCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedNineteenthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedNineteenthModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedNineteenthModelRefinementsCnf

end ATailBlockerVExactSeventeenNineteenthModelRefinements
end Problem97

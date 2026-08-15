/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSixteenthModelRefinements

/-!
# Source-backed refinements from the seventeenth exact-seventeen SAT model

The authenticated seventeenth Lean-owned child is satisfiable. Its mandatory
theorem-bank scan found five exact occurrences. The forward/reverse bisector
pair is one incidence orbit, leaving four distinct occurrence orbits in all.

This file records those four orbits and proves every emitted clause for every
`SourceRealization`. Only positive selected-row incidences traversed by the
metric certificates are used.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSeventeenthModelRefinements

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

private theorem signedArea2_swap13 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 c b a := by
  simp only [signedArea2]
  ring

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

/-! ## Four-point/two-circle bisector occurrence -/

def bisectorForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {11, 12} },
    { center := 11, support := {0, 4} },
    { center := 12, support := {0, 15} },
    { center := 15, support := {4, 12} },
    { center := 16, support := {11, 15} }]

def bisectorReverseChoices : List (RowChoice Label) :=
  [{ center := 16, support := {4, 5} },
    { center := 5, support := {12, 16} },
    { center := 4, support := {1, 16} },
    { center := 1, support := {4, 12} },
    { center := 0, support := {1, 5} }]

def bisectorHits : List Hit :=
  [(0, 11), (0, 12), (11, 0), (11, 4), (12, 0),
    (12, 15), (15, 4), (15, 12), (16, 11), (16, 15)]

private theorem bisectorForwardCover :
    ∀ choice ∈ bisectorForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ bisectorHits := by
  native_decide

private theorem bisectorReverseCover :
    ∀ choice ∈ bisectorReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ bisectorHits := by
  native_decide

private def bisectorForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorForwardChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := by
  have h0 : ∀ point ∈ ({11, 12} : Finset Label), point ∈ P 0 :=
    hrows ({ center := 0, support := {11, 12} } : RowChoice Label) (by native_decide)
  have h11 : ∀ point ∈ ({0, 4} : Finset Label), point ∈ P 11 :=
    hrows ({ center := 11, support := {0, 4} } : RowChoice Label) (by native_decide)
  have h12 : ∀ point ∈ ({0, 15} : Finset Label), point ∈ P 12 :=
    hrows ({ center := 12, support := {0, 15} } : RowChoice Label) (by native_decide)
  have h15 : ∀ point ∈ ({4, 12} : Finset Label), point ∈ P 15 :=
    hrows ({ center := 15, support := {4, 12} } : RowChoice Label) (by native_decide)
  have h16 : ∀ point ∈ ({11, 15} : Finset Label), point ∈ P 16 :=
    hrows ({ center := 16, support := {11, 15} } : RowChoice Label) (by native_decide)
  exact {
    q := 4
    v := 16
    u := 11
    y := 15
    huy := by decide
    qu_qy := EdgeClosure.trans (EdgeClosure.flip 4 11)
      (EdgeClosure.trans (EdgeClosure.row 11 4 0
        (h11 4 (by native_decide)) (h11 0 (by native_decide)))
      (EdgeClosure.trans (EdgeClosure.flip 11 0)
      (EdgeClosure.trans (EdgeClosure.row 0 11 12
        (h0 11 (by native_decide)) (h0 12 (by native_decide)))
      (EdgeClosure.trans (EdgeClosure.flip 0 12)
      (EdgeClosure.trans (EdgeClosure.row 12 0 15
        (h12 0 (by native_decide)) (h12 15 (by native_decide)))
      (EdgeClosure.trans (EdgeClosure.flip 12 15)
      (EdgeClosure.trans (EdgeClosure.row 15 12 4
        (h15 12 (by native_decide)) (h15 4 (by native_decide)))
        (EdgeClosure.flip 15 4))))))))
    uv_yv := EdgeClosure.trans (EdgeClosure.flip 11 16)
      (EdgeClosure.trans (EdgeClosure.row 16 11 15
        (h16 11 (by native_decide)) (h16 15 (by native_decide)))
        (EdgeClosure.flip 16 15)) }

private def bisectorReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorReverseChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := by
  have h16 : ∀ point ∈ ({4, 5} : Finset Label), point ∈ P 16 :=
    hrows ({ center := 16, support := {4, 5} } : RowChoice Label) (by native_decide)
  have h5 : ∀ point ∈ ({12, 16} : Finset Label), point ∈ P 5 :=
    hrows ({ center := 5, support := {12, 16} } : RowChoice Label) (by native_decide)
  have h4 : ∀ point ∈ ({1, 16} : Finset Label), point ∈ P 4 :=
    hrows ({ center := 4, support := {1, 16} } : RowChoice Label) (by native_decide)
  have h1 : ∀ point ∈ ({4, 12} : Finset Label), point ∈ P 1 :=
    hrows ({ center := 1, support := {4, 12} } : RowChoice Label) (by native_decide)
  have h0 : ∀ point ∈ ({1, 5} : Finset Label), point ∈ P 0 :=
    hrows ({ center := 0, support := {1, 5} } : RowChoice Label) (by native_decide)
  exact {
    q := 12
    v := 0
    u := 5
    y := 1
    huy := by decide
    qu_qy := EdgeClosure.trans (EdgeClosure.flip 12 5)
      (EdgeClosure.trans (EdgeClosure.row 5 12 16
        (h5 12 (by native_decide)) (h5 16 (by native_decide)))
      (EdgeClosure.trans (EdgeClosure.flip 5 16)
      (EdgeClosure.trans (EdgeClosure.row 16 5 4
        (h16 5 (by native_decide)) (h16 4 (by native_decide)))
      (EdgeClosure.trans (EdgeClosure.flip 16 4)
      (EdgeClosure.trans (EdgeClosure.row 4 16 1
        (h4 16 (by native_decide)) (h4 1 (by native_decide)))
      (EdgeClosure.trans (EdgeClosure.flip 4 1)
      (EdgeClosure.trans (EdgeClosure.row 1 4 12
        (h1 4 (by native_decide)) (h1 12 (by native_decide)))
        (EdgeClosure.flip 1 12))))))))
    uv_yv := EdgeClosure.trans (EdgeClosure.flip 5 0)
      (EdgeClosure.trans (EdgeClosure.row 0 5 1
        (h0 5 (by native_decide)) (h0 1 (by native_decide)))
        (EdgeClosure.flip 0 1)) }

private theorem false_of_bisectorForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (bisectorForwardCore hrows)
  · change 0 < signedArea2 (pointOf 11) (pointOf 4) (pointOf 16)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (4 : Label)) (j := (11 : Label)) (k := (16 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 15) (pointOf 4) (pointOf 16)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (4 : Label)) (j := (15 : Label)) (k := (16 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_bisectorReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorReverseChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (bisectorReverseCore hrows)
  · change signedArea2 (pointOf 5) (pointOf 12) (pointOf 0) < 0
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (5 : Label)) (k := (12 : Label))
      (by decide) (by decide)
    calc
      signedArea2 (pointOf 5) (pointOf 12) (pointOf 0) =
          signedArea2 (pointOf 0) (pointOf 5) (pointOf 12) := by
            rw [signedArea2_cycle, signedArea2_cycle]
      _ < 0 := hneg
  · change signedArea2 (pointOf 1) (pointOf 12) (pointOf 0) < 0
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (1 : Label)) (k := (12 : Label))
      (by decide) (by decide)
    calc
      signedArea2 (pointOf 1) (pointOf 12) (pointOf 0) =
          signedArea2 (pointOf 0) (pointOf 1) (pointOf 12) := by
            rw [signedArea2_cycle, signedArea2_cycle]
      _ < 0 := hneg

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

/-! ## Convex-five-point occurrences -/

def convexOneForwardChoices : List (RowChoice Label) :=
  [{ center := 10, support := {1, 7} },
    { center := 5, support := {1, 7} },
    { center := 6, support := {5, 7, 10} }]

def convexOneReverseChoices : List (RowChoice Label) :=
  [{ center := 6, support := {9, 15} },
    { center := 11, support := {9, 15} },
    { center := 10, support := {6, 9, 11} }]

def convexOneHits : List Hit :=
  [(10, 1), (10, 7), (5, 1), (5, 7),
    (6, 5), (6, 7), (6, 10)]

def convexTwoForwardChoices : List (RowChoice Label) :=
  [{ center := 10, support := {1, 7} },
    { center := 5, support := {1, 7} },
    { center := 2, support := {1, 5, 10} }]

def convexTwoReverseChoices : List (RowChoice Label) :=
  [{ center := 6, support := {9, 15} },
    { center := 11, support := {9, 15} },
    { center := 14, support := {6, 11, 15} }]

def convexTwoHits : List Hit :=
  [(10, 1), (10, 7), (5, 1), (5, 7),
    (2, 1), (2, 5), (2, 10)]

private theorem convexOneForwardCover :
    ∀ choice ∈ convexOneForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ convexOneHits := by native_decide

private theorem convexOneReverseCover :
    ∀ choice ∈ convexOneReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ convexOneHits := by native_decide

private theorem convexTwoForwardCover :
    ∀ choice ∈ convexTwoForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ convexTwoHits := by native_decide

private theorem convexTwoReverseCover :
    ∀ choice ∈ convexTwoReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ convexTwoHits := by native_decide

private def convexOneForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P convexOneForwardChoices) :
    Census554.ConvexFivePointCore.Core P :=
  { a := 1, x := 10, b := 7, c := 6, y := 5
    hab := by decide
    hxy := by decide
    xa_xb := EdgeClosure.row 10 1 7
      (hrows ({ center := 10, support := {1, 7} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 10, support := {1, 7} } : RowChoice Label)
        (by native_decide) (by native_decide))
    ya_yb := EdgeClosure.row 5 1 7
      (hrows ({ center := 5, support := {1, 7} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 5, support := {1, 7} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cx := EdgeClosure.row 6 7 10
      (hrows ({ center := 6, support := {5, 7, 10} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 6, support := {5, 7, 10} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cy := EdgeClosure.row 6 7 5
      (hrows ({ center := 6, support := {5, 7, 10} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 6, support := {5, 7, 10} } : RowChoice Label)
        (by native_decide) (by native_decide)) }

private def convexTwoForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P convexTwoForwardChoices) :
    Census554.ConvexFivePointCore.Core P :=
  { a := 7, x := 10, b := 1, c := 2, y := 5
    hab := by decide
    hxy := by decide
    xa_xb := EdgeClosure.row 10 7 1
      (hrows ({ center := 10, support := {1, 7} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 10, support := {1, 7} } : RowChoice Label)
        (by native_decide) (by native_decide))
    ya_yb := EdgeClosure.row 5 7 1
      (hrows ({ center := 5, support := {1, 7} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 5, support := {1, 7} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cx := EdgeClosure.row 2 1 10
      (hrows ({ center := 2, support := {1, 5, 10} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 2, support := {1, 5, 10} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cy := EdgeClosure.row 2 1 5
      (hrows ({ center := 2, support := {1, 5, 10} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 2, support := {1, 5, 10} } : RowChoice Label)
        (by native_decide) (by native_decide)) }

private def convexOneReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P convexOneReverseChoices) :
    Census554.ConvexFivePointCore.Core P :=
  { a := 15, x := 6, b := 9, c := 10, y := 11
    hab := by decide
    hxy := by decide
    xa_xb := EdgeClosure.row 6 15 9
      (hrows ({ center := 6, support := {9, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 6, support := {9, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
    ya_yb := EdgeClosure.row 11 15 9
      (hrows ({ center := 11, support := {9, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 11, support := {9, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cx := EdgeClosure.row 10 9 6
      (hrows ({ center := 10, support := {6, 9, 11} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 10, support := {6, 9, 11} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cy := EdgeClosure.row 10 9 11
      (hrows ({ center := 10, support := {6, 9, 11} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 10, support := {6, 9, 11} } : RowChoice Label)
        (by native_decide) (by native_decide)) }

private def convexTwoReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P convexTwoReverseChoices) :
    Census554.ConvexFivePointCore.Core P :=
  { a := 9, x := 6, b := 15, c := 14, y := 11
    hab := by decide
    hxy := by decide
    xa_xb := EdgeClosure.row 6 9 15
      (hrows ({ center := 6, support := {9, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 6, support := {9, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
    ya_yb := EdgeClosure.row 11 9 15
      (hrows ({ center := 11, support := {9, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 11, support := {9, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cx := EdgeClosure.row 14 15 6
      (hrows ({ center := 14, support := {6, 11, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 14, support := {6, 11, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cy := EdgeClosure.row 14 15 11
      (hrows ({ center := 14, support := {6, 11, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 14, support := {6, 11, 15} } : RowChoice Label)
        (by native_decide) (by native_decide)) }

private theorem false_of_convexOneForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexOneForwardChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core hreal
    (convexOneForwardCore hrows)
  · change 0 < signedArea2 (pointOf 1) (pointOf 10) (pointOf 7)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (7 : Label)) (k := (10 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 7) (pointOf 6) (pointOf 5)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (5 : Label)) (j := (6 : Label)) (k := (7 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_convexOneReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexOneReverseChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core_of_neg hreal
    (convexOneReverseCore hrows)
  · change signedArea2 (pointOf 15) (pointOf 6) (pointOf 9) < 0
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (6 : Label)) (j := (9 : Label)) (k := (15 : Label))
      (by decide) (by decide)
    calc
      signedArea2 (pointOf 15) (pointOf 6) (pointOf 9) =
          signedArea2 (pointOf 6) (pointOf 9) (pointOf 15) := by
            rw [signedArea2_cycle, signedArea2_cycle]
      _ < 0 := hneg
  · exact hneg_of_ccw hreal.injective hccw
      (i := (9 : Label)) (j := (10 : Label)) (k := (11 : Label))
      (by decide) (by decide)

private theorem false_of_convexTwoForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexTwoForwardChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core_of_neg hreal
    (convexTwoForwardCore hrows)
  · change signedArea2 (pointOf 7) (pointOf 10) (pointOf 1) < 0
    rw [signedArea2_cycle, signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (7 : Label)) (k := (10 : Label))
      (by decide) (by decide)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (2 : Label)) (k := (5 : Label))
      (by decide) (by decide)

private theorem false_of_convexTwoReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexTwoReverseChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core hreal
    (convexTwoReverseCore hrows)
  · change 0 < signedArea2 (pointOf 9) (pointOf 6) (pointOf 15)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (6 : Label)) (j := (9 : Label)) (k := (15 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 15) (pointOf 14) (pointOf 11)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (11 : Label)) (j := (14 : Label)) (k := (15 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_convexOneHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits convexOneHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_convexOneForwardRows hreal source.boundary_ccw
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        convexOneHits convexOneForwardChoices convexOneForwardCover hall)
  · exact false_of_convexOneReverseRows hreal source.boundary_ccw
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        convexOneHits convexOneReverseChoices convexOneReverseCover hall)

private theorem false_of_convexTwoHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits convexTwoHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_convexTwoForwardRows hreal source.boundary_ccw
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        convexTwoHits convexTwoForwardChoices convexTwoForwardCover hall)
  · exact false_of_convexTwoReverseRows hreal source.boundary_ccw
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        convexTwoHits convexTwoReverseChoices convexTwoReverseCover hall)

/-! ## Generic two-Kalmanson cancellation occurrence -/

def cancellationForwardChoices : List (RowChoice Label) :=
  [{ center := 3, support := {2, 13} },
    { center := 12, support := {0, 2} },
    { center := 8, support := {0, 13} }]

def cancellationReverseChoices : List (RowChoice Label) :=
  [{ center := 13, support := {3, 14} },
    { center := 4, support := {14, 16} },
    { center := 8, support := {3, 16} }]

def cancellationHits : List Hit :=
  [(3, 2), (3, 13), (12, 0), (12, 2), (8, 0), (8, 13)]

theorem cancellationForwardCover :
    ∀ choice ∈ cancellationForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ cancellationHits := by native_decide

theorem cancellationReverseCover :
    ∀ choice ∈ cancellationReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ cancellationHits := by native_decide

def cancellationForwardData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨0, 2, 3, 12⟩
  firstForm := .innerOuter
  secondQuad := ⟨0, 3, 8, 13⟩
  secondForm := .adjacentSides
  permutation := ⟨3, 1, 0, 2⟩
  path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 13], (3, 13)⟩
  path1 := ⟨(0, 12), [.flip 0 12, .row 12 0 2, .flip 12 2], (2, 12)⟩
  path2 := ⟨(0, 3), [], (0, 3)⟩
  path3 := ⟨(8, 13), [.row 8 13 0, .flip 8 0], (0, 8)⟩ }

def cancellationReverseData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨4, 13, 14, 16⟩
  firstForm := .innerOuter
  secondQuad := ⟨3, 8, 13, 16⟩
  secondForm := .adjacentSides
  permutation := ⟨2, 0, 3, 1⟩
  path0 := ⟨(13, 14), [.row 13 14 3, .flip 13 3], (3, 13)⟩
  path1 := ⟨(4, 16), [.row 4 16 14], (4, 14)⟩
  path2 := ⟨(3, 8), [.flip 3 8, .row 8 3 16], (8, 16)⟩
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

/-! ## Lean-owned clause suffix and SourceRealization ingress -/

def occurrenceClause (baseHits : List Hit) (order : NamedOrder)
    (direction : Orientation) : Std.Sat.CNF.Clause Atom :=
  nogoodClause order (priorOrientedHits baseHits order direction)

def occurrenceClauses (baseHits : List Hit) : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.map fun direction => occurrenceClause baseHits order direction

private theorem sourceAssign_occurrenceClauses {A : Finset ℝ²}
    (source : SourceRealization A) (baseHits : List Hit)
    (hvalid : ∀ order direction,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model)
        (occurrenceClause baseHits order direction) = true) :
    ∀ clause ∈ occurrenceClauses baseHits,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [occurrenceClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact hvalid order direction

theorem sourceAssign_bisectorClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (occurrenceClause bisectorHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_bisectorHits source order direction horder.symm hall

theorem sourceAssign_convexOneClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (occurrenceClause convexOneHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_convexOneHits source order direction horder.symm hall

theorem sourceAssign_convexTwoClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (occurrenceClause convexTwoHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_convexTwoHits source order direction horder.symm hall

theorem sourceAssign_cancellationClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (occurrenceClause cancellationHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_cancellationHits source order direction horder.symm hall

def seventeenthModelRefinementClauses : Std.Sat.CNF Atom :=
  occurrenceClauses bisectorHits ++
  occurrenceClauses convexOneHits ++
  occurrenceClauses convexTwoHits ++
  occurrenceClauses cancellationHits

theorem seventeenthModelRefinementClauses_length :
    seventeenthModelRefinementClauses.length = 16 := by
  native_decide

theorem sourceAssign_seventeenthModelRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ seventeenthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  change clause ∈
    occurrenceClauses bisectorHits ++
    occurrenceClauses convexOneHits ++
    occurrenceClauses convexTwoHits ++
    occurrenceClauses cancellationHits at hclause
  rcases List.mem_append.mp hclause with hleft | hcancellation
  · rcases List.mem_append.mp hleft with hleft | hconvexTwo
    · rcases List.mem_append.mp hleft with hbisector | hconvexOne
      · exact sourceAssign_occurrenceClauses source bisectorHits
          (sourceAssign_bisectorClause source) clause hbisector
      · exact sourceAssign_occurrenceClauses source convexOneHits
          (sourceAssign_convexOneClause source) clause hconvexOne
    · exact sourceAssign_occurrenceClauses source convexTwoHits
        (sourceAssign_convexTwoClause source) clause hconvexTwo
  · exact sourceAssign_occurrenceClauses source cancellationHits
      (sourceAssign_cancellationClause source) clause hcancellation

def extendedSeventeenthModelRefinementsCnf : Std.Sat.CNF Atom :=
  ATailBlockerVExactSeventeenSixteenthModelRefinements.extendedSixteenthModelRefinementsCnf ++
    seventeenthModelRefinementClauses

theorem extendedSeventeenthModelRefinementsCnf_length :
    extendedSeventeenthModelRefinementsCnf.length = 5846160 := by
  native_decide

theorem sourceAssign_extendedSeventeenthModelRefinementsCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedSeventeenthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedSeventeenthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h :=
      ATailBlockerVExactSeventeenSixteenthModelRefinements.sourceAssign_extendedSixteenthModelRefinementsCnf
        source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_seventeenthModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedSeventeenthModelRefinementsCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedSeventeenthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedSeventeenthModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedSeventeenthModelRefinementsCnf

end ATailBlockerVExactSeventeenSeventeenthModelRefinements
end Problem97

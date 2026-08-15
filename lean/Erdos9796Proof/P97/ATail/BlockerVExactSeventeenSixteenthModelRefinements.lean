/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenConvexFivePointFifthRows
import Erdos9796Proof.P97.ATail.KalmansonFourEqualitySchemas
import Erdos9796Proof.P97.Census554.FourPointTwoCircleBisectorOrderCore
import Erdos9796Proof.P97.Census554.FivePointCollision

/-!
# Source-backed refinements from the sixteenth exact-seventeen SAT model

The authenticated sixteenth Lean-owned child is satisfiable.  Its mandatory
theorem-bank scan found eight exact occurrences, all instances of existing
cardinality-independent geometric consumers.  This file records the complete
two-order, two-orientation orbit of every occurrence and proves that every new
clause is valid for every `SourceRealization`.

Only the positive selected-row incidences traversed by the checked equality
closures are serialized.  No negative row information from the SAT model is
used.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSixteenthModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenConvexFivePointFifthRows
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

/-- Transport one positional hit list into a named source order and orientation. -/
def orientedHits (baseHits : List Hit) (order : NamedOrder)
    (direction : Orientation) : List Hit :=
  baseHits.map fun hit =>
    (orientedLabelAtPosition order direction hit.1,
      orientedLabelAtPosition order direction hit.2)

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

/-- Generic same-orientation transport from serialized positive hits to a
`PositiveRowsMatch` witness on geometric boundary positions. -/
private theorem positiveRowsMatch_of_same {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hsame : source.orientation = direction)
    (baseHits : List Hit) (choices : List (RowChoice Label))
    (hcover : ∀ choice ∈ choices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ baseHits)
    (hall : ∀ hit ∈ orientedHits baseHits order direction,
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
      simp only [orientedHits, List.mem_map]
      exact ⟨(choice.center, point),
        hcover choice hchoice point hpoint, rfl⟩)

/-- Reflected companion of `positiveRowsMatch_of_same`. -/
private theorem positiveRowsMatch_of_ne {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hne : source.orientation ≠ direction)
    (baseHits : List Hit) (choices : List (RowChoice Label))
    (hcover : ∀ choice ∈ choices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ baseHits)
    (hall : ∀ hit ∈ orientedHits baseHits order direction,
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
      simp only [orientedHits, List.mem_map]
      exact ⟨(Fin.rev choice.center, Fin.rev point),
        hcover choice hchoice point hpoint, rfl⟩)

private theorem signedArea2_swap13 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 c b a := by
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

/-! ## First four-point/two-circle occurrence -/

def bisectorOneForwardChoices : List (RowChoice Label) :=
  [{ center := 6, support := {7, 15} },
    { center := 15, support := {1, 6} },
    { center := 1, support := {6, 15} },
    { center := 5, support := {1, 7} }]

def bisectorOneReverseChoices : List (RowChoice Label) :=
  [{ center := 10, support := {1, 9} },
    { center := 1, support := {10, 15} },
    { center := 15, support := {1, 10} },
    { center := 11, support := {9, 15} }]

def bisectorOneHits : List Hit :=
  [(1, 6), (1, 15), (5, 1), (5, 7),
    (6, 7), (6, 15), (15, 1), (15, 6)]

private theorem bisectorOneForwardCover (choice : RowChoice Label)
    (hchoice : choice ∈ bisectorOneForwardChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (choice.center, point) ∈ bisectorOneHits := by
  native_decide +revert

private theorem bisectorOneReverseCover (choice : RowChoice Label)
    (hchoice : choice ∈ bisectorOneReverseChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (Fin.rev choice.center, Fin.rev point) ∈ bisectorOneHits := by
  native_decide +revert

private def bisectorOneForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorOneForwardChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := by
  have h6 : ∀ point ∈ ({7, 15} : Finset Label), point ∈ P 6 :=
    hrows ({ center := 6, support := {7, 15} } : RowChoice Label) (by native_decide)
  have h15 : ∀ point ∈ ({1, 6} : Finset Label), point ∈ P 15 :=
    hrows ({ center := 15, support := {1, 6} } : RowChoice Label) (by native_decide)
  have h1 : ∀ point ∈ ({6, 15} : Finset Label), point ∈ P 1 :=
    hrows ({ center := 1, support := {6, 15} } : RowChoice Label) (by native_decide)
  have h5 : ∀ point ∈ ({1, 7} : Finset Label), point ∈ P 5 :=
    hrows ({ center := 5, support := {1, 7} } : RowChoice Label) (by native_decide)
  exact {
    q := 6
    v := 5
    u := 7
    y := 1
    huy := by decide
    qu_qy := EdgeClosure.trans
      (EdgeClosure.row 6 7 15 (h6 7 (by native_decide)) (h6 15 (by native_decide)))
      (EdgeClosure.trans (EdgeClosure.flip 6 15)
      (EdgeClosure.trans
        (EdgeClosure.row 15 6 1 (h15 6 (by native_decide)) (h15 1 (by native_decide)))
      (EdgeClosure.trans (EdgeClosure.flip 15 1)
      (EdgeClosure.trans
        (EdgeClosure.row 1 15 6 (h1 15 (by native_decide)) (h1 6 (by native_decide)))
        (EdgeClosure.flip 1 6)))))
    uv_yv := EdgeClosure.trans (EdgeClosure.flip 7 5)
      (EdgeClosure.trans
        (EdgeClosure.row 5 7 1 (h5 7 (by native_decide)) (h5 1 (by native_decide)))
        (EdgeClosure.flip 5 1)) }

private def bisectorOneReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorOneReverseChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := by
  have h10 : ∀ point ∈ ({1, 9} : Finset Label), point ∈ P 10 :=
    hrows ({ center := 10, support := {1, 9} } : RowChoice Label) (by native_decide)
  have h1 : ∀ point ∈ ({10, 15} : Finset Label), point ∈ P 1 :=
    hrows ({ center := 1, support := {10, 15} } : RowChoice Label) (by native_decide)
  have h15 : ∀ point ∈ ({1, 10} : Finset Label), point ∈ P 15 :=
    hrows ({ center := 15, support := {1, 10} } : RowChoice Label) (by native_decide)
  have h11 : ∀ point ∈ ({9, 15} : Finset Label), point ∈ P 11 :=
    hrows ({ center := 11, support := {9, 15} } : RowChoice Label) (by native_decide)
  exact {
    q := 10
    v := 11
    u := 9
    y := 15
    huy := by decide
    qu_qy := EdgeClosure.trans
      (EdgeClosure.row 10 9 1 (h10 9 (by native_decide)) (h10 1 (by native_decide)))
      (EdgeClosure.trans (EdgeClosure.flip 10 1)
      (EdgeClosure.trans
        (EdgeClosure.row 1 10 15 (h1 10 (by native_decide)) (h1 15 (by native_decide)))
      (EdgeClosure.trans (EdgeClosure.flip 1 15)
      (EdgeClosure.trans
        (EdgeClosure.row 15 1 10 (h15 1 (by native_decide)) (h15 10 (by native_decide)))
        (EdgeClosure.flip 15 10)))))
    uv_yv := EdgeClosure.trans (EdgeClosure.flip 9 11)
      (EdgeClosure.trans
        (EdgeClosure.row 11 9 15 (h11 9 (by native_decide)) (h11 15 (by native_decide)))
        (EdgeClosure.flip 11 15)) }

private theorem false_of_bisectorOneForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorOneForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (bisectorOneForwardCore hrows)
  · change 0 < signedArea2 (pointOf 7) (pointOf 6) (pointOf 5)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (5 : Label)) (j := (6 : Label)) (k := (7 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 1) (pointOf 6) (pointOf 5)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (5 : Label)) (k := (6 : Label))
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
      (i := (9 : Label)) (j := (10 : Label)) (k := (11 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 15) (pointOf 10) (pointOf 11) < 0
    rw [signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (10 : Label)) (j := (11 : Label)) (k := (15 : Label))
      (by decide) (by decide)

private theorem false_of_bisectorOneHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ orientedHits bisectorOneHits order direction,
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

/-! ## Second four-point/two-circle occurrence -/

def bisectorTwoForwardChoices : List (RowChoice Label) :=
  [{ center := 13, support := {10, 16} },
    { center := 15, support := {1, 10} },
    { center := 1, support := {15, 16} },
    { center := 16, support := {1, 15} }]

def bisectorTwoReverseChoices : List (RowChoice Label) :=
  [{ center := 3, support := {0, 6} },
    { center := 1, support := {6, 15} },
    { center := 15, support := {0, 1} },
    { center := 0, support := {1, 15} }]

def bisectorTwoHits : List Hit :=
  [(13, 16), (13, 10), (1, 15), (1, 16),
    (15, 1), (15, 10), (16, 1), (16, 15)]

private theorem bisectorTwoForwardCover (choice : RowChoice Label)
    (hchoice : choice ∈ bisectorTwoForwardChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (choice.center, point) ∈ bisectorTwoHits := by
  native_decide +revert

private theorem bisectorTwoReverseCover (choice : RowChoice Label)
    (hchoice : choice ∈ bisectorTwoReverseChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (Fin.rev choice.center, Fin.rev point) ∈ bisectorTwoHits := by
  native_decide +revert

private def bisectorTwoForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorTwoForwardChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := by
  have h13 : ∀ point ∈ ({10, 16} : Finset Label), point ∈ P 13 :=
    hrows ({ center := 13, support := {10, 16} } : RowChoice Label) (by native_decide)
  have h15 : ∀ point ∈ ({1, 10} : Finset Label), point ∈ P 15 :=
    hrows ({ center := 15, support := {1, 10} } : RowChoice Label) (by native_decide)
  have h1 : ∀ point ∈ ({15, 16} : Finset Label), point ∈ P 1 :=
    hrows ({ center := 1, support := {15, 16} } : RowChoice Label) (by native_decide)
  have h16 : ∀ point ∈ ({1, 15} : Finset Label), point ∈ P 16 :=
    hrows ({ center := 16, support := {1, 15} } : RowChoice Label) (by native_decide)
  have huv₁ : EdgeClosure P (10, 15) (15, 10) := EdgeClosure.flip 10 15
  have huv₂ : EdgeClosure P (10, 15) (15, 1) :=
    huv₁.trans (EdgeClosure.row 15 10 1
      (h15 10 (by native_decide)) (h15 1 (by native_decide)))
  have huv₃ : EdgeClosure P (10, 15) (1, 15) :=
    huv₂.trans (EdgeClosure.flip 15 1)
  have huv₄ : EdgeClosure P (10, 15) (1, 16) :=
    huv₃.trans (EdgeClosure.row 1 15 16
      (h1 15 (by native_decide)) (h1 16 (by native_decide)))
  have huv₅ : EdgeClosure P (10, 15) (16, 1) :=
    huv₄.trans (EdgeClosure.flip 1 16)
  have huv₆ : EdgeClosure P (10, 15) (16, 15) :=
    huv₅.trans (EdgeClosure.row 16 1 15
      (h16 1 (by native_decide)) (h16 15 (by native_decide)))
  exact {
    q := 13
    v := 15
    u := 10
    y := 16
    huy := by decide
    qu_qy := EdgeClosure.row 13 10 16
      (h13 10 (by native_decide)) (h13 16 (by native_decide))
    uv_yv := huv₆ }

private def bisectorTwoReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorTwoReverseChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := by
  have h3 : ∀ point ∈ ({0, 6} : Finset Label), point ∈ P 3 :=
    hrows ({ center := 3, support := {0, 6} } : RowChoice Label) (by native_decide)
  have h1 : ∀ point ∈ ({6, 15} : Finset Label), point ∈ P 1 :=
    hrows ({ center := 1, support := {6, 15} } : RowChoice Label) (by native_decide)
  have h15 : ∀ point ∈ ({0, 1} : Finset Label), point ∈ P 15 :=
    hrows ({ center := 15, support := {0, 1} } : RowChoice Label) (by native_decide)
  have h0 : ∀ point ∈ ({1, 15} : Finset Label), point ∈ P 0 :=
    hrows ({ center := 0, support := {1, 15} } : RowChoice Label) (by native_decide)
  have huv₁ : EdgeClosure P (6, 1) (1, 6) := EdgeClosure.flip 6 1
  have huv₂ : EdgeClosure P (6, 1) (1, 15) :=
    huv₁.trans (EdgeClosure.row 1 6 15
      (h1 6 (by native_decide)) (h1 15 (by native_decide)))
  have huv₃ : EdgeClosure P (6, 1) (15, 1) :=
    huv₂.trans (EdgeClosure.flip 1 15)
  have huv₄ : EdgeClosure P (6, 1) (15, 0) :=
    huv₃.trans (EdgeClosure.row 15 1 0
      (h15 1 (by native_decide)) (h15 0 (by native_decide)))
  have huv₅ : EdgeClosure P (6, 1) (0, 15) :=
    huv₄.trans (EdgeClosure.flip 15 0)
  have huv₆ : EdgeClosure P (6, 1) (0, 1) :=
    huv₅.trans (EdgeClosure.row 0 15 1
      (h0 15 (by native_decide)) (h0 1 (by native_decide)))
  exact {
    q := 3
    v := 1
    u := 6
    y := 0
    huy := by decide
    qu_qy := EdgeClosure.row 3 6 0
      (h3 6 (by native_decide)) (h3 0 (by native_decide))
    uv_yv := huv₆ }

private theorem false_of_bisectorTwoForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorTwoForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (bisectorTwoForwardCore hrows)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (10 : Label)) (j := (13 : Label)) (k := (15 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 16) (pointOf 13) (pointOf 15) < 0
    rw [signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (13 : Label)) (j := (15 : Label)) (k := (16 : Label))
      (by decide) (by decide)

private theorem false_of_bisectorTwoReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorTwoReverseChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (bisectorTwoReverseCore hrows)
  · change 0 < signedArea2 (pointOf 6) (pointOf 3) (pointOf 1)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (3 : Label)) (k := (6 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 0) (pointOf 3) (pointOf 1)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (1 : Label)) (k := (3 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_bisectorTwoHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ orientedHits bisectorTwoHits order direction,
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

/- ## First convex-five-point occurrence -/

def convexOneForwardChoices : List (RowChoice Label) :=
  [{ center := 3, support := {2, 4} },
    { center := 7, support := {3, 4, 11} },
    { center := 11, support := {2, 4} }]

def convexOneReverseChoices : List (RowChoice Label) :=
  [{ center := 13, support := {12, 14} },
    { center := 9, support := {5, 12, 13} },
    { center := 5, support := {12, 14} }]

def convexOneHits : List Hit :=
  [(11, 2), (11, 4), (7, 11), (7, 4),
    (7, 3), (3, 2), (3, 4)]

private theorem convexOneForwardCover (choice : RowChoice Label)
    (hchoice : choice ∈ convexOneForwardChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (choice.center, point) ∈ convexOneHits := by
  native_decide +revert

private theorem convexOneReverseCover (choice : RowChoice Label)
    (hchoice : choice ∈ convexOneReverseChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (Fin.rev choice.center, Fin.rev point) ∈ convexOneHits := by
  native_decide +revert

private def convexOneForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P convexOneForwardChoices) :
    Census554.ConvexFivePointCore.Core P :=
  { a := 2
    x := 3
    b := 4
    c := 7
    y := 11
    hab := by decide
    hxy := by decide
    xa_xb := EdgeClosure.row 3 2 4
      (hrows ({ center := 3, support := {2, 4} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 3, support := {2, 4} } : RowChoice Label)
        (by native_decide) (by native_decide))
    ya_yb := EdgeClosure.row 11 2 4
      (hrows ({ center := 11, support := {2, 4} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 11, support := {2, 4} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cx := EdgeClosure.row 7 4 3
      (hrows ({ center := 7, support := {3, 4, 11} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 7, support := {3, 4, 11} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cy := EdgeClosure.row 7 4 11
      (hrows ({ center := 7, support := {3, 4, 11} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 7, support := {3, 4, 11} } : RowChoice Label)
        (by native_decide) (by native_decide)) }

private def convexOneReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P convexOneReverseChoices) :
    Census554.ConvexFivePointCore.Core P :=
  { a := 14
    x := 13
    b := 12
    c := 9
    y := 5
    hab := by decide
    hxy := by decide
    xa_xb := EdgeClosure.row 13 14 12
      (hrows ({ center := 13, support := {12, 14} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 13, support := {12, 14} } : RowChoice Label)
        (by native_decide) (by native_decide))
    ya_yb := EdgeClosure.row 5 14 12
      (hrows ({ center := 5, support := {12, 14} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 5, support := {12, 14} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cx := EdgeClosure.row 9 12 13
      (hrows ({ center := 9, support := {5, 12, 13} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 9, support := {5, 12, 13} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cy := EdgeClosure.row 9 12 5
      (hrows ({ center := 9, support := {5, 12, 13} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 9, support := {5, 12, 13} } : RowChoice Label)
        (by native_decide) (by native_decide)) }

private theorem false_of_convexOneForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexOneForwardChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core_of_neg hreal
    (convexOneForwardCore hrows)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (3 : Label)) (k := (4 : Label))
      (by decide) (by decide)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (4 : Label)) (j := (7 : Label)) (k := (11 : Label))
      (by decide) (by decide)

private theorem false_of_convexOneReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexOneReverseChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core hreal
    (convexOneReverseCore hrows)
  · change 0 < signedArea2 (pointOf 14) (pointOf 13) (pointOf 12)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (12 : Label)) (j := (13 : Label)) (k := (14 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 12) (pointOf 9) (pointOf 5)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (5 : Label)) (j := (9 : Label)) (k := (12 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_convexOneHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ orientedHits convexOneHits order direction,
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

/- ## Second convex-five-point occurrence -/

def convexTwoForwardChoices : List (RowChoice Label) :=
  [{ center := 2, support := {1, 5} },
    { center := 1, support := {6, 15} },
    { center := 6, support := {5, 15} },
    { center := 15, support := {1, 2, 6} }]

def convexTwoReverseChoices : List (RowChoice Label) :=
  [{ center := 14, support := {11, 15} },
    { center := 15, support := {1, 10} },
    { center := 10, support := {1, 11} },
    { center := 1, support := {10, 14, 15} }]

def convexTwoHits : List Hit :=
  [(1, 6), (1, 15), (2, 1), (2, 5), (6, 5),
    (6, 15), (15, 1), (15, 2), (15, 6)]

private theorem convexTwoForwardCover (choice : RowChoice Label)
    (hchoice : choice ∈ convexTwoForwardChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (choice.center, point) ∈ convexTwoHits := by
  native_decide +revert

private theorem convexTwoReverseCover (choice : RowChoice Label)
    (hchoice : choice ∈ convexTwoReverseChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (Fin.rev choice.center, Fin.rev point) ∈ convexTwoHits := by
  native_decide +revert

private def convexTwoForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P convexTwoForwardChoices) :
    Census554.ConvexFivePointCore.Core P := by
  have h2 : ∀ point ∈ ({1, 5} : Finset Label), point ∈ P 2 :=
    hrows ({ center := 2, support := {1, 5} } : RowChoice Label) (by native_decide)
  have h1 : ∀ point ∈ ({6, 15} : Finset Label), point ∈ P 1 :=
    hrows ({ center := 1, support := {6, 15} } : RowChoice Label) (by native_decide)
  have h6 : ∀ point ∈ ({5, 15} : Finset Label), point ∈ P 6 :=
    hrows ({ center := 6, support := {5, 15} } : RowChoice Label) (by native_decide)
  have h15 : ∀ point ∈ ({1, 2, 6} : Finset Label), point ∈ P 15 :=
    hrows ({ center := 15, support := {1, 2, 6} } : RowChoice Label) (by native_decide)
  have hya₁ : EdgeClosure P (6, 5) (6, 15) :=
    EdgeClosure.row 6 5 15 (h6 5 (by native_decide)) (h6 15 (by native_decide))
  have hya₂ : EdgeClosure P (6, 5) (15, 6) := hya₁.trans (EdgeClosure.flip 6 15)
  have hya₃ : EdgeClosure P (6, 5) (15, 1) :=
    hya₂.trans (EdgeClosure.row 15 6 1
      (h15 6 (by native_decide)) (h15 1 (by native_decide)))
  have hya₄ : EdgeClosure P (6, 5) (1, 15) := hya₃.trans (EdgeClosure.flip 15 1)
  have hya₅ : EdgeClosure P (6, 5) (1, 6) :=
    hya₄.trans (EdgeClosure.row 1 15 6
      (h1 15 (by native_decide)) (h1 6 (by native_decide)))
  have hya₆ : EdgeClosure P (6, 5) (6, 1) := hya₅.trans (EdgeClosure.flip 1 6)
  exact {
    a := 5
    x := 2
    b := 1
    c := 15
    y := 6
    hab := by decide
    hxy := by decide
    xa_xb := EdgeClosure.row 2 5 1
      (h2 5 (by native_decide)) (h2 1 (by native_decide))
    ya_yb := hya₆
    cb_cx := EdgeClosure.row 15 1 2
      (h15 1 (by native_decide)) (h15 2 (by native_decide))
    cb_cy := EdgeClosure.row 15 1 6
      (h15 1 (by native_decide)) (h15 6 (by native_decide)) }

private def convexTwoReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P convexTwoReverseChoices) :
    Census554.ConvexFivePointCore.Core P := by
  have h14 : ∀ point ∈ ({11, 15} : Finset Label), point ∈ P 14 :=
    hrows ({ center := 14, support := {11, 15} } : RowChoice Label) (by native_decide)
  have h15 : ∀ point ∈ ({1, 10} : Finset Label), point ∈ P 15 :=
    hrows ({ center := 15, support := {1, 10} } : RowChoice Label) (by native_decide)
  have h10 : ∀ point ∈ ({1, 11} : Finset Label), point ∈ P 10 :=
    hrows ({ center := 10, support := {1, 11} } : RowChoice Label) (by native_decide)
  have h1 : ∀ point ∈ ({10, 14, 15} : Finset Label), point ∈ P 1 :=
    hrows ({ center := 1, support := {10, 14, 15} } : RowChoice Label) (by native_decide)
  have hya₁ : EdgeClosure P (10, 11) (10, 1) :=
    EdgeClosure.row 10 11 1 (h10 11 (by native_decide)) (h10 1 (by native_decide))
  have hya₂ : EdgeClosure P (10, 11) (1, 10) := hya₁.trans (EdgeClosure.flip 10 1)
  have hya₃ : EdgeClosure P (10, 11) (1, 15) :=
    hya₂.trans (EdgeClosure.row 1 10 15
      (h1 10 (by native_decide)) (h1 15 (by native_decide)))
  have hya₄ : EdgeClosure P (10, 11) (15, 1) := hya₃.trans (EdgeClosure.flip 1 15)
  have hya₅ : EdgeClosure P (10, 11) (15, 10) :=
    hya₄.trans (EdgeClosure.row 15 1 10
      (h15 1 (by native_decide)) (h15 10 (by native_decide)))
  have hya₆ : EdgeClosure P (10, 11) (10, 15) := hya₅.trans (EdgeClosure.flip 15 10)
  exact {
    a := 11
    x := 14
    b := 15
    c := 1
    y := 10
    hab := by decide
    hxy := by decide
    xa_xb := EdgeClosure.row 14 11 15
      (h14 11 (by native_decide)) (h14 15 (by native_decide))
    ya_yb := hya₆
    cb_cx := EdgeClosure.row 1 15 14
      (h1 15 (by native_decide)) (h1 14 (by native_decide))
    cb_cy := EdgeClosure.row 1 15 10
      (h1 15 (by native_decide)) (h1 10 (by native_decide)) }

private theorem false_of_convexTwoForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexTwoForwardChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core hreal
    (convexTwoForwardCore hrows)
  · change 0 < signedArea2 (pointOf 5) (pointOf 2) (pointOf 1)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (2 : Label)) (k := (5 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 1) (pointOf 15) (pointOf 6)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (6 : Label)) (k := (15 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_convexTwoReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexTwoReverseChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core_of_neg hreal
    (convexTwoReverseCore hrows)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (11 : Label)) (j := (14 : Label)) (k := (15 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 15) (pointOf 1) (pointOf 10) < 0
    rw [signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (10 : Label)) (k := (15 : Label))
      (by decide) (by decide)

private theorem false_of_convexTwoHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ orientedHits convexTwoHits order direction,
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

/- ## Equilateral-bisector collision occurrence -/

def equilateralForwardChoices : List (RowChoice Label) :=
  [{ center := 12, support := {6, 15} },
    { center := 1, support := {6, 15, 16} },
    { center := 15, support := {1, 6} },
    { center := 16, support := {1, 12, 15} }]

def equilateralReverseChoices : List (RowChoice Label) :=
  [{ center := 4, support := {1, 10} },
    { center := 15, support := {0, 1, 10} },
    { center := 1, support := {10, 15} },
    { center := 0, support := {1, 4, 15} }]

def equilateralHits : List Hit :=
  [(12, 6), (12, 15), (1, 6), (1, 15), (1, 16),
    (15, 1), (15, 6), (16, 12), (16, 1), (16, 15)]

private theorem equilateralForwardCover (choice : RowChoice Label)
    (hchoice : choice ∈ equilateralForwardChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (choice.center, point) ∈ equilateralHits := by
  native_decide +revert

private theorem equilateralReverseCover (choice : RowChoice Label)
    (hchoice : choice ∈ equilateralReverseChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (Fin.rev choice.center, Fin.rev point) ∈ equilateralHits := by
  native_decide +revert

private def equilateralForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P equilateralForwardChoices) :
    Census554.EqualityCore.EquilateralBisectorCollisionCore P := by
  have h12 : ∀ point ∈ ({6, 15} : Finset Label), point ∈ P 12 :=
    hrows ({ center := 12, support := {6, 15} } : RowChoice Label) (by native_decide)
  have h1 : ∀ point ∈ ({6, 15, 16} : Finset Label), point ∈ P 1 :=
    hrows ({ center := 1, support := {6, 15, 16} } : RowChoice Label) (by native_decide)
  have h15 : ∀ point ∈ ({1, 6} : Finset Label), point ∈ P 15 :=
    hrows ({ center := 15, support := {1, 6} } : RowChoice Label) (by native_decide)
  have h16 : ∀ point ∈ ({1, 12, 15} : Finset Label), point ∈ P 16 :=
    hrows ({ center := 16, support := {1, 12, 15} } : RowChoice Label) (by native_decide)
  have hpa₁ : EdgeClosure P (16, 15) (16, 1) :=
    EdgeClosure.row 16 15 1 (h16 15 (by native_decide)) (h16 1 (by native_decide))
  have hpa₂ : EdgeClosure P (16, 15) (1, 16) := hpa₁.trans (EdgeClosure.flip 16 1)
  have hpa_ab : EdgeClosure P (16, 15) (15, 1) :=
    (hpa₂.trans (EdgeClosure.row 1 16 15
      (h1 16 (by native_decide)) (h1 15 (by native_decide)))).trans
      (EdgeClosure.flip 1 15)
  exact {
    p := 16
    a := 15
    b := 1
    c := 12
    x := 6
    hpa := by decide
    hpx := by decide
    hcb := by decide
    pa_pb := hpa₁
    pa_pc := EdgeClosure.row 16 15 12
      (h16 15 (by native_decide)) (h16 12 (by native_decide))
    pa_ab := hpa_ab
    pa_ax := hpa_ab.trans (EdgeClosure.row 15 1 6
      (h15 1 (by native_decide)) (h15 6 (by native_decide)))
    pa_bx := hpa₂.trans (EdgeClosure.row 1 16 6
      (h1 16 (by native_decide)) (h1 6 (by native_decide)))
    cx_ca := EdgeClosure.row 12 6 15
      (h12 6 (by native_decide)) (h12 15 (by native_decide)) }

private def equilateralReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P equilateralReverseChoices) :
    Census554.EqualityCore.EquilateralBisectorCollisionCore P := by
  have h4 : ∀ point ∈ ({1, 10} : Finset Label), point ∈ P 4 :=
    hrows ({ center := 4, support := {1, 10} } : RowChoice Label) (by native_decide)
  have h15 : ∀ point ∈ ({0, 1, 10} : Finset Label), point ∈ P 15 :=
    hrows ({ center := 15, support := {0, 1, 10} } : RowChoice Label) (by native_decide)
  have h1 : ∀ point ∈ ({10, 15} : Finset Label), point ∈ P 1 :=
    hrows ({ center := 1, support := {10, 15} } : RowChoice Label) (by native_decide)
  have h0 : ∀ point ∈ ({1, 4, 15} : Finset Label), point ∈ P 0 :=
    hrows ({ center := 0, support := {1, 4, 15} } : RowChoice Label) (by native_decide)
  have hpa₁ : EdgeClosure P (0, 1) (0, 15) :=
    EdgeClosure.row 0 1 15 (h0 1 (by native_decide)) (h0 15 (by native_decide))
  have hpa₂ : EdgeClosure P (0, 1) (15, 0) := hpa₁.trans (EdgeClosure.flip 0 15)
  have hpa_ab : EdgeClosure P (0, 1) (1, 15) :=
    (hpa₂.trans (EdgeClosure.row 15 0 1
      (h15 0 (by native_decide)) (h15 1 (by native_decide)))).trans
      (EdgeClosure.flip 15 1)
  exact {
    p := 0
    a := 1
    b := 15
    c := 4
    x := 10
    hpa := by decide
    hpx := by decide
    hcb := by decide
    pa_pb := hpa₁
    pa_pc := EdgeClosure.row 0 1 4
      (h0 1 (by native_decide)) (h0 4 (by native_decide))
    pa_ab := hpa_ab
    pa_ax := hpa_ab.trans (EdgeClosure.row 1 15 10
      (h1 15 (by native_decide)) (h1 10 (by native_decide)))
    pa_bx := hpa₂.trans (EdgeClosure.row 15 0 10
      (h15 0 (by native_decide)) (h15 10 (by native_decide)))
    cx_ca := EdgeClosure.row 4 10 1
      (h4 10 (by native_decide)) (h4 1 (by native_decide)) }

private theorem false_of_equilateralForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hrows : PositiveRowsMatch P equilateralForwardChoices) : False := by
  exact Census554.EqualityCore.not_realizes_of_equilateralBisectorCollisionCore
    (equilateralForwardCore hrows) ⟨pointOf, hreal⟩

private theorem false_of_equilateralReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hrows : PositiveRowsMatch P equilateralReverseChoices) : False := by
  exact Census554.EqualityCore.not_realizes_of_equilateralBisectorCollisionCore
    (equilateralReverseCore hrows) ⟨pointOf, hreal⟩

private theorem false_of_equilateralHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ orientedHits equilateralHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_equilateralForwardRows hreal
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        equilateralHits equilateralForwardChoices equilateralForwardCover hall)
  · exact false_of_equilateralReverseRows hreal
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        equilateralHits equilateralReverseChoices equilateralReverseCover hall)

/- ## Three-point perpendicular-bisector occurrence -/

def perpForwardChoices : List (RowChoice Label) :=
  [{ center := 14, support := {0, 8, 13} },
    { center := 8, support := {0, 13, 14} },
    { center := 10, support := {8, 14} }]

def perpReverseChoices : List (RowChoice Label) :=
  [{ center := 2, support := {3, 8, 16} },
    { center := 8, support := {2, 3, 16} },
    { center := 6, support := {2, 8} }]

def perpHits : List Hit :=
  [(14, 0), (14, 8), (14, 13), (8, 0),
    (8, 14), (8, 13), (10, 14), (10, 8)]

private theorem perpForwardCover (choice : RowChoice Label)
    (hchoice : choice ∈ perpForwardChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (choice.center, point) ∈ perpHits := by
  native_decide +revert

private theorem perpReverseCover (choice : RowChoice Label)
    (hchoice : choice ∈ perpReverseChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (Fin.rev choice.center, Fin.rev point) ∈ perpHits := by
  native_decide +revert

private def perpForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P perpForwardChoices) :
    Census554.EqualityCore.PerpBisectorCore P := by
  have h14 : ∀ point ∈ ({0, 8, 13} : Finset Label), point ∈ P 14 :=
    hrows ({ center := 14, support := {0, 8, 13} } : RowChoice Label) (by native_decide)
  have h8 : ∀ point ∈ ({0, 13, 14} : Finset Label), point ∈ P 8 :=
    hrows ({ center := 8, support := {0, 13, 14} } : RowChoice Label) (by native_decide)
  have h10 : ∀ point ∈ ({8, 14} : Finset Label), point ∈ P 10 :=
    hrows ({ center := 10, support := {8, 14} } : RowChoice Label) (by native_decide)
  have chain (point : Label)
      (hpoint14 : point ∈ P 14) (hpoint8 : point ∈ P 8) :
      EdgeClosure P (point, 14) (point, 8) :=
    (EdgeClosure.flip point 14).trans
      ((EdgeClosure.row 14 point 8 hpoint14 (h14 8 (by native_decide))).trans
      ((EdgeClosure.flip 14 8).trans
      ((EdgeClosure.row 8 14 point (h8 14 (by native_decide)) hpoint8).trans
        (EdgeClosure.flip 8 point))))
  exact {
    a := 14
    b := 8
    p := 0
    q := 13
    r := 10
    hab := by decide
    hpq := by decide
    hpr := by decide
    hqr := by decide
    pa_pb := chain 0 (h14 0 (by native_decide)) (h8 0 (by native_decide))
    qa_qb := chain 13 (h14 13 (by native_decide)) (h8 13 (by native_decide))
    ra_rb := EdgeClosure.row 10 14 8
      (h10 14 (by native_decide)) (h10 8 (by native_decide)) }

private def perpReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P perpReverseChoices) :
    Census554.EqualityCore.PerpBisectorCore P := by
  have h2 : ∀ point ∈ ({3, 8, 16} : Finset Label), point ∈ P 2 :=
    hrows ({ center := 2, support := {3, 8, 16} } : RowChoice Label) (by native_decide)
  have h8 : ∀ point ∈ ({2, 3, 16} : Finset Label), point ∈ P 8 :=
    hrows ({ center := 8, support := {2, 3, 16} } : RowChoice Label) (by native_decide)
  have h6 : ∀ point ∈ ({2, 8} : Finset Label), point ∈ P 6 :=
    hrows ({ center := 6, support := {2, 8} } : RowChoice Label) (by native_decide)
  have chain (point : Label)
      (hpoint2 : point ∈ P 2) (hpoint8 : point ∈ P 8) :
      EdgeClosure P (point, 2) (point, 8) :=
    (EdgeClosure.flip point 2).trans
      ((EdgeClosure.row 2 point 8 hpoint2 (h2 8 (by native_decide))).trans
      ((EdgeClosure.flip 2 8).trans
      ((EdgeClosure.row 8 2 point (h8 2 (by native_decide)) hpoint8).trans
        (EdgeClosure.flip 8 point))))
  exact {
    a := 2
    b := 8
    p := 16
    q := 3
    r := 6
    hab := by decide
    hpq := by decide
    hpr := by decide
    hqr := by decide
    pa_pb := chain 16 (h2 16 (by native_decide)) (h8 16 (by native_decide))
    qa_qb := chain 3 (h2 3 (by native_decide)) (h8 3 (by native_decide))
    ra_rb := EdgeClosure.row 6 2 8
      (h6 2 (by native_decide)) (h6 8 (by native_decide)) }

private theorem false_of_perpForwardRows {A : Finset ℝ²}
    (source : SourceRealization A)
    (hrows : PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      perpForwardChoices) : False := by
  apply Census554.EqualityCore.false_of_convexIndep_of_perpBisectorCore
    (sourceRealizesBoundaryPattern source) source.carrier_convexIndep
    _ (perpForwardCore hrows)
  intro label
  exact boundaryLabel_mem source.boundary source.boundary_image id label

private theorem false_of_perpReverseRows {A : Finset ℝ²}
    (source : SourceRealization A)
    (hrows : PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      perpReverseChoices) : False := by
  apply Census554.EqualityCore.false_of_convexIndep_of_perpBisectorCore
    (sourceRealizesBoundaryPattern source) source.carrier_convexIndep
    _ (perpReverseCore hrows)
  intro label
  exact boundaryLabel_mem source.boundary source.boundary_image id label

private theorem false_of_perpHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ orientedHits perpHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  by_cases hsame : source.orientation = direction
  · exact false_of_perpForwardRows source
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        perpHits perpForwardChoices perpForwardCover hall)
  · exact false_of_perpReverseRows source
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        perpHits perpReverseChoices perpReverseCover hall)

/-! ## Seven-point Kalmanson schema-L occurrence -/

def kalmansonLForwardChoices : List (RowChoice Label) :=
  [{ center := 14, support := {0, 8} },
    { center := 7, support := {3, 10} },
    { center := 10, support := {3, 8, 14} },
    { center := 13, support := {0, 10} }]

def kalmansonLReverseChoices : List (RowChoice Label) :=
  [{ center := 2, support := {8, 16} },
    { center := 9, support := {6, 13} },
    { center := 6, support := {2, 8, 13} },
    { center := 3, support := {6, 16} }]

def kalmansonLHits : List Hit :=
  [(14, 0), (14, 8),
    (13, 0), (13, 10),
    (7, 3), (7, 10),
    (10, 14), (10, 8), (10, 3)]

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
        source.model.selected)
      kalmansonLForwardChoices) : False := by
  let P := reindexRowPattern
    (sourceIndexEquiv source.model.order source.orientation)
    source.model.selected
  have hreal : Realizes P source.boundary := sourceRealizesBoundaryPattern source
  apply CapCrossingKalmansonBridge.false_of_seven_ccw_five_shell_equalities_L_of_increasing
    source.carrier_convexIndep hreal.injective source.boundary_image
      source.boundary_ccw
    (a := 0) (b := 3) (c := 7) (d := 8) (e := 10) (f := 13) (g := 14)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  · exact hreal.equidist 14 8
      (hrows ({ center := 14, support := {0, 8} } : RowChoice Label)
        (by native_decide) (by native_decide)) 0
      (hrows ({ center := 14, support := {0, 8} } : RowChoice Label)
        (by native_decide) (by native_decide))
  · exact hreal.equidist 7 10
      (hrows ({ center := 7, support := {3, 10} } : RowChoice Label)
        (by native_decide) (by native_decide)) 3
      (hrows ({ center := 7, support := {3, 10} } : RowChoice Label)
        (by native_decide) (by native_decide))
  · exact hreal.equidist 10 14
      (hrows ({ center := 10, support := {3, 8, 14} } : RowChoice Label)
        (by native_decide) (by native_decide)) 3
      (hrows ({ center := 10, support := {3, 8, 14} } : RowChoice Label)
        (by native_decide) (by native_decide))
  · exact hreal.equidist 10 14
      (hrows ({ center := 10, support := {3, 8, 14} } : RowChoice Label)
        (by native_decide) (by native_decide)) 8
      (hrows ({ center := 10, support := {3, 8, 14} } : RowChoice Label)
        (by native_decide) (by native_decide))
  · exact hreal.equidist 13 10
      (hrows ({ center := 13, support := {0, 10} } : RowChoice Label)
        (by native_decide) (by native_decide)) 0
      (hrows ({ center := 13, support := {0, 10} } : RowChoice Label)
        (by native_decide) (by native_decide))

private theorem false_of_kalmansonLReverseRows {A : Finset ℝ²}
    (source : SourceRealization A)
    (hrows : PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      kalmansonLReverseChoices) : False := by
  let P := reindexRowPattern
    (sourceIndexEquiv source.model.order source.orientation)
    source.model.selected
  have hreal : Realizes P source.boundary := sourceRealizesBoundaryPattern source
  apply CapCrossingKalmansonBridge.false_of_seven_ccw_five_shell_equalities_L_of_decreasing
    source.carrier_convexIndep hreal.injective source.boundary_image
      source.boundary_ccw
    (a := 16) (b := 13) (c := 9) (d := 8) (e := 6) (f := 3) (g := 2)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  · exact hreal.equidist 2 8
      (hrows ({ center := 2, support := {8, 16} } : RowChoice Label)
        (by native_decide) (by native_decide)) 16
      (hrows ({ center := 2, support := {8, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
  · exact hreal.equidist 9 6
      (hrows ({ center := 9, support := {6, 13} } : RowChoice Label)
        (by native_decide) (by native_decide)) 13
      (hrows ({ center := 9, support := {6, 13} } : RowChoice Label)
        (by native_decide) (by native_decide))
  · exact hreal.equidist 6 2
      (hrows ({ center := 6, support := {2, 8, 13} } : RowChoice Label)
        (by native_decide) (by native_decide)) 13
      (hrows ({ center := 6, support := {2, 8, 13} } : RowChoice Label)
        (by native_decide) (by native_decide))
  · exact hreal.equidist 6 2
      (hrows ({ center := 6, support := {2, 8, 13} } : RowChoice Label)
        (by native_decide) (by native_decide)) 8
      (hrows ({ center := 6, support := {2, 8, 13} } : RowChoice Label)
        (by native_decide) (by native_decide))
  · exact hreal.equidist 3 6
      (hrows ({ center := 3, support := {6, 16} } : RowChoice Label)
        (by native_decide) (by native_decide)) 16
      (hrows ({ center := 3, support := {6, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))

private theorem false_of_kalmansonLHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ orientedHits kalmansonLHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  by_cases hsame : source.orientation = direction
  · exact false_of_kalmansonLForwardRows source
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        kalmansonLHits kalmansonLForwardChoices kalmansonLForwardCover hall)
  · exact false_of_kalmansonLReverseRows source
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        kalmansonLHits kalmansonLReverseChoices kalmansonLReverseCover hall)

/-! ## Generic two-Kalmanson cancellation occurrence -/

def cancellationForwardChoices : List (RowChoice Label) :=
  [{ center := 3, support := {2, 14} },
    { center := 8, support := {0, 14} },
    { center := 11, support := {0, 2} }]

def cancellationReverseChoices : List (RowChoice Label) :=
  [{ center := 5, support := {14, 16} },
    { center := 8, support := {2, 16} },
    { center := 13, support := {2, 14} }]

/-- The six positive incidences actually traversed by the checked certificate. -/
def cancellationHits : List Hit :=
  [(3, 2), (3, 14),
    (8, 0), (8, 14),
    (11, 0), (11, 2)]

theorem cancellationForwardCover :
    ∀ choice ∈ cancellationForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ cancellationHits := by
  native_decide

theorem cancellationReverseCover :
    ∀ choice ∈ cancellationReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ cancellationHits := by
  native_decide

/-- Checked certificate reconstructed from the sixteenth-model theorem-bank hit. -/
def cancellationForwardData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨0, 2, 3, 11⟩
  firstForm := .innerOuter
  secondQuad := ⟨0, 3, 8, 14⟩
  secondForm := .adjacentSides
  permutation := ⟨3, 1, 0, 2⟩
  path0 := ⟨(2, 3),
    [.flip 2 3, .row 3 2 14],
    (3, 14)⟩
  path1 := ⟨(0, 11),
    [.flip 0 11, .row 11 0 2, .flip 11 2],
    (2, 11)⟩
  path2 := ⟨(0, 3), [], (0, 3)⟩
  path3 := ⟨(8, 14),
    [.row 8 14 0, .flip 8 0],
    (0, 8)⟩ }

/-- Independently checked reflection of `cancellationForwardData`. -/
def cancellationReverseData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨5, 13, 14, 16⟩
  firstForm := .innerOuter
  secondQuad := ⟨2, 8, 13, 16⟩
  secondForm := .adjacentSides
  permutation := ⟨2, 0, 3, 1⟩
  path0 := ⟨(13, 14),
    [.row 13 14 2, .flip 13 2],
    (2, 13)⟩
  path1 := ⟨(5, 16), [.row 5 16 14], (5, 14)⟩
  path2 := ⟨(2, 8),
    [.flip 2 8, .row 8 2 16],
    (8, 16)⟩
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
    (hall : ∀ hit ∈ orientedHits cancellationHits order direction,
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

/-! ## Clause orbit shared by the occurrences above -/

def occurrenceClause (baseHits : List Hit) (order : NamedOrder)
    (direction : Orientation) : Std.Sat.CNF.Clause Atom :=
  nogoodClause order (orientedHits baseHits order direction)

def occurrenceClauses (baseHits : List Hit) : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.map fun direction => occurrenceClause baseHits order direction

theorem occurrenceClauses_length (baseHits : List Hit) :
    (occurrenceClauses baseHits).length = 4 := by
  simp [occurrenceClauses, namedOrders, directions]

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

theorem sourceAssign_bisectorOneClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (occurrenceClause bisectorOneHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_bisectorOneHits source order direction horder.symm hall

theorem sourceAssign_bisectorTwoClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (occurrenceClause bisectorTwoHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_bisectorTwoHits source order direction horder.symm hall

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

theorem sourceAssign_equilateralClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (occurrenceClause equilateralHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_equilateralHits source order direction horder.symm hall

theorem sourceAssign_perpClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (occurrenceClause perpHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_perpHits source order direction horder.symm hall

theorem sourceAssign_kalmansonLClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (occurrenceClause kalmansonLHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_kalmansonLHits source order direction horder.symm hall

theorem sourceAssign_cancellationClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (occurrenceClause cancellationHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_cancellationHits source order direction horder.symm hall

/-- The complete mandatory theorem-bank response to the sixteenth SAT model. -/
def sixteenthModelRefinementClauses : Std.Sat.CNF Atom :=
  occurrenceClauses bisectorOneHits ++
  occurrenceClauses bisectorTwoHits ++
  occurrenceClauses kalmansonLHits ++
  occurrenceClauses equilateralHits ++
  occurrenceClauses convexOneHits ++
  occurrenceClauses convexTwoHits ++
  occurrenceClauses cancellationHits ++
  occurrenceClauses perpHits

theorem sixteenthModelRefinementClauses_length :
    sixteenthModelRefinementClauses.length = 32 := by
  simp [sixteenthModelRefinementClauses, occurrenceClauses_length]

theorem sourceAssign_sixteenthModelRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ sixteenthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  change clause ∈
    occurrenceClauses bisectorOneHits ++
    occurrenceClauses bisectorTwoHits ++
    occurrenceClauses kalmansonLHits ++
    occurrenceClauses equilateralHits ++
    occurrenceClauses convexOneHits ++
    occurrenceClauses convexTwoHits ++
    occurrenceClauses cancellationHits ++
    occurrenceClauses perpHits at hclause
  rcases List.mem_append.mp hclause with hleft | hperp
  · rcases List.mem_append.mp hleft with hleft | hcancellation
    · rcases List.mem_append.mp hleft with hleft | hconvexTwo
      · rcases List.mem_append.mp hleft with hleft | hconvexOne
        · rcases List.mem_append.mp hleft with hleft | hequilateral
          · rcases List.mem_append.mp hleft with hleft | hkalmansonL
            · rcases List.mem_append.mp hleft with hbisectorOne | hbisectorTwo
              · exact sourceAssign_occurrenceClauses source bisectorOneHits
                  (sourceAssign_bisectorOneClause source) clause hbisectorOne
              · exact sourceAssign_occurrenceClauses source bisectorTwoHits
                  (sourceAssign_bisectorTwoClause source) clause hbisectorTwo
            · exact sourceAssign_occurrenceClauses source kalmansonLHits
                (sourceAssign_kalmansonLClause source) clause hkalmansonL
          · exact sourceAssign_occurrenceClauses source equilateralHits
              (sourceAssign_equilateralClause source) clause hequilateral
        · exact sourceAssign_occurrenceClauses source convexOneHits
            (sourceAssign_convexOneClause source) clause hconvexOne
      · exact sourceAssign_occurrenceClauses source convexTwoHits
          (sourceAssign_convexTwoClause source) clause hconvexTwo
    · exact sourceAssign_occurrenceClauses source cancellationHits
        (sourceAssign_cancellationClause source) clause hcancellation
  · exact sourceAssign_occurrenceClauses source perpHits
      (sourceAssign_perpClause source) clause hperp

/-- Lean-owned successor root after all eight sixteenth-model refinements. -/
def extendedSixteenthModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedFifthConvexFivePointCnf ++ sixteenthModelRefinementClauses

theorem extendedSixteenthModelRefinementsCnf_clause_count :
    extendedSixteenthModelRefinementsCnf.length = 5846144 := by
  simp [extendedSixteenthModelRefinementsCnf,
    extendedFifthConvexFivePointCnf_clause_count,
    sixteenthModelRefinementClauses_length]

/-- Gate B for the successor containing every sixteenth-model refinement. -/
theorem sourceAssign_extendedSixteenthModelRefinementsCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedSixteenthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedSixteenthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hold | hnew
  · have h := sourceAssign_extendedFifthConvexFivePointCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hold
  · exact sourceAssign_sixteenthModelRefinementClauses source clause hnew

/-- Certificate-to-source landing contract for the seventeenth child. -/
theorem false_of_sourceRealization_of_extendedSixteenthModelRefinementsCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedSixteenthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedSixteenthModelRefinementsCnf source⟩

#print axioms sourceAssign_cancellationClause
#print axioms sourceAssign_extendedSixteenthModelRefinementsCnf

end ATailBlockerVExactSeventeenSixteenthModelRefinements
end Problem97

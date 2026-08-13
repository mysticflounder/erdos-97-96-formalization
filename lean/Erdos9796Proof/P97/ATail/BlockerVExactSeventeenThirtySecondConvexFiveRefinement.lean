/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenGenericCancellationSecond
import Erdos9796Proof.P97.Census554.ConvexFivePointCore

/-!
# Convex-five source bridge for the exact-seventeen child-33 refinement

This module records the seven source incidences of the canonical convex-five
support and its two-order, two-orientation orbit.  It is deliberately an
adapter only: no shared coordinator or exported CNF is changed here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtySecondConvexFiveRefinement

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenGenericCancellationSecond
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

/-- The three positive rows supporting the canonical seven-incidence motif. -/
def canonicalForwardChoices : List (RowChoice Label) :=
  [{ center := 3, support := {4, 16} },
    { center := 12, support := {4, 16} },
    { center := 13, support := {3, 4, 12} }]

/-- Reflection of the canonical three positive rows. -/
def canonicalReverseChoices : List (RowChoice Label) :=
  [{ center := 13, support := {0, 12} },
    { center := 4, support := {0, 12} },
    { center := 3, support := {4, 12, 13} }]

/-- The seven canonical source incidences. -/
def canonicalHits : List Hit :=
  [(3, 4), (3, 16), (12, 4), (12, 16),
    (13, 3), (13, 4), (13, 12)]

/-- Transport the canonical motif into a named source order and orientation. -/
def canonicalConvexFiveHits (order : NamedOrder) (direction : Orientation) :
    List Hit :=
  canonicalHits.map fun hit =>
    (orientedLabelAtPosition order direction hit.1,
      orientedLabelAtPosition order direction hit.2)

private theorem canonicalHit_of_choice (choice : RowChoice Label)
    (hchoice : choice ∈ canonicalForwardChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (choice.center, point) ∈ canonicalHits := by
  native_decide +revert

private theorem canonicalReflectedHit_of_choice (choice : RowChoice Label)
    (hchoice : choice ∈ canonicalReverseChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (Fin.rev choice.center, Fin.rev point) ∈ canonicalHits := by
  native_decide +revert

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

private theorem canonicalPositiveRowsMatch_forward {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hsame : source.orientation = direction)
    (hall : ∀ hit ∈ canonicalConvexFiveHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      canonicalForwardChoices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  exact hall
    (orientedLabelAtPosition source.model.order direction choice.center,
      orientedLabelAtPosition source.model.order direction point)
    (by
      simp only [canonicalConvexFiveHits, List.mem_map]
      exact ⟨(choice.center, point),
        canonicalHit_of_choice choice hchoice point hpoint, rfl⟩)

private theorem canonicalPositiveRowsMatch_reverse {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hne : source.orientation ≠ direction)
    (hall : ∀ hit ∈ canonicalConvexFiveHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      canonicalReverseChoices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  exact hall
    (orientedLabelAtPosition source.model.order direction (Fin.rev choice.center),
      orientedLabelAtPosition source.model.order direction (Fin.rev point))
    (by
      simp only [canonicalConvexFiveHits, List.mem_map]
      exact ⟨(Fin.rev choice.center, Fin.rev point),
        canonicalReflectedHit_of_choice choice hchoice point hpoint, rfl⟩)

private def canonicalForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P canonicalForwardChoices) :
    Census554.ConvexFivePointCore.Core P :=
  { a := 16
    x := 3
    b := 4
    c := 13
    y := 12
    hab := by decide
    hxy := by decide
    xa_xb := EdgeClosure.row 3 16 4
      (hrows ({ center := 3, support := {4, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 3, support := {4, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
    ya_yb := EdgeClosure.row 12 16 4
      (hrows ({ center := 12, support := {4, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 12, support := {4, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cx := EdgeClosure.row 13 4 3
      (hrows ({ center := 13, support := {3, 4, 12} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 13, support := {3, 4, 12} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cy := EdgeClosure.row 13 4 12
      (hrows ({ center := 13, support := {3, 4, 12} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 13, support := {3, 4, 12} } : RowChoice Label)
        (by native_decide) (by native_decide)) }

private def canonicalReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P canonicalReverseChoices) :
    Census554.ConvexFivePointCore.Core P :=
  { a := 0
    x := 13
    b := 12
    c := 3
    y := 4
    hab := by decide
    hxy := by decide
    xa_xb := EdgeClosure.row 13 0 12
      (hrows ({ center := 13, support := {0, 12} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 13, support := {0, 12} } : RowChoice Label)
        (by native_decide) (by native_decide))
    ya_yb := EdgeClosure.row 4 0 12
      (hrows ({ center := 4, support := {0, 12} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 4, support := {0, 12} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cx := EdgeClosure.row 3 12 13
      (hrows ({ center := 3, support := {4, 12, 13} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 3, support := {4, 12, 13} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cy := EdgeClosure.row 3 12 4
      (hrows ({ center := 3, support := {4, 12, 13} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 3, support := {4, 12, 13} } : RowChoice Label)
        (by native_decide) (by native_decide)) }

private theorem signedArea2_cycle (a b c : ℝ²) :
    signedArea2 a b c = signedArea2 b c a := by
  simp only [signedArea2]
  ring

private theorem signedArea2_swap23 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 a c b := by
  simp only [signedArea2]
  ring

/- The source rows do not meet the signed-area antecedents of either
`ConvexFivePointCore` theorem.  Keep this explicit blocker at the adapter
boundary instead of introducing an unproved SourceRealization bridge. -/
theorem canonicalForwardCore_orientation_gap
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf) :
    signedArea2 (pointOf 16) (pointOf 3) (pointOf 4) < 0 ∧
      0 < signedArea2 (pointOf 4) (pointOf 13) (pointOf 12) := by
  constructor
  · rw [signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (3 : Label)) (j := (4 : Label)) (k := (16 : Label))
      (by decide) (by decide)
  · rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (4 : Label)) (j := (12 : Label)) (k := (13 : Label))
      (by decide) (by decide)
    linarith

theorem canonicalReverseCore_orientation_gap
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf) :
    0 < signedArea2 (pointOf 0) (pointOf 13) (pointOf 12) ∧
      signedArea2 (pointOf 12) (pointOf 3) (pointOf 4) < 0 := by
  constructor
  · rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (12 : Label)) (k := (13 : Label))
      (by decide) (by decide)
    linarith
  · rw [signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (3 : Label)) (j := (4 : Label)) (k := (12 : Label))
      (by decide) (by decide)

end ATailBlockerVExactSeventeenThirtySecondConvexFiveRefinement
end Problem97

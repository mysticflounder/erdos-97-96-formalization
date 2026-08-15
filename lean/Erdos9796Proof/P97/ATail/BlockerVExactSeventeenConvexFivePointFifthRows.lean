/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenGenericCancellationThird
import Erdos9796Proof.P97.Census554.ConvexFivePointCore

/-!
# Fifth three-row convex five-point clause for exact seventeen

The terminal SAT model of the fifteenth Lean-owned child contains a seven-
incidence convex five-point obstruction.  This module banks its complete
two-order, two-orientation orbit after the third generic-cancellation orbit.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenConvexFivePointFifthRows

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenConvexFivePointFourthRows
open ATailBlockerVExactSeventeenFourPointTwoCircleBisectorRows
open ATailBlockerVExactSeventeenFourRowTwoCircleBisector
open ATailBlockerVExactSeventeenGenericCancellationThird
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

/-- The three rows supporting the forward positional obstruction. -/
def forwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {0, 9} },
    { center := 13, support := {0, 9} },
    { center := 14, support := {0, 1, 13} }]

/-- Reflection of the forward three-row obstruction. -/
def reverseChoices : List (RowChoice Label) :=
  [{ center := 15, support := {7, 16} },
    { center := 3, support := {7, 16} },
    { center := 2, support := {3, 15, 16} }]

/-- The seven positive incidences serialized into one guarded clause. -/
def forwardHits : List Hit :=
  [(1, 0), (1, 9), (13, 0), (13, 9),
    (14, 0), (14, 1), (14, 13)]

/-- Transport the positional motif into a named source order and orientation. -/
def convexFivePointHits (order : NamedOrder) (direction : Orientation) :
    List Hit :=
  forwardHits.map fun hit =>
    (orientedLabelAtPosition order direction hit.1,
      orientedLabelAtPosition order direction hit.2)

private theorem forwardHit_of_choice (choice : RowChoice Label)
    (hchoice : choice ∈ forwardChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (choice.center, point) ∈ forwardHits := by
  native_decide +revert

private theorem reflectedForwardHit_of_choice (choice : RowChoice Label)
    (hchoice : choice ∈ reverseChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (Fin.rev choice.center, Fin.rev point) ∈ forwardHits := by
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

private theorem positiveRowsMatch_forward {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hsame : source.orientation = direction)
    (hall : ∀ hit ∈ convexFivePointHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      forwardChoices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  exact hall
    (orientedLabelAtPosition source.model.order direction choice.center,
      orientedLabelAtPosition source.model.order direction point)
    (by
      simp only [convexFivePointHits, List.mem_map]
      exact ⟨(choice.center, point),
        forwardHit_of_choice choice hchoice point hpoint, rfl⟩)

private theorem positiveRowsMatch_reverse {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hne : source.orientation ≠ direction)
    (hall : ∀ hit ∈ convexFivePointHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      reverseChoices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  exact hall
    (orientedLabelAtPosition source.model.order direction (Fin.rev choice.center),
      orientedLabelAtPosition source.model.order direction (Fin.rev point))
    (by
      simp only [convexFivePointHits, List.mem_map]
      exact ⟨(Fin.rev choice.center, Fin.rev point),
        reflectedForwardHit_of_choice choice hchoice point hpoint, rfl⟩)

private def forwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P forwardChoices) :
    Census554.ConvexFivePointCore.Core P :=
  { a := 9
    x := 1
    b := 0
    c := 14
    y := 13
    hab := by decide
    hxy := by decide
    xa_xb := EdgeClosure.row 1 9 0
      (hrows ({ center := 1, support := {0, 9} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 1, support := {0, 9} } : RowChoice Label)
        (by native_decide) (by native_decide))
    ya_yb := EdgeClosure.row 13 9 0
      (hrows ({ center := 13, support := {0, 9} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 13, support := {0, 9} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cx := EdgeClosure.row 14 0 1
      (hrows ({ center := 14, support := {0, 1, 13} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 14, support := {0, 1, 13} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cy := EdgeClosure.row 14 0 13
      (hrows ({ center := 14, support := {0, 1, 13} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 14, support := {0, 1, 13} } : RowChoice Label)
        (by native_decide) (by native_decide)) }

private def reverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P reverseChoices) :
    Census554.ConvexFivePointCore.Core P :=
  { a := 7
    x := 15
    b := 16
    c := 2
    y := 3
    hab := by decide
    hxy := by decide
    xa_xb := EdgeClosure.row 15 7 16
      (hrows ({ center := 15, support := {7, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 15, support := {7, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
    ya_yb := EdgeClosure.row 3 7 16
      (hrows ({ center := 3, support := {7, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 3, support := {7, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cx := EdgeClosure.row 2 16 15
      (hrows ({ center := 2, support := {3, 15, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 2, support := {3, 15, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cy := EdgeClosure.row 2 16 3
      (hrows ({ center := 2, support := {3, 15, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 2, support := {3, 15, 16} } : RowChoice Label)
        (by native_decide) (by native_decide)) }

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

private theorem false_of_forwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P forwardChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core hreal (forwardCore hrows)
  · change 0 < signedArea2 (pointOf 9) (pointOf 1) (pointOf 0)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (1 : Label)) (k := (9 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 0) (pointOf 14) (pointOf 13)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (13 : Label)) (k := (14 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_reverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P reverseChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core_of_neg hreal
    (reverseCore hrows)
  · change signedArea2 (pointOf 7) (pointOf 15) (pointOf 16) < 0
    exact hneg_of_ccw hreal.injective hccw
      (i := (7 : Label)) (j := (15 : Label)) (k := (16 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 16) (pointOf 2) (pointOf 3) < 0
    rw [signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (3 : Label)) (k := (16 : Label))
      (by decide) (by decide)

private theorem false_of_convexFivePointHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ convexFivePointHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_forwardRows hreal source.boundary_ccw
      (positiveRowsMatch_forward source source.model.order direction rfl hsame hall)
  · exact false_of_reverseRows hreal source.boundary_ccw
      (positiveRowsMatch_reverse source source.model.order direction rfl hsame hall)

/-- One three-row five-point clause for a named source order and orientation. -/
def convexFivePointClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom :=
  nogoodClause order (convexFivePointHits order direction)

theorem sourceAssign_convexFivePointClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (convexFivePointClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_convexFivePointHits source order direction horder.symm hall

/-- Complete orbit: two named source orders and both orientations. -/
def convexFivePointClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.map fun direction => convexFivePointClause order direction

theorem convexFivePointClauses_length :
    convexFivePointClauses.length = 4 := by
  native_decide

theorem sourceAssign_convexFivePointClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ convexFivePointClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [convexFivePointClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_convexFivePointClause source order direction

/-- Lean-owned successor root after both fifteenth-model theorem-bank hits. -/
def extendedFifthConvexFivePointCnf : Std.Sat.CNF Atom :=
  extendedThirdCancellationCnf ++ convexFivePointClauses

theorem extendedFifthConvexFivePointCnf_clause_count :
    extendedFifthConvexFivePointCnf.length = 5846112 := by
  simp [extendedFifthConvexFivePointCnf,
    extendedThirdCancellationCnf_clause_count,
    convexFivePointClauses_length]

/-- Gate B for the child containing both fifteenth-model refinements. -/
theorem sourceAssign_extendedFifthConvexFivePointCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFifthConvexFivePointCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFifthConvexFivePointCnf, List.mem_append] at hclause
  rcases hclause with hold | hnew
  · have h := sourceAssign_extendedThirdCancellationCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hold
  · exact sourceAssign_convexFivePointClauses source clause hnew

/-- Certificate-to-source landing contract for the successor child. -/
theorem false_of_sourceRealization_of_extendedFifthConvexFivePointCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFifthConvexFivePointCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedFifthConvexFivePointCnf source⟩

#print axioms sourceAssign_convexFivePointClause
#print axioms sourceAssign_extendedFifthConvexFivePointCnf

end ATailBlockerVExactSeventeenConvexFivePointFifthRows
end Problem97

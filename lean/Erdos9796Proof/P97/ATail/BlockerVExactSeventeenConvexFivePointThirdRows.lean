/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenGenericCancellationSecond
import Erdos9796Proof.P97.Census554.ConvexFivePointCore

/-!
# Three-row convex five-point clause for exact seventeen

The terminal SAT model of the second generic-cancellation child contains a
five-point metric obstruction supported by only three selected rows.  This
module banks the complete two-order, two-orientation orbit and extends the
Lean-owned CNF by four clauses.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenConvexFivePointThirdRows

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenGenericCancellationSecond
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

/-- The three positive rows supporting the increasing-boundary five-point
core. -/
def forwardChoices : List (RowChoice Label) :=
  [{ center := 10, support := {5, 16} },
    { center := 2, support := {5, 16} },
    { center := 4, support := {2, 5, 10} }]

/-- Reflection of the three positive rows. -/
def reverseChoices : List (RowChoice Label) :=
  [{ center := 6, support := {0, 11} },
    { center := 14, support := {0, 11} },
    { center := 12, support := {6, 11, 14} }]

/-- The seven positive incidences serialized into one guarded clause. -/
def forwardHits : List Hit :=
  [(10, 5), (10, 16), (2, 5), (2, 16),
    (4, 2), (4, 5), (4, 10)]

/-- Transport the positional motif into one named source order and reflected
placement. -/
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
  { a := 16
    x := 10
    b := 5
    c := 4
    y := 2
    hab := by decide
    hxy := by decide
    xa_xb := EdgeClosure.row 10 16 5
      (hrows ({ center := 10, support := {5, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 10, support := {5, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
    ya_yb := EdgeClosure.row 2 16 5
      (hrows ({ center := 2, support := {5, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 2, support := {5, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cx := EdgeClosure.row 4 5 10
      (hrows ({ center := 4, support := {2, 5, 10} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 4, support := {2, 5, 10} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cy := EdgeClosure.row 4 5 2
      (hrows ({ center := 4, support := {2, 5, 10} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 4, support := {2, 5, 10} } : RowChoice Label)
        (by native_decide) (by native_decide)) }

private def reverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P reverseChoices) :
    Census554.ConvexFivePointCore.Core P :=
  { a := 0
    x := 6
    b := 11
    c := 12
    y := 14
    hab := by decide
    hxy := by decide
    xa_xb := EdgeClosure.row 6 0 11
      (hrows ({ center := 6, support := {0, 11} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 6, support := {0, 11} } : RowChoice Label)
        (by native_decide) (by native_decide))
    ya_yb := EdgeClosure.row 14 0 11
      (hrows ({ center := 14, support := {0, 11} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 14, support := {0, 11} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cx := EdgeClosure.row 12 11 6
      (hrows ({ center := 12, support := {6, 11, 14} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 12, support := {6, 11, 14} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cy := EdgeClosure.row 12 11 14
      (hrows ({ center := 12, support := {6, 11, 14} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 12, support := {6, 11, 14} } : RowChoice Label)
        (by native_decide) (by native_decide)) }

private theorem signedArea2_swap13 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 c b a := by
  simp only [signedArea2]
  ring

private theorem false_of_forwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P forwardChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core hreal (forwardCore hrows)
  · change 0 < signedArea2 (pointOf 16) (pointOf 10) (pointOf 5)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (5 : Label)) (j := (10 : Label)) (k := (16 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 5) (pointOf 4) (pointOf 2)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (4 : Label)) (k := (5 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_reverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P reverseChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core_of_neg hreal
    (reverseCore hrows)
  · change signedArea2 (pointOf 0) (pointOf 6) (pointOf 11) < 0
    exact hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (6 : Label)) (k := (11 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 11) (pointOf 12) (pointOf 14) < 0
    exact hneg_of_ccw hreal.injective hccw
      (i := (11 : Label)) (j := (12 : Label)) (k := (14 : Label))
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

/-- One three-row five-point clause for a named source order and reflected
placement. -/
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

/-- Complete orbit: two named source orders and both reflections. -/
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

/-- Lean-owned successor root after the three-row five-point orbit. -/
def extendedConvexFivePointCnf : Std.Sat.CNF Atom :=
  extendedSecondCancellationCnf ++ convexFivePointClauses

theorem extendedConvexFivePointCnf_clause_count :
    extendedConvexFivePointCnf.length = 5846088 := by
  simp [extendedConvexFivePointCnf,
    extendedSecondCancellationCnf_clause_count,
    convexFivePointClauses_length]

/-- Gate B for the three-row five-point child root. -/
theorem sourceAssign_extendedConvexFivePointCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedConvexFivePointCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedConvexFivePointCnf, List.mem_append] at hclause
  rcases hclause with hold | hnew
  · have h := sourceAssign_extendedSecondCancellationCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hold
  · exact sourceAssign_convexFivePointClauses source clause hnew

/-- Certificate-to-source landing contract for the third-row five-point child
root. -/
theorem false_of_sourceRealization_of_extendedConvexFivePointCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedConvexFivePointCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model, sourceAssign_extendedConvexFivePointCnf source⟩

#print axioms sourceAssign_convexFivePointClause
#print axioms sourceAssign_extendedConvexFivePointCnf

end ATailBlockerVExactSeventeenConvexFivePointThirdRows
end Problem97

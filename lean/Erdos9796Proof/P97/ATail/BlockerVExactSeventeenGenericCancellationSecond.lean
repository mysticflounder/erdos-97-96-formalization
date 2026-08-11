/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation

/-!
# Second generic two-Kalmanson cancellation clause for exact seventeen

The terminal SAT model of the first generic-cancellation child contains a
different exact instance of the same cardinality-independent cancellation
consumer.  This module banks its complete two-order, two-orientation orbit and
extends the Lean-owned CNF by four clauses.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenGenericCancellationSecond

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

/-- The three positive rows used by the second cancellation certificate in
increasing boundary coordinates. -/
def forwardChoices : List (RowChoice Label) :=
  [{ center := 3, support := {2, 13} },
    { center := 8, support := {0, 13} },
    { center := 11, support := {0, 2} }]

/-- Reflection of the three positive rows. -/
def reverseChoices : List (RowChoice Label) :=
  [{ center := 5, support := {14, 16} },
    { center := 8, support := {3, 16} },
    { center := 13, support := {3, 14} }]

/-- The six positive incidences serialized into one guarded clause. -/
def forwardHits : List Hit :=
  [(3, 2), (3, 13), (8, 0), (8, 13), (11, 0), (11, 2)]

/-- Transport the second positional motif into one named source order and one
reflected placement. -/
def secondCancellationHits (order : NamedOrder) (direction : Orientation) :
    List Hit :=
  forwardHits.map fun hit =>
    (orientedLabelAtPosition order direction hit.1,
      orientedLabelAtPosition order direction hit.2)

/-- Checked increasing-order cancellation certificate from the terminal SAT
record. -/
def forwardData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨0, 2, 3, 11⟩
  firstForm := .innerOuter
  secondQuad := ⟨0, 3, 8, 13⟩
  secondForm := .adjacentSides
  permutation := ⟨3, 1, 0, 2⟩
  path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 13], (3, 13)⟩
  path1 := ⟨(0, 11),
    [.flip 0 11, .row 11 0 2, .flip 11 2], (2, 11)⟩
  path2 := ⟨(0, 3), [], (0, 3)⟩
  path3 := ⟨(8, 13), [.row 8 13 0, .flip 8 0], (0, 8)⟩ }

/-- Independently checked certificate for the reflected rows. -/
def reverseData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨3, 8, 13, 14⟩
  firstForm := .adjacentSides
  secondQuad := ⟨5, 8, 14, 16⟩
  secondForm := .innerOuter
  permutation := ⟨3, 0, 1, 2⟩
  path0 := ⟨(3, 8), [.flip 3 8, .row 8 3 16], (8, 16)⟩
  path1 := ⟨(13, 14), [.row 13 14 3, .flip 13 3], (3, 13)⟩
  path2 := ⟨(8, 14), [], (8, 14)⟩
  path3 := ⟨(5, 16), [.row 5 16 14], (5, 14)⟩ }

theorem forwardData_check : forwardData.check forwardChoices = true := by
  native_decide

theorem reverseData_check : reverseData.check reverseChoices = true := by
  native_decide

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
    (hall : ∀ hit ∈ secondCancellationHits order direction,
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
      simp only [secondCancellationHits, List.mem_map]
      exact ⟨(choice.center, point),
        forwardHit_of_choice choice hchoice point hpoint, rfl⟩)

private theorem positiveRowsMatch_reverse {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hne : source.orientation ≠ direction)
    (hall : ∀ hit ∈ secondCancellationHits order direction,
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
      simp only [secondCancellationHits, List.mem_map]
      exact ⟨(Fin.rev choice.center, Fin.rev point),
        reflectedForwardHit_of_choice choice hchoice point hpoint, rfl⟩)

private theorem false_of_secondCancellationHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ secondCancellationHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_twoKalmansonCancellationData_of_check
      source.carrier_convexIndep source.boundary_image source.boundary_ccw
      hreal forwardChoices
      (positiveRowsMatch_forward source source.model.order direction rfl hsame hall)
      forwardData forwardData_check
  · exact false_of_twoKalmansonCancellationData_of_check
      source.carrier_convexIndep source.boundary_image source.boundary_ccw
      hreal reverseChoices
      (positiveRowsMatch_reverse source source.model.order direction rfl hsame hall)
      reverseData reverseData_check

/-- One second-cancellation clause for a named source order and reflected
placement. -/
def secondCancellationClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom :=
  nogoodClause order (secondCancellationHits order direction)

theorem sourceAssign_secondCancellationClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (secondCancellationClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_secondCancellationHits source order direction horder.symm hall

/-- Complete orbit: two named source orders and both reflections. -/
def secondCancellationClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.map fun direction => secondCancellationClause order direction

theorem secondCancellationClauses_length :
    secondCancellationClauses.length = 4 := by
  native_decide

theorem sourceAssign_secondCancellationClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ secondCancellationClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [secondCancellationClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_secondCancellationClause source order direction

/-- Lean-owned successor root after the second cancellation orbit. -/
def extendedSecondCancellationCnf : Std.Sat.CNF Atom :=
  extendedGenericCancellationCnf ++ secondCancellationClauses

theorem extendedSecondCancellationCnf_clause_count :
    extendedSecondCancellationCnf.length = 5846084 := by
  simp [extendedSecondCancellationCnf,
    extendedGenericCancellationCnf_clause_count,
    secondCancellationClauses_length]

/-- Gate B for the second generic-cancellation child root. -/
theorem sourceAssign_extendedSecondCancellationCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedSecondCancellationCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedSecondCancellationCnf, List.mem_append] at hclause
  rcases hclause with hold | hnew
  · have h := sourceAssign_extendedGenericCancellationCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hold
  · exact sourceAssign_secondCancellationClauses source clause hnew

/-- Certificate-to-source landing contract for the second child root. -/
theorem false_of_sourceRealization_of_extendedSecondCancellationCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedSecondCancellationCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model, sourceAssign_extendedSecondCancellationCnf source⟩

#print axioms sourceAssign_secondCancellationClause
#print axioms sourceAssign_extendedSecondCancellationCnf
#print axioms false_of_sourceRealization_of_extendedSecondCancellationCnf_unsat

end ATailBlockerVExactSeventeenGenericCancellationSecond
end Problem97

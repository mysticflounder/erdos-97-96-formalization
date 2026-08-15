/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFourRowTwoCircleBisector

/-!
# Third generic two-Kalmanson cancellation clause for exact seventeen

The terminal SAT model preceding the four-row two-circle refinement contains
another instance of the cardinality-independent two-Kalmanson cancellation
consumer.  This module records only the twelve positive row incidences used by
the checked equality paths, banks independent forward and reflected
certificates, and extends the Lean-owned CNF by the complete four-clause orbit.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenGenericCancellationThird

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenConvexFivePointFourthRows
open ATailBlockerVExactSeventeenFourPointTwoCircleBisectorRows
open ATailBlockerVExactSeventeenFourRowTwoCircleBisector
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

/-- The positive rows traversed by the forward equality certificate. -/
def forwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {11, 12, 14} },
    { center := 2, support := {1, 11, 15} },
    { center := 11, support := {0, 2} },
    { center := 12, support := {0, 15} },
    { center := 14, support := {0, 1} }]

/-- Reflection of the positive rows traversed by the forward certificate. -/
def reverseChoices : List (RowChoice Label) :=
  [{ center := 2, support := {15, 16} },
    { center := 4, support := {1, 16} },
    { center := 5, support := {14, 16} },
    { center := 14, support := {1, 5, 15} },
    { center := 16, support := {2, 4, 5} }]

/-- The twelve positive incidences serialized into one guarded clause. -/
def forwardHits : List Hit :=
  [(0, 11), (0, 12), (0, 14),
    (2, 1), (2, 11), (2, 15),
    (11, 0), (11, 2),
    (12, 0), (12, 15),
    (14, 0), (14, 1)]

/-- Transport the positional motif into one named source order and one
reflected placement. -/
def thirdCancellationHits (order : NamedOrder) (direction : Orientation) :
    List Hit :=
  forwardHits.map fun hit =>
    (orientedLabelAtPosition order direction hit.1,
      orientedLabelAtPosition order direction hit.2)

/-- Checked increasing-order cancellation certificate. -/
def forwardData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨0, 1, 2, 14⟩
  firstForm := .innerOuter
  secondQuad := ⟨0, 2, 12, 15⟩
  secondForm := .adjacentSides
  permutation := ⟨1, 2, 0, 3⟩
  path0 := ⟨(1, 2),
    [.flip 1 2,
      .row 2 1 11,
      .flip 2 11,
      .row 11 2 0,
      .flip 11 0,
      .row 0 11 14,
      .flip 0 14,
      .row 14 0 1,
      .flip 14 1],
    (1, 14)⟩
  path1 := ⟨(0, 14), [.row 0 14 12], (0, 12)⟩
  path2 := ⟨(0, 2), [], (0, 2)⟩
  path3 := ⟨(12, 15),
    [.row 12 15 0,
      .flip 12 0,
      .row 0 12 11,
      .flip 0 11,
      .row 11 0 2,
      .flip 11 2,
      .row 2 11 15],
    (2, 15)⟩ }

/-- Independently generated and checked reflected cancellation certificate. -/
def reverseData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨1, 4, 14, 15⟩
  firstForm := .adjacentSides
  secondQuad := ⟨2, 4, 15, 16⟩
  secondForm := .innerOuter
  permutation := ⟨0, 2, 1, 3⟩
  path0 := ⟨(1, 4),
    [.flip 1 4,
      .row 4 1 16,
      .flip 4 16,
      .row 16 4 5,
      .flip 16 5,
      .row 5 16 14,
      .flip 5 14,
      .row 14 5 1,
      .flip 14 1],
    (1, 14)⟩
  path1 := ⟨(14, 15),
    [.row 14 15 5,
      .flip 14 5,
      .row 5 14 16,
      .flip 5 16,
      .row 16 5 2,
      .flip 16 2,
      .row 2 16 15],
    (2, 15)⟩
  path2 := ⟨(4, 15), [], (4, 15)⟩
  path3 := ⟨(2, 16),
    [.flip 2 16, .row 16 2 4, .flip 16 4],
    (4, 16)⟩ }

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
    (hall : ∀ hit ∈ thirdCancellationHits order direction,
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
      simp only [thirdCancellationHits, List.mem_map]
      exact ⟨(choice.center, point),
        forwardHit_of_choice choice hchoice point hpoint, rfl⟩)

private theorem positiveRowsMatch_reverse {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hne : source.orientation ≠ direction)
    (hall : ∀ hit ∈ thirdCancellationHits order direction,
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
      simp only [thirdCancellationHits, List.mem_map]
      exact ⟨(Fin.rev choice.center, Fin.rev point),
        reflectedForwardHit_of_choice choice hchoice point hpoint, rfl⟩)

private theorem false_of_thirdCancellationHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ thirdCancellationHits order direction,
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

/-- One third-cancellation clause for a named source order and reflected
placement. -/
def thirdCancellationClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom :=
  nogoodClause order (thirdCancellationHits order direction)

theorem sourceAssign_thirdCancellationClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (thirdCancellationClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_thirdCancellationHits source order direction horder.symm hall

/-- Complete orbit: two named source orders and both reflections. -/
def thirdCancellationClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.map fun direction => thirdCancellationClause order direction

theorem thirdCancellationClauses_length :
    thirdCancellationClauses.length = 4 := by
  native_decide

theorem sourceAssign_thirdCancellationClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ thirdCancellationClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [thirdCancellationClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_thirdCancellationClause source order direction

/-- Lean-owned successor root after the third cancellation orbit. -/
def extendedThirdCancellationCnf : Std.Sat.CNF Atom :=
  extendedFourRowBisectorCnf ++ thirdCancellationClauses

theorem extendedThirdCancellationCnf_clause_count :
    extendedThirdCancellationCnf.length = 5846108 := by
  simp [extendedThirdCancellationCnf,
    extendedFourRowBisectorCnf_clause_count,
    thirdCancellationClauses_length]

/-- Gate B for the third generic-cancellation successor root. -/
theorem sourceAssign_extendedThirdCancellationCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedThirdCancellationCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedThirdCancellationCnf, List.mem_append] at hclause
  rcases hclause with hold | hnew
  · have h := sourceAssign_extendedFourRowBisectorCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hold
  · exact sourceAssign_thirdCancellationClauses source clause hnew

/-- Certificate-to-source landing contract for the third cancellation child. -/
theorem false_of_sourceRealization_of_extendedThirdCancellationCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedThirdCancellationCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model, sourceAssign_extendedThirdCancellationCnf source⟩

#print axioms sourceAssign_thirdCancellationClause
#print axioms sourceAssign_extendedThirdCancellationCnf
#print axioms false_of_sourceRealization_of_extendedThirdCancellationCnf_unsat

end ATailBlockerVExactSeventeenGenericCancellationThird
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSeventeenthModelRefinements

/-!
# Source-backed refinement from the eighteenth exact-seventeen SAT model

The authenticated eighteenth Lean-owned child is satisfiable. Its mandatory
theorem-bank scan found seventeen exact occurrences. This file banks a
cardinality-independent two-Kalmanson cancellation occurrence using only the
ten positive selected-row incidences traversed by its checked equality paths.
Both cyclic orientations and both named source orders are covered.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenEighteenthModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenConvexFivePointFifthRows
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

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

def cancellationForwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {11, 15} },
    { center := 15, support := {1, 12} },
    { center := 12, support := {0, 15} },
    { center := 0, support := {11, 12} },
    { center := 14, support := {0, 1} }]

def cancellationReverseChoices : List (RowChoice Label) :=
  [{ center := 15, support := {1, 5} },
    { center := 1, support := {4, 15} },
    { center := 4, support := {1, 16} },
    { center := 16, support := {4, 5} },
    { center := 2, support := {15, 16} }]

def cancellationHits : List Hit :=
  [(1, 11), (1, 15), (15, 1), (15, 12), (12, 0),
    (12, 15), (0, 11), (0, 12), (14, 0), (14, 1)]

theorem cancellationForwardCover :
    ∀ choice ∈ cancellationForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ cancellationHits := by
  native_decide

theorem cancellationReverseCover :
    ∀ choice ∈ cancellationReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ cancellationHits := by
  native_decide

def cancellationForwardData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨0, 1, 11, 12⟩
  firstForm := .innerOuter
  secondQuad := ⟨0, 1, 12, 14⟩
  secondForm := .innerOuter
  permutation := ⟨0, 2, 1, 3⟩
  path0 := ⟨(1, 11),
    [.row 1 11 15, .flip 1 15, .row 15 1 12, .flip 15 12,
      .row 12 15 0, .flip 12 0, .row 0 12 11],
    (0, 11)⟩
  path1 := ⟨(0, 12), [], (0, 12)⟩
  path2 := ⟨(1, 12), [], (1, 12)⟩
  path3 := ⟨(0, 14), [.flip 0 14, .row 14 0 1, .flip 14 1], (1, 14)⟩ }

def cancellationReverseData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨4, 5, 15, 16⟩
  firstForm := .innerOuter
  secondQuad := ⟨2, 4, 15, 16⟩
  secondForm := .innerOuter
  permutation := ⟨1, 3, 0, 2⟩
  path0 := ⟨(5, 15),
    [.flip 5 15, .row 15 5 1, .flip 15 1, .row 1 15 4,
      .flip 1 4, .row 4 1 16, .flip 4 16, .row 16 4 5, .flip 16 5],
    (5, 16)⟩
  path1 := ⟨(4, 16), [], (4, 16)⟩
  path2 := ⟨(4, 15), [], (4, 15)⟩
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
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame cancellationHits
        cancellationForwardChoices cancellationForwardCover hall)
      cancellationForwardData cancellationForwardData_check
  · exact false_of_twoKalmansonCancellationData_of_check
      source.carrier_convexIndep source.boundary_image source.boundary_ccw
      hreal cancellationReverseChoices
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame cancellationHits
        cancellationReverseChoices cancellationReverseCover hall)
      cancellationReverseData cancellationReverseData_check

theorem sourceAssign_cancellationClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (priorOccurrenceClause cancellationHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_cancellationHits source order direction horder.symm hall

def eighteenthModelRefinementClauses : Std.Sat.CNF Atom :=
  priorOccurrenceClauses cancellationHits

theorem eighteenthModelRefinementClauses_length :
    eighteenthModelRefinementClauses.length = 4 := by
  native_decide

theorem sourceAssign_eighteenthModelRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ eighteenthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [eighteenthModelRefinementClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationClause source order direction

def extendedEighteenthModelRefinementsCnf : Std.Sat.CNF Atom :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.extendedSeventeenthModelRefinementsCnf ++
    eighteenthModelRefinementClauses

theorem extendedEighteenthModelRefinementsCnf_length :
    extendedEighteenthModelRefinementsCnf.length = 5846164 := by
  native_decide

theorem sourceAssign_extendedEighteenthModelRefinementsCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedEighteenthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedEighteenthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h :=
      ATailBlockerVExactSeventeenSeventeenthModelRefinements.sourceAssign_extendedSeventeenthModelRefinementsCnf
        source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_eighteenthModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedEighteenthModelRefinementsCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedEighteenthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedEighteenthModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedEighteenthModelRefinementsCnf

end ATailBlockerVExactSeventeenEighteenthModelRefinements
end Problem97

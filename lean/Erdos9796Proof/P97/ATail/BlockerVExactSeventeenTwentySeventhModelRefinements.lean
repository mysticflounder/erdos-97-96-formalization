/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenTwentySixthModelRefinements

/-!
# Source-backed refinement from the twenty-seventh exact-seventeen SAT model

The authenticated model supplies one new occurrence of the already banked
two-Kalmanson cancellation obstruction.  The occurrence is proved impossible
for every source realization in both orientations before its four
order/orientation clauses are appended to the successor CNF.
The reverse witness is checked independently rather than inferred by symmetry.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenTwentySeventhModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenTwentySixthModelRefinements
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

/- ## Two-Kalmanson cancellation occurrence -/

def cancellationForwardChoices : List (RowChoice Label) :=
  [{ center := 2, support := {1, 12} },
    { center := 0, support := {8, 2} },
    { center := 0, support := {2, 5} },
    { center := 5, support := {12, 10} },
    { center := 10, support := {5, 1} },
    { center := 1, support := {10, 8} }]

def cancellationReverseChoices : List (RowChoice Label) :=
  [{ center := 14, support := {15, 4} },
    { center := 16, support := {8, 14} },
    { center := 16, support := {14, 11} },
    { center := 11, support := {4, 6} },
    { center := 6, support := {11, 15} },
    { center := 15, support := {6, 8} }]

def cancellationHits : List Hit :=
  [(2, 1), (2, 12), (0, 8), (0, 2), (0, 5),
    (5, 12), (5, 10), (10, 5), (10, 1), (1, 10), (1, 8)]

theorem cancellationForwardCover :
    ∀ choice ∈ cancellationForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ cancellationHits := by
  native_decide

theorem cancellationReverseCover :
    ∀ choice ∈ cancellationReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ cancellationHits := by
  native_decide

def cancellationForwardData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨0, 1, 2, 8⟩
  firstForm := .innerOuter
  secondQuad := ⟨0, 2, 5, 12⟩
  secondForm := .adjacentSides
  permutation := ⟨3, 0, 2, 1⟩
  path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 12], (2, 12)⟩
  path1 := ⟨(0, 8), [.row 0 8 2], (0, 2)⟩
  path2 := ⟨(0, 2), [.row 0 2 5], (0, 5)⟩
  path3 := ⟨(5, 12),
    [.row 5 12 10, .flip 5 10, .row 10 5 1, .flip 10 1,
      .row 1 10 8],
    (1, 8)⟩ }

def cancellationReverseData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨4, 11, 14, 15⟩
  firstForm := .adjacentSides
  secondQuad := ⟨8, 11, 15, 16⟩
  secondForm := .innerOuter
  permutation := ⟨2, 0, 1, 3⟩
  path0 := ⟨(4, 11),
    [.flip 4 11, .row 11 4 6, .flip 11 6, .row 6 11 15,
      .flip 6 15, .row 15 6 8, .flip 15 8],
    (8, 15)⟩
  path1 := ⟨(14, 15), [.row 14 15 4, .flip 14 4], (4, 14)⟩
  path2 := ⟨(11, 15), [], (11, 15)⟩
  path3 := ⟨(8, 16),
    [.flip 8 16, .row 16 8 14, .row 16 14 11, .flip 16 11],
    (11, 16)⟩ }

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

/- ## Complete one-family suffix and successor CNF -/

def twentySeventhOccurrenceHits : List (List Hit) :=
  [cancellationHits]

def twentySeventhModelRefinementClauses : Std.Sat.CNF Atom :=
  twentySeventhOccurrenceHits.flatMap priorOccurrenceClauses

theorem twentySeventhModelRefinementClauses_length :
    twentySeventhModelRefinementClauses.length = 4 := by
  native_decide

theorem sourceAssign_twentySeventhModelRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ twentySeventhModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [twentySeventhModelRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨hits, hhits, hclause⟩
  simp only [twentySeventhOccurrenceHits, List.mem_cons, List.not_mem_nil,
    or_false] at hhits
  subst hits
  simp only [priorOccurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationClause source order direction

def extendedTwentySeventhModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedTwentySixthModelRefinementsCnf ++
    twentySeventhModelRefinementClauses

theorem extendedTwentySeventhModelRefinementsCnf_length :
    extendedTwentySeventhModelRefinementsCnf.length = 5846288 := by
  native_decide

theorem sourceAssign_extendedTwentySeventhModelRefinementsCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedTwentySeventhModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedTwentySeventhModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedTwentySixthModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_twentySeventhModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedTwentySeventhModelRefinementsCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedTwentySeventhModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedTwentySeventhModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedTwentySeventhModelRefinementsCnf

end ATailBlockerVExactSeventeenTwentySeventhModelRefinements
end Problem97

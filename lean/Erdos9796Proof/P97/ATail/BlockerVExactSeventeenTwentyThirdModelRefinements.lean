/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenTwentySecondModelRefinements

/-!
# Source-backed refinement from the twenty-third exact-seventeen SAT model

The authenticated model supplies one new occurrence of the already banked
two-Kalmanson cancellation obstruction.  The occurrence is proved impossible
for every source realization in both orientations before its four
order/orientation clauses are appended to the successor CNF.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenTwentyThirdModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenTwentySecondModelRefinements
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
  [{ center := 2, support := {3, 4} },
    { center := 0, support := {4, 7} },
    { center := 9, support := {7, 3} }]

def cancellationReverseChoices : List (RowChoice Label) :=
  [{ center := 14, support := {13, 12} },
    { center := 16, support := {12, 9} },
    { center := 7, support := {9, 13} }]

def cancellationHits : List Hit :=
  [(2, 3), (2, 4), (0, 4), (0, 7), (9, 7), (9, 3)]

theorem cancellationForwardCover :
    ∀ choice ∈ cancellationForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ cancellationHits := by
  native_decide

theorem cancellationReverseCover :
    ∀ choice ∈ cancellationReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ cancellationHits := by
  native_decide

def cancellationForwardData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨0, 2, 3, 4⟩
  firstForm := .innerOuter
  secondQuad := ⟨0, 3, 7, 9⟩
  secondForm := .adjacentSides
  permutation := ⟨1, 2, 0, 3⟩
  path0 := ⟨(2, 3), [.row 2 3 4], (2, 4)⟩
  path1 := ⟨(0, 4), [.row 0 4 7], (0, 7)⟩
  path2 := ⟨(0, 3), [], (0, 3)⟩
  path3 := ⟨(7, 9), [.flip 7 9, .row 9 7 3, .flip 9 3], (3, 9)⟩ }

def cancellationReverseData : TwoKalmansonCancellationData Label := {
  firstQuad := ⟨12, 13, 14, 16⟩
  firstForm := .innerOuter
  secondQuad := ⟨7, 9, 13, 16⟩
  secondForm := .adjacentSides
  permutation := ⟨0, 3, 2, 1⟩
  path0 := ⟨(13, 14), [.flip 13 14, .row 14 13 12, .flip 14 12], (12, 14)⟩
  path1 := ⟨(12, 16), [.flip 12 16, .row 16 12 9, .flip 16 9], (9, 16)⟩
  path2 := ⟨(7, 9), [.row 7 9 13], (7, 13)⟩
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

theorem sourceAssign_cancellationClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (priorOccurrenceClause cancellationHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_cancellationHits source order direction horder.symm hall

/- ## Complete one-family suffix and successor CNF -/

def twentyThirdOccurrenceHits : List (List Hit) :=
  [cancellationHits]

def twentyThirdModelRefinementClauses : Std.Sat.CNF Atom :=
  twentyThirdOccurrenceHits.flatMap priorOccurrenceClauses

theorem twentyThirdModelRefinementClauses_length :
    twentyThirdModelRefinementClauses.length = 4 := by
  native_decide

theorem sourceAssign_twentyThirdModelRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ twentyThirdModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [twentyThirdModelRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨hits, hhits, hclause⟩
  simp only [twentyThirdOccurrenceHits, List.mem_cons, List.not_mem_nil,
    or_false] at hhits
  subst hits
  simp only [priorOccurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationClause source order direction

def extendedTwentyThirdModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedTwentySecondModelRefinementsCnf ++
    twentyThirdModelRefinementClauses

theorem extendedTwentyThirdModelRefinementsCnf_length :
    extendedTwentyThirdModelRefinementsCnf.length = 5846232 := by
  native_decide

theorem sourceAssign_extendedTwentyThirdModelRefinementsCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedTwentyThirdModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedTwentyThirdModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedTwentySecondModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_twentyThirdModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedTwentyThirdModelRefinementsCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedTwentyThirdModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedTwentyThirdModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedTwentyThirdModelRefinementsCnf

end ATailBlockerVExactSeventeenTwentyThirdModelRefinements
end Problem97

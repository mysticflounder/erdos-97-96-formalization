/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyThirdModelRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenTwentyEighthModelRefinements
import Erdos9796Proof.P97.ListCNF

/-! Child44 canonical next-center-15 cancellation suffix. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyFourthModelRefinements
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenFortyThirdModelRefinements
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

/-- Finite V-exact-seventeen model-refinement abbrev. -/
private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

/-- Finite V-exact-seventeen model-refinement def. -/
def cancellationOccurrence : CancellationOccurrence :=
  { hits := [(0, 5), (0, 8), (2, 1), (2, 12), (5, 0), (5, 8),
      (8, 5), (8, 12), (11, 0), (11, 1)]
    forwardChoices := [{ center := 2, support := {1, 12} },
      { center := 11, support := {0, 1} },
      { center := 8, support := {5, 12} },
      { center := 5, support := {0, 8} },
      { center := 0, support := {5, 8} }]
    reverseChoices := [{ center := 14, support := {4, 15} },
      { center := 5, support := {15, 16} },
      { center := 8, support := {4, 11} },
      { center := 11, support := {8, 16} },
      { center := 16, support := {8, 11} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 8, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 12], (2, 12)⟩
      path1 := ⟨(0, 11), [.flip 0 11, .row 11 0 1, .flip 11 1], (1, 11)⟩
      path2 := ⟨(0, 2), [], (0, 2)⟩
      path3 := ⟨(8, 12), [.row 8 12 5, .flip 8 5,
        .row 5 8 0, .flip 5 0, .row 0 5 8], (0, 8)⟩ }
    reverseData := {
      firstQuad := ⟨5, 14, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 8, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(14, 15), [.flip 14 15, .flip 15 14,
        .row 14 15 4, .flip 14 4], (4, 14)⟩
      path1 := ⟨(5, 16), [.flip 5 16, .flip 16 5,
        .row 5 16 15, .flip 5 15, .flip 15 5], (5, 15)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 11, .flip 8 11,
        .row 11 8 16, .flip 11 16, .row 16 11 8, .flip 16 8], (8, 16)⟩
      path3 := ⟨(14, 16), [], (14, 16)⟩ } }

/-- Finite V-exact-seventeen model-refinement theorem. -/
theorem cancellationOccurrence_check :
    cancellationOccurrence.check = true := by
  native_decide

/-- Finite V-exact-seventeen model-refinement def. -/
def fortyFourthModelRefinementClauses : ListCNF Atom :=
  occurrenceClauses cancellationOccurrence.hits

/-- Finite V-exact-seventeen model-refinement theorem. -/
theorem fortyFourthModelRefinementClauses_length :
    fortyFourthModelRefinementClauses.length = 4 := by
  native_decide

/-- Finite V-exact-seventeen model-refinement theorem. -/
theorem sourceAssign_fortyFourthModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyFourthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortyFourthModelRefinementClauses, occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source cancellationOccurrence
    cancellationOccurrence_check order direction

/-- Finite V-exact-seventeen model-refinement def. -/
def extendedFortyFourthModelRefinementsCnf : ListCNF Atom :=
  extendedFortyThirdModelRefinementsCnf ++ fortyFourthModelRefinementClauses

/-- Finite V-exact-seventeen model-refinement theorem. -/
theorem extendedFortyFourthModelRefinementsCnf_length :
    extendedFortyFourthModelRefinementsCnf.length = 5848824 := by
  simp only [extendedFortyFourthModelRefinementsCnf, List.length_append,
    extendedFortyThirdModelRefinementsCnf_length,
    fortyFourthModelRefinementClauses_length]

/-- Finite V-exact-seventeen model-refinement theorem. -/
theorem sourceAssign_extendedFortyFourthModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ListCNF.eval (sourceAssign source.model)
      extendedFortyFourthModelRefinementsCnf = true := by
  rw [ListCNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyFourthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedFortyThirdModelRefinementsCnf source
    rw [ListCNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyFourthModelRefinementClauses source clause hsuffix

/-- Finite V-exact-seventeen model-refinement theorem. -/
theorem false_of_sourceRealization_of_extendedFortyFourthModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      ListCNF.eval assignment extendedFortyFourthModelRefinementsCnf = true) :
    False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyFourthModelRefinementsCnf source⟩

#print axioms cancellationOccurrence_check
#print axioms sourceAssign_fortyFourthModelRefinementClauses
#print axioms sourceAssign_extendedFortyFourthModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedFortyFourthModelRefinementsCnf_unsat
end ATailBlockerVExactSeventeenFortyFourthModelRefinements
end Problem97

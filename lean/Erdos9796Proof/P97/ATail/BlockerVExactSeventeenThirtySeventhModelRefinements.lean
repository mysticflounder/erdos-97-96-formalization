/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtySixthModelRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenTwentyEighthModelRefinements

/-!
# Source-valid refinements mined from exact-seventeen child 37

The authenticated child-37 SAT model contains two six-incidence
two-Kalmanson cancellations.  Each occurrence supplies the complete
two-order, two-orientation orbit, so this child contributes eight clauses.

The source theorem is cardinality-independent; exact seventeen is only the
finite root in which the occurrences were discovered.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtySeventhModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenThirtySixthModelRefinements
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

/-- The two source-valid cancellation occurrences in the child-37 model. -/
def child37CancellationOccurrences : List CancellationOccurrence := [
  { hits := [(0, 1), (0, 6), (10, 1), (10, 3), (15, 3), (15, 6)]
    forwardChoices := [{ center := 0, support := {1, 6} },
        { center := 10, support := {1, 3} },
        { center := 15, support := {3, 6} }]
    reverseChoices := [{ center := 1, support := {10, 13} },
        { center := 6, support := {13, 15} },
        { center := 16, support := {10, 15} }]
    forwardData := {
      firstQuad := ⟨0, 1, 6, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 10, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 1), [.row 0 1 6], (0, 6)⟩
      path1 := ⟨(6, 15), [.flip 6 15, .row 15 6 3, .flip 15 3], (3, 15)⟩
      path2 := ⟨(3, 10), [.flip 3 10, .row 10 3 1, .flip 10 1], (1, 10)⟩
      path3 := ⟨(1, 15), [], (1, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 10, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 13, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 10), [.row 1 10 13], (1, 13)⟩
      path1 := ⟨(13, 16), [], (13, 16)⟩
      path2 := ⟨(6, 13), [.row 6 13 15], (6, 15)⟩
      path3 := ⟨(15, 16), [.flip 15 16, .row 16 15 10, .flip 16 10], (10, 16)⟩ } },
  { hits := [(0, 1), (0, 5), (10, 1), (10, 3), (15, 3), (15, 5)]
    forwardChoices := [{ center := 0, support := {1, 5} },
        { center := 10, support := {1, 3} },
        { center := 15, support := {3, 5} }]
    reverseChoices := [{ center := 1, support := {11, 13} },
        { center := 6, support := {13, 15} },
        { center := 16, support := {11, 15} }]
    forwardData := {
      firstQuad := ⟨0, 1, 5, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 10, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 1), [.row 0 1 5], (0, 5)⟩
      path1 := ⟨(5, 15), [.flip 5 15, .row 15 5 3, .flip 15 3], (3, 15)⟩
      path2 := ⟨(3, 10), [.flip 3 10, .row 10 3 1, .flip 10 1], (1, 10)⟩
      path3 := ⟨(1, 15), [], (1, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 11, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 13, 15, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 11), [.row 1 11 13], (1, 13)⟩
      path1 := ⟨(13, 16), [], (13, 16)⟩
      path2 := ⟨(6, 13), [.row 6 13 15], (6, 15)⟩
      path3 := ⟨(15, 16), [.flip 15 16, .row 16 15 11, .flip 16 11], (11, 16)⟩ } }
]

theorem child37CancellationOccurrences_length :
    child37CancellationOccurrences.length = 2 := by
  native_decide

theorem child37CancellationOccurrences_all_check :
    child37CancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

/-- Complete clause orbits of the two child-37 cancellations. -/
def thirtySeventhModelRefinementClauses : Std.Sat.CNF Atom :=
  child37CancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem thirtySeventhModelRefinementClauses_length :
    thirtySeventhModelRefinementClauses.length = 8 := by
  native_decide

theorem sourceAssign_thirtySeventhModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) :
    ∀ clause ∈ thirtySeventhModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [thirtySeventhModelRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp child37CancellationOccurrences_all_check occ hocc
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

/-- Lean-owned child-38 root. -/
def extendedThirtySeventhModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedThirtySixthModelRefinementsCnf ++ thirtySeventhModelRefinementClauses

theorem extendedThirtySeventhModelRefinementsCnf_length :
    extendedThirtySeventhModelRefinementsCnf.length = 5847276 := by
  simp only [extendedThirtySeventhModelRefinementsCnf, List.length_append,
    extendedThirtySixthModelRefinementsCnf_length,
    thirtySeventhModelRefinementClauses_length]

theorem sourceAssign_extendedThirtySeventhModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedThirtySeventhModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedThirtySeventhModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedThirtySixthModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_thirtySeventhModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedThirtySeventhModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedThirtySeventhModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedThirtySeventhModelRefinementsCnf source⟩

#print axioms child37CancellationOccurrences_all_check
#print axioms sourceAssign_thirtySeventhModelRefinementClauses
#print axioms sourceAssign_extendedThirtySeventhModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedThirtySeventhModelRefinementsCnf_unsat

end ATailBlockerVExactSeventeenThirtySeventhModelRefinements
end Problem97

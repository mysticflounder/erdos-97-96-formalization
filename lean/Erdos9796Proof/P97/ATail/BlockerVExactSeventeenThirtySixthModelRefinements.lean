/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyFifthModelRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenTwentyEighthModelRefinements

/-!
# Source-valid refinement mined from exact-seventeen child 36

The authenticated child-36 SAT model contains a six-incidence
two-Kalmanson cancellation.  This is a strict support reduction of the
previous paired child-33 occurrence: the earlier source-valid clause needed
seventeen positive incidences, while the reflected cancellation certificate
below needs only the three two-point selected-row fragments already present
in the child-36 model.

The suffix contains the complete two-order, two-orientation orbit.  Its
source theorem is cardinality-independent; exact seventeen is only the
finite root in which the occurrence was discovered.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtySixthModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenThirtyFifthModelRefinements
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

/-- Six selected-row incidences supporting the child-36 cancellation. -/
def child36CancellationHits : List Hit :=
  [(0, 2), (0, 8), (10, 2), (10, 3), (9, 3), (9, 8)]

theorem child36CancellationHits_length : child36CancellationHits.length = 6 := by
  native_decide

theorem child36CancellationHits_nodup : child36CancellationHits.Nodup := by
  native_decide

/-- Checked increasing and reflected two-Kalmanson certificates for the
six-incidence child-36 occurrence. -/
def child36CancellationOccurrence : CancellationOccurrence :=
  { hits := child36CancellationHits
    forwardChoices := [
      { center := 0, support := {2, 8} },
      { center := 10, support := {2, 3} },
      { center := 9, support := {3, 8} }]
    reverseChoices := [
      { center := 16, support := {8, 14} },
      { center := 6, support := {13, 14} },
      { center := 7, support := {8, 13} }]
    forwardData := {
      firstQuad := ⟨0, 2, 3, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 3, 8, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(0, 2), [.row 0 2 8], (0, 8)⟩
      path1 := ⟨(3, 10), [.flip 3 10, .row 10 3 2, .flip 10 2], (2, 10)⟩
      path2 := ⟨(0, 3), [], (0, 3)⟩
      path3 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩ }
    reverseData := {
      firstQuad := ⟨6, 13, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 8, 13, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(6, 13), [.row 6 13 14], (6, 14)⟩
      path1 := ⟨(14, 16), [.flip 14 16, .row 16 14 8, .flip 16 8], (8, 16)⟩
      path2 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path3 := ⟨(13, 16), [], (13, 16)⟩ } }

theorem child36CancellationOccurrence_check :
    child36CancellationOccurrence.check = true := by
  native_decide

/-- Complete two-order, two-orientation clause orbit of the child-36
cancellation. -/
def thirtySixthModelRefinementClauses : Std.Sat.CNF Atom :=
  occurrenceClauses child36CancellationHits

theorem thirtySixthModelRefinementClauses_length :
    thirtySixthModelRefinementClauses.length = 4 := by
  native_decide

theorem sourceAssign_thirtySixthModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) :
    ∀ clause ∈ thirtySixthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  change ∀ clause ∈
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses
      child36CancellationHits,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true
  intro clause hclause
  simp only [ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, hclauseEq⟩ := hclause
  rw [← hclauseEq]
  exact sourceAssign_cancellationOccurrenceClause source child36CancellationOccurrence
    child36CancellationOccurrence_check order direction

/-- Lean-owned child-37 root. -/
def extendedThirtySixthModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedThirtyFifthModelRefinementsCnf ++ thirtySixthModelRefinementClauses

theorem extendedThirtySixthModelRefinementsCnf_length :
    extendedThirtySixthModelRefinementsCnf.length = 5847268 := by
  simp only [extendedThirtySixthModelRefinementsCnf, List.length_append,
    extendedThirtyFifthModelRefinementsCnf_length,
    thirtySixthModelRefinementClauses_length]

theorem sourceAssign_extendedThirtySixthModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedThirtySixthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedThirtySixthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedThirtyFifthModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_thirtySixthModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedThirtySixthModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedThirtySixthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedThirtySixthModelRefinementsCnf source⟩

#print axioms child36CancellationOccurrence_check
#print axioms sourceAssign_thirtySixthModelRefinementClauses
#print axioms sourceAssign_extendedThirtySixthModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedThirtySixthModelRefinementsCnf_unsat

end ATailBlockerVExactSeventeenThirtySixthModelRefinements
end Problem97

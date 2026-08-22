/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinements

/-!
# Source-valid survivor refinements after the canary perpendicular-bisector root

The three predecessor physical-slice models that survive the five-clause
model-refinement suffix each contain a checked two-Kalmanson cancellation.
This file banks the active order-zero forward clause from each occurrence and
appends the resulting three-clause suffix to the Lean-owned parent root.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementSurvivorRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinements

private abbrev occurrenceClause :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause

/-- Checked occurrences from the `none`, `unique-07`, and `unique-08` cells. -/
def cancellationOccurrences : List CancellationOccurrence := [
  { hits := [(10, 16), (10, 2), (16, 10), (16, 0), (15, 2), (15, 0), (2, 10), (2, 16)]
    forwardChoices := [{ center := 2, support := {10, 16} },
        { center := 10, support := {2, 16} },
        { center := 15, support := {0, 2} },
        { center := 16, support := {0, 10} }]
    reverseChoices := [{ center := 0, support := {6, 16} },
        { center := 1, support := {14, 16} },
        { center := 6, support := {0, 14} },
        { center := 14, support := {0, 6} }]
    forwardData := {
      firstQuad := ⟨0, 1, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(1, 15), [], (1, 15)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 10, .flip 16 10, .row 10 16 2,
        .flip 10 2, .row 2 10 16], (2, 16)⟩
      path2 := ⟨(2, 15), [.flip 2 15, .row 15 2 0, .flip 15 0], (0, 15)⟩
      path3 := ⟨(1, 16), [], (1, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(1, 14), [.row 1 14 16], (1, 16)⟩
      path1 := ⟨(0, 15), [], (0, 15)⟩
      path2 := ⟨(1, 15), [], (1, 15)⟩
      path3 := ⟨(0, 16), [.row 0 16 6, .flip 0 6, .row 6 0 14, .flip 6 14,
        .row 14 6 0, .flip 14 0], (0, 14)⟩ } },
  { hits := [(3, 9), (3, 4), (8, 9), (8, 3), (14, 3), (14, 8), (0, 4), (0, 8)]
    forwardChoices := [{ center := 0, support := {4, 8} },
        { center := 3, support := {4, 9} },
        { center := 8, support := {3, 9} },
        { center := 14, support := {3, 8} }]
    reverseChoices := [{ center := 2, support := {8, 13} },
        { center := 8, support := {7, 13} },
        { center := 13, support := {7, 12} },
        { center := 16, support := {8, 12} }]
    forwardData := {
      firstQuad := ⟨0, 3, 4, 8⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 8, 9, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(3, 4), [.row 3 4 9], (3, 9)⟩
      path1 := ⟨(0, 8), [.row 0 8 4], (0, 4)⟩
      path2 := ⟨(8, 9), [.row 8 9 3, .flip 8 3], (3, 8)⟩
      path3 := ⟨(3, 14), [.flip 3 14, .row 14 3 8, .flip 14 8], (8, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 7, 8, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 12, 13, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(7, 8), [.flip 7 8, .row 8 7 13], (8, 13)⟩
      path1 := ⟨(2, 13), [.row 2 13 8], (2, 8)⟩
      path2 := ⟨(12, 13), [.flip 12 13, .row 13 12 7, .flip 13 7], (7, 13)⟩
      path3 := ⟨(8, 16), [.flip 8 16, .row 16 8 12, .flip 16 12], (12, 16)⟩ } },
  { hits := [(15, 3), (15, 1), (2, 15), (2, 1), (1, 15), (1, 6), (0, 6), (0, 3)]
    forwardChoices := [{ center := 0, support := {3, 6} },
        { center := 1, support := {6, 15} },
        { center := 2, support := {1, 15} },
        { center := 15, support := {1, 3} }]
    reverseChoices := [{ center := 1, support := {13, 15} },
        { center := 14, support := {1, 15} },
        { center := 15, support := {1, 10} },
        { center := 16, support := {10, 13} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 6⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 3, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 15], (2, 15)⟩
      path1 := ⟨(0, 6), [.row 0 6 3], (0, 3)⟩
      path2 := ⟨(0, 2), [], (0, 2)⟩
      path3 := ⟨(3, 15), [.flip 3 15, .row 15 3 1, .flip 15 1, .row 1 15 6],
        (1, 6)⟩ }
    reverseData := {
      firstQuad := ⟨10, 14, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 13, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(14, 15), [.row 14 15 1, .flip 14 1], (1, 14)⟩
      path1 := ⟨(10, 16), [.flip 10 16, .row 16 10 13, .flip 16 13], (13, 16)⟩
      path2 := ⟨(1, 13), [.row 1 13 15, .flip 1 15, .row 15 1 10, .flip 15 10],
        (10, 15)⟩
      path3 := ⟨(14, 16), [], (14, 16)⟩ } }
]

theorem cancellationOccurrences_length : cancellationOccurrences.length = 3 := by
  native_decide

theorem cancellationOccurrences_all_check :
    cancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

/-- The three active order-zero forward nogoods, one from each surviving cell. -/
def survivorRefinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.map fun occ => occurrenceClause occ.hits 0 .forward

theorem survivorRefinementClauses_length : survivorRefinementClauses.length = 3 := by
  native_decide

theorem survivorRefinementClauses_dimacs :
    survivorRefinementClauses.map (List.map litToDimacs) =
      [[-307, -287, -281, -255, -239, -230, -222, -153, -151],
       [-307, -203, -198, -50, -46, -29, -20, -11, -3],
       [-307, -233, -228, -150, -143, -116, -115, -13, -12]] := by
  native_decide

theorem sourceAssign_survivorRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ survivorRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [survivorRefinementClauses, List.mem_map] at hclause
  obtain ⟨occ, hocc, rfl⟩ := hclause
  have hcheck := List.all_eq_true.mp cancellationOccurrences_all_check occ hocc
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck 0 .forward

/-- Lean-owned successor of the five-clause canary model-refinement root. -/
def canaryPerpBisectorSurvivorRefinementCnf : Std.Sat.CNF Atom :=
  canaryPerpBisectorModelRefinementCnf ++ survivorRefinementClauses

theorem canaryPerpBisectorSurvivorRefinementCnf_length :
    canaryPerpBisectorSurvivorRefinementCnf.length = 7409304 := by
  simp [canaryPerpBisectorSurvivorRefinementCnf,
    canaryPerpBisectorModelRefinementCnf_length,
    survivorRefinementClauses_length]

theorem sourceAssign_canaryPerpBisectorSurvivorRefinementCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [canaryPerpBisectorSurvivorRefinementCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have hparentEval := sourceAssign_canaryPerpBisectorModelRefinementCnf source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_survivorRefinementClauses source clause hsuffix

#print axioms cancellationOccurrences_all_check
#print axioms survivorRefinementClauses_dimacs
#print axioms sourceAssign_survivorRefinementClauses
#print axioms sourceAssign_canaryPerpBisectorSurvivorRefinementCnf

end ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementSurvivorRefinements
end Problem97

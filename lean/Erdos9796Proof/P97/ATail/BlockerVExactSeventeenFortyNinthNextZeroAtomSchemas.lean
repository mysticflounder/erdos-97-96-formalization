/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-! Two direct zero-atom weighted source adapters from the V49 replay. -/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthNextZeroAtomSchemas

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

/-- Direct zero atom 3844 from the replayed V49 assignment. -/
def nextZeroAtom3844 : WeightedSourceOccurrence :=
  { hits := [(6, 5), (6, 7), (7, 6), (7, 9), (9, 7), (9, 12), (12, 5), (12, 9), (15, 6), (15, 12)]
    forwardChoices := [{ center := 6, support := {5, 7} }, { center := 7, support := {6, 9} }, { center := 9, support := {7, 12} }, { center := 12, support := {5, 9} }, { center := 15, support := {6, 12} }]
    reverseChoices := [{ center := 1, support := {4, 10} }, { center := 4, support := {7, 11} }, { center := 7, support := {4, 9} }, { center := 9, support := {7, 10} }, { center := 10, support := {9, 11} }]
    forwardData := { terms := [{ quad := ⟨5, 6, 12, 15⟩, form := .adjacentSides, weight := 1 }], pairings := [{ left := (5, 6), right := (5, 12), path := ⟨(5, 6), [.flip 5 6, .row 6 5 7, .flip 6 7, .row 7 6 9, .flip 7 9, .row 9 7 12, .flip 9 12, .row 12 9 5, .flip 12 5], (5, 12)⟩ }, { left := (12, 15), right := (6, 15), path := ⟨(12, 15), [.flip 12 15, .row 15 12 6, .flip 15 6], (6, 15)⟩ }] }
    reverseData := { terms := [{ quad := ⟨1, 4, 10, 11⟩, form := .adjacentSides, weight := 1 }], pairings := [{ left := (1, 4), right := (1, 10), path := ⟨(1, 4), [.row 1 4 10], (1, 10)⟩ }, { left := (10, 11), right := (4, 11), path := ⟨(10, 11), [.row 10 11 9, .flip 10 9, .row 9 10 7, .flip 9 7, .row 7 9 4, .flip 7 4, .row 4 7 11], (4, 11)⟩ }] } }

theorem nextZeroAtom3844_check : nextZeroAtom3844.check = true := by
  native_decide

/-- Direct zero atom 3861 from the replayed V49 assignment. -/
def nextZeroAtom3861 : WeightedSourceOccurrence :=
  { hits := [(5, 9), (5, 12), (8, 5), (8, 7), (9, 7), (9, 12), (12, 5), (12, 9)]
    forwardChoices := [{ center := 5, support := {9, 12} }, { center := 8, support := {5, 7} }, { center := 9, support := {7, 12} }, { center := 12, support := {5, 9} }]
    reverseChoices := [{ center := 4, support := {7, 11} }, { center := 7, support := {4, 9} }, { center := 8, support := {9, 11} }, { center := 11, support := {4, 7} }]
    forwardData := { terms := [{ quad := ⟨5, 7, 8, 9⟩, form := .innerOuter, weight := 1 }], pairings := [{ left := (7, 8), right := (5, 8), path := ⟨(7, 8), [.flip 7 8, .row 8 7 5, .flip 8 5], (5, 8)⟩ }, { left := (5, 9), right := (7, 9), path := ⟨(5, 9), [.row 5 9 12, .flip 5 12, .row 12 5 9, .flip 12 9, .row 9 12 7, .flip 9 7], (7, 9)⟩ }] }
    reverseData := { terms := [{ quad := ⟨7, 8, 9, 11⟩, form := .innerOuter, weight := 1 }], pairings := [{ left := (8, 9), right := (8, 11), path := ⟨(8, 9), [.row 8 9 11], (8, 11)⟩ }, { left := (7, 11), right := (7, 9), path := ⟨(7, 11), [.flip 7 11, .row 11 7 4, .flip 11 4, .row 4 11 7, .flip 4 7, .row 7 4 9], (7, 9)⟩ }] } }

theorem nextZeroAtom3861_check : nextZeroAtom3861.check = true := by
  native_decide

def fortyNinthNextZeroAtomWeightedOccurrences : List WeightedSourceOccurrence :=
  [nextZeroAtom3844, nextZeroAtom3861]

theorem fortyNinthNextZeroAtomWeightedOccurrences_length :
    fortyNinthNextZeroAtomWeightedOccurrences.length = 2 := by
  native_decide

theorem fortyNinthNextZeroAtomWeightedOccurrences_check :
    ∀ occurrence ∈ fortyNinthNextZeroAtomWeightedOccurrences,
      occurrence.check = true := by
  native_decide

def fortyNinthNextZeroAtomSchemaClauses : Std.Sat.CNF Atom :=
  fortyNinthNextZeroAtomWeightedOccurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order =>
      directions.map fun direction =>
        weightedOccurrenceClause order direction occurrence

theorem fortyNinthNextZeroAtomSchemaClauses_length :
    fortyNinthNextZeroAtomSchemaClauses.length = 8 := by
  simp [fortyNinthNextZeroAtomSchemaClauses,
    fortyNinthNextZeroAtomWeightedOccurrences, namedOrders, directions]

theorem sourceAssign_fortyNinthNextZeroAtomSchemaClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthNextZeroAtomSchemaClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortyNinthNextZeroAtomSchemaClauses, List.mem_flatMap, List.mem_map] at hclause
  rcases hclause with ⟨occurrence, hoccur, order, horder, direction, hdirection, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source occurrence
    (fortyNinthNextZeroAtomWeightedOccurrences_check occurrence hoccur) order direction

#print axioms fortyNinthNextZeroAtomWeightedOccurrences_check
#print axioms sourceAssign_fortyNinthNextZeroAtomSchemaClauses

end ATailBlockerVExactSeventeenFortyNinthNextZeroAtomSchemas
end Problem97

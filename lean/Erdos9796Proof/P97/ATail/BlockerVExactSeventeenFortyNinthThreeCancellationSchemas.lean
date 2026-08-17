/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-! Two distinct eight-hit weighted cancellations from the V49 successor mine. -/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthThreeCancellationSchemas

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

/-!
The two records are the distinct eight-hit supports from atom pairs
`(1117,3323)` and `(703,4341)`.  The other source-valid eight-hit record in
the replay has the same support as `(1117,3323)` and is intentionally not
duplicated here.
-/

def threeCancellation1117_3323 : WeightedSourceOccurrence :=
  { hits := [(0, 13), (0, 15), (3, 14), (3, 15), (13, 0), (13, 14), (16, 0), (16, 13)]
    forwardChoices := [{ center := 0, support := {13, 15} }, { center := 3, support := {14, 15} }, { center := 13, support := {0, 14} }, { center := 16, support := {0, 13} }]
    reverseChoices := [{ center := 0, support := {3, 16} }, { center := 3, support := {2, 16} }, { center := 13, support := {1, 2} }, { center := 16, support := {1, 3} }]
    forwardData := { terms := [{ quad := ⟨0, 13, 15, 16⟩, form := .innerOuter, weight := 1 }, { quad := ⟨3, 13, 14, 15⟩, form := .innerOuter, weight := 1 }], pairings := [{ left := (13, 15), right := (13, 15), path := ⟨(13, 15), [], (13, 15)⟩ }, { left := (0, 16), right := (13, 16), path := ⟨(0, 16), [.flip 0 16, .row 16 0 13, .flip 16 13], (13, 16)⟩ }, { left := (13, 14), right := (0, 15), path := ⟨(13, 14), [.row 13 14 0, .flip 13 0, .row 0 13 15], (0, 15)⟩ }, { left := (3, 15), right := (3, 14), path := ⟨(3, 15), [.row 3 15 14], (3, 14)⟩ }] }
    reverseData := { terms := [{ quad := ⟨0, 1, 3, 16⟩, form := .innerOuter, weight := 1 }, { quad := ⟨1, 2, 3, 13⟩, form := .innerOuter, weight := 1 }], pairings := [{ left := (1, 3), right := (1, 3), path := ⟨(1, 3), [], (1, 3)⟩ }, { left := (0, 16), right := (0, 3), path := ⟨(0, 16), [.row 0 16 3], (0, 3)⟩ }, { left := (2, 3), right := (1, 16), path := ⟨(2, 3), [.flip 2 3, .row 3 2 16, .flip 3 16, .row 16 3 1, .flip 16 1], (1, 16)⟩ }, { left := (1, 13), right := (2, 13), path := ⟨(1, 13), [.flip 1 13, .row 13 1 2, .flip 13 2], (2, 13)⟩ }] } }

theorem threeCancellation1117_3323_check : threeCancellation1117_3323.check = true := by
  native_decide

def threeCancellation703_4341 : WeightedSourceOccurrence :=
  { hits := [(5, 7), (5, 9), (7, 0), (7, 10), (8, 9), (8, 10), (9, 0), (9, 7)]
    forwardChoices := [{ center := 5, support := {7, 9} }, { center := 7, support := {0, 10} }, { center := 8, support := {9, 10} }, { center := 9, support := {0, 7} }]
    reverseChoices := [{ center := 7, support := {9, 16} }, { center := 8, support := {6, 7} }, { center := 9, support := {6, 16} }, { center := 11, support := {7, 9} }]
    forwardData := { terms := [{ quad := ⟨0, 5, 7, 9⟩, form := .innerOuter, weight := 1 }, { quad := ⟨7, 8, 9, 10⟩, form := .innerOuter, weight := 1 }], pairings := [{ left := (5, 7), right := (5, 9), path := ⟨(5, 7), [.row 5 7 9], (5, 9)⟩ }, { left := (0, 9), right := (7, 9), path := ⟨(0, 9), [.flip 0 9, .row 9 0 7, .flip 9 7], (7, 9)⟩ }, { left := (8, 9), right := (8, 10), path := ⟨(8, 9), [.row 8 9 10], (8, 10)⟩ }, { left := (7, 10), right := (0, 7), path := ⟨(7, 10), [.row 7 10 0, .flip 7 0], (0, 7)⟩ }] }
    reverseData := { terms := [{ quad := ⟨7, 9, 11, 16⟩, form := .innerOuter, weight := 1 }, { quad := ⟨6, 7, 8, 9⟩, form := .innerOuter, weight := 1 }], pairings := [{ left := (9, 11), right := (7, 11), path := ⟨(9, 11), [.flip 9 11, .row 11 9 7, .flip 11 7], (7, 11)⟩ }, { left := (7, 16), right := (7, 9), path := ⟨(7, 16), [.row 7 16 9], (7, 9)⟩ }, { left := (7, 8), right := (6, 8), path := ⟨(7, 8), [.flip 7 8, .row 8 7 6, .flip 8 6], (6, 8)⟩ }, { left := (6, 9), right := (9, 16), path := ⟨(6, 9), [.flip 6 9, .row 9 6 16], (9, 16)⟩ }] } }

theorem threeCancellation703_4341_check : threeCancellation703_4341.check = true := by
  native_decide

def fortyNinthThreeCancellationWeightedOccurrences : List WeightedSourceOccurrence :=
  [threeCancellation1117_3323, threeCancellation703_4341]

theorem fortyNinthThreeCancellationWeightedOccurrences_length :
    fortyNinthThreeCancellationWeightedOccurrences.length = 2 := by
  native_decide

theorem fortyNinthThreeCancellationWeightedOccurrences_check :
    ∀ occurrence ∈ fortyNinthThreeCancellationWeightedOccurrences,
      occurrence.check = true := by
  native_decide

def fortyNinthThreeCancellationSchemaClauses : Std.Sat.CNF Atom :=
  fortyNinthThreeCancellationWeightedOccurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order =>
      directions.map fun direction =>
        weightedOccurrenceClause order direction occurrence

theorem fortyNinthThreeCancellationSchemaClauses_length :
    fortyNinthThreeCancellationSchemaClauses.length = 8 := by
  simp [fortyNinthThreeCancellationSchemaClauses,
    fortyNinthThreeCancellationWeightedOccurrences, namedOrders, directions]

theorem sourceAssign_fortyNinthThreeCancellationSchemaClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthThreeCancellationSchemaClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortyNinthThreeCancellationSchemaClauses, List.mem_flatMap, List.mem_map] at hclause
  rcases hclause with ⟨occurrence, hoccur, order, horder, direction, hdirection, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source occurrence
    (fortyNinthThreeCancellationWeightedOccurrences_check occurrence hoccur) order direction

#print axioms fortyNinthThreeCancellationWeightedOccurrences_check
#print axioms sourceAssign_fortyNinthThreeCancellationSchemaClauses

end ATailBlockerVExactSeventeenFortyNinthThreeCancellationSchemas
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-! Five source-valid size-eight V49 records mined from the V5 survivor. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV6FiveSize8Schemas

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev Hit := Label × Label

def fortyNinthWaveV6Size8Occurrence00ForwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {2, 9} },
   { center := 2, support := {1, 9} },
   { center := 13, support := {2, 3} },
   { center := 16, support := {1, 3} }]

def fortyNinthWaveV6Size8Occurrence00ReverseChoices : List (RowChoice Label) :=
  [{ center := 0, support := {13, 15} },
   { center := 3, support := {13, 14} },
   { center := 14, support := {7, 15} },
   { center := 15, support := {7, 14} }]

def fortyNinthWaveV6Size8Occurrence00Hits : List Hit :=
  [(1, 2), (1, 9), (2, 1), (2, 9), (13, 2), (13, 3), (16, 1), (16, 3)]

def fortyNinthWaveV6Size8Occurrence00ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨1, 2, 9, 13⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 3, 13, 16⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (2, 9), right := (1, 9), path := ⟨(2, 9), [.row 2 9 1, .flip 2 1, .row 1 2 9], (1, 9)⟩ },
       { left := (1, 13), right := (1, 13), path := ⟨(1, 13), [], (1, 13)⟩ },
       { left := (3, 13), right := (2, 13), path := ⟨(3, 13), [.flip 3 13, .row 13 3 2, .flip 13 2], (2, 13)⟩ },
       { left := (1, 16), right := (3, 16), path := ⟨(1, 16), [.flip 1 16, .row 16 1 3, .flip 16 3], (3, 16)⟩ }] }

def fortyNinthWaveV6Size8Occurrence00ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 3, 13, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 7, 14, 15⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (3, 13), right := (3, 14), path := ⟨(3, 13), [.row 3 13 14], (3, 14)⟩ },
       { left := (0, 14), right := (0, 14), path := ⟨(0, 14), [], (0, 14)⟩ },
       { left := (7, 14), right := (7, 15), path := ⟨(7, 14), [.flip 7 14, .row 14 7 15, .flip 14 15, .row 15 14 7, .flip 15 7], (7, 15)⟩ },
       { left := (0, 15), right := (0, 13), path := ⟨(0, 15), [.row 0 15 13], (0, 13)⟩ }] }

def fortyNinthWaveV6Size8Occurrence00 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV6Size8Occurrence00Hits
    forwardChoices := fortyNinthWaveV6Size8Occurrence00ForwardChoices
    reverseChoices := fortyNinthWaveV6Size8Occurrence00ReverseChoices
    forwardData := fortyNinthWaveV6Size8Occurrence00ForwardData
    reverseData := fortyNinthWaveV6Size8Occurrence00ReverseData }

def fortyNinthWaveV6Size8Occurrence01ForwardChoices : List (RowChoice Label) :=
  [{ center := 3, support := {4, 10} },
   { center := 4, support := {11, 14} },
   { center := 11, support := {4, 14} },
   { center := 14, support := {10, 11} }]

def fortyNinthWaveV6Size8Occurrence01ReverseChoices : List (RowChoice Label) :=
  [{ center := 2, support := {5, 6} },
   { center := 5, support := {2, 12} },
   { center := 12, support := {2, 5} },
   { center := 13, support := {6, 12} }]

def fortyNinthWaveV6Size8Occurrence01Hits : List Hit :=
  [(3, 4), (3, 10), (4, 11), (4, 14), (11, 4), (11, 14), (14, 10), (14, 11)]

def fortyNinthWaveV6Size8Occurrence01ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨3, 4, 10, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨4, 10, 14, 15⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (3, 4), right := (3, 10), path := ⟨(3, 4), [.row 3 4 10], (3, 10)⟩ },
       { left := (10, 15), right := (10, 15), path := ⟨(10, 15), [], (10, 15)⟩ },
       { left := (10, 14), right := (4, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 11, .flip 14 11, .row 11 14 4, .flip 11 4, .row 4 11 14], (4, 14)⟩ },
       { left := (4, 15), right := (4, 15), path := ⟨(4, 15), [], (4, 15)⟩ }] }

def fortyNinthWaveV6Size8Occurrence01ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨2, 10, 12, 13⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨2, 6, 10, 13⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (2, 10), right := (2, 10), path := ⟨(2, 10), [], (2, 10)⟩ },
       { left := (12, 13), right := (6, 13), path := ⟨(12, 13), [.flip 12 13, .row 13 12 6, .flip 13 6], (6, 13)⟩ },
       { left := (2, 6), right := (2, 12), path := ⟨(2, 6), [.row 2 6 5, .flip 2 5, .row 5 2 12, .flip 5 12, .row 12 5 2, .flip 12 2], (2, 12)⟩ },
       { left := (10, 13), right := (10, 13), path := ⟨(10, 13), [], (10, 13)⟩ }] }

def fortyNinthWaveV6Size8Occurrence01 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV6Size8Occurrence01Hits
    forwardChoices := fortyNinthWaveV6Size8Occurrence01ForwardChoices
    reverseChoices := fortyNinthWaveV6Size8Occurrence01ReverseChoices
    forwardData := fortyNinthWaveV6Size8Occurrence01ForwardData
    reverseData := fortyNinthWaveV6Size8Occurrence01ReverseData }

def fortyNinthWaveV6Size8Occurrence02ForwardChoices : List (RowChoice Label) :=
  [{ center := 3, support := {10, 15} },
   { center := 6, support := {7, 15} },
   { center := 7, support := {6, 10} },
   { center := 10, support := {6, 7} }]

def fortyNinthWaveV6Size8Occurrence02ReverseChoices : List (RowChoice Label) :=
  [{ center := 6, support := {9, 10} },
   { center := 9, support := {6, 10} },
   { center := 10, support := {1, 9} },
   { center := 13, support := {1, 6} }]

def fortyNinthWaveV6Size8Occurrence02Hits : List Hit :=
  [(3, 10), (3, 15), (6, 7), (6, 15), (7, 6), (7, 10), (10, 6), (10, 7)]

def fortyNinthWaveV6Size8Occurrence02ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨3, 6, 11, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨3, 6, 10, 11⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (6, 11), right := (6, 11), path := ⟨(6, 11), [], (6, 11)⟩ },
       { left := (3, 15), right := (3, 10), path := ⟨(3, 15), [.row 3 15 10], (3, 10)⟩ },
       { left := (6, 10), right := (6, 15), path := ⟨(6, 10), [.flip 6 10, .row 10 6 7, .flip 10 7, .row 7 10 6, .flip 7 6, .row 6 7 15], (6, 15)⟩ },
       { left := (3, 11), right := (3, 11), path := ⟨(3, 11), [], (3, 11)⟩ }] }

def fortyNinthWaveV6Size8Occurrence02ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨1, 2, 10, 13⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 6, 10, 13⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (2, 10), right := (2, 10), path := ⟨(2, 10), [], (2, 10)⟩ },
       { left := (1, 13), right := (6, 13), path := ⟨(1, 13), [.flip 1 13, .row 13 1 6, .flip 13 6], (6, 13)⟩ },
       { left := (6, 10), right := (1, 10), path := ⟨(6, 10), [.row 6 10 9, .flip 6 9, .row 9 6 10, .flip 9 10, .row 10 9 1, .flip 10 1], (1, 10)⟩ },
       { left := (2, 13), right := (2, 13), path := ⟨(2, 13), [], (2, 13)⟩ }] }

def fortyNinthWaveV6Size8Occurrence02 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV6Size8Occurrence02Hits
    forwardChoices := fortyNinthWaveV6Size8Occurrence02ForwardChoices
    reverseChoices := fortyNinthWaveV6Size8Occurrence02ReverseChoices
    forwardData := fortyNinthWaveV6Size8Occurrence02ForwardData
    reverseData := fortyNinthWaveV6Size8Occurrence02ReverseData }

def fortyNinthWaveV6Size8Occurrence03ForwardChoices : List (RowChoice Label) :=
  [{ center := 7, support := {6, 10} },
   { center := 10, support := {6, 7} },
   { center := 12, support := {7, 11} },
   { center := 14, support := {10, 11} }]

def fortyNinthWaveV6Size8Occurrence03ReverseChoices : List (RowChoice Label) :=
  [{ center := 2, support := {5, 6} },
   { center := 4, support := {5, 9} },
   { center := 6, support := {9, 10} },
   { center := 9, support := {6, 10} }]

def fortyNinthWaveV6Size8Occurrence03Hits : List Hit :=
  [(7, 6), (7, 10), (10, 6), (10, 7), (12, 7), (12, 11), (14, 10), (14, 11)]

def fortyNinthWaveV6Size8Occurrence03ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨6, 7, 10, 12⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨10, 11, 12, 14⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (6, 7), right := (6, 10), path := ⟨(6, 7), [.flip 6 7, .row 7 6 10, .flip 7 10, .row 10 7 6, .flip 10 6], (6, 10)⟩ },
       { left := (10, 12), right := (10, 12), path := ⟨(10, 12), [], (10, 12)⟩ },
       { left := (11, 12), right := (7, 12), path := ⟨(11, 12), [.flip 11 12, .row 12 11 7, .flip 12 7], (7, 12)⟩ },
       { left := (10, 14), right := (11, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 11, .flip 14 11], (11, 14)⟩ }] }

def fortyNinthWaveV6Size8Occurrence03ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨4, 6, 9, 10⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨2, 4, 5, 6⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (4, 6), right := (4, 6), path := ⟨(4, 6), [], (4, 6)⟩ },
       { left := (9, 10), right := (6, 10), path := ⟨(9, 10), [.row 9 10 6, .flip 9 6, .row 6 9 10], (6, 10)⟩ },
       { left := (4, 5), right := (4, 9), path := ⟨(4, 5), [.row 4 5 9], (4, 9)⟩ },
       { left := (2, 6), right := (2, 5), path := ⟨(2, 6), [.row 2 6 5], (2, 5)⟩ }] }

def fortyNinthWaveV6Size8Occurrence03 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV6Size8Occurrence03Hits
    forwardChoices := fortyNinthWaveV6Size8Occurrence03ForwardChoices
    reverseChoices := fortyNinthWaveV6Size8Occurrence03ReverseChoices
    forwardData := fortyNinthWaveV6Size8Occurrence03ForwardData
    reverseData := fortyNinthWaveV6Size8Occurrence03ReverseData }

def fortyNinthWaveV6Size8Occurrence04ForwardChoices : List (RowChoice Label) :=
  [{ center := 7, support := {6, 10} },
   { center := 10, support := {6, 7} },
   { center := 14, support := {3, 10} },
   { center := 16, support := {3, 7} }]

def fortyNinthWaveV6Size8Occurrence04ReverseChoices : List (RowChoice Label) :=
  [{ center := 0, support := {9, 13} },
   { center := 2, support := {6, 13} },
   { center := 6, support := {9, 10} },
   { center := 9, support := {6, 10} }]

def fortyNinthWaveV6Size8Occurrence04Hits : List Hit :=
  [(7, 6), (7, 10), (10, 6), (10, 7), (14, 3), (14, 10), (16, 3), (16, 7)]

def fortyNinthWaveV6Size8Occurrence04ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨6, 7, 10, 16⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨3, 10, 14, 16⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (6, 7), right := (6, 10), path := ⟨(6, 7), [.flip 6 7, .row 7 6 10, .flip 7 10, .row 10 7 6, .flip 10 6], (6, 10)⟩ },
       { left := (10, 16), right := (10, 16), path := ⟨(10, 16), [], (10, 16)⟩ },
       { left := (10, 14), right := (3, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 3, .flip 14 3], (3, 14)⟩ },
       { left := (3, 16), right := (7, 16), path := ⟨(3, 16), [.flip 3 16, .row 16 3 7, .flip 16 7], (7, 16)⟩ }] }

def fortyNinthWaveV6Size8Occurrence04ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 6, 9, 10⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨0, 2, 6, 13⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (0, 6), right := (0, 6), path := ⟨(0, 6), [], (0, 6)⟩ },
       { left := (9, 10), right := (6, 10), path := ⟨(9, 10), [.row 9 10 6, .flip 9 6, .row 6 9 10], (6, 10)⟩ },
       { left := (2, 6), right := (2, 13), path := ⟨(2, 6), [.row 2 6 13], (2, 13)⟩ },
       { left := (0, 13), right := (0, 9), path := ⟨(0, 13), [.row 0 13 9], (0, 9)⟩ }] }

def fortyNinthWaveV6Size8Occurrence04 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV6Size8Occurrence04Hits
    forwardChoices := fortyNinthWaveV6Size8Occurrence04ForwardChoices
    reverseChoices := fortyNinthWaveV6Size8Occurrence04ReverseChoices
    forwardData := fortyNinthWaveV6Size8Occurrence04ForwardData
    reverseData := fortyNinthWaveV6Size8Occurrence04ReverseData }


theorem fortyNinthWaveV6Size8Occurrence00_check : fortyNinthWaveV6Size8Occurrence00.check = true := by
  native_decide

theorem fortyNinthWaveV6Size8Occurrence01_check : fortyNinthWaveV6Size8Occurrence01.check = true := by
  native_decide

theorem fortyNinthWaveV6Size8Occurrence02_check : fortyNinthWaveV6Size8Occurrence02.check = true := by
  native_decide

theorem fortyNinthWaveV6Size8Occurrence03_check : fortyNinthWaveV6Size8Occurrence03.check = true := by
  native_decide

theorem fortyNinthWaveV6Size8Occurrence04_check : fortyNinthWaveV6Size8Occurrence04.check = true := by
  native_decide

def fortyNinthWaveV6FiveSize8Occurrences : List WeightedSourceOccurrence :=
  [fortyNinthWaveV6Size8Occurrence00, fortyNinthWaveV6Size8Occurrence01, fortyNinthWaveV6Size8Occurrence02, fortyNinthWaveV6Size8Occurrence03, fortyNinthWaveV6Size8Occurrence04]

theorem fortyNinthWaveV6FiveSize8Occurrences_length :
    fortyNinthWaveV6FiveSize8Occurrences.length = 5 := by
  rfl

theorem fortyNinthWaveV6FiveSize8Occurrences_check :
    ∀ occurrence ∈ fortyNinthWaveV6FiveSize8Occurrences,
      occurrence.check = true := by
  intro occurrence hoccur
  simp only [fortyNinthWaveV6FiveSize8Occurrences, List.mem_cons,
    List.mem_singleton, List.not_mem_nil, or_false] at hoccur
  rcases hoccur with rfl | rfl | rfl | rfl | rfl
  · exact fortyNinthWaveV6Size8Occurrence00_check
  · exact fortyNinthWaveV6Size8Occurrence01_check
  · exact fortyNinthWaveV6Size8Occurrence02_check
  · exact fortyNinthWaveV6Size8Occurrence03_check
  · exact fortyNinthWaveV6Size8Occurrence04_check

def fortyNinthWaveV6FiveSize8SchemaClauses : Std.Sat.CNF Atom :=
  fortyNinthWaveV6FiveSize8Occurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order => directions.map fun direction =>
      weightedOccurrenceClause order direction occurrence

theorem fortyNinthWaveV6FiveSize8SchemaClauses_length :
    fortyNinthWaveV6FiveSize8SchemaClauses.length = 20 := by
  simp [fortyNinthWaveV6FiveSize8SchemaClauses,
    fortyNinthWaveV6FiveSize8Occurrences, namedOrders, directions]

theorem sourceAssign_fortyNinthWaveV6FiveSize8SchemaClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV6FiveSize8SchemaClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortyNinthWaveV6FiveSize8SchemaClauses, List.mem_flatMap,
    List.mem_map] at hclause
  rcases hclause with
    ⟨occurrence, hoccur, order, horder, direction, hdirection, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source occurrence
    (fortyNinthWaveV6FiveSize8Occurrences_check occurrence hoccur) order direction

end ATailBlockerVExactSeventeenFortyNinthWaveV6FiveSize8Schemas
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-! Five inclusion-minimal size-eight source-valid V49 Kalmanson occurrences. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV5FiveSize8Schemas

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev Hit := Label × Label

def fortyNinthWaveV5Size8Occurrence00ForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {11, 14} },
   { center := 11, support := {0, 14} },
   { center := 13, support := {0, 2} },
   { center := 14, support := {2, 11} }]

def fortyNinthWaveV5Size8Occurrence00ReverseChoices : List (RowChoice Label) :=
  [{ center := 2, support := {5, 14} },
   { center := 3, support := {14, 16} },
   { center := 5, support := {2, 16} },
   { center := 16, support := {2, 5} }]

def fortyNinthWaveV5Size8Occurrence00Hits : List Hit :=
  [(0, 11), (0, 14), (11, 0), (11, 14), (13, 0), (13, 2), (14, 2), (14, 11)]

def fortyNinthWaveV5Size8Occurrence00ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨1, 2, 13, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 1, 13, 14⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (2, 13), right := (0, 13), path := ⟨(2, 13), [.flip 2 13, .row 13 2 0, .flip 13 0], (0, 13)⟩ },
       { left := (1, 14), right := (1, 14), path := ⟨(1, 14), [], (1, 14)⟩ },
       { left := (1, 13), right := (1, 13), path := ⟨(1, 13), [], (1, 13)⟩ },
       { left := (0, 14), right := (2, 14), path := ⟨(0, 14), [.row 0 14 11, .flip 0 11, .row 11 0 14, .flip 11 14, .row 14 11 2, .flip 14 2], (2, 14)⟩ }] }

def fortyNinthWaveV5Size8Occurrence00ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨2, 3, 14, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 3, 15, 16⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (3, 14), right := (3, 16), path := ⟨(3, 14), [.row 3 14 16], (3, 16)⟩ },
       { left := (2, 15), right := (2, 15), path := ⟨(2, 15), [], (2, 15)⟩ },
       { left := (3, 15), right := (3, 15), path := ⟨(3, 15), [], (3, 15)⟩ },
       { left := (2, 16), right := (2, 14), path := ⟨(2, 16), [.flip 2 16, .row 16 2 5, .flip 16 5, .row 5 16 2, .flip 5 2, .row 2 5 14], (2, 14)⟩ }] }

def fortyNinthWaveV5Size8Occurrence00 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV5Size8Occurrence00Hits
    forwardChoices := fortyNinthWaveV5Size8Occurrence00ForwardChoices
    reverseChoices := fortyNinthWaveV5Size8Occurrence00ReverseChoices
    forwardData := fortyNinthWaveV5Size8Occurrence00ForwardData
    reverseData := fortyNinthWaveV5Size8Occurrence00ReverseData }

def fortyNinthWaveV5Size8Occurrence01ForwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {4, 16} },
   { center := 2, support := {1, 6} },
   { center := 4, support := {6, 16} },
   { center := 15, support := {1, 4} }]

def fortyNinthWaveV5Size8Occurrence01ReverseChoices : List (RowChoice Label) :=
  [{ center := 1, support := {12, 15} },
   { center := 12, support := {0, 10} },
   { center := 14, support := {10, 15} },
   { center := 15, support := {0, 12} }]

def fortyNinthWaveV5Size8Occurrence01Hits : List Hit :=
  [(1, 4), (1, 16), (2, 1), (2, 6), (4, 6), (4, 16), (15, 1), (15, 4)]

def fortyNinthWaveV5Size8Occurrence01ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨1, 2, 4, 6⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 4, 15, 16⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (1, 2), right := (2, 6), path := ⟨(1, 2), [.flip 1 2, .row 2 1 6], (2, 6)⟩ },
       { left := (4, 6), right := (4, 16), path := ⟨(4, 6), [.row 4 6 16], (4, 16)⟩ },
       { left := (4, 15), right := (1, 15), path := ⟨(4, 15), [.flip 4 15, .row 15 4 1, .flip 15 1], (1, 15)⟩ },
       { left := (1, 16), right := (1, 4), path := ⟨(1, 16), [.row 1 16 4], (1, 4)⟩ }] }

def fortyNinthWaveV5Size8Occurrence01ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨10, 12, 14, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨0, 1, 12, 15⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (10, 12), right := (0, 12), path := ⟨(10, 12), [.flip 10 12, .row 12 10 0, .flip 12 0], (0, 12)⟩ },
       { left := (14, 15), right := (10, 14), path := ⟨(14, 15), [.row 14 15 10, .flip 14 10], (10, 14)⟩ },
       { left := (1, 12), right := (1, 15), path := ⟨(1, 12), [.row 1 12 15], (1, 15)⟩ },
       { left := (0, 15), right := (12, 15), path := ⟨(0, 15), [.flip 0 15, .row 15 0 12, .flip 15 12], (12, 15)⟩ }] }

def fortyNinthWaveV5Size8Occurrence01 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV5Size8Occurrence01Hits
    forwardChoices := fortyNinthWaveV5Size8Occurrence01ForwardChoices
    reverseChoices := fortyNinthWaveV5Size8Occurrence01ReverseChoices
    forwardData := fortyNinthWaveV5Size8Occurrence01ForwardData
    reverseData := fortyNinthWaveV5Size8Occurrence01ReverseData }

def fortyNinthWaveV5Size8Occurrence02ForwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {4, 16} },
   { center := 3, support := {4, 12} },
   { center := 4, support := {2, 16} },
   { center := 16, support := {2, 12} }]

def fortyNinthWaveV5Size8Occurrence02ReverseChoices : List (RowChoice Label) :=
  [{ center := 0, support := {4, 14} },
   { center := 12, support := {0, 14} },
   { center := 13, support := {4, 12} },
   { center := 15, support := {0, 12} }]

def fortyNinthWaveV5Size8Occurrence02Hits : List Hit :=
  [(1, 4), (1, 16), (3, 4), (3, 12), (4, 2), (4, 16), (16, 2), (16, 12)]

def fortyNinthWaveV5Size8Occurrence02ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨1, 2, 4, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨3, 4, 12, 16⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (2, 4), right := (4, 16), path := ⟨(2, 4), [.flip 2 4, .row 4 2 16], (4, 16)⟩ },
       { left := (1, 16), right := (1, 4), path := ⟨(1, 16), [.row 1 16 4], (1, 4)⟩ },
       { left := (3, 4), right := (3, 12), path := ⟨(3, 4), [.row 3 4 12], (3, 12)⟩ },
       { left := (12, 16), right := (2, 16), path := ⟨(12, 16), [.flip 12 16, .row 16 12 2, .flip 16 2], (2, 16)⟩ }] }

def fortyNinthWaveV5Size8Occurrence02ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 12, 14, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 4, 12, 13⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (12, 14), right := (0, 12), path := ⟨(12, 14), [.row 12 14 0, .flip 12 0], (0, 12)⟩ },
       { left := (0, 15), right := (12, 15), path := ⟨(0, 15), [.flip 0 15, .row 15 0 12, .flip 15 12], (12, 15)⟩ },
       { left := (0, 4), right := (0, 14), path := ⟨(0, 4), [.row 0 4 14], (0, 14)⟩ },
       { left := (12, 13), right := (4, 13), path := ⟨(12, 13), [.flip 12 13, .row 13 12 4, .flip 13 4], (4, 13)⟩ }] }

def fortyNinthWaveV5Size8Occurrence02 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV5Size8Occurrence02Hits
    forwardChoices := fortyNinthWaveV5Size8Occurrence02ForwardChoices
    reverseChoices := fortyNinthWaveV5Size8Occurrence02ReverseChoices
    forwardData := fortyNinthWaveV5Size8Occurrence02ForwardData
    reverseData := fortyNinthWaveV5Size8Occurrence02ReverseData }

def fortyNinthWaveV5Size8Occurrence03ForwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {4, 16} },
   { center := 4, support := {2, 16} },
   { center := 15, support := {1, 4} },
   { center := 16, support := {1, 2} }]

def fortyNinthWaveV5Size8Occurrence03ReverseChoices : List (RowChoice Label) :=
  [{ center := 0, support := {14, 15} },
   { center := 1, support := {12, 15} },
   { center := 12, support := {0, 14} },
   { center := 15, support := {0, 12} }]

def fortyNinthWaveV5Size8Occurrence03Hits : List Hit :=
  [(1, 4), (1, 16), (4, 2), (4, 16), (15, 1), (15, 4), (16, 1), (16, 2)]

def fortyNinthWaveV5Size8Occurrence03ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨1, 2, 4, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 4, 15, 16⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (2, 4), right := (4, 16), path := ⟨(2, 4), [.flip 2 4, .row 4 2 16], (4, 16)⟩ },
       { left := (1, 16), right := (1, 4), path := ⟨(1, 16), [.row 1 16 4], (1, 4)⟩ },
       { left := (4, 15), right := (1, 15), path := ⟨(4, 15), [.flip 4 15, .row 15 4 1, .flip 15 1], (1, 15)⟩ },
       { left := (1, 16), right := (2, 16), path := ⟨(1, 16), [.flip 1 16, .row 16 1 2, .flip 16 2], (2, 16)⟩ }] }

def fortyNinthWaveV5Size8Occurrence03ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 12, 14, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 1, 12, 15⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (12, 14), right := (0, 12), path := ⟨(12, 14), [.row 12 14 0, .flip 12 0], (0, 12)⟩ },
       { left := (0, 15), right := (0, 14), path := ⟨(0, 15), [.row 0 15 14], (0, 14)⟩ },
       { left := (1, 12), right := (1, 15), path := ⟨(1, 12), [.row 1 12 15], (1, 15)⟩ },
       { left := (0, 15), right := (12, 15), path := ⟨(0, 15), [.flip 0 15, .row 15 0 12, .flip 15 12], (12, 15)⟩ }] }

def fortyNinthWaveV5Size8Occurrence03 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV5Size8Occurrence03Hits
    forwardChoices := fortyNinthWaveV5Size8Occurrence03ForwardChoices
    reverseChoices := fortyNinthWaveV5Size8Occurrence03ReverseChoices
    forwardData := fortyNinthWaveV5Size8Occurrence03ForwardData
    reverseData := fortyNinthWaveV5Size8Occurrence03ReverseData }

def fortyNinthWaveV5Size8Occurrence04ForwardChoices : List (RowChoice Label) :=
  [{ center := 6, support := {7, 13} },
   { center := 10, support := {6, 11} },
   { center := 13, support := {6, 7} },
   { center := 14, support := {11, 13} }]

def fortyNinthWaveV5Size8Occurrence04ReverseChoices : List (RowChoice Label) :=
  [{ center := 2, support := {3, 5} },
   { center := 3, support := {9, 10} },
   { center := 6, support := {5, 10} },
   { center := 10, support := {3, 9} }]

def fortyNinthWaveV5Size8Occurrence04Hits : List Hit :=
  [(6, 7), (6, 13), (10, 6), (10, 11), (13, 6), (13, 7), (14, 11), (14, 13)]

def fortyNinthWaveV5Size8Occurrence04ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨6, 7, 10, 13⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨10, 11, 13, 14⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (6, 7), right := (7, 13), path := ⟨(6, 7), [.row 6 7 13, .flip 6 13, .row 13 6 7, .flip 13 7], (7, 13)⟩ },
       { left := (10, 13), right := (10, 13), path := ⟨(10, 13), [], (10, 13)⟩ },
       { left := (10, 11), right := (6, 10), path := ⟨(10, 11), [.row 10 11 6, .flip 10 6], (6, 10)⟩ },
       { left := (13, 14), right := (11, 14), path := ⟨(13, 14), [.flip 13 14, .row 14 13 11, .flip 14 11], (11, 14)⟩ }] }

def fortyNinthWaveV5Size8Occurrence04ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨2, 3, 5, 6⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨3, 6, 9, 10⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (2, 3), right := (2, 5), path := ⟨(2, 3), [.row 2 3 5], (2, 5)⟩ },
       { left := (5, 6), right := (6, 10), path := ⟨(5, 6), [.flip 5 6, .row 6 5 10], (6, 10)⟩ },
       { left := (3, 6), right := (3, 6), path := ⟨(3, 6), [], (3, 6)⟩ },
       { left := (9, 10), right := (3, 9), path := ⟨(9, 10), [.flip 9 10, .row 10 9 3, .flip 10 3, .row 3 10 9], (3, 9)⟩ }] }

def fortyNinthWaveV5Size8Occurrence04 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV5Size8Occurrence04Hits
    forwardChoices := fortyNinthWaveV5Size8Occurrence04ForwardChoices
    reverseChoices := fortyNinthWaveV5Size8Occurrence04ReverseChoices
    forwardData := fortyNinthWaveV5Size8Occurrence04ForwardData
    reverseData := fortyNinthWaveV5Size8Occurrence04ReverseData }


theorem fortyNinthWaveV5Size8Occurrence00_check : fortyNinthWaveV5Size8Occurrence00.check = true := by
  native_decide

theorem fortyNinthWaveV5Size8Occurrence01_check : fortyNinthWaveV5Size8Occurrence01.check = true := by
  native_decide

theorem fortyNinthWaveV5Size8Occurrence02_check : fortyNinthWaveV5Size8Occurrence02.check = true := by
  native_decide

theorem fortyNinthWaveV5Size8Occurrence03_check : fortyNinthWaveV5Size8Occurrence03.check = true := by
  native_decide

theorem fortyNinthWaveV5Size8Occurrence04_check : fortyNinthWaveV5Size8Occurrence04.check = true := by
  native_decide

def fortyNinthWaveV5FiveSize8Occurrences : List WeightedSourceOccurrence :=
  [fortyNinthWaveV5Size8Occurrence00,
  fortyNinthWaveV5Size8Occurrence01,
  fortyNinthWaveV5Size8Occurrence02,
  fortyNinthWaveV5Size8Occurrence03,
  fortyNinthWaveV5Size8Occurrence04]

theorem fortyNinthWaveV5FiveSize8Occurrences_length :
    fortyNinthWaveV5FiveSize8Occurrences.length = 5 := by
  rfl

theorem fortyNinthWaveV5FiveSize8Occurrences_check :
    ∀ occurrence ∈ fortyNinthWaveV5FiveSize8Occurrences,
      occurrence.check = true := by
  intro occurrence hoccur
  simp only [fortyNinthWaveV5FiveSize8Occurrences, List.mem_cons,
    List.mem_singleton, List.not_mem_nil, or_false] at hoccur
  rcases hoccur with rfl | rfl | rfl | rfl | rfl
  · exact fortyNinthWaveV5Size8Occurrence00_check
  · exact fortyNinthWaveV5Size8Occurrence01_check
  · exact fortyNinthWaveV5Size8Occurrence02_check
  · exact fortyNinthWaveV5Size8Occurrence03_check
  · exact fortyNinthWaveV5Size8Occurrence04_check

def fortyNinthWaveV5FiveSize8SchemaClauses : Std.Sat.CNF Atom :=
  fortyNinthWaveV5FiveSize8Occurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order => directions.map fun direction =>
      weightedOccurrenceClause order direction occurrence

theorem fortyNinthWaveV5FiveSize8SchemaClauses_length :
    fortyNinthWaveV5FiveSize8SchemaClauses.length = 20 := by
  simp [fortyNinthWaveV5FiveSize8SchemaClauses,
    fortyNinthWaveV5FiveSize8Occurrences, namedOrders, directions]

theorem sourceAssign_fortyNinthWaveV5FiveSize8SchemaClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV5FiveSize8SchemaClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortyNinthWaveV5FiveSize8SchemaClauses, List.mem_flatMap,
    List.mem_map] at hclause
  rcases hclause with ⟨occurrence, hoccur, order, horder, direction, hdirection, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source occurrence
    (fortyNinthWaveV5FiveSize8Occurrences_check occurrence hoccur) order direction

#print axioms sourceAssign_fortyNinthWaveV5FiveSize8SchemaClauses
end ATailBlockerVExactSeventeenFortyNinthWaveV5FiveSize8Schemas
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-! Four source-valid size-eight V49 Kalmanson occurrences from the
authenticated V8 wave mine. Records preserve artifact order (artifact SHA256
94ab9e52cc5702406fb0079b37c625fd6b53c65cdad6a63a9bd3edd14a2a5c93; model SHA256
68610579bfd15f87df1789292184a04065224847896df114fb52863b431781b6). -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV9FourSize8Schemas

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev Hit := Label × Label

def fortyNinthWaveV9Size8Occurrence00ForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {2, 15} },
   { center := 2, support := {1, 15} },
   { center := 13, support := {0, 2} },
   { center := 16, support := {0, 1} }]

def fortyNinthWaveV9Size8Occurrence00ReverseChoices : List (RowChoice Label) :=
  [{ center := 0, support := {15, 16} },
   { center := 3, support := {14, 16} },
   { center := 14, support := {1, 15} },
   { center := 16, support := {1, 14} }]

def fortyNinthWaveV9Size8Occurrence00Hits : List Hit :=
  [(0, 2), (0, 15), (2, 1), (2, 15), (13, 0), (13, 2), (16, 0), (16, 1)]

def fortyNinthWaveV9Size8Occurrence00ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 1, 2, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 2, 13, 15⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (1, 2), right := (2, 15), path := ⟨(1, 2), [.flip 1 2, .row 2 1 15], (2, 15)⟩ },
       { left := (0, 16), right := (1, 16), path := ⟨(0, 16), [.flip 0 16, .row 16 0 1, .flip 16 1], (1, 16)⟩ },
       { left := (2, 13), right := (0, 13), path := ⟨(2, 13), [.flip 2 13, .row 13 2 0, .flip 13 0], (0, 13)⟩ },
       { left := (0, 15), right := (0, 2), path := ⟨(0, 15), [.row 0 15 2], (0, 2)⟩ }] }

def fortyNinthWaveV9Size8Occurrence00ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 14, 15, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 3, 14, 16⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (14, 15), right := (1, 14), path := ⟨(14, 15), [.row 14 15 1, .flip 14 1], (1, 14)⟩ },
       { left := (0, 16), right := (0, 15), path := ⟨(0, 16), [.row 0 16 15], (0, 15)⟩ },
       { left := (3, 14), right := (3, 16), path := ⟨(3, 14), [.row 3 14 16], (3, 16)⟩ },
       { left := (1, 16), right := (14, 16), path := ⟨(1, 16), [.flip 1 16, .row 16 1 14, .flip 16 14], (14, 16)⟩ }] }

def fortyNinthWaveV9Size8Occurrence00 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV9Size8Occurrence00Hits
    forwardChoices := fortyNinthWaveV9Size8Occurrence00ForwardChoices
    reverseChoices := fortyNinthWaveV9Size8Occurrence00ReverseChoices
    forwardData := fortyNinthWaveV9Size8Occurrence00ForwardData
    reverseData := fortyNinthWaveV9Size8Occurrence00ReverseData }

theorem fortyNinthWaveV9Size8Occurrence00_check : fortyNinthWaveV9Size8Occurrence00.check = true := by
  native_decide

def fortyNinthWaveV9Size8Occurrence01ForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {6, 15} },
   { center := 2, support := {1, 15} },
   { center := 15, support := {0, 6} },
   { center := 16, support := {0, 1} }]

def fortyNinthWaveV9Size8Occurrence01ReverseChoices : List (RowChoice Label) :=
  [{ center := 0, support := {15, 16} },
   { center := 1, support := {10, 16} },
   { center := 14, support := {1, 15} },
   { center := 16, support := {1, 10} }]

def fortyNinthWaveV9Size8Occurrence01Hits : List Hit :=
  [(0, 6), (0, 15), (2, 1), (2, 15), (15, 0), (15, 6), (16, 0), (16, 1)]

def fortyNinthWaveV9Size8Occurrence01ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 1, 2, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 2, 6, 15⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (1, 2), right := (2, 15), path := ⟨(1, 2), [.flip 1 2, .row 2 1 15], (2, 15)⟩ },
       { left := (0, 16), right := (1, 16), path := ⟨(0, 16), [.flip 0 16, .row 16 0 1, .flip 16 1], (1, 16)⟩ },
       { left := (0, 2), right := (0, 2), path := ⟨(0, 2), [], (0, 2)⟩ },
       { left := (6, 15), right := (0, 6), path := ⟨(6, 15), [.flip 6 15, .row 15 6 0, .flip 15 0, .row 0 15 6], (0, 6)⟩ }] }

def fortyNinthWaveV9Size8Occurrence01ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 10, 15, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 10, 14, 15⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (10, 15), right := (10, 15), path := ⟨(10, 15), [], (10, 15)⟩ },
       { left := (0, 16), right := (0, 15), path := ⟨(0, 16), [.row 0 16 15], (0, 15)⟩ },
       { left := (1, 10), right := (10, 16), path := ⟨(1, 10), [.row 1 10 16, .flip 1 16, .row 16 1 10, .flip 16 10], (10, 16)⟩ },
       { left := (14, 15), right := (1, 14), path := ⟨(14, 15), [.row 14 15 1, .flip 14 1], (1, 14)⟩ }] }

def fortyNinthWaveV9Size8Occurrence01 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV9Size8Occurrence01Hits
    forwardChoices := fortyNinthWaveV9Size8Occurrence01ForwardChoices
    reverseChoices := fortyNinthWaveV9Size8Occurrence01ReverseChoices
    forwardData := fortyNinthWaveV9Size8Occurrence01ForwardData
    reverseData := fortyNinthWaveV9Size8Occurrence01ReverseData }

theorem fortyNinthWaveV9Size8Occurrence01_check : fortyNinthWaveV9Size8Occurrence01.check = true := by
  native_decide

def fortyNinthWaveV9Size8Occurrence02ForwardChoices : List (RowChoice Label) :=
  [{ center := 4, support := {5, 9} },
   { center := 6, support := {4, 8} },
   { center := 9, support := {4, 5} },
   { center := 12, support := {8, 9} }]

def fortyNinthWaveV9Size8Occurrence02ReverseChoices : List (RowChoice Label) :=
  [{ center := 4, support := {7, 8} },
   { center := 7, support := {11, 12} },
   { center := 10, support := {8, 12} },
   { center := 12, support := {7, 11} }]

def fortyNinthWaveV9Size8Occurrence02Hits : List Hit :=
  [(4, 5), (4, 9), (6, 4), (6, 8), (9, 4), (9, 5), (12, 8), (12, 9)]

def fortyNinthWaveV9Size8Occurrence02ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨4, 5, 6, 9⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨6, 8, 9, 12⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (4, 5), right := (5, 9), path := ⟨(4, 5), [.row 4 5 9, .flip 4 9, .row 9 4 5, .flip 9 5], (5, 9)⟩ },
       { left := (6, 9), right := (6, 9), path := ⟨(6, 9), [], (6, 9)⟩ },
       { left := (6, 8), right := (4, 6), path := ⟨(6, 8), [.row 6 8 4, .flip 6 4], (4, 6)⟩ },
       { left := (9, 12), right := (8, 12), path := ⟨(9, 12), [.flip 9 12, .row 12 9 8, .flip 12 8], (8, 12)⟩ }] }

def fortyNinthWaveV9Size8Occurrence02ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨4, 7, 8, 11⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨8, 10, 11, 12⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (4, 7), right := (4, 8), path := ⟨(4, 7), [.row 4 7 8], (4, 8)⟩ },
       { left := (8, 11), right := (8, 11), path := ⟨(8, 11), [], (8, 11)⟩ },
       { left := (8, 10), right := (10, 12), path := ⟨(8, 10), [.flip 8 10, .row 10 8 12], (10, 12)⟩ },
       { left := (11, 12), right := (7, 11), path := ⟨(11, 12), [.flip 11 12, .row 12 11 7, .flip 12 7, .row 7 12 11], (7, 11)⟩ }] }

def fortyNinthWaveV9Size8Occurrence02 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV9Size8Occurrence02Hits
    forwardChoices := fortyNinthWaveV9Size8Occurrence02ForwardChoices
    reverseChoices := fortyNinthWaveV9Size8Occurrence02ReverseChoices
    forwardData := fortyNinthWaveV9Size8Occurrence02ForwardData
    reverseData := fortyNinthWaveV9Size8Occurrence02ReverseData }

theorem fortyNinthWaveV9Size8Occurrence02_check : fortyNinthWaveV9Size8Occurrence02.check = true := by
  native_decide

def fortyNinthWaveV9Size8Occurrence03ForwardChoices : List (RowChoice Label) :=
  [{ center := 5, support := {7, 12} },
   { center := 7, support := {5, 12} },
   { center := 9, support := {4, 5} },
   { center := 13, support := {4, 7} }]

def fortyNinthWaveV9Size8Occurrence03ReverseChoices : List (RowChoice Label) :=
  [{ center := 3, support := {9, 12} },
   { center := 7, support := {11, 12} },
   { center := 9, support := {4, 11} },
   { center := 11, support := {4, 9} }]

def fortyNinthWaveV9Size8Occurrence03Hits : List Hit :=
  [(5, 7), (5, 12), (7, 5), (7, 12), (9, 4), (9, 5), (13, 4), (13, 7)]

def fortyNinthWaveV9Size8Occurrence03ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨4, 5, 9, 12⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨4, 7, 12, 13⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (5, 9), right := (4, 9), path := ⟨(5, 9), [.flip 5 9, .row 9 5 4, .flip 9 4], (4, 9)⟩ },
       { left := (4, 12), right := (4, 12), path := ⟨(4, 12), [], (4, 12)⟩ },
       { left := (7, 12), right := (5, 12), path := ⟨(7, 12), [.row 7 12 5, .flip 7 5, .row 5 7 12], (5, 12)⟩ },
       { left := (4, 13), right := (7, 13), path := ⟨(4, 13), [.flip 4 13, .row 13 4 7, .flip 13 7], (7, 13)⟩ }] }

def fortyNinthWaveV9Size8Occurrence03ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨3, 4, 9, 11⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨3, 7, 11, 12⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (4, 9), right := (4, 11), path := ⟨(4, 9), [.flip 4 9, .row 9 4 11, .flip 9 11, .row 11 9 4, .flip 11 4], (4, 11)⟩ },
       { left := (3, 11), right := (3, 11), path := ⟨(3, 11), [], (3, 11)⟩ },
       { left := (7, 11), right := (7, 12), path := ⟨(7, 11), [.row 7 11 12], (7, 12)⟩ },
       { left := (3, 12), right := (3, 9), path := ⟨(3, 12), [.row 3 12 9], (3, 9)⟩ }] }

def fortyNinthWaveV9Size8Occurrence03 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV9Size8Occurrence03Hits
    forwardChoices := fortyNinthWaveV9Size8Occurrence03ForwardChoices
    reverseChoices := fortyNinthWaveV9Size8Occurrence03ReverseChoices
    forwardData := fortyNinthWaveV9Size8Occurrence03ForwardData
    reverseData := fortyNinthWaveV9Size8Occurrence03ReverseData }

theorem fortyNinthWaveV9Size8Occurrence03_check : fortyNinthWaveV9Size8Occurrence03.check = true := by
  native_decide


def fortyNinthWaveV9FourSize8Occurrences : List WeightedSourceOccurrence :=
  [fortyNinthWaveV9Size8Occurrence00, fortyNinthWaveV9Size8Occurrence01, fortyNinthWaveV9Size8Occurrence02, fortyNinthWaveV9Size8Occurrence03]

theorem fortyNinthWaveV9FourSize8Occurrences_length :
    fortyNinthWaveV9FourSize8Occurrences.length = 4 := by
  rfl

theorem fortyNinthWaveV9FourSize8Occurrences_check :
    ∀ occurrence ∈ fortyNinthWaveV9FourSize8Occurrences,
      occurrence.check = true := by
  intro occurrence hoccur
  simp only [fortyNinthWaveV9FourSize8Occurrences, List.mem_cons,
    List.mem_singleton, List.not_mem_nil, or_false] at hoccur
  rcases hoccur with rfl | rfl | rfl | rfl
  · exact fortyNinthWaveV9Size8Occurrence00_check
  · exact fortyNinthWaveV9Size8Occurrence01_check
  · exact fortyNinthWaveV9Size8Occurrence02_check
  · exact fortyNinthWaveV9Size8Occurrence03_check

def fortyNinthWaveV9FourSize8SchemaClauses : Std.Sat.CNF Atom :=
  fortyNinthWaveV9FourSize8Occurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order => directions.map fun direction =>
      weightedOccurrenceClause order direction occurrence

theorem fortyNinthWaveV9FourSize8SchemaClauses_length :
    fortyNinthWaveV9FourSize8SchemaClauses.length = 16 := by
  simp [fortyNinthWaveV9FourSize8SchemaClauses,
    fortyNinthWaveV9FourSize8Occurrences, namedOrders, directions]

theorem sourceAssign_fortyNinthWaveV9FourSize8SchemaClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV9FourSize8SchemaClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortyNinthWaveV9FourSize8SchemaClauses, List.mem_flatMap,
    List.mem_map] at hclause
  rcases hclause with ⟨occurrence, hoccur, order, horder, direction,
    hdirection, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source occurrence
    (fortyNinthWaveV9FourSize8Occurrences_check occurrence hoccur)
    order direction

#print axioms fortyNinthWaveV9FourSize8Occurrences_check
#print axioms sourceAssign_fortyNinthWaveV9FourSize8SchemaClauses

end ATailBlockerVExactSeventeenFortyNinthWaveV9FourSize8Schemas
end Problem97

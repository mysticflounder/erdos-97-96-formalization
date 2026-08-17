/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-! Two source-valid size-eight V49 Kalmanson occurrences from the V6
authenticated wave mine, copied in artifact order (model SHA256 2a1eceedc3e2c2a0efcefc6c09ad8bca5f30e55e1b60a06396b6acb7bebcaa36). -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV7TwoSize8Schemas

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev Hit := Label × Label

def fortyNinthWaveV7TwoSize8Occurrence00ForwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {2, 9} },
   { center := 2, support := {1, 9} },
   { center := 13, support := {2, 3} },
   { center := 14, support := {1, 3} }]

def fortyNinthWaveV7TwoSize8Occurrence00ReverseChoices : List (RowChoice Label) :=
  [{ center := 2, support := {13, 15} },
   { center := 3, support := {13, 14} },
   { center := 14, support := {7, 15} },
   { center := 15, support := {7, 14} }]

def fortyNinthWaveV7TwoSize8Occurrence00Hits : List Hit :=
  [(1, 2), (1, 9), (2, 1), (2, 9), (13, 2), (13, 3), (14, 1), (14, 3)]

def fortyNinthWaveV7TwoSize8Occurrence00ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨1, 2, 9, 13⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 3, 13, 14⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (2, 9), right := (1, 9), path := ⟨(2, 9), [.row 2 9 1, .flip 2 1, .row 1 2 9], (1, 9)⟩ },
       { left := (1, 13), right := (1, 13), path := ⟨(1, 13), [], (1, 13)⟩ },
       { left := (3, 13), right := (2, 13), path := ⟨(3, 13), [.flip 3 13, .row 13 3 2, .flip 13 2], (2, 13)⟩ },
       { left := (1, 14), right := (3, 14), path := ⟨(1, 14), [.flip 1 14, .row 14 1 3, .flip 14 3], (3, 14)⟩ }] }

def fortyNinthWaveV7TwoSize8Occurrence00ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨2, 3, 13, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 7, 14, 15⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (3, 13), right := (3, 14), path := ⟨(3, 13), [.row 3 13 14], (3, 14)⟩ },
       { left := (2, 14), right := (2, 14), path := ⟨(2, 14), [], (2, 14)⟩ },
       { left := (7, 14), right := (7, 15), path := ⟨(7, 14), [.flip 7 14, .row 14 7 15, .flip 14 15, .row 15 14 7, .flip 15 7], (7, 15)⟩ },
       { left := (2, 15), right := (2, 13), path := ⟨(2, 15), [.row 2 15 13], (2, 13)⟩ }] }

def fortyNinthWaveV7TwoSize8Occurrence00 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV7TwoSize8Occurrence00Hits
    forwardChoices := fortyNinthWaveV7TwoSize8Occurrence00ForwardChoices
    reverseChoices := fortyNinthWaveV7TwoSize8Occurrence00ReverseChoices
    forwardData := fortyNinthWaveV7TwoSize8Occurrence00ForwardData
    reverseData := fortyNinthWaveV7TwoSize8Occurrence00ReverseData }

def fortyNinthWaveV7TwoSize8Occurrence01ForwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {4, 9} },
   { center := 4, support := {11, 14} },
   { center := 6, support := {9, 11} },
   { center := 11, support := {4, 14} }]

def fortyNinthWaveV7TwoSize8Occurrence01ReverseChoices : List (RowChoice Label) :=
  [{ center := 5, support := {2, 12} },
   { center := 10, support := {5, 7} },
   { center := 12, support := {2, 5} },
   { center := 15, support := {7, 12} }]

def fortyNinthWaveV7TwoSize8Occurrence01Hits : List Hit :=
  [(1, 4), (1, 9), (4, 11), (4, 14), (6, 9), (6, 11), (11, 4), (11, 14)]

def fortyNinthWaveV7TwoSize8Occurrence01ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨1, 4, 9, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨6, 9, 11, 14⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (1, 4), right := (1, 9), path := ⟨(1, 4), [.row 1 4 9], (1, 9)⟩ },
       { left := (9, 14), right := (9, 14), path := ⟨(9, 14), [], (9, 14)⟩ },
       { left := (6, 9), right := (6, 11), path := ⟨(6, 9), [.row 6 9 11], (6, 11)⟩ },
       { left := (11, 14), right := (4, 14), path := ⟨(11, 14), [.row 11 14 4, .flip 11 4, .row 4 11 14], (4, 14)⟩ }] }

def fortyNinthWaveV7TwoSize8Occurrence01ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨2, 5, 7, 10⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨2, 7, 12, 15⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (2, 5), right := (2, 12), path := ⟨(2, 5), [.flip 2 5, .row 5 2 12, .flip 5 12, .row 12 5 2, .flip 12 2], (2, 12)⟩ },
       { left := (7, 10), right := (5, 10), path := ⟨(7, 10), [.flip 7 10, .row 10 7 5, .flip 10 5], (5, 10)⟩ },
       { left := (2, 7), right := (2, 7), path := ⟨(2, 7), [], (2, 7)⟩ },
       { left := (12, 15), right := (7, 15), path := ⟨(12, 15), [.flip 12 15, .row 15 12 7, .flip 15 7], (7, 15)⟩ }] }

def fortyNinthWaveV7TwoSize8Occurrence01 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV7TwoSize8Occurrence01Hits
    forwardChoices := fortyNinthWaveV7TwoSize8Occurrence01ForwardChoices
    reverseChoices := fortyNinthWaveV7TwoSize8Occurrence01ReverseChoices
    forwardData := fortyNinthWaveV7TwoSize8Occurrence01ForwardData
    reverseData := fortyNinthWaveV7TwoSize8Occurrence01ReverseData }

theorem fortyNinthWaveV7TwoSize8Occurrence00_check : fortyNinthWaveV7TwoSize8Occurrence00.check = true := by
  native_decide

theorem fortyNinthWaveV7TwoSize8Occurrence01_check : fortyNinthWaveV7TwoSize8Occurrence01.check = true := by
  native_decide

def fortyNinthWaveV7TwoSize8Occurrences : List WeightedSourceOccurrence :=
  [fortyNinthWaveV7TwoSize8Occurrence00, fortyNinthWaveV7TwoSize8Occurrence01]

theorem fortyNinthWaveV7TwoSize8Occurrences_length :
    fortyNinthWaveV7TwoSize8Occurrences.length = 2 := by
  rfl

theorem fortyNinthWaveV7TwoSize8Occurrences_check :
    ∀ occurrence ∈ fortyNinthWaveV7TwoSize8Occurrences,
      occurrence.check = true := by
  intro occurrence hoccur
  simp only [fortyNinthWaveV7TwoSize8Occurrences, List.mem_cons,
    List.not_mem_nil, or_false] at hoccur
  rcases hoccur with rfl | rfl
  · exact fortyNinthWaveV7TwoSize8Occurrence00_check
  · exact fortyNinthWaveV7TwoSize8Occurrence01_check

def fortyNinthWaveV7TwoSize8SchemaClauses : Std.Sat.CNF Atom :=
  fortyNinthWaveV7TwoSize8Occurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order => directions.map fun direction =>
      weightedOccurrenceClause order direction occurrence

theorem fortyNinthWaveV7TwoSize8SchemaClauses_length :
    fortyNinthWaveV7TwoSize8SchemaClauses.length = 8 := by
  simp [fortyNinthWaveV7TwoSize8SchemaClauses,
    fortyNinthWaveV7TwoSize8Occurrences, namedOrders, directions]

theorem sourceAssign_fortyNinthWaveV7TwoSize8SchemaClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV7TwoSize8SchemaClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortyNinthWaveV7TwoSize8SchemaClauses, List.mem_flatMap,
    List.mem_map] at hclause
  rcases hclause with ⟨occurrence, hoccur, order, horder, direction,
    hdirection, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source occurrence
    (fortyNinthWaveV7TwoSize8Occurrences_check occurrence hoccur)
    order direction

#print axioms fortyNinthWaveV7TwoSize8Occurrences_check
#print axioms sourceAssign_fortyNinthWaveV7TwoSize8SchemaClauses

end ATailBlockerVExactSeventeenFortyNinthWaveV7TwoSize8Schemas
end Problem97

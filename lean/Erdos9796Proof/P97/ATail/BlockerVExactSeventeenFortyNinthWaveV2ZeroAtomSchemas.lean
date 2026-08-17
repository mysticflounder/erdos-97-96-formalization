/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-! The smallest source-valid V49 wave-v2 subset: direct atom 3108. -/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV2ZeroAtomSchemas

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev Hit := Label × Label

def fortyNinthWaveV2ZeroAtom3108ForwardChoices : List (RowChoice Label) :=
  [{ center := 5, support := {7, 11} },
   { center := 7, support := {3, 5} },
   { center := 9, support := {3, 11} },
   { center := 11, support := {5, 7} }]

def fortyNinthWaveV2ZeroAtom3108ReverseChoices : List (RowChoice Label) :=
  [{ center := 5, support := {9, 11} },
   { center := 7, support := {5, 13} },
   { center := 9, support := {11, 13} },
   { center := 11, support := {5, 9} }]

def fortyNinthWaveV2ZeroAtom3108Hits : List Hit :=
  [(5, 7), (5, 11), (7, 3), (7, 5),
   (9, 3), (9, 11), (11, 5), (11, 7)]

def fortyNinthWaveV2ZeroAtom3108ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨3, 7, 9, 11⟩, form := .adjacentSides, weight := 1 }]
    pairings := [
      { left := (3, 7), right := (7, 11),
        path := ⟨(3, 7), [.flip 3 7, .row 7 3 5, .flip 7 5,
          .row 5 7 11, .flip 5 11, .row 11 5 7, .flip 11 7], (7, 11)⟩ },
      { left := (9, 11), right := (3, 9),
        path := ⟨(9, 11), [.row 9 11 3, .flip 9 3], (3, 9)⟩ }
    ] }

def fortyNinthWaveV2ZeroAtom3108ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨5, 7, 9, 13⟩, form := .adjacentSides, weight := 1 }]
    pairings := [
      { left := (5, 7), right := (7, 13),
        path := ⟨(5, 7), [.flip 5 7, .row 7 5 13], (7, 13)⟩ },
      { left := (9, 13), right := (5, 9),
        path := ⟨(9, 13), [.row 9 13 11, .flip 9 11,
          .row 11 9 5, .flip 11 5, .row 5 11 9], (5, 9)⟩ }
    ] }

def fortyNinthWaveV2ZeroAtom3108 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV2ZeroAtom3108Hits
    forwardChoices := fortyNinthWaveV2ZeroAtom3108ForwardChoices
    reverseChoices := fortyNinthWaveV2ZeroAtom3108ReverseChoices
    forwardData := fortyNinthWaveV2ZeroAtom3108ForwardData
    reverseData := fortyNinthWaveV2ZeroAtom3108ReverseData }

theorem fortyNinthWaveV2ZeroAtom3108_check :
    fortyNinthWaveV2ZeroAtom3108.check = true := by
  native_decide

def fortyNinthWaveV2ZeroAtomWeightedOccurrences : List WeightedSourceOccurrence :=
  [fortyNinthWaveV2ZeroAtom3108]

theorem fortyNinthWaveV2ZeroAtomWeightedOccurrences_length :
    fortyNinthWaveV2ZeroAtomWeightedOccurrences.length = 1 := by
  rfl

theorem fortyNinthWaveV2ZeroAtomWeightedOccurrences_check :
    ∀ occurrence ∈ fortyNinthWaveV2ZeroAtomWeightedOccurrences,
      occurrence.check = true := by
  intro occurrence hoccur
  simp only [fortyNinthWaveV2ZeroAtomWeightedOccurrences, List.mem_singleton] at hoccur
  simpa [hoccur] using fortyNinthWaveV2ZeroAtom3108_check

def fortyNinthWaveV2ZeroAtomSchemaClauses : Std.Sat.CNF Atom :=
  fortyNinthWaveV2ZeroAtomWeightedOccurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order =>
      directions.map fun direction =>
        weightedOccurrenceClause order direction occurrence

theorem fortyNinthWaveV2ZeroAtomSchemaClauses_length :
    fortyNinthWaveV2ZeroAtomSchemaClauses.length = 4 := by
  simp [fortyNinthWaveV2ZeroAtomSchemaClauses,
    fortyNinthWaveV2ZeroAtomWeightedOccurrences, namedOrders, directions]

theorem sourceAssign_fortyNinthWaveV2ZeroAtomSchemaClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV2ZeroAtomSchemaClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortyNinthWaveV2ZeroAtomSchemaClauses, List.mem_flatMap, List.mem_map] at hclause
  rcases hclause with ⟨occurrence, hoccur, order, horder, direction, hdirection, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source occurrence
    (fortyNinthWaveV2ZeroAtomWeightedOccurrences_check occurrence hoccur) order direction

#print axioms fortyNinthWaveV2ZeroAtom3108_check
#print axioms sourceAssign_fortyNinthWaveV2ZeroAtomSchemaClauses

end ATailBlockerVExactSeventeenFortyNinthWaveV2ZeroAtomSchemas
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-! The smallest source-valid V49 wave-v3 subset: direct atom 1105. -/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV3ZeroAtomSchemas

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev Hit := Label × Label

def fortyNinthWaveV3ZeroAtom1105ForwardChoices : List (RowChoice Label) :=
  [{ center := 7, support := {8, 13} },
   { center := 8, support := {7, 10} },
   { center := 10, support := {8, 12} },
   { center := 12, support := {10, 13} },
   { center := 13, support := {0, 7} },
   { center := 16, support := {0, 12} }]

def fortyNinthWaveV3ZeroAtom1105ReverseChoices : List (RowChoice Label) :=
  [{ center := 0, support := {4, 16} },
   { center := 3, support := {9, 16} },
   { center := 4, support := {0, 3, 6} },
   { center := 6, support := {4, 8} },
   { center := 8, support := {6, 9} },
   { center := 9, support := {3, 8} }]

def fortyNinthWaveV3ZeroAtom1105Hits : List Hit :=
  [(7, 8), (7, 13), (8, 7), (8, 10), (10, 8), (10, 12),
   (12, 10), (12, 13), (12, 16), (13, 0), (13, 7), (16, 0), (16, 12)]

def fortyNinthWaveV3ZeroAtom1105ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 12, 13, 16⟩, form := .innerOuter, weight := 1 }]
    pairings := [
      { left := (12, 13), right := (0, 13),
        path := ⟨(12, 13), [.row 12 13 10, .flip 12 10,
          .row 10 12 8, .flip 10 8, .row 8 10 7, .flip 8 7,
          .row 7 8 13, .flip 7 13, .row 13 7 0, .flip 13 0], (0, 13)⟩ },
      { left := (0, 16), right := (12, 16),
        path := ⟨(0, 16), [.flip 0 16, .row 16 0 12, .flip 16 12], (12, 16)⟩ }
    ] }

def fortyNinthWaveV3ZeroAtom1105ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 3, 4, 16⟩, form := .innerOuter, weight := 1 }]
    pairings := [
      { left := (3, 4), right := (0, 4),
        path := ⟨(3, 4), [.flip 3 4, .row 4 3 0, .flip 4 0], (0, 4)⟩ },
      { left := (0, 16), right := (3, 16),
        path := ⟨(0, 16), [.row 0 16 4, .flip 0 4,
          .row 4 0 6, .flip 4 6, .row 6 4 8, .flip 6 8,
          .row 8 6 9, .flip 8 9, .row 9 8 3, .flip 9 3,
          .row 3 9 16], (3, 16)⟩ }
    ] }

def fortyNinthWaveV3ZeroAtom1105 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV3ZeroAtom1105Hits
    forwardChoices := fortyNinthWaveV3ZeroAtom1105ForwardChoices
    reverseChoices := fortyNinthWaveV3ZeroAtom1105ReverseChoices
    forwardData := fortyNinthWaveV3ZeroAtom1105ForwardData
    reverseData := fortyNinthWaveV3ZeroAtom1105ReverseData }

theorem fortyNinthWaveV3ZeroAtom1105_check :
    fortyNinthWaveV3ZeroAtom1105.check = true := by
  native_decide

def fortyNinthWaveV3ZeroAtomWeightedOccurrences : List WeightedSourceOccurrence :=
  [fortyNinthWaveV3ZeroAtom1105]

theorem fortyNinthWaveV3ZeroAtomWeightedOccurrences_length :
    fortyNinthWaveV3ZeroAtomWeightedOccurrences.length = 1 := by
  rfl

theorem fortyNinthWaveV3ZeroAtomWeightedOccurrences_check :
    ∀ occurrence ∈ fortyNinthWaveV3ZeroAtomWeightedOccurrences,
      occurrence.check = true := by
  intro occurrence hoccur
  simp only [fortyNinthWaveV3ZeroAtomWeightedOccurrences, List.mem_singleton] at hoccur
  simpa [hoccur] using fortyNinthWaveV3ZeroAtom1105_check

def fortyNinthWaveV3ZeroAtomSchemaClauses : Std.Sat.CNF Atom :=
  fortyNinthWaveV3ZeroAtomWeightedOccurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order =>
      directions.map fun direction =>
        weightedOccurrenceClause order direction occurrence

theorem fortyNinthWaveV3ZeroAtomSchemaClauses_length :
    fortyNinthWaveV3ZeroAtomSchemaClauses.length = 4 := by
  simp [fortyNinthWaveV3ZeroAtomSchemaClauses,
    fortyNinthWaveV3ZeroAtomWeightedOccurrences, namedOrders, directions]

theorem sourceAssign_fortyNinthWaveV3ZeroAtomSchemaClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV3ZeroAtomSchemaClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortyNinthWaveV3ZeroAtomSchemaClauses, List.mem_flatMap, List.mem_map] at hclause
  rcases hclause with ⟨occurrence, hoccur, order, horder, direction, hdirection, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source occurrence
    (fortyNinthWaveV3ZeroAtomWeightedOccurrences_check occurrence hoccur) order direction

#print axioms fortyNinthWaveV3ZeroAtom1105_check
#print axioms sourceAssign_fortyNinthWaveV3ZeroAtomSchemaClauses

end ATailBlockerVExactSeventeenFortyNinthWaveV3ZeroAtomSchemas
end Problem97

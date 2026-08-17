/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-! Three source-valid direct-zero V49 wave-v4 occurrences. -/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV4ThreeZeroAtomSchemas

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev Hit := Label × Label

def fortyNinthWaveV4ZeroAtom200 : WeightedSourceOccurrence :=
  { hits := [(1, 0), (1, 16), (7, 8), (7, 13), (8, 7), (8, 10),
      (10, 8), (10, 12), (12, 10), (12, 16), (13, 0), (13, 7),
      (15, 1), (15, 13), (16, 1), (16, 12)]
    forwardChoices := [{ center := 1, support := {0, 16} },
      { center := 7, support := {8, 13} }, { center := 8, support := {7, 10} },
      { center := 10, support := {8, 12} }, { center := 12, support := {10, 16} },
      { center := 13, support := {0, 7} }, { center := 15, support := {1, 13} },
      { center := 16, support := {1, 12} }]
    reverseChoices := [{ center := 0, support := {4, 15} },
      { center := 1, support := {3, 15} }, { center := 3, support := {9, 16} },
      { center := 4, support := {0, 6} }, { center := 6, support := {4, 8} },
      { center := 8, support := {6, 9} }, { center := 9, support := {3, 8} },
      { center := 15, support := {0, 16} }]
    forwardData := { terms := [{ quad := ⟨0, 1, 13, 15⟩, form := .adjacentSides, weight := 1 }], pairings := [
        { left := (0, 1), right := (0, 13), path := ⟨(0, 1),
          [.flip 0 1, .row 1 0 16, .flip 1 16, .row 16 1 12, .flip 16 12,
           .row 12 16 10, .flip 12 10, .row 10 12 8, .flip 10 8,
           .row 8 10 7, .flip 8 7, .row 7 8 13, .flip 7 13,
           .row 13 7 0, .flip 13 0], (0, 13)⟩ },
        { left := (13, 15), right := (1, 15), path := ⟨(13, 15),
          [.flip 13 15, .row 15 13 1, .flip 15 1], (1, 15)⟩ }] }
    reverseData := { terms := [{ quad := ⟨1, 3, 15, 16⟩, form := .adjacentSides, weight := 1 }], pairings := [
        { left := (1, 3), right := (1, 15), path := ⟨(1, 3), [.row 1 3 15], (1, 15)⟩ },
        { left := (15, 16), right := (3, 16), path := ⟨(15, 16),
          [.row 15 16 0, .flip 15 0, .row 0 15 4, .flip 0 4,
           .row 4 0 6, .flip 4 6, .row 6 4 8, .flip 6 8,
           .row 8 6 9, .flip 8 9, .row 9 8 3, .flip 9 3,
           .row 3 9 16], (3, 16)⟩ }] } }

def fortyNinthWaveV4ZeroAtom1347 : WeightedSourceOccurrence :=
  { hits := [(1, 5), (1, 16), (5, 3), (5, 10), (10, 5), (10, 12),
      (12, 10), (12, 16), (16, 1), (16, 3), (16, 12)]
    forwardChoices := [{ center := 1, support := {5, 16} },
      { center := 5, support := {3, 10} }, { center := 10, support := {5, 12} },
      { center := 12, support := {10, 16} }, { center := 16, support := {1, 3, 12} }]
    reverseChoices := [{ center := 0, support := {4, 13} }, { center := 4, support := {0, 6} },
      { center := 6, support := {4, 11} }, { center := 11, support := {6, 13} },
      { center := 15, support := {0, 11} }]
    forwardData := { terms := [{ quad := ⟨1, 3, 5, 16⟩, form := .innerOuter, weight := 1 }], pairings := [
        { left := (3, 5), right := (1, 5), path := ⟨(3, 5),
          [.flip 3 5, .row 5 3 10, .flip 5 10, .row 10 5 12, .flip 10 12,
           .row 12 10 16, .flip 12 16, .row 16 12 1, .flip 16 1,
           .row 1 16 5], (1, 5)⟩ },
        { left := (1, 16), right := (3, 16), path := ⟨(1, 16),
          [.flip 1 16, .row 16 1 3, .flip 16 3], (3, 16)⟩ }] }
    reverseData := { terms := [{ quad := ⟨0, 11, 13, 15⟩, form := .innerOuter, weight := 1 }], pairings := [
        { left := (11, 13), right := (0, 13), path := ⟨(11, 13),
          [.row 11 13 6, .flip 11 6, .row 6 11 4, .flip 6 4,
           .row 4 6 0, .flip 4 0, .row 0 4 13], (0, 13)⟩ },
        { left := (0, 15), right := (11, 15), path := ⟨(0, 15),
          [.flip 0 15, .row 15 0 11, .flip 15 11], (11, 15)⟩ }] } }

def fortyNinthWaveV4ZeroAtom1480 : WeightedSourceOccurrence :=
  { hits := [(1, 4), (1, 16), (6, 1), (6, 7), (7, 4), (7, 8),
      (8, 7), (8, 10), (10, 8), (10, 12), (12, 10), (12, 16),
      (16, 1), (16, 12)]
    forwardChoices := [{ center := 1, support := {4, 16} }, { center := 6, support := {1, 7} },
      { center := 7, support := {4, 8} }, { center := 8, support := {7, 10} },
      { center := 10, support := {8, 12} }, { center := 12, support := {10, 16} },
      { center := 16, support := {1, 12} }]
    reverseChoices := [{ center := 0, support := {4, 15} }, { center := 4, support := {0, 6} },
      { center := 6, support := {4, 8} }, { center := 8, support := {6, 9} },
      { center := 9, support := {8, 12} }, { center := 10, support := {9, 15} },
      { center := 15, support := {0, 12} }]
    forwardData := { terms := [{ quad := ⟨1, 4, 6, 7⟩, form := .adjacentSides, weight := 1 }], pairings := [
        { left := (1, 4), right := (4, 7), path := ⟨(1, 4),
          [.row 1 4 16, .flip 1 16, .row 16 1 12, .flip 16 12,
           .row 12 16 10, .flip 12 10, .row 10 12 8, .flip 10 8,
           .row 8 10 7, .flip 8 7, .row 7 8 4, .flip 7 4], (4, 7)⟩ },
        { left := (6, 7), right := (1, 6), path := ⟨(6, 7),
          [.row 6 7 1, .flip 6 1], (1, 6)⟩ }] }
    reverseData := { terms := [{ quad := ⟨9, 10, 12, 15⟩, form := .adjacentSides, weight := 1 }], pairings := [
        { left := (9, 10), right := (10, 15), path := ⟨(9, 10),
          [.flip 9 10, .row 10 9 15], (10, 15)⟩ },
        { left := (12, 15), right := (9, 12), path := ⟨(12, 15),
          [.flip 12 15, .row 15 12 0, .flip 15 0, .row 0 15 4,
           .flip 0 4, .row 4 0 6, .flip 4 6, .row 6 4 8, .flip 6 8,
           .row 8 6 9, .flip 8 9, .row 9 8 12], (9, 12)⟩ }] } }

theorem fortyNinthWaveV4ZeroAtom200_check : fortyNinthWaveV4ZeroAtom200.check = true := by
  native_decide
theorem fortyNinthWaveV4ZeroAtom1347_check : fortyNinthWaveV4ZeroAtom1347.check = true := by
  native_decide
theorem fortyNinthWaveV4ZeroAtom1480_check : fortyNinthWaveV4ZeroAtom1480.check = true := by
  native_decide

def fortyNinthWaveV4ThreeZeroAtomOccurrences : List WeightedSourceOccurrence :=
  [fortyNinthWaveV4ZeroAtom200, fortyNinthWaveV4ZeroAtom1347, fortyNinthWaveV4ZeroAtom1480]

theorem fortyNinthWaveV4ThreeZeroAtomOccurrences_length :
    fortyNinthWaveV4ThreeZeroAtomOccurrences.length = 3 := by
  rfl

theorem fortyNinthWaveV4ThreeZeroAtomOccurrences_check :
    ∀ occurrence ∈ fortyNinthWaveV4ThreeZeroAtomOccurrences, occurrence.check = true := by
  intro occurrence hoccur
  simp only [fortyNinthWaveV4ThreeZeroAtomOccurrences, List.mem_cons,
    List.mem_singleton, List.not_mem_nil, or_false] at hoccur
  rcases hoccur with rfl | rfl | rfl
  · exact fortyNinthWaveV4ZeroAtom200_check
  · exact fortyNinthWaveV4ZeroAtom1347_check
  · exact fortyNinthWaveV4ZeroAtom1480_check

def fortyNinthWaveV4ThreeZeroAtomSchemaClauses : Std.Sat.CNF Atom :=
  fortyNinthWaveV4ThreeZeroAtomOccurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order => directions.map fun direction =>
      weightedOccurrenceClause order direction occurrence

theorem fortyNinthWaveV4ThreeZeroAtomSchemaClauses_length :
    fortyNinthWaveV4ThreeZeroAtomSchemaClauses.length = 12 := by
  simp [fortyNinthWaveV4ThreeZeroAtomSchemaClauses,
    fortyNinthWaveV4ThreeZeroAtomOccurrences, namedOrders, directions]

theorem sourceAssign_fortyNinthWaveV4ThreeZeroAtomSchemaClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV4ThreeZeroAtomSchemaClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortyNinthWaveV4ThreeZeroAtomSchemaClauses, List.mem_flatMap, List.mem_map] at hclause
  rcases hclause with ⟨occurrence, hoccur, order, horder, direction, hdirection, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source occurrence
    (fortyNinthWaveV4ThreeZeroAtomOccurrences_check occurrence hoccur) order direction

#print axioms fortyNinthWaveV4ThreeZeroAtomOccurrences_check
#print axioms sourceAssign_fortyNinthWaveV4ThreeZeroAtomSchemaClauses

end ATailBlockerVExactSeventeenFortyNinthWaveV4ThreeZeroAtomSchemas
end Problem97

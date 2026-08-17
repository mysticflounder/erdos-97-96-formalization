/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-!
# Exact-17 V49 zero-atom weighted source adapters

This file records four zero-atom certificates from the authenticated V49
source model. It is intentionally a source-adapter bank only: it does not
extend or redefine the FortyNinth CNF root.

Authenticated V49 assignment artifact SHA-256:
e93e3f0580c8eefacd28a6d7d51eec579b195a2918060fe80387182e76e5dc71
Source-model digest:
40eb9a4df9c40d916f343ddbccdfaf15f6c9c5fd68c8b5051446cf4ec6425315

The forward atom IDs are 1232, 2271, 3458, and 3459. The exact reflected
reverse producer records are retained by their replay IDs in the definitions'
comments. All four use the existing checked weighted Kalmanson consumer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthZeroAtomSchemas

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

/-- Forward atom 1232; reflected reverse producer record 4222. -/
def zeroAtom1232 : WeightedSourceOccurrence :=
  { hits := [(0, 1), (0, 9), (1, 0), (1, 8), (2, 1), (2, 10), (9, 0), (9, 10), (10, 8), (10, 9)],
    forwardChoices := [{ center := 0, support := {1, 9} }, { center := 1, support := {0, 8} }, { center := 2, support := {1, 10} }, { center := 9, support := {0, 10} }, { center := 10, support := {8, 9} }],
    reverseChoices := [{ center := 6, support := {7, 8} }, { center := 7, support := {6, 16} }, { center := 14, support := {6, 15} }, { center := 15, support := {8, 16} }, { center := 16, support := {7, 15} }],
    forwardData := {
      terms := [{ quad := ⟨1, 2, 8, 10⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (1, 2), right := (2, 10), path := ⟨(1, 2), [.flip 1 2, .row 2 1 10], (2, 10)⟩ }, { left := (8, 10), right := (1, 8), path := ⟨(8, 10), [.flip 8 10, .row 10 8 9, .flip 10 9, .row 9 10 0, .flip 9 0, .row 0 9 1, .flip 0 1, .row 1 0 8], (1, 8)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨6, 8, 14, 15⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (6, 8), right := (8, 15), path := ⟨(6, 8), [.row 6 8 7, .flip 6 7, .row 7 6 16, .flip 7 16, .row 16 7 15, .flip 16 15, .row 15 16 8, .flip 15 8], (8, 15)⟩ }, { left := (14, 15), right := (6, 14), path := ⟨(14, 15), [.row 14 15 6, .flip 14 6], (6, 14)⟩ }] } }

theorem zeroAtom1232_check : zeroAtom1232.check = true := by
  native_decide

/-- Forward atom 2271; reflected reverse producer record 2573. -/
def zeroAtom2271 : WeightedSourceOccurrence :=
  { hits := [(0, 1), (0, 9), (1, 0), (1, 13), (4, 9), (4, 13), (9, 0), (9, 2), (13, 1), (13, 4), (14, 2), (14, 4)],
    forwardChoices := [{ center := 0, support := {1, 9} }, { center := 1, support := {0, 13} }, { center := 4, support := {9, 13} }, { center := 9, support := {0, 2} }, { center := 13, support := {1, 4} }, { center := 14, support := {2, 4} }],
    reverseChoices := [{ center := 2, support := {12, 14} }, { center := 3, support := {12, 15} }, { center := 7, support := {14, 16} }, { center := 12, support := {3, 7} }, { center := 15, support := {3, 16} }, { center := 16, support := {7, 15} }],
    forwardData := {
      terms := [{ quad := ⟨2, 4, 9, 14⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (4, 9), right := (2, 9), path := ⟨(4, 9), [.row 4 9 13, .flip 4 13, .row 13 4 1, .flip 13 1, .row 1 13 0, .flip 1 0, .row 0 1 9, .flip 0 9, .row 9 0 2, .flip 9 2], (2, 9)⟩ }, { left := (2, 14), right := (4, 14), path := ⟨(2, 14), [.flip 2 14, .row 14 2 4, .flip 14 4], (4, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 7, 12, 14⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (7, 12), right := (7, 14), path := ⟨(7, 12), [.flip 7 12, .row 12 7 3, .flip 12 3, .row 3 12 15, .flip 3 15, .row 15 3 16, .flip 15 16, .row 16 15 7, .flip 16 7, .row 7 16 14], (7, 14)⟩ }, { left := (2, 14), right := (2, 12), path := ⟨(2, 14), [.row 2 14 12], (2, 12)⟩ }] } }

theorem zeroAtom2271_check : zeroAtom2271.check = true := by
  native_decide

/-- Forward atom 3458; reflected reverse producer record 4356. -/
def zeroAtom3458 : WeightedSourceOccurrence :=
  { hits := [(0, 1), (0, 9), (1, 0), (1, 13), (4, 6), (4, 13), (8, 4), (8, 9), (9, 0), (9, 6), (13, 1), (13, 4)],
    forwardChoices := [{ center := 0, support := {1, 9} }, { center := 1, support := {0, 13} }, { center := 4, support := {6, 13} }, { center := 8, support := {4, 9} }, { center := 9, support := {0, 6} }, { center := 13, support := {1, 4} }],
    reverseChoices := [{ center := 3, support := {12, 15} }, { center := 7, support := {10, 16} }, { center := 8, support := {7, 12} }, { center := 12, support := {3, 10} }, { center := 15, support := {3, 16} }, { center := 16, support := {7, 15} }],
    forwardData := {
      terms := [{ quad := ⟨4, 6, 8, 9⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (4, 6), right := (6, 9), path := ⟨(4, 6), [.row 4 6 13, .flip 4 13, .row 13 4 1, .flip 13 1, .row 1 13 0, .flip 1 0, .row 0 1 9, .flip 0 9, .row 9 0 6, .flip 9 6], (6, 9)⟩ }, { left := (8, 9), right := (4, 8), path := ⟨(8, 9), [.row 8 9 4, .flip 8 4], (4, 8)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨7, 8, 10, 12⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (7, 8), right := (8, 12), path := ⟨(7, 8), [.flip 7 8, .row 8 7 12], (8, 12)⟩ }, { left := (10, 12), right := (7, 10), path := ⟨(10, 12), [.flip 10 12, .row 12 10 3, .flip 12 3, .row 3 12 15, .flip 3 15, .row 15 3 16, .flip 15 16, .row 16 15 7, .flip 16 7, .row 7 16 10], (7, 10)⟩ }] } }

theorem zeroAtom3458_check : zeroAtom3458.check = true := by
  native_decide

/-- Forward atom 3459; reflected reverse producer record 4357. -/
def zeroAtom3459 : WeightedSourceOccurrence :=
  { hits := [(0, 1), (0, 9), (1, 0), (1, 13), (4, 9), (4, 13), (8, 4), (8, 6), (9, 0), (9, 6), (13, 1), (13, 4)],
    forwardChoices := [{ center := 0, support := {1, 9} }, { center := 1, support := {0, 13} }, { center := 4, support := {9, 13} }, { center := 8, support := {4, 6} }, { center := 9, support := {0, 6} }, { center := 13, support := {1, 4} }],
    reverseChoices := [{ center := 3, support := {12, 15} }, { center := 7, support := {10, 16} }, { center := 8, support := {10, 12} }, { center := 12, support := {3, 7} }, { center := 15, support := {3, 16} }, { center := 16, support := {7, 15} }],
    forwardData := {
      terms := [{ quad := ⟨4, 6, 8, 9⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (6, 8), right := (4, 8), path := ⟨(6, 8), [.flip 6 8, .row 8 6 4, .flip 8 4], (4, 8)⟩ }, { left := (4, 9), right := (6, 9), path := ⟨(4, 9), [.row 4 9 13, .flip 4 13, .row 13 4 1, .flip 13 1, .row 1 13 0, .flip 1 0, .row 0 1 9, .flip 0 9, .row 9 0 6, .flip 9 6], (6, 9)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨7, 8, 10, 12⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (8, 10), right := (8, 12), path := ⟨(8, 10), [.row 8 10 12], (8, 12)⟩ }, { left := (7, 12), right := (7, 10), path := ⟨(7, 12), [.flip 7 12, .row 12 7 3, .flip 12 3, .row 3 12 15, .flip 3 15, .row 15 3 16, .flip 15 16, .row 16 15 7, .flip 16 7, .row 7 16 10], (7, 10)⟩ }] } }

theorem zeroAtom3459_check : zeroAtom3459.check = true := by
  native_decide

def fortyNinthZeroAtomWeightedOccurrences : List WeightedSourceOccurrence :=
  [zeroAtom1232, zeroAtom2271, zeroAtom3458, zeroAtom3459]

theorem fortyNinthZeroAtomWeightedOccurrences_length :
    fortyNinthZeroAtomWeightedOccurrences.length = 4 := by
  native_decide

theorem fortyNinthZeroAtomWeightedOccurrences_check :
    ∀ occurrence ∈ fortyNinthZeroAtomWeightedOccurrences,
      occurrence.check = true := by
  native_decide

def fortyNinthZeroAtomSchemaClauses : Std.Sat.CNF Atom :=
  fortyNinthZeroAtomWeightedOccurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order =>
      directions.map fun direction =>
        weightedOccurrenceClause order direction occurrence

theorem fortyNinthZeroAtomSchemaClauses_length :
    fortyNinthZeroAtomSchemaClauses.length = 16 := by
  native_decide

theorem sourceAssign_fortyNinthZeroAtomSchemaClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthZeroAtomSchemaClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortyNinthZeroAtomSchemaClauses, List.mem_flatMap, List.mem_map] at hclause
  rcases hclause with ⟨occurrence, hoccur, order, horder, direction, hdirection, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source occurrence
    (fortyNinthZeroAtomWeightedOccurrences_check occurrence hoccur) order direction

#print axioms fortyNinthZeroAtomWeightedOccurrences_check
#print axioms sourceAssign_fortyNinthZeroAtomSchemaClauses

end ATailBlockerVExactSeventeenFortyNinthZeroAtomSchemas
end Problem97

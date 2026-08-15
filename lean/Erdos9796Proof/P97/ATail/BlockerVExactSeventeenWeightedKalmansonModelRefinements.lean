/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyThirdModelRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-! Two checked order-one weighted Kalmanson occurrences. -/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenWeightedKalmansonModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenFortyThirdModelRefinements

private abbrev Hit := Label × Label

def occurrence1ForwardChoices : List (RowChoice Label) :=
  [{ center := 2, support := {1, 13} },
   { center := 13, support := {4, 1} },
   { center := 1, support := {13, 4} }]

def occurrence1ReverseChoices : List (RowChoice Label) :=
  [{ center := 14, support := {15, 3} },
   { center := 3, support := {12, 15} },
   { center := 15, support := {3, 12} }]

def occurrence1Hits : List Hit :=
  [(2, 1), (2, 13), (13, 4), (13, 1), (1, 13), (1, 4)]

def occurrence1ForwardData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨1, 2, 4, 13⟩, form := .adjacentSides, weight := 1 }]
    pairings :=
      [{ left := (1, 2), right := (2, 13),
          path := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩ },
       { left := (4, 13), right := (1, 4),
          path := ⟨(4, 13),
            [.flip 4 13, .row 13 4 1, .flip 13 1,
             .row 1 13 4], (1, 4)⟩ }] }

def occurrence1ReverseData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨3, 12, 14, 15⟩, form := .adjacentSides, weight := 1 }]
    pairings :=
      [{ left := (3, 12), right := (12, 15),
          path := ⟨(3, 12),
            [.flip 3 12, .flip 12 3, .row 3 12 15, .flip 3 15,
             .flip 15 3, .flip 3 15, .row 15 3 12, .flip 15 12],
            (12, 15)⟩ },
       { left := (14, 15), right := (3, 14),
          path := ⟨(14, 15),
            [.flip 14 15, .flip 15 14, .row 14 15 3, .flip 14 3],
            (3, 14)⟩ }] }

def occurrence1 : WeightedSourceOccurrence :=
  { hits := occurrence1Hits
    forwardChoices := occurrence1ForwardChoices
    reverseChoices := occurrence1ReverseChoices
    forwardData := occurrence1ForwardData
    reverseData := occurrence1ReverseData }

def occurrence2ForwardChoices : List (RowChoice Label) :=
  [{ center := 11, support := {12, 16} },
   { center := 8, support := {16, 5} },
   { center := 5, support := {8, 12} },
   { center := 12, support := {5, 8} }]

def occurrence2ReverseChoices : List (RowChoice Label) :=
  [{ center := 5, support := {4, 0} },
   { center := 8, support := {0, 11} },
   { center := 11, support := {8, 4} },
   { center := 4, support := {11, 8} }]

def occurrence2Hits : List Hit :=
  [(11, 12), (11, 16), (8, 16), (8, 5),
   (5, 8), (5, 12), (12, 5), (12, 8)]

def occurrence2ForwardData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨8, 11, 12, 16⟩, form := .innerOuter, weight := 1 }]
    pairings :=
      [{ left := (11, 12), right := (11, 16),
          path := ⟨(11, 12), [.row 11 12 16], (11, 16)⟩ },
       { left := (8, 16), right := (8, 12),
          path := ⟨(8, 16),
            [.row 8 16 5, .flip 8 5,
             .row 5 8 12, .flip 5 12,
             .row 12 5 8, .flip 12 8], (8, 12)⟩ }] }

def occurrence2ReverseData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 4, 5, 8⟩, form := .innerOuter, weight := 1 }]
    pairings :=
      [{ left := (4, 5), right := (0, 5),
          path := ⟨(4, 5),
            [.flip 4 5, .row 5 4 0, .flip 5 0],
            (0, 5)⟩ },
       { left := (0, 8), right := (4, 8),
          path := ⟨(0, 8),
            [.flip 0 8, .row 8 0 11, .flip 8 11,
             .flip 11 8, .flip 8 11, .row 11 8 4, .flip 11 4,
             .flip 4 11, .flip 11 4, .row 4 11 8, .flip 4 8,
             .flip 8 4], (4, 8)⟩ }] }

def occurrence2 : WeightedSourceOccurrence :=
  { hits := occurrence2Hits
    forwardChoices := occurrence2ForwardChoices
    reverseChoices := occurrence2ReverseChoices
    forwardData := occurrence2ForwardData
    reverseData := occurrence2ReverseData }

def weightedOccurrences : List WeightedSourceOccurrence := [occurrence1, occurrence2]

theorem occurrence1_check : occurrence1.check = true := by
  native_decide

theorem occurrence2_check : occurrence2.check = true := by
  native_decide

theorem weightedOccurrences_length : weightedOccurrences.length = 2 := by
  rfl

theorem weightedOccurrences_check :
    ∀ occurrence ∈ weightedOccurrences, occurrence.check = true := by
  native_decide

def weightedKalmansonModelRefinementClauses : Std.Sat.CNF Atom :=
  weightedOccurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order =>
      directions.map fun direction =>
        weightedOccurrenceClause order direction occurrence

theorem weightedKalmansonModelRefinementClauses_length :
    weightedKalmansonModelRefinementClauses.length = 8 := by
  simp [weightedKalmansonModelRefinementClauses, weightedOccurrences,
    namedOrders, directions]

theorem sourceAssign_weightedKalmansonModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ weightedKalmansonModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [weightedKalmansonModelRefinementClauses, List.mem_flatMap,
    List.mem_map] at hclause
  rcases hclause with ⟨occurrence, hoccur, order, horder, direction, hdirection, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source occurrence
    (weightedOccurrences_check occurrence hoccur) order direction

def extendedWeightedKalmansonModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedFortyThirdModelRefinementsCnf ++ weightedKalmansonModelRefinementClauses

theorem extendedWeightedKalmansonModelRefinementsCnf_length :
    extendedWeightedKalmansonModelRefinementsCnf.length = 5848828 := by
  simp [extendedWeightedKalmansonModelRefinementsCnf,
    extendedFortyThirdModelRefinementsCnf_length,
    weightedKalmansonModelRefinementClauses_length]

theorem sourceAssign_extendedWeightedKalmansonModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedWeightedKalmansonModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedWeightedKalmansonModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedFortyThirdModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_weightedKalmansonModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedWeightedKalmansonModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedWeightedKalmansonModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedWeightedKalmansonModelRefinementsCnf source⟩

#print axioms sourceAssign_weightedKalmansonModelRefinementClauses
#print axioms sourceAssign_extendedWeightedKalmansonModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedWeightedKalmansonModelRefinementsCnf_unsat

end ATailBlockerVExactSeventeenWeightedKalmansonModelRefinements
end Problem97

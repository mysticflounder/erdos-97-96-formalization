/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFourthModelRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-! Child45's checked two-term weighted Kalmanson refinement. -/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyFifthModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenFortyFourthModelRefinements
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev Hit := Label × Label

/-- The three positive positional rows in the authenticated order-one witness. -/
def child45ForwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {4, 8} },
   { center := 0, support := {8, 5} },
   { center := 13, support := {5, 4} }]

/-- Reflection of the three positive rows. -/
def child45ReverseChoices : List (RowChoice Label) :=
  [{ center := 15, support := {12, 8} },
   { center := 16, support := {8, 11} },
   { center := 3, support := {11, 12} }]

/-- The guarded Boolean support for both orientations. -/
def child45Hits : List Hit :=
  [(1, 4), (1, 8), (0, 8), (0, 5), (13, 5), (13, 4)]

/-- Atom 61 (`innerOuter`) and atom 562 (`adjacentSides`), both weight one. -/
def child45ForwardData : WeightedKalmansonCancellationData Label :=
  { terms :=
      [{ quad := ⟨0, 1, 4, 8⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 4, 5, 13⟩, form := .adjacentSides, weight := 1 }]
    pairings :=
      [{ left := (1, 4), right := (1, 8),
          path := ⟨(1, 4), [.row 1 4 8], (1, 8)⟩ },
       { left := (0, 8), right := (0, 5),
          path := ⟨(0, 8), [.row 0 8 5], (0, 5)⟩ },
       { left := (0, 4), right := (0, 4),
          path := ⟨(0, 4), [], (0, 4)⟩ },
       { left := (5, 13), right := (4, 13),
          path := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩ }] }

/-- The reflected two-atom certificate for the opposite orientation. -/
def child45ReverseData : WeightedKalmansonCancellationData Label :=
  { terms :=
      [{ quad := ⟨8, 12, 15, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨3, 11, 12, 16⟩, form := .adjacentSides, weight := 1 }]
    pairings :=
      [{ left := (12, 15), right := (8, 15),
          path := ⟨(12, 15), [.flip 12 15, .row 15 12 8, .flip 15 8], (8, 15)⟩ },
       { left := (8, 16), right := (11, 16),
          path := ⟨(8, 16), [.flip 8 16, .row 16 8 11, .flip 16 11], (11, 16)⟩ },
       { left := (12, 16), right := (12, 16),
          path := ⟨(12, 16), [], (12, 16)⟩ },
       { left := (3, 11), right := (3, 12),
          path := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩ }] }

def child45Occurrence : WeightedSourceOccurrence :=
  { hits := child45Hits
    forwardChoices := child45ForwardChoices
    reverseChoices := child45ReverseChoices
    forwardData := child45ForwardData
    reverseData := child45ReverseData }

theorem child45Occurrence_check : child45Occurrence.check = true := by
  decide

def fortyFifthModelRefinementClauses : Std.Sat.CNF Atom :=
  [child45Occurrence].flatMap fun occurrence =>
    namedOrders.flatMap fun order =>
      directions.map fun direction =>
        weightedOccurrenceClause order direction occurrence

theorem fortyFifthModelRefinementClauses_length :
    fortyFifthModelRefinementClauses.length = 4 := by
  simp [fortyFifthModelRefinementClauses, namedOrders, directions]

theorem sourceAssign_fortyFifthModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyFifthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortyFifthModelRefinementClauses, List.mem_flatMap, List.mem_map] at hclause
  rcases hclause with ⟨occurrence, hoccur, order, horder, direction, hdirection, rfl⟩
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hoccur
  subst occurrence
  exact sourceAssign_weightedOccurrenceClause source child45Occurrence
    child45Occurrence_check order direction

def extendedFortyFifthModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedFortyFourthModelRefinementsCnf ++ fortyFifthModelRefinementClauses

theorem extendedFortyFifthModelRefinementsCnf_length :
    extendedFortyFifthModelRefinementsCnf.length = 5848828 := by
  simp only [extendedFortyFifthModelRefinementsCnf, List.length_append,
    extendedFortyFourthModelRefinementsCnf_length,
    fortyFifthModelRefinementClauses_length]

theorem sourceAssign_extendedFortyFifthModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortyFifthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyFifthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedFortyFourthModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyFifthModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedFortyFifthModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortyFifthModelRefinementsCnf = true) :
    False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyFifthModelRefinementsCnf source⟩

#print axioms child45Occurrence_check
#print axioms sourceAssign_fortyFifthModelRefinementClauses
#print axioms sourceAssign_extendedFortyFifthModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedFortyFifthModelRefinementsCnf_unsat

end ATailBlockerVExactSeventeenFortyFifthModelRefinements
end Problem97

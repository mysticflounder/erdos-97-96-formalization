/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSmallRoleCycleRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-! Eight source-validated weighted Kalmanson occurrences for the exact-seventeen successor.

The occurrence order and atom supports below are the authenticated current-model
records in scratch/exact17-weighted-kalmanson-current-model-occurrences.json:
[420,3867], [199,785], [1199], [3476,4509], [3477], [3805,3825],
[3093,4377], [3932,3867].
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenFortySeventhModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSmallRoleCycleRefinements
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

def occurrence0 : WeightedSourceOccurrence :=
  { hits := [(0, 3), (0, 5), (7, 8), (7, 12), (8, 3), (8, 12), (12, 5), (12, 8)],
    forwardChoices := [{ center := 0, support := {3, 5} },
   { center := 7, support := {8, 12} },
   { center := 12, support := {5, 8} },
   { center := 8, support := {12, 3} }],
    reverseChoices := [{ center := 16, support := {13, 11} },
   { center := 9, support := {8, 4} },
   { center := 4, support := {11, 8} },
   { center := 8, support := {4, 13} }],
    forwardData := {
      terms := [{ quad := ⟨0, 3, 5, 8⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨5, 7, 8, 12⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (0, 3), right := (0, 5), path := ⟨(0, 3), [.row 0 3 5], (0, 5)⟩ },
       { left := (5, 8), right := (5, 8), path := ⟨(5, 8), [], (5, 8)⟩ },
       { left := (7, 8), right := (7, 12), path := ⟨(7, 8), [.row 7 8 12], (7, 12)⟩ },
       { left := (5, 12), right := (3, 8), path := ⟨(5, 12), [.flip 5 12, .row 12 5 8, .flip 12 8, .row 8 12 3, .flip 8 3], (3, 8)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨8, 11, 13, 16⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨4, 8, 9, 11⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (8, 11), right := (8, 11), path := ⟨(8, 11), [], (8, 11)⟩ },
       { left := (13, 16), right := (11, 16), path := ⟨(13, 16), [.flip 13 16, .row 16 13 11, .flip 16 11], (11, 16)⟩ },
       { left := (8, 9), right := (4, 9), path := ⟨(8, 9), [.flip 8 9, .row 9 8 4, .flip 9 4], (4, 9)⟩ },
       { left := (4, 11), right := (8, 13), path := ⟨(4, 11), [.row 4 11 8, .flip 4 8, .row 8 4 13], (8, 13)⟩ }] } }

theorem occurrence0_check : occurrence0.check = true := by
  native_decide
def occurrence1 : WeightedSourceOccurrence :=
  { hits := [(0, 5), (0, 15), (5, 0), (5, 15), (13, 0), (13, 1), (14, 1), (14, 5)],
    forwardChoices := [{ center := 13, support := {1, 0} },
   { center := 14, support := {5, 1} },
   { center := 0, support := {15, 5} },
   { center := 5, support := {0, 15} }],
    reverseChoices := [{ center := 3, support := {15, 16} },
   { center := 2, support := {11, 15} },
   { center := 16, support := {1, 11} },
   { center := 11, support := {16, 1} }],
    forwardData := {
      terms := [{ quad := ⟨0, 1, 13, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 5, 14, 15⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (1, 13), right := (0, 13), path := ⟨(1, 13), [.flip 1 13, .row 13 1 0, .flip 13 0], (0, 13)⟩ },
       { left := (0, 14), right := (0, 14), path := ⟨(0, 14), [], (0, 14)⟩ },
       { left := (5, 14), right := (1, 14), path := ⟨(5, 14), [.flip 5 14, .row 14 5 1, .flip 14 1], (1, 14)⟩ },
       { left := (0, 15), right := (5, 15), path := ⟨(0, 15), [.row 0 15 5, .flip 0 5, .row 5 0 15], (5, 15)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 3, 15, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 2, 11, 16⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (3, 15), right := (3, 16), path := ⟨(3, 15), [.row 3 15 16], (3, 16)⟩ },
       { left := (2, 16), right := (2, 16), path := ⟨(2, 16), [], (2, 16)⟩ },
       { left := (2, 11), right := (2, 15), path := ⟨(2, 11), [.row 2 11 15], (2, 15)⟩ },
       { left := (1, 16), right := (1, 11), path := ⟨(1, 16), [.flip 1 16, .row 16 1 11, .flip 16 11, .row 11 16 1, .flip 11 1], (1, 11)⟩ }] } }

theorem occurrence1_check : occurrence1.check = true := by
  native_decide
def occurrence2 : WeightedSourceOccurrence :=
  { hits := [(1, 10), (1, 14), (2, 6), (2, 10), (6, 1), (6, 14), (14, 1), (14, 6)],
    forwardChoices := [{ center := 2, support := {6, 10} },
   { center := 1, support := {10, 14} },
   { center := 14, support := {1, 6} },
   { center := 6, support := {14, 1} }],
    reverseChoices := [{ center := 14, support := {10, 6} },
   { center := 15, support := {6, 2} },
   { center := 2, support := {15, 10} },
   { center := 10, support := {2, 15} }],
    forwardData := {
      terms := [{ quad := ⟨1, 2, 6, 10⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (2, 6), right := (2, 10), path := ⟨(2, 6), [.row 2 6 10], (2, 10)⟩ },
       { left := (1, 10), right := (1, 6), path := ⟨(1, 10), [.row 1 10 14, .flip 1 14, .row 14 1 6, .flip 14 6, .row 6 14 1, .flip 6 1], (1, 6)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨6, 10, 14, 15⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (10, 14), right := (6, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 6, .flip 14 6], (6, 14)⟩ },
       { left := (6, 15), right := (10, 15), path := ⟨(6, 15), [.flip 6 15, .row 15 6 2, .flip 15 2, .row 2 15 10, .flip 2 10, .row 10 2 15], (10, 15)⟩ }] } }

theorem occurrence2_check : occurrence2.check = true := by
  native_decide
def occurrence3 : WeightedSourceOccurrence :=
  { hits := [(4, 6), (4, 11), (8, 10), (8, 11), (9, 4), (9, 10), (11, 4), (11, 6)],
    forwardChoices := [{ center := 4, support := {6, 11} },
   { center := 11, support := {4, 6} },
   { center := 9, support := {10, 4} },
   { center := 8, support := {11, 10} }],
    reverseChoices := [{ center := 12, support := {10, 5} },
   { center := 5, support := {12, 10} },
   { center := 7, support := {6, 12} },
   { center := 8, support := {5, 6} }],
    forwardData := {
      terms := [{ quad := ⟨4, 6, 9, 11⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨8, 9, 10, 11⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (4, 6), right := (6, 11), path := ⟨(4, 6), [.row 4 6 11, .flip 4 11, .row 11 4 6, .flip 11 6], (6, 11)⟩ },
       { left := (9, 11), right := (9, 11), path := ⟨(9, 11), [], (9, 11)⟩ },
       { left := (9, 10), right := (4, 9), path := ⟨(9, 10), [.row 9 10 4, .flip 9 4], (4, 9)⟩ },
       { left := (8, 11), right := (8, 10), path := ⟨(8, 11), [.row 8 11 10], (8, 10)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨5, 7, 10, 12⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨5, 6, 7, 8⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (5, 7), right := (5, 7), path := ⟨(5, 7), [], (5, 7)⟩ },
       { left := (10, 12), right := (5, 10), path := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5, .row 5 12 10], (5, 10)⟩ },
       { left := (6, 7), right := (7, 12), path := ⟨(6, 7), [.flip 6 7, .row 7 6 12], (7, 12)⟩ },
       { left := (5, 8), right := (6, 8), path := ⟨(5, 8), [.flip 5 8, .row 8 5 6, .flip 8 6], (6, 8)⟩ }] } }

theorem occurrence3_check : occurrence3.check = true := by
  native_decide
def occurrence4 : WeightedSourceOccurrence :=
  { hits := [(6, 7), (6, 9), (7, 6), (7, 9), (9, 4), (9, 7), (11, 4), (11, 6)],
    forwardChoices := [{ center := 6, support := {9, 7} },
   { center := 7, support := {6, 9} },
   { center := 9, support := {7, 4} },
   { center := 11, support := {4, 6} }],
    reverseChoices := [{ center := 10, support := {7, 9} },
   { center := 9, support := {10, 7} },
   { center := 7, support := {9, 12} },
   { center := 5, support := {12, 10} }],
    forwardData := {
      terms := [{ quad := ⟨4, 6, 9, 11⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (6, 9), right := (4, 9), path := ⟨(6, 9), [.row 6 9 7, .flip 6 7, .row 7 6 9, .flip 7 9, .row 9 7 4, .flip 9 4], (4, 9)⟩ },
       { left := (4, 11), right := (6, 11), path := ⟨(4, 11), [.flip 4 11, .row 11 4 6, .flip 11 6], (6, 11)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨5, 7, 10, 12⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (7, 10), right := (7, 12), path := ⟨(7, 10), [.flip 7 10, .row 10 7 9, .flip 10 9, .row 9 10 7, .flip 9 7, .row 7 9 12], (7, 12)⟩ },
       { left := (5, 12), right := (5, 10), path := ⟨(5, 12), [.row 5 12 10], (5, 10)⟩ }] } }

theorem occurrence4_check : occurrence4.check = true := by
  native_decide
def occurrence5 : WeightedSourceOccurrence :=
  { hits := [(6, 7), (6, 9), (7, 6), (7, 9), (9, 5), (9, 7), (14, 5), (14, 6)],
    forwardChoices := [{ center := 6, support := {9, 7} },
   { center := 7, support := {6, 9} },
   { center := 9, support := {7, 5} },
   { center := 14, support := {5, 6} }],
    reverseChoices := [{ center := 10, support := {7, 9} },
   { center := 9, support := {10, 7} },
   { center := 7, support := {9, 11} },
   { center := 2, support := {11, 10} }],
    forwardData := {
      terms := [{ quad := ⟨5, 6, 9, 10⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨5, 6, 10, 14⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (6, 9), right := (5, 9), path := ⟨(6, 9), [.row 6 9 7, .flip 6 7, .row 7 6 9, .flip 7 9, .row 9 7 5, .flip 9 5], (5, 9)⟩ },
       { left := (5, 10), right := (5, 10), path := ⟨(5, 10), [], (5, 10)⟩ },
       { left := (6, 10), right := (6, 10), path := ⟨(6, 10), [], (6, 10)⟩ },
       { left := (5, 14), right := (6, 14), path := ⟨(5, 14), [.flip 5 14, .row 14 5 6, .flip 14 6], (6, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨6, 7, 10, 11⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 6, 10, 11⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (7, 10), right := (7, 11), path := ⟨(7, 10), [.flip 7 10, .row 10 7 9, .flip 10 9, .row 9 10 7, .flip 9 7, .row 7 9 11], (7, 11)⟩ },
       { left := (6, 11), right := (6, 11), path := ⟨(6, 11), [], (6, 11)⟩ },
       { left := (6, 10), right := (6, 10), path := ⟨(6, 10), [], (6, 10)⟩ },
       { left := (2, 11), right := (2, 10), path := ⟨(2, 11), [.row 2 11 10], (2, 10)⟩ }] } }

theorem occurrence5_check : occurrence5.check = true := by
  native_decide
def occurrence6 : WeightedSourceOccurrence :=
  { hits := [(7, 8), (7, 12), (8, 3), (8, 12), (10, 3), (10, 7), (13, 7), (13, 8)],
    forwardChoices := [{ center := 7, support := {8, 12} },
   { center := 10, support := {3, 7} },
   { center := 8, support := {12, 3} },
   { center := 13, support := {7, 8} }],
    reverseChoices := [{ center := 9, support := {8, 4} },
   { center := 6, support := {13, 9} },
   { center := 8, support := {4, 13} },
   { center := 3, support := {9, 8} }],
    forwardData := {
      terms := [{ quad := ⟨3, 7, 8, 10⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨7, 8, 12, 13⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (7, 8), right := (7, 12), path := ⟨(7, 8), [.row 7 8 12], (7, 12)⟩ },
       { left := (3, 10), right := (7, 10), path := ⟨(3, 10), [.flip 3 10, .row 10 3 7, .flip 10 7], (7, 10)⟩ },
       { left := (8, 12), right := (3, 8), path := ⟨(8, 12), [.row 8 12 3, .flip 8 3], (3, 8)⟩ },
       { left := (7, 13), right := (8, 13), path := ⟨(7, 13), [.flip 7 13, .row 13 7 8, .flip 13 8], (8, 13)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨6, 8, 9, 13⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨3, 4, 8, 9⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (8, 9), right := (4, 9), path := ⟨(8, 9), [.flip 8 9, .row 9 8 4, .flip 9 4], (4, 9)⟩ },
       { left := (6, 13), right := (6, 9), path := ⟨(6, 13), [.row 6 13 9], (6, 9)⟩ },
       { left := (4, 8), right := (8, 13), path := ⟨(4, 8), [.flip 4 8, .row 8 4 13], (8, 13)⟩ },
       { left := (3, 9), right := (3, 8), path := ⟨(3, 9), [.row 3 9 8], (3, 8)⟩ }] } }

theorem occurrence6_check : occurrence6.check = true := by
  native_decide
def occurrence7 : WeightedSourceOccurrence :=
  { hits := [(7, 8), (7, 12), (8, 10), (8, 12), (9, 5), (9, 10), (12, 5), (12, 8)],
    forwardChoices := [{ center := 9, support := {10, 5} },
   { center := 7, support := {8, 12} },
   { center := 12, support := {5, 8} },
   { center := 8, support := {12, 10} }],
    reverseChoices := [{ center := 7, support := {6, 11} },
   { center := 9, support := {8, 4} },
   { center := 4, support := {11, 8} },
   { center := 8, support := {4, 6} }],
    forwardData := {
      terms := [{ quad := ⟨5, 8, 9, 10⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨5, 7, 8, 12⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (5, 8), right := (5, 8), path := ⟨(5, 8), [], (5, 8)⟩ },
       { left := (9, 10), right := (5, 9), path := ⟨(9, 10), [.row 9 10 5, .flip 9 5], (5, 9)⟩ },
       { left := (7, 8), right := (7, 12), path := ⟨(7, 8), [.row 7 8 12], (7, 12)⟩ },
       { left := (5, 12), right := (8, 10), path := ⟨(5, 12), [.flip 5 12, .row 12 5 8, .flip 12 8, .row 8 12 10], (8, 10)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨6, 7, 8, 11⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨4, 8, 9, 11⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (6, 7), right := (7, 11), path := ⟨(6, 7), [.flip 6 7, .row 7 6 11], (7, 11)⟩ },
       { left := (8, 11), right := (8, 11), path := ⟨(8, 11), [], (8, 11)⟩ },
       { left := (8, 9), right := (4, 9), path := ⟨(8, 9), [.flip 8 9, .row 9 8 4, .flip 9 4], (4, 9)⟩ },
       { left := (4, 11), right := (6, 8), path := ⟨(4, 11), [.row 4 11 8, .flip 4 8, .row 8 4 6, .flip 8 6], (6, 8)⟩ }] } }

theorem occurrence7_check : occurrence7.check = true := by
  native_decide
def exactOccurrences : List WeightedSourceOccurrence := [occurrence0, occurrence1, occurrence2, occurrence3, occurrence4, occurrence5, occurrence6, occurrence7]
def fortySeventhWeightedOccurrences : List WeightedSourceOccurrence := exactOccurrences

theorem fortySeventhWeightedOccurrences_length : fortySeventhWeightedOccurrences.length = 8 := by
  native_decide

theorem fortySeventhWeightedOccurrences_check :
    ∀ occurrence ∈ fortySeventhWeightedOccurrences, occurrence.check = true := by
  native_decide

def fortySeventhModelRefinementClauses : Std.Sat.CNF Atom :=
  fortySeventhWeightedOccurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order =>
      directions.map fun direction =>
        weightedOccurrenceClause order direction occurrence

theorem fortySeventhModelRefinementClauses_length :
    fortySeventhModelRefinementClauses.length = 32 := by
  native_decide

theorem sourceAssign_fortySeventhModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortySeventhModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortySeventhModelRefinementClauses, List.mem_flatMap, List.mem_map] at hclause
  rcases hclause with ⟨occurrence, hoccur, order, horder, direction, hdirection, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source occurrence
    (fortySeventhWeightedOccurrences_check occurrence hoccur) order direction

def extendedFortySeventhModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedSmallRoleCycleCnf ++ fortySeventhModelRefinementClauses

theorem extendedFortySeventhModelRefinementsCnf_length :
    extendedFortySeventhModelRefinementsCnf.length = 7198420 := by
  simp only [extendedFortySeventhModelRefinementsCnf, List.length_append,
    extendedSmallRoleCycleCnf_length,
    fortySeventhModelRefinementClauses_length]

theorem sourceAssign_extendedFortySeventhModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortySeventhModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortySeventhModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedSmallRoleCycleCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortySeventhModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedFortySeventhModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortySeventhModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortySeventhModelRefinementsCnf source⟩

#print axioms fortySeventhWeightedOccurrences_check
#print axioms sourceAssign_fortySeventhModelRefinementClauses
#print axioms sourceAssign_extendedFortySeventhModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedFortySeventhModelRefinementsCnf_unsat

end ATailBlockerVExactSeventeenFortySeventhModelRefinements
end Problem97

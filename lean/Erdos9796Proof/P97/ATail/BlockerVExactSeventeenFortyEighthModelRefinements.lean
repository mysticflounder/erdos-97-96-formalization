/- 
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortySeventhModelRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-! Thirteen source-validated weighted Kalmanson occurrences for the exact-seventeen successor.

Authenticated mine:
  scratch/exact17-weighted-kalmanson-successor-model-mine-20260816.json
  artifact SHA-256: b1bfe11046d863870647d329f4076e9ccab6b68cbafae92db264ab3fb9087e75
  parent root SHA-256: 44572a136c005d62de9c85b3b6fcf01336362bb3a50e5437d786f770a5cecdc6
  source support order:
[(0, 11), (0, 14), (5, 9), (5, 11), (6, 9), (6, 14)],
[(5, 3), (5, 9), (6, 1), (6, 9), (16, 1), (16, 3)],
[(5, 3), (5, 9), (6, 9), (6, 14), (13, 3), (13, 14)],
[(6, 7), (6, 9), (7, 5), (7, 9), (10, 5), (10, 7)],
[(9, 5), (9, 6), (12, 6), (12, 8), (14, 5), (14, 8)],
[(7, 8), (7, 12), (8, 7), (8, 12), (10, 5), (10, 7), (14, 5), (14, 8)],
[(0, 11), (0, 14), (6, 7), (6, 14), (7, 5), (7, 8), (8, 7), (8, 11), (14, 5), (14, 8)],
[(2, 6), (2, 13), (6, 9), (6, 14), (9, 5), (9, 6), (10, 5), (10, 13), (13, 9), (13, 14)],
[(2, 6), (2, 13), (6, 9), (6, 14), (9, 6), (9, 16), (11, 13), (11, 16), (13, 9), (13, 14)],
[(4, 6), (4, 11), (5, 9), (5, 11), (6, 1), (6, 9), (9, 5), (9, 6), (14, 1), (14, 5)],
[(5, 9), (5, 11), (6, 7), (6, 9), (7, 5), (7, 8), (8, 7), (8, 11), (14, 5), (14, 8)],
[(6, 7), (6, 14), (7, 5), (7, 8), (7, 12), (8, 7), (8, 12), (12, 8), (12, 14), (14, 5), (14, 8)],
[(6, 7), (6, 9), (7, 5), (7, 8), (7, 9), (7, 12), (8, 7), (8, 12), (9, 5), (9, 6), (12, 6), (12, 8)]
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyEighthModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenFortySeventhModelRefinements
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

def occurrence0 : WeightedSourceOccurrence :=
  { hits := [(0, 11), (0, 14), (5, 9), (5, 11), (6, 9), (6, 14)],
    forwardChoices := [{ center := 0, support := {11, 14} },
   { center := 5, support := {9, 11} },
   { center := 6, support := {9, 14} }],
    reverseChoices := [{ center := 10, support := {2, 7} },
   { center := 11, support := {5, 7} },
   { center := 16, support := {2, 5} }],
    forwardData := {
      terms := [{ quad := ⟨0, 6, 11, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨5, 6, 9, 11⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (6, 11), right := (6, 11), path := ⟨(6, 11), [], (6, 11)⟩ },
       { left := (0, 14), right := (0, 11), path := ⟨(0, 14), [.row 0 14 11], (0, 11)⟩ },
       { left := (6, 9), right := (6, 14), path := ⟨(6, 9), [.row 6 9 14], (6, 14)⟩ },
       { left := (5, 11), right := (5, 9), path := ⟨(5, 11), [.row 5 11 9], (5, 9)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 7, 10, 11⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 5, 11, 16⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (7, 10), right := (2, 10), path := ⟨(7, 10), [.flip 7 10, .row 10 7 2, .flip 10 2], (2, 10)⟩ },
       { left := (2, 11), right := (2, 11), path := ⟨(2, 11), [], (2, 11)⟩ },
       { left := (5, 11), right := (7, 11), path := ⟨(5, 11), [.flip 5 11, .row 11 5 7, .flip 11 7], (7, 11)⟩ },
       { left := (2, 16), right := (5, 16), path := ⟨(2, 16), [.flip 2 16, .row 16 2 5, .flip 16 5], (5, 16)⟩ }] } }

theorem occurrence0_check : occurrence0.check = true := by
  native_decide

def occurrence1 : WeightedSourceOccurrence :=
  { hits := [(5, 3), (5, 9), (6, 1), (6, 9), (16, 1), (16, 3)],
    forwardChoices := [{ center := 5, support := {3, 9} },
   { center := 6, support := {1, 9} },
   { center := 16, support := {1, 3} }],
    reverseChoices := [{ center := 0, support := {13, 15} },
   { center := 10, support := {7, 15} },
   { center := 11, support := {7, 13} }],
    forwardData := {
      terms := [{ quad := ⟨1, 3, 5, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 5, 6, 9⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (3, 5), right := (5, 9), path := ⟨(3, 5), [.flip 3 5, .row 5 3 9], (5, 9)⟩ },
       { left := (1, 16), right := (3, 16), path := ⟨(1, 16), [.flip 1 16, .row 16 1 3, .flip 16 3], (3, 16)⟩ },
       { left := (1, 5), right := (1, 5), path := ⟨(1, 5), [], (1, 5)⟩ },
       { left := (6, 9), right := (1, 6), path := ⟨(6, 9), [.row 6 9 1, .flip 6 1], (1, 6)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨0, 10, 13, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨7, 10, 11, 13⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (10, 13), right := (10, 13), path := ⟨(10, 13), [], (10, 13)⟩ },
       { left := (0, 15), right := (0, 13), path := ⟨(0, 15), [.row 0 15 13], (0, 13)⟩ },
       { left := (7, 10), right := (10, 15), path := ⟨(7, 10), [.flip 7 10, .row 10 7 15], (10, 15)⟩ },
       { left := (11, 13), right := (7, 11), path := ⟨(11, 13), [.row 11 13 7, .flip 11 7], (7, 11)⟩ }] } }

theorem occurrence1_check : occurrence1.check = true := by
  native_decide

def occurrence2 : WeightedSourceOccurrence :=
  { hits := [(5, 3), (5, 9), (6, 9), (6, 14), (13, 3), (13, 14)],
    forwardChoices := [{ center := 5, support := {3, 9} },
   { center := 6, support := {9, 14} },
   { center := 13, support := {3, 14} }],
    reverseChoices := [{ center := 3, support := {2, 13} },
   { center := 10, support := {2, 7} },
   { center := 11, support := {7, 13} }],
    forwardData := {
      terms := [{ quad := ⟨3, 5, 6, 9⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨3, 6, 13, 14⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (3, 5), right := (5, 9), path := ⟨(3, 5), [.flip 3 5, .row 5 3 9], (5, 9)⟩ },
       { left := (6, 9), right := (6, 14), path := ⟨(6, 9), [.row 6 9 14], (6, 14)⟩ },
       { left := (3, 6), right := (3, 6), path := ⟨(3, 6), [], (3, 6)⟩ },
       { left := (13, 14), right := (3, 13), path := ⟨(13, 14), [.row 13 14 3, .flip 13 3], (3, 13)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 7, 10, 11⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 3, 11, 13⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (7, 10), right := (2, 10), path := ⟨(7, 10), [.flip 7 10, .row 10 7 2, .flip 10 2], (2, 10)⟩ },
       { left := (2, 11), right := (2, 11), path := ⟨(2, 11), [], (2, 11)⟩ },
       { left := (2, 3), right := (3, 13), path := ⟨(2, 3), [.flip 2 3, .row 3 2 13], (3, 13)⟩ },
       { left := (11, 13), right := (7, 11), path := ⟨(11, 13), [.row 11 13 7, .flip 11 7], (7, 11)⟩ }] } }

theorem occurrence2_check : occurrence2.check = true := by
  native_decide

def occurrence3 : WeightedSourceOccurrence :=
  { hits := [(6, 7), (6, 9), (7, 5), (7, 9), (10, 5), (10, 7)],
    forwardChoices := [{ center := 6, support := {7, 9} },
   { center := 7, support := {5, 9} },
   { center := 10, support := {5, 7} }],
    reverseChoices := [{ center := 6, support := {9, 11} },
   { center := 9, support := {7, 11} },
   { center := 10, support := {7, 9} }],
    forwardData := {
      terms := [{ quad := ⟨6, 7, 9, 10⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨5, 6, 7, 10⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (7, 9), right := (5, 7), path := ⟨(7, 9), [.row 7 9 5, .flip 7 5], (5, 7)⟩ },
       { left := (6, 10), right := (6, 10), path := ⟨(6, 10), [], (6, 10)⟩ },
       { left := (6, 7), right := (6, 9), path := ⟨(6, 7), [.row 6 7 9], (6, 9)⟩ },
       { left := (5, 10), right := (7, 10), path := ⟨(5, 10), [.flip 5 10, .row 10 5 7, .flip 10 7], (7, 10)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨6, 7, 9, 11⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨7, 9, 10, 11⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (7, 9), right := (9, 11), path := ⟨(7, 9), [.flip 7 9, .row 9 7 11], (9, 11)⟩ },
       { left := (6, 11), right := (6, 9), path := ⟨(6, 11), [.row 6 11 9], (6, 9)⟩ },
       { left := (9, 10), right := (7, 10), path := ⟨(9, 10), [.flip 9 10, .row 10 9 7, .flip 10 7], (7, 10)⟩ },
       { left := (7, 11), right := (7, 11), path := ⟨(7, 11), [], (7, 11)⟩ }] } }

theorem occurrence3_check : occurrence3.check = true := by
  native_decide

def occurrence4 : WeightedSourceOccurrence :=
  { hits := [(9, 5), (9, 6), (12, 6), (12, 8), (14, 5), (14, 8)],
    forwardChoices := [{ center := 9, support := {5, 6} },
   { center := 12, support := {6, 8} },
   { center := 14, support := {5, 8} }],
    reverseChoices := [{ center := 2, support := {8, 11} },
   { center := 4, support := {8, 10} },
   { center := 7, support := {10, 11} }],
    forwardData := {
      terms := [{ quad := ⟨6, 8, 12, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨5, 6, 9, 14⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (8, 12), right := (6, 12), path := ⟨(8, 12), [.flip 8 12, .row 12 8 6, .flip 12 6], (6, 12)⟩ },
       { left := (6, 14), right := (6, 14), path := ⟨(6, 14), [], (6, 14)⟩ },
       { left := (6, 9), right := (5, 9), path := ⟨(6, 9), [.flip 6 9, .row 9 6 5, .flip 9 5], (5, 9)⟩ },
       { left := (5, 14), right := (8, 14), path := ⟨(5, 14), [.flip 5 14, .row 14 5 8, .flip 14 8], (8, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨4, 7, 10, 11⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 4, 8, 11⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (7, 10), right := (7, 11), path := ⟨(7, 10), [.row 7 10 11], (7, 11)⟩ },
       { left := (4, 11), right := (4, 11), path := ⟨(4, 11), [], (4, 11)⟩ },
       { left := (4, 8), right := (4, 10), path := ⟨(4, 8), [.row 4 8 10], (4, 10)⟩ },
       { left := (2, 11), right := (2, 8), path := ⟨(2, 11), [.row 2 11 8], (2, 8)⟩ }] } }

theorem occurrence4_check : occurrence4.check = true := by
  native_decide

def occurrence5 : WeightedSourceOccurrence :=
  { hits := [(7, 8), (7, 12), (8, 7), (8, 12), (10, 5), (10, 7), (14, 5), (14, 8)],
    forwardChoices := [{ center := 7, support := {8, 12} },
   { center := 8, support := {7, 12} },
   { center := 10, support := {5, 7} },
   { center := 14, support := {5, 8} }],
    reverseChoices := [{ center := 2, support := {8, 11} },
   { center := 6, support := {9, 11} },
   { center := 8, support := {4, 9} },
   { center := 9, support := {4, 8} }],
    forwardData := {
      terms := [{ quad := ⟨7, 8, 12, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨5, 7, 10, 14⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (8, 12), right := (7, 12), path := ⟨(8, 12), [.row 8 12 7, .flip 8 7, .row 7 8 12], (7, 12)⟩ },
       { left := (7, 14), right := (7, 14), path := ⟨(7, 14), [], (7, 14)⟩ },
       { left := (7, 10), right := (5, 10), path := ⟨(7, 10), [.flip 7 10, .row 10 7 5, .flip 10 5], (5, 10)⟩ },
       { left := (5, 14), right := (8, 14), path := ⟨(5, 14), [.flip 5 14, .row 14 5 8, .flip 14 8], (8, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨4, 6, 9, 11⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 4, 8, 11⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (6, 9), right := (6, 11), path := ⟨(6, 9), [.row 6 9 11], (6, 11)⟩ },
       { left := (4, 11), right := (4, 11), path := ⟨(4, 11), [], (4, 11)⟩ },
       { left := (4, 8), right := (4, 9), path := ⟨(4, 8), [.flip 4 8, .row 8 4 9, .flip 8 9, .row 9 8 4, .flip 9 4], (4, 9)⟩ },
       { left := (2, 11), right := (2, 8), path := ⟨(2, 11), [.row 2 11 8], (2, 8)⟩ }] } }

theorem occurrence5_check : occurrence5.check = true := by
  native_decide

def occurrence6 : WeightedSourceOccurrence :=
  { hits := [(0, 11), (0, 14), (6, 7), (6, 14), (7, 5), (7, 8), (8, 7), (8, 11), (14, 5), (14, 8)],
    forwardChoices := [{ center := 0, support := {11, 14} },
   { center := 6, support := {7, 14} },
   { center := 7, support := {5, 8} },
   { center := 8, support := {7, 11} },
   { center := 14, support := {5, 8} }],
    reverseChoices := [{ center := 2, support := {8, 11} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 11} },
   { center := 10, support := {2, 9} },
   { center := 16, support := {2, 5} }],
    forwardData := {
      terms := [{ quad := ⟨0, 8, 11, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨5, 6, 7, 14⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (8, 11), right := (5, 7), path := ⟨(8, 11), [.row 8 11 7, .flip 8 7, .row 7 8 5, .flip 7 5], (5, 7)⟩ },
       { left := (0, 14), right := (0, 11), path := ⟨(0, 14), [.row 0 14 11], (0, 11)⟩ },
       { left := (6, 7), right := (6, 14), path := ⟨(6, 7), [.row 6 7 14], (6, 14)⟩ },
       { left := (5, 14), right := (8, 14), path := ⟨(5, 14), [.flip 5 14, .row 14 5 8, .flip 14 8], (8, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 5, 8, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 9, 10, 11⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (5, 8), right := (9, 11), path := ⟨(5, 8), [.flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 11], (9, 11)⟩ },
       { left := (2, 16), right := (5, 16), path := ⟨(2, 16), [.flip 2 16, .row 16 2 5, .flip 16 5], (5, 16)⟩ },
       { left := (9, 10), right := (2, 10), path := ⟨(9, 10), [.flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩ },
       { left := (2, 11), right := (2, 8), path := ⟨(2, 11), [.row 2 11 8], (2, 8)⟩ }] } }

theorem occurrence6_check : occurrence6.check = true := by
  native_decide

def occurrence7 : WeightedSourceOccurrence :=
  { hits := [(2, 6), (2, 13), (6, 9), (6, 14), (9, 5), (9, 6), (10, 5), (10, 13), (13, 9), (13, 14)],
    forwardChoices := [{ center := 2, support := {6, 13} },
   { center := 6, support := {9, 14} },
   { center := 9, support := {5, 6} },
   { center := 10, support := {5, 13} },
   { center := 13, support := {9, 14} }],
    reverseChoices := [{ center := 3, support := {2, 7} },
   { center := 6, support := {3, 11} },
   { center := 7, support := {10, 11} },
   { center := 10, support := {2, 7} },
   { center := 14, support := {3, 10} }],
    forwardData := {
      terms := [{ quad := ⟨5, 9, 10, 13⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨2, 6, 13, 14⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (5, 9), right := (6, 14), path := ⟨(5, 9), [.flip 5 9, .row 9 5 6, .flip 9 6, .row 6 9 14], (6, 14)⟩ },
       { left := (10, 13), right := (5, 10), path := ⟨(10, 13), [.row 10 13 5, .flip 10 5], (5, 10)⟩ },
       { left := (2, 6), right := (2, 13), path := ⟨(2, 6), [.row 2 6 13], (2, 13)⟩ },
       { left := (13, 14), right := (9, 13), path := ⟨(13, 14), [.row 13 14 9, .flip 13 9], (9, 13)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 3, 10, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨3, 6, 7, 11⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 3), right := (3, 7), path := ⟨(2, 3), [.flip 2 3, .row 3 2 7], (3, 7)⟩ },
       { left := (10, 14), right := (3, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 3, .flip 14 3], (3, 14)⟩ },
       { left := (3, 6), right := (6, 11), path := ⟨(3, 6), [.flip 3 6, .row 6 3 11], (6, 11)⟩ },
       { left := (7, 11), right := (2, 10), path := ⟨(7, 11), [.row 7 11 10, .flip 7 10, .row 10 7 2, .flip 10 2], (2, 10)⟩ }] } }

theorem occurrence7_check : occurrence7.check = true := by
  native_decide

def occurrence8 : WeightedSourceOccurrence :=
  { hits := [(2, 6), (2, 13), (6, 9), (6, 14), (9, 6), (9, 16), (11, 13), (11, 16), (13, 9), (13, 14)],
    forwardChoices := [{ center := 2, support := {6, 13} },
   { center := 6, support := {9, 14} },
   { center := 9, support := {6, 16} },
   { center := 11, support := {13, 16} },
   { center := 13, support := {9, 14} }],
    reverseChoices := [{ center := 3, support := {2, 7} },
   { center := 5, support := {0, 3} },
   { center := 7, support := {0, 10} },
   { center := 10, support := {2, 7} },
   { center := 14, support := {3, 10} }],
    forwardData := {
      terms := [{ quad := ⟨9, 11, 13, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 6, 13, 14⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (11, 13), right := (11, 16), path := ⟨(11, 13), [.row 11 13 16], (11, 16)⟩ },
       { left := (9, 16), right := (6, 14), path := ⟨(9, 16), [.row 9 16 6, .flip 9 6, .row 6 9 14], (6, 14)⟩ },
       { left := (2, 6), right := (2, 13), path := ⟨(2, 6), [.row 2 6 13], (2, 13)⟩ },
       { left := (13, 14), right := (9, 13), path := ⟨(13, 14), [.row 13 14 9, .flip 13 9], (9, 13)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 3, 10, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨0, 3, 5, 7⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (2, 3), right := (3, 7), path := ⟨(2, 3), [.flip 2 3, .row 3 2 7], (3, 7)⟩ },
       { left := (10, 14), right := (3, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 3, .flip 14 3], (3, 14)⟩ },
       { left := (3, 5), right := (0, 5), path := ⟨(3, 5), [.flip 3 5, .row 5 3 0, .flip 5 0], (0, 5)⟩ },
       { left := (0, 7), right := (2, 10), path := ⟨(0, 7), [.flip 0 7, .row 7 0 10, .flip 7 10, .row 10 7 2, .flip 10 2], (2, 10)⟩ }] } }

theorem occurrence8_check : occurrence8.check = true := by
  native_decide

def occurrence9 : WeightedSourceOccurrence :=
  { hits := [(4, 6), (4, 11), (5, 9), (5, 11), (6, 1), (6, 9), (9, 5), (9, 6), (14, 1), (14, 5)],
    forwardChoices := [{ center := 4, support := {6, 11} },
   { center := 5, support := {9, 11} },
   { center := 6, support := {1, 9} },
   { center := 9, support := {5, 6} },
   { center := 14, support := {1, 5} }],
    reverseChoices := [{ center := 2, support := {11, 15} },
   { center := 7, support := {10, 11} },
   { center := 10, support := {7, 15} },
   { center := 11, support := {5, 7} },
   { center := 12, support := {5, 10} }],
    forwardData := {
      terms := [{ quad := ⟨4, 5, 11, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 4, 6, 14⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (5, 11), right := (1, 6), path := ⟨(5, 11), [.row 5 11 9, .flip 5 9, .row 9 5 6, .flip 9 6, .row 6 9 1, .flip 6 1], (1, 6)⟩ },
       { left := (4, 14), right := (4, 14), path := ⟨(4, 14), [], (4, 14)⟩ },
       { left := (4, 6), right := (4, 11), path := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩ },
       { left := (1, 14), right := (5, 14), path := ⟨(1, 14), [.flip 1 14, .row 14 1 5, .flip 14 5], (5, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨5, 10, 12, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 5, 11, 15⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (10, 12), right := (5, 12), path := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5], (5, 12)⟩ },
       { left := (5, 15), right := (5, 15), path := ⟨(5, 15), [], (5, 15)⟩ },
       { left := (5, 11), right := (10, 15), path := ⟨(5, 11), [.flip 5 11, .row 11 5 7, .flip 11 7, .row 7 11 10, .flip 7 10, .row 10 7 15], (10, 15)⟩ },
       { left := (2, 15), right := (2, 11), path := ⟨(2, 15), [.row 2 15 11], (2, 11)⟩ }] } }

theorem occurrence9_check : occurrence9.check = true := by
  native_decide

def occurrence10 : WeightedSourceOccurrence :=
  { hits := [(5, 9), (5, 11), (6, 7), (6, 9), (7, 5), (7, 8), (8, 7), (8, 11), (14, 5), (14, 8)],
    forwardChoices := [{ center := 5, support := {9, 11} },
   { center := 6, support := {7, 9} },
   { center := 7, support := {5, 8} },
   { center := 8, support := {7, 11} },
   { center := 14, support := {5, 8} }],
    reverseChoices := [{ center := 2, support := {8, 11} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 11} },
   { center := 10, support := {7, 9} },
   { center := 11, support := {5, 7} }],
    forwardData := {
      terms := [{ quad := ⟨5, 8, 11, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨5, 6, 7, 9⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (8, 11), right := (5, 7), path := ⟨(8, 11), [.row 8 11 7, .flip 8 7, .row 7 8 5, .flip 7 5], (5, 7)⟩ },
       { left := (5, 14), right := (8, 14), path := ⟨(5, 14), [.flip 5 14, .row 14 5 8, .flip 14 8], (8, 14)⟩ },
       { left := (6, 7), right := (6, 9), path := ⟨(6, 7), [.row 6 7 9], (6, 9)⟩ },
       { left := (5, 9), right := (5, 11), path := ⟨(5, 9), [.row 5 9 11], (5, 11)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 5, 8, 11⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨7, 9, 10, 11⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (5, 8), right := (9, 11), path := ⟨(5, 8), [.flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 11], (9, 11)⟩ },
       { left := (2, 11), right := (2, 8), path := ⟨(2, 11), [.row 2 11 8], (2, 8)⟩ },
       { left := (9, 10), right := (7, 10), path := ⟨(9, 10), [.flip 9 10, .row 10 9 7, .flip 10 7], (7, 10)⟩ },
       { left := (7, 11), right := (5, 11), path := ⟨(7, 11), [.flip 7 11, .row 11 7 5, .flip 11 5], (5, 11)⟩ }] } }

theorem occurrence10_check : occurrence10.check = true := by
  native_decide

def occurrence11 : WeightedSourceOccurrence :=
  { hits := [(6, 7), (6, 14), (7, 5), (7, 8), (7, 12), (8, 7), (8, 12), (12, 8), (12, 14), (14, 5), (14, 8)],
    forwardChoices := [{ center := 6, support := {7, 14} },
   { center := 7, support := {5, 8, 12} },
   { center := 8, support := {7, 12} },
   { center := 12, support := {8, 14} },
   { center := 14, support := {5, 8} }],
    reverseChoices := [{ center := 2, support := {8, 11} },
   { center := 4, support := {2, 8} },
   { center := 8, support := {4, 9} },
   { center := 9, support := {4, 8, 11} },
   { center := 10, support := {2, 9} }],
    forwardData := {
      terms := [{ quad := ⟨7, 8, 12, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨5, 6, 7, 14⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (7, 8), right := (7, 12), path := ⟨(7, 8), [.row 7 8 12], (7, 12)⟩ },
       { left := (12, 14), right := (5, 7), path := ⟨(12, 14), [.row 12 14 8, .flip 12 8, .row 8 12 7, .flip 8 7, .row 7 8 5, .flip 7 5], (5, 7)⟩ },
       { left := (6, 7), right := (6, 14), path := ⟨(6, 7), [.row 6 7 14], (6, 14)⟩ },
       { left := (5, 14), right := (8, 14), path := ⟨(5, 14), [.flip 5 14, .row 14 5 8, .flip 14 8], (8, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 4, 8, 9⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨2, 9, 10, 11⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (2, 4), right := (9, 11), path := ⟨(2, 4), [.flip 2 4, .row 4 2 8, .flip 4 8, .row 8 4 9, .flip 8 9, .row 9 8 11], (9, 11)⟩ },
       { left := (8, 9), right := (4, 9), path := ⟨(8, 9), [.flip 8 9, .row 9 8 4, .flip 9 4], (4, 9)⟩ },
       { left := (9, 10), right := (2, 10), path := ⟨(9, 10), [.flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩ },
       { left := (2, 11), right := (2, 8), path := ⟨(2, 11), [.row 2 11 8], (2, 8)⟩ }] } }

theorem occurrence11_check : occurrence11.check = true := by
  native_decide

def occurrence12 : WeightedSourceOccurrence :=
  { hits := [(6, 7), (6, 9), (7, 5), (7, 8), (7, 9), (7, 12), (8, 7), (8, 12), (9, 5), (9, 6), (12, 6), (12, 8)],
    forwardChoices := [{ center := 6, support := {7, 9} },
   { center := 7, support := {5, 8, 9, 12} },
   { center := 8, support := {7, 12} },
   { center := 9, support := {5, 6} },
   { center := 12, support := {6, 8} }],
    reverseChoices := [{ center := 4, support := {8, 10} },
   { center := 7, support := {10, 11} },
   { center := 8, support := {4, 9} },
   { center := 9, support := {4, 7, 8, 11} },
   { center := 10, support := {7, 9} }],
    forwardData := {
      terms := [{ quad := ⟨6, 7, 9, 12⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨5, 6, 7, 9⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (7, 9), right := (7, 12), path := ⟨(7, 9), [.row 7 9 12], (7, 12)⟩ },
       { left := (6, 12), right := (5, 7), path := ⟨(6, 12), [.flip 6 12, .row 12 6 8, .flip 12 8, .row 8 12 7, .flip 8 7, .row 7 8 5, .flip 7 5], (5, 7)⟩ },
       { left := (6, 7), right := (6, 9), path := ⟨(6, 7), [.row 6 7 9], (6, 9)⟩ },
       { left := (5, 9), right := (6, 9), path := ⟨(5, 9), [.flip 5 9, .row 9 5 6, .flip 9 6], (6, 9)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨4, 7, 9, 10⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨7, 9, 10, 11⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (7, 9), right := (9, 11), path := ⟨(7, 9), [.flip 7 9, .row 9 7 11], (9, 11)⟩ },
       { left := (4, 10), right := (4, 9), path := ⟨(4, 10), [.row 4 10 8, .flip 4 8, .row 8 4 9, .flip 8 9, .row 9 8 4, .flip 9 4], (4, 9)⟩ },
       { left := (9, 10), right := (7, 10), path := ⟨(9, 10), [.flip 9 10, .row 10 9 7, .flip 10 7], (7, 10)⟩ },
       { left := (7, 11), right := (7, 10), path := ⟨(7, 11), [.row 7 11 10], (7, 10)⟩ }] } }

theorem occurrence12_check : occurrence12.check = true := by
  native_decide
def fortyEighthWeightedOccurrences : List WeightedSourceOccurrence :=
  [occurrence0, occurrence1, occurrence2, occurrence3, occurrence4, occurrence5, occurrence6, occurrence7, occurrence8, occurrence9, occurrence10, occurrence11, occurrence12]

theorem fortyEighthWeightedOccurrences_length : fortyEighthWeightedOccurrences.length = 13 := by
  native_decide

theorem fortyEighthWeightedOccurrences_check :
    ∀ occurrence ∈ fortyEighthWeightedOccurrences, occurrence.check = true := by
  native_decide

def fortyEighthModelRefinementClauses : Std.Sat.CNF Atom :=
  fortyEighthWeightedOccurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order =>
      directions.map fun direction =>
        weightedOccurrenceClause order direction occurrence

theorem fortyEighthModelRefinementClauses_length :
    fortyEighthModelRefinementClauses.length = 52 := by
  native_decide

theorem sourceAssign_fortyEighthModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyEighthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortyEighthModelRefinementClauses, List.mem_flatMap, List.mem_map] at hclause
  rcases hclause with ⟨occurrence, hoccur, order, horder, direction, hdirection, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source occurrence
    (fortyEighthWeightedOccurrences_check occurrence hoccur) order direction

def extendedFortyEighthModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedFortySeventhModelRefinementsCnf ++ fortyEighthModelRefinementClauses

theorem extendedFortyEighthModelRefinementsCnf_length :
    extendedFortyEighthModelRefinementsCnf.length = 7198472 := by
  simp only [extendedFortyEighthModelRefinementsCnf, List.length_append,
    extendedFortySeventhModelRefinementsCnf_length,
    fortyEighthModelRefinementClauses_length]

theorem sourceAssign_extendedFortyEighthModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortyEighthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyEighthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedFortySeventhModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyEighthModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedFortyEighthModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortyEighthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyEighthModelRefinementsCnf source⟩

#print axioms fortyEighthWeightedOccurrences_check
#print axioms sourceAssign_fortyEighthModelRefinementClauses
#print axioms sourceAssign_extendedFortyEighthModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedFortyEighthModelRefinementsCnf_unsat

end ATailBlockerVExactSeventeenFortyEighthModelRefinements
end Problem97


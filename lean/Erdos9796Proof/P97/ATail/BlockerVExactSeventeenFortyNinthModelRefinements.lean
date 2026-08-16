/- 
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyEighthModelRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-! Forty-Ninth model2 source-validated weighted Kalmanson occurrences.

Authenticated mine:
  scratch/exact17-weighted-successor-model2-mine-20260816.json
  artifact SHA-256: f95698d9d28a3a82f531bec93997c14623ab4add2dd9f871b7ec71cb3cf43abf
  parent root SHA-256: a6f0f7446db91f827e2614bfe514fd545b202370cc17831a9cefc665bc5e6b1a
  source supports are encoded below in the authenticated producer order:
  0: (1, 0), (1, 14), (14, 0), (14, 1), (15, 13), (15, 14), (16, 1), (16, 13)
  1: (1, 3), (1, 10), (3, 12), (3, 16), (8, 10), (8, 12), (10, 3), (10, 16)
  2: (1, 10), (1, 14), (6, 1), (6, 14), (11, 8), (11, 10), (14, 1), (14, 8)
  3: (5, 3), (5, 7), (7, 3), (7, 6), (9, 5), (9, 7), (12, 5), (12, 6)
  4: (6, 7), (6, 9), (7, 8), (7, 12), (8, 7), (8, 12), (13, 8), (13, 9)
  5: (7, 8), (7, 12), (8, 7), (8, 12), (9, 5), (9, 7), (14, 5), (14, 8)
  6: (7, 8), (7, 12), (8, 7), (8, 12), (10, 7), (10, 16), (13, 8), (13, 16)
  7: (10, 13), (10, 16), (13, 8), (13, 16), (14, 1), (14, 8), (16, 1), (16, 13)
  8: (1, 0), (1, 14), (13, 14), (13, 16), (14, 0), (14, 1), (15, 13), (15, 16), (16, 1), (16, 13)
  9: (1, 3), (1, 10), (6, 1), (6, 7), (7, 3), (7, 8), (8, 7), (8, 10), (14, 1), (14, 8)
  10: (2, 6), (2, 10), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 10), (14, 1), (14, 8)
  11: (2, 6), (2, 10), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 10), (13, 8), (13, 14)
  12: (2, 6), (2, 13), (6, 7), (6, 14), (7, 6), (7, 8), (10, 7), (10, 13), (13, 8), (13, 14)
  13: (4, 6), (4, 11), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (14, 1), (14, 8)
  14: (4, 6), (4, 11), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (13, 8), (13, 14)
  15: (7, 8), (7, 12), (8, 7), (8, 12), (9, 5), (9, 7), (12, 5), (12, 14), (13, 8), (13, 14)
  16: (1, 3), (1, 14), (5, 7), (5, 15), (7, 3), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (15, 11), (15, 14)
  17: (1, 3), (1, 14), (6, 1), (6, 7), (7, 3), (7, 8), (8, 7), (8, 11), (14, 1), (14, 8), (15, 11), (15, 14)
  18: (1, 10), (1, 14), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 10), (12, 5), (12, 6), (14, 5), (14, 8)
  19: (2, 1), (2, 13), (4, 6), (4, 11), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 13)
  20: (2, 6), (2, 10), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 10), (15, 11), (15, 14)
  21: (2, 6), (2, 13), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (13, 8), (13, 14), (15, 11), (15, 13)
  22: (4, 6), (4, 11), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 13), (15, 13), (15, 14)
  23: (5, 3), (5, 15), (6, 7), (6, 14), (7, 3), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (15, 11), (15, 14)
  24: (5, 3), (5, 15), (7, 3), (7, 8), (8, 7), (8, 11), (10, 7), (10, 16), (11, 8), (11, 15), (15, 11), (15, 16)
  25: (5, 7), (5, 15), (7, 3), (7, 8), (8, 7), (8, 11), (10, 3), (10, 16), (11, 8), (11, 15), (15, 11), (15, 16)
  26: (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (12, 5), (12, 6), (14, 5), (14, 8), (15, 11), (15, 14)
  27: (0, 3), (0, 15), (3, 4), (3, 16), (7, 3), (7, 8), (8, 7), (8, 11), (9, 4), (9, 7), (11, 8), (11, 15), (15, 11), (15, 16)
  28: (0, 3), (0, 15), (3, 12), (3, 16), (7, 8), (7, 12), (8, 7), (8, 11), (10, 3), (10, 7), (11, 8), (11, 15), (15, 11), (15, 16)
  29: (1, 10), (1, 14), (2, 6), (2, 10), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (14, 1), (14, 8), (15, 11), (15, 14)
  30: (2, 1), (2, 10), (4, 2), (4, 11), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 10), (12, 2), (12, 6)
  31: (2, 6), (2, 10), (4, 2), (4, 11), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 10), (16, 1), (16, 2)
  32: (2, 6), (2, 10), (4, 2), (4, 11), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 10), (12, 2), (12, 14)
  33: (2, 6), (2, 13), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 13), (13, 14), (13, 16), (15, 11), (15, 16)
  34: (4, 2), (4, 15), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (12, 2), (12, 6), (15, 11), (15, 14)
  35: (4, 6), (4, 11), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (9, 4), (9, 15), (11, 8), (11, 15), (16, 1), (16, 4)
  36: (4, 6), (4, 15), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (15, 11), (15, 13), (16, 1), (16, 13)
  37: (4, 6), (4, 15), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (13, 14), (13, 16), (15, 11), (15, 16)
  38: (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (9, 5), (9, 15), (11, 8), (11, 15), (12, 5), (12, 6), (15, 11), (15, 14)
  39: (1, 0), (1, 14), (4, 6), (4, 15), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (14, 0), (14, 1), (15, 11), (15, 14)
  40: (1, 3), (1, 14), (5, 0), (5, 15), (6, 1), (6, 7), (7, 3), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (14, 0), (14, 1), (15, 11), (15, 14)
  41: (1, 3), (1, 14), (6, 1), (6, 7), (7, 3), (7, 8), (8, 7), (8, 11), (9, 5), (9, 15), (11, 8), (11, 15), (14, 1), (14, 5), (15, 11), (15, 14)
  42: (2, 1), (2, 13), (4, 2), (4, 15), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (12, 2), (12, 6), (15, 11), (15, 13)
  43: (2, 6), (2, 13), (4, 2), (4, 15), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (15, 11), (15, 13), (16, 1), (16, 2)
  44: (2, 6), (2, 13), (4, 2), (4, 15), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (12, 2), (12, 14), (15, 11), (15, 13)
  45: (5, 0), (5, 15), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (12, 5), (12, 6), (14, 0), (14, 5), (15, 11), (15, 14)
  46: (0, 2), (0, 15), (2, 6), (2, 13), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (13, 14), (13, 16), (15, 11), (15, 16), (16, 2), (16, 13)
  47: (1, 10), (1, 14), (2, 6), (2, 10), (5, 0), (5, 15), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (14, 0), (14, 1), (15, 11), (15, 14)
  48: (1, 10), (1, 14), (2, 6), (2, 10), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (9, 5), (9, 15), (11, 8), (11, 15), (14, 1), (14, 5), (15, 11), (15, 14)
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenFortyEighthModelRefinements
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

def occurrence0 : WeightedSourceOccurrence :=
  { hits := [(1, 0), (1, 14), (14, 0), (14, 1), (15, 13), (15, 14), (16, 1), (16, 13)],
    forwardChoices := [{ center := 1, support := {0, 14} },
   { center := 14, support := {0, 1} },
   { center := 15, support := {13, 14} },
   { center := 16, support := {1, 13} }],
    reverseChoices := [{ center := 0, support := {3, 15} },
   { center := 1, support := {2, 3} },
   { center := 2, support := {15, 16} },
   { center := 15, support := {2, 16} }],
    forwardData := {
      terms := [{ quad := ⟨0, 13, 14, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨0, 1, 13, 16⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (0, 13), right := (0, 13), path := ⟨(0, 13), [], (0, 13)⟩ },
       { left := (14, 15), right := (13, 15), path := ⟨(14, 15), [.flip 14 15, .row 15 14 13, .flip 15 13], (13, 15)⟩ },
       { left := (0, 1), right := (0, 14), path := ⟨(0, 1), [.flip 0 1, .row 1 0 14, .flip 1 14, .row 14 1 0, .flip 14 0], (0, 14)⟩ },
       { left := (13, 16), right := (1, 16), path := ⟨(13, 16), [.flip 13 16, .row 16 13 1, .flip 16 1], (1, 16)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨0, 1, 2, 3⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 2, 15, 16⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (1, 2), right := (1, 3), path := ⟨(1, 2), [.row 1 2 3], (1, 3)⟩ },
       { left := (0, 3), right := (0, 15), path := ⟨(0, 3), [.row 0 3 15], (0, 15)⟩ },
       { left := (0, 2), right := (0, 2), path := ⟨(0, 2), [], (0, 2)⟩ },
       { left := (15, 16), right := (2, 16), path := ⟨(15, 16), [.row 15 16 2, .flip 15 2, .row 2 15 16], (2, 16)⟩ }] } }

theorem occurrence0_check : occurrence0.check = true := by
  native_decide

def occurrence1 : WeightedSourceOccurrence :=
  { hits := [(1, 3), (1, 10), (3, 12), (3, 16), (8, 10), (8, 12), (10, 3), (10, 16)],
    forwardChoices := [{ center := 1, support := {3, 10} },
   { center := 3, support := {12, 16} },
   { center := 8, support := {10, 12} },
   { center := 10, support := {3, 16} }],
    reverseChoices := [{ center := 6, support := {0, 13} },
   { center := 8, support := {4, 6} },
   { center := 13, support := {0, 4} },
   { center := 15, support := {6, 13} }],
    forwardData := {
      terms := [{ quad := ⟨1, 3, 10, 16⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨3, 8, 10, 12⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (1, 3), right := (1, 10), path := ⟨(1, 3), [.row 1 3 10], (1, 10)⟩ },
       { left := (10, 16), right := (3, 10), path := ⟨(10, 16), [.row 10 16 3, .flip 10 3], (3, 10)⟩ },
       { left := (8, 10), right := (8, 12), path := ⟨(8, 10), [.row 8 10 12], (8, 12)⟩ },
       { left := (3, 12), right := (3, 16), path := ⟨(3, 12), [.row 3 12 16], (3, 16)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨4, 6, 8, 13⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 6, 13, 15⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (6, 8), right := (4, 8), path := ⟨(6, 8), [.flip 6 8, .row 8 6 4, .flip 8 4], (4, 8)⟩ },
       { left := (4, 13), right := (0, 13), path := ⟨(4, 13), [.flip 4 13, .row 13 4 0, .flip 13 0], (0, 13)⟩ },
       { left := (0, 6), right := (6, 13), path := ⟨(0, 6), [.flip 0 6, .row 6 0 13], (6, 13)⟩ },
       { left := (13, 15), right := (6, 15), path := ⟨(13, 15), [.flip 13 15, .row 15 13 6, .flip 15 6], (6, 15)⟩ }] } }

theorem occurrence1_check : occurrence1.check = true := by
  native_decide

def occurrence2 : WeightedSourceOccurrence :=
  { hits := [(1, 10), (1, 14), (6, 1), (6, 14), (11, 8), (11, 10), (14, 1), (14, 8)],
    forwardChoices := [{ center := 1, support := {10, 14} },
   { center := 6, support := {1, 14} },
   { center := 11, support := {8, 10} },
   { center := 14, support := {1, 8} }],
    reverseChoices := [{ center := 2, support := {8, 15} },
   { center := 5, support := {6, 8} },
   { center := 10, support := {2, 15} },
   { center := 15, support := {2, 6} }],
    forwardData := {
      terms := [{ quad := ⟨1, 8, 10, 11⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 6, 8, 14⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (1, 8), right := (1, 8), path := ⟨(1, 8), [], (1, 8)⟩ },
       { left := (10, 11), right := (8, 11), path := ⟨(10, 11), [.flip 10 11, .row 11 10 8, .flip 11 8], (8, 11)⟩ },
       { left := (1, 6), right := (6, 14), path := ⟨(1, 6), [.flip 1 6, .row 6 1 14], (6, 14)⟩ },
       { left := (8, 14), right := (1, 10), path := ⟨(8, 14), [.flip 8 14, .row 14 8 1, .flip 14 1, .row 1 14 10], (1, 10)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 5, 6, 8⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 6, 10, 15⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (5, 6), right := (5, 8), path := ⟨(5, 6), [.row 5 6 8], (5, 8)⟩ },
       { left := (2, 8), right := (6, 15), path := ⟨(2, 8), [.row 2 8 15, .flip 2 15, .row 15 2 6, .flip 15 6], (6, 15)⟩ },
       { left := (2, 6), right := (2, 6), path := ⟨(2, 6), [], (2, 6)⟩ },
       { left := (10, 15), right := (2, 10), path := ⟨(10, 15), [.row 10 15 2, .flip 10 2], (2, 10)⟩ }] } }

theorem occurrence2_check : occurrence2.check = true := by
  native_decide

def occurrence3 : WeightedSourceOccurrence :=
  { hits := [(5, 3), (5, 7), (7, 3), (7, 6), (9, 5), (9, 7), (12, 5), (12, 6)],
    forwardChoices := [{ center := 5, support := {3, 7} },
   { center := 7, support := {3, 6} },
   { center := 9, support := {5, 7} },
   { center := 12, support := {5, 6} }],
    reverseChoices := [{ center := 4, support := {10, 11} },
   { center := 7, support := {9, 11} },
   { center := 9, support := {10, 13} },
   { center := 11, support := {9, 13} }],
    forwardData := {
      terms := [{ quad := ⟨5, 6, 7, 12⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨3, 5, 7, 9⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (6, 7), right := (3, 7), path := ⟨(6, 7), [.flip 6 7, .row 7 6 3, .flip 7 3], (3, 7)⟩ },
       { left := (5, 12), right := (6, 12), path := ⟨(5, 12), [.flip 5 12, .row 12 5 6, .flip 12 6], (6, 12)⟩ },
       { left := (3, 5), right := (5, 7), path := ⟨(3, 5), [.flip 3 5, .row 5 3 7], (5, 7)⟩ },
       { left := (7, 9), right := (5, 9), path := ⟨(7, 9), [.flip 7 9, .row 9 7 5, .flip 9 5], (5, 9)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨7, 9, 11, 13⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨4, 9, 10, 11⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (7, 9), right := (7, 11), path := ⟨(7, 9), [.row 7 9 11], (7, 11)⟩ },
       { left := (11, 13), right := (9, 11), path := ⟨(11, 13), [.row 11 13 9, .flip 11 9], (9, 11)⟩ },
       { left := (9, 10), right := (9, 13), path := ⟨(9, 10), [.row 9 10 13], (9, 13)⟩ },
       { left := (4, 11), right := (4, 10), path := ⟨(4, 11), [.row 4 11 10], (4, 10)⟩ }] } }

theorem occurrence3_check : occurrence3.check = true := by
  native_decide

def occurrence4 : WeightedSourceOccurrence :=
  { hits := [(6, 7), (6, 9), (7, 8), (7, 12), (8, 7), (8, 12), (13, 8), (13, 9)],
    forwardChoices := [{ center := 6, support := {7, 9} },
   { center := 7, support := {8, 12} },
   { center := 8, support := {7, 12} },
   { center := 13, support := {8, 9} }],
    reverseChoices := [{ center := 3, support := {7, 8} },
   { center := 8, support := {4, 9} },
   { center := 9, support := {4, 8} },
   { center := 10, support := {7, 9} }],
    forwardData := {
      terms := [{ quad := ⟨7, 8, 12, 13⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨6, 7, 9, 13⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (8, 12), right := (7, 12), path := ⟨(8, 12), [.row 8 12 7, .flip 8 7, .row 7 8 12], (7, 12)⟩ },
       { left := (7, 13), right := (7, 13), path := ⟨(7, 13), [], (7, 13)⟩ },
       { left := (6, 7), right := (6, 9), path := ⟨(6, 7), [.row 6 7 9], (6, 9)⟩ },
       { left := (9, 13), right := (8, 13), path := ⟨(9, 13), [.flip 9 13, .row 13 9 8, .flip 13 8], (8, 13)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨3, 4, 8, 9⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨3, 7, 9, 10⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (4, 8), right := (4, 9), path := ⟨(4, 8), [.flip 4 8, .row 8 4 9, .flip 8 9, .row 9 8 4, .flip 9 4], (4, 9)⟩ },
       { left := (3, 9), right := (3, 9), path := ⟨(3, 9), [], (3, 9)⟩ },
       { left := (3, 7), right := (3, 8), path := ⟨(3, 7), [.row 3 7 8], (3, 8)⟩ },
       { left := (9, 10), right := (7, 10), path := ⟨(9, 10), [.flip 9 10, .row 10 9 7, .flip 10 7], (7, 10)⟩ }] } }

theorem occurrence4_check : occurrence4.check = true := by
  native_decide

def occurrence5 : WeightedSourceOccurrence :=
  { hits := [(7, 8), (7, 12), (8, 7), (8, 12), (9, 5), (9, 7), (14, 5), (14, 8)],
    forwardChoices := [{ center := 7, support := {8, 12} },
   { center := 8, support := {7, 12} },
   { center := 9, support := {5, 7} },
   { center := 14, support := {5, 8} }],
    reverseChoices := [{ center := 2, support := {8, 11} },
   { center := 7, support := {9, 11} },
   { center := 8, support := {4, 9} },
   { center := 9, support := {4, 8} }],
    forwardData := {
      terms := [{ quad := ⟨7, 8, 12, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨5, 7, 9, 14⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (8, 12), right := (7, 12), path := ⟨(8, 12), [.row 8 12 7, .flip 8 7, .row 7 8 12], (7, 12)⟩ },
       { left := (7, 14), right := (7, 14), path := ⟨(7, 14), [], (7, 14)⟩ },
       { left := (7, 9), right := (5, 9), path := ⟨(7, 9), [.flip 7 9, .row 9 7 5, .flip 9 5], (5, 9)⟩ },
       { left := (5, 14), right := (8, 14), path := ⟨(5, 14), [.flip 5 14, .row 14 5 8, .flip 14 8], (8, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨4, 7, 9, 11⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 4, 8, 11⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (7, 9), right := (7, 11), path := ⟨(7, 9), [.row 7 9 11], (7, 11)⟩ },
       { left := (4, 11), right := (4, 11), path := ⟨(4, 11), [], (4, 11)⟩ },
       { left := (4, 8), right := (4, 9), path := ⟨(4, 8), [.flip 4 8, .row 8 4 9, .flip 8 9, .row 9 8 4, .flip 9 4], (4, 9)⟩ },
       { left := (2, 11), right := (2, 8), path := ⟨(2, 11), [.row 2 11 8], (2, 8)⟩ }] } }

theorem occurrence5_check : occurrence5.check = true := by
  native_decide

def occurrence6 : WeightedSourceOccurrence :=
  { hits := [(7, 8), (7, 12), (8, 7), (8, 12), (10, 7), (10, 16), (13, 8), (13, 16)],
    forwardChoices := [{ center := 7, support := {8, 12} },
   { center := 8, support := {7, 12} },
   { center := 10, support := {7, 16} },
   { center := 13, support := {8, 16} }],
    reverseChoices := [{ center := 3, support := {0, 8} },
   { center := 6, support := {0, 9} },
   { center := 8, support := {4, 9} },
   { center := 9, support := {4, 8} }],
    forwardData := {
      terms := [{ quad := ⟨7, 8, 12, 13⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨7, 10, 13, 16⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (8, 12), right := (7, 12), path := ⟨(8, 12), [.row 8 12 7, .flip 8 7, .row 7 8 12], (7, 12)⟩ },
       { left := (7, 13), right := (7, 13), path := ⟨(7, 13), [], (7, 13)⟩ },
       { left := (7, 10), right := (10, 16), path := ⟨(7, 10), [.flip 7 10, .row 10 7 16], (10, 16)⟩ },
       { left := (13, 16), right := (8, 13), path := ⟨(13, 16), [.row 13 16 8, .flip 13 8], (8, 13)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨3, 4, 8, 9⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 3, 6, 9⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (4, 8), right := (4, 9), path := ⟨(4, 8), [.flip 4 8, .row 8 4 9, .flip 8 9, .row 9 8 4, .flip 9 4], (4, 9)⟩ },
       { left := (3, 9), right := (3, 9), path := ⟨(3, 9), [], (3, 9)⟩ },
       { left := (0, 3), right := (3, 8), path := ⟨(0, 3), [.flip 0 3, .row 3 0 8], (3, 8)⟩ },
       { left := (6, 9), right := (0, 6), path := ⟨(6, 9), [.row 6 9 0, .flip 6 0], (0, 6)⟩ }] } }

theorem occurrence6_check : occurrence6.check = true := by
  native_decide

def occurrence7 : WeightedSourceOccurrence :=
  { hits := [(10, 13), (10, 16), (13, 8), (13, 16), (14, 1), (14, 8), (16, 1), (16, 13)],
    forwardChoices := [{ center := 10, support := {13, 16} },
   { center := 13, support := {8, 16} },
   { center := 14, support := {1, 8} },
   { center := 16, support := {1, 13} }],
    reverseChoices := [{ center := 0, support := {3, 15} },
   { center := 2, support := {8, 15} },
   { center := 3, support := {0, 8} },
   { center := 6, support := {0, 3} }],
    forwardData := {
      terms := [{ quad := ⟨8, 10, 13, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 8, 14, 16⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (10, 13), right := (10, 16), path := ⟨(10, 13), [.row 10 13 16], (10, 16)⟩ },
       { left := (8, 16), right := (8, 16), path := ⟨(8, 16), [], (8, 16)⟩ },
       { left := (8, 14), right := (1, 14), path := ⟨(8, 14), [.flip 8 14, .row 14 8 1, .flip 14 1], (1, 14)⟩ },
       { left := (1, 16), right := (8, 13), path := ⟨(1, 16), [.flip 1 16, .row 16 1 13, .flip 16 13, .row 13 16 8, .flip 13 8], (8, 13)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 3, 6, 8⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 2, 6, 15⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (3, 6), right := (0, 6), path := ⟨(3, 6), [.flip 3 6, .row 6 3 0, .flip 6 0], (0, 6)⟩ },
       { left := (2, 8), right := (2, 15), path := ⟨(2, 8), [.row 2 8 15], (2, 15)⟩ },
       { left := (2, 6), right := (2, 6), path := ⟨(2, 6), [], (2, 6)⟩ },
       { left := (0, 15), right := (3, 8), path := ⟨(0, 15), [.row 0 15 3, .flip 0 3, .row 3 0 8], (3, 8)⟩ }] } }

theorem occurrence7_check : occurrence7.check = true := by
  native_decide

def occurrence8 : WeightedSourceOccurrence :=
  { hits := [(1, 0), (1, 14), (13, 14), (13, 16), (14, 0), (14, 1), (15, 13), (15, 16), (16, 1), (16, 13)],
    forwardChoices := [{ center := 1, support := {0, 14} },
   { center := 13, support := {14, 16} },
   { center := 14, support := {0, 1} },
   { center := 15, support := {13, 16} },
   { center := 16, support := {1, 13} }],
    reverseChoices := [{ center := 0, support := {3, 15} },
   { center := 1, support := {0, 3} },
   { center := 2, support := {15, 16} },
   { center := 3, support := {0, 2} },
   { center := 15, support := {2, 16} }],
    forwardData := {
      terms := [{ quad := ⟨0, 13, 14, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 1, 15, 16⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (13, 14), right := (1, 16), path := ⟨(13, 14), [.row 13 14 16, .flip 13 16, .row 16 13 1, .flip 16 1], (1, 16)⟩ },
       { left := (0, 15), right := (0, 15), path := ⟨(0, 15), [], (0, 15)⟩ },
       { left := (0, 1), right := (0, 14), path := ⟨(0, 1), [.flip 0 1, .row 1 0 14, .flip 1 14, .row 14 1 0, .flip 14 0], (0, 14)⟩ },
       { left := (15, 16), right := (13, 15), path := ⟨(15, 16), [.row 15 16 13, .flip 15 13], (13, 15)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨1, 2, 3, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 1, 15, 16⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 3), right := (0, 15), path := ⟨(2, 3), [.flip 2 3, .row 3 2 0, .flip 3 0, .row 0 3 15], (0, 15)⟩ },
       { left := (1, 16), right := (1, 16), path := ⟨(1, 16), [], (1, 16)⟩ },
       { left := (0, 1), right := (1, 3), path := ⟨(0, 1), [.flip 0 1, .row 1 0 3], (1, 3)⟩ },
       { left := (15, 16), right := (2, 16), path := ⟨(15, 16), [.row 15 16 2, .flip 15 2, .row 2 15 16], (2, 16)⟩ }] } }

theorem occurrence8_check : occurrence8.check = true := by
  native_decide

def occurrence9 : WeightedSourceOccurrence :=
  { hits := [(1, 3), (1, 10), (6, 1), (6, 7), (7, 3), (7, 8), (8, 7), (8, 10), (14, 1), (14, 8)],
    forwardChoices := [{ center := 1, support := {3, 10} },
   { center := 6, support := {1, 7} },
   { center := 7, support := {3, 8} },
   { center := 8, support := {7, 10} },
   { center := 14, support := {1, 8} }],
    reverseChoices := [{ center := 2, support := {8, 15} },
   { center := 8, support := {6, 9} },
   { center := 9, support := {8, 13} },
   { center := 10, support := {9, 15} },
   { center := 15, support := {6, 13} }],
    forwardData := {
      terms := [{ quad := ⟨1, 8, 10, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 3, 6, 7⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (8, 10), right := (3, 7), path := ⟨(8, 10), [.row 8 10 7, .flip 8 7, .row 7 8 3, .flip 7 3], (3, 7)⟩ },
       { left := (1, 14), right := (8, 14), path := ⟨(1, 14), [.flip 1 14, .row 14 1 8, .flip 14 8], (8, 14)⟩ },
       { left := (1, 3), right := (1, 10), path := ⟨(1, 3), [.row 1 3 10], (1, 10)⟩ },
       { left := (6, 7), right := (1, 6), path := ⟨(6, 7), [.row 6 7 1, .flip 6 1], (1, 6)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨9, 10, 13, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨2, 6, 8, 15⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (9, 10), right := (10, 15), path := ⟨(9, 10), [.flip 9 10, .row 10 9 15], (10, 15)⟩ },
       { left := (13, 15), right := (6, 15), path := ⟨(13, 15), [.flip 13 15, .row 15 13 6, .flip 15 6], (6, 15)⟩ },
       { left := (6, 8), right := (9, 13), path := ⟨(6, 8), [.flip 6 8, .row 8 6 9, .flip 8 9, .row 9 8 13], (9, 13)⟩ },
       { left := (2, 15), right := (2, 8), path := ⟨(2, 15), [.row 2 15 8], (2, 8)⟩ }] } }

theorem occurrence9_check : occurrence9.check = true := by
  native_decide

def occurrence10 : WeightedSourceOccurrence :=
  { hits := [(2, 6), (2, 10), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 10), (14, 1), (14, 8)],
    forwardChoices := [{ center := 2, support := {6, 10} },
   { center := 6, support := {1, 7} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 10} },
   { center := 14, support := {1, 8} }],
    reverseChoices := [{ center := 2, support := {8, 15} },
   { center := 8, support := {6, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {9, 15} },
   { center := 14, support := {6, 10} }],
    forwardData := {
      terms := [{ quad := ⟨2, 8, 10, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 2, 6, 14⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (8, 10), right := (1, 6), path := ⟨(8, 10), [.row 8 10 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 1, .flip 6 1], (1, 6)⟩ },
       { left := (2, 14), right := (2, 14), path := ⟨(2, 14), [], (2, 14)⟩ },
       { left := (2, 6), right := (2, 10), path := ⟨(2, 6), [.row 2 6 10], (2, 10)⟩ },
       { left := (1, 14), right := (8, 14), path := ⟨(1, 14), [.flip 1 14, .row 14 1 8, .flip 14 8], (8, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨6, 10, 14, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 6, 8, 15⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (10, 14), right := (6, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 6, .flip 14 6], (6, 14)⟩ },
       { left := (6, 15), right := (6, 15), path := ⟨(6, 15), [], (6, 15)⟩ },
       { left := (6, 8), right := (10, 15), path := ⟨(6, 8), [.flip 6 8, .row 8 6 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 15], (10, 15)⟩ },
       { left := (2, 15), right := (2, 8), path := ⟨(2, 15), [.row 2 15 8], (2, 8)⟩ }] } }

theorem occurrence10_check : occurrence10.check = true := by
  native_decide

def occurrence11 : WeightedSourceOccurrence :=
  { hits := [(2, 6), (2, 10), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 10), (13, 8), (13, 14)],
    forwardChoices := [{ center := 2, support := {6, 10} },
   { center := 6, support := {7, 14} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 10} },
   { center := 13, support := {8, 14} }],
    reverseChoices := [{ center := 3, support := {2, 8} },
   { center := 8, support := {6, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {2, 9} },
   { center := 14, support := {6, 10} }],
    forwardData := {
      terms := [{ quad := ⟨2, 6, 13, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨2, 8, 10, 13⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (2, 6), right := (2, 10), path := ⟨(2, 6), [.row 2 6 10], (2, 10)⟩ },
       { left := (13, 14), right := (8, 13), path := ⟨(13, 14), [.row 13 14 8, .flip 13 8], (8, 13)⟩ },
       { left := (8, 10), right := (6, 14), path := ⟨(8, 10), [.row 8 10 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 14], (6, 14)⟩ },
       { left := (2, 13), right := (2, 13), path := ⟨(2, 13), [], (2, 13)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 6, 10, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨2, 3, 6, 8⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 6), right := (2, 6), path := ⟨(2, 6), [], (2, 6)⟩ },
       { left := (10, 14), right := (6, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 6, .flip 14 6], (6, 14)⟩ },
       { left := (2, 3), right := (3, 8), path := ⟨(2, 3), [.flip 2 3, .row 3 2 8], (3, 8)⟩ },
       { left := (6, 8), right := (2, 10), path := ⟨(6, 8), [.flip 6 8, .row 8 6 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩ }] } }

theorem occurrence11_check : occurrence11.check = true := by
  native_decide

def occurrence12 : WeightedSourceOccurrence :=
  { hits := [(2, 6), (2, 13), (6, 7), (6, 14), (7, 6), (7, 8), (10, 7), (10, 13), (13, 8), (13, 14)],
    forwardChoices := [{ center := 2, support := {6, 13} },
   { center := 6, support := {7, 14} },
   { center := 7, support := {6, 8} },
   { center := 10, support := {7, 13} },
   { center := 13, support := {8, 14} }],
    reverseChoices := [{ center := 3, support := {2, 8} },
   { center := 6, support := {3, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {2, 9} },
   { center := 14, support := {3, 10} }],
    forwardData := {
      terms := [{ quad := ⟨2, 6, 13, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨7, 8, 10, 13⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 6), right := (2, 13), path := ⟨(2, 6), [.row 2 6 13], (2, 13)⟩ },
       { left := (13, 14), right := (8, 13), path := ⟨(13, 14), [.row 13 14 8, .flip 13 8], (8, 13)⟩ },
       { left := (7, 8), right := (6, 14), path := ⟨(7, 8), [.row 7 8 6, .flip 7 6, .row 6 7 14], (6, 14)⟩ },
       { left := (10, 13), right := (7, 10), path := ⟨(10, 13), [.row 10 13 7, .flip 10 7], (7, 10)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 3, 10, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨3, 6, 8, 9⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 3), right := (3, 8), path := ⟨(2, 3), [.flip 2 3, .row 3 2 8], (3, 8)⟩ },
       { left := (10, 14), right := (3, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 3, .flip 14 3], (3, 14)⟩ },
       { left := (3, 6), right := (6, 9), path := ⟨(3, 6), [.flip 3 6, .row 6 3 9], (6, 9)⟩ },
       { left := (8, 9), right := (2, 10), path := ⟨(8, 9), [.flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩ }] } }

theorem occurrence12_check : occurrence12.check = true := by
  native_decide

def occurrence13 : WeightedSourceOccurrence :=
  { hits := [(4, 6), (4, 11), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (14, 1), (14, 8)],
    forwardChoices := [{ center := 4, support := {6, 11} },
   { center := 6, support := {1, 7} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 14, support := {1, 8} }],
    reverseChoices := [{ center := 2, support := {8, 15} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {9, 15} },
   { center := 12, support := {5, 10} }],
    forwardData := {
      terms := [{ quad := ⟨4, 8, 11, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 4, 6, 14⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (8, 11), right := (1, 6), path := ⟨(8, 11), [.row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 1, .flip 6 1], (1, 6)⟩ },
       { left := (4, 14), right := (4, 14), path := ⟨(4, 14), [], (4, 14)⟩ },
       { left := (4, 6), right := (4, 11), path := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩ },
       { left := (1, 14), right := (8, 14), path := ⟨(1, 14), [.flip 1 14, .row 14 1 8, .flip 14 8], (8, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨5, 10, 12, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 5, 8, 15⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (10, 12), right := (5, 12), path := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5], (5, 12)⟩ },
       { left := (5, 15), right := (5, 15), path := ⟨(5, 15), [], (5, 15)⟩ },
       { left := (5, 8), right := (10, 15), path := ⟨(5, 8), [.flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 15], (10, 15)⟩ },
       { left := (2, 15), right := (2, 8), path := ⟨(2, 15), [.row 2 15 8], (2, 8)⟩ }] } }

theorem occurrence13_check : occurrence13.check = true := by
  native_decide

def occurrence14 : WeightedSourceOccurrence :=
  { hits := [(4, 6), (4, 11), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (13, 8), (13, 14)],
    forwardChoices := [{ center := 4, support := {6, 11} },
   { center := 6, support := {7, 14} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 13, support := {8, 14} }],
    reverseChoices := [{ center := 3, support := {2, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {2, 9} },
   { center := 12, support := {5, 10} }],
    forwardData := {
      terms := [{ quad := ⟨4, 6, 13, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨4, 8, 11, 13⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (4, 6), right := (4, 11), path := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩ },
       { left := (13, 14), right := (8, 13), path := ⟨(13, 14), [.row 13 14 8, .flip 13 8], (8, 13)⟩ },
       { left := (8, 11), right := (6, 14), path := ⟨(8, 11), [.row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 14], (6, 14)⟩ },
       { left := (4, 13), right := (4, 13), path := ⟨(4, 13), [], (4, 13)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 5, 10, 12⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨2, 3, 5, 8⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 5), right := (2, 5), path := ⟨(2, 5), [], (2, 5)⟩ },
       { left := (10, 12), right := (5, 12), path := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5], (5, 12)⟩ },
       { left := (2, 3), right := (3, 8), path := ⟨(2, 3), [.flip 2 3, .row 3 2 8], (3, 8)⟩ },
       { left := (5, 8), right := (2, 10), path := ⟨(5, 8), [.flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩ }] } }

theorem occurrence14_check : occurrence14.check = true := by
  native_decide

def occurrence15 : WeightedSourceOccurrence :=
  { hits := [(7, 8), (7, 12), (8, 7), (8, 12), (9, 5), (9, 7), (12, 5), (12, 14), (13, 8), (13, 14)],
    forwardChoices := [{ center := 7, support := {8, 12} },
   { center := 8, support := {7, 12} },
   { center := 9, support := {5, 7} },
   { center := 12, support := {5, 14} },
   { center := 13, support := {8, 14} }],
    reverseChoices := [{ center := 3, support := {2, 8} },
   { center := 4, support := {2, 11} },
   { center := 7, support := {9, 11} },
   { center := 8, support := {4, 9} },
   { center := 9, support := {4, 8} }],
    forwardData := {
      terms := [{ quad := ⟨5, 7, 9, 12⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨8, 12, 13, 14⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (7, 9), right := (5, 9), path := ⟨(7, 9), [.flip 7 9, .row 9 7 5, .flip 9 5], (5, 9)⟩ },
       { left := (5, 12), right := (12, 14), path := ⟨(5, 12), [.flip 5 12, .row 12 5 14], (12, 14)⟩ },
       { left := (8, 12), right := (7, 12), path := ⟨(8, 12), [.row 8 12 7, .flip 8 7, .row 7 8 12], (7, 12)⟩ },
       { left := (13, 14), right := (8, 13), path := ⟨(13, 14), [.row 13 14 8, .flip 13 8], (8, 13)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨4, 7, 9, 11⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 3, 4, 8⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (7, 9), right := (7, 11), path := ⟨(7, 9), [.row 7 9 11], (7, 11)⟩ },
       { left := (4, 11), right := (2, 4), path := ⟨(4, 11), [.row 4 11 2, .flip 4 2], (2, 4)⟩ },
       { left := (2, 3), right := (3, 8), path := ⟨(2, 3), [.flip 2 3, .row 3 2 8], (3, 8)⟩ },
       { left := (4, 8), right := (4, 9), path := ⟨(4, 8), [.flip 4 8, .row 8 4 9, .flip 8 9, .row 9 8 4, .flip 9 4], (4, 9)⟩ }] } }

theorem occurrence15_check : occurrence15.check = true := by
  native_decide

def occurrence16 : WeightedSourceOccurrence :=
  { hits := [(1, 3), (1, 14), (5, 7), (5, 15), (7, 3), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (15, 11), (15, 14)],
    forwardChoices := [{ center := 1, support := {3, 14} },
   { center := 5, support := {7, 15} },
   { center := 7, support := {3, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 15} },
   { center := 15, support := {11, 14} }],
    reverseChoices := [{ center := 1, support := {2, 5} },
   { center := 5, support := {1, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 13} },
   { center := 11, support := {1, 9} },
   { center := 15, support := {2, 13} }],
    forwardData := {
      terms := [{ quad := ⟨3, 5, 7, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 3, 14, 15⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (5, 7), right := (5, 15), path := ⟨(5, 7), [.row 5 7 15], (5, 15)⟩ },
       { left := (3, 15), right := (3, 15), path := ⟨(3, 15), [], (3, 15)⟩ },
       { left := (1, 3), right := (1, 14), path := ⟨(1, 3), [.row 1 3 14], (1, 14)⟩ },
       { left := (14, 15), right := (3, 7), path := ⟨(14, 15), [.flip 14 15, .row 15 14 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 3, .flip 7 3], (3, 7)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨1, 9, 11, 13⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 2, 13, 15⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (9, 11), right := (1, 11), path := ⟨(9, 11), [.flip 9 11, .row 11 9 1, .flip 11 1], (1, 11)⟩ },
       { left := (1, 13), right := (1, 13), path := ⟨(1, 13), [], (1, 13)⟩ },
       { left := (1, 2), right := (9, 13), path := ⟨(1, 2), [.row 1 2 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 13], (9, 13)⟩ },
       { left := (13, 15), right := (2, 15), path := ⟨(13, 15), [.flip 13 15, .row 15 13 2, .flip 15 2], (2, 15)⟩ }] } }

theorem occurrence16_check : occurrence16.check = true := by
  native_decide

def occurrence17 : WeightedSourceOccurrence :=
  { hits := [(1, 3), (1, 14), (6, 1), (6, 7), (7, 3), (7, 8), (8, 7), (8, 11), (14, 1), (14, 8), (15, 11), (15, 14)],
    forwardChoices := [{ center := 1, support := {3, 14} },
   { center := 6, support := {1, 7} },
   { center := 7, support := {3, 8} },
   { center := 8, support := {7, 11} },
   { center := 14, support := {1, 8} },
   { center := 15, support := {11, 14} }],
    reverseChoices := [{ center := 1, support := {2, 5} },
   { center := 2, support := {8, 15} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 13} },
   { center := 10, support := {9, 15} },
   { center := 15, support := {2, 13} }],
    forwardData := {
      terms := [{ quad := ⟨8, 11, 14, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 3, 6, 7⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (8, 11), right := (3, 7), path := ⟨(8, 11), [.row 8 11 7, .flip 8 7, .row 7 8 3, .flip 7 3], (3, 7)⟩ },
       { left := (14, 15), right := (11, 15), path := ⟨(14, 15), [.flip 14 15, .row 15 14 11, .flip 15 11], (11, 15)⟩ },
       { left := (1, 3), right := (8, 14), path := ⟨(1, 3), [.row 1 3 14, .flip 1 14, .row 14 1 8, .flip 14 8], (8, 14)⟩ },
       { left := (6, 7), right := (1, 6), path := ⟨(6, 7), [.row 6 7 1, .flip 6 1], (1, 6)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨9, 10, 13, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 2, 5, 8⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (9, 10), right := (10, 15), path := ⟨(9, 10), [.flip 9 10, .row 10 9 15], (10, 15)⟩ },
       { left := (13, 15), right := (2, 8), path := ⟨(13, 15), [.flip 13 15, .row 15 13 2, .flip 15 2, .row 2 15 8], (2, 8)⟩ },
       { left := (1, 2), right := (1, 5), path := ⟨(1, 2), [.row 1 2 5], (1, 5)⟩ },
       { left := (5, 8), right := (9, 13), path := ⟨(5, 8), [.flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 13], (9, 13)⟩ }] } }

theorem occurrence17_check : occurrence17.check = true := by
  native_decide

def occurrence18 : WeightedSourceOccurrence :=
  { hits := [(1, 10), (1, 14), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 10), (12, 5), (12, 6), (14, 5), (14, 8)],
    forwardChoices := [{ center := 1, support := {10, 14} },
   { center := 6, support := {7, 14} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 10} },
   { center := 12, support := {5, 6} },
   { center := 14, support := {5, 8} }],
    reverseChoices := [{ center := 2, support := {8, 11} },
   { center := 4, support := {10, 11} },
   { center := 8, support := {6, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {2, 9} },
   { center := 15, support := {2, 6} }],
    forwardData := {
      terms := [{ quad := ⟨1, 8, 10, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨5, 6, 12, 14⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (8, 10), right := (6, 14), path := ⟨(8, 10), [.row 8 10 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 14], (6, 14)⟩ },
       { left := (1, 14), right := (1, 10), path := ⟨(1, 14), [.row 1 14 10], (1, 10)⟩ },
       { left := (6, 12), right := (5, 12), path := ⟨(6, 12), [.flip 6 12, .row 12 6 5, .flip 12 5], (5, 12)⟩ },
       { left := (5, 14), right := (8, 14), path := ⟨(5, 14), [.flip 5 14, .row 14 5 8, .flip 14 8], (8, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 4, 10, 11⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 6, 8, 15⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (4, 10), right := (4, 11), path := ⟨(4, 10), [.row 4 10 11], (4, 11)⟩ },
       { left := (2, 11), right := (2, 8), path := ⟨(2, 11), [.row 2 11 8], (2, 8)⟩ },
       { left := (6, 8), right := (2, 10), path := ⟨(6, 8), [.flip 6 8, .row 8 6 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩ },
       { left := (2, 15), right := (6, 15), path := ⟨(2, 15), [.flip 2 15, .row 15 2 6, .flip 15 6], (6, 15)⟩ }] } }

theorem occurrence18_check : occurrence18.check = true := by
  native_decide

def occurrence19 : WeightedSourceOccurrence :=
  { hits := [(2, 1), (2, 13), (4, 6), (4, 11), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 13)],
    forwardChoices := [{ center := 2, support := {1, 13} },
   { center := 4, support := {6, 11} },
   { center := 6, support := {1, 7} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 13} }],
    reverseChoices := [{ center := 5, support := {3, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {9, 15} },
   { center := 12, support := {5, 10} },
   { center := 14, support := {3, 15} }],
    forwardData := {
      terms := [{ quad := ⟨1, 4, 6, 11⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 2, 11, 13⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (4, 6), right := (4, 11), path := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩ },
       { left := (1, 11), right := (1, 11), path := ⟨(1, 11), [], (1, 11)⟩ },
       { left := (1, 2), right := (2, 13), path := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩ },
       { left := (11, 13), right := (1, 6), path := ⟨(11, 13), [.row 11 13 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 1, .flip 6 1], (1, 6)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨5, 10, 12, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨3, 5, 14, 15⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (10, 12), right := (5, 12), path := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5], (5, 12)⟩ },
       { left := (5, 15), right := (5, 15), path := ⟨(5, 15), [], (5, 15)⟩ },
       { left := (3, 5), right := (10, 15), path := ⟨(3, 5), [.flip 3 5, .row 5 3 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 15], (10, 15)⟩ },
       { left := (14, 15), right := (3, 14), path := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩ }] } }

theorem occurrence19_check : occurrence19.check = true := by
  native_decide

def occurrence20 : WeightedSourceOccurrence :=
  { hits := [(2, 6), (2, 10), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 10), (15, 11), (15, 14)],
    forwardChoices := [{ center := 2, support := {6, 10} },
   { center := 6, support := {7, 14} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 10} },
   { center := 15, support := {11, 14} }],
    reverseChoices := [{ center := 1, support := {2, 5} },
   { center := 5, support := {6, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {2, 9} },
   { center := 14, support := {6, 10} }],
    forwardData := {
      terms := [{ quad := ⟨6, 11, 14, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨2, 6, 10, 11⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (6, 11), right := (6, 11), path := ⟨(6, 11), [], (6, 11)⟩ },
       { left := (14, 15), right := (11, 15), path := ⟨(14, 15), [.flip 14 15, .row 15 14 11, .flip 15 11], (11, 15)⟩ },
       { left := (2, 6), right := (2, 10), path := ⟨(2, 6), [.row 2 6 10], (2, 10)⟩ },
       { left := (10, 11), right := (6, 14), path := ⟨(10, 11), [.flip 10 11, .row 11 10 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 14], (6, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 6, 10, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 2, 5, 6⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 6), right := (2, 6), path := ⟨(2, 6), [], (2, 6)⟩ },
       { left := (10, 14), right := (6, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 6, .flip 14 6], (6, 14)⟩ },
       { left := (1, 2), right := (1, 5), path := ⟨(1, 2), [.row 1 2 5], (1, 5)⟩ },
       { left := (5, 6), right := (2, 10), path := ⟨(5, 6), [.row 5 6 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩ }] } }

theorem occurrence20_check : occurrence20.check = true := by
  native_decide

def occurrence21 : WeightedSourceOccurrence :=
  { hits := [(2, 6), (2, 13), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (13, 8), (13, 14), (15, 11), (15, 13)],
    forwardChoices := [{ center := 2, support := {6, 13} },
   { center := 6, support := {7, 14} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 13, support := {8, 14} },
   { center := 15, support := {11, 13} }],
    reverseChoices := [{ center := 1, support := {3, 5} },
   { center := 3, support := {2, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {2, 9} },
   { center := 14, support := {3, 10} }],
    forwardData := {
      terms := [{ quad := ⟨2, 6, 13, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨8, 11, 13, 15⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 6), right := (2, 13), path := ⟨(2, 6), [.row 2 6 13], (2, 13)⟩ },
       { left := (13, 14), right := (8, 13), path := ⟨(13, 14), [.row 13 14 8, .flip 13 8], (8, 13)⟩ },
       { left := (8, 11), right := (6, 14), path := ⟨(8, 11), [.row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 14], (6, 14)⟩ },
       { left := (13, 15), right := (11, 15), path := ⟨(13, 15), [.flip 13 15, .row 15 13 11, .flip 15 11], (11, 15)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 3, 10, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 3, 5, 8⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 3), right := (3, 8), path := ⟨(2, 3), [.flip 2 3, .row 3 2 8], (3, 8)⟩ },
       { left := (10, 14), right := (3, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 3, .flip 14 3], (3, 14)⟩ },
       { left := (1, 3), right := (1, 5), path := ⟨(1, 3), [.row 1 3 5], (1, 5)⟩ },
       { left := (5, 8), right := (2, 10), path := ⟨(5, 8), [.flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩ }] } }

theorem occurrence21_check : occurrence21.check = true := by
  native_decide

def occurrence22 : WeightedSourceOccurrence :=
  { hits := [(4, 6), (4, 11), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 13), (15, 13), (15, 14)],
    forwardChoices := [{ center := 4, support := {6, 11} },
   { center := 6, support := {7, 14} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 13} },
   { center := 15, support := {13, 14} }],
    reverseChoices := [{ center := 1, support := {2, 3} },
   { center := 5, support := {3, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {2, 9} },
   { center := 12, support := {5, 10} }],
    forwardData := {
      terms := [{ quad := ⟨6, 13, 14, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨4, 6, 11, 13⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (6, 13), right := (6, 13), path := ⟨(6, 13), [], (6, 13)⟩ },
       { left := (14, 15), right := (13, 15), path := ⟨(14, 15), [.flip 14 15, .row 15 14 13, .flip 15 13], (13, 15)⟩ },
       { left := (4, 6), right := (4, 11), path := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩ },
       { left := (11, 13), right := (6, 14), path := ⟨(11, 13), [.row 11 13 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 14], (6, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 5, 10, 12⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 2, 3, 5⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 5), right := (2, 5), path := ⟨(2, 5), [], (2, 5)⟩ },
       { left := (10, 12), right := (5, 12), path := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5], (5, 12)⟩ },
       { left := (1, 2), right := (1, 3), path := ⟨(1, 2), [.row 1 2 3], (1, 3)⟩ },
       { left := (3, 5), right := (2, 10), path := ⟨(3, 5), [.flip 3 5, .row 5 3 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩ }] } }

theorem occurrence22_check : occurrence22.check = true := by
  native_decide

def occurrence23 : WeightedSourceOccurrence :=
  { hits := [(5, 3), (5, 15), (6, 7), (6, 14), (7, 3), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (15, 11), (15, 14)],
    forwardChoices := [{ center := 5, support := {3, 15} },
   { center := 6, support := {7, 14} },
   { center := 7, support := {3, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 15} },
   { center := 15, support := {11, 14} }],
    reverseChoices := [{ center := 1, support := {2, 5} },
   { center := 5, support := {1, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 13} },
   { center := 10, support := {2, 9} },
   { center := 11, support := {1, 13} }],
    forwardData := {
      terms := [{ quad := ⟨3, 6, 7, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨3, 5, 14, 15⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (6, 7), right := (6, 14), path := ⟨(6, 7), [.row 6 7 14], (6, 14)⟩ },
       { left := (3, 14), right := (3, 14), path := ⟨(3, 14), [], (3, 14)⟩ },
       { left := (3, 5), right := (5, 15), path := ⟨(3, 5), [.flip 3 5, .row 5 3 15], (5, 15)⟩ },
       { left := (14, 15), right := (3, 7), path := ⟨(14, 15), [.flip 14 15, .row 15 14 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 3, .flip 7 3], (3, 7)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 9, 10, 13⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 2, 11, 13⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (9, 10), right := (2, 10), path := ⟨(9, 10), [.flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩ },
       { left := (2, 13), right := (2, 13), path := ⟨(2, 13), [], (2, 13)⟩ },
       { left := (1, 2), right := (9, 13), path := ⟨(1, 2), [.row 1 2 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 13], (9, 13)⟩ },
       { left := (11, 13), right := (1, 11), path := ⟨(11, 13), [.row 11 13 1, .flip 11 1], (1, 11)⟩ }] } }

theorem occurrence23_check : occurrence23.check = true := by
  native_decide

def occurrence24 : WeightedSourceOccurrence :=
  { hits := [(5, 3), (5, 15), (7, 3), (7, 8), (8, 7), (8, 11), (10, 7), (10, 16), (11, 8), (11, 15), (15, 11), (15, 16)],
    forwardChoices := [{ center := 5, support := {3, 15} },
   { center := 7, support := {3, 8} },
   { center := 8, support := {7, 11} },
   { center := 10, support := {7, 16} },
   { center := 11, support := {8, 15} },
   { center := 15, support := {11, 16} }],
    reverseChoices := [{ center := 1, support := {0, 5} },
   { center := 5, support := {1, 8} },
   { center := 6, support := {0, 9} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 13} },
   { center := 11, support := {1, 13} }],
    forwardData := {
      terms := [{ quad := ⟨5, 10, 15, 16⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨3, 5, 7, 10⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (5, 10), right := (5, 10), path := ⟨(5, 10), [], (5, 10)⟩ },
       { left := (15, 16), right := (3, 7), path := ⟨(15, 16), [.row 15 16 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 3, .flip 7 3], (3, 7)⟩ },
       { left := (3, 5), right := (5, 15), path := ⟨(3, 5), [.flip 3 5, .row 5 3 15], (5, 15)⟩ },
       { left := (7, 10), right := (10, 16), path := ⟨(7, 10), [.flip 7 10, .row 10 7 16], (10, 16)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨6, 9, 11, 13⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨0, 1, 6, 11⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (6, 9), right := (0, 6), path := ⟨(6, 9), [.row 6 9 0, .flip 6 0], (0, 6)⟩ },
       { left := (11, 13), right := (1, 11), path := ⟨(11, 13), [.row 11 13 1, .flip 11 1], (1, 11)⟩ },
       { left := (0, 1), right := (9, 13), path := ⟨(0, 1), [.flip 0 1, .row 1 0 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 13], (9, 13)⟩ },
       { left := (6, 11), right := (6, 11), path := ⟨(6, 11), [], (6, 11)⟩ }] } }

theorem occurrence24_check : occurrence24.check = true := by
  native_decide

def occurrence25 : WeightedSourceOccurrence :=
  { hits := [(5, 7), (5, 15), (7, 3), (7, 8), (8, 7), (8, 11), (10, 3), (10, 16), (11, 8), (11, 15), (15, 11), (15, 16)],
    forwardChoices := [{ center := 5, support := {7, 15} },
   { center := 7, support := {3, 8} },
   { center := 8, support := {7, 11} },
   { center := 10, support := {3, 16} },
   { center := 11, support := {8, 15} },
   { center := 15, support := {11, 16} }],
    reverseChoices := [{ center := 1, support := {0, 5} },
   { center := 5, support := {1, 8} },
   { center := 6, support := {0, 13} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 13} },
   { center := 11, support := {1, 9} }],
    forwardData := {
      terms := [{ quad := ⟨3, 5, 7, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨3, 10, 15, 16⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (5, 7), right := (5, 15), path := ⟨(5, 7), [.row 5 7 15], (5, 15)⟩ },
       { left := (3, 15), right := (3, 15), path := ⟨(3, 15), [], (3, 15)⟩ },
       { left := (3, 10), right := (10, 16), path := ⟨(3, 10), [.flip 3 10, .row 10 3 16], (10, 16)⟩ },
       { left := (15, 16), right := (3, 7), path := ⟨(15, 16), [.row 15 16 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 3, .flip 7 3], (3, 7)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨6, 9, 11, 13⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 1, 6, 11⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (9, 11), right := (1, 11), path := ⟨(9, 11), [.flip 9 11, .row 11 9 1, .flip 11 1], (1, 11)⟩ },
       { left := (6, 13), right := (0, 6), path := ⟨(6, 13), [.row 6 13 0, .flip 6 0], (0, 6)⟩ },
       { left := (0, 1), right := (9, 13), path := ⟨(0, 1), [.flip 0 1, .row 1 0 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 13], (9, 13)⟩ },
       { left := (6, 11), right := (6, 11), path := ⟨(6, 11), [], (6, 11)⟩ }] } }

theorem occurrence25_check : occurrence25.check = true := by
  native_decide

def occurrence26 : WeightedSourceOccurrence :=
  { hits := [(6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (12, 5), (12, 6), (14, 5), (14, 8), (15, 11), (15, 14)],
    forwardChoices := [{ center := 6, support := {7, 14} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 12, support := {5, 6} },
   { center := 14, support := {5, 8} },
   { center := 15, support := {11, 14} }],
    reverseChoices := [{ center := 1, support := {2, 5} },
   { center := 2, support := {8, 11} },
   { center := 4, support := {10, 11} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {2, 9} }],
    forwardData := {
      terms := [{ quad := ⟨8, 11, 14, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨5, 6, 12, 14⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (8, 11), right := (6, 14), path := ⟨(8, 11), [.row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 14], (6, 14)⟩ },
       { left := (14, 15), right := (11, 15), path := ⟨(14, 15), [.flip 14 15, .row 15 14 11, .flip 15 11], (11, 15)⟩ },
       { left := (6, 12), right := (5, 12), path := ⟨(6, 12), [.flip 6 12, .row 12 6 5, .flip 12 5], (5, 12)⟩ },
       { left := (5, 14), right := (8, 14), path := ⟨(5, 14), [.flip 5 14, .row 14 5 8, .flip 14 8], (8, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 4, 10, 11⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 2, 5, 8⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (4, 10), right := (4, 11), path := ⟨(4, 10), [.row 4 10 11], (4, 11)⟩ },
       { left := (2, 11), right := (2, 8), path := ⟨(2, 11), [.row 2 11 8], (2, 8)⟩ },
       { left := (1, 2), right := (1, 5), path := ⟨(1, 2), [.row 1 2 5], (1, 5)⟩ },
       { left := (5, 8), right := (2, 10), path := ⟨(5, 8), [.flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩ }] } }

theorem occurrence26_check : occurrence26.check = true := by
  native_decide

def occurrence27 : WeightedSourceOccurrence :=
  { hits := [(0, 3), (0, 15), (3, 4), (3, 16), (7, 3), (7, 8), (8, 7), (8, 11), (9, 4), (9, 7), (11, 8), (11, 15), (15, 11), (15, 16)],
    forwardChoices := [{ center := 0, support := {3, 15} },
   { center := 3, support := {4, 16} },
   { center := 7, support := {3, 8} },
   { center := 8, support := {7, 11} },
   { center := 9, support := {4, 7} },
   { center := 11, support := {8, 15} },
   { center := 15, support := {11, 16} }],
    reverseChoices := [{ center := 1, support := {0, 5} },
   { center := 5, support := {1, 8} },
   { center := 7, support := {9, 12} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 13} },
   { center := 13, support := {0, 12} },
   { center := 16, support := {1, 13} }],
    forwardData := {
      terms := [{ quad := ⟨3, 4, 7, 9⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨0, 3, 15, 16⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (3, 4), right := (3, 16), path := ⟨(3, 4), [.row 3 4 16], (3, 16)⟩ },
       { left := (7, 9), right := (4, 9), path := ⟨(7, 9), [.flip 7 9, .row 9 7 4, .flip 9 4], (4, 9)⟩ },
       { left := (0, 3), right := (0, 15), path := ⟨(0, 3), [.row 0 3 15], (0, 15)⟩ },
       { left := (15, 16), right := (3, 7), path := ⟨(15, 16), [.row 15 16 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 3, .flip 7 3], (3, 7)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨7, 9, 12, 13⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨0, 1, 13, 16⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (7, 9), right := (7, 12), path := ⟨(7, 9), [.row 7 9 12], (7, 12)⟩ },
       { left := (12, 13), right := (0, 13), path := ⟨(12, 13), [.flip 12 13, .row 13 12 0, .flip 13 0], (0, 13)⟩ },
       { left := (0, 1), right := (9, 13), path := ⟨(0, 1), [.flip 0 1, .row 1 0 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 13], (9, 13)⟩ },
       { left := (13, 16), right := (1, 16), path := ⟨(13, 16), [.flip 13 16, .row 16 13 1, .flip 16 1], (1, 16)⟩ }] } }

theorem occurrence27_check : occurrence27.check = true := by
  native_decide

def occurrence28 : WeightedSourceOccurrence :=
  { hits := [(0, 3), (0, 15), (3, 12), (3, 16), (7, 8), (7, 12), (8, 7), (8, 11), (10, 3), (10, 7), (11, 8), (11, 15), (15, 11), (15, 16)],
    forwardChoices := [{ center := 0, support := {3, 15} },
   { center := 3, support := {12, 16} },
   { center := 7, support := {8, 12} },
   { center := 8, support := {7, 11} },
   { center := 10, support := {3, 7} },
   { center := 11, support := {8, 15} },
   { center := 15, support := {11, 16} }],
    reverseChoices := [{ center := 1, support := {0, 5} },
   { center := 5, support := {1, 8} },
   { center := 6, support := {9, 13} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {4, 8} },
   { center := 13, support := {0, 4} },
   { center := 16, support := {1, 13} }],
    forwardData := {
      terms := [{ quad := ⟨3, 7, 10, 12⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 3, 15, 16⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (7, 10), right := (3, 10), path := ⟨(7, 10), [.flip 7 10, .row 10 7 3, .flip 10 3], (3, 10)⟩ },
       { left := (3, 12), right := (3, 16), path := ⟨(3, 12), [.row 3 12 16], (3, 16)⟩ },
       { left := (0, 3), right := (0, 15), path := ⟨(0, 3), [.row 0 3 15], (0, 15)⟩ },
       { left := (15, 16), right := (7, 12), path := ⟨(15, 16), [.row 15 16 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 12], (7, 12)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨4, 6, 9, 13⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 1, 13, 16⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (6, 9), right := (6, 13), path := ⟨(6, 9), [.row 6 9 13], (6, 13)⟩ },
       { left := (4, 13), right := (0, 13), path := ⟨(4, 13), [.flip 4 13, .row 13 4 0, .flip 13 0], (0, 13)⟩ },
       { left := (0, 1), right := (4, 9), path := ⟨(0, 1), [.flip 0 1, .row 1 0 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 4, .flip 9 4], (4, 9)⟩ },
       { left := (13, 16), right := (1, 16), path := ⟨(13, 16), [.flip 13 16, .row 16 13 1, .flip 16 1], (1, 16)⟩ }] } }

theorem occurrence28_check : occurrence28.check = true := by
  native_decide

def occurrence29 : WeightedSourceOccurrence :=
  { hits := [(1, 10), (1, 14), (2, 6), (2, 10), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (14, 1), (14, 8), (15, 11), (15, 14)],
    forwardChoices := [{ center := 1, support := {10, 14} },
   { center := 2, support := {6, 10} },
   { center := 6, support := {1, 7} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 14, support := {1, 8} },
   { center := 15, support := {11, 14} }],
    reverseChoices := [{ center := 1, support := {2, 5} },
   { center := 2, support := {8, 15} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {9, 15} },
   { center := 14, support := {6, 10} },
   { center := 15, support := {2, 6} }],
    forwardData := {
      terms := [{ quad := ⟨8, 11, 14, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 2, 6, 10⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (8, 11), right := (1, 6), path := ⟨(8, 11), [.row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 1, .flip 6 1], (1, 6)⟩ },
       { left := (14, 15), right := (11, 15), path := ⟨(14, 15), [.flip 14 15, .row 15 14 11, .flip 15 11], (11, 15)⟩ },
       { left := (2, 6), right := (2, 10), path := ⟨(2, 6), [.row 2 6 10], (2, 10)⟩ },
       { left := (1, 10), right := (8, 14), path := ⟨(1, 10), [.row 1 10 14, .flip 1 14, .row 14 1 8, .flip 14 8], (8, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨6, 10, 14, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 2, 5, 8⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (10, 14), right := (6, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 6, .flip 14 6], (6, 14)⟩ },
       { left := (6, 15), right := (2, 8), path := ⟨(6, 15), [.flip 6 15, .row 15 6 2, .flip 15 2, .row 2 15 8], (2, 8)⟩ },
       { left := (1, 2), right := (1, 5), path := ⟨(1, 2), [.row 1 2 5], (1, 5)⟩ },
       { left := (5, 8), right := (10, 15), path := ⟨(5, 8), [.flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 15], (10, 15)⟩ }] } }

theorem occurrence29_check : occurrence29.check = true := by
  native_decide

def occurrence30 : WeightedSourceOccurrence :=
  { hits := [(2, 1), (2, 10), (4, 2), (4, 11), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 10), (12, 2), (12, 6)],
    forwardChoices := [{ center := 2, support := {1, 10} },
   { center := 4, support := {2, 11} },
   { center := 6, support := {1, 7} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 10} },
   { center := 12, support := {2, 6} }],
    reverseChoices := [{ center := 4, support := {10, 14} },
   { center := 5, support := {6, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {9, 15} },
   { center := 12, support := {5, 14} },
   { center := 14, support := {6, 15} }],
    forwardData := {
      terms := [{ quad := ⟨2, 4, 10, 11⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 2, 6, 12⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 4), right := (4, 11), path := ⟨(2, 4), [.flip 2 4, .row 4 2 11], (4, 11)⟩ },
       { left := (10, 11), right := (1, 6), path := ⟨(10, 11), [.flip 10 11, .row 11 10 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 1, .flip 6 1], (1, 6)⟩ },
       { left := (1, 2), right := (2, 10), path := ⟨(1, 2), [.flip 1 2, .row 2 1 10], (2, 10)⟩ },
       { left := (6, 12), right := (2, 12), path := ⟨(6, 12), [.flip 6 12, .row 12 6 2, .flip 12 2], (2, 12)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨4, 10, 14, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨5, 6, 12, 14⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (4, 10), right := (4, 14), path := ⟨(4, 10), [.row 4 10 14], (4, 14)⟩ },
       { left := (14, 15), right := (6, 14), path := ⟨(14, 15), [.row 14 15 6, .flip 14 6], (6, 14)⟩ },
       { left := (5, 6), right := (10, 15), path := ⟨(5, 6), [.row 5 6 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 15], (10, 15)⟩ },
       { left := (12, 14), right := (5, 12), path := ⟨(12, 14), [.row 12 14 5, .flip 12 5], (5, 12)⟩ }] } }

theorem occurrence30_check : occurrence30.check = true := by
  native_decide

def occurrence31 : WeightedSourceOccurrence :=
  { hits := [(2, 6), (2, 10), (4, 2), (4, 11), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 10), (16, 1), (16, 2)],
    forwardChoices := [{ center := 2, support := {6, 10} },
   { center := 4, support := {2, 11} },
   { center := 6, support := {1, 7} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 10} },
   { center := 16, support := {1, 2} }],
    reverseChoices := [{ center := 0, support := {14, 15} },
   { center := 5, support := {6, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {9, 15} },
   { center := 12, support := {5, 14} },
   { center := 14, support := {6, 10} }],
    forwardData := {
      terms := [{ quad := ⟨2, 4, 10, 11⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 2, 6, 16⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (2, 4), right := (4, 11), path := ⟨(2, 4), [.flip 2 4, .row 4 2 11], (4, 11)⟩ },
       { left := (10, 11), right := (1, 6), path := ⟨(10, 11), [.flip 10 11, .row 11 10 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 1, .flip 6 1], (1, 6)⟩ },
       { left := (2, 6), right := (2, 10), path := ⟨(2, 6), [.row 2 6 10], (2, 10)⟩ },
       { left := (1, 16), right := (2, 16), path := ⟨(1, 16), [.flip 1 16, .row 16 1 2, .flip 16 2], (2, 16)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨0, 10, 14, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨5, 6, 12, 14⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (10, 14), right := (6, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 6, .flip 14 6], (6, 14)⟩ },
       { left := (0, 15), right := (0, 14), path := ⟨(0, 15), [.row 0 15 14], (0, 14)⟩ },
       { left := (5, 6), right := (10, 15), path := ⟨(5, 6), [.row 5 6 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 15], (10, 15)⟩ },
       { left := (12, 14), right := (5, 12), path := ⟨(12, 14), [.row 12 14 5, .flip 12 5], (5, 12)⟩ }] } }

theorem occurrence31_check : occurrence31.check = true := by
  native_decide

def occurrence32 : WeightedSourceOccurrence :=
  { hits := [(2, 6), (2, 10), (4, 2), (4, 11), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 10), (12, 2), (12, 14)],
    forwardChoices := [{ center := 2, support := {6, 10} },
   { center := 4, support := {2, 11} },
   { center := 6, support := {7, 14} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 10} },
   { center := 12, support := {2, 14} }],
    reverseChoices := [{ center := 4, support := {2, 14} },
   { center := 5, support := {6, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {2, 9} },
   { center := 12, support := {5, 14} },
   { center := 14, support := {6, 10} }],
    forwardData := {
      terms := [{ quad := ⟨2, 4, 10, 11⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨2, 6, 12, 14⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 4), right := (4, 11), path := ⟨(2, 4), [.flip 2 4, .row 4 2 11], (4, 11)⟩ },
       { left := (10, 11), right := (6, 14), path := ⟨(10, 11), [.flip 10 11, .row 11 10 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 14], (6, 14)⟩ },
       { left := (2, 6), right := (2, 10), path := ⟨(2, 6), [.row 2 6 10], (2, 10)⟩ },
       { left := (12, 14), right := (2, 12), path := ⟨(12, 14), [.row 12 14 2, .flip 12 2], (2, 12)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 4, 10, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨5, 6, 12, 14⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 4), right := (4, 14), path := ⟨(2, 4), [.flip 2 4, .row 4 2 14], (4, 14)⟩ },
       { left := (10, 14), right := (6, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 6, .flip 14 6], (6, 14)⟩ },
       { left := (5, 6), right := (2, 10), path := ⟨(5, 6), [.row 5 6 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩ },
       { left := (12, 14), right := (5, 12), path := ⟨(12, 14), [.row 12 14 5, .flip 12 5], (5, 12)⟩ }] } }

theorem occurrence32_check : occurrence32.check = true := by
  native_decide

def occurrence33 : WeightedSourceOccurrence :=
  { hits := [(2, 6), (2, 13), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 13), (13, 14), (13, 16), (15, 11), (15, 16)],
    forwardChoices := [{ center := 2, support := {6, 13} },
   { center := 6, support := {7, 14} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 13} },
   { center := 13, support := {14, 16} },
   { center := 15, support := {11, 16} }],
    reverseChoices := [{ center := 1, support := {0, 5} },
   { center := 3, support := {0, 2} },
   { center := 5, support := {3, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {2, 9} },
   { center := 14, support := {3, 10} }],
    forwardData := {
      terms := [{ quad := ⟨2, 6, 13, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨11, 13, 15, 16⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 6), right := (2, 13), path := ⟨(2, 6), [.row 2 6 13], (2, 13)⟩ },
       { left := (13, 14), right := (13, 16), path := ⟨(13, 14), [.row 13 14 16], (13, 16)⟩ },
       { left := (11, 13), right := (6, 14), path := ⟨(11, 13), [.row 11 13 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 14], (6, 14)⟩ },
       { left := (15, 16), right := (11, 15), path := ⟨(15, 16), [.row 15 16 11, .flip 15 11], (11, 15)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 3, 10, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨0, 1, 3, 5⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 3), right := (0, 3), path := ⟨(2, 3), [.flip 2 3, .row 3 2 0, .flip 3 0], (0, 3)⟩ },
       { left := (10, 14), right := (3, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 3, .flip 14 3], (3, 14)⟩ },
       { left := (0, 1), right := (1, 5), path := ⟨(0, 1), [.flip 0 1, .row 1 0 5], (1, 5)⟩ },
       { left := (3, 5), right := (2, 10), path := ⟨(3, 5), [.flip 3 5, .row 5 3 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩ }] } }

theorem occurrence33_check : occurrence33.check = true := by
  native_decide

def occurrence34 : WeightedSourceOccurrence :=
  { hits := [(4, 2), (4, 15), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (12, 2), (12, 6), (15, 11), (15, 14)],
    forwardChoices := [{ center := 4, support := {2, 15} },
   { center := 6, support := {7, 14} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 15} },
   { center := 12, support := {2, 6} },
   { center := 15, support := {11, 14} }],
    reverseChoices := [{ center := 1, support := {2, 5} },
   { center := 4, support := {10, 14} },
   { center := 5, support := {1, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {2, 9} },
   { center := 12, support := {1, 14} }],
    forwardData := {
      terms := [{ quad := ⟨2, 6, 12, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 4, 14, 15⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (6, 12), right := (2, 12), path := ⟨(6, 12), [.flip 6 12, .row 12 6 2, .flip 12 2], (2, 12)⟩ },
       { left := (2, 14), right := (2, 14), path := ⟨(2, 14), [], (2, 14)⟩ },
       { left := (2, 4), right := (4, 15), path := ⟨(2, 4), [.flip 2 4, .row 4 2 15], (4, 15)⟩ },
       { left := (14, 15), right := (6, 14), path := ⟨(14, 15), [.flip 14 15, .row 15 14 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 14], (6, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 4, 10, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 2, 12, 14⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (4, 10), right := (4, 14), path := ⟨(4, 10), [.row 4 10 14], (4, 14)⟩ },
       { left := (2, 14), right := (2, 14), path := ⟨(2, 14), [], (2, 14)⟩ },
       { left := (1, 2), right := (2, 10), path := ⟨(1, 2), [.row 1 2 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩ },
       { left := (12, 14), right := (1, 12), path := ⟨(12, 14), [.row 12 14 1, .flip 12 1], (1, 12)⟩ }] } }

theorem occurrence34_check : occurrence34.check = true := by
  native_decide

def occurrence35 : WeightedSourceOccurrence :=
  { hits := [(4, 6), (4, 11), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (9, 4), (9, 15), (11, 8), (11, 15), (16, 1), (16, 4)],
    forwardChoices := [{ center := 4, support := {6, 11} },
   { center := 6, support := {1, 7} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 9, support := {4, 15} },
   { center := 11, support := {8, 15} },
   { center := 16, support := {1, 4} }],
    reverseChoices := [{ center := 0, support := {12, 15} },
   { center := 5, support := {1, 8} },
   { center := 7, support := {1, 12} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {9, 15} },
   { center := 12, support := {5, 10} }],
    forwardData := {
      terms := [{ quad := ⟨1, 4, 6, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨4, 9, 11, 15⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (4, 6), right := (4, 11), path := ⟨(4, 6), [.row 4 6 11], (4, 11)⟩ },
       { left := (1, 16), right := (4, 16), path := ⟨(1, 16), [.flip 1 16, .row 16 1 4, .flip 16 4], (4, 16)⟩ },
       { left := (4, 9), right := (9, 15), path := ⟨(4, 9), [.flip 4 9, .row 9 4 15], (9, 15)⟩ },
       { left := (11, 15), right := (1, 6), path := ⟨(11, 15), [.row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 1, .flip 6 1], (1, 6)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨0, 10, 12, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 5, 7, 12⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (10, 12), right := (5, 12), path := ⟨(10, 12), [.flip 10 12, .row 12 10 5, .flip 12 5], (5, 12)⟩ },
       { left := (0, 15), right := (0, 12), path := ⟨(0, 15), [.row 0 15 12], (0, 12)⟩ },
       { left := (1, 5), right := (10, 15), path := ⟨(1, 5), [.flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 15], (10, 15)⟩ },
       { left := (7, 12), right := (1, 7), path := ⟨(7, 12), [.row 7 12 1, .flip 7 1], (1, 7)⟩ }] } }

theorem occurrence35_check : occurrence35.check = true := by
  native_decide

def occurrence36 : WeightedSourceOccurrence :=
  { hits := [(4, 6), (4, 15), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (15, 11), (15, 13), (16, 1), (16, 13)],
    forwardChoices := [{ center := 4, support := {6, 15} },
   { center := 6, support := {1, 7} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 15} },
   { center := 15, support := {11, 13} },
   { center := 16, support := {1, 13} }],
    reverseChoices := [{ center := 0, support := {3, 15} },
   { center := 1, support := {3, 5} },
   { center := 5, support := {1, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {9, 15} },
   { center := 12, support := {1, 10} }],
    forwardData := {
      terms := [{ quad := ⟨1, 4, 6, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨4, 13, 15, 16⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (4, 6), right := (4, 15), path := ⟨(4, 6), [.row 4 6 15], (4, 15)⟩ },
       { left := (1, 16), right := (13, 16), path := ⟨(1, 16), [.flip 1 16, .row 16 1 13, .flip 16 13], (13, 16)⟩ },
       { left := (13, 15), right := (1, 6), path := ⟨(13, 15), [.flip 13 15, .row 15 13 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 1, .flip 6 1], (1, 6)⟩ },
       { left := (4, 16), right := (4, 16), path := ⟨(4, 16), [], (4, 16)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨1, 10, 12, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 1, 3, 15⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (10, 12), right := (1, 12), path := ⟨(10, 12), [.flip 10 12, .row 12 10 1, .flip 12 1], (1, 12)⟩ },
       { left := (1, 15), right := (1, 15), path := ⟨(1, 15), [], (1, 15)⟩ },
       { left := (1, 3), right := (10, 15), path := ⟨(1, 3), [.row 1 3 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 15], (10, 15)⟩ },
       { left := (0, 15), right := (0, 3), path := ⟨(0, 15), [.row 0 15 3], (0, 3)⟩ }] } }

theorem occurrence36_check : occurrence36.check = true := by
  native_decide

def occurrence37 : WeightedSourceOccurrence :=
  { hits := [(4, 6), (4, 15), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (13, 14), (13, 16), (15, 11), (15, 16)],
    forwardChoices := [{ center := 4, support := {6, 15} },
   { center := 6, support := {7, 14} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 15} },
   { center := 13, support := {14, 16} },
   { center := 15, support := {11, 16} }],
    reverseChoices := [{ center := 1, support := {0, 5} },
   { center := 3, support := {0, 2} },
   { center := 5, support := {1, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {2, 9} },
   { center := 12, support := {1, 10} }],
    forwardData := {
      terms := [{ quad := ⟨6, 13, 14, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨4, 6, 15, 16⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (13, 14), right := (13, 16), path := ⟨(13, 14), [.row 13 14 16], (13, 16)⟩ },
       { left := (6, 16), right := (6, 16), path := ⟨(6, 16), [], (6, 16)⟩ },
       { left := (4, 6), right := (4, 15), path := ⟨(4, 6), [.row 4 6 15], (4, 15)⟩ },
       { left := (15, 16), right := (6, 14), path := ⟨(15, 16), [.row 15 16 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 14], (6, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨0, 2, 3, 10⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 1, 10, 12⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 3), right := (0, 3), path := ⟨(2, 3), [.flip 2 3, .row 3 2 0, .flip 3 0], (0, 3)⟩ },
       { left := (0, 10), right := (0, 10), path := ⟨(0, 10), [], (0, 10)⟩ },
       { left := (0, 1), right := (2, 10), path := ⟨(0, 1), [.flip 0 1, .row 1 0 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩ },
       { left := (10, 12), right := (1, 12), path := ⟨(10, 12), [.flip 10 12, .row 12 10 1, .flip 12 1], (1, 12)⟩ }] } }

theorem occurrence37_check : occurrence37.check = true := by
  native_decide

def occurrence38 : WeightedSourceOccurrence :=
  { hits := [(6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (9, 5), (9, 15), (11, 8), (11, 15), (12, 5), (12, 6), (15, 11), (15, 14)],
    forwardChoices := [{ center := 6, support := {7, 14} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 9, support := {5, 15} },
   { center := 11, support := {8, 15} },
   { center := 12, support := {5, 6} },
   { center := 15, support := {11, 14} }],
    reverseChoices := [{ center := 1, support := {2, 5} },
   { center := 4, support := {10, 11} },
   { center := 5, support := {1, 8} },
   { center := 7, support := {1, 11} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {2, 9} }],
    forwardData := {
      terms := [{ quad := ⟨5, 9, 14, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨5, 6, 12, 14⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (5, 9), right := (9, 15), path := ⟨(5, 9), [.flip 5 9, .row 9 5 15], (9, 15)⟩ },
       { left := (14, 15), right := (6, 14), path := ⟨(14, 15), [.flip 14 15, .row 15 14 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 14], (6, 14)⟩ },
       { left := (6, 12), right := (5, 12), path := ⟨(6, 12), [.flip 6 12, .row 12 6 5, .flip 12 5], (5, 12)⟩ },
       { left := (5, 14), right := (5, 14), path := ⟨(5, 14), [], (5, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 4, 10, 11⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 2, 7, 11⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (4, 10), right := (4, 11), path := ⟨(4, 10), [.row 4 10 11], (4, 11)⟩ },
       { left := (2, 11), right := (2, 11), path := ⟨(2, 11), [], (2, 11)⟩ },
       { left := (1, 2), right := (2, 10), path := ⟨(1, 2), [.row 1 2 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩ },
       { left := (7, 11), right := (1, 7), path := ⟨(7, 11), [.row 7 11 1, .flip 7 1], (1, 7)⟩ }] } }

theorem occurrence38_check : occurrence38.check = true := by
  native_decide

def occurrence39 : WeightedSourceOccurrence :=
  { hits := [(1, 0), (1, 14), (4, 6), (4, 15), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (14, 0), (14, 1), (15, 11), (15, 14)],
    forwardChoices := [{ center := 1, support := {0, 14} },
   { center := 4, support := {6, 15} },
   { center := 6, support := {1, 7} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 15} },
   { center := 14, support := {0, 1} },
   { center := 15, support := {11, 14} }],
    reverseChoices := [{ center := 1, support := {2, 5} },
   { center := 2, support := {15, 16} },
   { center := 5, support := {1, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {9, 15} },
   { center := 12, support := {1, 10} },
   { center := 15, support := {2, 16} }],
    forwardData := {
      terms := [{ quad := ⟨1, 4, 6, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 1, 14, 15⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (4, 6), right := (4, 15), path := ⟨(4, 6), [.row 4 6 15], (4, 15)⟩ },
       { left := (1, 15), right := (1, 15), path := ⟨(1, 15), [], (1, 15)⟩ },
       { left := (0, 1), right := (0, 14), path := ⟨(0, 1), [.flip 0 1, .row 1 0 14, .flip 1 14, .row 14 1 0, .flip 14 0], (0, 14)⟩ },
       { left := (14, 15), right := (1, 6), path := ⟨(14, 15), [.flip 14 15, .row 15 14 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 1, .flip 6 1], (1, 6)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨1, 10, 12, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 2, 15, 16⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (10, 12), right := (1, 12), path := ⟨(10, 12), [.flip 10 12, .row 12 10 1, .flip 12 1], (1, 12)⟩ },
       { left := (1, 15), right := (1, 15), path := ⟨(1, 15), [], (1, 15)⟩ },
       { left := (1, 2), right := (10, 15), path := ⟨(1, 2), [.row 1 2 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 15], (10, 15)⟩ },
       { left := (15, 16), right := (2, 16), path := ⟨(15, 16), [.row 15 16 2, .flip 15 2, .row 2 15 16], (2, 16)⟩ }] } }

theorem occurrence39_check : occurrence39.check = true := by
  native_decide

def occurrence40 : WeightedSourceOccurrence :=
  { hits := [(1, 3), (1, 14), (5, 0), (5, 15), (6, 1), (6, 7), (7, 3), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (14, 0), (14, 1), (15, 11), (15, 14)],
    forwardChoices := [{ center := 1, support := {3, 14} },
   { center := 5, support := {0, 15} },
   { center := 6, support := {1, 7} },
   { center := 7, support := {3, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 15} },
   { center := 14, support := {0, 1} },
   { center := 15, support := {11, 14} }],
    reverseChoices := [{ center := 1, support := {2, 5} },
   { center := 2, support := {15, 16} },
   { center := 5, support := {1, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 13} },
   { center := 10, support := {9, 15} },
   { center := 11, support := {1, 16} },
   { center := 15, support := {2, 13} }],
    forwardData := {
      terms := [{ quad := ⟨0, 5, 14, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 3, 6, 7⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (0, 5), right := (5, 15), path := ⟨(0, 5), [.flip 0 5, .row 5 0 15], (5, 15)⟩ },
       { left := (14, 15), right := (3, 7), path := ⟨(14, 15), [.flip 14 15, .row 15 14 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 3, .flip 7 3], (3, 7)⟩ },
       { left := (1, 3), right := (0, 14), path := ⟨(1, 3), [.row 1 3 14, .flip 1 14, .row 14 1 0, .flip 14 0], (0, 14)⟩ },
       { left := (6, 7), right := (1, 6), path := ⟨(6, 7), [.row 6 7 1, .flip 6 1], (1, 6)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨9, 10, 13, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 2, 11, 16⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (9, 10), right := (10, 15), path := ⟨(9, 10), [.flip 9 10, .row 10 9 15], (10, 15)⟩ },
       { left := (13, 15), right := (2, 16), path := ⟨(13, 15), [.flip 13 15, .row 15 13 2, .flip 15 2, .row 2 15 16], (2, 16)⟩ },
       { left := (1, 2), right := (9, 13), path := ⟨(1, 2), [.row 1 2 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 13], (9, 13)⟩ },
       { left := (11, 16), right := (1, 11), path := ⟨(11, 16), [.row 11 16 1, .flip 11 1], (1, 11)⟩ }] } }

theorem occurrence40_check : occurrence40.check = true := by
  native_decide

def occurrence41 : WeightedSourceOccurrence :=
  { hits := [(1, 3), (1, 14), (6, 1), (6, 7), (7, 3), (7, 8), (8, 7), (8, 11), (9, 5), (9, 15), (11, 8), (11, 15), (14, 1), (14, 5), (15, 11), (15, 14)],
    forwardChoices := [{ center := 1, support := {3, 14} },
   { center := 6, support := {1, 7} },
   { center := 7, support := {3, 8} },
   { center := 8, support := {7, 11} },
   { center := 9, support := {5, 15} },
   { center := 11, support := {8, 15} },
   { center := 14, support := {1, 5} },
   { center := 15, support := {11, 14} }],
    reverseChoices := [{ center := 1, support := {2, 5} },
   { center := 2, support := {11, 15} },
   { center := 5, support := {1, 8} },
   { center := 7, support := {1, 11} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 13} },
   { center := 10, support := {9, 15} },
   { center := 15, support := {2, 13} }],
    forwardData := {
      terms := [{ quad := ⟨5, 9, 14, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 3, 6, 7⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (5, 9), right := (9, 15), path := ⟨(5, 9), [.flip 5 9, .row 9 5 15], (9, 15)⟩ },
       { left := (14, 15), right := (3, 7), path := ⟨(14, 15), [.flip 14 15, .row 15 14 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 3, .flip 7 3], (3, 7)⟩ },
       { left := (1, 3), right := (5, 14), path := ⟨(1, 3), [.row 1 3 14, .flip 1 14, .row 14 1 5, .flip 14 5], (5, 14)⟩ },
       { left := (6, 7), right := (1, 6), path := ⟨(6, 7), [.row 6 7 1, .flip 6 1], (1, 6)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨9, 10, 13, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 2, 7, 11⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (9, 10), right := (10, 15), path := ⟨(9, 10), [.flip 9 10, .row 10 9 15], (10, 15)⟩ },
       { left := (13, 15), right := (2, 11), path := ⟨(13, 15), [.flip 13 15, .row 15 13 2, .flip 15 2, .row 2 15 11], (2, 11)⟩ },
       { left := (1, 2), right := (9, 13), path := ⟨(1, 2), [.row 1 2 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 13], (9, 13)⟩ },
       { left := (7, 11), right := (1, 7), path := ⟨(7, 11), [.row 7 11 1, .flip 7 1], (1, 7)⟩ }] } }

theorem occurrence41_check : occurrence41.check = true := by
  native_decide

def occurrence42 : WeightedSourceOccurrence :=
  { hits := [(2, 1), (2, 13), (4, 2), (4, 15), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (12, 2), (12, 6), (15, 11), (15, 13)],
    forwardChoices := [{ center := 2, support := {1, 13} },
   { center := 4, support := {2, 15} },
   { center := 6, support := {1, 7} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 15} },
   { center := 12, support := {2, 6} },
   { center := 15, support := {11, 13} }],
    reverseChoices := [{ center := 1, support := {3, 5} },
   { center := 4, support := {10, 14} },
   { center := 5, support := {1, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {9, 15} },
   { center := 12, support := {1, 14} },
   { center := 14, support := {3, 15} }],
    forwardData := {
      terms := [{ quad := ⟨2, 4, 13, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 2, 6, 12⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 4), right := (4, 15), path := ⟨(2, 4), [.flip 2 4, .row 4 2 15], (4, 15)⟩ },
       { left := (13, 15), right := (1, 6), path := ⟨(13, 15), [.flip 13 15, .row 15 13 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 1, .flip 6 1], (1, 6)⟩ },
       { left := (1, 2), right := (2, 13), path := ⟨(1, 2), [.flip 1 2, .row 2 1 13], (2, 13)⟩ },
       { left := (6, 12), right := (2, 12), path := ⟨(6, 12), [.flip 6 12, .row 12 6 2, .flip 12 2], (2, 12)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨4, 10, 14, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 3, 12, 14⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (4, 10), right := (4, 14), path := ⟨(4, 10), [.row 4 10 14], (4, 14)⟩ },
       { left := (14, 15), right := (3, 14), path := ⟨(14, 15), [.row 14 15 3, .flip 14 3], (3, 14)⟩ },
       { left := (1, 3), right := (10, 15), path := ⟨(1, 3), [.row 1 3 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 15], (10, 15)⟩ },
       { left := (12, 14), right := (1, 12), path := ⟨(12, 14), [.row 12 14 1, .flip 12 1], (1, 12)⟩ }] } }

theorem occurrence42_check : occurrence42.check = true := by
  native_decide

def occurrence43 : WeightedSourceOccurrence :=
  { hits := [(2, 6), (2, 13), (4, 2), (4, 15), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (15, 11), (15, 13), (16, 1), (16, 2)],
    forwardChoices := [{ center := 2, support := {6, 13} },
   { center := 4, support := {2, 15} },
   { center := 6, support := {1, 7} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 15} },
   { center := 15, support := {11, 13} },
   { center := 16, support := {1, 2} }],
    reverseChoices := [{ center := 0, support := {14, 15} },
   { center := 1, support := {3, 5} },
   { center := 5, support := {1, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {9, 15} },
   { center := 12, support := {1, 14} },
   { center := 14, support := {3, 10} }],
    forwardData := {
      terms := [{ quad := ⟨2, 4, 13, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 2, 6, 16⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (2, 4), right := (4, 15), path := ⟨(2, 4), [.flip 2 4, .row 4 2 15], (4, 15)⟩ },
       { left := (13, 15), right := (1, 6), path := ⟨(13, 15), [.flip 13 15, .row 15 13 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 1, .flip 6 1], (1, 6)⟩ },
       { left := (2, 6), right := (2, 13), path := ⟨(2, 6), [.row 2 6 13], (2, 13)⟩ },
       { left := (1, 16), right := (2, 16), path := ⟨(1, 16), [.flip 1 16, .row 16 1 2, .flip 16 2], (2, 16)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨0, 10, 14, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 3, 12, 14⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (10, 14), right := (3, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 3, .flip 14 3], (3, 14)⟩ },
       { left := (0, 15), right := (0, 14), path := ⟨(0, 15), [.row 0 15 14], (0, 14)⟩ },
       { left := (1, 3), right := (10, 15), path := ⟨(1, 3), [.row 1 3 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 15], (10, 15)⟩ },
       { left := (12, 14), right := (1, 12), path := ⟨(12, 14), [.row 12 14 1, .flip 12 1], (1, 12)⟩ }] } }

theorem occurrence43_check : occurrence43.check = true := by
  native_decide

def occurrence44 : WeightedSourceOccurrence :=
  { hits := [(2, 6), (2, 13), (4, 2), (4, 15), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (12, 2), (12, 14), (15, 11), (15, 13)],
    forwardChoices := [{ center := 2, support := {6, 13} },
   { center := 4, support := {2, 15} },
   { center := 6, support := {7, 14} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 15} },
   { center := 12, support := {2, 14} },
   { center := 15, support := {11, 13} }],
    reverseChoices := [{ center := 1, support := {3, 5} },
   { center := 4, support := {2, 14} },
   { center := 5, support := {1, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {2, 9} },
   { center := 12, support := {1, 14} },
   { center := 14, support := {3, 10} }],
    forwardData := {
      terms := [{ quad := ⟨2, 4, 13, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨2, 6, 12, 14⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 4), right := (4, 15), path := ⟨(2, 4), [.flip 2 4, .row 4 2 15], (4, 15)⟩ },
       { left := (13, 15), right := (6, 14), path := ⟨(13, 15), [.flip 13 15, .row 15 13 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 14], (6, 14)⟩ },
       { left := (2, 6), right := (2, 13), path := ⟨(2, 6), [.row 2 6 13], (2, 13)⟩ },
       { left := (12, 14), right := (2, 12), path := ⟨(12, 14), [.row 12 14 2, .flip 12 2], (2, 12)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 4, 10, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 3, 12, 14⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 4), right := (4, 14), path := ⟨(2, 4), [.flip 2 4, .row 4 2 14], (4, 14)⟩ },
       { left := (10, 14), right := (3, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 3, .flip 14 3], (3, 14)⟩ },
       { left := (1, 3), right := (2, 10), path := ⟨(1, 3), [.row 1 3 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩ },
       { left := (12, 14), right := (1, 12), path := ⟨(12, 14), [.row 12 14 1, .flip 12 1], (1, 12)⟩ }] } }

theorem occurrence44_check : occurrence44.check = true := by
  native_decide

def occurrence45 : WeightedSourceOccurrence :=
  { hits := [(5, 0), (5, 15), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (12, 5), (12, 6), (14, 0), (14, 5), (15, 11), (15, 14)],
    forwardChoices := [{ center := 5, support := {0, 15} },
   { center := 6, support := {7, 14} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 15} },
   { center := 12, support := {5, 6} },
   { center := 14, support := {0, 5} },
   { center := 15, support := {11, 14} }],
    reverseChoices := [{ center := 1, support := {2, 5} },
   { center := 2, support := {11, 16} },
   { center := 4, support := {10, 11} },
   { center := 5, support := {1, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {2, 9} },
   { center := 11, support := {1, 16} }],
    forwardData := {
      terms := [{ quad := ⟨0, 5, 14, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨5, 6, 12, 14⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (0, 5), right := (5, 15), path := ⟨(0, 5), [.flip 0 5, .row 5 0 15], (5, 15)⟩ },
       { left := (14, 15), right := (6, 14), path := ⟨(14, 15), [.flip 14 15, .row 15 14 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 14], (6, 14)⟩ },
       { left := (6, 12), right := (5, 12), path := ⟨(6, 12), [.flip 6 12, .row 12 6 5, .flip 12 5], (5, 12)⟩ },
       { left := (5, 14), right := (0, 14), path := ⟨(5, 14), [.flip 5 14, .row 14 5 0, .flip 14 0], (0, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 4, 10, 11⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 2, 11, 16⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (4, 10), right := (4, 11), path := ⟨(4, 10), [.row 4 10 11], (4, 11)⟩ },
       { left := (2, 11), right := (2, 16), path := ⟨(2, 11), [.row 2 11 16], (2, 16)⟩ },
       { left := (1, 2), right := (2, 10), path := ⟨(1, 2), [.row 1 2 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩ },
       { left := (11, 16), right := (1, 11), path := ⟨(11, 16), [.row 11 16 1, .flip 11 1], (1, 11)⟩ }] } }

theorem occurrence45_check : occurrence45.check = true := by
  native_decide

def occurrence46 : WeightedSourceOccurrence :=
  { hits := [(0, 2), (0, 15), (2, 6), (2, 13), (6, 7), (6, 14), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (13, 14), (13, 16), (15, 11), (15, 16), (16, 2), (16, 13)],
    forwardChoices := [{ center := 0, support := {2, 15} },
   { center := 2, support := {6, 13} },
   { center := 6, support := {7, 14} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 15} },
   { center := 13, support := {14, 16} },
   { center := 15, support := {11, 16} },
   { center := 16, support := {2, 13} }],
    reverseChoices := [{ center := 0, support := {3, 14} },
   { center := 1, support := {0, 5} },
   { center := 3, support := {0, 2} },
   { center := 5, support := {1, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {2, 9} },
   { center := 14, support := {3, 10} },
   { center := 16, support := {1, 14} }],
    forwardData := {
      terms := [{ quad := ⟨2, 6, 13, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨0, 2, 15, 16⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 6), right := (2, 13), path := ⟨(2, 6), [.row 2 6 13], (2, 13)⟩ },
       { left := (13, 14), right := (2, 16), path := ⟨(13, 14), [.row 13 14 16, .flip 13 16, .row 16 13 2, .flip 16 2], (2, 16)⟩ },
       { left := (0, 2), right := (0, 15), path := ⟨(0, 2), [.row 0 2 15], (0, 15)⟩ },
       { left := (15, 16), right := (6, 14), path := ⟨(15, 16), [.row 15 16 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 14], (6, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨2, 3, 10, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨0, 1, 14, 16⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (2, 3), right := (0, 14), path := ⟨(2, 3), [.flip 2 3, .row 3 2 0, .flip 3 0, .row 0 3 14], (0, 14)⟩ },
       { left := (10, 14), right := (3, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 3, .flip 14 3], (3, 14)⟩ },
       { left := (0, 1), right := (2, 10), path := ⟨(0, 1), [.flip 0 1, .row 1 0 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩ },
       { left := (14, 16), right := (1, 16), path := ⟨(14, 16), [.flip 14 16, .row 16 14 1, .flip 16 1], (1, 16)⟩ }] } }

theorem occurrence46_check : occurrence46.check = true := by
  native_decide

def occurrence47 : WeightedSourceOccurrence :=
  { hits := [(1, 10), (1, 14), (2, 6), (2, 10), (5, 0), (5, 15), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (11, 8), (11, 15), (14, 0), (14, 1), (15, 11), (15, 14)],
    forwardChoices := [{ center := 1, support := {10, 14} },
   { center := 2, support := {6, 10} },
   { center := 5, support := {0, 15} },
   { center := 6, support := {1, 7} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 11, support := {8, 15} },
   { center := 14, support := {0, 1} },
   { center := 15, support := {11, 14} }],
    reverseChoices := [{ center := 1, support := {2, 5} },
   { center := 2, support := {15, 16} },
   { center := 5, support := {1, 8} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {9, 15} },
   { center := 11, support := {1, 16} },
   { center := 14, support := {6, 10} },
   { center := 15, support := {2, 6} }],
    forwardData := {
      terms := [{ quad := ⟨0, 5, 14, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 2, 6, 10⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (0, 5), right := (5, 15), path := ⟨(0, 5), [.flip 0 5, .row 5 0 15], (5, 15)⟩ },
       { left := (14, 15), right := (1, 6), path := ⟨(14, 15), [.flip 14 15, .row 15 14 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 1, .flip 6 1], (1, 6)⟩ },
       { left := (2, 6), right := (2, 10), path := ⟨(2, 6), [.row 2 6 10], (2, 10)⟩ },
       { left := (1, 10), right := (0, 14), path := ⟨(1, 10), [.row 1 10 14, .flip 1 14, .row 14 1 0, .flip 14 0], (0, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨6, 10, 14, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 2, 11, 16⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (10, 14), right := (6, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 6, .flip 14 6], (6, 14)⟩ },
       { left := (6, 15), right := (2, 16), path := ⟨(6, 15), [.flip 6 15, .row 15 6 2, .flip 15 2, .row 2 15 16], (2, 16)⟩ },
       { left := (1, 2), right := (10, 15), path := ⟨(1, 2), [.row 1 2 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 15], (10, 15)⟩ },
       { left := (11, 16), right := (1, 11), path := ⟨(11, 16), [.row 11 16 1, .flip 11 1], (1, 11)⟩ }] } }

theorem occurrence47_check : occurrence47.check = true := by
  native_decide

def occurrence48 : WeightedSourceOccurrence :=
  { hits := [(1, 10), (1, 14), (2, 6), (2, 10), (6, 1), (6, 7), (7, 6), (7, 8), (8, 7), (8, 11), (9, 5), (9, 15), (11, 8), (11, 15), (14, 1), (14, 5), (15, 11), (15, 14)],
    forwardChoices := [{ center := 1, support := {10, 14} },
   { center := 2, support := {6, 10} },
   { center := 6, support := {1, 7} },
   { center := 7, support := {6, 8} },
   { center := 8, support := {7, 11} },
   { center := 9, support := {5, 15} },
   { center := 11, support := {8, 15} },
   { center := 14, support := {1, 5} },
   { center := 15, support := {11, 14} }],
    reverseChoices := [{ center := 1, support := {2, 5} },
   { center := 2, support := {11, 15} },
   { center := 5, support := {1, 8} },
   { center := 7, support := {1, 11} },
   { center := 8, support := {5, 9} },
   { center := 9, support := {8, 10} },
   { center := 10, support := {9, 15} },
   { center := 14, support := {6, 10} },
   { center := 15, support := {2, 6} }],
    forwardData := {
      terms := [{ quad := ⟨5, 9, 14, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 2, 6, 10⟩, form := .innerOuter, weight := 1 }],
      pairings := [{ left := (5, 9), right := (9, 15), path := ⟨(5, 9), [.flip 5 9, .row 9 5 15], (9, 15)⟩ },
       { left := (14, 15), right := (1, 6), path := ⟨(14, 15), [.flip 14 15, .row 15 14 11, .flip 15 11, .row 11 15 8, .flip 11 8, .row 8 11 7, .flip 8 7, .row 7 8 6, .flip 7 6, .row 6 7 1, .flip 6 1], (1, 6)⟩ },
       { left := (2, 6), right := (2, 10), path := ⟨(2, 6), [.row 2 6 10], (2, 10)⟩ },
       { left := (1, 10), right := (5, 14), path := ⟨(1, 10), [.row 1 10 14, .flip 1 14, .row 14 1 5, .flip 14 5], (5, 14)⟩ }] },
    reverseData := {
      terms := [{ quad := ⟨6, 10, 14, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 2, 7, 11⟩, form := .adjacentSides, weight := 1 }],
      pairings := [{ left := (10, 14), right := (6, 14), path := ⟨(10, 14), [.flip 10 14, .row 14 10 6, .flip 14 6], (6, 14)⟩ },
       { left := (6, 15), right := (2, 11), path := ⟨(6, 15), [.flip 6 15, .row 15 6 2, .flip 15 2, .row 2 15 11], (2, 11)⟩ },
       { left := (1, 2), right := (10, 15), path := ⟨(1, 2), [.row 1 2 5, .flip 1 5, .row 5 1 8, .flip 5 8, .row 8 5 9, .flip 8 9, .row 9 8 10, .flip 9 10, .row 10 9 15], (10, 15)⟩ },
       { left := (7, 11), right := (1, 7), path := ⟨(7, 11), [.row 7 11 1, .flip 7 1], (1, 7)⟩ }] } }

theorem occurrence48_check : occurrence48.check = true := by
  native_decide
def fortyNinthWeightedOccurrences : List WeightedSourceOccurrence :=
  [occurrence0, occurrence1, occurrence2, occurrence3, occurrence4, occurrence5, occurrence6, occurrence7, occurrence8, occurrence9, occurrence10, occurrence11, occurrence12, occurrence13, occurrence14, occurrence15, occurrence16, occurrence17, occurrence18, occurrence19, occurrence20, occurrence21, occurrence22, occurrence23, occurrence24, occurrence25, occurrence26, occurrence27, occurrence28, occurrence29, occurrence30, occurrence31, occurrence32, occurrence33, occurrence34, occurrence35, occurrence36, occurrence37, occurrence38, occurrence39, occurrence40, occurrence41, occurrence42, occurrence43, occurrence44, occurrence45, occurrence46, occurrence47, occurrence48]

theorem fortyNinthWeightedOccurrences_length : fortyNinthWeightedOccurrences.length = 49 := by
  native_decide

theorem fortyNinthWeightedOccurrences_check :
    ∀ occurrence ∈ fortyNinthWeightedOccurrences, occurrence.check = true := by
  native_decide

def fortyNinthModelRefinementClauses : Std.Sat.CNF Atom :=
  fortyNinthWeightedOccurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order =>
      directions.map fun direction =>
        weightedOccurrenceClause order direction occurrence

theorem fortyNinthModelRefinementClauses_length :
    fortyNinthModelRefinementClauses.length = 196 := by
  native_decide

theorem sourceAssign_fortyNinthModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortyNinthModelRefinementClauses, List.mem_flatMap, List.mem_map] at hclause
  rcases hclause with ⟨occurrence, hoccur, order, horder, direction, hdirection, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source occurrence
    (fortyNinthWeightedOccurrences_check occurrence hoccur) order direction

def extendedFortyNinthModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedFortyEighthModelRefinementsCnf ++ fortyNinthModelRefinementClauses

theorem extendedFortyNinthModelRefinementsCnf_length :
    extendedFortyNinthModelRefinementsCnf.length = 7198668 := by
  simp only [extendedFortyNinthModelRefinementsCnf, List.length_append,
    extendedFortyEighthModelRefinementsCnf_length,
    fortyNinthModelRefinementClauses_length]

theorem sourceAssign_extendedFortyNinthModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortyNinthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyNinthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedFortyEighthModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyNinthModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedFortyNinthModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortyNinthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyNinthModelRefinementsCnf source⟩

#print axioms fortyNinthWeightedOccurrences_check
#print axioms sourceAssign_fortyNinthModelRefinementClauses
#print axioms sourceAssign_extendedFortyNinthModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedFortyNinthModelRefinementsCnf_unsat

end ATailBlockerVExactSeventeenFortyNinthModelRefinements
end Problem97


/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFifthModelRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-! Child45's nine checked wave-only union-support weighted Kalmanson occurrences. -/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenFortySixthModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenFortyFifthModelRefinements
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev Hit := Label × Label

def waveOccurrence00ForwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {2, 3} },
   { center := 3, support := {9, 11} },
   { center := 9, support := {3, 11} },
   { center := 11, support := {2, 9} }]

def waveOccurrence00ReverseChoices : List (RowChoice Label) :=
  [{ center := 5, support := {7, 14} },
   { center := 7, support := {5, 13} },
   { center := 13, support := {5, 7} },
   { center := 15, support := {13, 14} }]

def waveOccurrence00Hits : List Hit :=
  [(1, 2), (1, 3), (3, 9), (3, 11), (9, 3), (9, 11), (11, 2), (11, 9)]

def waveOccurrence00ForwardData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 1, 2, 3⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 2, 3, 11⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (1, 2), right := (1, 3), path := ⟨(1, 2), [.row 1 2 3], (1, 3)⟩ },
       { left := (0, 3), right := (0, 3), path := ⟨(0, 3), [], (0, 3)⟩ },
       { left := (0, 2), right := (0, 2), path := ⟨(0, 2), [], (0, 2)⟩ },
       { left := (3, 11), right := (2, 11), path := ⟨(3, 11), [.row 3 11 9, .flip 3 9, .row 9 3 11, .flip 9 11, .row 11 9 2, .flip 11 2], (2, 11)⟩ }] }

def waveOccurrence00ReverseData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨13, 14, 15, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨5, 13, 14, 16⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (14, 15), right := (13, 15), path := ⟨(14, 15), [.flip 14 15, .row 15 14 13, .flip 15 13], (13, 15)⟩ },
       { left := (13, 16), right := (13, 16), path := ⟨(13, 16), [], (13, 16)⟩ },
       { left := (5, 13), right := (5, 14), path := ⟨(5, 13), [.flip 5 13, .row 13 5 7, .flip 13 7, .row 7 13 5, .flip 7 5, .row 5 7 14], (5, 14)⟩ },
       { left := (14, 16), right := (14, 16), path := ⟨(14, 16), [], (14, 16)⟩ }] }

def waveOccurrence00 : WeightedSourceOccurrence :=
  { hits := waveOccurrence00Hits
    forwardChoices := waveOccurrence00ForwardChoices
    reverseChoices := waveOccurrence00ReverseChoices
    forwardData := waveOccurrence00ForwardData
    reverseData := waveOccurrence00ReverseData }

theorem waveOccurrence00_check : waveOccurrence00.check = true := by
  native_decide
def waveOccurrence01ForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {3, 13} },
   { center := 10, support := {0, 13} },
   { center := 14, support := {0, 3} }]

def waveOccurrence01ReverseChoices : List (RowChoice Label) :=
  [{ center := 2, support := {13, 16} },
   { center := 6, support := {3, 16} },
   { center := 16, support := {2, 3, 13} }]

def waveOccurrence01Hits : List Hit :=
  [(0, 3), (0, 13), (0, 14), (10, 0), (10, 13), (14, 0), (14, 3)]

def waveOccurrence01ForwardData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 3, 10, 13⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨0, 3, 13, 14⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (0, 3), right := (0, 13), path := ⟨(0, 3), [.row 0 3 13], (0, 13)⟩ },
       { left := (10, 13), right := (0, 10), path := ⟨(10, 13), [.row 10 13 0, .flip 10 0], (0, 10)⟩ },
       { left := (3, 13), right := (3, 13), path := ⟨(3, 13), [], (3, 13)⟩ },
       { left := (0, 14), right := (3, 14), path := ⟨(0, 14), [.flip 0 14, .row 14 0 3, .flip 14 3], (3, 14)⟩ }] }

def waveOccurrence01ReverseData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨3, 6, 13, 16⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨2, 3, 13, 16⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (3, 6), right := (6, 16), path := ⟨(3, 6), [.flip 3 6, .row 6 3 16], (6, 16)⟩ },
       { left := (13, 16), right := (2, 13), path := ⟨(13, 16), [.flip 13 16, .row 16 13 2, .flip 16 2, .row 2 16 13], (2, 13)⟩ },
       { left := (3, 13), right := (3, 13), path := ⟨(3, 13), [], (3, 13)⟩ },
       { left := (2, 16), right := (3, 16), path := ⟨(2, 16), [.flip 2 16, .row 16 2 3, .flip 16 3], (3, 16)⟩ }] }

def waveOccurrence01 : WeightedSourceOccurrence :=
  { hits := waveOccurrence01Hits
    forwardChoices := waveOccurrence01ForwardChoices
    reverseChoices := waveOccurrence01ReverseChoices
    forwardData := waveOccurrence01ForwardData
    reverseData := waveOccurrence01ReverseData }

theorem waveOccurrence01_check : waveOccurrence01.check = true := by
  native_decide
def waveOccurrence02ForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {2, 14} },
   { center := 1, support := {0, 8, 11, 16} },
   { center := 2, support := {1, 16} },
   { center := 9, support := {11, 14} },
   { center := 11, support := {8, 9} },
   { center := 14, support := {0, 9} },
   { center := 16, support := {1, 2} }]

def waveOccurrence02ReverseChoices : List (RowChoice Label) :=
  [{ center := 0, support := {14, 15} },
   { center := 2, support := {7, 16} },
   { center := 5, support := {7, 8} },
   { center := 7, support := {2, 5} },
   { center := 14, support := {0, 15} },
   { center := 15, support := {0, 5, 8, 16} },
   { center := 16, support := {2, 14} }]

def waveOccurrence02Hits : List Hit :=
  [(0, 2), (0, 14), (1, 0), (1, 8), (1, 11), (1, 16), (2, 1), (2, 16), (9, 11), (9, 14), (11, 8), (11, 9), (14, 0), (14, 9), (16, 1), (16, 2)]

def waveOccurrence02ForwardData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 1, 2, 8⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 1, 8, 11⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (1, 2), right := (1, 8), path := ⟨(1, 2), [.flip 1 2, .row 2 1 16, .flip 2 16, .row 16 2 1, .flip 16 1, .row 1 16 8], (1, 8)⟩ },
       { left := (0, 8), right := (0, 8), path := ⟨(0, 8), [], (0, 8)⟩ },
       { left := (0, 1), right := (1, 11), path := ⟨(0, 1), [.flip 0 1, .row 1 0 11], (1, 11)⟩ },
       { left := (8, 11), right := (0, 2), path := ⟨(8, 11), [.flip 8 11, .row 11 8 9, .flip 11 9, .row 9 11 14, .flip 9 14, .row 14 9 0, .flip 14 0, .row 0 14 2], (0, 2)⟩ }] }

def waveOccurrence02ReverseData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨8, 14, 15, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨5, 8, 15, 16⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (14, 15), right := (8, 15), path := ⟨(14, 15), [.row 14 15 0, .flip 14 0, .row 0 14 15, .flip 0 15, .row 15 0 8, .flip 15 8], (8, 15)⟩ },
       { left := (8, 16), right := (8, 16), path := ⟨(8, 16), [], (8, 16)⟩ },
       { left := (5, 8), right := (14, 16), path := ⟨(5, 8), [.row 5 8 7, .flip 5 7, .row 7 5 2, .flip 7 2, .row 2 7 16, .flip 2 16, .row 16 2 14, .flip 16 14], (14, 16)⟩ },
       { left := (15, 16), right := (5, 15), path := ⟨(15, 16), [.row 15 16 5, .flip 15 5], (5, 15)⟩ }] }

def waveOccurrence02 : WeightedSourceOccurrence :=
  { hits := waveOccurrence02Hits
    forwardChoices := waveOccurrence02ForwardChoices
    reverseChoices := waveOccurrence02ReverseChoices
    forwardData := waveOccurrence02ForwardData
    reverseData := waveOccurrence02ReverseData }

theorem waveOccurrence02_check : waveOccurrence02.check = true := by
  native_decide
def waveOccurrence03ForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {1, 3, 16} },
   { center := 1, support := {0, 16} },
   { center := 14, support := {0, 3} }]

def waveOccurrence03ReverseChoices : List (RowChoice Label) :=
  [{ center := 2, support := {13, 16} },
   { center := 15, support := {0, 16} },
   { center := 16, support := {0, 13, 15} }]

def waveOccurrence03Hits : List Hit :=
  [(0, 1), (0, 3), (0, 16), (1, 0), (1, 16), (14, 0), (14, 3)]

def waveOccurrence03ForwardData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 1, 3, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨0, 1, 14, 16⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (0, 1), right := (0, 3), path := ⟨(0, 1), [.row 0 1 3], (0, 3)⟩ },
       { left := (3, 14), right := (0, 14), path := ⟨(3, 14), [.flip 3 14, .row 14 3 0, .flip 14 0], (0, 14)⟩ },
       { left := (1, 14), right := (1, 14), path := ⟨(1, 14), [], (1, 14)⟩ },
       { left := (0, 16), right := (1, 16), path := ⟨(0, 16), [.row 0 16 1, .flip 0 1, .row 1 0 16], (1, 16)⟩ }] }

def waveOccurrence03ReverseData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨2, 13, 15, 16⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨0, 2, 15, 16⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (2, 13), right := (2, 16), path := ⟨(2, 13), [.row 2 13 16], (2, 16)⟩ },
       { left := (15, 16), right := (13, 16), path := ⟨(15, 16), [.flip 15 16, .row 16 15 13, .flip 16 13], (13, 16)⟩ },
       { left := (2, 15), right := (2, 15), path := ⟨(2, 15), [], (2, 15)⟩ },
       { left := (0, 16), right := (0, 15), path := ⟨(0, 16), [.flip 0 16, .row 16 0 15, .flip 16 15, .row 15 16 0, .flip 15 0], (0, 15)⟩ }] }

def waveOccurrence03 : WeightedSourceOccurrence :=
  { hits := waveOccurrence03Hits
    forwardChoices := waveOccurrence03ForwardChoices
    reverseChoices := waveOccurrence03ReverseChoices
    forwardData := waveOccurrence03ForwardData
    reverseData := waveOccurrence03ReverseData }

theorem waveOccurrence03_check : waveOccurrence03.check = true := by
  native_decide
def waveOccurrence04ForwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {8, 11} },
   { center := 2, support := {1, 11} },
   { center := 11, support := {1, 8} }]

def waveOccurrence04ReverseChoices : List (RowChoice Label) :=
  [{ center := 5, support := {8, 15} },
   { center := 14, support := {5, 15} },
   { center := 15, support := {5, 8} }]

def waveOccurrence04Hits : List Hit :=
  [(1, 8), (1, 11), (2, 1), (2, 11), (11, 1), (11, 8)]

def waveOccurrence04ForwardData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 1, 2, 8⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 2, 8, 11⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (1, 2), right := (2, 11), path := ⟨(1, 2), [.flip 1 2, .row 2 1 11], (2, 11)⟩ },
       { left := (0, 8), right := (0, 8), path := ⟨(0, 8), [], (0, 8)⟩ },
       { left := (0, 2), right := (0, 2), path := ⟨(0, 2), [], (0, 2)⟩ },
       { left := (8, 11), right := (1, 8), path := ⟨(8, 11), [.flip 8 11, .row 11 8 1, .flip 11 1, .row 1 11 8], (1, 8)⟩ }] }

def waveOccurrence04ReverseData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨8, 14, 15, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨5, 8, 14, 16⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (14, 15), right := (5, 14), path := ⟨(14, 15), [.row 14 15 5, .flip 14 5], (5, 14)⟩ },
       { left := (8, 16), right := (8, 16), path := ⟨(8, 16), [], (8, 16)⟩ },
       { left := (5, 8), right := (8, 15), path := ⟨(5, 8), [.row 5 8 15, .flip 5 15, .row 15 5 8, .flip 15 8], (8, 15)⟩ },
       { left := (14, 16), right := (14, 16), path := ⟨(14, 16), [], (14, 16)⟩ }] }

def waveOccurrence04 : WeightedSourceOccurrence :=
  { hits := waveOccurrence04Hits
    forwardChoices := waveOccurrence04ForwardChoices
    reverseChoices := waveOccurrence04ReverseChoices
    forwardData := waveOccurrence04ForwardData
    reverseData := waveOccurrence04ReverseData }

theorem waveOccurrence04_check : waveOccurrence04.check = true := by
  native_decide
def waveOccurrence05ForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {1, 6} },
   { center := 1, support := {0, 6} },
   { center := 2, support := {1, 11} },
   { center := 10, support := {0, 11} }]

def waveOccurrence05ReverseChoices : List (RowChoice Label) :=
  [{ center := 6, support := {5, 16} },
   { center := 14, support := {5, 15} },
   { center := 15, support := {10, 16} },
   { center := 16, support := {10, 15} }]

def waveOccurrence05Hits : List Hit :=
  [(0, 1), (0, 6), (1, 0), (1, 6), (2, 1), (2, 11), (10, 0), (10, 11)]

def waveOccurrence05ForwardData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 1, 2, 6⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 2, 10, 11⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (1, 2), right := (2, 11), path := ⟨(1, 2), [.flip 1 2, .row 2 1 11], (2, 11)⟩ },
       { left := (0, 6), right := (1, 6), path := ⟨(0, 6), [.row 0 6 1, .flip 0 1, .row 1 0 6], (1, 6)⟩ },
       { left := (0, 2), right := (0, 2), path := ⟨(0, 2), [], (0, 2)⟩ },
       { left := (10, 11), right := (0, 10), path := ⟨(10, 11), [.row 10 11 0, .flip 10 0], (0, 10)⟩ }] }

def waveOccurrence05ReverseData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨10, 14, 15, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨5, 6, 14, 16⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (14, 15), right := (5, 14), path := ⟨(14, 15), [.row 14 15 5, .flip 14 5], (5, 14)⟩ },
       { left := (10, 16), right := (10, 15), path := ⟨(10, 16), [.flip 10 16, .row 16 10 15, .flip 16 15, .row 15 16 10, .flip 15 10], (10, 15)⟩ },
       { left := (5, 6), right := (6, 16), path := ⟨(5, 6), [.flip 5 6, .row 6 5 16], (6, 16)⟩ },
       { left := (14, 16), right := (14, 16), path := ⟨(14, 16), [], (14, 16)⟩ }] }

def waveOccurrence05 : WeightedSourceOccurrence :=
  { hits := waveOccurrence05Hits
    forwardChoices := waveOccurrence05ForwardChoices
    reverseChoices := waveOccurrence05ReverseChoices
    forwardData := waveOccurrence05ForwardData
    reverseData := waveOccurrence05ReverseData }

theorem waveOccurrence05_check : waveOccurrence05.check = true := by
  native_decide
def waveOccurrence06ForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {6, 13} },
   { center := 2, support := {1, 13} },
   { center := 13, support := {1, 2, 6} }]

def waveOccurrence06ReverseChoices : List (RowChoice Label) :=
  [{ center := 3, support := {10, 14, 15} },
   { center := 14, support := {3, 15} },
   { center := 16, support := {3, 10} }]

def waveOccurrence06Hits : List Hit :=
  [(0, 6), (0, 13), (2, 1), (2, 13), (13, 1), (13, 2), (13, 6)]

def waveOccurrence06ForwardData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 1, 2, 13⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 2, 6, 13⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (1, 2), right := (1, 13), path := ⟨(1, 2), [.flip 1 2, .row 2 1 13, .flip 2 13, .row 13 2 1, .flip 13 1], (1, 13)⟩ },
       { left := (0, 13), right := (0, 6), path := ⟨(0, 13), [.row 0 13 6], (0, 6)⟩ },
       { left := (0, 2), right := (0, 2), path := ⟨(0, 2), [], (0, 2)⟩ },
       { left := (6, 13), right := (2, 13), path := ⟨(6, 13), [.flip 6 13, .row 13 6 2, .flip 13 2], (2, 13)⟩ }] }

def waveOccurrence06ReverseData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨3, 14, 15, 16⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨3, 10, 14, 16⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (14, 15), right := (3, 15), path := ⟨(14, 15), [.row 14 15 3, .flip 14 3, .row 3 14 15], (3, 15)⟩ },
       { left := (3, 16), right := (10, 16), path := ⟨(3, 16), [.flip 3 16, .row 16 3 10, .flip 16 10], (10, 16)⟩ },
       { left := (3, 10), right := (3, 14), path := ⟨(3, 10), [.row 3 10 14], (3, 14)⟩ },
       { left := (14, 16), right := (14, 16), path := ⟨(14, 16), [], (14, 16)⟩ }] }

def waveOccurrence06 : WeightedSourceOccurrence :=
  { hits := waveOccurrence06Hits
    forwardChoices := waveOccurrence06ForwardChoices
    reverseChoices := waveOccurrence06ReverseChoices
    forwardData := waveOccurrence06ForwardData
    reverseData := waveOccurrence06ReverseData }

theorem waveOccurrence06_check : waveOccurrence06.check = true := by
  native_decide
def waveOccurrence07ForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {1, 12} },
   { center := 1, support := {0, 14, 15} },
   { center := 8, support := {0, 12} },
   { center := 12, support := {8, 15} },
   { center := 14, support := {1, 8} }]

def waveOccurrence07ReverseChoices : List (RowChoice Label) :=
  [{ center := 2, support := {8, 15} },
   { center := 4, support := {1, 8} },
   { center := 8, support := {4, 16} },
   { center := 15, support := {1, 16} },
   { center := 16, support := {4, 15} }]

def waveOccurrence07Hits : List Hit :=
  [(0, 1), (0, 12), (1, 0), (1, 14), (1, 15), (8, 0), (8, 12), (12, 8), (12, 15), (14, 1), (14, 8)]

def waveOccurrence07ForwardData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 1, 8, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨0, 1, 12, 15⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (0, 1), right := (1, 14), path := ⟨(0, 1), [.flip 0 1, .row 1 0 14], (1, 14)⟩ },
       { left := (8, 14), right := (0, 12), path := ⟨(8, 14), [.flip 8 14, .row 14 8 1, .flip 14 1, .row 1 14 0, .flip 1 0, .row 0 1 12], (0, 12)⟩ },
       { left := (0, 1), right := (1, 15), path := ⟨(0, 1), [.flip 0 1, .row 1 0 15], (1, 15)⟩ },
       { left := (12, 15), right := (0, 8), path := ⟨(12, 15), [.row 12 15 8, .flip 12 8, .row 8 12 0, .flip 8 0], (0, 8)⟩ }] }

def waveOccurrence07ReverseData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨2, 8, 15, 16⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 4, 15, 16⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (2, 8), right := (2, 15), path := ⟨(2, 8), [.row 2 8 15], (2, 15)⟩ },
       { left := (15, 16), right := (1, 15), path := ⟨(15, 16), [.row 15 16 1, .flip 15 1], (1, 15)⟩ },
       { left := (1, 4), right := (8, 16), path := ⟨(1, 4), [.flip 1 4, .row 4 1 8, .flip 4 8, .row 8 4 16], (8, 16)⟩ },
       { left := (15, 16), right := (4, 16), path := ⟨(15, 16), [.flip 15 16, .row 16 15 4, .flip 16 4], (4, 16)⟩ }] }

def waveOccurrence07 : WeightedSourceOccurrence :=
  { hits := waveOccurrence07Hits
    forwardChoices := waveOccurrence07ForwardChoices
    reverseChoices := waveOccurrence07ReverseChoices
    forwardData := waveOccurrence07ForwardData
    reverseData := waveOccurrence07ReverseData }

theorem waveOccurrence07_check : waveOccurrence07.check = true := by
  native_decide
def waveOccurrence08ForwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {0, 15} },
   { center := 2, support := {5, 12} },
   { center := 5, support := {1, 11} },
   { center := 8, support := {0, 12} },
   { center := 11, support := {5, 15} },
   { center := 15, support := {1, 11} }]

def waveOccurrence08ReverseChoices : List (RowChoice Label) :=
  [{ center := 1, support := {5, 15} },
   { center := 5, support := {1, 11} },
   { center := 8, support := {4, 16} },
   { center := 11, support := {5, 15} },
   { center := 14, support := {4, 11} },
   { center := 15, support := {1, 16} }]

def waveOccurrence08Hits : List Hit :=
  [(1, 0), (1, 15), (2, 5), (2, 12), (5, 1), (5, 11), (8, 0), (8, 12), (11, 5), (11, 15), (15, 1), (15, 11)]

def waveOccurrence08ForwardData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 1, 2, 5⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨0, 2, 8, 12⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (0, 1), right := (1, 5), path := ⟨(0, 1), [.flip 0 1, .row 1 0 15, .flip 1 15, .row 15 1 11, .flip 15 11, .row 11 15 5, .flip 11 5, .row 5 11 1, .flip 5 1], (1, 5)⟩ },
       { left := (2, 5), right := (2, 12), path := ⟨(2, 5), [.row 2 5 12], (2, 12)⟩ },
       { left := (0, 2), right := (0, 2), path := ⟨(0, 2), [], (0, 2)⟩ },
       { left := (8, 12), right := (0, 8), path := ⟨(8, 12), [.row 8 12 0, .flip 8 0], (0, 8)⟩ }] }

def waveOccurrence08ReverseData : WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨11, 14, 15, 16⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨4, 8, 14, 16⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (11, 14), right := (4, 14), path := ⟨(11, 14), [.flip 11 14, .row 14 11 4, .flip 14 4], (4, 14)⟩ },
       { left := (15, 16), right := (11, 15), path := ⟨(15, 16), [.row 15 16 1, .flip 15 1, .row 1 15 5, .flip 1 5, .row 5 1 11, .flip 5 11, .row 11 5 15], (11, 15)⟩ },
       { left := (4, 8), right := (8, 16), path := ⟨(4, 8), [.flip 4 8, .row 8 4 16], (8, 16)⟩ },
       { left := (14, 16), right := (14, 16), path := ⟨(14, 16), [], (14, 16)⟩ }] }

def waveOccurrence08 : WeightedSourceOccurrence :=
  { hits := waveOccurrence08Hits
    forwardChoices := waveOccurrence08ForwardChoices
    reverseChoices := waveOccurrence08ReverseChoices
    forwardData := waveOccurrence08ForwardData
    reverseData := waveOccurrence08ReverseData }

theorem waveOccurrence08_check : waveOccurrence08.check = true := by
  native_decide

def waveOccurrences : List WeightedSourceOccurrence := [waveOccurrence00, waveOccurrence01, waveOccurrence02, waveOccurrence03, waveOccurrence04, waveOccurrence05, waveOccurrence06, waveOccurrence07, waveOccurrence08]

theorem waveOccurrences_length : waveOccurrences.length = 9 := by
  rfl

theorem waveOccurrences_check :
    ∀ occurrence ∈ waveOccurrences, occurrence.check = true := by
  native_decide

def fortySixthModelRefinementClauses : Std.Sat.CNF Atom :=
  waveOccurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order =>
      directions.map fun direction =>
        weightedOccurrenceClause order direction occurrence

theorem fortySixthModelRefinementClauses_length :
    fortySixthModelRefinementClauses.length = 36 := by
  simp [fortySixthModelRefinementClauses, waveOccurrences, namedOrders, directions]

theorem sourceAssign_fortySixthModelRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortySixthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortySixthModelRefinementClauses, List.mem_flatMap, List.mem_map] at hclause
  rcases hclause with ⟨occurrence, hoccur, order, horder, direction, hdirection, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source occurrence
    (waveOccurrences_check occurrence hoccur) order direction

def extendedFortySixthModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedFortyFifthModelRefinementsCnf ++ fortySixthModelRefinementClauses

theorem extendedFortySixthModelRefinementsCnf_length :
    extendedFortySixthModelRefinementsCnf.length = 5848864 := by
  simp only [extendedFortySixthModelRefinementsCnf, List.length_append,
    extendedFortyFifthModelRefinementsCnf_length,
    fortySixthModelRefinementClauses_length]

theorem sourceAssign_extendedFortySixthModelRefinementsCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortySixthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortySixthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedFortyFifthModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortySixthModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedFortySixthModelRefinementsCnf_unsat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortySixthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortySixthModelRefinementsCnf source⟩

#print axioms waveOccurrences_check
#print axioms sourceAssign_fortySixthModelRefinementClauses
#print axioms sourceAssign_extendedFortySixthModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedFortySixthModelRefinementsCnf_unsat

end ATailBlockerVExactSeventeenFortySixthModelRefinements
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-! Seventeen source-valid size-eight V49 Kalmanson occurrences from the
authenticated V7 wave mine. Records preserve artifact order (artifact SHA256
1a51f916ed4f6afdf7486865db2089fcab2c00e35a1ef5f8a180b6f5ce708c5e; model SHA256 192ceeba6c2366cbd49128da3ed4028dfd6f842b60b293f69e4140bb413fa299). -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV8SeventeenSize8Schemas

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev Hit := Label × Label

def fortyNinthWaveV8Size8Occurrence00ForwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {0, 9} },
   { center := 9, support := {3, 11} },
   { center := 10, support := {0, 11} },
   { center := 11, support := {3, 9} }]

def fortyNinthWaveV8Size8Occurrence00ReverseChoices : List (RowChoice Label) :=
  [{ center := 5, support := {7, 13} },
   { center := 6, support := {5, 16} },
   { center := 7, support := {5, 13} },
   { center := 15, support := {7, 16} }]

def fortyNinthWaveV8Size8Occurrence00Hits : List Hit :=
  [(1, 0), (1, 9), (9, 3), (9, 11), (10, 0), (10, 11), (11, 3), (11, 9)]

def fortyNinthWaveV8Size8Occurrence00ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 1, 3, 9⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨0, 3, 10, 11⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (0, 1), right := (1, 9), path := ⟨(0, 1), [.flip 0 1, .row 1 0 9], (1, 9)⟩ },
       { left := (3, 9), right := (3, 11), path := ⟨(3, 9), [.flip 3 9, .row 9 3 11, .flip 9 11, .row 11 9 3, .flip 11 3], (3, 11)⟩ },
       { left := (0, 3), right := (0, 3), path := ⟨(0, 3), [], (0, 3)⟩ },
       { left := (10, 11), right := (0, 10), path := ⟨(10, 11), [.row 10 11 0, .flip 10 0], (0, 10)⟩ }] }

def fortyNinthWaveV8Size8Occurrence00ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨7, 13, 15, 16⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨5, 6, 13, 16⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (7, 13), right := (5, 13), path := ⟨(7, 13), [.row 7 13 5, .flip 7 5, .row 5 7 13], (5, 13)⟩ },
       { left := (15, 16), right := (7, 15), path := ⟨(15, 16), [.row 15 16 7, .flip 15 7], (7, 15)⟩ },
       { left := (5, 6), right := (6, 16), path := ⟨(5, 6), [.flip 5 6, .row 6 5 16], (6, 16)⟩ },
       { left := (13, 16), right := (13, 16), path := ⟨(13, 16), [], (13, 16)⟩ }] }

def fortyNinthWaveV8Size8Occurrence00 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV8Size8Occurrence00Hits
    forwardChoices := fortyNinthWaveV8Size8Occurrence00ForwardChoices
    reverseChoices := fortyNinthWaveV8Size8Occurrence00ReverseChoices
    forwardData := fortyNinthWaveV8Size8Occurrence00ForwardData
    reverseData := fortyNinthWaveV8Size8Occurrence00ReverseData }

def fortyNinthWaveV8Size8Occurrence01ForwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {2, 9} },
   { center := 2, support := {1, 9} },
   { center := 5, support := {1, 16} },
   { center := 13, support := {2, 16} }]

def fortyNinthWaveV8Size8Occurrence01ReverseChoices : List (RowChoice Label) :=
  [{ center := 3, support := {0, 14} },
   { center := 11, support := {0, 15} },
   { center := 14, support := {7, 15} },
   { center := 15, support := {7, 14} }]

def fortyNinthWaveV8Size8Occurrence01Hits : List Hit :=
  [(1, 2), (1, 9), (2, 1), (2, 9), (5, 1), (5, 16), (13, 2), (13, 16)]

def fortyNinthWaveV8Size8Occurrence01ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨1, 5, 13, 16⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 2, 9, 13⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (1, 5), right := (5, 16), path := ⟨(1, 5), [.flip 1 5, .row 5 1 16], (5, 16)⟩ },
       { left := (13, 16), right := (2, 13), path := ⟨(13, 16), [.row 13 16 2, .flip 13 2], (2, 13)⟩ },
       { left := (2, 9), right := (1, 9), path := ⟨(2, 9), [.row 2 9 1, .flip 2 1, .row 1 2 9], (1, 9)⟩ },
       { left := (1, 13), right := (1, 13), path := ⟨(1, 13), [], (1, 13)⟩ }] }

def fortyNinthWaveV8Size8Occurrence01ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 3, 7, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨0, 7, 11, 15⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (0, 3), right := (3, 14), path := ⟨(0, 3), [.flip 0 3, .row 3 0 14], (3, 14)⟩ },
       { left := (7, 14), right := (7, 15), path := ⟨(7, 14), [.flip 7 14, .row 14 7 15, .flip 14 15, .row 15 14 7, .flip 15 7], (7, 15)⟩ },
       { left := (0, 7), right := (0, 7), path := ⟨(0, 7), [], (0, 7)⟩ },
       { left := (11, 15), right := (0, 11), path := ⟨(11, 15), [.row 11 15 0, .flip 11 0], (0, 11)⟩ }] }

def fortyNinthWaveV8Size8Occurrence01 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV8Size8Occurrence01Hits
    forwardChoices := fortyNinthWaveV8Size8Occurrence01ForwardChoices
    reverseChoices := fortyNinthWaveV8Size8Occurrence01ReverseChoices
    forwardData := fortyNinthWaveV8Size8Occurrence01ForwardData
    reverseData := fortyNinthWaveV8Size8Occurrence01ReverseData }

def fortyNinthWaveV8Size8Occurrence02ForwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {2, 9} },
   { center := 2, support := {1, 9} },
   { center := 15, support := {2, 14} },
   { center := 16, support := {1, 14} }]

def fortyNinthWaveV8Size8Occurrence02ReverseChoices : List (RowChoice Label) :=
  [{ center := 0, support := {2, 15} },
   { center := 1, support := {2, 14} },
   { center := 14, support := {7, 15} },
   { center := 15, support := {7, 14} }]

def fortyNinthWaveV8Size8Occurrence02Hits : List Hit :=
  [(1, 2), (1, 9), (2, 1), (2, 9), (15, 2), (15, 14), (16, 1), (16, 14)]

def fortyNinthWaveV8Size8Occurrence02ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨1, 2, 9, 15⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨1, 14, 15, 16⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (2, 9), right := (1, 9), path := ⟨(2, 9), [.row 2 9 1, .flip 2 1, .row 1 2 9], (1, 9)⟩ },
       { left := (1, 15), right := (1, 15), path := ⟨(1, 15), [], (1, 15)⟩ },
       { left := (14, 15), right := (2, 15), path := ⟨(14, 15), [.flip 14 15, .row 15 14 2, .flip 15 2], (2, 15)⟩ },
       { left := (1, 16), right := (14, 16), path := ⟨(1, 16), [.flip 1 16, .row 16 1 14, .flip 16 14], (14, 16)⟩ }] }

def fortyNinthWaveV8Size8Occurrence02ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 1, 2, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 7, 14, 15⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (1, 2), right := (1, 14), path := ⟨(1, 2), [.row 1 2 14], (1, 14)⟩ },
       { left := (0, 14), right := (0, 14), path := ⟨(0, 14), [], (0, 14)⟩ },
       { left := (7, 14), right := (7, 15), path := ⟨(7, 14), [.flip 7 14, .row 14 7 15, .flip 14 15, .row 15 14 7, .flip 15 7], (7, 15)⟩ },
       { left := (0, 15), right := (0, 2), path := ⟨(0, 15), [.row 0 15 2], (0, 2)⟩ }] }

def fortyNinthWaveV8Size8Occurrence02 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV8Size8Occurrence02Hits
    forwardChoices := fortyNinthWaveV8Size8Occurrence02ForwardChoices
    reverseChoices := fortyNinthWaveV8Size8Occurrence02ReverseChoices
    forwardData := fortyNinthWaveV8Size8Occurrence02ForwardData
    reverseData := fortyNinthWaveV8Size8Occurrence02ReverseData }

def fortyNinthWaveV8Size8Occurrence03ForwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {2, 9} },
   { center := 9, support := {3, 11} },
   { center := 11, support := {3, 9} },
   { center := 13, support := {2, 11} }]

def fortyNinthWaveV8Size8Occurrence03ReverseChoices : List (RowChoice Label) :=
  [{ center := 3, support := {5, 14} },
   { center := 5, support := {7, 13} },
   { center := 7, support := {5, 13} },
   { center := 15, support := {7, 14} }]

def fortyNinthWaveV8Size8Occurrence03Hits : List Hit :=
  [(1, 2), (1, 9), (9, 3), (9, 11), (11, 3), (11, 9), (13, 2), (13, 11)]

def fortyNinthWaveV8Size8Occurrence03ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨1, 2, 9, 13⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨3, 9, 11, 13⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (1, 2), right := (1, 9), path := ⟨(1, 2), [.row 1 2 9], (1, 9)⟩ },
       { left := (9, 13), right := (9, 13), path := ⟨(9, 13), [], (9, 13)⟩ },
       { left := (3, 9), right := (3, 11), path := ⟨(3, 9), [.flip 3 9, .row 9 3 11, .flip 9 11, .row 11 9 3, .flip 11 3], (3, 11)⟩ },
       { left := (11, 13), right := (2, 13), path := ⟨(11, 13), [.flip 11 13, .row 13 11 2, .flip 13 2], (2, 13)⟩ }] }

def fortyNinthWaveV8Size8Occurrence03ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨3, 7, 14, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨3, 5, 7, 13⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (3, 7), right := (3, 7), path := ⟨(3, 7), [], (3, 7)⟩ },
       { left := (14, 15), right := (7, 15), path := ⟨(14, 15), [.flip 14 15, .row 15 14 7, .flip 15 7], (7, 15)⟩ },
       { left := (3, 5), right := (3, 14), path := ⟨(3, 5), [.row 3 5 14], (3, 14)⟩ },
       { left := (7, 13), right := (5, 13), path := ⟨(7, 13), [.row 7 13 5, .flip 7 5, .row 5 7 13], (5, 13)⟩ }] }

def fortyNinthWaveV8Size8Occurrence03 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV8Size8Occurrence03Hits
    forwardChoices := fortyNinthWaveV8Size8Occurrence03ForwardChoices
    reverseChoices := fortyNinthWaveV8Size8Occurrence03ReverseChoices
    forwardData := fortyNinthWaveV8Size8Occurrence03ForwardData
    reverseData := fortyNinthWaveV8Size8Occurrence03ReverseData }

def fortyNinthWaveV8Size8Occurrence04ForwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {6, 9} },
   { center := 2, support := {9, 15} },
   { center := 6, support := {3, 15} },
   { center := 9, support := {3, 6} }]

def fortyNinthWaveV8Size8Occurrence04ReverseChoices : List (RowChoice Label) :=
  [{ center := 7, support := {10, 13} },
   { center := 10, support := {1, 13} },
   { center := 14, support := {1, 7} },
   { center := 15, support := {7, 10} }]

def fortyNinthWaveV8Size8Occurrence04Hits : List Hit :=
  [(1, 6), (1, 9), (2, 9), (2, 15), (6, 3), (6, 15), (9, 3), (9, 6)]

def fortyNinthWaveV8Size8Occurrence04ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨1, 3, 6, 9⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 6, 9, 15⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (3, 6), right := (6, 15), path := ⟨(3, 6), [.flip 3 6, .row 6 3 15], (6, 15)⟩ },
       { left := (1, 9), right := (1, 6), path := ⟨(1, 9), [.row 1 9 6], (1, 6)⟩ },
       { left := (6, 9), right := (3, 9), path := ⟨(6, 9), [.flip 6 9, .row 9 6 3, .flip 9 3], (3, 9)⟩ },
       { left := (2, 15), right := (2, 9), path := ⟨(2, 15), [.row 2 15 9], (2, 9)⟩ }] }

def fortyNinthWaveV8Size8Occurrence04ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨1, 7, 10, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨7, 10, 13, 15⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (7, 10), right := (7, 13), path := ⟨(7, 10), [.row 7 10 13], (7, 13)⟩ },
       { left := (1, 14), right := (7, 14), path := ⟨(1, 14), [.flip 1 14, .row 14 1 7, .flip 14 7], (7, 14)⟩ },
       { left := (10, 13), right := (1, 10), path := ⟨(10, 13), [.row 10 13 1, .flip 10 1], (1, 10)⟩ },
       { left := (7, 15), right := (10, 15), path := ⟨(7, 15), [.flip 7 15, .row 15 7 10, .flip 15 10], (10, 15)⟩ }] }

def fortyNinthWaveV8Size8Occurrence04 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV8Size8Occurrence04Hits
    forwardChoices := fortyNinthWaveV8Size8Occurrence04ForwardChoices
    reverseChoices := fortyNinthWaveV8Size8Occurrence04ReverseChoices
    forwardData := fortyNinthWaveV8Size8Occurrence04ForwardData
    reverseData := fortyNinthWaveV8Size8Occurrence04ReverseData }

def fortyNinthWaveV8Size8Occurrence05ForwardChoices : List (RowChoice Label) :=
  [{ center := 2, support := {5, 9} },
   { center := 4, support := {5, 11} },
   { center := 9, support := {3, 11} },
   { center := 11, support := {3, 9} }]

def fortyNinthWaveV8Size8Occurrence05ReverseChoices : List (RowChoice Label) :=
  [{ center := 5, support := {7, 13} },
   { center := 7, support := {5, 13} },
   { center := 12, support := {5, 11} },
   { center := 14, support := {7, 11} }]

def fortyNinthWaveV8Size8Occurrence05Hits : List Hit :=
  [(2, 5), (2, 9), (4, 5), (4, 11), (9, 3), (9, 11), (11, 3), (11, 9)]

def fortyNinthWaveV8Size8Occurrence05ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨2, 3, 5, 9⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨3, 4, 5, 11⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (3, 5), right := (3, 5), path := ⟨(3, 5), [], (3, 5)⟩ },
       { left := (2, 9), right := (2, 5), path := ⟨(2, 9), [.row 2 9 5], (2, 5)⟩ },
       { left := (4, 5), right := (4, 11), path := ⟨(4, 5), [.row 4 5 11], (4, 11)⟩ },
       { left := (3, 11), right := (3, 9), path := ⟨(3, 11), [.flip 3 11, .row 11 3 9, .flip 11 9, .row 9 11 3, .flip 9 3], (3, 9)⟩ }] }

def fortyNinthWaveV8Size8Occurrence05ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨5, 7, 12, 13⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨7, 11, 12, 14⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (7, 12), right := (7, 12), path := ⟨(7, 12), [], (7, 12)⟩ },
       { left := (5, 13), right := (7, 13), path := ⟨(5, 13), [.row 5 13 7, .flip 5 7, .row 7 5 13], (7, 13)⟩ },
       { left := (11, 12), right := (5, 12), path := ⟨(11, 12), [.flip 11 12, .row 12 11 5, .flip 12 5], (5, 12)⟩ },
       { left := (7, 14), right := (11, 14), path := ⟨(7, 14), [.flip 7 14, .row 14 7 11, .flip 14 11], (11, 14)⟩ }] }

def fortyNinthWaveV8Size8Occurrence05 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV8Size8Occurrence05Hits
    forwardChoices := fortyNinthWaveV8Size8Occurrence05ForwardChoices
    reverseChoices := fortyNinthWaveV8Size8Occurrence05ReverseChoices
    forwardData := fortyNinthWaveV8Size8Occurrence05ForwardData
    reverseData := fortyNinthWaveV8Size8Occurrence05ReverseData }

def fortyNinthWaveV8Size8Occurrence06ForwardChoices : List (RowChoice Label) :=
  [{ center := 3, support := {2, 10} },
   { center := 4, support := {2, 11} },
   { center := 9, support := {3, 11} },
   { center := 11, support := {3, 10} }]

def fortyNinthWaveV8Size8Occurrence06ReverseChoices : List (RowChoice Label) :=
  [{ center := 5, support := {6, 13} },
   { center := 7, support := {5, 13} },
   { center := 12, support := {5, 14} },
   { center := 13, support := {6, 14} }]

def fortyNinthWaveV8Size8Occurrence06Hits : List Hit :=
  [(3, 2), (3, 10), (4, 2), (4, 11), (9, 3), (9, 11), (11, 3), (11, 10)]

def fortyNinthWaveV8Size8Occurrence06ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨2, 3, 4, 11⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨3, 9, 10, 11⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (2, 3), right := (3, 10), path := ⟨(2, 3), [.flip 2 3, .row 3 2 10], (3, 10)⟩ },
       { left := (4, 11), right := (2, 4), path := ⟨(4, 11), [.row 4 11 2, .flip 4 2], (2, 4)⟩ },
       { left := (3, 9), right := (9, 11), path := ⟨(3, 9), [.flip 3 9, .row 9 3 11], (9, 11)⟩ },
       { left := (10, 11), right := (3, 11), path := ⟨(10, 11), [.flip 10 11, .row 11 10 3, .flip 11 3], (3, 11)⟩ }] }

def fortyNinthWaveV8Size8Occurrence06ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨5, 12, 13, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨5, 6, 7, 13⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (5, 12), right := (12, 14), path := ⟨(5, 12), [.flip 5 12, .row 12 5 14], (12, 14)⟩ },
       { left := (13, 14), right := (6, 13), path := ⟨(13, 14), [.row 13 14 6, .flip 13 6], (6, 13)⟩ },
       { left := (5, 6), right := (5, 13), path := ⟨(5, 6), [.row 5 6 13], (5, 13)⟩ },
       { left := (7, 13), right := (5, 7), path := ⟨(7, 13), [.row 7 13 5, .flip 7 5], (5, 7)⟩ }] }

def fortyNinthWaveV8Size8Occurrence06 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV8Size8Occurrence06Hits
    forwardChoices := fortyNinthWaveV8Size8Occurrence06ForwardChoices
    reverseChoices := fortyNinthWaveV8Size8Occurrence06ReverseChoices
    forwardData := fortyNinthWaveV8Size8Occurrence06ForwardData
    reverseData := fortyNinthWaveV8Size8Occurrence06ReverseData }

def fortyNinthWaveV8Size8Occurrence07ForwardChoices : List (RowChoice Label) :=
  [{ center := 3, support := {4, 10} },
   { center := 4, support := {11, 14} },
   { center := 11, support := {10, 14} },
   { center := 13, support := {4, 11} }]

def fortyNinthWaveV8Size8Occurrence07ReverseChoices : List (RowChoice Label) :=
  [{ center := 3, support := {5, 12} },
   { center := 5, support := {2, 6} },
   { center := 12, support := {2, 5} },
   { center := 13, support := {6, 12} }]

def fortyNinthWaveV8Size8Occurrence07Hits : List Hit :=
  [(3, 4), (3, 10), (4, 11), (4, 14), (11, 10), (11, 14), (13, 4), (13, 11)]

def fortyNinthWaveV8Size8Occurrence07ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨4, 11, 13, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨3, 4, 10, 11⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (11, 13), right := (4, 13), path := ⟨(11, 13), [.flip 11 13, .row 13 11 4, .flip 13 4], (4, 13)⟩ },
       { left := (4, 14), right := (4, 11), path := ⟨(4, 14), [.row 4 14 11], (4, 11)⟩ },
       { left := (3, 4), right := (3, 10), path := ⟨(3, 4), [.row 3 4 10], (3, 10)⟩ },
       { left := (10, 11), right := (11, 14), path := ⟨(10, 11), [.flip 10 11, .row 11 10 14], (11, 14)⟩ }] }

def fortyNinthWaveV8Size8Occurrence07ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨5, 6, 12, 13⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨2, 3, 5, 12⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (5, 6), right := (2, 5), path := ⟨(5, 6), [.row 5 6 2, .flip 5 2], (2, 5)⟩ },
       { left := (12, 13), right := (6, 13), path := ⟨(12, 13), [.flip 12 13, .row 13 12 6, .flip 13 6], (6, 13)⟩ },
       { left := (3, 5), right := (3, 12), path := ⟨(3, 5), [.row 3 5 12], (3, 12)⟩ },
       { left := (2, 12), right := (5, 12), path := ⟨(2, 12), [.flip 2 12, .row 12 2 5, .flip 12 5], (5, 12)⟩ }] }

def fortyNinthWaveV8Size8Occurrence07 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV8Size8Occurrence07Hits
    forwardChoices := fortyNinthWaveV8Size8Occurrence07ForwardChoices
    reverseChoices := fortyNinthWaveV8Size8Occurrence07ReverseChoices
    forwardData := fortyNinthWaveV8Size8Occurrence07ForwardData
    reverseData := fortyNinthWaveV8Size8Occurrence07ReverseData }

def fortyNinthWaveV8Size8Occurrence08ForwardChoices : List (RowChoice Label) :=
  [{ center := 3, support := {4, 10} },
   { center := 9, support := {3, 11} },
   { center := 11, support := {3, 10} },
   { center := 13, support := {4, 11} }]

def fortyNinthWaveV8Size8Occurrence08ReverseChoices : List (RowChoice Label) :=
  [{ center := 3, support := {5, 12} },
   { center := 5, support := {6, 13} },
   { center := 7, support := {5, 13} },
   { center := 13, support := {6, 12} }]

def fortyNinthWaveV8Size8Occurrence08Hits : List Hit :=
  [(3, 4), (3, 10), (9, 3), (9, 11), (11, 3), (11, 10), (13, 4), (13, 11)]

def fortyNinthWaveV8Size8Occurrence08ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨3, 4, 11, 13⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨3, 9, 10, 11⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (3, 4), right := (3, 10), path := ⟨(3, 4), [.row 3 4 10], (3, 10)⟩ },
       { left := (11, 13), right := (4, 13), path := ⟨(11, 13), [.flip 11 13, .row 13 11 4, .flip 13 4], (4, 13)⟩ },
       { left := (3, 9), right := (9, 11), path := ⟨(3, 9), [.flip 3 9, .row 9 3 11], (9, 11)⟩ },
       { left := (10, 11), right := (3, 11), path := ⟨(10, 11), [.flip 10 11, .row 11 10 3, .flip 11 3], (3, 11)⟩ }] }

def fortyNinthWaveV8Size8Occurrence08ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨3, 5, 12, 13⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨5, 6, 7, 13⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (3, 5), right := (3, 12), path := ⟨(3, 5), [.row 3 5 12], (3, 12)⟩ },
       { left := (12, 13), right := (6, 13), path := ⟨(12, 13), [.flip 12 13, .row 13 12 6, .flip 13 6], (6, 13)⟩ },
       { left := (5, 6), right := (5, 13), path := ⟨(5, 6), [.row 5 6 13], (5, 13)⟩ },
       { left := (7, 13), right := (5, 7), path := ⟨(7, 13), [.row 7 13 5, .flip 7 5], (5, 7)⟩ }] }

def fortyNinthWaveV8Size8Occurrence08 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV8Size8Occurrence08Hits
    forwardChoices := fortyNinthWaveV8Size8Occurrence08ForwardChoices
    reverseChoices := fortyNinthWaveV8Size8Occurrence08ReverseChoices
    forwardData := fortyNinthWaveV8Size8Occurrence08ForwardData
    reverseData := fortyNinthWaveV8Size8Occurrence08ReverseData }

def fortyNinthWaveV8Size8Occurrence09ForwardChoices : List (RowChoice Label) :=
  [{ center := 3, support := {10, 13} },
   { center := 7, support := {0, 3} },
   { center := 10, support := {0, 13} },
   { center := 11, support := {3, 10} }]

def fortyNinthWaveV8Size8Occurrence09ReverseChoices : List (RowChoice Label) :=
  [{ center := 5, support := {6, 13} },
   { center := 6, support := {3, 16} },
   { center := 9, support := {13, 16} },
   { center := 13, support := {3, 6} }]

def fortyNinthWaveV8Size8Occurrence09Hits : List Hit :=
  [(3, 10), (3, 13), (7, 0), (7, 3), (10, 0), (10, 13), (11, 3), (11, 10)]

def fortyNinthWaveV8Size8Occurrence09ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨3, 10, 11, 13⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 3, 7, 10⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (10, 11), right := (3, 11), path := ⟨(10, 11), [.flip 10 11, .row 11 10 3, .flip 11 3], (3, 11)⟩ },
       { left := (3, 13), right := (3, 10), path := ⟨(3, 13), [.row 3 13 10], (3, 10)⟩ },
       { left := (3, 7), right := (0, 7), path := ⟨(3, 7), [.flip 3 7, .row 7 3 0, .flip 7 0], (0, 7)⟩ },
       { left := (0, 10), right := (10, 13), path := ⟨(0, 10), [.flip 0 10, .row 10 0 13], (10, 13)⟩ }] }

def fortyNinthWaveV8Size8Occurrence09ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨3, 5, 6, 13⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨6, 9, 13, 16⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (5, 6), right := (5, 13), path := ⟨(5, 6), [.row 5 6 13], (5, 13)⟩ },
       { left := (3, 13), right := (6, 13), path := ⟨(3, 13), [.flip 3 13, .row 13 3 6, .flip 13 6], (6, 13)⟩ },
       { left := (9, 13), right := (9, 16), path := ⟨(9, 13), [.row 9 13 16], (9, 16)⟩ },
       { left := (6, 16), right := (3, 6), path := ⟨(6, 16), [.row 6 16 3, .flip 6 3], (3, 6)⟩ }] }

def fortyNinthWaveV8Size8Occurrence09 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV8Size8Occurrence09Hits
    forwardChoices := fortyNinthWaveV8Size8Occurrence09ForwardChoices
    reverseChoices := fortyNinthWaveV8Size8Occurrence09ReverseChoices
    forwardData := fortyNinthWaveV8Size8Occurrence09ForwardData
    reverseData := fortyNinthWaveV8Size8Occurrence09ReverseData }

def fortyNinthWaveV8Size8Occurrence10ForwardChoices : List (RowChoice Label) :=
  [{ center := 3, support := {10, 13} },
   { center := 9, support := {3, 11} },
   { center := 10, support := {11, 13} },
   { center := 11, support := {3, 10} }]

def fortyNinthWaveV8Size8Occurrence10ReverseChoices : List (RowChoice Label) :=
  [{ center := 5, support := {6, 13} },
   { center := 6, support := {3, 5} },
   { center := 7, support := {5, 13} },
   { center := 13, support := {3, 6} }]

def fortyNinthWaveV8Size8Occurrence10Hits : List Hit :=
  [(3, 10), (3, 13), (9, 3), (9, 11), (10, 11), (10, 13), (11, 3), (11, 10)]

def fortyNinthWaveV8Size8Occurrence10ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨3, 10, 11, 13⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨3, 9, 10, 11⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (10, 11), right := (10, 13), path := ⟨(10, 11), [.row 10 11 13], (10, 13)⟩ },
       { left := (3, 13), right := (3, 10), path := ⟨(3, 13), [.row 3 13 10], (3, 10)⟩ },
       { left := (3, 9), right := (9, 11), path := ⟨(3, 9), [.flip 3 9, .row 9 3 11], (9, 11)⟩ },
       { left := (10, 11), right := (3, 11), path := ⟨(10, 11), [.flip 10 11, .row 11 10 3, .flip 11 3], (3, 11)⟩ }] }

def fortyNinthWaveV8Size8Occurrence10ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨3, 5, 6, 13⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨5, 6, 7, 13⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (5, 6), right := (3, 6), path := ⟨(5, 6), [.flip 5 6, .row 6 5 3, .flip 6 3], (3, 6)⟩ },
       { left := (3, 13), right := (6, 13), path := ⟨(3, 13), [.flip 3 13, .row 13 3 6, .flip 13 6], (6, 13)⟩ },
       { left := (5, 6), right := (5, 13), path := ⟨(5, 6), [.row 5 6 13], (5, 13)⟩ },
       { left := (7, 13), right := (5, 7), path := ⟨(7, 13), [.row 7 13 5, .flip 7 5], (5, 7)⟩ }] }

def fortyNinthWaveV8Size8Occurrence10 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV8Size8Occurrence10Hits
    forwardChoices := fortyNinthWaveV8Size8Occurrence10ForwardChoices
    reverseChoices := fortyNinthWaveV8Size8Occurrence10ReverseChoices
    forwardData := fortyNinthWaveV8Size8Occurrence10ForwardData
    reverseData := fortyNinthWaveV8Size8Occurrence10ReverseData }

def fortyNinthWaveV8Size8Occurrence11ForwardChoices : List (RowChoice Label) :=
  [{ center := 4, support := {2, 14} },
   { center := 13, support := {2, 16} },
   { center := 14, support := {10, 16} },
   { center := 16, support := {10, 14} }]

def fortyNinthWaveV8Size8Occurrence11ReverseChoices : List (RowChoice Label) :=
  [{ center := 0, support := {2, 6} },
   { center := 2, support := {0, 6} },
   { center := 3, support := {0, 14} },
   { center := 12, support := {2, 14} }]

def fortyNinthWaveV8Size8Occurrence11Hits : List Hit :=
  [(4, 2), (4, 14), (13, 2), (13, 16), (14, 10), (14, 16), (16, 10), (16, 14)]

def fortyNinthWaveV8Size8Occurrence11ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨2, 10, 13, 16⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨2, 4, 10, 14⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (2, 10), right := (2, 10), path := ⟨(2, 10), [], (2, 10)⟩ },
       { left := (13, 16), right := (2, 13), path := ⟨(13, 16), [.row 13 16 2, .flip 13 2], (2, 13)⟩ },
       { left := (2, 4), right := (4, 14), path := ⟨(2, 4), [.flip 2 4, .row 4 2 14], (4, 14)⟩ },
       { left := (10, 14), right := (10, 16), path := ⟨(10, 14), [.flip 10 14, .row 14 10 16, .flip 14 16, .row 16 14 10, .flip 16 10], (10, 16)⟩ }] }

def fortyNinthWaveV8Size8Occurrence11ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨0, 3, 12, 14⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨0, 2, 6, 12⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (0, 3), right := (3, 14), path := ⟨(0, 3), [.flip 0 3, .row 3 0 14], (3, 14)⟩ },
       { left := (12, 14), right := (2, 12), path := ⟨(12, 14), [.row 12 14 2, .flip 12 2], (2, 12)⟩ },
       { left := (2, 6), right := (0, 6), path := ⟨(2, 6), [.row 2 6 0, .flip 2 0, .row 0 2 6], (0, 6)⟩ },
       { left := (0, 12), right := (0, 12), path := ⟨(0, 12), [], (0, 12)⟩ }] }

def fortyNinthWaveV8Size8Occurrence11 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV8Size8Occurrence11Hits
    forwardChoices := fortyNinthWaveV8Size8Occurrence11ForwardChoices
    reverseChoices := fortyNinthWaveV8Size8Occurrence11ReverseChoices
    forwardData := fortyNinthWaveV8Size8Occurrence11ForwardData
    reverseData := fortyNinthWaveV8Size8Occurrence11ReverseData }

def fortyNinthWaveV8Size8Occurrence12ForwardChoices : List (RowChoice Label) :=
  [{ center := 4, support := {11, 14} },
   { center := 6, support := {3, 4} },
   { center := 11, support := {3, 14} },
   { center := 13, support := {4, 11} }]

def fortyNinthWaveV8Size8Occurrence12ReverseChoices : List (RowChoice Label) :=
  [{ center := 3, support := {5, 12} },
   { center := 5, support := {2, 13} },
   { center := 10, support := {12, 13} },
   { center := 12, support := {2, 5} }]

def fortyNinthWaveV8Size8Occurrence12Hits : List Hit :=
  [(4, 11), (4, 14), (6, 3), (6, 4), (11, 3), (11, 14), (13, 4), (13, 11)]

def fortyNinthWaveV8Size8Occurrence12ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨4, 11, 13, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨3, 4, 6, 11⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (11, 13), right := (4, 13), path := ⟨(11, 13), [.flip 11 13, .row 13 11 4, .flip 13 4], (4, 13)⟩ },
       { left := (4, 14), right := (4, 11), path := ⟨(4, 14), [.row 4 14 11], (4, 11)⟩ },
       { left := (4, 6), right := (3, 6), path := ⟨(4, 6), [.flip 4 6, .row 6 4 3, .flip 6 3], (3, 6)⟩ },
       { left := (3, 11), right := (11, 14), path := ⟨(3, 11), [.flip 3 11, .row 11 3 14], (11, 14)⟩ }] }

def fortyNinthWaveV8Size8Occurrence12ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨5, 10, 12, 13⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 3, 5, 12⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (10, 12), right := (10, 13), path := ⟨(10, 12), [.row 10 12 13], (10, 13)⟩ },
       { left := (5, 13), right := (2, 5), path := ⟨(5, 13), [.row 5 13 2, .flip 5 2], (2, 5)⟩ },
       { left := (3, 5), right := (3, 12), path := ⟨(3, 5), [.row 3 5 12], (3, 12)⟩ },
       { left := (2, 12), right := (5, 12), path := ⟨(2, 12), [.flip 2 12, .row 12 2 5, .flip 12 5], (5, 12)⟩ }] }

def fortyNinthWaveV8Size8Occurrence12 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV8Size8Occurrence12Hits
    forwardChoices := fortyNinthWaveV8Size8Occurrence12ForwardChoices
    reverseChoices := fortyNinthWaveV8Size8Occurrence12ReverseChoices
    forwardData := fortyNinthWaveV8Size8Occurrence12ForwardData
    reverseData := fortyNinthWaveV8Size8Occurrence12ReverseData }

def fortyNinthWaveV8Size8Occurrence13ForwardChoices : List (RowChoice Label) :=
  [{ center := 4, support := {11, 14} },
   { center := 11, support := {10, 14} },
   { center := 12, support := {8, 11} },
   { center := 14, support := {8, 10} }]

def fortyNinthWaveV8Size8Occurrence13ReverseChoices : List (RowChoice Label) :=
  [{ center := 2, support := {6, 8} },
   { center := 4, support := {5, 8} },
   { center := 5, support := {2, 6} },
   { center := 12, support := {2, 5} }]

def fortyNinthWaveV8Size8Occurrence13Hits : List Hit :=
  [(4, 11), (4, 14), (11, 10), (11, 14), (12, 8), (12, 11), (14, 8), (14, 10)]

def fortyNinthWaveV8Size8Occurrence13ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨8, 11, 12, 14⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨4, 10, 11, 14⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (11, 12), right := (8, 12), path := ⟨(11, 12), [.flip 11 12, .row 12 11 8, .flip 12 8], (8, 12)⟩ },
       { left := (8, 14), right := (10, 14), path := ⟨(8, 14), [.flip 8 14, .row 14 8 10, .flip 14 10], (10, 14)⟩ },
       { left := (10, 11), right := (11, 14), path := ⟨(10, 11), [.flip 10 11, .row 11 10 14], (11, 14)⟩ },
       { left := (4, 14), right := (4, 11), path := ⟨(4, 14), [.row 4 14 11], (4, 11)⟩ }] }

def fortyNinthWaveV8Size8Occurrence13ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨2, 5, 6, 12⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨2, 4, 5, 8⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (5, 6), right := (2, 5), path := ⟨(5, 6), [.row 5 6 2, .flip 5 2], (2, 5)⟩ },
       { left := (2, 12), right := (5, 12), path := ⟨(2, 12), [.flip 2 12, .row 12 2 5, .flip 12 5], (5, 12)⟩ },
       { left := (4, 5), right := (4, 8), path := ⟨(4, 5), [.row 4 5 8], (4, 8)⟩ },
       { left := (2, 8), right := (2, 6), path := ⟨(2, 8), [.row 2 8 6], (2, 6)⟩ }] }

def fortyNinthWaveV8Size8Occurrence13 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV8Size8Occurrence13Hits
    forwardChoices := fortyNinthWaveV8Size8Occurrence13ForwardChoices
    reverseChoices := fortyNinthWaveV8Size8Occurrence13ReverseChoices
    forwardData := fortyNinthWaveV8Size8Occurrence13ForwardData
    reverseData := fortyNinthWaveV8Size8Occurrence13ReverseData }

def fortyNinthWaveV8Size8Occurrence14ForwardChoices : List (RowChoice Label) :=
  [{ center := 4, support := {11, 14} },
   { center := 11, support := {10, 14} },
   { center := 13, support := {11, 16} },
   { center := 14, support := {10, 16} }]

def fortyNinthWaveV8Size8Occurrence14ReverseChoices : List (RowChoice Label) :=
  [{ center := 2, support := {0, 6} },
   { center := 3, support := {0, 5} },
   { center := 5, support := {2, 6} },
   { center := 12, support := {2, 5} }]

def fortyNinthWaveV8Size8Occurrence14Hits : List Hit :=
  [(4, 11), (4, 14), (11, 10), (11, 14), (13, 11), (13, 16), (14, 10), (14, 16)]

def fortyNinthWaveV8Size8Occurrence14ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨11, 13, 14, 16⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨4, 10, 11, 14⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (11, 13), right := (13, 16), path := ⟨(11, 13), [.flip 11 13, .row 13 11 16], (13, 16)⟩ },
       { left := (14, 16), right := (10, 14), path := ⟨(14, 16), [.row 14 16 10, .flip 14 10], (10, 14)⟩ },
       { left := (10, 11), right := (11, 14), path := ⟨(10, 11), [.flip 10 11, .row 11 10 14], (11, 14)⟩ },
       { left := (4, 14), right := (4, 11), path := ⟨(4, 14), [.row 4 14 11], (4, 11)⟩ }] }

def fortyNinthWaveV8Size8Occurrence14ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨2, 5, 6, 12⟩, form := .innerOuter, weight := 1 },
       { quad := ⟨0, 2, 3, 5⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (5, 6), right := (2, 5), path := ⟨(5, 6), [.row 5 6 2, .flip 5 2], (2, 5)⟩ },
       { left := (2, 12), right := (5, 12), path := ⟨(2, 12), [.flip 2 12, .row 12 2 5, .flip 12 5], (5, 12)⟩ },
       { left := (0, 2), right := (2, 6), path := ⟨(0, 2), [.flip 0 2, .row 2 0 6], (2, 6)⟩ },
       { left := (3, 5), right := (0, 3), path := ⟨(3, 5), [.row 3 5 0, .flip 3 0], (0, 3)⟩ }] }

def fortyNinthWaveV8Size8Occurrence14 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV8Size8Occurrence14Hits
    forwardChoices := fortyNinthWaveV8Size8Occurrence14ForwardChoices
    reverseChoices := fortyNinthWaveV8Size8Occurrence14ReverseChoices
    forwardData := fortyNinthWaveV8Size8Occurrence14ForwardData
    reverseData := fortyNinthWaveV8Size8Occurrence14ReverseData }

def fortyNinthWaveV8Size8Occurrence15ForwardChoices : List (RowChoice Label) :=
  [{ center := 6, support := {3, 15} },
   { center := 9, support := {3, 12} },
   { center := 12, support := {8, 15} },
   { center := 15, support := {8, 12} }]

def fortyNinthWaveV8Size8Occurrence15ReverseChoices : List (RowChoice Label) :=
  [{ center := 1, support := {4, 8} },
   { center := 4, support := {1, 8} },
   { center := 7, support := {4, 13} },
   { center := 10, support := {1, 13} }]

def fortyNinthWaveV8Size8Occurrence15Hits : List Hit :=
  [(6, 3), (6, 15), (9, 3), (9, 12), (12, 8), (12, 15), (15, 8), (15, 12)]

def fortyNinthWaveV8Size8Occurrence15ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨3, 6, 9, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨8, 9, 12, 15⟩, form := .innerOuter, weight := 1 }],
    pairings := [{ left := (3, 6), right := (6, 15), path := ⟨(3, 6), [.flip 3 6, .row 6 3 15], (6, 15)⟩ },
       { left := (9, 15), right := (9, 15), path := ⟨(9, 15), [], (9, 15)⟩ },
       { left := (9, 12), right := (3, 9), path := ⟨(9, 12), [.row 9 12 3, .flip 9 3], (3, 9)⟩ },
       { left := (8, 15), right := (8, 12), path := ⟨(8, 15), [.flip 8 15, .row 15 8 12, .flip 15 12, .row 12 15 8, .flip 12 8], (8, 12)⟩ }] }

def fortyNinthWaveV8Size8Occurrence15ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨4, 7, 8, 13⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 8, 10, 13⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (4, 7), right := (7, 13), path := ⟨(4, 7), [.flip 4 7, .row 7 4 13], (7, 13)⟩ },
       { left := (8, 13), right := (8, 13), path := ⟨(8, 13), [], (8, 13)⟩ },
       { left := (1, 8), right := (4, 8), path := ⟨(1, 8), [.row 1 8 4, .flip 1 4, .row 4 1 8], (4, 8)⟩ },
       { left := (10, 13), right := (1, 10), path := ⟨(10, 13), [.row 10 13 1, .flip 10 1], (1, 10)⟩ }] }

def fortyNinthWaveV8Size8Occurrence15 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV8Size8Occurrence15Hits
    forwardChoices := fortyNinthWaveV8Size8Occurrence15ForwardChoices
    reverseChoices := fortyNinthWaveV8Size8Occurrence15ReverseChoices
    forwardData := fortyNinthWaveV8Size8Occurrence15ForwardData
    reverseData := fortyNinthWaveV8Size8Occurrence15ReverseData }

def fortyNinthWaveV8Size8Occurrence16ForwardChoices : List (RowChoice Label) :=
  [{ center := 6, support := {4, 15} },
   { center := 8, support := {4, 12} },
   { center := 12, support := {8, 15} },
   { center := 15, support := {8, 12} }]

def fortyNinthWaveV8Size8Occurrence16ReverseChoices : List (RowChoice Label) :=
  [{ center := 1, support := {4, 8} },
   { center := 4, support := {1, 8} },
   { center := 8, support := {4, 12} },
   { center := 10, support := {1, 12} }]

def fortyNinthWaveV8Size8Occurrence16Hits : List Hit :=
  [(6, 4), (6, 15), (8, 4), (8, 12), (12, 8), (12, 15), (15, 8), (15, 12)]

def fortyNinthWaveV8Size8Occurrence16ForwardData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨4, 6, 7, 15⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨4, 7, 8, 15⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (4, 6), right := (6, 15), path := ⟨(4, 6), [.flip 4 6, .row 6 4 15], (6, 15)⟩ },
       { left := (7, 15), right := (7, 15), path := ⟨(7, 15), [], (7, 15)⟩ },
       { left := (4, 7), right := (4, 7), path := ⟨(4, 7), [], (4, 7)⟩ },
       { left := (8, 15), right := (4, 8), path := ⟨(8, 15), [.flip 8 15, .row 15 8 12, .flip 15 12, .row 12 15 8, .flip 12 8, .row 8 12 4, .flip 8 4], (4, 8)⟩ }] }

def fortyNinthWaveV8Size8Occurrence16ReverseData :
    WeightedKalmansonCancellationData Label :=
  { terms := [{ quad := ⟨1, 8, 9, 12⟩, form := .adjacentSides, weight := 1 },
       { quad := ⟨1, 9, 10, 12⟩, form := .adjacentSides, weight := 1 }],
    pairings := [{ left := (1, 8), right := (8, 12), path := ⟨(1, 8), [.row 1 8 4, .flip 1 4, .row 4 1 8, .flip 4 8, .row 8 4 12], (8, 12)⟩ },
       { left := (9, 12), right := (9, 12), path := ⟨(9, 12), [], (9, 12)⟩ },
       { left := (1, 9), right := (1, 9), path := ⟨(1, 9), [], (1, 9)⟩ },
       { left := (10, 12), right := (1, 10), path := ⟨(10, 12), [.row 10 12 1, .flip 10 1], (1, 10)⟩ }] }

def fortyNinthWaveV8Size8Occurrence16 : WeightedSourceOccurrence :=
  { hits := fortyNinthWaveV8Size8Occurrence16Hits
    forwardChoices := fortyNinthWaveV8Size8Occurrence16ForwardChoices
    reverseChoices := fortyNinthWaveV8Size8Occurrence16ReverseChoices
    forwardData := fortyNinthWaveV8Size8Occurrence16ForwardData
    reverseData := fortyNinthWaveV8Size8Occurrence16ReverseData }

theorem fortyNinthWaveV8Size8Occurrence00_check : fortyNinthWaveV8Size8Occurrence00.check = true := by
  native_decide

theorem fortyNinthWaveV8Size8Occurrence01_check : fortyNinthWaveV8Size8Occurrence01.check = true := by
  native_decide

theorem fortyNinthWaveV8Size8Occurrence02_check : fortyNinthWaveV8Size8Occurrence02.check = true := by
  native_decide

theorem fortyNinthWaveV8Size8Occurrence03_check : fortyNinthWaveV8Size8Occurrence03.check = true := by
  native_decide

theorem fortyNinthWaveV8Size8Occurrence04_check : fortyNinthWaveV8Size8Occurrence04.check = true := by
  native_decide

theorem fortyNinthWaveV8Size8Occurrence05_check : fortyNinthWaveV8Size8Occurrence05.check = true := by
  native_decide

theorem fortyNinthWaveV8Size8Occurrence06_check : fortyNinthWaveV8Size8Occurrence06.check = true := by
  native_decide

theorem fortyNinthWaveV8Size8Occurrence07_check : fortyNinthWaveV8Size8Occurrence07.check = true := by
  native_decide

theorem fortyNinthWaveV8Size8Occurrence08_check : fortyNinthWaveV8Size8Occurrence08.check = true := by
  native_decide

theorem fortyNinthWaveV8Size8Occurrence09_check : fortyNinthWaveV8Size8Occurrence09.check = true := by
  native_decide

theorem fortyNinthWaveV8Size8Occurrence10_check : fortyNinthWaveV8Size8Occurrence10.check = true := by
  native_decide

theorem fortyNinthWaveV8Size8Occurrence11_check : fortyNinthWaveV8Size8Occurrence11.check = true := by
  native_decide

theorem fortyNinthWaveV8Size8Occurrence12_check : fortyNinthWaveV8Size8Occurrence12.check = true := by
  native_decide

theorem fortyNinthWaveV8Size8Occurrence13_check : fortyNinthWaveV8Size8Occurrence13.check = true := by
  native_decide

theorem fortyNinthWaveV8Size8Occurrence14_check : fortyNinthWaveV8Size8Occurrence14.check = true := by
  native_decide

theorem fortyNinthWaveV8Size8Occurrence15_check : fortyNinthWaveV8Size8Occurrence15.check = true := by
  native_decide

theorem fortyNinthWaveV8Size8Occurrence16_check : fortyNinthWaveV8Size8Occurrence16.check = true := by
  native_decide

def fortyNinthWaveV8SeventeenSize8Occurrences : List WeightedSourceOccurrence :=
  [fortyNinthWaveV8Size8Occurrence00, fortyNinthWaveV8Size8Occurrence01, fortyNinthWaveV8Size8Occurrence02, fortyNinthWaveV8Size8Occurrence03, fortyNinthWaveV8Size8Occurrence04, fortyNinthWaveV8Size8Occurrence05, fortyNinthWaveV8Size8Occurrence06, fortyNinthWaveV8Size8Occurrence07, fortyNinthWaveV8Size8Occurrence08, fortyNinthWaveV8Size8Occurrence09, fortyNinthWaveV8Size8Occurrence10, fortyNinthWaveV8Size8Occurrence11, fortyNinthWaveV8Size8Occurrence12, fortyNinthWaveV8Size8Occurrence13, fortyNinthWaveV8Size8Occurrence14, fortyNinthWaveV8Size8Occurrence15, fortyNinthWaveV8Size8Occurrence16]

theorem fortyNinthWaveV8SeventeenSize8Occurrences_length :
    fortyNinthWaveV8SeventeenSize8Occurrences.length = 17 := by
  rfl

theorem fortyNinthWaveV8SeventeenSize8Occurrences_check :
    ∀ occurrence ∈ fortyNinthWaveV8SeventeenSize8Occurrences,
      occurrence.check = true := by
  intro occurrence hoccur
  simp only [fortyNinthWaveV8SeventeenSize8Occurrences, List.mem_cons,
    List.not_mem_nil, or_false] at hoccur
  rcases hoccur with h0 | hoccur
  · simpa [h0] using fortyNinthWaveV8Size8Occurrence00_check
  · rcases hoccur with h1 | hoccur
    · simpa [h1] using fortyNinthWaveV8Size8Occurrence01_check
    · rcases hoccur with h2 | hoccur
      · simpa [h2] using fortyNinthWaveV8Size8Occurrence02_check
      · rcases hoccur with h3 | hoccur
        · simpa [h3] using fortyNinthWaveV8Size8Occurrence03_check
        · rcases hoccur with h4 | hoccur
          · simpa [h4] using fortyNinthWaveV8Size8Occurrence04_check
          · rcases hoccur with h5 | hoccur
            · simpa [h5] using fortyNinthWaveV8Size8Occurrence05_check
            · rcases hoccur with h6 | hoccur
              · simpa [h6] using fortyNinthWaveV8Size8Occurrence06_check
              · rcases hoccur with h7 | hoccur
                · simpa [h7] using fortyNinthWaveV8Size8Occurrence07_check
                · rcases hoccur with h8 | hoccur
                  · simpa [h8] using fortyNinthWaveV8Size8Occurrence08_check
                  · rcases hoccur with h9 | hoccur
                    · simpa [h9] using fortyNinthWaveV8Size8Occurrence09_check
                    · rcases hoccur with h10 | hoccur
                      · simpa [h10] using fortyNinthWaveV8Size8Occurrence10_check
                      · rcases hoccur with h11 | hoccur
                        · simpa [h11] using fortyNinthWaveV8Size8Occurrence11_check
                        · rcases hoccur with h12 | hoccur
                          · simpa [h12] using fortyNinthWaveV8Size8Occurrence12_check
                          · rcases hoccur with h13 | hoccur
                            · simpa [h13] using fortyNinthWaveV8Size8Occurrence13_check
                            · rcases hoccur with h14 | hoccur
                              · simpa [h14] using fortyNinthWaveV8Size8Occurrence14_check
                              · rcases hoccur with h15 | hoccur
                                · simpa [h15] using fortyNinthWaveV8Size8Occurrence15_check
                                · simpa [hoccur] using fortyNinthWaveV8Size8Occurrence16_check


def fortyNinthWaveV8SeventeenSize8SchemaClauses : Std.Sat.CNF Atom :=
  fortyNinthWaveV8SeventeenSize8Occurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order => directions.map fun direction =>
      weightedOccurrenceClause order direction occurrence

theorem fortyNinthWaveV8SeventeenSize8SchemaClauses_length :
    fortyNinthWaveV8SeventeenSize8SchemaClauses.length = 68 := by
  simp [fortyNinthWaveV8SeventeenSize8SchemaClauses,
    fortyNinthWaveV8SeventeenSize8Occurrences, namedOrders, directions]

theorem sourceAssign_fortyNinthWaveV8SeventeenSize8SchemaClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV8SeventeenSize8SchemaClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortyNinthWaveV8SeventeenSize8SchemaClauses, List.mem_flatMap,
    List.mem_map] at hclause
  rcases hclause with ⟨occurrence, hoccur, order, horder, direction,
    hdirection, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source occurrence
    (fortyNinthWaveV8SeventeenSize8Occurrences_check occurrence hoccur)
    order direction

#print axioms fortyNinthWaveV8SeventeenSize8Occurrences_check
#print axioms sourceAssign_fortyNinthWaveV8SeventeenSize8SchemaClauses

end ATailBlockerVExactSeventeenFortyNinthWaveV8SeventeenSize8Schemas
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCurrentRootTwoKalmansonRefinements

/-! The 81 source-valid successor occurrences mined from the authenticated exact-17 root model. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenCurrentRootTwoKalmansonSuccessorRefinements
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenTwoTripleRowRefinements
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailBlockerVExactSeventeenCurrentRootTwoKalmansonRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
private abbrev occurrenceClauses := ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def currentRootTwoKalmansonSuccessorOccurrences : List CancellationOccurrence :=
[
  { hits := [(1, 4), (1, 11), (2, 1), (2, 11), (11, 1), (11, 4)]
    forwardChoices := [{ center := 1, support := {4, 11} },
        { center := 2, support := {1, 11} },
        { center := 11, support := {1, 4} }]
    reverseChoices := [{ center := 5, support := {12, 15} },
        { center := 14, support := {5, 15} },
        { center := 15, support := {5, 12} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 4⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 4, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 11], (2, 11)⟩
      path1 := ⟨(0, 4), [], (0, 4)⟩
      path2 := ⟨(0, 2), [], (0, 2)⟩
      path3 := ⟨(4, 11), [.flip 4 11, .row 11 4 1, .flip 11 1, .row 1 11 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 12, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(5, 12), [.row 5 12 15, .flip 5 15, .row 15 5 12, .flip 15 12], (12, 15)⟩
      path1 := ⟨(3, 14), [], (3, 14)⟩
      path2 := ⟨(3, 12), [], (3, 12)⟩
      path3 := ⟨(14, 15), [.row 14 15 5, .flip 14 5], (5, 14)⟩ } },
  { hits := [(3, 10), (3, 15), (11, 1), (11, 15), (15, 1), (15, 10)]
    forwardChoices := [{ center := 3, support := {10, 15} },
        { center := 11, support := {1, 15} },
        { center := 15, support := {1, 10} }]
    reverseChoices := [{ center := 1, support := {6, 15} },
        { center := 5, support := {1, 15} },
        { center := 13, support := {1, 6} }]
    forwardData := {
      firstQuad := ⟨1, 3, 11, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 10, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(3, 11), [], (3, 11)⟩
      path1 := ⟨(1, 15), [.flip 1 15, .row 15 1 10, .flip 15 10], (10, 15)⟩
      path2 := ⟨(3, 10), [.row 3 10 15], (3, 15)⟩
      path3 := ⟨(11, 15), [.row 11 15 1, .flip 11 1], (1, 11)⟩ }
    reverseData := {
      firstQuad := ⟨1, 5, 6, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 6, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 5), [.flip 1 5, .row 5 1 15], (5, 15)⟩
      path1 := ⟨(6, 15), [], (6, 15)⟩
      path2 := ⟨(6, 13), [.flip 6 13, .row 13 6 1, .flip 13 1], (1, 13)⟩
      path3 := ⟨(1, 15), [.row 1 15 6], (1, 6)⟩ } },
  { hits := [(4, 13), (4, 16), (13, 10), (13, 16), (15, 10), (15, 13)]
    forwardChoices := [{ center := 4, support := {13, 16} },
        { center := 13, support := {10, 16} },
        { center := 15, support := {10, 13} }]
    reverseChoices := [{ center := 1, support := {3, 6} },
        { center := 3, support := {0, 6} },
        { center := 12, support := {0, 3} }]
    forwardData := {
      firstQuad := ⟨4, 10, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨10, 13, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(10, 13), [.flip 10 13, .row 13 10 16], (13, 16)⟩
      path1 := ⟨(4, 16), [.row 4 16 13], (4, 13)⟩
      path2 := ⟨(13, 15), [.flip 13 15, .row 15 13 10, .flip 15 10], (10, 15)⟩
      path3 := ⟨(10, 16), [], (10, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 3, 6⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 3, 6, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(1, 3), [.row 1 3 6], (1, 6)⟩
      path1 := ⟨(0, 6), [], (0, 6)⟩
      path2 := ⟨(3, 6), [.row 3 6 0, .flip 3 0], (0, 3)⟩
      path3 := ⟨(0, 12), [.flip 0 12, .row 12 0 3, .flip 12 3], (3, 12)⟩ } },
  { hits := [(5, 3), (5, 7), (7, 3), (7, 6), (9, 6), (9, 7)]
    forwardChoices := [{ center := 5, support := {3, 7} },
        { center := 7, support := {3, 6} },
        { center := 9, support := {6, 7} }]
    reverseChoices := [{ center := 7, support := {9, 10} },
        { center := 9, support := {10, 13} },
        { center := 11, support := {9, 13} }]
    forwardData := {
      firstQuad := ⟨5, 6, 7, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 7, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(6, 7), [.flip 6 7, .row 7 6 3, .flip 7 3], (3, 7)⟩
      path1 := ⟨(5, 9), [], (5, 9)⟩
      path2 := ⟨(3, 5), [.flip 3 5, .row 5 3 7], (5, 7)⟩
      path3 := ⟨(7, 9), [.flip 7 9, .row 9 7 6, .flip 9 6], (6, 9)⟩ }
    reverseData := {
      firstQuad := ⟨7, 9, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 9, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(9, 10), [.row 9 10 13], (9, 13)⟩
      path1 := ⟨(7, 11), [], (7, 11)⟩
      path2 := ⟨(7, 9), [.row 7 9 10], (7, 10)⟩
      path3 := ⟨(11, 13), [.row 11 13 9, .flip 11 9], (9, 11)⟩ } },
  { hits := [(5, 3), (5, 8), (7, 3), (7, 5), (10, 5), (10, 8)]
    forwardChoices := [{ center := 5, support := {3, 8} },
        { center := 7, support := {3, 5} },
        { center := 10, support := {5, 8} }]
    reverseChoices := [{ center := 6, support := {8, 11} },
        { center := 9, support := {11, 13} },
        { center := 11, support := {8, 13} }]
    forwardData := {
      firstQuad := ⟨3, 5, 7, 8⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 8, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(5, 7), [.flip 5 7, .row 7 5 3, .flip 7 3], (3, 7)⟩
      path1 := ⟨(3, 8), [], (3, 8)⟩
      path2 := ⟨(3, 5), [.flip 3 5, .row 5 3 8], (5, 8)⟩
      path3 := ⟨(8, 10), [.flip 8 10, .row 10 8 5, .flip 10 5], (5, 10)⟩ }
    reverseData := {
      firstQuad := ⟨8, 9, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 8, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(9, 11), [.row 9 11 13], (9, 13)⟩
      path1 := ⟨(8, 13), [], (8, 13)⟩
      path2 := ⟨(6, 8), [.row 6 8 11], (6, 11)⟩
      path3 := ⟨(11, 13), [.row 11 13 8, .flip 11 8], (8, 11)⟩ } },
  { hits := [(9, 13), (9, 15), (12, 10), (12, 15), (15, 10), (15, 13)]
    forwardChoices := [{ center := 9, support := {13, 15} },
        { center := 12, support := {10, 15} },
        { center := 15, support := {10, 13} }]
    reverseChoices := [{ center := 1, support := {3, 6} },
        { center := 4, support := {1, 6} },
        { center := 7, support := {1, 3} }]
    forwardData := {
      firstQuad := ⟨9, 10, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨10, 12, 13, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(10, 13), [], (10, 13)⟩
      path1 := ⟨(9, 15), [.row 9 15 13], (9, 13)⟩
      path2 := ⟨(10, 12), [.flip 10 12, .row 12 10 15], (12, 15)⟩
      path3 := ⟨(13, 15), [.flip 13 15, .row 15 13 10, .flip 15 10], (10, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 4, 7⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 6, 7⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(1, 3), [.row 1 3 6], (1, 6)⟩
      path1 := ⟨(4, 7), [], (4, 7)⟩
      path2 := ⟨(4, 6), [.row 4 6 1, .flip 4 1], (1, 4)⟩
      path3 := ⟨(1, 7), [.flip 1 7, .row 7 1 3, .flip 7 3], (3, 7)⟩ } },
  { hits := [(0, 4), (0, 5), (5, 3), (5, 7), (7, 3), (7, 5), (8, 4), (8, 7)]
    forwardChoices := [{ center := 0, support := {4, 5} },
        { center := 5, support := {3, 7} },
        { center := 7, support := {3, 5} },
        { center := 8, support := {4, 7} }]
    reverseChoices := [{ center := 8, support := {9, 12} },
        { center := 9, support := {11, 13} },
        { center := 11, support := {9, 13} },
        { center := 16, support := {11, 12} }]
    forwardData := {
      firstQuad := ⟨0, 3, 5, 7⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 4, 7, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(3, 5), [.flip 3 5, .row 5 3 7, .flip 5 7, .row 7 5 3, .flip 7 3], (3, 7)⟩
      path1 := ⟨(0, 7), [], (0, 7)⟩
      path2 := ⟨(0, 4), [.row 0 4 5], (0, 5)⟩
      path3 := ⟨(7, 8), [.flip 7 8, .row 8 7 4, .flip 8 4], (4, 8)⟩ }
    reverseData := {
      firstQuad := ⟨9, 11, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 9, 12, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(11, 13), [.row 11 13 9, .flip 11 9, .row 9 11 13], (9, 13)⟩
      path1 := ⟨(9, 16), [], (9, 16)⟩
      path2 := ⟨(8, 9), [.row 8 9 12], (8, 12)⟩
      path3 := ⟨(12, 16), [.flip 12 16, .row 16 12 11, .flip 16 11], (11, 16)⟩ } },
  { hits := [(5, 3), (5, 7), (7, 3), (7, 5), (8, 7), (8, 12), (10, 5), (10, 12)]
    forwardChoices := [{ center := 5, support := {3, 7} },
        { center := 7, support := {3, 5} },
        { center := 8, support := {7, 12} },
        { center := 10, support := {5, 12} }]
    reverseChoices := [{ center := 6, support := {4, 11} },
        { center := 8, support := {4, 9} },
        { center := 9, support := {11, 13} },
        { center := 11, support := {9, 13} }]
    forwardData := {
      firstQuad := ⟨3, 5, 7, 8⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 8, 10, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(3, 5), [.flip 3 5, .row 5 3 7, .flip 5 7, .row 7 5 3, .flip 7 3], (3, 7)⟩
      path1 := ⟨(7, 8), [.flip 7 8, .row 8 7 12], (8, 12)⟩
      path2 := ⟨(5, 8), [], (5, 8)⟩
      path3 := ⟨(10, 12), [.row 10 12 5, .flip 10 5], (5, 10)⟩ }
    reverseData := {
      firstQuad := ⟨8, 9, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 6, 8, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(8, 9), [.row 8 9 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(11, 13), [.row 11 13 9, .flip 11 9, .row 9 11 13], (9, 13)⟩
      path2 := ⟨(4, 6), [.flip 4 6, .row 6 4 11], (6, 11)⟩
      path3 := ⟨(8, 11), [], (8, 11)⟩ } },
  { hits := [(5, 8), (5, 10), (7, 5), (7, 11), (10, 5), (10, 8), (13, 10), (13, 11)]
    forwardChoices := [{ center := 5, support := {8, 10} },
        { center := 7, support := {5, 11} },
        { center := 10, support := {5, 8} },
        { center := 13, support := {10, 11} }]
    reverseChoices := [{ center := 3, support := {5, 6} },
        { center := 6, support := {8, 11} },
        { center := 9, support := {5, 11} },
        { center := 11, support := {6, 8} }]
    forwardData := {
      firstQuad := ⟨8, 10, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 7, 8, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(8, 10), [.flip 8 10, .row 10 8 5, .flip 10 5, .row 5 10 8], (5, 8)⟩
      path1 := ⟨(11, 13), [.flip 11 13, .row 13 11 10, .flip 13 10], (10, 13)⟩
      path2 := ⟨(5, 7), [.flip 5 7, .row 7 5 11], (7, 11)⟩
      path3 := ⟨(8, 11), [], (8, 11)⟩ }
    reverseData := {
      firstQuad := ⟨5, 8, 9, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 6, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(5, 8), [], (5, 8)⟩
      path1 := ⟨(9, 11), [.row 9 11 5, .flip 9 5], (5, 9)⟩
      path2 := ⟨(3, 5), [.row 3 5 6], (3, 6)⟩
      path3 := ⟨(6, 8), [.row 6 8 11, .flip 6 11, .row 11 6 8, .flip 11 8], (8, 11)⟩ } },
  { hits := [(5, 8), (5, 10), (8, 9), (8, 12), (10, 8), (10, 12), (12, 9), (12, 10)]
    forwardChoices := [{ center := 5, support := {8, 10} },
        { center := 8, support := {9, 12} },
        { center := 10, support := {8, 12} },
        { center := 12, support := {9, 10} }]
    reverseChoices := [{ center := 4, support := {6, 7} },
        { center := 6, support := {4, 8} },
        { center := 8, support := {4, 7} },
        { center := 11, support := {6, 8} }]
    forwardData := {
      firstQuad := ⟨8, 9, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 8, 10, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(8, 9), [.row 8 9 12], (8, 12)⟩
      path1 := ⟨(10, 12), [.flip 10 12, .row 12 10 9, .flip 12 9], (9, 12)⟩
      path2 := ⟨(5, 8), [.row 5 8 10], (5, 10)⟩
      path3 := ⟨(10, 12), [.row 10 12 8, .flip 10 8], (8, 10)⟩ }
    reverseData := {
      firstQuad := ⟨4, 6, 7, 8⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 6, 8, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(4, 6), [.flip 4 6, .row 6 4 8], (6, 8)⟩
      path1 := ⟨(7, 8), [.flip 7 8, .row 8 7 4, .flip 8 4], (4, 8)⟩
      path2 := ⟨(4, 6), [.row 4 6 7], (4, 7)⟩
      path3 := ⟨(8, 11), [.flip 8 11, .row 11 8 6, .flip 11 6], (6, 11)⟩ } },
  { hits := [(8, 9), (8, 12), (10, 8), (10, 12), (11, 8), (11, 15), (12, 9), (12, 15)]
    forwardChoices := [{ center := 8, support := {9, 12} },
        { center := 10, support := {8, 12} },
        { center := 11, support := {8, 15} },
        { center := 12, support := {9, 15} }]
    reverseChoices := [{ center := 4, support := {1, 7} },
        { center := 5, support := {1, 8} },
        { center := 6, support := {4, 8} },
        { center := 8, support := {4, 7} }]
    forwardData := {
      firstQuad := ⟨8, 9, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 11, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(8, 9), [.row 8 9 12], (8, 12)⟩
      path1 := ⟨(10, 12), [.row 10 12 8, .flip 10 8], (8, 10)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 15], (11, 15)⟩
      path3 := ⟨(12, 15), [.row 12 15 9, .flip 12 9], (9, 12)⟩ }
    reverseData := {
      firstQuad := ⟨4, 6, 7, 8⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 5, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(4, 6), [.flip 4 6, .row 6 4 8], (6, 8)⟩
      path1 := ⟨(7, 8), [.flip 7 8, .row 8 7 4, .flip 8 4], (4, 8)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 7], (4, 7)⟩
      path3 := ⟨(5, 8), [.row 5 8 1, .flip 5 1], (1, 5)⟩ } },
  { hits := [(10, 12), (10, 16), (12, 3), (12, 10), (13, 10), (13, 16), (16, 3), (16, 12)]
    forwardChoices := [{ center := 10, support := {12, 16} },
        { center := 12, support := {3, 10} },
        { center := 13, support := {10, 16} },
        { center := 16, support := {3, 12} }]
    reverseChoices := [{ center := 0, support := {4, 13} },
        { center := 3, support := {0, 6} },
        { center := 4, support := {6, 13} },
        { center := 6, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨10, 12, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 10, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(10, 12), [.flip 10 12, .row 12 10 3, .flip 12 3], (3, 12)⟩
      path1 := ⟨(13, 16), [.row 13 16 10, .flip 13 10], (10, 13)⟩
      path2 := ⟨(10, 12), [.row 10 12 16], (10, 16)⟩
      path3 := ⟨(3, 16), [.flip 3 16, .row 16 3 12, .flip 16 12], (12, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 4, 6⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 4, 6, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 6], (3, 6)⟩
      path1 := ⟨(4, 6), [.row 4 6 13], (4, 13)⟩
      path2 := ⟨(4, 6), [.flip 4 6, .row 6 4 0, .flip 6 0], (0, 6)⟩
      path3 := ⟨(0, 13), [.row 0 13 4], (0, 4)⟩ } },
  { hits := [(10, 12), (10, 16), (13, 10), (13, 16), (15, 0), (15, 10), (16, 0), (16, 12)]
    forwardChoices := [{ center := 10, support := {12, 16} },
        { center := 13, support := {10, 16} },
        { center := 15, support := {0, 10} },
        { center := 16, support := {0, 12} }]
    reverseChoices := [{ center := 0, support := {4, 16} },
        { center := 1, support := {6, 16} },
        { center := 3, support := {0, 6} },
        { center := 6, support := {0, 4} }]
    forwardData := {
      firstQuad := ⟨10, 12, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 10, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(10, 12), [.row 10 12 16], (10, 16)⟩
      path1 := ⟨(13, 16), [.row 13 16 10, .flip 13 10], (10, 13)⟩
      path2 := ⟨(10, 15), [.flip 10 15, .row 15 10 0, .flip 15 0], (0, 15)⟩
      path3 := ⟨(0, 16), [.flip 0 16, .row 16 0 12, .flip 16 12], (12, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 4, 6⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 6, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 6], (3, 6)⟩
      path1 := ⟨(4, 6), [.flip 4 6, .row 6 4 0, .flip 6 0], (0, 6)⟩
      path2 := ⟨(1, 6), [.row 1 6 16], (1, 16)⟩
      path3 := ⟨(0, 16), [.row 0 16 4], (0, 4)⟩ } },
  { hits := [(0, 2), (0, 4), (1, 4), (1, 11), (2, 1), (2, 11), (3, 2), (3, 15), (11, 1), (11, 15)]
    forwardChoices := [{ center := 0, support := {2, 4} },
        { center := 1, support := {4, 11} },
        { center := 2, support := {1, 11} },
        { center := 3, support := {2, 15} },
        { center := 11, support := {1, 15} }]
    reverseChoices := [{ center := 5, support := {1, 15} },
        { center := 13, support := {1, 14} },
        { center := 14, support := {5, 15} },
        { center := 15, support := {5, 12} },
        { center := 16, support := {12, 14} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 4⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 11], (2, 11)⟩
      path1 := ⟨(0, 4), [.row 0 4 2], (0, 2)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15], (3, 15)⟩
      path3 := ⟨(11, 15), [.row 11 15 1, .flip 11 1, .row 1 11 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨12, 14, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 5, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(14, 15), [.row 14 15 5, .flip 14 5], (5, 14)⟩
      path1 := ⟨(12, 16), [.flip 12 16, .row 16 12 14, .flip 16 14], (14, 16)⟩
      path2 := ⟨(1, 5), [.flip 1 5, .row 5 1 15, .flip 5 15, .row 15 5 12, .flip 15 12], (12, 15)⟩
      path3 := ⟨(13, 14), [.row 13 14 1, .flip 13 1], (1, 13)⟩ } },
  { hits := [(0, 2), (0, 4), (1, 4), (1, 11), (2, 1), (2, 11), (11, 1), (11, 8), (14, 2), (14, 8)]
    forwardChoices := [{ center := 0, support := {2, 4} },
        { center := 1, support := {4, 11} },
        { center := 2, support := {1, 11} },
        { center := 11, support := {1, 8} },
        { center := 14, support := {2, 8} }]
    reverseChoices := [{ center := 2, support := {8, 14} },
        { center := 5, support := {8, 15} },
        { center := 14, support := {5, 15} },
        { center := 15, support := {5, 12} },
        { center := 16, support := {12, 14} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 4⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 8, 11, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 11], (2, 11)⟩
      path1 := ⟨(0, 4), [.row 0 4 2], (0, 2)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 1, .flip 11 1, .row 1 11 4], (1, 4)⟩
      path3 := ⟨(2, 14), [.flip 2 14, .row 14 2 8, .flip 14 8], (8, 14)⟩ }
    reverseData := {
      firstQuad := ⟨12, 14, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 8, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(14, 15), [.row 14 15 5, .flip 14 5], (5, 14)⟩
      path1 := ⟨(12, 16), [.flip 12 16, .row 16 12 14, .flip 16 14], (14, 16)⟩
      path2 := ⟨(5, 8), [.row 5 8 15, .flip 5 15, .row 15 5 12, .flip 15 12], (12, 15)⟩
      path3 := ⟨(2, 14), [.row 2 14 8], (2, 8)⟩ } },
  { hits := [(0, 4), (0, 5), (5, 8), (5, 10), (8, 4), (8, 9), (10, 5), (10, 8), (12, 9), (12, 10)]
    forwardChoices := [{ center := 0, support := {4, 5} },
        { center := 5, support := {8, 10} },
        { center := 8, support := {4, 9} },
        { center := 10, support := {5, 8} },
        { center := 12, support := {9, 10} }]
    reverseChoices := [{ center := 4, support := {6, 7} },
        { center := 6, support := {8, 11} },
        { center := 8, support := {7, 12} },
        { center := 11, support := {6, 8} },
        { center := 16, support := {11, 12} }]
    forwardData := {
      firstQuad := ⟨8, 9, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 4, 5, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(8, 9), [.row 8 9 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(10, 12), [.flip 10 12, .row 12 10 9, .flip 12 9], (9, 12)⟩
      path2 := ⟨(0, 4), [.row 0 4 5], (0, 5)⟩
      path3 := ⟨(5, 8), [.row 5 8 10, .flip 5 10, .row 10 5 8, .flip 10 8], (8, 10)⟩ }
    reverseData := {
      firstQuad := ⟨4, 6, 7, 8⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 11, 12, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(4, 6), [.row 4 6 7], (4, 7)⟩
      path1 := ⟨(7, 8), [.flip 7 8, .row 8 7 12], (8, 12)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 6, .flip 11 6, .row 6 11 8], (6, 8)⟩
      path3 := ⟨(12, 16), [.flip 12 16, .row 16 12 11, .flip 16 11], (11, 16)⟩ } },
  { hits := [(0, 4), (0, 5), (6, 7), (6, 9), (7, 5), (7, 6), (8, 4), (8, 9), (9, 6), (9, 7)]
    forwardChoices := [{ center := 0, support := {4, 5} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {5, 6} },
        { center := 8, support := {4, 9} },
        { center := 9, support := {6, 7} }]
    reverseChoices := [{ center := 7, support := {9, 10} },
        { center := 8, support := {7, 12} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {7, 9} },
        { center := 16, support := {11, 12} }]
    forwardData := {
      firstQuad := ⟨5, 7, 8, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 4, 5, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(5, 7), [.flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 9, .flip 6 9, .row 9 6 7, .flip 9 7], (7, 9)⟩
      path1 := ⟨(8, 9), [.row 8 9 4, .flip 8 4], (4, 8)⟩
      path2 := ⟨(0, 4), [.row 0 4 5], (0, 5)⟩
      path3 := ⟨(5, 8), [], (5, 8)⟩ }
    reverseData := {
      firstQuad := ⟨7, 8, 9, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨9, 11, 12, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(7, 8), [.flip 7 8, .row 8 7 12], (8, 12)⟩
      path1 := ⟨(9, 12), [], (9, 12)⟩
      path2 := ⟨(9, 11), [.row 9 11 10, .flip 9 10, .row 10 9 7, .flip 10 7, .row 7 10 9], (7, 9)⟩
      path3 := ⟨(12, 16), [.flip 12 16, .row 16 12 11, .flip 16 11], (11, 16)⟩ } },
  { hits := [(2, 6), (2, 12), (5, 3), (5, 10), (7, 5), (7, 6), (10, 5), (10, 12), (12, 3), (12, 10)]
    forwardChoices := [{ center := 2, support := {6, 12} },
        { center := 5, support := {3, 10} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 12} },
        { center := 12, support := {3, 10} }]
    reverseChoices := [{ center := 4, support := {6, 13} },
        { center := 6, support := {4, 11} },
        { center := 9, support := {10, 11} },
        { center := 11, support := {6, 13} },
        { center := 14, support := {4, 10} }]
    forwardData := {
      firstQuad := ⟨2, 3, 6, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 6, 7⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(3, 6), [], (3, 6)⟩
      path1 := ⟨(2, 12), [.row 2 12 6], (2, 6)⟩
      path2 := ⟨(3, 5), [.flip 3 5, .row 5 3 10, .flip 5 10, .row 10 5 12, .flip 10 12, .row 12 10 3, .flip 12 3], (3, 12)⟩
      path3 := ⟨(6, 7), [.flip 6 7, .row 7 6 5, .flip 7 5], (5, 7)⟩ }
    reverseData := {
      firstQuad := ⟨4, 10, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨9, 10, 11, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(10, 13), [], (10, 13)⟩
      path1 := ⟨(4, 14), [.flip 4 14, .row 14 4 10, .flip 14 10], (10, 14)⟩
      path2 := ⟨(9, 10), [.row 9 10 11], (9, 11)⟩
      path3 := ⟨(11, 13), [.row 11 13 6, .flip 11 6, .row 6 11 4, .flip 6 4, .row 4 6 13], (4, 13)⟩ } },
  { hits := [(2, 11), (2, 12), (6, 7), (6, 9), (7, 6), (7, 11), (8, 9), (8, 12), (9, 6), (9, 7)]
    forwardChoices := [{ center := 2, support := {11, 12} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {6, 11} },
        { center := 8, support := {9, 12} },
        { center := 9, support := {6, 7} }]
    reverseChoices := [{ center := 7, support := {9, 10} },
        { center := 8, support := {4, 7} },
        { center := 9, support := {5, 10} },
        { center := 10, support := {7, 9} },
        { center := 14, support := {4, 5} }]
    forwardData := {
      firstQuad := ⟨7, 8, 9, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 7, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(8, 9), [.row 8 9 12], (8, 12)⟩
      path1 := ⟨(7, 12), [], (7, 12)⟩
      path2 := ⟨(7, 11), [.row 7 11 6, .flip 7 6, .row 6 7 9, .flip 6 9, .row 9 6 7, .flip 9 7], (7, 9)⟩
      path3 := ⟨(2, 12), [.row 2 12 11], (2, 11)⟩ }
    reverseData := {
      firstQuad := ⟨5, 7, 8, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 8, 14⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(7, 8), [.flip 7 8, .row 8 7 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(5, 9), [.flip 5 9, .row 9 5 10, .flip 9 10, .row 10 9 7, .flip 10 7, .row 7 10 9], (7, 9)⟩
      path2 := ⟨(5, 8), [], (5, 8)⟩
      path3 := ⟨(4, 14), [.flip 4 14, .row 14 4 5, .flip 14 5], (5, 14)⟩ } },
  { hits := [(3, 10), (3, 15), (7, 3), (7, 5), (10, 5), (10, 12), (12, 10), (12, 15), (16, 3), (16, 12)]
    forwardChoices := [{ center := 3, support := {10, 15} },
        { center := 7, support := {3, 5} },
        { center := 10, support := {5, 12} },
        { center := 12, support := {10, 15} },
        { center := 16, support := {3, 12} }]
    reverseChoices := [{ center := 0, support := {4, 13} },
        { center := 4, support := {1, 6} },
        { center := 6, support := {4, 11} },
        { center := 9, support := {11, 13} },
        { center := 13, support := {1, 6} }]
    forwardData := {
      firstQuad := ⟨3, 12, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 7, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(12, 15), [.row 12 15 10, .flip 12 10, .row 10 12 5, .flip 10 5], (5, 10)⟩
      path1 := ⟨(3, 16), [.flip 3 16, .row 16 3 12, .flip 16 12], (12, 16)⟩
      path2 := ⟨(5, 7), [.flip 5 7, .row 7 5 3, .flip 7 3], (3, 7)⟩
      path3 := ⟨(3, 10), [.row 3 10 15], (3, 15)⟩ }
    reverseData := {
      firstQuad := ⟨6, 9, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 4, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(9, 11), [.row 9 11 13], (9, 13)⟩
      path1 := ⟨(6, 13), [.flip 6 13, .row 13 6 1, .flip 13 1], (1, 13)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 6, .flip 4 6, .row 6 4 11], (6, 11)⟩
      path3 := ⟨(0, 13), [.row 0 13 4], (0, 4)⟩ } },
  { hits := [(4, 6), (4, 13), (6, 9), (6, 14), (9, 6), (9, 13), (12, 9), (12, 10), (13, 10), (13, 14)]
    forwardChoices := [{ center := 4, support := {6, 13} },
        { center := 6, support := {9, 14} },
        { center := 9, support := {6, 13} },
        { center := 12, support := {9, 10} },
        { center := 13, support := {10, 14} }]
    reverseChoices := [{ center := 3, support := {2, 6} },
        { center := 4, support := {6, 7} },
        { center := 7, support := {3, 10} },
        { center := 10, support := {2, 7} },
        { center := 12, support := {3, 10} }]
    forwardData := {
      firstQuad := ⟨4, 6, 13, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨9, 10, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 6), [.row 4 6 13], (4, 13)⟩
      path1 := ⟨(13, 14), [.row 13 14 10, .flip 13 10], (10, 13)⟩
      path2 := ⟨(10, 12), [.flip 10 12, .row 12 10 9, .flip 12 9], (9, 12)⟩
      path3 := ⟨(9, 13), [.row 9 13 6, .flip 9 6, .row 6 9 14], (6, 14)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 6, 7⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 10, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(4, 6), [.row 4 6 7], (4, 7)⟩
      path1 := ⟨(3, 7), [.flip 3 7, .row 7 3 10, .flip 7 10, .row 10 7 2, .flip 10 2], (2, 10)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 6], (3, 6)⟩
      path3 := ⟨(10, 12), [.flip 10 12, .row 12 10 3, .flip 12 3], (3, 12)⟩ } },
  { hits := [(5, 3), (5, 10), (6, 7), (6, 9), (7, 3), (7, 6), (9, 6), (9, 7), (12, 9), (12, 10)]
    forwardChoices := [{ center := 5, support := {3, 10} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {3, 6} },
        { center := 9, support := {6, 7} },
        { center := 12, support := {9, 10} }]
    reverseChoices := [{ center := 4, support := {6, 7} },
        { center := 7, support := {9, 10} },
        { center := 9, support := {10, 13} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {6, 13} }]
    forwardData := {
      firstQuad := ⟨5, 9, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 7, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(5, 9), [], (5, 9)⟩
      path1 := ⟨(10, 12), [.flip 10 12, .row 12 10 9, .flip 12 9], (9, 12)⟩
      path2 := ⟨(3, 5), [.flip 3 5, .row 5 3 10], (5, 10)⟩
      path3 := ⟨(7, 9), [.flip 7 9, .row 9 7 6, .flip 9 6, .row 6 9 7, .flip 6 7, .row 7 6 3, .flip 7 3], (3, 7)⟩ }
    reverseData := {
      firstQuad := ⟨6, 9, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 6, 7, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(6, 9), [], (6, 9)⟩
      path1 := ⟨(11, 13), [.row 11 13 6, .flip 11 6], (6, 11)⟩
      path2 := ⟨(4, 6), [.row 4 6 7], (4, 7)⟩
      path3 := ⟨(7, 9), [.row 7 9 10, .flip 7 10, .row 10 7 9, .flip 10 9, .row 9 10 13], (9, 13)⟩ } },
  { hits := [(5, 7), (5, 10), (7, 5), (7, 11), (8, 7), (8, 12), (10, 5), (10, 12), (13, 10), (13, 11)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 7, support := {5, 11} },
        { center := 8, support := {7, 12} },
        { center := 10, support := {5, 12} },
        { center := 13, support := {10, 11} }]
    reverseChoices := [{ center := 3, support := {5, 6} },
        { center := 6, support := {4, 11} },
        { center := 8, support := {4, 9} },
        { center := 9, support := {5, 11} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨7, 8, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 10, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(7, 8), [.flip 7 8, .row 8 7 12], (8, 12)⟩
      path1 := ⟨(11, 13), [.flip 11 13, .row 13 11 10, .flip 13 10], (10, 13)⟩
      path2 := ⟨(10, 12), [.row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 11], (7, 11)⟩
      path3 := ⟨(8, 13), [], (8, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 6, 8⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 8, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(4, 6), [.flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 5, .flip 9 5], (5, 9)⟩
      path1 := ⟨(3, 8), [], (3, 8)⟩
      path2 := ⟨(3, 5), [.row 3 5 6], (3, 6)⟩
      path3 := ⟨(8, 9), [.row 8 9 4, .flip 8 4], (4, 8)⟩ } },
  { hits := [(6, 7), (6, 9), (7, 5), (7, 6), (8, 9), (8, 12), (9, 6), (9, 7), (10, 5), (10, 12)]
    forwardChoices := [{ center := 6, support := {7, 9} },
        { center := 7, support := {5, 6} },
        { center := 8, support := {9, 12} },
        { center := 9, support := {6, 7} },
        { center := 10, support := {5, 12} }]
    reverseChoices := [{ center := 6, support := {4, 11} },
        { center := 7, support := {9, 10} },
        { center := 8, support := {4, 7} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {7, 9} }]
    forwardData := {
      firstQuad := ⟨7, 8, 9, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 7, 10, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(8, 9), [.row 8 9 12], (8, 12)⟩
      path1 := ⟨(7, 12), [], (7, 12)⟩
      path2 := ⟨(5, 7), [.flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 9, .flip 6 9, .row 9 6 7, .flip 9 7], (7, 9)⟩
      path3 := ⟨(10, 12), [.row 10 12 5, .flip 10 5], (5, 10)⟩ }
    reverseData := {
      firstQuad := ⟨4, 7, 8, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 9, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(7, 8), [.flip 7 8, .row 8 7 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(4, 9), [], (4, 9)⟩
      path2 := ⟨(4, 6), [.flip 4 6, .row 6 4 11], (6, 11)⟩
      path3 := ⟨(9, 11), [.row 9 11 10, .flip 9 10, .row 10 9 7, .flip 10 7, .row 7 10 9], (7, 9)⟩ } },
  { hits := [(6, 7), (6, 9), (7, 6), (7, 11), (9, 6), (9, 7), (12, 9), (12, 10), (13, 10), (13, 11)]
    forwardChoices := [{ center := 6, support := {7, 9} },
        { center := 7, support := {6, 11} },
        { center := 9, support := {6, 7} },
        { center := 12, support := {9, 10} },
        { center := 13, support := {10, 11} }]
    reverseChoices := [{ center := 3, support := {5, 6} },
        { center := 4, support := {6, 7} },
        { center := 7, support := {9, 10} },
        { center := 9, support := {5, 10} },
        { center := 10, support := {7, 9} }]
    forwardData := {
      firstQuad := ⟨7, 9, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨9, 10, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(7, 9), [.flip 7 9, .row 9 7 6, .flip 9 6, .row 6 9 7, .flip 6 7, .row 7 6 11], (7, 11)⟩
      path1 := ⟨(11, 13), [.flip 11 13, .row 13 11 10, .flip 13 10], (10, 13)⟩
      path2 := ⟨(10, 12), [.flip 10 12, .row 12 10 9, .flip 12 9], (9, 12)⟩
      path3 := ⟨(9, 13), [], (9, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 6, 7⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 7, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(4, 6), [.row 4 6 7], (4, 7)⟩
      path1 := ⟨(3, 7), [], (3, 7)⟩
      path2 := ⟨(3, 5), [.row 3 5 6], (3, 6)⟩
      path3 := ⟨(7, 9), [.row 7 9 10, .flip 7 10, .row 10 7 9, .flip 10 9, .row 9 10 5, .flip 9 5], (5, 9)⟩ } },
  { hits := [(0, 2), (0, 13), (6, 9), (6, 14), (9, 6), (9, 13), (12, 9), (12, 10), (13, 10), (13, 14), (14, 2), (14, 6)]
    forwardChoices := [{ center := 0, support := {2, 13} },
        { center := 6, support := {9, 14} },
        { center := 9, support := {6, 13} },
        { center := 12, support := {9, 10} },
        { center := 13, support := {10, 14} },
        { center := 14, support := {2, 6} }]
    reverseChoices := [{ center := 2, support := {10, 14} },
        { center := 3, support := {2, 6} },
        { center := 4, support := {6, 7} },
        { center := 7, support := {3, 10} },
        { center := 10, support := {2, 7} },
        { center := 16, support := {3, 14} }]
    forwardData := {
      firstQuad := ⟨0, 2, 13, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨9, 10, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 2), [.row 0 2 13], (0, 13)⟩
      path1 := ⟨(13, 14), [.row 13 14 10, .flip 13 10], (10, 13)⟩
      path2 := ⟨(10, 12), [.flip 10 12, .row 12 10 9, .flip 12 9], (9, 12)⟩
      path3 := ⟨(9, 13), [.row 9 13 6, .flip 9 6, .row 6 9 14, .flip 6 14, .row 14 6 2, .flip 14 2], (2, 14)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 6, 7⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(4, 6), [.row 4 6 7], (4, 7)⟩
      path1 := ⟨(3, 7), [.flip 3 7, .row 7 3 10, .flip 7 10, .row 10 7 2, .flip 10 2, .row 2 10 14], (2, 14)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 6], (3, 6)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 3, .flip 16 3], (3, 16)⟩ } },
  { hits := [(0, 4), (0, 5), (3, 4), (3, 15), (5, 3), (5, 10), (10, 5), (10, 12), (12, 10), (12, 15), (16, 3), (16, 12)]
    forwardChoices := [{ center := 0, support := {4, 5} },
        { center := 3, support := {4, 15} },
        { center := 5, support := {3, 10} },
        { center := 10, support := {5, 12} },
        { center := 12, support := {10, 15} },
        { center := 16, support := {3, 12} }]
    reverseChoices := [{ center := 0, support := {4, 13} },
        { center := 4, support := {1, 6} },
        { center := 6, support := {4, 11} },
        { center := 11, support := {6, 13} },
        { center := 13, support := {1, 12} },
        { center := 16, support := {11, 12} }]
    forwardData := {
      firstQuad := ⟨3, 12, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 3, 4, 5⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(12, 15), [.row 12 15 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 3, .flip 5 3], (3, 5)⟩
      path1 := ⟨(3, 16), [.flip 3 16, .row 16 3 12, .flip 16 12], (12, 16)⟩
      path2 := ⟨(3, 4), [.row 3 4 15], (3, 15)⟩
      path3 := ⟨(0, 5), [.row 0 5 4], (0, 4)⟩ }
    reverseData := {
      firstQuad := ⟨11, 12, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 4, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1], (1, 13)⟩
      path1 := ⟨(11, 16), [.flip 11 16, .row 16 11 12, .flip 16 12], (12, 16)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 13], (11, 13)⟩
      path3 := ⟨(0, 13), [.row 0 13 4], (0, 4)⟩ } },
  { hits := [(0, 4), (0, 5), (5, 7), (5, 8), (6, 7), (6, 9), (7, 5), (7, 6), (8, 4), (8, 9), (14, 6), (14, 8)]
    forwardChoices := [{ center := 0, support := {4, 5} },
        { center := 5, support := {7, 8} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {5, 6} },
        { center := 8, support := {4, 9} },
        { center := 14, support := {6, 8} }]
    reverseChoices := [{ center := 2, support := {8, 10} },
        { center := 8, support := {7, 12} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {8, 9} },
        { center := 16, support := {11, 12} }]
    forwardData := {
      firstQuad := ⟨6, 8, 9, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 4, 5, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(8, 9), [.row 8 9 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(6, 14), [.flip 6 14, .row 14 6 8, .flip 14 8], (8, 14)⟩
      path2 := ⟨(0, 4), [.row 0 4 5], (0, 5)⟩
      path3 := ⟨(5, 8), [.row 5 8 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 9], (6, 9)⟩ }
    reverseData := {
      firstQuad := ⟨2, 7, 8, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 11, 12, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(7, 8), [.flip 7 8, .row 8 7 12], (8, 12)⟩
      path1 := ⟨(2, 10), [.row 2 10 8], (2, 8)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 7, .flip 10 7], (7, 10)⟩
      path3 := ⟨(12, 16), [.flip 12 16, .row 16 12 11, .flip 16 11], (11, 16)⟩ } },
  { hits := [(0, 5), (0, 13), (5, 3), (5, 7), (6, 7), (6, 9), (7, 5), (7, 6), (9, 6), (9, 13), (12, 3), (12, 9)]
    forwardChoices := [{ center := 0, support := {5, 13} },
        { center := 5, support := {3, 7} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {5, 6} },
        { center := 9, support := {6, 13} },
        { center := 12, support := {3, 9} }]
    reverseChoices := [{ center := 4, support := {7, 13} },
        { center := 7, support := {3, 10} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {9, 13} },
        { center := 16, support := {3, 11} }]
    forwardData := {
      firstQuad := ⟨3, 9, 12, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 3, 5, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(9, 12), [.flip 9 12, .row 12 9 3, .flip 12 3], (3, 12)⟩
      path1 := ⟨(3, 13), [], (3, 13)⟩
      path2 := ⟨(3, 5), [.flip 3 5, .row 5 3 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 9, .flip 6 9, .row 9 6 13], (9, 13)⟩
      path3 := ⟨(0, 13), [.row 0 13 5], (0, 5)⟩ }
    reverseData := {
      firstQuad := ⟨4, 11, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 7, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(11, 13), [.row 11 13 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 7, .flip 10 7, .row 7 10 3, .flip 7 3], (3, 7)⟩
      path1 := ⟨(4, 16), [], (4, 16)⟩
      path2 := ⟨(4, 7), [.row 4 7 13], (4, 13)⟩
      path3 := ⟨(3, 16), [.flip 3 16, .row 16 3 11, .flip 16 11], (11, 16)⟩ } },
  { hits := [(2, 1), (2, 12), (5, 7), (5, 10), (6, 1), (6, 7), (7, 3), (7, 5), (10, 5), (10, 12), (12, 3), (12, 10)]
    forwardChoices := [{ center := 2, support := {1, 12} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {1, 7} },
        { center := 7, support := {3, 5} },
        { center := 10, support := {5, 12} },
        { center := 12, support := {3, 10} }]
    reverseChoices := [{ center := 4, support := {6, 13} },
        { center := 6, support := {4, 11} },
        { center := 9, support := {11, 13} },
        { center := 10, support := {9, 15} },
        { center := 11, support := {6, 9} },
        { center := 14, support := {4, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 6, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 6, 7, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 12], (2, 12)⟩
      path1 := ⟨(6, 12), [], (6, 12)⟩
      path2 := ⟨(6, 7), [.row 6 7 1, .flip 6 1], (1, 6)⟩
      path3 := ⟨(3, 12), [.flip 3 12, .row 12 3 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 3, .flip 7 3], (3, 7)⟩ }
    reverseData := {
      firstQuad := ⟨9, 10, 13, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 13, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(9, 10), [.flip 9 10, .row 10 9 15], (10, 15)⟩
      path1 := ⟨(13, 15), [], (13, 15)⟩
      path2 := ⟨(4, 13), [.row 4 13 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 13], (9, 13)⟩
      path3 := ⟨(14, 15), [.row 14 15 4, .flip 14 4], (4, 14)⟩ } },
  { hits := [(2, 6), (2, 12), (5, 7), (5, 10), (6, 1), (6, 7), (7, 5), (7, 6), (10, 5), (10, 12), (15, 1), (15, 10)]
    forwardChoices := [{ center := 2, support := {6, 12} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {1, 7} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 12} },
        { center := 15, support := {1, 10} }]
    reverseChoices := [{ center := 1, support := {6, 15} },
        { center := 6, support := {4, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {9, 15} },
        { center := 11, support := {6, 9} },
        { center := 14, support := {4, 10} }]
    forwardData := {
      firstQuad := ⟨2, 10, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 6, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(10, 12), [.row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 1, .flip 6 1], (1, 6)⟩
      path1 := ⟨(2, 15), [], (2, 15)⟩
      path2 := ⟨(2, 6), [.row 2 6 12], (2, 12)⟩
      path3 := ⟨(1, 15), [.flip 1 15, .row 15 1 10, .flip 15 10], (10, 15)⟩ }
    reverseData := {
      firstQuad := ⟨4, 10, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 6, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(10, 14), [.flip 10 14, .row 14 10 4, .flip 14 4], (4, 14)⟩
      path1 := ⟨(4, 15), [], (4, 15)⟩
      path2 := ⟨(4, 6), [.flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 15], (10, 15)⟩
      path3 := ⟨(1, 15), [.row 1 15 6], (1, 6)⟩ } },
  { hits := [(2, 6), (2, 12), (5, 7), (5, 10), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 12), (13, 10), (13, 14)]
    forwardChoices := [{ center := 2, support := {6, 12} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 12} },
        { center := 13, support := {10, 14} }]
    reverseChoices := [{ center := 3, support := {2, 6} },
        { center := 6, support := {4, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} },
        { center := 14, support := {4, 10} }]
    forwardData := {
      firstQuad := ⟨2, 10, 12, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 6, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(10, 12), [.row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14], (6, 14)⟩
      path1 := ⟨(2, 13), [], (2, 13)⟩
      path2 := ⟨(2, 6), [.row 2 6 12], (2, 12)⟩
      path3 := ⟨(13, 14), [.row 13 14 10, .flip 13 10], (10, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 6, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 10, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(4, 6), [.flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩
      path1 := ⟨(3, 14), [], (3, 14)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 6], (3, 6)⟩
      path3 := ⟨(10, 14), [.flip 10 14, .row 14 10 4, .flip 14 4], (4, 14)⟩ } },
  { hits := [(2, 11), (2, 12), (5, 7), (5, 10), (7, 5), (7, 11), (9, 7), (9, 15), (10, 5), (10, 12), (12, 10), (12, 15)]
    forwardChoices := [{ center := 2, support := {11, 12} },
        { center := 5, support := {7, 10} },
        { center := 7, support := {5, 11} },
        { center := 9, support := {7, 15} },
        { center := 10, support := {5, 12} },
        { center := 12, support := {10, 15} }]
    reverseChoices := [{ center := 4, support := {1, 6} },
        { center := 6, support := {4, 11} },
        { center := 7, support := {1, 9} },
        { center := 9, support := {5, 11} },
        { center := 11, support := {6, 9} },
        { center := 14, support := {4, 5} }]
    forwardData := {
      firstQuad := ⟨2, 9, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 7, 9, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(2, 9), [], (2, 9)⟩
      path1 := ⟨(12, 15), [.row 12 15 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 11], (7, 11)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 15], (9, 15)⟩
      path3 := ⟨(2, 11), [.row 2 11 12], (2, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 5, 7, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 5, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(1, 5), [], (1, 5)⟩
      path1 := ⟨(7, 9), [.row 7 9 1, .flip 7 1], (1, 7)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 5, .flip 9 5], (5, 9)⟩
      path3 := ⟨(5, 14), [.flip 5 14, .row 14 5 4, .flip 14 4], (4, 14)⟩ } },
  { hits := [(2, 11), (2, 12), (5, 8), (5, 10), (7, 5), (7, 11), (10, 5), (10, 12), (11, 8), (11, 15), (12, 10), (12, 15)]
    forwardChoices := [{ center := 2, support := {11, 12} },
        { center := 5, support := {8, 10} },
        { center := 7, support := {5, 11} },
        { center := 10, support := {5, 12} },
        { center := 11, support := {8, 15} },
        { center := 12, support := {10, 15} }]
    reverseChoices := [{ center := 4, support := {1, 6} },
        { center := 5, support := {1, 8} },
        { center := 6, support := {4, 11} },
        { center := 9, support := {5, 11} },
        { center := 11, support := {6, 8} },
        { center := 14, support := {4, 5} }]
    forwardData := {
      firstQuad := ⟨2, 11, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 7, 8, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(2, 11), [.row 2 11 12], (2, 12)⟩
      path1 := ⟨(12, 15), [.row 12 15 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 8], (5, 8)⟩
      path2 := ⟨(5, 7), [.flip 5 7, .row 7 5 11], (7, 11)⟩
      path3 := ⟨(8, 11), [.flip 8 11, .row 11 8 15], (11, 15)⟩ }
    reverseData := {
      firstQuad := ⟨5, 8, 9, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 5, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(5, 8), [.row 5 8 1, .flip 5 1], (1, 5)⟩
      path1 := ⟨(9, 11), [.row 9 11 5, .flip 9 5], (5, 9)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 8, .flip 11 8], (8, 11)⟩
      path3 := ⟨(5, 14), [.flip 5 14, .row 14 5 4, .flip 14 4], (4, 14)⟩ } },
  { hits := [(5, 7), (5, 8), (6, 7), (6, 9), (7, 5), (7, 6), (8, 9), (8, 12), (10, 5), (10, 12), (14, 6), (14, 8)]
    forwardChoices := [{ center := 5, support := {7, 8} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {5, 6} },
        { center := 8, support := {9, 12} },
        { center := 10, support := {5, 12} },
        { center := 14, support := {6, 8} }]
    reverseChoices := [{ center := 2, support := {8, 10} },
        { center := 6, support := {4, 11} },
        { center := 8, support := {4, 7} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {8, 9} }]
    forwardData := {
      firstQuad := ⟨6, 8, 9, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 8, 10, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(8, 9), [.row 8 9 12], (8, 12)⟩
      path1 := ⟨(6, 14), [.flip 6 14, .row 14 6 8, .flip 14 8], (8, 14)⟩
      path2 := ⟨(5, 8), [.row 5 8 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 9], (6, 9)⟩
      path3 := ⟨(10, 12), [.row 10 12 5, .flip 10 5], (5, 10)⟩ }
    reverseData := {
      firstQuad := ⟨2, 7, 8, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 8, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(7, 8), [.flip 7 8, .row 8 7 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(2, 10), [.row 2 10 8], (2, 8)⟩
      path2 := ⟨(4, 6), [.flip 4 6, .row 6 4 11], (6, 11)⟩
      path3 := ⟨(8, 11), [.flip 8 11, .row 11 8 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 7, .flip 10 7], (7, 10)⟩ } },
  { hits := [(5, 7), (5, 8), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 12), (14, 6), (14, 8), (16, 12), (16, 14)]
    forwardChoices := [{ center := 5, support := {7, 8} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 12} },
        { center := 14, support := {6, 8} },
        { center := 16, support := {12, 14} }]
    reverseChoices := [{ center := 0, support := {2, 4} },
        { center := 2, support := {8, 10} },
        { center := 6, support := {4, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {8, 9} }]
    forwardData := {
      firstQuad := ⟨8, 12, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 8, 10, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(8, 12), [], (8, 12)⟩
      path1 := ⟨(14, 16), [.flip 14 16, .row 16 14 12, .flip 16 12], (12, 16)⟩
      path2 := ⟨(5, 8), [.row 5 8 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14, .flip 6 14, .row 14 6 8, .flip 14 8], (8, 14)⟩
      path3 := ⟨(10, 12), [.row 10 12 5, .flip 10 5], (5, 10)⟩ }
    reverseData := {
      firstQuad := ⟨2, 6, 8, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 2, 4, 6⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(2, 6), [], (2, 6)⟩
      path1 := ⟨(8, 11), [.flip 8 11, .row 11 8 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 8], (2, 8)⟩
      path2 := ⟨(0, 2), [.row 0 2 4], (0, 4)⟩
      path3 := ⟨(4, 6), [.flip 4 6, .row 6 4 11], (6, 11)⟩ } },
  { hits := [(5, 7), (5, 8), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 16), (13, 14), (13, 16), (14, 6), (14, 8)]
    forwardChoices := [{ center := 5, support := {7, 8} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 16} },
        { center := 13, support := {14, 16} },
        { center := 14, support := {6, 8} }]
    reverseChoices := [{ center := 2, support := {8, 10} },
        { center := 3, support := {0, 2} },
        { center := 6, support := {0, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {8, 9} }]
    forwardData := {
      firstQuad := ⟨8, 13, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 8, 10, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(13, 14), [.row 13 14 16], (13, 16)⟩
      path1 := ⟨(8, 16), [], (8, 16)⟩
      path2 := ⟨(5, 8), [.row 5 8 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14, .flip 6 14, .row 14 6 8, .flip 14 8], (8, 14)⟩
      path3 := ⟨(10, 16), [.row 10 16 5, .flip 10 5], (5, 10)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 3, 8⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 6, 8, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 3, 1⟩
      path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 0, .flip 3 0], (0, 3)⟩
      path1 := ⟨(0, 8), [], (0, 8)⟩
      path2 := ⟨(0, 6), [.flip 0 6, .row 6 0 11], (6, 11)⟩
      path3 := ⟨(8, 11), [.flip 8 11, .row 11 8 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 8], (2, 8)⟩ } },
  { hits := [(5, 7), (5, 10), (6, 7), (6, 9), (7, 3), (7, 5), (8, 9), (8, 12), (10, 5), (10, 12), (12, 3), (12, 10)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {3, 5} },
        { center := 8, support := {9, 12} },
        { center := 10, support := {5, 12} },
        { center := 12, support := {3, 10} }]
    reverseChoices := [{ center := 4, support := {6, 13} },
        { center := 6, support := {4, 11} },
        { center := 8, support := {4, 7} },
        { center := 9, support := {11, 13} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨6, 8, 9, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 6, 7, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(8, 9), [.row 8 9 12], (8, 12)⟩
      path1 := ⟨(6, 12), [], (6, 12)⟩
      path2 := ⟨(6, 7), [.row 6 7 9], (6, 9)⟩
      path3 := ⟨(3, 12), [.flip 3 12, .row 12 3 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 3, .flip 7 3], (3, 7)⟩ }
    reverseData := {
      firstQuad := ⟨7, 9, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 7, 8, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(9, 10), [.flip 9 10, .row 10 9 7, .flip 10 7], (7, 10)⟩
      path1 := ⟨(7, 13), [], (7, 13)⟩
      path2 := ⟨(7, 8), [.flip 7 8, .row 8 7 4, .flip 8 4], (4, 8)⟩
      path3 := ⟨(4, 13), [.row 4 13 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 13], (9, 13)⟩ } },
  { hits := [(5, 7), (5, 10), (6, 7), (6, 14), (7, 3), (7, 5), (10, 5), (10, 12), (12, 3), (12, 10), (16, 12), (16, 14)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {3, 5} },
        { center := 10, support := {5, 12} },
        { center := 12, support := {3, 10} },
        { center := 16, support := {12, 14} }]
    reverseChoices := [{ center := 0, support := {2, 4} },
        { center := 4, support := {6, 13} },
        { center := 6, support := {4, 11} },
        { center := 9, support := {11, 13} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨3, 6, 7, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 12, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(6, 7), [.row 6 7 14], (6, 14)⟩
      path1 := ⟨(3, 14), [], (3, 14)⟩
      path2 := ⟨(3, 12), [.flip 3 12, .row 12 3 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 3, .flip 7 3], (3, 7)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 12, .flip 16 12], (12, 16)⟩ }
    reverseData := {
      firstQuad := ⟨2, 9, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 4, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(9, 10), [.flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩
      path1 := ⟨(2, 13), [], (2, 13)⟩
      path2 := ⟨(0, 2), [.row 0 2 4], (0, 4)⟩
      path3 := ⟨(4, 13), [.row 4 13 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 13], (9, 13)⟩ } },
  { hits := [(5, 7), (5, 10), (7, 5), (7, 11), (8, 4), (8, 7), (10, 5), (10, 8), (11, 4), (11, 8), (13, 10), (13, 11)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 7, support := {5, 11} },
        { center := 8, support := {4, 7} },
        { center := 10, support := {5, 8} },
        { center := 11, support := {4, 8} },
        { center := 13, support := {10, 11} }]
    reverseChoices := [{ center := 3, support := {5, 6} },
        { center := 5, support := {8, 12} },
        { center := 6, support := {8, 11} },
        { center := 8, support := {9, 12} },
        { center := 9, support := {5, 11} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨8, 10, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 7, 8, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(8, 10), [.flip 8 10, .row 10 8 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 11], (7, 11)⟩
      path1 := ⟨(11, 13), [.flip 11 13, .row 13 11 10, .flip 13 10], (10, 13)⟩
      path2 := ⟨(7, 8), [.flip 7 8, .row 8 7 4, .flip 8 4], (4, 8)⟩
      path3 := ⟨(4, 11), [.flip 4 11, .row 11 4 8, .flip 11 8], (8, 11)⟩ }
    reverseData := {
      firstQuad := ⟨5, 8, 9, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 6, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(8, 9), [.row 8 9 12], (8, 12)⟩
      path1 := ⟨(5, 12), [.row 5 12 8], (5, 8)⟩
      path2 := ⟨(3, 5), [.row 3 5 6], (3, 6)⟩
      path3 := ⟨(6, 8), [.row 6 8 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 5, .flip 9 5], (5, 9)⟩ } },
  { hits := [(5, 7), (5, 10), (7, 5), (7, 11), (9, 7), (9, 13), (10, 5), (10, 16), (13, 11), (13, 16), (15, 10), (15, 13)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 7, support := {5, 11} },
        { center := 9, support := {7, 13} },
        { center := 10, support := {5, 16} },
        { center := 13, support := {11, 16} },
        { center := 15, support := {10, 13} }]
    reverseChoices := [{ center := 1, support := {3, 6} },
        { center := 3, support := {0, 5} },
        { center := 6, support := {0, 11} },
        { center := 7, support := {3, 9} },
        { center := 9, support := {5, 11} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨7, 9, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨10, 13, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(7, 9), [.flip 7 9, .row 9 7 13], (9, 13)⟩
      path1 := ⟨(11, 13), [.flip 11 13, .row 13 11 16], (13, 16)⟩
      path2 := ⟨(13, 15), [.flip 13 15, .row 15 13 10, .flip 15 10], (10, 15)⟩
      path3 := ⟨(10, 16), [.row 10 16 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 11], (7, 11)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 3, 6⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 7, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 3), [.row 1 3 6], (1, 6)⟩
      path1 := ⟨(0, 6), [.flip 0 6, .row 6 0 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 5, .flip 9 5], (5, 9)⟩
      path2 := ⟨(3, 5), [.row 3 5 0, .flip 3 0], (0, 3)⟩
      path3 := ⟨(7, 9), [.row 7 9 3, .flip 7 3], (3, 7)⟩ } },
  { hits := [(5, 7), (5, 10), (7, 5), (7, 11), (9, 7), (9, 15), (10, 5), (10, 8), (11, 8), (11, 15), (13, 10), (13, 11)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 7, support := {5, 11} },
        { center := 9, support := {7, 15} },
        { center := 10, support := {5, 8} },
        { center := 11, support := {8, 15} },
        { center := 13, support := {10, 11} }]
    reverseChoices := [{ center := 3, support := {5, 6} },
        { center := 5, support := {1, 8} },
        { center := 6, support := {8, 11} },
        { center := 7, support := {1, 9} },
        { center := 9, support := {5, 11} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨8, 10, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 9, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(8, 10), [.flip 8 10, .row 10 8 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 11], (7, 11)⟩
      path1 := ⟨(11, 13), [.flip 11 13, .row 13 11 10, .flip 13 10], (10, 13)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 15], (9, 15)⟩
      path3 := ⟨(11, 15), [.row 11 15 8, .flip 11 8], (8, 11)⟩ }
    reverseData := {
      firstQuad := ⟨1, 5, 7, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 5, 6, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(1, 5), [.flip 1 5, .row 5 1 8], (5, 8)⟩
      path1 := ⟨(7, 9), [.row 7 9 1, .flip 7 1], (1, 7)⟩
      path2 := ⟨(3, 5), [.row 3 5 6], (3, 6)⟩
      path3 := ⟨(6, 8), [.row 6 8 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 5, .flip 9 5], (5, 9)⟩ } },
  { hits := [(6, 9), (6, 14), (9, 6), (9, 13), (12, 9), (12, 10), (13, 10), (13, 14), (14, 0), (14, 6), (15, 0), (15, 13)]
    forwardChoices := [{ center := 6, support := {9, 14} },
        { center := 9, support := {6, 13} },
        { center := 12, support := {9, 10} },
        { center := 13, support := {10, 14} },
        { center := 14, support := {0, 6} },
        { center := 15, support := {0, 13} }]
    reverseChoices := [{ center := 1, support := {3, 16} },
        { center := 2, support := {10, 16} },
        { center := 3, support := {2, 6} },
        { center := 4, support := {6, 7} },
        { center := 7, support := {3, 10} },
        { center := 10, support := {2, 7} }]
    forwardData := {
      firstQuad := ⟨0, 13, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨9, 10, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(13, 14), [.row 13 14 10, .flip 13 10], (10, 13)⟩
      path1 := ⟨(0, 15), [.flip 0 15, .row 15 0 13, .flip 15 13], (13, 15)⟩
      path2 := ⟨(10, 12), [.flip 10 12, .row 12 10 9, .flip 12 9], (9, 12)⟩
      path3 := ⟨(9, 13), [.row 9 13 6, .flip 9 6, .row 6 9 14, .flip 6 14, .row 14 6 0, .flip 14 0], (0, 14)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 6, 7⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 3, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(4, 6), [.row 4 6 7], (4, 7)⟩
      path1 := ⟨(3, 7), [.flip 3 7, .row 7 3 10, .flip 7 10, .row 10 7 2, .flip 10 2, .row 2 10 16], (2, 16)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 6], (3, 6)⟩
      path3 := ⟨(1, 16), [.row 1 16 3], (1, 3)⟩ } },
  { hits := [(0, 4), (0, 5), (5, 7), (5, 8), (6, 7), (6, 9), (7, 5), (7, 6), (8, 4), (8, 9), (9, 6), (9, 15), (11, 8), (11, 15)]
    forwardChoices := [{ center := 0, support := {4, 5} },
        { center := 5, support := {7, 8} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {5, 6} },
        { center := 8, support := {4, 9} },
        { center := 9, support := {6, 15} },
        { center := 11, support := {8, 15} }]
    reverseChoices := [{ center := 5, support := {1, 8} },
        { center := 7, support := {1, 10} },
        { center := 8, support := {7, 12} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {8, 9} },
        { center := 16, support := {11, 12} }]
    forwardData := {
      firstQuad := ⟨8, 9, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 4, 5, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(8, 9), [.row 8 9 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(11, 15), [.row 11 15 8, .flip 11 8], (8, 11)⟩
      path2 := ⟨(0, 4), [.row 0 4 5], (0, 5)⟩
      path3 := ⟨(5, 8), [.row 5 8 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 9, .flip 6 9, .row 9 6 15], (9, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 5, 7, 8⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 11, 12, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(1, 5), [.flip 1 5, .row 5 1 8], (5, 8)⟩
      path1 := ⟨(7, 8), [.flip 7 8, .row 8 7 12], (8, 12)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 7, .flip 10 7, .row 7 10 1, .flip 7 1], (1, 7)⟩
      path3 := ⟨(12, 16), [.flip 12 16, .row 16 12 11, .flip 16 11], (11, 16)⟩ } },
  { hits := [(0, 4), (0, 5), (5, 7), (5, 8), (6, 7), (6, 14), (7, 5), (7, 6), (8, 4), (8, 12), (14, 6), (14, 8), (16, 12), (16, 14)]
    forwardChoices := [{ center := 0, support := {4, 5} },
        { center := 5, support := {7, 8} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 8, support := {4, 12} },
        { center := 14, support := {6, 8} },
        { center := 16, support := {12, 14} }]
    reverseChoices := [{ center := 0, support := {2, 4} },
        { center := 2, support := {8, 10} },
        { center := 8, support := {4, 12} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {8, 9} },
        { center := 16, support := {11, 12} }]
    forwardData := {
      firstQuad := ⟨8, 12, 14, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 4, 5, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(8, 12), [.row 8 12 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(14, 16), [.flip 14 16, .row 16 14 12, .flip 16 12], (12, 16)⟩
      path2 := ⟨(0, 4), [.row 0 4 5], (0, 5)⟩
      path3 := ⟨(5, 8), [.row 5 8 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14, .flip 6 14, .row 14 6 8, .flip 14 8], (8, 14)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 4, 8⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 11, 12, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(0, 2), [.row 0 2 4], (0, 4)⟩
      path1 := ⟨(4, 8), [.flip 4 8, .row 8 4 12], (8, 12)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 8], (2, 8)⟩
      path3 := ⟨(12, 16), [.flip 12 16, .row 16 12 11, .flip 16 11], (11, 16)⟩ } },
  { hits := [(1, 4), (1, 14), (3, 4), (3, 10), (5, 7), (5, 10), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 8), (14, 6), (14, 8)]
    forwardChoices := [{ center := 1, support := {4, 14} },
        { center := 3, support := {4, 10} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 8} },
        { center := 14, support := {6, 8} }]
    reverseChoices := [{ center := 2, support := {8, 10} },
        { center := 6, support := {8, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} },
        { center := 13, support := {6, 12} },
        { center := 15, support := {2, 12} }]
    forwardData := {
      firstQuad := ⟨3, 8, 10, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 3, 4, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(8, 10), [.flip 8 10, .row 10 8 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14, .flip 6 14, .row 14 6 8, .flip 14 8], (8, 14)⟩
      path1 := ⟨(3, 14), [], (3, 14)⟩
      path2 := ⟨(3, 4), [.row 3 4 10], (3, 10)⟩
      path3 := ⟨(1, 14), [.row 1 14 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨6, 12, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 6, 8, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(12, 13), [.flip 12 13, .row 13 12 6, .flip 13 6], (6, 13)⟩
      path1 := ⟨(6, 15), [], (6, 15)⟩
      path2 := ⟨(6, 8), [.row 6 8 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 8], (2, 8)⟩
      path3 := ⟨(2, 15), [.flip 2 15, .row 15 2 12, .flip 15 12], (12, 15)⟩ } },
  { hits := [(1, 11), (1, 14), (5, 7), (5, 10), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 8), (13, 10), (13, 11), (14, 6), (14, 8)]
    forwardChoices := [{ center := 1, support := {11, 14} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 8} },
        { center := 13, support := {10, 11} },
        { center := 14, support := {6, 8} }]
    reverseChoices := [{ center := 2, support := {8, 10} },
        { center := 3, support := {5, 6} },
        { center := 6, support := {8, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} },
        { center := 15, support := {2, 5} }]
    forwardData := {
      firstQuad := ⟨8, 10, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 8, 11, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(8, 10), [.flip 8 10, .row 10 8 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14, .flip 6 14, .row 14 6 8, .flip 14 8], (8, 14)⟩
      path1 := ⟨(11, 13), [.flip 11 13, .row 13 11 10, .flip 13 10], (10, 13)⟩
      path2 := ⟨(8, 11), [], (8, 11)⟩
      path3 := ⟨(1, 14), [.row 1 14 11], (1, 11)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 8, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 6, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(5, 8), [], (5, 8)⟩
      path1 := ⟨(2, 15), [.flip 2 15, .row 15 2 5, .flip 15 5], (5, 15)⟩
      path2 := ⟨(3, 5), [.row 3 5 6], (3, 6)⟩
      path3 := ⟨(6, 8), [.row 6 8 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 8], (2, 8)⟩ } },
  { hits := [(2, 1), (2, 12), (5, 7), (5, 10), (6, 1), (6, 7), (7, 5), (7, 6), (9, 6), (9, 15), (10, 5), (10, 12), (12, 10), (12, 15)]
    forwardChoices := [{ center := 2, support := {1, 12} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {1, 7} },
        { center := 7, support := {5, 6} },
        { center := 9, support := {6, 15} },
        { center := 10, support := {5, 12} },
        { center := 12, support := {10, 15} }]
    reverseChoices := [{ center := 4, support := {1, 6} },
        { center := 6, support := {4, 11} },
        { center := 7, support := {1, 10} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {9, 15} },
        { center := 11, support := {6, 9} },
        { center := 14, support := {4, 15} }]
    forwardData := {
      firstQuad := ⟨2, 9, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 6, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(2, 9), [], (2, 9)⟩
      path1 := ⟨(12, 15), [.row 12 15 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 1, .flip 6 1], (1, 6)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 12], (2, 12)⟩
      path3 := ⟨(6, 9), [.flip 6 9, .row 9 6 15], (9, 15)⟩ }
    reverseData := {
      firstQuad := ⟨4, 10, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 7, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(4, 10), [], (4, 10)⟩
      path1 := ⟨(14, 15), [.row 14 15 4, .flip 14 4], (4, 14)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 15], (10, 15)⟩
      path3 := ⟨(7, 10), [.row 7 10 1, .flip 7 1], (1, 7)⟩ } },
  { hits := [(2, 6), (2, 11), (5, 7), (5, 10), (6, 1), (6, 7), (7, 5), (7, 6), (10, 5), (10, 8), (11, 1), (11, 8), (13, 10), (13, 11)]
    forwardChoices := [{ center := 2, support := {6, 11} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {1, 7} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 8} },
        { center := 11, support := {1, 8} },
        { center := 13, support := {10, 11} }]
    reverseChoices := [{ center := 3, support := {5, 6} },
        { center := 5, support := {8, 15} },
        { center := 6, support := {8, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {9, 15} },
        { center := 11, support := {6, 9} },
        { center := 14, support := {5, 10} }]
    forwardData := {
      firstQuad := ⟨8, 10, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 6, 11⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(8, 10), [.flip 8 10, .row 10 8 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 1, .flip 6 1], (1, 6)⟩
      path1 := ⟨(11, 13), [.flip 11 13, .row 13 11 10, .flip 13 10], (10, 13)⟩
      path2 := ⟨(2, 6), [.row 2 6 11], (2, 11)⟩
      path3 := ⟨(1, 11), [.flip 1 11, .row 11 1 8, .flip 11 8], (8, 11)⟩ }
    reverseData := {
      firstQuad := ⟨5, 10, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 6, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(10, 14), [.flip 10 14, .row 14 10 5, .flip 14 5], (5, 14)⟩
      path1 := ⟨(5, 15), [.row 5 15 8], (5, 8)⟩
      path2 := ⟨(3, 5), [.row 3 5 6], (3, 6)⟩
      path3 := ⟨(6, 8), [.row 6 8 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 15], (10, 15)⟩ } },
  { hits := [(2, 6), (2, 12), (5, 7), (5, 10), (6, 1), (6, 7), (7, 5), (7, 6), (10, 5), (10, 12), (11, 1), (11, 15), (12, 10), (12, 15)]
    forwardChoices := [{ center := 2, support := {6, 12} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {1, 7} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 12} },
        { center := 11, support := {1, 15} },
        { center := 12, support := {10, 15} }]
    reverseChoices := [{ center := 4, support := {1, 6} },
        { center := 5, support := {1, 15} },
        { center := 6, support := {4, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {9, 15} },
        { center := 11, support := {6, 9} },
        { center := 14, support := {4, 10} }]
    forwardData := {
      firstQuad := ⟨2, 11, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 6, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(2, 11), [], (2, 11)⟩
      path1 := ⟨(12, 15), [.row 12 15 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 1, .flip 6 1], (1, 6)⟩
      path2 := ⟨(2, 6), [.row 2 6 12], (2, 12)⟩
      path3 := ⟨(1, 11), [.flip 1 11, .row 11 1 15], (11, 15)⟩ }
    reverseData := {
      firstQuad := ⟨5, 10, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 5, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(10, 14), [.flip 10 14, .row 14 10 4, .flip 14 4], (4, 14)⟩
      path1 := ⟨(5, 15), [.row 5 15 1, .flip 5 1], (1, 5)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 15], (10, 15)⟩
      path3 := ⟨(5, 14), [], (5, 14)⟩ } },
  { hits := [(2, 11), (2, 12), (5, 7), (5, 10), (7, 5), (7, 11), (8, 4), (8, 7), (10, 5), (10, 12), (11, 4), (11, 15), (12, 10), (12, 15)]
    forwardChoices := [{ center := 2, support := {11, 12} },
        { center := 5, support := {7, 10} },
        { center := 7, support := {5, 11} },
        { center := 8, support := {4, 7} },
        { center := 10, support := {5, 12} },
        { center := 11, support := {4, 15} },
        { center := 12, support := {10, 15} }]
    reverseChoices := [{ center := 4, support := {1, 6} },
        { center := 5, support := {1, 12} },
        { center := 6, support := {4, 11} },
        { center := 8, support := {9, 12} },
        { center := 9, support := {5, 11} },
        { center := 11, support := {6, 9} },
        { center := 14, support := {4, 5} }]
    forwardData := {
      firstQuad := ⟨2, 11, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 7, 8, 11⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(2, 11), [.row 2 11 12], (2, 12)⟩
      path1 := ⟨(12, 15), [.row 12 15 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 11], (7, 11)⟩
      path2 := ⟨(7, 8), [.flip 7 8, .row 8 7 4, .flip 8 4], (4, 8)⟩
      path3 := ⟨(4, 11), [.flip 4 11, .row 11 4 15], (11, 15)⟩ }
    reverseData := {
      firstQuad := ⟨5, 8, 9, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 5, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(8, 9), [.row 8 9 12], (8, 12)⟩
      path1 := ⟨(5, 12), [.row 5 12 1, .flip 5 1], (1, 5)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 5, .flip 9 5], (5, 9)⟩
      path3 := ⟨(5, 14), [.flip 5 14, .row 14 5 4, .flip 14 4], (4, 14)⟩ } },
  { hits := [(3, 4), (3, 10), (4, 6), (4, 16), (5, 7), (5, 10), (6, 1), (6, 7), (7, 5), (7, 6), (10, 5), (10, 16), (11, 1), (11, 4)]
    forwardChoices := [{ center := 3, support := {4, 10} },
        { center := 4, support := {6, 16} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {1, 7} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 16} },
        { center := 11, support := {1, 4} }]
    reverseChoices := [{ center := 5, support := {12, 15} },
        { center := 6, support := {0, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {9, 15} },
        { center := 11, support := {6, 9} },
        { center := 12, support := {0, 10} },
        { center := 13, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨3, 4, 10, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 6, 11⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(3, 4), [.row 3 4 10], (3, 10)⟩
      path1 := ⟨(10, 16), [.row 10 16 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 1, .flip 6 1], (1, 6)⟩
      path2 := ⟨(4, 6), [.row 4 6 16], (4, 16)⟩
      path3 := ⟨(1, 11), [.flip 1 11, .row 11 1 4, .flip 11 4], (4, 11)⟩ }
    reverseData := {
      firstQuad := ⟨5, 10, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 6, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(10, 12), [.flip 10 12, .row 12 10 0, .flip 12 0], (0, 12)⟩
      path1 := ⟨(5, 15), [.row 5 15 12], (5, 12)⟩
      path2 := ⟨(0, 6), [.flip 0 6, .row 6 0 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 15], (10, 15)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 6, .flip 13 6], (6, 13)⟩ } },
  { hits := [(3, 4), (3, 10), (4, 6), (4, 16), (5, 7), (5, 10), (6, 7), (6, 9), (7, 5), (7, 6), (8, 4), (8, 9), (10, 5), (10, 16)]
    forwardChoices := [{ center := 3, support := {4, 10} },
        { center := 4, support := {6, 16} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {5, 6} },
        { center := 8, support := {4, 9} },
        { center := 10, support := {5, 16} }]
    reverseChoices := [{ center := 6, support := {0, 11} },
        { center := 8, support := {7, 12} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {6, 9} },
        { center := 12, support := {0, 10} },
        { center := 13, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨3, 4, 10, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 6, 8, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(3, 4), [.row 3 4 10], (3, 10)⟩
      path1 := ⟨(10, 16), [.row 10 16 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 9], (6, 9)⟩
      path2 := ⟨(4, 6), [.row 4 6 16], (4, 16)⟩
      path3 := ⟨(8, 9), [.row 8 9 4, .flip 8 4], (4, 8)⟩ }
    reverseData := {
      firstQuad := ⟨7, 8, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 6, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(7, 8), [.flip 7 8, .row 8 7 12], (8, 12)⟩
      path1 := ⟨(10, 12), [.flip 10 12, .row 12 10 0, .flip 12 0], (0, 12)⟩
      path2 := ⟨(0, 6), [.flip 0 6, .row 6 0 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 7, .flip 10 7], (7, 10)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 6, .flip 13 6], (6, 13)⟩ } },
  { hits := [(3, 4), (3, 15), (5, 7), (5, 10), (7, 3), (7, 5), (8, 4), (8, 7), (10, 5), (10, 12), (12, 10), (12, 15), (16, 3), (16, 12)]
    forwardChoices := [{ center := 3, support := {4, 15} },
        { center := 5, support := {7, 10} },
        { center := 7, support := {3, 5} },
        { center := 8, support := {4, 7} },
        { center := 10, support := {5, 12} },
        { center := 12, support := {10, 15} },
        { center := 16, support := {3, 12} }]
    reverseChoices := [{ center := 0, support := {4, 13} },
        { center := 4, support := {1, 6} },
        { center := 6, support := {4, 11} },
        { center := 8, support := {9, 12} },
        { center := 9, support := {11, 13} },
        { center := 11, support := {6, 9} },
        { center := 13, support := {1, 12} }]
    forwardData := {
      firstQuad := ⟨3, 12, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 7, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(12, 15), [.row 12 15 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 3, .flip 7 3], (3, 7)⟩
      path1 := ⟨(3, 16), [.flip 3 16, .row 16 3 12, .flip 16 12], (12, 16)⟩
      path2 := ⟨(3, 4), [.row 3 4 15], (3, 15)⟩
      path3 := ⟨(7, 8), [.flip 7 8, .row 8 7 4, .flip 8 4], (4, 8)⟩ }
    reverseData := {
      firstQuad := ⟨8, 9, 12, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 4, 13⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(8, 9), [.row 8 9 12], (8, 12)⟩
      path1 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1], (1, 13)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 13], (9, 13)⟩
      path3 := ⟨(0, 13), [.row 0 13 4], (0, 4)⟩ } },
  { hits := [(4, 6), (4, 13), (5, 7), (5, 10), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 16), (13, 14), (13, 16), (15, 10), (15, 13)]
    forwardChoices := [{ center := 4, support := {6, 13} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 16} },
        { center := 13, support := {14, 16} },
        { center := 15, support := {10, 13} }]
    reverseChoices := [{ center := 1, support := {3, 6} },
        { center := 3, support := {0, 2} },
        { center := 6, support := {0, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} },
        { center := 12, support := {3, 10} }]
    forwardData := {
      firstQuad := ⟨4, 6, 13, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨10, 13, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 6), [.row 4 6 13], (4, 13)⟩
      path1 := ⟨(13, 14), [.row 13 14 16], (13, 16)⟩
      path2 := ⟨(13, 15), [.flip 13 15, .row 15 13 10, .flip 15 10], (10, 15)⟩
      path3 := ⟨(10, 16), [.row 10 16 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14], (6, 14)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 3, 6⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 10, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(1, 3), [.row 1 3 6], (1, 6)⟩
      path1 := ⟨(0, 6), [.flip 0 6, .row 6 0 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 0, .flip 3 0], (0, 3)⟩
      path3 := ⟨(10, 12), [.flip 10 12, .row 12 10 3, .flip 12 3], (3, 12)⟩ } },
  { hits := [(4, 13), (4, 16), (5, 7), (5, 10), (6, 7), (6, 9), (7, 5), (7, 6), (9, 6), (9, 13), (10, 5), (10, 16), (12, 9), (12, 10)]
    forwardChoices := [{ center := 4, support := {13, 16} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {5, 6} },
        { center := 9, support := {6, 13} },
        { center := 10, support := {5, 16} },
        { center := 12, support := {9, 10} }]
    reverseChoices := [{ center := 4, support := {6, 7} },
        { center := 6, support := {0, 11} },
        { center := 7, support := {3, 10} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {6, 9} },
        { center := 12, support := {0, 3} }]
    forwardData := {
      firstQuad := ⟨9, 10, 12, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 9, 13, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(10, 12), [.flip 10 12, .row 12 10 9, .flip 12 9], (9, 12)⟩
      path1 := ⟨(9, 16), [], (9, 16)⟩
      path2 := ⟨(9, 13), [.row 9 13 6, .flip 9 6, .row 6 9 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10, .row 10 5 16], (10, 16)⟩
      path3 := ⟨(4, 16), [.row 4 16 13], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 4, 6, 7⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 3, 6, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(4, 6), [.row 4 6 7], (4, 7)⟩
      path1 := ⟨(3, 7), [.flip 3 7, .row 7 3 10, .flip 7 10, .row 10 7 9, .flip 10 9, .row 9 10 11, .flip 9 11, .row 11 9 6, .flip 11 6, .row 6 11 0, .flip 6 0], (0, 6)⟩
      path2 := ⟨(3, 6), [], (3, 6)⟩
      path3 := ⟨(0, 12), [.flip 0 12, .row 12 0 3, .flip 12 3], (3, 12)⟩ } },
  { hits := [(5, 7), (5, 8), (6, 7), (6, 9), (7, 5), (7, 6), (8, 9), (8, 12), (9, 6), (9, 15), (10, 5), (10, 12), (11, 8), (11, 15)]
    forwardChoices := [{ center := 5, support := {7, 8} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {5, 6} },
        { center := 8, support := {9, 12} },
        { center := 9, support := {6, 15} },
        { center := 10, support := {5, 12} },
        { center := 11, support := {8, 15} }]
    reverseChoices := [{ center := 5, support := {1, 8} },
        { center := 6, support := {4, 11} },
        { center := 7, support := {1, 10} },
        { center := 8, support := {4, 7} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {8, 9} }]
    forwardData := {
      firstQuad := ⟨8, 9, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 8, 10, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(8, 9), [.row 8 9 12], (8, 12)⟩
      path1 := ⟨(11, 15), [.row 11 15 8, .flip 11 8], (8, 11)⟩
      path2 := ⟨(5, 8), [.row 5 8 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 9, .flip 6 9, .row 9 6 15], (9, 15)⟩
      path3 := ⟨(10, 12), [.row 10 12 5, .flip 10 5], (5, 10)⟩ }
    reverseData := {
      firstQuad := ⟨1, 5, 7, 8⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 6, 8, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 5), [.flip 1 5, .row 5 1 8], (5, 8)⟩
      path1 := ⟨(7, 8), [.flip 7 8, .row 8 7 4, .flip 8 4], (4, 8)⟩
      path2 := ⟨(4, 6), [.flip 4 6, .row 6 4 11], (6, 11)⟩
      path3 := ⟨(8, 11), [.flip 8 11, .row 11 8 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 7, .flip 10 7, .row 7 10 1, .flip 7 1], (1, 7)⟩ } },
  { hits := [(5, 7), (5, 10), (6, 7), (6, 9), (7, 5), (7, 6), (8, 7), (8, 12), (9, 6), (9, 7), (10, 5), (10, 12), (12, 9), (12, 10)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {5, 6} },
        { center := 8, support := {7, 12} },
        { center := 9, support := {6, 7} },
        { center := 10, support := {5, 12} },
        { center := 12, support := {9, 10} }]
    reverseChoices := [{ center := 4, support := {6, 7} },
        { center := 6, support := {4, 11} },
        { center := 7, support := {9, 10} },
        { center := 8, support := {4, 9} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨8, 9, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 8, 9, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(9, 12), [.flip 9 12, .row 12 9 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 9, .flip 6 9, .row 9 6 7, .flip 9 7], (7, 9)⟩
      path1 := ⟨(8, 15), [], (8, 15)⟩
      path2 := ⟨(7, 8), [.flip 7 8, .row 8 7 12], (8, 12)⟩
      path3 := ⟨(9, 15), [], (9, 15)⟩ }
    reverseData := {
      firstQuad := ⟨7, 8, 9, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 7, 8, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(8, 9), [.row 8 9 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(7, 16), [], (7, 16)⟩
      path2 := ⟨(4, 7), [.row 4 7 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 7, .flip 10 7, .row 7 10 9], (7, 9)⟩
      path3 := ⟨(8, 16), [], (8, 16)⟩ } },
  { hits := [(5, 7), (5, 10), (6, 7), (6, 9), (7, 5), (7, 6), (8, 9), (8, 12), (9, 6), (9, 15), (10, 5), (10, 12), (12, 10), (12, 15)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {5, 6} },
        { center := 8, support := {9, 12} },
        { center := 9, support := {6, 15} },
        { center := 10, support := {5, 12} },
        { center := 12, support := {10, 15} }]
    reverseChoices := [{ center := 4, support := {1, 6} },
        { center := 6, support := {4, 11} },
        { center := 7, support := {1, 10} },
        { center := 8, support := {4, 7} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨9, 12, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 9, 12, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(12, 15), [.row 12 15 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 9, .flip 6 9, .row 9 6 15], (9, 15)⟩
      path1 := ⟨(9, 16), [], (9, 16)⟩
      path2 := ⟨(8, 9), [.row 8 9 12], (8, 12)⟩
      path3 := ⟨(12, 16), [], (12, 16)⟩ }
    reverseData := {
      firstQuad := ⟨4, 7, 8, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 7, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(7, 8), [.flip 7 8, .row 8 7 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(4, 9), [], (4, 9)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 7, .flip 10 7, .row 7 10 1, .flip 7 1], (1, 7)⟩
      path3 := ⟨(7, 9), [], (7, 9)⟩ } },
  { hits := [(5, 7), (5, 10), (6, 7), (6, 14), (7, 5), (7, 6), (9, 6), (9, 15), (10, 5), (10, 12), (12, 10), (12, 15), (16, 12), (16, 14)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 9, support := {6, 15} },
        { center := 10, support := {5, 12} },
        { center := 12, support := {10, 15} },
        { center := 16, support := {12, 14} }]
    reverseChoices := [{ center := 0, support := {2, 4} },
        { center := 4, support := {1, 6} },
        { center := 6, support := {4, 11} },
        { center := 7, support := {1, 10} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨9, 12, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 9, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(12, 15), [.row 12 15 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14], (6, 14)⟩
      path1 := ⟨(9, 16), [], (9, 16)⟩
      path2 := ⟨(6, 9), [.flip 6 9, .row 9 6 15], (9, 15)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 12, .flip 16 12], (12, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 4, 7⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 7, 10⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(1, 4), [.flip 1 4, .row 4 1 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2], (2, 10)⟩
      path1 := ⟨(0, 7), [], (0, 7)⟩
      path2 := ⟨(0, 2), [.row 0 2 4], (0, 4)⟩
      path3 := ⟨(7, 10), [.row 7 10 1, .flip 7 1], (1, 7)⟩ } },
  { hits := [(5, 7), (5, 10), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 12), (13, 10), (13, 14), (14, 0), (14, 6), (16, 0), (16, 12)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 12} },
        { center := 13, support := {10, 14} },
        { center := 14, support := {0, 6} },
        { center := 16, support := {0, 12} }]
    reverseChoices := [{ center := 0, support := {4, 16} },
        { center := 2, support := {10, 16} },
        { center := 3, support := {2, 6} },
        { center := 6, support := {4, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨0, 12, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨10, 12, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(12, 14), [], (12, 14)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 12, .flip 16 12], (12, 16)⟩
      path2 := ⟨(10, 12), [.row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14, .flip 6 14, .row 14 6 0, .flip 14 0], (0, 14)⟩
      path3 := ⟨(13, 14), [.row 13 14 10, .flip 13 10], (10, 13)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 4, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 4, 6⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(2, 4), [], (2, 4)⟩
      path1 := ⟨(0, 16), [.row 0 16 4], (0, 4)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 6], (3, 6)⟩
      path3 := ⟨(4, 6), [.flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 16], (2, 16)⟩ } },
  { hits := [(5, 7), (5, 10), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 12), (14, 0), (14, 6), (15, 0), (15, 10), (16, 12), (16, 14)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 12} },
        { center := 14, support := {0, 6} },
        { center := 15, support := {0, 10} },
        { center := 16, support := {12, 14} }]
    reverseChoices := [{ center := 0, support := {2, 4} },
        { center := 1, support := {6, 16} },
        { center := 2, support := {10, 16} },
        { center := 6, support := {4, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨0, 10, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨10, 12, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(10, 14), [], (10, 14)⟩
      path1 := ⟨(0, 15), [.flip 0 15, .row 15 0 10, .flip 15 10], (10, 15)⟩
      path2 := ⟨(10, 12), [.row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14, .flip 6 14, .row 14 6 0, .flip 14 0], (0, 14)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 12, .flip 16 12], (12, 16)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 6, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 4, 6⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(2, 6), [], (2, 6)⟩
      path1 := ⟨(1, 16), [.row 1 16 6], (1, 6)⟩
      path2 := ⟨(0, 2), [.row 0 2 4], (0, 4)⟩
      path3 := ⟨(4, 6), [.flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 16], (2, 16)⟩ } },
  { hits := [(5, 7), (5, 10), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 16), (13, 14), (13, 16), (14, 0), (14, 6), (15, 0), (15, 10)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 16} },
        { center := 13, support := {14, 16} },
        { center := 14, support := {0, 6} },
        { center := 15, support := {0, 10} }]
    reverseChoices := [{ center := 1, support := {6, 16} },
        { center := 2, support := {10, 16} },
        { center := 3, support := {0, 2} },
        { center := 6, support := {0, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨0, 13, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨10, 13, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(13, 14), [.row 13 14 16], (13, 16)⟩
      path1 := ⟨(0, 15), [.flip 0 15, .row 15 0 10, .flip 15 10], (10, 15)⟩
      path2 := ⟨(13, 15), [], (13, 15)⟩
      path3 := ⟨(10, 16), [.row 10 16 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14, .flip 6 14, .row 14 6 0, .flip 14 0], (0, 14)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 6, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 3, 6⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(2, 6), [], (2, 6)⟩
      path1 := ⟨(1, 16), [.row 1 16 6], (1, 6)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 0, .flip 3 0], (0, 3)⟩
      path3 := ⟨(0, 6), [.flip 0 6, .row 6 0 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 16], (2, 16)⟩ } },
  { hits := [(0, 2), (0, 13), (5, 7), (5, 10), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 16), (13, 14), (13, 16), (14, 2), (14, 6), (15, 10), (15, 13)]
    forwardChoices := [{ center := 0, support := {2, 13} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 16} },
        { center := 13, support := {14, 16} },
        { center := 14, support := {2, 6} },
        { center := 15, support := {10, 13} }]
    reverseChoices := [{ center := 1, support := {3, 6} },
        { center := 2, support := {10, 14} },
        { center := 3, support := {0, 2} },
        { center := 6, support := {0, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} },
        { center := 16, support := {3, 14} }]
    forwardData := {
      firstQuad := ⟨0, 2, 13, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨10, 13, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 2), [.row 0 2 13], (0, 13)⟩
      path1 := ⟨(13, 14), [.row 13 14 16], (13, 16)⟩
      path2 := ⟨(13, 15), [.flip 13 15, .row 15 13 10, .flip 15 10], (10, 15)⟩
      path3 := ⟨(10, 16), [.row 10 16 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14, .flip 6 14, .row 14 6 2, .flip 14 2], (2, 14)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 3, 6⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(1, 3), [.row 1 3 6], (1, 6)⟩
      path1 := ⟨(0, 6), [.flip 0 6, .row 6 0 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 14], (2, 14)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 0, .flip 3 0], (0, 3)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 3, .flip 16 3], (3, 16)⟩ } },
  { hits := [(1, 4), (1, 14), (3, 4), (3, 10), (4, 2), (4, 16), (5, 7), (5, 10), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 16), (14, 2), (14, 6)]
    forwardChoices := [{ center := 1, support := {4, 14} },
        { center := 3, support := {4, 10} },
        { center := 4, support := {2, 16} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 16} },
        { center := 14, support := {2, 6} }]
    reverseChoices := [{ center := 2, support := {10, 14} },
        { center := 6, support := {0, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} },
        { center := 12, support := {0, 14} },
        { center := 13, support := {6, 12} },
        { center := 15, support := {2, 12} }]
    forwardData := {
      firstQuad := ⟨3, 4, 10, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 4, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(3, 4), [.row 3 4 10], (3, 10)⟩
      path1 := ⟨(10, 16), [.row 10 16 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14, .flip 6 14, .row 14 6 2, .flip 14 2], (2, 14)⟩
      path2 := ⟨(2, 4), [.flip 2 4, .row 4 2 16], (4, 16)⟩
      path3 := ⟨(1, 14), [.row 1 14 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨2, 12, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 6, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(12, 14), [.row 12 14 0, .flip 12 0], (0, 12)⟩
      path1 := ⟨(2, 15), [.flip 2 15, .row 15 2 12, .flip 15 12], (12, 15)⟩
      path2 := ⟨(0, 6), [.flip 0 6, .row 6 0 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 14], (2, 14)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 6, .flip 13 6], (6, 13)⟩ } },
  { hits := [(2, 1), (2, 12), (3, 2), (3, 15), (5, 7), (5, 10), (6, 1), (6, 7), (7, 5), (7, 6), (10, 5), (10, 12), (12, 10), (12, 15), (14, 2), (14, 6)]
    forwardChoices := [{ center := 2, support := {1, 12} },
        { center := 3, support := {2, 15} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {1, 7} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 12} },
        { center := 12, support := {10, 15} },
        { center := 14, support := {2, 6} }]
    reverseChoices := [{ center := 2, support := {10, 14} },
        { center := 4, support := {1, 6} },
        { center := 6, support := {4, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {9, 15} },
        { center := 11, support := {6, 9} },
        { center := 13, support := {1, 14} },
        { center := 14, support := {4, 15} }]
    forwardData := {
      firstQuad := ⟨2, 3, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 6, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 15], (3, 15)⟩
      path1 := ⟨(12, 15), [.row 12 15 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 1, .flip 6 1], (1, 6)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 12], (2, 12)⟩
      path3 := ⟨(6, 14), [.flip 6 14, .row 14 6 2, .flip 14 2], (2, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 10, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(2, 10), [.row 2 10 14], (2, 14)⟩
      path1 := ⟨(14, 15), [.row 14 15 4, .flip 14 4], (4, 14)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 15], (10, 15)⟩
      path3 := ⟨(13, 14), [.row 13 14 1, .flip 13 1], (1, 13)⟩ } },
  { hits := [(2, 1), (2, 12), (5, 7), (5, 10), (6, 7), (6, 9), (7, 5), (7, 6), (9, 6), (9, 15), (10, 5), (10, 12), (11, 1), (11, 15), (12, 9), (12, 10)]
    forwardChoices := [{ center := 2, support := {1, 12} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {5, 6} },
        { center := 9, support := {6, 15} },
        { center := 10, support := {5, 12} },
        { center := 11, support := {1, 15} },
        { center := 12, support := {9, 10} }]
    reverseChoices := [{ center := 4, support := {6, 7} },
        { center := 5, support := {1, 15} },
        { center := 6, support := {4, 11} },
        { center := 7, support := {1, 10} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {6, 9} },
        { center := 14, support := {4, 15} }]
    forwardData := {
      firstQuad := ⟨2, 9, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(9, 12), [.flip 9 12, .row 12 9 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 9, .flip 6 9, .row 9 6 15], (9, 15)⟩
      path1 := ⟨(2, 15), [], (2, 15)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 12], (2, 12)⟩
      path3 := ⟨(11, 15), [.row 11 15 1, .flip 11 1], (1, 11)⟩ }
    reverseData := {
      firstQuad := ⟨1, 5, 7, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 7, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 5), [.flip 1 5, .row 5 1 15], (5, 15)⟩
      path1 := ⟨(7, 15), [], (7, 15)⟩
      path2 := ⟨(4, 7), [.row 4 7 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 7, .flip 10 7, .row 7 10 1, .flip 7 1], (1, 7)⟩
      path3 := ⟨(14, 15), [.row 14 15 4, .flip 14 4], (4, 14)⟩ } },
  { hits := [(3, 2), (3, 15), (5, 7), (5, 10), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 12), (12, 10), (12, 15), (14, 2), (14, 6), (16, 12), (16, 14)]
    forwardChoices := [{ center := 3, support := {2, 15} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 12} },
        { center := 12, support := {10, 15} },
        { center := 14, support := {2, 6} },
        { center := 16, support := {12, 14} }]
    reverseChoices := [{ center := 0, support := {2, 4} },
        { center := 2, support := {10, 14} },
        { center := 4, support := {1, 6} },
        { center := 6, support := {4, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} },
        { center := 13, support := {1, 14} }]
    forwardData := {
      firstQuad := ⟨3, 12, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(12, 15), [.row 12 15 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14, .flip 6 14, .row 14 6 2, .flip 14 2], (2, 14)⟩
      path1 := ⟨(3, 16), [], (3, 16)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15], (3, 15)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 12, .flip 16 12], (12, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 4, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(0, 2), [.row 0 2 4], (0, 4)⟩
      path1 := ⟨(4, 14), [], (4, 14)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 14], (2, 14)⟩
      path3 := ⟨(13, 14), [.row 13 14 1, .flip 13 1], (1, 13)⟩ } },
  { hits := [(4, 2), (4, 16), (5, 7), (5, 10), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 12), (13, 10), (13, 16), (14, 2), (14, 6), (16, 12), (16, 14)]
    forwardChoices := [{ center := 4, support := {2, 16} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 12} },
        { center := 13, support := {10, 16} },
        { center := 14, support := {2, 6} },
        { center := 16, support := {12, 14} }]
    reverseChoices := [{ center := 0, support := {2, 4} },
        { center := 2, support := {10, 14} },
        { center := 3, support := {0, 6} },
        { center := 6, support := {4, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} },
        { center := 12, support := {0, 14} }]
    forwardData := {
      firstQuad := ⟨10, 12, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 4, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(10, 12), [.row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14, .flip 6 14, .row 14 6 2, .flip 14 2], (2, 14)⟩
      path1 := ⟨(13, 16), [.row 13 16 10, .flip 13 10], (10, 13)⟩
      path2 := ⟨(2, 4), [.flip 2 4, .row 4 2 16], (4, 16)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 12, .flip 16 12], (12, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 4, 6⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 2, 12, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 6], (3, 6)⟩
      path1 := ⟨(4, 6), [.flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 14], (2, 14)⟩
      path2 := ⟨(0, 2), [.row 0 2 4], (0, 4)⟩
      path3 := ⟨(12, 14), [.row 12 14 0, .flip 12 0], (0, 12)⟩ } },
  { hits := [(5, 7), (5, 10), (6, 7), (6, 9), (7, 5), (7, 6), (8, 4), (8, 12), (9, 6), (9, 15), (10, 5), (10, 12), (11, 4), (11, 15), (12, 9), (12, 10)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {5, 6} },
        { center := 8, support := {4, 12} },
        { center := 9, support := {6, 15} },
        { center := 10, support := {5, 12} },
        { center := 11, support := {4, 15} },
        { center := 12, support := {9, 10} }]
    reverseChoices := [{ center := 4, support := {6, 7} },
        { center := 5, support := {1, 12} },
        { center := 6, support := {4, 11} },
        { center := 7, support := {1, 10} },
        { center := 8, support := {4, 12} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨8, 9, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 8, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(9, 12), [.flip 9 12, .row 12 9 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 9, .flip 6 9, .row 9 6 15], (9, 15)⟩
      path1 := ⟨(8, 15), [], (8, 15)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 12], (8, 12)⟩
      path3 := ⟨(11, 15), [.row 11 15 4, .flip 11 4], (4, 11)⟩ }
    reverseData := {
      firstQuad := ⟨1, 5, 8, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 7, 8⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 5), [.flip 1 5, .row 5 1 12], (5, 12)⟩
      path1 := ⟨(8, 12), [.row 8 12 4, .flip 8 4], (4, 8)⟩
      path2 := ⟨(4, 7), [.row 4 7 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 7, .flip 10 7, .row 7 10 1, .flip 7 1], (1, 7)⟩
      path3 := ⟨(1, 8), [], (1, 8)⟩ } },
  { hits := [(5, 7), (5, 10), (6, 7), (6, 9), (7, 5), (7, 6), (8, 9), (8, 12), (10, 5), (10, 12), (11, 8), (11, 15), (12, 10), (12, 15), (14, 6), (14, 8)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {5, 6} },
        { center := 8, support := {9, 12} },
        { center := 10, support := {5, 12} },
        { center := 11, support := {8, 15} },
        { center := 12, support := {10, 15} },
        { center := 14, support := {6, 8} }]
    reverseChoices := [{ center := 2, support := {8, 10} },
        { center := 4, support := {1, 6} },
        { center := 5, support := {1, 8} },
        { center := 6, support := {4, 11} },
        { center := 8, support := {4, 7} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨6, 8, 9, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 11, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(8, 9), [.row 8 9 12], (8, 12)⟩
      path1 := ⟨(6, 14), [.flip 6 14, .row 14 6 8, .flip 14 8], (8, 14)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 15], (11, 15)⟩
      path3 := ⟨(12, 15), [.row 12 15 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 9], (6, 9)⟩ }
    reverseData := {
      firstQuad := ⟨2, 7, 8, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 5, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(7, 8), [.flip 7 8, .row 8 7 4, .flip 8 4], (4, 8)⟩
      path1 := ⟨(2, 10), [.row 2 10 8], (2, 8)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 7, .flip 10 7], (7, 10)⟩
      path3 := ⟨(5, 8), [.row 5 8 1, .flip 5 1], (1, 5)⟩ } },
  { hits := [(5, 7), (5, 10), (6, 7), (6, 9), (7, 5), (7, 6), (9, 6), (9, 13), (10, 5), (10, 8), (11, 8), (11, 15), (12, 9), (12, 15), (15, 10), (15, 13)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {5, 6} },
        { center := 9, support := {6, 13} },
        { center := 10, support := {5, 8} },
        { center := 11, support := {8, 15} },
        { center := 12, support := {9, 15} },
        { center := 15, support := {10, 13} }]
    reverseChoices := [{ center := 1, support := {3, 6} },
        { center := 4, support := {1, 7} },
        { center := 5, support := {1, 8} },
        { center := 6, support := {8, 11} },
        { center := 7, support := {3, 10} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨8, 10, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨9, 12, 13, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(8, 10), [.flip 8 10, .row 10 8 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 9, .flip 6 9, .row 9 6 13], (9, 13)⟩
      path1 := ⟨(11, 15), [.row 11 15 8, .flip 11 8], (8, 11)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 15], (12, 15)⟩
      path3 := ⟨(13, 15), [.flip 13 15, .row 15 13 10, .flip 15 10], (10, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 4, 7⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 5, 6, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(1, 3), [.row 1 3 6], (1, 6)⟩
      path1 := ⟨(4, 7), [.row 4 7 1, .flip 4 1], (1, 4)⟩
      path2 := ⟨(1, 5), [.flip 1 5, .row 5 1 8], (5, 8)⟩
      path3 := ⟨(6, 8), [.row 6 8 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 7, .flip 10 7, .row 7 10 3, .flip 7 3], (3, 7)⟩ } },
  { hits := [(5, 7), (5, 10), (6, 7), (6, 9), (7, 5), (7, 6), (9, 6), (9, 13), (10, 5), (10, 12), (12, 9), (12, 10), (15, 0), (15, 13), (16, 0), (16, 12)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {5, 6} },
        { center := 9, support := {6, 13} },
        { center := 10, support := {5, 12} },
        { center := 12, support := {9, 10} },
        { center := 15, support := {0, 13} },
        { center := 16, support := {0, 12} }]
    reverseChoices := [{ center := 0, support := {4, 16} },
        { center := 1, support := {3, 16} },
        { center := 4, support := {6, 7} },
        { center := 6, support := {4, 11} },
        { center := 7, support := {3, 10} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨0, 12, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨9, 12, 13, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(12, 15), [], (12, 15)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 12, .flip 16 12], (12, 16)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 9, .flip 6 9, .row 9 6 13], (9, 13)⟩
      path3 := ⟨(13, 15), [.flip 13 15, .row 15 13 0, .flip 15 0], (0, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 4, 7⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 4, 16⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(1, 3), [.row 1 3 16], (1, 16)⟩
      path1 := ⟨(4, 7), [.row 4 7 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 7, .flip 10 7, .row 7 10 3, .flip 7 3], (3, 7)⟩
      path2 := ⟨(1, 4), [], (1, 4)⟩
      path3 := ⟨(0, 16), [.row 0 16 4], (0, 4)⟩ } },
  { hits := [(5, 7), (5, 10), (6, 7), (6, 9), (7, 5), (7, 6), (9, 6), (9, 15), (10, 5), (10, 12), (12, 3), (12, 9), (12, 10), (12, 15), (16, 3), (16, 12)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 6, support := {7, 9} },
        { center := 7, support := {5, 6} },
        { center := 9, support := {6, 15} },
        { center := 10, support := {5, 12} },
        { center := 12, support := {3, 9, 10, 15} },
        { center := 16, support := {3, 12} }]
    reverseChoices := [{ center := 0, support := {4, 13} },
        { center := 4, support := {1, 6, 7, 13} },
        { center := 6, support := {4, 11} },
        { center := 7, support := {1, 10} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {7, 9} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨9, 12, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 9, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(12, 15), [.row 12 15 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 9, .flip 6 9, .row 9 6 15], (9, 15)⟩
      path1 := ⟨(9, 16), [], (9, 16)⟩
      path2 := ⟨(9, 12), [.flip 9 12, .row 12 9 3, .flip 12 3], (3, 12)⟩
      path3 := ⟨(3, 16), [.flip 3 16, .row 16 3 12, .flip 16 12], (12, 16)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 7, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 4, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(4, 7), [.row 4 7 13], (4, 13)⟩
      path1 := ⟨(1, 13), [], (1, 13)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 7, .flip 10 7, .row 7 10 1, .flip 7 1], (1, 7)⟩
      path3 := ⟨(0, 13), [.row 0 13 4], (0, 4)⟩ } },
  { hits := [(5, 7), (5, 10), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 8), (10, 12), (10, 16), (13, 10), (13, 16), (14, 6), (14, 8), (16, 12), (16, 14)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 8, 12, 16} },
        { center := 13, support := {10, 16} },
        { center := 14, support := {6, 8} },
        { center := 16, support := {12, 14} }]
    reverseChoices := [{ center := 0, support := {2, 4} },
        { center := 2, support := {8, 10} },
        { center := 3, support := {0, 6} },
        { center := 6, support := {0, 4, 8, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨10, 12, 13, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨8, 10, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 3, 1⟩
      path0 := ⟨(10, 12), [.row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14, .flip 6 14, .row 14 6 8, .flip 14 8], (8, 14)⟩
      path1 := ⟨(13, 16), [.row 13 16 10, .flip 13 10], (10, 13)⟩
      path2 := ⟨(8, 10), [.flip 8 10, .row 10 8 16], (10, 16)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 12, .flip 16 12], (12, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 3, 4, 6⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 2, 6, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(0, 3), [.flip 0 3, .row 3 0 6], (3, 6)⟩
      path1 := ⟨(4, 6), [.flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 8], (2, 8)⟩
      path2 := ⟨(0, 2), [.row 0 2 4], (0, 4)⟩
      path3 := ⟨(6, 8), [.row 6 8 0, .flip 6 0], (0, 6)⟩ } },
  { hits := [(5, 7), (5, 10), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 12), (11, 8), (11, 15), (12, 10), (12, 15), (14, 6), (14, 8), (16, 12), (16, 14)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 12} },
        { center := 11, support := {8, 15} },
        { center := 12, support := {10, 15} },
        { center := 14, support := {6, 8} },
        { center := 16, support := {12, 14} }]
    reverseChoices := [{ center := 0, support := {2, 4} },
        { center := 2, support := {8, 10} },
        { center := 4, support := {1, 6} },
        { center := 5, support := {1, 8} },
        { center := 6, support := {4, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨11, 12, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨8, 11, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(12, 15), [.row 12 15 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14, .flip 6 14, .row 14 6 8, .flip 14 8], (8, 14)⟩
      path1 := ⟨(11, 16), [], (11, 16)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 15], (11, 15)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 12, .flip 16 12], (12, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 4, 5⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 5, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(1, 4), [.flip 1 4, .row 4 1 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 8], (2, 8)⟩
      path1 := ⟨(0, 5), [], (0, 5)⟩
      path2 := ⟨(0, 2), [.row 0 2 4], (0, 4)⟩
      path3 := ⟨(5, 8), [.row 5 8 1, .flip 5 1], (1, 5)⟩ } },
  { hits := [(5, 7), (5, 10), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 12), (12, 3), (12, 10), (14, 0), (14, 6), (16, 0), (16, 3), (16, 12), (16, 14)]
    forwardChoices := [{ center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 12} },
        { center := 12, support := {3, 10} },
        { center := 14, support := {0, 6} },
        { center := 16, support := {0, 3, 12, 14} }]
    reverseChoices := [{ center := 0, support := {2, 4, 13, 16} },
        { center := 2, support := {10, 16} },
        { center := 4, support := {6, 13} },
        { center := 6, support := {4, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} }]
    forwardData := {
      firstQuad := ⟨0, 3, 14, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 12, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(3, 14), [], (3, 14)⟩
      path1 := ⟨(0, 16), [.flip 0 16, .row 16 0 3, .flip 16 3], (3, 16)⟩
      path2 := ⟨(3, 12), [.flip 3 12, .row 12 3 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14, .flip 6 14, .row 14 6 0, .flip 14 0], (0, 14)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 12, .flip 16 12], (12, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 2, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 2, 4, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 2, 0, 1⟩
      path0 := ⟨(2, 13), [], (2, 13)⟩
      path1 := ⟨(0, 16), [.row 0 16 4], (0, 4)⟩
      path2 := ⟨(0, 2), [.row 0 2 13], (0, 13)⟩
      path3 := ⟨(4, 13), [.row 4 13 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 16], (2, 16)⟩ } },
  { hits := [(1, 11), (1, 14), (2, 11), (2, 12), (3, 2), (3, 15), (5, 7), (5, 10), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 12), (12, 10), (12, 15), (14, 2), (14, 6)]
    forwardChoices := [{ center := 1, support := {11, 14} },
        { center := 2, support := {11, 12} },
        { center := 3, support := {2, 15} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 12} },
        { center := 12, support := {10, 15} },
        { center := 14, support := {2, 6} }]
    reverseChoices := [{ center := 2, support := {10, 14} },
        { center := 4, support := {1, 6} },
        { center := 6, support := {4, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} },
        { center := 13, support := {1, 14} },
        { center := 14, support := {4, 5} },
        { center := 15, support := {2, 5} }]
    forwardData := {
      firstQuad := ⟨2, 3, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 11, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 15], (3, 15)⟩
      path1 := ⟨(12, 15), [.row 12 15 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14, .flip 6 14, .row 14 6 2, .flip 14 2], (2, 14)⟩
      path2 := ⟨(2, 11), [.row 2 11 12], (2, 12)⟩
      path3 := ⟨(1, 14), [.row 1 14 11], (1, 11)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(5, 14), [.flip 5 14, .row 14 5 4, .flip 14 4], (4, 14)⟩
      path1 := ⟨(2, 15), [.flip 2 15, .row 15 2 5, .flip 15 5], (5, 15)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 14], (2, 14)⟩
      path3 := ⟨(13, 14), [.row 13 14 1, .flip 13 1], (1, 13)⟩ } },
  { hits := [(1, 11), (1, 14), (2, 11), (2, 12), (5, 7), (5, 10), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 12), (11, 8), (11, 15), (12, 10), (12, 15), (14, 6), (14, 8)]
    forwardChoices := [{ center := 1, support := {11, 14} },
        { center := 2, support := {11, 12} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 12} },
        { center := 11, support := {8, 15} },
        { center := 12, support := {10, 15} },
        { center := 14, support := {6, 8} }]
    reverseChoices := [{ center := 2, support := {8, 10} },
        { center := 4, support := {1, 6} },
        { center := 5, support := {1, 8} },
        { center := 6, support := {4, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} },
        { center := 14, support := {4, 5} },
        { center := 15, support := {2, 5} }]
    forwardData := {
      firstQuad := ⟨2, 11, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 8, 11, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(2, 11), [.row 2 11 12], (2, 12)⟩
      path1 := ⟨(12, 15), [.row 12 15 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14, .flip 6 14, .row 14 6 8, .flip 14 8], (8, 14)⟩
      path2 := ⟨(8, 11), [.flip 8 11, .row 11 8 15], (11, 15)⟩
      path3 := ⟨(1, 14), [.row 1 14 11], (1, 11)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 8, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 5, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(5, 8), [.row 5 8 1, .flip 5 1], (1, 5)⟩
      path1 := ⟨(2, 15), [.flip 2 15, .row 15 2 5, .flip 15 5], (5, 15)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 8], (2, 8)⟩
      path3 := ⟨(5, 14), [.flip 5 14, .row 14 5 4, .flip 14 4], (4, 14)⟩ } },
  { hits := [(1, 11), (1, 14), (5, 7), (5, 10), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 8), (11, 1), (11, 8), (13, 10), (13, 11), (14, 0), (14, 6), (15, 0), (15, 1)]
    forwardChoices := [{ center := 1, support := {11, 14} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 8} },
        { center := 11, support := {1, 8} },
        { center := 13, support := {10, 11} },
        { center := 14, support := {0, 6} },
        { center := 15, support := {0, 1} }]
    reverseChoices := [{ center := 1, support := {15, 16} },
        { center := 2, support := {10, 16} },
        { center := 3, support := {5, 6} },
        { center := 5, support := {8, 15} },
        { center := 6, support := {8, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} },
        { center := 15, support := {2, 5} }]
    forwardData := {
      firstQuad := ⟨8, 10, 11, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(8, 10), [.flip 8 10, .row 10 8 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14, .flip 6 14, .row 14 6 0, .flip 14 0], (0, 14)⟩
      path1 := ⟨(11, 13), [.flip 11 13, .row 13 11 10, .flip 13 10], (10, 13)⟩
      path2 := ⟨(1, 14), [.row 1 14 11, .flip 1 11, .row 11 1 8, .flip 11 8], (8, 11)⟩
      path3 := ⟨(0, 15), [.flip 0 15, .row 15 0 1, .flip 15 1], (1, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 6, 8⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(2, 15), [.flip 2 15, .row 15 2 5, .flip 15 5, .row 5 15 8], (5, 8)⟩
      path1 := ⟨(1, 16), [.row 1 16 15], (1, 15)⟩
      path2 := ⟨(3, 5), [.row 3 5 6], (3, 6)⟩
      path3 := ⟨(6, 8), [.row 6 8 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 16], (2, 16)⟩ } },
  { hits := [(1, 11), (1, 14), (2, 11), (2, 12), (5, 7), (5, 10), (6, 7), (6, 14), (7, 5), (7, 6), (10, 5), (10, 12), (11, 1), (11, 15), (12, 10), (12, 15), (14, 0), (14, 6), (15, 0), (15, 1)]
    forwardChoices := [{ center := 1, support := {11, 14} },
        { center := 2, support := {11, 12} },
        { center := 5, support := {7, 10} },
        { center := 6, support := {7, 14} },
        { center := 7, support := {5, 6} },
        { center := 10, support := {5, 12} },
        { center := 11, support := {1, 15} },
        { center := 12, support := {10, 15} },
        { center := 14, support := {0, 6} },
        { center := 15, support := {0, 1} }]
    reverseChoices := [{ center := 1, support := {15, 16} },
        { center := 2, support := {10, 16} },
        { center := 4, support := {1, 6} },
        { center := 5, support := {1, 15} },
        { center := 6, support := {4, 11} },
        { center := 9, support := {10, 11} },
        { center := 10, support := {2, 9} },
        { center := 11, support := {6, 9} },
        { center := 14, support := {4, 5} },
        { center := 15, support := {2, 5} }]
    forwardData := {
      firstQuad := ⟨2, 11, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(2, 11), [.row 2 11 12], (2, 12)⟩
      path1 := ⟨(12, 15), [.row 12 15 10, .flip 12 10, .row 10 12 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 14, .flip 6 14, .row 14 6 0, .flip 14 0], (0, 14)⟩
      path2 := ⟨(1, 14), [.row 1 14 11, .flip 1 11, .row 11 1 15], (11, 15)⟩
      path3 := ⟨(0, 15), [.flip 0 15, .row 15 0 1, .flip 15 1], (1, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 2, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 5, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(2, 15), [.flip 2 15, .row 15 2 5, .flip 15 5, .row 5 15 1, .flip 5 1], (1, 5)⟩
      path1 := ⟨(1, 16), [.row 1 16 15], (1, 15)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 6, .flip 4 6, .row 6 4 11, .flip 6 11, .row 11 6 9, .flip 11 9, .row 9 11 10, .flip 9 10, .row 10 9 2, .flip 10 2, .row 2 10 16], (2, 16)⟩
      path3 := ⟨(5, 14), [.flip 5 14, .row 14 5 4, .flip 14 4], (4, 14)⟩ } }
]

theorem currentRootTwoKalmansonSuccessorOccurrences_length : currentRootTwoKalmansonSuccessorOccurrences.length = 81 := by
  decide

theorem currentRootTwoKalmansonSuccessorOccurrences_all_check : currentRootTwoKalmansonSuccessorOccurrences.all CancellationOccurrence.check = true := by
  decide

def currentRootTwoKalmansonSuccessorClauses : Std.Sat.CNF Atom :=
  currentRootTwoKalmansonSuccessorOccurrences.flatMap fun occurrence => occurrenceClauses occurrence.hits

theorem currentRootTwoKalmansonSuccessorClauses_length : currentRootTwoKalmansonSuccessorClauses.length = 324 := by
  simp [currentRootTwoKalmansonSuccessorClauses, occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    namedOrders, directions, currentRootTwoKalmansonSuccessorOccurrences_length]

theorem sourceAssign_currentRootTwoKalmansonSuccessorClauses {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) : ∀ clause ∈ currentRootTwoKalmansonSuccessorClauses, Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [currentRootTwoKalmansonSuccessorClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occurrence, hoccurrence, hclause⟩
  have hcheck := List.all_eq_true.mp currentRootTwoKalmansonSuccessorOccurrences_all_check occurrence hoccurrence
  simp only [occurrenceClauses, ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occurrence hcheck order direction

def extendedCurrentRootTwoKalmansonSuccessorCnf : Std.Sat.CNF Atom := extendedCurrentRootTwoKalmansonCnf ++ currentRootTwoKalmansonSuccessorClauses

theorem extendedCurrentRootTwoKalmansonSuccessorCnf_length : extendedCurrentRootTwoKalmansonSuccessorCnf.length = 7037500 := by
  simp only [extendedCurrentRootTwoKalmansonSuccessorCnf, List.length_append, extendedCurrentRootTwoKalmansonCnf_length, currentRootTwoKalmansonSuccessorClauses_length]

theorem sourceAssign_extendedCurrentRootTwoKalmansonSuccessorCnf {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) : Std.Sat.CNF.eval (sourceAssign source.model) extendedCurrentRootTwoKalmansonSuccessorCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedCurrentRootTwoKalmansonSuccessorCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedCurrentRootTwoKalmansonCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_currentRootTwoKalmansonSuccessorClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedCurrentRootTwoKalmansonSuccessorCnf_unsat {A : Finset (EuclideanSpace ℝ (Fin 2))} (hsource : Nonempty (SourceRealization A)) (hunsat : ¬ ∃ assignment, Std.Sat.CNF.eval assignment extendedCurrentRootTwoKalmansonSuccessorCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model, sourceAssign_extendedCurrentRootTwoKalmansonSuccessorCnf source⟩

#print axioms sourceAssign_currentRootTwoKalmansonSuccessorClauses
#print axioms sourceAssign_extendedCurrentRootTwoKalmansonSuccessorCnf
#print axioms false_of_sourceRealization_of_extendedCurrentRootTwoKalmansonSuccessorCnf_unsat
end ATailBlockerVExactSeventeenCurrentRootTwoKalmansonSuccessorRefinements
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenTwentySeventhModelRefinements

/-!
# Complete minimal cancellation family from exact-seventeen child 28

The child-28 model has 183 checked two-Kalmanson cancellation certificates.
Projecting them to the positive selected-row incidences actually consumed and
removing supersets leaves 64 supports.  Each record below contains separately
checked forward and reflected certificates.  One source theorem validates the
records; their 256 order/orientation nogoods form the child-29 suffix.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenTwentyEighthModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenTwentySeventhModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev priorOrientedHits :=
  ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits

private abbrev priorOccurrenceClause :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause

private abbrev priorOccurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

private theorem sourceIndexEquiv_symm_eq_of_same
    (order : NamedOrder) (actual direction : Orientation)
    (hsame : actual = direction) (index : Label) :
    (sourceIndexEquiv order actual).symm index =
      orientedLabelAtPosition order direction index := by
  subst actual
  rfl

private theorem sourceIndexEquiv_symm_eq_reflected_of_ne
    (order : NamedOrder) (actual direction : Orientation)
    (hne : actual ≠ direction) (index : Label) :
    (sourceIndexEquiv order actual).symm index =
      orientedLabelAtPosition order direction (Fin.rev index) := by
  cases actual <;> cases direction <;>
    simp_all [sourceIndexEquiv, orientedLabelAtPosition]

private theorem positiveRowsMatch_of_same {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hsame : source.orientation = direction)
    (baseHits : List Hit) (choices : List (RowChoice Label))
    (hcover : ∀ choice ∈ choices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ baseHits)
    (hall : ∀ hit ∈ priorOrientedHits baseHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected) choices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  exact hall
    (orientedLabelAtPosition source.model.order direction choice.center,
      orientedLabelAtPosition source.model.order direction point)
    (by
      simp only [priorOrientedHits,
        ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits,
        List.mem_map]
      exact ⟨(choice.center, point), hcover choice hchoice point hpoint, rfl⟩)

private theorem positiveRowsMatch_of_ne {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hne : source.orientation ≠ direction)
    (baseHits : List Hit) (choices : List (RowChoice Label))
    (hcover : ∀ choice ∈ choices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ baseHits)
    (hall : ∀ hit ∈ priorOrientedHits baseHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected) choices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  exact hall
    (orientedLabelAtPosition source.model.order direction (Fin.rev choice.center),
      orientedLabelAtPosition source.model.order direction (Fin.rev point))
    (by
      simp only [priorOrientedHits,
        ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits,
        List.mem_map]
      exact ⟨(Fin.rev choice.center, Fin.rev point),
        hcover choice hchoice point hpoint, rfl⟩)

structure CancellationOccurrence where
  hits : List Hit
  forwardChoices : List (RowChoice Label)
  reverseChoices : List (RowChoice Label)
  forwardData : TwoKalmansonCancellationData Label
  reverseData : TwoKalmansonCancellationData Label
deriving DecidableEq

def CancellationOccurrence.check (occ : CancellationOccurrence) : Bool :=
  occ.forwardData.check occ.forwardChoices &&
  occ.reverseData.check occ.reverseChoices &&
  decide (∀ choice ∈ occ.forwardChoices, ∀ point ∈ choice.support,
    (choice.center, point) ∈ occ.hits) &&
  decide (∀ choice ∈ occ.reverseChoices, ∀ point ∈ choice.support,
    (Fin.rev choice.center, Fin.rev point) ∈ occ.hits)

private theorem false_of_cancellationOccurrenceHits {A : Finset ℝ²}
    (source : SourceRealization A) (occ : CancellationOccurrence)
    (hcheck : occ.check = true) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits occ.hits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  simp only [CancellationOccurrence.check, Bool.and_eq_true,
    decide_eq_true_eq] at hcheck
  rcases hcheck with ⟨⟨⟨hforward, hreverse⟩, hforwardCover⟩,
    hreverseCover⟩
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_twoKalmansonCancellationData_of_check
      source.carrier_convexIndep source.boundary_image source.boundary_ccw
      hreal occ.forwardChoices
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        occ.hits occ.forwardChoices hforwardCover hall)
      occ.forwardData hforward
  · exact false_of_twoKalmansonCancellationData_of_check
      source.carrier_convexIndep source.boundary_image source.boundary_ccw
      hreal occ.reverseChoices
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        occ.hits occ.reverseChoices hreverseCover hall)
      occ.reverseData hreverse

theorem sourceAssign_cancellationOccurrenceClause {A : Finset ℝ²}
    (source : SourceRealization A) (occ : CancellationOccurrence)
    (hcheck : occ.check = true) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (priorOccurrenceClause occ.hits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_cancellationOccurrenceHits source occ hcheck order direction
    horder.symm hall

def cancellationOccurrences : List CancellationOccurrence :=
[
  { hits := [(0, 2), (0, 5), (10, 1), (10, 5), (14, 1), (14, 2)]
    forwardChoices := [{ center := 0, support := {2, 5} },
        { center := 10, support := {1, 5} },
        { center := 14, support := {1, 2} }]
    reverseChoices := [{ center := 2, support := {14, 15} },
        { center := 6, support := {11, 15} },
        { center := 16, support := {11, 14} }]
    forwardData := {
      firstQuad := ⟨0, 2, 5, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 5, 10, 14⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 2), [.row 0 2 5], (0, 5)⟩
      path1 := ⟨(5, 14), [], (5, 14)⟩
      path2 := ⟨(5, 10), [.flip 5 10, .row 10 5 1, .flip 10 1], (1, 10)⟩
      path3 := ⟨(1, 14), [.flip 1 14, .row 14 1 2, .flip 14 2], (2, 14)⟩ }
    reverseData := {
      firstQuad := ⟨2, 6, 11, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 11, 14, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(6, 11), [.row 6 11 15], (6, 15)⟩
      path1 := ⟨(2, 15), [.row 2 15 14], (2, 14)⟩
      path2 := ⟨(2, 11), [], (2, 11)⟩
      path3 := ⟨(14, 16), [.flip 14 16, .row 16 14 11, .flip 16 11], (11, 16)⟩ } },
  { hits := [(0, 2), (0, 14), (2, 1), (2, 14), (14, 1), (14, 2)]
    forwardChoices := [{ center := 0, support := {2, 14} },
        { center := 2, support := {1, 14} },
        { center := 14, support := {1, 2} }]
    reverseChoices := [{ center := 2, support := {14, 15} },
        { center := 14, support := {2, 15} },
        { center := 16, support := {2, 14} }]
    forwardData := {
      firstQuad := ⟨0, 1, 2, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 10, 14⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 14, .flip 2 14, .row 14 2 1, .flip 14 1], (1, 14)⟩
      path1 := ⟨(0, 10), [], (0, 10)⟩
      path2 := ⟨(1, 10), [], (1, 10)⟩
      path3 := ⟨(0, 14), [.row 0 14 2], (0, 2)⟩ }
    reverseData := {
      firstQuad := ⟨2, 10, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨10, 14, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(10, 15), [], (10, 15)⟩
      path1 := ⟨(2, 16), [.flip 2 16, .row 16 2 14, .flip 16 14], (14, 16)⟩
      path2 := ⟨(14, 15), [.row 14 15 2, .flip 14 2, .row 2 14 15], (2, 15)⟩
      path3 := ⟨(10, 16), [], (10, 16)⟩ } },
  { hits := [(0, 5), (0, 8), (9, 3), (9, 8), (10, 3), (10, 5)]
    forwardChoices := [{ center := 0, support := {5, 8} },
        { center := 9, support := {3, 8} },
        { center := 10, support := {3, 5} }]
    reverseChoices := [{ center := 6, support := {11, 13} },
        { center := 7, support := {8, 13} },
        { center := 16, support := {8, 11} }]
    forwardData := {
      firstQuad := ⟨0, 5, 8, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 8, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 5), [.row 0 5 8], (0, 8)⟩
      path1 := ⟨(8, 10), [], (8, 10)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(3, 10), [.flip 3 10, .row 10 3 5, .flip 10 5], (5, 10)⟩ }
    reverseData := {
      firstQuad := ⟨6, 7, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 8, 11, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(7, 11), [], (7, 11)⟩
      path1 := ⟨(6, 13), [.row 6 13 11], (6, 11)⟩
      path2 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path3 := ⟨(11, 16), [.flip 11 16, .row 16 11 8, .flip 16 8], (8, 16)⟩ } },
  { hits := [(1, 10), (1, 12), (2, 12), (2, 14), (5, 10), (5, 14)]
    forwardChoices := [{ center := 1, support := {10, 12} },
        { center := 2, support := {12, 14} },
        { center := 5, support := {10, 14} }]
    reverseChoices := [{ center := 11, support := {2, 6} },
        { center := 14, support := {2, 4} },
        { center := 15, support := {4, 6} }]
    forwardData := {
      firstQuad := ⟨2, 5, 10, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 10, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(5, 10), [.row 5 10 14], (5, 14)⟩
      path1 := ⟨(2, 14), [.row 2 14 12], (2, 12)⟩
      path2 := ⟨(2, 10), [], (2, 10)⟩
      path3 := ⟨(1, 12), [.row 1 12 10], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨2, 4, 11, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 11, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(4, 11), [], (4, 11)⟩
      path1 := ⟨(2, 14), [.flip 2 14, .row 14 2 4, .flip 14 4], (4, 14)⟩
      path2 := ⟨(6, 11), [.flip 6 11, .row 11 6 2, .flip 11 2], (2, 11)⟩
      path3 := ⟨(4, 15), [.flip 4 15, .row 15 4 6, .flip 15 6], (6, 15)⟩ } },
  { hits := [(1, 10), (1, 12), (4, 9), (4, 10), (16, 9), (16, 12)]
    forwardChoices := [{ center := 1, support := {10, 12} },
        { center := 4, support := {9, 10} },
        { center := 16, support := {9, 12} }]
    reverseChoices := [{ center := 0, support := {4, 7} },
        { center := 12, support := {6, 7} },
        { center := 15, support := {4, 6} }]
    forwardData := {
      firstQuad := ⟨4, 9, 10, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 10, 12, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 9), [.row 4 9 10], (4, 10)⟩
      path1 := ⟨(10, 16), [], (10, 16)⟩
      path2 := ⟨(1, 10), [.row 1 10 12], (1, 12)⟩
      path3 := ⟨(12, 16), [.flip 12 16, .row 16 12 9, .flip 16 9], (9, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 7, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 7, 12, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 4), [.row 0 4 7], (0, 7)⟩
      path1 := ⟨(7, 15), [], (7, 15)⟩
      path2 := ⟨(7, 12), [.flip 7 12, .row 12 7 6, .flip 12 6], (6, 12)⟩
      path3 := ⟨(6, 15), [.flip 6 15, .row 15 6 4, .flip 15 4], (4, 15)⟩ } },
  { hits := [(1, 10), (1, 12), (5, 10), (5, 11), (8, 11), (8, 12)]
    forwardChoices := [{ center := 1, support := {10, 12} },
        { center := 5, support := {10, 11} },
        { center := 8, support := {11, 12} }]
    reverseChoices := [{ center := 8, support := {4, 5} },
        { center := 11, support := {5, 6} },
        { center := 15, support := {4, 6} }]
    forwardData := {
      firstQuad := ⟨1, 5, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 8, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(5, 10), [.row 5 10 11], (5, 11)⟩
      path1 := ⟨(1, 11), [], (1, 11)⟩
      path2 := ⟨(8, 11), [.row 8 11 12], (8, 12)⟩
      path3 := ⟨(1, 12), [.row 1 12 10], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨4, 6, 11, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 8, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(6, 11), [.flip 6 11, .row 11 6 5, .flip 11 5], (5, 11)⟩
      path1 := ⟨(4, 15), [.flip 4 15, .row 15 4 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(5, 8), [.flip 5 8, .row 8 5 4, .flip 8 4], (4, 8)⟩
      path3 := ⟨(4, 11), [], (4, 11)⟩ } },
  { hits := [(1, 10), (1, 13), (4, 9), (4, 10), (7, 9), (7, 13)]
    forwardChoices := [{ center := 1, support := {10, 13} },
        { center := 4, support := {9, 10} },
        { center := 7, support := {9, 13} }]
    reverseChoices := [{ center := 9, support := {3, 7} },
        { center := 12, support := {6, 7} },
        { center := 15, support := {3, 6} }]
    forwardData := {
      firstQuad := ⟨1, 7, 10, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 7, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(7, 10), [], (7, 10)⟩
      path1 := ⟨(1, 13), [.row 1 13 10], (1, 10)⟩
      path2 := ⟨(7, 9), [.row 7 9 13], (7, 13)⟩
      path3 := ⟨(4, 10), [.row 4 10 9], (4, 9)⟩ }
    reverseData := {
      firstQuad := ⟨3, 6, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 7, 9, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(6, 12), [.flip 6 12, .row 12 6 7, .flip 12 7], (7, 12)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(3, 12), [], (3, 12)⟩ } },
  { hits := [(1, 10), (1, 13), (5, 10), (5, 11), (6, 11), (6, 13)]
    forwardChoices := [{ center := 1, support := {10, 13} },
        { center := 5, support := {10, 11} },
        { center := 6, support := {11, 13} }]
    reverseChoices := [{ center := 10, support := {3, 5} },
        { center := 11, support := {5, 6} },
        { center := 15, support := {3, 6} }]
    forwardData := {
      firstQuad := ⟨1, 5, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 6, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(5, 10), [.row 5 10 11], (5, 11)⟩
      path1 := ⟨(1, 11), [], (1, 11)⟩
      path2 := ⟨(6, 11), [.row 6 11 13], (6, 13)⟩
      path3 := ⟨(1, 13), [.row 1 13 10], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨3, 6, 11, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(6, 11), [.flip 6 11, .row 11 6 5, .flip 11 5], (5, 11)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 6, .flip 15 6], (6, 15)⟩
      path2 := ⟨(5, 10), [.flip 5 10, .row 10 5 3, .flip 10 3], (3, 10)⟩
      path3 := ⟨(3, 11), [], (3, 11)⟩ } },
  { hits := [(1, 12), (1, 13), (7, 9), (7, 13), (16, 9), (16, 12)]
    forwardChoices := [{ center := 1, support := {12, 13} },
        { center := 7, support := {9, 13} },
        { center := 16, support := {9, 12} }]
    reverseChoices := [{ center := 0, support := {4, 7} },
        { center := 9, support := {3, 7} },
        { center := 15, support := {3, 4} }]
    forwardData := {
      firstQuad := ⟨1, 7, 12, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 9, 12, 16⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(7, 12), [], (7, 12)⟩
      path1 := ⟨(1, 13), [.row 1 13 12], (1, 12)⟩
      path2 := ⟨(7, 9), [.row 7 9 13], (7, 13)⟩
      path3 := ⟨(12, 16), [.flip 12 16, .row 16 12 9, .flip 16 9], (9, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 4, 7, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 7, 9, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(0, 4), [.row 0 4 7], (0, 7)⟩
      path1 := ⟨(7, 15), [], (7, 15)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(3, 15), [.flip 3 15, .row 15 3 4, .flip 15 4], (4, 15)⟩ } },
  { hits := [(1, 12), (1, 13), (7, 13), (7, 15), (8, 12), (8, 15)]
    forwardChoices := [{ center := 1, support := {12, 13} },
        { center := 7, support := {13, 15} },
        { center := 8, support := {12, 15} }]
    reverseChoices := [{ center := 8, support := {1, 4} },
        { center := 9, support := {1, 3} },
        { center := 15, support := {3, 4} }]
    forwardData := {
      firstQuad := ⟨7, 8, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 7, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(8, 12), [.row 8 12 15], (8, 15)⟩
      path1 := ⟨(7, 15), [.row 7 15 13], (7, 13)⟩
      path2 := ⟨(7, 12), [], (7, 12)⟩
      path3 := ⟨(1, 13), [.row 1 13 12], (1, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 8, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 8, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(3, 8), [], (3, 8)⟩
      path1 := ⟨(1, 9), [.flip 1 9, .row 9 1 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 1, .flip 8 1], (1, 8)⟩
      path3 := ⟨(3, 15), [.flip 3 15, .row 15 3 4, .flip 15 4], (4, 15)⟩ } },
  { hits := [(2, 1), (2, 12), (8, 12), (8, 15), (10, 1), (10, 15)]
    forwardChoices := [{ center := 2, support := {1, 12} },
        { center := 8, support := {12, 15} },
        { center := 10, support := {1, 15} }]
    reverseChoices := [{ center := 6, support := {1, 15} },
        { center := 8, support := {1, 4} },
        { center := 14, support := {4, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 8, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 8, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 12], (2, 12)⟩
      path1 := ⟨(8, 12), [.row 8 12 15], (8, 15)⟩
      path2 := ⟨(1, 8), [], (1, 8)⟩
      path3 := ⟨(10, 15), [.row 10 15 1, .flip 10 1], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 8, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 15], (6, 15)⟩
      path1 := ⟨(14, 15), [.row 14 15 4, .flip 14 4], (4, 14)⟩
      path2 := ⟨(4, 8), [.flip 4 8, .row 8 4 1, .flip 8 1], (1, 8)⟩
      path3 := ⟨(1, 14), [], (1, 14)⟩ } },
  { hits := [(2, 1), (2, 14), (5, 11), (5, 14), (6, 1), (6, 11)]
    forwardChoices := [{ center := 2, support := {1, 14} },
        { center := 5, support := {11, 14} },
        { center := 6, support := {1, 11} }]
    reverseChoices := [{ center := 10, support := {5, 15} },
        { center := 11, support := {2, 5} },
        { center := 14, support := {2, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 5, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 5, 6, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 14], (2, 14)⟩
      path1 := ⟨(5, 14), [.row 5 14 11], (5, 11)⟩
      path2 := ⟨(1, 5), [], (1, 5)⟩
      path3 := ⟨(6, 11), [.row 6 11 1, .flip 6 1], (1, 6)⟩ }
    reverseData := {
      firstQuad := ⟨5, 10, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 11, 14, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(5, 10), [.flip 5 10, .row 10 5 15], (10, 15)⟩
      path1 := ⟨(11, 15), [], (11, 15)⟩
      path2 := ⟨(2, 11), [.flip 2 11, .row 11 2 5, .flip 11 5], (5, 11)⟩
      path3 := ⟨(14, 15), [.row 14 15 2, .flip 14 2], (2, 14)⟩ } },
  { hits := [(2, 1), (2, 14), (10, 1), (10, 15), (12, 14), (12, 15)]
    forwardChoices := [{ center := 2, support := {1, 14} },
        { center := 10, support := {1, 15} },
        { center := 12, support := {14, 15} }]
    reverseChoices := [{ center := 4, support := {1, 2} },
        { center := 6, support := {1, 15} },
        { center := 14, support := {2, 15} }]
    forwardData := {
      firstQuad := ⟨1, 2, 10, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨10, 12, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 14], (2, 14)⟩
      path1 := ⟨(10, 14), [], (10, 14)⟩
      path2 := ⟨(12, 14), [.row 12 14 15], (12, 15)⟩
      path3 := ⟨(10, 15), [.row 10 15 1, .flip 10 1], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 4, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 15], (6, 15)⟩
      path1 := ⟨(14, 15), [.row 14 15 2, .flip 14 2], (2, 14)⟩
      path2 := ⟨(2, 4), [.flip 2 4, .row 4 2 1, .flip 4 1], (1, 4)⟩
      path3 := ⟨(1, 14), [], (1, 14)⟩ } },
  { hits := [(2, 6), (2, 12), (8, 12), (8, 15), (12, 6), (12, 15)]
    forwardChoices := [{ center := 2, support := {6, 12} },
        { center := 8, support := {12, 15} },
        { center := 12, support := {6, 15} }]
    reverseChoices := [{ center := 4, support := {1, 10} },
        { center := 8, support := {1, 4} },
        { center := 14, support := {4, 10} }]
    forwardData := {
      firstQuad := ⟨2, 8, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 6, 8, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(2, 8), [], (2, 8)⟩
      path1 := ⟨(12, 15), [.row 12 15 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(2, 6), [.row 2 6 12], (2, 12)⟩
      path3 := ⟨(8, 12), [.row 8 12 15], (8, 15)⟩ }
    reverseData := {
      firstQuad := ⟨4, 8, 10, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 8, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 0, 1⟩
      path0 := ⟨(4, 8), [.flip 4 8, .row 8 4 1, .flip 8 1], (1, 8)⟩
      path1 := ⟨(10, 14), [.flip 10 14, .row 14 10 4, .flip 14 4], (4, 14)⟩
      path2 := ⟨(1, 4), [.flip 1 4, .row 4 1 10], (4, 10)⟩
      path3 := ⟨(8, 14), [], (8, 14)⟩ } },
  { hits := [(2, 6), (2, 14), (4, 6), (4, 10), (5, 10), (5, 14)]
    forwardChoices := [{ center := 2, support := {6, 14} },
        { center := 4, support := {6, 10} },
        { center := 5, support := {10, 14} }]
    reverseChoices := [{ center := 11, support := {2, 6} },
        { center := 12, support := {6, 10} },
        { center := 14, support := {2, 10} }]
    forwardData := {
      firstQuad := ⟨2, 4, 6, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 10, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(4, 6), [.row 4 6 10], (4, 10)⟩
      path1 := ⟨(2, 10), [], (2, 10)⟩
      path2 := ⟨(5, 10), [.row 5 10 14], (5, 14)⟩
      path3 := ⟨(2, 14), [.row 2 14 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨2, 10, 12, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 6, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(10, 12), [.flip 10 12, .row 12 10 6, .flip 12 6], (6, 12)⟩
      path1 := ⟨(2, 14), [.flip 2 14, .row 14 2 10, .flip 14 10], (10, 14)⟩
      path2 := ⟨(6, 11), [.flip 6 11, .row 11 6 2, .flip 11 2], (2, 11)⟩
      path3 := ⟨(2, 12), [], (2, 12)⟩ } },
  { hits := [(3, 2), (3, 15), (10, 1), (10, 15), (14, 1), (14, 2)]
    forwardChoices := [{ center := 3, support := {2, 15} },
        { center := 10, support := {1, 15} },
        { center := 14, support := {1, 2} }]
    reverseChoices := [{ center := 2, support := {14, 15} },
        { center := 6, support := {1, 15} },
        { center := 13, support := {1, 14} }]
    forwardData := {
      firstQuad := ⟨1, 2, 10, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(2, 10), [], (2, 10)⟩
      path1 := ⟨(1, 14), [.flip 1 14, .row 14 1 2, .flip 14 2], (2, 14)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15], (3, 15)⟩
      path3 := ⟨(10, 15), [.row 10 15 1, .flip 10 1], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 13, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 13, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 15], (6, 15)⟩
      path1 := ⟨(13, 15), [], (13, 15)⟩
      path2 := ⟨(13, 14), [.row 13 14 1, .flip 13 1], (1, 13)⟩
      path3 := ⟨(2, 15), [.row 2 15 14], (2, 14)⟩ } },
  { hits := [(4, 6), (4, 9), (7, 4), (7, 9), (13, 4), (13, 6)]
    forwardChoices := [{ center := 4, support := {6, 9} },
        { center := 7, support := {4, 9} },
        { center := 13, support := {4, 6} }]
    reverseChoices := [{ center := 3, support := {10, 12} },
        { center := 9, support := {7, 12} },
        { center := 12, support := {7, 10} }]
    forwardData := {
      firstQuad := ⟨4, 6, 9, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 6, 7, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(6, 9), [], (6, 9)⟩
      path1 := ⟨(4, 13), [.flip 4 13, .row 13 4 6, .flip 13 6], (6, 13)⟩
      path2 := ⟨(4, 6), [.row 4 6 9], (4, 9)⟩
      path3 := ⟨(7, 9), [.row 7 9 4, .flip 7 4], (4, 7)⟩ }
    reverseData := {
      firstQuad := ⟨7, 9, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 7, 10, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(7, 9), [.flip 7 9, .row 9 7 12], (9, 12)⟩
      path1 := ⟨(10, 12), [.flip 10 12, .row 12 10 7, .flip 12 7], (7, 12)⟩
      path2 := ⟨(7, 10), [], (7, 10)⟩
      path3 := ⟨(3, 12), [.row 3 12 10], (3, 10)⟩ } },
  { hits := [(4, 6), (4, 9), (12, 6), (12, 11), (15, 9), (15, 11)]
    forwardChoices := [{ center := 4, support := {6, 9} },
        { center := 12, support := {6, 11} },
        { center := 15, support := {9, 11} }]
    reverseChoices := [{ center := 1, support := {5, 7} },
        { center := 4, support := {5, 10} },
        { center := 12, support := {7, 10} }]
    forwardData := {
      firstQuad := ⟨4, 6, 9, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨9, 11, 12, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 2, 1, 3⟩
      path0 := ⟨(4, 6), [.row 4 6 9], (4, 9)⟩
      path1 := ⟨(9, 12), [], (9, 12)⟩
      path2 := ⟨(11, 12), [.flip 11 12, .row 12 11 6, .flip 12 6], (6, 12)⟩
      path3 := ⟨(9, 15), [.flip 9 15, .row 15 9 11, .flip 15 11], (11, 15)⟩ }
    reverseData := {
      firstQuad := ⟨4, 7, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 5, 7⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(4, 7), [], (4, 7)⟩
      path1 := ⟨(10, 12), [.flip 10 12, .row 12 10 7, .flip 12 7], (7, 12)⟩
      path2 := ⟨(4, 5), [.row 4 5 10], (4, 10)⟩
      path3 := ⟨(1, 7), [.row 1 7 5], (1, 5)⟩ } },
  { hits := [(4, 6), (4, 10), (5, 10), (5, 11), (12, 6), (12, 11)]
    forwardChoices := [{ center := 4, support := {6, 10} },
        { center := 5, support := {10, 11} },
        { center := 12, support := {6, 11} }]
    reverseChoices := [{ center := 4, support := {5, 10} },
        { center := 11, support := {5, 6} },
        { center := 12, support := {6, 10} }]
    forwardData := {
      firstQuad := ⟨4, 6, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 10, 11, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 6), [.row 4 6 10], (4, 10)⟩
      path1 := ⟨(10, 12), [], (10, 12)⟩
      path2 := ⟨(5, 10), [.row 5 10 11], (5, 11)⟩
      path3 := ⟨(11, 12), [.flip 11 12, .row 12 11 6, .flip 12 6], (6, 12)⟩ }
    reverseData := {
      firstQuad := ⟨4, 5, 10, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 6, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 5), [.row 4 5 10], (4, 10)⟩
      path1 := ⟨(10, 12), [.flip 10 12, .row 12 10 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(6, 11), [.flip 6 11, .row 11 6 5, .flip 11 5], (5, 11)⟩
      path3 := ⟨(5, 12), [], (5, 12)⟩ } },
  { hits := [(4, 9), (4, 10), (5, 10), (5, 11), (15, 9), (15, 11)]
    forwardChoices := [{ center := 4, support := {9, 10} },
        { center := 5, support := {10, 11} },
        { center := 15, support := {9, 11} }]
    reverseChoices := [{ center := 1, support := {5, 7} },
        { center := 11, support := {5, 6} },
        { center := 12, support := {6, 7} }]
    forwardData := {
      firstQuad := ⟨4, 9, 10, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 10, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(4, 9), [.row 4 9 10], (4, 10)⟩
      path1 := ⟨(10, 15), [], (10, 15)⟩
      path2 := ⟨(5, 10), [.row 5 10 11], (5, 11)⟩
      path3 := ⟨(11, 15), [.flip 11 15, .row 15 11 9, .flip 15 9], (9, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 5, 7, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 6, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 5), [.row 1 5 7], (1, 7)⟩
      path1 := ⟨(7, 12), [.flip 7 12, .row 12 7 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(6, 11), [.flip 6 11, .row 11 6 5, .flip 11 5], (5, 11)⟩
      path3 := ⟨(5, 12), [], (5, 12)⟩ } },
  { hits := [(5, 11), (5, 14), (6, 11), (6, 13), (9, 13), (9, 14)]
    forwardChoices := [{ center := 5, support := {11, 14} },
        { center := 6, support := {11, 13} },
        { center := 9, support := {13, 14} }]
    reverseChoices := [{ center := 7, support := {2, 3} },
        { center := 10, support := {3, 5} },
        { center := 11, support := {2, 5} }]
    forwardData := {
      firstQuad := ⟨5, 6, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 9, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(6, 11), [.row 6 11 13], (6, 13)⟩
      path1 := ⟨(5, 13), [], (5, 13)⟩
      path2 := ⟨(9, 13), [.row 9 13 14], (9, 14)⟩
      path3 := ⟨(5, 14), [.row 5 14 11], (5, 11)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 7, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(5, 10), [.flip 5 10, .row 10 5 3, .flip 10 3], (3, 10)⟩
      path1 := ⟨(2, 11), [.flip 2 11, .row 11 2 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(3, 7), [.flip 3 7, .row 7 3 2, .flip 7 2], (2, 7)⟩
      path3 := ⟨(2, 10), [], (2, 10)⟩ } },
  { hits := [(6, 1), (6, 11), (8, 11), (8, 15), (10, 1), (10, 15)]
    forwardChoices := [{ center := 6, support := {1, 11} },
        { center := 8, support := {11, 15} },
        { center := 10, support := {1, 15} }]
    reverseChoices := [{ center := 6, support := {1, 15} },
        { center := 8, support := {1, 5} },
        { center := 10, support := {5, 15} }]
    forwardData := {
      firstQuad := ⟨1, 6, 8, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 8, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 11], (6, 11)⟩
      path1 := ⟨(8, 11), [.row 8 11 15], (8, 15)⟩
      path2 := ⟨(1, 8), [], (1, 8)⟩
      path3 := ⟨(10, 15), [.row 10 15 1, .flip 10 1], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 10, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 5, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 15], (6, 15)⟩
      path1 := ⟨(10, 15), [.row 10 15 5, .flip 10 5], (5, 10)⟩
      path2 := ⟨(5, 8), [.flip 5 8, .row 8 5 1, .flip 8 1], (1, 8)⟩
      path3 := ⟨(1, 10), [], (1, 10)⟩ } },
  { hits := [(6, 1), (6, 13), (7, 13), (7, 15), (10, 1), (10, 15)]
    forwardChoices := [{ center := 6, support := {1, 13} },
        { center := 7, support := {13, 15} },
        { center := 10, support := {1, 15} }]
    reverseChoices := [{ center := 6, support := {1, 15} },
        { center := 9, support := {1, 3} },
        { center := 10, support := {3, 15} }]
    forwardData := {
      firstQuad := ⟨1, 6, 7, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 7, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 13], (6, 13)⟩
      path1 := ⟨(7, 13), [.row 7 13 15], (7, 15)⟩
      path2 := ⟨(1, 7), [], (1, 7)⟩
      path3 := ⟨(10, 15), [.row 10 15 1, .flip 10 1], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 10, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 15], (6, 15)⟩
      path1 := ⟨(10, 15), [.row 10 15 3, .flip 10 3], (3, 10)⟩
      path2 := ⟨(3, 9), [.flip 3 9, .row 9 3 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 10), [], (1, 10)⟩ } },
  { hits := [(6, 11), (6, 13), (7, 9), (7, 13), (15, 9), (15, 11)]
    forwardChoices := [{ center := 6, support := {11, 13} },
        { center := 7, support := {9, 13} },
        { center := 15, support := {9, 11} }]
    reverseChoices := [{ center := 1, support := {5, 7} },
        { center := 9, support := {3, 7} },
        { center := 10, support := {3, 5} }]
    forwardData := {
      firstQuad := ⟨6, 7, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 9, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(7, 11), [], (7, 11)⟩
      path1 := ⟨(6, 13), [.row 6 13 11], (6, 11)⟩
      path2 := ⟨(7, 9), [.row 7 9 13], (7, 13)⟩
      path3 := ⟨(11, 15), [.flip 11 15, .row 15 11 9, .flip 15 9], (9, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 5, 7, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 7, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 5), [.row 1 5 7], (1, 7)⟩
      path1 := ⟨(7, 10), [], (7, 10)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(3, 10), [.flip 3 10, .row 10 3 5, .flip 10 5], (5, 10)⟩ } },
  { hits := [(6, 11), (6, 13), (7, 13), (7, 15), (8, 11), (8, 15)]
    forwardChoices := [{ center := 6, support := {11, 13} },
        { center := 7, support := {13, 15} },
        { center := 8, support := {11, 15} }]
    reverseChoices := [{ center := 8, support := {1, 5} },
        { center := 9, support := {1, 3} },
        { center := 10, support := {3, 5} }]
    forwardData := {
      firstQuad := ⟨7, 8, 11, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨6, 7, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(8, 11), [.row 8 11 15], (8, 15)⟩
      path1 := ⟨(7, 15), [.row 7 15 13], (7, 13)⟩
      path2 := ⟨(7, 11), [], (7, 11)⟩
      path3 := ⟨(6, 13), [.row 6 13 11], (6, 11)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 8, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 8, 10⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(3, 8), [], (3, 8)⟩
      path1 := ⟨(1, 9), [.flip 1 9, .row 9 1 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(5, 8), [.flip 5 8, .row 8 5 1, .flip 8 1], (1, 8)⟩
      path3 := ⟨(3, 10), [.flip 3 10, .row 10 3 5, .flip 10 5], (5, 10)⟩ } },
  { hits := [(7, 4), (7, 13), (9, 3), (9, 13), (11, 3), (11, 4)]
    forwardChoices := [{ center := 7, support := {4, 13} },
        { center := 9, support := {3, 13} },
        { center := 11, support := {3, 4} }]
    reverseChoices := [{ center := 5, support := {12, 13} },
        { center := 7, support := {3, 13} },
        { center := 9, support := {3, 12} }]
    forwardData := {
      firstQuad := ⟨3, 4, 7, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 7, 9, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 1, 0, 2⟩
      path0 := ⟨(4, 7), [.flip 4 7, .row 7 4 13], (7, 13)⟩
      path1 := ⟨(3, 11), [.flip 3 11, .row 11 3 4, .flip 11 4], (4, 11)⟩
      path2 := ⟨(3, 7), [], (3, 7)⟩
      path3 := ⟨(9, 13), [.row 9 13 3, .flip 9 3], (3, 9)⟩ }
    reverseData := {
      firstQuad := ⟨3, 7, 9, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 9, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(3, 7), [.flip 3 7, .row 7 3 13], (7, 13)⟩
      path1 := ⟨(9, 13), [], (9, 13)⟩
      path2 := ⟨(9, 12), [.row 9 12 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(5, 13), [.row 5 13 12], (5, 12)⟩ } },
  { hits := [(7, 4), (7, 15), (10, 3), (10, 15), (11, 3), (11, 4)]
    forwardChoices := [{ center := 7, support := {4, 15} },
        { center := 10, support := {3, 15} },
        { center := 11, support := {3, 4} }]
    reverseChoices := [{ center := 5, support := {12, 13} },
        { center := 6, support := {1, 13} },
        { center := 9, support := {1, 12} }]
    forwardData := {
      firstQuad := ⟨3, 4, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 7, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(4, 10), [], (4, 10)⟩
      path1 := ⟨(3, 11), [.flip 3 11, .row 11 3 4, .flip 11 4], (4, 11)⟩
      path2 := ⟨(4, 7), [.flip 4 7, .row 7 4 15], (7, 15)⟩
      path3 := ⟨(10, 15), [.row 10 15 3, .flip 10 3], (3, 10)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 9, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 9, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 13], (6, 13)⟩
      path1 := ⟨(9, 13), [], (9, 13)⟩
      path2 := ⟨(9, 12), [.row 9 12 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(5, 13), [.row 5 13 12], (5, 12)⟩ } },
  { hits := [(7, 9), (7, 13), (9, 3), (9, 13), (15, 3), (15, 9)]
    forwardChoices := [{ center := 7, support := {9, 13} },
        { center := 9, support := {3, 13} },
        { center := 15, support := {3, 9} }]
    reverseChoices := [{ center := 1, support := {7, 13} },
        { center := 7, support := {3, 13} },
        { center := 9, support := {3, 7} }]
    forwardData := {
      firstQuad := ⟨3, 7, 9, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 9, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(7, 9), [.row 7 9 13], (7, 13)⟩
      path1 := ⟨(3, 13), [], (3, 13)⟩
      path2 := ⟨(9, 13), [.row 9 13 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(3, 15), [.flip 3 15, .row 15 3 9, .flip 15 9], (9, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 7, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 7, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 2, 1, 0⟩
      path0 := ⟨(3, 7), [.flip 3 7, .row 7 3 13], (7, 13)⟩
      path1 := ⟨(1, 9), [], (1, 9)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(1, 13), [.row 1 13 7], (1, 7)⟩ } },
  { hits := [(7, 9), (7, 15), (10, 3), (10, 15), (15, 3), (15, 9)]
    forwardChoices := [{ center := 7, support := {9, 15} },
        { center := 10, support := {3, 15} },
        { center := 15, support := {3, 9} }]
    reverseChoices := [{ center := 1, support := {7, 13} },
        { center := 6, support := {1, 13} },
        { center := 9, support := {1, 7} }]
    forwardData := {
      firstQuad := ⟨3, 7, 10, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 9, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 3, 1, 0⟩
      path0 := ⟨(7, 10), [], (7, 10)⟩
      path1 := ⟨(3, 15), [.flip 3 15, .row 15 3 9, .flip 15 9], (9, 15)⟩
      path2 := ⟨(7, 9), [.row 7 9 15], (7, 15)⟩
      path3 := ⟨(10, 15), [.row 10 15 3, .flip 10 3], (3, 10)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 7, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 7, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 13], (6, 13)⟩
      path1 := ⟨(7, 13), [], (7, 13)⟩
      path2 := ⟨(7, 9), [.flip 7 9, .row 9 7 1, .flip 9 1], (1, 9)⟩
      path3 := ⟨(1, 13), [.row 1 13 7], (1, 7)⟩ } },
  { hits := [(7, 13), (7, 15), (9, 13), (9, 14), (12, 14), (12, 15)]
    forwardChoices := [{ center := 7, support := {13, 15} },
        { center := 9, support := {13, 14} },
        { center := 12, support := {14, 15} }]
    reverseChoices := [{ center := 4, support := {1, 2} },
        { center := 7, support := {2, 3} },
        { center := 9, support := {1, 3} }]
    forwardData := {
      firstQuad := ⟨7, 9, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 12, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(9, 13), [.row 9 13 14], (9, 14)⟩
      path1 := ⟨(7, 14), [], (7, 14)⟩
      path2 := ⟨(12, 14), [.row 12 14 15], (12, 15)⟩
      path3 := ⟨(7, 15), [.row 7 15 13], (7, 13)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 7, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 2, 4, 7⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(3, 7), [.flip 3 7, .row 7 3 2, .flip 7 2], (2, 7)⟩
      path1 := ⟨(1, 9), [.flip 1 9, .row 9 1 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(2, 4), [.flip 2 4, .row 4 2 1, .flip 4 1], (1, 4)⟩
      path3 := ⟨(1, 7), [], (1, 7)⟩ } },
  { hits := [(8, 7), (8, 15), (10, 3), (10, 15), (11, 3), (11, 7)]
    forwardChoices := [{ center := 8, support := {7, 15} },
        { center := 10, support := {3, 15} },
        { center := 11, support := {3, 7} }]
    reverseChoices := [{ center := 5, support := {9, 13} },
        { center := 6, support := {1, 13} },
        { center := 8, support := {1, 9} }]
    forwardData := {
      firstQuad := ⟨3, 7, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 8, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(7, 10), [], (7, 10)⟩
      path1 := ⟨(3, 11), [.flip 3 11, .row 11 3 7, .flip 11 7], (7, 11)⟩
      path2 := ⟨(7, 8), [.flip 7 8, .row 8 7 15], (8, 15)⟩
      path3 := ⟨(10, 15), [.row 10 15 3, .flip 10 3], (3, 10)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 8, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 8, 9, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 13], (6, 13)⟩
      path1 := ⟨(8, 13), [], (8, 13)⟩
      path2 := ⟨(8, 9), [.row 8 9 1, .flip 8 1], (1, 8)⟩
      path3 := ⟨(5, 13), [.row 5 13 9], (5, 9)⟩ } },
  { hits := [(9, 3), (9, 8), (10, 1), (10, 3), (16, 1), (16, 8)]
    forwardChoices := [{ center := 9, support := {3, 8} },
        { center := 10, support := {1, 3} },
        { center := 16, support := {1, 8} }]
    reverseChoices := [{ center := 0, support := {8, 15} },
        { center := 6, support := {13, 15} },
        { center := 7, support := {8, 13} }]
    forwardData := {
      firstQuad := ⟨1, 8, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 8, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(8, 10), [], (8, 10)⟩
      path1 := ⟨(1, 16), [.flip 1 16, .row 16 1 8, .flip 16 8], (8, 16)⟩
      path2 := ⟨(8, 9), [.flip 8 9, .row 9 8 3, .flip 9 3], (3, 9)⟩
      path3 := ⟨(3, 10), [.flip 3 10, .row 10 3 1, .flip 10 1], (1, 10)⟩ }
    reverseData := {
      firstQuad := ⟨0, 7, 8, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 6, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(7, 8), [.row 7 8 13], (7, 13)⟩
      path1 := ⟨(0, 13), [], (0, 13)⟩
      path2 := ⟨(6, 13), [.row 6 13 15], (6, 15)⟩
      path3 := ⟨(0, 15), [.row 0 15 8], (0, 8)⟩ } },
  { hits := [(9, 3), (9, 14), (10, 3), (10, 15), (12, 14), (12, 15)]
    forwardChoices := [{ center := 9, support := {3, 14} },
        { center := 10, support := {3, 15} },
        { center := 12, support := {14, 15} }]
    reverseChoices := [{ center := 4, support := {1, 2} },
        { center := 6, support := {1, 13} },
        { center := 7, support := {2, 13} }]
    forwardData := {
      firstQuad := ⟨3, 9, 10, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨10, 12, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(3, 9), [.flip 3 9, .row 9 3 14], (9, 14)⟩
      path1 := ⟨(10, 14), [], (10, 14)⟩
      path2 := ⟨(12, 14), [.row 12 14 15], (12, 15)⟩
      path3 := ⟨(10, 15), [.row 10 15 3, .flip 10 3], (3, 10)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 7, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 2, 4, 7⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 13], (6, 13)⟩
      path1 := ⟨(7, 13), [.row 7 13 2, .flip 7 2], (2, 7)⟩
      path2 := ⟨(2, 4), [.flip 2 4, .row 4 2 1, .flip 4 1], (1, 4)⟩
      path3 := ⟨(1, 7), [], (1, 7)⟩ } },
  { hits := [(10, 1), (10, 3), (15, 3), (15, 9), (16, 1), (16, 9)]
    forwardChoices := [{ center := 10, support := {1, 3} },
        { center := 15, support := {3, 9} },
        { center := 16, support := {1, 9} }]
    reverseChoices := [{ center := 0, support := {7, 15} },
        { center := 1, support := {7, 13} },
        { center := 6, support := {13, 15} }]
    forwardData := {
      firstQuad := ⟨1, 9, 15, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 3, 10, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(9, 15), [.flip 9 15, .row 15 9 3, .flip 15 3], (3, 15)⟩
      path1 := ⟨(1, 16), [.flip 1 16, .row 16 1 9, .flip 16 9], (9, 16)⟩
      path2 := ⟨(3, 10), [.flip 3 10, .row 10 3 1, .flip 10 1], (1, 10)⟩
      path3 := ⟨(1, 15), [], (1, 15)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 7, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 6, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 7), [.row 1 7 13], (1, 13)⟩
      path1 := ⟨(0, 13), [], (0, 13)⟩
      path2 := ⟨(6, 13), [.row 6 13 15], (6, 15)⟩
      path3 := ⟨(0, 15), [.row 0 15 7], (0, 7)⟩ } },
  { hits := [(10, 1), (10, 5), (13, 5), (13, 6), (14, 1), (14, 6)]
    forwardChoices := [{ center := 10, support := {1, 5} },
        { center := 13, support := {5, 6} },
        { center := 14, support := {1, 6} }]
    reverseChoices := [{ center := 2, support := {10, 15} },
        { center := 3, support := {10, 11} },
        { center := 6, support := {11, 15} }]
    forwardData := {
      firstQuad := ⟨1, 6, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 5, 10, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(6, 13), [.flip 6 13, .row 13 6 5, .flip 13 5], (5, 13)⟩
      path1 := ⟨(1, 14), [.flip 1 14, .row 14 1 6, .flip 14 6], (6, 14)⟩
      path2 := ⟨(5, 10), [.flip 5 10, .row 10 5 1, .flip 10 1], (1, 10)⟩
      path3 := ⟨(1, 13), [], (1, 13)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 6, 11, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(3, 10), [.row 3 10 11], (3, 11)⟩
      path1 := ⟨(2, 11), [], (2, 11)⟩
      path2 := ⟨(6, 11), [.row 6 11 15], (6, 15)⟩
      path3 := ⟨(2, 15), [.row 2 15 10], (2, 10)⟩ } },
  { hits := [(10, 3), (10, 5), (11, 3), (11, 4), (13, 4), (13, 5)]
    forwardChoices := [{ center := 10, support := {3, 5} },
        { center := 11, support := {3, 4} },
        { center := 13, support := {4, 5} }]
    reverseChoices := [{ center := 3, support := {11, 12} },
        { center := 5, support := {12, 13} },
        { center := 6, support := {11, 13} }]
    forwardData := {
      firstQuad := ⟨3, 4, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 10, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(4, 10), [], (4, 10)⟩
      path1 := ⟨(3, 11), [.flip 3 11, .row 11 3 4, .flip 11 4], (4, 11)⟩
      path2 := ⟨(5, 10), [.flip 5 10, .row 10 5 3, .flip 10 3], (3, 10)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨5, 6, 11, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(6, 11), [.row 6 11 13], (6, 13)⟩
      path1 := ⟨(5, 13), [.row 5 13 12], (5, 12)⟩
      path2 := ⟨(5, 11), [], (5, 11)⟩
      path3 := ⟨(3, 12), [.row 3 12 11], (3, 11)⟩ } },
  { hits := [(11, 0), (11, 4), (13, 4), (13, 6), (14, 0), (14, 6)]
    forwardChoices := [{ center := 11, support := {0, 4} },
        { center := 13, support := {4, 6} },
        { center := 14, support := {0, 6} }]
    reverseChoices := [{ center := 2, support := {10, 16} },
        { center := 3, support := {10, 12} },
        { center := 5, support := {12, 16} }]
    forwardData := {
      firstQuad := ⟨0, 6, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 4, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(6, 13), [.flip 6 13, .row 13 6 4, .flip 13 4], (4, 13)⟩
      path1 := ⟨(0, 14), [.flip 0 14, .row 14 0 6, .flip 14 6], (6, 14)⟩
      path2 := ⟨(4, 11), [.flip 4 11, .row 11 4 0, .flip 11 0], (0, 11)⟩
      path3 := ⟨(0, 13), [], (0, 13)⟩ }
    reverseData := {
      firstQuad := ⟨2, 3, 10, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 5, 12, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(3, 10), [.row 3 10 12], (3, 12)⟩
      path1 := ⟨(2, 12), [], (2, 12)⟩
      path2 := ⟨(5, 12), [.row 5 12 16], (5, 16)⟩
      path3 := ⟨(2, 16), [.row 2 16 10], (2, 10)⟩ } },
  { hits := [(12, 6), (12, 11), (13, 6), (13, 16), (15, 11), (15, 16)]
    forwardChoices := [{ center := 12, support := {6, 11} },
        { center := 13, support := {6, 16} },
        { center := 15, support := {11, 16} }]
    reverseChoices := [{ center := 1, support := {0, 5} },
        { center := 3, support := {0, 10} },
        { center := 4, support := {5, 10} }]
    forwardData := {
      firstQuad := ⟨11, 13, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 11, 12, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(11, 13), [], (11, 13)⟩
      path1 := ⟨(15, 16), [.row 15 16 11, .flip 15 11], (11, 15)⟩
      path2 := ⟨(11, 12), [.flip 11 12, .row 12 11 6, .flip 12 6], (6, 12)⟩
      path3 := ⟨(6, 13), [.flip 6 13, .row 13 6 16], (13, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 3, 5⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 5, 10⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1, .row 1 0 5], (1, 5)⟩
      path1 := ⟨(3, 5), [], (3, 5)⟩
      path2 := ⟨(4, 5), [.row 4 5 10], (4, 10)⟩
      path3 := ⟨(3, 10), [.row 3 10 0, .flip 3 0], (0, 3)⟩ } },
  { hits := [(1, 4), (1, 13), (6, 1), (6, 13), (13, 4), (13, 6), (14, 1), (14, 6)]
    forwardChoices := [{ center := 1, support := {4, 13} },
        { center := 6, support := {1, 13} },
        { center := 13, support := {4, 6} },
        { center := 14, support := {1, 6} }]
    reverseChoices := [{ center := 2, support := {10, 15} },
        { center := 3, support := {10, 12} },
        { center := 10, support := {3, 15} },
        { center := 15, support := {3, 12} }]
    forwardData := {
      firstQuad := ⟨1, 6, 13, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 6, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(6, 13), [.row 6 13 1, .flip 6 1], (1, 6)⟩
      path1 := ⟨(1, 14), [.flip 1 14, .row 14 1 6, .flip 14 6], (6, 14)⟩
      path2 := ⟨(1, 4), [.row 1 4 13], (1, 13)⟩
      path3 := ⟨(6, 13), [.flip 6 13, .row 13 6 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 10, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 3, 10, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(3, 10), [.flip 3 10, .row 10 3 15], (10, 15)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 3, .flip 15 3], (3, 15)⟩
      path2 := ⟨(3, 10), [.row 3 10 12], (3, 12)⟩
      path3 := ⟨(2, 15), [.row 2 15 10], (2, 10)⟩ } },
  { hits := [(1, 10), (1, 13), (4, 6), (4, 10), (6, 1), (6, 13), (14, 1), (14, 6)]
    forwardChoices := [{ center := 1, support := {10, 13} },
        { center := 4, support := {6, 10} },
        { center := 6, support := {1, 13} },
        { center := 14, support := {1, 6} }]
    reverseChoices := [{ center := 2, support := {10, 15} },
        { center := 10, support := {3, 15} },
        { center := 12, support := {6, 10} },
        { center := 15, support := {3, 6} }]
    forwardData := {
      firstQuad := ⟨1, 4, 6, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 6, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(4, 6), [.row 4 6 10], (4, 10)⟩
      path1 := ⟨(1, 10), [.row 1 10 13], (1, 13)⟩
      path2 := ⟨(6, 13), [.row 6 13 1, .flip 6 1], (1, 6)⟩
      path3 := ⟨(1, 14), [.flip 1 14, .row 14 1 6, .flip 14 6], (6, 14)⟩ }
    reverseData := {
      firstQuad := ⟨6, 10, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 10, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(10, 12), [.flip 10 12, .row 12 10 6, .flip 12 6], (6, 12)⟩
      path1 := ⟨(6, 15), [.flip 6 15, .row 15 6 3, .flip 15 3], (3, 15)⟩
      path2 := ⟨(3, 10), [.flip 3 10, .row 10 3 15], (10, 15)⟩
      path3 := ⟨(2, 15), [.row 2 15 10], (2, 10)⟩ } },
  { hits := [(1, 12), (1, 13), (2, 6), (2, 12), (6, 1), (6, 13), (14, 1), (14, 6)]
    forwardChoices := [{ center := 1, support := {12, 13} },
        { center := 2, support := {6, 12} },
        { center := 6, support := {1, 13} },
        { center := 14, support := {1, 6} }]
    reverseChoices := [{ center := 2, support := {10, 15} },
        { center := 10, support := {3, 15} },
        { center := 14, support := {4, 10} },
        { center := 15, support := {3, 4} }]
    forwardData := {
      firstQuad := ⟨1, 2, 6, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 6, 13, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(2, 6), [.row 2 6 12], (2, 12)⟩
      path1 := ⟨(1, 12), [.row 1 12 13], (1, 13)⟩
      path2 := ⟨(6, 13), [.row 6 13 1, .flip 6 1], (1, 6)⟩
      path3 := ⟨(1, 14), [.flip 1 14, .row 14 1 6, .flip 14 6], (6, 14)⟩ }
    reverseData := {
      firstQuad := ⟨4, 10, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 10, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(10, 14), [.flip 10 14, .row 14 10 4, .flip 14 4], (4, 14)⟩
      path1 := ⟨(4, 15), [.flip 4 15, .row 15 4 3, .flip 15 3], (3, 15)⟩
      path2 := ⟨(3, 10), [.flip 3 10, .row 10 3 15], (10, 15)⟩
      path3 := ⟨(2, 15), [.row 2 15 10], (2, 10)⟩ } },
  { hits := [(2, 6), (2, 14), (3, 2), (3, 16), (5, 14), (5, 16), (14, 2), (14, 6)]
    forwardChoices := [{ center := 2, support := {6, 14} },
        { center := 3, support := {2, 16} },
        { center := 5, support := {14, 16} },
        { center := 14, support := {2, 6} }]
    reverseChoices := [{ center := 2, support := {10, 14} },
        { center := 11, support := {0, 2} },
        { center := 13, support := {0, 14} },
        { center := 14, support := {2, 10} }]
    forwardData := {
      firstQuad := ⟨2, 3, 5, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 5, 6, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 3), [.flip 2 3, .row 3 2 16], (3, 16)⟩
      path1 := ⟨(5, 16), [.row 5 16 14], (5, 14)⟩
      path2 := ⟨(2, 5), [], (2, 5)⟩
      path3 := ⟨(6, 14), [.flip 6 14, .row 14 6 2, .flip 14 2, .row 2 14 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨2, 10, 11, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 11, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 10), [.row 2 10 14, .flip 2 14, .row 14 2 10, .flip 14 10], (10, 14)⟩
      path1 := ⟨(11, 14), [], (11, 14)⟩
      path2 := ⟨(0, 11), [.flip 0 11, .row 11 0 2, .flip 11 2], (2, 11)⟩
      path3 := ⟨(13, 14), [.row 13 14 0, .flip 13 0], (0, 13)⟩ } },
  { hits := [(2, 6), (2, 14), (4, 2), (4, 10), (5, 10), (5, 14), (14, 2), (14, 6)]
    forwardChoices := [{ center := 2, support := {6, 14} },
        { center := 4, support := {2, 10} },
        { center := 5, support := {10, 14} },
        { center := 14, support := {2, 6} }]
    reverseChoices := [{ center := 2, support := {10, 14} },
        { center := 11, support := {2, 6} },
        { center := 12, support := {6, 14} },
        { center := 14, support := {2, 10} }]
    forwardData := {
      firstQuad := ⟨2, 4, 5, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 5, 6, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 10], (4, 10)⟩
      path1 := ⟨(5, 10), [.row 5 10 14], (5, 14)⟩
      path2 := ⟨(2, 5), [], (2, 5)⟩
      path3 := ⟨(6, 14), [.flip 6 14, .row 14 6 2, .flip 14 2, .row 2 14 6], (2, 6)⟩ }
    reverseData := {
      firstQuad := ⟨2, 10, 11, 14⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 11, 12, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 10), [.row 2 10 14, .flip 2 14, .row 14 2 10, .flip 14 10], (10, 14)⟩
      path1 := ⟨(11, 14), [], (11, 14)⟩
      path2 := ⟨(6, 11), [.flip 6 11, .row 11 6 2, .flip 11 2], (2, 11)⟩
      path3 := ⟨(12, 14), [.row 12 14 6, .flip 12 6], (6, 12)⟩ } },
  { hits := [(2, 6), (2, 14), (5, 11), (5, 14), (6, 1), (6, 11), (14, 1), (14, 6)]
    forwardChoices := [{ center := 2, support := {6, 14} },
        { center := 5, support := {11, 14} },
        { center := 6, support := {1, 11} },
        { center := 14, support := {1, 6} }]
    reverseChoices := [{ center := 2, support := {10, 15} },
        { center := 10, support := {5, 15} },
        { center := 11, support := {2, 5} },
        { center := 14, support := {2, 10} }]
    forwardData := {
      firstQuad := ⟨1, 2, 6, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 6, 11, 14⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(2, 6), [.row 2 6 14], (2, 14)⟩
      path1 := ⟨(1, 14), [.flip 1 14, .row 14 1 6, .flip 14 6], (6, 14)⟩
      path2 := ⟨(6, 11), [.row 6 11 1, .flip 6 1], (1, 6)⟩
      path3 := ⟨(5, 14), [.row 5 14 11], (5, 11)⟩ }
    reverseData := {
      firstQuad := ⟨2, 5, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 10, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(5, 10), [.flip 5 10, .row 10 5 15], (10, 15)⟩
      path1 := ⟨(2, 11), [.flip 2 11, .row 11 2 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(10, 14), [.flip 10 14, .row 14 10 2, .flip 14 2], (2, 14)⟩
      path3 := ⟨(2, 15), [.row 2 15 10], (2, 10)⟩ } },
  { hits := [(3, 2), (3, 15), (4, 2), (4, 9), (10, 3), (10, 15), (15, 3), (15, 9)]
    forwardChoices := [{ center := 3, support := {2, 15} },
        { center := 4, support := {2, 9} },
        { center := 10, support := {3, 15} },
        { center := 15, support := {3, 9} }]
    reverseChoices := [{ center := 1, support := {7, 13} },
        { center := 6, support := {1, 13} },
        { center := 12, support := {7, 14} },
        { center := 13, support := {1, 14} }]
    forwardData := {
      firstQuad := ⟨3, 9, 10, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨2, 3, 4, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(3, 9), [], (3, 9)⟩
      path1 := ⟨(10, 15), [.row 10 15 3, .flip 10 3], (3, 10)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15, .flip 3 15, .row 15 3 9, .flip 15 9], (9, 15)⟩
      path3 := ⟨(4, 9), [.row 4 9 2, .flip 4 2], (2, 4)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 7, 13⟩
      firstForm := .adjacentSides
      secondQuad := ⟨7, 12, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 13], (6, 13)⟩
      path1 := ⟨(7, 13), [], (7, 13)⟩
      path2 := ⟨(7, 12), [.flip 7 12, .row 12 7 14], (12, 14)⟩
      path3 := ⟨(13, 14), [.row 13 14 1, .flip 13 1, .row 1 13 7], (1, 7)⟩ } },
  { hits := [(6, 7), (6, 11), (7, 4), (7, 9), (11, 4), (11, 7), (15, 9), (15, 11)]
    forwardChoices := [{ center := 6, support := {7, 11} },
        { center := 7, support := {4, 9} },
        { center := 11, support := {4, 7} },
        { center := 15, support := {9, 11} }]
    reverseChoices := [{ center := 1, support := {5, 7} },
        { center := 5, support := {9, 12} },
        { center := 9, support := {7, 12} },
        { center := 10, support := {5, 9} }]
    forwardData := {
      firstQuad := ⟨4, 6, 7, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 9, 11, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(6, 7), [.row 6 7 11], (6, 11)⟩
      path1 := ⟨(4, 11), [.flip 4 11, .row 11 4 7, .flip 11 7], (7, 11)⟩
      path2 := ⟨(7, 9), [.row 7 9 4, .flip 7 4], (4, 7)⟩
      path3 := ⟨(11, 15), [.flip 11 15, .row 15 11 9, .flip 15 9], (9, 15)⟩ }
    reverseData := {
      firstQuad := ⟨1, 5, 7, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 9, 10, 12⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(1, 5), [.row 1 5 7], (1, 7)⟩
      path1 := ⟨(7, 9), [.flip 7 9, .row 9 7 12], (9, 12)⟩
      path2 := ⟨(9, 10), [.flip 9 10, .row 10 9 5, .flip 10 5], (5, 10)⟩
      path3 := ⟨(5, 12), [.row 5 12 9], (5, 9)⟩ } },
  { hits := [(6, 7), (6, 11), (7, 4), (7, 15), (8, 11), (8, 15), (11, 4), (11, 7)]
    forwardChoices := [{ center := 6, support := {7, 11} },
        { center := 7, support := {4, 15} },
        { center := 8, support := {11, 15} },
        { center := 11, support := {4, 7} }]
    reverseChoices := [{ center := 5, support := {9, 12} },
        { center := 8, support := {1, 5} },
        { center := 9, support := {1, 12} },
        { center := 10, support := {5, 9} }]
    forwardData := {
      firstQuad := ⟨4, 6, 7, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 8, 11, 15⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(6, 7), [.row 6 7 11], (6, 11)⟩
      path1 := ⟨(4, 11), [.flip 4 11, .row 11 4 7, .flip 11 7], (7, 11)⟩
      path2 := ⟨(8, 11), [.row 8 11 15], (8, 15)⟩
      path3 := ⟨(7, 15), [.row 7 15 4, .flip 7 4], (4, 7)⟩ }
    reverseData := {
      firstQuad := ⟨5, 9, 10, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 5, 8, 9⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(9, 10), [.flip 9 10, .row 10 9 5, .flip 10 5], (5, 10)⟩
      path1 := ⟨(5, 12), [.row 5 12 9], (5, 9)⟩
      path2 := ⟨(5, 8), [.flip 5 8, .row 8 5 1, .flip 8 1], (1, 8)⟩
      path3 := ⟨(1, 9), [.flip 1 9, .row 9 1 12], (9, 12)⟩ } },
  { hits := [(0, 2), (0, 14), (2, 1), (2, 14), (10, 1), (10, 3), (11, 0), (11, 3), (14, 0), (14, 2)]
    forwardChoices := [{ center := 0, support := {2, 14} },
        { center := 2, support := {1, 14} },
        { center := 10, support := {1, 3} },
        { center := 11, support := {0, 3} },
        { center := 14, support := {0, 2} }]
    reverseChoices := [{ center := 2, support := {14, 16} },
        { center := 5, support := {13, 16} },
        { center := 6, support := {13, 15} },
        { center := 14, support := {2, 15} },
        { center := 16, support := {2, 14} }]
    forwardData := {
      firstQuad := ⟨0, 3, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 1, 2, 10⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(3, 10), [.flip 3 10, .row 10 3 1, .flip 10 1], (1, 10)⟩
      path1 := ⟨(0, 11), [.flip 0 11, .row 11 0 3, .flip 11 3], (3, 11)⟩
      path2 := ⟨(1, 2), [.flip 1 2, .row 2 1 14, .flip 2 14, .row 14 2 0, .flip 14 0, .row 0 14 2], (0, 2)⟩
      path3 := ⟨(0, 10), [], (0, 10)⟩ }
    reverseData := {
      firstQuad := ⟨5, 6, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 14, 15, 16⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(6, 13), [.row 6 13 15], (6, 15)⟩
      path1 := ⟨(5, 15), [], (5, 15)⟩
      path2 := ⟨(14, 15), [.row 14 15 2, .flip 14 2, .row 2 14 16, .flip 2 16, .row 16 2 14, .flip 16 14], (14, 16)⟩
      path3 := ⟨(5, 16), [.row 5 16 13], (5, 13)⟩ } },
  { hits := [(1, 4), (1, 10), (2, 1), (2, 6), (4, 6), (4, 10), (7, 4), (7, 15), (10, 1), (10, 15)]
    forwardChoices := [{ center := 1, support := {4, 10} },
        { center := 2, support := {1, 6} },
        { center := 4, support := {6, 10} },
        { center := 7, support := {4, 15} },
        { center := 10, support := {1, 15} }]
    reverseChoices := [{ center := 6, support := {1, 15} },
        { center := 9, support := {1, 12} },
        { center := 12, support := {6, 10} },
        { center := 14, support := {10, 15} },
        { center := 15, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨1, 2, 4, 6⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 7, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 6], (2, 6)⟩
      path1 := ⟨(4, 6), [.row 4 6 10], (4, 10)⟩
      path2 := ⟨(4, 7), [.flip 4 7, .row 7 4 15], (7, 15)⟩
      path3 := ⟨(10, 15), [.row 10 15 1, .flip 10 1, .row 1 10 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨10, 12, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 6, 9, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(10, 12), [.flip 10 12, .row 12 10 6, .flip 12 6], (6, 12)⟩
      path1 := ⟨(14, 15), [.row 14 15 10, .flip 14 10], (10, 14)⟩
      path2 := ⟨(1, 6), [.flip 1 6, .row 6 1 15, .flip 6 15, .row 15 6 12, .flip 15 12], (12, 15)⟩
      path3 := ⟨(9, 12), [.row 9 12 1, .flip 9 1], (1, 9)⟩ } },
  { hits := [(1, 4), (1, 10), (2, 1), (2, 6), (4, 6), (4, 10), (10, 1), (10, 5), (13, 4), (13, 5)]
    forwardChoices := [{ center := 1, support := {4, 10} },
        { center := 2, support := {1, 6} },
        { center := 4, support := {6, 10} },
        { center := 10, support := {1, 5} },
        { center := 13, support := {4, 5} }]
    reverseChoices := [{ center := 3, support := {11, 12} },
        { center := 6, support := {11, 15} },
        { center := 12, support := {6, 10} },
        { center := 14, support := {10, 15} },
        { center := 15, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨1, 2, 4, 6⟩
      firstForm := .adjacentSides
      secondQuad := ⟨4, 5, 10, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(1, 2), [.flip 1 2, .row 2 1 6], (2, 6)⟩
      path1 := ⟨(4, 6), [.row 4 6 10], (4, 10)⟩
      path2 := ⟨(5, 10), [.flip 5 10, .row 10 5 1, .flip 10 1, .row 1 10 4], (1, 4)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨10, 12, 14, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 6, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(10, 12), [.flip 10 12, .row 12 10 6, .flip 12 6], (6, 12)⟩
      path1 := ⟨(14, 15), [.row 14 15 10, .flip 14 10], (10, 14)⟩
      path2 := ⟨(6, 11), [.row 6 11 15, .flip 6 15, .row 15 6 12, .flip 15 12], (12, 15)⟩
      path3 := ⟨(3, 12), [.row 3 12 11], (3, 11)⟩ } },
  { hits := [(1, 4), (1, 10), (3, 4), (3, 15), (4, 9), (4, 10), (10, 3), (10, 15), (15, 3), (15, 9)]
    forwardChoices := [{ center := 1, support := {4, 10} },
        { center := 3, support := {4, 15} },
        { center := 4, support := {9, 10} },
        { center := 10, support := {3, 15} },
        { center := 15, support := {3, 9} }]
    reverseChoices := [{ center := 1, support := {7, 13} },
        { center := 6, support := {1, 13} },
        { center := 12, support := {6, 7} },
        { center := 13, support := {1, 12} },
        { center := 15, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨4, 9, 10, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 4, 10⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(4, 9), [.row 4 9 10], (4, 10)⟩
      path1 := ⟨(10, 15), [.row 10 15 3, .flip 10 3], (3, 10)⟩
      path2 := ⟨(3, 4), [.row 3 4 15, .flip 3 15, .row 15 3 9, .flip 15 9], (9, 15)⟩
      path3 := ⟨(1, 10), [.row 1 10 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨6, 12, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 6, 7, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1, .row 1 13 7], (1, 7)⟩
      path1 := ⟨(6, 15), [.flip 6 15, .row 15 6 12, .flip 15 12], (12, 15)⟩
      path2 := ⟨(1, 6), [.flip 1 6, .row 6 1 13], (6, 13)⟩
      path3 := ⟨(7, 12), [.flip 7 12, .row 12 7 6, .flip 12 6], (6, 12)⟩ } },
  { hits := [(1, 4), (1, 10), (4, 2), (4, 10), (7, 4), (7, 15), (10, 1), (10, 15), (14, 1), (14, 2)]
    forwardChoices := [{ center := 1, support := {4, 10} },
        { center := 4, support := {2, 10} },
        { center := 7, support := {4, 15} },
        { center := 10, support := {1, 15} },
        { center := 14, support := {1, 2} }]
    reverseChoices := [{ center := 2, support := {14, 15} },
        { center := 6, support := {1, 15} },
        { center := 9, support := {1, 12} },
        { center := 12, support := {6, 14} },
        { center := 15, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨1, 2, 4, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 7, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 10], (4, 10)⟩
      path1 := ⟨(1, 14), [.flip 1 14, .row 14 1 2, .flip 14 2], (2, 14)⟩
      path2 := ⟨(4, 7), [.flip 4 7, .row 7 4 15], (7, 15)⟩
      path3 := ⟨(10, 15), [.row 10 15 1, .flip 10 1, .row 1 10 4], (1, 4)⟩ }
    reverseData := {
      firstQuad := ⟨2, 12, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 6, 9, 12⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(12, 14), [.row 12 14 6, .flip 12 6], (6, 12)⟩
      path1 := ⟨(2, 15), [.row 2 15 14], (2, 14)⟩
      path2 := ⟨(1, 6), [.flip 1 6, .row 6 1 15, .flip 6 15, .row 15 6 12, .flip 15 12], (12, 15)⟩
      path3 := ⟨(9, 12), [.row 9 12 1, .flip 9 1], (1, 9)⟩ } },
  { hits := [(1, 4), (1, 10), (4, 2), (4, 10), (10, 1), (10, 5), (13, 4), (13, 5), (14, 1), (14, 2)]
    forwardChoices := [{ center := 1, support := {4, 10} },
        { center := 4, support := {2, 10} },
        { center := 10, support := {1, 5} },
        { center := 13, support := {4, 5} },
        { center := 14, support := {1, 2} }]
    reverseChoices := [{ center := 2, support := {14, 15} },
        { center := 3, support := {11, 12} },
        { center := 6, support := {11, 15} },
        { center := 12, support := {6, 14} },
        { center := 15, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨1, 2, 4, 14⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 5, 10, 13⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 0, 3⟩
      path0 := ⟨(2, 4), [.flip 2 4, .row 4 2 10], (4, 10)⟩
      path1 := ⟨(1, 14), [.flip 1 14, .row 14 1 2, .flip 14 2], (2, 14)⟩
      path2 := ⟨(5, 10), [.flip 5 10, .row 10 5 1, .flip 10 1, .row 1 10 4], (1, 4)⟩
      path3 := ⟨(4, 13), [.flip 4 13, .row 13 4 5, .flip 13 5], (5, 13)⟩ }
    reverseData := {
      firstQuad := ⟨2, 12, 14, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 6, 11, 12⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(12, 14), [.row 12 14 6, .flip 12 6], (6, 12)⟩
      path1 := ⟨(2, 15), [.row 2 15 14], (2, 14)⟩
      path2 := ⟨(6, 11), [.row 6 11 15, .flip 6 15, .row 15 6 12, .flip 15 12], (12, 15)⟩
      path3 := ⟨(3, 12), [.row 3 12 11], (3, 11)⟩ } },
  { hits := [(1, 4), (1, 10), (5, 10), (5, 11), (6, 1), (6, 11), (10, 1), (10, 3), (11, 3), (11, 4)]
    forwardChoices := [{ center := 1, support := {4, 10} },
        { center := 5, support := {10, 11} },
        { center := 6, support := {1, 11} },
        { center := 10, support := {1, 3} },
        { center := 11, support := {3, 4} }]
    reverseChoices := [{ center := 5, support := {12, 13} },
        { center := 6, support := {13, 15} },
        { center := 10, support := {5, 15} },
        { center := 11, support := {5, 6} },
        { center := 15, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨3, 5, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨1, 4, 6, 11⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 0, 2⟩
      path0 := ⟨(5, 10), [.row 5 10 11], (5, 11)⟩
      path1 := ⟨(3, 11), [.flip 3 11, .row 11 3 4, .flip 11 4], (4, 11)⟩
      path2 := ⟨(1, 4), [.row 1 4 10, .flip 1 10, .row 10 1 3, .flip 10 3], (3, 10)⟩
      path3 := ⟨(6, 11), [.row 6 11 1, .flip 6 1], (1, 6)⟩ }
    reverseData := {
      firstQuad := ⟨5, 10, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨5, 6, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(5, 10), [.flip 5 10, .row 10 5 15], (10, 15)⟩
      path1 := ⟨(12, 15), [.flip 12 15, .row 15 12 6, .flip 15 6, .row 6 15 13], (6, 13)⟩
      path2 := ⟨(6, 11), [.flip 6 11, .row 11 6 5, .flip 11 5], (5, 11)⟩
      path3 := ⟨(5, 13), [.row 5 13 12], (5, 12)⟩ } },
  { hits := [(1, 4), (1, 10), (5, 10), (5, 11), (6, 1), (6, 11), (10, 1), (10, 5), (13, 4), (13, 5)]
    forwardChoices := [{ center := 1, support := {4, 10} },
        { center := 5, support := {10, 11} },
        { center := 6, support := {1, 11} },
        { center := 10, support := {1, 5} },
        { center := 13, support := {4, 5} }]
    reverseChoices := [{ center := 3, support := {11, 12} },
        { center := 6, support := {11, 15} },
        { center := 10, support := {5, 15} },
        { center := 11, support := {5, 6} },
        { center := 15, support := {6, 12} }]
    forwardData := {
      firstQuad := ⟨1, 5, 6, 11⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 4, 5, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 0, 1, 3⟩
      path0 := ⟨(1, 5), [], (1, 5)⟩
      path1 := ⟨(6, 11), [.row 6 11 1, .flip 6 1], (1, 6)⟩
      path2 := ⟨(1, 4), [.row 1 4 10, .flip 1 10, .row 10 1 5, .flip 10 5, .row 5 10 11], (5, 11)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 4, .flip 13 4], (4, 13)⟩ }
    reverseData := {
      firstQuad := ⟨5, 10, 11, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 11, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(5, 10), [.flip 5 10, .row 10 5 15], (10, 15)⟩
      path1 := ⟨(11, 15), [], (11, 15)⟩
      path2 := ⟨(3, 11), [.row 3 11 12], (3, 12)⟩
      path3 := ⟨(12, 15), [.flip 12 15, .row 15 12 6, .flip 15 6, .row 6 15 11, .flip 6 11, .row 11 6 5, .flip 11 5], (5, 11)⟩ } },
  { hits := [(1, 10), (1, 13), (4, 9), (4, 10), (9, 3), (9, 13), (10, 1), (10, 3), (16, 1), (16, 9)]
    forwardChoices := [{ center := 1, support := {10, 13} },
        { center := 4, support := {9, 10} },
        { center := 9, support := {3, 13} },
        { center := 10, support := {1, 3} },
        { center := 16, support := {1, 9} }]
    reverseChoices := [{ center := 0, support := {7, 15} },
        { center := 6, support := {13, 15} },
        { center := 7, support := {3, 13} },
        { center := 12, support := {6, 7} },
        { center := 15, support := {3, 6} }]
    forwardData := {
      firstQuad := ⟨1, 9, 13, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 4, 9, 10⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(9, 13), [.row 9 13 3, .flip 9 3], (3, 9)⟩
      path1 := ⟨(1, 16), [.flip 1 16, .row 16 1 9, .flip 16 9], (9, 16)⟩
      path2 := ⟨(4, 9), [.row 4 9 10], (4, 10)⟩
      path3 := ⟨(3, 10), [.flip 3 10, .row 10 3 1, .flip 10 1, .row 1 10 13], (1, 13)⟩ }
    reverseData := {
      firstQuad := ⟨6, 7, 12, 13⟩
      firstForm := .innerOuter
      secondQuad := ⟨0, 3, 7, 15⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(7, 12), [.flip 7 12, .row 12 7 6, .flip 12 6], (6, 12)⟩
      path1 := ⟨(6, 13), [.row 6 13 15, .flip 6 15, .row 15 6 3, .flip 15 3], (3, 15)⟩
      path2 := ⟨(3, 7), [.flip 3 7, .row 7 3 13], (7, 13)⟩
      path3 := ⟨(0, 15), [.row 0 15 7], (0, 7)⟩ } },
  { hits := [(3, 2), (3, 15), (4, 2), (4, 9), (7, 13), (7, 15), (9, 3), (9, 13), (15, 3), (15, 9)]
    forwardChoices := [{ center := 3, support := {2, 15} },
        { center := 4, support := {2, 9} },
        { center := 7, support := {13, 15} },
        { center := 9, support := {3, 13} },
        { center := 15, support := {3, 9} }]
    reverseChoices := [{ center := 1, support := {7, 13} },
        { center := 7, support := {3, 13} },
        { center := 9, support := {1, 3} },
        { center := 12, support := {7, 14} },
        { center := 13, support := {1, 14} }]
    forwardData := {
      firstQuad := ⟨7, 9, 13, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨2, 3, 4, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(9, 13), [.row 9 13 3, .flip 9 3], (3, 9)⟩
      path1 := ⟨(7, 15), [.row 7 15 13], (7, 13)⟩
      path2 := ⟨(2, 3), [.flip 2 3, .row 3 2 15, .flip 3 15, .row 15 3 9, .flip 15 9], (9, 15)⟩
      path3 := ⟨(4, 9), [.row 4 9 2, .flip 4 2], (2, 4)⟩ }
    reverseData := {
      firstQuad := ⟨1, 3, 7, 9⟩
      firstForm := .innerOuter
      secondQuad := ⟨7, 12, 13, 14⟩
      secondForm := .adjacentSides
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(3, 7), [.flip 3 7, .row 7 3 13], (7, 13)⟩
      path1 := ⟨(1, 9), [.flip 1 9, .row 9 1 3, .flip 9 3], (3, 9)⟩
      path2 := ⟨(7, 12), [.flip 7 12, .row 12 7 14], (12, 14)⟩
      path3 := ⟨(13, 14), [.row 13 14 1, .flip 13 1, .row 1 13 7], (1, 7)⟩ } },
  { hits := [(3, 15), (3, 16), (4, 9), (4, 10), (5, 10), (5, 16), (10, 3), (10, 15), (15, 3), (15, 9)]
    forwardChoices := [{ center := 3, support := {15, 16} },
        { center := 4, support := {9, 10} },
        { center := 5, support := {10, 16} },
        { center := 10, support := {3, 15} },
        { center := 15, support := {3, 9} }]
    reverseChoices := [{ center := 1, support := {7, 13} },
        { center := 6, support := {1, 13} },
        { center := 11, support := {0, 6} },
        { center := 12, support := {6, 7} },
        { center := 13, support := {0, 1} }]
    forwardData := {
      firstQuad := ⟨3, 5, 10, 16⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 9, 10, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 3, 2, 0⟩
      path0 := ⟨(5, 10), [.row 5 10 16], (5, 16)⟩
      path1 := ⟨(3, 16), [.row 3 16 15, .flip 3 15, .row 15 3 9, .flip 15 9], (9, 15)⟩
      path2 := ⟨(4, 9), [.row 4 9 10], (4, 10)⟩
      path3 := ⟨(10, 15), [.row 10 15 3, .flip 10 3], (3, 10)⟩ }
    reverseData := {
      firstQuad := ⟨1, 6, 7, 12⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 6, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨3, 1, 2, 0⟩
      path0 := ⟨(1, 6), [.flip 1 6, .row 6 1 13], (6, 13)⟩
      path1 := ⟨(7, 12), [.flip 7 12, .row 12 7 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(6, 11), [.flip 6 11, .row 11 6 0, .flip 11 0], (0, 11)⟩
      path3 := ⟨(0, 13), [.flip 0 13, .row 13 0 1, .flip 13 1, .row 1 13 7], (1, 7)⟩ } },
  { hits := [(3, 15), (3, 16), (7, 9), (7, 15), (10, 1), (10, 3), (15, 3), (15, 16), (16, 1), (16, 9)]
    forwardChoices := [{ center := 3, support := {15, 16} },
        { center := 7, support := {9, 15} },
        { center := 10, support := {1, 3} },
        { center := 15, support := {3, 16} },
        { center := 16, support := {1, 9} }]
    reverseChoices := [{ center := 0, support := {7, 15} },
        { center := 1, support := {0, 13} },
        { center := 6, support := {13, 15} },
        { center := 9, support := {1, 7} },
        { center := 13, support := {0, 1} }]
    forwardData := {
      firstQuad := ⟨7, 9, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 10, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(7, 9), [.row 7 9 15], (7, 15)⟩
      path1 := ⟨(15, 16), [.row 15 16 3, .flip 15 3, .row 3 15 16], (3, 16)⟩
      path2 := ⟨(3, 10), [.flip 3 10, .row 10 3 1, .flip 10 1], (1, 10)⟩
      path3 := ⟨(1, 16), [.flip 1 16, .row 16 1 9, .flip 16 9], (9, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 7, 9⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 6, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1, .row 1 0 13, .flip 1 13, .row 13 1 0, .flip 13 0], (0, 13)⟩
      path1 := ⟨(7, 9), [.flip 7 9, .row 9 7 1, .flip 9 1], (1, 9)⟩
      path2 := ⟨(6, 13), [.row 6 13 15], (6, 15)⟩
      path3 := ⟨(0, 15), [.row 0 15 7], (0, 7)⟩ } },
  { hits := [(3, 15), (3, 16), (8, 12), (8, 15), (10, 1), (10, 3), (15, 3), (15, 16), (16, 1), (16, 12)]
    forwardChoices := [{ center := 3, support := {15, 16} },
        { center := 8, support := {12, 15} },
        { center := 10, support := {1, 3} },
        { center := 15, support := {3, 16} },
        { center := 16, support := {1, 12} }]
    reverseChoices := [{ center := 0, support := {4, 15} },
        { center := 1, support := {0, 13} },
        { center := 6, support := {13, 15} },
        { center := 8, support := {1, 4} },
        { center := 13, support := {0, 1} }]
    forwardData := {
      firstQuad := ⟨8, 12, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨1, 3, 10, 16⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 2, 1⟩
      path0 := ⟨(8, 12), [.row 8 12 15], (8, 15)⟩
      path1 := ⟨(15, 16), [.row 15 16 3, .flip 15 3, .row 3 15 16], (3, 16)⟩
      path2 := ⟨(3, 10), [.flip 3 10, .row 10 3 1, .flip 10 1], (1, 10)⟩
      path3 := ⟨(1, 16), [.flip 1 16, .row 16 1 12, .flip 16 12], (12, 16)⟩ }
    reverseData := {
      firstQuad := ⟨0, 1, 4, 8⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 6, 13, 15⟩
      secondForm := .innerOuter
      permutation := ⟨2, 1, 3, 0⟩
      path0 := ⟨(0, 1), [.flip 0 1, .row 1 0 13, .flip 1 13, .row 13 1 0, .flip 13 0], (0, 13)⟩
      path1 := ⟨(4, 8), [.flip 4 8, .row 8 4 1, .flip 8 1], (1, 8)⟩
      path2 := ⟨(6, 13), [.row 6 13 15], (6, 15)⟩
      path3 := ⟨(0, 15), [.row 0 15 4], (0, 4)⟩ } },
  { hits := [(4, 6), (4, 10), (5, 10), (5, 11), (6, 1), (6, 11), (10, 1), (10, 5), (13, 5), (13, 6)]
    forwardChoices := [{ center := 4, support := {6, 10} },
        { center := 5, support := {10, 11} },
        { center := 6, support := {1, 11} },
        { center := 10, support := {1, 5} },
        { center := 13, support := {5, 6} }]
    reverseChoices := [{ center := 3, support := {10, 11} },
        { center := 6, support := {11, 15} },
        { center := 10, support := {5, 15} },
        { center := 11, support := {5, 6} },
        { center := 12, support := {6, 10} }]
    forwardData := {
      firstQuad := ⟨1, 4, 6, 10⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 6, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(4, 6), [.row 4 6 10], (4, 10)⟩
      path1 := ⟨(1, 10), [.flip 1 10, .row 10 1 5, .flip 10 5, .row 5 10 11], (5, 11)⟩
      path2 := ⟨(6, 11), [.row 6 11 1, .flip 6 1], (1, 6)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨6, 10, 12, 15⟩
      firstForm := .innerOuter
      secondQuad := ⟨3, 5, 10, 11⟩
      secondForm := .innerOuter
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(10, 12), [.flip 10 12, .row 12 10 6, .flip 12 6], (6, 12)⟩
      path1 := ⟨(6, 15), [.row 6 15 11, .flip 6 11, .row 11 6 5, .flip 11 5], (5, 11)⟩
      path2 := ⟨(5, 10), [.flip 5 10, .row 10 5 15], (10, 15)⟩
      path3 := ⟨(3, 11), [.row 3 11 10], (3, 10)⟩ } },
  { hits := [(6, 11), (6, 13), (7, 13), (7, 15), (12, 6), (12, 15), (13, 6), (13, 16), (15, 11), (15, 16)]
    forwardChoices := [{ center := 6, support := {11, 13} },
        { center := 7, support := {13, 15} },
        { center := 12, support := {6, 15} },
        { center := 13, support := {6, 16} },
        { center := 15, support := {11, 16} }]
    reverseChoices := [{ center := 1, support := {0, 5} },
        { center := 3, support := {0, 10} },
        { center := 4, support := {1, 10} },
        { center := 9, support := {1, 3} },
        { center := 10, support := {3, 5} }]
    forwardData := {
      firstQuad := ⟨7, 13, 15, 16⟩
      firstForm := .adjacentSides
      secondQuad := ⟨6, 11, 12, 15⟩
      secondForm := .adjacentSides
      permutation := ⟨0, 3, 1, 2⟩
      path0 := ⟨(7, 13), [.row 7 13 15], (7, 15)⟩
      path1 := ⟨(15, 16), [.row 15 16 11, .flip 15 11], (11, 15)⟩
      path2 := ⟨(6, 11), [.row 6 11 13, .flip 6 13, .row 13 6 16], (13, 16)⟩
      path3 := ⟨(12, 15), [.row 12 15 6, .flip 12 6], (6, 12)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 5, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨0, 1, 3, 9⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(1, 4), [.flip 1 4, .row 4 1 10], (4, 10)⟩
      path1 := ⟨(5, 10), [.flip 5 10, .row 10 5 3, .flip 10 3, .row 3 10 0, .flip 3 0], (0, 3)⟩
      path2 := ⟨(0, 1), [.flip 0 1, .row 1 0 5], (1, 5)⟩
      path3 := ⟨(3, 9), [.flip 3 9, .row 9 3 1, .flip 9 1], (1, 9)⟩ } },
  { hits := [(1, 10), (1, 12), (2, 6), (2, 12), (5, 10), (5, 11), (6, 1), (6, 11), (10, 1), (10, 5), (13, 5), (13, 6)]
    forwardChoices := [{ center := 1, support := {10, 12} },
        { center := 2, support := {6, 12} },
        { center := 5, support := {10, 11} },
        { center := 6, support := {1, 11} },
        { center := 10, support := {1, 5} },
        { center := 13, support := {5, 6} }]
    reverseChoices := [{ center := 3, support := {10, 11} },
        { center := 6, support := {11, 15} },
        { center := 10, support := {5, 15} },
        { center := 11, support := {5, 6} },
        { center := 14, support := {4, 10} },
        { center := 15, support := {4, 6} }]
    forwardData := {
      firstQuad := ⟨1, 2, 6, 12⟩
      firstForm := .innerOuter
      secondQuad := ⟨5, 6, 11, 13⟩
      secondForm := .innerOuter
      permutation := ⟨1, 2, 0, 3⟩
      path0 := ⟨(2, 6), [.row 2 6 12], (2, 12)⟩
      path1 := ⟨(1, 12), [.row 1 12 10, .flip 1 10, .row 10 1 5, .flip 10 5, .row 5 10 11], (5, 11)⟩
      path2 := ⟨(6, 11), [.row 6 11 1, .flip 6 1], (1, 6)⟩
      path3 := ⟨(5, 13), [.flip 5 13, .row 13 5 6, .flip 13 6], (6, 13)⟩ }
    reverseData := {
      firstQuad := ⟨3, 5, 10, 11⟩
      firstForm := .innerOuter
      secondQuad := ⟨4, 10, 14, 15⟩
      secondForm := .innerOuter
      permutation := ⟨3, 0, 2, 1⟩
      path0 := ⟨(5, 10), [.flip 5 10, .row 10 5 15], (10, 15)⟩
      path1 := ⟨(3, 11), [.row 3 11 10], (3, 10)⟩
      path2 := ⟨(10, 14), [.flip 10 14, .row 14 10 4, .flip 14 4], (4, 14)⟩
      path3 := ⟨(4, 15), [.flip 4 15, .row 15 4 6, .flip 15 6, .row 6 15 11, .flip 6 11, .row 11 6 5, .flip 11 5], (5, 11)⟩ } },
  { hits := [(3, 4), (3, 15), (6, 11), (6, 13), (9, 3), (9, 13), (12, 6), (12, 15), (13, 4), (13, 6), (15, 3), (15, 11)]
    forwardChoices := [{ center := 3, support := {4, 15} },
        { center := 6, support := {11, 13} },
        { center := 9, support := {3, 13} },
        { center := 12, support := {6, 15} },
        { center := 13, support := {4, 6} },
        { center := 15, support := {3, 11} }]
    reverseChoices := [{ center := 1, support := {5, 13} },
        { center := 3, support := {10, 12} },
        { center := 4, support := {1, 10} },
        { center := 7, support := {3, 13} },
        { center := 10, support := {3, 5} },
        { center := 13, support := {1, 12} }]
    forwardData := {
      firstQuad := ⟨6, 11, 12, 15⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 4, 9, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨3, 0, 1, 2⟩
      path0 := ⟨(6, 11), [.row 6 11 13, .flip 6 13, .row 13 6 4, .flip 13 4], (4, 13)⟩
      path1 := ⟨(12, 15), [.row 12 15 6, .flip 12 6], (6, 12)⟩
      path2 := ⟨(3, 4), [.row 3 4 15, .flip 3 15, .row 15 3 11, .flip 15 11], (11, 15)⟩
      path3 := ⟨(9, 13), [.row 9 13 3, .flip 9 3], (3, 9)⟩ }
    reverseData := {
      firstQuad := ⟨1, 4, 5, 10⟩
      firstForm := .adjacentSides
      secondQuad := ⟨3, 7, 12, 13⟩
      secondForm := .adjacentSides
      permutation := ⟨1, 2, 3, 0⟩
      path0 := ⟨(1, 4), [.flip 1 4, .row 4 1 10], (4, 10)⟩
      path1 := ⟨(5, 10), [.flip 5 10, .row 10 5 3, .flip 10 3, .row 3 10 12], (3, 12)⟩
      path2 := ⟨(3, 7), [.flip 3 7, .row 7 3 13], (7, 13)⟩
      path3 := ⟨(12, 13), [.flip 12 13, .row 13 12 1, .flip 13 1, .row 1 13 5], (1, 5)⟩ } }]


theorem cancellationOccurrences_length : cancellationOccurrences.length = 64 := by
  native_decide

theorem cancellationOccurrences_all_check :
    cancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def twentyEighthModelRefinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.flatMap fun occ => priorOccurrenceClauses occ.hits

theorem twentyEighthModelRefinementClauses_length :
    twentyEighthModelRefinementClauses.length = 256 := by
  native_decide

theorem sourceAssign_twentyEighthModelRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ twentyEighthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [twentyEighthModelRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp cancellationOccurrences_all_check occ hocc
  simp only [priorOccurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

def extendedTwentyEighthModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedTwentySeventhModelRefinementsCnf ++
    twentyEighthModelRefinementClauses

theorem extendedTwentyEighthModelRefinementsCnf_length :
    extendedTwentyEighthModelRefinementsCnf.length = 5846544 := by
  native_decide

theorem sourceAssign_extendedTwentyEighthModelRefinementsCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedTwentyEighthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedTwentyEighthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedTwentySeventhModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_twentyEighthModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedTwentyEighthModelRefinementsCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedTwentyEighthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedTwentyEighthModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedTwentyEighthModelRefinementsCnf

end ATailBlockerVExactSeventeenTwentyEighthModelRefinements
end Problem97

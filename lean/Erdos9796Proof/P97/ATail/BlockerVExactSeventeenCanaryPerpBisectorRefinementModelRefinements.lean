/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorRefinement

/-!
# Source-valid model refinements after the canary perpendicular-bisector root

Two authenticated exact-seventeen successor models expose one additional
perpendicular-bisector obstruction, two two-Kalmanson cancellations, and two
four-point/two-circle bisector-order obstructions.  This file banks exactly
those five parent-unsubsumed clauses.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

private abbrev priorOrientedHits :=
  ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits

private abbrev priorOccurrenceClause :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause

/- ## Common source-orientation transport -/

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
        source.model.selected)
      choices := by
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
        source.model.selected)
      choices := by
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

private theorem signedArea2_swap13 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 c b a := by
  simp only [signedArea2]
  ring

private theorem signedArea2_swap23 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 a c b := by
  simp only [signedArea2]
  ring

private theorem signedArea2_cycle (a b c : ℝ²) :
    signedArea2 a b c = signedArea2 b c a := by
  simp only [signedArea2]
  ring

/- ## Unique-06 unguarded perpendicular-bisector clause -/

/-- The DIMACS-canonical order of the ten positive incidences in the unique-06 motif. -/
def unique06PerpBisectorHits : List Hit :=
  [(15, 13), (15, 10), (13, 2), (13, 0), (11, 13),
    (11, 10), (2, 13), (2, 0), (0, 10), (0, 2)]

def unique06PerpBisectorChoices : List (RowChoice Label) :=
  [{ center := 0, support := {2, 10} },
    { center := 2, support := {0, 13} },
    { center := 11, support := {10, 13} },
    { center := 13, support := {0, 2} },
    { center := 15, support := {10, 13} }]

def unique06PerpBisectorData : PerpBisectorData Label := {
  a := 10
  b := 13
  p := 0
  q := 11
  r := 15
  pa_pb := ⟨(0, 10), [.row 0 10 2, .flip 0 2, .row 2 0 13,
    .flip 2 13, .row 13 2 0, .flip 13 0], (0, 13)⟩
  qa_qb := ⟨(11, 10), [.row 11 10 13], (11, 13)⟩
  ra_rb := ⟨(15, 10), [.row 15 10 13], (15, 13)⟩ }

theorem unique06PerpBisectorData_check :
    unique06PerpBisectorData.check unique06PerpBisectorChoices = true := by
  decide

def unique06PerpBisectorClause : Std.Sat.CNF.Clause Atom :=
  unique06PerpBisectorHits.map fun hit => neg (.hit hit.1 hit.2)

theorem unique06PerpBisectorClause_dimacs :
    unique06PerpBisectorClause.map litToDimacs =
      [-269, -266, -224, -222, -201, -198, -48, -35, -11, -3] := by
  decide

private theorem false_of_unique06PerpBisectorHits {A : Finset ℝ²}
    (source : SourceRealization A)
    (hhits : ∀ hit ∈ unique06PerpBisectorHits,
      hit.2 ∈ source.model.selected hit.1) : False := by
  have h1513 := hhits (15, 13) (by simp [unique06PerpBisectorHits])
  have h1510 := hhits (15, 10) (by simp [unique06PerpBisectorHits])
  have h132 := hhits (13, 2) (by simp [unique06PerpBisectorHits])
  have h130 := hhits (13, 0) (by simp [unique06PerpBisectorHits])
  have h1113 := hhits (11, 13) (by simp [unique06PerpBisectorHits])
  have h1110 := hhits (11, 10) (by simp [unique06PerpBisectorHits])
  have h213 := hhits (2, 13) (by simp [unique06PerpBisectorHits])
  have h20 := hhits (2, 0) (by simp [unique06PerpBisectorHits])
  have h010 := hhits (0, 10) (by simp [unique06PerpBisectorHits])
  have h02 := hhits (0, 2) (by simp [unique06PerpBisectorHits])
  have hrows : PositiveRowsMatch source.model.selected unique06PerpBisectorChoices := by
    intro choice hchoice point hpoint
    simp only [unique06PerpBisectorChoices, List.mem_cons, List.not_mem_nil,
      or_false] at hchoice
    rcases hchoice with rfl | rfl | rfl | rfl | rfl
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hpoint
      rcases hpoint with rfl | rfl
      · exact h02
      · exact h010
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hpoint
      rcases hpoint with rfl | rfl
      · exact h20
      · exact h213
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hpoint
      rcases hpoint with rfl | rfl
      · exact h1110
      · exact h1113
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hpoint
      rcases hpoint with rfl | rfl
      · exact h130
      · exact h132
    · simp only [Finset.mem_insert, Finset.mem_singleton] at hpoint
      rcases hpoint with rfl | rfl
      · exact h1510
      · exact h1513
  rcases nonempty_perpBisectorCore_of_positiveCheck hrows
      unique06PerpBisectorData unique06PerpBisectorData_check with ⟨core⟩
  let P : RowPattern Label := source.model.selected
  have hreal : Realizes P (fun label => source.boundary (source.labelIndex label)) := by
    refine ⟨?_, source.boundary_injective.comp
      (labelIndex_injective_of_positionEmbedding source.orientation source.model.order
        source.labelIndex source.position_embedding)⟩
    intro center first hfirst second hsecond
    exact
      ((source.selectedRow center).support_eq_radius _
        (source.mem_selectedRow_of_mem_model hfirst)).trans
      ((source.selectedRow center).support_eq_radius _
        (source.mem_selectedRow_of_mem_model hsecond)).symm
  exact Census554.EqualityCore.false_of_convexIndep_of_perpBisectorCore hreal
    source.carrier_convexIndep
    (fun label => boundaryLabel_mem source.boundary source.boundary_image
      source.labelIndex label) core

theorem sourceAssign_unique06PerpBisectorClause
    {A : Finset ℝ²} (source : SourceRealization A) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      unique06PerpBisectorClause = true := by
  have hnotall : ¬ ∀ hit ∈ unique06PerpBisectorHits,
      hit.2 ∈ source.model.selected hit.1 := by
    intro hhits
    exact false_of_unique06PerpBisectorHits source hhits
  push_neg at hnotall
  obtain ⟨hit, hhits, hnotmem⟩ := hnotall
  apply (clause_eval_iff source.model _).2
  refine ⟨.hit hit.1 hit.2, false, ?_, ?_⟩
  · simp [unique06PerpBisectorClause, neg, hhits]
  · simp [sourceAssign, hnotmem]

/- ## Two source-valid Kalmanson cancellations -/

def kalmanson09Occurrence : CancellationOccurrence := {
  hits := [(0, 12), (0, 1), (13, 0), (13, 1),
    (1, 0), (1, 15), (2, 12), (2, 15)]
  forwardChoices := [{ center := 0, support := {1, 12} },
    { center := 13, support := {0, 1} },
    { center := 2, support := {12, 15} },
    { center := 1, support := {0, 15} }]
  reverseChoices := [{ center := 16, support := {4, 15} },
    { center := 3, support := {15, 16} },
    { center := 14, support := {1, 4} },
    { center := 15, support := {1, 16} }]
  forwardData := {
    firstQuad := ⟨0, 1, 12, 13⟩
    firstForm := .innerOuter
    secondQuad := ⟨1, 2, 12, 15⟩
    secondForm := .innerOuter
    permutation := ⟨2, 1, 3, 0⟩
    path0 := ⟨(1, 12), [], (1, 12)⟩
    path1 := ⟨(0, 13), [.flip 0 13, .row 13 0 1, .flip 13 1], (1, 13)⟩
    path2 := ⟨(2, 12), [.row 2 12 15], (2, 15)⟩
    path3 := ⟨(1, 15), [.row 1 15 0, .flip 1 0,
      .row 0 1 12], (0, 12)⟩ }
  reverseData := {
    firstQuad := ⟨3, 4, 15, 16⟩
    firstForm := .innerOuter
    secondQuad := ⟨1, 4, 14, 15⟩
    secondForm := .innerOuter
    permutation := ⟨3, 0, 2, 1⟩
    path0 := ⟨(4, 15), [], (4, 15)⟩
    path1 := ⟨(3, 16), [.row 3 16 15], (3, 15)⟩
    path2 := ⟨(4, 14), [.flip 4 14, .row 14 4 1, .flip 14 1], (1, 14)⟩
    path3 := ⟨(1, 15), [.flip 1 15, .row 15 1 16, .flip 15 16,
      .row 16 15 4, .flip 16 4], (4, 16)⟩ } }

theorem kalmanson09Occurrence_check : kalmanson09Occurrence.check = true := by
  decide

def kalmanson09Clause : Std.Sat.CNF.Clause Atom :=
  priorOccurrenceClause kalmanson09Occurrence.hits 0 .forward

theorem kalmanson09Clause_dimacs :
    kalmanson09Clause.map litToDimacs =
      [-307, -5, -7, -86, -92, -103, -116, -141, -150] := by
  decide

theorem sourceAssign_kalmanson09Clause {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model) kalmanson09Clause = true := by
  exact sourceAssign_cancellationOccurrenceClause source kalmanson09Occurrence
    kalmanson09Occurrence_check 0 .forward

def kalmanson10Occurrence : CancellationOccurrence := {
  hits := [(0, 13), (0, 3), (0, 6), (14, 0), (14, 3),
    (3, 13), (3, 15), (6, 0), (6, 15)]
  forwardChoices := [{ center := 0, support := {3, 6, 13} },
    { center := 6, support := {0, 15} },
    { center := 3, support := {13, 15} },
    { center := 14, support := {0, 3} }]
  reverseChoices := [{ center := 16, support := {3, 10, 13} },
    { center := 10, support := {1, 16} },
    { center := 13, support := {1, 3} },
    { center := 2, support := {13, 16} }]
  forwardData := {
    firstQuad := ⟨0, 3, 6, 15⟩
    firstForm := .adjacentSides
    secondQuad := ⟨0, 3, 13, 14⟩
    secondForm := .innerOuter
    permutation := ⟨0, 2, 1, 3⟩
    path0 := ⟨(0, 3), [.row 0 3 6], (0, 6)⟩
    path1 := ⟨(6, 15), [.row 6 15 0, .flip 6 0,
      .row 0 6 13], (0, 13)⟩
    path2 := ⟨(3, 13), [.row 3 13 15], (3, 15)⟩
    path3 := ⟨(0, 14), [.flip 0 14, .row 14 0 3, .flip 14 3], (3, 14)⟩ }
  reverseData := {
    firstQuad := ⟨1, 10, 13, 16⟩
    firstForm := .adjacentSides
    secondQuad := ⟨2, 3, 13, 16⟩
    secondForm := .innerOuter
    permutation := ⟨3, 1, 0, 2⟩
    path0 := ⟨(1, 10), [.flip 1 10, .row 10 1 16, .flip 10 16,
      .row 16 10 3, .flip 16 3], (3, 16)⟩
    path1 := ⟨(13, 16), [.flip 13 16, .row 16 13 10,
      .flip 16 10], (10, 16)⟩
    path2 := ⟨(3, 13), [.flip 3 13, .row 13 3 1, .flip 13 1], (1, 13)⟩
    path3 := ⟨(2, 16), [.row 2 16 13], (2, 13)⟩ } }

theorem kalmanson10Occurrence_check : kalmanson10Occurrence.check = true := by
  decide

def kalmanson10Clause : Std.Sat.CNF.Clause Atom :=
  priorOccurrenceClause kalmanson10Occurrence.hits 0 .forward

theorem kalmanson10Clause_dimacs :
    kalmanson10Clause.map litToDimacs =
      [-307, -6, -12, -13, -18, -29, -193, -201, -205, -218] := by
  decide

theorem sourceAssign_kalmanson10Clause {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model) kalmanson10Clause = true := by
  exact sourceAssign_cancellationOccurrenceClause source kalmanson10Occurrence
    kalmanson10Occurrence_check 0 .forward

/- ## Four-point/two-circle occurrence from unique-09 -/

def fourPointForwardHits : List Hit :=
  [(0, 1), (0, 6), (1, 0), (1, 6), (5, 1), (5, 7), (6, 0), (6, 7)]

def fourPointForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {1, 6} },
    { center := 1, support := {0, 6} },
    { center := 5, support := {1, 7} },
    { center := 6, support := {0, 7} }]

def fourPointForwardReverseChoices : List (RowChoice Label) :=
  [{ center := 16, support := {10, 15} },
    { center := 15, support := {10, 16} },
    { center := 11, support := {9, 15} },
    { center := 10, support := {9, 16} }]

theorem fourPointForwardCover :
    ∀ choice ∈ fourPointForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ fourPointForwardHits := by
  decide

theorem fourPointForwardReverseCover :
    ∀ choice ∈ fourPointForwardReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ fourPointForwardHits := by
  decide

private def fourPointForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P fourPointForwardChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 6
  v := 5
  u := 7
  y := 1
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(6, 7), [.row 6 7 0, .flip 6 0, .row 0 6 1, .flip 0 1,
      .row 1 0 6, .flip 1 6], (6, 1)⟩ (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(7, 5), [.flip 7 5, .row 5 7 1, .flip 5 1], (1, 5)⟩
      (by decide) }

private def fourPointForwardReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P fourPointForwardReverseChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 10
  v := 11
  u := 9
  y := 15
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(10, 9), [.row 10 9 16, .flip 10 16, .row 16 10 15,
      .flip 16 15, .row 15 16 10, .flip 15 10], (10, 15)⟩
      (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(9, 11), [.flip 9 11, .row 11 9 15, .flip 11 15], (15, 11)⟩
      (by decide) }

private theorem false_of_fourPointForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P fourPointForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (fourPointForwardCore hrows)
  · change 0 < signedArea2 (pointOf 7) (pointOf 6) (pointOf 5)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (5 : Label)) (j := (6 : Label)) (k := (7 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 1) (pointOf 6) (pointOf 5)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (5 : Label)) (k := (6 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_fourPointForwardReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P fourPointForwardReverseChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (fourPointForwardReverseCore hrows)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (9 : Label)) (j := (10 : Label)) (k := (11 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 15) (pointOf 10) (pointOf 11) < 0
    rw [signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (10 : Label)) (j := (11 : Label)) (k := (15 : Label))
      (by decide) (by decide)

private theorem false_of_fourPointForwardHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits fourPointForwardHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_fourPointForwardRows hreal source.boundary_ccw
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        fourPointForwardHits fourPointForwardChoices fourPointForwardCover hall)
  · exact false_of_fourPointForwardReverseRows hreal source.boundary_ccw
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        fourPointForwardHits fourPointForwardReverseChoices
        fourPointForwardReverseCover hall)

def fourPointForwardClause : Std.Sat.CNF.Clause Atom :=
  priorOccurrenceClause fourPointForwardHits 0 .forward

theorem fourPointForwardClause_dimacs :
    fourPointForwardClause.map litToDimacs =
      [-307, -7, -13, -103, -115, -160, -161, -205, -212] := by
  decide

theorem sourceAssign_fourPointForwardClause {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      fourPointForwardClause = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_fourPointForwardHits source 0 .forward horder.symm hall

/- ## Four-point/two-circle occurrence from unique-10 -/

def fourPointReverseHits : List Hit :=
  [(1, 2), (1, 16), (2, 1), (2, 16), (15, 1), (15, 2)]

def fourPointReverseChoices : List (RowChoice Label) :=
  [{ center := 1, support := {2, 16} },
    { center := 2, support := {1, 16} },
    { center := 15, support := {1, 2} }]

def fourPointReverseReflectedChoices : List (RowChoice Label) :=
  [{ center := 15, support := {0, 14} },
    { center := 14, support := {0, 15} },
    { center := 1, support := {14, 15} }]

theorem fourPointReverseCover :
    ∀ choice ∈ fourPointReverseChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ fourPointReverseHits := by
  decide

theorem fourPointReverseReflectedCover :
    ∀ choice ∈ fourPointReverseReflectedChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ fourPointReverseHits := by
  decide

private def fourPointReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P fourPointReverseChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 15
  v := 16
  u := 2
  y := 1
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(15, 2), [.row 15 2 1], (15, 1)⟩ (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(2, 16), [.row 2 16 1, .flip 2 1, .row 1 2 16], (1, 16)⟩
      (by decide) }

private def fourPointReverseReflectedCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P fourPointReverseReflectedChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 1
  v := 0
  u := 14
  y := 15
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(1, 14), [.row 1 14 15], (1, 15)⟩ (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(14, 0), [.row 14 0 15, .flip 14 15, .row 15 14 0], (15, 0)⟩
      (by decide) }

private theorem false_of_fourPointReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P fourPointReverseChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (fourPointReverseCore hrows)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (15 : Label)) (k := (16 : Label))
      (by decide) (by decide)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (15 : Label)) (k := (16 : Label))
      (by decide) (by decide)

private theorem false_of_fourPointReverseReflectedRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P fourPointReverseReflectedChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (fourPointReverseReflectedCore hrows)
  · change 0 < signedArea2 (pointOf 14) (pointOf 1) (pointOf 0)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (1 : Label)) (k := (14 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 15) (pointOf 1) (pointOf 0)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (1 : Label)) (k := (15 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_fourPointReverseHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits fourPointReverseHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_fourPointReverseRows hreal source.boundary_ccw
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        fourPointReverseHits fourPointReverseChoices fourPointReverseCover hall)
  · exact false_of_fourPointReverseReflectedRows hreal source.boundary_ccw
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        fourPointReverseHits fourPointReverseReflectedChoices
        fourPointReverseReflectedCover hall)

def fourPointReverseClause : Std.Sat.CNF.Clause Atom :=
  priorOccurrenceClause fourPointReverseHits 0 .forward

theorem fourPointReverseClause_dimacs :
    fourPointReverseClause.map litToDimacs =
      [-307, -111, -117, -143, -151, -228, -230] := by
  decide

theorem sourceAssign_fourPointReverseClause {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      fourPointReverseClause = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_fourPointReverseHits source 0 .forward horder.symm hall

/- ## Cumulative successor -/

def canaryPerpBisectorModelRefinementClauses : Std.Sat.CNF Atom :=
  [unique06PerpBisectorClause, kalmanson09Clause, fourPointForwardClause,
    fourPointReverseClause, kalmanson10Clause]

theorem canaryPerpBisectorModelRefinementClauses_length :
    canaryPerpBisectorModelRefinementClauses.length = 5 := by
  decide

theorem canaryPerpBisectorModelRefinementClauses_dimacs :
    canaryPerpBisectorModelRefinementClauses.map (List.map litToDimacs) =
      [[-269, -266, -224, -222, -201, -198, -48, -35, -11, -3],
       [-307, -5, -7, -86, -92, -103, -116, -141, -150],
       [-307, -7, -13, -103, -115, -160, -161, -205, -212],
       [-307, -111, -117, -143, -151, -228, -230],
       [-307, -6, -12, -13, -18, -29, -193, -201, -205, -218]] := by
  decide

def canaryPerpBisectorModelRefinementCnf : Std.Sat.CNF Atom :=
  ATailBlockerVExactSeventeenCanaryPerpBisectorRefinement.canaryPerpBisectorRefinementCnf ++
    canaryPerpBisectorModelRefinementClauses

theorem canaryPerpBisectorModelRefinementCnf_length :
    canaryPerpBisectorModelRefinementCnf.length = 7409301 := by
  rw [canaryPerpBisectorModelRefinementCnf, List.length_append,
    ATailBlockerVExactSeventeenCanaryPerpBisectorRefinement.canaryPerpBisectorRefinementCnf_length,
    canaryPerpBisectorModelRefinementClauses_length]

theorem sourceAssign_canaryPerpBisectorModelRefinementCnf
    {A : Finset ℝ²} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorModelRefinementCnf = true := by
  rw [canaryPerpBisectorModelRefinementCnf, Std.Sat.CNF.eval_append]
  rw [
    ATailBlockerVExactSeventeenCanaryPerpBisectorRefinement.sourceAssign_canaryPerpBisectorRefinementCnf
      source horder]
  simp [canaryPerpBisectorModelRefinementClauses,
    sourceAssign_unique06PerpBisectorClause source,
    sourceAssign_kalmanson09Clause source,
    sourceAssign_fourPointForwardClause source,
    sourceAssign_fourPointReverseClause source,
    sourceAssign_kalmanson10Clause source]

#print axioms unique06PerpBisectorData_check
#print axioms unique06PerpBisectorClause_dimacs
#print axioms sourceAssign_unique06PerpBisectorClause
#print axioms kalmanson09Occurrence_check
#print axioms sourceAssign_kalmanson09Clause
#print axioms sourceAssign_fourPointForwardClause
#print axioms sourceAssign_fourPointReverseClause
#print axioms kalmanson10Occurrence_check
#print axioms sourceAssign_kalmanson10Clause
#print axioms canaryPerpBisectorModelRefinementClauses_dimacs
#print axioms sourceAssign_canaryPerpBisectorModelRefinementCnf

end ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinements
end Problem97

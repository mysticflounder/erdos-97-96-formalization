/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyFourthModelRefinements
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericPerpBisectorNogoodCertificate

/-!
# Canonicalized child-35 perpendicular-bisector occurrence

The replayed child-35 model uses the named cyclic order
`(0,6,8,11,10,12,9,7,2,15,16,3,4,5,1,13,14)`.  The mined positive
incidences are expressed in raw source labels, whereas `orientedHits` expects
cyclic positions.  Inverting that order sends raw labels `1,3,13,4,12` to
positions `14,11,15,12,5`.  This module records the resulting source-valid
perpendicular-bisector occurrence.  It deliberately leaves the published
child-35 ancestor unchanged.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyFifthCanonicalizedPerpendicularBisectorRefinement

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev priorOrientedHits :=
  ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits

private abbrev priorOccurrenceClause :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause

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

/-- The child-35 raw-label motif rewritten in cyclic-position coordinates. -/
def child35CanonicalPerpBisectorHits : List Hit :=
  [(14, 11), (14, 15), (11, 12), (11, 5), (11, 15),
    (15, 11), (15, 12), (15, 5)]

def child35CanonicalPerpBisectorForwardChoices : List (RowChoice Label) :=
  [{ center := 14, support := {11, 15} },
    { center := 11, support := {12, 5, 15} },
    { center := 15, support := {11, 12, 5} }]

def child35CanonicalPerpBisectorReverseChoices : List (RowChoice Label) :=
  [{ center := 2, support := {5, 1} },
    { center := 5, support := {4, 11, 1} },
    { center := 1, support := {5, 4, 11} }]

theorem child35CanonicalPerpBisectorForwardCover :
    ∀ choice ∈ child35CanonicalPerpBisectorForwardChoices,
      ∀ point ∈ choice.support,
        (choice.center, point) ∈ child35CanonicalPerpBisectorHits := by
  decide

theorem child35CanonicalPerpBisectorReverseCover :
    ∀ choice ∈ child35CanonicalPerpBisectorReverseChoices,
      ∀ point ∈ choice.support,
        (Fin.rev choice.center, Fin.rev point) ∈ child35CanonicalPerpBisectorHits := by
  decide

def child35CanonicalPerpBisectorForwardData : PerpBisectorData Label := {
  a := 11
  b := 15
  p := 14
  q := 12
  r := 5
  pa_pb := ⟨(14, 11), [.row 14 11 15], (14, 15)⟩
  qa_qb := ⟨(12, 11), [.flip 12 11, .row 11 12 15, .flip 11 15,
    .row 15 11 12, .flip 15 12], (12, 15)⟩
  ra_rb := ⟨(5, 11), [.flip 5 11, .row 11 5 15, .flip 11 15,
    .row 15 11 5, .flip 15 5], (5, 15)⟩ }

def child35CanonicalPerpBisectorReverseData : PerpBisectorData Label := {
  a := 5
  b := 1
  p := 2
  q := 4
  r := 11
  pa_pb := ⟨(2, 5), [.row 2 5 1], (2, 1)⟩
  qa_qb := ⟨(4, 5), [.flip 4 5, .row 5 4 1, .flip 5 1,
    .row 1 5 4, .flip 1 4], (4, 1)⟩
  ra_rb := ⟨(11, 5), [.flip 11 5, .row 5 11 1, .flip 5 1,
    .row 1 5 11, .flip 1 11], (11, 1)⟩ }

theorem child35CanonicalPerpBisectorForwardData_check :
    child35CanonicalPerpBisectorForwardData.check
      child35CanonicalPerpBisectorForwardChoices = true := by
  decide

theorem child35CanonicalPerpBisectorReverseData_check :
    child35CanonicalPerpBisectorReverseData.check
      child35CanonicalPerpBisectorReverseChoices = true := by
  decide

private theorem false_of_child35CanonicalPerpBisectorHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits child35CanonicalPerpBisectorHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · rcases nonempty_perpBisectorCore_of_positiveCheck
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        child35CanonicalPerpBisectorHits child35CanonicalPerpBisectorForwardChoices
        child35CanonicalPerpBisectorForwardCover hall)
      child35CanonicalPerpBisectorForwardData
      child35CanonicalPerpBisectorForwardData_check with ⟨core⟩
    exact Census554.EqualityCore.false_of_convexIndep_of_perpBisectorCore
      hreal source.carrier_convexIndep
      (fun label => boundaryLabel_mem source.boundary source.boundary_image id label) core
  · rcases nonempty_perpBisectorCore_of_positiveCheck
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        child35CanonicalPerpBisectorHits child35CanonicalPerpBisectorReverseChoices
        child35CanonicalPerpBisectorReverseCover hall)
      child35CanonicalPerpBisectorReverseData
      child35CanonicalPerpBisectorReverseData_check with ⟨core⟩
    exact Census554.EqualityCore.false_of_convexIndep_of_perpBisectorCore
      hreal source.carrier_convexIndep
      (fun label => boundaryLabel_mem source.boundary source.boundary_image id label) core

def child35CanonicalPerpBisectorClause
    (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom :=
  priorOccurrenceClause child35CanonicalPerpBisectorHits order direction

theorem sourceAssign_child35CanonicalPerpBisectorClause
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (child35CanonicalPerpBisectorClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_child35CanonicalPerpBisectorHits
    source order direction horder.symm hall

def child35CanonicalPerpBisectorClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.map fun direction => child35CanonicalPerpBisectorClause order direction

theorem sourceAssign_child35CanonicalPerpBisectorClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ child35CanonicalPerpBisectorClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [child35CanonicalPerpBisectorClauses, List.mem_flatMap,
    List.mem_map] at hclause
  rcases hclause with ⟨order, _, direction, _, rfl⟩
  exact sourceAssign_child35CanonicalPerpBisectorClause source order direction

theorem child35CanonicalPerpBisectorClauses_length :
    child35CanonicalPerpBisectorClauses.length = 4 := by
  decide

#print axioms child35CanonicalPerpBisectorForwardData_check
#print axioms child35CanonicalPerpBisectorReverseData_check
#print axioms sourceAssign_child35CanonicalPerpBisectorClause
#print axioms sourceAssign_child35CanonicalPerpBisectorClauses

end ATailBlockerVExactSeventeenThirtyFifthCanonicalizedPerpendicularBisectorRefinement
end Problem97

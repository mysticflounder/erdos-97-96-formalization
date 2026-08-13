/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtySecondModelRefinements
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericPerpBisectorNogoodCertificate

/-!
# Child-33 perpendicular-bisector occurrence

The replayed child-33 model contains the eight positive incidences
`(2,3),(2,13),(3,4),(3,12),(3,13),(13,3),(13,4),(13,12)`.  They give
three equality closures between the foci `3,13` at witnesses `2,4,12`.
The occurrence is source-valid in both orientations, so its guarded orbit
contains the four named-order/orientation clauses.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyThirdPerpendicularBisectorRefinement

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

def child33PerpBisectorHits : List Hit :=
  [(2, 3), (2, 13), (3, 4), (3, 12), (3, 13),
    (13, 3), (13, 4), (13, 12)]

def child33PerpBisectorForwardChoices : List (RowChoice Label) :=
  [{ center := 2, support := {3, 13} },
    { center := 3, support := {4, 12, 13} },
    { center := 13, support := {3, 4, 12} }]

def child33PerpBisectorReverseChoices : List (RowChoice Label) :=
  [{ center := 14, support := {3, 13} },
    { center := 13, support := {3, 4, 12} },
    { center := 3, support := {4, 12, 13} }]

theorem child33PerpBisectorForwardCover :
    ∀ choice ∈ child33PerpBisectorForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ child33PerpBisectorHits := by
  native_decide

theorem child33PerpBisectorReverseCover :
    ∀ choice ∈ child33PerpBisectorReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ child33PerpBisectorHits := by
  native_decide

def child33PerpBisectorForwardData : PerpBisectorData Label := {
  a := 3
  b := 13
  p := 2
  q := 4
  r := 12
  pa_pb := ⟨(2, 3), [.row 2 3 13], (2, 13)⟩
  qa_qb := ⟨(4, 3), [.flip 4 3, .row 3 4 13, .flip 3 13,
    .row 13 3 4, .flip 13 4], (4, 13)⟩
  ra_rb := ⟨(12, 3), [.flip 12 3, .row 3 12 13, .flip 3 13,
    .row 13 3 12, .flip 13 12], (12, 13)⟩ }

def child33PerpBisectorReverseData : PerpBisectorData Label := {
  a := 13
  b := 3
  p := 14
  q := 12
  r := 4
  pa_pb := ⟨(14, 13), [.row 14 13 3], (14, 3)⟩
  qa_qb := ⟨(12, 13), [.flip 12 13, .row 13 12 3, .flip 13 3,
    .row 3 13 12, .flip 3 12], (12, 3)⟩
  ra_rb := ⟨(4, 13), [.flip 4 13, .row 13 4 3, .flip 13 3,
    .row 3 13 4, .flip 3 4], (4, 3)⟩ }

theorem child33PerpBisectorForwardData_check :
    child33PerpBisectorForwardData.check child33PerpBisectorForwardChoices = true := by
  native_decide

theorem child33PerpBisectorReverseData_check :
    child33PerpBisectorReverseData.check child33PerpBisectorReverseChoices = true := by
  native_decide

private theorem false_of_child33PerpBisectorHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits child33PerpBisectorHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · rcases nonempty_perpBisectorCore_of_positiveCheck
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        child33PerpBisectorHits child33PerpBisectorForwardChoices
        child33PerpBisectorForwardCover hall)
      child33PerpBisectorForwardData child33PerpBisectorForwardData_check with ⟨core⟩
    exact Census554.EqualityCore.false_of_convexIndep_of_perpBisectorCore
      hreal source.carrier_convexIndep
      (fun label => boundaryLabel_mem source.boundary source.boundary_image id label) core
  · exact False.elim (by
      rcases nonempty_perpBisectorCore_of_positiveCheck
        (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
          child33PerpBisectorHits child33PerpBisectorReverseChoices
          child33PerpBisectorReverseCover hall)
        child33PerpBisectorReverseData child33PerpBisectorReverseData_check with ⟨core⟩
      exact Census554.EqualityCore.false_of_convexIndep_of_perpBisectorCore
        hreal source.carrier_convexIndep
        (fun label => boundaryLabel_mem source.boundary source.boundary_image id label) core)

def child33PerpBisectorClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom := priorOccurrenceClause child33PerpBisectorHits order direction

theorem sourceAssign_child33PerpBisectorClause {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (child33PerpBisectorClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_child33PerpBisectorHits source order direction horder.symm hall

def child33PerpBisectorClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.map fun direction => child33PerpBisectorClause order direction

theorem sourceAssign_child33PerpBisectorClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ child33PerpBisectorClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [child33PerpBisectorClauses, List.mem_flatMap, List.mem_map] at hclause
  rcases hclause with ⟨order, _, direction, _, rfl⟩
  exact sourceAssign_child33PerpBisectorClause source order direction

theorem child33PerpBisectorClauses_length : child33PerpBisectorClauses.length = 4 := by
  native_decide

#print axioms child33PerpBisectorForwardData_check
#print axioms child33PerpBisectorReverseData_check
#print axioms sourceAssign_child33PerpBisectorClause
#print axioms sourceAssign_child33PerpBisectorClauses

end ATailBlockerVExactSeventeenThirtyThirdPerpendicularBisectorRefinement
end Problem97

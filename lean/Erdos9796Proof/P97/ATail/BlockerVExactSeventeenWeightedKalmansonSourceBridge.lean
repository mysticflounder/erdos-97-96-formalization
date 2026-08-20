/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSixteenthModelRefinements

/-!
# Source-realization bridge for weighted Kalmanson occurrences

This is the small adapter between the cardinality-generic checked weighted
consumer and the exact-seventeen source CNF.  The geometric consumer proves
that a checked positive weighted certificate cannot be supported by any
`SourceRealization`; `weightedOccurrenceClause` records its guarded Boolean
nogood in the same representation used by the existing extended-CNF and
terminal adapters.

The occurrence stores named source hits, while its forward and reflected
certificates use boundary-position labels.  The checked coverage fields are
the bridge between those two label spaces; the source theorem derives the
positive-row match from the actual order and orientation rather than accepting
an unchecked positivity premise.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

/-- A checked weighted occurrence together with its source-facing hit support.
The choices and weighted data are on the canonical `Fin 17` labels, while
`hits` are the guarded Boolean incidences consumed by `nogoodClause`. -/
structure WeightedSourceOccurrence where
  hits : List Hit
  forwardChoices : List (RowChoice Label)
  reverseChoices : List (RowChoice Label)
  forwardData : WeightedKalmansonCancellationData Label
  reverseData : WeightedKalmansonCancellationData Label
deriving DecidableEq

private abbrev priorOrientedHits :=
  ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits

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

/-- Convert a source occurrence's forward positional choices into positive
row incidences when the requested and actual boundary orientations agree. -/
theorem positiveRowsMatch_of_same
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
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

/-- Convert a source occurrence's reflected positional choices into positive
row incidences when the requested and actual boundary orientations differ. -/
theorem positiveRowsMatch_of_ne
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
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

def WeightedSourceOccurrence.check (occurrence : WeightedSourceOccurrence) : Bool :=
  occurrence.forwardData.check occurrence.forwardChoices &&
  occurrence.reverseData.check occurrence.reverseChoices &&
  decide (∀ choice ∈ occurrence.forwardChoices, ∀ point ∈ choice.support,
    (choice.center, point) ∈ occurrence.hits) &&
  decide (∀ choice ∈ occurrence.reverseChoices, ∀ point ∈ choice.support,
    (Fin.rev choice.center, Fin.rev point) ∈ occurrence.hits)

/-- The Boolean clause emitted for a weighted occurrence.  This is the same
guarded negative-hit shape used by the existing occurrence refinements. -/
def weightedOccurrenceClause (order : NamedOrder) (direction : Orientation)
    (occurrence : WeightedSourceOccurrence) : Std.Sat.CNF.Clause Atom :=
  nogoodClause order (priorOrientedHits occurrence.hits order direction)

/-- A motivating finite model containing every occurrence hit falsifies the
guarded clause.  This is the SAT-side meaning of the occurrence support. -/
theorem weightedOccurrenceClause_eval_false_of_all_hits
    (model : SourceModel) (order : NamedOrder)
    (occurrence : WeightedSourceOccurrence) (direction : Orientation)
    (horder : model.order = order)
    (hall : ∀ hit ∈ priorOrientedHits occurrence.hits order direction,
      hit.2 ∈ model.selected hit.1) :
    Std.Sat.CNF.Clause.eval (sourceAssign model)
      (weightedOccurrenceClause order direction occurrence) = false := by
  classical
  have hne : Std.Sat.CNF.Clause.eval (sourceAssign model)
      (weightedOccurrenceClause order direction occurrence) ≠ true := by
    intro htrue
    obtain ⟨atom, polarity, hmem, heval⟩ :=
      (clause_eval_iff model _).mp htrue
    simp only [weightedOccurrenceClause, priorOrientedHits,
      ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits,
      nogoodClause, List.mem_cons, List.mem_map] at hmem
    rcases hmem with hnamed | ⟨hit, hhit, hmem⟩
    · have : atom = .namedOrder order ∧ polarity = false := by
        exact ⟨by simpa [neg] using congrArg Prod.fst hnamed,
          by simpa [neg] using congrArg Prod.snd hnamed⟩
      rcases this with ⟨rfl, rfl⟩
      simp [sourceAssign, horder] at heval
    · have hatom : atom = .hit hit.1 hit.2 := by
        simpa [neg] using (congrArg Prod.fst hmem).symm
      have hpolarity : polarity = false := by
        simpa [neg] using (congrArg Prod.snd hmem).symm
      subst atom
      subst polarity
      have hselected := hall hit (by
        simpa [ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits]
          using hhit)
      simp [sourceAssign, hselected] at heval
  exact Bool.eq_false_of_not_eq_true hne

private theorem false_of_weightedSourceOccurrenceHits
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (occurrence : WeightedSourceOccurrence)
    (hcheck : occurrence.check = true) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits occurrence.hits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  simp only [WeightedSourceOccurrence.check, Bool.and_eq_true,
    decide_eq_true_eq] at hcheck
  rcases hcheck with ⟨⟨⟨hforward, hreverse⟩, hforwardCover⟩,
    hreverseCover⟩
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_weightedKalmansonCancellationData_of_check
      source.carrier_convexIndep source.boundary_image source.boundary_ccw
      hreal occurrence.forwardChoices
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        occurrence.hits occurrence.forwardChoices hforwardCover hall)
      occurrence.forwardData hforward
  · exact false_of_weightedKalmansonCancellationData_of_check
      source.carrier_convexIndep source.boundary_image source.boundary_ccw
      hreal occurrence.reverseChoices
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        occurrence.hits occurrence.reverseChoices hreverseCover hall)
      occurrence.reverseData hreverse

/-- Every source realization satisfies a checked weighted occurrence clause.

The occurrence check authenticates both weighted certificates and their
forward/reflected support coverage.  The guarded clause supplies `horder` and
`hall`; these determine the orientation-specific positive-row match before
the generic weighted consumer is called. -/
theorem sourceAssign_weightedOccurrenceClause
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A)
    (occurrence : WeightedSourceOccurrence)
    (hcheck : occurrence.check = true) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (weightedOccurrenceClause order direction occurrence) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_weightedSourceOccurrenceHits source occurrence hcheck order
    direction horder.symm hall

#print axioms weightedOccurrenceClause_eval_false_of_all_hits
#print axioms sourceAssign_weightedOccurrenceClause

end ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
end Problem97

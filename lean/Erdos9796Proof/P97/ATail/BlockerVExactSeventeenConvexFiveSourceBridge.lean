/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge
import Erdos9796Proof.P97.Census554.ConvexFivePointCore

/-!
# Checked exact-seventeen source bridge for convex-five occurrences

This module factors the repeated source-order/orientation plumbing used by
the exact-seventeen convex-five refinements.  An occurrence records positive
row choices, four checked equality-closure paths for each orientation, and
the two elementary boundary-sign facts.  Its Boolean checker authenticates
the paths and the forward/reflected hit coverage before the existing
`ConvexFivePointCore` consumer is invoked.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenConvexFiveSourceBridge

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

/-- Swapping the first and third vertices reverses signed area. -/
theorem signedArea2_swap13 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 c b a := by
  simp only [signedArea2]
  ring

/-- Proof-free equality-closure data for one convex-five obstruction. -/
structure ConvexFivePointData (α : Type*) where
  a : α
  x : α
  b : α
  c : α
  y : α
  xa_xb : ClosurePathData α
  ya_yb : ClosurePathData α
  cb_cx : ClosurePathData α
  cb_cy : ClosurePathData α
deriving DecidableEq, Repr

/-- Check the two required distinctness facts and all four closure paths. -/
def ConvexFivePointData.check {α : Type*} [DecidableEq α]
    (choices : List (RowChoice α)) (data : ConvexFivePointData α) : Bool :=
  decide (data.a ≠ data.b ∧ data.x ≠ data.y) &&
  checkPath choices data.xa_xb (data.x, data.a) (data.x, data.b) &&
  checkPath choices data.ya_yb (data.y, data.a) (data.y, data.b) &&
  checkPath choices data.cb_cx (data.c, data.b) (data.c, data.x) &&
  checkPath choices data.cb_cy (data.c, data.b) (data.c, data.y)

/-- Propositional form of the executable convex-five checker. -/
def ConvexFivePointData.Valid {α : Type*} [DecidableEq α]
    (choices : List (RowChoice α)) (data : ConvexFivePointData α) : Prop :=
  ((((data.a ≠ data.b ∧ data.x ≠ data.y) ∧
      checkPath choices data.xa_xb (data.x, data.a) (data.x, data.b) = true) ∧
    checkPath choices data.ya_yb (data.y, data.a) (data.y, data.b) = true) ∧
    checkPath choices data.cb_cx (data.c, data.b) (data.c, data.x) = true) ∧
    checkPath choices data.cb_cy (data.c, data.b) (data.c, data.y) = true

theorem ConvexFivePointData.validOfCheck
    {α : Type*} [DecidableEq α] (choices : List (RowChoice α))
    (data : ConvexFivePointData α) (hcheck : data.check choices = true) :
    data.Valid choices := by
  simpa only [ConvexFivePointData.check, ConvexFivePointData.Valid,
    Bool.and_eq_true, decide_eq_true_eq] using hcheck

/-- A checked convex-five payload and positive row incidences produce the
proof-facing metric core. -/
def ConvexFivePointData.coreOfCheck
    {α : Type*} [DecidableEq α] {P : RowPattern α}
    {choices : List (RowChoice α)} (hrows : PositiveRowsMatch P choices)
    (data : ConvexFivePointData α) (hcheck : data.check choices = true) :
    Census554.ConvexFivePointCore.Core P :=
  {
    a := data.a
    x := data.x
    b := data.b
    c := data.c
    y := data.y
    hab := (data.validOfCheck choices hcheck).1.1.1.1.1
    hxy := (data.validOfCheck choices hcheck).1.1.1.1.2
    xa_xb := edgeClosure_of_checkPath_positive hrows data.xa_xb
      (data.validOfCheck choices hcheck).1.1.1.2
    ya_yb := edgeClosure_of_checkPath_positive hrows data.ya_yb
      (data.validOfCheck choices hcheck).1.1.2
    cb_cx := edgeClosure_of_checkPath_positive hrows data.cb_cx
      (data.validOfCheck choices hcheck).1.2
    cb_cy := edgeClosure_of_checkPath_positive hrows data.cb_cy
      (data.validOfCheck choices hcheck).2 }

/-- One source-facing convex-five occurrence.  The finite checker covers
closure and hit support; the two proof fields discharge only the elementary
cyclic-order signs for the concrete positional labels. -/
structure ConvexFiveSourceOccurrence where
  hits : List Hit
  forwardChoices : List (RowChoice Label)
  reverseChoices : List (RowChoice Label)
  forwardData : ConvexFivePointData Label
  reverseData : ConvexFivePointData Label
  forwardOrientation :
    ∀ {pointOf : Label → ℝ²}, Function.Injective pointOf →
      EuclideanGeometry.IsCcwConvexPolygon pointOf →
      0 < signedArea2 (pointOf forwardData.a) (pointOf forwardData.x)
          (pointOf forwardData.b) ∧
        0 < signedArea2 (pointOf forwardData.b) (pointOf forwardData.c)
          (pointOf forwardData.y)
  reverseOrientation :
    ∀ {pointOf : Label → ℝ²}, Function.Injective pointOf →
      EuclideanGeometry.IsCcwConvexPolygon pointOf →
      signedArea2 (pointOf reverseData.a) (pointOf reverseData.x)
          (pointOf reverseData.b) < 0 ∧
        signedArea2 (pointOf reverseData.b) (pointOf reverseData.c)
          (pointOf reverseData.y) < 0

/-- Executably authenticate both closure payloads and their positional hit
coverage. -/
def ConvexFiveSourceOccurrence.check
    (occurrence : ConvexFiveSourceOccurrence) : Bool :=
  occurrence.forwardData.check occurrence.forwardChoices &&
  occurrence.reverseData.check occurrence.reverseChoices &&
  decide (∀ choice ∈ occurrence.forwardChoices, ∀ point ∈ choice.support,
    (choice.center, point) ∈ occurrence.hits) &&
  decide (∀ choice ∈ occurrence.reverseChoices, ∀ point ∈ choice.support,
    (Fin.rev choice.center, Fin.rev point) ∈ occurrence.hits)

private abbrev priorOrientedHits :=
  ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits

/-- The guarded negative-hit clause emitted by one checked occurrence. -/
def convexFiveOccurrenceClause (order : NamedOrder)
    (direction : Orientation) (occurrence : ConvexFiveSourceOccurrence) :
    Std.Sat.CNF.Clause Atom :=
  nogoodClause order (priorOrientedHits occurrence.hits order direction)

/-- A finite model containing every oriented hit falsifies the guarded
occurrence clause. -/
theorem convexFiveOccurrenceClause_eval_false_of_all_hits
    (model : SourceModel) (order : NamedOrder)
    (occurrence : ConvexFiveSourceOccurrence) (direction : Orientation)
    (horder : model.order = order)
    (hall : ∀ hit ∈ priorOrientedHits occurrence.hits order direction,
      hit.2 ∈ model.selected hit.1) :
    Std.Sat.CNF.Clause.eval (sourceAssign model)
      (convexFiveOccurrenceClause order direction occurrence) = false := by
  classical
  have hne : Std.Sat.CNF.Clause.eval (sourceAssign model)
      (convexFiveOccurrenceClause order direction occurrence) ≠ true := by
    intro htrue
    obtain ⟨atom, polarity, hmem, heval⟩ :=
      (clause_eval_iff model _).mp htrue
    simp only [convexFiveOccurrenceClause, priorOrientedHits,
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

private theorem false_of_convexFiveSourceOccurrenceHits
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (occurrence : ConvexFiveSourceOccurrence)
    (hcheck : occurrence.check = true) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits occurrence.hits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  simp only [ConvexFiveSourceOccurrence.check, Bool.and_eq_true,
    decide_eq_true_eq] at hcheck
  rcases hcheck with ⟨⟨⟨hforward, hreverse⟩, hforwardCover⟩,
    hreverseCover⟩
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · have hrows := positiveRowsMatch_of_same source source.model.order direction
      rfl hsame occurrence.hits occurrence.forwardChoices hforwardCover hall
    let hcore := occurrence.forwardData.coreOfCheck hrows hforward
    have horientation :=
      occurrence.forwardOrientation hreal.injective source.boundary_ccw
    apply Census554.ConvexFivePointCore.false_of_core hreal hcore
    · simpa [hcore, ConvexFivePointData.coreOfCheck] using horientation.1
    · simpa [hcore, ConvexFivePointData.coreOfCheck] using horientation.2
  · have hrows := positiveRowsMatch_of_ne source source.model.order direction
      rfl hsame occurrence.hits occurrence.reverseChoices hreverseCover hall
    let hcore := occurrence.reverseData.coreOfCheck hrows hreverse
    have horientation :=
      occurrence.reverseOrientation hreal.injective source.boundary_ccw
    apply Census554.ConvexFivePointCore.false_of_core_of_neg hreal hcore
    · simpa [hcore, ConvexFivePointData.coreOfCheck] using horientation.1
    · simpa [hcore, ConvexFivePointData.coreOfCheck] using horientation.2

/-- Every source realization satisfies the guarded clause of a checked
convex-five occurrence. -/
theorem sourceAssign_convexFiveOccurrenceClause
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) (occurrence : ConvexFiveSourceOccurrence)
    (hcheck : occurrence.check = true) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (convexFiveOccurrenceClause order direction occurrence) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_convexFiveSourceOccurrenceHits source occurrence hcheck order
    direction horder.symm hall

#print axioms ConvexFivePointData.coreOfCheck
#print axioms convexFiveOccurrenceClause_eval_false_of_all_hits
#print axioms sourceAssign_convexFiveOccurrenceClause

end ATailBlockerVExactSeventeenConvexFiveSourceBridge
end Problem97

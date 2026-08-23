/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements

/-!
# Source-valid FourPointTwoCircle refinements from the exact-seventeen v4 ledger

The authenticated v4 survivor supplies two further instances of the
cardinality-generic two-circle same-side obstruction.  The source adapter keeps
only the positive selected-row hits on deterministic shortest equality paths.

Source: `candidate-ledger.json`, raw SHA-256
`a3f7e3b098e13831684d8c219d0d4e632ff9a1196f5d875e3f1b893f25ffc828`.
The promoted records are `8fa04a9e…` at canonical core `(6,2,13,16)` and
`d756b9bc…` at canonical core `(7,8,3,12)`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements

private abbrev priorOrientedHits :=
  ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits

private abbrev occurrenceClause :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

private theorem signedArea2_swap13 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 c b a := by
  simp only [signedArea2]
  ring

private theorem signedArea2_swap23 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 a c b := by
  simp only [signedArea2]
  ring

private theorem signedArea2_cycle (a b c : ℝ²) :
    signedArea2 a b c = signedArea2 c a b := by
  simp only [signedArea2]
  ring

def candidateForwardHits : List Hit :=
  [(0, 1), (0, 15), (1, 0), (1, 16), (2, 13), (2, 16),
    (13, 6), (13, 15), (15, 0), (15, 13), (16, 1), (16, 6)]

def candidateForwardForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {1, 15} },
    { center := 1, support := {0, 16} },
    { center := 2, support := {13, 16} },
    { center := 13, support := {6, 15} },
    { center := 15, support := {0, 13} },
    { center := 16, support := {1, 6} }]

def candidateForwardReflectedChoices : List (RowChoice Label) :=
  [{ center := 0, support := {10, 15} },
    { center := 1, support := {3, 16} },
    { center := 3, support := {1, 10} },
    { center := 14, support := {0, 3} },
    { center := 15, support := {0, 16} },
    { center := 16, support := {1, 15} }]

theorem candidateForwardForwardCover :
    ∀ choice ∈ candidateForwardForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ candidateForwardHits := by
  decide

theorem candidateForwardReflectedCover :
    ∀ choice ∈ candidateForwardReflectedChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ candidateForwardHits := by
  decide

private def candidateForwardForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P candidateForwardForwardChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 6
  v := 2
  u := 13
  y := 16
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(6, 13), [
      .flip 6 13,
      .row 13 6 15,
      .flip 13 15,
      .row 15 13 0,
      .flip 15 0,
      .row 0 15 1,
      .flip 0 1,
      .row 1 0 16,
      .flip 1 16,
      .row 16 1 6,
      .flip 16 6], (6, 16)⟩ (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(13, 2), [
      .flip 13 2,
      .row 2 13 16,
      .flip 2 16], (16, 2)⟩ (by decide) }

private def candidateForwardReflectedCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P candidateForwardReflectedChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 10
  v := 14
  u := 3
  y := 0
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(10, 3), [
      .flip 10 3,
      .row 3 10 1,
      .flip 3 1,
      .row 1 3 16,
      .flip 1 16,
      .row 16 1 15,
      .flip 16 15,
      .row 15 16 0,
      .flip 15 0,
      .row 0 15 10,
      .flip 0 10], (10, 0)⟩ (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(3, 14), [
      .flip 3 14,
      .row 14 3 0,
      .flip 14 0], (0, 14)⟩ (by decide) }

def candidateReverseHits : List Hit :=
  [(5, 7), (5, 12), (7, 3), (7, 5), (8, 3), (8, 12),
    (12, 5), (12, 7)]

def candidateReverseForwardChoices : List (RowChoice Label) :=
  [{ center := 5, support := {7, 12} },
    { center := 7, support := {3, 5} },
    { center := 8, support := {3, 12} },
    { center := 12, support := {5, 7} }]

def candidateReverseReflectedChoices : List (RowChoice Label) :=
  [{ center := 4, support := {9, 11} },
    { center := 8, support := {4, 13} },
    { center := 9, support := {11, 13} },
    { center := 11, support := {4, 9} }]

theorem candidateReverseForwardCover :
    ∀ choice ∈ candidateReverseForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ candidateReverseHits := by
  decide

theorem candidateReverseReflectedCover :
    ∀ choice ∈ candidateReverseReflectedChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ candidateReverseHits := by
  decide

private def candidateReverseForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P candidateReverseForwardChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 7
  v := 8
  u := 3
  y := 12
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(7, 3), [
      .row 7 3 5,
      .flip 7 5,
      .row 5 7 12,
      .flip 5 12,
      .row 12 5 7,
      .flip 12 7], (7, 12)⟩ (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(3, 8), [
      .flip 3 8,
      .row 8 3 12,
      .flip 8 12], (12, 8)⟩ (by decide) }

private def candidateReverseReflectedCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P candidateReverseReflectedChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 9
  v := 8
  u := 13
  y := 4
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(9, 13), [
      .row 9 13 11,
      .flip 9 11,
      .row 11 9 4,
      .flip 11 4,
      .row 4 11 9,
      .flip 4 9], (9, 4)⟩ (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(13, 8), [
      .flip 13 8,
      .row 8 13 4,
      .flip 8 4], (4, 8)⟩ (by decide) }

private theorem false_of_candidateForwardForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateForwardForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (candidateForwardForwardCore hrows)
  · change 0 < signedArea2 (pointOf 13) (pointOf 6) (pointOf 2)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (6 : Label)) (k := (13 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 16) (pointOf 6) (pointOf 2)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (6 : Label)) (k := (16 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_candidateForwardReflectedRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateForwardReflectedChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (candidateForwardReflectedCore hrows)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (3 : Label)) (j := (10 : Label)) (k := (14 : Label))
      (by decide) (by decide)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (10 : Label)) (k := (14 : Label))
      (by decide) (by decide)

private theorem false_of_candidateReverseForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateReverseForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (candidateReverseForwardCore hrows)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (3 : Label)) (j := (7 : Label)) (k := (8 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 12) (pointOf 7) (pointOf 8) < 0
    rw [← signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (7 : Label)) (j := (8 : Label)) (k := (12 : Label))
      (by decide) (by decide)

private theorem false_of_candidateReverseReflectedRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateReverseReflectedChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (candidateReverseReflectedCore hrows)
  · change 0 < signedArea2 (pointOf 13) (pointOf 9) (pointOf 8)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (8 : Label)) (j := (9 : Label)) (k := (13 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 4) (pointOf 9) (pointOf 8)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (4 : Label)) (j := (8 : Label)) (k := (9 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_candidateForwardHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits candidateForwardHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_candidateForwardForwardRows hreal source.boundary_ccw
      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_same
        source source.model.order direction rfl hsame candidateForwardHits
        candidateForwardForwardChoices candidateForwardForwardCover hall)
  · exact false_of_candidateForwardReflectedRows hreal source.boundary_ccw
      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_ne
        source source.model.order direction rfl hsame candidateForwardHits
        candidateForwardReflectedChoices candidateForwardReflectedCover hall)

private theorem false_of_candidateReverseHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits candidateReverseHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_candidateReverseForwardRows hreal source.boundary_ccw
      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_same
        source source.model.order direction rfl hsame candidateReverseHits
        candidateReverseForwardChoices candidateReverseForwardCover hall)
  · exact false_of_candidateReverseReflectedRows hreal source.boundary_ccw
      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_ne
        source source.model.order direction rfl hsame candidateReverseHits
        candidateReverseReflectedChoices candidateReverseReflectedCover hall)

def candidateForwardClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom := occurrenceClause candidateForwardHits order direction

def candidateReverseClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom := occurrenceClause candidateReverseHits order direction

def candidateForwardClauses : Std.Sat.CNF Atom := occurrenceClauses candidateForwardHits

def candidateReverseClauses : Std.Sat.CNF Atom := occurrenceClauses candidateReverseHits

theorem sourceAssign_candidateForwardClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (candidateForwardClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_candidateForwardHits source order direction horder.symm hall

theorem sourceAssign_candidateReverseClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (candidateReverseClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_candidateReverseHits source order direction horder.symm hall

private theorem sourceAssign_occurrenceClauses {A : Finset ℝ²}
    (source : SourceRealization A) (hits : List Hit)
    (hvalid : ∀ order direction,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model)
        (occurrenceClause hits order direction) = true) :
    ∀ clause ∈ occurrenceClauses hits,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact hvalid order direction

def fourPointTwoCircleV4CoreRefinementClauses : Std.Sat.CNF Atom :=
  candidateForwardClauses ++ candidateReverseClauses

set_option linter.style.nativeDecide false in
theorem fourPointTwoCircleV4CoreRefinementClauses_length :
    fourPointTwoCircleV4CoreRefinementClauses.length = 8 := by
  native_decide

set_option linter.style.nativeDecide false in
theorem fourPointTwoCircleV4CoreRefinementClauses_nodup :
    fourPointTwoCircleV4CoreRefinementClauses.Nodup := by
  native_decide

theorem sourceAssign_fourPointTwoCircleV4CoreRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ fourPointTwoCircleV4CoreRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  rcases List.mem_append.mp hclause with hforward | hreverse
  · exact sourceAssign_occurrenceClauses source candidateForwardHits
      (sourceAssign_candidateForwardClause source) clause hforward
  · exact sourceAssign_occurrenceClauses source candidateReverseHits
      (sourceAssign_candidateReverseClause source) clause hreverse

def canaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinementCnf :
    Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf ++
    fourPointTwoCircleV4CoreRefinementClauses

theorem canaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinementCnf_length :
    canaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinementCnf.length =
      7409524 := by
  simp [canaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinementCnf,
    canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf_length,
    fourPointTwoCircleV4CoreRefinementClauses_length]

theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinementCnf
    {A : Finset ℝ²} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  rcases List.mem_append.mp hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf
        source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_fourPointTwoCircleV4CoreRefinementClauses source clause hsuffix

#print axioms sourceAssign_candidateForwardClause
#print axioms sourceAssign_candidateReverseClause
#print axioms fourPointTwoCircleV4CoreRefinementClauses_nodup
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinementCnf

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinements
end Problem97

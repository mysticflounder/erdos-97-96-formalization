/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinementsV2
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge
import Erdos9796Proof.P97.Census554.FourPointTwoCircleBisectorOrderCore

/-!
# Source-valid FourPointTwoCircle refinements from the exact-seventeen v3 ledger

The authenticated v3 survivor contains two instances of the cardinality-generic
two-circle same-side obstruction.  The source adapter below retains only the
positive selected-row hits traversed by explicit equality-closure paths.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinementsV2

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

def candidateAHits : List Hit :=
  [(0, 1), (0, 14), (1, 0), (1, 4), (2, 1), (2, 5), (4, 5), (4, 14), (14, 0), (14, 4)]

def candidateAForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {1, 14} },
    { center := 1, support := {0, 4} },
    { center := 2, support := {1, 5} },
    { center := 4, support := {5, 14} },
    { center := 14, support := {0, 4} }]

def candidateAReflectedChoices : List (RowChoice Label) :=
  [{ center := 2, support := {12, 16} },
    { center := 12, support := {2, 11} },
    { center := 14, support := {11, 15} },
    { center := 15, support := {12, 16} },
    { center := 16, support := {2, 15} }]

theorem candidateAForwardCover :
    ∀ choice ∈ candidateAForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ candidateAHits := by
  decide

theorem candidateAReflectedCover :
    ∀ choice ∈ candidateAReflectedChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ candidateAHits := by
  decide

private def candidateAForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P candidateAForwardChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 4
  v := 2
  u := 5
  y := 1
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(4, 5), [.row 4 5 14, .flip 4 14, .row 14 4 0, .flip 14 0, .row 0 14 1, .flip 0 1, .row 1 0 4, .flip 1 4], (4, 1)⟩ (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(5, 2), [.flip 5 2, .row 2 5 1, .flip 2 1], (1, 2)⟩ (by decide) }

private def candidateAReflectedCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P candidateAReflectedChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 12
  v := 14
  u := 11
  y := 15
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(12, 11), [.row 12 11 2, .flip 12 2, .row 2 12 16, .flip 2 16, .row 16 2 15, .flip 16 15, .row 15 16 12, .flip 15 12], (12, 15)⟩ (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(11, 14), [.flip 11 14, .row 14 11 15, .flip 14 15], (15, 14)⟩ (by decide) }

def candidateBHits : List Hit :=
  [(0, 1), (0, 14), (1, 0), (1, 13), (4, 13), (4, 14), (14, 0), (14, 1), (14, 4)]

def candidateBForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {1, 14} },
    { center := 1, support := {0, 13} },
    { center := 4, support := {13, 14} },
    { center := 14, support := {0, 1, 4} }]

def candidateBReflectedChoices : List (RowChoice Label) :=
  [{ center := 2, support := {12, 15, 16} },
    { center := 12, support := {2, 3} },
    { center := 15, support := {3, 16} },
    { center := 16, support := {2, 15} }]

theorem candidateBForwardCover :
    ∀ choice ∈ candidateBForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ candidateBHits := by
  decide

theorem candidateBReflectedCover :
    ∀ choice ∈ candidateBReflectedChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ candidateBHits := by
  decide

private def candidateBForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P candidateBForwardChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 13
  v := 14
  u := 4
  y := 1
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(13, 4), [.flip 13 4, .row 4 13 14, .flip 4 14, .row 14 4 0, .flip 14 0, .row 0 14 1, .flip 0 1, .row 1 0 13, .flip 1 13], (13, 1)⟩ (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(4, 14), [.flip 4 14, .row 14 4 1, .flip 14 1], (1, 14)⟩ (by decide) }

private def candidateBReflectedCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P candidateBReflectedChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 3
  v := 2
  u := 12
  y := 15
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(3, 12), [.flip 3 12, .row 12 3 2, .flip 12 2, .row 2 12 16, .flip 2 16, .row 16 2 15, .flip 16 15, .row 15 16 3, .flip 15 3], (3, 15)⟩ (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(12, 2), [.flip 12 2, .row 2 12 15, .flip 2 15], (15, 2)⟩ (by decide) }

private theorem false_of_candidateAForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateAForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (candidateAForwardCore hrows)
  · change 0 < signedArea2 (pointOf 5) (pointOf 4) (pointOf 2)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (4 : Label)) (k := (5 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 1) (pointOf 4) (pointOf 2)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (2 : Label)) (k := (4 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_candidateAReflectedRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateAReflectedChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (candidateAReflectedCore hrows)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (11 : Label)) (j := (12 : Label)) (k := (14 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 15) (pointOf 12) (pointOf 14) < 0
    rw [signedArea2_cycle, signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (12 : Label)) (j := (14 : Label)) (k := (15 : Label))
      (by decide) (by decide)

private theorem false_of_candidateBForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateBForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (candidateBForwardCore hrows)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (4 : Label)) (j := (13 : Label)) (k := (14 : Label))
      (by decide) (by decide)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (13 : Label)) (k := (14 : Label))
      (by decide) (by decide)

private theorem false_of_candidateBReflectedRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateBReflectedChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (candidateBReflectedCore hrows)
  · change 0 < signedArea2 (pointOf 12) (pointOf 3) (pointOf 2)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (3 : Label)) (k := (12 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 15) (pointOf 3) (pointOf 2)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (3 : Label)) (k := (15 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_candidateAHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits candidateAHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_candidateAForwardRows hreal source.boundary_ccw
      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_same
        source source.model.order direction rfl hsame candidateAHits
        candidateAForwardChoices candidateAForwardCover hall)
  · exact false_of_candidateAReflectedRows hreal source.boundary_ccw
      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_ne
        source source.model.order direction rfl hsame candidateAHits
        candidateAReflectedChoices candidateAReflectedCover hall)

private theorem false_of_candidateBHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits candidateBHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_candidateBForwardRows hreal source.boundary_ccw
      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_same
        source source.model.order direction rfl hsame candidateBHits
        candidateBForwardChoices candidateBForwardCover hall)
  · exact false_of_candidateBReflectedRows hreal source.boundary_ccw
      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_ne
        source source.model.order direction rfl hsame candidateBHits
        candidateBReflectedChoices candidateBReflectedCover hall)

def candidateAClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom := occurrenceClause candidateAHits order direction

def candidateBClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom := occurrenceClause candidateBHits order direction

def candidateAClauses : Std.Sat.CNF Atom := occurrenceClauses candidateAHits

def candidateBClauses : Std.Sat.CNF Atom := occurrenceClauses candidateBHits

theorem sourceAssign_candidateAClause {A : Finset ℝ²} (source : SourceRealization A)
    (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (candidateAClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_candidateAHits source order direction horder.symm hall

theorem sourceAssign_candidateBClause {A : Finset ℝ²} (source : SourceRealization A)
    (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (candidateBClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_candidateBHits source order direction horder.symm hall

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

def fourPointTwoCircleRefinementClauses : Std.Sat.CNF Atom :=
  candidateBClauses

theorem fourPointTwoCircleRefinementClauses_length :
    fourPointTwoCircleRefinementClauses.length = 4 := by
  native_decide

theorem fourPointTwoCircleRefinementClauses_nodup :
    fourPointTwoCircleRefinementClauses.Nodup := by
  native_decide

theorem candidateAClauses_already_in_v2 :
    ∀ clause ∈ candidateAClauses, clause ∈ twoKalmansonRefinementClauses := by
  native_decide

theorem candidateBClauses_disjoint_v2 :
    ∀ clause ∈ candidateBClauses,
      clause ∉ twoKalmansonRefinementClauses := by
  native_decide

theorem sourceAssign_fourPointTwoCircleRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ fourPointTwoCircleRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  exact sourceAssign_occurrenceClauses source candidateBHits
    (sourceAssign_candidateBClause source) clause hclause

def canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf :
    Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorTwoKalmansonRefinementV2Cnf ++
    fourPointTwoCircleRefinementClauses

theorem canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf_length :
    canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf.length =
      7409516 := by
  simp [canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf,
    canaryPerpBisectorSurvivorTwoKalmansonRefinementV2Cnf_length,
    fourPointTwoCircleRefinementClauses_length]

theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf
    {A : Finset ℝ²} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  rcases List.mem_append.mp hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_canaryPerpBisectorSurvivorTwoKalmansonRefinementV2Cnf
        source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_fourPointTwoCircleRefinementClauses source clause hsuffix

#print axioms sourceAssign_candidateAClause
#print axioms sourceAssign_candidateBClause
#print axioms fourPointTwoCircleRefinementClauses_nodup
#print axioms candidateAClauses_already_in_v2
#print axioms candidateBClauses_disjoint_v2
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements
end Problem97

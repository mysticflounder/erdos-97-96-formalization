/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinements

/-!
# Exact-seventeen V6 survivor model-core refinements

The two source-valid four-point/two-circle candidates from the authenticated V6
canary ledger are promoted through their full order/orientation orbits.  All
eight orbit clauses are appended to the current V5 root.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinements

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
  [(6, 8), (6, 13), (8, 6), (8, 13),
    (11, 8), (11, 9), (13, 6), (13, 9)]

def candidateAForwardChoices : List (RowChoice Label) :=
  [{ center := 6, support := {8, 13} },
    { center := 8, support := {6, 13} },
    { center := 11, support := {8, 9} },
    { center := 13, support := {6, 9} }]

def candidateAReflectedChoices : List (RowChoice Label) :=
  [{ center := 3, support := {7, 10} },
    { center := 5, support := {7, 8} },
    { center := 8, support := {3, 10} },
    { center := 10, support := {3, 8} }]

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
  q := 13
  v := 11
  u := 8
  y := 9
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(13, 8), [.flip 13 8, .row 8 13 6, .flip 8 6,
      .row 6 8 13, .flip 6 13, .row 13 6 9], (13, 9)⟩ (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(8, 11), [.flip 8 11, .row 11 8 9, .flip 11 9], (9, 11)⟩ (by decide) }

private def candidateAReflectedCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P candidateAReflectedChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 3
  v := 5
  u := 8
  y := 7
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(3, 8), [.flip 3 8, .row 8 3 10, .flip 8 10,
      .row 10 8 3, .flip 10 3, .row 3 10 7], (3, 7)⟩ (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(8, 5), [.flip 8 5, .row 5 8 7, .flip 5 7], (7, 5)⟩ (by decide) }

def candidateBHits : List Hit :=
  [(6, 8), (6, 13), (8, 6), (8, 13),
    (13, 0), (13, 6), (15, 0), (15, 8)]

def candidateBForwardChoices : List (RowChoice Label) :=
  [{ center := 6, support := {8, 13} },
    { center := 8, support := {6, 13} },
    { center := 13, support := {0, 6} },
    { center := 15, support := {0, 8} }]

def candidateBReflectedChoices : List (RowChoice Label) :=
  [{ center := 1, support := {8, 16} },
    { center := 3, support := {10, 16} },
    { center := 8, support := {3, 10} },
    { center := 10, support := {3, 8} }]

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
  v := 15
  u := 8
  y := 0
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(13, 8), [.flip 13 8, .row 8 13 6, .flip 8 6,
      .row 6 8 13, .flip 6 13, .row 13 6 0], (13, 0)⟩ (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(8, 15), [.flip 8 15, .row 15 8 0, .flip 15 0], (0, 15)⟩ (by decide) }

private def candidateBReflectedCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P candidateBReflectedChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 3
  v := 1
  u := 8
  y := 16
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(3, 8), [.flip 3 8, .row 8 3 10, .flip 8 10,
      .row 10 8 3, .flip 10 3, .row 3 10 16], (3, 16)⟩ (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(8, 1), [.flip 8 1, .row 1 8 16, .flip 1 16], (16, 1)⟩ (by decide) }

private theorem false_of_candidateAForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateAForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (candidateAForwardCore hrows)
  · change 0 < signedArea2 (pointOf 8) (pointOf 13) (pointOf 11)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (8 : Label)) (j := (11 : Label)) (k := (13 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 9) (pointOf 13) (pointOf 11)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (9 : Label)) (j := (11 : Label)) (k := (13 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_candidateAReflectedRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateAReflectedChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (candidateAReflectedCore hrows)
  · change signedArea2 (pointOf 8) (pointOf 3) (pointOf 5) < 0
    rw [signedArea2_cycle, signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (3 : Label)) (j := (5 : Label)) (k := (8 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 7) (pointOf 3) (pointOf 5) < 0
    rw [signedArea2_cycle, signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (3 : Label)) (j := (5 : Label)) (k := (7 : Label))
      (by decide) (by decide)

private theorem false_of_candidateBForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateBForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (candidateBForwardCore hrows)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (8 : Label)) (j := (13 : Label)) (k := (15 : Label))
      (by decide) (by decide)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (13 : Label)) (k := (15 : Label))
      (by decide) (by decide)

private theorem false_of_candidateBReflectedRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateBReflectedChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (candidateBReflectedCore hrows)
  · change 0 < signedArea2 (pointOf 8) (pointOf 3) (pointOf 1)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (3 : Label)) (k := (8 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 16) (pointOf 3) (pointOf 1)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (3 : Label)) (k := (16 : Label))
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

def v6ModelCoreRefinementClauses : Std.Sat.CNF Atom :=
  candidateAClauses ++ candidateBClauses

theorem v6ModelCoreRefinementClauses_length :
    v6ModelCoreRefinementClauses.length = 8 := by
  native_decide

theorem v6ModelCoreRefinementClauses_nodup :
    v6ModelCoreRefinementClauses.Nodup := by
  native_decide

theorem sourceAssign_v6ModelCoreRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ v6ModelCoreRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  rcases List.mem_append.mp hclause with hcandidateA | hcandidateB
  · exact sourceAssign_occurrenceClauses source candidateAHits
      (sourceAssign_candidateAClause source) clause hcandidateA
  · exact sourceAssign_occurrenceClauses source candidateBHits
      (sourceAssign_candidateBClause source) clause hcandidateB

def canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf :
    Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementCnf ++
    v6ModelCoreRefinementClauses

theorem canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf_length :
    canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf.length =
      7409788 := by
  simp [canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf,
    canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementCnf_length,
    v6ModelCoreRefinementClauses_length]

theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf
    {A : Finset ℝ²} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  rcases List.mem_append.mp hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementCnf
        source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_v6ModelCoreRefinementClauses source clause hsuffix

#print axioms sourceAssign_candidateAClause
#print axioms sourceAssign_candidateBClause
#print axioms v6ModelCoreRefinementClauses_nodup
#print axioms sourceAssign_v6ModelCoreRefinementClauses
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinementCnf

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV6ModelCoreRefinements
end Problem97

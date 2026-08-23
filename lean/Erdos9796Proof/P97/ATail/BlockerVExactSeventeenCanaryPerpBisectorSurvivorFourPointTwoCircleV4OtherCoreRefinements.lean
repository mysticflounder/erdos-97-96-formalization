/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements
import Erdos9796Proof.P97.ATail.KalmansonFourEqualitySchemas

/-!
# Source-valid duplicate-center and schema-M refinements from the exact-seventeen v4 ledger

The authenticated v4 survivor supplies one duplicate-center core and one five-row
schema-M obstruction. Each source adapter uses only the explicitly listed positive
selected-row hits before its four order/orientation clauses are appended.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinements

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

/- ## Duplicate-center obstruction -/

def duplicateCenterHits : List Hit :=
  [(0, 3), (0, 15), (3, 2), (3, 4), (3, 15),
    (14, 0), (14, 2), (14, 4), (15, 0), (15, 3)]

def duplicateCenterForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {3, 15} },
    { center := 3, support := {2, 4, 15} },
    { center := 14, support := {0, 2, 4} },
    { center := 15, support := {0, 3} }]

def duplicateCenterReflectedChoices : List (RowChoice Label) :=
  [{ center := 1, support := {13, 16} },
    { center := 2, support := {12, 14, 16} },
    { center := 13, support := {1, 12, 14} },
    { center := 16, support := {1, 13} }]

theorem duplicateCenterForwardCover :
    ∀ choice ∈ duplicateCenterForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ duplicateCenterHits := by
  decide

theorem duplicateCenterReflectedCover :
    ∀ choice ∈ duplicateCenterReflectedChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ duplicateCenterHits := by
  decide

def duplicateCenterForwardData : DuplicateCenterData Label := {
  p := 0
  q := 2
  r := 4
  a := 14
  b := 3
  ap_aq := ⟨(14, 0), [.row 14 0 2], (14, 2)⟩
  ap_ar := ⟨(14, 0), [.row 14 0 4], (14, 4)⟩
  bp_bq := ⟨(3, 0),
    [.flip 3 0, .row 0 3 15, .flip 0 15, .row 15 0 3,
      .flip 15 3, .row 3 15 2],
    (3, 2)⟩
  bp_br := ⟨(3, 0),
    [.flip 3 0, .row 0 3 15, .flip 0 15, .row 15 0 3,
      .flip 15 3, .row 3 15 4],
    (3, 4)⟩ }

def duplicateCenterReflectedData : DuplicateCenterData Label := {
  p := 16
  q := 14
  r := 12
  a := 2
  b := 13
  ap_aq := ⟨(2, 16), [.row 2 16 14], (2, 14)⟩
  ap_ar := ⟨(2, 16), [.row 2 16 12], (2, 12)⟩
  bp_bq := ⟨(13, 16),
    [.flip 13 16, .row 16 13 1, .flip 16 1, .row 1 16 13,
      .flip 1 13, .row 13 1 14],
    (13, 14)⟩
  bp_br := ⟨(13, 16),
    [.flip 13 16, .row 16 13 1, .flip 16 1, .row 1 16 13,
      .flip 1 13, .row 13 1 12],
    (13, 12)⟩ }

theorem duplicateCenterForwardData_check :
    duplicateCenterForwardData.check duplicateCenterForwardChoices = true := by
  native_decide

theorem duplicateCenterReflectedData_check :
    duplicateCenterReflectedData.check duplicateCenterReflectedChoices = true := by
  native_decide

private theorem false_of_duplicateCenterHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits duplicateCenterHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · have hrows :=
      ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_same
        source source.model.order direction rfl hsame duplicateCenterHits
        duplicateCenterForwardChoices duplicateCenterForwardCover hall
    rcases nonempty_duplicateCenterCore_of_positiveCheck hrows duplicateCenterForwardData
      duplicateCenterForwardData_check with ⟨core⟩
    exact Census554.EqualityCore.not_realizes_of_duplicateCenterCore core
      ⟨source.boundary, hreal⟩
  · have hrows :=
      ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_ne
        source source.model.order direction rfl hsame duplicateCenterHits
        duplicateCenterReflectedChoices duplicateCenterReflectedCover hall
    rcases nonempty_duplicateCenterCore_of_positiveCheck hrows duplicateCenterReflectedData
      duplicateCenterReflectedData_check with ⟨core⟩
    exact Census554.EqualityCore.not_realizes_of_duplicateCenterCore core
      ⟨source.boundary, hreal⟩

def duplicateCenterClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom := occurrenceClause duplicateCenterHits order direction

def duplicateCenterClauses : Std.Sat.CNF Atom := occurrenceClauses duplicateCenterHits

theorem sourceAssign_duplicateCenterClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (duplicateCenterClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_duplicateCenterHits source order direction horder.symm hall

/- ## Schema-M five-row obstruction -/

def schemaMHits : List Hit :=
  [(0, 1), (0, 3), (0, 15), (12, 0), (12, 1), (3, 2),
    (3, 15), (4, 2), (4, 9), (1, 0), (1, 9)]

def schemaMForwardChoices : List (RowChoice Label) :=
  [{ center := 0, support := {1, 3, 15} },
    { center := 12, support := {0, 1} },
    { center := 3, support := {2, 15} },
    { center := 4, support := {2, 9} },
    { center := 1, support := {0, 9} }]

def schemaMReflectedChoices : List (RowChoice Label) :=
  [{ center := 16, support := {1, 13, 15} },
    { center := 4, support := {15, 16} },
    { center := 13, support := {1, 14} },
    { center := 12, support := {7, 14} },
    { center := 15, support := {7, 16} }]

theorem schemaMForwardCover :
    ∀ choice ∈ schemaMForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ schemaMHits := by
  decide

theorem schemaMReflectedCover :
    ∀ choice ∈ schemaMReflectedChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ schemaMHits := by
  decide

private theorem labelIndex_sourceIndexEquiv_symm {A : Finset ℝ²}
    (source : SourceRealization A) (index : Label) :
    source.labelIndex
        ((sourceIndexEquiv source.model.order source.orientation).symm index) = index := by
  rw [source.labelIndex_eq]
  exact (sourceIndexEquiv source.model.order source.orientation).apply_symm_apply index

private theorem selectedFourClass_support_cast {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (hcenter : center₁ = center₂) (row : SelectedFourClass A center₁) :
    (hcenter ▸ row).support = row.support := by
  subst center₂
  rfl

private noncomputable def selectedRowAtPosition {A : Finset ℝ²}
    (source : SourceRealization A) (index : Label) :
    SelectedFourClass A (source.cardBoundary (source.toCardIndex index)) :=
  let row := source.selectedRow
    ((sourceIndexEquiv source.model.order source.orientation).symm index)
  have hcenter :
      source.boundary
          (source.labelIndex
            ((sourceIndexEquiv source.model.order source.orientation).symm index)) =
        source.cardBoundary (source.toCardIndex index) := by
    rw [SourceRealization.cardBoundary_toCardIndex,
      labelIndex_sourceIndexEquiv_symm]
  hcenter ▸ row

@[simp] private theorem selectedRowAtPosition_support {A : Finset ℝ²}
    (source : SourceRealization A) (index : Label) :
    (selectedRowAtPosition source index).support =
      (source.selectedRow
        ((sourceIndexEquiv source.model.order source.orientation).symm index)).support := by
  unfold selectedRowAtPosition
  apply selectedFourClass_support_cast

private theorem mem_selectedRowAtPosition_of_positiveRows {A : Finset ℝ²}
    (source : SourceRealization A) (choices : List (RowChoice Label))
    (hrows : PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected) choices)
    (choice : RowChoice Label) (hchoice : choice ∈ choices)
    (point : Label) (hpoint : point ∈ choice.support) :
    source.cardBoundary (source.toCardIndex point) ∈
      (selectedRowAtPosition source choice.center).support := by
  have hmem := hrows choice hchoice hpoint
  rw [mem_reindexRowPattern_iff] at hmem
  have hsource := source.mem_selectedRow_of_mem_model hmem
  rw [selectedRowAtPosition_support, SourceRealization.cardBoundary_toCardIndex]
  simpa only [labelIndex_sourceIndexEquiv_symm] using hsource

private theorem false_of_schemaMForwardRows {A : Finset ℝ²}
    (source : SourceRealization A)
    (hrows : PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected) schemaMForwardChoices) : False := by
  apply CapCrossingKalmansonBridge.false_of_five_selected_rows_in_eight_ccw_order_M
    source.carrier_convexIndep source.cardBoundary_injective source.cardBoundary_image
    source.cardBoundary_ccw
    (source.toCardIndex_lt (by decide : (0 : Label) < 1))
    (source.toCardIndex_lt (by decide : (1 : Label) < 2))
    (source.toCardIndex_lt (by decide : (2 : Label) < 3))
    (source.toCardIndex_lt (by decide : (3 : Label) < 4))
    (source.toCardIndex_lt (by decide : (4 : Label) < 9))
    (source.toCardIndex_lt (by decide : (9 : Label) < 12))
    (source.toCardIndex_lt (by decide : (12 : Label) < 15))
    (selectedRowAtPosition source 0) (selectedRowAtPosition source 12)
    (selectedRowAtPosition source 3) (selectedRowAtPosition source 4)
    (selectedRowAtPosition source 1)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows
      { center := 0, support := {1, 3, 15} } (by decide) 3 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows
      { center := 0, support := {1, 3, 15} } (by decide) 1 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows
      { center := 0, support := {1, 3, 15} } (by decide) 15 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows
      { center := 12, support := {0, 1} } (by decide) 0 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows
      { center := 12, support := {0, 1} } (by decide) 1 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows
      { center := 3, support := {2, 15} } (by decide) 2 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows
      { center := 3, support := {2, 15} } (by decide) 15 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows
      { center := 4, support := {2, 9} } (by decide) 2 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows
      { center := 4, support := {2, 9} } (by decide) 9 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows
      { center := 1, support := {0, 9} } (by decide) 0 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows
      { center := 1, support := {0, 9} } (by decide) 9 (by decide)

private theorem false_of_schemaMReflectedRows {A : Finset ℝ²}
    (source : SourceRealization A)
    (hrows : PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected) schemaMReflectedChoices) : False := by
  apply
    CapCrossingKalmansonBridge.false_of_five_selected_rows_in_eight_ccw_order_M_of_decreasing
    source.carrier_convexIndep source.cardBoundary_injective source.cardBoundary_image
    source.cardBoundary_ccw
    (source.toCardIndex_lt (by decide : (15 : Label) < 16))
    (source.toCardIndex_lt (by decide : (14 : Label) < 15))
    (source.toCardIndex_lt (by decide : (13 : Label) < 14))
    (source.toCardIndex_lt (by decide : (12 : Label) < 13))
    (source.toCardIndex_lt (by decide : (7 : Label) < 12))
    (source.toCardIndex_lt (by decide : (4 : Label) < 7))
    (source.toCardIndex_lt (by decide : (1 : Label) < 4))
    (selectedRowAtPosition source 16) (selectedRowAtPosition source 4)
    (selectedRowAtPosition source 13) (selectedRowAtPosition source 12)
    (selectedRowAtPosition source 15)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows
      { center := 16, support := {1, 13, 15} } (by decide) 13 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows
      { center := 16, support := {1, 13, 15} } (by decide) 15 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows
      { center := 16, support := {1, 13, 15} } (by decide) 1 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows
      { center := 4, support := {15, 16} } (by decide) 16 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows
      { center := 4, support := {15, 16} } (by decide) 15 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows
      { center := 13, support := {1, 14} } (by decide) 14 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows
      { center := 13, support := {1, 14} } (by decide) 1 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows
      { center := 12, support := {7, 14} } (by decide) 14 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows
      { center := 12, support := {7, 14} } (by decide) 7 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows
      { center := 15, support := {7, 16} } (by decide) 16 (by decide)
  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows
      { center := 15, support := {7, 16} } (by decide) 7 (by decide)

private theorem false_of_schemaMHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits schemaMHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  by_cases hsame : source.orientation = direction
  · exact false_of_schemaMForwardRows source
      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_same
        source source.model.order direction rfl hsame schemaMHits
        schemaMForwardChoices schemaMForwardCover hall)
  · exact false_of_schemaMReflectedRows source
      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_ne
        source source.model.order direction rfl hsame schemaMHits
        schemaMReflectedChoices schemaMReflectedCover hall)

def schemaMClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom := occurrenceClause schemaMHits order direction

def schemaMClauses : Std.Sat.CNF Atom := occurrenceClauses schemaMHits

theorem sourceAssign_schemaMClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (schemaMClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_schemaMHits source order direction horder.symm hall

/- ## Complete two-family suffix and successor CNF -/

def fourPointTwoCircleV4OtherCoreRefinementClauses : Std.Sat.CNF Atom :=
  duplicateCenterClauses ++ schemaMClauses

theorem fourPointTwoCircleV4OtherCoreRefinementClauses_length :
    fourPointTwoCircleV4OtherCoreRefinementClauses.length = 8 := by
  native_decide

theorem fourPointTwoCircleV4OtherCoreRefinementClauses_nodup :
    fourPointTwoCircleV4OtherCoreRefinementClauses.Nodup := by
  native_decide

theorem sourceAssign_fourPointTwoCircleV4OtherCoreRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ fourPointTwoCircleV4OtherCoreRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  rcases List.mem_append.mp hclause with hduplicate | hschemaM
  · exact sourceAssign_occurrenceClauses source duplicateCenterHits
      (sourceAssign_duplicateCenterClause source) clause hduplicate
  · exact sourceAssign_occurrenceClauses source schemaMHits
      (sourceAssign_schemaMClause source) clause hschemaM

def canaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinementCnf :
    Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf ++
    fourPointTwoCircleV4OtherCoreRefinementClauses

theorem canaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinementCnf_length :
    canaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinementCnf.length =
      7409524 := by
  simp [canaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinementCnf,
    canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf_length,
    fourPointTwoCircleV4OtherCoreRefinementClauses_length]

theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinementCnf
    {A : Finset ℝ²} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  rcases List.mem_append.mp hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_fourPointTwoCircleV4OtherCoreRefinementClauses source clause hsuffix

#print axioms sourceAssign_duplicateCenterClause
#print axioms sourceAssign_schemaMClause
#print axioms fourPointTwoCircleV4OtherCoreRefinementClauses_nodup
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinementCnf

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinements
end Problem97

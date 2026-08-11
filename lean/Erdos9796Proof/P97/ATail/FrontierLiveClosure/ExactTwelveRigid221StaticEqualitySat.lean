/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221StaticEqualityCnf

/-!
# Source satisfaction of the static equality-clause layer
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace StaticEqualitySat

open Census554.CoverCnf
open Census554.EqualityCore
open FrozenNextRowJobCnf
open StaticEqualityCnf
open StaticRelationAssignment
open StaticRelationLayout
open StaticRelationSemantics
open scoped EuclideanGeometry

abbrev Label := ExactTwelveCarrierIngress.Label

def rowDatumValid (datum : RowImplicationDatum) : Bool :=
  decide (datum.2.1 < SafeCoverCnf.candCount datum.1.val) &&
  ((SafeCoverCnf.candMasks datum.1.val).getD datum.2.1 0).testBit
    datum.2.2.1.val &&
  ((SafeCoverCnf.candMasks datum.1.val).getD datum.2.1 0).testBit
    datum.2.2.2.val &&
  decide (0 < relationVar (datum.1, datum.2.2.1)
    (datum.1, datum.2.2.2))

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem rowImplicationData_valid :
    rowImplicationData.all rowDatumValid = true := by
  native_decide

theorem rowDatum_facts (datum : RowImplicationDatum)
    (hdatum : datum ∈ rowImplicationData) :
    datum.2.1 < SafeCoverCnf.candCount datum.1.val ∧
    ((SafeCoverCnf.candMasks datum.1.val).getD datum.2.1 0).testBit
      datum.2.2.1.val = true ∧
    ((SafeCoverCnf.candMasks datum.1.val).getD datum.2.1 0).testBit
      datum.2.2.2.val = true ∧
    0 < relationVar (datum.1, datum.2.2.1)
      (datum.1, datum.2.2.2) := by
  have hvalid := (List.all_eq_true.mp rowImplicationData_valid) datum hdatum
  simp only [rowDatumValid, Bool.and_eq_true, decide_eq_true_eq] at hvalid
  rcases hvalid with ⟨⟨⟨hindex, hleft⟩, hright⟩, hpositive⟩
  exact ⟨hindex, hleft, hright, hpositive⟩

def transitivityDatumValid (datum : Nat × Nat × Nat) : Bool :=
  let first := edgeAt datum.1
  let second := edgeAt datum.2.1
  let third := edgeAt datum.2.2
  decide (0 < relationVar first second) &&
  decide (0 < relationVar first third) &&
  decide (0 < relationVar second third)

set_option maxHeartbeats 0 in
set_option linter.style.nativeDecide false in
theorem relationTripleData_valid :
    relationTripleData.all transitivityDatumValid = true := by
  native_decide

theorem transitivityDatum_facts (datum : Nat × Nat × Nat)
    (hdatum : datum ∈ relationTripleData) :
    let first := edgeAt datum.1
    let second := edgeAt datum.2.1
    let third := edgeAt datum.2.2
    0 < relationVar first second ∧
    0 < relationVar first third ∧
    0 < relationVar second third := by
  have hvalid := (List.all_eq_true.mp relationTripleData_valid) datum hdatum
  simp only [transitivityDatumValid, Bool.and_eq_true, decide_eq_true_eq] at hvalid
  rcases hvalid with ⟨⟨hfirstSecond, hfirstThird⟩, hsecondThird⟩
  exact ⟨hfirstSecond, hfirstThird, hsecondThird⟩

def duplicateCenterDatumValid (datum : DuplicateCenterDatum) : Bool :=
  decide (datum.1 ≠ datum.2.1) &&
  decide (datum.2.2.1 ≠ datum.2.2.2.1) &&
  decide (datum.2.2.1 ≠ datum.2.2.2.2) &&
  decide (datum.2.2.2.1 ≠ datum.2.2.2.2) &&
  decide (0 < relationVar (datum.1, datum.2.2.1)
    (datum.1, datum.2.2.2.1)) &&
  decide (0 < relationVar (datum.1, datum.2.2.1)
    (datum.1, datum.2.2.2.2)) &&
  decide (0 < relationVar (datum.2.1, datum.2.2.1)
    (datum.2.1, datum.2.2.2.1)) &&
  decide (0 < relationVar (datum.2.1, datum.2.2.1)
    (datum.2.1, datum.2.2.2.2))

set_option maxHeartbeats 0 in
set_option linter.style.nativeDecide false in
theorem duplicateCenterData_valid :
    duplicateCenterData.all duplicateCenterDatumValid = true := by
  native_decide

theorem duplicateCenterDatum_facts (datum : DuplicateCenterDatum)
    (hdatum : datum ∈ duplicateCenterData) :
    datum.1 ≠ datum.2.1 ∧
    datum.2.2.1 ≠ datum.2.2.2.1 ∧
    datum.2.2.1 ≠ datum.2.2.2.2 ∧
    datum.2.2.2.1 ≠ datum.2.2.2.2 ∧
    0 < relationVar (datum.1, datum.2.2.1)
      (datum.1, datum.2.2.2.1) ∧
    0 < relationVar (datum.1, datum.2.2.1)
      (datum.1, datum.2.2.2.2) ∧
    0 < relationVar (datum.2.1, datum.2.2.1)
      (datum.2.1, datum.2.2.2.1) ∧
    0 < relationVar (datum.2.1, datum.2.2.1)
      (datum.2.1, datum.2.2.2.2) := by
  have hvalid := (List.all_eq_true.mp duplicateCenterData_valid) datum hdatum
  simp only [duplicateCenterDatumValid, Bool.and_eq_true, decide_eq_true_eq]
    at hvalid
  rcases hvalid with
    ⟨⟨⟨⟨⟨⟨⟨hab, hpq⟩, hpr⟩, hqr⟩, h₁⟩, h₂⟩, h₃⟩, h₄⟩
  exact ⟨hab, hpq, hpr, hqr, h₁, h₂, h₃, h₄⟩

theorem rowImplicationClause_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (cell : FrozenNextRowCell) (blocker : Fin 5 → Label) (d : Label)
    (pointOf : Label → ℝ²) (hreal : Realizes row pointOf)
    (datum : RowImplicationDatum) (hdatum : datum ∈ rowImplicationData) :
    evalClauseD (staticAssign cell blocker row d pointOf)
      (rowImplicationClause datum) = true := by
  obtain ⟨hindex, hleft, hright, hpositive⟩ := rowDatum_facts datum hdatum
  let σ := staticAssign cell blocker row d pointOf
  have hmetric := staticAssign_encodesMetricEquality
    cell blocker row d pointOf
  have hchoice : σ (SafeCoverCnf.xVar datum.1.val datum.2.1) = true →
      datum.2.2.1 ∈ row datum.1 ∧ datum.2.2.2 ∈ row datum.1 := by
    intro hselected
    exact ⟨
      mem_row_of_selected_candidate_bit hrow cell blocker d pointOf
        datum.1 datum.2.2.1 datum.2.1 hindex hleft hselected,
      mem_row_of_selected_candidate_bit hrow cell blocker d pointOf
        datum.1 datum.2.2.2 datum.2.1 hindex hright hselected⟩
  simpa [rowImplicationClause, σ] using
    evalClauseD_rowImplication σ relationVar hmetric hreal
      (SafeCoverCnf.xVar datum.1.val datum.2.1) hchoice hpositive

theorem transitivityClausesAt_sat
    {row : RowPattern Label} (cell : FrozenNextRowCell)
    (blocker : Fin 5 → Label) (d : Label) (pointOf : Label → ℝ²)
    (datum : Nat × Nat × Nat) (hdatum : datum ∈ relationTripleData) :
    ∀ c ∈ transitivityClausesAt datum,
      evalClauseD (staticAssign cell blocker row d pointOf) c = true := by
  intro c hc
  let σ := staticAssign cell blocker row d pointOf
  let first := edgeAt datum.1
  let second := edgeAt datum.2.1
  let third := edgeAt datum.2.2
  obtain ⟨hfirstSecond, hfirstThird, hsecondThird⟩ :=
    transitivityDatum_facts datum hdatum
  have hmetric := staticAssign_encodesMetricEquality
    cell blocker row d pointOf
  simp only [transitivityClausesAt, List.mem_cons, List.not_mem_nil,
    or_false] at hc
  rcases hc with rfl | rfl | rfl
  · exact evalClauseD_relationTransitivity σ relationVar hmetric
      first second third hfirstSecond hsecondThird hfirstThird
  · simpa [relationVar_comm] using
      evalClauseD_relationTransitivity σ relationVar hmetric
        second first third (by simpa [relationVar_comm] using hfirstSecond)
        hfirstThird hsecondThird
  · simpa [relationVar_comm] using
      evalClauseD_relationTransitivity σ relationVar hmetric
        first third second hfirstThird
        (by simpa [relationVar_comm] using hsecondThird) hfirstSecond

theorem duplicateCenterClause_sat
    {row : RowPattern Label} (cell : FrozenNextRowCell)
    (blocker : Fin 5 → Label) (d : Label) (pointOf : Label → ℝ²)
    (hreal : Realizes row pointOf) (datum : DuplicateCenterDatum)
    (hdatum : datum ∈ duplicateCenterData) :
    evalClauseD (staticAssign cell blocker row d pointOf)
      (duplicateCenterClause datum) = true := by
  obtain ⟨hab, hpq, hpr, hqr, h₁, h₂, h₃, h₄⟩ :=
    duplicateCenterDatum_facts datum hdatum
  let σ := staticAssign cell blocker row d pointOf
  have hmetric := staticAssign_encodesMetricEquality
    cell blocker row d pointOf
  simpa [duplicateCenterClause, σ] using
    evalClauseD_duplicateCenter σ relationVar hmetric hreal hpq hpr hqr hab
      (by intro v hv; simp only [List.mem_cons, List.not_mem_nil,
        or_false] at hv; rcases hv with rfl | rfl | rfl | rfl <;> assumption)

/-- Every v1 equality-layer clause is satisfied by the source/static
geometric assignment. -/
theorem clauseDelta_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (cell : FrozenNextRowCell) (blocker : Fin 5 → Label) (d : Label)
    (pointOf : Label → ℝ²) (hreal : Realizes row pointOf) :
    ∀ c ∈ clauseDelta,
      evalClauseD (staticAssign cell blocker row d pointOf) c = true := by
  intro c hc
  rcases List.mem_append.mp hc with hequality | hduplicate
  · rcases List.mem_append.mp hequality with hrowClause | htrans
    · obtain ⟨datum, hdatum, rfl⟩ := List.mem_map.mp hrowClause
      exact rowImplicationClause_sat hrow cell blocker d pointOf hreal datum hdatum
    · obtain ⟨datum, hdatum, hc⟩ := List.mem_flatMap.mp htrans
      exact transitivityClausesAt_sat cell blocker d pointOf datum hdatum c hc
  · obtain ⟨datum, hdatum, rfl⟩ := List.mem_map.mp hduplicate
    exact duplicateCenterClause_sat cell blocker d pointOf hreal datum hdatum

end StaticEqualitySat
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97

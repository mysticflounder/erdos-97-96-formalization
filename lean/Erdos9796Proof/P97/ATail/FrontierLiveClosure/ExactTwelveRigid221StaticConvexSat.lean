/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221StaticConvexCnf

/-!
# Source satisfaction of the static convex perpendicular-bisector layer
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace StaticConvexSat

open Census554.CoverCnf
open Census554.EqualityCore
open FrozenNextRowJobCnf
open StaticConvexCnf
open StaticRelationAssignment
open StaticRelationLayout
open StaticRelationSemantics
open scoped EuclideanGeometry

abbrev Label := ExactTwelveCarrierIngress.Label

def perpBisectorVars (datum : PerpBisectorDatum) : List Nat :=
  let a := datum.1
  let b := datum.2.1
  let p := datum.2.2.1
  let q := datum.2.2.2.1
  let r := datum.2.2.2.2
  [relationVar (p, a) (p, b), relationVar (q, a) (q, b),
    relationVar (r, a) (r, b)]

def perpBisectorDatumValid (datum : PerpBisectorDatum) : Bool :=
  decide (datum.1 ≠ datum.2.1) &&
  decide (datum.2.2.1 ≠ datum.2.2.2.1) &&
  decide (datum.2.2.1 ≠ datum.2.2.2.2) &&
  decide (datum.2.2.2.1 ≠ datum.2.2.2.2) &&
  (perpBisectorVars datum).all fun v => decide (0 < v)

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem perpBisectorData_valid :
    perpBisectorData.all perpBisectorDatumValid = true := by
  native_decide

theorem perpBisectorDatum_facts (datum : PerpBisectorDatum)
    (hdatum : datum ∈ perpBisectorData) :
    datum.1 ≠ datum.2.1 ∧
    datum.2.2.1 ≠ datum.2.2.2.1 ∧
    datum.2.2.1 ≠ datum.2.2.2.2 ∧
    datum.2.2.2.1 ≠ datum.2.2.2.2 ∧
    ∀ v ∈ perpBisectorVars datum, 0 < v := by
  have hvalid := (List.all_eq_true.mp perpBisectorData_valid) datum hdatum
  simp only [perpBisectorDatumValid, Bool.and_eq_true, decide_eq_true_eq]
    at hvalid
  rcases hvalid with ⟨⟨⟨⟨hab, hpq⟩, hpr⟩, hqr⟩, hpositive⟩
  refine ⟨hab, hpq, hpr, hqr, ?_⟩
  intro v hv
  exact of_decide_eq_true ((List.all_eq_true.mp hpositive) v hv)

theorem perpBisectorClause_sat
    {row : RowPattern Label} (cell : FrozenNextRowCell)
    (blocker : Fin 5 → Label) (d : Label) (pointOf : Label → ℝ²)
    (hreal : Realizes row pointOf) {A : Finset ℝ²}
    (hconv : ConvexIndep A) (hmem : ∀ y, pointOf y ∈ A)
    (datum : PerpBisectorDatum) (hdatum : datum ∈ perpBisectorData) :
    evalClauseD (staticAssign cell blocker row d pointOf)
      (perpBisectorClause datum) = true := by
  obtain ⟨hab, hpq, hpr, hqr, hpositive⟩ :=
    perpBisectorDatum_facts datum hdatum
  let σ := staticAssign cell blocker row d pointOf
  have hmetric := staticAssign_encodesMetricEquality
    cell blocker row d pointOf
  simpa [perpBisectorClause, perpBisectorVars, σ] using
    evalClauseD_perpBisector σ relationVar hmetric hreal hconv hmem
      hab hpq hpr hqr hpositive

/-- Every v3 convex-layer clause is satisfied by the source/static geometric
assignment. -/
theorem clauseDelta_sat
    {row : RowPattern Label} (cell : FrozenNextRowCell)
    (blocker : Fin 5 → Label) (d : Label) (pointOf : Label → ℝ²)
    (hreal : Realizes row pointOf) {A : Finset ℝ²}
    (hconv : ConvexIndep A) (hmem : ∀ y, pointOf y ∈ A) :
    ∀ c ∈ clauseDelta,
      evalClauseD (staticAssign cell blocker row d pointOf) c = true := by
  intro c hc
  obtain ⟨datum, hdatum, rfl⟩ := List.mem_map.mp hc
  exact perpBisectorClause_sat cell blocker d pointOf hreal hconv hmem
    datum hdatum

end StaticConvexSat
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221StaticGeometryCnf

/-!
# Source satisfaction of the static equilateral-bisector layer
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace StaticGeometrySat

open Census554.CoverCnf
open Census554.EqualityCore
open FrozenNextRowJobCnf
open StaticGeometryCnf
open StaticRelationAssignment
open StaticRelationLayout
open StaticRelationSemantics
open scoped EuclideanGeometry

abbrev Label := ExactTwelveCarrierIngress.Label

def equilateralVars (datum : EquilateralDatum) : List Nat :=
  let p := datum.1
  let a := datum.2.1
  let b := datum.2.2.1
  let c := datum.2.2.2.1
  let x := datum.2.2.2.2
  [relationVar (p, a) (p, b), relationVar (p, a) (p, c),
    relationVar (p, a) (a, b), relationVar (p, a) (a, x),
    relationVar (p, a) (b, x), relationVar (c, x) (c, a)]

def equilateralDatumValid (datum : EquilateralDatum) : Bool :=
  decide (datum.1 ≠ datum.2.1) &&
  decide (datum.1 ≠ datum.2.2.2.2) &&
  decide (datum.2.2.2.1 ≠ datum.2.2.1) &&
  (equilateralVars datum).all fun v => decide (0 < v)

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem equilateralData_valid :
    equilateralData.all equilateralDatumValid = true := by
  native_decide

theorem equilateralDatum_facts (datum : EquilateralDatum)
    (hdatum : datum ∈ equilateralData) :
    datum.1 ≠ datum.2.1 ∧
    datum.1 ≠ datum.2.2.2.2 ∧
    datum.2.2.2.1 ≠ datum.2.2.1 ∧
    ∀ v ∈ equilateralVars datum, 0 < v := by
  have hvalid := (List.all_eq_true.mp equilateralData_valid) datum hdatum
  simp only [equilateralDatumValid, Bool.and_eq_true, decide_eq_true_eq]
    at hvalid
  rcases hvalid with ⟨⟨⟨hpa, hpx⟩, hcb⟩, hpositive⟩
  refine ⟨hpa, hpx, hcb, ?_⟩
  intro v hv
  exact of_decide_eq_true ((List.all_eq_true.mp hpositive) v hv)

theorem equilateralClause_sat
    {row : RowPattern Label} (cell : FrozenNextRowCell)
    (blocker : Fin 5 → Label) (d : Label) (pointOf : Label → ℝ²)
    (hreal : Realizes row pointOf) (datum : EquilateralDatum)
    (hdatum : datum ∈ equilateralData) :
    evalClauseD (staticAssign cell blocker row d pointOf)
      (equilateralClause datum) = true := by
  obtain ⟨hpa, hpx, hcb, hpositive⟩ := equilateralDatum_facts datum hdatum
  let σ := staticAssign cell blocker row d pointOf
  have hmetric := staticAssign_encodesMetricEquality
    cell blocker row d pointOf
  simpa [equilateralClause, equilateralVars, σ] using
    evalClauseD_equilateralBisector σ relationVar hmetric hreal
      hpa hpx hcb hpositive

/-- Every v2 geometry-layer clause is satisfied by the source/static
geometric assignment. -/
theorem clauseDelta_sat
    {row : RowPattern Label} (cell : FrozenNextRowCell)
    (blocker : Fin 5 → Label) (d : Label) (pointOf : Label → ℝ²)
    (hreal : Realizes row pointOf) :
    ∀ c ∈ clauseDelta,
      evalClauseD (staticAssign cell blocker row d pointOf) c = true := by
  intro c hc
  obtain ⟨datum, hdatum, rfl⟩ := List.mem_map.mp hc
  exact equilateralClause_sat cell blocker d pointOf hreal datum hdatum

end StaticGeometrySat
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97

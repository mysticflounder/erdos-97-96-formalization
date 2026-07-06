/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U1Depth5Prefix

/-!
# Generated U1 SparsePoly unit checker shard

This file is generated from checked liftstd cofactor sidecars.  It only
contains concrete data terms, Boolean checker proofs for
`U5GramCert.unitIdealCertChecker`, and optional theorem-facing replay
layers selected by the emitter flags.  It does not prove the geometric
metric producers that appear as hypotheses.
Checker proofs in this file use `native_decide`.  Before committing
generated checker files to a proof spine, audit them under the project
`native_decide` policy.
-/

set_option linter.style.longLine false
set_option linter.style.nativeDecide false

namespace Problem97
namespace U1Depth5SourceUnitGenerated

open U5GramCert

set_option maxHeartbeats 0 in
-- Generated certificate data can exceed the default heartbeat budget.
/-- SparsePoly fact table for task `1ca0a033ec4ff97b`. -/
def cert_00001_1ca0a033ec4ff97b_facts : List SparsePoly :=
[
  coordSqNormMinusOne 10 11,
  coordSqNormMinusOne 12 13,
  coordSqNormMinusOne 14 15,
  coordSqDistMinusVar 0 1 2 3 16,
  oneMinusVar 17,
  coordSqNormMinusVar 10 11 17,
  coordSqNormMinusVar 12 13 17,
  coordSqNormMinusVar 14 15 17,
  coordSqDistUnitXMinusVar 0 1 18,
  oneMinusVar 18,
  coordSqDistMinusVar 10 11 0 1 19,
  coordSqDistMinusVar 12 13 2 3 20,
  coordSqDistMinusVar 12 13 8 9 20,
  coordSqNormMinusVar 12 13 20,
  coordSqDistUnitXMinusVar 12 13 20,
  coordSqDistMinusVar 14 15 0 1 21,
  coordSqDistMinusVar 14 15 2 3 21,
  coordSqNormMinusVar 14 15 21,
  coordSqDistMinusVar 14 15 10 11 21,
  coordSqDistMinusVar 0 1 12 13 16,
  rabinowitschSlackFact 22 ((coordSqDistUnitXPoly 12 13) ++ neg (coordSqDistUnitXPoly 0 1))
]

set_option maxHeartbeats 0 in
-- Generated certificate data can exceed the default heartbeat budget.
/-- SparsePoly cofactor list for task `1ca0a033ec4ff97b`. -/
def cert_00001_1ca0a033ec4ff97b_cofactors : List (ℕ × SparsePoly) :=
[
  (0, []),
  (1, []),
  (2, []),
  (3, []),
  (4, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-1 : ℚ))]),
  (5, []),
  (6, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (1 : ℚ))]),
  (7, []),
  (8, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-1 : ℚ))]),
  (9, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (1 : ℚ))]),
  (10, []),
  (11, []),
  (12, []),
  (13, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-1 : ℚ))]),
  (14, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (1 : ℚ))]),
  (15, []),
  (16, []),
  (17, []),
  (18, []),
  (19, []),
  (20, [([], (-1 : ℚ))])
]

set_option maxHeartbeats 0 in
-- Generated certificate checking can exceed the default heartbeat budget.
/-- The SparsePoly unit checker accepts task `1ca0a033ec4ff97b`. -/
theorem cert_00001_1ca0a033ec4ff97b_checker :
    unitIdealCertChecker cert_00001_1ca0a033ec4ff97b_facts cert_00001_1ca0a033ec4ff97b_cofactors = true := by
  native_decide

/-- The SparsePoly unit certificate for task `1ca0a033ec4ff97b`
contradicts any valuation that makes every recorded source fact
evaluate to zero.  This is the theorem-facing handoff from the
Boolean checker to the geometric fact-evaluation layer. -/
theorem cert_00001_1ca0a033ec4ff97b_false_of_facts_eval_zero (ν : ℕ → ℝ)
    (hfacts : ∀ f ∈ cert_00001_1ca0a033ec4ff97b_facts, eval ν f = 0) : False := by
  exact false_of_unitIdealCertChecker ν cert_00001_1ca0a033ec4ff97b_facts cert_00001_1ca0a033ec4ff97b_cofactors
    cert_00001_1ca0a033ec4ff97b_checker hfacts

/-- Semantic source-fact evaluation for task `1ca0a033ec4ff97b`.
The hypotheses are the coordinate/radius equations that the geometric
producer must prove for this concrete source UNIT payload. -/
theorem cert_00001_1ca0a033ec4ff97b_facts_eval_zero_of_semantic_equalities (ν : ℕ → ℝ)
    (hfact_0 : ν 10 ^ 2 + ν 11 ^ 2 = 1)
    (hfact_1 : ν 12 ^ 2 + ν 13 ^ 2 = 1)
    (hfact_2 : ν 14 ^ 2 + ν 15 ^ 2 = 1)
    (hfact_3 : (ν 0 - ν 2) ^ 2 + (ν 1 - ν 3) ^ 2 = ν 16)
    (hfact_4 : ν 17 = 1)
    (hfact_5 : ν 10 ^ 2 + ν 11 ^ 2 = ν 17)
    (hfact_6 : ν 12 ^ 2 + ν 13 ^ 2 = ν 17)
    (hfact_7 : ν 14 ^ 2 + ν 15 ^ 2 = ν 17)
    (hfact_8 : (ν 0 - 1) ^ 2 + ν 1 ^ 2 = ν 18)
    (hfact_9 : ν 18 = 1)
    (hfact_10 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_11 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_12 : (ν 12 - ν 8) ^ 2 + (ν 13 - ν 9) ^ 2 = ν 20)
    (hfact_13 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_14 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_15 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_16 : (ν 14 - ν 2) ^ 2 + (ν 15 - ν 3) ^ 2 = ν 21)
    (hfact_17 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21)
    (hfact_18 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21)
    (hfact_19 : (ν 0 - ν 12) ^ 2 + (ν 1 - ν 13) ^ 2 = ν 16)
    (hfact_20 : ν 22 = (eval ν ((coordSqDistUnitXPoly 12 13) ++ neg (coordSqDistUnitXPoly 0 1)))⁻¹ ∧ eval ν ((coordSqDistUnitXPoly 12 13) ++ neg (coordSqDistUnitXPoly 0 1)) ≠ 0) :
    ∀ f ∈ cert_00001_1ca0a033ec4ff97b_facts, eval ν f = 0 := by
  intro f hf
  simp only [cert_00001_1ca0a033ec4ff97b_facts, List.mem_cons, List.not_mem_nil, or_false] at hf
  rcases hf with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact eval_coordSqNormMinusOne_eq_zero_of_eq ν hfact_0
  · exact eval_coordSqNormMinusOne_eq_zero_of_eq ν hfact_1
  · exact eval_coordSqNormMinusOne_eq_zero_of_eq ν hfact_2
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_3
  · exact eval_oneMinusVar_eq_zero_of_eq ν hfact_4
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_5
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_6
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_7
  · exact eval_coordSqDistUnitXMinusVar_eq_zero_of_eq ν hfact_8
  · exact eval_oneMinusVar_eq_zero_of_eq ν hfact_9
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_10
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_11
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_12
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_13
  · exact eval_coordSqDistUnitXMinusVar_eq_zero_of_eq ν hfact_14
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_15
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_16
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_17
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_18
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_19
  · exact eval_rabinowitschSlackFact_eq_zero_of_inv ν hfact_20.1 hfact_20.2

/-- The source UNIT certificate for task `1ca0a033ec4ff97b`
contradicts the concrete semantic source equations. -/
theorem cert_00001_1ca0a033ec4ff97b_false_of_semantic_equalities (ν : ℕ → ℝ)
    (hfact_0 : ν 10 ^ 2 + ν 11 ^ 2 = 1)
    (hfact_1 : ν 12 ^ 2 + ν 13 ^ 2 = 1)
    (hfact_2 : ν 14 ^ 2 + ν 15 ^ 2 = 1)
    (hfact_3 : (ν 0 - ν 2) ^ 2 + (ν 1 - ν 3) ^ 2 = ν 16)
    (hfact_4 : ν 17 = 1)
    (hfact_5 : ν 10 ^ 2 + ν 11 ^ 2 = ν 17)
    (hfact_6 : ν 12 ^ 2 + ν 13 ^ 2 = ν 17)
    (hfact_7 : ν 14 ^ 2 + ν 15 ^ 2 = ν 17)
    (hfact_8 : (ν 0 - 1) ^ 2 + ν 1 ^ 2 = ν 18)
    (hfact_9 : ν 18 = 1)
    (hfact_10 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_11 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_12 : (ν 12 - ν 8) ^ 2 + (ν 13 - ν 9) ^ 2 = ν 20)
    (hfact_13 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_14 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_15 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_16 : (ν 14 - ν 2) ^ 2 + (ν 15 - ν 3) ^ 2 = ν 21)
    (hfact_17 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21)
    (hfact_18 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21)
    (hfact_19 : (ν 0 - ν 12) ^ 2 + (ν 1 - ν 13) ^ 2 = ν 16)
    (hfact_20 : ν 22 = (eval ν ((coordSqDistUnitXPoly 12 13) ++ neg (coordSqDistUnitXPoly 0 1)))⁻¹ ∧ eval ν ((coordSqDistUnitXPoly 12 13) ++ neg (coordSqDistUnitXPoly 0 1)) ≠ 0) : False := by
  exact cert_00001_1ca0a033ec4ff97b_false_of_facts_eval_zero ν
    (cert_00001_1ca0a033ec4ff97b_facts_eval_zero_of_semantic_equalities ν hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6 hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13 hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19 hfact_20)

/-- Semantic source-fact evaluation for task `1ca0a033ec4ff97b`
after assigning the Rabinowitsch slack variable to the inverse of the
stripped target.  The target nonzero hypothesis is the endpoint
normalization obligation for this concrete source UNIT payload. -/
theorem cert_00001_1ca0a033ec4ff97b_facts_eval_zero_of_semantic_equalities_slack_update (ν : ℕ → ℝ)
    (hfact_0 : ν 10 ^ 2 + ν 11 ^ 2 = 1)
    (hfact_1 : ν 12 ^ 2 + ν 13 ^ 2 = 1)
    (hfact_2 : ν 14 ^ 2 + ν 15 ^ 2 = 1)
    (hfact_3 : (ν 0 - ν 2) ^ 2 + (ν 1 - ν 3) ^ 2 = ν 16)
    (hfact_4 : ν 17 = 1)
    (hfact_5 : ν 10 ^ 2 + ν 11 ^ 2 = ν 17)
    (hfact_6 : ν 12 ^ 2 + ν 13 ^ 2 = ν 17)
    (hfact_7 : ν 14 ^ 2 + ν 15 ^ 2 = ν 17)
    (hfact_8 : (ν 0 - 1) ^ 2 + ν 1 ^ 2 = ν 18)
    (hfact_9 : ν 18 = 1)
    (hfact_10 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_11 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_12 : (ν 12 - ν 8) ^ 2 + (ν 13 - ν 9) ^ 2 = ν 20)
    (hfact_13 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_14 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_15 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_16 : (ν 14 - ν 2) ^ 2 + (ν 15 - ν 3) ^ 2 = ν 21)
    (hfact_17 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21)
    (hfact_18 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21)
    (hfact_19 : (ν 0 - ν 12) ^ 2 + (ν 1 - ν 13) ^ 2 = ν 16)
    (htarget_ne : eval ν ((coordSqDistUnitXPoly 12 13) ++ neg (coordSqDistUnitXPoly 0 1)) ≠ 0) :
    ∀ f ∈ cert_00001_1ca0a033ec4ff97b_facts, eval (Function.update ν 22 (eval ν ((coordSqDistUnitXPoly 12 13) ++ neg (coordSqDistUnitXPoly 0 1)))⁻¹) f = 0 := by
  exact cert_00001_1ca0a033ec4ff97b_facts_eval_zero_of_semantic_equalities (Function.update ν 22 (eval ν ((coordSqDistUnitXPoly 12 13) ++ neg (coordSqDistUnitXPoly 0 1)))⁻¹)
    (by simpa [Function.update] using hfact_0)
    (by simpa [Function.update] using hfact_1)
    (by simpa [Function.update] using hfact_2)
    (by simpa [Function.update] using hfact_3)
    (by simpa [Function.update] using hfact_4)
    (by simpa [Function.update] using hfact_5)
    (by simpa [Function.update] using hfact_6)
    (by simpa [Function.update] using hfact_7)
    (by simpa [Function.update] using hfact_8)
    (by simpa [Function.update] using hfact_9)
    (by simpa [Function.update] using hfact_10)
    (by simpa [Function.update] using hfact_11)
    (by simpa [Function.update] using hfact_12)
    (by simpa [Function.update] using hfact_13)
    (by simpa [Function.update] using hfact_14)
    (by simpa [Function.update] using hfact_15)
    (by simpa [Function.update] using hfact_16)
    (by simpa [Function.update] using hfact_17)
    (by simpa [Function.update] using hfact_18)
    (by simpa [Function.update] using hfact_19)
    (rabinowitschSlack_update_hyp ν (s := 22) (target := ((coordSqDistUnitXPoly 12 13) ++ neg (coordSqDistUnitXPoly 0 1))) (by decide) htarget_ne)

/-- The source UNIT certificate for task `1ca0a033ec4ff97b`
contradicts the semantic source equations after Rabinowitsch slack
assignment from a nonzero endpoint target. -/
theorem cert_00001_1ca0a033ec4ff97b_false_of_semantic_equalities_slack_update (ν : ℕ → ℝ)
    (hfact_0 : ν 10 ^ 2 + ν 11 ^ 2 = 1)
    (hfact_1 : ν 12 ^ 2 + ν 13 ^ 2 = 1)
    (hfact_2 : ν 14 ^ 2 + ν 15 ^ 2 = 1)
    (hfact_3 : (ν 0 - ν 2) ^ 2 + (ν 1 - ν 3) ^ 2 = ν 16)
    (hfact_4 : ν 17 = 1)
    (hfact_5 : ν 10 ^ 2 + ν 11 ^ 2 = ν 17)
    (hfact_6 : ν 12 ^ 2 + ν 13 ^ 2 = ν 17)
    (hfact_7 : ν 14 ^ 2 + ν 15 ^ 2 = ν 17)
    (hfact_8 : (ν 0 - 1) ^ 2 + ν 1 ^ 2 = ν 18)
    (hfact_9 : ν 18 = 1)
    (hfact_10 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_11 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_12 : (ν 12 - ν 8) ^ 2 + (ν 13 - ν 9) ^ 2 = ν 20)
    (hfact_13 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_14 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_15 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_16 : (ν 14 - ν 2) ^ 2 + (ν 15 - ν 3) ^ 2 = ν 21)
    (hfact_17 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21)
    (hfact_18 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21)
    (hfact_19 : (ν 0 - ν 12) ^ 2 + (ν 1 - ν 13) ^ 2 = ν 16)
    (htarget_ne : eval ν ((coordSqDistUnitXPoly 12 13) ++ neg (coordSqDistUnitXPoly 0 1)) ≠ 0) : False := by
  exact cert_00001_1ca0a033ec4ff97b_false_of_facts_eval_zero (Function.update ν 22 (eval ν ((coordSqDistUnitXPoly 12 13) ++ neg (coordSqDistUnitXPoly 0 1)))⁻¹)
    (cert_00001_1ca0a033ec4ff97b_facts_eval_zero_of_semantic_equalities_slack_update ν
      hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6 hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13 hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19 htarget_ne)

set_option maxHeartbeats 0 in
-- Generated hslot semantic replay can exceed the default heartbeat budget.
/-- The checked hslot UNIT certificate for task `1ca0a033ec4ff97b` proves the packet-label metric equality `hslot_q_t2_f1` from the other recorded row-radius facts. -/
theorem cert_00001_1ca0a033ec4ff97b_hslot_q_t2_f1_of_row_slot_packet
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (packet : U1Depth5.RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hrow_0 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q))
    (hrow_1 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q))
    (hrow_2 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t3) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q))
    (hrow_9 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_12 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f5) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_13 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_14 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_16 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f2) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_17 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_18 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_19 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2)) :
    dist (packet.point U1Depth5.q) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1) := by
  by_contra hslot_ne
  let ν : ℕ → ℝ := fun n =>
    match n with
    | 0 => (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f1) 0)
    | 1 => (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f1) 1)
    | 2 => (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f2) 0)
    | 3 => (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f2) 1)
    | 4 => (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f3) 0)
    | 5 => (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f3) 1)
    | 6 => (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f4) 0)
    | 7 => (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f4) 1)
    | 8 => (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f5) 0)
    | 9 => (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f5) 1)
    | 10 => (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.t1) 0)
    | 11 => (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.t1) 1)
    | 12 => (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.t2) 0)
    | 13 => (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.t2) 1)
    | 14 => (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.t3) 0)
    | 15 => (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.t3) 1)
    | 16 => ((normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f1) 0) - (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f2) 0)) ^ 2 + ((normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f1) 1) - (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f2) 1)) ^ 2
    | 17 => 1
    | 18 => ((normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f1) 0) - 1) ^ 2 + (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f1) 1) ^ 2
    | 19 => ((normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.t1) 0) - (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f1) 0)) ^ 2 + ((normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.t1) 1) - (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f1) 1)) ^ 2
    | 20 => ((normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.t2) 0) - (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f2) 0)) ^ 2 + ((normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.t2) 1) - (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f2) 1)) ^ 2
    | 21 => ((normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.t3) 0) - (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f1) 0)) ^ 2 + ((normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.t3) 1) - (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q) (packet.point U1Depth5.f1) 1)) ^ 2
    | _ => 0
  have htarget_ne : eval ν ((coordSqDistUnitXPoly 12 13) ++ neg (coordSqDistUnitXPoly 0 1)) ≠ 0 := by
    intro htarget_zero
    have hcoord_ne :=
      packet.normalAxis_coordSqDist_ne_of_dist_ne hslot_ne
    apply hcoord_ne
    have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
      packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
    have hzero := htarget_zero
    simp [eval_append, eval_neg, eval_coordSqDistUnitXPoly] at hzero
    rw [Problem97.normalAxis_witness hpq]
    dsimp [coordSqDist]
    simp [ν] at hzero ⊢
    nlinarith
  exact cert_00001_1ca0a033ec4ff97b_false_of_semantic_equalities_slack_update ν
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_coord_eq_one_of_dist_eq hrow_0)
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_coord_eq_one_of_dist_eq hrow_1)
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_coord_eq_one_of_dist_eq hrow_2)
    (by
      simp [ν])
    (by
      simp [ν])
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_coord_eq_one_of_dist_eq hrow_0)
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_coord_eq_one_of_dist_eq hrow_1)
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_coord_eq_one_of_dist_eq hrow_2)
    (by
      simp [ν])
    (by
      simpa [ν] using
        packet.normalAxis_unitX_sqdist_coord_eq_one_of_dist_eq hrow_9)
    (by
      simp [ν])
    (by
      simp [ν])
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord := packet.normalAxis_coordSqDist_eq_of_dist_eq hrow_12
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord :=
        Problem97.normalAxis_sqnorm_eq_coordSqDist_of_dist_eq
          (p := (packet.point U1Depth5.p)) (q := (packet.point U1Depth5.q))
          (center := (packet.point U1Depth5.t2))
          (witness := (packet.point U1Depth5.f2)) hpq hrow_13
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord :=
        Problem97.normalAxis_unitX_sqdist_eq_coordSqDist_of_dist_eq
          (p := (packet.point U1Depth5.p)) (q := (packet.point U1Depth5.q))
          (center := (packet.point U1Depth5.t2))
          (witness := (packet.point U1Depth5.f2)) hpq hrow_14
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      simp [ν])
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord := packet.normalAxis_coordSqDist_eq_of_dist_eq hrow_16
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord :=
        Problem97.normalAxis_sqnorm_eq_coordSqDist_of_dist_eq
          (p := (packet.point U1Depth5.p)) (q := (packet.point U1Depth5.q))
          (center := (packet.point U1Depth5.t3))
          (witness := (packet.point U1Depth5.f1)) hpq hrow_17
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord := packet.normalAxis_coordSqDist_eq_of_dist_eq hrow_18
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord := packet.normalAxis_coordSqDist_eq_of_dist_eq hrow_19
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    htarget_ne

end U1Depth5SourceUnitGenerated
end Problem97

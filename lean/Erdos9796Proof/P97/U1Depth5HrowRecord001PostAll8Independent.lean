/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U1Depth5Prefix
import Erdos9796Proof.P97.U3ToU5DangerousTriple

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
/-- SparsePoly fact table for task `17499a15ad0a1019`. -/
def cert_00001_17499a15ad0a1019_facts : List SparsePoly :=
[
  coordSqNormMinusOne 10 11,
  coordSqNormMinusOne 12 13,
  coordSqNormMinusOne 14 15,
  coordSqDistMinusVar 0 1 2 3 16,
  coordSqDistMinusVar 0 1 4 5 16,
  coordSqDistMinusVar 0 1 6 7 16,
  coordSqNormMinusVar 0 1 16,
  oneMinusVar 17,
  coordSqNormMinusVar 10 11 17,
  coordSqNormMinusVar 12 13 17,
  coordSqNormMinusVar 14 15 17,
  coordSqDistUnitXMinusVar 0 1 18,
  coordSqDistUnitXMinusVar 10 11 18,
  coordSqDistUnitXMinusVar 12 13 18,
  coordSqDistMinusVar 10 11 0 1 19,
  coordSqNormMinusVar 10 11 19,
  coordSqDistUnitXMinusVar 10 11 19,
  coordSqDistMinusVar 10 11 14 15 19,
  coordSqDistMinusVar 12 13 2 3 20,
  coordSqDistMinusVar 14 15 0 1 21,
  rabinowitschSlackFact 22 (onePoly ++ neg (coordSqDistUnitXPoly 0 1))
]

set_option maxHeartbeats 0 in
-- Generated certificate data can exceed the default heartbeat budget.
/-- SparsePoly cofactor list for task `17499a15ad0a1019`. -/
def cert_00001_17499a15ad0a1019_cofactors : List (ℕ × SparsePoly) :=
[
  (0, []),
  (1, []),
  (2, []),
  (3, []),
  (4, []),
  (5, []),
  (6, []),
  (7, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (1 : ℚ))]),
  (8, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-1 : ℚ))]),
  (9, []),
  (10, []),
  (11, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-1 : ℚ))]),
  (12, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (1 : ℚ))]),
  (13, []),
  (14, []),
  (15, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (1 : ℚ))]),
  (16, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-1 : ℚ))]),
  (17, []),
  (18, []),
  (19, []),
  (20, [([], (-1 : ℚ))])
]

set_option maxHeartbeats 0 in
-- Generated certificate checking can exceed the default heartbeat budget.
/-- The SparsePoly unit checker accepts task `17499a15ad0a1019`. -/
theorem cert_00001_17499a15ad0a1019_checker :
    unitIdealCertChecker cert_00001_17499a15ad0a1019_facts cert_00001_17499a15ad0a1019_cofactors = true := by
  native_decide

/-- The SparsePoly unit certificate for task `17499a15ad0a1019`
contradicts any valuation that makes every recorded source fact
evaluate to zero.  This is the theorem-facing handoff from the
Boolean checker to the geometric fact-evaluation layer. -/
theorem cert_00001_17499a15ad0a1019_false_of_facts_eval_zero (ν : ℕ → ℝ)
    (hfacts : ∀ f ∈ cert_00001_17499a15ad0a1019_facts, eval ν f = 0) : False := by
  exact false_of_unitIdealCertChecker ν cert_00001_17499a15ad0a1019_facts cert_00001_17499a15ad0a1019_cofactors
    cert_00001_17499a15ad0a1019_checker hfacts

/-- Semantic source-fact evaluation for task `17499a15ad0a1019`.
The hypotheses are the coordinate/radius equations that the geometric
producer must prove for this concrete source UNIT payload. -/
theorem cert_00001_17499a15ad0a1019_facts_eval_zero_of_semantic_equalities (ν : ℕ → ℝ)
    (hfact_0 : ν 10 ^ 2 + ν 11 ^ 2 = 1)
    (hfact_1 : ν 12 ^ 2 + ν 13 ^ 2 = 1)
    (hfact_2 : ν 14 ^ 2 + ν 15 ^ 2 = 1)
    (hfact_3 : (ν 0 - ν 2) ^ 2 + (ν 1 - ν 3) ^ 2 = ν 16)
    (hfact_4 : (ν 0 - ν 4) ^ 2 + (ν 1 - ν 5) ^ 2 = ν 16)
    (hfact_5 : (ν 0 - ν 6) ^ 2 + (ν 1 - ν 7) ^ 2 = ν 16)
    (hfact_6 : ν 0 ^ 2 + ν 1 ^ 2 = ν 16)
    (hfact_7 : ν 17 = 1)
    (hfact_8 : ν 10 ^ 2 + ν 11 ^ 2 = ν 17)
    (hfact_9 : ν 12 ^ 2 + ν 13 ^ 2 = ν 17)
    (hfact_10 : ν 14 ^ 2 + ν 15 ^ 2 = ν 17)
    (hfact_11 : (ν 0 - 1) ^ 2 + ν 1 ^ 2 = ν 18)
    (hfact_12 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18)
    (hfact_13 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18)
    (hfact_14 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_15 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_16 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_17 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19)
    (hfact_18 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_19 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_20 : ν 22 = (eval ν (onePoly ++ neg (coordSqDistUnitXPoly 0 1)))⁻¹ ∧ eval ν (onePoly ++ neg (coordSqDistUnitXPoly 0 1)) ≠ 0) :
    ∀ f ∈ cert_00001_17499a15ad0a1019_facts, eval ν f = 0 := by
  intro f hf
  simp only [cert_00001_17499a15ad0a1019_facts, List.mem_cons, List.not_mem_nil, or_false] at hf
  rcases hf with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact eval_coordSqNormMinusOne_eq_zero_of_eq ν hfact_0
  · exact eval_coordSqNormMinusOne_eq_zero_of_eq ν hfact_1
  · exact eval_coordSqNormMinusOne_eq_zero_of_eq ν hfact_2
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_3
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_4
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_5
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_6
  · exact eval_oneMinusVar_eq_zero_of_eq ν hfact_7
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_8
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_9
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_10
  · exact eval_coordSqDistUnitXMinusVar_eq_zero_of_eq ν hfact_11
  · exact eval_coordSqDistUnitXMinusVar_eq_zero_of_eq ν hfact_12
  · exact eval_coordSqDistUnitXMinusVar_eq_zero_of_eq ν hfact_13
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_14
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_15
  · exact eval_coordSqDistUnitXMinusVar_eq_zero_of_eq ν hfact_16
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_17
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_18
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_19
  · exact eval_rabinowitschSlackFact_eq_zero_of_inv ν hfact_20.1 hfact_20.2

/-- The source UNIT certificate for task `17499a15ad0a1019`
contradicts the concrete semantic source equations. -/
theorem cert_00001_17499a15ad0a1019_false_of_semantic_equalities (ν : ℕ → ℝ)
    (hfact_0 : ν 10 ^ 2 + ν 11 ^ 2 = 1)
    (hfact_1 : ν 12 ^ 2 + ν 13 ^ 2 = 1)
    (hfact_2 : ν 14 ^ 2 + ν 15 ^ 2 = 1)
    (hfact_3 : (ν 0 - ν 2) ^ 2 + (ν 1 - ν 3) ^ 2 = ν 16)
    (hfact_4 : (ν 0 - ν 4) ^ 2 + (ν 1 - ν 5) ^ 2 = ν 16)
    (hfact_5 : (ν 0 - ν 6) ^ 2 + (ν 1 - ν 7) ^ 2 = ν 16)
    (hfact_6 : ν 0 ^ 2 + ν 1 ^ 2 = ν 16)
    (hfact_7 : ν 17 = 1)
    (hfact_8 : ν 10 ^ 2 + ν 11 ^ 2 = ν 17)
    (hfact_9 : ν 12 ^ 2 + ν 13 ^ 2 = ν 17)
    (hfact_10 : ν 14 ^ 2 + ν 15 ^ 2 = ν 17)
    (hfact_11 : (ν 0 - 1) ^ 2 + ν 1 ^ 2 = ν 18)
    (hfact_12 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18)
    (hfact_13 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18)
    (hfact_14 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_15 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_16 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_17 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19)
    (hfact_18 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_19 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_20 : ν 22 = (eval ν (onePoly ++ neg (coordSqDistUnitXPoly 0 1)))⁻¹ ∧ eval ν (onePoly ++ neg (coordSqDistUnitXPoly 0 1)) ≠ 0) : False := by
  exact cert_00001_17499a15ad0a1019_false_of_facts_eval_zero ν
    (cert_00001_17499a15ad0a1019_facts_eval_zero_of_semantic_equalities ν hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6 hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13 hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19 hfact_20)

/-- Semantic source-fact evaluation for task `17499a15ad0a1019`
after assigning the Rabinowitsch slack variable to the inverse of the
stripped target.  The target nonzero hypothesis is the endpoint
normalization obligation for this concrete source UNIT payload. -/
theorem cert_00001_17499a15ad0a1019_facts_eval_zero_of_semantic_equalities_slack_update (ν : ℕ → ℝ)
    (hfact_0 : ν 10 ^ 2 + ν 11 ^ 2 = 1)
    (hfact_1 : ν 12 ^ 2 + ν 13 ^ 2 = 1)
    (hfact_2 : ν 14 ^ 2 + ν 15 ^ 2 = 1)
    (hfact_3 : (ν 0 - ν 2) ^ 2 + (ν 1 - ν 3) ^ 2 = ν 16)
    (hfact_4 : (ν 0 - ν 4) ^ 2 + (ν 1 - ν 5) ^ 2 = ν 16)
    (hfact_5 : (ν 0 - ν 6) ^ 2 + (ν 1 - ν 7) ^ 2 = ν 16)
    (hfact_6 : ν 0 ^ 2 + ν 1 ^ 2 = ν 16)
    (hfact_7 : ν 17 = 1)
    (hfact_8 : ν 10 ^ 2 + ν 11 ^ 2 = ν 17)
    (hfact_9 : ν 12 ^ 2 + ν 13 ^ 2 = ν 17)
    (hfact_10 : ν 14 ^ 2 + ν 15 ^ 2 = ν 17)
    (hfact_11 : (ν 0 - 1) ^ 2 + ν 1 ^ 2 = ν 18)
    (hfact_12 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18)
    (hfact_13 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18)
    (hfact_14 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_15 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_16 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_17 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19)
    (hfact_18 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_19 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (htarget_ne : eval ν (onePoly ++ neg (coordSqDistUnitXPoly 0 1)) ≠ 0) :
    ∀ f ∈ cert_00001_17499a15ad0a1019_facts, eval (Function.update ν 22 (eval ν (onePoly ++ neg (coordSqDistUnitXPoly 0 1)))⁻¹) f = 0 := by
  exact cert_00001_17499a15ad0a1019_facts_eval_zero_of_semantic_equalities (Function.update ν 22 (eval ν (onePoly ++ neg (coordSqDistUnitXPoly 0 1)))⁻¹)
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
    (rabinowitschSlack_update_hyp ν (s := 22) (target := (onePoly ++ neg (coordSqDistUnitXPoly 0 1))) (by decide) htarget_ne)

/-- The source UNIT certificate for task `17499a15ad0a1019`
contradicts the semantic source equations after Rabinowitsch slack
assignment from a nonzero endpoint target. -/
theorem cert_00001_17499a15ad0a1019_false_of_semantic_equalities_slack_update (ν : ℕ → ℝ)
    (hfact_0 : ν 10 ^ 2 + ν 11 ^ 2 = 1)
    (hfact_1 : ν 12 ^ 2 + ν 13 ^ 2 = 1)
    (hfact_2 : ν 14 ^ 2 + ν 15 ^ 2 = 1)
    (hfact_3 : (ν 0 - ν 2) ^ 2 + (ν 1 - ν 3) ^ 2 = ν 16)
    (hfact_4 : (ν 0 - ν 4) ^ 2 + (ν 1 - ν 5) ^ 2 = ν 16)
    (hfact_5 : (ν 0 - ν 6) ^ 2 + (ν 1 - ν 7) ^ 2 = ν 16)
    (hfact_6 : ν 0 ^ 2 + ν 1 ^ 2 = ν 16)
    (hfact_7 : ν 17 = 1)
    (hfact_8 : ν 10 ^ 2 + ν 11 ^ 2 = ν 17)
    (hfact_9 : ν 12 ^ 2 + ν 13 ^ 2 = ν 17)
    (hfact_10 : ν 14 ^ 2 + ν 15 ^ 2 = ν 17)
    (hfact_11 : (ν 0 - 1) ^ 2 + ν 1 ^ 2 = ν 18)
    (hfact_12 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18)
    (hfact_13 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18)
    (hfact_14 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_15 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_16 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_17 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19)
    (hfact_18 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_19 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (htarget_ne : eval ν (onePoly ++ neg (coordSqDistUnitXPoly 0 1)) ≠ 0) : False := by
  exact cert_00001_17499a15ad0a1019_false_of_facts_eval_zero (Function.update ν 22 (eval ν (onePoly ++ neg (coordSqDistUnitXPoly 0 1)))⁻¹)
    (cert_00001_17499a15ad0a1019_facts_eval_zero_of_semantic_equalities_slack_update ν
      hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6 hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13 hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19 htarget_ne)

set_option maxHeartbeats 0 in
-- Generated hslot semantic replay can exceed the default heartbeat budget.
/-- The checked hslot UNIT certificate for task `17499a15ad0a1019` proves the packet-label metric equality `hslot_q_p_f1` from the other recorded row-radius facts. -/
theorem cert_00001_17499a15ad0a1019_hslot_q_p_f1_of_row_slot_packet
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (packet : U1Depth5.RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hrow_4 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f3) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2))
    (hrow_5 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f4) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2))
    (hrow_6 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2))
    (hrow_12 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_13 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_15 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_16 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_17 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.t3) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1)) :
    dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
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
  have hfixed_t1_same_radius :
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.t1) =
        dist (packet.point U1Depth5.p) (packet.point U1Depth5.q) := by
    simpa using hfixed.t1_same_radius
  have hfixed_t2_same_radius :
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.t2) =
        dist (packet.point U1Depth5.p) (packet.point U1Depth5.q) := by
    simpa using hfixed.t2_same_radius
  have hfixed_t3_same_radius :
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.t3) =
        dist (packet.point U1Depth5.p) (packet.point U1Depth5.q) := by
    simpa using hfixed.t3_same_radius
  have htarget_ne : eval ν (onePoly ++ neg (coordSqDistUnitXPoly 0 1)) ≠ 0 := by
    intro htarget_zero
    have hcoord_ne :=
      packet.normalAxis_coordSqDist_ne_of_dist_ne hslot_ne
    apply hcoord_ne
    have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
      packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
    have hzero := htarget_zero
    simp [eval_append, eval_neg, eval_onePoly, eval_coordSqDistUnitXPoly] at hzero
    rw [Problem97.normalAxis_witness hpq, Problem97.normalAxis_self]
    dsimp [coordSqDist]
    simp [ν] at hzero ⊢
    nlinarith
  exact cert_00001_17499a15ad0a1019_false_of_semantic_equalities_slack_update ν
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_coord_eq_one_of_dist_eq hfixed_t1_same_radius)
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_coord_eq_one_of_dist_eq hfixed_t2_same_radius)
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_coord_eq_one_of_dist_eq hfixed_t3_same_radius)
    (by
      simp [ν])
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord := packet.normalAxis_coordSqDist_eq_of_dist_eq hrow_4
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord := packet.normalAxis_coordSqDist_eq_of_dist_eq hrow_5
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord :=
        Problem97.normalAxis_sqnorm_eq_coordSqDist_of_dist_eq
          (p := (packet.point U1Depth5.p)) (q := (packet.point U1Depth5.q))
          (center := (packet.point U1Depth5.f1))
          (witness := (packet.point U1Depth5.f2)) hpq hrow_6
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      simp [ν])
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_coord_eq_one_of_dist_eq hfixed_t1_same_radius)
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_coord_eq_one_of_dist_eq hfixed_t2_same_radius)
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_coord_eq_one_of_dist_eq hfixed_t3_same_radius)
    (by
      simp [ν])
    (by
      simpa [ν] using
        packet.normalAxis_unitX_sqdist_coord_eq_of_dist_eq hrow_12)
    (by
      simpa [ν] using
        packet.normalAxis_unitX_sqdist_coord_eq_of_dist_eq hrow_13)
    (by
      simp [ν])
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord :=
        Problem97.normalAxis_sqnorm_eq_coordSqDist_of_dist_eq
          (p := (packet.point U1Depth5.p)) (q := (packet.point U1Depth5.q))
          (center := (packet.point U1Depth5.t1))
          (witness := (packet.point U1Depth5.f1)) hpq hrow_15
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord :=
        Problem97.normalAxis_unitX_sqdist_eq_coordSqDist_of_dist_eq
          (p := (packet.point U1Depth5.p)) (q := (packet.point U1Depth5.q))
          (center := (packet.point U1Depth5.t1))
          (witness := (packet.point U1Depth5.f1)) hpq hrow_16
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord := packet.normalAxis_coordSqDist_eq_of_dist_eq hrow_17
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      simp [ν])
    (by
      simp [ν])
    htarget_ne

end U1Depth5SourceUnitGenerated
end Problem97

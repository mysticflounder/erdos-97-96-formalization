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
namespace U1Depth5SourceUnitManifestGenerated

open U5GramCert

set_option maxHeartbeats 0 in
-- Generated certificate data can exceed the default heartbeat budget.
/-- SparsePoly fact table for task `3ee64424c9eb2360`. -/
def cert_00001_3ee64424c9eb2360_facts : List SparsePoly :=
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
  coordSqDistUnitXMinusVar 10 11 18,
  coordSqDistUnitXMinusVar 12 13 18,
  coordSqDistMinusVar 10 11 0 1 19,
  coordSqNormMinusVar 10 11 19,
  coordSqDistUnitXMinusVar 10 11 19,
  coordSqDistMinusVar 10 11 14 15 19,
  coordSqDistMinusVar 12 13 2 3 20,
  coordSqNormMinusVar 12 13 20,
  coordSqDistUnitXMinusVar 12 13 20,
  coordSqDistMinusVar 14 15 0 1 21,
  coordSqNormMinusVar 14 15 21,
  coordSqDistMinusVar 14 15 10 11 21,
  coordSqDistMinusVar 0 1 12 13 16,
  rabinowitschSlackFact 22 (mul (coordSqNormPoly 14 15) (mul (coordSqNormPoly 0 1) (coordSqDistUnitXPoly 14 15)))
]

set_option maxHeartbeats 0 in
-- Generated certificate data can exceed the default heartbeat budget.
/-- SparsePoly cofactor list for task `3ee64424c9eb2360`. -/
def cert_00001_3ee64424c9eb2360_cofactors : List (ℕ × SparsePoly) :=
[
  (0, []),
  (1, []),
  (2, []),
  (3, []),
  (4, [([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (4 : ℚ)), ([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1], (-2 : ℚ))]),
  (5, []),
  (6, []),
  (7, [([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (-4 : ℚ)), ([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ)), ([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1], (2 : ℚ))]),
  (8, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-1 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1], (-1 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1], (1 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1], (-2 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (4 : ℚ))]),
  (9, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (1 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1], (1 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1], (-1 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1], (2 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (-4 : ℚ))]),
  (10, []),
  (11, []),
  (12, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (-4 : ℚ))]),
  (13, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (4 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (-6 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (4 : ℚ)), ([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ)), ([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (-4 : ℚ))]),
  (14, [([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (-4 : ℚ)), ([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ)), ([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (4 : ℚ))]),
  (15, [([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (8 : ℚ)), ([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ))]),
  (16, []),
  (17, []),
  (18, []),
  (19, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (1 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1], (2 : ℚ))]),
  (20, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-1 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1], (-2 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (4 : ℚ)), ([0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (1 : ℚ)), ([0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1], (1 : ℚ)), ([0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1], (1 : ℚ)), ([0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1], (1 : ℚ)), ([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1], (-2 : ℚ)), ([2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (1 : ℚ)), ([2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1], (1 : ℚ)), ([2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1], (1 : ℚ)), ([2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1], (1 : ℚ))]),
  (21, [([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (-8 : ℚ))]),
  (22, []),
  (23, [([], (-1 : ℚ))])
]

set_option maxHeartbeats 0 in
-- Generated certificate checking can exceed the default heartbeat budget.
/-- The SparsePoly unit checker accepts task `3ee64424c9eb2360`. -/
theorem cert_00001_3ee64424c9eb2360_checker :
    unitIdealCertChecker cert_00001_3ee64424c9eb2360_facts cert_00001_3ee64424c9eb2360_cofactors = true := by
  native_decide

/-- The SparsePoly unit certificate for task `3ee64424c9eb2360`
contradicts any valuation that makes every recorded source fact
evaluate to zero.  This is the theorem-facing handoff from the
Boolean checker to the geometric fact-evaluation layer. -/
theorem cert_00001_3ee64424c9eb2360_false_of_facts_eval_zero (ν : ℕ → ℝ)
    (hfacts : ∀ f ∈ cert_00001_3ee64424c9eb2360_facts, eval ν f = 0) : False := by
  exact false_of_unitIdealCertChecker ν cert_00001_3ee64424c9eb2360_facts cert_00001_3ee64424c9eb2360_cofactors
    cert_00001_3ee64424c9eb2360_checker hfacts

/-- The rho-product extra factor for task `3ee64424c9eb2360` is nonzero on any manifest label packet
whose labels are pairwise distinct. -/
theorem cert_00001_3ee64424c9eb2360_extraFactor_ne_zero
    {D : CounterexampleData}
    (packet : U1Depth5.ManifestLabelPacket D) :
    U1Depth5.pairDistanceProduct [(U1Depth5.p, U1Depth5.t3), (U1Depth5.p, U1Depth5.f1), (U1Depth5.q, U1Depth5.t3)] packet.point ≠ 0 := by
  exact packet.pairDistanceProduct_ne_zero (by
    intro ab hab
    simp only [List.mem_cons, List.not_mem_nil, or_false] at hab
    rcases hab with rfl | rfl | rfl <;> decide)

/-- Semantic source-fact evaluation for task `3ee64424c9eb2360`.
The hypotheses are the coordinate/radius equations that the geometric
producer must prove for this concrete source UNIT payload. -/
theorem cert_00001_3ee64424c9eb2360_facts_eval_zero_of_semantic_equalities (ν : ℕ → ℝ)
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
    (hfact_10 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18)
    (hfact_11 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18)
    (hfact_12 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_13 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_14 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_15 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19)
    (hfact_16 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_17 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_18 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_19 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_20 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21)
    (hfact_21 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21)
    (hfact_22 : (ν 0 - ν 12) ^ 2 + (ν 1 - ν 13) ^ 2 = ν 16)
    (hfact_23 : ν 22 = (eval ν (mul (coordSqNormPoly 14 15) (mul (coordSqNormPoly 0 1) (coordSqDistUnitXPoly 14 15))))⁻¹ ∧ eval ν (mul (coordSqNormPoly 14 15) (mul (coordSqNormPoly 0 1) (coordSqDistUnitXPoly 14 15))) ≠ 0) :
    ∀ f ∈ cert_00001_3ee64424c9eb2360_facts, eval ν f = 0 := by
  intro f hf
  simp only [cert_00001_3ee64424c9eb2360_facts, List.mem_cons, List.not_mem_nil, or_false] at hf
  rcases hf with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
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
  · exact eval_coordSqDistUnitXMinusVar_eq_zero_of_eq ν hfact_10
  · exact eval_coordSqDistUnitXMinusVar_eq_zero_of_eq ν hfact_11
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_12
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_13
  · exact eval_coordSqDistUnitXMinusVar_eq_zero_of_eq ν hfact_14
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_15
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_16
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_17
  · exact eval_coordSqDistUnitXMinusVar_eq_zero_of_eq ν hfact_18
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_19
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_20
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_21
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_22
  · exact eval_rabinowitschSlackFact_eq_zero_of_inv ν hfact_23.1 hfact_23.2

/-- The source UNIT certificate for task `3ee64424c9eb2360`
contradicts the concrete semantic source equations. -/
theorem cert_00001_3ee64424c9eb2360_false_of_semantic_equalities (ν : ℕ → ℝ)
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
    (hfact_10 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18)
    (hfact_11 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18)
    (hfact_12 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_13 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_14 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_15 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19)
    (hfact_16 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_17 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_18 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_19 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_20 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21)
    (hfact_21 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21)
    (hfact_22 : (ν 0 - ν 12) ^ 2 + (ν 1 - ν 13) ^ 2 = ν 16)
    (hfact_23 : ν 22 = (eval ν (mul (coordSqNormPoly 14 15) (mul (coordSqNormPoly 0 1) (coordSqDistUnitXPoly 14 15))))⁻¹ ∧ eval ν (mul (coordSqNormPoly 14 15) (mul (coordSqNormPoly 0 1) (coordSqDistUnitXPoly 14 15))) ≠ 0) : False := by
  exact cert_00001_3ee64424c9eb2360_false_of_facts_eval_zero ν
    (cert_00001_3ee64424c9eb2360_facts_eval_zero_of_semantic_equalities ν hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6 hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13 hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19 hfact_20 hfact_21 hfact_22 hfact_23)

/-- Semantic source-fact evaluation for task `3ee64424c9eb2360`
after assigning the Rabinowitsch slack variable to the inverse of the
stripped target.  The target nonzero hypothesis is the endpoint
normalization obligation for this concrete source UNIT payload. -/
theorem cert_00001_3ee64424c9eb2360_facts_eval_zero_of_semantic_equalities_slack_update (ν : ℕ → ℝ)
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
    (hfact_10 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18)
    (hfact_11 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18)
    (hfact_12 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_13 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_14 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_15 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19)
    (hfact_16 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_17 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_18 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_19 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_20 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21)
    (hfact_21 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21)
    (hfact_22 : (ν 0 - ν 12) ^ 2 + (ν 1 - ν 13) ^ 2 = ν 16)
    (htarget_ne : eval ν (mul (coordSqNormPoly 14 15) (mul (coordSqNormPoly 0 1) (coordSqDistUnitXPoly 14 15))) ≠ 0) :
    ∀ f ∈ cert_00001_3ee64424c9eb2360_facts, eval (Function.update ν 22 (eval ν (mul (coordSqNormPoly 14 15) (mul (coordSqNormPoly 0 1) (coordSqDistUnitXPoly 14 15))))⁻¹) f = 0 := by
  exact cert_00001_3ee64424c9eb2360_facts_eval_zero_of_semantic_equalities (Function.update ν 22 (eval ν (mul (coordSqNormPoly 14 15) (mul (coordSqNormPoly 0 1) (coordSqDistUnitXPoly 14 15))))⁻¹)
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
    (by simpa [Function.update] using hfact_20)
    (by simpa [Function.update] using hfact_21)
    (by simpa [Function.update] using hfact_22)
    (rabinowitschSlack_update_hyp ν (s := 22) (target := (mul (coordSqNormPoly 14 15) (mul (coordSqNormPoly 0 1) (coordSqDistUnitXPoly 14 15)))) (by decide) htarget_ne)

/-- The source UNIT certificate for task `3ee64424c9eb2360`
contradicts the semantic source equations after Rabinowitsch slack
assignment from a nonzero endpoint target. -/
theorem cert_00001_3ee64424c9eb2360_false_of_semantic_equalities_slack_update (ν : ℕ → ℝ)
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
    (hfact_10 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18)
    (hfact_11 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18)
    (hfact_12 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_13 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_14 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_15 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19)
    (hfact_16 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_17 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_18 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_19 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_20 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21)
    (hfact_21 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21)
    (hfact_22 : (ν 0 - ν 12) ^ 2 + (ν 1 - ν 13) ^ 2 = ν 16)
    (htarget_ne : eval ν (mul (coordSqNormPoly 14 15) (mul (coordSqNormPoly 0 1) (coordSqDistUnitXPoly 14 15))) ≠ 0) : False := by
  exact cert_00001_3ee64424c9eb2360_false_of_facts_eval_zero (Function.update ν 22 (eval ν (mul (coordSqNormPoly 14 15) (mul (coordSqNormPoly 0 1) (coordSqDistUnitXPoly 14 15))))⁻¹)
    (cert_00001_3ee64424c9eb2360_facts_eval_zero_of_semantic_equalities_slack_update ν
      hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6 hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13 hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19 hfact_20 hfact_21 hfact_22 htarget_ne)

/-- The source UNIT Rabinowitsch target for task `3ee64424c9eb2360` is nonzero when its checked pair-distance
factors are nonzero.  The target expression
is coefficient-checked against the JSON SparsePoly payload before
this theorem is emitted. -/
theorem cert_00001_3ee64424c9eb2360_target_ne_zero_of_semantic_factors (ν : ℕ → ℝ)
    (hfactor_0_ne : ν 14 ^ 2 + ν 15 ^ 2 ≠ 0)
    (hfactor_1_ne : ν 0 ^ 2 + ν 1 ^ 2 ≠ 0)
    (hfactor_2_ne : (ν 14 - 1) ^ 2 + ν 15 ^ 2 ≠ 0) :
    eval ν (mul (coordSqNormPoly 14 15) (mul (coordSqNormPoly 0 1) (coordSqDistUnitXPoly 14 15))) ≠ 0 := by
  have hfactor_0_eval_ne : eval ν (coordSqNormPoly 14 15) ≠ 0 := by
    exact (by
      simpa [eval_coordSqNormPoly] using hfactor_0_ne)
  have hfactor_1_eval_ne : eval ν (coordSqNormPoly 0 1) ≠ 0 := by
    exact (by
      simpa [eval_coordSqNormPoly] using hfactor_1_ne)
  have hfactor_2_eval_ne : eval ν (coordSqDistUnitXPoly 14 15) ≠ 0 := by
    exact (by
      simpa [eval_coordSqDistUnitXPoly] using hfactor_2_ne)
  exact (eval_mul_ne_zero ν hfactor_0_eval_ne (eval_mul_ne_zero ν hfactor_1_eval_ne hfactor_2_eval_ne))

/-- The source UNIT Rabinowitsch target for task `3ee64424c9eb2360` is nonzero from the semantic pair-distance
nonzero hypotheses.  This is the producer-facing form of the target
nonzero obligation. -/
theorem cert_00001_3ee64424c9eb2360_target_ne_zero_of_semantic_witnesses (ν : ℕ → ℝ)
    (hfactor_0_ne : ν 14 ^ 2 + ν 15 ^ 2 ≠ 0)
    (hfactor_1_ne : ν 0 ^ 2 + ν 1 ^ 2 ≠ 0)
    (hfactor_2_ne : (ν 14 - 1) ^ 2 + ν 15 ^ 2 ≠ 0) :
    eval ν (mul (coordSqNormPoly 14 15) (mul (coordSqNormPoly 0 1) (coordSqDistUnitXPoly 14 15))) ≠ 0 := by
  exact cert_00001_3ee64424c9eb2360_target_ne_zero_of_semantic_factors ν hfactor_0_ne hfactor_1_ne hfactor_2_ne

/-- Semantic source-fact evaluation for task `3ee64424c9eb2360`
after deriving the Rabinowitsch target nonzero fact from the checked
rho-witness equalities and witness-distance nonzero hypotheses. -/
theorem cert_00001_3ee64424c9eb2360_facts_eval_zero_of_semantic_witnesses_slack_update (ν : ℕ → ℝ)
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
    (hfact_10 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18)
    (hfact_11 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18)
    (hfact_12 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_13 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_14 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_15 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19)
    (hfact_16 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_17 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_18 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_19 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_20 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21)
    (hfact_21 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21)
    (hfact_22 : (ν 0 - ν 12) ^ 2 + (ν 1 - ν 13) ^ 2 = ν 16)
    (hfactor_0_ne : ν 14 ^ 2 + ν 15 ^ 2 ≠ 0)
    (hfactor_1_ne : ν 0 ^ 2 + ν 1 ^ 2 ≠ 0)
    (hfactor_2_ne : (ν 14 - 1) ^ 2 + ν 15 ^ 2 ≠ 0) :
    ∀ f ∈ cert_00001_3ee64424c9eb2360_facts, eval (Function.update ν 22 (eval ν (mul (coordSqNormPoly 14 15) (mul (coordSqNormPoly 0 1) (coordSqDistUnitXPoly 14 15))))⁻¹) f = 0 := by
  exact cert_00001_3ee64424c9eb2360_facts_eval_zero_of_semantic_equalities_slack_update ν hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6 hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13 hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19 hfact_20 hfact_21 hfact_22
    (cert_00001_3ee64424c9eb2360_target_ne_zero_of_semantic_witnesses ν hfactor_0_ne hfactor_1_ne hfactor_2_ne)

/-- Existential form of source-fact evaluation for task `3ee64424c9eb2360`.  This is the local shape consumed by
the generated source-unit lift endpoint after the branch producer
supplies the semantic hypotheses. -/
theorem cert_00001_3ee64424c9eb2360_sourceFacts_eval_exists_of_semantic_witnesses (ν : ℕ → ℝ)
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
    (hfact_10 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18)
    (hfact_11 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18)
    (hfact_12 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_13 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_14 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_15 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19)
    (hfact_16 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_17 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_18 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_19 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_20 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21)
    (hfact_21 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21)
    (hfact_22 : (ν 0 - ν 12) ^ 2 + (ν 1 - ν 13) ^ 2 = ν 16)
    (hfactor_0_ne : ν 14 ^ 2 + ν 15 ^ 2 ≠ 0)
    (hfactor_1_ne : ν 0 ^ 2 + ν 1 ^ 2 ≠ 0)
    (hfactor_2_ne : (ν 14 - 1) ^ 2 + ν 15 ^ 2 ≠ 0) :
    ∃ ν' : ℕ → ℝ, ∀ f ∈ cert_00001_3ee64424c9eb2360_facts, eval ν' f = 0 := by
  exact ⟨Function.update ν 22 (eval ν (mul (coordSqNormPoly 14 15) (mul (coordSqNormPoly 0 1) (coordSqDistUnitXPoly 14 15))))⁻¹,
    cert_00001_3ee64424c9eb2360_facts_eval_zero_of_semantic_witnesses_slack_update ν hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6 hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13 hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19 hfact_20 hfact_21 hfact_22 hfactor_0_ne hfactor_1_ne hfactor_2_ne⟩

/-- Instantiate the checked source-UNIT semantic witness valuation
for task `3ee64424c9eb2360` from a manifest label packet.  The
hypotheses are exactly the packet-label row-radius equal-distance
facts that are not definitional for this record's chosen rho
witnesses. -/
theorem cert_00001_3ee64424c9eb2360_sourceFacts_eval_exists_of_manifest_label_packet
    {D : CounterexampleData}
    (packet : U1Depth5.ManifestLabelPacket D)
    (hrow_0 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q))
    (hrow_1 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q))
    (hrow_2 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t3) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q))
    (hrow_9 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_10 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_11 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_13 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_14 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_15 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.t3) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_17 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_18 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_20 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_21 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_22 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2)) :
    ∃ ν' : ℕ → ℝ, ∀ f ∈ cert_00001_3ee64424c9eb2360_facts, eval ν' f = 0 := by
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
  exact cert_00001_3ee64424c9eb2360_sourceFacts_eval_exists_of_semantic_witnesses ν
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
      simpa [ν] using
        packet.normalAxis_unitX_sqdist_coord_eq_of_dist_eq hrow_10)
    (by
      simpa [ν] using
        packet.normalAxis_unitX_sqdist_coord_eq_of_dist_eq hrow_11)
    (by
      simp [ν])
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord :=
        Problem97.normalAxis_sqnorm_eq_coordSqDist_of_dist_eq
          (p := (packet.point U1Depth5.p)) (q := (packet.point U1Depth5.q))
          (center := (packet.point U1Depth5.t1))
          (witness := (packet.point U1Depth5.f1)) hpq hrow_13
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord :=
        Problem97.normalAxis_unitX_sqdist_eq_coordSqDist_of_dist_eq
          (p := (packet.point U1Depth5.p)) (q := (packet.point U1Depth5.q))
          (center := (packet.point U1Depth5.t1))
          (witness := (packet.point U1Depth5.f1)) hpq hrow_14
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord := packet.normalAxis_coordSqDist_eq_of_dist_eq hrow_15
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      simp [ν])
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord :=
        Problem97.normalAxis_sqnorm_eq_coordSqDist_of_dist_eq
          (p := (packet.point U1Depth5.p)) (q := (packet.point U1Depth5.q))
          (center := (packet.point U1Depth5.t2))
          (witness := (packet.point U1Depth5.f2)) hpq hrow_17
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord :=
        Problem97.normalAxis_unitX_sqdist_eq_coordSqDist_of_dist_eq
          (p := (packet.point U1Depth5.p)) (q := (packet.point U1Depth5.q))
          (center := (packet.point U1Depth5.t2))
          (witness := (packet.point U1Depth5.f2)) hpq hrow_18
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      simp [ν])
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord :=
        Problem97.normalAxis_sqnorm_eq_coordSqDist_of_dist_eq
          (p := (packet.point U1Depth5.p)) (q := (packet.point U1Depth5.q))
          (center := (packet.point U1Depth5.t3))
          (witness := (packet.point U1Depth5.f1)) hpq hrow_20
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord := packet.normalAxis_coordSqDist_eq_of_dist_eq hrow_21
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord := packet.normalAxis_coordSqDist_eq_of_dist_eq hrow_22
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_ne_zero (by decide : U1Depth5.p ≠ U1Depth5.t3))
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_ne_zero (by decide : U1Depth5.p ≠ U1Depth5.f1))
    (by
      simpa [ν] using
        packet.normalAxis_unitX_sqdist_ne_zero (by decide : U1Depth5.q ≠ U1Depth5.t3))

/-- Package the checked source-UNIT certificate for task `3ee64424c9eb2360` as the theorem-facing manifest label packet lift
certificate.  The only geometric hypotheses left here are the direct
packet-label row-radius equalities emitted above. -/
noncomputable def cert_00001_3ee64424c9eb2360_sourceUnitLiftCertificate
    {D : CounterexampleData}
    (packet : U1Depth5.ManifestLabelPacket D)
    (hrow_0 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q))
    (hrow_1 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q))
    (hrow_2 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t3) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q))
    (hrow_9 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_10 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_11 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_13 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_14 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_15 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.t3) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_17 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_18 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_20 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_21 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_22 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2)) :
    U1Depth5.SourceUnitLiftCertificate D where
  packet := packet
  sourceFacts := cert_00001_3ee64424c9eb2360_facts
  sourceCofactors := cert_00001_3ee64424c9eb2360_cofactors
  sourceUnit_check := cert_00001_3ee64424c9eb2360_checker
  extraFactor := U1Depth5.pairDistanceProduct [(U1Depth5.p, U1Depth5.t3), (U1Depth5.p, U1Depth5.f1), (U1Depth5.q, U1Depth5.t3)] packet.point
  extraFactor_ne_zero := cert_00001_3ee64424c9eb2360_extraFactor_ne_zero packet
  sourceFacts_eval_of_endpoint_ne_zero := by
    intro _hendpoint_ne
    exact cert_00001_3ee64424c9eb2360_sourceFacts_eval_exists_of_manifest_label_packet packet hrow_0 hrow_1 hrow_2 hrow_9 hrow_10 hrow_11 hrow_13 hrow_14 hrow_15 hrow_17 hrow_18 hrow_20 hrow_21 hrow_22

/-- The checked source-UNIT certificate for task `3ee64424c9eb2360` closes a manifest label packet once the generated
packet-label row-radius equalities are supplied. -/
theorem cert_00001_3ee64424c9eb2360_false_of_manifest_label_packet
    {D : CounterexampleData}
    (packet : U1Depth5.ManifestLabelPacket D)
    (hrow_0 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q))
    (hrow_1 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q))
    (hrow_2 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t3) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q))
    (hrow_9 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_10 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_11 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_13 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_14 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_15 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.t3) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_17 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_18 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_20 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_21 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_22 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2)) : False := by
  exact (cert_00001_3ee64424c9eb2360_sourceUnitLiftCertificate packet hrow_0 hrow_1 hrow_2 hrow_9 hrow_10 hrow_11 hrow_13 hrow_14 hrow_15 hrow_17 hrow_18 hrow_20 hrow_21 hrow_22).false

end U1Depth5SourceUnitManifestGenerated
end Problem97

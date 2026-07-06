/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U5GramCertPoly

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
/-- SparsePoly fact table for task `b2f01338be2c60db`. -/
def cert_00003_b2f01338be2c60db_facts : List SparsePoly :=
[
  coordSqNormMinusOne 10 11,
  coordSqNormMinusOne 12 13,
  coordSqNormMinusOne 14 15,
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
  coordSqDistMinusVar 12 13 8 9 20,
  coordSqNormMinusVar 12 13 20,
  coordSqDistUnitXMinusVar 12 13 20,
  coordSqDistMinusVar 14 15 0 1 21,
  coordSqDistMinusVar 14 15 2 3 21,
  coordSqNormMinusVar 14 15 21,
  coordSqDistMinusVar 14 15 10 11 21,
  [([0, 0, 1], (-1 : ℚ))],
  [([0, 0, 0, 1], (-1 : ℚ))],
  ((coordSqDistPoly 0 1 12 13) ++ neg (coordSqDistPoly 0 1 2 3))
]

set_option maxHeartbeats 0 in
-- Generated certificate data can exceed the default heartbeat budget.
/-- SparsePoly cofactor list for task `b2f01338be2c60db`. -/
def cert_00003_b2f01338be2c60db_cofactors : List (ℕ × SparsePoly) :=
[
  (0, []),
  (1, []),
  (2, []),
  (3, [([0, 2], (6 : ℚ)), ([1, 2], (-4 : ℚ))]),
  (4, []),
  (5, []),
  (6, [([0, 2], (-6 : ℚ)), ([1, 2], (4 : ℚ))]),
  (7, [([], (-1 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-1 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (3 : ℚ)), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ)), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ))]),
  (8, [([], (2 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (3 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-4 : ℚ)), ([0, 2], (-4 : ℚ)), ([1], ((-3 : ℚ) / (2 : ℚ))), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-4 : ℚ)), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (4 : ℚ)), ([1, 2], (4 : ℚ))]),
  (9, []),
  (10, [([], (-1 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (1 : ℚ)), ([0, 2], (4 : ℚ)), ([1], ((3 : ℚ) / (2 : ℚ))), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ)), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([1, 2], (-4 : ℚ))]),
  (11, [([], ((-1 : ℚ) / (2 : ℚ))), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (1 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-3 : ℚ)), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ))]),
  (12, [([], ((1 : ℚ) / (2 : ℚ))), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-1 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (3 : ℚ)), ([0, 2], ((-9 : ℚ) / (2 : ℚ))), ([0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1], (3 : ℚ)), ([1], ((-1 : ℚ) / (2 : ℚ))), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (3 : ℚ)), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-5 : ℚ)), ([1, 2], (3 : ℚ)), ([1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ))]),
  (13, [([0, 2], ((-3 : ℚ) / (2 : ℚ))), ([0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-3 : ℚ)), ([1], ((1 : ℚ) / (2 : ℚ))), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-1 : ℚ)), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (3 : ℚ)), ([1, 2], (1 : ℚ)), ([1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ)), ([2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ)), ([2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ))]),
  (14, [([0, 2], (6 : ℚ)), ([1, 2], (-4 : ℚ))]),
  (15, []),
  (16, []),
  (17, [([], (-1 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (1 : ℚ)), ([0, 2], (3 : ℚ)), ([0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([1], ((5 : ℚ) / (2 : ℚ))), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (4 : ℚ)), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-3 : ℚ)), ([1, 2], (-3 : ℚ)), ([1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ)), ([2], ((-3 : ℚ) / (2 : ℚ))), ([2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ))]),
  (18, [([], (1 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-1 : ℚ)), ([0, 2], (-3 : ℚ)), ([0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ)), ([1], ((-5 : ℚ) / (2 : ℚ))), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-4 : ℚ)), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (3 : ℚ)), ([1, 2], (3 : ℚ)), ([1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([2], ((3 : ℚ) / (2 : ℚ))), ([2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ)), ([2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ))]),
  (19, []),
  (20, []),
  (21, [([0, 2], (6 : ℚ)), ([1, 2], (-4 : ℚ))]),
  (22, [([0, 2], (-6 : ℚ)), ([1, 2], (4 : ℚ))]),
  (23, [([0, 0, 1], (-1 : ℚ)), ([0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1], (1 : ℚ)), ([1], (2 : ℚ)), ([1, 0, 1], ((3 : ℚ) / (2 : ℚ))), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (4 : ℚ)), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ)), ([1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([2], (-3 : ℚ)), ([2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-4 : ℚ)), ([2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (4 : ℚ))]),
  (24, [([0, 0, 0, 1], (-1 : ℚ)), ([0, 1], (2 : ℚ)), ([0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1], (1 : ℚ)), ([0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (4 : ℚ)), ([0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([1, 0, 0, 1], ((3 : ℚ) / (2 : ℚ))), ([1, 1], (-3 : ℚ)), ([1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ)), ([1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-4 : ℚ)), ([1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (4 : ℚ))]),
  (25, [([], (1 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-1 : ℚ)), ([1], ((-3 : ℚ) / (2 : ℚ))), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ))])
]

set_option maxHeartbeats 0 in
-- Generated certificate checking can exceed the default heartbeat budget.
/-- The SparsePoly unit checker accepts task `b2f01338be2c60db`. -/
theorem cert_00003_b2f01338be2c60db_checker :
    unitIdealCertChecker cert_00003_b2f01338be2c60db_facts cert_00003_b2f01338be2c60db_cofactors = true := by
  native_decide

/-- The SparsePoly unit certificate for task `b2f01338be2c60db`
contradicts any valuation that makes every recorded source fact
evaluate to zero.  This is the theorem-facing handoff from the
Boolean checker to the geometric fact-evaluation layer. -/
theorem cert_00003_b2f01338be2c60db_false_of_facts_eval_zero (ν : ℕ → ℝ)
    (hfacts : ∀ f ∈ cert_00003_b2f01338be2c60db_facts, eval ν f = 0) : False := by
  exact false_of_unitIdealCertChecker ν cert_00003_b2f01338be2c60db_facts cert_00003_b2f01338be2c60db_cofactors
    cert_00003_b2f01338be2c60db_checker hfacts

/-- Semantic source-fact evaluation for task `b2f01338be2c60db`.
The hypotheses are the coordinate/radius equations that the geometric
producer must prove for this concrete source UNIT payload. -/
theorem cert_00003_b2f01338be2c60db_facts_eval_zero_of_semantic_equalities (ν : ℕ → ℝ)
    (hfact_0 : ν 10 ^ 2 + ν 11 ^ 2 = 1)
    (hfact_1 : ν 12 ^ 2 + ν 13 ^ 2 = 1)
    (hfact_2 : ν 14 ^ 2 + ν 15 ^ 2 = 1)
    (hfact_3 : ν 17 = 1)
    (hfact_4 : ν 10 ^ 2 + ν 11 ^ 2 = ν 17)
    (hfact_5 : ν 12 ^ 2 + ν 13 ^ 2 = ν 17)
    (hfact_6 : ν 14 ^ 2 + ν 15 ^ 2 = ν 17)
    (hfact_7 : (ν 0 - 1) ^ 2 + ν 1 ^ 2 = ν 18)
    (hfact_8 : ν 18 = 1)
    (hfact_9 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18)
    (hfact_10 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18)
    (hfact_11 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_12 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_13 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_14 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19)
    (hfact_15 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_16 : (ν 12 - ν 8) ^ 2 + (ν 13 - ν 9) ^ 2 = ν 20)
    (hfact_17 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_18 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_19 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_20 : (ν 14 - ν 2) ^ 2 + (ν 15 - ν 3) ^ 2 = ν 21)
    (hfact_21 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21)
    (hfact_22 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21)
    (hfact_23 : eval ν [([0, 0, 1], (-1 : ℚ))] = 0)
    (hfact_24 : eval ν [([0, 0, 0, 1], (-1 : ℚ))] = 0)
    (hfact_25 : eval ν ((coordSqDistPoly 0 1 12 13) ++ neg (coordSqDistPoly 0 1 2 3)) = 0) :
    ∀ f ∈ cert_00003_b2f01338be2c60db_facts, eval ν f = 0 := by
  intro f hf
  simp only [cert_00003_b2f01338be2c60db_facts, List.mem_cons, List.not_mem_nil, or_false] at hf
  rcases hf with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact eval_coordSqNormMinusOne_eq_zero_of_eq ν hfact_0
  · exact eval_coordSqNormMinusOne_eq_zero_of_eq ν hfact_1
  · exact eval_coordSqNormMinusOne_eq_zero_of_eq ν hfact_2
  · exact eval_oneMinusVar_eq_zero_of_eq ν hfact_3
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_4
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_5
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_6
  · exact eval_coordSqDistUnitXMinusVar_eq_zero_of_eq ν hfact_7
  · exact eval_oneMinusVar_eq_zero_of_eq ν hfact_8
  · exact eval_coordSqDistUnitXMinusVar_eq_zero_of_eq ν hfact_9
  · exact eval_coordSqDistUnitXMinusVar_eq_zero_of_eq ν hfact_10
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_11
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_12
  · exact eval_coordSqDistUnitXMinusVar_eq_zero_of_eq ν hfact_13
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_14
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_15
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_16
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_17
  · exact eval_coordSqDistUnitXMinusVar_eq_zero_of_eq ν hfact_18
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_19
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_20
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_21
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_22
  · exact hfact_23
  · exact hfact_24
  · exact hfact_25

/-- The source UNIT certificate for task `b2f01338be2c60db`
contradicts the concrete semantic source equations. -/
theorem cert_00003_b2f01338be2c60db_false_of_semantic_equalities (ν : ℕ → ℝ)
    (hfact_0 : ν 10 ^ 2 + ν 11 ^ 2 = 1)
    (hfact_1 : ν 12 ^ 2 + ν 13 ^ 2 = 1)
    (hfact_2 : ν 14 ^ 2 + ν 15 ^ 2 = 1)
    (hfact_3 : ν 17 = 1)
    (hfact_4 : ν 10 ^ 2 + ν 11 ^ 2 = ν 17)
    (hfact_5 : ν 12 ^ 2 + ν 13 ^ 2 = ν 17)
    (hfact_6 : ν 14 ^ 2 + ν 15 ^ 2 = ν 17)
    (hfact_7 : (ν 0 - 1) ^ 2 + ν 1 ^ 2 = ν 18)
    (hfact_8 : ν 18 = 1)
    (hfact_9 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18)
    (hfact_10 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18)
    (hfact_11 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_12 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_13 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_14 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19)
    (hfact_15 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_16 : (ν 12 - ν 8) ^ 2 + (ν 13 - ν 9) ^ 2 = ν 20)
    (hfact_17 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_18 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_19 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_20 : (ν 14 - ν 2) ^ 2 + (ν 15 - ν 3) ^ 2 = ν 21)
    (hfact_21 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21)
    (hfact_22 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21)
    (hfact_23 : eval ν [([0, 0, 1], (-1 : ℚ))] = 0)
    (hfact_24 : eval ν [([0, 0, 0, 1], (-1 : ℚ))] = 0)
    (hfact_25 : eval ν ((coordSqDistPoly 0 1 12 13) ++ neg (coordSqDistPoly 0 1 2 3)) = 0) : False := by
  exact cert_00003_b2f01338be2c60db_false_of_facts_eval_zero ν
    (cert_00003_b2f01338be2c60db_facts_eval_zero_of_semantic_equalities ν hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6 hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13 hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19 hfact_20 hfact_21 hfact_22 hfact_23 hfact_24 hfact_25)

end U1Depth5SourceUnitGenerated
end Problem97

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
namespace U1Depth5SourceUnitManifestGenerated

open U5GramCert

set_option maxHeartbeats 0 in
-- Generated certificate data can exceed the default heartbeat budget.
/-- SparsePoly fact table for task `f46a07c8af1969fd`. -/
def cert_00001_f46a07c8af1969fd_facts : List SparsePoly :=
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
  rabinowitschSlackFact 22 (mul (coordSqDistUnitXPoly 14 15) (mul (varPoly 16) (mul (varPoly 17) (mul (varPoly 18) (mul (varPoly 19) (mul (varPoly 20) (varPoly 21)))))))
]

set_option maxHeartbeats 0 in
-- Generated certificate data can exceed the default heartbeat budget.
/-- SparsePoly cofactor list for task `f46a07c8af1969fd`. -/
def cert_00001_f46a07c8af1969fd_cofactors : List (ℕ × SparsePoly) :=
[
  (0, []),
  (1, []),
  (2, []),
  (3, []),
  (4, []),
  (5, []),
  (6, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-3 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1], (3 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ))]),
  (7, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1], (-3 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1], (-2 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1], (-2 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 1, 1, 1, 1], (-1 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1], (2 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1], (2 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1], (2 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 1, 0, 0, 1, 1, 1, 1], (-1 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (8 : ℚ))]),
  (8, []),
  (9, []),
  (10, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1], (3 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1], (2 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1], (1 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1], (-2 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (-8 : ℚ))]),
  (11, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1], (-3 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (2 : ℚ))]),
  (12, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1], (-2 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1], (-1 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 1, 0, 1, 1, 1, 1], (-1 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1], (3 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1], (2 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1], (2 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 1, 1, 0, 1, 1, 1, 1], (-1 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ))]),
  (13, []),
  (14, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1], (2 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1], (-2 : ℚ))]),
  (15, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (-4 : ℚ))]),
  (16, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1], (1 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1], (-1 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (4 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (-6 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (4 : ℚ)), ([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (-4 : ℚ))]),
  (17, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1], (1 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (-4 : ℚ)), ([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (4 : ℚ))]),
  (18, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1], (-3 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1], (2 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (8 : ℚ))]),
  (19, []),
  (20, []),
  (21, []),
  (22, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1], (-2 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1], (2 : ℚ))]),
  (23, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (3 : ℚ))]),
  (24, []),
  (25, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], (-3 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1], (-2 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1], (2 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1], (2 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (8 : ℚ))]),
  (26, [([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1], (2 : ℚ)), ([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1], (-2 : ℚ)), ([0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1], (-8 : ℚ))]),
  (27, [([], (-1 : ℚ))])
]

set_option maxHeartbeats 0 in
-- Generated certificate checking can exceed the default heartbeat budget.
/-- The SparsePoly unit checker accepts task `f46a07c8af1969fd`. -/
theorem cert_00001_f46a07c8af1969fd_checker :
    unitIdealCertChecker cert_00001_f46a07c8af1969fd_facts cert_00001_f46a07c8af1969fd_cofactors = true := by
  native_decide

/-- The SparsePoly unit certificate for task `f46a07c8af1969fd`
contradicts any valuation that makes every recorded source fact
evaluate to zero.  This is the theorem-facing handoff from the
Boolean checker to the geometric fact-evaluation layer. -/
theorem cert_00001_f46a07c8af1969fd_false_of_facts_eval_zero (ν : ℕ → ℝ)
    (hfacts : ∀ f ∈ cert_00001_f46a07c8af1969fd_facts, eval ν f = 0) : False := by
  exact false_of_unitIdealCertChecker ν cert_00001_f46a07c8af1969fd_facts cert_00001_f46a07c8af1969fd_cofactors
    cert_00001_f46a07c8af1969fd_checker hfacts

/-- The rho-product extra factor for task `f46a07c8af1969fd` is nonzero on any manifest label packet
whose labels are pairwise distinct. -/
theorem cert_00001_f46a07c8af1969fd_extraFactor_ne_zero
    {D : CounterexampleData}
    (packet : U1Depth5.ManifestLabelPacket D) :
    U1Depth5.pairDistanceProduct [(U1Depth5.f1, U1Depth5.f2), (U1Depth5.p, U1Depth5.q), (U1Depth5.q, U1Depth5.f1), (U1Depth5.t1, U1Depth5.f1), (U1Depth5.t2, U1Depth5.f2), (U1Depth5.t3, U1Depth5.f1)] packet.point ≠ 0 := by
  exact packet.pairDistanceProduct_ne_zero (by
    intro ab hab
    simp only [List.mem_cons, List.not_mem_nil, or_false] at hab
    rcases hab with rfl | rfl | rfl | rfl | rfl | rfl <;> decide)

/-- Semantic source-fact evaluation for task `f46a07c8af1969fd`.
The hypotheses are the coordinate/radius equations that the geometric
producer must prove for this concrete source UNIT payload. -/
theorem cert_00001_f46a07c8af1969fd_facts_eval_zero_of_semantic_equalities (ν : ℕ → ℝ)
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
    (hfact_12 : ν 18 = 1)
    (hfact_13 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18)
    (hfact_14 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18)
    (hfact_15 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_16 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_17 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_18 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19)
    (hfact_19 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_20 : (ν 12 - ν 8) ^ 2 + (ν 13 - ν 9) ^ 2 = ν 20)
    (hfact_21 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_22 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_23 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_24 : (ν 14 - ν 2) ^ 2 + (ν 15 - ν 3) ^ 2 = ν 21)
    (hfact_25 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21)
    (hfact_26 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21)
    (hfact_27 : ν 22 = (eval ν (mul (coordSqDistUnitXPoly 14 15) (mul (varPoly 16) (mul (varPoly 17) (mul (varPoly 18) (mul (varPoly 19) (mul (varPoly 20) (varPoly 21))))))))⁻¹ ∧ eval ν (mul (coordSqDistUnitXPoly 14 15) (mul (varPoly 16) (mul (varPoly 17) (mul (varPoly 18) (mul (varPoly 19) (mul (varPoly 20) (varPoly 21))))))) ≠ 0) :
    ∀ f ∈ cert_00001_f46a07c8af1969fd_facts, eval ν f = 0 := by
  intro f hf
  simp only [cert_00001_f46a07c8af1969fd_facts, List.mem_cons, List.not_mem_nil, or_false] at hf
  rcases hf with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
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
  · exact eval_oneMinusVar_eq_zero_of_eq ν hfact_12
  · exact eval_coordSqDistUnitXMinusVar_eq_zero_of_eq ν hfact_13
  · exact eval_coordSqDistUnitXMinusVar_eq_zero_of_eq ν hfact_14
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_15
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_16
  · exact eval_coordSqDistUnitXMinusVar_eq_zero_of_eq ν hfact_17
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_18
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_19
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_20
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_21
  · exact eval_coordSqDistUnitXMinusVar_eq_zero_of_eq ν hfact_22
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_23
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_24
  · exact eval_coordSqNormMinusVar_eq_zero_of_eq ν hfact_25
  · exact eval_coordSqDistMinusVar_eq_zero_of_eq ν hfact_26
  · exact eval_rabinowitschSlackFact_eq_zero_of_inv ν hfact_27.1 hfact_27.2

/-- The source UNIT certificate for task `f46a07c8af1969fd`
contradicts the concrete semantic source equations. -/
theorem cert_00001_f46a07c8af1969fd_false_of_semantic_equalities (ν : ℕ → ℝ)
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
    (hfact_12 : ν 18 = 1)
    (hfact_13 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18)
    (hfact_14 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18)
    (hfact_15 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_16 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_17 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_18 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19)
    (hfact_19 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_20 : (ν 12 - ν 8) ^ 2 + (ν 13 - ν 9) ^ 2 = ν 20)
    (hfact_21 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_22 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_23 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_24 : (ν 14 - ν 2) ^ 2 + (ν 15 - ν 3) ^ 2 = ν 21)
    (hfact_25 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21)
    (hfact_26 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21)
    (hfact_27 : ν 22 = (eval ν (mul (coordSqDistUnitXPoly 14 15) (mul (varPoly 16) (mul (varPoly 17) (mul (varPoly 18) (mul (varPoly 19) (mul (varPoly 20) (varPoly 21))))))))⁻¹ ∧ eval ν (mul (coordSqDistUnitXPoly 14 15) (mul (varPoly 16) (mul (varPoly 17) (mul (varPoly 18) (mul (varPoly 19) (mul (varPoly 20) (varPoly 21))))))) ≠ 0) : False := by
  exact cert_00001_f46a07c8af1969fd_false_of_facts_eval_zero ν
    (cert_00001_f46a07c8af1969fd_facts_eval_zero_of_semantic_equalities ν hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6 hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13 hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19 hfact_20 hfact_21 hfact_22 hfact_23 hfact_24 hfact_25 hfact_26 hfact_27)

/-- Semantic source-fact evaluation for task `f46a07c8af1969fd`
after assigning the Rabinowitsch slack variable to the inverse of the
stripped target.  The target nonzero hypothesis is the endpoint
normalization obligation for this concrete source UNIT payload. -/
theorem cert_00001_f46a07c8af1969fd_facts_eval_zero_of_semantic_equalities_slack_update (ν : ℕ → ℝ)
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
    (hfact_12 : ν 18 = 1)
    (hfact_13 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18)
    (hfact_14 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18)
    (hfact_15 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_16 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_17 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_18 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19)
    (hfact_19 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_20 : (ν 12 - ν 8) ^ 2 + (ν 13 - ν 9) ^ 2 = ν 20)
    (hfact_21 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_22 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_23 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_24 : (ν 14 - ν 2) ^ 2 + (ν 15 - ν 3) ^ 2 = ν 21)
    (hfact_25 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21)
    (hfact_26 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21)
    (htarget_ne : eval ν (mul (coordSqDistUnitXPoly 14 15) (mul (varPoly 16) (mul (varPoly 17) (mul (varPoly 18) (mul (varPoly 19) (mul (varPoly 20) (varPoly 21))))))) ≠ 0) :
    ∀ f ∈ cert_00001_f46a07c8af1969fd_facts, eval (Function.update ν 22 (eval ν (mul (coordSqDistUnitXPoly 14 15) (mul (varPoly 16) (mul (varPoly 17) (mul (varPoly 18) (mul (varPoly 19) (mul (varPoly 20) (varPoly 21))))))))⁻¹) f = 0 := by
  exact cert_00001_f46a07c8af1969fd_facts_eval_zero_of_semantic_equalities (Function.update ν 22 (eval ν (mul (coordSqDistUnitXPoly 14 15) (mul (varPoly 16) (mul (varPoly 17) (mul (varPoly 18) (mul (varPoly 19) (mul (varPoly 20) (varPoly 21))))))))⁻¹)
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
    (by simpa [Function.update] using hfact_23)
    (by simpa [Function.update] using hfact_24)
    (by simpa [Function.update] using hfact_25)
    (by simpa [Function.update] using hfact_26)
    (rabinowitschSlack_update_hyp ν (s := 22) (target := (mul (coordSqDistUnitXPoly 14 15) (mul (varPoly 16) (mul (varPoly 17) (mul (varPoly 18) (mul (varPoly 19) (mul (varPoly 20) (varPoly 21)))))))) (by decide) htarget_ne)

/-- The source UNIT certificate for task `f46a07c8af1969fd`
contradicts the semantic source equations after Rabinowitsch slack
assignment from a nonzero endpoint target. -/
theorem cert_00001_f46a07c8af1969fd_false_of_semantic_equalities_slack_update (ν : ℕ → ℝ)
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
    (hfact_12 : ν 18 = 1)
    (hfact_13 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18)
    (hfact_14 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18)
    (hfact_15 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_16 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_17 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_18 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19)
    (hfact_19 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_20 : (ν 12 - ν 8) ^ 2 + (ν 13 - ν 9) ^ 2 = ν 20)
    (hfact_21 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_22 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_23 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_24 : (ν 14 - ν 2) ^ 2 + (ν 15 - ν 3) ^ 2 = ν 21)
    (hfact_25 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21)
    (hfact_26 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21)
    (htarget_ne : eval ν (mul (coordSqDistUnitXPoly 14 15) (mul (varPoly 16) (mul (varPoly 17) (mul (varPoly 18) (mul (varPoly 19) (mul (varPoly 20) (varPoly 21))))))) ≠ 0) : False := by
  exact cert_00001_f46a07c8af1969fd_false_of_facts_eval_zero (Function.update ν 22 (eval ν (mul (coordSqDistUnitXPoly 14 15) (mul (varPoly 16) (mul (varPoly 17) (mul (varPoly 18) (mul (varPoly 19) (mul (varPoly 20) (varPoly 21))))))))⁻¹)
    (cert_00001_f46a07c8af1969fd_facts_eval_zero_of_semantic_equalities_slack_update ν
      hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6 hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13 hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19 hfact_20 hfact_21 hfact_22 hfact_23 hfact_24 hfact_25 hfact_26 htarget_ne)

/-- The source UNIT Rabinowitsch target for task `f46a07c8af1969fd` is nonzero when its checked semantic
distance factor and rho factors are nonzero.  The target expression
is coefficient-checked against the JSON SparsePoly payload before
this theorem is emitted. -/
theorem cert_00001_f46a07c8af1969fd_target_ne_zero_of_semantic_factors (ν : ℕ → ℝ)
    (hsource_q_t3 : (ν 14 - 1) ^ 2 + ν 15 ^ 2 ≠ 0)
    (hrho_f1 : ν 16 ≠ 0)
    (hrho_p : ν 17 ≠ 0)
    (hrho_q : ν 18 ≠ 0)
    (hrho_t1 : ν 19 ≠ 0)
    (hrho_t2 : ν 20 ≠ 0)
    (hrho_t3 : ν 21 ≠ 0) :
    eval ν (mul (coordSqDistUnitXPoly 14 15) (mul (varPoly 16) (mul (varPoly 17) (mul (varPoly 18) (mul (varPoly 19) (mul (varPoly 20) (varPoly 21))))))) ≠ 0 := by
  exact (eval_mul_ne_zero ν (eval_coordSqDistUnitXPoly_ne_zero ν (x := 14) (y := 15) hsource_q_t3) (eval_mul_ne_zero ν (eval_varPoly_ne_zero ν (n := 16) hrho_f1) (eval_mul_ne_zero ν (eval_varPoly_ne_zero ν (n := 17) hrho_p) (eval_mul_ne_zero ν (eval_varPoly_ne_zero ν (n := 18) hrho_q) (eval_mul_ne_zero ν (eval_varPoly_ne_zero ν (n := 19) hrho_t1) (eval_mul_ne_zero ν (eval_varPoly_ne_zero ν (n := 20) hrho_t2) (eval_varPoly_ne_zero ν (n := 21) hrho_t3)))))))

/-- The source UNIT Rabinowitsch target for task `f46a07c8af1969fd` is nonzero from the semantic rho-witness
equalities plus nonzero coordinate distances for the listed witness
pairs.  This is the producer-facing form of the target nonzero
obligation. -/
theorem cert_00001_f46a07c8af1969fd_target_ne_zero_of_semantic_witnesses (ν : ℕ → ℝ)
    (hfact_3 : (ν 0 - ν 2) ^ 2 + (ν 1 - ν 3) ^ 2 = ν 16)
    (hfact_7 : ν 17 = 1)
    (hfact_11 : (ν 0 - 1) ^ 2 + ν 1 ^ 2 = ν 18)
    (hfact_15 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_19 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_23 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hsource_q_t3 : (ν 14 - 1) ^ 2 + ν 15 ^ 2 ≠ 0)
    (hrho_f1_witness_ne : (ν 0 - ν 2) ^ 2 + (ν 1 - ν 3) ^ 2 ≠ 0)
    (hrho_q_witness_ne : (ν 0 - 1) ^ 2 + ν 1 ^ 2 ≠ 0)
    (hrho_t1_witness_ne : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 ≠ 0)
    (hrho_t2_witness_ne : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 ≠ 0)
    (hrho_t3_witness_ne : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 ≠ 0) :
    eval ν (mul (coordSqDistUnitXPoly 14 15) (mul (varPoly 16) (mul (varPoly 17) (mul (varPoly 18) (mul (varPoly 19) (mul (varPoly 20) (varPoly 21))))))) ≠ 0 := by
  have hrho_f1 : ν 16 ≠ 0 := by
    rw [← hfact_3]
    exact hrho_f1_witness_ne
  have hrho_p : ν 17 ≠ 0 := by
    rw [hfact_7]
    norm_num
  have hrho_q : ν 18 ≠ 0 := by
    rw [← hfact_11]
    exact hrho_q_witness_ne
  have hrho_t1 : ν 19 ≠ 0 := by
    rw [← hfact_15]
    exact hrho_t1_witness_ne
  have hrho_t2 : ν 20 ≠ 0 := by
    rw [← hfact_19]
    exact hrho_t2_witness_ne
  have hrho_t3 : ν 21 ≠ 0 := by
    rw [← hfact_23]
    exact hrho_t3_witness_ne
  exact cert_00001_f46a07c8af1969fd_target_ne_zero_of_semantic_factors ν hsource_q_t3 hrho_f1 hrho_p hrho_q hrho_t1 hrho_t2 hrho_t3

/-- Semantic source-fact evaluation for task `f46a07c8af1969fd`
after deriving the Rabinowitsch target nonzero fact from the checked
rho-witness equalities and witness-distance nonzero hypotheses. -/
theorem cert_00001_f46a07c8af1969fd_facts_eval_zero_of_semantic_witnesses_slack_update (ν : ℕ → ℝ)
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
    (hfact_12 : ν 18 = 1)
    (hfact_13 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18)
    (hfact_14 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18)
    (hfact_15 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_16 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_17 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_18 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19)
    (hfact_19 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_20 : (ν 12 - ν 8) ^ 2 + (ν 13 - ν 9) ^ 2 = ν 20)
    (hfact_21 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_22 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_23 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_24 : (ν 14 - ν 2) ^ 2 + (ν 15 - ν 3) ^ 2 = ν 21)
    (hfact_25 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21)
    (hfact_26 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21)
    (hsource_q_t3 : (ν 14 - 1) ^ 2 + ν 15 ^ 2 ≠ 0)
    (hrho_f1_witness_ne : (ν 0 - ν 2) ^ 2 + (ν 1 - ν 3) ^ 2 ≠ 0)
    (hrho_q_witness_ne : (ν 0 - 1) ^ 2 + ν 1 ^ 2 ≠ 0)
    (hrho_t1_witness_ne : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 ≠ 0)
    (hrho_t2_witness_ne : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 ≠ 0)
    (hrho_t3_witness_ne : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 ≠ 0) :
    ∀ f ∈ cert_00001_f46a07c8af1969fd_facts, eval (Function.update ν 22 (eval ν (mul (coordSqDistUnitXPoly 14 15) (mul (varPoly 16) (mul (varPoly 17) (mul (varPoly 18) (mul (varPoly 19) (mul (varPoly 20) (varPoly 21))))))))⁻¹) f = 0 := by
  exact cert_00001_f46a07c8af1969fd_facts_eval_zero_of_semantic_equalities_slack_update ν hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6 hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13 hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19 hfact_20 hfact_21 hfact_22 hfact_23 hfact_24 hfact_25 hfact_26
    (cert_00001_f46a07c8af1969fd_target_ne_zero_of_semantic_witnesses ν hfact_3 hfact_7 hfact_11 hfact_15 hfact_19 hfact_23 hsource_q_t3 hrho_f1_witness_ne hrho_q_witness_ne hrho_t1_witness_ne hrho_t2_witness_ne hrho_t3_witness_ne)

/-- Existential form of source-fact evaluation for task `f46a07c8af1969fd`.  This is the local shape consumed by
the generated source-unit lift endpoint after the branch producer
supplies the semantic hypotheses. -/
theorem cert_00001_f46a07c8af1969fd_sourceFacts_eval_exists_of_semantic_witnesses (ν : ℕ → ℝ)
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
    (hfact_12 : ν 18 = 1)
    (hfact_13 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18)
    (hfact_14 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18)
    (hfact_15 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19)
    (hfact_16 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_17 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19)
    (hfact_18 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19)
    (hfact_19 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20)
    (hfact_20 : (ν 12 - ν 8) ^ 2 + (ν 13 - ν 9) ^ 2 = ν 20)
    (hfact_21 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_22 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20)
    (hfact_23 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21)
    (hfact_24 : (ν 14 - ν 2) ^ 2 + (ν 15 - ν 3) ^ 2 = ν 21)
    (hfact_25 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21)
    (hfact_26 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21)
    (hsource_q_t3 : (ν 14 - 1) ^ 2 + ν 15 ^ 2 ≠ 0)
    (hrho_f1_witness_ne : (ν 0 - ν 2) ^ 2 + (ν 1 - ν 3) ^ 2 ≠ 0)
    (hrho_q_witness_ne : (ν 0 - 1) ^ 2 + ν 1 ^ 2 ≠ 0)
    (hrho_t1_witness_ne : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 ≠ 0)
    (hrho_t2_witness_ne : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 ≠ 0)
    (hrho_t3_witness_ne : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 ≠ 0) :
    ∃ ν' : ℕ → ℝ, ∀ f ∈ cert_00001_f46a07c8af1969fd_facts, eval ν' f = 0 := by
  exact ⟨Function.update ν 22 (eval ν (mul (coordSqDistUnitXPoly 14 15) (mul (varPoly 16) (mul (varPoly 17) (mul (varPoly 18) (mul (varPoly 19) (mul (varPoly 20) (varPoly 21))))))))⁻¹,
    cert_00001_f46a07c8af1969fd_facts_eval_zero_of_semantic_witnesses_slack_update ν hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6 hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13 hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19 hfact_20 hfact_21 hfact_22 hfact_23 hfact_24 hfact_25 hfact_26 hsource_q_t3 hrho_f1_witness_ne hrho_q_witness_ne hrho_t1_witness_ne hrho_t2_witness_ne hrho_t3_witness_ne⟩

/-- Instantiate the checked source-UNIT semantic witness valuation
for task `f46a07c8af1969fd` from a manifest label packet.  The
hypotheses are exactly the packet-label row-radius equal-distance
facts that are not definitional for this record's chosen rho
witnesses. -/
theorem cert_00001_f46a07c8af1969fd_sourceFacts_eval_exists_of_manifest_label_packet
    {D : CounterexampleData}
    (packet : U1Depth5.ManifestLabelPacket D)
    (hfixed : U3FixedTriplePacket D packet.baseQ packet.baseP packet.baseT1 packet.baseT2 packet.baseT3)
    (hrow_4 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f3) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2))
    (hrow_5 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f4) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2))
    (hrow_6 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2))
    (hrow_12 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_13 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_14 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_16 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_17 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_18 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.t3) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_20 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f5) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_21 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_22 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_24 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f2) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_25 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_26 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1)) :
    ∃ ν' : ℕ → ℝ, ∀ f ∈ cert_00001_f46a07c8af1969fd_facts, eval ν' f = 0 := by
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
  exact cert_00001_f46a07c8af1969fd_sourceFacts_eval_exists_of_semantic_witnesses ν
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
        packet.normalAxis_unitX_sqdist_coord_eq_one_of_dist_eq hrow_12)
    (by
      simpa [ν] using
        packet.normalAxis_unitX_sqdist_coord_eq_of_dist_eq hrow_13)
    (by
      simpa [ν] using
        packet.normalAxis_unitX_sqdist_coord_eq_of_dist_eq hrow_14)
    (by
      simp [ν])
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord :=
        Problem97.normalAxis_sqnorm_eq_coordSqDist_of_dist_eq
          (p := (packet.point U1Depth5.p)) (q := (packet.point U1Depth5.q))
          (center := (packet.point U1Depth5.t1))
          (witness := (packet.point U1Depth5.f1)) hpq hrow_16
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord :=
        Problem97.normalAxis_unitX_sqdist_eq_coordSqDist_of_dist_eq
          (p := (packet.point U1Depth5.p)) (q := (packet.point U1Depth5.q))
          (center := (packet.point U1Depth5.t1))
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
      simp [ν])
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord := packet.normalAxis_coordSqDist_eq_of_dist_eq hrow_20
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord :=
        Problem97.normalAxis_sqnorm_eq_coordSqDist_of_dist_eq
          (p := (packet.point U1Depth5.p)) (q := (packet.point U1Depth5.q))
          (center := (packet.point U1Depth5.t2))
          (witness := (packet.point U1Depth5.f2)) hpq hrow_21
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord :=
        Problem97.normalAxis_unitX_sqdist_eq_coordSqDist_of_dist_eq
          (p := (packet.point U1Depth5.p)) (q := (packet.point U1Depth5.q))
          (center := (packet.point U1Depth5.t2))
          (witness := (packet.point U1Depth5.f2)) hpq hrow_22
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      simp [ν])
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord := packet.normalAxis_coordSqDist_eq_of_dist_eq hrow_24
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord :=
        Problem97.normalAxis_sqnorm_eq_coordSqDist_of_dist_eq
          (p := (packet.point U1Depth5.p)) (q := (packet.point U1Depth5.q))
          (center := (packet.point U1Depth5.t3))
          (witness := (packet.point U1Depth5.f1)) hpq hrow_25
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : (packet.point U1Depth5.p) ≠ (packet.point U1Depth5.q) :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord := packet.normalAxis_coordSqDist_eq_of_dist_eq hrow_26
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      simpa [ν] using
        packet.normalAxis_unitX_sqdist_ne_zero (by decide : U1Depth5.q ≠ U1Depth5.t3))
    (by
      simpa [ν] using
        packet.normalAxis_coord_sqdist_ne_zero
          (by decide : U1Depth5.f1 ≠ U1Depth5.f2))
    (by
      simpa [ν] using
        packet.normalAxis_unitX_sqdist_ne_zero (by decide : U1Depth5.q ≠ U1Depth5.f1))
    (by
      simpa [ν] using
        packet.normalAxis_coord_sqdist_ne_zero
          (by decide : U1Depth5.t1 ≠ U1Depth5.f1))
    (by
      simpa [ν] using
        packet.normalAxis_coord_sqdist_ne_zero
          (by decide : U1Depth5.t2 ≠ U1Depth5.f2))
    (by
      simpa [ν] using
        packet.normalAxis_coord_sqdist_ne_zero
          (by decide : U1Depth5.t3 ≠ U1Depth5.f1))

/-- Package the checked source-UNIT certificate for task `f46a07c8af1969fd` as the theorem-facing manifest label packet lift
certificate.  The only geometric hypotheses left here are the direct
packet-label row-radius equalities emitted above. -/
noncomputable def cert_00001_f46a07c8af1969fd_sourceUnitLiftCertificate
    {D : CounterexampleData}
    (packet : U1Depth5.ManifestLabelPacket D)
    (hfixed : U3FixedTriplePacket D packet.baseQ packet.baseP packet.baseT1 packet.baseT2 packet.baseT3)
    (hrow_4 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f3) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2))
    (hrow_5 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f4) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2))
    (hrow_6 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2))
    (hrow_12 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_13 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_14 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_16 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_17 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_18 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.t3) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_20 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f5) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_21 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_22 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_24 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f2) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_25 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_26 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1)) :
    U1Depth5.SourceUnitLiftCertificate D where
  packet := packet
  sourceFacts := cert_00001_f46a07c8af1969fd_facts
  sourceCofactors := cert_00001_f46a07c8af1969fd_cofactors
  sourceUnit_check := cert_00001_f46a07c8af1969fd_checker
  extraFactor := U1Depth5.pairDistanceProduct [(U1Depth5.f1, U1Depth5.f2), (U1Depth5.p, U1Depth5.q), (U1Depth5.q, U1Depth5.f1), (U1Depth5.t1, U1Depth5.f1), (U1Depth5.t2, U1Depth5.f2), (U1Depth5.t3, U1Depth5.f1)] packet.point
  extraFactor_ne_zero := cert_00001_f46a07c8af1969fd_extraFactor_ne_zero packet
  sourceFacts_eval_of_endpoint_ne_zero := by
    intro _hendpoint_ne
    exact cert_00001_f46a07c8af1969fd_sourceFacts_eval_exists_of_manifest_label_packet packet hfixed hrow_4 hrow_5 hrow_6 hrow_12 hrow_13 hrow_14 hrow_16 hrow_17 hrow_18 hrow_20 hrow_21 hrow_22 hrow_24 hrow_25 hrow_26

/-- The checked source-UNIT certificate for task `f46a07c8af1969fd` closes a manifest label packet once the generated
packet-label row-radius equalities are supplied. -/
theorem cert_00001_f46a07c8af1969fd_false_of_manifest_label_packet
    {D : CounterexampleData}
    (packet : U1Depth5.ManifestLabelPacket D)
    (hfixed : U3FixedTriplePacket D packet.baseQ packet.baseP packet.baseT1 packet.baseT2 packet.baseT3)
    (hrow_4 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f3) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2))
    (hrow_5 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f4) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2))
    (hrow_6 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2))
    (hrow_12 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_13 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_14 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_16 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_17 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_18 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.t3) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_20 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f5) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_21 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_22 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_24 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f2) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_25 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_26 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1)) : False := by
  exact (cert_00001_f46a07c8af1969fd_sourceUnitLiftCertificate packet hfixed hrow_4 hrow_5 hrow_6 hrow_12 hrow_13 hrow_14 hrow_16 hrow_17 hrow_18 hrow_20 hrow_21 hrow_22 hrow_24 hrow_25 hrow_26).false

end U1Depth5SourceUnitManifestGenerated
end Problem97

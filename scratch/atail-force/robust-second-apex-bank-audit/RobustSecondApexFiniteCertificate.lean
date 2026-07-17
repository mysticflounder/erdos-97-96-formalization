/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite certificate for the card-four physical second cap

This file kernel-checks the finite schema isolated by `audit.py`.  It is a
certificate about the pinned fourteen-label cap profile, not a Euclidean
theorem and not a replacement for the geometric one-hit bridge.
-/

namespace Problem97
namespace ATailRobustSecondApexFiniteCertificate

abbrev Label := Fin 14

def O : Label := 0
def t1 : Label := 1
def I : Label := 2
def F : Label := 3
def A : Label := 4
def X : Label := 5
def Y : Label := 6
def Z : Label := 7
def D : Label := 8
def J : Label := 9
def E : Label := 10
def C : Label := 11
def G : Label := 12
def K : Label := 13

def surplusCap : Finset Label := {O, t1, I, F, A}
def oppCap1 : Finset Label := {A, X, Y, Z, D, J, E, C}
def oppCap2 : Finset Label := {C, G, K, O}
def strictOppCap2 : Finset Label := oppCap2 \ (surplusCap ∪ oppCap1)

/-- The finite content of the two proved endpoint one-hit bounds. -/
def endpointOneHitAdmissible (support : Finset Label) : Bool :=
  decide (A ∉ support) &&
    decide ((support ∩ surplusCap).card ≤ 1) &&
    decide ((support ∩ oppCap1).card ≤ 1)

theorem cap_profile_checked :
    surplusCap.card = 5 ∧
      oppCap1.card = 8 ∧
      oppCap2.card = 4 ∧
      strictOppCap2 = {G, K} := by
  decide

def allSupports : Finset (Finset Label) := Finset.univ.powerset

def admissibleFourSupports : Finset (Finset Label) :=
  allSupports.filter fun support =>
    endpointOneHitAdmissible support && decide (support.card = 4)

def admissibleFiveSupports : Finset (Finset Label) :=
  allSupports.filter fun support =>
    endpointOneHitAdmissible support && decide (5 ≤ support.card)

def strictOppCap2CoverageFailures : Finset (Finset Label) :=
  admissibleFourSupports.filter fun support =>
    decide (¬ strictOppCap2 ⊆ support)

def disjointFourPairs : Finset (Finset Label × Finset Label) :=
  (admissibleFourSupports ×ˢ admissibleFourSupports).filter fun pair =>
    decide (Disjoint pair.1 pair.2)

/-- Exhaustive table size for all endpoint-one-hit four-supports. -/
theorem admissibleFourSupports_card_checked :
    admissibleFourSupports.card = 28 := by
  native_decide

/-- Every table entry uses both strict points of the four-point opposite
cap. -/
theorem strictOppCap2_coverage_checked :
    strictOppCap2CoverageFailures.card = 0 := by
  native_decide

/-- The exhaustive table contains no endpoint-one-hit support of cardinality
at least five. -/
theorem no_admissible_five_checked :
    admissibleFiveSupports.card = 0 := by
  native_decide

/-- No two endpoint-one-hit four-supports in the exhaustive table are
disjoint. -/
theorem no_disjoint_admissible_four_checked :
    disjointFourPairs.card = 0 := by
  native_decide

#print axioms cap_profile_checked
#print axioms admissibleFourSupports_card_checked
#print axioms strictOppCap2_coverage_checked
#print axioms no_admissible_five_checked
#print axioms no_disjoint_admissible_four_checked

end ATailRobustSecondApexFiniteCertificate
end Problem97

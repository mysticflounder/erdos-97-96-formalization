/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite boundary for the ordered critical-fiber row-hit producer

This is an exact finite incidence/order regression, not a Euclidean
counterexample.  It retains a total source-exact blocker system, one repeated
blocker fiber, a first-apex row hit through one fiber source, and the finite
row-closure consequence of minimality.

Two checked instances separate the remaining producer fields: cross-shell
membership may fail, and even when it holds the required six-role cyclic
order may fail.
-/

namespace Problem97
namespace ATailCriticalFiberClosingCoreOrderedFiniteBoundary

abbrev Label := Fin 12

def firstApex : Label := 4
def commonBlocker : Label := 0
def collisionSourceC : Label := 1
def collisionSourceK : Label := 2

def globalRow : Label → Finset Label :=
  ![({1, 2, 3, 4} : Finset Label),
    {0, 2, 6, 7},
    {1, 3, 9, 10},
    {1, 4, 7, 11},
    {0, 1, 3, 6},
    {0, 3, 8, 11},
    {2, 7, 8, 10},
    {4, 6, 9, 11},
    {3, 5, 7, 9},
    {0, 4, 5, 10},
    {2, 5, 8, 11},
    {1, 6, 8, 9}]

def blocker : Label → Label :=
  ![1, 0, 0, 0, 0, 8, 7, 6, 5, 2, 2, 3]

def criticalSupport (source : Label) : Finset Label :=
  globalRow (blocker source)

def rowClosed (U : Finset Label) : Prop :=
  ∀ center ∈ U, globalRow center ⊆ U

instance instDecidableRowClosed (U : Finset Label) : Decidable (rowClosed U) := by
  unfold rowClosed
  infer_instance

/-- A cyclic six-role predicate, independent of the arbitrary cut in the
boundary enumeration. -/
def CyclicSix (o a x j c k : Label) : Prop :=
  (o < a ∧ a < x ∧ x < j ∧ j < c ∧ c < k) ∨
  (a < x ∧ x < j ∧ j < c ∧ c < k ∧ k < o) ∨
  (x < j ∧ j < c ∧ c < k ∧ k < o ∧ o < a) ∨
  (j < c ∧ c < k ∧ k < o ∧ o < a ∧ a < x) ∨
  (c < k ∧ k < o ∧ o < a ∧ a < x ∧ x < j) ∨
  (k < o ∧ o < a ∧ a < x ∧ x < j ∧ j < c)

instance instDecidableCyclicSix (o a x j c k : Label) :
    Decidable (CyclicSix o a x j c k) := by
  unfold CyclicSix
  infer_instance

/-- Row hit used to show that `K` need not occur in `J`'s actual critical
shell. -/
def crossMissingRow : Finset Label := {1, 6, 8, 9}
def crossMissingJ : Label := 6

set_option maxRecDepth 100000
set_option maxHeartbeats 2000000
/-- The represented critical system and minimal row-closure surface coexist
with a source-stable row hit whose cross-shell membership fails. -/
theorem rowHit_crossMembership_missing_checked :
    (∀ center : Label, (globalRow center).card = 4) ∧
    (∀ center : Label, center ∉ globalRow center) ∧
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ source₁ source₂ : Label, blocker source₁ = blocker source₂ →
      criticalSupport source₁ = criticalSupport source₂) ∧
    collisionSourceC ≠ collisionSourceK ∧
    blocker collisionSourceC = commonBlocker ∧
    blocker collisionSourceK = commonBlocker ∧
    collisionSourceC ∈ criticalSupport collisionSourceC ∧
    collisionSourceK ∈ criticalSupport collisionSourceC ∧
    crossMissingRow.card = 4 ∧
    collisionSourceC ∈ crossMissingRow ∧
    crossMissingJ ∈ crossMissingRow ∧
    crossMissingJ ≠ collisionSourceC ∧
    collisionSourceK ∉ criticalSupport crossMissingJ ∧
    (∀ U : Finset Label, U.Nonempty → rowClosed U → U = Finset.univ) := by
  decide

/-- Row hit used to separate cross membership from the six-role boundary
order. -/
def orderMissingRow : Finset Label := {1, 7, 5, 6}
def orderMissingJ : Label := 7
def orderMissingX : Label := blocker orderMissingJ

/-- Here the other collision source does lie in `J`'s critical shell, but the
displayed boundary order is not `O,A,X,J,C,K` under any cyclic re-cut. -/
theorem rowHit_crossMembership_present_order_missing_checked :
    orderMissingRow.card = 4 ∧
    collisionSourceC ∈ orderMissingRow ∧
    orderMissingJ ∈ orderMissingRow ∧
    orderMissingJ ≠ collisionSourceC ∧
    collisionSourceK ∈ criticalSupport orderMissingJ ∧
    orderMissingX = blocker orderMissingJ ∧
    ¬ CyclicSix firstApex commonBlocker orderMissingX orderMissingJ
      collisionSourceC collisionSourceK := by
  decide

#print axioms rowHit_crossMembership_missing_checked
#print axioms rowHit_crossMembership_present_order_missing_checked

end ATailCriticalFiberClosingCoreOrderedFiniteBoundary
end Problem97

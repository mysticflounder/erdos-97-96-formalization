/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite boundary for a second blocker collision

This is a finite row/blocker abstraction, not a Euclidean counterexample.
It retains the finite consequences used by the live robust-collision route
while having exactly one nontrivial blocker fiber.
-/

namespace Problem97
namespace ATailSecondCollisionFiniteBoundary

abbrev Label := Fin 12

def robustApex : Label := 4
def physicalSecondApex : Label := 8
def collisionSource₁ : Label := 1
def collisionSource₂ : Label := 2
def robustRowPartner : Label := 7
def commonBlocker : Label := 0
def frontierSource : Label := 1
def frontierCompanion : Label := 2

/-- A five-point class witnessing single-deletion robustness at the first
apex. -/
def robustClass : Finset Label := {1, 5, 6, 7, 8}

/-- A separate first-apex class surviving deletion of both frontier points. -/
def firstApexDoubleClass : Finset Label := {5, 6, 7, 8}

/-- A physical-second-apex class surviving deletion of both frontier points. -/
def secondApexDoubleClass : Finset Label := {0, 3, 5, 6}

/-- The blocker map omits the robust apex and has exactly one double fiber. -/
def blocker : Label → Label :=
  ![2, 0, 0, 5, 3, 6, 7, 8, 9, 10, 11, 1]

/-- One selected row at each represented center.  The required blocker
preimages are included, and the successor edge makes the row digraph strongly
connected. -/
def globalRow : Label → Finset Label :=
  ![({1, 2, 3, 4} : Finset Label),
    {2, 3, 4, 11},
    {0, 3, 4, 5},
    {2, 4, 5, 6},
    {1, 6, 7, 8},
    {3, 6, 7, 8},
    {5, 7, 8, 9},
    {6, 8, 9, 10},
    {7, 9, 10, 11},
    {0, 8, 10, 11},
    {0, 1, 9, 11},
    {0, 1, 2, 10}]

def criticalSupport (source : Label) : Finset Label :=
  globalRow (blocker source)

def rowClosed (U : Finset Label) : Prop :=
  ∀ center ∈ U, globalRow center ⊆ U

instance instDecidableRowClosed (U : Finset Label) : Decidable (rowClosed U) := by
  unfold rowClosed
  infer_instance

theorem total_critical_system_checked :
    (∀ center : Label, (globalRow center).card = 4) ∧
    (∀ center : Label, center ∉ globalRow center) ∧
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ x y : Label, blocker x = blocker y →
      criticalSupport x = criticalSupport y) := by
  decide

theorem parent_radius_surface_checked :
    robustClass.card = 5 ∧
    robustApex ∉ robustClass ∧
    (∀ deleted : Label, 4 ≤ (robustClass.erase deleted).card) ∧
    firstApexDoubleClass.card = 4 ∧
    frontierSource ∉ firstApexDoubleClass ∧
    frontierCompanion ∉ firstApexDoubleClass ∧
    secondApexDoubleClass.card = 4 ∧
    frontierSource ∉ secondApexDoubleClass ∧
    frontierCompanion ∉ secondApexDoubleClass ∧
    robustApex ≠ physicalSecondApex := by
  decide

/-- The robust apex is the only omitted blocker value and the common blocker
is the only value with two distinct preimages. -/
theorem exactly_one_nontrivial_blocker_fiber_checked :
    (∀ source : Label, blocker source ≠ robustApex) ∧
    collisionSource₁ ≠ collisionSource₂ ∧
    blocker collisionSource₁ = commonBlocker ∧
    blocker collisionSource₂ = commonBlocker ∧
    (∀ a b : Label, a ≠ b → blocker a = blocker b →
      blocker a = commonBlocker) ∧
    (∀ source : Label, blocker source = commonBlocker →
      source = collisionSource₁ ∨ source = collisionSource₂) := by
  decide

/-- The prefix of the actual ordinal terminal is present: the robust-apex row
contains `C,J`, and the unique collision row contains `C,K`. -/
theorem collision_and_robust_row_prefix_checked :
    collisionSource₁ ≠ collisionSource₂ ∧
    blocker collisionSource₁ = commonBlocker ∧
    blocker collisionSource₂ = commonBlocker ∧
    collisionSource₁ ∈ globalRow robustApex ∧
    robustRowPartner ∈ globalRow robustApex ∧
    collisionSource₁ ∈ globalRow commonBlocker ∧
    collisionSource₂ ∈ globalRow commonBlocker := by
  decide

/-- Even after supplying both missing robust-row memberships, no ordinary
represented center has a row through `J,K`.  Thus selected-row closure does
not force the cross-row triangle used by the ordinal terminal. -/
theorem no_crossRow_completion_checked :
    ¬ ∃ center : Label,
      center ≠ robustApex ∧ center ≠ commonBlocker ∧
      robustRowPartner ∈ globalRow center ∧
      collisionSource₂ ∈ globalRow center := by
  decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 2000000 in
/-- Every nonempty row-closed subset is the whole carrier, the finite
selected-witness consequence of global minimality. -/
theorem minimal_row_closure_surface_checked :
    ∀ U : Finset Label, U.Nonempty → rowClosed U → U = Finset.univ := by
  decide

#print axioms total_critical_system_checked
#print axioms parent_radius_surface_checked
#print axioms exactly_one_nontrivial_blocker_fiber_checked
#print axioms collision_and_robust_row_prefix_checked
#print axioms no_crossRow_completion_checked
#print axioms minimal_row_closure_surface_checked

end ATailSecondCollisionFiniteBoundary
end Problem97

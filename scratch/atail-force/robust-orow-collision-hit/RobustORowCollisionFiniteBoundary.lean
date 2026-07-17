/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite boundary for first-apex incidence of a blocker collision

This is a finite row/blocker-map abstraction, not a Euclidean counterexample.
It strengthens the earlier robust-collision boundary by making both repeated-
fiber sources lie outside the retained deletion-robust first-apex class and
its chosen selected four-row.
-/

namespace Problem97
namespace ATailRobustORowCollisionFiniteBoundary

abbrev Label := Fin 12

def firstApex : Label := 4
def collisionSource₁ : Label := 1
def collisionSource₂ : Label := 2
def commonBlocker : Label := 0

/-- A five-point first-apex radius class which survives every deletion and
contains neither collision source. -/
def firstApexClass : Finset Label := {0, 3, 5, 6, 7}

/-- A selected four-subrow of the first-apex class, still avoiding both
collision sources. -/
def firstApexRow : Finset Label := {0, 3, 5, 6}

/-- One selected four-row at every represented center. -/
def globalRow : Label → Finset Label :=
  ![({1, 2, 3, 4} : Finset Label),
    {0, 2, 6, 7},
    {1, 3, 9, 10},
    {1, 4, 7, 11},
    {0, 3, 5, 6},
    {0, 3, 8, 11},
    {2, 7, 8, 10},
    {4, 6, 9, 11},
    {3, 5, 7, 9},
    {0, 4, 5, 10},
    {2, 5, 8, 11},
    {1, 6, 8, 9}]

/-- A total source-indexed blocker map omitting the first apex. -/
def blocker : Label → Label :=
  ![1, 0, 0, 0, 0, 8, 7, 6, 5, 2, 2, 3]

def criticalSupport (source : Label) : Finset Label :=
  globalRow (blocker source)

def rowClosed (U : Finset Label) : Prop :=
  ∀ center ∈ U, globalRow center ⊆ U

instance instDecidableRowClosed (U : Finset Label) : Decidable (rowClosed U) := by
  unfold rowClosed
  infer_instance

/-- The represented critical system is total, fixed-point-free, source-exact,
and support-locked on equal blocker fibers. -/
theorem total_critical_system_checked :
    (∀ center : Label, (globalRow center).card = 4) ∧
    (∀ center : Label, center ∉ globalRow center) ∧
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, ((criticalSupport source).erase source).card = 3) ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ x y : Label, blocker x = blocker y →
      criticalSupport x = criticalSupport y) := by
  decide

/-- The first apex is omitted from the blocker image, and its five-point
class is deletion-robust. -/
theorem robust_firstApex_checked :
    (∀ source : Label, blocker source ≠ firstApex) ∧
    firstApexClass.card = 5 ∧
    firstApex ∉ firstApexClass ∧
    (∀ deleted : Label, 4 ≤ (firstApexClass.erase deleted).card) ∧
    firstApexRow ⊆ firstApexClass ∧
    firstApexRow.card = 4 := by
  decide

/-- The collision has all represented deletion-critical-fiber incidence but
neither source lies in the retained first-apex class or selected row. -/
theorem collision_sources_off_firstApex_class_and_row_checked :
    collisionSource₁ ≠ collisionSource₂ ∧
    blocker collisionSource₁ = commonBlocker ∧
    blocker collisionSource₂ = commonBlocker ∧
    collisionSource₁ ∈ criticalSupport collisionSource₁ ∧
    collisionSource₂ ∈ criticalSupport collisionSource₂ ∧
    collisionSource₁ ∉ firstApexClass ∧
    collisionSource₂ ∉ firstApexClass ∧
    collisionSource₁ ∉ firstApexRow ∧
    collisionSource₂ ∉ firstApexRow := by
  decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 2000000 in
/-- The represented selected-row closure consequence of minimality remains
true after removing both collision sources from the first-apex row. -/
theorem minimal_row_closure_surface_checked :
    ∀ U : Finset Label, U.Nonempty → rowClosed U → U = Finset.univ := by
  decide

#print axioms total_critical_system_checked
#print axioms robust_firstApex_checked
#print axioms collision_sources_off_firstApex_class_and_row_checked
#print axioms minimal_row_closure_surface_checked

end ATailRobustORowCollisionFiniteBoundary
end Problem97

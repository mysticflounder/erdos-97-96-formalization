/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite regression for the triple-fiber cap residual

This is an incidence/cap-count abstraction, not a Euclidean counterexample.
It retains two omitted blocker values, deletion-robust apex classes, exact
support locking, one three-source blocker fiber, and the cap-count conclusion
proved by `BiApexTripleFiberCapOrder.lean`.  Nevertheless no distinct-center
row contains two members of the triple fiber.
-/

namespace Problem97
namespace ATailBiApexTripleFiberCapFiniteBoundary

abbrev Label := Fin 9

def firstApex : Label := 7
def secondApex : Label := 8
def remainingMoserVertex : Label := 0

def source₁ : Label := 1
def source₂ : Label := 2
def source₃ : Label := 3
def fourthShellPoint : Label := 4

def blocker : Label → Label :=
  ![4, 0, 0, 0, 5, 6, 4, 5, 6]

def globalRow : Label → Finset Label :=
  ![({1, 2, 3, 4} : Finset Label),
    {0, 2, 4, 5},
    {0, 3, 4, 5},
    {0, 1, 4, 5},
    {0, 2, 5, 6},
    {1, 4, 7, 8},
    {0, 4, 5, 8},
    {0, 2, 4, 6},
    {0, 3, 5, 6}]

def criticalSupport (source : Label) : Finset Label :=
  globalRow (blocker source)

def firstApexRobustClass : Finset Label := {0, 1, 2, 3, 8}
def secondApexRobustClass : Finset Label := {0, 1, 2, 3, 7}
def parentDoubleClass : Finset Label := {0, 4, 5, 6}

def surplusCap : Finset Label := {1, 4, 5, 7, 8}
def firstOppositeCap : Finset Label := {0, 2, 6, 8}
def secondOppositeCap : Finset Label := {0, 3, 6, 7}
def surplusInterior : Finset Label := {1, 4, 5}

theorem total_locked_critical_system_checked :
    (blocker source₁ = remainingMoserVertex ∧
      blocker source₂ = remainingMoserVertex ∧
      blocker source₃ = remainingMoserVertex) ∧
    source₁ ≠ source₂ ∧ source₃ ≠ source₁ ∧
      source₃ ≠ source₂ ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source target : Label, blocker source = blocker target →
      criticalSupport source = criticalSupport target) ∧
    (∀ center : Label, (globalRow center).card = 4) ∧
    (∀ center : Label, center ∉ globalRow center) := by
  decide

theorem biApex_parent_surface_checked :
    (∀ source : Label, blocker source ≠ firstApex) ∧
    (∀ source : Label, blocker source ≠ secondApex) ∧
    firstApex ≠ secondApex ∧
    firstApexRobustClass.card = 5 ∧
    secondApexRobustClass.card = 5 ∧
    (∀ deleted : Label, 4 ≤ (firstApexRobustClass.erase deleted).card) ∧
    (∀ deleted : Label, 4 ≤ (secondApexRobustClass.erase deleted).card) ∧
    parentDoubleClass.card = 4 ∧
    source₁ ∉ parentDoubleClass ∧ source₂ ∉ parentDoubleClass := by
  decide

theorem exact_triple_shell_checked :
    globalRow remainingMoserVertex =
      {source₁, source₂, source₃, fourthShellPoint} ∧
    source₁ ∈ globalRow remainingMoserVertex ∧
    source₂ ∈ globalRow remainingMoserVertex ∧
    source₃ ∈ globalRow remainingMoserVertex := by
  decide

/-- The abstract cap placement realizes the triangle-blocker residual: each
opposite cap receives at most one shell member, while a triple-fiber source
lies in the strict surplus interior. -/
theorem triangle_blocker_cap_residual_checked :
    remainingMoserVertex ∈ firstOppositeCap ∧
    remainingMoserVertex ∈ secondOppositeCap ∧
    remainingMoserVertex ∉ surplusCap ∧
    (globalRow remainingMoserVertex ∩ firstOppositeCap).card ≤ 1 ∧
    (globalRow remainingMoserVertex ∩ secondOppositeCap).card ≤ 1 ∧
    source₁ ∈ surplusInterior ∧
    surplusInterior ⊆ surplusCap ∧
    surplusCap ∪ firstOppositeCap ∪ secondOppositeCap = Finset.univ := by
  decide

/-- Even after the triple shell and cap residual, there is no new center whose
row contains two distinct triple-fiber sources.  A geometric closer must add
a genuinely new cross-row incidence or an equivalent metric consequence. -/
theorem no_distinct_center_cross_pair_checked :
    ¬ ∃ center : Label,
      center ≠ remainingMoserVertex ∧
      2 ≤ ((globalRow center) ∩ {source₁, source₂, source₃}).card := by
  decide

#print axioms total_locked_critical_system_checked
#print axioms biApex_parent_surface_checked
#print axioms triangle_blocker_cap_residual_checked
#print axioms no_distinct_center_cross_pair_checked

end ATailBiApexTripleFiberCapFiniteBoundary
end Problem97

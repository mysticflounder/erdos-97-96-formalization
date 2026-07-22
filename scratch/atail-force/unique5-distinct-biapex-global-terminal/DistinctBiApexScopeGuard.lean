/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite scope guard for the exact-five distinct-bi-apex residual

This file pins a twelve-label incidence/cap model of the row-level consequences currently
available on the exact-five distinct-blocker branch.  It is not a Euclidean realization and is
not a `CounterexampleData`.  Its purpose is narrower: exact-five deletion robustness, a second
robust apex, a three-cap `(5,5,5)` partition, a total exact-support blocker map omitting both
apices, the two standard circle-incidence bounds, and selected-row strong connectivity do not
force the positive cross-incidence packet consumed by the existing card-five terminal.
-/

namespace Problem97
namespace ATailUniqueFiveDistinctBiApexGlobalTerminalScratch
namespace FiniteBoundary

abbrev Label := Fin 12

def firstApex : Label := 0
def secondApex : Label := 10
def thirdApex : Label := 11

def q : Label := 1
def w : Label := 3

/-- One four-point selected witness support at every represented center. -/
def row : Label → Finset Label :=
  ![({1, 3, 5, 6} : Finset Label),
    {0, 2, 7, 8},
    {0, 3, 7, 11},
    {1, 2, 5, 7},
    {1, 7, 8, 9},
    {4, 6, 9, 11},
    {0, 4, 8, 11},
    {4, 6, 8, 10},
    {7, 9, 10, 11},
    {3, 8, 10, 11},
    {2, 3, 8, 9},
    {5, 6, 9, 10}]

/-- A total fixed-point-free blocker map whose image omits both represented physical apices. -/
def blocker : Label → Label :=
  ![1, 4, 1, 2, 6, 3, 5, 3, 6, 4, 7, 6]

/-- The complete exact-four support attached to a source through its blocker. -/
def criticalSupport (source : Label) : Finset Label := row (blocker source)

/-- The exact five-point class at the represented first apex. -/
def firstClass : Finset Label := {1, 3, 4, 5, 6}

/-- A five-point class witnessing full singleton-deletion robustness at the second apex. -/
def secondClass : Finset Label := {2, 3, 7, 8, 9}

/-- The displayed surplus cap, with endpoints `firstApex, secondApex`. -/
def surplusCap : Finset Label := {0, 2, 4, 7, 10}

/-- The first opposite cap, with endpoints `secondApex, thirdApex`. -/
def firstOppCap : Finset Label := {1, 3, 6, 10, 11}

/-- The second opposite cap, with endpoints `thirdApex, firstApex`. -/
def secondOppCap : Finset Label := {0, 5, 8, 9, 11}

def firstOppInterior : Finset Label := firstOppCap \ {secondApex, thirdApex}

/-- A set is closed under every selected witness row at one of its centers. -/
def RowClosed (U : Finset Label) : Prop :=
  ∀ center ∈ U, row center ⊆ U

instance instDecidableRowClosed (U : Finset Label) : Decidable (RowClosed U) := by
  unfold RowClosed
  infer_instance

/-- Centers of represented rows containing one unordered pair. -/
def pairCenters (left right : Label) : Finset Label :=
  Finset.univ.filter fun center ↦ left ∈ row center ∧ right ∈ row center

/-- Finite analogue of the existing `CardFiveCapOrMutualFields` terminal antecedent. -/
def HasCardFiveCapOrMutualTerminal : Prop :=
  ∃ z ∈ firstClass \ surplusCap, ∃ y ∈ firstClass \ surplusCap,
    z ≠ y ∧ blocker z ≠ blocker y ∧
      ((y ∈ criticalSupport z ∧ blocker z ∈ surplusCap) ∨
       (z ∈ criticalSupport y ∧ blocker y ∈ surplusCap) ∨
       (y ∈ criticalSupport z ∧ z ∈ criticalSupport y))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 2000000 in
/-- Every nonempty row-closed set is the whole represented carrier. -/
theorem no_nonempty_proper_rowClosed_checked :
    ∀ U : Finset Label, U.Nonempty → RowClosed U → U = Finset.univ := by
  decide

/-- The represented three-cap partition and exact-five first-cap placement. -/
theorem cap_surface_checked :
    (surplusCap ∪ firstOppCap ∪ secondOppCap = Finset.univ) ∧
    (surplusCap ∩ firstOppCap = {secondApex}) ∧
    (firstOppCap ∩ secondOppCap = {thirdApex}) ∧
    (secondOppCap ∩ surplusCap = {firstApex}) ∧
    surplusCap.card = 5 ∧
    firstOppCap.card = 5 ∧
    secondOppCap.card = 5 ∧
    firstOppInterior.card = 3 ∧
    q ∈ firstOppInterior ∧
    w ∈ firstOppInterior ∧
    q ≠ w ∧
    firstClass.card = 5 ∧
    (firstClass ∩ firstOppInterior).card = 3 := by
  decide

/-- The two represented apex classes have the deletion behavior used by the residual. -/
theorem robust_apex_classes_checked :
    row firstApex ⊆ firstClass ∧
    (row firstApex).card = 4 ∧
    (∀ deleted : Label, 4 ≤ (firstClass.erase deleted).card) ∧
    ((firstClass.erase q).erase w).card = 3 ∧
    secondClass.card = 5 ∧
    row secondApex ⊆ secondClass ∧
    (row secondApex).card = 4 ∧
    (∀ deleted : Label, 4 ≤ (secondClass.erase deleted).card) ∧
    4 ≤ ((secondClass.erase q).erase w).card := by
  decide

/-- The total blocker map has the exact-support and omission properties retained by a
`CriticalShellSystem` after forgetting its metric radii. -/
theorem critical_map_surface_checked :
    (∀ center : Label, (row center).card = 4) ∧
    (∀ center : Label, center ∉ row center) ∧
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ source : Label, blocker source ≠ firstApex) ∧
    (∀ source : Label, blocker source ≠ secondApex) ∧
    (∀ source : Label, (criticalSupport source).card = 4) ∧
    (∀ source : Label, ((criticalSupport source).erase source).card = 3) := by
  decide

/-- The two standard circle-incidence shadows both hold in the model. -/
theorem circle_incidence_bounds_checked :
    (∀ left right : Label, left ≠ right →
      ((row left) ∩ (row right)).card ≤ 2) ∧
    (∀ left right : Label, left ≠ right →
      (pairCenters left right).card ≤ 2) := by
  decide

/-- Every selected row whose center lies in a displayed cap meets that cap in at most two
points, matching the ordered-cap row-counting consequence used by the exact-five consumer. -/
theorem displayed_cap_row_bounds_checked :
    (∀ center ∈ surplusCap, (row center ∩ surplusCap).card ≤ 2) ∧
    (∀ center ∈ firstOppCap, (row center ∩ firstOppCap).card ≤ 2) ∧
    (∀ center ∈ secondOppCap, (row center ∩ secondOppCap).card ≤ 2) := by
  decide

/-- The retained pair has distinct surplus-cap blockers and reciprocal omission. -/
theorem retained_pair_surface_checked :
    blocker q ≠ blocker w ∧
    blocker q ∈ surplusCap ∧
    blocker w ∈ surplusCap ∧
    w ∉ criticalSupport q ∧
    q ∉ criticalSupport w ∧
    (criticalSupport q).erase w = criticalSupport q ∧
    (criticalSupport w).erase q = criticalSupport w := by
  decide

/-- The exact positive packet used by the current card-five consumer is absent despite the
preceding row-level constraints. -/
theorem no_cardFiveCapOrMutualTerminal_checked :
    ¬ HasCardFiveCapOrMutualTerminal := by
  unfold HasCardFiveCapOrMutualTerminal
  decide

#print axioms no_nonempty_proper_rowClosed_checked
#print axioms cap_surface_checked
#print axioms robust_apex_classes_checked
#print axioms critical_map_surface_checked
#print axioms circle_incidence_bounds_checked
#print axioms displayed_cap_row_bounds_checked
#print axioms retained_pair_surface_checked
#print axioms no_cardFiveCapOrMutualTerminal_checked

end FiniteBoundary
end ATailUniqueFiveDistinctBiApexGlobalTerminalScratch
end Problem97

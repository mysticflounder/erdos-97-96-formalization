/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite blocker-cycle boundary for the robust-pair complement

This is a finite radius-class/incidence abstraction, not a Euclidean
counterexample.  It retains the current robust-history and total critical-row
interfaces and makes the blocker iteration explicit.  The two history
endpoints form a genuine blocker two-cycle, both blockers remain outside the
surplus cap, and both directed cross deletions survive because each mate is
omitted from the corresponding exact critical support.
-/

namespace Problem97
namespace ATailRComplementBlockerMapFiniteBoundary

abbrev Label := Fin 12

def surplusCap : Finset Label := {1, 2, 3, 4, 5}
def oppositeCap1 : Finset Label := {0, 2, 6, 7, 8}
def oppositeCap2 : Finset Label := {0, 1, 9, 10, 11}

def firstApex : Label := 1
def secondApex : Label := 2
def historyLeft : Label := 6
def historyRight : Label := 7

def historyRadiusRow : Finset Label := {0, 2, 6, 7}
def survivingFirstApexRow : Finset Label := {3, 4, 8, 9}
def survivingSecondApexRow : Finset Label := {0, 1, 9, 10}

def globalRow : Label → Finset Label :=
  ![({1, 2, 3, 4} : Finset Label),
    {0, 2, 6, 7},
    {0, 1, 9, 10},
    {1, 4, 7, 11},
    {3, 5, 6, 10},
    {0, 3, 8, 11},
    {2, 7, 8, 10},
    {4, 6, 9, 11},
    {3, 5, 7, 9},
    {0, 4, 5, 10},
    {2, 5, 8, 11},
    {1, 6, 8, 9}]

def blocker : Label → Label :=
  ![1, 0, 0, 0, 0, 4, 7, 6, 5, 2, 2, 3]

def criticalSupport (source : Label) : Finset Label :=
  globalRow (blocker source)

/-- The cap frame and robust pair placement are retained. -/
theorem cap_frame_and_pair_checked :
    surplusCap.card = 5 ∧
    oppositeCap1.card = 5 ∧
    oppositeCap2.card = 5 ∧
    surplusCap ∪ oppositeCap1 ∪ oppositeCap2 = Finset.univ ∧
    historyLeft ∈ oppositeCap1 \ (surplusCap ∪ oppositeCap2) ∧
    historyRight ∈ oppositeCap1 \ (surplusCap ∪ oppositeCap2) := by
  decide

/-- The pair is co-radial at the first apex and another four-class survives
both erasures at each prescribed apex. -/
theorem robust_double_survival_checked :
    historyLeft ≠ historyRight ∧
    historyLeft ∈ historyRadiusRow ∧
    historyRight ∈ historyRadiusRow ∧
    historyRadiusRow.card = 4 ∧
    ((survivingFirstApexRow.erase historyLeft).erase historyRight).card = 4 ∧
    ((survivingSecondApexRow.erase historyLeft).erase historyRight).card = 4 := by
  decide

/-- The total source-indexed row system has exact four-point supports, contains
its source, loses that row after source deletion, and has no fixed blocker. -/
theorem total_critical_system_checked :
    (∀ center : Label, (globalRow center).card = 4) ∧
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, ((criticalSupport source).erase source).card = 3) ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ x y : Label, blocker x = blocker y →
      criticalSupport x = criticalSupport y) := by
  decide

/-- Iterating the actual blocker choice does not force a surplus placement or
a cross incidence in this interface: the pair itself is a blocker two-cycle,
and deleting either mate leaves the other source's four-point support intact. -/
theorem robust_pair_two_cycle_with_two_cross_survivals_checked :
    blocker historyLeft = historyRight ∧
    blocker historyRight = historyLeft ∧
    (blocker^[2]) historyLeft = historyLeft ∧
    blocker historyLeft ∉ surplusCap ∧
    blocker historyRight ∉ surplusCap ∧
    historyRight ∉ criticalSupport historyLeft ∧
    historyLeft ∉ criticalSupport historyRight ∧
    ((criticalSupport historyLeft).erase historyRight).card = 4 ∧
    ((criticalSupport historyRight).erase historyLeft).card = 4 := by
  decide

/-- No recorded center captures the robust pair as a common two-point
incidence, despite the total blocker cycle and the global four-row table. -/
theorem no_recorded_center_captures_pair :
    ¬ ∃ center : Label, center ≠ firstApex ∧
      historyLeft ∈ globalRow center ∧
      historyRight ∈ globalRow center := by
  decide

#print axioms cap_frame_and_pair_checked
#print axioms robust_double_survival_checked
#print axioms total_critical_system_checked
#print axioms robust_pair_two_cycle_with_two_cross_survivals_checked
#print axioms no_recorded_center_captures_pair

end ATailRComplementBlockerMapFiniteBoundary
end Problem97

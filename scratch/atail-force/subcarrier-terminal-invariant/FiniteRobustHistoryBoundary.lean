/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite boundary for the robust terminal-history interface

This is a kernel-checked finite radius-class/incidence abstraction, not a
Euclidean counterexample.  It strengthens the older history/global-incidence
shadow by explicitly retaining an alternate first-apex four-class which is
disjoint from the erased pair.  Thus simultaneous deletion of the pair
preserves four points at both apices, while the pair's own ambient four-class
is hidden by the terminal carrier.

The model still has a total source-indexed critical row system, but neither
history endpoint has a surplus-cap blocker and both directed cross hits fail.
It is therefore a regression boundary: the robust history theorem alone
cannot supply either of the two hypotheses consumed by
`false_of_sourceBlocker_surplus_cross`.
-/

namespace Problem97
namespace ATailSubcarrierTerminalInvariantFiniteBoundary

abbrev Label := Fin 12

def surplusCap : Finset Label := {1, 2, 3, 4, 5}
def oppositeCap1 : Finset Label := {0, 2, 6, 7, 8}
def oppositeCap2 : Finset Label := {0, 1, 9, 10, 11}

def firstApex : Label := 1
def secondApex : Label := 2
def historyLeft : Label := 6
def historyRight : Label := 7

/-- The ambient class hidden by erasing the history pair. -/
def historyRadiusRow : Finset Label := {0, 2, 6, 7}

/-- A different first-apex radius class which survives both erasures. -/
def terminalFirstRadiusRow : Finset Label := {3, 4, 8, 9}

/-- The retained second-apex four-class. -/
def secondApexRadiusRow : Finset Label := {0, 1, 9, 10}

def terminalCarrier : Finset Label :=
  (Finset.univ.erase historyLeft).erase historyRight

/-- `false` is the hidden ambient radius; `true` is the terminal radius. -/
def firstRadiusRow : Bool → Finset Label
  | false => historyRadiusRow
  | true => terminalFirstRadiusRow

def firstRadiusRowOnCarrier (radius : Bool) : Finset Label :=
  firstRadiusRow radius ∩ terminalCarrier

/-- The twelve exact-row supports of the saved card-12 survivor. -/
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

/-- The model has the current `(5,5,5)` cap frame, and both history points
lie in the strict part of the first opposite cap. -/
theorem cap_and_history_placement_checked :
    surplusCap.card = 5 ∧
    oppositeCap1.card = 5 ∧
    oppositeCap2.card = 5 ∧
    surplusCap ∪ oppositeCap1 ∪ oppositeCap2 = Finset.univ ∧
    firstApex ∈ surplusCap ∧
    historyLeft ∈ oppositeCap1 \ (surplusCap ∪ oppositeCap2) ∧
    historyRight ∈ oppositeCap1 \ (surplusCap ∪ oppositeCap2) := by
  decide

/-- This is the strengthened robust-history boundary: the erased pair is a
four-class at the first apex, another first-apex four-class survives both
erasures, the second-apex four-class survives both erasures, and only the
alternate radius remains a four-class on the terminal carrier. -/
theorem robust_terminal_history_checked :
    historyLeft ≠ historyRight ∧
    historyLeft ∈ historyRadiusRow ∧
    historyRight ∈ historyRadiusRow ∧
    historyRadiusRow.card = 4 ∧
    ((terminalFirstRadiusRow.erase historyLeft).erase historyRight).card = 4 ∧
    ((secondApexRadiusRow.erase historyLeft).erase historyRight).card = 4 ∧
    (∀ radius : Bool,
      4 ≤ (firstRadiusRowOnCarrier radius).card → radius = true) := by
  decide

/-- The background source-indexed critical-row interface is retained. -/
theorem critical_system_checked :
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ x y : Label, blocker x = blocker y →
      criticalSupport x = criticalSupport y) ∧
    (∀ source : Label,
      ((criticalSupport source).erase source).card = 3) := by
  decide

/-- The desired terminal-sink inputs do not follow at this finite interface:
the history blockers are not in the surplus cap, neither selected blocker row
contains the mate, and no second recorded center contains the whole pair. -/
theorem terminal_sink_inputs_fail :
    blocker historyLeft ∉ surplusCap ∧
    blocker historyRight ∉ surplusCap ∧
    historyRight ∉ criticalSupport historyLeft ∧
    historyLeft ∉ criticalSupport historyRight ∧
    ¬ ∃ center : Label, center ≠ firstApex ∧
      historyLeft ∈ globalRow center ∧
      historyRight ∈ globalRow center := by
  decide

#print axioms cap_and_history_placement_checked
#print axioms robust_terminal_history_checked
#print axioms critical_system_checked
#print axioms terminal_sink_inputs_fail

end ATailSubcarrierTerminalInvariantFiniteBoundary
end Problem97

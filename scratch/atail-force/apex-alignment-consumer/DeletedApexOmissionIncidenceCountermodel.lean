/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Exact finite-incidence regression for the deleted-apex producer

This is deliberately an incidence shadow, not a Euclidean
`CounterexampleData`.  It records exactly the polarity of the rows and
cardinality facts retained by the local frontier/cross interface:

* the frontier sources `q,w` are omitted from an exact four-point apex class;
* the two continuation labels lie in that class and differ from `q,w`;
* a continuation row omits the oriented deleted label but has a non-apex
  center;
* an abstract second cap has five members; and
* no second four-capable apex radius exists.

The finite model shows that those local fields, including the bare
second-large-cap count, do not imply the missing center/radius alignment.
-/

namespace Problem97
namespace ATailDeletedApexOmissionIncidenceCountermodel

abbrev Point := Fin 12

def apex : Point := 0
def q : Point := 1
def w : Point := 2
def z₁ : Point := 3
def z₂ : Point := 4

def apexClass : Finset Point := {3, 4, 5, 6}
def survivorRow : Finset Point := {0, 1, 7, 8}
def deletedCenterRow : Finset Point := {0, 2, 7, 9}
def secondLargeCap : Finset Point := {3, 4, 5, 6, 7}
def liveBlockerCenters : Finset Point := {7, 8, 9, 10, 11}

/-- Two abstract apex radii: the critical radius has exactly four points and
the only other radius has only three. -/
def apexRadiusClass : Fin 2 → Finset Point
  | 0 => apexClass
  | 1 => {7, 8, 9}

theorem frontier_and_cross_fields_hold :
    apexClass.card = 4 ∧
      q ∉ apexClass ∧ w ∉ apexClass ∧
      z₁ ∈ apexClass ∧ z₂ ∈ apexClass ∧
      q ≠ w ∧ z₁ ≠ z₂ ∧
      z₁ ≠ q ∧ z₁ ≠ w ∧ z₂ ≠ q ∧ z₂ ≠ w ∧
      survivorRow.card = 4 ∧ z₂ ∉ survivorRow ∧ z₁ ∉ survivorRow ∧
      deletedCenterRow.card = 4 ∧ z₂ ∉ deletedCenterRow ∧
      apexClass ⊆ (Finset.univ.erase q).erase w := by
  decide

theorem second_large_cap_and_live_role_fields_hold :
    secondLargeCap.card = 5 ∧
      apex ∉ liveBlockerCenters ∧
      liveBlockerCenters.card = 5 := by
  decide

/-- The exact critical four-class has no four-point subset omitting the
oriented deleted label. -/
theorem no_sameRadius_four_subset_omits_deleted :
    ¬ ∃ T : Finset Point,
      T ⊆ apexClass ∧ T.card = 4 ∧ z₂ ∉ T := by
  decide

/-- There is no distinct four-capable radius in the shadow, even though the
abstract second cap has cardinality five. -/
theorem no_distinct_four_capable_apexRadius :
    ¬ ∃ radius : Fin 2,
      radius ≠ 0 ∧ 4 ≤ (apexRadiusClass radius).card := by
  decide

#print axioms frontier_and_cross_fields_hold
#print axioms second_large_cap_and_live_role_fields_hold
#print axioms no_sameRadius_four_subset_omits_deleted
#print axioms no_distinct_four_capable_apexRadius

end ATailDeletedApexOmissionIncidenceCountermodel
end Problem97

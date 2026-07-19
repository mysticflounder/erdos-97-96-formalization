/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite boundary for the retained collision cap consumer

This is an exact finite row/order/cap abstraction, not a Euclidean
counterexample.  It retains every currently represented critical-map,
minimality, two-circle, alternation, and cap-partition surface while the
collision sources and their common blocker occupy the strict cap opposite the
first apex.  The same-cap closing antecedent still does not occur.
-/

namespace Problem97
namespace ATailRetainedCollisionCapFiniteBoundary

abbrev Label := Fin 12

def firstApex : Label := 4
def commonBlocker : Label := 0
def source₁ : Label := 1
def source₂ : Label := 2

def retainedRadiusClass : Finset Label := {1, 2, 6, 9, 11}
def retainedRadiusRow : Finset Label := {1, 2, 6, 9}

def globalRow : Label → Finset Label :=
  ![({1, 2, 3, 4} : Finset Label),
    {0, 4, 8, 10},
    {0, 1, 9, 10},
    {0, 4, 5, 11},
    {2, 3, 7, 8},
    {0, 3, 6, 8},
    {5, 7, 9, 10},
    {3, 6, 10, 11},
    {0, 2, 5, 6},
    {2, 3, 5, 10},
    {1, 4, 6, 7},
    {1, 5, 7, 8}]

def blocker : Label → Label :=
  ![1, 0, 0, 0, 0, 8, 7, 6, 5, 2, 2, 3]

def criticalSupport (source : Label) : Finset Label :=
  globalRow (blocker source)

def exactClass (center : Label) : Finset Label :=
  if center = firstApex then retainedRadiusClass else globalRow center

def rowClosed (U : Finset Label) : Prop :=
  ∀ center ∈ U, globalRow center ⊆ U

def boundaryIndex : Label → Fin 12 :=
  ![6, 7, 5, 2, 0, 1, 11, 10, 8, 4, 9, 3]

def btw (i j k : Fin 12) : Prop :=
  (i < k ∧ k < j) ∨ (j < k ∧ k < i)

instance instDecidableBtw (i j k : Fin 12) : Decidable (btw i j k) := by
  unfold btw
  infer_instance

instance instDecidableRowClosed (U : Finset Label) : Decidable (rowClosed U) := by
  unfold rowClosed
  infer_instance

/- The modeled Moser vertices occur at boundary positions `0,4,8`. -/
def secondMoserVertex : Label := 9
def thirdMoserVertex : Label := 8

def firstOppositeCap : Finset Label := {9, 2, 0, 1, 8}
def secondOppositeCap : Finset Label := {8, 10, 7, 6, 4}
def surplusCap : Finset Label := {4, 5, 3, 11, 9}

def capByIndex : Fin 3 → Finset Label :=
  ![firstOppositeCap, secondOppositeCap, surplusCap]

def firstOppositeCapInterior : Finset Label := {2, 0, 1}

def sourceFaithfulSecondCenter (center : Label) : Prop :=
  (center = firstApex ∧ source₁ ∈ retainedRadiusClass ∧
      source₂ ∈ retainedRadiusClass) ∨
    ∃ J : Label,
      center = blocker J ∧
        source₁ ∈ criticalSupport J ∧
        source₂ ∈ criticalSupport J

instance instDecidableSourceFaithfulSecondCenter (center : Label) :
    Decidable (sourceFaithfulSecondCenter center) := by
  unfold sourceFaithfulSecondCenter
  infer_instance

set_option maxRecDepth 100000 in
set_option maxHeartbeats 2000000 in
/-- Total source-exact critical rows and an actual blocker collision inside
the retained first-apex class. -/
theorem retained_collision_critical_system_checked :
    (∀ center : Label, (globalRow center).card = 4) ∧
    (∀ center : Label, center ∉ globalRow center) ∧
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, ((criticalSupport source).erase source).card = 3) ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ source : Label, blocker source ≠ firstApex) ∧
    (∀ x y : Label, blocker x = blocker y →
      criticalSupport x = criticalSupport y) ∧
    source₁ ≠ source₂ ∧
    blocker source₁ = commonBlocker ∧
    blocker source₂ = commonBlocker ∧
    source₁ ∈ retainedRadiusClass ∧
    source₂ ∈ retainedRadiusClass := by
  decide

/-- The retained radius class has the exact robust card-five surface. -/
theorem retained_radius_robustness_checked :
    retainedRadiusClass.card = 5 ∧
    firstApex ∉ retainedRadiusClass ∧
    retainedRadiusRow ⊆ retainedRadiusClass ∧
    retainedRadiusRow.card = 4 ∧
    (∀ deleted : Label, 4 ≤ (retainedRadiusClass.erase deleted).card) := by
  decide

/-- Every represented distinct-center exact-class overlap obeys the
production two-circle cardinality gate. -/
theorem exact_two_circle_intersection_checked :
    (∀ center : Label, center ≠ firstApex →
      ((globalRow center) ∩ retainedRadiusClass).card ≤ 2) ∧
    (∀ firstCenter secondCenter : Label,
      firstCenter ≠ secondCenter →
      ((globalRow firstCenter) ∩ (globalRow secondCenter)).card ≤ 2) := by
  decide

/-- The displayed boundary is a permutation of the carrier labels. -/
theorem boundaryIndex_injective_checked : Function.Injective boundaryIndex := by
  decide

/-- Every pair shared by two represented exact classes alternates across its
two centers on the displayed cyclic boundary. -/
theorem all_shared_pairs_alternate_checked :
    ∀ firstCenter secondCenter : Label,
      firstCenter ≠ secondCenter →
      ∀ firstPoint secondPoint : Label,
        firstPoint ∈ exactClass firstCenter →
        firstPoint ∈ exactClass secondCenter →
        secondPoint ∈ exactClass firstCenter →
        secondPoint ∈ exactClass secondCenter →
        firstPoint ≠ secondPoint →
        secondPoint ≠ firstCenter →
        secondPoint ≠ secondCenter →
        (btw (boundaryIndex firstCenter) (boundaryIndex secondCenter)
            (boundaryIndex firstPoint) ↔
          ¬ btw (boundaryIndex firstCenter) (boundaryIndex secondCenter)
            (boundaryIndex secondPoint)) := by
  decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 2000000 in
/-- The finite selected-row closure consequence of minimality holds. -/
theorem minimal_row_closure_surface_checked :
    ∀ U : Finset Label, U.Nonempty → rowClosed U → U = Finset.univ := by
  decide

/-- The three closed modeled caps form a `(5,5,5)` cap partition of the
twelve-point carrier, hence retain the card-greater-than-nine and no-M44 cap
surface. -/
theorem full_cap_partition_surface_checked :
    (Finset.univ : Finset Label).card = 12 ∧
    9 < (Finset.univ : Finset Label).card ∧
    firstOppositeCap.card = 5 ∧
    secondOppositeCap.card = 5 ∧
    surplusCap.card = 5 ∧
    4 < surplusCap.card ∧
    ¬ (firstOppositeCap.card = 4 ∧ secondOppositeCap.card = 4) ∧
    firstOppositeCap ∪ secondOppositeCap ∪ surplusCap = Finset.univ ∧
    firstOppositeCap ∩ secondOppositeCap = {thirdMoserVertex} ∧
    secondOppositeCap ∩ surplusCap = {firstApex} ∧
    surplusCap ∩ firstOppositeCap = {secondMoserVertex} := by
  decide

/-- The collision realizes the strongest localized first-cap consequence:
both sources and the common blocker lie in the strict cap opposite the first
apex, and the common exact shell meets that cap in exactly the sources. -/
theorem localized_collision_surface_checked :
    firstOppositeCapInterior ⊆ firstOppositeCap ∧
    firstApex ∉ firstOppositeCap ∧
    commonBlocker ∈ firstOppositeCapInterior ∧
    source₁ ∈ firstOppositeCapInterior ∧
    source₂ ∈ firstOppositeCapInterior ∧
    globalRow commonBlocker ∩ firstOppositeCap = {source₁, source₂} := by
  decide

/-- No modeled cap places the first apex and common blocker together while
excluding both sources. -/
theorem no_firstApex_capSeparation_checked :
    ¬ ∃ capIndex : Fin 3,
      commonBlocker ∈ capByIndex capIndex ∧
      firstApex ∈ capByIndex capIndex ∧
      source₁ ∉ capByIndex capIndex ∧
      source₂ ∉ capByIndex capIndex := by
  decide

/-- Even allowing every actual blocker row, no distinct source-faithful
second center gives the production same-cap/outside-source placement. -/
theorem no_sourceFaithful_sameCap_closer_checked :
    ¬ ∃ (capIndex : Fin 3) (secondCenter : Label),
      commonBlocker ∈ capByIndex capIndex ∧
      secondCenter ∈ capByIndex capIndex ∧
      secondCenter ≠ commonBlocker ∧
      source₁ ∉ capByIndex capIndex ∧
      source₂ ∉ capByIndex capIndex ∧
      sourceFaithfulSecondCenter secondCenter := by
  decide

#print axioms retained_collision_critical_system_checked
#print axioms retained_radius_robustness_checked
#print axioms exact_two_circle_intersection_checked
#print axioms boundaryIndex_injective_checked
#print axioms all_shared_pairs_alternate_checked
#print axioms minimal_row_closure_surface_checked
#print axioms full_cap_partition_surface_checked
#print axioms localized_collision_surface_checked
#print axioms no_firstApex_capSeparation_checked
#print axioms no_sourceFaithful_sameCap_closer_checked

end ATailRetainedCollisionCapFiniteBoundary
end Problem97

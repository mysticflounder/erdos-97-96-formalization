/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Finite boundary for retained-radius blocker injectivity

This is a finite row/blocker-map abstraction, not a Euclidean counterexample.
It retains the represented critical-system, robust-radius, and selected-row
minimality surfaces while the actual blocker map is injective on the entire
five-point retained first-apex class.  Its required global noninjectivity
occurs only outside that class.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRetainedRadiusInjectiveFiniteBoundary

open Census554.EqualityCore

abbrev Label := Fin 12

def firstApex : Label := 4
def collisionSource₁ : Label := 1
def collisionSource₂ : Label := 2
def commonBlocker : Label := 0

def retainedRadiusClass : Finset Label := {0, 3, 5, 6, 7}

def retainedRadiusRow : Finset Label := {0, 3, 5, 6}

def globalRow : Label → Finset Label :=
  ![({1, 2, 3, 4} : Finset Label),
    {0, 2, 8, 9},
    {1, 5, 9, 10},
    {2, 8, 10, 11},
    {0, 3, 5, 6},
    {1, 6, 7, 8},
    {1, 4, 7, 10},
    {3, 6, 9, 10},
    {0, 1, 5, 11},
    {2, 5, 7, 11},
    {3, 7, 8, 11},
    {0, 4, 6, 10}]

def blocker : Label → Label :=
  ![1, 0, 0, 0, 0, 8, 7, 6, 5, 2, 2, 3]

def criticalSupport (source : Label) : Finset Label :=
  globalRow (blocker source)

def rowClosed (U : Finset Label) : Prop :=
  ∀ center ∈ U, globalRow center ⊆ U

/-- The full represented exact class: the retained card-five class at the
first apex and the exact critical four-shell at every other center. -/
def exactClass (center : Label) : Finset Label :=
  if center = firstApex then retainedRadiusClass else globalRow center

/-- A cyclic boundary order found after imposing every exact shared-pair
alternation constraint. -/
def boundaryIndex : Label → Fin 12 :=
  ![0, 9, 8, 2, 11, 7, 10, 5, 1, 6, 4, 3]

def btw (i j k : Fin 12) : Prop :=
  (i < k ∧ k < j) ∨ (j < k ∧ k < i)

instance instDecidableBtw (i j k : Fin 12) : Decidable (btw i j k) := by
  unfold btw
  infer_instance

instance instDecidableRowClosed (U : Finset Label) : Decidable (rowClosed U) := by
  unfold rowClosed
  infer_instance

/-- The represented critical system is total, fixed-point-free, source-exact,
support-locked on blocker fibers, and deletion of the source removes exactly
one point from its critical support. -/
theorem total_critical_system_checked :
    (∀ center : Label, (globalRow center).card = 4) ∧
    (∀ center : Label, center ∉ globalRow center) ∧
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, ((criticalSupport source).erase source).card = 3) ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ x y : Label, blocker x = blocker y →
      criticalSupport x = criticalSupport y) := by
  decide

/-- The retained class has the robust five-point surface and the actual
blocker map is injective on all of it. -/
theorem retained_radius_matching_checked :
    retainedRadiusClass.card = 5 ∧
    firstApex ∉ retainedRadiusClass ∧
    (∀ deleted : Label, 4 ≤ (retainedRadiusClass.erase deleted).card) ∧
    retainedRadiusRow ⊆ retainedRadiusClass ∧
    retainedRadiusRow.card = 4 ∧
    (∀ x ∈ retainedRadiusClass, ∀ y ∈ retainedRadiusClass,
      blocker x = blocker y → x = y) := by
  decide

/-- The repaired witness obeys the exact two-circle gate: distinct represented
centers have support intersection at most two, including each critical shell
against the retained card-five first-apex class. -/
theorem exact_two_circle_intersection_checked :
    (∀ center : Label, center ≠ firstApex →
      ((globalRow center) ∩ retainedRadiusClass).card ≤ 2) ∧
    (∀ firstCenter secondCenter : Label,
      firstCenter ≠ secondCenter →
      ((globalRow firstCenter) ∩ (globalRow secondCenter)).card ≤ 2) := by
  decide

/-- The displayed boundary index is a permutation of all twelve labels. -/
theorem boundaryIndex_injective_checked : Function.Injective boundaryIndex := by
  decide

/-- Every shared pair in the represented exact classes satisfies the cyclic
alternation forced by `SurplusCOMPGBank.btw_sep`. -/
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

/-- Global noninjectivity still occurs, but its only displayed repeated fiber
is outside the retained radius class. -/
theorem off_radius_collision_checked :
    collisionSource₁ ≠ collisionSource₂ ∧
    blocker collisionSource₁ = commonBlocker ∧
    blocker collisionSource₂ = commonBlocker ∧
    collisionSource₁ ∉ retainedRadiusClass ∧
    collisionSource₂ ∉ retainedRadiusClass ∧
    (∀ source : Label, blocker source ≠ firstApex) := by
  decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 2000000 in
/-- The finite selected-row closure consequence of minimality also remains
compatible with the injective retained-radius arm. -/
theorem minimal_row_closure_surface_checked :
    ∀ U : Finset Label, U.Nonempty → rowClosed U → U = Finset.univ := by
  decide

/-- The repaired finite object still is not geometrically realizable: the
transitive equality closure of its exact rows contains a banked
`DuplicateCenterCore`.  This is stronger than the direct shared-pair
alternation gate checked above. -/
def banked_duplicateCenterCore :
    Census554.EqualityCore.DuplicateCenterCore globalRow := by
  refine
    { p := 0
      q := 1
      r := 3
      a := 2
      b := 8
      hpq := by decide
      hpr := by decide
      hqr := by decide
      hab := by decide
      ap_aq := ?_
      ap_ar := ?_
      bp_bq := ?_
      bp_br := ?_ }
  · apply EdgeClosure.trans (EdgeClosure.flip 2 0)
    apply EdgeClosure.trans (EdgeClosure.row 0 2 1 (by decide) (by decide))
    apply EdgeClosure.trans (EdgeClosure.flip 0 1)
    apply EdgeClosure.trans (EdgeClosure.row 1 0 2 (by decide) (by decide))
    exact EdgeClosure.flip 1 2
  · apply EdgeClosure.trans (EdgeClosure.flip 2 0)
    apply EdgeClosure.trans (EdgeClosure.row 0 2 4 (by decide) (by decide))
    apply EdgeClosure.trans (EdgeClosure.flip 0 4)
    apply EdgeClosure.trans (EdgeClosure.row 4 0 6 (by decide) (by decide))
    apply EdgeClosure.trans (EdgeClosure.flip 4 6)
    apply EdgeClosure.trans (EdgeClosure.row 6 4 7 (by decide) (by decide))
    apply EdgeClosure.trans (EdgeClosure.flip 6 7)
    apply EdgeClosure.trans (EdgeClosure.row 7 6 10 (by decide) (by decide))
    apply EdgeClosure.trans (EdgeClosure.flip 7 10)
    apply EdgeClosure.trans (EdgeClosure.row 10 7 3 (by decide) (by decide))
    apply EdgeClosure.trans (EdgeClosure.flip 10 3)
    apply EdgeClosure.trans (EdgeClosure.row 3 10 2 (by decide) (by decide))
    exact EdgeClosure.flip 3 2
  · exact EdgeClosure.row 8 0 1 (by decide) (by decide)
  · apply EdgeClosure.trans (EdgeClosure.row 8 0 1 (by decide) (by decide))
    apply EdgeClosure.trans (EdgeClosure.flip 8 1)
    apply EdgeClosure.trans (EdgeClosure.row 1 8 2 (by decide) (by decide))
    apply EdgeClosure.trans (EdgeClosure.flip 1 2)
    apply EdgeClosure.trans (EdgeClosure.row 2 1 9 (by decide) (by decide))
    apply EdgeClosure.trans (EdgeClosure.flip 2 9)
    apply EdgeClosure.trans (EdgeClosure.row 9 2 7 (by decide) (by decide))
    apply EdgeClosure.trans (EdgeClosure.flip 9 7)
    apply EdgeClosure.trans (EdgeClosure.row 7 9 10 (by decide) (by decide))
    apply EdgeClosure.trans (EdgeClosure.flip 7 10)
    apply EdgeClosure.trans (EdgeClosure.row 10 7 3 (by decide) (by decide))
    apply EdgeClosure.trans (EdgeClosure.flip 10 3)
    apply EdgeClosure.trans (EdgeClosure.row 3 10 8 (by decide) (by decide))
    exact EdgeClosure.flip 3 8

/-- The repaired displayed matching object has no injective planar
realization of all of its selected-row equalities. -/
theorem no_planar_realization :
    ¬ ∃ pointOf : Label → ℝ²,
      Census554.EqualityCore.Realizes globalRow pointOf :=
  Census554.EqualityCore.not_realizes_of_duplicateCenterCore
    banked_duplicateCenterCore

#print axioms total_critical_system_checked
#print axioms retained_radius_matching_checked
#print axioms exact_two_circle_intersection_checked
#print axioms boundaryIndex_injective_checked
#print axioms all_shared_pairs_alternate_checked
#print axioms off_radius_collision_checked
#print axioms minimal_row_closure_surface_checked
#print axioms banked_duplicateCenterCore
#print axioms no_planar_realization

end ATailRetainedRadiusInjectiveFiniteBoundary
end Problem97

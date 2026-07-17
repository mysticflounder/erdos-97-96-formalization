/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite boundary for the robust common-blocker collision

This is a finite row/blocker-map abstraction, not a Euclidean counterexample.
It simultaneously realizes a deletion-robust center, a total source-indexed
critical blocker map, an exact common-blocker fiber containing two distinct
sources, the selected-row closure consequence of minimality, and the new
common-deletion output.

The same model has no second recorded center through the collision pair.  It
therefore regression-gates claims that the current finite fields alone force a
repeated pair, a genuinely new shell, or a contradiction.
-/

namespace Problem97
namespace ATailRobustCollisionFiniteBoundary

abbrev Label := Fin 12

def robustCenter : Label := 4
def collisionSource₁ : Label := 1
def collisionSource₂ : Label := 2
def commonBlocker : Label := 0

/-- A five-point class witnessing deletion robustness at `robustCenter`. -/
def robustClass : Finset Label := {0, 1, 3, 5, 6}

/-- One selected four-row at every represented center.  Rows at centers in the
blocker-map image are interpreted as exact. -/
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

/-- A total source-indexed blocker map omitting `robustCenter`. -/
def blocker : Label → Label :=
  ![1, 0, 0, 0, 0, 8, 7, 6, 5, 2, 2, 3]

def criticalSupport (source : Label) : Finset Label :=
  globalRow (blocker source)

def rowClosed (U : Finset Label) : Prop :=
  ∀ center ∈ U, globalRow center ⊆ U

instance instDecidableRowClosed (U : Finset Label) : Decidable (rowClosed U) := by
  unfold rowClosed
  infer_instance

/-- All represented centers have a selected four-row; the blocker system is
total, fixed-point-free, source-exact, and support-locked on blocker fibers. -/
theorem total_critical_system_checked :
    (∀ center : Label, (globalRow center).card = 4) ∧
    (∀ center : Label, center ∉ globalRow center) ∧
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, ((criticalSupport source).erase source).card = 3) ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ x y : Label, blocker x = blocker y →
      criticalSupport x = criticalSupport y) := by
  decide

/-- The robust center is omitted by the blocker image, and its card-five class
survives every single deletion. -/
theorem robust_center_checked :
    (∀ source : Label, blocker source ≠ robustCenter) ∧
    robustClass.card = 5 ∧
    robustCenter ∉ robustClass ∧
    (∀ deleted : Label, 4 ≤ (robustClass.erase deleted).card) := by
  decide

/-- Two distinct sources share the common blocker and its exact card-four
support, and deleting either source destroys the represented exact row. -/
theorem common_blocker_collision_checked :
    collisionSource₁ ≠ collisionSource₂ ∧
    blocker collisionSource₁ = commonBlocker ∧
    blocker collisionSource₂ = commonBlocker ∧
    criticalSupport collisionSource₁ = globalRow commonBlocker ∧
    criticalSupport collisionSource₂ = globalRow commonBlocker ∧
    collisionSource₁ ∈ globalRow commonBlocker ∧
    collisionSource₂ ∈ globalRow commonBlocker ∧
    (globalRow commonBlocker).card = 4 ∧
    ((globalRow commonBlocker).erase collisionSource₁).card = 3 ∧
    ((globalRow commonBlocker).erase collisionSource₂).card = 3 := by
  decide

/-- Deleting the common blocker preserves the exact row centered there and
the robust card-five class at the robust center.  This is the finite shadow of
the checked two-center common-deletion producer. -/
theorem blocker_center_common_deletion_checked :
    commonBlocker ≠ robustCenter ∧
    commonBlocker ∉ globalRow commonBlocker ∧
    ((globalRow commonBlocker).erase commonBlocker).card = 4 ∧
    4 ≤ (robustClass.erase commonBlocker).card := by
  decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 2000000 in
/-- Every nonempty selected-row-closed subset is the full carrier, retaining
the exact finite consequence of the production minimality closure theorem. -/
theorem minimal_row_closure_surface_checked :
    ∀ U : Finset Label, U.Nonempty → rowClosed U → U = Finset.univ := by
  decide

/-- No second represented center contains both collision sources.  Thus the
finite blocker-map, exact-row, robust-class, and minimal-row-closure surface
does not force a repeated-center realization of the pair. -/
theorem no_second_center_through_collision_pair_checked :
    ¬ ∃ center : Label, center ≠ commonBlocker ∧
      collisionSource₁ ∈ globalRow center ∧
      collisionSource₂ ∈ globalRow center := by
  decide

#print axioms total_critical_system_checked
#print axioms robust_center_checked
#print axioms common_blocker_collision_checked
#print axioms blocker_center_common_deletion_checked
#print axioms minimal_row_closure_surface_checked
#print axioms no_second_center_through_collision_pair_checked

end ATailRobustCollisionFiniteBoundary
end Problem97

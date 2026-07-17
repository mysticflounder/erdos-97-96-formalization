/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite boundary for the both-off same-cap producer

This is an exact finite incidence/cap-localization regression, not a
Euclidean counterexample.  It retains a total exact-support-locked critical
map, a two-source common-blocker fiber, both sources off the retained robust
class, and the strongest interior-cap localization relevant to the actual
collision pair.  Neither the robust center nor any actual blocker row gives
a source-faithful second center through that pair.
-/

namespace Problem97
namespace ATailCriticalFiberClosingCoreSameCapFiniteBoundary

abbrev Label := Fin 12

def robustCenter : Label := 4
def commonBlocker : Label := 0
def collisionSource₁ : Label := 1
def collisionSource₂ : Label := 2

def retainedRobustClass : Finset Label := {0, 3, 5, 6, 7}
def modeledCap : Finset Label := {0, 3, 4}
def modeledCapInterior : Finset Label := {0}

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

def blocker : Label → Label :=
  ![1, 0, 0, 0, 0, 8, 7, 6, 5, 2, 2, 3]

def criticalSupport (source : Label) : Finset Label :=
  globalRow (blocker source)

def rowClosed (U : Finset Label) : Prop :=
  ∀ center ∈ U, globalRow center ⊆ U

instance instDecidableRowClosed (U : Finset Label) : Decidable (rowClosed U) := by
  unfold rowClosed
  infer_instance

/-- A finite analogue of the production source-faithful second-center
contract.  The center is either the retained robust center itself or the
actual blocker of a source whose exact row contains both collision sources. -/
def sourceFaithfulSecondCenter (secondCenter : Label) : Prop :=
  (secondCenter = robustCenter ∧
      collisionSource₁ ∈ globalRow robustCenter ∧
      collisionSource₂ ∈ globalRow robustCenter) ∨
    ∃ J : Label,
      secondCenter = blocker J ∧
        collisionSource₁ ∈ criticalSupport J ∧
        collisionSource₂ ∈ criticalSupport J

instance instDecidableSourceFaithfulSecondCenter (secondCenter : Label) :
    Decidable (sourceFaithfulSecondCenter secondCenter) := by
  unfold sourceFaithfulSecondCenter
  infer_instance

/- The total critical-map and fixed chosen-fiber surfaces coexist. -/
set_option maxRecDepth 100000 in
set_option maxHeartbeats 2000000 in
theorem criticalFiberSurface_checked :
    (∀ center : Label, (globalRow center).card = 4) ∧
    (∀ center : Label, center ∉ globalRow center) ∧
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ source₁ source₂ : Label, blocker source₁ = blocker source₂ →
      criticalSupport source₁ = criticalSupport source₂) ∧
    collisionSource₁ ≠ collisionSource₂ ∧
    blocker collisionSource₁ = commonBlocker ∧
    blocker collisionSource₂ = commonBlocker ∧
    collisionSource₁ ∈ criticalSupport collisionSource₁ ∧
    collisionSource₂ ∈ criticalSupport collisionSource₁ ∧
    (∀ U : Finset Label, U.Nonempty → rowClosed U → U = Finset.univ) := by
  decide

/-- The exact finite content of the interior-blocker both-off localization
holds for the two actual chosen collision sources. -/
theorem bothOffInteriorCapLocalization_checked :
    retainedRobustClass.card = 5 ∧
    robustCenter ∉ retainedRobustClass ∧
    collisionSource₁ ∉ retainedRobustClass ∧
    collisionSource₂ ∉ retainedRobustClass ∧
    commonBlocker ∈ modeledCapInterior ∧
    modeledCapInterior ⊆ modeledCap ∧
    commonBlocker ∈ modeledCap ∧
    collisionSource₁ ∉ modeledCap ∧
    collisionSource₂ ∉ modeledCap ∧
    (globalRow commonBlocker ∩ modeledCap).card = 2 ∧
    2 ≤ (globalRow commonBlocker \ modeledCap).card ∧
    globalRow commonBlocker \ modeledCap =
      {collisionSource₁, collisionSource₂} := by
  decide

/-- The retained robust class remains four-large after every one-point
deletion, matching the finite deletion-robustness surface used to obtain the
critical fiber. -/
theorem robustDeletionSurface_checked :
    ∀ deleted : Label, 4 ≤ (retainedRobustClass.erase deleted).card := by
  decide

/-- Despite the fixed critical fiber and strongest relevant both-off cap
localization, there is no permitted second same-cap center. -/
theorem no_sourceFaithfulSameCapSecondCenter_checked :
    ¬ ∃ secondCenter : Label,
      secondCenter ∈ modeledCap ∧
        secondCenter ≠ commonBlocker ∧
        sourceFaithfulSecondCenter secondCenter := by
  decide

#print axioms criticalFiberSurface_checked
#print axioms bothOffInteriorCapLocalization_checked
#print axioms robustDeletionSurface_checked
#print axioms no_sourceFaithfulSameCapSecondCenter_checked

end ATailCriticalFiberClosingCoreSameCapFiniteBoundary
end Problem97

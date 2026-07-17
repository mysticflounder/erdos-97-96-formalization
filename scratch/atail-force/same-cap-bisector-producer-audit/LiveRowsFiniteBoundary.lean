/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite live-row boundary for the same-cap bisector producer

This is an exact finite incidence model, not a Euclidean counterexample.  It
retains the six named live labels, the p-centered exact dangerous row, the
extra `f2` source, the full total critical map, a robust image omission, a
same-blocker collision, and a cap projection with two outside points.  No
second represented center contains that outside pair.
-/

namespace Problem97
namespace ATailSameCapBisectorLiveRowsFiniteBoundary

abbrev Label := Fin 12

def p : Label := 0
def q : Label := 1
def t1 : Label := 2
def t2 : Label := 3
def t3 : Label := 4
def u : Label := 5

def robustCenter : Label := t3
def commonBlocker : Label := p
def collisionSource₁ : Label := q
def collisionSource₂ : Label := t1
def f2Source : Label := q

def dangerousBase : Finset Label := {q, t1, t2, t3}
def modeledCap : Finset Label := {p, t2, t3}
def robustClass : Finset Label := {0, 1, 3, 5, 6}

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

/-- The exact six-label/live-row prefix of the current Route-B wrapper is
realized by the finite model. -/
theorem live_prefix_checked :
    List.Pairwise (fun x y : Label ↦ x ≠ y) [p, q, t1, t2, t3, u] ∧
    blocker t2 = p ∧
    criticalSupport t2 = dangerousBase ∧
    f2Source ∈ criticalSupport t2 ∧
    blocker f2Source = p ∧
    criticalSupport f2Source = dangerousBase := by
  decide

/- The full critical-map, exact-support, robustness, collision, and
selected-row minimality surfaces coexist with the live prefix. -/
set_option maxRecDepth 100000 in
set_option maxHeartbeats 2000000 in
theorem global_live_surface_checked :
    (forall center : Label, (globalRow center).card = 4) ∧
    (∀ center : Label, center ∉ globalRow center) ∧
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, ((criticalSupport source).erase source).card = 3) ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ source₁ source₂ : Label, blocker source₁ = blocker source₂ →
      criticalSupport source₁ = criticalSupport source₂) ∧
    (∀ source : Label, blocker source ≠ robustCenter) ∧
    robustClass.card = 5 ∧
    robustCenter ∉ robustClass ∧
    (∀ deleted : Label, 4 ≤ (robustClass.erase deleted).card) ∧
    collisionSource₁ ≠ collisionSource₂ ∧
    blocker collisionSource₁ = commonBlocker ∧
    blocker collisionSource₂ = commonBlocker ∧
    criticalSupport collisionSource₁ = globalRow commonBlocker ∧
    criticalSupport collisionSource₂ = globalRow commonBlocker ∧
    (∀ U : Finset Label, U.Nonempty → rowClosed U → U = Finset.univ) := by
  decide

/-- The common blocker lies in the modeled cap and its exact support has
exactly the outside pair `q,t1` off that cap. -/
theorem cap_projection_checked :
    commonBlocker ∈ modeledCap ∧
    collisionSource₁ ∉ modeledCap ∧
    collisionSource₂ ∉ modeledCap ∧
    collisionSource₁ ∈ globalRow commonBlocker ∧
    collisionSource₂ ∈ globalRow commonBlocker ∧
    collisionSource₁ ≠ collisionSource₂ ∧
    (globalRow commonBlocker ∩ modeledCap).card = 2 ∧
    (globalRow commonBlocker \ modeledCap) = {collisionSource₁, collisionSource₂} := by
  decide

/-- Even with every represented critical row available, there is no second
center through the extracted outside pair. -/
theorem no_second_center_through_live_outsidePair_checked :
    ¬ ∃ center : Label, center ≠ commonBlocker ∧
      collisionSource₁ ∈ globalRow center ∧
      collisionSource₂ ∈ globalRow center := by
  decide

/-- Consequently none of the five named live critical rows, nor the extra
`f2` row, supplies the missing second center through the outside pair. -/
theorem no_live_source_supplies_second_center_checked :
    ∀ source ∈ ({q, t1, t2, t3, u, f2Source} : Finset Label),
      blocker source ≠ commonBlocker →
      ¬ (collisionSource₁ ∈ criticalSupport source ∧
        collisionSource₂ ∈ criticalSupport source) := by
  decide

/-- The same finite live surface also lacks the six-role ordinal triangle.
The robust row and collision row already share `C`; no distinct ordinary row
center `X` and point `J` complete the required `X`-row cross-incidence through
`K`. -/
theorem no_live_ordinal_triangle_checked :
    ¬ ∃ X J : Label,
      List.Pairwise (fun x y : Label ↦ x ≠ y)
        [robustCenter, commonBlocker, X, J, collisionSource₁, collisionSource₂] ∧
      J ∈ globalRow robustCenter ∧
      collisionSource₁ ∈ globalRow robustCenter ∧
      collisionSource₁ ∈ globalRow commonBlocker ∧
      collisionSource₂ ∈ globalRow commonBlocker ∧
      J ∈ globalRow X ∧
      collisionSource₂ ∈ globalRow X := by
  decide

#print axioms live_prefix_checked
#print axioms global_live_surface_checked
#print axioms cap_projection_checked
#print axioms no_second_center_through_live_outsidePair_checked
#print axioms no_live_source_supplies_second_center_checked
#print axioms no_live_ordinal_triangle_checked

end ATailSameCapBisectorLiveRowsFiniteBoundary
end Problem97

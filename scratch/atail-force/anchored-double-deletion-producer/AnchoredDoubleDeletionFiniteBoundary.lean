/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite source-indexed boundary for the anchored double-deletion target

This is a finite incidence/radius-class abstraction, not a Euclidean
counterexample.  It retains a card-five first-apex class, the frontier pair,
second-apex double-deletion survival, one selected four-row at every carrier
center, a total source-to-blocker critical-row map, exact source deletion at
the recorded blocker row, the two-circle overlap bound, and the full
selected-witness closure consequence of minimality.

The known `q`-blocker contains the frontier pair, but no genuinely third
actual blocker does.  Thus the pure source-indexed incidence and minimality
surface does not produce the requested third blocker.  A positive theorem
must use the omitted simultaneous Euclidean/MEC/cap-order realization or an
equally strong global geometric field.
-/

namespace Problem97
namespace ATailAnchoredDoubleDeletionFiniteBoundary

abbrev Label := Fin 12

def surplusApex : Label := 1
def firstApex : Label := 4
def secondApex : Label := 2
def frontierQ : Label := 0
def frontierW : Label := 6
def knownQBlocker : Label := 1

def surplusCap : Finset Label := {2, 4, 7, 8, 9}
def oppositeCap1 : Finset Label := {0, 1, 2, 6, 10}
def oppositeCap2 : Finset Label := {1, 3, 4, 5, 11}

/-- Ambient exact radius class at the first apex. -/
def firstApexClass : Finset Label := {0, 1, 3, 5, 6}

/-- One selected global four-row at every represented carrier center.  The
row at the first apex is a selected four-subset of `firstApexClass`; rows at
actual blocker-image centers are interpreted as exact. -/
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

/-- A total source-indexed choice of an actual blocker center. -/
def blocker : Label → Label :=
  ![1, 0, 0, 0, 0, 8, 7, 6, 5, 2, 2, 3]

def criticalSupport (source : Label) : Finset Label :=
  globalRow (blocker source)

/-- Finite analogue of deletion failure at the actual blocker: the unique
recorded exact support contains the deleted point. -/
def deletionBlockedAtActual (deleted source : Label) : Prop :=
  deleted ∈ criticalSupport source

instance instDecidableDeletionBlockedAtActual (deleted source : Label) :
    Decidable (deletionBlockedAtActual deleted source) := by
  unfold deletionBlockedAtActual
  infer_instance

def rowClosed (U : Finset Label) : Prop :=
  ∀ center ∈ U, globalRow center ⊆ U

instance instDecidableRowClosed (U : Finset Label) : Decidable (rowClosed U) := by
  unfold rowClosed
  infer_instance

/-- The three cap chains form a `(5,5,5)` card-twelve frame, and the frontier
pair lies strictly off the surplus cap in the same opposite cap. -/
theorem cap_frame_and_frontier_pair_checked :
    surplusCap.card = 5 ∧
    oppositeCap1.card = 5 ∧
    oppositeCap2.card = 5 ∧
    surplusCap ∪ oppositeCap1 ∪ oppositeCap2 = Finset.univ ∧
    surplusCap ∩ oppositeCap1 = {secondApex} ∧
    surplusCap ∩ oppositeCap2 = {firstApex} ∧
    oppositeCap1 ∩ oppositeCap2 = {surplusApex} ∧
    frontierQ ∈ oppositeCap1 \ (surplusCap ∪ oppositeCap2) ∧
    frontierW ∈ oppositeCap1 \ (surplusCap ∪ oppositeCap2) := by
  decide

/-- The first-apex class is genuinely card five, contains the frontier pair,
and is the ambient class from which the first-apex selected row is drawn. -/
theorem cardFive_firstApex_class_checked :
    firstApexClass.card = 5 ∧
    frontierQ ∈ firstApexClass ∧
    frontierW ∈ firstApexClass ∧
    firstApex ∉ firstApexClass ∧
    globalRow firstApex ⊆ firstApexClass ∧
    ((firstApexClass.erase frontierQ).erase frontierW).card = 3 := by
  decide

/-- One four-row exists at every center, omits its center, and distinct-center
rows have intersection cardinality at most two. -/
theorem all_center_rows_and_two_circle_bound_checked :
    (∀ center : Label, (globalRow center).card = 4) ∧
    (∀ center : Label, center ∉ globalRow center) ∧
    (∀ x y : Label, x ≠ y →
      ((globalRow x) ∩ (globalRow y)).card ≤ 2) := by
  decide

/-- The total blocker system retains source membership, exact loss of the
recorded four-row after source deletion, no fixed blockers, and support
locking whenever two sources choose the same blocker. -/
theorem total_source_indexed_critical_system_checked :
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, ((criticalSupport source).erase source).card = 3) ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ x y : Label, blocker x = blocker y →
      criticalSupport x = criticalSupport y) := by
  decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 2000000 in
/-- Every nonempty selected-row-closed subset is the full carrier.  This is
the exact finite consequence of the production minimality closure theorem. -/
theorem minimal_row_closure_surface_checked :
    ∀ U : Finset Label, U.Nonempty → rowClosed U → U = Finset.univ := by
  decide

/-- The pair survives simultaneous deletion at the second apex, while its
first-apex card-five class drops below four after both deletions. -/
theorem frontier_deletion_splits_checked :
    frontierQ ≠ frontierW ∧
    ((globalRow secondApex).erase frontierQ |>.erase frontierW).card = 4 ∧
    ((firstApexClass.erase frontierQ).erase frontierW).card = 3 ∧
    blocker frontierQ ≠ secondApex ∧
    blocker frontierW ≠ secondApex := by
  decide

/-- The directed cross hit occurs at the actual blocker selected for the
first frontier source, and the first apex is the only other recorded center
through the pair. -/
theorem two_known_pair_centers_checked :
    blocker frontierQ = knownQBlocker ∧
    knownQBlocker ≠ firstApex ∧
    frontierQ ∈ criticalSupport frontierQ ∧
    frontierW ∈ criticalSupport frontierQ ∧
    frontierQ ∈ globalRow firstApex ∧
    frontierW ∈ globalRow firstApex ∧
    ¬ ∃ center : Label,
      center ≠ firstApex ∧ center ≠ knownQBlocker ∧
      frontierQ ∈ globalRow center ∧ frontierW ∈ globalRow center := by
  decide

/-- The checked Lean normal form is realized exactly in this abstraction:
both prescribed deletions fail at a source's actual blocker iff that blocker
is the known `q`-blocker. -/
theorem both_deletions_blocked_iff_known_qBlocker_checked
    (source : Label) :
    (deletionBlockedAtActual frontierQ source ∧
        deletionBlockedAtActual frontierW source) ↔
      blocker source = knownQBlocker := by
  fin_cases source <;> decide

/-- Hence the desired genuinely third blocker is absent even though all of
the source-indexed finite and minimality fields above hold. -/
theorem anchored_third_blocker_target_avoided_checked :
    ¬ ∃ source : Label,
      blocker source ≠ firstApex ∧
      blocker source ≠ knownQBlocker ∧
      deletionBlockedAtActual frontierQ source ∧
      deletionBlockedAtActual frontierW source := by
  decide

#print axioms cap_frame_and_frontier_pair_checked
#print axioms cardFive_firstApex_class_checked
#print axioms all_center_rows_and_two_circle_bound_checked
#print axioms total_source_indexed_critical_system_checked
#print axioms minimal_row_closure_surface_checked
#print axioms frontier_deletion_splits_checked
#print axioms two_known_pair_centers_checked
#print axioms both_deletions_blocked_iff_known_qBlocker_checked
#print axioms anchored_third_blocker_target_avoided_checked

end ATailAnchoredDoubleDeletionFiniteBoundary
end Problem97

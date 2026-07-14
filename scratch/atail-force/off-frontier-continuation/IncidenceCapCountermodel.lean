/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite cap/incidence shadow for the off-frontier producer

This is not a Euclidean counterexample.  It is a kernel-checked dependency
model retaining the finite consequences most often proposed as a producer:
cardinality 12, a `(5,5,5)` cap profile with the correct three-vertex overlap,
a non-Moser label in the chosen surplus cap, one four-point selected row at
every center, two-circle overlap bounds, and one common critical blocker map.

The live dangerous row and the selected-source blocker row coexist, but their
intersection has cardinality one and their centers lie in different strict
cap cells.  Therefore these finite/cardinality/incidence fields do not force
the two-hit nonalternating continuation.
-/

namespace Problem97
namespace ATailOffFrontierContinuationCountermodel

abbrev Label := Fin 12

def p : Label := 0
def a : Label := 1
def c : Label := 2
def q : Label := 3
def e : Label := 4
def u : Label := 5

def triangleVerts : Finset Label := {p, a, c}
def dangerousBase : Finset Label := {q, c, a, e}

def cap0 : Finset Label := {a, c, 3, 4, 5}
def cap1 : Finset Label := {p, c, 6, 7, 8}
def cap2 : Finset Label := {p, a, 9, 10, 11}

def cap : Fin 3 → Finset Label := ![cap0, cap1, cap2]

/-- One global selected four-row at every abstract carrier center. -/
def globalRow : Label → Finset Label :=
  ![({1, 2, 3, 4} : Finset Label),
    {0, 2, 6, 7},
    {3, 8, 9, 10},
    {1, 5, 6, 8},
    {0, 5, 9, 11},
    {0, 1, 2, 8},
    {0, 1, 3, 5},
    {0, 1, 4, 6},
    {0, 1, 7, 9},
    {0, 1, 10, 11},
    {0, 2, 3, 9},
    {0, 2, 4, 5}]

/-- Common critical blocker assignment. -/
def blocker : Label → Label :=
  ![a, p, p, p, p, q, a, a, c, c, c, e]

def criticalSupportAtCenter (center : Label) : Finset Label :=
  if center = p then globalRow p
  else if center = a then globalRow a
  else if center = c then globalRow c
  else if center = q then globalRow q
  else globalRow e

def criticalSupport (source : Label) : Finset Label :=
  criticalSupportAtCenter (blocker source)

/-- The abstract cap profile has the exact `(5,5,5)` cardinalities, covers all
12 points, and has the standard pairwise vertex overlaps. -/
theorem cap_profile_checked :
    (∀ k : Fin 3, (cap k).card = 5) ∧
    cap0 ∪ cap1 ∪ cap2 = Finset.univ ∧
    cap0 ∩ cap1 = {c} ∧
    cap0 ∩ cap2 = {a} ∧
    cap1 ∩ cap2 = {p} ∧
    q ∈ cap0 ∧ q ∉ triangleVerts := by
  decide

/-- The global all-center row shadow has four points per row, omits its own
center, and respects the Euclidean two-circle intersection upper bound. -/
theorem global_rows_checked :
    (∀ center : Label, (globalRow center).card = 4) ∧
    (∀ center : Label, center ∉ globalRow center) ∧
    (∀ x y : Label, x ≠ y →
      ((globalRow x) ∩ (globalRow y)).card ≤ 2) := by
  decide

/-- The common blocker shadow retains source membership, blocker separation,
same-center support rigidity, and the distinct-center intersection bound. -/
theorem common_critical_system_checked :
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ x y : Label, blocker x = blocker y →
      criticalSupport x = criticalSupport y) ∧
    (∀ x y : Label, blocker x ≠ blocker y →
      ((criticalSupport x) ∩ (criticalSupport y)).card ≤ 2) := by
  decide

/-- The dangerous row is globally selected at `p`, the selected source is
outside it, and the selected-source blocker row has exactly one dangerous hit.
The two centers also have no common indexed cap in this shadow. -/
theorem off_frontier_producer_fails_in_shadow :
    globalRow p = dangerousBase ∧
    u ∉ dangerousBase ∧
    blocker u = q ∧
    criticalSupport u = globalRow q ∧
    (criticalSupport u ∩ dangerousBase).card = 1 ∧
    ¬ 2 ≤ (criticalSupport u ∩ dangerousBase).card ∧
    ¬ ∃ k : Fin 3, p ∈ cap k ∧ blocker u ∈ cap k := by
  decide

/-- Choosing a different critical source does not repair the incidence
failure: every blocker center distinct from `p` has at most one dangerous
hit in this shadow. -/
theorem no_off_frontier_source_has_two_dangerous_hits :
    ¬ ∃ source : Label,
      blocker source ≠ p ∧
      2 ≤ (criticalSupport source ∩ dangerousBase).card := by
  decide

#print axioms cap_profile_checked
#print axioms global_rows_checked
#print axioms common_critical_system_checked
#print axioms off_frontier_producer_fails_in_shadow
#print axioms no_off_frontier_source_has_two_dangerous_hits

end ATailOffFrontierContinuationCountermodel
end Problem97

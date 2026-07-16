/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Corrected finite structural witness for the robust all-center surface

This kernel-facing model includes the ambient five-point first-apex class in
all cyclic common-pair and pair-center checks.  It distinguishes selected K4
rows from rows locked exact by the actual blocker-map image.  It is not a
Euclidean counterexample and is not producer-bank clean: the accompanying
Python audit finds already-formalized equality/order cores in this witness.
-/

namespace Problem97
namespace ATailRobustAllCenterCorrectedStructuralWitness

abbrev Label := Fin 14

def O : Label := 0
def t1 : Label := 1
def I : Label := 2
def F : Label := 3
def A : Label := 4
def X : Label := 5
def Y : Label := 6
def Z : Label := 7
def D : Label := 8
def J : Label := 9
def E : Label := 10
def C : Label := 11
def G : Label := 12
def K : Label := 13

def q : Label := E
def w : Label := D

def surplusCap : Finset Label := {O, t1, I, F, A}
def strictSurplus : Finset Label := {t1, I, F}
def oppCap1 : Finset Label := {A, X, Y, Z, D, J, E, C}
def oppCap2 : Finset Label := {C, G, K, O}
def firstApexClass : Finset Label := {A, C, D, E, J}
def marginal : Finset Label := firstApexClass \ surplusCap

/-- One selected equal-distance four-class at every carrier center. -/
def globalRow : Label → Finset Label :=
  ![({A, C, D, E} : Finset Label),
    {D, X, Y, Z},
    {E, F, O, Z},
    {A, G, I, X},
    {C, G, K, O},
    {A, J, K, Y},
    {C, F, X, Z},
    {D, F, O, Y},
    {A, E, F, I},
    {A, G, Y, t1},
    {D, F, K, t1},
    {I, O, X, t1},
    {C, I, K, Y},
    {G, J, O, Z}]

/-- The decoded total critical-shell blocker map. -/
def blocker : Label → Label :=
  ![A, C, C, Y, X, C, X, Y, t1, X, D, A, A, A]

def exactGlobalCenters : Finset Label := {A, C, D, X, Y, t1}

/-- The actual radius row at O is the ambient five-class, not its selected
four-subset. -/
def actualRow (center : Label) : Finset Label :=
  if center = O then firstApexClass else globalRow center

def cyclicBetween (left right point : Label) : Bool :=
  let n := 14
  let dp := (point.val + n - left.val) % n
  let dr := (right.val + n - left.val) % n
  decide (0 < dp ∧ dp < dr)

theorem capProfile_checked :
    surplusCap.card = 5 ∧
      oppCap1.card = 8 ∧
      oppCap2.card = 4 ∧
      surplusCap ∪ oppCap1 ∪ oppCap2 = Finset.univ ∧
      firstApexClass.card = 5 ∧
      marginal = {C, D, E, J} ∧
      q = E ∧ w = D ∧ J ≠ w := by
  decide

theorem selectedRows_checked :
    (∀ center : Label, (globalRow center).card = 4) ∧
      (∀ center : Label, center ∉ globalRow center) ∧
      (∀ left right : Label, left ≠ right →
        ((globalRow left) ∩ (globalRow right)).card ≤ 2) := by
  decide

/-- The omitted old check: the full ambient O-class meets every non-O
selected row in at most two points. -/
theorem ambientFirstApex_inter_globalRow_checked :
    ∀ center : Label, center ≠ O →
      (firstApexClass ∩ globalRow center).card ≤ 2 := by
  decide

/-- Every two-point overlap between the ambient O-class and a non-O selected
row satisfies the required cyclic alternation. -/
theorem ambientFirstApex_commonPairCyclicSeparation_checked :
    ∀ center x y : Label,
      center ≠ O → x ≠ y →
      x ∈ firstApexClass → y ∈ firstApexClass →
      x ∈ globalRow center → y ∈ globalRow center →
      cyclicBetween O center x ≠ cyclicBetween O center y := by
  decide

/-- Replacing selected `globalRow O` by the ambient five-class, every carrier
pair still occurs at no more than two centers. -/
theorem ambientPairCenterBound_checked :
    ∀ x y : Label, x ≠ y →
      ((Finset.univ.filter fun center =>
        x ∈ actualRow center ∧ y ∈ actualRow center).card ≤ 2) := by
  decide

/-- Exactly the centers in the blocker-map image are radius-locked selected
rows.  In particular, the double-survivor row at A is exact here only because
A actually occurs in that image, not merely because it is selected. -/
theorem blockerImageExactness_checked :
    Finset.univ.image blocker = exactGlobalCenters ∧
      (∀ source : Label, blocker source ≠ source) ∧
      (∀ source : Label, blocker source ≠ O) ∧
      (∀ source : Label, source ∈ globalRow (blocker source)) := by
  decide

/-- This corrected witness avoids the sharpened existential producer.  The
eligible strict-surplus centers are I and F, but neither selected row contains
q together with a fresh point of the first-apex marginal.  No row-exactness
hypothesis is used in this finite statement. -/
theorem sharpenedOneRowTarget_avoided_checked :
    globalRow (blocker q) ∩ strictSurplus = {I, F} ∧
      ¬ ∃ z ∈ globalRow (blocker q) ∩ strictSurplus,
        q ∈ globalRow z ∧ 2 ≤ (globalRow z ∩ marginal).card := by
  decide

#print axioms capProfile_checked
#print axioms selectedRows_checked
#print axioms ambientFirstApex_inter_globalRow_checked
#print axioms ambientFirstApex_commonPairCyclicSeparation_checked
#print axioms ambientPairCenterBound_checked
#print axioms blockerImageExactness_checked
#print axioms sharpenedOneRowTarget_avoided_checked

end ATailRobustAllCenterCorrectedStructuralWitness
end Problem97

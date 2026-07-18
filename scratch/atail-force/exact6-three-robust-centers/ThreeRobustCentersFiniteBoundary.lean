/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BiApexBlockerMultiplicity

/-!
# Finite boundary for three deletion-robust carrier centers

This is an exact finite incidence/cap regression, not a Euclidean
`CounterexampleData` realization.  It strengthens the existing exact-six
blocker-map boundary by retaining a third omitted carrier center together
with two disjoint four-point classes at that center.  Thus it represents the
finite consequences of a nontrivial `MinimalDeletionCore` making the fresh
center fully deletion-robust.
-/

namespace Problem97
namespace ATailExactSixThreeRobustCentersFiniteBoundary

open ATailBiApexBlockerMultiplicity

abbrev Label := Fin 14

def firstApex : Label := 0
def secondApex : Label := 1
def remainingMoserVertex : Label := 2
def freshCenter : Label := 10

def surplusCap : Finset Label := {0, 1, 5, 8, 11}
def firstOppositeCap : Finset Label := {1, 2, 7, 9, 12, 13}
def physicalSecondCap : Finset Label := {0, 2, 3, 4, 6, 10}

def capByIndex : Fin 3 → Finset Label :=
  ![surplusCap, firstOppositeCap, physicalSecondCap]

def physicalInterior : Finset Label := {3, 4, 6, 10}
def physicalRadiusClass : Finset Label := {2, 3, 4, 6, 8}
def firstApexRadiusClass : Finset Label := {1, 2, 4, 5, 7}
def physicalVertices : Finset Label := physicalRadiusClass ∩ physicalInterior

def coreSources : Finset Label := {3, 4}
def freshShellOne : Finset Label := {1, 3, 11, 12}
def freshShellTwo : Finset Label := {0, 4, 5, 9}

/-- A cyclic four-uniform support design. -/
def globalRow : Label → Finset Label :=
  ![({1, 2, 5, 7} : Finset Label),
    {2, 3, 6, 8},
    {3, 4, 7, 9},
    {4, 5, 8, 10},
    {5, 6, 9, 11},
    {6, 7, 10, 12},
    {7, 8, 11, 13},
    {0, 8, 9, 12},
    {1, 9, 10, 13},
    {0, 2, 10, 11},
    {1, 3, 11, 12},
    {2, 4, 12, 13},
    {0, 3, 5, 13},
    {0, 1, 4, 6}]

/-- Total source-to-blocker map. -/
def blocker : Label → Label :=
  ![13, 13, 9, 2, 2, 3, 5, 2, 3, 2, 8, 4, 5, 6]

def criticalSupport (source : Label) : Finset Label :=
  globalRow (blocker source)

def blockerFiber (center : Label) : Finset Label :=
  Finset.univ.filter fun source ↦ blocker source = center

def rowClosed (U : Finset Label) : Prop :=
  ∀ center ∈ U, globalRow center ⊆ U

instance instDecidableRowClosed (U : Finset Label) : Decidable (rowClosed U) := by
  unfold rowClosed
  infer_instance

/-- The finite antecedent of the existing same-cap outside-pair terminal. -/
def HasRepeatedOutsidePair : Prop :=
  ∃ source target : Label,
    blocker source ≠ blocker target ∧
      ∃ capIndex : Fin 3,
        blocker source ∈ capByIndex capIndex ∧
        blocker target ∈ capByIndex capIndex ∧
        ∃ a b : Label,
          a ≠ b ∧
          a ∉ capByIndex capIndex ∧
          b ∉ capByIndex capIndex ∧
          a ∈ criticalSupport source ∧
          b ∈ criticalSupport source ∧
          a ∈ criticalSupport target ∧
          b ∈ criticalSupport target

/-- A second actual critical center through both nontrivial-core sources. -/
def HasTwoCriticalCentersThroughCorePair : Prop :=
  ∃ first second : Label,
    first ≠ second ∧
    (3 : Label) ∈ globalRow first ∧
    (4 : Label) ∈ globalRow first ∧
    (3 : Label) ∈ globalRow second ∧
    (4 : Label) ∈ globalRow second

instance instDecidableHasRepeatedOutsidePair : Decidable HasRepeatedOutsidePair := by
  unfold HasRepeatedOutsidePair
  infer_instance

instance instDecidableHasTwoCriticalCentersThroughCorePair :
    Decidable HasTwoCriticalCentersThroughCorePair := by
  unfold HasTwoCriticalCentersThroughCorePair
  infer_instance

set_option maxRecDepth 100000
set_option maxHeartbeats 4000000

/-- The three centers are distinct carrier labels and all are omitted from
the total critical blocker map. -/
theorem three_distinct_omitted_centers_checked :
    firstApex ≠ secondApex ∧
    firstApex ≠ freshCenter ∧
    secondApex ≠ freshCenter ∧
    (∀ source : Label, blocker source ≠ firstApex) ∧
    (∀ source : Label, blocker source ≠ secondApex) ∧
    (∀ source : Label, blocker source ≠ freshCenter) := by
  decide +revert

/-- The complete source-indexed critical-map projection remains exact and
source faithful. -/
theorem total_sourceFaithful_criticalSystem_checked :
    (∀ center : Label, (globalRow center).card = 4) ∧
    (∀ center : Label, center ∉ globalRow center) ∧
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ source target : Label, blocker source = blocker target →
      criticalSupport source = criticalSupport target) := by
  decide +revert

/-- The physical parent retains the exact `(5,6,6)` cap surface and the
third center lies in the four-point strict physical interior. -/
theorem exactSix_parent_and_fresh_location_checked :
    surplusCap.card = 5 ∧
    firstOppositeCap.card = 6 ∧
    physicalSecondCap.card = 6 ∧
    surplusCap ∪ firstOppositeCap ∪ physicalSecondCap = Finset.univ ∧
    surplusCap ∩ firstOppositeCap = {secondApex} ∧
    firstOppositeCap ∩ physicalSecondCap = {remainingMoserVertex} ∧
    physicalSecondCap ∩ surplusCap = {firstApex} ∧
    physicalInterior = physicalSecondCap \ {firstApex, remainingMoserVertex} ∧
    freshCenter ∈ physicalInterior ∧
    freshCenter ∉ physicalRadiusClass := by
  decide

/-- Both physical apices have five-point classes, while the two disjoint
fresh-center four-point classes give the finite deletion-survival content of
the third robust center. -/
theorem three_center_deletionRobustSurface_checked :
    firstApexRadiusClass.card = 5 ∧
    physicalRadiusClass.card = 5 ∧
    (∀ q : Label, 4 ≤ (firstApexRadiusClass.erase q).card) ∧
    (∀ q : Label, 4 ≤ (physicalRadiusClass.erase q).card) ∧
    freshShellOne.card = 4 ∧
    freshShellTwo.card = 4 ∧
    Disjoint freshShellOne freshShellTwo ∧
    freshCenter ∉ freshShellOne ∧
    freshCenter ∉ freshShellTwo ∧
    (∀ q : Label,
      4 ≤ (freshShellOne.erase q).card ∨
      4 ≤ (freshShellTwo.erase q).card) := by
  decide +revert

/-- The two fresh-center classes contain the two core sources, are disjoint,
and obey the two-circle intersection bound against every critical row and
both physical five-point classes. -/
theorem nontrivialCore_shellSurface_checked :
    coreSources.card = 2 ∧
    coreSources ⊆ physicalVertices ∧
    (3 : Label) ∈ freshShellOne ∧
    (4 : Label) ∈ freshShellTwo ∧
    (4 : Label) ∉ freshShellOne ∧
    (3 : Label) ∉ freshShellTwo ∧
    Disjoint freshShellOne freshShellTwo ∧
    (freshShellOne ∩ physicalRadiusClass).card ≤ 2 ∧
    (freshShellTwo ∩ physicalRadiusClass).card ≤ 2 ∧
    (freshShellOne ∩ firstApexRadiusClass).card ≤ 2 ∧
    (freshShellTwo ∩ firstApexRadiusClass).card ≤ 2 ∧
    (∀ center : Label, center ≠ freshCenter →
      (freshShellOne ∩ globalRow center).card ≤ 2) ∧
    (∀ center : Label, center ≠ freshCenter →
      (freshShellTwo ∩ globalRow center).card ≤ 2) := by
  decide +revert

/-- Every displayed critical row respects the cap two-hit bound. -/
theorem orderedCap_twoHitSurface_checked :
    ∀ capIndex : Fin 3, ∀ center ∈ capByIndex capIndex,
      (globalRow center ∩ capByIndex capIndex).card ≤ 2 := by
  decide +revert

/-- Distinct critical rows intersect in at most one point. -/
theorem distinctCenter_rowIntersection_card_le_one_checked :
    ∀ first second : Label, first ≠ second →
      (globalRow first ∩ globalRow second).card ≤ 1 := by
  decide +revert

def closureCycleNext : Label → Label :=
  ![1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 0]

def closureStepsToZero : Label → Nat :=
  ![0, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]

def closureStepsFromZero : Label → Nat :=
  ![0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

theorem closureCycleNext_mem_globalRow_checked (x : Label) :
    closureCycleNext x ∈ globalRow x := by
  decide +revert

theorem closureCycle_toZero_checked (x : Label) :
    (closureCycleNext^[closureStepsToZero x]) x = 0 := by
  decide +revert

theorem closureCycle_fromZero_checked (x : Label) :
    (closureCycleNext^[closureStepsFromZero x]) 0 = x := by
  decide +revert

private theorem closureCycle_iterate_mem
    {U : Finset Label} (hclosed : rowClosed U)
    {x : Label} (hx : x ∈ U) (n : Nat) :
    (closureCycleNext^[n]) x ∈ U := by
  induction n with
  | zero => simpa
  | succ n ih =>
      have hnext := hclosed ((closureCycleNext^[n]) x) ih
        (closureCycleNext_mem_globalRow_checked _)
      simpa only [Function.iterate_succ_apply'] using hnext

/-- Every nonempty selected-row-closed subset is the whole carrier. -/
theorem minimal_rowClosureSurface_checked :
    ∀ U : Finset Label, U.Nonempty → rowClosed U → U = Finset.univ := by
  intro U hnonempty hclosed
  rcases hnonempty with ⟨x, hx⟩
  have hzeroIter := closureCycle_iterate_mem hclosed hx
    (closureStepsToZero x)
  have hzero : (0 : Label) ∈ U := by
    simpa only [closureCycle_toZero_checked x] using hzeroIter
  ext z
  simp only [Finset.mem_univ, iff_true]
  have hzIter := closureCycle_iterate_mem hclosed hzero
    (closureStepsFromZero z)
  simpa only [closureCycle_fromZero_checked z] using hzIter

/-- Three omitted values force substantial blocker multiplicity in this
boundary: one four-source fiber and three further two-source fibers occur. -/
theorem maximal_blockerMultiplicitySurface_checked :
    (blockerFiber 2).card = 4 ∧
    (blockerFiber 3).card = 2 ∧
    (blockerFiber 5).card = 2 ∧
    (blockerFiber 13).card = 2 := by
  decide

/-- Even this strengthened three-center surface never supplies the repeated
outside pair consumed by the existing same-cap terminal theorem. -/
theorem no_repeatedOutsidePair_checked :
    ¬ HasRepeatedOutsidePair := by
  decide

/-- The extra robust center does not manufacture a second actual critical
center through the two unequal-radius core sources. -/
theorem no_twoCriticalCentersThroughCorePair_checked :
    ¬ HasTwoCriticalCentersThroughCorePair := by
  decide

#print axioms three_distinct_omitted_centers_checked
#print axioms total_sourceFaithful_criticalSystem_checked
#print axioms exactSix_parent_and_fresh_location_checked
#print axioms three_center_deletionRobustSurface_checked
#print axioms nontrivialCore_shellSurface_checked
#print axioms orderedCap_twoHitSurface_checked
#print axioms distinctCenter_rowIntersection_card_le_one_checked
#print axioms minimal_rowClosureSurface_checked
#print axioms maximal_blockerMultiplicitySurface_checked
#print axioms no_repeatedOutsidePair_checked
#print axioms no_twoCriticalCentersThroughCorePair_checked

end ATailExactSixThreeRobustCentersFiniteBoundary
end Problem97

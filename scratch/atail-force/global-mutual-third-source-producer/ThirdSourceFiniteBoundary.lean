/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite boundary for the global-mutual third-source producer

This is an exact finite incidence/cap regression, not a Euclidean
`CounterexampleData` realization.  It retains the source identities of the
full-parent exact-five mutual equal-blocker arm, the two large opposite caps,
bi-apex deletion robustness, exact support locking, and the selected-row
closure consequence of global minimality.  Nevertheless no genuinely third
actual blocker row contains both equal-blocker sources.
-/

namespace Problem97
namespace ATailGlobalMutualThirdSourceFiniteBoundary

abbrev Label := Fin 14

def firstApex : Label := 0
def secondApex : Label := 1
def remainingMoserVertex : Label := 2

def deleted : Label := 3
def unusedSource : Label := 4
def continuationFirst : Label := 3
def continuationSecond : Label := 11
def partner : Label := 12
def commonBlocker : Label := 6

def surplusCap : Finset Label := {0, 1, 6, 7, 13}
def firstOppositeCap : Finset Label := {1, 2, 5, 8, 9, 10}
def physicalSecondCap : Finset Label := {0, 2, 3, 4, 11, 12}

def capByIndex : Fin 3 → Finset Label :=
  ![surplusCap, firstOppositeCap, physicalSecondCap]

def physicalInterior : Finset Label := {3, 4, 11, 12}
def physicalRadiusClass : Finset Label := {3, 5, 6, 11, 12}
def physicalVertices : Finset Label :=
  physicalRadiusClass ∩ physicalInterior

def firstApexRadiusClass : Finset Label := {3, 4, 5, 6, 8}

/-- The two physical apices are omitted values.  The equal-blocker fiber is
the pair `unusedSource, partner`, both mapping to `commonBlocker`. -/
def blocker : Label → Label :=
  ![2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 6, 3]

/-- One exact four-point row at every represented carrier center. -/
def globalRow : Label → Finset Label :=
  ![({4, 5, 6, 8} : Finset Label),
    {5, 6, 11, 12},
    {0, 3, 6, 8},
    {1, 13, 4, 6},
    {2, 3, 5, 7},
    {3, 4, 8, 11},
    {4, 8, 9, 12},
    {5, 3, 8, 11},
    {6, 4, 9, 10},
    {7, 4, 10, 13},
    {8, 4, 11, 13},
    {9, 3, 8, 12},
    {10, 3, 8, 13},
    {11, 3, 8, 10}]

def criticalSupport (source : Label) : Finset Label :=
  globalRow (blocker source)

def rowClosed (U : Finset Label) : Prop :=
  ∀ center ∈ U, globalRow center ⊆ U

instance instDecidableRowClosed (U : Finset Label) : Decidable (rowClosed U) := by
  unfold rowClosed
  infer_instance

set_option maxRecDepth 100000
set_option maxHeartbeats 2000000

/-- The complete source-indexed critical-map projection is exact and locked
on equal blocker fibers. -/
theorem total_sourceFaithful_criticalSystem_checked :
    (∀ center : Label, (globalRow center).card = 4) ∧
    (∀ center : Label, center ∉ globalRow center) ∧
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ source target : Label, blocker source = blocker target →
      criticalSupport source = criticalSupport target) ∧
    (∀ source : Label, blocker source ≠ firstApex) ∧
    (∀ source : Label, blocker source ≠ secondApex) := by
  decide

/-- A Hamiltonian selected-row cycle used to check the finite minimality
projection without enumerating every carrier subset. -/
def closureCycleNext : Label → Label :=
  ![5, 6, 0, 1, 2, 3, 8, 11, 9, 7, 4, 12, 13, 10]

def closureStepsToZero : Label → Nat :=
  ![0, 11, 1, 12, 2, 13, 10, 7, 9, 8, 3, 6, 5, 4]

def closureStepsFromZero : Label → Nat :=
  ![0, 3, 13, 2, 12, 1, 4, 7, 5, 6, 11, 8, 9, 10]

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

/-- Every nonempty set closed under all selected rows is the whole carrier,
the exact selected-witness consequence of global minimality. -/
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

/-- The displayed cap partition has the exact large-opposite-cap cardinality
surface retained by the full parent. -/
theorem largeCap_parentSurface_checked :
    surplusCap.card = 5 ∧
    firstOppositeCap.card = 6 ∧
    physicalSecondCap.card = 6 ∧
    surplusCap ∪ firstOppositeCap ∪ physicalSecondCap = Finset.univ ∧
    surplusCap ∩ firstOppositeCap = {secondApex} ∧
    firstOppositeCap ∩ physicalSecondCap = {remainingMoserVertex} ∧
    physicalSecondCap ∩ surplusCap = {firstApex} ∧
    firstApex ∈ physicalSecondCap ∧
    secondApex ∉ physicalSecondCap := by
  decide

/-- Both physical apices have five-point classes, hence the represented K4
class survives every one-point deletion.  The rows at the two apices are the
exact four-point remnants after deleting `deleted`. -/
theorem biApex_deletionRobustSurface_checked :
    firstApexRadiusClass.card = 5 ∧
    physicalRadiusClass.card = 5 ∧
    (∀ q : Label, 4 ≤ (firstApexRadiusClass.erase q).card) ∧
    (∀ q : Label, 4 ≤ (physicalRadiusClass.erase q).card) ∧
    globalRow firstApex = firstApexRadiusClass.erase deleted ∧
    globalRow secondApex = physicalRadiusClass.erase deleted ∧
    deleted ∉ globalRow firstApex ∧
    deleted ∉ globalRow secondApex := by
  decide

/-- This is the exact source-name projection of the mutual equal-blocker
continuation.  The unused source is in the physical cap but off its exact-five
class; the partner and the two named continuation points are physical
vertices.  The mutual deletion is absent from both equal-blocker rows. -/
theorem exactFive_mutualEqualBlockerSurface_checked :
    physicalInterior ⊆ physicalSecondCap ∧
    physicalVertices = {deleted, continuationSecond, partner} ∧
    unusedSource ∈ physicalInterior ∧
    unusedSource ∉ physicalRadiusClass ∧
    deleted ∈ physicalVertices ∧
    continuationFirst ∈ physicalVertices ∧
    continuationSecond ∈ physicalVertices ∧
    partner ∈ physicalVertices ∧
    partner ≠ continuationFirst ∧
    partner ≠ continuationSecond ∧
    blocker unusedSource = commonBlocker ∧
    blocker partner = commonBlocker ∧
    unusedSource ≠ partner ∧
    unusedSource ∈ criticalSupport unusedSource ∧
    partner ∈ criticalSupport unusedSource ∧
    criticalSupport unusedSource = criticalSupport partner ∧
    deleted ∉ criticalSupport unusedSource ∧
    deleted ∉ criticalSupport partner ∧
    partner ∉ criticalSupport deleted ∧
    criticalSupport unusedSource ∩ physicalVertices = {partner} := by
  decide

/-- The common blocker is in a nonphysical cap and both fiber sources are
outside that cap, matching the favorable placement needed by the same-cap
consumer except for the missing second actual center. -/
theorem favorable_commonCapPlacement_checked :
    commonBlocker ∈ surplusCap ∧
    unusedSource ∉ surplusCap ∧
    partner ∉ surplusCap ∧
    commonBlocker ≠ firstApex ∧
    commonBlocker ≠ secondApex := by
  decide

/-- The finite proxy for physical-cap endpoint distance order is injective on
the whole physical cap and separates the two equal-blocker sources. -/
def firstApexDistanceRank (x : Label) : Nat := x.val

theorem physicalCap_firstApexDistanceRank_injective_checked :
    (∀ x ∈ physicalSecondCap, ∀ y ∈ physicalSecondCap,
      firstApexDistanceRank x = firstApexDistanceRank y → x = y) ∧
    firstApexDistanceRank unusedSource ≠ firstApexDistanceRank partner := by
  decide

/-- No actual critical row with a genuinely different blocker contains both
equal-blocker sources.  Thus support locking, cap counts, deletion robustness,
and selected-row minimality do not produce the requested third row. -/
theorem no_distinctBlocker_row_contains_equalBlockerPair_checked :
    ¬ ∃ J : Label,
      blocker J ≠ commonBlocker ∧
      unusedSource ∈ criticalSupport J ∧
      partner ∈ criticalSupport J := by
  decide

/-- In particular, there is no genuinely third source satisfying the full
same-cap terminal completion. -/
theorem no_sameCapThirdSource_checked :
    ¬ ∃ J : Label,
      J ≠ unusedSource ∧
      J ≠ partner ∧
      unusedSource ∈ criticalSupport J ∧
      partner ∈ criticalSupport J ∧
      blocker J ≠ commonBlocker ∧
      ∃ capIndex : Fin 3,
        commonBlocker ∈ capByIndex capIndex ∧
        blocker J ∈ capByIndex capIndex ∧
        unusedSource ∉ capByIndex capIndex ∧
        partner ∉ capByIndex capIndex := by
  decide

#print axioms total_sourceFaithful_criticalSystem_checked
#print axioms minimal_rowClosureSurface_checked
#print axioms largeCap_parentSurface_checked
#print axioms biApex_deletionRobustSurface_checked
#print axioms exactFive_mutualEqualBlockerSurface_checked
#print axioms favorable_commonCapPlacement_checked
#print axioms physicalCap_firstApexDistanceRank_injective_checked
#print axioms no_distinctBlocker_row_contains_equalBlockerPair_checked
#print axioms no_sameCapThirdSource_checked

end ATailGlobalMutualThirdSourceFiniteBoundary
end Problem97

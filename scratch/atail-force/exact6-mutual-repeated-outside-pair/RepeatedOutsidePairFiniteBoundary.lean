/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BiApexBlockerMultiplicity
import Erdos9796Proof.P97.SurplusCOMPGBankSep

/-!
# Exact finite boundary for the repeated-outside-pair route

This is an exact finite incidence/cap regression, not a Euclidean
`CounterexampleData` realization.  It retains a total source-indexed critical
map, one selected four-point row at every center, two omitted blocker values,
the production blocker-multiplicity conclusion, exact cap six, two robust
five-point apex classes, mutual omission, and the selected-row closure
consequence of minimality.  Nevertheless no two distinct same-cap blockers
have two common row points outside that cap.
-/

namespace Problem97
namespace ATailExactSixMutualRepeatedOutsidePairFiniteBoundary

open ATailBiApexBlockerMultiplicity

abbrev Label := Fin 14

def firstApex : Label := 0
def secondApex : Label := 1
def remainingMoserVertex : Label := 2

def surplusCap : Finset Label := {0, 1, 5, 8, 11}
def firstOppositeCap : Finset Label := {1, 2, 7, 9, 12, 13}
def physicalSecondCap : Finset Label := {0, 2, 3, 4, 6, 10}

def capByIndex : Fin 3 → Finset Label :=
  ![surplusCap, firstOppositeCap, physicalSecondCap]

def physicalInterior : Finset Label := {3, 4, 6, 10}
def physicalRadiusClass : Finset Label := {2, 3, 4, 6, 8}
def physicalVertices : Finset Label :=
  physicalRadiusClass ∩ physicalInterior

def firstApexRadiusClass : Finset Label := {1, 2, 4, 5, 7}

def deleted : Label := 4
def unusedSource : Label := 10
def continuationFirst : Label := 4
def continuationSecond : Label := 3
def partner : Label := 6

/-- A cyclic linear four-uniform support design.  The shift set
`{1,2,5,7}` is Sidon modulo fourteen, so distinct rows meet in at most one
point. -/
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

/-- Total source-to-blocker map.  Both apex values are omitted and several
distinct repeated fibers remain. -/
def blocker : Label → Label :=
  ![13, 13, 9, 2, 2, 3, 5, 2, 3, 2, 8, 4, 5, 6]

def criticalSupport (source : Label) : Finset Label :=
  globalRow (blocker source)

def rowClosed (U : Finset Label) : Prop :=
  ∀ center ∈ U, globalRow center ⊆ U

instance instDecidableRowClosed (U : Finset Label) : Decidable (rowClosed U) := by
  unfold rowClosed
  infer_instance

/-- The finite antecedent of the existing ordered-cap repeated-outside-pair
consumer. -/
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

instance instDecidableHasRepeatedOutsidePair : Decidable HasRepeatedOutsidePair := by
  unfold HasRepeatedOutsidePair
  infer_instance

set_option maxRecDepth 100000
set_option maxHeartbeats 4000000

/-- One exact four-point class is retained at every carrier center, and the
common critical map is source faithful and exact on blocker fibers. -/
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

/-- The displayed caps have the exact `(5,6,6)` parent cardinality surface,
including a six-point physical second cap. -/
theorem largeCap_parentSurface_checked :
    surplusCap.card = 5 ∧
    firstOppositeCap.card = 6 ∧
    physicalSecondCap.card = 6 ∧
    surplusCap ∪ firstOppositeCap ∪ physicalSecondCap = Finset.univ ∧
    surplusCap ∩ firstOppositeCap = {secondApex} ∧
    firstOppositeCap ∩ physicalSecondCap = {remainingMoserVertex} ∧
    physicalSecondCap ∩ surplusCap = {firstApex} ∧
    physicalInterior = physicalSecondCap \ {firstApex, remainingMoserVertex} := by
  decide

/-- Both physical apices retain a five-point class.  Every one-point deletion
leaves four points, and deleting the named mutual endpoint gives the displayed
global rows at the two apices. -/
theorem biApex_deletionRobustSurface_checked :
    firstApexRadiusClass.card = 5 ∧
    physicalRadiusClass.card = 5 ∧
    (∀ q : Label, 4 ≤ (firstApexRadiusClass.erase q).card) ∧
    (∀ q : Label, 4 ≤ (physicalRadiusClass.erase q).card) ∧
    globalRow firstApex = firstApexRadiusClass.erase deleted ∧
    globalRow secondApex = physicalRadiusClass.erase deleted := by
  decide

/-- Exact-six mutual-pair and origin-tagged continuation surface.  The
unused-source row omits both continuation sources, while the chosen deleted
endpoint is absent from both the unused and partner rows. -/
theorem exactFive_mutualDistinctBlockerSurface_checked :
    physicalVertices = {deleted, continuationSecond, partner} ∧
    unusedSource ∈ physicalInterior ∧
    unusedSource ∉ physicalRadiusClass ∧
    deleted ∈ physicalVertices ∧
    continuationSecond ∈ physicalVertices ∧
    partner ∈ physicalVertices ∧
    continuationFirst = deleted ∧
    continuationFirst ≠ continuationSecond ∧
    blocker unusedSource ≠ blocker partner ∧
    continuationFirst ∉ criticalSupport unusedSource ∧
    continuationSecond ∉ criticalSupport unusedSource ∧
    partner ∉ criticalSupport deleted ∧
    deleted ∉ criticalSupport partner ∧
    deleted ∉ criticalSupport unusedSource := by
  decide

/-- Every displayed selected row respects the two-hit bound in every cap
containing its center. -/
theorem orderedCap_twoHitSurface_checked :
    ∀ capIndex : Fin 3, ∀ center ∈ capByIndex capIndex,
      (globalRow center ∩ capByIndex capIndex).card ≤ 2 := by
  decide +revert

/-- The selected support system retains the two-circle intersection bound;
in fact distinct rows meet in at most one point. -/
theorem distinctCenter_rowIntersection_card_le_one_checked :
    ∀ first second : Label, first ≠ second →
      (globalRow first ∩ globalRow second).card ≤ 1 := by
  decide +revert

/-- A Hamiltonian selected-row cycle. -/
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

/-- Every nonempty selected-row-closed set is the whole carrier, the exact
selected-witness consequence of global minimality. -/
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

/-- One linear cut of the cap-partition boundary order
`0, I₀, 1, I₁, 2, I₂`. -/
def boundaryRank : Label → Fin 14 :=
  ![0, 4, 9, 10, 11, 1, 12, 5, 2, 6, 13, 3, 7, 8]

/-- Every collision in the retained first-apex radius class satisfies the
exact boundary alternation produced by the Euclidean bisector theorem.  In
this fixture the only such collision is the pair `{4,7}` over blocker `2`. -/
theorem retainedRadiusCollision_alternation_checked :
    ∀ source₁ ∈ firstApexRadiusClass,
      ∀ source₂ ∈ firstApexRadiusClass,
        source₁ ≠ source₂ →
        blocker source₁ = blocker source₂ →
        (SurplusCOMPGBank.btw
            (boundaryRank firstApex)
            (boundaryRank (blocker source₁))
            (boundaryRank source₁) ↔
          ¬ SurplusCOMPGBank.btw
            (boundaryRank firstApex)
            (boundaryRank (blocker source₁))
            (boundaryRank source₂)) := by
  decide +revert

/-- The generic production finite-endomap theorem applies to this exact
common critical map.  It exposes a second repeated blocker fiber or a third
source in the displayed `{0,1}` fiber. -/
theorem production_blockerMultiplicity_checked :
    (∃ a b : Label,
        a ≠ b ∧ blocker a = blocker b ∧ blocker a ≠ blocker 0) ∨
      ∃ source : Label,
        source ≠ 0 ∧ source ≠ 1 ∧ blocker source = blocker 0 := by
  exact second_fiber_or_larger_first_fiber_of_two_omissions
    blocker
    (omitted₁ := firstApex)
    (omitted₂ := secondApex)
    (source₁ := (0 : Label))
    (source₂ := (1 : Label))
    (by decide +revert)
    (by decide +revert)
    (by decide)

/-- The stronger second-fiber arm is realized explicitly: two distinct
repeated blocker values lie in the same six-point cap, yet their exact rows
share only the single outside point `deleted`. -/
theorem two_repeatedFibers_sameCap_without_outsidePair_checked :
    (0 : Label) ≠ 1 ∧
    blocker 0 = blocker 1 ∧
    (3 : Label) ≠ 4 ∧
    blocker 3 = blocker 4 ∧
    blocker 0 ≠ blocker 3 ∧
    blocker 0 ∈ firstOppositeCap ∧
    blocker 3 ∈ firstOppositeCap ∧
    deleted ∉ firstOppositeCap ∧
    criticalSupport 0 ∩ criticalSupport 3 = {deleted} := by
  decide

/-- The two live mutual-arm blockers also have the favorable common-cap
placement, but their rows have only the unused source in common. -/
theorem favorable_sameCap_actualBlockers_checked :
    blocker unusedSource ≠ blocker partner ∧
    blocker unusedSource ∈ surplusCap ∧
    blocker partner ∈ surplusCap ∧
    unusedSource ∉ surplusCap ∧
    partner ∉ surplusCap ∧
    criticalSupport unusedSource ∩ criticalSupport partner = {unusedSource} := by
  decide

/-- Despite exact cap six, the total common critical map, blocker
multiplicity, cap two-hit bounds, and selected-row minimality, the exact
antecedent of `outsidePair_unique_capCenter` never occurs. -/
theorem no_repeatedOutsidePair_checked :
    ¬ HasRepeatedOutsidePair := by
  decide

#print axioms total_sourceFaithful_criticalSystem_checked
#print axioms largeCap_parentSurface_checked
#print axioms biApex_deletionRobustSurface_checked
#print axioms exactFive_mutualDistinctBlockerSurface_checked
#print axioms orderedCap_twoHitSurface_checked
#print axioms distinctCenter_rowIntersection_card_le_one_checked
#print axioms minimal_rowClosureSurface_checked
#print axioms retainedRadiusCollision_alternation_checked
#print axioms production_blockerMultiplicity_checked
#print axioms two_repeatedFibers_sameCap_without_outsidePair_checked
#print axioms favorable_sameCap_actualBlockers_checked
#print axioms no_repeatedOutsidePair_checked

end ATailExactSixMutualRepeatedOutsidePairFiniteBoundary
end Problem97

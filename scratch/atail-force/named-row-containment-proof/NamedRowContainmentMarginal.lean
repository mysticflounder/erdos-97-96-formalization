/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler

/-!
# Marginal audit for named first-apex row containment

This file checks the strongest finite-incidence projection of the proposed
named-row occurrence theorem.  It is deliberately not a model of the full
Euclidean parent.  It retains the exact period-three transition, global
all-reverse incidence, the `2 + 2` form of every transition row, one shared
linear cap order for sources and blockers, and two disjoint four-point named
first-apex rows.

The checked model makes every reverse outside pair cross between the two named
rows.  Thus the desired containment is not a consequence of those public
incidence/cardinality/order marginals; a proof must use additional Euclidean,
MEC, minimality, or full critical-map information from the parent.
-/

namespace Problem97
namespace ATailNamedRowContainmentMarginal

attribute [local instance] Classical.propDecidable

/-- Sixteen abstract roles.  Roles `0,...,7` are outside the physical cap;
roles `8,...,15` form the shared physical-cap block. -/
abbrev Role := Fin 16

/-- The two actual selected first-apex row supports. -/
def retainedSupport : Finset Role := {0, 1, 2, 3}

def doubleSupport : Finset Role := {4, 5, 6, 7}

/-- Three physical sources in their common cap order. -/
def physical : Fin 3 → Role
  | 0 => 8
  | 1 => 10
  | 2 => 14

/-- The exact period-three successor. -/
def successor : Fin 3 → Fin 3
  | 0 => 1
  | 1 => 2
  | 2 => 0

/-- The actual critical support at each physical source.  It contains the
source and predecessor physical vertices, omits the successor, and has two
outside-cap points. -/
def criticalSupport : Fin 3 → Finset Role
  | 0 => {14, 8, 2, 6}
  | 1 => {8, 10, 0, 4}
  | 2 => {10, 14, 1, 5}

/-- The common physical cap in the abstract order. -/
def physicalCap : Finset Role := {8, 9, 10, 11, 12, 13, 14, 15}

/-- The actual blocker of the successor row on each transition edge. -/
def reverseBlocker : Fin 3 → Role
  | 0 => 9
  | 1 => 12
  | 2 => 11

/-- Exact outside residual of the successor row. -/
def reverseOutsidePair (q : Fin 3) : Finset Role :=
  criticalSupport (successor q) \ physicalCap

theorem retainedSupport_card : retainedSupport.card = 4 := by decide

theorem doubleSupport_card : doubleSupport.card = 4 := by decide

theorem namedSupports_disjoint : Disjoint retainedSupport doubleSupport := by decide

theorem successor_ne (q : Fin 3) : successor q ≠ q := by
  fin_cases q <;> decide

theorem successor_sq_ne (q : Fin 3) : successor (successor q) ≠ q := by
  fin_cases q <;> decide

theorem successor_cubed (q : Fin 3) :
    successor (successor (successor q)) = q := by
  fin_cases q <;> rfl

/-- Source-faithful omission direction of the total transition. -/
theorem successor_not_mem_criticalSupport (q : Fin 3) :
    physical (successor q) ∉ criticalSupport q := by
  fin_cases q <;> decide

/-- The global all-reverse relation, not merely its three transition-edge
instances. -/
theorem allReverse (q w : Fin 3)
    (h : physical w ∉ criticalSupport q) :
    physical q ∈ criticalSupport w := by
  fin_cases q <;> fin_cases w <;> simp_all [physical, criticalSupport]

theorem reverseOutsidePair_zero : reverseOutsidePair 0 = {0, 4} := by decide

theorem reverseOutsidePair_one : reverseOutsidePair 1 = {1, 5} := by decide

theorem reverseOutsidePair_two : reverseOutsidePair 2 = {2, 6} := by decide

theorem reverseOutsidePair_card (q : Fin 3) : (reverseOutsidePair q).card = 2 := by
  fin_cases q <;> decide

/-- Every successor row has the exact two physical plus two outside split. -/
theorem successorRow_inter_physicalCap_eq_pair (q : Fin 3) :
    criticalSupport (successor q) ∩ physicalCap =
      {physical q, physical (successor q)} := by
  fin_cases q <;> decide

theorem reverseOutsidePair_subset_cap_complement (q : Fin 3) :
    reverseOutsidePair q ⊆ Finset.univ \ physicalCap := by
  intro x hx
  exact Finset.mem_sdiff.mpr
    ⟨Finset.mem_univ x, (Finset.mem_sdiff.mp hx).2⟩

/-- Each blocker is in the shared physical-cap block. -/
theorem reverseBlocker_mem_physicalCap (q : Fin 3) :
    reverseBlocker q ∈ physicalCap := by
  fin_cases q <;> decide

/-- Exact analogue of the production shared-order `straddle` field. -/
theorem reverseBlocker_straddles (q : Fin 3) :
    (physical q < reverseBlocker q ∧
        reverseBlocker q < physical (successor q)) ∨
      (physical (successor q) < reverseBlocker q ∧
        reverseBlocker q < physical q) := by
  fin_cases q <;> decide

/-- Every reverse outside pair has one point in each named row. -/
theorem reverseOutsidePair_inter_retained_card (q : Fin 3) :
    (reverseOutsidePair q ∩ retainedSupport).card = 1 := by
  fin_cases q <;> decide

theorem reverseOutsidePair_inter_double_card (q : Fin 3) :
    (reverseOutsidePair q ∩ doubleSupport).card = 1 := by
  fin_cases q <;> decide

/-- This countermodel gives the proposed producer the stronger union coverage
that is currently absent from production.  Even that does not force either
two-point residual into one row. -/
theorem reverseOutsidePair_subset_namedUnion (q : Fin 3) :
    reverseOutsidePair q ⊆ retainedSupport ∪ doubleSupport := by
  fin_cases q <;> decide

/-- The three outside residuals are even pairwise disjoint in this model. -/
theorem reverseOutsidePairs_disjoint {q w : Fin 3} (hqw : q ≠ w) :
    Disjoint (reverseOutsidePair q) (reverseOutsidePair w) := by
  fin_cases q <;> fin_cases w <;> simp_all <;> decide

/-- Exact refutation of the named-row containment conclusion in this
source-faithful finite marginal. -/
theorem no_reverseOutsidePair_subset_namedRow :
    ¬ ∃ q : Fin 3,
      reverseOutsidePair q ⊆ retainedSupport ∨
        reverseOutsidePair q ⊆ doubleSupport := by
  decide

/- ## Independent selected-subpacket regression

Even granting the actual co-radial conclusion, containment in a previously
chosen four-subpacket is not stable when the complete radius class is larger
than four.  This second fixture isolates that quantifier mismatch from the
period-three incidence countermodel above. -/

def sixPointRadiusClass : Finset Role := {0, 1, 2, 3, 4, 5}

def chosenRetainedSubrow : Finset Role := {0, 1, 2, 3}

def chosenDoubleSubrow : Finset Role := {6, 7, 8, 9}

def coRadialResidual : Finset Role := {4, 5}

theorem sixPointRadiusClass_card : sixPointRadiusClass.card = 6 := by decide

theorem chosenRetainedSubrow_card : chosenRetainedSubrow.card = 4 := by decide

theorem chosenDoubleSubrow_card : chosenDoubleSubrow.card = 4 := by decide

theorem coRadialResidual_card : coRadialResidual.card = 2 := by decide

theorem coRadialResidual_subset_fullRadiusClass :
    coRadialResidual ⊆ sixPointRadiusClass := by decide

theorem coRadialResidual_not_subset_chosenRows :
    ¬ (coRadialResidual ⊆ chosenRetainedSubrow ∨
      coRadialResidual ⊆ chosenDoubleSubrow) := by
  decide

/-- The desired production conclusion is a terminal contradiction for every
assembled packet; this restates its already-checked consumer direction. -/
theorem not_namedRowOccurrence_of_fullParentExactFiveAllReverseData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : ATailCriticalPairFrontier.CriticalPairFrontier D S firstRadius H}
    {R : ATailOrientedPhysicalApexIngress.FrontierCommonDeletionParentResidual F₀}
    {B : ATailPhysicalSecondApexCommonDeletion.FrontierBiApexRobustResidual R}
    {L : ATailLargeOppositeCapsBiApexSurface.FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : ATailLargeCapUniqueFive.LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      ATailLargeCapUniqueFiveLowHit.LargeCapUniqueFiveTwoCommonDeletionSources
        D S H profile}
    (A : ATailParentExactFiveAssembler.FullParentExactFiveAllReverseData
      L profile continuation) :
    ¬ ATailParentExactFiveAssembler.FirstApexNamedRowTransitionReversePairOccurrence A :=
  ATailParentExactFiveAssembler.false_of_fullParentExactFiveAllReverseData_of_namedRowOccurrence A

/-- A choice-free repair of the producer surface: one reverse residual lies
in a complete first-apex radius class.  Unlike the named-row statement, this
does not depend on either arbitrary four-point subpacket stored in
`firstApexRoles`. -/
abbrev FirstApexRadiusClassTransitionReversePairOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : ATailCriticalPairFrontier.CriticalPairFrontier D S firstRadius H}
    {R : ATailOrientedPhysicalApexIngress.FrontierCommonDeletionParentResidual F₀}
    {B : ATailPhysicalSecondApexCommonDeletion.FrontierBiApexRobustResidual R}
    {L : ATailLargeOppositeCapsBiApexSurface.FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : ATailLargeCapUniqueFive.LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      ATailLargeCapUniqueFiveLowHit.LargeCapUniqueFiveTwoCommonDeletionSources
        D S H profile}
    (A : ATailParentExactFiveAssembler.FullParentExactFiveAllReverseData
      L profile continuation) : Prop :=
  ∃ q : ATailLargeCapUniqueFivePhysicalOmissionCycle.PhysicalVertex profile,
      ∃ radius : ℝ,
    ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal.transitionReverseOutsidePair
        A.transition q ⊆
      SelectedClass D.A S.oppApex1 radius

/-- Full-radius-class occurrence implies the existing metric terminal. -/
theorem firstApexCoRadialOccurrence_of_radiusClassOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : ATailCriticalPairFrontier.CriticalPairFrontier D S firstRadius H}
    {R : ATailOrientedPhysicalApexIngress.FrontierCommonDeletionParentResidual F₀}
    {B : ATailPhysicalSecondApexCommonDeletion.FrontierBiApexRobustResidual R}
    {L : ATailLargeOppositeCapsBiApexSurface.FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : ATailLargeCapUniqueFive.LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      ATailLargeCapUniqueFiveLowHit.LargeCapUniqueFiveTwoCommonDeletionSources
        D S H profile}
    (A : ATailParentExactFiveAssembler.FullParentExactFiveAllReverseData
      L profile continuation)
    (hoccurs : FirstApexRadiusClassTransitionReversePairOccurrence A) :
    ATailParentExactFiveAssembler.FirstApexCoRadialTransitionReversePairOccurrence A := by
  rcases hoccurs with ⟨q, radius, hsubset⟩
  let hreverse := fun source ↦ A.allReverse source (A.transition.successor source)
    (A.transition.successor_not_mem_actualCriticalSupport source)
  rcases
      ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal.exists_transitionReverseOutsidePair_eq_pair
        A.transition hreverse q with
    ⟨a, b, hab, hpair⟩
  have haPair :
      a ∈
        ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal.transitionReverseOutsidePair
          A.transition q := by
    rw [hpair]
    simp
  have hbPair :
      b ∈
        ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal.transitionReverseOutsidePair
          A.transition q := by
    rw [hpair]
    simp
  have haRadius := (mem_selectedClass.mp (hsubset haPair)).2
  have hbRadius := (mem_selectedClass.mp (hsubset hbPair)).2
  exact ⟨q, a, b, hab, haPair, hbPair, haRadius.trans hbRadius.symm⟩

/-- Conversely, the metric terminal canonically gives containment in the
complete radius class.  Hence this repaired statement is exactly equivalent
to the actual missing metric producer, whereas named selected-row containment
is strictly stronger at the available interface. -/
theorem radiusClassOccurrence_of_firstApexCoRadialOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : ATailCriticalPairFrontier.CriticalPairFrontier D S firstRadius H}
    {R : ATailOrientedPhysicalApexIngress.FrontierCommonDeletionParentResidual F₀}
    {B : ATailPhysicalSecondApexCommonDeletion.FrontierBiApexRobustResidual R}
    {L : ATailLargeOppositeCapsBiApexSurface.FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : ATailLargeCapUniqueFive.LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      ATailLargeCapUniqueFiveLowHit.LargeCapUniqueFiveTwoCommonDeletionSources
        D S H profile}
    (A : ATailParentExactFiveAssembler.FullParentExactFiveAllReverseData
      L profile continuation)
    (hoccurs :
      ATailParentExactFiveAssembler.FirstApexCoRadialTransitionReversePairOccurrence A) :
    FirstApexRadiusClassTransitionReversePairOccurrence A := by
  rcases hoccurs with ⟨q, a, b, hab, haPair, hbPair, habRadius⟩
  let pair :=
    ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal.transitionReverseOutsidePair
      A.transition q
  have hpairCard : pair.card = 2 :=
    ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal.transitionReverseOutsidePair_card_eq_two
      A.transition
        (fun source ↦ A.allReverse source (A.transition.successor source)
          (A.transition.successor_not_mem_actualCriticalSupport source)) q
  have hpairSubset :
      ({a, b} : Finset (EuclideanSpace ℝ (Fin 2))) ⊆ pair := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact haPair
    · exact hbPair
  have hpairEq : pair = {a, b} :=
    (Finset.eq_of_subset_of_card_le hpairSubset (by
      simp [pair, hab, hpairCard])).symm
  refine ⟨q, dist S.oppApex1 a, ?_⟩
  intro x hx
  have hxPair : x ∈ pair := by simpa [pair] using hx
  rw [hpairEq] at hxPair
  simp only [Finset.mem_insert, Finset.mem_singleton] at hxPair
  rcases hxPair with rfl | rfl
  · have haA :=
      (Finset.mem_sdiff.mp
        (ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal.transitionReverseOutsidePair_subset_complement
          A.transition q haPair)).1
    exact mem_selectedClass.mpr ⟨haA, rfl⟩
  · have hbA :=
      (Finset.mem_sdiff.mp
        (ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal.transitionReverseOutsidePair_subset_complement
          A.transition q hbPair)).1
    exact mem_selectedClass.mpr ⟨hbA, habRadius.symm⟩

#print axioms no_reverseOutsidePair_subset_namedRow
#print axioms not_namedRowOccurrence_of_fullParentExactFiveAllReverseData
#print axioms firstApexCoRadialOccurrence_of_radiusClassOccurrence
#print axioms radiusClassOccurrence_of_firstApexCoRadialOccurrence

end ATailNamedRowContainmentMarginal
end Problem97

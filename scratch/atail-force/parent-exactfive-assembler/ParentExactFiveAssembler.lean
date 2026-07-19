/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LargeOppositeCapsBiApexSurface
import Erdos9796Proof.P97.ATail.RobustLargeRadiusReduction
import Erdos9796Proof.P97.ATail.FirstApexShellRoleExtractor
import Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionSingleOrbit
import Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionSharedCapOrder

/-!
# Full-parent exact-five relation assembler

This scratch module checks the smallest source-faithful assembly from the
large-opposite-caps bi-apex parent through an exact-five physical-apex
profile.  The all-reverse arm retains the total transition, the exact
period-three cycle containing both continuation sources, and the common cap
order.  Its only terminal input is a first-apex co-radial transition reverse
outside pair.

The sibling is the current global arbitrary mutual-omission pair.  No
production theorem closes that pair, so it remains an explicit consumer
slot rather than being silently identified with the older cycle-edge
mutual-omission scratch surface.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailParentExactFiveAssemblerScratch

open ATailCriticalPairFrontier
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionSharedCapOrder
open ATailLargeCapUniqueFivePhysicalOmissionSingleOrbit
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRobustLargeRadius

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The full parent plus an exact-five physical profile already gives the
production robust-large-radius parent surface.  In particular, the exact
profile supplies the required `>= 5` class and the large-opposite-caps
wrapper supplies the physical cap-six bound. -/
def robustLargeRadiusParentSurfaceOfExactFive
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    RobustLargeRadiusParentSurface D S where
  minimal := R.minimal
  noM44 := R.noM44
  oppCap2_card_ge_six := L.secondOppCap_card_ge_six
  radius := profile.radius
  radius_pos := profile.radius_pos
  radius_class_card_ge_five := by
    rw [profile.class_card_eq_five]

/-- Full-parent form of the global arbitrary mutual-omission sibling.  The
origin-tagged continuation is retained even though the pair itself is chosen
independently of the transition. -/
structure FullParentExactFiveMutualData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) : Type where
  continuation :
    LargeCapUniqueFiveTwoCommonDeletionSources D S H profile
  pair : PhysicalActualCriticalMutualOmissionPair H profile

/-- Complete all-reverse output at the full parent boundary.  The parent is
an index of the packet, so an eventual occurrence theorem can consume the
retained original frontier, both cap-six bounds, bi-apex robustness,
minimality, and `noM44` without reconstructing them from weaker data. -/
structure FullParentExactFiveAllReverseData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) : Type where
  firstApexRoles : FirstApexShellRolePacket F₀ R
  transition : PhysicalActualCriticalOmissionTransition H profile
  allReverse : ∀ q w : PhysicalVertex profile,
    w.1 ∉
        (H.selectedAt q.1
          (PhysicalVertex.mem_A q)).toCriticalFourShell.support →
      q.1 ∈
        (H.selectedAt w.1
          (PhysicalVertex.mem_A w)).toCriticalFourShell.support
  cycle : PhysicalActualCriticalOmissionCycle H profile
  cycle_transition : cycle.transition = transition
  cycle_entryTime : cycle.entryTime = 0
  cycle_period : cycle.period = 3
  cycle_start : cycle.start.1 = continuation.first
  continuationSecond_occurs :
    ∃ i : Fin cycle.period, (cycle.source i).1 = continuation.second
  cycle_reverse : ∀ i : Fin cycle.period,
    (cycle.source i).1 ∈
      (H.selectedAt (cycle.source (cycle.successorIndex i)).1
        (PhysicalVertex.mem_A
          (cycle.source (cycle.successorIndex i)))).toCriticalFourShell.support
  sharedOrder :
    PhysicalActualCriticalOmissionTransitionSharedCapOrder transition

/-- Exact global relation split from one origin-tagged continuation.  The
all-reverse arm is already reduced to period three and carries the
production shared cap order. -/
theorem nonempty_mutualOmissionPair_or_fullParentExactFiveAllReverseData_of_continuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    Nonempty (FullParentExactFiveMutualData L profile) ∨
      Nonempty (FullParentExactFiveAllReverseData L profile continuation) := by
  rcases nonempty_physicalActualCriticalOmissionTransition H profile with
    ⟨transition⟩
  rcases nonempty_firstApexShellRolePacket F₀ R with ⟨firstApexRoles⟩
  rcases nonempty_mutualOmissionPair_or_all_omissions_reverseMembership
      H profile with hmutual | hallReverse
  · exact Or.inl ⟨{
      continuation := continuation
      pair := hmutual.some }⟩
  · rcases exists_entryZeroPeriodThreeCycle_containing_continuationSources
        continuation transition hallReverse with
      ⟨cycle, htransition, hentry, hperiod, hstart, hsecond, hcycleReverse⟩
    rcases nonempty_transitionSharedCapOrder_of_all_omissions_reverseMembership
        transition hallReverse with ⟨sharedOrder⟩
    exact Or.inr ⟨{
      firstApexRoles := firstApexRoles
      transition := transition
      allReverse := hallReverse
      cycle := cycle
      cycle_transition := htransition
      cycle_entryTime := hentry
      cycle_period := hperiod
      cycle_start := hstart
      continuationSecond_occurs := hsecond
      cycle_reverse := hcycleReverse
      sharedOrder := sharedOrder }⟩

/-- Exact global relation split after constructing the origin-tagged
continuation from the physical cap-six field of the full parent. -/
theorem nonempty_mutualOmissionPair_or_fullParentExactFiveAllReverseData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    Nonempty (FullParentExactFiveMutualData L profile) ∨
      ∃ continuation :
          LargeCapUniqueFiveTwoCommonDeletionSources D S H profile,
        Nonempty (FullParentExactFiveAllReverseData L profile continuation) := by
  rcases nonempty_twoCommonDeletionSources_of_largeCapUniqueFive
      H L.secondOppCap_card_ge_six profile with ⟨continuation⟩
  rcases
      nonempty_mutualOmissionPair_or_fullParentExactFiveAllReverseData_of_continuation
        L profile continuation with hmutual | hallReverse
  · exact Or.inl hmutual
  · exact Or.inr ⟨continuation, hallReverse⟩

/-- Full production trace from the robust bi-apex parent.  The only sibling
before exact-five is the separate two-exact-four-radii surface or the
existing generic common-deletion recurrence.  On exact-five, the global
relation split is exactly the mutual-pair/all-reverse split above. -/
theorem exactTwoFourRadii_or_largeRadiusCommonDeletion_or_exactFiveRelation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    Nonempty (PhysicalSecondApexExactTwoFourRadiusResidual D S) ∨
      ∃ Flarge : RobustLargeRadiusParentSurface D S,
        (∃ deleted center : ℝ²,
          Nonempty
            (ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket
              D H deleted center S.oppApex2)) ∨
        ∃ profile : LargeCapUniqueFiveSecondApexRadius D S,
          profile.radius = Flarge.radius ∧
            (Nonempty (FullParentExactFiveMutualData L profile) ∨
              ∃ continuation :
                  LargeCapUniqueFiveTwoCommonDeletionSources D S H profile,
                Nonempty
                  (FullParentExactFiveAllReverseData L profile continuation)) := by
  rcases largePhysicalRadius_or_exactTwoFourRadii_of_robust
      L.firstOppCap_card_ge_six L.secondOppCap_card_ge_six
      B.secondApex_robust with hingress | hexact
  · rcases hingress with ⟨ingress⟩
    let Flarge : RobustLargeRadiusParentSurface D S := {
      minimal := R.minimal
      noM44 := R.noM44
      oppCap2_card_ge_six := ingress.second_cap_card_ge_six
      radius := ingress.radius
      radius_pos := ingress.radius_pos
      radius_class_card_ge_five := ingress.radius_class_card_ge_five }
    rcases nonempty_reducedOutcome_of_largeSecondApexRadius H Flarge with
      ⟨outcome⟩
    cases outcome with
    | commonDeletion deleted center packet =>
        exact Or.inr ⟨Flarge, Or.inl ⟨deleted, center, ⟨packet⟩⟩⟩
    | exactUniqueFive profile continuation =>
        have hparentFour :
            4 ≤ (SelectedClass D.A S.oppApex2 Flarge.radius).card := by
          have := Flarge.radius_class_card_ge_five
          omega
        have hradius : profile.radius = Flarge.radius :=
          (profile.unique_K4_radius Flarge.radius Flarge.radius_pos
            hparentFour).symm
        rcases
            nonempty_mutualOmissionPair_or_fullParentExactFiveAllReverseData_of_continuation
              L profile continuation with hmutual | hallReverse
        · exact Or.inr ⟨Flarge, Or.inr ⟨profile, hradius, Or.inl hmutual⟩⟩
        · exact Or.inr ⟨Flarge, Or.inr ⟨profile, hradius,
            Or.inr ⟨continuation, hallReverse⟩⟩⟩
  · exact Or.inl hexact

/-- The minimal terminal occurrence still missing on the all-reverse arm:
one complete two-point reverse residual is co-radial from the retained first
physical apex. -/
abbrev FirstApexCoRadialTransitionReversePairOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation) : Prop :=
  ∃ q : PhysicalVertex profile, ∃ a b : ℝ²,
    a ≠ b ∧
      a ∈ transitionReverseOutsidePair A.transition q ∧
      b ∈ transitionReverseOutsidePair A.transition q ∧
      dist S.oppApex1 a = dist S.oppApex1 b

/-- Source-indexed form recommended for the next producer: one complete
reverse outside pair is contained in either of the two actual first-apex
selected rows extracted from the retained original frontier. -/
abbrev FirstApexNamedRowTransitionReversePairOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation) : Prop :=
  ∃ q : PhysicalVertex profile,
    transitionReverseOutsidePair A.transition q ⊆
        A.firstApexRoles.retainedRow.support ∨
      transitionReverseOutsidePair A.transition q ⊆
        A.firstApexRoles.doubleRow.support

/-- Named-row containment produces the metric co-radial occurrence without
any further geometric input. -/
theorem firstApexCoRadialOccurrence_of_namedRowOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation)
    (hnamed : FirstApexNamedRowTransitionReversePairOccurrence A) :
    FirstApexCoRadialTransitionReversePairOccurrence A := by
  rcases hnamed with ⟨q, hretained | hdouble⟩
  · rcases exists_transitionReverseOutsidePair_eq_pair A.transition
        (fun source ↦ A.allReverse source (A.transition.successor source)
          (A.transition.successor_not_mem_actualCriticalSupport source))
        q with ⟨a, b, hab, hpair⟩
    have haPair : a ∈ transitionReverseOutsidePair A.transition q := by
      rw [hpair]
      simp
    have hbPair : b ∈ transitionReverseOutsidePair A.transition q := by
      rw [hpair]
      simp
    have haRow := hretained haPair
    have hbRow := hretained hbPair
    exact ⟨q, a, b, hab, haPair, hbPair,
      (A.firstApexRoles.retainedRow.support_eq_radius a haRow).trans
        (A.firstApexRoles.retainedRow.support_eq_radius b hbRow).symm⟩
  · rcases exists_transitionReverseOutsidePair_eq_pair A.transition
        (fun source ↦ A.allReverse source (A.transition.successor source)
          (A.transition.successor_not_mem_actualCriticalSupport source))
        q with ⟨a, b, hab, hpair⟩
    have haPair : a ∈ transitionReverseOutsidePair A.transition q := by
      rw [hpair]
      simp
    have hbPair : b ∈ transitionReverseOutsidePair A.transition q := by
      rw [hpair]
      simp
    have haRow := hdouble haPair
    have hbRow := hdouble hbPair
    exact ⟨q, a, b, hab, haPair, hbPair,
      (A.firstApexRoles.doubleRow.support_eq_radius a haRow).trans
        (A.firstApexRoles.doubleRow.support_eq_radius b hbRow).symm⟩

/-- The existing ordered-cap terminal consumes exactly the occurrence above;
no additional row producer or slot normalization is needed. -/
theorem false_of_fullParentExactFiveAllReverseData_of_firstApexOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation)
    (hoccurs : FirstApexCoRadialTransitionReversePairOccurrence A) : False := by
  rcases hoccurs with ⟨q, a, b, hab, ha, hb, hfirst⟩
  exact false_of_transitionReverseOutsidePair_coRadial_firstApex
    A.transition
    (fun source ↦ A.allReverse source (A.transition.successor source)
      (A.transition.successor_not_mem_actualCriticalSupport source))
    q hab ha hb hfirst

/-- The recommended named-row producer therefore closes the all-reverse
packet through the existing first-apex co-radial terminal. -/
theorem false_of_fullParentExactFiveAllReverseData_of_namedRowOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation)
    (hnamed : FirstApexNamedRowTransitionReversePairOccurrence A) : False :=
  false_of_fullParentExactFiveAllReverseData_of_firstApexOccurrence A
    (firstApexCoRadialOccurrence_of_namedRowOccurrence A hnamed)

/-- Thin exact-five dispatcher.  It makes the two mathematical slots
explicit: a direct consumer for the arbitrary mutual-omission pair, and the
full-parent first-apex co-radial occurrence on the all-reverse packet. -/
theorem false_of_fullParentExactFive_of_relationConsumers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (mutualFalse :
      FullParentExactFiveMutualData L profile → False)
    (allReverseOccurrence :
      ∀ (continuation :
          LargeCapUniqueFiveTwoCommonDeletionSources D S H profile)
        (A : FullParentExactFiveAllReverseData L profile continuation),
          FirstApexNamedRowTransitionReversePairOccurrence A) : False := by
  rcases nonempty_mutualOmissionPair_or_fullParentExactFiveAllReverseData
      L profile with hmutual | ⟨continuation, hallReverse⟩
  · exact mutualFalse hmutual.some
  · exact false_of_fullParentExactFiveAllReverseData_of_namedRowOccurrence
      hallReverse.some (allReverseOccurrence continuation hallReverse.some)

#print axioms robustLargeRadiusParentSurfaceOfExactFive
#print axioms exactTwoFourRadii_or_largeRadiusCommonDeletion_or_exactFiveRelation
#print axioms nonempty_mutualOmissionPair_or_fullParentExactFiveAllReverseData
#print axioms firstApexCoRadialOccurrence_of_namedRowOccurrence
#print axioms false_of_fullParentExactFiveAllReverseData_of_firstApexOccurrence
#print axioms false_of_fullParentExactFive_of_relationConsumers

end

end ATailParentExactFiveAssemblerScratch
end Problem97

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ExactFiveCard13SameRadiusDispatcher
import ExactFiveCard13DistinctRadiusDispatcher
import ExactFiveCardinalityDispatcher

/-!
# Exact-five card-thirteen combined dispatcher

This module joins the already-closed same-radius arm to the two canonical
distinct-radius source-orbit callbacks.  The all-one distinct-radius outcome
is discharged by the existing card-thirteen source closure, so a concrete
certificate instantiation needs to provide only the direct and mirror
asymmetric callbacks.
-/

namespace Problem97
namespace ATailExactFiveCard13CombinedDispatcherScratch

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailExactFiveCard13DistinctRadiusDispatcherScratch
open ATailExactFiveCard13SameRadiusDispatcherScratch
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailExactFiveCardinalityDispatcherScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open CanonicalAsymmetricSemanticRowTable

noncomputable section

/-- The only two certificate endpoints still required after reusing the
unconditional all-one card-thirteen closure. -/
structure CanonicalDistinctRadiusCard13AsymmetricClosers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (first : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13)
    (hdistinct : first.doubleRadius ≠ radius) : Type where
  direct :
    ∀ {M : PhysicalActualCriticalMutualOmissionPair H profile}
      {N : SourceTwoHitNormalForm Q profile M}
      {P : CanonicalAsymmetricRolePrepacket N}
      {star : PhysicalGlobalCrossDeletionStar profile}
      {T : CanonicalAsymmetricSemanticRowTable P star first}
      (_C : CanonicalCoverFamilies T),
      P.sourceIndex = (1 : Fin 13) ∧
        P.blockerIndex = (2 : Fin 13) ∧
        P.thirdIndex = (3 : Fin 13) → False
  mirror :
    ∀ {M : PhysicalActualCriticalMutualOmissionPair H profile}
      {N : SourceTwoHitNormalForm Q profile M}
      {P : CanonicalAsymmetricRolePrepacket N}
      {star : PhysicalGlobalCrossDeletionStar profile}
      {T : CanonicalAsymmetricSemanticRowTable P star first}
      (_C : CanonicalCoverFamilies T),
      P.sourceIndex = (3 : Fin 13) ∧
        P.blockerIndex = (2 : Fin 13) ∧
        P.thirdIndex = (1 : Fin 13) → False

/-- Add the independently proved all-one callback to the two asymmetric
certificate endpoints. -/
def CanonicalDistinctRadiusCard13AsymmetricClosers.toOrbitClosers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {first : FirstApexShellRolePacket F R}
    {hcard : D.A.card = 13}
    {hdistinct : first.doubleRadius ≠ radius}
    (closers : CanonicalDistinctRadiusCard13AsymmetricClosers
      Q profile first hcard hdistinct) :
    CanonicalDistinctRadiusCard13OrbitClosers
      Q profile first hcard hdistinct where
  allOne := fun star hall ↦
    false_of_exactFive_card13_allRowsOneHit Q profile star hall hcard
  direct := closers.direct
  mirror := closers.mirror

/-- Close exact card thirteen from the two distinct-radius asymmetric
certificate endpoints.  The retained first-apex packet is selected exactly
once, and the radius comparison is exhaustive. -/
theorem false_of_exactFive_card13_of_asymmetricClosers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (hcard : D.A.card = 13)
    (closeDistinct :
      ∀ (first : FirstApexShellRolePacket F R)
        (hdistinct : first.doubleRadius ≠ radius),
        CanonicalDistinctRadiusCard13AsymmetricClosers
          Q profile first hcard hdistinct) :
    False := by
  rcases nonempty_firstApexShellRolePacket F R with ⟨first⟩
  by_cases hsame : first.doubleRadius = radius
  · exact false_of_exactFive_card13_sameRadius
      Q profile first hcard hsame
  · exact false_of_exactFive_card13_distinctRadius_of_orbitClosers
      Q profile first hcard hsame
        (closeDistinct first hsame).toOrbitClosers

/-- Close the full exact-five second-cap profile conditional on exactly its
two remaining mathematical frontiers: the pair of card-thirteen asymmetric
source certificates and a uniform card-at-least-fourteen closer. -/
theorem false_of_exactFiveSecondCapProfile_of_card13_and_ge14_closers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (closeDistinct :
      ∀ (hcard : D.A.card = 13)
        (first : FirstApexShellRolePacket F R)
        (hdistinct : first.doubleRadius ≠ radius),
        CanonicalDistinctRadiusCard13AsymmetricClosers
          Q profile first hcard hdistinct)
    (closeGe14 : 14 ≤ D.A.card → False) :
    False := by
  rcases exactFiveSecondCap_card_eq_thirteen_or_ge_fourteen Q with
    hcard | hcard
  · exact false_of_exactFive_card13_of_asymmetricClosers
      Q profile hcard (closeDistinct hcard)
  · exact closeGe14 hcard

#print axioms false_of_exactFive_card13_of_asymmetricClosers
#print axioms false_of_exactFiveSecondCapProfile_of_card13_and_ge14_closers

end

end ATailExactFiveCard13CombinedDispatcherScratch
end Problem97

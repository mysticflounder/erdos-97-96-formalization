/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ExactFiveCard13DistinctRadiusDispatcher
import SelectedSemanticAssignment

/-!
# Typed dispatcher draft for the distinct reduced-union callbacks

This file deliberately assumes the eventual all-one, direct, and mirror
certificate callbacks as theorem parameters.  It proves only that the direct
and mirror callback signatures fit the checked distinct-radius dispatcher.
It contains no certificate claim and no placeholder axiom.
-/

namespace Problem97
namespace ATailExactFiveCard13DistinctRadiusSourceIngressCoordinatorScratch

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailExactFiveCard13DistinctRadiusDispatcherScratch
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

/-- The eventual direct and mirror reduced-union theorems have exactly the
arguments needed by the checked exact-card-thirteen distinct-radius
dispatcher. -/
theorem false_of_exactFive_card13_distinctRadius_of_reducedUnionCallbacks
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (first : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13)
    (hdistinct : first.doubleRadius ≠ radius)
    (closeAllOne :
      ∀ (_star : PhysicalGlobalCrossDeletionStar profile),
        AllPhysicalActualCriticalRowsOneHit H profile → False)
    (closeDirect :
      ∀ {M : PhysicalActualCriticalMutualOmissionPair H profile}
        {N : SourceTwoHitNormalForm Q profile M}
        {P : CanonicalAsymmetricRolePrepacket N}
        {star : PhysicalGlobalCrossDeletionStar profile}
        {T : CanonicalAsymmetricSemanticRowTable P star first}
        (_C : CanonicalCoverFamilies T),
        P.sourceIndex = (1 : Fin 13) ∧
          P.blockerIndex = (2 : Fin 13) ∧
          P.thirdIndex = (3 : Fin 13) → False)
    (closeMirror :
      ∀ {M : PhysicalActualCriticalMutualOmissionPair H profile}
        {N : SourceTwoHitNormalForm Q profile M}
        {P : CanonicalAsymmetricRolePrepacket N}
        {star : PhysicalGlobalCrossDeletionStar profile}
        {T : CanonicalAsymmetricSemanticRowTable P star first}
        (_C : CanonicalCoverFamilies T),
        P.sourceIndex = (3 : Fin 13) ∧
          P.blockerIndex = (2 : Fin 13) ∧
          P.thirdIndex = (1 : Fin 13) → False) :
    False := by
  apply false_of_exactFive_card13_distinctRadius_of_orbitClosers
    Q profile first hcard hdistinct
  exact {
    allOne := closeAllOne
    direct := closeDirect
    mirror := closeMirror
  }

#print axioms
  false_of_exactFive_card13_distinctRadius_of_reducedUnionCallbacks

end
end ATailExactFiveCard13DistinctRadiusSourceIngressCoordinatorScratch
end Problem97

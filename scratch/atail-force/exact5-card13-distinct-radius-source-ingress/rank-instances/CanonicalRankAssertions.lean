/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CanonicalCompleteClassAssertions
import CanonicalUniqueK4Assertions

/-!
# Canonical exact-five card-thirteen rank ingress

This module exposes the two generated rank-assertion families through one
small source-level packet.  Its arguments match the generic `P` and `C`
surface received by each canonical distinct-radius orbit closer.
-/

namespace Problem97
namespace ATailExactFiveCard13DistinctRadiusSourceIngressScratch

open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailExactFiveFirstApexCard13ParentRowCouplingScratch
open ATailExactFiveFirstApexCard13Scratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveGlobalCoverStarGeometry
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailKalmansonParentOrderScratch
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open CanonicalAsymmetricSemanticRowTable

noncomputable section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N)
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}

/-- All generated source-faithful rank assertions needed by either canonical
distinct-radius source orbit. -/
structure CanonicalRankAssertions (C : CanonicalCoverFamilies T) : Prop where
  completeClass : CanonicalCompleteClassAssertions P C
  uniqueK4 : CanonicalUniqueK4Assertions P C

/-- Instantiate the complete and unique-K4 source ingress from the exact
cardinality and distinct-radius hypotheses carried by the dispatcher. -/
theorem canonicalRankAssertions
    (C : CanonicalCoverFamilies T)
    (hcard : D.A.card = 13) (hdistinct : first.doubleRadius ≠ radius) :
    CanonicalRankAssertions P C :=
  {
    completeClass := canonicalCompleteClassAssertions P C hcard hdistinct
    uniqueK4 := canonicalUniqueK4Assertions P C hcard hdistinct
  }

#print axioms CanonicalRankAssertions
#print axioms canonicalRankAssertions

end
end ATailExactFiveCard13DistinctRadiusSourceIngressScratch
end Problem97

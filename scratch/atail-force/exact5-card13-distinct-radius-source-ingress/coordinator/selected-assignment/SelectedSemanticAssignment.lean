/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import SelectedSourceAssignment

/-! Semantic instantiation of the exact distinct-source variable assignment. -/

namespace Problem97
namespace ATailExactFiveCard13DistinctRadiusSourceIngressCoordinatorScratch

open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveGlobalCoverStarGeometry
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open CanonicalAsymmetricSemanticRowTable
open ExactFiveCard13DistinctRadiusSourceIngressScratch
open Std.Tactic.BVDecide

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Instantiate all 1,666 symbolic variables from the current geometric
packet.  The connectivity variables are the deterministic bounded closure
constructed from minimality; neither parent row is discarded. -/
def selectedSemanticAssignment
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
    (T : CanonicalAsymmetricSemanticRowTable P star first)
    (hmin : D.Minimal) (C : CanonicalCoverFamilies T) :
    BVExpr.Assignment :=
  selectedSourceAssignment
    (directSourceRows C)
    (directSourceBlockers T)
    (directSourceShell T)
    (directSourceQ T)
    (directSourceW T)
    (directSourceFirstRow T)
    (directSourceParentFirst P)
    (directSourceParentSecond P)
    (packCanonicalConnectivity
      (canonicalThreeFamilyReachabilityPacket hmin C))
    (directSourceRanks P)

end
end ATailExactFiveCard13DistinctRadiusSourceIngressCoordinatorScratch
end Problem97

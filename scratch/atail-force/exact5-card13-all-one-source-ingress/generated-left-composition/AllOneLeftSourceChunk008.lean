/-
Generated source-faithful composition for left certificate chunk 008.
-/
import AllOneLeftVerifiedBridgeChunk008
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 008

Source-faithful Boolean facts for one chunk of the verified certificate.
-/

namespace Problem97
namespace ATailExactFiveCard13AllOneSourceIngressScratch

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open CanonicalAllOneSourceOrbitIngress
open Problem97.ATailExactFiveCard13AllOneCertificate.Left

set_option maxHeartbeats 0
set_option maxRecDepth 1000000

noncomputable section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}

/-- The live left source facts satisfy certificate chunk 008. -/
theorem leftSourceChunk008_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk008Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk008_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h0512 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0513 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0514 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0515 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0516 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0517 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0518 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0519 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0520 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0521 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0522 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0523 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0524 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0525 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0526 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0527 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0528 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0529 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0530 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0531 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0532 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0533 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0534 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0535 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0536 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0537 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0538 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0539 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0540 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0541 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0542 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0543 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0544 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0545 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0546 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0547 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0548 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0549 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0550 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0551 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0552 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0553 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0554 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0555 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0556 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0557 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0558 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0559 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0560 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0561 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0562 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0563 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0564 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0565 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0566 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0567 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0568 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0569 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0570 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0571 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0572 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0573 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0574 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0575 (CanonicalAllOneSourceOrbitIngress.left C))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

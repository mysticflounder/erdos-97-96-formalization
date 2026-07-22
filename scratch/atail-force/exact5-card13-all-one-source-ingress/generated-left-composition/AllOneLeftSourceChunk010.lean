/-
Generated source-faithful composition for left certificate chunk 010.
-/
import AllOneLeftVerifiedBridgeChunk010
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 010

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

/-- The live left source facts satisfy certificate chunk 010. -/
theorem leftSourceChunk010_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk010Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk010_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h0640 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0641 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0642 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0643 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0644 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0645 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0646 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0647 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0648 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0649 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0650 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0651 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0652 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0653 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0654 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0655 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0656 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0657 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0658 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0659 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0660 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0661 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0662 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0663 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0664 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0665 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0666 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0667 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0668 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0669 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0670 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0671 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0672 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0673 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0674 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0675 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0676 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0677 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0678 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0679 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0680 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0681 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0682 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0683 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0684 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0685 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0686 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0687 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0688 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0689 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0690 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0691 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0692 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0693 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0694 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0695 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0696 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0697 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0698 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0699 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0700 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0701 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0702 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0703 (CanonicalAllOneSourceOrbitIngress.left C))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

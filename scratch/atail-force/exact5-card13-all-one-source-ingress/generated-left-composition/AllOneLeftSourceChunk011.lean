/-
Generated source-faithful composition for left certificate chunk 011.
-/
import AllOneLeftVerifiedBridgeChunk011
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 011

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

/-- The live left source facts satisfy certificate chunk 011. -/
theorem leftSourceChunk011_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk011Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk011_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h0704 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0705 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0706 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0707 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0708 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0709 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0710 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0711 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0712 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0713 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0714 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0715 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0716 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0717 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0718 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0719 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0720 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0721 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0722 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0723 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0724 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0725 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0726 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0727 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0728 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0729 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0730 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0731 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0732 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0733 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0734 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0735 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0736 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0737 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0738 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0739 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0740 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0741 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0742 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0743 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0744 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0745 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0746 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0747 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0748 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0749 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0750 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0751 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0752 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0753 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0754 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0755 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0756 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0757 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0758 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0759 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0760 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0761 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0762 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0763 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0764 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0765 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0766 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0767 (CanonicalAllOneSourceOrbitIngress.left C))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

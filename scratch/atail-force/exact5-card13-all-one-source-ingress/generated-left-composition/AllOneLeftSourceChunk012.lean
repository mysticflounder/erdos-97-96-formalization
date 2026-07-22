/-
Generated source-faithful composition for left certificate chunk 012.
-/
import AllOneLeftVerifiedBridgeChunk012
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 012

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

/-- The live left source facts satisfy certificate chunk 012. -/
theorem leftSourceChunk012_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk012Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk012_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h0768 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0769 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0770 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0771 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0772 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0773 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0774 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0775 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0776 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0777 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0778 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0779 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0780 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0781 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0782 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0783 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0784 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0785 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0786 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0787 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0788 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0789 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0790 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0791 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0792 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0793 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0794 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0795 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0796 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0797 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0798 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0799 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0800 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0801 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0802 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0803 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0804 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0805 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0806 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0807 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0808 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0809 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0810 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0811 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0812 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0813 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0814 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0815 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0816 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0817 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0818 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0819 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0820 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0821 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0822 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0823 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0824 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0825 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0826 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0827 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0828 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0829 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0830 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0831 (CanonicalAllOneSourceOrbitIngress.left C))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

/-
Generated source-faithful composition for left certificate chunk 013.
-/
import AllOneLeftVerifiedBridgeChunk013
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 013

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

/-- The live left source facts satisfy certificate chunk 013. -/
theorem leftSourceChunk013_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk013Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk013_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h0832 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0833 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0834 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0835 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0836 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0837 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0838 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0839 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0840 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0841 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0842 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0843 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0844 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0845 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0846 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0847 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0848 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0849 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0850 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0851 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0852 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0853 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0854 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0855 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0856 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0857 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0858 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0859 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0860 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0861 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0862 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0863 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0864 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0865 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0866 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0867 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0868 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0869 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0870 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0871 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0872 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0873 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0874 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0875 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0876 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0877 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0878 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0879 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0880 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0881 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0882 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0883 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0884 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0885 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0886 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0887 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0888 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0889 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0890 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0891 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0892 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0893 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0894 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0895 (CanonicalAllOneSourceOrbitIngress.left C))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

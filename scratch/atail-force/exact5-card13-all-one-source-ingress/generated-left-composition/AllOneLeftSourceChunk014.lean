/-
Generated source-faithful composition for left certificate chunk 014.
-/
import AllOneLeftVerifiedBridgeChunk014
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 014

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

/-- The live left source facts satisfy certificate chunk 014. -/
theorem leftSourceChunk014_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk014Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk014_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h0896 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0897 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0898 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0899 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0900 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0901 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0902 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0903 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0904 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0905 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0906 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0907 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0908 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0909 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0910 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0911 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0912 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0913 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0914 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0915 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0916 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0917 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0918 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0919 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0920 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0921 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0922 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0923 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0924 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0925 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0926 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0927 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0928 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0929 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0930 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0931 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0932 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0933 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0934 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0935 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0936 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0937 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0938 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0939 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0940 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0941 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0942 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0943 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0944 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0945 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0946 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0947 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0948 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0949 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0950 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0951 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0952 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0953 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0954 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0955 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0956 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0957 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0958 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0959 (CanonicalAllOneSourceOrbitIngress.left C))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

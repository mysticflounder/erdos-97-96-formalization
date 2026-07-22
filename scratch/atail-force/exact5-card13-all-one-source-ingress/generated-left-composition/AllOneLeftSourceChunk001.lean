/-
Generated source-faithful composition for left certificate chunk 001.
-/
import AllOneLeftVerifiedBridgeChunk001
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 001

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

/-- The live left source facts satisfy certificate chunk 001. -/
theorem leftSourceChunk001_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk001Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk001_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h0064 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0065 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0066 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0067 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0068 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0069 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0070 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0071 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0072 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0073 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0074 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0075 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0076 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0077 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0078 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0079 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0080 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0081 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0082 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0083 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0084 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0085 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0086 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0087 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0088 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0089 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0090 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0091 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0092 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0093 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0094 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0095 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0096 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0097 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0098 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0099 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0100 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0101 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0102 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0103 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0104 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0105 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0106 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0107 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0108 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0109 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0110 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0111 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0112 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0113 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0114 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0115 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0116 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0117 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0118 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0119 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0120 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0121 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0122 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0123 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0124 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0125 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0126 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0127 (CanonicalAllOneSourceOrbitIngress.left C))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

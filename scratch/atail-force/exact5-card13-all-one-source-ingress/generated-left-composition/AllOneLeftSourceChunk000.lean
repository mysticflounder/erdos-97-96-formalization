/-
Generated source-faithful composition for left certificate chunk 000.
-/
import AllOneLeftVerifiedBridgeChunk000
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 000

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

/-- The live left source facts satisfy certificate chunk 000. -/
theorem leftSourceChunk000_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk000Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk000_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h0000 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0001 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0002 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0003 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0004 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0005 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0006 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0007 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0008 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0009 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0010 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0011 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0012 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0013 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0014 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0015 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0016 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0017 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0018 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0019 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0020 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0021 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0022 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0023 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0024 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0025 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0026 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0027 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0028 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0029 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0030 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0031 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0032 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0033 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0034 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0035 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0036 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0037 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0038 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0039 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0040 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0041 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0042 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0043 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0044 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0045 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0046 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0047 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0048 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0049 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0050 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0051 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0052 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0053 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0054 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0055 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0056 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0057 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0058 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0059 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0060 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0061 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0062 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0063 (CanonicalAllOneSourceOrbitIngress.left C))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

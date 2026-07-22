/-
Generated source-faithful composition for left certificate chunk 086.
-/
import AllOneLeftVerifiedBridgeChunk086
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 086

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

/-- The live left source facts satisfy certificate chunk 086. -/
theorem leftSourceChunk086_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk086Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk086_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h5504)
    (middleSource_h5505)
    (middleSource_h5506)
    (middleSource_h5507)
    (middleSource_h5508)
    (middleSource_h5509)
    (middleSource_h5510)
    (middleSource_h5511)
    (middleSource_h5512)
    (middleSource_h5513)
    (middleSource_h5514)
    (middleSource_h5515)
    (middleSource_h5516)
    (middleSource_h5517)
    (middleSource_h5518)
    (middleSource_h5519)
    (middleSource_h5520)
    (middleSource_h5521)
    (middleSource_h5522)
    (middleSource_h5523)
    (middleSource_h5524)
    (middleSource_h5525)
    (middleSource_h5526)
    (middleSource_h5527)
    (middleSource_h5528)
    (middleSource_h5529)
    (middleSource_h5530)
    (middleSource_h5531)
    (middleSource_h5532)
    (middleSource_h5533)
    (middleSource_h5534)
    (middleSource_h5535)
    (middleSource_h5536)
    (middleSource_h5537)
    (middleSource_h5538)
    (middleSource_h5539)
    (middleSource_h5540)
    (middleSource_h5541)
    (middleSource_h5542)
    (middleSource_h5543)
    (middleSource_h5544)
    (middleSource_h5545)
    (middleSource_h5546)
    (middleSource_h5547)
    (middleSource_h5548)
    (middleSource_h5549)
    (middleSource_h5550)
    (middleSource_h5551)
    (middleSource_h5552)
    (middleSource_h5553)
    (middleSource_h5554)
    (middleSource_h5555)
    (middleSource_h5556)
    (middleSource_h5557)
    (middleSource_h5558)
    (middleSource_h5559)
    (middleSource_h5560)
    (middleSource_h5561)
    (middleSource_h5562)
    (middleSource_h5563)
    (middleSource_h5564)
    (middleSource_h5565)
    (middleSource_h5566)
    (middleSource_h5567)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

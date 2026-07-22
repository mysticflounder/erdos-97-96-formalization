/-
Generated source-faithful composition for left certificate chunk 084.
-/
import AllOneLeftVerifiedBridgeChunk084
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 084

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

/-- The live left source facts satisfy certificate chunk 084. -/
theorem leftSourceChunk084_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk084Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk084_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h5376)
    (middleSource_h5377)
    (middleSource_h5378)
    (middleSource_h5379)
    (middleSource_h5380)
    (middleSource_h5381)
    (middleSource_h5382)
    (middleSource_h5383)
    (middleSource_h5384)
    (middleSource_h5385)
    (middleSource_h5386)
    (middleSource_h5387)
    (middleSource_h5388)
    (middleSource_h5389)
    (middleSource_h5390)
    (middleSource_h5391)
    (middleSource_h5392)
    (middleSource_h5393)
    (middleSource_h5394)
    (middleSource_h5395)
    (middleSource_h5396)
    (middleSource_h5397)
    (middleSource_h5398)
    (middleSource_h5399)
    (middleSource_h5400)
    (middleSource_h5401)
    (middleSource_h5402)
    (middleSource_h5403)
    (middleSource_h5404)
    (middleSource_h5405)
    (middleSource_h5406)
    (middleSource_h5407)
    (middleSource_h5408)
    (middleSource_h5409)
    (middleSource_h5410)
    (middleSource_h5411)
    (middleSource_h5412)
    (middleSource_h5413)
    (middleSource_h5414)
    (middleSource_h5415)
    (middleSource_h5416)
    (middleSource_h5417)
    (middleSource_h5418)
    (middleSource_h5419)
    (middleSource_h5420)
    (middleSource_h5421)
    (middleSource_h5422)
    (middleSource_h5423)
    (middleSource_h5424)
    (middleSource_h5425)
    (middleSource_h5426)
    (middleSource_h5427)
    (middleSource_h5428)
    (middleSource_h5429)
    (middleSource_h5430)
    (middleSource_h5431)
    (middleSource_h5432)
    (middleSource_h5433)
    (middleSource_h5434)
    (middleSource_h5435)
    (middleSource_h5436)
    (middleSource_h5437)
    (middleSource_h5438)
    (middleSource_h5439)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

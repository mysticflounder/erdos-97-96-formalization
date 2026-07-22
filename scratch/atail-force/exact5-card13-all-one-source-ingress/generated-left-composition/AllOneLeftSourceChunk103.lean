/-
Generated source-faithful composition for left certificate chunk 103.
-/
import AllOneLeftVerifiedBridgeChunk103
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 103

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

/-- The live left source facts satisfy certificate chunk 103. -/
theorem leftSourceChunk103_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk103Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk103_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h6592)
    (middleSource_h6593)
    (middleSource_h6594)
    (middleSource_h6595)
    (middleSource_h6596)
    (middleSource_h6597)
    (middleSource_h6598)
    (middleSource_h6599)
    (middleSource_h6600)
    (middleSource_h6601)
    (middleSource_h6602)
    (middleSource_h6603)
    (middleSource_h6604)
    (middleSource_h6605)
    (middleSource_h6606)
    (middleSource_h6607)
    (middleSource_h6608)
    (middleSource_h6609)
    (middleSource_h6610)
    (middleSource_h6611)
    (middleSource_h6612)
    (middleSource_h6613)
    (middleSource_h6614)
    (middleSource_h6615)
    (middleSource_h6616)
    (middleSource_h6617)
    (middleSource_h6618)
    (middleSource_h6619)
    (middleSource_h6620)
    (middleSource_h6621)
    (middleSource_h6622)
    (middleSource_h6623)
    (middleSource_h6624)
    (middleSource_h6625)
    (middleSource_h6626)
    (middleSource_h6627)
    (middleSource_h6628)
    (middleSource_h6629)
    (middleSource_h6630)
    (middleSource_h6631)
    (middleSource_h6632)
    (middleSource_h6633)
    (middleSource_h6634)
    (middleSource_h6635)
    (middleSource_h6636)
    (middleSource_h6637)
    (middleSource_h6638)
    (middleSource_h6639)
    (middleSource_h6640)
    (middleSource_h6641)
    (middleSource_h6642)
    (middleSource_h6643)
    (middleSource_h6644)
    (middleSource_h6645)
    (middleSource_h6646)
    (middleSource_h6647)
    (middleSource_h6648)
    (middleSource_h6649)
    (middleSource_h6650)
    (middleSource_h6651)
    (middleSource_h6652)
    (middleSource_h6653)
    (middleSource_h6654)
    (middleSource_h6655)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

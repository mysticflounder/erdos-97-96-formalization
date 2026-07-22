/-
Generated source-faithful composition for left certificate chunk 072.
-/
import AllOneLeftVerifiedBridgeChunk072
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 072

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

/-- The live left source facts satisfy certificate chunk 072. -/
theorem leftSourceChunk072_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk072Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk072_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h4608)
    (middleSource_h4609)
    (middleSource_h4610)
    (middleSource_h4611)
    (middleSource_h4612)
    (middleSource_h4613)
    (middleSource_h4614)
    (middleSource_h4615)
    (middleSource_h4616)
    (middleSource_h4617)
    (middleSource_h4618)
    (middleSource_h4619)
    (middleSource_h4620)
    (middleSource_h4621)
    (middleSource_h4622)
    (middleSource_h4623)
    (middleSource_h4624)
    (middleSource_h4625)
    (middleSource_h4626)
    (middleSource_h4627)
    (middleSource_h4628)
    (middleSource_h4629)
    (middleSource_h4630)
    (middleSource_h4631)
    (middleSource_h4632)
    (middleSource_h4633)
    (middleSource_h4634)
    (middleSource_h4635)
    (middleSource_h4636)
    (middleSource_h4637)
    (middleSource_h4638)
    (middleSource_h4639)
    (middleSource_h4640)
    (middleSource_h4641)
    (middleSource_h4642)
    (middleSource_h4643)
    (middleSource_h4644)
    (middleSource_h4645)
    (middleSource_h4646)
    (middleSource_h4647)
    (middleSource_h4648)
    (middleSource_h4649)
    (middleSource_h4650)
    (middleSource_h4651)
    (middleSource_h4652)
    (middleSource_h4653)
    (middleSource_h4654)
    (middleSource_h4655)
    (middleSource_h4656)
    (middleSource_h4657)
    (middleSource_h4658)
    (middleSource_h4659)
    (middleSource_h4660)
    (middleSource_h4661)
    (middleSource_h4662)
    (middleSource_h4663)
    (middleSource_h4664)
    (middleSource_h4665)
    (middleSource_h4666)
    (middleSource_h4667)
    (middleSource_h4668)
    (middleSource_h4669)
    (middleSource_h4670)
    (middleSource_h4671)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

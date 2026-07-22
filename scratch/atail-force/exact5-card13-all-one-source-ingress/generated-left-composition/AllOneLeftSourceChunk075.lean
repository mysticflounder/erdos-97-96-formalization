/-
Generated source-faithful composition for left certificate chunk 075.
-/
import AllOneLeftVerifiedBridgeChunk075
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 075

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

/-- The live left source facts satisfy certificate chunk 075. -/
theorem leftSourceChunk075_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk075Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk075_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h4800)
    (middleSource_h4801)
    (middleSource_h4802)
    (middleSource_h4803)
    (middleSource_h4804)
    (middleSource_h4805)
    (middleSource_h4806)
    (middleSource_h4807)
    (middleSource_h4808)
    (middleSource_h4809)
    (middleSource_h4810)
    (middleSource_h4811)
    (middleSource_h4812)
    (middleSource_h4813)
    (middleSource_h4814)
    (middleSource_h4815)
    (middleSource_h4816)
    (middleSource_h4817)
    (middleSource_h4818)
    (middleSource_h4819)
    (middleSource_h4820)
    (middleSource_h4821)
    (middleSource_h4822)
    (middleSource_h4823)
    (middleSource_h4824)
    (middleSource_h4825)
    (middleSource_h4826)
    (middleSource_h4827)
    (middleSource_h4828)
    (middleSource_h4829)
    (middleSource_h4830)
    (middleSource_h4831)
    (middleSource_h4832)
    (middleSource_h4833)
    (middleSource_h4834)
    (middleSource_h4835)
    (middleSource_h4836)
    (middleSource_h4837)
    (middleSource_h4838)
    (middleSource_h4839)
    (middleSource_h4840)
    (middleSource_h4841)
    (middleSource_h4842)
    (middleSource_h4843)
    (middleSource_h4844)
    (middleSource_h4845)
    (middleSource_h4846)
    (middleSource_h4847)
    (middleSource_h4848)
    (middleSource_h4849)
    (middleSource_h4850)
    (middleSource_h4851)
    (middleSource_h4852)
    (middleSource_h4853)
    (middleSource_h4854)
    (middleSource_h4855)
    (middleSource_h4856)
    (middleSource_h4857)
    (middleSource_h4858)
    (middleSource_h4859)
    (middleSource_h4860)
    (middleSource_h4861)
    (middleSource_h4862)
    (middleSource_h4863)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

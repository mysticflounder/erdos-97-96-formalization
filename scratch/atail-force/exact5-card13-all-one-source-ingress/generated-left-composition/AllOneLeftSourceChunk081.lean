/-
Generated source-faithful composition for left certificate chunk 081.
-/
import AllOneLeftVerifiedBridgeChunk081
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 081

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

/-- The live left source facts satisfy certificate chunk 081. -/
theorem leftSourceChunk081_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk081Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk081_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h5184)
    (middleSource_h5185)
    (middleSource_h5186)
    (middleSource_h5187)
    (middleSource_h5188)
    (middleSource_h5189)
    (middleSource_h5190)
    (middleSource_h5191)
    (middleSource_h5192)
    (middleSource_h5193)
    (middleSource_h5194)
    (middleSource_h5195)
    (middleSource_h5196)
    (middleSource_h5197)
    (middleSource_h5198)
    (middleSource_h5199)
    (middleSource_h5200)
    (middleSource_h5201)
    (middleSource_h5202)
    (middleSource_h5203)
    (middleSource_h5204)
    (middleSource_h5205)
    (middleSource_h5206)
    (middleSource_h5207)
    (middleSource_h5208)
    (middleSource_h5209)
    (middleSource_h5210)
    (middleSource_h5211)
    (middleSource_h5212)
    (middleSource_h5213)
    (middleSource_h5214)
    (middleSource_h5215)
    (middleSource_h5216)
    (middleSource_h5217)
    (middleSource_h5218)
    (middleSource_h5219)
    (middleSource_h5220)
    (middleSource_h5221)
    (middleSource_h5222)
    (middleSource_h5223)
    (middleSource_h5224)
    (middleSource_h5225)
    (middleSource_h5226)
    (middleSource_h5227)
    (middleSource_h5228)
    (middleSource_h5229)
    (middleSource_h5230)
    (middleSource_h5231)
    (middleSource_h5232)
    (middleSource_h5233)
    (middleSource_h5234)
    (middleSource_h5235)
    (middleSource_h5236)
    (middleSource_h5237)
    (middleSource_h5238)
    (middleSource_h5239)
    (middleSource_h5240)
    (middleSource_h5241)
    (middleSource_h5242)
    (middleSource_h5243)
    (middleSource_h5244)
    (middleSource_h5245)
    (middleSource_h5246)
    (middleSource_h5247)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

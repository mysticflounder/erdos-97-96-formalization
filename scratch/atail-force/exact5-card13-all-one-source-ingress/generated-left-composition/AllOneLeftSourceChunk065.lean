/-
Generated source-faithful composition for left certificate chunk 065.
-/
import AllOneLeftVerifiedBridgeChunk065
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 065

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

/-- The live left source facts satisfy certificate chunk 065. -/
theorem leftSourceChunk065_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk065Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk065_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h4160)
    (middleSource_h4161)
    (middleSource_h4162)
    (middleSource_h4163)
    (middleSource_h4164)
    (middleSource_h4165)
    (middleSource_h4166)
    (middleSource_h4167)
    (middleSource_h4168)
    (middleSource_h4169)
    (middleSource_h4170)
    (middleSource_h4171)
    (middleSource_h4172)
    (middleSource_h4173)
    (middleSource_h4174)
    (middleSource_h4175)
    (middleSource_h4176)
    (middleSource_h4177)
    (middleSource_h4178)
    (middleSource_h4179)
    (middleSource_h4180)
    (middleSource_h4181)
    (middleSource_h4182)
    (middleSource_h4183)
    (middleSource_h4184)
    (middleSource_h4185)
    (middleSource_h4186)
    (middleSource_h4187)
    (middleSource_h4188)
    (middleSource_h4189)
    (middleSource_h4190)
    (middleSource_h4191)
    (middleSource_h4192)
    (middleSource_h4193)
    (middleSource_h4194)
    (middleSource_h4195)
    (middleSource_h4196)
    (middleSource_h4197)
    (middleSource_h4198)
    (middleSource_h4199)
    (middleSource_h4200)
    (middleSource_h4201)
    (middleSource_h4202)
    (middleSource_h4203)
    (middleSource_h4204)
    (middleSource_h4205)
    (middleSource_h4206)
    (middleSource_h4207)
    (middleSource_h4208)
    (middleSource_h4209)
    (middleSource_h4210)
    (middleSource_h4211)
    (middleSource_h4212)
    (middleSource_h4213)
    (middleSource_h4214)
    (middleSource_h4215)
    (middleSource_h4216)
    (middleSource_h4217)
    (middleSource_h4218)
    (middleSource_h4219)
    (middleSource_h4220)
    (middleSource_h4221)
    (middleSource_h4222)
    (middleSource_h4223)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

/-
Generated source-faithful composition for left certificate chunk 063.
-/
import AllOneLeftVerifiedBridgeChunk063
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 063

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

/-- The live left source facts satisfy certificate chunk 063. -/
theorem leftSourceChunk063_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk063Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk063_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h4032)
    (middleSource_h4033)
    (middleSource_h4034)
    (middleSource_h4035)
    (middleSource_h4036)
    (middleSource_h4037)
    (middleSource_h4038)
    (middleSource_h4039)
    (middleSource_h4040)
    (middleSource_h4041)
    (middleSource_h4042)
    (middleSource_h4043)
    (middleSource_h4044)
    (middleSource_h4045)
    (middleSource_h4046)
    (middleSource_h4047)
    (middleSource_h4048)
    (middleSource_h4049)
    (middleSource_h4050)
    (middleSource_h4051)
    (middleSource_h4052)
    (middleSource_h4053)
    (middleSource_h4054)
    (middleSource_h4055)
    (middleSource_h4056)
    (middleSource_h4057)
    (middleSource_h4058)
    (middleSource_h4059)
    (middleSource_h4060)
    (middleSource_h4061)
    (middleSource_h4062)
    (middleSource_h4063)
    (middleSource_h4064)
    (middleSource_h4065)
    (middleSource_h4066)
    (middleSource_h4067)
    (middleSource_h4068)
    (middleSource_h4069)
    (middleSource_h4070)
    (middleSource_h4071)
    (middleSource_h4072)
    (middleSource_h4073)
    (middleSource_h4074)
    (middleSource_h4075)
    (middleSource_h4076)
    (middleSource_h4077)
    (middleSource_h4078)
    (middleSource_h4079)
    (middleSource_h4080)
    (middleSource_h4081)
    (middleSource_h4082)
    (middleSource_h4083)
    (middleSource_h4084)
    (middleSource_h4085)
    (middleSource_h4086)
    (middleSource_h4087)
    (middleSource_h4088)
    (middleSource_h4089)
    (middleSource_h4090)
    (middleSource_h4091)
    (middleSource_h4092)
    (middleSource_h4093)
    (middleSource_h4094)
    (middleSource_h4095)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

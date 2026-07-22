/-
Generated source-faithful composition for left certificate chunk 061.
-/
import AllOneLeftVerifiedBridgeChunk061
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 061

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

/-- The live left source facts satisfy certificate chunk 061. -/
theorem leftSourceChunk061_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk061Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk061_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h3904)
    (middleSource_h3905)
    (middleSource_h3906)
    (middleSource_h3907)
    (middleSource_h3908)
    (middleSource_h3909)
    (middleSource_h3910)
    (middleSource_h3911)
    (middleSource_h3912)
    (middleSource_h3913)
    (middleSource_h3914)
    (middleSource_h3915)
    (middleSource_h3916)
    (middleSource_h3917)
    (middleSource_h3918)
    (middleSource_h3919)
    (middleSource_h3920)
    (middleSource_h3921)
    (middleSource_h3922)
    (middleSource_h3923)
    (middleSource_h3924)
    (middleSource_h3925)
    (middleSource_h3926)
    (middleSource_h3927)
    (middleSource_h3928)
    (middleSource_h3929)
    (middleSource_h3930)
    (middleSource_h3931)
    (middleSource_h3932)
    (middleSource_h3933)
    (middleSource_h3934)
    (middleSource_h3935)
    (middleSource_h3936)
    (middleSource_h3937)
    (middleSource_h3938)
    (middleSource_h3939)
    (middleSource_h3940)
    (middleSource_h3941)
    (middleSource_h3942)
    (middleSource_h3943)
    (middleSource_h3944)
    (middleSource_h3945)
    (middleSource_h3946)
    (middleSource_h3947)
    (middleSource_h3948)
    (middleSource_h3949)
    (middleSource_h3950)
    (middleSource_h3951)
    (middleSource_h3952)
    (middleSource_h3953)
    (middleSource_h3954)
    (middleSource_h3955)
    (middleSource_h3956)
    (middleSource_h3957)
    (middleSource_h3958)
    (middleSource_h3959)
    (middleSource_h3960)
    (middleSource_h3961)
    (middleSource_h3962)
    (middleSource_h3963)
    (middleSource_h3964)
    (middleSource_h3965)
    (middleSource_h3966)
    (middleSource_h3967)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

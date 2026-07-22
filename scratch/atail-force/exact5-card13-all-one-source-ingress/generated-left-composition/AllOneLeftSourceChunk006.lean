/-
Generated source-faithful composition for left certificate chunk 006.
-/
import AllOneLeftVerifiedBridgeChunk006
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 006

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

/-- The live left source facts satisfy certificate chunk 006. -/
theorem leftSourceChunk006_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk006Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk006_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h0384 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0385 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0386 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0387 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0388 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0389 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0390 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0391 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0392 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0393 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0394 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0395 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0396 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0397 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0398 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0399 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0400 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0401 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0402 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0403 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0404 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0405 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0406 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0407 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0408 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0409 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0410 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0411 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0412 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0413 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0414 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0415 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0416 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0417 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0418 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0419 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0420 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0421 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0422 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0423 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0424 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0425 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0426 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0427 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0428 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0429 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0430 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0431 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0432 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0433 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0434 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0435 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0436 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0437 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0438 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0439 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0440 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0441 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0442 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0443 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0444 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0445 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0446 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0447 (CanonicalAllOneSourceOrbitIngress.left C))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

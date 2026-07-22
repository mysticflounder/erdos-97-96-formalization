/-
Generated source-faithful composition for left certificate chunk 005.
-/
import AllOneLeftVerifiedBridgeChunk005
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 005

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

/-- The live left source facts satisfy certificate chunk 005. -/
theorem leftSourceChunk005_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk005Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk005_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h0320 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0321 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0322 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0323 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0324 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0325 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0326 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0327 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0328 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0329 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0330 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0331 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0332 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0333 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0334 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0335 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0336 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0337 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0338 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0339 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0340 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0341 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0342 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0343 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0344 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0345 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0346 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0347 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0348 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0349 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0350 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0351 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0352 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0353 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0354 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0355 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0356 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0357 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0358 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0359 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0360 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0361 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0362 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0363 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0364 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0365 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0366 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0367 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0368 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0369 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0370 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0371 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0372 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0373 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0374 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0375 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0376 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0377 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0378 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0379 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0380 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0381 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0382 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0383 (CanonicalAllOneSourceOrbitIngress.left C))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

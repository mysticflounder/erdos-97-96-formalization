/-
Generated source-faithful composition for left certificate chunk 004.
-/
import AllOneLeftVerifiedBridgeChunk004
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 004

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

/-- The live left source facts satisfy certificate chunk 004. -/
theorem leftSourceChunk004_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk004Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk004_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h0256 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0257 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0258 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0259 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0260 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0261 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0262 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0263 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0264 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0265 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0266 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0267 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0268 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0269 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0270 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0271 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0272 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0273 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0274 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0275 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0276 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0277 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0278 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0279 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0280 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0281 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0282 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0283 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0284 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0285 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0286 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0287 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0288 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0289 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0290 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0291 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0292 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0293 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0294 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0295 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0296 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0297 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0298 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0299 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0300 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0301 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0302 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0303 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0304 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0305 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0306 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0307 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0308 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0309 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0310 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0311 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0312 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0313 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0314 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0315 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0316 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0317 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0318 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0319 (CanonicalAllOneSourceOrbitIngress.left C))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

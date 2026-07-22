/-
Generated source-faithful composition for left certificate chunk 003.
-/
import AllOneLeftVerifiedBridgeChunk003
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 003

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

/-- The live left source facts satisfy certificate chunk 003. -/
theorem leftSourceChunk003_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk003Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk003_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h0192 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0193 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0194 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0195 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0196 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0197 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0198 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0199 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0200 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0201 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0202 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0203 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0204 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0205 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0206 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0207 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0208 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0209 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0210 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0211 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0212 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0213 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0214 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0215 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0216 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0217 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0218 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0219 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0220 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0221 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0222 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0223 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0224 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0225 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0226 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0227 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0228 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0229 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0230 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0231 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0232 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0233 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0234 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0235 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0236 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0237 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0238 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0239 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0240 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0241 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0242 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0243 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0244 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0245 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0246 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0247 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0248 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0249 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0250 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0251 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0252 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0253 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0254 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0255 (CanonicalAllOneSourceOrbitIngress.left C))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

/-
Generated source-faithful composition for left certificate chunk 110.
-/
import AllOneLeftVerifiedBridgeChunk110
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 110

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

/-- The live left source facts satisfy certificate chunk 110. -/
theorem leftSourceChunk110_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk110Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk110_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h7040)
    (middleSource_h7041)
    (middleSource_h7042)
    (middleSource_h7043)
    (middleSource_h7044)
    (middleSource_h7045)
    (middleSource_h7046)
    (middleSource_h7047)
    (middleSource_h7048)
    (middleSource_h7049)
    (middleSource_h7050)
    (middleSource_h7051)
    (middleSource_h7052)
    (middleSource_h7053)
    (middleSource_h7054)
    (middleSource_h7055)
    (middleSource_h7056)
    (middleSource_h7057)
    (middleSource_h7058)
    (middleSource_h7059)
    (middleSource_h7060)
    (middleSource_h7061)
    (middleSource_h7062)
    (middleSource_h7063)
    (middleSource_h7064)
    (middleSource_h7065)
    (middleSource_h7066)
    (middleSource_h7067)
    (middleSource_h7068)
    (middleSource_h7069)
    (middleSource_h7070)
    (middleSource_h7071)
    (middleSource_h7072)
    (middleSource_h7073)
    (middleSource_h7074)
    (middleSource_h7075)
    (middleSource_h7076)
    (middleSource_h7077)
    (middleSource_h7078)
    (middleSource_h7079)
    (middleSource_h7080)
    (middleSource_h7081)
    (middleSource_h7082)
    (middleSource_h7083)
    (middleSource_h7084)
    (middleSource_h7085)
    (middleSource_h7086)
    (middleSource_h7087)
    (middleSource_h7088)
    (middleSource_h7089)
    (middleSource_h7090)
    (middleSource_h7091)
    (middleSource_h7092)
    (middleSource_h7093)
    (middleSource_h7094)
    (middleSource_h7095)
    (middleSource_h7096)
    (middleSource_h7097)
    (middleSource_h7098)
    (middleSource_h7099)
    (middleSource_h7100)
    (middleSource_h7101)
    (middleSource_h7102)
    (middleSource_h7103)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

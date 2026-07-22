/-
Generated source-faithful composition for left certificate chunk 111.
-/
import AllOneLeftVerifiedBridgeChunk111
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 111

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

/-- The live left source facts satisfy certificate chunk 111. -/
theorem leftSourceChunk111_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk111Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk111_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h7104)
    (middleSource_h7105)
    (middleSource_h7106)
    (middleSource_h7107)
    (middleSource_h7108)
    (middleSource_h7109)
    (middleSource_h7110)
    (middleSource_h7111)
    (middleSource_h7112)
    (middleSource_h7113)
    (middleSource_h7114)
    (middleSource_h7115)
    (middleSource_h7116)
    (middleSource_h7117)
    (middleSource_h7118)
    (middleSource_h7119)
    (middleSource_h7120)
    (middleSource_h7121)
    (middleSource_h7122)
    (middleSource_h7123)
    (middleSource_h7124)
    (middleSource_h7125)
    (middleSource_h7126)
    (middleSource_h7127)
    (middleSource_h7128)
    (middleSource_h7129)
    (middleSource_h7130)
    (middleSource_h7131)
    (middleSource_h7132)
    (middleSource_h7133)
    (middleSource_h7134)
    (middleSource_h7135)
    (middleSource_h7136)
    (middleSource_h7137)
    (middleSource_h7138)
    (middleSource_h7139)
    (middleSource_h7140)
    (middleSource_h7141)
    (middleSource_h7142)
    (middleSource_h7143)
    (middleSource_h7144)
    (middleSource_h7145)
    (middleSource_h7146)
    (middleSource_h7147)
    (middleSource_h7148)
    (middleSource_h7149)
    (middleSource_h7150)
    (middleSource_h7151)
    (middleSource_h7152)
    (middleSource_h7153)
    (middleSource_h7154)
    (middleSource_h7155)
    (middleSource_h7156)
    (middleSource_h7157)
    (middleSource_h7158)
    (middleSource_h7159)
    (middleSource_h7160)
    (middleSource_h7161)
    (middleSource_h7162)
    (middleSource_h7163)
    (middleSource_h7164)
    (middleSource_h7165)
    (middleSource_h7166)
    (middleSource_h7167)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

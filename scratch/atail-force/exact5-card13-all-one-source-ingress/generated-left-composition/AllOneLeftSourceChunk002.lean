/-
Generated source-faithful composition for left certificate chunk 002.
-/
import AllOneLeftVerifiedBridgeChunk002
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 002

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

/-- The live left source facts satisfy certificate chunk 002. -/
theorem leftSourceChunk002_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk002Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk002_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h0128 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0129 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0130 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0131 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0132 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0133 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0134 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0135 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0136 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0137 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0138 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0139 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0140 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0141 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0142 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0143 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0144 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0145 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0146 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0147 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0148 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0149 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0150 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0151 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0152 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0153 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0154 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0155 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0156 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0157 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0158 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0159 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0160 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0161 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0162 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0163 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0164 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0165 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0166 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0167 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0168 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0169 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0170 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0171 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0172 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0173 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0174 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0175 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0176 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0177 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0178 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0179 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0180 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0181 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0182 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0183 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0184 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0185 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0186 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0187 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0188 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0189 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0190 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h0191 (CanonicalAllOneSourceOrbitIngress.left C))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

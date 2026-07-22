/-
Generated source-faithful composition for left certificate chunk 016.
-/
import AllOneLeftVerifiedBridgeChunk016
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 016

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

/-- The live left source facts satisfy certificate chunk 016. -/
theorem leftSourceChunk016_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk016Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk016_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h1024 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1025 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1026 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1027 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1028 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1029 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1030 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1031 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1032 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1033 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1034 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1035 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1036 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1037 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1038 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1039 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1040 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1041 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1042 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1043 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1044 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1045 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1046 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1047 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1048 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1049 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1050 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1051 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1052 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1053 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1054 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1055 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1056 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1057 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1058 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1059 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1060 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1061 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1062 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1063 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1064 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1065 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1066 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1067 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1068 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1069 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1070 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1071 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1072 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1073 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1074 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1075 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1076 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1077 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1078 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1079 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1080 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1081 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1082 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1083 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1084 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1085 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1086 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1087 (CanonicalAllOneSourceOrbitIngress.left C))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97

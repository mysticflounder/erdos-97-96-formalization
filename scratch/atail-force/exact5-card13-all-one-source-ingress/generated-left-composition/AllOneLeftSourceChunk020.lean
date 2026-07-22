/-
Generated source-faithful composition for left certificate chunk 020.
-/
import AllOneLeftVerifiedBridgeChunk020
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 020

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

/-- The live left source facts satisfy certificate chunk 020. -/
theorem leftSourceChunk020_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk020Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk020_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h1280 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1281 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1282 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1283 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1284 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1285 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1286 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1287 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1288 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1289 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1290 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1291 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1292 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1293 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1294 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1295 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1296 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1297 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1298 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1299 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1300 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1301 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1302 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1303 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1304 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1305 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1306 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1307 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1308 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1309 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1310 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1311 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1312 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1313 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1314 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1315 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1316 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1317 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1318 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1319 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1320 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1321 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1322 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1323 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1324 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1325 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1326 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1327 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1328 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1329 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1330 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1331 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1332 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1333 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1334 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1335 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1336 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1337 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1338 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1339 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1340 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1341 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1342 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1343 (CanonicalAllOneSourceOrbitIngress.left C))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
